<?php
/**
 * ajax -> admin -> developers
 * 
 * @package Sngine
 * @author Zamblek
 */

// fetch bootstrap
require('../../../bootstrap.php');

// check AJAX Request
is_ajax();

// check admin|moderator permission
if(!$user->_is_admin) {
	modal("MESSAGE", __("System Message"), __("You don't have the right permission to access this"));
}

// handle developers
try {

	switch ($_GET['do']) {
		case 'settings':
			/* prepare */
			$_POST['developers_apps_enabled'] = (isset($_POST['developers_apps_enabled']))? '1' : '0';
			$_POST['developers_share_enabled'] = (isset($_POST['developers_share_enabled']))? '1' : '0';
			/* update */
			update_system_options([ 
				'developers_apps_enabled' => secure($_POST['developers_apps_enabled']), 
				'developers_share_enabled' => secure($_POST['developers_share_enabled'])
			]);
			/* return */
			return_json( array('success' => true, 'message' => __("Developers settings have been updated")) );
			break;

		case 'add_category':
			/* insert */
			$db->query(sprintf("INSERT INTO developers_apps_categories (category_name, category_order) VALUES (%s, %s)", secure($_POST['category_name']), secure($_POST['category_order'], 'int') )) or _error("SQL_ERROR_THROWEN");
			/* return */
			return_json( array('callback' => 'window.location = "'.$system['system_url'].'/'.$control_panel['url'].'/developers/categories";') );
			break;

		case 'edit_category':
			/* valid inputs */
			if(!isset($_GET['id']) || !is_numeric($_GET['id'])) {
				_error(400);
			}
			/* update */
			$db->query(sprintf("UPDATE developers_apps_categories SET category_name = %s, category_order = %s WHERE category_id = %s", secure($_POST['category_name']), secure($_POST['category_order'], 'int'), secure($_GET['id'], 'int') )) or _error("SQL_ERROR_THROWEN");
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