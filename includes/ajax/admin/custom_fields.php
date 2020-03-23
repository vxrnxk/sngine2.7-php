<?php
/**
 * ajax -> admin -> custom fields
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

// handle custom fields
try {

	switch ($_GET['do']) {
		case 'edit':
			/* valid inputs */
			if(!isset($_GET['id']) || !is_numeric($_GET['id'])) {
				_error(400);
			}
			if(!in_array($_POST['field_for'], array('user', 'page', 'group', 'event'))) {
				throw new Exception(__("You have to select a valid field for value"));
			}
			if(is_empty($_POST['label'])) {
				throw new Exception(__("You have to enter the field label"));
			}
			if(!in_array($_POST['type'], array('textbox', 'textarea', 'selectbox'))) {
				throw new Exception(__("You have to select a valid type"));
			}
			if($_POST['type'] == "selectbox") {
				if(is_empty($_POST['select_options'])) {
					throw new Exception(__("You have to enter the select options"));
				}
			}
			if(!in_array($_POST['place'], array('basic', 'work', 'location', 'education', 'other'))) {
				throw new Exception(__("You have to select a valid place"));
			}
			$_POST['place'] = ($_POST['field_for'] == "user")? $_POST['place'] : "basic";
			if(is_empty($_POST['length']) || !is_numeric($_POST['length'])) {
				throw new Exception(__("You have to enter valid field length"));
			}
			if($_POST['length'] <= 0 || $_POST['length'] > 1000) {
				throw new Exception(__("The field minimum length is 1 and maximum 1000 characters"));
			}
			if(is_empty($_POST['field_order']) || !is_numeric($_POST['field_order'])) {
				throw new Exception(__("You have to enter valid field order"));
			}
			/* prepare */
			$_POST['mandatory'] = (isset($_POST['mandatory']))? '1' : '0';
			$_POST['in_registration'] = (isset($_POST['in_registration']))? '1' : '0';
			$_POST['in_profile'] = (isset($_POST['in_profile']))? '1' : '0';
			/* update */
			$db->query(sprintf("UPDATE custom_fields SET field_for = %s, type = %s, select_options = %s, label = %s, description = %s, place = %s, length = %s, field_order = %s, mandatory = %s, in_registration = %s, in_profile = %s WHERE field_id = %s", secure($_POST['field_for']), secure($_POST['type']), secure($_POST['select_options']), secure($_POST['label']), secure($_POST['description']), secure($_POST['place']), secure($_POST['length'], 'int'), secure($_POST['field_order'], 'int'), secure($_POST['mandatory']), secure($_POST['in_registration']), secure($_POST['in_profile']), secure($_GET['id'], 'int') )) or _error("SQL_ERROR_THROWEN");
			/* return */
			return_json( array('success' => true, 'message' => __("Field info have been updated")) );
			break;

		case 'add':
			/* valid inputs */
			if(!in_array($_POST['field_for'], array('user', 'page', 'group', 'event'))) {
				throw new Exception(__("You have to select a valid field for value"));
			}
			if(is_empty($_POST['label'])) {
				throw new Exception(__("You have to enter the field label"));
			}
			if(!in_array($_POST['type'], array('textbox', 'textarea', 'selectbox'))) {
				throw new Exception(__("You have to select a valid type"));
			}
			if($_POST['type'] == "selectbox") {
				if(is_empty($_POST['select_options'])) {
					throw new Exception(__("You have to enter the select options"));
				}
			}
			if(!in_array($_POST['place'], array('basic', 'work', 'location', 'education', 'other'))) {
				throw new Exception(__("You have to select a valid place"));
			}
			$_POST['place'] = ($_POST['field_for'] == "user")? $_POST['place'] : "basic";
			if(is_empty($_POST['length']) || !is_numeric($_POST['length'])) {
				throw new Exception(__("You have to enter valid field length"));
			}
			if($_POST['length'] <= 0 || $_POST['length'] > 1000) {
				throw new Exception(__("The field minimum length is 1 and maximum 1000 characters"));
			}
			if(is_empty($_POST['field_order']) || !is_numeric($_POST['field_order'])) {
				throw new Exception(__("You have to enter valid field order"));
			}
			/* prepare */
			$_POST['mandatory'] = (isset($_POST['mandatory']))? '1' : '0';
			$_POST['in_registration'] = (isset($_POST['in_registration']))? '1' : '0';
			$_POST['in_profile'] = (isset($_POST['in_profile']))? '1' : '0';
			/* insert */
			$db->query(sprintf("INSERT INTO custom_fields (field_for, type, select_options, label, description, place, length, field_order, mandatory, in_registration, in_profile) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)", secure($_POST['field_for']), secure($_POST['type']), secure($_POST['select_options']), secure($_POST['label']), secure($_POST['description']), secure($_POST['place']), secure($_POST['length'], 'int'), secure($_POST['field_order'], 'int'), secure($_POST['mandatory']), secure($_POST['in_registration']), secure($_POST['in_profile']) )) or _error("SQL_ERROR_THROWEN");
			/* return */
			return_json( array('callback' => 'window.location = "'.$system['system_url'].'/'.$control_panel['url'].'/custom_fields";') );
			break;
		
		default:
			_error(400);
			break;
	}

} catch (Exception $e) {
	return_json( array('error' => true, 'message' => $e->getMessage()) );
}

?>