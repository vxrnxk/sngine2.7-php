<?php
/**
 * ajax -> admin -> blacklist
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

// handle blacklist
try {

	switch ($_GET['do']) {
		case 'add':
			/* insert */
			$db->query(sprintf("INSERT INTO blacklist (node_type, node_value, created_time) VALUES (%s, %s, %s)", secure($_POST['node_type']), secure($_POST['node_value']), secure($date) )) or _error("SQL_ERROR_THROWEN");
			/* return */
			return_json( array('callback' => 'window.location = "'.$system['system_url'].'/'.$control_panel['url'].'/blacklist";') );
			break;
		
		default:
			_error(400);
			break;
	}

} catch (Exception $e) {
	return_json( array('error' => true, 'message' => $e->getMessage()) );
}

?>