<?php
/**
 * ajax -> admin -> invitations
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

// handle invitation
switch ($_GET['do']) {
	case 'generate':
		try {

			// initialize the return array
			$return = array();

			// get new invitation code
			$code = $user->get_invitation_code();
			/* assign variables */
			$smarty->assign('view', $_GET['do']);
			$smarty->assign('code', $code);
			/* return */
			$return['template'] = $smarty->fetch("admin.invitations.tpl");
			$return['callback'] = "$('#modal').modal('show'); $('.modal-content:last').html(response.template);";

			// return & exit
			return_json($return);

		} catch (Exception $e) {
			modal("ERROR", __("Error"), $e->getMessage());
		}
		break;

	case 'prepare_email':
		try {

			// initialize the return array
			$return = array();

			// prepare email
			/* assign variables */
			$smarty->assign('view', $_GET['do']);
			$smarty->assign('code', $_GET['code']);
			/* return */
			$return['template'] = $smarty->fetch("admin.invitations.tpl");
			$return['callback'] = "$('#modal').modal('show'); $('.modal-content:last').html(response.template);";

			// return & exit
			return_json($return);

		} catch (Exception $e) {
			modal("ERROR", __("Error"), $e->getMessage());
		}
		break;

	case 'send_email':
		try {

			// send email
			$user->send_invitation_code($_POST['code'], $_POST['email']);

			// return & exit
			return_json( array('success' => true, 'message' => __("Your invitation email has been sent")) );

		} catch (Exception $e) {
			return_json( array('error' => true, 'message' => $e->getMessage()) );
		}
		break;

	default:
		_error(400);
		break;
}

?>