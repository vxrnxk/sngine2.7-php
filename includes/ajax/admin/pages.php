<?php
/**
 * ajax -> admin -> pages
 * 
 * @package Sngine
 * @author Zamblek
 */

// fetch bootstrap
require('../../../bootstrap.php');

// check AJAX Request
is_ajax();

// check admin|moderator permission
if(!$user->_is_admin && !$user->_is_moderator) {
	modal("MESSAGE", __("System Message"), __("You don't have the right permission to access this"));
}

// handle pages
try {

	switch ($_GET['do']) {
		case 'edit_page':
			/* valid inputs */
			if(!isset($_GET['id']) || !is_numeric($_GET['id'])) {
				_error(400);
			}
			if ($_GET['edit'] != "settings" && $_GET['edit'] != "info") {
				_error(400);
			}
			/* prepare */
			if($_GET['edit'] == "settings") {
				$_POST['page_verified'] = (isset($_POST['page_verified']))? '1' : '0';
			}
			/* update */
			$user->edit_page($_GET['id'], $_GET['edit'], $_POST);
			return_json( array('success' => true, 'message' => __("Page info have been updated")) );
			break;

		case 'add_category':
			/* insert */
			$db->query(sprintf("INSERT INTO pages_categories (category_name, category_order) VALUES (%s, %s)", secure($_POST['category_name']), secure($_POST['category_order'], 'int') )) or _error("SQL_ERROR_THROWEN");
			/* return */
			return_json( array('callback' => 'window.location = "'.$system['system_url'].'/'.$control_panel['url'].'/pages/categories";') );
			break;

		case 'edit_category':
			/* valid inputs */
			if(!isset($_GET['id']) || !is_numeric($_GET['id'])) {
				_error(400);
			}
			/* update */
			$db->query(sprintf("UPDATE pages_categories SET category_name = %s, category_order = %s WHERE category_id = %s", secure($_POST['category_name']), secure($_POST['category_order'], 'int'), secure($_GET['id'], 'int') )) or _error("SQL_ERROR_THROWEN");
			/* return */
			return_json( array('success' => true, 'message' => __("Category info have been updated")) );
			break;

		default:
			_error(400);
			break;
	}

} catch (Exception $e) {
	return_json( array('error' => true, 'message' => $e->getMessage()) );
}

?>