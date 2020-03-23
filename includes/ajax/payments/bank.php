<?php
/**
 * ajax -> payments -> bank
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

// check if bank transfers enabled
if(!$system['bank_transfers_enabled']) {
	modal("MESSAGE", __("Error"), __("This feature has been disabled by the admin"));
}

try {

	switch ($_POST['handle']) {
		case 'packages':
			// valid inputs
			if(!isset($_POST['bank_receipt']) || is_empty($_POST['bank_receipt'])) {
				throw new Exception(__("Please attach your bank receipt"));
			}
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

			// process
			$db->query(sprintf("INSERT INTO bank_transfers (user_id, handle, package_id, bank_receipt, time) VALUES (%s, 'packages', %s, %s, %s)", secure($user->_data['user_id'], 'int'), secure($_POST['package_id'], 'int'), secure($_POST['bank_receipt']), secure($date) )) or _error("SQL_ERROR_THROWEN");

			// send notification to admins
			$user->notify_system_admins("bank_transfer");

			// return
			modal("SUCCESS", __("Thanks"), __("Your request has been successfully sent, we will notify you once it's approved"));
			break;

		case 'wallet':
			// valid inputs
			if(!isset($_POST['bank_receipt']) || is_empty($_POST['bank_receipt'])) {
				throw new Exception(__("Please attach your bank receipt"));
			}
			if(!isset($_POST['price']) || !is_numeric($_POST['price'])) {
				_error(400);
			}

			// process
			$db->query(sprintf("INSERT INTO bank_transfers (user_id, handle, price, bank_receipt, time) VALUES (%s, 'wallet', %s, %s, %s)", secure($user->_data['user_id'], 'int'), secure($_POST['price']), secure($_POST['bank_receipt']), secure($date) )) or _error("SQL_ERROR_THROWEN");

			// send notification to admins
			$user->notify_system_admins("bank_transfer");

			// return
			modal("SUCCESS", __("Thanks"), __("Your request has been successfully sent, we will notify you once it's approved"));
			break;
		
		default:
			_error(400);
			break;
	}
	
} catch (Exception $e) {
	return_json( array('error' => true, 'message' => $e->getMessage()) );
}

?>