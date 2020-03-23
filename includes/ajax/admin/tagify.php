<?php
/**
 * ajax -> admin -> tagify
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

// handle tagify
try {

	// initialize the return array
	$return = array();

    switch ($_POST['handle']) {
        case 'users':
           /* get users */
            $get_users = $db->query(sprintf('SELECT user_id, user_firstname, user_lastname FROM users WHERE (user_name LIKE %1$s OR user_firstname LIKE %1$s OR user_lastname LIKE %1$s OR CONCAT(user_firstname,  " ", user_lastname) LIKE %1$s) ORDER BY user_firstname ASC LIMIT %2$s', secure($_POST['query'], 'search'), secure($system['min_results'], 'int', false) )) or _error("SQL_ERROR_THROWEN");
            if($get_users->num_rows > 0) {
                while($_user = $get_users->fetch_assoc()) {
                    $result['value'] = trim($_user['user_firstname'])." ".trim($_user['user_lastname']);
                    $result['id'] = $_user['user_id'];
                    $list[] = $result;
                }
                $return['list'] = json_encode($list);
            }
            break;

        case 'pages':
           /* get pages */
            $get_pages = $db->query(sprintf('SELECT page_id, page_title FROM pages WHERE page_name LIKE %1$s OR page_title LIKE %1$s ORDER BY page_title ASC LIMIT %2$s', secure($_POST['query'], 'search'), secure($system['min_results'], 'int', false) )) or _error("SQL_ERROR_THROWEN");
            if($get_pages->num_rows > 0) {
                while($_page = $get_pages->fetch_assoc()) {
                    $result['value'] = $_page['page_title'];
                    $result['id'] = $_page['page_id'];
                    $list[] = $result;
                }
                $return['list'] = json_encode($list);
            }
            break;

        case 'groups':
           /* get groups */
            $get_groups = $db->query(sprintf('SELECT group_id, group_title FROM `groups` WHERE group_name LIKE %1$s OR group_title LIKE %1$s ORDER BY group_title ASC LIMIT %2$s', secure($_POST['query'], 'search'), secure($system['min_results'], 'int', false) )) or _error("SQL_ERROR_THROWEN");
            if($get_groups->num_rows > 0) {
                while($_group = $get_groups->fetch_assoc()) {
                    $result['value'] = $_group['group_title'];
                    $result['id'] = $_group['group_id'];
                    $list[] = $result;
                }
                $return['list'] = json_encode($list);
            }
            break;
        
        default:
            _error(400);
            break;
    }

	// return & exit
	return_json($return);

} catch (Exception $e) {
	modal("ERROR", __("Error"), $e->getMessage());
}

?>