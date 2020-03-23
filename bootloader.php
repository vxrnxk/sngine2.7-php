<?php 
/**
 * bootloader
 * 
 * @package Sngine
 * @author Zamblek
 */

// fetch bootstrap
require('bootstrap.php');


// get user
if($user->_logged_in) {
    /* get friend requests */
    $user->_data['friend_requests'] = $user->get_friend_requests();
    /* get search log */
    $user->_data['search_log'] = $user->get_search_log();
    /* get conversations */
    $user->_data['conversations'] = $user->get_conversations();
    /* get notifications */
    $user->_data['notifications'] = $user->get_notifications();
    /* get online & offline friends */
    require_once(ABSPATH.'includes/libs/MobileDetect/Mobile_Detect.php');
    $detect = new Mobile_Detect;
    if($system['chat_enabled'] && $user->_data['user_chat_enabled'] && !($detect->isMobile() && !$detect->isTablet())) {
        /* get online friends */
        $online_friends = $user->get_online_friends();
        /* get offline friends */
        $offline_friends = $user->get_offline_friends();
        /* get sidebar friends */
        $sidebar_friends = array_merge( $online_friends, $offline_friends );
        /* assign variables */
        $smarty->assign('sidebar_friends', $sidebar_friends);
        $smarty->assign('online_friends_count', count($online_friends));
    }
    /* check if user subscribed */
    if($system['packages_enabled']) {
        $user->check_user_package();
    }
}


// get static pages
$static_pages = array();
$get_static = $db->query("SELECT page_url, page_title FROM static_pages WHERE page_in_footer = '1' ORDER BY page_order ASC") or _error("SQL_ERROR");
if($get_static->num_rows > 0) {
    while($static_page = $get_static->fetch_assoc()) {
        $static_pages[] = $static_page;
    }
}
/* assign variables */
$smarty->assign('static_pages', $static_pages);


// get ads (header & footer)
$ads_master['header'] = $user->ads('header');
$ads_master['footer'] = $user->ads('footer');
/* assign variables */
$smarty->assign('ads_master', $ads_master);

?>