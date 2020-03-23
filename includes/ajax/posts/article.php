<?php
/**
 * ajax -> posts -> article
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
			// create article
			$post_id = $user->post_article($_POST['title'], $_POST['text'], $_POST['cover'], $_POST['category'], $_POST['tags']);

			// return
			$return['path'] = $system['system_url'].'/blogs/'.$post_id.'/'.get_url_text($_POST['title']);
			break;

		case 'edit':
			// valid inputs
			if(!isset($_GET['id']) || !is_numeric($_GET['id'])) {
				_error(400);
			}
			
			// edit article
			$user->edit_article($_GET['id'], $_POST['title'], $_POST['text'], $_POST['cover'], $_POST['category'], $_POST['tags']);

			// return
			$return['path'] = $system['system_url'].'/blogs/'.$_GET['id'].'/'.get_url_text($_POST['title']);
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