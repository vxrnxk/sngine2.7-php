<?php
/**
 * ajax -> posts -> who votes
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
if(!isset($_GET['option_id']) || !is_numeric($_GET['option_id'])) {
	_error(400);
}

try {

	// initialize the return array
	$return = array();

	// get votes
	$users = $user->who_votes($_GET['option_id']);
	/* assign variables */
	$smarty->assign('users', $users);
	$smarty->assign('id', $_GET['option_id']);
	/* return */
	$return['template'] = $smarty->fetch("ajax.who_votes.tpl");
	$return['callback'] = "$('#modal').modal('show'); $('.modal-content:last').html(response.template);";

	// return & exit
	return_json($return);

} catch (Exception $e) {
	modal("ERROR", __("Error"), $e->getMessage());
}


?>