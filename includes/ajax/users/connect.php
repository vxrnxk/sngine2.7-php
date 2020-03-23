<?php
/**
 * ajax -> users -> connect
 * 
 * @package Sngine
 * @author Zamblek
 */

// fetch bootstrap
require('../../../bootstrap.php');

// check AJAX Request
is_ajax();

// user access
user_access(true);

// valid inputs
if(!in_array($_POST['do'], array('block', 'unblock', 'friend-accept', 'friend-decline', 'friend-add', 'friend-cancel', 'friend-remove', 'follow', 'unfollow', 'poke', 'page-like', 'page-unlike', 'page-boost', 'page-unboost', 'page-invite', 'page-admin-addation', 'page-admin-remove', 'page-member-remove', 'group-join', 'group-leave', 'group-invite', 'group-accept', 'group-decline', 'group-admin-addation', 'group-admin-remove', 'group-member-remove', 'event-go', 'event-ungo', 'event-interest', 'event-uninterest', 'event-invite', 'delete-app'))) {
	_error(400);
}
/* check id */
if(!isset($_POST['id']) || !is_numeric($_POST['id'])) {
	_error(400);
}
/* check uid */
if(isset($_POST['uid']) && !is_numeric($_POST['uid'])) {
	_error(400);
}

try {

	// connect user
	$_POST['uid'] = ($_POST['uid'] == '0')? null: $_POST['uid'];
	$user->connect($_POST['do'], $_POST['id'], $_POST['uid']);

	// return & exit
	return_json();

} catch (Exception $e) {
	modal("ERROR", __("Error"), $e->getMessage());
}

?>