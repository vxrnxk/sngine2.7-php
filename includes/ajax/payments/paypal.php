<?php
/**
 * ajax -> payments -> paypal
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

// check if PayPal enabled
if(!$system['paypal_enabled']) {
	modal("MESSAGE", __("Error"), __("This feature has been disabled by the admin"));
}

try {

	switch ($_POST['handle']) {
		case 'packages':
			// valid inputs
			if(!isset($_POST['package_id']) || !is_numeric($_POST['package_id'])) {
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

			// get paypal link
			$link = paypal("packages", $package['price'], $package['package_id']);
			break;

		case 'wallet':
			// valid inputs
			if(!isset($_POST['price']) || !is_numeric($_POST['price'])) {
				_error(400);
			}

			// get paypal link
			$link = paypal("wallet", $_POST['price']);
			break;
		
		default:
			_error(400);
			break;
	}

	// return & exit
	return_json( array('callback' => 'window.location.href = "'.$link.'";') );

} catch (Exception $e) {
	modal("ERROR", __("Error"), $e->getMessage());
}

?>