<?php
/**
 * ajax -> admin -> themes
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

// handle themes
try {

	switch ($_GET['do']) {
		case 'edit':
			/* valid inputs */
			if(!isset($_GET['id']) || !is_numeric($_GET['id'])) {
				_error(400);
			}
			/* prepare */
			$_POST['default'] = (isset($_POST['default']))? '1' : '0';
			/* if default is set -> set all as not default first */
			if($_POST['default']) {
				$db->query("UPDATE system_themes SET system_themes.default = '0'") or _error("SQL_ERROR_THROWEN");
			} else {
				/*  default is not set -> check if this theme is the default one */
				$check_themes = $db->query(sprintf("SELECT COUNT(*) as count FROM system_themes WHERE system_themes.default = '1' and theme_id = %s", secure($_GET['id'], 'int') )) or _error("SQL_ERROR_THROWEN");
				if($check_themes->fetch_assoc()['count'] > 0) {
					throw new Exception(__("This is your only default theme you need to mark other theme as default before change/delete this one"));
				}
			}
			/* update */
			$db->query(sprintf("UPDATE system_themes SET system_themes.default = %s, name = %s WHERE theme_id = %s", secure($_POST['default']), secure($_POST['name']), secure($_GET['id'], 'int') )) or _error("SQL_ERROR_THROWEN");
			/* return */
			return_json( array('success' => true, 'message' => __("Theme info have been updated")) );
			break;

		case 'add':
			/* prepare */
			$_POST['default'] = (isset($_POST['default']))? '1' : '0';
			/* if default is set -> set all as not default first */
			if($_POST['default']) {
				$db->query("UPDATE system_themes SET system_themes.default = '0'") or _error("SQL_ERROR_THROWEN");
			}
			/* insert */
			$db->query(sprintf("INSERT INTO system_themes (system_themes.default, name) VALUES (%s, %s)", secure($_POST['default']), secure($_POST['name']) )) or _error("SQL_ERROR_THROWEN");
			/* return */
			return_json( array('callback' => 'window.location = "'.$system['system_url'].'/'.$control_panel['url'].'/themes";') );
			break;
		
		default:
			_error(400);
			break;
	}

} catch (Exception $e) {
	return_json( array('error' => true, 'message' => $e->getMessage()) );
}

?>