<?php
/**
 * ajax -> chat -> call
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

// valid inputs
if(!isset($_POST['type']) || !in_array($_POST['type'], ['video','audio'])) {
	_error(400);
}

try {

	// initialize the return array
	$return = array();

	switch ($_POST['do']) {
		case 'create_call':
			// valid inputs
			if(!isset($_POST['user_id']) || !is_numeric($_POST['user_id'])) {
				_error(400);
			}
			
			// create call
			$call_id = $user->create_call($_POST['type'], $_POST['user_id']);

		    // return
		    $return['call_id'] = $call_id;
			break;

		case 'check_calling_response':
			// valid inputs
			if(!isset($_POST['id']) || !is_numeric($_POST['id'])) {
				_error(400);
			}

			// check call response
			$call = $user->check_calling_response($_POST['type'], $_POST['id']);

			// return
		    $return['call'] = $call;
			break;

		case 'answer_call':
			// valid inputs
			if(!isset($_POST['id']) || !is_numeric($_POST['id'])) {
				_error(400);
			}

			// answer call
			$call = $user->answer_call($_POST['type'], $_POST['id']);

			// return
		    $return['call'] = $call;
			break;

		case 'decline_call':
			// valid inputs
			if(!isset($_POST['id']) || !is_numeric($_POST['id'])) {
				_error(400);
			}

			// decline call
			$user->decline_call($_POST['type'], $_POST['id']);
			break;

		case 'update_call':
			// valid inputs
			if(!isset($_POST['id']) || !is_numeric($_POST['id'])) {
				_error(400);
			}

			// update call
			$user->update_call($_POST['type'], $_POST['id']);
			break;

		default:
			_error(400);
			break;
	}

	// return & exit
	return_json($return);

} catch (Exception $e) {
	modal("ERROR", __("Error"), $e->getMessage());
}

?>