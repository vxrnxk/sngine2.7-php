<?php
/**
 * ajax -> admin -> delete
 * 
 * @package Sngine
 * @author Zamblek
 */

// fetch bootstrap
require('../../../bootstrap.php');

// check AJAX Request
is_ajax();

// valid inputs
if($_POST['handle'] != "reports" && (!isset($_POST['id']) || !is_numeric($_POST['id']))) {
	_error(400);
}

// handle delete
try {

	switch ($_POST['handle']) {

		case 'invitation_code':
			// check admin|moderator permission
			if(!$user->_is_admin) {
				modal("MESSAGE", __("System Message"), __("You don't have the right permission to access this"));
			}
			$db->query(sprintf("DELETE FROM invitation_codes WHERE code_id = %s", secure($_POST['id'], 'int') )) or _error("SQL_ERROR_THROWEN");
			break;

		case 'theme':
			// check admin|moderator permission
			if(!$user->_is_admin) {
				modal("MESSAGE", __("System Message"), __("You don't have the right permission to access this"));
			}
			/* check if this theme is the default one */
			$check_themes = $db->query(sprintf("SELECT COUNT(*) as count FROM system_themes WHERE system_themes.default = '1' and theme_id = %s", secure($_POST['id'], 'int') )) or _error("SQL_ERROR_THROWEN");
			if($check_themes->fetch_assoc()['count'] > 0) {
				throw new Exception(__("This is your only default theme you need to mark other theme as default before change/delete this one"));
			}
			$db->query(sprintf("DELETE FROM system_themes WHERE theme_id = %s", secure($_POST['id'], 'int') )) or _error("SQL_ERROR_THROWEN");
			break;

		case 'language':
			// check admin|moderator permission
			if(!$user->_is_admin) {
				modal("MESSAGE", __("System Message"), __("You don't have the right permission to access this"));
			}
			$db->query(sprintf("DELETE FROM system_languages WHERE language_id = %s", secure($_POST['id'], 'int') )) or _error("SQL_ERROR_THROWEN");
			break;

		case 'currency':
			// check admin|moderator permission
			if(!$user->_is_admin) {
				modal("MESSAGE", __("System Message"), __("You don't have the right permission to access this"));
			}
			$db->query(sprintf("DELETE FROM system_currencies WHERE currency_id = %s", secure($_POST['id'], 'int') )) or _error("SQL_ERROR_THROWEN");
			break;

		case 'user':
			// check admin|moderator permission
			if(!$user->_is_admin) {
				modal("MESSAGE", __("System Message"), __("You don't have the right permission to access this"));
			}
			$user->delete_user($_POST['id']);
			if(isset($_POST['node']) && is_numeric($_POST['node'])) {
				/* delete report */
				$db->query(sprintf("DELETE FROM reports WHERE report_id = %s", secure($_POST['node'], 'int') )) or _error("SQL_ERROR_THROWEN");
			}
			break;

		case 'user_posts':
			// check admin|moderator permission
			if(!$user->_is_admin) {
				modal("MESSAGE", __("System Message"), __("You don't have the right permission to access this"));
			}
			$user->delete_posts($_POST['id']);
			break;

		case 'session':
			// check admin|moderator permission
			if(!$user->_is_admin) {
				modal("MESSAGE", __("System Message"), __("You don't have the right permission to access this"));
			}
			$db->query(sprintf("DELETE FROM users_sessions WHERE session_id = %s", secure($_POST['id'], 'int') )) or _error("SQL_ERROR_THROWEN");
			break;

		case 'user_package':
			// check admin|moderator permission
			if(!$user->_is_admin) {
				modal("MESSAGE", __("System Message"), __("You don't have the right permission to access this"));
			}
			$db->query(sprintf("UPDATE users SET user_subscribed = '0', user_package = null, user_subscription_date = null, user_boosted_posts = '0', user_boosted_pages = '0' WHERE user_id = %s", secure($_POST['id'], 'int') )) or _error("SQL_ERROR_THROWEN");
			break;

		case 'page':
			// check admin|moderator permission
			if(!$user->_is_admin && !$user->_is_moderator) {
				modal("MESSAGE", __("System Message"), __("You don't have the right permission to access this"));
			}
			$user->delete_page($_POST['id']);
			if(isset($_POST['node']) && is_numeric($_POST['node'])) {
				/* delete report */
				$db->query(sprintf("DELETE FROM reports WHERE report_id = %s", secure($_POST['node'], 'int') )) or _error("SQL_ERROR_THROWEN");
			}
			break;

		case 'page_posts':
			// check admin|moderator permission
			if(!$user->_is_admin && !$user->_is_moderator) {
				modal("MESSAGE", __("System Message"), __("You don't have the right permission to access this"));
			}
			$user->delete_posts($_POST['id'], 'page');
			break;

		case 'page_category':
			// check admin|moderator permission
			if(!$user->_is_admin && !$user->_is_moderator) {
				modal("MESSAGE", __("System Message"), __("You don't have the right permission to access this"));
			}
			$db->query(sprintf("DELETE FROM pages_categories WHERE category_id = %s", secure($_POST['id'], 'int') )) or _error("SQL_ERROR_THROWEN");
			break;

		case 'group':
			// check admin|moderator permission
			if(!$user->_is_admin && !$user->_is_moderator) {
				modal("MESSAGE", __("System Message"), __("You don't have the right permission to access this"));
			}
			$user->delete_group($_POST['id']);
			if(isset($_POST['node']) && is_numeric($_POST['node'])) {
				/* delete report */
				$db->query(sprintf("DELETE FROM reports WHERE report_id = %s", secure($_POST['node'], 'int') )) or _error("SQL_ERROR_THROWEN");
			}
			break;

		case 'group_posts':
			// check admin|moderator permission
			if(!$user->_is_admin && !$user->_is_moderator) {
				modal("MESSAGE", __("System Message"), __("You don't have the right permission to access this"));
			}
			$user->delete_posts($_POST['id'], 'group');
			break;

		case 'group_category':
			// check admin|moderator permission
			if(!$user->_is_admin && !$user->_is_moderator) {
				modal("MESSAGE", __("System Message"), __("You don't have the right permission to access this"));
			}
			$db->query(sprintf("DELETE FROM groups_categories WHERE category_id = %s", secure($_POST['id'], 'int') )) or _error("SQL_ERROR_THROWEN");
			break;

		case 'event':
			// check admin|moderator permission
			if(!$user->_is_admin && !$user->_is_moderator) {
				modal("MESSAGE", __("System Message"), __("You don't have the right permission to access this"));
			}
			$user->delete_event($_POST['id']);
			if(isset($_POST['node']) && is_numeric($_POST['node'])) {
				/* delete report */
				$db->query(sprintf("DELETE FROM reports WHERE report_id = %s", secure($_POST['node'], 'int') )) or _error("SQL_ERROR_THROWEN");
			}
			break;

		case 'event_posts':
			// check admin|moderator permission
			if(!$user->_is_admin && !$user->_is_moderator) {
				modal("MESSAGE", __("System Message"), __("You don't have the right permission to access this"));
			}
			$user->delete_posts($_POST['id'], 'event');
			break;

		case 'event_category':
			// check admin|moderator permission
			if(!$user->_is_admin && !$user->_is_moderator) {
				modal("MESSAGE", __("System Message"), __("You don't have the right permission to access this"));
			}
			$db->query(sprintf("DELETE FROM events_categories WHERE category_id = %s", secure($_POST['id'], 'int') )) or _error("SQL_ERROR_THROWEN");
			break;

		case 'blogs_category':
			// check admin|moderator permission
			if(!$user->_is_admin && !$user->_is_moderator) {
				modal("MESSAGE", __("System Message"), __("You don't have the right permission to access this"));
			}
			$db->query(sprintf("DELETE FROM blogs_categories WHERE category_id = %s", secure($_POST['id'], 'int') )) or _error("SQL_ERROR_THROWEN");
			break;

		case 'market_category':
			// check admin|moderator permission
			if(!$user->_is_admin && !$user->_is_moderator) {
				modal("MESSAGE", __("System Message"), __("You don't have the right permission to access this"));
			}
			$db->query(sprintf("DELETE FROM market_categories WHERE category_id = %s", secure($_POST['id'], 'int') )) or _error("SQL_ERROR_THROWEN");
			break;

		case 'forum':
			// check admin|moderator permission
			if(!$user->_is_admin && !$user->_is_moderator) {
				modal("MESSAGE", __("System Message"), __("You don't have the right permission to access this"));
			}
			$user->delete_forum($_POST['id']);
			if(isset($_POST['node']) && is_numeric($_POST['node'])) {
				/* delete report */
				$db->query(sprintf("DELETE FROM reports WHERE report_id = %s", secure($_POST['node'], 'int') )) or _error("SQL_ERROR_THROWEN");
			}
			break;

		case 'forum_thread':
			// check admin|moderator permission
			if(!$user->_is_admin && !$user->_is_moderator) {
				modal("MESSAGE", __("System Message"), __("You don't have the right permission to access this"));
			}
			$user->delete_forum_thread($_POST['id']);
			if(isset($_POST['node']) && is_numeric($_POST['node'])) {
				/* delete report */
				$db->query(sprintf("DELETE FROM reports WHERE report_id = %s", secure($_POST['node'], 'int') )) or _error("SQL_ERROR_THROWEN");
			}
			break;

		case 'forum_reply':
			// check admin|moderator permission
			if(!$user->_is_admin && !$user->_is_moderator) {
				modal("MESSAGE", __("System Message"), __("You don't have the right permission to access this"));
			}
			$user->delete_forum_reply($_POST['id']);
			if(isset($_POST['node']) && is_numeric($_POST['node'])) {
				/* delete report */
				$db->query(sprintf("DELETE FROM reports WHERE report_id = %s", secure($_POST['node'], 'int') )) or _error("SQL_ERROR_THROWEN");
			}
			break;

		case 'movie':
			// check admin|moderator permission
			if(!$user->_is_admin && !$user->_is_moderator) {
				modal("MESSAGE", __("System Message"), __("You don't have the right permission to access this"));
			}
			$db->query(sprintf("DELETE FROM movies WHERE movie_id = %s", secure($_POST['id'], 'int') )) or _error("SQL_ERROR_THROWEN");
			break;

		case 'movie_genre':
			// check admin|moderator permission
			if(!$user->_is_admin && !$user->_is_moderator) {
				modal("MESSAGE", __("System Message"), __("You don't have the right permission to access this"));
			}
			$db->query(sprintf("DELETE FROM movies_genres WHERE genre_id = %s", secure($_POST['id'], 'int') )) or _error("SQL_ERROR_THROWEN");
			break;

		case 'game':
			// check admin|moderator permission
			if(!$user->_is_admin && !$user->_is_moderator) {
				modal("MESSAGE", __("System Message"), __("You don't have the right permission to access this"));
			}
			$db->query(sprintf("DELETE FROM games WHERE game_id = %s", secure($_POST['id'], 'int') )) or _error("SQL_ERROR_THROWEN");
			break;

		case 'ads_system':
			// check admin|moderator permission
			if(!$user->_is_admin) {
				modal("MESSAGE", __("System Message"), __("You don't have the right permission to access this"));
			}
			$db->query(sprintf("DELETE FROM ads_system WHERE ads_id = %s", secure($_POST['id'], 'int') )) or _error("SQL_ERROR_THROWEN");
			break;

		case 'package':
			// check admin|moderator permission
			if(!$user->_is_admin) {
				modal("MESSAGE", __("System Message"), __("You don't have the right permission to access this"));
			}
			$db->query(sprintf("DELETE FROM packages WHERE package_id = %s", secure($_POST['id'], 'int') )) or _error("SQL_ERROR_THROWEN");
			break;

		case 'apps_category':
			// check admin|moderator permission
			if(!$user->_is_admin) {
				modal("MESSAGE", __("System Message"), __("You don't have the right permission to access this"));
			}
			$db->query(sprintf("DELETE FROM developers_apps_categories WHERE category_id = %s", secure($_POST['id'], 'int') )) or _error("SQL_ERROR_THROWEN");
			break;

		case 'report':
			// check admin|moderator permission
			if(!$user->_is_admin && !$user->_is_moderator) {
				modal("MESSAGE", __("System Message"), __("You don't have the right permission to access this"));
			}
			$db->query(sprintf("DELETE FROM reports WHERE report_id = %s", secure($_POST['id'], 'int') )) or _error("SQL_ERROR_THROWEN");
			break;

		case 'reports':
			// check admin|moderator permission
			if(!$user->_is_admin && !$user->_is_moderator) {
				modal("MESSAGE", __("System Message"), __("You don't have the right permission to access this"));
			}
			$db->query("DELETE FROM reports") or _error("SQL_ERROR_THROWEN");
			break;

		case 'post':
			// check admin|moderator permission
			if(!$user->_is_admin && !$user->_is_moderator) {
				modal("MESSAGE", __("System Message"), __("You don't have the right permission to access this"));
			}
			$user->delete_post($_POST['id']);
			if(isset($_POST['node']) && is_numeric($_POST['node'])) {
				/* delete report */
				$db->query(sprintf("DELETE FROM reports WHERE report_id = %s", secure($_POST['node'], 'int') )) or _error("SQL_ERROR_THROWEN");
			}	
			break;

		case 'comment':
			// check admin|moderator permission
			if(!$user->_is_admin && !$user->_is_moderator) {
				modal("MESSAGE", __("System Message"), __("You don't have the right permission to access this"));
			}
			$user->delete_comment($_POST['id']);
			if(isset($_POST['node']) && is_numeric($_POST['node'])) {
				/* delete report */
				$db->query(sprintf("DELETE FROM reports WHERE report_id = %s", secure($_POST['node'], 'int') )) or _error("SQL_ERROR_THROWEN");
			}
			break;

		case 'blacklist_node':
			// check admin|moderator permission
			if(!$user->_is_admin) {
				modal("MESSAGE", __("System Message"), __("You don't have the right permission to access this"));
			}
			$db->query(sprintf("DELETE FROM blacklist WHERE node_id = %s", secure($_POST['id'], 'int') )) or _error("SQL_ERROR_THROWEN");
			break;

		case 'custom_field':
			// check admin|moderator permission
			if(!$user->_is_admin) {
				modal("MESSAGE", __("System Message"), __("You don't have the right permission to access this"));
			}
			$db->query(sprintf("DELETE FROM custom_fields WHERE field_id = %s", secure($_POST['id'], 'int') )) or _error("SQL_ERROR_THROWEN");
			$db->query(sprintf("DELETE FROM custom_fields_values WHERE field_id = %s", secure($_POST['id'], 'int') )) or _error("SQL_ERROR_THROWEN");
			break;

		case 'static_page':
			// check admin|moderator permission
			if(!$user->_is_admin) {
				modal("MESSAGE", __("System Message"), __("You don't have the right permission to access this"));
			}
			$db->query(sprintf("DELETE FROM static_pages WHERE page_id = %s", secure($_POST['id'], 'int') )) or _error("SQL_ERROR_THROWEN");
			break;

		case 'pattern':
			// check admin|moderator permission
			if(!$user->_is_admin) {
				modal("MESSAGE", __("System Message"), __("You don't have the right permission to access this"));
			}
			$db->query(sprintf("DELETE FROM posts_colored_patterns WHERE pattern_id = %s", secure($_POST['id'], 'int') )) or _error("SQL_ERROR_THROWEN");
			break;

		case 'widget':
			// check admin|moderator permission
			if(!$user->_is_admin) {
				modal("MESSAGE", __("System Message"), __("You don't have the right permission to access this"));
			}
			$db->query(sprintf("DELETE FROM widgets WHERE widget_id = %s", secure($_POST['id'], 'int') )) or _error("SQL_ERROR_THROWEN");
			break;

		case 'emoji':
			// check admin|moderator permission
			if(!$user->_is_admin) {
				modal("MESSAGE", __("System Message"), __("You don't have the right permission to access this"));
			}
			$db->query(sprintf("DELETE FROM emojis WHERE emoji_id = %s", secure($_POST['id'], 'int') )) or _error("SQL_ERROR_THROWEN");
			break;

		case 'sticker':
			// check admin|moderator permission
			if(!$user->_is_admin) {
				modal("MESSAGE", __("System Message"), __("You don't have the right permission to access this"));
			}
			$db->query(sprintf("DELETE FROM stickers WHERE sticker_id = %s", secure($_POST['id'], 'int') )) or _error("SQL_ERROR_THROWEN");
			break;

		case 'gift':
			// check admin|moderator permission
			if(!$user->_is_admin) {
				modal("MESSAGE", __("System Message"), __("You don't have the right permission to access this"));
			}
			$db->query(sprintf("DELETE FROM gifts WHERE gift_id = %s", secure($_POST['id'], 'int') )) or _error("SQL_ERROR_THROWEN");
			break;

		case 'announcement':
			// check admin|moderator permission
			if(!$user->_is_admin) {
				modal("MESSAGE", __("System Message"), __("You don't have the right permission to access this"));
			}
			$db->query(sprintf("DELETE FROM announcements WHERE announcement_id = %s", secure($_POST['id'], 'int') )) or _error("SQL_ERROR_THROWEN");
			break;

		default:
			_error(400);
			break;
	}

	// return & exist
	return_json();

} catch (Exception $e) {
	modal("ERROR", __("Error"), $e->getMessage());
}

?>