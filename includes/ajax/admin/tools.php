<?php
/**
 * ajax -> admin -> tools
 * 
 * @package Sngine
 * @author Zamblek
 */

// set execution time
set_time_limit(0); /* unlimited max execution time */

// fetch bootstrap
require('../../../bootstrap.php');

// check AJAX Request
is_ajax();

// check admin|moderator permission
if(!$user->_is_admin) {
	modal("MESSAGE", __("System Message"), __("You don't have the right permission to access this"));
}

// handle tools
try {

	switch ($_GET['do']) {
		case 'faker':
			/* fake users generator */
			$generated = $user->fake_users_generator($_POST['users_num'], $_POST['default_password'], $_POST['random_Avatar'], $_POST['language']);
			/* return */
			return_json( array('success' => true, 'message' => $generated." ".__("fake users accounts generated successfully")) );
			break;

		case 'auto-connect':
			/* prepare */
			$_POST['auto_friend'] = (isset($_POST['auto_friend']))? '1' : '0';
			$_POST['auto_follow'] = (isset($_POST['auto_follow']))? '1' : '0';
			$_POST['auto_like'] = (isset($_POST['auto_like']))? '1' : '0';
			$_POST['auto_join'] = (isset($_POST['auto_join']))? '1' : '0';
			/* update */
			update_system_options([ 
				'auto_friend' => secure($_POST['auto_friend']), 
				'auto_friend_users' => secure($_POST['auto_friend_users']), 
				'auto_follow' => secure($_POST['auto_follow']),
				'auto_follow_users' => secure($_POST['auto_follow_users']),
				'auto_like' => secure($_POST['auto_like']),
				'auto_like_pages' => secure($_POST['auto_like_pages']),
				'auto_join' => secure($_POST['auto_join']),
				'auto_join_groups' => secure($_POST['auto_join_groups'])
			]);
			/* return */
			return_json( array('success' => true, 'message' => __("Auto-connect settings have been updated")) );
			break;

		case 'garbage-collector':
			switch ($_POST['delete']) {
				case 'users_not_activated':
					$db->query("DELETE FROM users WHERE user_activated = '0'") or _error("SQL_ERROR_THROWEN");
					$deleted_rows_count = $db->affected_rows;
					break;

				case 'users_not_logged_week':
					$db->query("DELETE FROM users WHERE user_last_seen < NOW() - INTERVAL 1 WEEK") or _error("SQL_ERROR_THROWEN");
					$deleted_rows_count = $db->affected_rows;
					break;

				case 'users_not_logged_month':
					$db->query("DELETE FROM users WHERE user_last_seen < NOW() - INTERVAL 1 MONTH") or _error("SQL_ERROR_THROWEN");
					$deleted_rows_count = $db->affected_rows;
					break;

				case 'users_not_logged_year':
					$db->query("DELETE FROM users WHERE user_last_seen < NOW() - INTERVAL 1 YEAR") or _error("SQL_ERROR_THROWEN");
					$deleted_rows_count = $db->affected_rows;
					break;

				case 'posts_longer_week':
					$get_posts = $db->query("SELECT post_id FROM posts WHERE time < NOW() - INTERVAL 1 WEEK") or _error("SQL_ERROR_THROWEN");
					if($get_posts->num_rows > 0) {
			            while($post = $get_posts->fetch_assoc()) {
			                $user->delete_post($post['post_id']);
			            }
			        }
			        $deleted_rows_count = $get_posts->num_rows;
					break;

				case 'posts_longer_month':
					$get_posts = $db->query("SELECT post_id FROM posts WHERE time < NOW() - INTERVAL 1 MONTH") or _error("SQL_ERROR_THROWEN");
					if($get_posts->num_rows > 0) {
			            while($post = $get_posts->fetch_assoc()) {
			                $user->delete_post($post['post_id']);
			            }
			        }
			        $deleted_rows_count = $get_posts->num_rows;
					break;

				case 'posts_longer_year':
					$get_posts = $db->query("SELECT post_id FROM posts WHERE time < NOW() - INTERVAL 1 YEAR") or _error("SQL_ERROR");
					if($get_posts->num_rows > 0) {
			            while($post = $get_posts->fetch_assoc()) {
			                $user->delete_post($post['post_id']);
			            }
			        }
			        $deleted_rows_count = $get_posts->num_rows;
					break;
			}
			/* return */
			return_json( array('success' => true, 'message' => __("Garbage collector removed")."<span class='badge badge-pill badge-lg badge-light mlr5'>".$deleted_rows_count."</span>".__("rows from the database") ) );
			break;

		case 'backups':
			switch ($_POST['backup_option']) {
				case 'datebase_backup':
					$user->backup_database();
					break;

				case 'files_backup':
					$user->backup_files();
					break;

				case 'full_backup':
					$user->backup_full();
					break;

				default:
					throw new Exception(__("Select which backup you would like to generate"));
					break;
			}
			/* return */
			return_json( array('success' => true, 'message' => __("New backup has been generated")) );
			break;
		
		default:
			_error(400);
			break;
	}

} catch (Exception $e) {
	return_json( array('error' => true, 'message' => $e->getMessage()) );
}

?>