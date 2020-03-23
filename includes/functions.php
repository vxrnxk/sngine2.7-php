<?php
/**
 * functions
 * 
 * @package Sngine
 * @author Zamblek
 */


/* ------------------------------- */
/* Core */
/* ------------------------------- */

/**
 * check_system_requirements
 * 
 * @return void
 */
function check_system_requirements() {
    /* set required php version*/
    $required_php_version = '5.5';
    /* check php version */
    $php_version = phpversion();
    if(version_compare( $required_php_version, $php_version, '>')) {
        _error("Installation Error", sprintf('<p class="text-center">Your server is running PHP version %s but Sngine requires at least %s.</p>', $php_version, $required_php_version));
    }
    /* check if mysqli enabled */
    if(!extension_loaded('mysqli')) {
        _error("Installation Error", '<p class="text-center">Your PHP installation appears to be missing the "mysqli" extension which is required by Sngine.</p><small>Back to your server admin or hosting provider to enable it for you</small>');
    }
    /* check if curl enabled */
    if(!extension_loaded('curl')) {
        _error("Installation Error", '<p class="text-center">Your PHP installation appears to be missing the "cURL" extension which is required by Sngine.</p><small>Back to your server admin or hosting provider to enable it for you</small>');
    }
    /* check if json_decode enabled */
    if(!function_exists('json_decode')) {
        _error("Installation Error", '<p class="text-center">Your PHP installation appears to be missing the "json_decode()" function which is required by Sngine.</p><small>Back to your server admin or hosting provider to enable it for you</small>');
    }
    /* check if base64_decode enabled */
    if(!function_exists('base64_decode')) {
        _error("Installation Error", '<p class="text-center">Your PHP installation appears to be missing the "base64_decode()" function which is required by Sngine.</p><small>Back to your server admin or hosting provider to enable it for you</small>');
    }
    /* check if mail enabled */
    if(!function_exists('mail')) {
        _error("Installation Error", '<p class="text-center">Your PHP installation appears to be missing the "mail()" function which is required by Sngine.</p><small>Back to your server admin or hosting provider to enable it for you</small>');
    }
    if(!function_exists('getimagesize')) {
        _error("Installation Error", '<p class="text-center">Your PHP installation appears to be missing the "getimagesize()" function which is required by Sngine.</p><small>Back to your server admin or hosting provider to enable it for you</small>');
    }
}


/**
 * update_system_options
 * 
 * @param array $args
 * @param boolean $error_thrown
 * @return void
 */
function update_system_options($args = [], $error_thrown = true) {
    global $db;
    $query_values = "";
    foreach ($args as $key => $value) {
        $query_values .= sprintf(" ('%s', %s),", $key, $value);
    }
    $query_values = substr($query_values, 0, -1);
    $db->query("INSERT INTO system_options (option_name, option_value) VALUES ".$query_values." ON DUPLICATE KEY UPDATE option_name = VALUES(option_name), option_value = VALUES(option_value)") or ($error_thrown)? _error("SQL_ERROR_THROWEN") : _error("Error", $db->error);
}


/**
 * get_licence_key
 * 
 * @param string $code
 * @return string
 */
function get_licence_key($code) {
	//bugs
	return '';
}


/**
 * get_system_protocol
 * 
 * @return string
 */
function get_system_protocol() {
    $is_secure = false;
    if (isset($_SERVER['HTTPS']) && strtolower($_SERVER['HTTPS']) == 'on') {
        $is_secure = true;
    } elseif (!empty($_SERVER['HTTP_X_FORWARDED_PROTO']) && $_SERVER['HTTP_X_FORWARDED_PROTO'] == 'https' || !empty($_SERVER['HTTP_X_FORWARDED_SSL']) && $_SERVER['HTTP_X_FORWARDED_SSL'] == 'on') {
        $is_secure = true;
    }
    return $is_secure ? 'https' : 'http';
}


/**
 * get_system_url
 * 
 * @return string
 */
function get_system_url() {
    $protocol = get_system_protocol();
    $system_url =  $protocol."://".$_SERVER['HTTP_HOST'].BASEPATH;
    return rtrim($system_url,'/');
}


/**
 * check_system_url
 * 
 * @return void
 */
function check_system_url() {
    $protocol = get_system_protocol();
    $parsed_url = parse_url(SYS_URL);
    if( ($parsed_url['scheme'] != $protocol) || ($parsed_url['host'] != $_SERVER['HTTP_HOST']) ) {
        header('Location: '.SYS_URL);
    }
}


/**
 * redirect
 * 
 * @param string $url
 * @return void
 */
function redirect($url = '') {
    if($url) {
        header('Location: '.SYS_URL.$url);
    } else {
        header('Location: '.SYS_URL);
    }
    exit;
}


/**
 * reload
 * 
 * @return void
 */
function reload() {
    header("Refresh:0");
    exit;
}



/* ------------------------------- */
/* Security */
/* ------------------------------- */

/**
 * secure
 * 
 * @param string $value
 * @param string $type
 * @param boolean $quoted
 * @return string
 */
function secure($value, $type = "", $quoted = true) {
    global $db;
    if($value !== 'null') {
        // [1] Sanitize
        /* Convert all applicable characters to HTML entities */
        $value = htmlentities($value, ENT_QUOTES, 'utf-8');
        // [2] Safe SQL
        $value = $db->real_escape_string($value);
        switch ($type) {
            case 'int':
                $value = ($quoted)? "'".intval($value)."'" : intval($value);
                break;
            case 'datetime':
                $value = ($quoted)? "'".set_datetime($value)."'" : set_datetime($value);
                break;
            case 'search':
                if($quoted) {
                    $value = (!is_empty($value))? "'%".$value."%'" : "''";
                } else {
                    $value = (!is_empty($value))? "'%%".$value."%%'" : "''";
                }
                break;
            default:
                $value = (!is_empty($value))? "'".$value."'" : "''";
                break;
        }
    }
    return $value;
}


/**
 * session_hash
 * 
 * @param string $hash
 * @return array
 */
function session_hash($hash) {
 //bugs
}


/**
 * _password_hash
 * 
 * @param string $password
 * @return string
 */
function _password_hash($password) {
    return password_hash($password, PASSWORD_DEFAULT);
}


/**
 * get_hash_key
 * 
 * @param integer $length
 * @return string
 */
function get_hash_key($length = 8) {
    $chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    $count = mb_strlen($chars);
    for ($i = 0, $result = ''; $i < $length; $i++) {
        $index = rand(0, $count - 1);
        $result .= mb_substr($chars, $index, 1);
    }
    return $result;
}


/**
 * get_hash_token
 * 
 * @return string
 */
function get_hash_token() {
    return md5(get_hash_number());
}


/**
 * get_hash_number
 * 
 * @return string
 */
function get_hash_number() {
    return time()*rand(1, 99999);
}



/* ------------------------------- */
/* Validation */
/* ------------------------------- */

/**
 * is_ajax
 * 
 * @return void
 */
function is_ajax() {
    if( !isset($_SERVER['HTTP_X_REQUESTED_WITH']) || ($_SERVER['HTTP_X_REQUESTED_WITH'] != 'XMLHttpRequest') ) {
        redirect();
    }
}


/**
 * is_empty
 * 
 * @param string $value
 * @return boolean
 */
function is_empty($value) {
    if(strlen(trim(preg_replace('/\xc2\xa0/',' ',$value))) == 0) {
        return true;
    } else {
        return false;
    }
}


/**
 * valid_email
 * 
 * @param string $email
 * @return boolean
 */
function valid_email($email) {
    if(filter_var($email, FILTER_VALIDATE_EMAIL) !== false) {
        return true;
    } else {
        return false;
    }
}


/**
 * valid_url
 * 
 * @param string $url
 * @return boolean
 */
function valid_url($url) {
    if(filter_var($url, FILTER_VALIDATE_URL) !== false) {
        return true;
    } else {
        return false;
    }
}


/**
 * valid_username
 * 
 * @param string $username
 * @return boolean
 */
