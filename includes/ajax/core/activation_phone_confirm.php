<?php
/**
 * ajax -> core -> activation phone confirm
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

try {

	// activation phone confirm
	$user->activation_phone($_POST['token']);

	// return
	return_json( array('callback' => 'window.location.reload();') );
	
} catch (Exception $e) {
	return_json( array('error' => true, 'message' => $e->getMessage()) );
}

?>