<?php
/**
 * ajax -> posts -> lightbox
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
if(!isset($_POST['id']) || !is_numeric($_POST['id'])) {
	_error(400);
}
$valid['context'] = array('post', 'album', 'photos');
if(!isset($_POST['context']) || !in_array($_POST['context'], $valid['context'])) {
	_error(400);
}

try {

	// initialize the return array
	$return = array();

	// get photo
	$photo = $user->get_photo($_POST['id'], true, true, $_POST['context']);
	if(!$photo)  {
		_error(400);
	}
	/* assign variables */
	$smarty->assign('photo', $photo);
	/* return */
	$return['next'] = $photo['next'];
	$return['prev'] = $photo['prev'];
	$return['lightbox'] = $smarty->fetch("ajax.lightbox.tpl");

	// return & exit
	return_json($return);

} catch (Exception $e) {
	modal("ERROR", __("Error"), $e->getMessage());
}

?>