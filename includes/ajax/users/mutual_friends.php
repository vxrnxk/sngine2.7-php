<?php
/**
 * ajax -> users -> mutual friends
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
if(!isset($_GET['uid']) || !is_numeric($_GET['uid'])) {
	_error(400);
}

try {

	// initialize the return array
	$return = array();

	// get mutual friends
	$mutual_friends = $user->get_mutual_friends($_GET['uid']);
	/* assign variables */
	$smarty->assign('uid', $_GET['uid']);
	$smarty->assign('mutual_friends', $mutual_friends);
	/* return */
	$return['mutual_friends'] = $smarty->fetch("ajax.mutual_friends.tpl");
	$return['callback'] = "$('#modal').modal('show'); $('.modal-content:last').html(response.mutual_friends);";

	// return & exit
	return_json($return);

} catch (Exception $e) {
	modal("ERROR", __("Error"), $e->getMessage());
}


?>