function valid_username($username) {
    if(strlen($username) >= 3 && preg_match('/^[a-zA-Z0-9]+([_|.]?[a-zA-Z0-9])*$/', $username)) {
        return true;
    } else {
        return false;
    }
}


/**
 * reserved_username
 * 
 * @param string $username
 * @return boolean
 */
function reserved_username($username) {
    $reserved_usernames = array('install', 'static', 'contact', 'contacts', 'sign', 'signin', 'login', 'signup', 'register', 'signout', 'logout', 'reset', 'activation', 'connect', 'revoke', 'packages', 'started', 'search', 'friends', 'messages', 'message', 'notifications', 'notification', 'settings', 'setting', 'posts', 'post', 'photos', 'photo', 'create', 'pages', 'page', 'groups', 'group', 'events', 'event', 'games', 'game', 'saved', 'forums', 'forum', 'blogs', 'blog', 'articles', 'article', 'directory', 'products', 'product', 'market', 'admincp', 'admin', 'admins', 'modcp', 'moderator', 'moderators', 'moderatorcp', 'chat', 'ads', 'wallet', 'boosted', 'people', 'popular', 'movies', 'movie',  'api', 'apis', 'oauth', 'authorize');
    if(in_array(strtolower($username), $reserved_usernames)) {
        return true;
    } else {
        return false;
    }
}


/**
 * valid_name
 * 
 * @param string $name
 * @return boolean
 */
function valid_name($name) {
    if(preg_match('/[\'^£$%&*()}{@#~?><>,|=+¬]/', $name)) {
        return false;
    } else {
        return true;
    }
}


/**
 * valid_location
 * 
 * @param string $location
 * @return boolean
 */
function valid_location($location) {
    if(preg_match("/^[\\p{L} \-,()0-9]+$/ui", $location)) {
        return true;
    } else {
        return false;
    }
}


/**
 * valid_extension
 * 
 * @param string $extension
 * @param array $allowed_extensions
 * @return boolean
 */
function valid_extension($extension, $allowed_extensions) {
    $extensions = explode(',', $allowed_extensions);
    foreach ($extensions as $key => $value) {
        $extensions[$key] = strtolower(trim($value));
    }
    if(is_array($extensions) && in_array($extension, $extensions)) {
        return true;
    }
    return false;
}


/**
 * set_extensions_string
 * 
 * @param string $extensions
 * @return string
 */
function set_extensions_string($extensions) {
    $extensions_string = "";
    $extensions = explode(',', $extensions);
    foreach ($extensions as $key => $value) {
        $extensions_string .= ".".strtolower(trim($value)).",";
    }
    $extensions_string = substr($extensions_string, 0, -1);
    return $extensions_string;
}



/* ------------------------------- */
/* Date */
/* ------------------------------- */

/**
 * set_datetime
 * 
 * @param string $date
 * @return string
 */
function set_datetime($date) {
    global $system;
    $date = str_replace(['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨','٩'], range(0, 9), $date); /* check and replace arabic numbers if any */
    $datetime = DateTime::createFromFormat($system['system_datetime_format'], $date);
    return $datetime->format("Y-m-d H:i:s");
}


/**
 * get_datetime
 * 
 * @param string $date
 * @return string
 */
function get_datetime($date) {
    global $system;
    return date($system['system_datetime_format'], strtotime($date));
}



/* ------------------------------- */
/* JSON */
/* ------------------------------- */

/**
 * return_json
 * 
 * @param array $response
 * @return json
 */
function return_json($response = array()) {
    header('Content-Type: application/json');
    exit(json_encode($response));
}



/* ------------------------------- */
/* Error */
/* ------------------------------- */

/**
 * _error
 * 
 * @return void
 */
function _error() {
    $args = func_get_args();
    if(count($args) > 1) {
        $title = $args[0];
        $message = $args[1];
    } else {
        switch ($args[0]) {
            case 'DB_ERROR':
                $title = "Database Error";
                $message = "<div class='text-left'><h1>"."Error establishing a database connection"."</h1>
                            <p>"."This either means that the username and password information in your config.php file is incorrect or we can't contact the database server at localhost. This could mean your host's database server is down."."</p>
                            <ul>
                                <li>"."Are you sure you have the correct username and password?"."</li>
                                <li>"."Are you sure that you have typed the correct hostname?"."</li>
                                <li>"."Are you sure that the database server is running?"."</li>
                            </ul>
                            <p>"."If you're unsure what these terms mean you should probably contact your host. If you still need help you can always visit the"." <a href='http://support.zamblek.com'>"."Sngine Support".".</a></p>
                            </div>";
                break;

            case 'SQL_ERROR':
                $title = __("Database Error");
                $message = __("An error occurred while writing to database. Please try again later");
                if(DEBUGGING) {
                    $backtrace = debug_backtrace();
                    $line=$backtrace[0]['line'];
                    $file=$backtrace[0]['file'];
                    $message .= "<br><br><small>This error function was called from line $line in file $file</small>";
                }
                break;

            case 'SQL_ERROR_THROWEN':
                $message = __("An error occurred while writing to database. Please try again later");
                if(DEBUGGING) {
                    $backtrace = debug_backtrace();
                    $line=$backtrace[0]['line'];
                    $file=$backtrace[0]['file'];
                    $message .= "<br><br><small>This error function was called from line $line in file $file</small>";
                }
                throw new Exception($message);
                break;

            case '404':
                global $smarty;
                header('HTTP/1.0 404 Not Found');
                $title = __("404 Not Found");
                $message = __("Sorry but the page you are looking for does not exist, have been removed. name changed or is temporarily unavailable");
                if(DEBUGGING) {
                    $backtrace = debug_backtrace();
                    $line=$backtrace[0]['line'];
                    $file=$backtrace[0]['file'];
                    $message .= "<br><br><small>This error function was called from line $line in file $file</small>";
                }
                if(isset($smarty)) {
                    $smarty->assign('message', $message);
                    page_header($title);
                    page_footer('404');
                    exit;
                }
                break;

            case '400':
                header('HTTP/1.0 400 Bad Request');
                if(DEBUGGING) {
                    $backtrace = debug_backtrace();
                    $line=$backtrace[0]['line'];
                    $file=$backtrace[0]['file'];
                    exit("This error function was called from line $line in file $file");
                }
                exit;
                break;

            case '403':
                header('HTTP/1.0 403 Access Denied');
                if(DEBUGGING) {
                    $backtrace = debug_backtrace();
                    $line=$backtrace[0]['line'];
                    $file=$backtrace[0]['file'];
                    exit("This error function was called from line $line in file $file");
                }
                exit;
                break;
            
            default:
                $title = __("Error");
                $message = __("There is some thing went wrong");
                if(DEBUGGING) {
                    $backtrace = debug_backtrace();
                    $line=$backtrace[0]['line'];
                    $file=$backtrace[0]['file'];
                    $message .= "<br><br>"."<small>This error function was called from line $line in file $file</small>";
                }
                break;
        }
    }
    echo '<!DOCTYPE html>
            <html>
            <head>
                <meta charset="utf-8">
                <title>'.$title.'</title>
                <style type="text/css">
                    html {
                        background: #f1f1f1;
                    }
                    body {
                        color: #555;
                        font-family: "Open Sans", Arial,sans-serif;
                        margin: 0;
                        padding: 0;
                    }
                    .error-title {
                        background: #ce3426;
                        color: #fff;
                        text-align: center;
                        font-size: 34px;
                        font-weight: 100;
                        line-height: 50px;
                        padding: 60px 0;
                    }
                    .error-message {
                        margin: 1em auto;
                        padding: 1em 2em;
                        max-width: 600px;
                        font-size: 1em;
                        line-height: 1.8em;
                        text-align: center;
                    }
                    .error-message .code,
                    .error-message p {
                        margin-top: 0;
                        margin-bottom: 1.3em;
                    }
                    .error-message .code {
                        font-family: Consolas, Monaco, monospace;
                        background: rgba(0, 0, 0, 0.7);
                        padding: 10px;
                        color: rgba(255, 255, 255, 0.7);
                        word-break: break-all;
                        border-radius: 2px;
                    }
                    h1 {
                        font-size: 1.2em;
                    }
                    
                    ul li {
                        margin-bottom: 1em;
                        font-size: 0.9em;
                    }
                    a {
                        color: #ce3426;
                        text-decoration: none;
                    }
                    a:hover {
                        text-decoration: underline;
                    }
                    .button {
                        background: #f7f7f7;
                        border: 1px solid #cccccc;
                        color: #555;
                        display: inline-block;
                        text-decoration: none;
                        margin: 0;
                        padding: 5px 10px;
                        cursor: pointer;
                        -webkit-border-radius: 3px;
                        -webkit-appearance: none;
                        border-radius: 3px;
                        white-space: nowrap;
                        -webkit-box-sizing: border-box;
                        -moz-box-sizing:    border-box;
                        box-sizing:         border-box;

                        -webkit-box-shadow: inset 0 1px 0 #fff, 0 1px 0 rgba(0,0,0,.08);
                        box-shadow: inset 0 1px 0 #fff, 0 1px 0 rgba(0,0,0,.08);
                        vertical-align: top;
                    }

                    .button.button-large {
                        height: 29px;
                        line-height: 28px;
                        padding: 0 12px;
                    }

                    .button:hover,
                    .button:focus {
                        background: #fafafa;
                        border-color: #999;
                        color: #222;
                        text-decoration: none;
                    }

                    .button:focus  {
                        -webkit-box-shadow: 1px 1px 1px rgba(0,0,0,.2);
                        box-shadow: 1px 1px 1px rgba(0,0,0,.2);
                    }

                    .button:active {
                        background: #eee;
                        border-color: #999;
                        color: #333;
                        -webkit-box-shadow: inset 0 2px 5px -3px rgba( 0, 0, 0, 0.5 );
                        box-shadow: inset 0 2px 5px -3px rgba( 0, 0, 0, 0.5 );
                    }
                    .text-left {
                        text-align: left;
                    }
                    .text-center {
                        text-align: center;
                    }
                </style>
            </head>
            <body>
                <div class="error-title">'.$title.'</div>
                <div class="error-message">'.$message.'</div>
            </body>
            </html>';
    exit;
}



