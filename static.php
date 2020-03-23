<?php
/**
 * static
 * 
 * @package Sngine
 * @author Zamblek
 */

// fetch bootloader
require('bootloader.php');

// valid inputs
if(!isset($_GET['url'])) {
	_error(404);
}

try {

	// get static page
	$get_static = $db->query(sprintf("SELECT * FROM static_pages WHERE page_url = %s", secure($_GET['url']) )) or _error("SQL_ERROR_THROWEN");
	if($get_static->num_rows == 0) {
		_error(404);
	}
	$static = $get_static->fetch_assoc();
	$static['page_text'] = html_entity_decode($static['page_text'], ENT_QUOTES);
	$static['page_text'] = $smarty->fetch('string:'.$static['page_text']);
	/* assign variables */
	$smarty->assign('static', $static);

} catch (Exception $e) {
	_error(__("Error"), $e->getMessage());
}

// page header
page_header($system['system_title'].' - '.$static['page_title']);

// page footer
page_footer("static");

?>