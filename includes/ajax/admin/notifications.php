<?php
/**
 * ajax -> admin -> notifications
 * 
 * @package Sngine
 * @author Zamblek
 */

// fetch bootstrap
require('../../../bootstrap.php');

// check AJAX Request
is_ajax();

// check admin|moderator permission
if(!$user->_is_admin) {
	modal("MESSAGE", __("System Message"), __("You don't have the right permission to access this"));
}

// handle notifications
try {

	/* valid inputs */
	if(is_empty($_POST['url'])) {
        throw new Exception(__("You must enter the notification url"));
    }
    if(is_empty($_POST['message'])) {
        throw new Exception(__("You must enter the notification message"));
    }
    /* send notification */
    $user->post_mass_notification($_POST['url'], $_POST['message']);
    /* return */
	return_json( array('success' => true, 'message' => __("Notification has been sent successfully")) );

} catch (Exception $e) {
	return_json( array('error' => true, 'message' => $e->getMessage()) );
}

?>