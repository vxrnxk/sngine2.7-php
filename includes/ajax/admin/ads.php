<?php
/**
 * ajax -> admin -> ads
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

// handle ads
try {

	switch ($_GET['do']) {
		case 'settings':
			/* prepare */
			$_POST['ads_enabled'] = (isset($_POST['ads_enabled']))? '1' : '0';
			/* update */
			update_system_options([ 
				'ads_enabled' => secure($_POST['ads_enabled']), 
				'ads_cost_view' => secure($_POST['ads_cost_view']), 
				'ads_cost_click' => secure($_POST['ads_cost_click']) 
			]);
			/* return */
			return_json( array('success' => true, 'message' => __("Ads settings have been updated")) );
			break;

		case 'edit':
			/* valid inputs */
			if(!isset($_GET['id']) || !is_numeric($_GET['id'])) {
				_error(400);
			}
			/* update */
			$db->query(sprintf("UPDATE ads_system SET title = %s, place = %s, code = %s WHERE ads_id = %s", secure($_POST['title']), secure($_POST['place']), secure($_POST['message']), secure($_GET['id'], 'int') )) or _error("SQL_ERROR_THROWEN");
			/* return */
			return_json( array('success' => true, 'message' => __("Ads info have been updated")) );
			break;

		case 'add':
			/* insert */
			$db->query(sprintf("INSERT INTO ads_system (title, place, code, time) VALUES (%s, %s, %s, %s)", secure($_POST['title']), secure($_POST['place']), secure($_POST['message']), secure($date) )) or _error("SQL_ERROR_THROWEN");
			/* return */
			return_json( array('callback' => 'window.location = "'.$system['system_url'].'/'.$control_panel['url'].'/ads/system_ads";') );
			break;
		
		default:
			_error(400);
			break;
	}

} catch (Exception $e) {
	return_json( array('error' => true, 'message' => $e->getMessage()) );
}

?>