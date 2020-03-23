<?php
/**
 * ajax -> core -> signin
 * 
 * @package Sngine
 * @author Zamblek
 */

// set override_shutdown
$override_shutdown = true;

// fetch bootstrap
require('../../../bootstrap.php');

// check AJAX Request
is_ajax();

// check user logged in
if($user->_logged_in) {
    return_json( array('callback' => 'window.location.reload();') );
}

try {

	// signin
	$remember = (isset($_POST['remember'])) ? true : false;
	$user->sign_in($_POST['username_email'], $_POST['password'], $remember);

	// return
	return_json( array('callback' => 'window.location.reload();') );
	
} catch (Exception $e) {
	return_json( array('error' => true, 'message' => $e->getMessage()) );
}

?>