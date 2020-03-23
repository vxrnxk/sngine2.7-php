<?php
/**
 * ajax -> admin -> referrals
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

// valid inputs
if(!isset($_GET['user_id']) || !is_numeric($_GET['user_id'])) {
	_error(400);
}

// handle referrals
try {

	// initialize the return array
	$return = array();

	// get referrals
	$users = $user->get_affiliates($_GET['user_id']);
	$id = $_GET['user_id'];
	/* assign variables */
	$smarty->assign('users', $users);
	$smarty->assign('id', $id);
	/* return */
	$return['template'] = $smarty->fetch("ajax.who_referred.tpl");
	$return['callback'] = "$('#modal').modal('show'); $('.modal-content:last').html(response.template);";

	// return & exit
	return_json($return);

} catch (Exception $e) {
	modal("ERROR", __("Error"), $e->getMessage());
}


?>