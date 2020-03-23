<?php
/**
 * ajax -> albums -> action
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

	// initialize the return array
	$return = array();

	switch ($_POST['do']) {
		case 'delete_album':
			// valid inputs
			if(!isset($_POST['id']) || !is_numeric($_POST['id'])) {
				_error(400);
			}
			
			// delete album
			$path = $user->delete_album($_POST['id']);
			
			// return
			$return['callback'] = "window.location = '".$path."';";
			break;

		case 'edit_album':
			// valid inputs
			if(!isset($_POST['id']) || !is_numeric($_POST['id'])) {
				_error(400);
			}
			if(!isset($_POST['title'])) {
				_error(400);
			}

			// edit album
			try {
				$user->edit_album($_POST['id'], $_POST['title']);
				$return['callback'] = 'window.location.reload();';
			} catch (Exception $e) {
				return_json( array('error' => true, 'message' => $e->getMessage()) );
			}
			break;

		case 'add_photos':
			// valid inputs
			if(!isset($_POST['id']) || !is_numeric($_POST['id'])) {
				_error(400);
			}
			if(!isset($_POST['privacy']) || !isset($_POST['photos'])) {
				_error(400);
			}
			$inputs['album_id'] = $_POST['id'];
			/* filter photos */
			$photos = array();
			if(isset($_POST['photos'])) {
				$_POST['photos'] = json_decode($_POST['photos']);
				if(!is_object($_POST['photos'])) {
					_error(400);
				}
				/* filter the photos */
				foreach($_POST['photos'] as $photo) {
					$photos[] = (array) $photo;
				}
				if(count($photos) == 0) {
					_error(400);
				}
			}
			$inputs['photos'] = $photos;
			$inputs['privacy'] = $_POST['privacy'];
			$inputs['message'] = $_POST['message'];
			$inputs['location'] = $_POST['location'];
			$inputs['feeling_action'] = $_POST['feeling_action'];
			$inputs['feeling_value'] = $_POST['feeling_value'];

			// add album photos
			$post_id = $user->add_album_photos($inputs);
			
			// return
			$return['callback'] = "window.location = '".$system['system_url']."/posts/".$post_id."';";
			break;

		case 'delete_photo':
			// valid inputs
			if(!isset($_POST['id']) || !is_numeric($_POST['id'])) {
				_error(400);
			}

			// delete photo
			$user->delete_photo($_POST['id']);
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