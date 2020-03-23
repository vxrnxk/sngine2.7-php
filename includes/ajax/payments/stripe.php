<?php
/**
 * ajax -> payments -> stripe
 * 
 * @package Sngine
 * @author Zamblek
 */

// fetch bootstrap
require('../../../bootstrap.php');

// check AJAX Request
is_ajax();

// user access
user_access(true);

// check if Stripe enabled
if(!$system['creditcard_enabled'] && !$system['alipay_enabled']) {
	modal("MESSAGE", __("Error"), __("This feature has been disabled by the admin"));
}

try {

	switch ($_POST['handle']) {
		case 'packages':
			// valid inputs
			if(!isset($_POST['package_id']) || !is_numeric($_POST['package_id'])) {
				_error(400);
			}
			if(!isset($_POST['token'])) {
				_error(400);
			}

			// check package
			$package = $user->get_package($_POST['package_id']);
			if(!$package) {
				_error(400);
			}
			/* check if user already subscribed to this package */
			if($user->_data['user_subscribed'] && $user->_data['user_package'] == $package['package_id']) {
				modal("SUCCESS", __("Subscribed"), __("You already subscribed to this package, Please select different package"));
			}

			// process
			require_once(ABSPATH.'includes/libs/Stripe/init.php');
			$secret_key = ($system['stripe_mode'] == "live")? $system['stripe_live_secret'] : $system['stripe_test_secret'];
			\Stripe\Stripe::setApiKey($secret_key);
			$customer = \Stripe\Customer::create(array(
		        'source' => $_POST['token']
		    ));
		    $charge   = \Stripe\Charge::create(array(
		        'customer' => $customer->id,
		        'receipt_email' => $_POST['email'],
		        'amount' => $package['price']*100,
		        'currency' => $system['system_currency']
		    ));
		    if($charge) {
		    	// update user package
				$user->update_user_package($package['package_id'], $package['name'], $package['price'], $package['verification_badge_enabled']);
		    }

			// return
			return_json( array('callback' => 'window.location.href = "'.$system['system_url'].'";') );
			break;

		case 'wallet':
			// valid inputs
			if(!isset($_POST['price']) || !is_numeric($_POST['price'])) {
				_error(400);
			}
			if(!isset($_POST['token'])) {
				_error(400);
			}

			// process
			require_once(ABSPATH.'includes/libs/Stripe/init.php');
			$secret_key = ($system['stripe_mode'] == "live")? $system['stripe_live_secret'] : $system['stripe_test_secret'];
			\Stripe\Stripe::setApiKey($secret_key);
			$customer = \Stripe\Customer::create(array(
		        'source' => $_POST['token']
		    ));
		    $charge   = \Stripe\Charge::create(array(
		        'customer' => $customer->id,
		        'receipt_email' => $_POST['email'],
		        'amount' => $_POST['price']*100,
		        'currency' => $system['system_currency']
		    ));
		    if($charge) {
		    	// update user wallet balance
				$_SESSION['wallet_replenish_amount'] = $_POST['price'];
				$db->query(sprintf("UPDATE users SET user_wallet_balance = user_wallet_balance + %s WHERE user_id = %s", secure($_SESSION['wallet_replenish_amount']), secure($user->_data['user_id'], 'int'))) or _error("SQL_ERROR_THROWEN");
				/* wallet transaction */
        		$user->wallet_set_transaction($user->_data['user_id'], 'recharge', 0, $_SESSION['wallet_replenish_amount'], 'in');
		    }

			// return
			return_json( array('callback' => 'window.location.href = "'.$system['system_url'].'/wallet?replenish_succeed";') );
			break;
		
		default:
			_error(400);
			break;
	}

} catch (Exception $e) {
	modal("ERROR", __("Error"), $e->getMessage());
}

?>