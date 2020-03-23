<?php
/**
 * connect
 * 
 * @package Sngine
 * @author Zamblek
 */

// fetch bootstrap
require('bootstrap.php');

try {
    
    switch ($_REQUEST['do']) {
		case 'connect':
			// check if social login enabled
			if(!$system['social_login_enabled']) {
				_error(404);
			}

			// check provider
			switch ($_REQUEST['provider']) {
				case 'facebook':
					if(!$system['facebook_login_enabled']) {
						_error(404);
					}
					break;
				
				case 'google':
					if(!$system['google_login_enabled']) {
						_error(404);
					}
					break;

				case 'twitter':
					if(!$system['twitter_login_enabled']) {
						_error(404);
					}
					break;

				case 'instagram':
					if(!$system['instagram_login_enabled']) {
						_error(404);
					}
					break;

				case 'linkedin':
					if(!$system['linkedin_login_enabled']) {
						_error(404);
					}
					break;

				case 'vkontakte':
					if(!$system['vkontakte_login_enabled']) {
						_error(404);
					}
					break;

				default:
					_error(404);
					break;
			}

			// set provider
			$provider = $_REQUEST["provider"];

			// config hybridauth
			$config = array(
				'callback' => $system['system_url']."/connect/".$provider, 
				"providers" => array ( 
					"Facebook" => array ( 
						"enabled" => true,
						"keys"    => array ( "id" => $system['facebook_appid'], "secret" => $system['facebook_secret'] ),
						"scope"   => "email, public_profile",
						"trustForwarded" => false
						),
					"Google" => array ( 
						"enabled" => true,
						"keys"    => array ( "key" => $system['google_appid'], "secret" => $system['google_secret'] )
						),
					"Twitter" => array ( 
						"enabled" => true,
						"keys"    => array ( "key" => $system['twitter_appid'], "secret" => $system['twitter_secret'] ),
						"includeEmail" => true
						),
					"Instagram" => array ( 
						"enabled" => true,
						"keys"    => array ( "id" => $system['instagram_appid'], "secret" => $system['instagram_secret'] )
						),
					"LinkedIn" => array ( 
						"enabled" => true,
						"keys"    => array ( "id" => $system['linkedin_appid'], "secret" => $system['linkedin_secret'] )
						),
					"Vkontakte" => array ( 
						"enabled" => true,
						"keys"    => array ( "id" => $system['vkontakte_appid'], "secret" => $system['vkontakte_secret'] )
						)
					)
			);

			// fetch hybridauth
			require_once("includes/libs/HybridAuth/autoload.php");

			// initialize Hybrid_Auth with a given file
		    $hybridauth = new Hybridauth\Hybridauth($config);
		    
		    // try to authenticate with the selected provider
		    $adapter = $hybridauth->authenticate( $provider );
		    
		    // then grab the user profile
		    $user_profile = $adapter->getUserProfile();

		    // socail login
		    $user->socail_login($provider, $user_profile);

		    // disconnect
		    $adapter->disconnect();
			break;

		case 'revoke':
			// user access
			user_access();

			// check provider
			switch ($_REQUEST['provider']) {
				case 'facebook':
					$social_id = "facebook_id";
					$social_connected = "facebook_connected";
					break;

				case 'google':
					$social_id = "google_id";
					$social_connected = "google_connected";
					break;

				case 'twitter':
					$social_id = "twitter_id";
					$social_connected = "twitter_connected";
					break;

				case 'instagram':
					$social_id = "instagram_id";
					$social_connected = "instagram_connected";
					break;

				case 'linkedin':
					$social_id = "linkedin_id";
					$social_connected = "linkedin_connected";
					break;

				case 'vkontakte':
					$social_id = "vkontakte_id";
					$social_connected = "vkontakte_connected";
					break;

				default:
					_error(404);
					break;
			}

			// revoke
		    $db->query(sprintf("UPDATE users SET $social_connected = '0', $social_id = NULL WHERE user_id = %s", secure($user->_data['user_id'], 'int') )) or _error("SQL_ERROR_THROWEN");
		    redirect('/settings/linked');
			break;
		
		default:
			_error(404);
			break;
	}
    
} catch( Exception $e ){
    _error(__("Error"), $e->getMessage());
}

?>