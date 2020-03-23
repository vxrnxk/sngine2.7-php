<?php
/**
 * ajax -> data -> live
 * 
 * @package Sngine
 * @author Zamblek
 */

// fetch bootstrap
require('../../../bootstrap.php');

// check AJAX Request
is_ajax();

// check user logged in
if(!$user->_logged_in) {
    modal('LOGIN');
}

// valid inputs
/* if (last_request || last_message || last_notification) not set */
if(!isset($_POST['last_request']) || !isset($_POST['last_message']) || !isset($_POST['last_notification'])) {
	_error(400);
}
/* if (last_request || last_message || last_notification) not numeric */
if(!is_numeric($_POST['last_request']) || !is_numeric($_POST['last_message']) || !is_numeric($_POST['last_notification'])) {
	_error(400);
}

try {

	// initialize the return array
	$return = array();

	// [1] check for new requests
	$requests = $user->get_friend_requests(0, $_POST['last_request']);
	if(count($requests) > 0) {
		/* assign variables */
		$smarty->assign('requests', $requests);
		/* return */
		$return['requests_count'] = count($requests);
		$return['requests'] = $smarty->fetch("ajax.live.requests.tpl");
	}

	// [2] check for new messgaes
	if($_POST['last_message'] != $user->_data['user_live_messages_lastid']) {
		$conversations = $user->get_conversations();
		/* assign variables */
		$smarty->assign('conversations', $conversations);
		/* return */
		$return['conversations_count'] = $user->_data['user_live_messages_counter'];
		$return['conversations'] = $smarty->fetch("ajax.live.conversations.tpl");
		
	}

	// [3] check for new notifications
	$notifications = $user->get_notifications(0, $_POST['last_notification']);
	if(count($notifications) > 0) {
		/* assign variables */
		$smarty->assign('notifications', $notifications);
		/* return */
		$return['notifications_json'] = $notifications;
		$return['notifications_count'] = count($notifications);
		$return['notifications'] = $smarty->fetch("ajax.live.notifications.tpl");
	}


	// [4] check for new posts
	if(isset($_POST['last_post'])) {
		$posts = $user->get_posts( array('get' => $_POST['get'], 'filter' => $_POST['filter'], 'id' => $_POST['id'], 'last_post_id' => $_POST['last_post']) );
		if($posts) {
			/* assign variables */
			$smarty->assign('posts', $posts);
			/* return */
			$return['posts'] = $smarty->fetch("ajax.posts.tpl");
		}
	}

	// return & exit
	return_json($return);

} catch (Exception $e) {
	modal("ERROR", __("Error"), $e->getMessage());
}


?>