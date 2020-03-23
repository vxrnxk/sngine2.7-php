<?php
/**
 * ajax -> core -> two factor authentication
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

	// two factor authentication
	$remember = (isset($_POST['remember'])) ? true : false;
	$user->two_factor_authentication($_POST['two_factor_key'], $_POST['user_id'], $_POST['remember']);
	
	// return
	return_json( array('callback' => 'window.location.reload();') );
	
} catch (Exception $e) {
	return_json( array('error' => true, 'message' => $e->getMessage()) );
}

?>