/* ------------------------------- */
/* Email */
/* ------------------------------- */

/**
 * _email
 * 
 * @param string $email
 * @param string $subject
 * @param string $body
 * @param boolean $is_html
 * @param boolean $only_smtp
 * @return boolean
 */
function _email($email, $subject, $body, $is_html = false, $only_smtp = false) {
    global $system;
    /* set header */
    $header  = "MIME-Version: 1.0\r\n";
    $header .= "Mailer: ".$system['system_title']."\r\n";
    if($system['system_email']) {
        $headers = "From: ".$system['system_email']."\r\n";
        $headers .= "Reply-To: ".$system['system_email']."\r\n";
    }
    if($is_html) {
        $header .= "Content-Type: text/html; charset=\"utf-8\"\r\n";
    } else {
        $header .= "Content-Type: text/plain; charset=\"utf-8\"\r\n";
    }
    /* send email */
    if($system['email_smtp_enabled']) {
        /* SMTP */
        require_once(ABSPATH.'includes/libs/PHPMailer/PHPMailer.php');
        require_once(ABSPATH.'includes/libs/PHPMailer/SMTP.php');
        require_once(ABSPATH.'includes/libs/PHPMailer/Exception.php');
        $mail = new PHPMailer\PHPMailer\PHPMailer;
        $mail->CharSet = "UTF-8";
        $mail->isSMTP();
        $mail->Host = $system['email_smtp_server'];
        $mail->SMTPAuth = ($system['email_smtp_authentication'])? true : false;
        $mail->Username = $system['email_smtp_username'];
        $mail->Password = $system['email_smtp_password'];
        $mail->SMTPSecure = ($system['email_smtp_ssl'])? 'ssl': 'tls';
        $mail->Port = $system['email_smtp_port'];
        $setfrom = (is_empty($system['email_smtp_setfrom']))? $system['email_smtp_username']: $system['email_smtp_setfrom'];
        $mail->setFrom($setfrom, $system['system_title']);
        $mail->addAddress($email);
        $mail->Subject = $subject;
        if($is_html) {
            $mail->isHTML(true);
            $mail->AltBody = strip_tags($body);
        }
        $mail->Body = $body;
        if(!$mail->send()) {
            if($only_smtp) {
                return false;
            }
            /* send using mail() */
            if(!mail($email, $subject, $body, $header)) {
                return false;
            }
        }
    } else {
        if($only_smtp) {
            return false;
        }
        /* send using mail() */
        if(!mail($email, $subject, $body, $header)) {
            return false;
        }
    }
    return true;
}


/**
 * email_smtp_test
 * 
 * @return void
 */
function email_smtp_test() {
    global $system;
    /* prepare test email */
    $subject = __("Test SMTP Connection on")." ".$system['system_title'];
    $body  = __("This is a test email");
    $body .= "\r\n\r".$system['system_title']." ".__("Team");
    /* send email */
    if(!_email($system['system_email'], $subject, $body, false, true)) {
        throw new Exception(__("Test email could not be sent. Please check your settings"));
    }
}



/* ------------------------------- */
/* SMS */
/* ------------------------------- */

/**
 * sms_send
 * 
 * @param string $phone
 * @param string $message
 * @return boolean
 */
function sms_send($phone, $message) {
    global $system;
    switch ($system['sms_provider']) {
        case 'twilio':
            require_once(ABSPATH.'includes/libs/Twilio/autoload.php');
            $client = new Twilio\Rest\Client($system['twilio_sid'], $system['twilio_token']);
            $message = $client->account->messages->create(
                $phone,
                array(
                    'from' => $system['twilio_phone'],
                    'body' => $message
                )
            );
            if(!$message->sid) {
                return false;
            }
            break;
        
        case 'bulksms':
            $username = $system['bulksms_username'];
            $password = $system['bulksms_password'];
            $messages = array(
                array(
                    'to' => $phone,
                    'body' => $message
                )
            );
            $ch = curl_init();
            $headers = array(
                'Content-Type:application/json',
                'Authorization:Basic '. base64_encode("$username:$password")
            );
            curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
            curl_setopt ( $ch, CURLOPT_URL, "https://api.bulksms.com/v1/messages?auto-unicode=true&longMessageMaxParts=30" );
            curl_setopt ( $ch, CURLOPT_POST, 1 );
            curl_setopt ( $ch, CURLOPT_RETURNTRANSFER, 1 );
            curl_setopt ( $ch, CURLOPT_POSTFIELDS, json_encode($messages) );
            /* allow cUrl functions 20 seconds to execute */
            curl_setopt ( $ch, CURLOPT_TIMEOUT, 20 );
            /* wait 10 seconds while trying to connect */
            curl_setopt ( $ch, CURLOPT_CONNECTTIMEOUT, 10 );
            $output = array();
            $output['server_response'] = curl_exec( $ch );
            $curl_info = curl_getinfo( $ch );
            $output['http_status'] = $curl_info[ 'http_code' ];
            $output['error'] = curl_error($ch);
            curl_close( $ch );
            if($output['http_status'] != 201) {
                return false;
            }
            break;

        case 'infobip':
            $sms = array(
                "from" => $system['system_title'],
                "to" => $phone,
                "text" => $message
            );
            $ch = curl_init();
            $header = array("Content-Type:application/json", "Accept:application/json");
            curl_setopt($ch, CURLOPT_URL, "https://api.infobip.com/sms/1/text/single");
            curl_setopt($ch, CURLOPT_HTTPHEADER, $header);
            curl_setopt($ch, CURLOPT_HTTPAUTH, CURLAUTH_BASIC);
            curl_setopt($ch, CURLOPT_USERPWD, $system['infobip_username'] . ":" . $system['infobip_password']);
            curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 2);
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
            curl_setopt($ch, CURLOPT_FOLLOWLOCATION, TRUE);
            curl_setopt($ch, CURLOPT_MAXREDIRS, 2);
            curl_setopt($ch, CURLOPT_POST, 1);
            curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($sms));
            curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
            $response = curl_exec($ch);
            $http_status = curl_getinfo($ch, CURLINFO_HTTP_CODE);
            curl_close($ch);
            if(!($http_status >= 200 && $http_status < 300)) {
                return false;
            }
            break;
    }
    return true;
}


