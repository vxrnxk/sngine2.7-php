<?php
/**
 * ajax -> posts -> edit
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

	switch ($_POST['handle']) {
		case 'comment':
			// valid inputs
			/* if id is set & not numeric */
			if(!isset($_POST['id']) || !is_numeric($_POST['id'])) {
				_error(400);
			}
			/* if message not set */
			if(!isset($_POST['message'])) {
				_error(400);
			}
			/* filter comment photo */
			if(isset($_POST['photo'])) {
				$_POST['photo'] = json_decode($_POST['photo']);
			}

			// edit comment
			$comment = $user->edit_comment($_POST['id'], $_POST['message'], $_POST['photo']);
			/* assign variables */
			$smarty->assign('_comment', $comment);

			// return
			$return['comment'] = $smarty->fetch("__feeds_comment.text.tpl");
			break;

		case 'post':
			// valid inputs
			/* if id is set & not numeric */
			if(!isset($_POST['id']) || !is_numeric($_POST['id'])) {
				_error(400);
			}
			/* if message not set */
			if(!isset($_POST['message'])) {
				_error(400);
			}
			
			// edit post
			$post = $user->edit_post($_POST['id'], $_POST['message']);
			/* assign variables */
			$smarty->assign('post', $post);

			// return
			$return['post'] = $smarty->fetch("__feeds_post.text.tpl");
			break;

		case 'product':
			// valid inputs
			/* if id is set & not numeric */
			if(!isset($_POST['id']) || !is_numeric($_POST['id'])) {
				_error(400);
			}
			/* if product info not set */
			if(!isset($_POST['name']) || !isset($_POST['price']) || !isset($_POST['category']) || !isset($_POST['status']) || !isset($_POST['location']) || !isset($_POST['message'])) {
				_error(400);
			}
			/* check product name */
			if(is_empty($_POST['name'])) {
				return_json( array('error' => true, 'message' => __("Please add your product name")) );
			}
			/* check product price */
			if(is_empty($_POST['price'])) {
				return_json( array('error' => true, 'message' => __("Please add your product price")) );
			}
			if(!is_numeric($_POST['price']) || $_POST['price'] < 0) {
				return_json( array('error' => true, 'message' => __("Please add valid product price (0 for free or more)")) );
			}
			/* check product category */
			if(!in_array($_POST['category'], $user->get_market_categories_ids())) {
				return_json( array('error' => true, 'message' => __("Please select valid product category")) );
			}
			/* check product status */
			if(!in_array($_POST['status'], array('new', 'old'))) {
				return_json( array('error' => true, 'message' => __("Please select valid product status")) );
			}
			
			// edit product
			$user->edit_product($_POST['id'], $_POST['message'], $_POST['name'], $_POST['price'], $_POST['category'], $_POST['status'], $_POST['location']);
			
			// return
			$return['callback'] = 'window.location = "'.$system['system_url'].'/posts/'.$_POST['id'].'";';
			break;

		case 'privacy':
			// valid inputs
			/* if id is set & not numeric */
			if(!isset($_POST['id']) || !is_numeric($_POST['id'])) {
				_error(400);
			}
			/* if privacy set and not valid */
			if(!isset($_POST['privacy']) || !in_array($_POST['privacy'], array('me', 'friends', 'public'))) {
				_error(400);
			}
			
			// edit privacy
			$post = $user->edit_privacy($_POST['id'], $_POST['privacy']);
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