<?php
/**
 * ajax -> core -> social signup
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

// check if registration is closed
if(!$system['registration_enabled'] && !$system['invitation_enabled']) {
	return_json( array('error' => true, 'message' => __('Registration is closed right now')) );
}

try {

	// signup
    $user->socail_register($_POST['first_name'], $_POST['last_name'], $_POST['username'], $_POST['email'], $_POST['password'], $_POST['gender'], $_POST['newsletter_agree'], $_POST['privacy_agree'], $_POST['avatar'], $_POST['provider'], $_POST['invitation_code']);

    // return
    return_json( array('callback' => 'window.location = site_path;') );

} catch (Exception $e) {
	return_json( array('error' => true, 'message' => $e->getMessage()) );
}

?>