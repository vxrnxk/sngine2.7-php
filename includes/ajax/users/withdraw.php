<?php
/**
 * ajax -> users -> withdraw
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

	switch ($_GET['type']) {
		case 'affiliates':
			// check if affiliates enabled
			if(!$system['affiliates_enabled']) {
				throw new Exception(__("This feature has been disabled by the admin"));
			}

			// valid inputs
			/* valid amount */
			if(is_empty($_POST['amount']) || !is_numeric($_POST['amount']) || $_POST['amount'] <= 0) {
				throw new Exception(__("You have to enter valid amount"));
			}
			if($_POST['amount'] < $system['affiliates_min_withdrawal']) {
				throw new Exception(__("Your balance is less than the minimum withdrawal request amount"));
			}
			if($_POST['amount'] > $user->_data['user_affiliate_balance']) {
				throw new Exception(__("Your balance is less than the requested amount"));
			}
		    /* valid method */
		    if(!isset($_POST['method']) || !in_array($_POST['method'], $system['affiliate_payment_method_array'])) {
				throw new Exception(__("Please select a valid payment method"));
			}
			switch ($_POST['method']) {
				case 'paypal':
				case 'skrill':
					if(!valid_email($_POST['method_value'])) {
				        throw new Exception(__("Please enter a valid email address"));
				    }
					break;

				case 'bank':
					if(is_empty($_POST['method_value'])) {
				        throw new Exception(__("Please enter a valid bank account details"));
				    }
					break;

				default:
					if(is_empty($_POST['method_value'])) {
				        throw new Exception(__("Please enter a valid transfer to details"));
				    }
					break;
			}

			// process
			/* insert payment */
			$db->query(sprintf("INSERT INTO affiliates_payments (user_id, amount, method, method_value, time, status) VALUES (%s, %s, %s, %s, %s, '0')", secure($user->_data['user_id'], 'int'), secure($_POST['amount']), secure($_POST['method']), secure($_POST['method_value']), secure($date) )) or _error("SQL_ERROR_THROWEN");
			/* update user balance*/
			$balance = $user->_data['user_affiliate_balance'] - $_POST['amount'];
			$db->query(sprintf("UPDATE users SET user_affiliate_balance = %s WHERE user_id = %s", secure($balance), secure($user->_data['user_id'], 'int') )) or _error("SQL_ERROR_THROWEN");
			
			// send notification to admins
			$user->notify_system_admins("affiliates_withdrawal");
			break;

		case 'points':
			// check if points enabled
			if(!$system['points_enabled'] || !$system['points_money_withdraw_enabled']) {
				throw new Exception(__("This feature has been disabled by the admin"));
			}

			// valid inputs
			/* valid amount */
			if(is_empty($_POST['amount']) || !is_numeric($_POST['amount']) || $_POST['amount'] <= 0) {
				throw new Exception(__("You have to enter valid amount"));
			}
			if($_POST['amount'] < $system['points_min_withdrawal']) {
				throw new Exception(__("Your balance is less than the minimum withdrawal request amount"));
			}
			if($_POST['amount'] > ((1/$system['points_per_currency'])*$user->_data['user_points'])) {
				throw new Exception(__("Your balance is less than the requested amount"));
			}
			/* valid method */
		    if(!isset($_POST['method']) || !in_array($_POST['method'], $system['points_payment_method_array'])) {
				throw new Exception(__("Please select a valid payment method"));
			}
			switch ($_POST['method']) {
				case 'paypal':
				case 'skrill':
					if(!valid_email($_POST['method_value'])) {
				        throw new Exception(__("Please enter a valid email address"));
				    }
					break;

				case 'bank':
					if(is_empty($_POST['method_value'])) {
				        throw new Exception(__("Please enter a valid bank account details"));
				    }
					break;

				default:
					if(is_empty($_POST['method_value'])) {
				        throw new Exception(__("Please enter a valid transfer to details"));
				    }
					break;
			}

			// process
			/* insert payment */
			$db->query(sprintf("INSERT INTO points_payments (user_id, amount, method, method_value, time, status) VALUES (%s, %s, %s, %s, %s, '0')", secure($user->_data['user_id'], 'int'), secure($_POST['amount']), secure($_POST['method']), secure($_POST['method_value']), secure($date) )) or _error("SQL_ERROR_THROWEN");
			/* update user balance*/
			$balance = $user->_data['user_points'] - ($system['points_per_currency']*$_POST['amount']);
			$db->query(sprintf("UPDATE users SET user_points = %s WHERE user_id = %s", secure($balance), secure($user->_data['user_id'], 'int') )) or _error("SQL_ERROR_THROWEN");

			// send notification to admins
			$user->notify_system_admins("points_withdrawal");
			break;
		
		default:
			_error(403);
			break;
	}

	// return
	return_json( array('success' => true, 'message' => __("Your withdrawal request has been sent")) );

} catch (Exception $e) {
	return_json( array('error' => true, 'message' => $e->getMessage()) );
}

?>