/**
 * sms_test
 * 
 * @return void
 */
function sms_test() {
    global $system;
    if(is_empty($system['system_phone'])) {
        throw new Exception(__("You need to enter Test Phone Number"));
    }
    switch ($system['sms_provider']) {
        case 'twilio':
            require_once(ABSPATH.'includes/libs/Twilio/autoload.php');
            $client = new Twilio\Rest\Client($system['twilio_sid'], $system['twilio_token']);
            $message = $client->account->messages->create(
                $system['system_phone'],
                array(
                    'from' => $system['twilio_phone'],
                    'body' => __("Test SMS from")." ".$system['system_title']
                )
            );
            if(!$message->sid) {
                throw new Exception(__("Test SMS could not be sent. Please check your settings"));
            }
            break;
        
        case 'bulksms':
            $username = $system['bulksms_username'];
            $password = $system['bulksms_password'];
            $messages = array(
                array(
                    'to' => $system['system_phone'],
                    'body' => __("Test SMS from")." ".$system['system_title']
                )
            );
            $ch = curl_init();
            $headers = array(
                'Content-Type:application/json',
                'Authorization:Basic '. base64_encode("$username:$password")
            );
            curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
            curl_setopt ( $ch, CURLOPT_URL, "https://api.bulksms.com/v1/messages?auto-unicode=true&longMessageMaxParts=30" );
            curl_setopt ( $ch, CURLOPT_POST, 1 );
            curl_setopt ( $ch, CURLOPT_RETURNTRANSFER, 1 );
            curl_setopt ( $ch, CURLOPT_POSTFIELDS, json_encode($messages) );
            /* allow cUrl functions 20 seconds to execute */
            curl_setopt ( $ch, CURLOPT_TIMEOUT, 20 );
            /* Wait 10 seconds while trying to connect */
            curl_setopt ( $ch, CURLOPT_CONNECTTIMEOUT, 10 );
            $output = array();
            $output['server_response'] = curl_exec( $ch );
            $curl_info = curl_getinfo( $ch );
            $output['http_status'] = $curl_info[ 'http_code' ];
            $output['error'] = curl_error($ch);
            curl_close( $ch );
            if ($output['http_status'] != 201) {
                throw new Exception(__("Test SMS could not be sent. Please check your settings"));
            }
            break;

        case 'infobip':
            $sms = array(
                "from" => $system['system_title'],
                "to" => $system['system_phone'],
                "text" => __("Test SMS from")." ".$system['system_title']
            );
            $ch = curl_init();
            $header = array("Content-Type:application/json", "Accept:application/json");
            curl_setopt($ch, CURLOPT_URL, "https://api.infobip.com/sms/1/text/single");
            curl_setopt($ch, CURLOPT_HTTPHEADER, $header);
            curl_setopt($ch, CURLOPT_HTTPAUTH, CURLAUTH_BASIC);
            curl_setopt($ch, CURLOPT_USERPWD, $system['infobip_username'] . ":" . $system['infobip_password']);
            curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 2);
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
            curl_setopt($ch, CURLOPT_FOLLOWLOCATION, TRUE);
            curl_setopt($ch, CURLOPT_MAXREDIRS, 2);
            curl_setopt($ch, CURLOPT_POST, 1);
            curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($sms));
            curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
            $response = curl_exec($ch);
            $http_status = curl_getinfo($ch, CURLINFO_HTTP_CODE);
            curl_close($ch);
            if(!($http_status >= 200 && $http_status < 300)) {
                throw new Exception(__("Test SMS could not be sent. Please check your settings"));
            }
            break;
    }
}



/* ------------------------------- */
/* Google Vision */
/* ------------------------------- */

/**
 * google_vision_test
 * 
 * @return void
 */
function google_vision_test() {
    global $system;
    $image_source = $system['system_url'].'/content/themes/'.$system['theme'].'/images/blank_profile_male.jpg';
    $content = '{
        "requests":[
            {
                "image":{
                    "content": "'.base64_encode(file_get_contents($image_source)).'",
                },
                "features":[
                    {
                        "type":"SAFE_SEARCH_DETECTION",
                        "maxResults":1
                    },
                    {
                        "type":"WEB_DETECTION",
                        "maxResults":2
                    }
                ]
            }
        ]
    }';
    try {
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, 'https://vision.googleapis.com/v1/images:annotate?key='.$system['adult_images_api_key']);
        curl_setopt($ch, CURLOPT_HTTPHEADER, array('Content-Type: application/json','Content-Length: ' . strlen($content)));
        curl_setopt($ch, CURLOPT_CUSTOMREQUEST, 'POST');
        curl_setopt($ch, CURLOPT_POSTFIELDS,$content);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        $response  = curl_exec($ch);
        curl_close($ch);
        $response = json_decode($response);
        if($response->error) {
            throw new Exception($response->error->message);
        }
        if($response->responses[0]->error) {
            throw new Exception($response->responses[0]->error->message);
        }
        if(!$response->responses[0]->safeSearchAnnotation) {
            throw new Exception(__("Connection Failed, Please check your settings"));
        }
    } catch (Exception $e) {
        if(DEBUGGING) {
            throw new Exception($e->getMessage());
        } else {
            throw new Exception(__("Connection Failed, Please check your settings"));
        }
    }
}


/**
 * google_vision_check
 * 
 * @param string $image_source
 * @return boolean
 */
function google_vision_check($image_source) {
    global $system;
    $content = '{
        "requests":[
            {
                "image":{
                    "content": "'.base64_encode(file_get_contents($image_source)).'",
                },
                "features":[
                    {
                        "type":"SAFE_SEARCH_DETECTION",
                        "maxResults":1
                    },
                    {
                        "type":"WEB_DETECTION",
                        "maxResults":2
                    }
                ]
            }
        ]
    }';
    try {
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, 'https://vision.googleapis.com/v1/images:annotate?key='.$system['adult_images_api_key']);
        curl_setopt($ch, CURLOPT_HTTPHEADER, array('Content-Type: application/json','Content-Length: ' . strlen($content)));
        curl_setopt($ch, CURLOPT_CUSTOMREQUEST, 'POST');
        curl_setopt($ch, CURLOPT_POSTFIELDS,$content);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        $response  = curl_exec($ch);
        curl_close($ch);
        $response = json_decode($response);
        if($response->error) {
            return false;
        }
        if($response->responses[0]->error) {
            return false;
        }
        if($response->responses[0]->safeSearchAnnotation->adult == 'LIKELY' || $response->responses[0]->safeSearchAnnotation->adult == 'VERY_LIKELY') {
            return true;
        } else {
            return false;
        }
    } catch (Exception $e) {
        return false;
    }
}


/* ------------------------------- */
/* Cloud Storage */
/* ------------------------------- */

/**
 * aws_s3_test
 * 
 * @return void
 */
function aws_s3_test() {
    global $system;
    require_once(ABSPATH.'includes/libs/AWS/aws-autoloader.php');
    try {
        $s3Client = Aws\S3\S3Client::factory(array(
            'version'    => 'latest',
            'region'      => $system['s3_region'],
            'credentials' => array(
                'key'    => $system['s3_key'],
                'secret' => $system['s3_secret'],
            )
        ));
        $buckets = $s3Client->listBuckets();
        if(empty($buckets)) {
            throw new Exception(__("There is no buckets in your account"));
        }
        if(!$s3Client->doesBucketExist($system['s3_bucket'])) {
            throw new Exception(__("There is no bucket with this name in your account"));
        }
    } catch (Exception $e) {
        if(DEBUGGING) {
            throw new Exception($e->getMessage());
        } else {
            throw new Exception(__("Connection Failed, Please check your settings"));
        }
    }
}


