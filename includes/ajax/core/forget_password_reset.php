<?php
/**
 * ajax -> core -> forget password reset
 * 
 * @package Sngine
 * @author Zamblek
 */

// fetch bootstrap
require('../../../bootstrap.php');

// check AJAX Request
is_ajax();

// check user logged in
if($user->_logged_in) {
    return_json( array('callback' => 'window.location.reload();') );
}

try {

	// forget password reset
	$user->forget_password_reset($_POST['email'], $_POST['reset_key'], $_POST['password'], $_POST['confirm']);

	// return
	modal("SUCCESS", __("Done"), __("Your password has been changed you can login now"));
	
} catch (Exception $e) {
	return_json( array('error' => true, 'message' => $e->getMessage()) );
}

?>