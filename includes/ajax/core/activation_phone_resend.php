<?php
/**
 * ajax -> core -> activation phone resend
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

	// activation phone resend
	$user->activation_phone_resend();

	// return
	modal("SUCCESS", __("Another SMS has been sent"), __("Please check your phone and copy the verification code to complete the verification process"));
	
} catch (Exception $e) {
	modal("ERROR", __("Error"), $e->getMessage());
}

?>