/**
 * aws_s3_upload
 * 
 * @param string $file_source
 * @param string $file_name
 * @return void
 */
function aws_s3_upload($file_source, $file_name) {
    global $system;
    require_once(ABSPATH.'includes/libs/AWS/aws-autoloader.php');
    $s3Client = Aws\S3\S3Client::factory(array(
        'version'    => 'latest',
        'region'      => $system['s3_region'],
        'credentials' => array(
            'key'    => $system['s3_key'],
            'secret' => $system['s3_secret'],
        )
    ));
    $Key = 'uploads/'.$file_name;
    $s3Client->putObject([
        'Bucket' => $system['s3_bucket'],
        'Key'    => $Key,
        'Body'   => fopen($file_source, 'r+'),
        'ACL'    => 'public-read',
    ]);
    /* remove local file */
    gc_collect_cycles();
    if($s3Client->doesObjectExist($system['s3_bucket'], $Key)) {
        unlink($file_source);
    }
}


/**
 * digitalocean_space_test
 * 
 * @return void
 */
function digitalocean_space_test() {
    global $system;
    require_once(ABSPATH.'includes/libs/Spaces/spaces.php');
    try {
        $space = new SpacesConnect($system['digitalocean_key'], $system['digitalocean_secret'], $system['digitalocean_space_name'], $system['digitalocean_space_region']);
        $buckets = $space->ListSpaces();
        if(empty($buckets)) {
            throw new Exception(__("There is no spaces in your account"));
        }
        if(!$space->GetSpaceName()) {
            throw new Exception(__("There is no space with this name in your account"));
        }
        $space->PutCORS(array(
            'AllowedHeaders' => array(
                'Authorization'
            ),
            'AllowedMethods' => array(
                'POST',
                'GET',
                'PUT'
            ), // REQUIRED
            'AllowedOrigins' => array(
                '*'
            ), // REQUIRED
            'ExposeHeaders' => array(),
            'MaxAgeSeconds' => 3000
        ));
    } catch (Exception $e) {
        if(DEBUGGING) {
            throw new Exception($e->getMessage());
        } else {
            throw new Exception(__("Connection Failed, Please check your settings"));
        }
    }
}


/**
 * digitalocean_space_upload
 * 
 * @param string $file_source
 * @param string $file_name
 * @return void
 */
function digitalocean_space_upload($file_source, $file_name) {
    global $system;
    require_once(ABSPATH.'includes/libs/Spaces/spaces.php');
    $space = new SpacesConnect($system['digitalocean_key'], $system['digitalocean_secret'], $system['digitalocean_space_name'], $system['digitalocean_space_region']);
    $Key = 'uploads/'.$file_name;
    $space->UploadFile($file_source, "public", $Key, "");
    /* remove local file */
    if($space->DoesObjectExist($Key)) {
        unlink($file_source);
    }
}


/**
 * ftp_test
 * 
 * @return void
 */
function ftp_test() {
    global $system;
    require_once(ABSPATH.'includes/libs/FTP/FtpException.php');
    require_once(ABSPATH.'includes/libs/FTP/FtpWrapper.php');
    require_once(ABSPATH.'includes/libs/FTP/FtpClient.php');
    try {
        $ftp = new \FtpClient\FtpClient();
        $ftp->connect($system['ftp_hostname'], false, $system['ftp_port']);
        $ftp->login($system['ftp_username'], $system['ftp_password']);
    } catch (Exception $e) {
        if(DEBUGGING) {
            throw new Exception($e->getMessage());
        } else {
            throw new Exception(__("Connection Failed, Please check your settings"));
        }
    }
}


/**
 * ftp_upload
 * 
 * @param string $file_source
 * @param string $file_name
 * @return void
 */
function ftp_upload($file_source, $file_name) {
    global $system;
    require_once(ABSPATH.'includes/libs/FTP/FtpException.php');
    require_once(ABSPATH.'includes/libs/FTP/FtpWrapper.php');
    require_once(ABSPATH.'includes/libs/FTP/FtpClient.php');
    $ftp = new \FtpClient\FtpClient();
    $ftp->connect($system['ftp_hostname'], false, $system['ftp_port']);
    $ftp->login($system['ftp_username'], $system['ftp_password']);
    if(!empty($system['ftp_path']) && $system['ftp_path'] != "./") {
        $ftp->chdir($system['ftp_path']);
    }
    $file_path = substr($file_name, 0, strrpos($file_name, '/'));
    $ftp_path_info = explode('/', $file_path);
    $ftp_path = '';
    if(!$ftp->isDir($file_path)) {
        foreach($ftp_path_info as $key => $value) {
            if(!empty($ftp_path)) {
                $ftp_path .= '/' . $value . '/' ;
            } else {
                $ftp_path .= $value . '/' ;
            }
            if(!$ftp->isDir($ftp_path)) {
                $mkdir = $ftp->mkdir($ftp_path);
            }
        } 
    }
    $ftp->chdir($file_path);
    $ftp->pasv(true);
    if ($ftp->putFromPath($file_source)) {
        unlink($file_source);
    }
    $ftp->close();
}


/**
 * delete_uploads_file
 * 
 * @param string $file_name
 * @return void
 */
function delete_uploads_file($file_name) {
    global $system;
    if(!$file_name) {
        return;
    }
    if($system['s3_enabled']) {
        /* Amazon S3 */
        require_once(ABSPATH.'includes/libs/AWS/aws-autoloader.php');
        $s3Client = Aws\S3\S3Client::factory(array(
            'version'    => 'latest',
            'region'      => $system['s3_region'],
            'credentials' => array(
                'key'    => $system['s3_key'],
                'secret' => $system['s3_secret'],
            )
        ));
        $Key = 'uploads/'.$file_name;
        if($s3Client->doesObjectExist($system['s3_bucket'], $Key)) {
            $s3Client->deleteObject([
                'Bucket' => $system['s3_bucket'],
                'Key'    => $Key,
            ]);
        }
    } elseif ($system['digitalocean_enabled']) {
        /* DigitalOcean */
        require_once(ABSPATH.'includes/libs/Spaces/spaces.php');
        $space = new SpacesConnect($system['digitalocean_key'], $system['digitalocean_secret'], $system['digitalocean_space_name'], $system['digitalocean_space_region']);
        $Key = 'uploads/'.$file_name;
        if($space->DoesObjectExist($Key)) {
            $space->DeleteObject($Key);
        }
    } elseif ($system['ftp_enabled']) {
        /* FTP */
        require_once(ABSPATH.'includes/libs/FTP/FtpException.php');
        require_once(ABSPATH.'includes/libs/FTP/FtpWrapper.php');
        require_once(ABSPATH.'includes/libs/FTP/FtpClient.php');
        $ftp = new \FtpClient\FtpClient();
        $ftp->connect($system['ftp_hostname'], false, $system['ftp_port']);
        $ftp->login($system['ftp_username'], $system['ftp_password']);
        if(!empty($system['ftp_path']) && $system['ftp_path'] != "./") {
            $ftp->chdir($system['ftp_path']);
        }
        $file_path = substr($file_name, 0, strrpos($file_name, '/'));
        $file_name = substr($file_name, strrpos($file_name, '/') + 1);
        if(!$ftp->isDir($file_path)) {
            return;
        }
        $ftp->chdir($file_path);
        $ftp->pasv(true);
        $ftp->remove($file_name);
        $ftp->close();
    } else {
        /* local server */
        $realpath = realpath(ABSPATH.$system['uploads_directory'].'/'.$file_name);
        if(is_file($realpath) && file_exists($realpath)) {
            unlink($realpath);
        }
    }
}



/* ------------------------------- */
/* PayPal */
/* ------------------------------- */

