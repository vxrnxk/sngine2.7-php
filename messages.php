<?php
/**
 * messages
 * 
 * @package Sngine
 * @author Zamblek
 */

// fetch bootloader
require('bootloader.php');

// user access
user_access();

// page header
page_header(__("Messages"));

try {

	// check the view
	$view = (!isset($_GET['view']))? 'message' : 'new';

	// get view content
	if($view == 'message') {

		if (!isset($_GET['cid'])) {
			if($user->_data['conversations']) {
				$conversation = $user->_data['conversations'][0];
				$conversation['messages'] = $user->get_conversation_messages($conversation['conversation_id']);
			}
		} else {
			/* check cid is valid */
			if(is_empty($_GET['cid']) || !is_numeric($_GET['cid'])) {
				_error(404);
			}
			$conversation = $user->get_conversation($_GET['cid']);
			$conversation['messages'] = $user->get_conversation_messages($conversation['conversation_id']);
		}
		// assign variables
		$smarty->assign('conversation', $conversation);

	} elseif ($view == 'new') {

		/* get recipient */
		if(isset($_GET['uid'])) {
			$get_recipient = $db->query(sprintf("SELECT user_id, CONCAT(users.user_firstname,' ',users.user_lastname) as user_fullname FROM users WHERE user_id = %s", secure($_GET['uid'], 'int') )) or _error("SQL_ERROR_THROWEN");
			if($get_recipient->num_rows > 0) {
				$recipient = $get_recipient->fetch_assoc();
				/* assign variables */
				$smarty->assign('recipient', $recipient);
			}
		}
		
	}
	/* assign variables */
	$smarty->assign('view', $view);

} catch (Exception $e) {
	_error(__("Error"), $e->getMessage());
}

// page footer
page_footer("messages");

?>