<?php
/**
 * ajax -> core -> theme
 * 
 * @package Sngine
 * @author Zamblek
 */

// fetch bootstrap
require('../../../bootstrap.php');

// check AJAX Request
is_ajax();

// set theme mode (day|night)
if(isset($_POST['mode'])) {
	$secured = (get_system_protocol() == "https")? true : false;
    $expire = time()+2592000;
    $night_mode = ($_POST['mode'] == "night")? '1' : '0';
    /* set cookie */
    setcookie('s_night_mode', $night_mode, $expire, '/', "", $secured, true);
}

?>