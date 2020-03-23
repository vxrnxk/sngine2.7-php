<?php
/**
 * pages
 * 
 * @package Sngine
 * @author Zamblek
 */

// fetch bootloader
require('bootloader.php');

// user access
user_access();

try {

	// get view content
	switch ($_GET['view']) {
		case '':
			// page header
			page_header(__("Discover Pages"));
			
			// get new pages
			$pages = $user->get_pages(array('suggested' => true));
			/* assign variables */
			$smarty->assign('pages', $pages);
			$smarty->assign('get', "suggested_pages");

			break;
		
		case 'liked':
			// page header
			page_header(__("Liked Pages"));
			
			// get liked pages
			$pages = $user->get_pages( array('user_id' => $user->_data['user_id']) );
			/* assign variables */
			$smarty->assign('pages', $pages);
			$smarty->assign('get', "liked_pages");

			break;

		case 'manage':
			// page header
			page_header(__("Your Pages"));
			
			// get managed pages
			$pages = $user->get_pages();
			/* assign variables */
			$smarty->assign('pages', $pages);
			$smarty->assign('get', "pages");

			break;

		default:
			_error(404);
			break;
	}
	/* assign variables */
	$smarty->assign('view', $_GET['view']);

	// get custom fields
	$smarty->assign('custom_fields', $user->get_custom_fields( array("for" => "page") ));

	// get pages categories
	$categories = $user->get_pages_categories();
	/* assign variables */
	$smarty->assign('categories', $categories);
	
} catch (Exception $e) {
	_error(__("Error"), $e->getMessage());
}

// page footer
page_footer("pages");

?>