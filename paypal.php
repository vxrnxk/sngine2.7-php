<?php
/**
 * paypal
 * 
 * @package Sngine
 * @author Zamblek
 */

// fetch bootloader
require('bootloader.php');

// user access (simple)
if(!$user->_logged_in) {
	user_login();
}

try {
	if($_GET['status'] == 'success') {
		switch ($_GET['handle']) {
			case 'packages':
				// valid inputs
				if(!isset($_GET['package_id']) || !is_numeric($_GET['package_id'])) {
					_error(404);
				}
				if(!isset($_GET['paymentId']) || !isset($_GET['PayerID'])) {
					_error(404);
				}

				// check package
				$package = $user->get_package($_GET['package_id']);
				if(!$package) {
					_error(404);
				}

				// check payment
				$payment  = paypal_check($_GET['paymentId'], $_GET['PayerID']);
				if($payment) {
					/* update user package */
					$user->update_user_package($package['package_id'], $package['name'], $package['price'], $package['verification_badge_enabled']);
				}
				break;

			case 'wallet':
				// check payment
				$payment  = paypal_check($_GET['paymentId'], $_GET['PayerID']);
				if($payment) {
					/* update user wallet balance */
					$db->query(sprintf("UPDATE users SET user_wallet_balance = user_wallet_balance + %s WHERE user_id = %s", secure($_SESSION['wallet_replenish_amount']), secure($user->_data['user_id'], 'int'))) or _error("SQL_ERROR_THROWEN");
					/* wallet transaction */
        			$user->wallet_set_transaction($user->_data['user_id'], 'recharge', 0, $_SESSION['wallet_replenish_amount'], 'in');
					/* redirect*/
					redirect('/wallet?replenish_succeed');
				}
				break;
		}
	}
	redirect();

} catch (Exception $e) {
	_error('System Message', $e->getMessage());
}

?>