<?php
/**
 * ajax -> core -> contact
 * 
 * @package Sngine
 * @author Zamblek
 */

// fetch bootstrap
require('../../../bootstrap.php');

// check AJAX Request
is_ajax();

try {

	// valid inputs
    if(is_empty($_POST['name']) || is_empty($_POST['email']) || is_empty($_POST['subject']) || is_empty($_POST['message']) ) {
        throw new Exception(__("You must fill in all of the fields"));
    }
    if(!valid_email($_POST['email'])) {
        throw new Exception(__("Please enter a valid email address"));
    }
    /* check reCAPTCHA */
    if($system['reCAPTCHA_enabled']) {
    	require_once(ABSPATH.'includes/libs/ReCaptcha/autoload.php');
    	$recaptcha = new \ReCaptcha\ReCaptcha($system['reCAPTCHA_secret_key']);
    	$resp = $recaptcha->verify($_POST['g-recaptcha-response'], get_user_ip());
    	if (!$resp->isSuccess()) {
    		throw new Exception(__("The security check is incorrect. Please try again"));
    	}
    }

	// prepare email
    $subject = "New email message from ".$system['system_title'];
    $body  = "Hi Admin, \r\n\r\n";
    $body .= "You have a new email message \r\n\r\n";
    $body .= "Email Subject: \r\n".$_POST['subject']."\r\n\r\n";
    $body .= "Email Message: \r\n".$_POST['message']."\r\n\r\n";
    $body .= "Sender Name: \r\n".$_POST['name']."\r\n\r\n";
    $body .= "Sender Email: \r\n".$_POST['email']."\r\n\r\n";
   	
    // send email
    if(!_email($system['system_email'], $subject, $body)) {
        throw new Exception(__("Your email could not be sent. Please try again later"));
    }

    // return
    return_json( array('success' => true, 'message' => __("Your message has been sent! Thanks a lot and will be back to you soon")) );

} catch (Exception $e) {
	return_json( array('error' => true, 'message' => $e->getMessage()) );
}

?>