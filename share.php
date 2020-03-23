<?php
/**
 * share
 * 
 * @package Sngine
 * @author Zamblek
 */

// fetch bootloader
require('bootloader.php');

// check if developers (share plugin) enabled
if(!$system['developers_share_enabled']) {
    _error(404);
}

// user access
user_access();

try {

	// prepare publisher
	$smarty->assign('feelings', get_feelings());
	$smarty->assign('feelings_types', get_feelings_types());
	if($system['colored_posts_enabled']) {
		$smarty->assign('colored_patterns', $user->get_posts_colored_patterns());
	}
	$smarty->assign('url', $_GET['url']);

} catch (Exception $e) {
	_error(__("Error"), $e->getMessage());
}

// page header
page_header($system['system_title']);

// page footer
page_footer("share");

?>