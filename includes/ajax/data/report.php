<?php
/**
 * ajax -> data -> report
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

// valid inputs
if(!isset($_POST['id']) || !is_numeric($_POST['id'])) {
	_error(400);
}

try {

	// report
	$user->report($_POST['id'], $_POST['handle']);
	
	// return & exit
	modal("SUCCESS", __("Thanks"), __("Your report has been submitted"));

} catch (Exception $e) {
	modal("ERROR", __("Error"), $e->getMessage());
}

?>