/**
 * paypal
 * 
 * @param string $handle
 * @param string $price
 * @param integer $package_id
 * @return string
 */
function paypal($handle, $price, $package_id = null) {
    global $system;
    /* prepare */
    switch ($handle) {
        case 'packages':
            $product = $system['system_title']." ".__('Pro Package');
            $description = __('Pay For')." ".$system['system_title'];
            $URL['success'] = $system['system_url']."/paypal.php?status=success&handle=packages&package_id=".$package_id;
            $URL['cancel'] = $system['system_url']."/paypal.php?status=cancel";
            break;

        case 'wallet':
            $product = $system['system_title']." ".__('Wallet');
            $description = __('Pay For')." ".$system['system_title'];
            $URL['success'] = $system['system_url']."/paypal.php?status=success&handle=wallet";
            $URL['cancel'] = $system['system_url']."/paypal.php?status=cancel";
            $_SESSION['wallet_replenish_amount'] = $price;
            break;
        
        default:
            _error(400);
            break;
    }
    /* Paypal */
    require_once(ABSPATH.'includes/libs/PayPal/autoload.php');
    $paypal = new \PayPal\Rest\ApiContext(
        new \PayPal\Auth\OAuthTokenCredential(
            $system['paypal_id'],
            $system['paypal_secret']
        )
    );
    $paypal->setConfig(
        array(
            'mode' => $system['paypal_mode']
        )
    );
    $payer = new PayPal\Api\Payer();
    $payer->setPaymentMethod('paypal');
    $item = new PayPal\Api\Item();
    $item->setName($product)->setQuantity(1)->setPrice($price)->setCurrency($system['system_currency']);
    $itemList = new PayPal\Api\ItemList();
    $itemList->setItems(array(
        $item
    ));
    $details = new PayPal\Api\Details();
    $details->setSubtotal($price);
    $amount = new PayPal\Api\Amount();
    $amount->setCurrency($system['system_currency'])->setTotal($price)->setDetails($details);
    $transaction = new PayPal\Api\Transaction();
    $transaction->setAmount($amount)->setItemList($itemList)->setDescription($description)->setInvoiceNumber(uniqid());
    $redirectUrls = new PayPal\Api\RedirectUrls();
    $redirectUrls->setReturnUrl($URL['success'])->setCancelUrl($URL['cancel']);
    $payment = new PayPal\Api\Payment();
    $payment->setIntent('sale')->setPayer($payer)->setRedirectUrls($redirectUrls)->setTransactions(array(
        $transaction
    ));
    $payment->create($paypal);
    return $payment->getApprovalLink();
}


/**
 * paypal_check
 * 
 * @param string $payment_id
 * @param string $payer_id
 * @return boolean
 */
function paypal_check($payment_id, $payer_id) {
    global $system;
    require_once(ABSPATH.'includes/libs/PayPal/autoload.php');
    $paypal = new \PayPal\Rest\ApiContext(
        new \PayPal\Auth\OAuthTokenCredential(
            $system['paypal_id'],
            $system['paypal_secret']
        )
    );
    $paypal->setConfig(
        array(
            'mode' => $system['paypal_mode']
        )
    );
    $payment = PayPal\Api\Payment::get($payment_id, $paypal);
    $execute = new PayPal\Api\PaymentExecution();
    $execute->setPayerId($payer_id);
    $result = $payment->execute($execute, $paypal);
    return true;
}



/* ------------------------------- */
/* User Access */
/* ------------------------------- */

/**
 * user_access
 * 
 * @param boolean $is_ajax
 * @return void
 */
function user_access($is_ajax = false) {
    global $user, $system;
    if($is_ajax) {
        /* check user logged in */
        if(!$user->_logged_in) {
            modal('LOGIN');
        }
        /* check user activated */
        if($system['activation_enabled'] && !$user->_data['user_activated']) {
            modal("MESSAGE", __("Not Activated"), __("Before you can interact with other users, you need to confirm your email address"));
        }
    } else {
        if(!$user->_logged_in) {
            user_login();
        } else {
            /* check registration type */
            if($system['registration_type'] == "paid" && $user->_data['user_group'] > '1' && !$user->_data['user_subscribed']) {
                redirect('/packages');
            }
            /* check if getted started */
            if($system['getting_started'] && !$user->_data['user_started']) {
                redirect('/started');
            }
        }
    }
}


/**
 * user_login
 * 
 * @return void
 */
function user_login() {
    global $smarty;
    $smarty->assign('highlight', __("You must sign in to see this page"));
    page_header(__("Sign in"));
    page_footer('sign');
    exit;
}



/* ------------------------------- */
/* Modal */
/* ------------------------------- */

/**
 * modal
 * 
 * @return json
 */
function modal() {
    $args = func_get_args();
    switch ($args[0]) {
        case 'LOGIN':
            return_json( array("callback" => "modal('#modal-login')") );
            break;
        case 'MESSAGE':
            return_json( array("callback" => "modal('#modal-message', {title: '".$args[1]."', message: '".addslashes($args[2])."'})") );
            break;
        case 'ERROR':
            return_json( array("callback" => "modal('#modal-error', {title: '".$args[1]."', message: '".addslashes($args[2])."'})") );
            break;
        case 'SUCCESS':
            return_json( array("callback" => "modal('#modal-success', {title: '".$args[1]."', message: '".addslashes($args[2])."'})") );
            break;
        default:
            if(isset($args[1])) {
                return_json( array("callback" => "modal('".$args[0]."', ".$args[1].")") );
            } else {
                return_json( array("callback" => "modal('".$args[0]."')") );
            }
            break;
    }
}



/* ------------------------------- */
/* Popover */
/* ------------------------------- */

/**
 * popover
 * 
 * @param integer $uid
 * @param string $username
 * @param string $name
 * @return string
 */
function popover($uid, $username, $name) {
    global $system;
    $popover = '<span class="js_user-popover" data-uid="'.$uid.'"><a href="'.$system['system_url'].'/'.$username.'">'.$name.'</a></span>';
    return $popover;
}



/* ------------------------------- */
/* Page */
/* ------------------------------- */

/**
 * page_header
 * 
 * @param string $title
 * @param string $description
 * @return void
 */
function page_header($title, $description = '', $image = '') {
    global $smarty, $system;
    $description = ($description != '')? $description : $system['system_description'];
    if($image == '') {
        if($system['system_ogimage']) {
            $image = $system['system_uploads'].'/'.$system['system_ogimage'];
        } else {
            $image = $system['system_url'].'/content/themes/'.$system['theme'].'/images/og-image.jpg';
        }
    }
    $smarty->assign('page_title', $title);
    $smarty->assign('page_description', $description);
    $smarty->assign('page_image', $image);
}


/**
 * page_footer
 * 
 * @param string $page
 * @return void
 */
function page_footer($page) {
    global $smarty;
    $smarty->assign('page', $page);
    $smarty->display("$page.tpl");
}



/* ------------------------------- */
/* Text */
/* ------------------------------- */

/**
 * decode_urls
 * 
 * @param string $text
 * @return string
 */
function decode_urls($text) {
    $text = preg_replace('/(https?:\/\/[^\s]+)/', "<a target='_blank' href=\"$1\">$1</a>", $text);
    return $text;
}



/* ------------------------------- */
/* Post Feelings */
/* ------------------------------- */

/**
 * get_feelings
 * 
 * @return array
 */
