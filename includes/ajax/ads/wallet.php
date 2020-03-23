<?php
/**
 * ajax -> ads -> wallet
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

try {

	switch ($_REQUEST['do']) {
		case 'wallet_transfer':
			// process
			$user->wallet_transfer($_POST['send_to_id'], $_POST['amount']);
			
			// return
			return_json( array('callback' => 'window.location = site_path + "/wallet?transfer_succeed"') );
			break;

		case 'wallet_replenish':
			// valid inputs
			if(!isset($_POST['amount']) || !is_numeric($_POST['amount'])) {
				throw new Exception("Enter valid amount of money for example '50'");
			}
			
			// return
			modal("#payment", "{'handle': 'wallet', 'price': '".$_POST['amount']."'}");
			break;

		case 'wallet_withdraw_affiliates':
			// process
			$user->wallet_withdraw_affiliates($_POST['amount']);
			
			// return
			return_json( array('callback' => 'window.location = site_path + "/wallet?withdraw_affiliates_succeed"') );
			break;

		case 'wallet_withdraw_points':
			// process
			$user->wallet_withdraw_points($_POST['amount']);
			
			// return
			return_json( array('callback' => 'window.location = site_path + "/wallet?withdraw_points_succeed"') );
			break;

		case 'wallet_package_payment':
			// process
			$user->wallet_package_payment($_POST['package_id']);
			
			// return
			return_json( array('callback' => 'window.location = site_path + "/wallet?package_payment_succeed"') );
			break;

		default:
			_error(400);
			break;
	}
	
} catch (Exception $e) {
	return_json( array('error' => true, 'message' => $e->getMessage()) );
}

?>