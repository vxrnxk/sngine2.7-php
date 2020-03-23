<?php
/**
 * packages
 * 
 * @package Sngine
 * @author Zamblek
 */

// fetch bootloader
require('bootloader.php');

// check if packages enabled
if(!$system['packages_enabled']) {
    _error(404);
}

// page header
page_header($system['system_title']." &rsaquo; ".__("Packages"));

try {

	// get packages
	$packages = $user->get_packages();
	/* assign variables */
	$smarty->assign('packages', $packages);
	$smarty->assign('packages_count', count($packages));

	// get countries (for 2checkout billing address)
	if($system['2checkout_enabled']) {
		$countries = $user->get_countries();
		/* assign variables */
		$smarty->assign('countries', $countries);
	}

} catch (Exception $e) {
	_error(__("Error"), $e->getMessage());
}

// page footer
page_footer("packages");

?>