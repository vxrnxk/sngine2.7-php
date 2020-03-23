<?php
/**
 * ajax -> core -> forget password confirm
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

	// forget password confirm
	$user->forget_password_confirm($_POST['email'], $_POST['reset_key']);

	// return
	modal("#forget-password-reset", "{email: '".$_POST['email']."', reset_key: '".$_POST['reset_key']."'}");
	
} catch (Exception $e) {
	return_json( array('error' => true, 'message' => $e->getMessage()) );
}

?>