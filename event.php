<?php
/**
 * event
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

// check event id
if(is_empty($_GET['event_id'])) {
	_error(404);
}

try {

	// [1] get main event info
	$get_event = $db->query(sprintf("SELECT `events`.*, cover_photo.source as event_cover_full, users.user_name, users.user_firstname, users.user_lastname, events_categories.category_name as event_category_name FROM `events` LEFT JOIN posts_photos as cover_photo ON `events`.event_cover_id = cover_photo.photo_id LEFT JOIN events_categories ON `events`.event_category = events_categories.category_id INNER JOIN users ON `events`.event_admin = users.user_id  WHERE `events`.event_id = %s", secure($_GET['event_id']) )) or _error("SQL_ERROR_THROWEN");
	if($get_event->num_rows == 0) {
		_error(404);
	}
	$event = $get_event->fetch_assoc();
	/* get event cover */
	$event['event_cover'] = ($event['event_cover'])? $system['system_uploads'].'/'.$event['event_cover'] : $event['event_cover'];
	$event['event_cover_full'] = ($event['event_cover_full'])? $system['system_uploads'].'/'.$event['event_cover_full'] : $event['event_cover_full'];
	/* check group category */
	$event['event_category_name'] = (!$event['event_category_name'])? __('N/A'): $event['event_category_name']; /* in case deleted by system admin */
	/* get the connection */
	$event['i_admin'] = $user->check_event_adminship($user->_data['user_id'], $event['event_id']);
	$event['i_joined'] = $user->check_event_membership($user->_data['user_id'], $event['event_id']);

	// [2] get view content
	/* check event privacy */
	if($event['event_privacy'] == "secret") {
		if(!$event['i_joined'] && !$event['i_admin']) {
			if($user->_data['user_group'] != '1') {
				_error(404);
			}
		}
	}
	if($event['event_privacy'] == "closed") {
		if(!$event['i_joined'] && !$event['i_admin']) {
			if($user->_data['user_group'] != '1') {
				$_GET['view'] = 'about';
			}
		}
			
	}
	switch ($_GET['view']) {
		case '':
			/* get custom fields */
			$smarty->assign('custom_fields', $user->get_custom_fields( array("for" => "event", "get" => "profile", "node_id" => $event['event_id']) ));

			/* get invites */
			$event['invites'] = $user->get_event_invites($event['event_id']);

			/* get photos */
			$event['photos'] = $user->get_photos($event['event_id'], 'event');

			/* get [pending] event posts */
			if($event['event_publish_approval_enabled']) {
				$get_all = ($event['i_admin'])? true : false;
				$event['pending_posts'] = $user->get_event_pending_posts($event['event_id'], $get_all);
			}

			/* prepare publisher */
			$smarty->assign('feelings', get_feelings());
			$smarty->assign('feelings_types', get_feelings_types());
			if($system['colored_posts_enabled']) {
				$smarty->assign('colored_patterns', $user->get_posts_colored_patterns());
			}

			/* get pinned post */
			$pinned_post = $user->get_post($event['event_pinned_post']);
			$smarty->assign('pinned_post', $pinned_post);

			/* get posts */
			if(isset($_GET['pending'])) {
				$get = ($event['i_admin'])? "posts_event_pending_all" : "posts_event_pending";
			} else {
				$get = "posts_event";
			}
			$posts = $user->get_posts( array('get' => $get, 'id' => $event['event_id']) );
			/* assign variables */
			$smarty->assign('posts', $posts);
			$smarty->assign('get', $get);
			break;

		case 'photos':
			/* get photos */
			$event['photos'] = $user->get_photos($event['event_id'], 'event');
			break;

		case 'albums':
			/* get albums */
			$event['albums'] = $user->get_albums($event['event_id'], 'event');
			break;

		case 'album':
			/* get album */
			$album = $user->get_album($_GET['id']);
			if(!$album || ($album['event_id'] != $event['event_id']) ) {
				_error(404);
			}
			/* assign variables */
			$smarty->assign('album', $album);
			break;

		case 'videos':
			/* get videos */
			$event['videos'] = $user->get_videos($event['event_id'], 'event');
			break;

		case 'going':
			/* get going members */
			if($event['event_going'] > 0) {
				$event['members'] = $user->get_event_members($event['event_id'], 'going');
			}
			$event['total_members'] = $event['event_going'];
			break;

		case 'interested':
			/* get interested members */
			if($event['event_interested'] > 0) {
				$event['members'] = $user->get_event_members($event['event_id'], 'interested');
			}
			$event['total_members'] = $event['event_interested'];
			break;

		case 'invited':
			/* get invited members */
			if($event['event_invited'] > 0) {
				$event['members'] = $user->get_event_members($event['event_id'], 'invited');
			}
			$event['total_members'] = $event['event_invited'];
			break;

		case 'invites':
			/* check if the viewer is a event member */
			if(!$event['i_joined']) {
				_error(404);
			}
			/* get invites */
			$event['members'] = $user->get_event_invites($event['event_id']);
			$event['total_members'] = count($event['members']);
			break;

		case 'settings':
			/* check if the viewer is the admin */
			if(!$event['i_admin']) {
				_error(404);
			}

			/* get sub_view content */
			$sub_view = $_GET['id'];
			switch ($sub_view) {
				case '':
					/* get custom fields */
					$smarty->assign('custom_fields', $user->get_custom_fields( array("for" => "event", "get" => "settings", "node_id" => $event['event_id']) ));

					/* get events categories */
					$categories = $user->get_events_categories();
					/* assign variables */
					$smarty->assign('categories', $categories);
					break;

				case 'delete':
					break;
				
				default:
					_error(404);
					break;
			}
			/* assign variables */
			$smarty->assign('sub_view', $sub_view);

			break;

		case 'about':
			/* check if the viewer is a event member */
			if($event['i_joined']) {
				_error(404);
			}
			break;
		
		default:
			_error(404);
			break;
	}

	// recent rearches
	if(isset($_GET['ref']) && $_GET['ref'] == "qs") {
		$user->set_search_log($event['event_id'], 'event');
	}

} catch (Exception $e) {
	_error(__("Error"), $e->getMessage());
}

// page header
page_header($event['event_title'], $event['event_description'], $event['event_cover']);

// assign variables
$smarty->assign('event', $event);
$smarty->assign('view', $_GET['view']);

// page footer
page_footer("event");

?>