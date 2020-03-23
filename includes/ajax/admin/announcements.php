<?php
/**
 * ajax -> admin -> announcements
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

// handle announcements
try {

	switch ($_GET['do']) {
		case 'edit':
			/* valid inputs */
			if(!isset($_GET['id']) || !is_numeric($_GET['id'])) {
				_error(400);
			}
			if(is_empty($_POST['name'])) {
				throw new Exception(__("You have to enter the announcement name"));
			}
			if(is_empty($_POST['code'])) {
				throw new Exception(__("You have to enter the announcement HTML code"));
			}
			if(is_empty($_POST['start_date'])) {
				throw new Exception(__("You have to enter the announcement start date"));
			}
			if(is_empty($_POST['end_date'])) {
				throw new Exception(__("You have to enter the announcement end date"));
			}
			if(strtotime(set_datetime($_POST['end_date'])) < strtotime(set_datetime($_POST['start_date']))) {
				throw new Exception(__("End Date must be after the Start Date"));
			}
			/* update */
			$db->query(sprintf("UPDATE announcements SET name = %s, title = %s, type = %s, code = %s, start_date = %s, end_date = %s WHERE announcement_id = %s", secure($_POST['name']), secure($_POST['title']), secure($_POST['type']), secure($_POST['code']), secure($_POST['start_date'], 'datetime'), secure($_POST['end_date'], 'datetime'), secure($_GET['id'], 'int') )) or _error("SQL_ERROR_THROWEN");
			/* return */
			return_json( array('success' => true, 'message' => __("Announcement info have been updated")) );
			break;

		case 'add':
			/* valid inputs */
			if(is_empty($_POST['name'])) {
				throw new Exception(__("You have to enter the announcement name"));
			}
			if(is_empty($_POST['code'])) {
				throw new Exception(__("You have to enter the announcement HTML code"));
			}
			if(is_empty($_POST['start_date'])) {
				throw new Exception(__("You have to enter the announcement start date"));
			}
			if(is_empty($_POST['end_date'])) {
				throw new Exception(__("You have to enter the announcement end date"));
			}
			if(strtotime(set_datetime($_POST['end_date'])) < strtotime(set_datetime($_POST['start_date']))) {
				throw new Exception(__("End Date must be after the Start Date"));
			}
			/* insert */
			$db->query(sprintf("INSERT INTO announcements (name, title, type, code, start_date, end_date) VALUES (%s, %s, %s, %s, %s, %s)", secure($_POST['name']), secure($_POST['title']), secure($_POST['type']), secure($_POST['code']), secure($_POST['start_date'], 'datetime'), secure($_POST['end_date'], 'datetime') )) or _error("SQL_ERROR_THROWEN");
			/* return */
			return_json( array('callback' => 'window.location = "'.$system['system_url'].'/'.$control_panel['url'].'/announcements";') );
			break;
		
		default:
			_error(400);
			break;
	}

} catch (Exception $e) {
	return_json( array('error' => true, 'message' => $e->getMessage()) );
}

?>