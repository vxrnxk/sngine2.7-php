<?php
/**
 * ajax -> admin -> languages
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

// handle languages
try {

	switch ($_GET['do']) {
		case 'edit':
			/* valid inputs */
			if(!isset($_GET['id']) || !is_numeric($_GET['id'])) {
				_error(400);
			}
			/* prepare */
			$_POST['default'] = (isset($_POST['default']))? '1' : '0';
			$_POST['enabled'] = (isset($_POST['enabled']))? '1' : '0';
			/* if default is set -> set all languages as not default first */
			if($_POST['default']) {
				$db->query("UPDATE system_languages SET system_languages.default = '0'") or _error("SQL_ERROR_THROWEN");
			}
			/* update */
			$db->query(sprintf("UPDATE system_languages SET system_languages.default = %s, enabled = %s, code = %s, title = %s, flag = %s, dir = %s WHERE language_id = %s", secure($_POST['default']), secure($_POST['enabled']), secure($_POST['code']), secure($_POST['title']), secure($_POST['flag']), secure($_POST['dir']), secure($_GET['id'], 'int') )) or _error("SQL_ERROR_THROWEN");
			/* return */
			return_json( array('success' => true, 'message' => __("Language info have been updated")) );
			break;

		case 'add':
			/* prepare */
			$_POST['default'] = (isset($_POST['default']))? '1' : '0';
			$_POST['enabled'] = (isset($_POST['enabled']))? '1' : '0';
			/* if default is set -> set all languages as not default first */
			if($_POST['default']) {
				$db->query("UPDATE system_languages SET system_languages.default = '0'") or _error("SQL_ERROR_THROWEN");
			}
			/* insert */
			$db->query(sprintf("INSERT INTO system_languages (system_languages.default, enabled, code, title, flag, dir) VALUES (%s, %s, %s, %s, %s, %s)", secure($_POST['default']), secure($_POST['enabled']), secure($_POST['code']), secure($_POST['title']), secure($_POST['flag']), secure($_POST['dir']) )) or _error("SQL_ERROR_THROWEN");
			/* return */
			return_json( array('callback' => 'window.location = "'.$system['system_url'].'/'.$control_panel['url'].'/languages";') );
			break;
		
		default:
			_error(400);
			break;
	}

} catch (Exception $e) {
	return_json( array('error' => true, 'message' => $e->getMessage()) );
}

?>