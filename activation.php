<?php
/**
 * activation
 * 
 * @package Sngine
 * @author Zamblek
 */

// fetch bootstrap
require('bootstrap.php');

// valid inputs
if(!isset($_GET['user_id']) && !isset($_GET['code'])) {
	_error(404);
}

try {

	// activation
	$user->activation_email($_GET['user_id'], $_GET['code']);
	redirect();

} catch (Exception $e) {
	_error(__("Error"), $e->getMessage());
}

?>