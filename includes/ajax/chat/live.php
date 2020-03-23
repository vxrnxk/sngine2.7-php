<?php
/**
 * ajax -> chat -> live
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

// initialize opened chat boxes session if not
if(!isset($_SESSION['chat_boxes_opened'])) {
    $_SESSION['chat_boxes_opened'] = array();
}

// valid inputs
if(!isset($_POST['chat_enabled']) || !isset($_POST['chat_boxes_opened_client'])) {
	_error(400);
}
/* if chat_boxes_opened_client not array */
$_POST['chat_boxes_opened_client'] = json_decode($_POST['chat_boxes_opened_client'], true);
if(!is_array($_POST['chat_boxes_opened_client'])) {
	_error(400);
}
/* filter the client opened chat boxes */
$chat_boxes_opened_client = array();
foreach($_POST['chat_boxes_opened_client'] as $key => $value) {
	if(is_numeric($key) && is_numeric($value)) {
		$chat_boxes_opened_client[$key] = $value;
	}
}
/* if opened_thread isset */
if(isset($_POST['opened_thread'])) {
	$_POST['opened_thread'] = json_decode($_POST['opened_thread'], true);
	if(!is_array($_POST['opened_thread'])) {
		_error(400);
	}
	if(!is_numeric($_POST['opened_thread']['conversation_id']) || !is_numeric($_POST['opened_thread']['last_message_id'])) {
		_error(400);
	}
}

