<?php
/**
 * ajax -> admin -> packages
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

// handle packages
try {

	switch ($_GET['do']) {
		case 'edit':
			/* prepare */
			$_POST['verification_badge_enabled'] = (isset($_POST['verification_badge_enabled']))? '1' : '0';
			$_POST['boost_posts_enabled'] = (isset($_POST['boost_posts_enabled']))? '1' : '0';
			$_POST['boost_pages_enabled'] = (isset($_POST['boost_pages_enabled']))? '1' : '0';
			/* valid inputs */
			if(is_empty($_POST['name'])) {
				throw new Exception(__("You have to enter the package name"));
			}
			if(is_empty($_POST['price']) || !is_numeric($_POST['price']) || $_POST['price'] <= 0) {
				throw new Exception(__("You have to enter valid package price"));
			}
			if($_POST['period_num'] != "life" && (is_empty($_POST['period_num']) || !is_numeric($_POST['period_num']) || $_POST['period_num'] == '0')) {
				throw new Exception(__("You have to enter valid period number"));
			}
			if($_POST['boost_posts_enabled']) {
				if(is_empty($_POST['boost_posts']) || !is_numeric($_POST['boost_posts'])) {
					throw new Exception(__("You have to enter valid boost posts number"));
				}
			} else {
				$_POST['boost_posts'] = 0;
			}
			if($_POST['boost_pages_enabled']) {
				if(is_empty($_POST['boost_pages']) || !is_numeric($_POST['boost_pages'])) {
					throw new Exception(__("You have to enter valid boost pages number"));
				}
			} else {
				$_POST['boost_pages'] = 0;
			}
			/* update */
			$db->query(sprintf("UPDATE packages SET name = %s, price = %s, period_num = %s, period = %s, color = %s, icon = %s, verification_badge_enabled = %s, boost_posts_enabled = %s, boost_posts = %s, boost_pages_enabled = %s, boost_pages = %s WHERE package_id = %s", secure($_POST['name']), secure($_POST['price']), secure($_POST['period_num']), secure($_POST['period']), secure($_POST['color']), secure($_POST['icon']), secure($_POST['verification_badge_enabled']), secure($_POST['boost_posts_enabled']), secure($_POST['boost_posts'], 'int'), secure($_POST['boost_pages_enabled']), secure($_POST['boost_pages'], 'int'), secure($_GET['id'], 'int') )) or _error("SQL_ERROR_THROWEN");
			/* return */
			return_json( array('success' => true, 'message' => __("Package info have been updated")) );
			break;

		case 'add':
			/* prepare */
			$_POST['verification_badge_enabled'] = (isset($_POST['verification_badge_enabled']))? '1' : '0';
			$_POST['boost_posts_enabled'] = (isset($_POST['boost_posts_enabled']))? '1' : '0';
			$_POST['boost_pages_enabled'] = (isset($_POST['boost_pages_enabled']))? '1' : '0';
			/* valid inputs */
			if(is_empty($_POST['name'])) {
				throw new Exception(__("You have to enter the package name"));
			}
			if(is_empty($_POST['price']) || !is_numeric($_POST['price']) || $_POST['price'] <= 0) {
				throw new Exception(__("You have to enter valid package price"));
			}
			if($_POST['period_num'] != "life" && (is_empty($_POST['period_num']) || !is_numeric($_POST['period_num']) || $_POST['period_num'] == '0')) {
				throw new Exception(__("You have to enter valid period number"));
			}
			if($_POST['boost_posts_enabled']) {
				if(is_empty($_POST['boost_posts']) || !is_numeric($_POST['boost_posts'])) {
					throw new Exception(__("You have to enter valid boost posts number"));
				}
			} else {
				$_POST['boost_posts'] = 0;
			}
			if($_POST['boost_pages_enabled']) {
				if(is_empty($_POST['boost_pages']) || !is_numeric($_POST['boost_pages'])) {
					throw new Exception(__("You have to enter valid boost pages number"));
				}
			} else {
				$_POST['boost_pages'] = 0;
			}
			/* insert */
			$db->query(sprintf("INSERT INTO packages (name, price, period_num, period, color, icon, verification_badge_enabled, boost_posts_enabled, boost_posts, boost_pages_enabled, boost_pages) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)", secure($_POST['name']), secure($_POST['price']), secure($_POST['period_num']), secure($_POST['period']), secure($_POST['color']), secure($_POST['icon']), secure($_POST['verification_badge_enabled']), secure($_POST['boost_posts_enabled']), secure($_POST['boost_posts'], 'int'), secure($_POST['boost_pages_enabled']), secure($_POST['boost_pages'], 'int') )) or _error("SQL_ERROR_THROWEN");
			/* return */
			return_json( array('callback' => 'window.location = "'.$system['system_url'].'/'.$control_panel['url'].'/packages";') );
			break;
		
		default:
			_error(400);
			break;
	}

} catch (Exception $e) {
	return_json( array('error' => true, 'message' => $e->getMessage()) );
}

?>