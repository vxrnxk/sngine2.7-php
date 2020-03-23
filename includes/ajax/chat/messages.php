<?php
/**
 * ajax -> chat -> get messages
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
/* if both (conversation_id & user_id) not set */
if(!isset($_GET['conversation_id']) && !isset($_GET['user_id'])) {
	_error(400);
}
/* if conversation_id set -> it must be numeric */
if(isset($_GET['conversation_id']) && !is_numeric($_GET['conversation_id'])) {
	_error(400);
}
/* if user_id not set -> it must be numeric */
if(isset($_GET['user_id']) && !is_numeric($_GET['user_id'])) {
	_error(400);
}

try {

	// initialize the return array
	$return = array();

	// initialize the conversation
	$conversation = array();

	// get conversation messages
	/* check single user's chat status */
	if(isset($_GET['user_id'])) {
		$return['user_online'] = ($user->user_online($_GET['ids']))? true: false;
	}

	/* if conversation_id not set -> check if there is a mutual conversation */
	if(!isset($_GET['conversation_id'])) {
		$mutual_conversation = $user->get_mutual_conversation((array)$_GET['user_id']);
		if(!$mutual_conversation) {
			/* there is no mutual conversation -> return & exit */
			return_json($return);
		}
		/* set the conversation_id */
		$_GET['conversation_id'] = $mutual_conversation;
		/* return [conversation_id: to set it as chat-box cid] */
		$return['conversation_id'] = $mutual_conversation;
	}

	/* get convertsation details */
	$conversation = $user->get_conversation($_GET['conversation_id']);

	/* get conversation messages */
	$conversation['messages'] = $user->get_conversation_messages($_GET['conversation_id']);
	/* check if last message sent by the viewer */
	if($conversation['seen_name_list'] && end($conversation['messages'])['user_id'] == $user->_data['user_id']) {
		$smarty->assign('last_seen_message_id', end($conversation['messages'])['message_id']);
	}

	/* return [color] */
	$return['color'] = $conversation['color'];

	/* return [messages] */
	$smarty->assign('conversation', $conversation);
	$return['messages'] = $smarty->fetch("ajax.chat.conversation.messages.tpl");

	/* add conversation to opened chat boxes session if not */
	if(!in_array($conversation['conversation_id'], $_SESSION['chat_boxes_opened'])) {
		$_SESSION['chat_boxes_opened'][] = $conversation['conversation_id'];
	}

	// return & exit
	return_json($return);

} catch (Exception $e) {
	modal("ERROR", __("Error"), $e->getMessage());
}

?>