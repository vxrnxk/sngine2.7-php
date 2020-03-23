<?php
/**
 * ajax -> admin -> games
 * 
 * @package Sngine
 * @author Zamblek
 */

// fetch bootstrap
require('../../../bootstrap.php');

// check AJAX Request
is_ajax();

// check admin|moderator permission
if(!$user->_is_admin && !$user->_is_moderator) {
	modal("MESSAGE", __("System Message"), __("You don't have the right permission to access this"));
}

// handle games
try {

	switch ($_GET['do']) {
		case 'edit':
			/* valid inputs */
			if(!isset($_GET['id']) || !is_numeric($_GET['id'])) {
				_error(400);
			}
			/* update */
			$db->query(sprintf("UPDATE games SET title = %s, description = %s, source = %s, thumbnail = %s WHERE game_id = %s", secure($_POST['title']), secure($_POST['description']), secure($_POST['source']), secure($_POST['thumbnail']), secure($_GET['id'], 'int') )) or _error("SQL_ERROR_THROWEN");
			/* return */
			return_json( array('success' => true, 'message' => __("Game info have been updated")) );
			break;

		case 'add':
			/* insert */
			$db->query(sprintf("INSERT INTO games (title, description, source, thumbnail) VALUES (%s, %s, %s, %s)", secure($_POST['title']), secure($_POST['description']), secure($_POST['source']), secure($_POST['thumbnail']) )) or _error("SQL_ERROR_THROWEN");
			/* return */
			return_json( array('callback' => 'window.location = "'.$system['system_url'].'/'.$control_panel['url'].'/games";') );
			break;
		
		default:
			_error(400);
			break;
	}

} catch (Exception $e) {
	return_json( array('error' => true, 'message' => $e->getMessage()) );
}

?>