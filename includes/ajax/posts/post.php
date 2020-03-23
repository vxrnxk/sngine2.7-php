<?php
/**
 * ajax -> posts -> post
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
if(!in_array($_POST['handle'], array('me', 'user', 'page', 'group', 'event'))) {
	_error(400);
}
/* filter link */
if(isset($_POST['link'])) {
	$_POST['link'] = json_decode($_POST['link']);
	if(!is_object($_POST['link'])) {
		_error(400);
	}
}
/* filter photos */
$photos = array();
if(isset($_POST['photos'])) {
	$_POST['photos'] = json_decode($_POST['photos']);
	if(!is_object($_POST['photos'])) {
		_error(400);
	}
	/* filter the photos */
	foreach($_POST['photos'] as $photo) {
		$photos[] = (array) $photo;
	}
	if(count($photos) == 0) {
		_error(400);
	}
}
/* filter poll options */
if(isset($_POST['poll_options'])) {
	$_POST['poll_options'] = json_decode($_POST['poll_options']);
	if(!is_array($_POST['poll_options'])) {
		_error(400);
	}
	/* check the options */
	$options = array();
	foreach($_POST['poll_options'] as $option) {
		if(strlen($option) > 255) {
			modal("MESSAGE", __("Poll option too long"), __("The poll option you provided is too long. Please try again"));
		}
		if(in_array($option, $options)) {
			modal("MESSAGE", __("Poll Option Already Added"), __("This option was already added to the poll"));
		}
		if(!is_empty($option)) {
			$options[] = $option;
		}
	}
	/* check the question */
	if(is_empty($_POST['message'])) {
		modal("MESSAGE", __("Poll Text Needed"), __("Ask a question so people know what your poll is about"));
	}
}
/* filter video */
if(isset($_POST['video'])) {
	$_POST['video'] = json_decode($_POST['video']);
	if(!is_object($_POST['video'])) {
		_error(400);
	}
}
/* filter audio */
if(isset($_POST['audio'])) {
	$_POST['audio'] = json_decode($_POST['audio']);
	if(!is_object($_POST['audio'])) {
		_error(400);
	}
}
/* filter file */
if(isset($_POST['file'])) {
	$_POST['file'] = json_decode($_POST['file']);
	if(!is_object($_POST['file'])) {
		_error(400);
	}
}

try {

	// initialize the return array
	$return = $inputs = array();
	
	// publisher
	/* valid inputs */
	if($_POST['handle'] == 'user') {
		if(!isset($_POST['id']) || !is_numeric($_POST['id'])) {
			_error(400);
		}
		$inputs['id'] = $_POST['id'];
		/* if privacy set and not valid */
		if(!isset($_POST['privacy']) || !in_array($_POST['privacy'], array('friends', 'public'))) {
			_error(400);
		}
		$inputs['privacy'] = $_POST['privacy'];
		$_get = 'posts_profile';

	} elseif ($_POST['handle'] == 'page') {
		if(!isset($_POST['id']) || !is_numeric($_POST['id'])) {
			_error(400);
		}
		$inputs['id'] = $_POST['id'];
		$inputs['privacy'] = 'public';
		$_get = 'posts_page';
		
	} elseif ($_POST['handle'] == 'group') {
		if(!isset($_POST['id']) || !is_numeric($_POST['id'])) {
			_error(400);
		}
		$inputs['id'] = $_POST['id'];
		$inputs['privacy'] = 'custom';
		$_get = 'posts_group';

	} elseif ($_POST['handle'] == 'event') {
		if(!isset($_POST['id']) || !is_numeric($_POST['id'])) {
			_error(400);
		}
		$inputs['id'] = $_POST['id'];
		$inputs['privacy'] = 'custom';
		$_get = 'posts_event';

	} else {
		/* if privacy set and not valid */
		if(!isset($_POST['privacy']) || !in_array($_POST['privacy'], array('me', 'friends', 'public'))) {
			_error(400);
		}
		$inputs['privacy'] = $_POST['privacy'];
		$_get = 'newfeed';

	}
	/* prepare inputs */
	$inputs['handle'] = $_POST['handle'];
	$inputs['message'] = $_POST['message'];
	$inputs['link'] = $_POST['link'];
	$inputs['photos'] = $photos;
	$inputs['album'] = $_POST['album'];
	$inputs['location'] = $_POST['location'];
	$inputs['feeling_action'] = $_POST['feeling_action'];
	$inputs['feeling_value'] = $_POST['feeling_value'];
	$inputs['colored_pattern'] = $_POST['colored_pattern'];
	$inputs['poll_options'] = $options;
	$inputs['video'] = $_POST['video'];
	$inputs['video_thumbnail'] = $_POST['video_thumbnail'];
	$inputs['audio'] = $_POST['audio'];
	$inputs['file'] = $_POST['file'];
	/* publish */
	$post = $user->publisher($inputs);
	/* assign variables */
	$smarty->assign('post', $post);
	$smarty->assign('_get', $_get);
	/* return */
	$return['post'] = $smarty->fetch("__feeds_post.tpl");

	// return & exit
	return_json($return);
	
} catch (Exception $e) {
	modal("ERROR", __("Error"), $e->getMessage());
}

?>