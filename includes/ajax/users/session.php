<?php
/**
 * ajax -> users -> session
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

	switch ($_POST['handle']) {
		case 'session':
			// valid inputs
			if(!isset($_POST['id']) || !is_numeric($_POST['id'])) {
				_error(400);
			}

			// delete session
			$db->query(sprintf("DELETE FROM users_sessions WHERE session_id = %s AND user_id = %s", secure($_POST['id'], 'int'), secure($user->_data['user_id'], 'int') )) or _error("SQL_ERROR_THROWEN");
			break;

		case 'sessions':
			// delete sessions
			$db->query(sprintf("DELETE FROM users_sessions WHERE session_id != %s AND user_id = %s", secure($user->_data['active_session_id']), secure($user->_data['user_id'], 'int') )) or _error("SQL_ERROR_THROWEN");
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