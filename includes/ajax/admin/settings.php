<?php
/**
 * ajax -> admin -> settings
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

// handle settings
try {

	switch ($_GET['edit']) {
		case 'general_settings':
			/* prepare */
			$_POST['system_public'] = (isset($_POST['system_public']))? '1' : '0';
			$_POST['system_live'] = (isset($_POST['system_live']))? '1' : '0';
			/* update */
			update_system_options([ 
				'system_public' => secure($_POST['system_public']), 
				'system_live' => secure($_POST['system_live']), 
				'system_message' => secure($_POST['system_message']),
				'system_title' => secure($_POST['system_title']),
				'system_description' => secure($_POST['system_description']),
				'system_keywords' => secure($_POST['system_keywords']),
				'system_email' => secure($_POST['system_email']),
				'system_datetime_format' => secure($_POST['system_datetime_format'])
			]);
			break;

		case 'features_settings':
			/* prepare */
			$_POST['contact_enabled'] = (isset($_POST['contact_enabled']))? '1' : '0';
			$_POST['directory_enabled'] = (isset($_POST['directory_enabled']))? '1' : '0';
			$_POST['pages_enabled'] = (isset($_POST['pages_enabled']))? '1' : '0';
			$_POST['groups_enabled'] = (isset($_POST['groups_enabled']))? '1' : '0';
			$_POST['events_enabled'] = (isset($_POST['events_enabled']))? '1' : '0';
			$_POST['blogs_enabled'] = (isset($_POST['blogs_enabled']))? '1' : '0';
			$_POST['users_blogs_enabled'] = (isset($_POST['users_blogs_enabled']))? '1' : '0';
			$_POST['market_enabled'] = (isset($_POST['market_enabled']))? '1' : '0';
			$_POST['movies_enabled'] = (isset($_POST['movies_enabled']))? '1' : '0';
			$_POST['games_enabled'] = (isset($_POST['games_enabled']))? '1' : '0';
			$_POST['daytime_msg_enabled'] = (isset($_POST['daytime_msg_enabled']))? '1' : '0';
			$_POST['pokes_enabled'] = (isset($_POST['pokes_enabled']))? '1' : '0';
			$_POST['gifts_enabled'] = (isset($_POST['gifts_enabled']))? '1' : '0';
			$_POST['profile_notification_enabled'] = (isset($_POST['profile_notification_enabled']))? '1' : '0';
			$_POST['browser_notifications_enabled'] = (isset($_POST['browser_notifications_enabled']))? '1' : '0';
			$_POST['noty_notifications_enabled'] = (isset($_POST['noty_notifications_enabled']))? '1' : '0';
			$_POST['cookie_consent_enabled'] = (isset($_POST['cookie_consent_enabled']))? '1' : '0';
			$_POST['adblock_detector_enabled'] = (isset($_POST['adblock_detector_enabled']))? '1' : '0';
			/* update */
			update_system_options([ 
				'contact_enabled' => secure($_POST['contact_enabled']), 
				'directory_enabled' => secure($_POST['directory_enabled']), 
				'pages_enabled' => secure($_POST['pages_enabled']),
				'groups_enabled' => secure($_POST['groups_enabled']),
				'events_enabled' => secure($_POST['events_enabled']),
				'blogs_enabled' => secure($_POST['blogs_enabled']),
				'users_blogs_enabled' => secure($_POST['users_blogs_enabled']),
				'market_enabled' => secure($_POST['market_enabled']),
				'movies_enabled' => secure($_POST['movies_enabled']),
				'games_enabled' => secure($_POST['games_enabled']),
				'daytime_msg_enabled' => secure($_POST['daytime_msg_enabled']), 
				'pokes_enabled' => secure($_POST['pokes_enabled']),
				'gifts_enabled' => secure($_POST['gifts_enabled']),
				'profile_notification_enabled' => secure($_POST['profile_notification_enabled']), 
				'browser_notifications_enabled' => secure($_POST['browser_notifications_enabled']),
				'noty_notifications_enabled' => secure($_POST['noty_notifications_enabled']),
				'cookie_consent_enabled' => secure($_POST['cookie_consent_enabled']), 
				'adblock_detector_enabled' => secure($_POST['adblock_detector_enabled'])
			]);
			break;

		case 'posts':
			/* prepare */
			$_POST['stories_enabled'] = (isset($_POST['stories_enabled']))? '1' : '0';
			$_POST['popular_posts_enabled'] = (isset($_POST['popular_posts_enabled']))? '1' : '0';
			$_POST['discover_posts_enabled'] = (isset($_POST['discover_posts_enabled']))? '1' : '0';
			$_POST['memories_enabled'] = (isset($_POST['memories_enabled']))? '1' : '0';
			$_POST['wall_posts_enabled'] = (isset($_POST['wall_posts_enabled']))? '1' : '0';
			$_POST['colored_posts_enabled'] = (isset($_POST['colored_posts_enabled']))? '1' : '0';
			$_POST['activity_posts_enabled'] = (isset($_POST['activity_posts_enabled']))? '1' : '0';
			$_POST['polls_enabled'] = (isset($_POST['polls_enabled']))? '1' : '0';
			$_POST['gif_enabled'] = (isset($_POST['gif_enabled']))? '1' : '0';
			$_POST['geolocation_enabled'] = (isset($_POST['geolocation_enabled']))? '1' : '0';
			$_POST['post_translation_enabled'] = (isset($_POST['post_translation_enabled']))? '1' : '0';
			$_POST['smart_yt_player'] = (isset($_POST['smart_yt_player']))? '1' : '0';
			$_POST['social_share_enabled'] = (isset($_POST['social_share_enabled']))? '1' : '0';
			$_POST['trending_hashtags_enabled'] = (isset($_POST['trending_hashtags_enabled']))? '1' : '0';
			/* update */
			update_system_options([ 
				'stories_enabled' => secure($_POST['stories_enabled']), 
				'popular_posts_enabled' => secure($_POST['popular_posts_enabled']), 
				'discover_posts_enabled' => secure($_POST['discover_posts_enabled']),
				'memories_enabled' => secure($_POST['memories_enabled']),
				'wall_posts_enabled' => secure($_POST['wall_posts_enabled']),
				'colored_posts_enabled' => secure($_POST['colored_posts_enabled']),
				'activity_posts_enabled' => secure($_POST['activity_posts_enabled']),
				'polls_enabled' => secure($_POST['polls_enabled']),
				'geolocation_enabled' => secure($_POST['geolocation_enabled']),
				'geolocation_key' => secure($_POST['geolocation_key']),
				'gif_enabled' => secure($_POST['gif_enabled']), 
				'giphy_key' => secure($_POST['giphy_key']),
				'post_translation_enabled' => secure($_POST['post_translation_enabled']),
				'yandex_key' => secure($_POST['yandex_key']), 
				'smart_yt_player' => secure($_POST['smart_yt_player']),
				'social_share_enabled' => secure($_POST['social_share_enabled']),
				'max_post_length' => secure($_POST['max_post_length'], 'int'), 
				'max_comment_length' => secure($_POST['max_comment_length'], 'int'), 
				'max_posts_hour' => secure($_POST['max_posts_hour'], 'int'), 
				'max_comments_hour' => secure($_POST['max_comments_hour'], 'int'), 
				'default_privacy' => secure($_POST['default_privacy']),
				'trending_hashtags_enabled' => secure($_POST['trending_hashtags_enabled']),
				'trending_hashtags_interval' => secure($_POST['trending_hashtags_interval']),
				'trending_hashtags_limit' => secure($_POST['trending_hashtags_limit'], 'int')
			]);
			break;

		case 'registration':
			/* prepare */
			$_POST['registration_enabled'] = (isset($_POST['registration_enabled']))? '1' : '0';
			$_POST['invitation_enabled'] = (isset($_POST['invitation_enabled']))? '1' : '0';
			$_POST['invitation_widget_enabled'] = (isset($_POST['invitation_widget_enabled']))? '1' : '0';
			$_POST['packages_enabled'] = (isset($_POST['packages_enabled']) || $_POST['registration_type'] == "paid")? '1' : '0';
			$_POST['packages_wallet_payment_enabled'] = (isset($_POST['packages_wallet_payment_enabled']))? '1' : '0';
			$_POST['activation_enabled'] = (isset($_POST['activation_enabled']))? '1' : '0';
			$_POST['verification_requests'] = (isset($_POST['verification_requests']))? '1' : '0';
			$_POST['age_restriction'] = (isset($_POST['age_restriction']))? '1' : '0';
			$_POST['getting_started'] = (isset($_POST['getting_started']))? '1' : '0';
			$_POST['delete_accounts_enabled'] = (isset($_POST['delete_accounts_enabled']))? '1' : '0';
			$_POST['download_info_enabled'] = (isset($_POST['download_info_enabled']))? '1' : '0';
			$_POST['newsletter_consent'] = (isset($_POST['newsletter_consent']))? '1' : '0';
			/* update */
			update_system_options([ 
				'registration_enabled' => secure($_POST['registration_enabled']), 
				'registration_type' => secure($_POST['registration_type']), 
				'invitation_enabled' => secure($_POST['invitation_enabled']),
				'invitation_widget_enabled' => secure($_POST['invitation_widget_enabled']),
				'invitation_widget_max' => secure($_POST['invitation_widget_max'], 'int'),
				'packages_enabled' => secure($_POST['packages_enabled']),
				'packages_wallet_payment_enabled' => secure($_POST['packages_wallet_payment_enabled']),
				'activation_enabled' => secure($_POST['activation_enabled']),
				'activation_type' => secure($_POST['activation_type']),
				'verification_requests' => secure($_POST['verification_requests']),
				'age_restriction' => secure($_POST['age_restriction']), 
				'minimum_age' => secure($_POST['minimum_age'], 'int'),
				'getting_started' => secure($_POST['getting_started']),
				'delete_accounts_enabled' => secure($_POST['delete_accounts_enabled']), 
				'download_info_enabled' => secure($_POST['download_info_enabled']),
				'newsletter_consent' => secure($_POST['newsletter_consent']),
				'max_accounts' => secure($_POST['max_accounts'], 'int'), 
				'max_friends' => secure($_POST['max_friends'], 'int')
			]);
			break;

		case 'social_login':
			/* prepare */
			$_POST['social_login_enabled'] = (isset($_POST['social_login_enabled']))? '1' : '0';
			$_POST['facebook_login_enabled'] = (isset($_POST['facebook_login_enabled']))? '1' : '0';
			$_POST['google_login_enabled'] = (isset($_POST['google_login_enabled']))? '1' : '0';
			$_POST['twitter_login_enabled'] = (isset($_POST['twitter_login_enabled']))? '1' : '0';
			$_POST['instagram_login_enabled'] = (isset($_POST['instagram_login_enabled']))? '1' : '0';
			$_POST['linkedin_login_enabled'] = (isset($_POST['linkedin_login_enabled']))? '1' : '0';
			$_POST['vkontakte_login_enabled'] = (isset($_POST['vkontakte_login_enabled']))? '1' : '0';
			/* update */
			update_system_options([ 
				'social_login_enabled' => secure($_POST['social_login_enabled']), 
				'facebook_login_enabled' => secure($_POST['facebook_login_enabled']), 
				'facebook_appid' => secure($_POST['facebook_appid']),
				'facebook_secret' => secure($_POST['facebook_secret']),
				'google_login_enabled' => secure($_POST['google_login_enabled']),
				'google_appid' => secure($_POST['google_appid']),
				'google_secret' => secure($_POST['google_secret']),
				'twitter_login_enabled' => secure($_POST['twitter_login_enabled']),
				'twitter_appid' => secure($_POST['twitter_appid']),
				'twitter_secret' => secure($_POST['twitter_secret']),
				'instagram_login_enabled' => secure($_POST['instagram_login_enabled']), 
				'instagram_appid' => secure($_POST['instagram_appid']),
				'instagram_secret' => secure($_POST['instagram_secret']),
				'linkedin_login_enabled' => secure($_POST['linkedin_login_enabled']), 
				'linkedin_appid' => secure($_POST['linkedin_appid']),
				'linkedin_secret' => secure($_POST['linkedin_secret']),
				'vkontakte_login_enabled' => secure($_POST['vkontakte_login_enabled']), 
				'vkontakte_appid' => secure($_POST['vkontakte_appid']), 
				'vkontakte_secret' => secure($_POST['vkontakte_secret'])
			]);
			break;

		case 'emails':
			/* prepare */
			$_POST['email_smtp_enabled'] = (isset($_POST['email_smtp_enabled']))? '1' : '0';
			$_POST['email_smtp_authentication'] = (isset($_POST['email_smtp_authentication']))? '1' : '0';
			$_POST['email_smtp_ssl'] = (isset($_POST['email_smtp_ssl']))? '1' : '0';
			/* update */
			update_system_options([ 
				'email_smtp_enabled' => secure($_POST['email_smtp_enabled']), 
				'email_smtp_authentication' => secure($_POST['email_smtp_authentication']), 
				'email_smtp_ssl' => secure($_POST['email_smtp_ssl']),
				'email_smtp_server' => secure($_POST['email_smtp_server']),
				'email_smtp_port' => secure($_POST['email_smtp_port']),
				'email_smtp_username' => secure($_POST['email_smtp_username']),
				'email_smtp_password' => secure($_POST['email_smtp_password']),
				'email_smtp_setfrom' => secure($_POST['email_smtp_setfrom'])
			]);
			break;

		case 'email_notifications':
			/* prepare */
			$_POST['email_notifications'] = (isset($_POST['email_notifications']))? '1' : '0';
			$_POST['email_post_likes'] = (isset($_POST['email_post_likes']))? '1' : '0';
			$_POST['email_post_comments'] = (isset($_POST['email_post_comments']))? '1' : '0';
			$_POST['email_post_shares'] = (isset($_POST['email_post_shares']))? '1' : '0';
			$_POST['email_wall_posts'] = (isset($_POST['email_wall_posts']))? '1' : '0';
			$_POST['email_mentions'] = (isset($_POST['email_mentions']))? '1' : '0';
			$_POST['email_profile_visits'] = (isset($_POST['email_profile_visits']))? '1' : '0';
			$_POST['email_friend_requests'] = (isset($_POST['email_friend_requests']))? '1' : '0';
			/* update */
			update_system_options([ 
				'email_notifications' => secure($_POST['email_notifications']), 
				'email_post_likes' => secure($_POST['email_post_likes']), 
				'email_post_comments' => secure($_POST['email_post_comments']),
				'email_post_shares' => secure($_POST['email_post_shares']),
				'email_wall_posts' => secure($_POST['email_wall_posts']),
				'email_mentions' => secure($_POST['email_mentions']),
				'email_profile_visits' => secure($_POST['email_profile_visits']),
				'email_friend_requests' => secure($_POST['email_friend_requests'])
			]);
			break;

		case 'sms':
			/* update */
			update_system_options([ 
				'sms_provider' => secure($_POST['sms_provider']),
				'twilio_sid' => secure($_POST['twilio_sid']), 
				'twilio_token' => secure($_POST['twilio_token']), 
				'twilio_phone' => secure($_POST['twilio_phone']),
				'bulksms_username' => secure($_POST['bulksms_username']),
				'bulksms_password' => secure($_POST['bulksms_password']),
				'infobip_username' => secure($_POST['infobip_username']),
				'infobip_password' => secure($_POST['infobip_password']),
				'system_phone' => secure($_POST['system_phone'])
			]);
			break;

		case 'chat':
			/* prepare */
			$_POST['chat_enabled'] = (isset($_POST['chat_enabled']))? '1' : '0';
			$_POST['chat_status_enabled'] = (isset($_POST['chat_status_enabled']))? '1' : '0';
			$_POST['chat_typing_enabled'] = (isset($_POST['chat_typing_enabled']))? '1' : '0';
			$_POST['chat_seen_enabled'] = (isset($_POST['chat_seen_enabled']))? '1' : '0';
			$_POST['video_call_enabled'] = (isset($_POST['video_call_enabled']))? '1' : '0';
			$_POST['audio_call_enabled'] = (isset($_POST['audio_call_enabled']))? '1' : '0';
			/* update */
			update_system_options([ 
				'chat_enabled' => secure($_POST['chat_enabled']), 
				'chat_status_enabled' => secure($_POST['chat_status_enabled']), 
				'chat_typing_enabled' => secure($_POST['chat_typing_enabled']),
				'chat_seen_enabled' => secure($_POST['chat_seen_enabled']),
				'video_call_enabled' => secure($_POST['video_call_enabled']),
				'audio_call_enabled' => secure($_POST['audio_call_enabled']),
				'twilio_sid' => secure($_POST['twilio_sid']),
				'twilio_apisid' => secure($_POST['twilio_apisid']),
				'twilio_apisecret' => secure($_POST['twilio_apisecret'])
			]);
			break;

		case 'uploads':
			/* prepare */
			$_POST['photos_enabled'] = (isset($_POST['photos_enabled']))? '1' : '0';
			$_POST['watermark_enabled'] = (isset($_POST['watermark_enabled']))? '1' : '0';
			$_POST['videos_enabled'] = (isset($_POST['videos_enabled']))? '1' : '0';
			$_POST['audio_enabled'] = (isset($_POST['audio_enabled']))? '1' : '0';
			$_POST['file_enabled'] = (isset($_POST['file_enabled']))? '1' : '0';
			/* update */
			update_system_options([ 
				'uploads_directory' => secure($_POST['uploads_directory']), 
				'uploads_prefix' => secure($_POST['uploads_prefix']), 
				'max_avatar_size' => secure($_POST['max_avatar_size']),
				'max_cover_size' => secure($_POST['max_cover_size']),
				'photos_enabled' => secure($_POST['photos_enabled']),
				'max_photo_size' => secure($_POST['max_photo_size']),
				'uploads_quality' => secure($_POST['uploads_quality']),
				'watermark_enabled' => secure($_POST['watermark_enabled']),
				'watermark_icon' => secure($_POST['watermark_icon']),
				'watermark_position' => secure($_POST['watermark_position']),
				'watermark_opacity' => secure($_POST['watermark_opacity']),
				'watermark_xoffset' => secure($_POST['watermark_xoffset']),
				'watermark_yoffset' => secure($_POST['watermark_yoffset']),
				'adult_images_enabled' => secure($_POST['adult_images_enabled']),
				'adult_images_action' => secure($_POST['adult_images_action']),
				'adult_images_api_key' => secure($_POST['adult_images_api_key']),
				'videos_enabled' => secure($_POST['videos_enabled']),
				'max_video_size' => secure($_POST['max_video_size']),
				'video_extensions' => secure($_POST['video_extensions']),
				'audio_enabled' => secure($_POST['audio_enabled']), 
				'max_audio_size' => secure($_POST['max_audio_size']),
				'audio_extensions' => secure($_POST['audio_extensions']),
				'file_enabled' => secure($_POST['file_enabled']), 
				'max_file_size' => secure($_POST['max_file_size']),
				'file_extensions' => secure($_POST['file_extensions'])
			]);
			break;

		case 's3':
			/* prepare */
			$_POST['s3_enabled'] = (isset($_POST['s3_enabled']))? '1' : '0';
			/* if enabled is set -> disable all other options [digitalocean|ftp] */
			if($_POST['s3_enabled']) {
				update_system_options([ 
					'digitalocean_enabled' => '0', 
					'ftp_enabled' => '0'
				]);
			}
			/* update */
			update_system_options([ 
				's3_enabled' => secure($_POST['s3_enabled']), 
				's3_bucket' => secure($_POST['s3_bucket']), 
				's3_region' => secure($_POST['s3_region']),
				's3_key' => secure($_POST['s3_key']),
				's3_secret' => secure($_POST['s3_secret'])
			]);
			break;

		case 'digitalocean':
			/* prepare */
			$_POST['digitalocean_enabled'] = (isset($_POST['digitalocean_enabled']))? '1' : '0';
			/* if enabled is set -> disable all other options [s3|ftp] */
			if($_POST['digitalocean_enabled']) {
				update_system_options([ 
					's3_enabled' => '0', 
					'ftp_enabled' => '0'
				]);
			}
			/* update */
			update_system_options([ 
				'digitalocean_enabled' => secure($_POST['digitalocean_enabled']), 
				'digitalocean_space_name' => secure($_POST['digitalocean_space_name']), 
				'digitalocean_space_region' => secure($_POST['digitalocean_space_region']),
				'digitalocean_key' => secure($_POST['digitalocean_key']),
				'digitalocean_secret' => secure($_POST['digitalocean_secret'])
			]);
			break;

		case 'ftp':
			/* prepare */
			$_POST['ftp_enabled'] = (isset($_POST['ftp_enabled']))? '1' : '0';
			/* if enabled is set -> disable all other options [s3|digitalocean] */
			if($_POST['ftp_enabled']) {
				update_system_options([ 
					's3_enabled' => '0', 
					'digitalocean_enabled' => '0'
				]);
			}
			/* update */
			update_system_options([ 
				'ftp_enabled' => secure($_POST['ftp_enabled']), 
				'ftp_hostname' => secure($_POST['ftp_hostname']), 
				'ftp_username' => secure($_POST['ftp_username']),
				'ftp_password' => secure($_POST['ftp_password']),
				'ftp_port' => secure($_POST['ftp_port']),
				'ftp_path' => secure($_POST['ftp_path']),
				'ftp_endpoint' => secure($_POST['ftp_endpoint'])
			]);
			break;

		case 'security':
			/* prepare */
			$_POST['unusual_login_enabled'] = (isset($_POST['unusual_login_enabled']))? '1' : '0';
			$_POST['brute_force_detection_enabled'] = (isset($_POST['brute_force_detection_enabled']))? '1' : '0';
			$_POST['two_factor_enabled'] = (isset($_POST['two_factor_enabled']))? '1' : '0';
			$_POST['censored_words_enabled'] = (isset($_POST['censored_words_enabled']))? '1' : '0';
			$_POST['reCAPTCHA_enabled'] = (isset($_POST['reCAPTCHA_enabled']))? '1' : '0';
			/* update */
			update_system_options([ 
				'unusual_login_enabled' => secure($_POST['unusual_login_enabled']), 
				'brute_force_detection_enabled' => secure($_POST['brute_force_detection_enabled']), 
				'brute_force_bad_login_limit' => secure($_POST['brute_force_bad_login_limit'], 'int'),
				'brute_force_lockout_time' => secure($_POST['brute_force_lockout_time'], 'int'),
				'two_factor_enabled' => secure($_POST['two_factor_enabled']),
				'two_factor_type' => secure($_POST['two_factor_type']),
				'censored_words_enabled' => secure($_POST['censored_words_enabled']),
				'censored_words' => secure($_POST['censored_words']),
				'reCAPTCHA_enabled' => secure($_POST['reCAPTCHA_enabled']),
				'reCAPTCHA_site_key' => secure($_POST['reCAPTCHA_site_key']),
				'reCAPTCHA_secret_key' => secure($_POST['reCAPTCHA_secret_key'])
			]);
			break;

		case 'paypal':
			/* prepare */
			$_POST['paypal_enabled'] = (isset($_POST['paypal_enabled']))? '1' : '0';
			/* update */
			update_system_options([ 
				'paypal_enabled' => secure($_POST['paypal_enabled']), 
				'paypal_mode' => secure($_POST['paypal_mode']), 
				'paypal_id' => secure($_POST['paypal_id']),
				'paypal_secret' => secure($_POST['paypal_secret'])
			]);
			break;

		case 'stripe':
			/* prepare */
			$_POST['creditcard_enabled'] = (isset($_POST['creditcard_enabled']))? '1' : '0';
			$_POST['alipay_enabled'] = (isset($_POST['alipay_enabled']))? '1' : '0';
			/* update */
			update_system_options([ 
				'creditcard_enabled' => secure($_POST['creditcard_enabled']), 
				'alipay_enabled' => secure($_POST['alipay_enabled']), 
				'stripe_mode' => secure($_POST['stripe_mode']),
				'stripe_test_secret' => secure($_POST['stripe_test_secret']),
				'stripe_test_publishable' => secure($_POST['stripe_test_publishable']),
				'stripe_live_secret' => secure($_POST['stripe_live_secret']),
				'stripe_live_publishable' => secure($_POST['stripe_live_publishable'])
			]);
			break;

		case 'coinpayments':
			/* prepare */
			$_POST['coinpayments_enabled'] = (isset($_POST['coinpayments_enabled']))? '1' : '0';
			/* update */
			update_system_options([ 
				'coinpayments_enabled' => secure($_POST['coinpayments_enabled']), 
				'coinpayments_merchant_id' => secure($_POST['coinpayments_merchant_id']), 
				'coinpayments_ipn_secret' => secure($_POST['coinpayments_ipn_secret']) 
			]);
			break;

		case '2checkout':
			/* prepare */
			$_POST['2checkout_enabled'] = (isset($_POST['2checkout_enabled']))? '1' : '0';
			/* update */
			update_system_options([ 
				'2checkout_enabled' => secure($_POST['2checkout_enabled']), 
				'2checkout_mode' => secure($_POST['2checkout_mode']), 
				'2checkout_merchant_code' => secure($_POST['2checkout_merchant_code']),
				'2checkout_publishable_key' => secure($_POST['2checkout_publishable_key']),
				'2checkout_private_key' => secure($_POST['2checkout_private_key'])
			]);
			break;

		case 'bank':
			/* prepare */
			$_POST['bank_transfers_enabled'] = (isset($_POST['bank_transfers_enabled']))? '1' : '0';
			/* update */
			update_system_options([ 
				'bank_transfers_enabled' => secure($_POST['bank_transfers_enabled']), 
				'bank_name' => secure($_POST['bank_name']), 
				'bank_account_number' => secure($_POST['bank_account_number']),
				'bank_account_name' => secure($_POST['bank_account_name']),
				'bank_account_routing' => secure($_POST['bank_account_routing']),
				'bank_account_country' => secure($_POST['bank_account_country']),
				'bank_transfer_note' => secure($_POST['bank_transfer_note'])
			]);
			break;

		case 'currency':
			/* remove any default currency */
			$db->query("UPDATE system_currencies SET system_currencies.default = '0'") or _error("SQL_ERROR_THROWEN");
			/* set selected currency as default */
			$db->query(sprintf("UPDATE system_currencies SET 
						system_currencies.default = '1' WHERE currency_id = %s", secure($_POST['system_currency'], 'int') )) or _error("SQL_ERROR_THROWEN");
			break;

		case 'limits':
			/* update */
			update_system_options([ 
				'data_heartbeat' => secure($_POST['data_heartbeat']), 
				'chat_heartbeat' => secure($_POST['chat_heartbeat']), 
				'offline_time' => secure($_POST['offline_time']),
				'min_results' => secure($_POST['min_results']),
				'max_results' => secure($_POST['max_results']),
				'min_results_even' => secure($_POST['min_results_even']),
				'max_results_even' => secure($_POST['max_results_even'])
			]);
			break;

		case 'analytics':
			/* update */
			update_system_options([ 
				'analytics_code' => secure($_POST['message'])
			]);
			break;

		case 'affiliates':
			/* prepare */
			$_POST['affiliates_enabled'] = (isset($_POST['affiliates_enabled']))? '1' : '0';
			$affiliate_payment_methods = [];
			if(isset($_POST['method_paypal'])) {
				$affiliate_payment_methods[] = "paypal";
			}
			if(isset($_POST['method_skrill'])) {
				$affiliate_payment_methods[] = "skrill";
			}
			if(isset($_POST['method_bank'])) {
				$affiliate_payment_methods[] = "bank";
			}
			if(isset($_POST['method_custom'])) {
				$affiliate_payment_methods[] = "custom";
			}
			if(count($affiliate_payment_methods) == 0) {
				throw new Exception(__("You must select one withdrawal payment method at least"));
			}
			$affiliate_payment_method = implode(",", $affiliate_payment_methods);
			/* update */
			update_system_options([ 
				'affiliates_enabled' => secure($_POST['affiliates_enabled']), 
				'affiliate_type' => secure($_POST['affiliate_type']), 
				'affiliate_payment_method' => secure($affiliate_payment_method),
				'affiliate_payment_method_custom' => secure($_POST['affiliate_payment_method_custom']),
				'affiliates_min_withdrawal' => secure($_POST['affiliates_min_withdrawal']),
				'affiliate_payment_type' => secure($_POST['affiliate_payment_type']),
				'affiliates_per_user' => secure($_POST['affiliates_per_user']),
				'affiliates_percentage' => secure($_POST['affiliates_percentage'])
			]);
			break;

		case 'points':
			/* prepare */
			$_POST['points_enabled'] = (isset($_POST['points_enabled']))? '1' : '0';
			$_POST['points_money_withdraw_enabled'] = (isset($_POST['points_money_withdraw_enabled']))? '1' : '0';
			$_POST['points_money_transfer_enabled'] = (isset($_POST['points_money_transfer_enabled']))? '1' : '0';
			if(!$_POST['points_money_withdraw_enabled'] && !$_POST['points_money_transfer_enabled']) {
				throw new Exception(__("You must enable one method at least, either payments withdrawal requests or wallet transfer"));
			}
			$points_payment_methods = [];
			if(isset($_POST['method_paypal'])) {
				$points_payment_methods[] = "paypal";
			}
			if(isset($_POST['method_skrill'])) {
				$points_payment_methods[] = "skrill";
			}
			if(isset($_POST['method_bank'])) {
				$points_payment_methods[] = "bank";
			}
			if(isset($_POST['method_custom'])) {
				$points_payment_methods[] = "custom";
			}
			if(count($points_payment_methods) == 0) {
				throw new Exception(__("You must select one withdrawal payment method at least"));
			}
			$points_payment_method = implode(",", $points_payment_methods);
			/* update */
			update_system_options([ 
				'points_enabled' => secure($_POST['points_enabled']), 
				'points_money_withdraw_enabled' => secure($_POST['points_money_withdraw_enabled']), 
				'points_payment_method' => secure($points_payment_method),
				'points_payment_method_custom' => secure($_POST['points_payment_method_custom']),
				'points_min_withdrawal' => secure($_POST['points_min_withdrawal']),
				'points_money_transfer_enabled' => secure($_POST['points_money_transfer_enabled']),
				'points_per_currency' => secure($_POST['points_per_currency'], 'int'),
				'points_per_post' => secure($_POST['points_per_post'], 'int'),
				'points_per_comment' => secure($_POST['points_per_comment'], 'int'),
				'points_per_reaction' => secure($_POST['points_per_reaction'], 'int'),
				'points_limit_user' => secure($_POST['points_limit_user'], 'int'),
				'points_limit_pro' => secure($_POST['points_limit_user'], 'int')
			]);
			break;

		default:
			_error(400);
			break;
	}
	return_json( array('success' => true, 'message' => __("System settings have been updated")) );

} catch (Exception $e) {
	return_json( array('error' => true, 'message' => $e->getMessage()) );
}

?>