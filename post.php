<?php
/**
 * post
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

// valid inputs
if(!isset($_GET['post_id']) || !is_numeric($_GET['post_id'])) {
	_error(404);
}

try {

	// get post
	$post = $user->get_post($_GET['post_id']);
	if(!$post)  {
		_error(404);
	}
	/* assign variables */
	$smarty->assign('post', $post);

	// get ads campaigns
	$ads_campaigns = $user->ads_campaigns();
	/* assign variables */
	$smarty->assign('ads_campaigns', $ads_campaigns);

	// get ads
	$ads = $user->ads('post');
	/* assign variables */
	$smarty->assign('ads', $ads);

	// get widgets
	$widgets = $user->widgets('post');
	/* assign variables */
	$smarty->assign('widgets', $widgets);

} catch (Exception $e) {
	_error(__("Error"), $e->getMessage());
}

// page header
page_header($post['og_title'], $post['og_description'], $post['og_image']);

// page footer
page_footer("post");

?>