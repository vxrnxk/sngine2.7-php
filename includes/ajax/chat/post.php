<?php
/**
 * ajax -> chat -> post
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
/* if message not set */
if(!isset($_POST['message'])) {
	_error(400);
}
/* filter message photo */
if(isset($_POST['photo'])) {
	$_POST['photo'] = json_decode($_POST['photo']);
}
/* if both (conversation_id & recipients) not set */
if(!isset($_POST['conversation_id']) && !isset($_POST['recipients'])) {
	_error(400);
}
/* if conversation_id set but not numeric */
if(isset($_POST['conversation_id']) && !is_numeric($_POST['conversation_id'])) {
	_error(400);
}
/* if recipients not array */
if(isset($_POST['recipients'])) {
	$_POST['recipients'] = json_decode($_POST['recipients']);
	if(!is_array($_POST['recipients'])) {
		_error(400);
	}
	/* recipients must contain numeric values only */
	$_POST['recipients'] = array_filter($_POST['recipients'], 'is_numeric');
	/* check blocking */
	foreach($_POST['recipients'] as $recipient) {
		if($user->blocked($recipient)) {
			_error(403);
		}
	}
}

try {

	// post message
	/* post conversation message */
	$conversation = $user->post_conversation_message($_POST['message'], $_POST['photo'], $_POST['conversation_id'], $_POST['recipients']);

	/* remove typing status */
	$user->update_conversation_typing_status($conversation['conversation_id'], false);
	
	/* add conversation to opened chat boxes session if not */
	if(!in_array($conversation['conversation_id'], $_SESSION['chat_boxes_opened'])) {
		$_SESSION['chat_boxes_opened'][] = $conversation['conversation_id'];
	}

	// return & exit
	return_json($conversation);
	
} catch (Exception $e) {
	modal("ERROR", __("Error"), $e->getMessage());
}

?>