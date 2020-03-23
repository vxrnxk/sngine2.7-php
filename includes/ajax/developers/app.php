<?php
/**
 * ajax -> developers -> app
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
		case 'create':
			// create app
			$user->create_app($_POST);
			
			// return
			return_json( array('callback' => 'window.location = site_path + "/developers/apps"') );
			break;

		case 'edit':
			// valid inputs
			if(!isset($_GET['id']) || !is_numeric($_GET['id'])) {
				_error(400);
			}

			// edit app
			$user->edit_app($_GET['id'], $_POST);
			
			// return
			return_json( array('success' => true, 'message' => __("App settings have been updated")) );
			break;

		case 'delete':
			// valid inputs
			if(!isset($_POST['id']) || !is_numeric($_POST['id'])) {
				_error(400);
			}

			// delete app
			$user->delete_app($_POST['id']);
			
			// return
			return_json( array('callback' => 'window.location.reload();') );
			break;

		case 'oauth':
			// valid inputs
			if(!isset($_POST['id']) || !is_numeric($_POST['id'])) {
				_error(400);
			}

			// oauth app
			$redirect_URL = $user->oauth_app($_POST['id'], true);
			
			// return
			return_json( array('redirect_url' => $redirect_URL) );
			break;

		default:
			_error(400);
			break;
	}
	
} catch (Exception $e) {
	if($_REQUEST['do'] == "create" || $_REQUEST['do'] == "edit") {
		return_json( array('error' => true, 'message' => $e->getMessage()) );
	} else {
		modal("ERROR", __("Error"), $e->getMessage());
	}
}

?>