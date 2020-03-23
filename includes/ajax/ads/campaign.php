<?php
/**
 * ajax -> ads -> campaign
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
			// create campaign
			$user->create_campaign($_POST);
			
			// return
			return_json( array('callback' => 'window.location = site_path + "/ads"') );
			break;

		case 'edit':
			// valid inputs
			if(!isset($_GET['id']) || !is_numeric($_GET['id'])) {
				_error(400);
			}
			
			// edit campaign
			$user->edit_campaign($_GET['id'], $_POST);
			
			// return
			return_json( array('success' => true, 'message' => __("Campaign settings have been updated")) );
			break;

		case 'delete':
			// valid inputs
			if(!isset($_POST['id']) || !is_numeric($_POST['id'])) {
				_error(400);
			}
			
			// delete campaign
			$user->delete_campaign($_POST['id']);
			
			// return
			return_json( array('callback' => 'window.location.reload();') );
			break;

		case 'stop':
			// valid inputs
			if(!isset($_POST['id']) || !is_numeric($_POST['id'])) {
				_error(400);
			}

			// stop campaign
			$user->update_campaign_status($_POST['id'], false);
			
			// return
			return_json( array('callback' => 'window.location.reload();') );
			break;

		case 'resume':
			// valid inputs
			if(!isset($_POST['id']) || !is_numeric($_POST['id'])) {
				_error(400);
			}

			// resume campaign
			$user->update_campaign_status($_POST['id'], true);
			
			// return
			return_json( array('callback' => 'window.location.reload();') );
			break;

		case 'potential_reach':
			// get potential reach
			$potential_reach = $user->campaign_potential_reach($_POST['countries'], $_POST['gender'], $_POST['relationship']);
			
			// return
			return_json($potential_reach);
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