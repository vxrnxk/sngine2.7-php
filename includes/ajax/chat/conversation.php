<?php
/**
 * ajax -> chat -> conversation
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

	switch ($_GET['do']) {
		case 'get':
			// valid inputs
			if(!isset($_GET['conversation_id']) && !is_numeric($_GET['ids'])) {
				_error(400);
			}

			// get conversation
			$conversation = $user->get_conversation($_GET['conversation_id']);
			if($conversation) {
				/* get conversation messages */
				$conversation['messages'] = $user->get_conversation_messages($conversation['conversation_id']);
				/* assign variables */
				$smarty->assign('conversation', $conversation);
				/* return */
				$return['conversation'] = $conversation;
				$return['conversation_html'] = $smarty->fetch("ajax.chat.conversation.tpl");
			}
			break;

		case 'check':
			// valid inputs
			if(!isset($_GET['uid']) && !is_numeric($_GET['uid'])) {
				_error(400);
			}

			// check mutual conversation (even deleted)
			$mutual_conversation = $user->get_mutual_conversation((array)$_GET['uid'], true);
			if($mutual_conversation) {
				$return['conversation_id'] = $mutual_conversation;
			}
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