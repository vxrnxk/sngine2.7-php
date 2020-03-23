<?php
/**
 * ajax -> data -> mention
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
if(!isset($_GET['term'])) {
	_error(400);
}

try {

	// get users
	$users = $user->get_users($_GET['term'], [], true);

	// return & exit
	return_json($users);

} catch (Exception $e) {
	modal("ERROR", __("Error"), $e->getMessage());
}

?>