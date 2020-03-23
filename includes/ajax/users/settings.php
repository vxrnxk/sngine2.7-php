<?php
/**
 * ajax -> users -> settings
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

try {

	switch ($_GET['edit']) {
		case 'account':
			// change settings
			$user->settings($_GET['edit'], $_POST);

			// return
			return_json( array('success' => true, 'message' => __("Your account settings has been updated")) );
			break;

		case 'basic':
			// valid inputs
			if(!isset($_POST['firstname']) || !isset($_POST['lastname']) || !isset($_POST['gender']) || !isset($_POST['birth_month']) || !isset($_POST['birth_day']) || !isset($_POST['birth_year']) || !isset($_POST['relationship'])  || !isset($_POST['biography'])  || !isset($_POST['website'])  ) {
				_error(400);
			}

			// change settings
			$user->settings($_GET['edit'], $_POST);

			// return
			return_json( array('success' => true, 'message' => __("Your profile info has been updated")) );
			break;

		case 'work':
			// valid inputs
			if(!isset($_POST['work_title']) || !isset($_POST['work_place']) ) {
				_error(400);
			}

			// change settings
			$user->settings($_GET['edit'], $_POST);
			
			// return
			return_json( array('success' => true, 'message' => __("Your profile info has been updated")) );
			break;

		case 'location':
			// valid inputs
			if(!isset($_POST['city']) || !isset($_POST['hometown']) ) {
				_error(400);
			}
			
			// change settings
			$user->settings($_GET['edit'], $_POST);

			// return
			return_json( array('success' => true, 'message' => __("Your profile info has been updated")) );
			break;

		case 'education':
			// valid inputs
			if(!isset($_POST['edu_major']) || !isset($_POST['edu_school']) || !isset($_POST['edu_class'])) {
				_error(400);
			}
			
			// change settings
			$user->settings($_GET['edit'], $_POST);
			
			// return
			return_json( array('success' => true, 'message' => __("Your profile info has been updated")) );
			break;

		case 'other':
			// change settings
			$user->settings($_GET['edit'], $_POST);
			
			// return
			return_json( array('success' => true, 'message' => __("Your profile info has have been updated")) );
			break;

		case 'social':
			// valid inputs
			if(!isset($_POST['facebook']) || !isset($_POST['twitter']) || !isset($_POST['youtube']) || !isset($_POST['instagram']) || !isset($_POST['linkedin']) || !isset($_POST['vkontakte'])) {
				_error(400);
			}
			
			// change settings
			$user->settings($_GET['edit'], $_POST);
			
			// return
			return_json( array('success' => true, 'message' => __("Your profile info has been updated")) );
			break;

		case 'design':
			// valid inputs
			if(!isset($_POST['user_profile_background'])) {
				_error(400);
			}
			
			// change settings
			$user->settings($_GET['edit'], $_POST);
			
			// return
			return_json( array('success' => true, 'message' => __("Your profile info has have been updated")) );
			break;

		case 'password':
			// valid inputs
			if(!isset($_POST['current']) || !isset($_POST['new']) || !isset($_POST['confirm']) ) {
				_error(400);
			}
			
			// change settings
			$user->settings($_GET['edit'], $_POST);
			
			// return
			return_json( array('success' => true, 'message' => __("Your password has been updated")) );
			break;

		case 'two-factor':
			// change settings
			$user->settings($_GET['edit'], $_POST);
			
			// return
			return_json( array('success' => true, 'message' => __("Your two-factor authentication settings have been updated")) );
			break;

		case 'privacy':
			// change settings
			$user->settings($_GET['edit'], $_POST);
			
			// return
			return_json( array('success' => true, 'message' => __("Your privacy settings have been updated")) );
			break;

		case 'notifications':
			// change settings
			$user->settings($_GET['edit'], $_POST);
			
			// return
			return_json( array('success' => true, 'message' => __("Your notifications settings have been updated")) );
			break;

		case 'notifications_sound':
			// valid inputs
			if(!isset($_GET['notifications_sound'])) {
				_error(400);
			}
			
			// change settings
			$user->settings($_GET['edit'], $_GET);
			
			// return
			return_json();
			break;

		case 'chat':
			// valid inputs
			if(!isset($_GET['privacy_chat'])) {
				_error(400);
			}
			
			// change settings
			$user->settings($_GET['edit'], $_GET);
			
			// return
			return_json( array('success' => true, 'message' => __("Your privacy settings have been updated")) );
			break;

		case 'clear_search_log':
			$user->clear_search_log();
			
			// return
			return_json();
			break;

		default:
			_error(400);
			break;
	}

} catch (Exception $e) {
	return_json( array('error' => true, 'message' => $e->getMessage()) );
}

?>