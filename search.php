<?php
/**
 * search
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

try {

	// search
	if(isset($_GET['query'])) {
		/* get results */
		$results = $user->search($_GET['query']);
		/* assign variables */
		$smarty->assign('query', $_GET['query']);
		$smarty->assign('results', $results);
		$smarty->assign('results_num', count($results));
	}

	// get ads campaigns
	$ads_campaigns = $user->ads_campaigns();
	/* assign variables */
	$smarty->assign('ads_campaigns', $ads_campaigns);

	// get ads
	$ads = $user->ads('search');
	/* assign variables */
	$smarty->assign('ads', $ads);

	// get widgets
	$widgets = $user->widgets('search');
	/* assign variables */
	$smarty->assign('widgets', $widgets);

} catch (Exception $e) {
	_error(__("Error"), $e->getMessage());
}

// page header
page_header($system['system_title'].' - '.__("Search"));

// page footer
page_footer("search");

?>