function get_feelings() {
    $feelings = array(
        array("icon" => "smile",          "action" => "Feeling",      "text" => __("Feeling"),      "placeholder" => __("How are you feeling?")),
        array("icon" => "headphones",     "action" => "Listening To", "text" => __("Listening To"), "placeholder" => __("What are you listening to?")),
        array("icon" => "eyeglasses",     "action" => "Watching",     "text" => __("Watching"),     "placeholder" => __("What are you watching?")),
        array("icon" => "video-game",     "action" => "Playing",      "text" => __("Playing"),      "placeholder" => __("What are you playing?")),
        array("icon" => "cake",           "action" => "Eating",       "text" => __("Eating"),       "placeholder" => __("What are you eating?")),
        array("icon" => "tropical-drink", "action" => "Drinking",     "text" => __("Drinking"),     "placeholder" => __("What are you drinking?")),
        array("icon" => "airplane",       "action" => "Traveling To", "text" => __("Traveling To"), "placeholder" => __("Where are you going?")),
        array("icon" => "books",          "action" => "Reading",      "text" => __("Reading"),      "placeholder" => __("What are you reading?")),
        array("icon" => "calendar",       "action" => "Attending",    "text" => __("Attending"),    "placeholder" => __("What are you attending?")),
        array("icon" => "tada",           "action" => "Celebrating",  "text" => __("Celebrating"),  "placeholder" => __("What are you celebrating?")),
        array("icon" => "mag-right",      "action" => "Looking For",  "text" => __("Looking For"),  "placeholder" => __("What are you looking for?"))
    );
    return $feelings;
}


/**
 * get_feelings_types
 * 
 * @return array
 */
function get_feelings_types() {
    $feelings_types = array(
        array("icon" => "smile",                         "action" => "Happy",      "text" => __("Happy")),
        array("icon" => "heart-eyes",                    "action" => "Loved",      "text" => __("Loved")),
        array("icon" => "satisfied",                     "action" => "Satisfied",  "text" => __("Satisfied")),
        array("icon" => "muscle",                        "action" => "Strong",     "text" => __("Strong")),
        array("icon" => "disappointed",                  "action" => "Sad",        "text" => __("Sad")),
        array("icon" => "stuck-out-tongue-winking-eye",  "action" => "Crazy",      "text" => __("Crazy")),
        array("icon" => "sweat",                         "action" => "Tired",      "text" => __("Tired")),
        array("icon" => "sleeping",                      "action" => "Sleepy",     "text" => __("Sleepy")),
        array("icon" => "confused",                      "action" => "Confused",   "text" => __("Confused")),
        array("icon" => "worried",                       "action" => "Worried",    "text" => __("Worried")),
        array("icon" => "angry",                         "action" => "Angry",      "text" => __("Angry")),
        array("icon" => "rage",                          "action" => "Annoyed",    "text" => __("Annoyed")),
        array("icon" => "open-mouth",                    "action" => "Shocked",    "text" => __("Shocked")),
        array("icon" => "pensive",                       "action" => "Down",       "text" => __("Down")),
        array("icon" => "confounded",                    "action" => "Confounded", "text" => __("Confounded"))
    );
    return $feelings_types;
}


/**
 * get_feeling_icon
 * 
 * @param string $needle
 * @param array $array
 * @param string $key
 * @return string
 */
function get_feeling_icon($needle, $array, $key = "action") {
    foreach ($array as $_key => $_val) {
        if($_val[$key] === $needle) {
            return $array[$_key]['icon'];
        }
    }
    return false;
}



/* ------------------------------- */
/* Post Reactions */
/* ------------------------------- */

/**
 * get_reactions
 * 
 * @return array
 */
function get_reactions() {
    $reactions = [
        ["reaction" => "like",   "color" => "blue",    "title" => __("like")],
        ["reaction" => "love",   "color" => "red",     "title" => __("love")],
        ["reaction" => "haha",   "color" => "yellow",  "title" => __("haha")],
        ["reaction" => "yay",    "color" => "yellow",  "title" => __("yay")],
        ["reaction" => "wow",    "color" => "yellow",  "title" => __("wow")],
        ["reaction" => "sad",    "color" => "yellow",  "title" => __("sad")],
        ["reaction" => "angry",  "color" => "orange",  "title" => __("angry")],
    ];
    return $reactions;
}


/**
 * get_reaction_details
 * 
 * @param string $reaction
 * @return array
 */
function get_reaction_details($reaction) {
    global $reactions;
    foreach ($reactions as $_key => $_val) {
        if($_val["reaction"] === $reaction) {
            return $reactions[$_key];
        }
    }
    return false;
}



/* ------------------------------- */
/* Censored Words */
/* ------------------------------- */

/**
 * censored_words
 * 
 * @param string $text
 * @return string
 */
function censored_words($text) {
    global $system;
    if($system['censored_words_enabled']) {
        $bad_words = explode(',', trim($system['censored_words']));
        if(count($bad_words) > 0) {
            foreach($bad_words as $word) {
                $pattern = '/\b'.$word.'\b/i';
                $text = preg_replace($pattern, str_repeat('*', strlen($word)), $text);
            }
        }
    }
    return $text;
}



/* ------------------------------- */
/* General */
/* ------------------------------- */

/**
 * get_picture
 * 
 * @param string $picture
 * @param string $type
 * @return string
 */
function get_picture($picture, $type) {
    global $system;
    if($picture == "") {
        switch ($type) {
            case 'male':
                $picture = $system['system_url'].'/content/themes/'.$system['theme'].'/images/blank_profile_male.jpg';
                break;
            
            case 'female':
                $picture = $system['system_url'].'/content/themes/'.$system['theme'].'/images/blank_profile_female.jpg';
                break;

            case 'other':
                $picture = $system['system_url'].'/content/themes/'.$system['theme'].'/images/blank_profile_other.jpg';
                break;

            case 'page':
                $picture = $system['system_url'].'/content/themes/'.$system['theme'].'/images/blank_page.jpg';
                break;

            case 'group':
                $picture = $system['system_url'].'/content/themes/'.$system['theme'].'/images/blank_group.jpg';
                break;

            case 'event':
                $picture = $system['system_url'].'/content/themes/'.$system['theme'].'/images/blank_event.jpg';
                break;

            case 'article':
                $picture = $system['system_url'].'/content/themes/'.$system['theme'].'/images/blank_article.jpg';
                break;

            case 'movie':
                $picture = $system['system_url'].'/content/themes/'.$system['theme'].'/images/blank_movie.jpg';
                break;

            case 'game':
                $picture = $system['system_url'].'/content/themes/'.$system['theme'].'/images/blank_game.jpg';
                break;

            case 'package':
                $picture = $system['system_url'].'/content/themes/'.$system['theme'].'/images/blank_package.png';
                break;

            case 'flag':
                $picture = $system['system_url'].'/content/themes/'.$system['theme'].'/images/blank_flag.png';
                break;
        }
    } else {
        $picture = $system['system_uploads'].'/'.$picture;
    }
    return $picture;
}


/**
 * save_picture_from_url
 * 
 * @param string $file
 * @param boolean $cropped
 * @return string
 */
function save_picture_from_url($file, $cropped = false, $resize = false) {
    global $system;
    /* check & create uploads dir */
    $folder = 'photos';
    $directory = $folder.'/'. date('Y') . '/' . date('m') . '/';
    // init image & prepare image name & path
    require_once(ABSPATH.'includes/class-image.php');
    $image = new Image($file);
    $prefix = $system['uploads_prefix'].'_'.get_hash_token();
    if($cropped) {
        $image_name = $directory.$prefix."_cropped".$image->_img_ext;
        if($resize) {
            $image->resizeWidth($_POST['resize_width']);
        }
        $_POST['width'] = (isset($_POST['width']))? $_POST['width'] : $image->getWidth();
        $_POST['height'] = (isset($_POST['height']))? $_POST['height'] : $image->getHeight();
        $image->crop($_POST['width'], $_POST['height'], $_POST['x'], $_POST['y']);
    } else {
        $image_name = $directory.$prefix.$image->_img_ext;
    }
    $path = ABSPATH.$system['uploads_directory'].'/'.$image_name;
    /* set uploads directory */
    if(!file_exists(ABSPATH.$system['uploads_directory'].'/'.$folder)) {
        @mkdir(ABSPATH.$system['uploads_directory'].'/'.$folder, 0777, true);
    }
    if(!file_exists(ABSPATH.$system['uploads_directory'].'/'.$folder.'/' . date('Y'))) {
        @mkdir(ABSPATH.$system['uploads_directory'].'/'.$folder.'/' . date('Y'), 0777, true);
    }
    if(!file_exists($system['uploads_directory'].'/'.$folder.'/' . date('Y') . '/' . date('m'))) {
        @mkdir(ABSPATH.$system['uploads_directory'].'/'.$folder.'/' . date('Y') . '/' . date('m'), 0777, true);
    }
    /* save the new image */
    $image->save($path, $system['uploads_quality']);
    /* Cloud Storage */
    if($system['s3_enabled']) {
        /* Amazon S3 */
        aws_s3_upload($path, $image_name);
    } elseif ($system['digitalocean_enabled']) {
        /* DigitalOcean */
        digitalocean_space_upload($path, $image_name);
    } elseif ($system['ftp_enabled']) {
        /* FTP */
        ftp_upload($path, $image_name);
    }
    return $image_name;
}


