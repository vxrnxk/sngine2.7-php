<?php
/**
 * ajax -> payments -> 2checkout
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

// check if 2Checkout enabled
if(!$system['2checkout_enabled']) {
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
			require_once(ABSPATH.'includes/libs/Twocheckout/Twocheckout.php');
			Twocheckout::privateKey($system['2checkout_private_key']);
	        Twocheckout::sellerId($system['2checkout_merchant_code']);
	        if ($system['2checkout_mode'] == 'sandbox') {
	            Twocheckout::sandbox(true);
	            Twocheckout::verifySSL(false);
	        } else {
	            Twocheckout::sandbox(false);
	        }
	        $charge  = Twocheckout_Charge::auth(array(
                "merchantOrderId" => "123",
                "token" => $_POST['token'],
                "currency" => $system['system_currency'],
                "total" => $package['price'],
                "billingAddr" => array(
                    "name" => $_POST['billing_name'],
                    "addrLine1" => $_POST['billing_address'],
                    "city" => $_POST['billing_city'],
                    "state" => $_POST['billing_state'],
                    "zipCode" => $_POST['billing_zip_code'],
                    "country" => $_POST['billing_country'],
                    "email" => $_POST['billing_email'],
                    "phoneNumber" => $_POST['billing_phone']
                )
            ));
            if ($charge['response']['responseCode'] == 'APPROVED') {
            	// update user package
				$user->update_user_package($package['package_id'], $package['name'], $package['price'], $package['verification_badge_enabled']);
            } else {
            	return_json( array('error' => true, 'message' => __("Payment Declined: Please verify your information and try again, or try another payment method")) );
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
			require_once(ABSPATH.'includes/libs/Twocheckout/Twocheckout.php');
			Twocheckout::privateKey($system['2checkout_private_key']);
	        Twocheckout::sellerId($system['2checkout_merchant_code']);
	        if ($system['2checkout_mode'] == 'sandbox') {
	            Twocheckout::sandbox(true);
	        	Twocheckout::verifySSL(false);
	        } else {
	            Twocheckout::sandbox(false);
	        }
	        $charge  = Twocheckout_Charge::auth(array(
                "merchantOrderId" => "123",
                "token" => $_POST['token'],
                "currency" => $system['system_currency'],
                "total" => $_POST['price'],
                "billingAddr" => array(
                    "name" => $_POST['billing_name'],
                    "addrLine1" => $_POST['billing_address'],
                    "city" => $_POST['billing_city'],
                    "state" => $_POST['billing_state'],
                    "zipCode" => $_POST['billing_zip_code'],
                    "country" => $_POST['billing_country'],
                    "email" => $_POST['billing_email'],
                    "phoneNumber" => $_POST['billing_phone']
                )
            ));
            if ($charge['response']['responseCode'] == 'APPROVED') {
            	// update user wallet balance
				$_SESSION['wallet_replenish_amount'] = $_POST['price'];
				$db->query(sprintf("UPDATE users SET user_wallet_balance = user_wallet_balance + %s WHERE user_id = %s", secure($_SESSION['wallet_replenish_amount']), secure($user->_data['user_id'], 'int'))) or _error("SQL_ERROR_THROWEN");
				/* wallet transaction */
        		$user->wallet_set_transaction($user->_data['user_id'], 'recharge', 0, $_SESSION['wallet_replenish_amount'], 'in');
            } else {
            	return_json( array('error' => true, 'message' => __("Payment Declined: Please verify your information and try again, or try another payment method")) );
            }

			// return
			return_json( array('callback' => 'window.location.href = "'.$system['system_url'].'/wallet?replenish_succeed";') );
			break;
		
		default:
			_error(400);
			break;
	}

} catch (Exception $e) {
	return_json( array('error' => true, 'message' => $e->getMessage()) );
}

?>