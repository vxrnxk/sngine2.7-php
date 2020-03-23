<?php
/**
 * ajax -> data -> autocomplete
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
/* if type not set */
if(!isset($_POST['type']) || !in_array($_POST['type'], array("single", "tags"))) {
	_error(400);
}
/* if query not set */
if(!isset($_POST['query'])) {
	_error(400);
}
/* if type = tags & skipped_ids not set */
if($_POST['type'] == "tags" && !isset($_POST['skipped_ids'])) {
	_error(400);
}
/* if skipped_ids not array */
if(isset($_POST['skipped_ids'])) {
	$_POST['skipped_ids'] = json_decode($_POST['skipped_ids']);
	if(!is_array($_POST['skipped_ids'])) {
		_error(400);
	}
	/* skipped_ids must contain numeric values only */
	$_POST['skipped_ids'] = array_filter($_POST['skipped_ids'], 'is_numeric');
}

try {

	// initialize the return array
	$return = array();

	// get users
	$users = $user->get_users($_POST['query'], $_POST['skipped_ids']);
	if(count($users) > 0) {
		/* assign variables */
		$smarty->assign('type', $_POST['type']);
		$smarty->assign('users', $users);
		/* return */
		$return['autocomplete'] = $smarty->fetch("ajax.autocomplete.tpl");
	}

	// return & exit
	return_json($return);

} catch (Exception $e) {
	modal("ERROR", __("Error"), $e->getMessage());
}


?>