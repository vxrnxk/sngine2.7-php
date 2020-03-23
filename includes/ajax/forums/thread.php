<?php
/**
 * ajax -> forums -> thread
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
	$return['callback'] = 'window.location.replace(response.path);';

	switch ($_GET['do']) {
		case 'create':
			// valid inputs
			if(!isset($_GET['id']) || !is_numeric($_GET['id'])) {
				_error(400);
			}

			// create thread
			$thread_id = $user->post_forum_thread($_GET['id'], $_POST['title'], $_POST['text']);
			
			// return
			$return['path'] = $system['system_url'].'/forums/thread/'.$thread_id.'/'.get_url_text($_POST['title']);
			break;

		case 'edit':
			// valid inputs
			if(!isset($_GET['id']) || !is_numeric($_GET['id'])) {
				_error(400);
			}

			// edit thread
			$user->edit_forum_thread($_GET['id'], $_POST['title'], $_POST['text']);
			
			// return
			$return['path'] = $system['system_url'].'/forums/thread/'.$_GET['id'].'/'.get_url_text($_POST['title']);
			break;
		
		default:
			_error(400);
			break;
	}

	// return & exit
	return_json($return);
	
} catch (Exception $e) {
	return_json( array('error' => true, 'message' => $e->getMessage()) );
}

?>