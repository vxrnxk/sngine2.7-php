<?php
/**
 * ajax -> payments -> coinpayments webhook
 * 
 * @package Sngine
 * @author Zamblek
 */

// fetch bootstrap
require('../../../bootstrap.php');

try {

	// handle the transaction
	$transaction = $user->get_coinpayments_transaction($_POST['custom'], $_POST['txn_id']);
	if($transaction) {
		switch ($_GET['handle']) {
			case 'packages':
				// valid inputs
				if(!isset($_GET['package_id']) || !is_numeric($_GET['package_id'])) {
					$user->update_coinpayments_transaction($transaction['transaction_id'], "Error (400): Bad Reuqeust [package_id is not set]", '-1');
				}

				// check package
				$package = $user->get_package($_GET['package_id']);
				if(!$package) {
					$user->update_coinpayments_transaction($transaction['transaction_id'], "Error (400): Bad Reuqeust [Package is invalid or not exist]", '-1');
				}

				// check payment
				$payment = $user->check_coinpayments_payment($transaction['transaction_id']);
				if($payment) {
					/* update user package */
					$user->update_user_package($package['package_id'], $package['name'], $package['price'], $package['verification_badge_enabled'], $transaction['user_id']);
					/* update coinpayments transaction */
					$user->update_coinpayments_transaction($transaction['transaction_id'], __("Transaction complete successfully"), '2');
					/* notify the user */
					$user->post_notification( array('to_user_id'=>$transaction['user_id'], 'from_user_id'=>'1', 'action'=>'coinpayments_complete') );
				}
				break;

			case 'wallet':
				// check payment
				$payment = $user->check_coinpayments_payment($transaction['transaction_id']);
				if($payment) {
					/* update user wallet balance */
					$db->query(sprintf("UPDATE users SET user_wallet_balance = user_wallet_balance + %s WHERE user_id = %s", secure($transaction['amount']), secure($transaction['user_id'], 'int'))) or _error("SQL_ERROR_THROWEN");
					/* wallet transaction */
	    			$user->wallet_set_transaction($transaction['user_id'], 'recharge', 0, $transaction['amount'], 'in');
	    			/* update coinpayments transaction */
					$user->update_coinpayments_transaction($transaction['transaction_id'], __("Transaction complete successfully"), '2');
					/* notify the user */
					$user->post_notification( array('to_user_id'=>$transaction['user_id'], 'from_user_id'=>'1', 'action'=>'coinpayments_complete') );
				}
				break;
		}
	}

} catch (Exception $e) {
	/* do nothing */
}

?>