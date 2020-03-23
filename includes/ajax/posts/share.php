<?php
/**
 * ajax -> posts -> share
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
if(!isset($_GET['post_id']) || !is_numeric($_GET['post_id'])) {
	_error(400);
}

try {

	// initialize the return array
	$return = array();

	switch ($_REQUEST['do']) {
		case 'publish':
			// publish
			$user->share($_GET['post_id'], $_POST);

			// return
			modal("SUCCESS", __("Success"),  __("This has been shared Successfully"));
			break;

		case 'create':
			// prepare publisher
			/* get post */
			$post = $user->get_post($_GET['post_id']);
			if(!$post)  {
				_error(404);
			}
			$smarty->assign('post', $post);

			/* get user pages */
			$pages = $user->get_pages(array('managed' => true, 'user_id' => $user->_data['user_id']));
			$smarty->assign('pages', $pages);

			/* get user pages */
			$groups = $user->get_groups(array('get_all' => true, 'user_id' => $user->_data['user_id']));
			/* assign variables */
			$smarty->assign('groups', $groups);

			// return
			$return['share_publisher'] = $smarty->fetch("ajax.share.publisher.tpl");
			$return['callback'] = "$('#modal').modal('show'); $('.modal-content:last').html(response.share_publisher); initialize_modal();";
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