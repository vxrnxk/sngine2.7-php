<?php
/**
 * ajax -> admin -> withdraw
 * 
 * @package Sngine
 * @author Zamblek
 */

// fetch bootstrap
require('../../../bootstrap.php');

// check AJAX Request
is_ajax();

// check admin|moderator permission
if(!$user->_is_admin) {
	modal("MESSAGE", __("System Message"), __("You don't have the right permission to access this"));
}

// valid inputs
if(!isset($_POST['id']) || !is_numeric($_POST['id'])) {
	_error(400);
}

// handle withdraw
try {

	switch ($_POST['type']) {
		case 'affiliates':
			/* get the request */
			$get_withdrawal_request = $db->query(sprintf("SELECT * FROM affiliates_payments WHERE payment_id = %s", secure($_POST['id'], 'int') )) or _error("SQL_ERROR_THROWEN");
			if($get_withdrawal_request->num_rows == 0) {
				_error(400);
			}
			$withdrawal_request = $get_withdrawal_request->fetch_assoc();
			
			switch ($_POST['handle']) {
				case 'approve':
					/* approve request */
					$db->query(sprintf("UPDATE affiliates_payments SET status = '1' WHERE payment_id = %s", secure($_POST['id'], 'int') )) or _error("SQL_ERROR_THROWEN");
					/* send notification to request author */
            		$user->post_notification( array('to_user_id'=>$withdrawal_request['user_id'], 'action'=>'affiliates_withdrawal_approved') );
					break;

				case 'decline':
					/* decline request */
					$db->query(sprintf("UPDATE affiliates_payments SET status = '-1' WHERE payment_id = %s", secure($_POST['id'], 'int') )) or _error("SQL_ERROR_THROWEN");
					/* send notification to request author */
            		$user->post_notification( array('to_user_id'=>$withdrawal_request['user_id'], 'action'=>'affiliates_withdrawal_declined') );
					break;

				default:
					_error(400);
					break;
			}
			break;

		case 'points':
			/* get the request */
			$get_withdrawal_request = $db->query(sprintf("SELECT * FROM points_payments WHERE payment_id = %s", secure($_POST['id'], 'int') )) or _error("SQL_ERROR_THROWEN");
			if($get_withdrawal_request->num_rows == 0) {
				_error(400);
			}
			$withdrawal_request = $get_withdrawal_request->fetch_assoc();
			
			switch ($_POST['handle']) {
				case 'approve':
					/* approve request */
					$db->query(sprintf("UPDATE points_payments SET status = '1' WHERE payment_id = %s", secure($_POST['id'], 'int') )) or _error("SQL_ERROR_THROWEN");
					/* send notification to request author */
            		$user->post_notification( array('to_user_id'=>$withdrawal_request['user_id'], 'action'=>'points_withdrawal_approved') );
					break;

				case 'decline':
					/* decline request */
					$db->query(sprintf("UPDATE points_payments SET status = '-1' WHERE payment_id = %s", secure($_POST['id'], 'int') )) or _error("SQL_ERROR_THROWEN");
					/* send notification to request author */
            		$user->post_notification( array('to_user_id'=>$withdrawal_request['user_id'], 'action'=>'points_withdrawal_declined') );
					break;

				default:
					_error(400);
					break;
			}
			break;
		
		default:
			_error(400);
			break;
	}

	// return & exist
	return_json();

} catch (Exception $e) {
	modal("ERROR", __("Error"), $e->getMessage());
}

?>