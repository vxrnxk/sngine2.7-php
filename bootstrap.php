<?php 
/**
 * bootstrap
 * 
 * @package Sngine
 * @author Zamblek
 */

// set system version
define('SYS_VER', '2.7');


// set absolut & base path
define('ABSPATH',dirname(__FILE__).'/');
define('BASEPATH',dirname($_SERVER['PHP_SELF']));


// check the config file
if(!file_exists(ABSPATH.'includes/config.php')) {
    /* the config file doesn't exist -> start the installer */
    header('Location: ./install');
}


// get system configurations
require_once(ABSPATH.'includes/config.php');


// enviroment settings
if(DEBUGGING) {
    ini_set("display_errors", true);
    error_reporting(E_ALL ^ E_NOTICE);
} else {
    ini_set("display_errors", false);
    error_reporting(0);
}


// get functions
require_once(ABSPATH.'includes/functions.php');


// check system URL
check_system_url();


// start session
ini_set('session.cookie_httponly', 1);
if(get_system_protocol() == "https") {
    ini_set('session.cookie_secure', 1);
}
session_start();
/* set session secret */
if(!isset($_SESSION['secret'])) {
    $_SESSION['secret'] = get_hash_token();
}


// i18n config
require_once(ABSPATH.'includes/libs/gettext/gettext.inc');
T_setlocale(LC_MESSAGES, DEFAULT_LOCALE);
$domain = 'messages';
T_bindtextdomain($domain, ABSPATH .'content/languages/locale');
T_bind_textdomain_codeset($domain, 'UTF-8');
T_textdomain($domain);


// time config
date_default_timezone_set( 'UTC' );
$time = time();
$minutes_to_add = 0;
$DateTime = new DateTime();
$DateTime->add(new DateInterval('PT' . $minutes_to_add . 'M'));
$date = $DateTime->format('Y-m-d H:i:s');


// connect to the database
$db = new mysqli(DB_HOST, DB_USER, DB_PASSWORD, DB_NAME, DB_PORT);
$db->set_charset('utf8mb4');
if(mysqli_connect_error()) {
    _error(DB_ERROR);
}
/* set db time to UTC */
$db->query("SET time_zone = '+0:00'");


// check if the viewer IP is banned
$check_banned_ip = $db->query(sprintf("SELECT COUNT(*) as count FROM blacklist WHERE node_type = 'ip' AND node_value = %s", secure(get_user_ip()) )) or _error("SQL_ERROR");
if($check_banned_ip->fetch_assoc()['count'] > 0) {
    _error(__("System Message"), __("Your IP has been blocked"));
}


// get system options
$get_system_options = $db->query("SELECT * FROM system_options") or _error("SQL_ERROR");
while($system_option = $get_system_options->fetch_assoc()) {
    $system[$system_option['option_name']] = $system_option['option_value'];
}

/* set system URL */
$system['system_url'] = SYS_URL;

/* set system version */
$system['system_version'] = SYS_VER;

/* set session hash */
$session_hash = session_hash($system['session_hash']);

/* set system uploads */
if($system['s3_enabled']) {
    $endpoint = "https://s3.".$system['s3_region'].".amazonaws.com/".$system['s3_bucket'];
    $system['system_uploads'] = $endpoint."/uploads";
} elseif ($system['digitalocean_enabled']) {
    $endpoint = "https://".$system['digitalocean_space_name'].".".$system['digitalocean_space_region'].".digitaloceanspaces.com";
    $system['system_uploads'] = $endpoint."/uploads";
} elseif ($system['ftp_enabled']) {
    $system['system_uploads'] = $system['ftp_endpoint'];
} else {
    $system['system_uploads'] = $system['system_url'].'/'.$system['uploads_directory'];
}

/* set uploads accpeted extensions */
$system['accpeted_video_extensions'] = set_extensions_string($system['video_extensions']);
$system['accpeted_audio_extensions'] = set_extensions_string($system['audio_extensions']);
$system['accpeted_file_extensions'] = set_extensions_string($system['file_extensions']);

