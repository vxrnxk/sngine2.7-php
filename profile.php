<?php
/**
 * profile
 * 
 * @package Sngine
 * @author Zamblek
 */

// fetch bootloader
require('bootloader.php');

// user access
if(!$system['system_public']) {
	user_access();
}

// check username
if(is_empty($_GET['username']) || !valid_username($_GET['username'])) {
	_error(404);
}

try {

	// [1] get main profile info
	$get_profile = $db->query(sprintf("SELECT users.*, picture_photo.source as user_picture_full, picture_photo_post.privacy as user_picture_privacy, cover_photo.source as user_cover_full, cover_photo_post.privacy as cover_photo_privacy, packages.name as package_name, packages.color as package_color FROM users LEFT JOIN posts_photos as picture_photo ON users.user_picture_id = picture_photo.photo_id LEFT JOIN posts as picture_photo_post ON picture_photo.post_id = picture_photo_post.post_id LEFT JOIN posts_photos as cover_photo ON users.user_cover_id = cover_photo.photo_id LEFT JOIN posts as cover_photo_post ON cover_photo.post_id = cover_photo_post.post_id LEFT JOIN packages ON users.user_subscribed = '1' AND users.user_package = packages.package_id WHERE users.user_name = %s", secure($_GET['username']))) or _error("SQL_ERROR_THROWEN");
	if($get_profile->num_rows == 0) {
		_error(404);
	}
	$profile = $get_profile->fetch_assoc();
	/* check if banned by the system */
	if($user->banned($profile['user_id'])) {
		_error(404);
	}
	/* check if blocked by the viewer */
	if($user->blocked($profile['user_id'])) {
		_error(404);
	}
	/* check username case */
	if(strtolower($_GET['username']) == strtolower($profile['user_name']) && $_GET['username'] != $profile['user_name']) {
		redirect('/'.$profile['user_name']);
	}
	/* get profile picture */
	$profile['user_picture_default'] = ($profile['user_picture'])? false : true;
	$profile['user_picture'] = get_picture($profile['user_picture'], $profile['user_gender']);
	$profile['user_picture_full'] = ($profile['user_picture_full'])? $system['system_uploads'].'/'.$profile['user_picture_full'] : $profile['user_picture_full'];
	$profile['user_picture_lightbox'] = $user->check_privacy($profile['user_picture_privacy'], $profile['user_id']);
	/* get profile cover */
	$profile['user_cover_default'] = ($profile['user_cover'])? false : true;
	$profile['user_cover'] = ($profile['user_cover'])? $system['system_uploads'].'/'.$profile['user_cover'] : $profile['user_cover'];
	$profile['user_cover_full'] = ($profile['user_cover_full'])? $system['system_uploads'].'/'.$profile['user_cover_full'] : $profile['user_cover_full'];
	$profile['user_cover_lightbox'] = $user->check_privacy($profile['cover_photo_privacy'], $profile['user_id']);
	/* get profile background */
	$profile['user_profile_background'] = ($profile['user_profile_background'])? $system['system_uploads'].'/'.$profile['user_profile_background'] : $profile['user_profile_background'];
	/* get the connection &  mutual friends */
	if($user->_logged_in && $profile['user_id'] != $user->_data['user_id']) {
		/* get the connection */
		$profile['we_friends'] = (in_array($profile['user_id'], $user->_data['friends_ids']))? true: false;
		$profile['he_request'] = (in_array($profile['user_id'], $user->_data['friend_requests_ids']))? true: false;
		$profile['i_request'] = (in_array($profile['user_id'], $user->_data['friend_requests_sent_ids']))? true: false;
		$profile['i_follow'] = (in_array($profile['user_id'], $user->_data['followings_ids']))? true: false;
		$profile['friendship_declined'] = $user->friendship_declined($profile['user_id']);
		$profile['i_poked'] = $user->poked($profile['user_id']);
		/* get mutual friends */
		$profile['mutual_friends_count'] = $user->get_mutual_friends_count($profile['user_id']);
		$profile['mutual_friends'] = $user->get_mutual_friends($profile['user_id']);
	}
	
	// [2] get view content
	switch ($_GET['view']) {
		case '':
			/* profile completion */
			if($profile['user_id'] == $user->_data['user_id']) {
				$profile['profile_completion'] = 100;
				/* [1] check profile picture */
				if($profile['user_picture_default']) {
					$profile['profile_completion'] -= 12.5;
				}
				/* [2] check profile cover */
				if($profile['user_cover_default']) {
					$profile['profile_completion'] -= 12.5;
				}
				/* [3] check biography */
				if(!$profile['user_biography']) {
					$profile['profile_completion'] -= 12.5;
				}
				/* [4] check birthdate */
				if(!$profile['user_birthdate']) {
					$profile['profile_completion'] -= 12.5;
				}
				/* [5] check relationship */
				if(!$profile['user_relationship']) {
					$profile['profile_completion'] -= 12.5;
				}
				/* [6] check work */
				if(!$profile['user_work_title'] || !$profile['user_work_place']) {
					$profile['profile_completion'] -= 12.5;
				}
				/* [7] check location */
				if(!$profile['user_current_city'] || !$profile['user_hometown']) {
					$profile['profile_completion'] -= 12.5;
				}
				/* [8] check education */
				if(!$profile['user_edu_major'] || !$profile['user_edu_school']) {
					$profile['profile_completion'] -= 12.5;
				}
			}

			/* get followers count */
			$profile['followers_count'] = count($user->get_followers_ids($profile['user_id']));

			/* get custom fields */
			$smarty->assign('custom_fields', $user->get_custom_fields( array("for" => "user", "get" => "profile", "node_id" => $profile['user_id']) ));

			/* gifts system */
			if($system['gifts_enabled']) {
				/* get gifts */
				$gifts = $user->get_gifts();
				/* assign variables */
				$smarty->assign('gifts', $gifts);

				/* get gift */
				if(isset($_GET['gift']) && is_numeric($_GET['gift'])) {
					$gift = $user->get_gift($_GET['gift']);
					/* assign variables */
					$smarty->assign('gift', $gift);
				}
			}

			/* get friends */
			$profile['friends'] = $user->get_friends($profile['user_id']);
			if(count($profile['friends']) > 0) {
				$profile['friends_count'] = count($user->get_friends_ids($profile['user_id']));
			}

			/* get photos */
			$profile['photos'] = $user->get_photos($profile['user_id']);

			/* get pages */
			$profile['pages'] = $user->get_pages( array('user_id' => $profile['user_id'], 'results' => $system['min_results_even']) );
			
			/* get groups */
			$profile['groups'] = $user->get_groups( array('user_id' => $profile['user_id'], 'results' => $system['min_results_even']) );

			/* get events */
			$profile['events'] = $user->get_events( array('user_id' => $profile['user_id'], 'results' => $system['min_results_even']) );

			/* get pinned post */
			$pinned_post = $user->get_post($profile['user_pinned_post']);
			$smarty->assign('pinned_post', $pinned_post);

			/* prepare publisher */
			$smarty->assign('feelings', get_feelings());
			$smarty->assign('feelings_types', get_feelings_types());
			if($system['colored_posts_enabled']) {
				$smarty->assign('colored_patterns', $user->get_posts_colored_patterns());
			}

			/* get posts */
			$posts = $user->get_posts( array('get' => 'posts_profile', 'id' => $profile['user_id']) );
			/* assign variables */
			$smarty->assign('posts', $posts);
			break;

		case 'friends':
			/* get friends */
			$profile['friends'] = $user->get_friends($profile['user_id']);			
			if(count($profile['friends']) > 0) {
				$profile['friends_count'] = count($user->get_friends_ids($profile['user_id']));
			}
			break;

		case 'followers':
			/* get followers count */
			$profile['followers_count'] = count($user->get_followers_ids($profile['user_id']));
			/* get followers */
			if($profile['followers_count'] > 0) {
				$profile['followers'] = $user->get_followers($profile['user_id']);
			}
			break;

		case 'followings':
			/* get followings count */
			$profile['followings_count'] = count($user->get_followings_ids($profile['user_id']));
			/* get followings */
			if($profile['followings_count'] > 0) {
				$profile['followings'] = $user->get_followings($profile['user_id']);
			}
			break;

		case 'photos':
			/* get photos */
			$profile['photos'] = $user->get_photos($profile['user_id']);
			break;

		case 'albums':
			/* get albums */
			$profile['albums'] = $user->get_albums($profile['user_id']);
			break;

		case 'album':
			/* get album */
			$album = $user->get_album($_GET['id']);
			if(!$album || $album['in_group'] || $album['user_type'] == "page" || ($album['user_type'] == "user" && $album['user_id'] != $profile['user_id'])) {
				_error(404);
			}
			/* assign variables */
			$smarty->assign('album', $album);
			break;

		case 'videos':
			/* get videos */
			$profile['videos'] = $user->get_videos($profile['user_id']);
			break;

		case 'likes':
			/* get pages */
			$profile['pages'] = $user->get_pages( array('user_id' => $profile['user_id']) );
			break;

		case 'groups':
			/* get groups */
			$profile['groups'] = $user->get_groups( array('user_id' => $profile['user_id']) );
			break;

		case 'events':
			/* get events */
			$profile['events'] = $user->get_events( array('user_id' => $profile['user_id']) );
			break;

		default:
			_error(404);
			break;
	}

	// [3] profile visit notification
	if($_GET['view'] == "" && $user->_logged_in && $system['profile_notification_enabled']) {
		$user->post_notification( array('to_user_id'=>$profile['user_id'], 'action'=>'profile_visit') );
	}

	// recent rearches
	if(isset($_GET['ref']) && $_GET['ref'] == "qs") {
		$user->set_search_log($profile['user_id'], 'user');
	}

} catch (Exception $e) {
	_error(__("Error"), $e->getMessage());
}

// page header
page_header($profile['user_firstname']." ".$profile['user_lastname'], $profile['user_biography'], $profile['user_picture']);

// assign variables
$smarty->assign('profile', $profile);
$smarty->assign('view', $_GET['view']);

// page footer
page_footer("profile");

?>