<?php
/**
 * ajax -> albums -> modal
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
if(!isset($_GET['id']) || !is_numeric($_GET['id'])) {
	_error(400);
}

try {

	// initialize the return array
	$return = array();

	// get album
	$album = $user->get_album($_GET['id']);
	/* assign variables */
	$smarty->assign('album', $album);

	// get modal
	switch ($_GET['do']) {
		case 'edit_title':
			// return
			$return['edit_title'] = $smarty->fetch("ajax.album.edit_title.tpl");
			$return['callback'] = "$('#modal').modal('show'); $('.modal-content:last').html(response.edit_title);";
			break;

		case 'add_photos':
			// prepare publisher
			$smarty->assign('feelings', get_feelings());
			$smarty->assign('feelings_types', get_feelings_types());
			
			// return
			$return['add_photos'] = $smarty->fetch("ajax.album.add_photos.tpl");
			$return['callback'] = "$('#modal').modal('show'); $('.modal-content:last').html(response.add_photos); initialize_modal();";
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