<?php
/**
 * ajax -> users -> gifts
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

// check if gifts enabled
if(!$system['gifts_enabled']) {
	modal("MESSAGE", __("Error"), __("This feature has been disabled by the admin"));
}

try {

	switch ($_GET['do']) {

		case 'send':
			// valid inputs
			if(!isset($_GET['uid']) || !is_numeric($_GET['uid'])) {
				_error(400);
			}
			if(!isset($_POST['gift']) || !is_numeric($_POST['gift'])) {
				throw new Exception(__("You have to select a gift to send"));
			}

			// send gift
			$user->send_gift($_GET['uid'], $_POST['gift']);
			
			// return
			modal("SUCCESS", __("Success"),  __("Your gift has been sent successfully"));
			break;

		default:
			_error(400);
			break;
	}

} catch (Exception $e) {
	return_json( array('error' => true, 'message' => $e->getMessage()) );
}

?>