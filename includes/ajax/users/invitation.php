<?php
/**
 * ajax -> users -> invitation
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

// check if invitation widget enabled
if(!$system['invitation_widget_enabled']) {
	modal("MESSAGE", __("Error"), __("This feature has been disabled by the admin"));
}

try {

	// invitation
	$user->send_invitation_email($_POST['email']);

	// return
	return_json( array('success' => true, 'message' => __("Your invitation email has been sent")) );

} catch (Exception $e) {
	return_json( array('error' => true, 'message' => $e->getMessage()) );
}

?>