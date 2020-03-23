<?php
/**
 * ajax -> admin -> emojis
 * 
 * @package Sngine
 * @author Zamblek
 */

// fetch bootstrap
require('../../../bootstrap.php');

// check AJAX Request
is_ajax();

// check admin|moderator permission
if(!$user->_is_admin) {
	modal("MESSAGE", __("System Message"), __("You don't have the right permission to access this"));
}

// handle emojis
try {

	switch ($_GET['do']) {
		case 'add':
			/* valid inputs */
			if(is_empty($_POST['pattern']) && is_empty($_POST['class'])) {
				throw new Exception(__("You must fill in all of the fields"));
			}
			/* insert */
			$db->query(sprintf("INSERT INTO emojis (pattern, class) VALUES (%s, %s)", secure($_POST['pattern']), secure($_POST['class']) )) or _error("SQL_ERROR_THROWEN");
			/* return */
			return_json( array('callback' => 'window.location = "'.$system['system_url'].'/'.$control_panel['url'].'/emojis";') );
			break;

		case 'edit':
			/* valid inputs */
			if(!isset($_GET['id']) || !is_numeric($_GET['id'])) {
				_error(400);
			}
			if(is_empty($_POST['pattern']) && is_empty($_POST['class'])) {
				throw new Exception(__("You must fill in all of the fields"));
			}
			/* update */
			$db->query(sprintf("UPDATE emojis SET pattern = %s, class = %s WHERE emoji_id = %s", secure($_POST['pattern']), secure($_POST['class']), secure($_GET['id'], 'int') )) or _error("SQL_ERROR_THROWEN");
			/* return */
			return_json( array('success' => true, 'message' => __("Emoji info have been updated")) );
			break;

		default:
			_error(400);
			break;
	}

} catch (Exception $e) {
	return_json( array('error' => true, 'message' => $e->getMessage()) );
}

?>