try {

	// initialize the return array
	$return = array();

	// check if chat enabled & not from mobile
	require_once(ABSPATH.'includes/libs/MobileDetect/Mobile_Detect.php');
    $detect = new Mobile_Detect;
	if($system['chat_enabled'] && !($detect->isMobile() && !$detect->isTablet())) {
		// [1] [update] master chat sidebar (online & offline friends list)
		/* get online friends */
		$online_friends = $user->get_online_friends();
		/* get offline friends */
		$offline_friends = $user->get_offline_friends();
		/* get sidebar friends */
		$sidebar_friends = array_merge( $online_friends, $offline_friends );
		// assign variables
		$smarty->assign('sidebar_friends', $sidebar_friends);
		/* return */
		$return['master']['sidebar'] = $smarty->fetch("ajax.chat.master.sidebar.tpl");

		// [2] [update] master chat sidebar (online users counter & chat status)
		/* check chat status on both (client side & server side) */
		if($user->_data['user_chat_enabled']) {
			/* return */
			$return['master']['chat_enabled'] = '1';
			$return['master']['online_friends_count'] = count($online_friends);
		} elseif (!$user->_data['user_chat_enabled'] && $_GET['chat_enabled']) {
			/* return */
			$return['master']['chat_enabled'] = '0';
		}

		/* prepare session */
		if(($key = array_search(NULL, $_SESSION['chat_boxes_opened'])) !== false) {
			unset($_SESSION['chat_boxes_opened'][$key]);
		}

		// [3] & [4] & [5]
		if(!(empty($chat_boxes_opened_client) && empty($_SESSION['chat_boxes_opened']))) {

			// [3] [get] closed chat boxes
			$chat_boxes_closed = array_diff(array_keys($chat_boxes_opened_client), $_SESSION['chat_boxes_opened']);
			if(count($chat_boxes_closed) > 0) {
				$return['chat_boxes_closed'] = $chat_boxes_closed;
			}

			// [4] [get] opened chat boxes
			$chat_boxes_pre_opened = array_diff($_SESSION['chat_boxes_opened'], array_keys($chat_boxes_opened_client));
			$chat_boxes_opened = [];
			foreach($chat_boxes_pre_opened as $opened_conversation_id) {
				/* get conversation */
				$conversation = $user->get_conversation($opened_conversation_id);
				if($conversation) {
					$chat_boxes_opened[] = $conversation;
				}
			}
			if(count($chat_boxes_opened) > 0) {
				$return['chat_boxes_opened'] = $chat_boxes_opened;
			}

			// [5] [get] updated chat boxes
			$chat_boxes_pre_updated = array_intersect($_SESSION['chat_boxes_opened'], array_keys($chat_boxes_opened_client));
			$chat_boxes_updated = [];
			foreach($chat_boxes_pre_updated as $updated_conversation_id) {
				/* get conversation */
				$conversation = $user->get_conversation($updated_conversation_id);
				if($conversation) {
					$return_this = false;
					/* [1] check for a new messages for this chat box */
					if($conversation['last_message_id'] != $chat_boxes_opened_client[$conversation['conversation_id']]) {
						$return_this = true;
						/* get new messages */
						$messages = $user->get_conversation_messages($conversation['conversation_id'], 0, $chat_boxes_opened_client[$conversation['conversation_id']]);
						/* assign variables */
						$smarty->assign('messages', $messages);
						/* return */
						$last_message = end($messages);
						$conversation['is_me'] = ($last_message['user_id'] == $user->_data['user_id'])? true: false;
						$conversation['messages_count'] = count($messages);
						$conversation['messages'] = $smarty->fetch("ajax.chat.messages.tpl");
					}
					/* [2] check if any recipient typing */
					if($conversation['typing_name_list']) {
						$return_this = true;
					}
					/* [3] check if any recipient seen */
					if($conversation['seen_name_list']) {
						$return_this = true;
					}
					/* [4] check single user's chat status (online|offline) */
					if(!$conversation['multiple_recipients']) {
						$return_this = true;
						/* update single user's chat status */
						$conversation['user_online'] = ($user->user_online($conversation['recipients'][0]['user_id']))? true: false;
					}
					/* return */
					if($return_this) {
						$chat_boxes_updated[] = $conversation;
					}
				}
			}
			if(count($chat_boxes_updated) > 0) {
				$return['chat_boxes_updated'] = $chat_boxes_updated;
			}
		}

		// [6] [get] new chat boxes
		$chat_boxes_new = $user->get_conversations_new();
		if(count($chat_boxes_new) > 0) {
			$return['chat_boxes_new'] = $chat_boxes_new;
		}

	}

	// [7] [get] updated thread
	if(isset($_POST['opened_thread'])) {
		/* get conversation */
		$conversation = $user->get_conversation($_POST['opened_thread']['conversation_id']);
		if($conversation) {
			$return_this = false;
			/* [1] check for a new messages for this converstaion */
			if($conversation['last_message_id'] != $_POST['opened_thread']['last_message_id']) {
				$return_this = true;
				/* get new messages */
				$messages = $user->get_conversation_messages($conversation['conversation_id'], 0, $_POST['opened_thread']['last_message_id']);
				/* assign variables */
				$smarty->assign('messages', $messages);
				/* return */
				$last_message = end($messages);
				$conversation['is_me'] = ($last_message['user_id'] == $user->_data['user_id'])? true: false;
				$conversation['messages_count'] = count($messages);
				$conversation['messages'] = $smarty->fetch("ajax.chat.messages.tpl");
			}
			/* [2] check if any recipient typing */
			if($conversation['typing_name_list']) {
				$return_this = true;
			}
			/* [3] check if any recipient seen */
			if($conversation['seen_name_list']) {
				$return_this = true;
			}
			/* return */
			if($return_this) {
				$return['thread_updated'] = $conversation;
			}
		}
	}

	// [8] check for new (audio) calls
	$return['has_audiocall'] = false;
	if($system['audio_call_enabled']) {
		/* check new calls (audio) */
		$audiocall = $user->check_new_calls("audio");
		if($audiocall) {
			$return['has_audiocall'] = true;
			$return['audiocall'] = $audiocall;
		}
	}

	// [9] check for new (video) calls
	$return['has_videocall'] = false;
	if($system['video_call_enabled'] && !$return['has_audiocall']) {
		/* check new calls (video) */
		$videocall = $user->check_new_calls("video");
		if($videocall) {
			$return['has_videocall'] = true;
			$return['videocall'] = $videocall;
		}
	}

	// return & exit
	return_json($return);

} catch (Exception $e) {
	modal("ERROR", __("Error"), $e->getMessage());
}

?>