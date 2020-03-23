<?php
/**
 * directory
 * 
 * @package Sngine
 * @author Zamblek
 */

// fetch bootloader
require('bootloader.php');

// user access
if(!$system['directory_enabled']) {
	_error(404);
}

try {

	// get view content
	switch ($_GET['view']) {
		case '':
			// page header
			page_header($system['system_title'].' - '.__("Directory"));
			break;

		case 'posts':
			// page header
			page_header($system['system_title'].' - '.__("Posts Directory"));

			// pager config
			require('includes/class-pager.php');
			$params['selected_page'] = ( (int) $_GET['page'] == 0) ? 1 : $_GET['page'];
			$total = $db->query("SELECT COUNT(*) as count FROM posts") or _error("SQL_ERROR");
			$params['total_items'] = $total->fetch_assoc()['count'];
			$params['items_per_page'] = $system['max_results'];
			$params['url'] = $system['system_url'].'/directory/'.'posts'.'/%s';
			$pager = new Pager($params);
			$limit_query = $pager->getLimitSql();

			// get posts
			$rows = array();
			$get_rows = $db->query("SELECT post_id FROM posts ".$limit_query) or _error("SQL_ERROR");
			while($row = $get_rows->fetch_assoc()) {
				$row = $user->get_post($row['post_id']);
				if($row) {
					$rows[] = $row;
				}
			}
			/* assign variables */
			$smarty->assign('rows', $rows);
			$smarty->assign('pager', $pager->getPager());
			break;

		case 'users':
			// page header
			page_header($system['system_title'].' - '.__("Users Directory"));

			// pager config
			require('includes/class-pager.php');
			$params['selected_page'] = ( (int) $_GET['page'] == 0) ? 1 : $_GET['page'];
			$total = $db->query("SELECT COUNT(*) as count FROM users") or _error("SQL_ERROR");
			$params['total_items'] = $total->fetch_assoc()['count'];
			$params['items_per_page'] = $system['max_results'];
			$params['url'] = $system['system_url'].'/directory/'.'users'.'/%s';
			$pager = new Pager($params);
			$limit_query = $pager->getLimitSql();

			// get users
			$rows = array();
			$get_rows = $db->query("SELECT * FROM users ".$limit_query) or _error("SQL_ERROR");
			while($row = $get_rows->fetch_assoc()) {
				$row['user_picture'] = get_picture($row['user_picture'], $row['user_gender']);
                /* get the connection between the viewer & the target */
                $row['connection'] = $user->connection($row['user_id']);
                $rows[] = $row;
			}
			/* assign variables */
			$smarty->assign('rows', $rows);
			$smarty->assign('pager', $pager->getPager());
			break;

		case 'pages':
			// page header
			page_header($system['system_title'].' - '.__("Pages Directory"));

			// pager config
			require('includes/class-pager.php');
			$params['selected_page'] = ( (int) $_GET['page'] == 0) ? 1 : $_GET['page'];
			$total = $db->query("SELECT COUNT(*) as count FROM pages") or _error("SQL_ERROR");
			$params['total_items'] = $total->fetch_assoc()['count'];
			$params['items_per_page'] = $system['max_results'];
			$params['url'] = $system['system_url'].'/directory/'.'pages'.'/%s';
			$pager = new Pager($params);
			$limit_query = $pager->getLimitSql();

			// get pages
			$rows = array();
			$get_rows = $db->query("SELECT * FROM pages ".$limit_query) or _error("SQL_ERROR");
			while($row = $get_rows->fetch_assoc()) {
				$row['page_picture'] = get_picture($row['page_picture'], 'page');
                /* check if the viewer liked the page */
                $row['i_like'] = false;
                if($user->_logged_in) {
                    $get_likes = $db->query(sprintf("SELECT * FROM pages_likes WHERE page_id = %s AND user_id = %s", secure($row['page_id'], 'int'), secure($user->_data['user_id'], 'int') )) or _error("SQL_ERROR");
                    if($get_likes->num_rows > 0) {
                        $row['i_like'] = true;
                    }
                }
                $rows[] = $row;
			}
			/* assign variables */
			$smarty->assign('rows', $rows);
			$smarty->assign('pager', $pager->getPager());
			break;

		case 'groups':
			// page header
			page_header($system['system_title'].' - '.__("Pages Directory"));

			// pager config
			require('includes/class-pager.php');
			$params['selected_page'] = ( (int) $_GET['page'] == 0) ? 1 : $_GET['page'];
			$total = $db->query("SELECT COUNT(*) as count FROM `groups` WHERE group_privacy = 'public'") or _error("SQL_ERROR");
			$params['total_items'] = $total->fetch_assoc()['count'];
			$params['items_per_page'] = $system['max_results'];
			$params['url'] = $system['system_url'].'/directory/'.'groups'.'/%s';
			$pager = new Pager($params);
			$limit_query = $pager->getLimitSql();

			// get groups
			$rows = array();
			$get_rows = $db->query("SELECT * FROM `groups` WHERE group_privacy = 'public' ".$limit_query) or _error("SQL_ERROR");
			while($row = $get_rows->fetch_assoc()) {
				$row['group_picture'] = get_picture($row['group_picture'], 'group');
                /* check if the viewer joined the group */
                $row['i_joined'] = $user->check_group_membership($user->_data['user_id'], $row['group_id']);
                $rows[] = $row;
			}
			/* assign variables */
			$smarty->assign('rows', $rows);
			$smarty->assign('pager', $pager->getPager());
			break;

		case 'events':
			// page header
			page_header($system['system_title'].' - '.__("Events Directory"));

			// pager config
			require('includes/class-pager.php');
			$params['selected_page'] = ( (int) $_GET['page'] == 0) ? 1 : $_GET['page'];
			$total = $db->query("SELECT COUNT(*) as count FROM `events` WHERE event_privacy = 'public'") or _error("SQL_ERROR");
			$params['total_items'] = $total->fetch_assoc()['count'];
			$params['items_per_page'] = $system['max_results'];
			$params['url'] = $system['system_url'].'/directory/'.'events'.'/%s';
			$pager = new Pager($params);
			$limit_query = $pager->getLimitSql();

			// get events
			$rows = array();
			$get_rows = $db->query("SELECT * FROM `events` WHERE event_privacy = 'public' ".$limit_query) or _error("SQL_ERROR");
			while($row = $get_rows->fetch_assoc()) {
				$row['event_picture'] = get_picture($row['event_cover'], 'event');
                /* check if the viewer joined the event */
                $row['i_joined'] = $user->check_event_membership($user->_data['user_id'], $row['event_id']);
                $rows[] = $row;
			}
			/* assign variables */
			$smarty->assign('rows', $rows);
			$smarty->assign('pager', $pager->getPager());
			break;

		case 'games':
			// page header
			page_header($system['system_title'].' - '.__("Pages Directory"));

			// pager config
			require('includes/class-pager.php');
			$params['selected_page'] = ( (int) $_GET['page'] == 0) ? 1 : $_GET['page'];
			$total = $db->query("SELECT COUNT(*) as count FROM games") or _error("SQL_ERROR");
			$params['total_items'] = $total->fetch_assoc()['count'];
			$params['items_per_page'] = $system['max_results'];
			$params['url'] = $system['system_url'].'/directory/'.'games'.'/%s';
			$pager = new Pager($params);
			$limit_query = $pager->getLimitSql();

			// get games
			$rows = array();
			$get_rows = $db->query("SELECT * FROM games ".$limit_query) or _error("SQL_ERROR");
			while($row = $get_rows->fetch_assoc()) {
				$row['thumbnail'] = get_picture($row['thumbnail'], 'game');
				$row['title_url'] = get_url_text($row['title']);
				$rows[] = $row;
			}
			/* assign variables */
			$smarty->assign('rows', $rows);
			$smarty->assign('pager', $pager->getPager());
			break;
		
		default:
			_error(404);
			break;
	}
	/* assign variables */
	$smarty->assign('view', $_GET['view']);

	// get ads campaigns
	$ads_campaigns = $user->ads_campaigns();
	/* assign variables */
	$smarty->assign('ads_campaigns', $ads_campaigns);

	// get ads
	$ads = $user->ads('directory');
	/* assign variables */
	$smarty->assign('ads', $ads);

	// get widgets
	$widgets = $user->widgets('directory');
	/* assign variables */
	$smarty->assign('widgets', $widgets);

} catch (Exception $e) {
	_error(__("Error"), $e->getMessage());
}

// page footer
page_footer("directory");

?>