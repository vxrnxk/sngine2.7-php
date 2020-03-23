<?php
/**
 * ajax -> admin -> stickers
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

// handle stickers
try {

	switch ($_GET['do']) {
		case 'add':
			/* valid inputs */
			if(is_empty($_POST['image'])) {
				throw new Exception(__("You must upload sticker image"));
			}
			/* insert */
			$db->query(sprintf("INSERT INTO stickers (image) VALUES (%s)", secure($_POST['image']) )) or _error("SQL_ERROR_THROWEN");
			/* return */
			return_json( array('callback' => 'window.location = "'.$system['system_url'].'/'.$control_panel['url'].'/stickers";') );
			break;

		case 'edit':
			/* valid inputs */
			if(!isset($_GET['id']) || !is_numeric($_GET['id'])) {
				_error(400);
			}
			if(is_empty($_POST['image'])) {
				throw new Exception(__("You must upload sticker image"));
			}
			/* update */
			$db->query(sprintf("UPDATE stickers SET image = %s WHERE sticker_id = %s", secure($_POST['image']), secure($_GET['id'], 'int') )) or _error("SQL_ERROR_THROWEN");
			/* return */
			return_json( array('success' => true, 'message' => __("Sticker info have been updated")) );
			break;

		default:
			_error(400);
			break;
	}

} catch (Exception $e) {
	return_json( array('error' => true, 'message' => $e->getMessage()) );
}

?>