/* get system theme */
$get_system_theme = $db->query("SELECT * FROM system_themes WHERE system_themes.default = '1'") or _error("SQL_ERROR");
$theme = $get_system_theme->fetch_assoc();
$system['theme'] = ($theme['name'])? $theme['name'] : "default";

/* set system theme (day|night) mode */
if($system['system_theme_mode_select']) {
    if(isset($_COOKIE['s_night_mode'])) {
        $system['theme_mode_night'] = ($_COOKIE['s_night_mode'])? 1 : 0;
    } else {
        $system['theme_mode_night'] = $system['system_theme_night_on'];
    }
} else {
    $system['theme_mode_night'] = $system['system_theme_night_on'];
}

/* get system languages */
$get_system_languages = $db->query("SELECT * FROM system_languages WHERE enabled = '1'") or _error("SQL_ERROR");
while($language = $get_system_languages->fetch_assoc()) {
    if($language['default']) {
        $system['default_language'] = $language;
    }
    $language['flag'] = get_picture($language['flag'], 'flag');
    $system['languages'][$language['code']] = $language;
}

/* set system langauge */
if(isset($_GET['lang'])) {
    if(array_key_exists($_GET['lang'], $system['languages'])) {
        $system['language'] = $system['languages'][$_GET['lang']];
        T_setlocale(LC_MESSAGES, $system['language']['code']);
        /* set language cookie */
        $secured = (get_system_protocol() == "https")? true : false;
        $expire = time()+2592000;
        setcookie('s_lang', $_GET['lang'], $expire, '/', "", $secured, true);
    }
} elseif(isset($_COOKIE['s_lang'])) {
    if(array_key_exists($_COOKIE['s_lang'], $system['languages'])) {
        $system['language'] = $system['languages'][$_COOKIE['s_lang']];
        T_setlocale(LC_MESSAGES, $system['language']['code']);
    }
} else {
    if(isset($system['default_language'])) {
        $system['language'] = $system['default_language'];
        T_setlocale(LC_MESSAGES, $system['default_language']['code']);
    }
}

/* get system currency */
$get_currency = $db->query("SELECT * FROM system_currencies WHERE system_currencies.default = '1'") or _error("SQL_ERROR");
$currency = $get_currency->fetch_assoc();
$system['system_currency'] = $currency['code'];
$system['system_currency_symbol'] = $currency['symbol'];

/* get system withdrawal method array  */
$system['affiliate_payment_method_array'] = explode(",", $system['affiliate_payment_method']);
$system['points_payment_method_array'] = explode(",", $system['points_payment_method']);


// smarty config
require_once(ABSPATH.'includes/libs/Smarty/Smarty.class.php');
$smarty = new Smarty;
$smarty->template_dir = ABSPATH.'content/themes/'.$system['theme'].'/templates';
$smarty->compile_dir = ABSPATH.'content/themes/'.$system['theme'].'/templates_compiled';
$smarty->loadFilter('output', 'trimwhitespace');


// get user
require_once(ABSPATH.'includes/class-user.php');
try {
    $user = new User();
    /* assign variables */
    $smarty->assign('user', $user);
} catch (Exception $e) {
    _error(__("Error"), $e->getMessage());
}


// check if system is live
if(!$system['system_live'] && ( (!$user->_logged_in && !isset($override_shutdown)) || ($user->_logged_in && $user->_data['user_group'] != 1)) ) {
    _error(__('System Message'), "<p class='text-center'>".$system['system_message']."</p>");
}


// check if the viewer is banned
if(!$user->_is_admin && $user->_data['user_banned']) {
    _error(__("System Message"), __("Your account has been blocked"));
}


// init affiliates system
$user->init_affiliates();


// get reactions
$reactions = get_reactions();
$smarty->assign('reactions', $reactions);


// init control panel
if($user->_is_admin) {
    $control_panel['title'] = __("Admin");
    $control_panel['url'] = "admincp";
} elseif ($user->_is_moderator) {
    $control_panel['title'] = __("Moderator");
    $control_panel['url'] = "modcp";
}


// assign system varibles
$smarty->assign('secret', $_SESSION['secret']);
$smarty->assign('session_hash', $session_hash);
$smarty->assign('system', $system);
$smarty->assign('date', $date);

?>