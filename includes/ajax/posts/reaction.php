<?php
/**
 * ajax -> posts -> reaction
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

	// initialize the return array
	$return = array();

	switch ($_POST['do']) {
		case 'delete_post':
			// delete post
			$refresh = $user->delete_post($_POST['id']);
			if($refresh) {
				/* return */
				$return['refresh'] = true;
			}
			break;

		case 'approve_post':
			// approve post
			$user->approve_post($_POST['id']);
			break;

		case 'sold_post':
			// sold post
			$user->sold_post($_POST['id']);
			break;

		case 'unsold_post':
			// unsold post
			$user->unsold_post($_POST['id']);
			break;

		case 'save_post':
			// save post
			$user->save_post($_POST['id']);
			break;

		case 'unsave_post':
			// unsave post
			$user->unsave_post($_POST['id']);
			break;

		case 'boost_post':
			// boost post
			$user->boost_post($_POST['id']);
			break;

		case 'unboost_post':
			// unboost post
			$user->unboost_post($_POST['id']);
			break;

		case 'pin_post':
			// pin post
			$user->pin_post($_POST['id']);
			break;

		case 'unpin_post':
			// unpin post
			$user->unpin_post($_POST['id']);
			break;

		case 'react_post':
			// react post
			$user->react_post($_POST['id'], $_POST['reaction']);
			break;

		case 'unreact_post':
			// unreact post
			$user->unreact_post($_POST['id'], $_POST['reaction']);
			break;

		case 'react_photo':
			// react photo
			$user->react_photo($_POST['id'], $_POST['reaction']);
			break;

		case 'unreact_photo':
			// unreact photo
			$user->unreact_photo($_POST['id'], $_POST['reaction']);
			break;

		case 'hide_post':
			// hide post
			$user->hide_post($_POST['id']);
			break;

		case 'unhide_post':
			// unhide post
			$user->unhide_post($_POST['id']);
			break;

		case 'allow_post':
			// allow post on timelinw
			$user->allow_post($_POST['id']);
			break;

		case 'disallow_post':
			// disallow post from timeline
			$user->disallow_post($_POST['id']);
			break;

		case 'disable_comments':
			// disable post comments
			$user->disable_post_comments($_POST['id']);
			break;

		case 'enable_comments':
			// enable post comments
			$user->enable_post_comments($_POST['id']);
			break;

		case 'delete_comment':
			// delete comment
			$user->delete_comment($_POST['id']);
			break;

		case 'react_comment':
			// react comment
			$user->react_comment($_POST['id'], $_POST['reaction']);
			break;

		case 'unreact_comment':
			// unreact comment
			$user->unreact_comment($_POST['id'], $_POST['reaction']);
			break;

		case 'add_vote':
			// add vote
			$user->add_vote($_POST['id']);
			break;

		case 'delete_vote':
			// delete vote
			$user->delete_vote($_POST['id']);
			break;

		case 'change_vote':
			// valid inputs
			if(!isset($_POST['checked_id']) || !is_numeric($_POST['checked_id'])) {
				_error(400);
			}

			// change vote
			$user->change_vote($_POST['id'], $_POST['checked_id']);
			break;

		case 'hide_announcement':
			$user->hide_announcement($_POST['id']);
			break;

		case 'hide_daytime_message':
			// hide daytime message
			$secured = (get_system_protocol() == "https")? true : false;
			$expire = time()+21600; /* expire after 6 hours */
			setcookie('dt_msg', 'true', $expire, '/', "", $secured, true);
			break;

		case 'update_video_views':
			// update media views (video)
			$user->update_media_views('video', $_POST['id']);
			break;

		case 'update_audio_views':
			// update media views (audio)
			$user->update_media_views('audio', $_POST['id']);
			break;
	}

	// return & exit
	return_json($return);

} catch (Exception $e) {
	modal("ERROR", __("Error"), $e->getMessage());
}

?>