/**
 * watermark_image
 * 
 * @param string $image_path
 * @param string $image_type
 * @return void
 */
function watermark_image($image_path, $image_type) {
    global $system;
    if(!is_empty($system['watermark_icon'])) {
        require_once(ABSPATH.'includes/libs/SimpleImage/SimpleImage.php');
        try {
            $image = new \claviska\SimpleImage();
            $image
                ->fromFile($image_path) 
                ->autoOrient() 
                ->overlay($system['system_uploads']."/".$system['watermark_icon'], $system['watermark_position'], $system['watermark_opacity'], $system['watermark_xoffset'], $system['watermark_yoffset']) 
                ->toFile($image_path, $image_type);
        } catch(Exception $e) {
            return $e->getMessage();
        }
    }
}


/**
 * get_ip
 * 
 * @return string
 */
function get_user_ip() {
    /* handle CloudFlare IP addresses */
    return (isset($_SERVER["HTTP_CF_CONNECTING_IP"])?$_SERVER["HTTP_CF_CONNECTING_IP"]:$_SERVER['REMOTE_ADDR']);
}


/**
 * get_os
 * 
 * @return string
 */
function get_user_os() {
    $os_platform = "Unknown OS Platform";
    $os_array = array(
        '/windows nt 10/i'      =>  'Windows 10',
        '/windows nt 6.3/i'     =>  'Windows 8.1',
        '/windows nt 6.2/i'     =>  'Windows 8',
        '/windows nt 6.1/i'     =>  'Windows 7',
        '/windows nt 6.0/i'     =>  'Windows Vista',
        '/windows nt 5.2/i'     =>  'Windows Server 2003/XP x64',
        '/windows nt 5.1/i'     =>  'Windows XP',
        '/windows xp/i'         =>  'Windows XP',
        '/windows nt 5.0/i'     =>  'Windows 2000',
        '/windows me/i'         =>  'Windows ME',
        '/win98/i'              =>  'Windows 98',
        '/win95/i'              =>  'Windows 95',
        '/win16/i'              =>  'Windows 3.11',
        '/macintosh|mac os x/i' =>  'Mac OS X',
        '/mac_powerpc/i'        =>  'Mac OS 9',
        '/linux/i'              =>  'Linux',
        '/ubuntu/i'             =>  'Ubuntu',
        '/iphone/i'             =>  'iPhone',
        '/ipod/i'               =>  'iPod',
        '/ipad/i'               =>  'iPad',
        '/android/i'            =>  'Android',
        '/blackberry/i'         =>  'BlackBerry',
        '/webos/i'              =>  'Mobile'
    );
    foreach($os_array as $regex => $value) {
        if(preg_match($regex, $_SERVER['HTTP_USER_AGENT'])) {
            $os_platform = $value;
        }
    }   
    return $os_platform;
}


/**
 * get_browser
 * 
 * @return string
 */
function get_user_browser() {
    $browser = "Unknown Browser";
    $browser_array = array(
        '/msie/i'       =>  'Internet Explorer',
        '/firefox/i'    =>  'Firefox',
        '/safari/i'     =>  'Safari',
        '/chrome/i'     =>  'Chrome',
        '/edge/i'       =>  'Edge',
        '/opera/i'      =>  'Opera',
        '/netscape/i'   =>  'Netscape',
        '/maxthon/i'    =>  'Maxthon',
        '/konqueror/i'  =>  'Konqueror',
        '/mobile/i'     =>  'Handheld Browser'
    );
    foreach($browser_array as $regex => $value) {
        if(preg_match($regex, $_SERVER['HTTP_USER_AGENT'])) {
            $browser = $value;
        }
    }
    return $browser;
}


/**
 * get_extension
 * 
 * @param string $path
 * @return string
 */
function get_extension($path) {
    return strtolower(pathinfo($path, PATHINFO_EXTENSION));
}


/**
 * ger_origin_url
 * 
 * @param string $url
 * @return string
 */
function ger_origin_url($url) {
    stream_context_set_default(array(
        'http' => array(
            'ignore_errors' => true,
            'method' => 'HEAD',
            'user_agent' => 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36',
            //'user_agent' => @$_SERVER['HTTP_USER_AGENT'],
        )
    ));
    $headers = get_headers($url, 1);
    if ($headers !== false && (isset($headers['location']) || isset($headers['Location']))) {
        $location = (isset($headers['location']))? $headers['location'] : $headers['Location'];
        return is_array($location) ? array_pop($location) : $location;
    }
    return $url;
}


/**
 * get_url_text
 * 
 * @param string $string
 * @param integer $length
 * @return string
 */
function get_url_text($string, $length = 10) {
    $string = htmlspecialchars_decode($string, ENT_QUOTES);
    $string = preg_replace('/[^\\pL\d]+/u', '-', $string);
    $string = trim($string, '-');
    $words = explode("-",$string);
    if(count($words) > $length) {
        $string = "";
        for($i = 0; $i < $length; $i++) {
            $string .= "-".$words[$i];
        }
        $string = trim($string, '-');
    }
    return $string;
}


/**
 * remove_querystring_var
 * 
 * @param string $url
 * @param string $key
 * @return string
 */
function remove_querystring_var($url, $key) { 
    $url = preg_replace('/(.*)(?|&)' . $key . '=[^&]+?(&)(.*)/i', '$1$2$4', $url . '&'); 
    $url = substr($url, 0, -1); 
    return $url; 
}


/**
 * get_snippet_text
 * 
 * @param string $string
 * @return string
 */
function get_snippet_text($string) {
    $string = htmlspecialchars_decode($string, ENT_QUOTES);
    $string = strip_tags($string);
    return $string;
}


/**
 * get_tag
 * 
 * @param string $string
 * @return string
 */
function get_tag($string) {
    $string = trim($string);
    $string = preg_replace('/\s+/', '_', $string);
    return $string;
}


/**
 * get_youtube_id
 * 
 * @param string $url
 * @param boolean $embed
 * @return string
 */
function get_youtube_id($url, $embed = true) {
    if($embed) {
        preg_match('/youtube\.com\/embed\/([^\&\?\/]+)/', $url, $id);
        return $id[1];
    } else {
        parse_str(parse_url($url, PHP_URL_QUERY), $id);
        return $id['v']; 
    }
}


/**
 * get_vimeo_id
 * 
 * @param string $url
 * @return string
 */
function get_vimeo_id($url) {
    return (int) substr(parse_url($url, PHP_URL_PATH), 1);
}


/**
 * get_video_type
 * 
 * @param string $url
 * @return string
 */
function get_video_type($url) {
    if(strpos($url, 'youtube') > 0) {
        return 'youtube';
    } elseif (strpos($url, 'vimeo') > 0) {
        return 'vimeo';
    } else {
        return 'link';
    }
}


/**
 * get_array_key
 * 
 * @param array $array
 * @param integer $current
 * @param integer $offset
 * @return mixed
 */
function get_array_key($array, $current, $offset = 1) {
    $keys = array_keys($array);
    $index = array_search($current, $keys);
    if(isset($keys[$index + $offset])) {
        return $keys[$index + $offset];
    }
    return false;
}

?>