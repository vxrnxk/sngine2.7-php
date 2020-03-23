<?php
/**
 * ajax -> data -> upload
 * 
 * @package Sngine
 * @author Zamblek
 */

// set execution time
set_time_limit(0); /* unlimited max execution time */

// fetch bootstrap
require('../../../bootstrap.php');

// fetch image class
require_once(ABSPATH.'includes/class-image.php');

// check AJAX Request
is_ajax();

// check secret
if($_SESSION['secret'] != $_POST['secret']) {
    _error(403);
}

// user access
user_access(true);

// check type
if(!isset($_POST["type"])) {
    _error(403);
}

// check handle
if(!isset($_POST["handle"])) {
    _error(403);
}

// check multiple
if(!isset($_POST["multiple"])) {
    _error(403);
}

try {

    switch ($_POST["type"]) {
        case 'photos':
            // check photo upload enabled
            if($_POST['handle'] == 'publisher' && !$system['photos_enabled']) {
                modal("MESSAGE", __("Not Allowed"), __("This feature has been disabled"));
            }

            // get allowed file size
            if($_POST['handle'] == 'picture-user' || $_POST['handle'] == 'picture-page' || $_POST['handle'] == 'picture-group') {
                $max_allowed_size = $system['max_avatar_size'] * 1024;
            } elseif ($_POST['handle'] == 'cover-user' || $_POST['handle'] == 'cover-page' || $_POST['handle'] == 'cover-group') {
                $max_allowed_size = $system['max_cover_size'] * 1024;
            } else {
                $max_allowed_size = $system['max_photo_size'] * 1024;
            }

            // prepare uploads directory
            $folder = 'photos';
            $directory = $folder.'/'. date('Y') . '/' . date('m') . '/';

            if($_POST["multiple"] == "true") {

                $files = array();
                foreach($_FILES['file'] as $key => $val) {
                    for($i=0; $i < count($val); $i++) {
                        $files[$i][$key] = $val[$i];
                    }
                }
                $return_files = array();
                $files_num = count($files);
                foreach ($files as $file) {
                    // valid inputs
                    if(!isset($file) || $file["error"] != UPLOAD_ERR_OK) {
                        if($files_num > 1) {
                            continue;
                        } else {
                            modal("MESSAGE", __("Upload Error"), __("Something wrong with upload! Is 'upload_max_filesize' set correctly?"));
                        }
                    }
                    
                    // check file size
                    if($file["size"] > $max_allowed_size) {
                        if($files_num > 1) {
                            continue;
                        } else {
                            modal("MESSAGE", __("Upload Error"), __("The file size is so big"));
                        }
                    }

                    // init image & prepare image name & path
                    try {
                        $image = new Image($file["tmp_name"]);
                    } catch (Exception $e) {
                        if($files_num > 1) {
                            continue;
                        } else {
                            modal("MESSAGE", __("Upload Error"), __("Sorry, can not upload the file"));
                        }
                    }
                    $prefix = $system['uploads_prefix'].'_'.get_hash_token();
                    $file_name = $directory.$prefix.$image->_img_ext;
                    $path = ABSPATH.$system['uploads_directory'].'/'.$file_name;
                    $image_blured = 0;

                    // adult images detection
                    if($system['adult_images_enabled']) {
                        if($_POST['handle'] != "x-image" && google_vision_check($file["tmp_name"])) {
                            if($system['adult_images_action'] == "delete") {
                                if($files_num > 1) {
                                    continue;
                                } else {
                                    modal("MESSAGE", __("Upload Error"), __("Sorry, can not upload the file for adult content"));
                                }
                            } else {
                                $image_blured = 1;
                            }
                        }
                    }

                    // watermark images
                    $image_watermarked = false;
                    if($system['watermark_enabled']) {
                        if($_POST['handle'] == "publisher" && $image->_img_type != "image/gif") {
                            watermark_image($file["tmp_name"], $image->_img_type);
                            $image_watermarked = true;
                        }
                    }

                    // upload to
                    if($system['s3_enabled']) {
                        /* Amazon S3 */
                        aws_s3_upload($file["tmp_name"], $file_name);
                    } elseif ($system['digitalocean_enabled']) {
                        /* DigitalOcean */
                        digitalocean_space_upload($file["tmp_name"], $file_name);
                    } elseif ($system['ftp_enabled']) {
                        /* FTP */
                        ftp_upload($file["tmp_name"], $file_name);
                    } else {
                        /* local server */
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
                        if($image->_img_type == "image/gif" && !in_array($_POST['handle'], ['cover-user', 'picture-user', 'cover-page', 'picture-page', 'cover-group', 'picture-group', 'cover-event'])) {
                            if(!@move_uploaded_file($file["tmp_name"], $path)) {
                                modal("MESSAGE", __("Upload Error"), __("Sorry, can not upload the file"));
                            }
                        } else {
                            if($image_watermarked) {
                                $image = new Image($file["tmp_name"]);
                            }
                            $image->save($path, $system['uploads_quality']);
                        }
                    }

                    /* return */
                    $return_files[] = [ "source" => $file_name, "blur" => $image_blured ];
                }

                // return the return_files & exit
                return_json(array("files" => $return_files));

            } else {

                // valid inputs
                if(!isset($_FILES["file"]) || $_FILES["file"]["error"] != UPLOAD_ERR_OK) {
                    modal("MESSAGE", __("Upload Error"), __("Something wrong with upload! Is 'upload_max_filesize' set correctly?"));
                }

                // check file size
                if($_FILES["file"]["size"] > $max_allowed_size) {
                    modal("MESSAGE", __("Upload Error"), __("The file size is so big"));
                }

                // init image & prepare image name & path
                $image = new Image($_FILES["file"]["tmp_name"]);
                $prefix = $system['uploads_prefix'].'_'.get_hash_token();
                $file_name = $directory.$prefix.$image->_img_ext;
                $path = ABSPATH.$system['uploads_directory'].'/'.$file_name;
                $image_blured = 0;

                // check image resolution
                if($_POST['handle'] == 'picture-user' || $_POST['handle'] == 'picture-page' || $_POST['handle'] == 'picture-group') {
                    if($image->getWidth() < 150 || $image->getHeight() < 150) {
                        modal("MESSAGE", __("Photo Too Small"), __("Please choose an image that's at least 150 pixels wide and at least 150 pixels tall"));
                    }
                } elseif ($_POST['handle'] == 'cover-user' || $_POST['handle'] == 'cover-page' || $_POST['handle'] == 'cover-group') {
                    if($image->getWidth() < 1108 || $image->getHeight() < 360) {
                        modal("MESSAGE", __("Photo Too Small"), __("Please choose an image that's at least 1108 pixels wide and at least 360 pixels tall"));
                    }
                }

                // adult images detection
                if($system['adult_images_enabled']) {
                    if($_POST['handle'] != "x-image" && google_vision_check($_FILES['file']['tmp_name'])) {
                        if($system['adult_images_action'] == "delete") {
                            modal("MESSAGE", __("Upload Error"), __("Sorry, can not upload the file for adult content"));
                        } else {
                            $image_blured = 1;
                        }
                    }
                }

                // upload to
                if($system['s3_enabled']) {
                    /* Amazon S3 */
                    aws_s3_upload($_FILES['file']['tmp_name'], $file_name);
                } elseif ($system['digitalocean_enabled']) {
                    /* DigitalOcean */
                    digitalocean_space_upload($_FILES['file']['tmp_name'], $file_name);
                } elseif ($system['ftp_enabled']) {
                    /* FTP */
                    ftp_upload($_FILES['file']['tmp_name'], $file_name);
                } else {
                    /* local server */
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
                    if($image->_img_type == "image/gif" && !in_array($_POST['handle'], ['cover-user', 'picture-user', 'cover-page', 'picture-page', 'cover-group', 'picture-group', 'cover-event'])) {
                        if(!@move_uploaded_file($_FILES['file']['tmp_name'], $path)) {
                            modal("MESSAGE", __("Upload Error"), __("Sorry, can not upload the file"));
                        }
                    } else {
                        $image->save($path, $system['uploads_quality']);
                    }
                }
                
                // check the handle
                switch ($_POST['handle']) {
                    case 'cover-user':
                        /* check for cover album */
                        if(!$user->_data['user_album_covers']) {
                            /* create new cover album */
                            $db->query(sprintf("INSERT INTO posts_photos_albums (user_id, user_type, title, privacy) VALUES (%s, 'user', 'Cover Photos', 'public')", secure($user->_data['user_id'], 'int') )) or _error("SQL_ERROR_THROWEN");
                            $user->_data['user_album_covers'] = $db->insert_id;
                            /* update user cover album id */
                            $db->query(sprintf("UPDATE users SET user_album_covers = %s WHERE user_id = %s", secure($user->_data['user_album_covers'], 'int'), secure($user->_data['user_id'], 'int') )) or _error("SQL_ERROR_THROWEN");
                        }
                        /* insert updated cover photo post */
                        $db->query(sprintf("INSERT INTO posts (user_id, user_type, post_type, time, privacy) VALUES (%s, 'user', 'profile_cover', %s, 'public')", secure($user->_data['user_id'], 'int'), secure($date) )) or _error("SQL_ERROR_THROWEN");
                        $post_id = $db->insert_id;
                        /* insert new cover photo to album */
                        $db->query(sprintf("INSERT INTO posts_photos (post_id, album_id, source, blur) VALUES (%s, %s, %s, %s)", secure($post_id, 'int'), secure($user->_data['user_album_covers'], 'int'), secure($file_name), secure($image_blured) )) or _error("SQL_ERROR_THROWEN");
                        $photo_id = $db->insert_id;
                        /* update user cover */
                        $db->query(sprintf("UPDATE users SET user_cover = %s, user_cover_id = %s WHERE user_id = %s", secure($file_name), secure($photo_id, 'int'), secure($user->_data['user_id'], 'int') )) or _error("SQL_ERROR_THROWEN");
                        break;

                    case 'picture-user':
                        /* check for profile pictures album */
                        if(!$user->_data['user_album_pictures']) {
                            /* create new profile pictures album */
                            $db->query(sprintf("INSERT INTO posts_photos_albums (user_id, user_type, title, privacy) VALUES (%s, 'user', 'Profile Pictures', 'public')", secure($user->_data['user_id'], 'int') )) or _error("SQL_ERROR_THROWEN");
                            $user->_data['user_album_pictures'] = $db->insert_id;
                            /* update user profile picture album id */
                            $db->query(sprintf("UPDATE users SET user_album_pictures = %s WHERE user_id = %s", secure($user->_data['user_album_pictures'], 'int'), secure($user->_data['user_id'], 'int') )) or _error("SQL_ERROR_THROWEN");
                        }
                        /* insert updated profile picture post */
                        $db->query(sprintf("INSERT INTO posts (user_id, user_type, post_type, time, privacy) VALUES (%s, 'user', 'profile_picture', %s, 'public')", secure($user->_data['user_id'], 'int'), secure($date) )) or _error("SQL_ERROR_THROWEN");
                        $post_id = $db->insert_id;
                        /* insert new profile picture to album */
                        $db->query(sprintf("INSERT INTO posts_photos (post_id, album_id, source, blur) VALUES (%s, %s, %s, %s)", secure($post_id, 'int'), secure($user->_data['user_album_pictures'], 'int'), secure($file_name), secure($image_blured) )) or _error("SQL_ERROR_THROWEN");
                        $photo_id = $db->insert_id;
                        /* delete old cropped picture from uploads folder */
                        delete_uploads_file($user->_data['user_picture_raw']);
                        /* update user profile picture */
                        $db->query(sprintf("UPDATE users SET user_picture = %s, user_picture_id = %s WHERE user_id = %s", secure($file_name), secure($photo_id, 'int'), secure($user->_data['user_id'], 'int') )) or _error("SQL_ERROR_THROWEN");
                        break;

                    case 'cover-page':
                        /* check if page id is set */
                        if(!isset($_POST['id']) || !is_numeric($_POST['id'])) {
                            /* delete the uploaded image & return error 403 */
                            unlink($path);
                            _error(403);
                        }
                        /* check the page */
                        $get_page = $db->query(sprintf("SELECT * FROM pages WHERE page_id = %s", secure($_POST['id'], 'int') )) or _error("SQL_ERROR_THROWEN");
                        if($get_page->num_rows == 0) {
                            /* delete the uploaded image & return error 403 */
                            unlink($path);
                            _error(403);
                        }
                        $page = $get_page->fetch_assoc();
                        /* check if the user is the page admin */
                        if(!$user->check_page_adminship($user->_data['user_id'], $page['page_id'])) {
                            /* delete the uploaded image & return error 403 */
                            unlink($path);
                            _error(403);
                        }
                        /* check for cover album */
                        if(!$page['page_album_covers']) {
                            /* create new cover album */
                            $db->query(sprintf("INSERT INTO posts_photos_albums (user_id, user_type, title, privacy) VALUES (%s, 'page', 'Cover Photos', 'public')", secure($page['page_id'], 'int') )) or _error("SQL_ERROR_THROWEN");
                            $page['page_album_covers'] = $db->insert_id;
                            /* update page cover album id */
                            $db->query(sprintf("UPDATE pages SET page_album_covers = %s WHERE page_id = %s", secure($page['page_album_covers'], 'int'), secure($page['page_id'], 'int') )) or _error("SQL_ERROR_THROWEN");
                        }
                        /* insert updated cover photo post */
                        $db->query(sprintf("INSERT INTO posts (user_id, user_type, post_type, time, privacy) VALUES (%s, 'page', 'page_cover', %s, 'public')", secure($page['page_id'], 'int'), secure($date) )) or _error("SQL_ERROR_THROWEN");
                        $post_id = $db->insert_id;
                        /* insert new cover photo to album */
                        $db->query(sprintf("INSERT INTO posts_photos (post_id, album_id, source, blur) VALUES (%s, %s, %s, %s)", secure($post_id, 'int'), secure($page['page_album_covers'], 'int'), secure($file_name), secure($image_blured) )) or _error("SQL_ERROR_THROWEN");
                        $photo_id = $db->insert_id;
                        /* update page cover */
                        $db->query(sprintf("UPDATE pages SET page_cover = %s, page_cover_id = %s WHERE page_id = %s", secure($file_name), secure($photo_id, 'int'), secure($page['page_id'], 'int') )) or _error("SQL_ERROR_THROWEN");
                        break;

                    case 'picture-page':
                        /* check if page id is set */
                        if(!isset($_POST['id']) || !is_numeric($_POST['id'])) {
                            /* delete the uploaded image & return error 403 */
                            unlink($path);
                            _error(403);
                        }
                        /* check the page */
                        $get_page = $db->query(sprintf("SELECT * FROM pages WHERE page_id = %s", secure($_POST['id'], 'int') )) or _error("SQL_ERROR_THROWEN");
                        if($get_page->num_rows == 0) {
                            /* delete the uploaded image & return error 403 */
                            unlink($path);
                            _error(403);
                        }
                        $page = $get_page->fetch_assoc();
                        /* check if the user is the page admin */
                        if(!$user->check_page_adminship($user->_data['user_id'], $page['page_id'])) {
                            /* delete the uploaded image & return error 403 */
                            unlink($path);
                            _error(403);
                        }
                        /* check for page pictures album */
                        if(!$page['page_album_pictures']) {
                            /* create new page pictures album */
                            $db->query(sprintf("INSERT INTO posts_photos_albums (user_id, user_type, title, privacy) VALUES (%s, 'page', 'Profile Pictures', 'public')", secure($page['page_id'], 'int') )) or _error("SQL_ERROR_THROWEN");
                            $page['page_album_pictures'] = $db->insert_id;
                            /* update page profile picture album id */
                            $db->query(sprintf("UPDATE pages SET page_album_pictures = %s WHERE page_id = %s", secure($page['page_album_pictures'], 'int'), secure($page['page_id'], 'int') )) or _error("SQL_ERROR_THROWEN");
                        }
                        /* insert updated page picture post */
                        $db->query(sprintf("INSERT INTO posts (user_id, user_type, post_type, time, privacy) VALUES (%s, 'page', 'page_picture', %s, 'public')", secure($page['page_id'], 'int'), secure($date) )) or _error("SQL_ERROR_THROWEN");
                        $post_id = $db->insert_id;
                        /* insert new page picture to album */
                        $db->query(sprintf("INSERT INTO posts_photos (post_id, album_id, source, blur) VALUES (%s, %s, %s, %s)", secure($post_id, 'int'), secure($page['page_album_pictures'], 'int'), secure($file_name), secure($image_blured) )) or _error("SQL_ERROR_THROWEN");
                        $photo_id = $db->insert_id;
                        /* delete old cropped picture from uploads folder */
                        delete_uploads_file($page['page_picture']);
                        /* update page picture */
                        $db->query(sprintf("UPDATE pages SET page_picture = %s, page_picture_id = %s WHERE page_id = %s", secure($file_name), secure($photo_id, 'int'), secure($page['page_id'], 'int') )) or _error("SQL_ERROR_THROWEN");
                        break;

                    case 'cover-group':
                        /* check if group id is set */
                        if(!isset($_POST['id']) || !is_numeric($_POST['id'])) {
                            /* delete the uploaded image & return error 403 */
                            unlink($path);
                            _error(403);
                        }
                        /* check the group */
                        $get_group = $db->query(sprintf("SELECT * FROM `groups` WHERE group_id = %s", secure($_POST['id'], 'int') )) or _error("SQL_ERROR_THROWEN");
                        if($get_group->num_rows == 0) {
                            /* delete the uploaded image & return error 403 */
                            unlink($path);
                            _error(403);
                        }
                        $group = $get_group->fetch_assoc();
                        /* check if the user is the group admin */
                        if(!$user->check_group_adminship($user->_data['user_id'], $group['group_id'])) {
                            /* delete the uploaded image & return error 403 */
                            unlink($path);
                            _error(403);
                        }
                        /* check for group covers album */
                        if(!$group['group_album_covers']) {
                            /* create new group covers album */
                            $db->query(sprintf("INSERT INTO posts_photos_albums (user_id, user_type, in_group, group_id, title, privacy) VALUES (%s, 'user', '1', %s, 'Cover Photos', 'public')", secure($user->_data['user_id'], 'int'), secure($group['group_id'], 'int') )) or _error("SQL_ERROR_THROWEN");
                            $group['group_album_covers'] = $db->insert_id;
                            /* update group cover album id */
                            $db->query(sprintf("UPDATE `groups` SET group_album_covers = %s WHERE group_id = %s", secure($group['group_album_covers'], 'int'), secure($group['group_id'], 'int') )) or _error("SQL_ERROR_THROWEN");
                        }
                        /* insert updated group cover post */
                        $db->query(sprintf("INSERT INTO posts (user_id, user_type, post_type, in_group, group_id, time, privacy) VALUES (%s, 'user', 'group_cover', '1', %s, %s, 'custom')", secure($user->_data['user_id'], 'int'), secure($group['group_id'], 'int'), secure($date) )) or _error("SQL_ERROR_THROWEN");
                        $post_id = $db->insert_id;
                        /* insert new group cover to album */
                        $db->query(sprintf("INSERT INTO posts_photos (post_id, album_id, source, blur) VALUES (%s, %s, %s, %s)", secure($post_id, 'int'), secure($group['group_album_covers'], 'int'), secure($file_name), secure($image_blured) )) or _error("SQL_ERROR_THROWEN");
                        $photo_id = $db->insert_id;
                        /* update group cover */
                        $db->query(sprintf("UPDATE `groups` SET group_cover = %s, group_cover_id = %s WHERE group_id = %s", secure($file_name), secure($photo_id, 'int'), secure($group['group_id'], 'int') )) or _error("SQL_ERROR_THROWEN");
                        break;

                    case 'picture-group':
                        /* check if group id is set */
                        if(!isset($_POST['id']) || !is_numeric($_POST['id'])) {
                            /* delete the uploaded image & return error 403 */
                            unlink($path);
                            _error(403);
                        }
                        /* check the group */
                        $get_group = $db->query(sprintf("SELECT * FROM `groups` WHERE group_id = %s", secure($_POST['id'], 'int') )) or _error("SQL_ERROR_THROWEN");
                        if($get_group->num_rows == 0) {
                            /* delete the uploaded image & return error 403 */
                            unlink($path);
                            _error(403);
                        }
                        $group = $get_group->fetch_assoc();
                        /* check if the user is the group admin */
                        if(!$user->check_group_adminship($user->_data['user_id'], $group['group_id'])) {
                            /* delete the uploaded image & return error 403 */
                            unlink($path);
                            _error(403);
                        }
                        /* check for group pictures album */
                        if(!$group['group_album_pictures']) {
                            /* create new group pictures album */
                            $db->query(sprintf("INSERT INTO posts_photos_albums (user_id, user_type, in_group, group_id, title, privacy) VALUES (%s, 'user', '1', %s, 'Profile Pictures', 'public')", secure($user->_data['user_id'], 'int'), secure($group['group_id'], 'int') )) or _error("SQL_ERROR_THROWEN");
                            $group['group_album_pictures'] = $db->insert_id;
                            /* update group profile picture album id */
                            $db->query(sprintf("UPDATE `groups` SET group_album_pictures = %s WHERE group_id = %s", secure($group['group_album_pictures'], 'int'), secure($group['group_id'], 'int') )) or _error("SQL_ERROR_THROWEN");
                        }
                        /* insert updated group picture post */
                        $db->query(sprintf("INSERT INTO posts (user_id, user_type, post_type, in_group, group_id, time, privacy) VALUES (%s, 'user', 'group_picture', '1', %s, %s, 'custom')", secure($user->_data['user_id'], 'int'), secure($group['group_id'], 'int'), secure($date) )) or _error("SQL_ERROR_THROWEN");
                        $post_id = $db->insert_id;
                        /* insert new group picture to album */
                        $db->query(sprintf("INSERT INTO posts_photos (post_id, album_id, source, blur) VALUES (%s, %s, %s, %s)", secure($post_id, 'int'), secure($group['group_album_pictures'], 'int'), secure($file_name), secure($image_blured) )) or _error("SQL_ERROR_THROWEN");
                        $photo_id = $db->insert_id;
                        /* delete old cropped picture from uploads folder */
                        delete_uploads_file($group['group_picture']);
                        /* update group picture */
                        $db->query(sprintf("UPDATE `groups` SET group_picture = %s, group_picture_id = %s WHERE group_id = %s", secure($file_name), secure($photo_id, 'int'), secure($group['group_id'], 'int') )) or _error("SQL_ERROR_THROWEN");
                        break;

                    case 'cover-event':
                        /* check if event id is set */
                        if(!isset($_POST['id']) || !is_numeric($_POST['id'])) {
                            /* delete the uploaded image & return error 403 */
                            unlink($path);
                            _error(403);
                        }
                        /* check the event */
                        $get_event = $db->query(sprintf("SELECT * FROM `events` WHERE event_id = %s", secure($_POST['id'], 'int') )) or _error("SQL_ERROR_THROWEN");
                        if($get_event->num_rows == 0) {
                            /* delete the uploaded image & return error 403 */
                            unlink($path);
                            _error(403);
                        }
                        $event = $get_event->fetch_assoc();
                        /* check if the user is the event admin */
                        if(!$user->check_event_adminship($user->_data['user_id'], $event['event_id'])) {
                            /* delete the uploaded image & return error 403 */
                            unlink($path);
                            _error(403);
                        }
                        /* check for event covers album */
                        if(!$event['event_album_covers']) {
                            /* create new event covers album */
                            $db->query(sprintf("INSERT INTO posts_photos_albums (user_id, user_type, in_event, event_id, title, privacy) VALUES (%s, 'user', '1', %s, 'Cover Photos', 'public')", secure($user->_data['user_id'], 'int'), secure($event['event_id'], 'int') )) or _error("SQL_ERROR_THROWEN");
                            $event['event_album_covers'] = $db->insert_id;
                            /* update event cover album id */
                            $db->query(sprintf("UPDATE `events` SET event_album_covers = %s WHERE event_id = %s", secure($event['event_album_covers'], 'int'), secure($event['event_id'], 'int') )) or _error("SQL_ERROR_THROWEN");
                        }
                        /* insert updated event cover post */
                        $db->query(sprintf("INSERT INTO posts (user_id, user_type, post_type, in_event, event_id, time, privacy) VALUES (%s, 'user', 'event_cover', '1', %s, %s, 'custom')", secure($user->_data['user_id'], 'int'), secure($event['event_id'], 'int'), secure($date) )) or _error("SQL_ERROR_THROWEN");
                        $post_id = $db->insert_id;
                        /* insert new event cover to album */
                        $db->query(sprintf("INSERT INTO posts_photos (post_id, album_id, source, blur) VALUES (%s, %s, %s, %s)", secure($post_id, 'int'), secure($event['event_album_covers'], 'int'), secure($file_name), secure($image_blured) )) or _error("SQL_ERROR_THROWEN");
                        $photo_id = $db->insert_id;
                        /* update event cover */
                        $db->query(sprintf("UPDATE `events` SET event_cover = %s, event_cover_id = %s WHERE event_id = %s", secure($file_name), secure($photo_id, 'int'), secure($event['event_id'], 'int') )) or _error("SQL_ERROR_THROWEN");
                        break;
                }

                // return the file new name & exit
                return_json(array("file" => $file_name));

            }
            break;

        case 'video':
            // check video upload enabled
            if(!$system['videos_enabled']) {
                modal("MESSAGE", __("Not Allowed"), __("This feature has been disabled"));
            }

            // get allowed file size
            $max_allowed_size = $system['max_video_size'] * 1024;

            // prepare uploads directory
            $folder = 'videos';
            $directory = $folder.'/'. date('Y') . '/' . date('m') . '/';

            if($_POST["multiple"] == "true") {

                // prepare files
                $files = array();
                foreach($_FILES['file'] as $key => $val) {
                    for($i=0; $i < count($val); $i++) {
                        $files[$i][$key] = $val[$i];
                    }
                }
                $return_files = array();
                $files_num = count($files);

                // upload files
                foreach ($files as $file) {
                    
                    // valid inputs
                    if(!isset($file) || $file["error"] != UPLOAD_ERR_OK) {
                        if($files_num > 1) {
                            continue;
                        } else {
                            modal("MESSAGE", __("Upload Error"), __("Something wrong with upload! Is 'upload_max_filesize' set correctly?"));
                        }
                    }
                    
                    // check file size
                    if($file["size"] > $max_allowed_size) {
                        if($files_num > 1) {
                            continue;
                        } else {
                            modal("MESSAGE", __("Upload Error"), __("The file size is so big"));
                        }
                    }

                    // check file extesnion
                    $extension = get_extension($file["name"]);
                    if(!valid_extension($extension, $system['video_extensions'])) {
                        if($files_num > 1) {
                            continue;
                        } else {
                            modal("MESSAGE", __("Upload Error"), __("The file type is not valid or not supported"));
                        }
                    }

                    // prepare file name & path
                    $prefix = $system['uploads_prefix'].'_'.get_hash_token();
                    $file_name = $directory.$prefix.'.'.$extension;
                    $path = ABSPATH.$system['uploads_directory'].'/'.$file_name;

                    // upload to
                    if($system['s3_enabled']) {
                        /* Amazon S3 */
                        aws_s3_upload($file['tmp_name'], $file_name);
                    } elseif ($system['digitalocean_enabled']) {
                        /* DigitalOcean */
                        digitalocean_space_upload($file['tmp_name'], $file_name);
                    } elseif ($system['ftp_enabled']) {
                        /* FTP */
                        ftp_upload($file['tmp_name'], $file_name);
                    } else {
                        /* local server */
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
                        /* check if the file uploaded successfully */
                        if(!@move_uploaded_file($file["tmp_name"], $path)) {
                            modal("MESSAGE", __("Upload Error"), __("Sorry, can not upload the file"));
                        }
                    }

                    /* return */
                    $return_files[] = $file_name;
                }

                // return the return_files & exit
                return_json(array("files" => $return_files));

            } else {

                // valid inputs
                if(!isset($_FILES["file"]) || $_FILES["file"]["error"] != UPLOAD_ERR_OK) {
                    modal("MESSAGE", __("Upload Error"), __("Something wrong with upload! Is 'upload_max_filesize' set correctly?"));
                }

                // check file size
                if($_FILES["file"]["size"] > $max_allowed_size) {
                    modal("MESSAGE", __("Upload Error"), __("The file size is so big"));
                }

                // check file extesnion
                $extension = get_extension($_FILES['file']['name']);
                if(!valid_extension($extension, $system['video_extensions'])) {
                    modal("MESSAGE", __("Upload Error"), __("The file type is not valid or not supported"));
                }

                // prepare file name & path
                $prefix = $system['uploads_prefix'].'_'.get_hash_token();
                $file_name = $directory.$prefix.'.'.$extension;
                $path = ABSPATH.$system['uploads_directory'].'/'.$file_name;

                // upload to
                if($system['s3_enabled']) {
                    /* Amazon S3 */
                    aws_s3_upload($_FILES['file']['tmp_name'], $file_name);
                } elseif ($system['digitalocean_enabled']) {
                    /* DigitalOcean */
                    digitalocean_space_upload($_FILES['file']['tmp_name'], $file_name);
                } elseif ($system['ftp_enabled']) {
                        /* FTP */
                        ftp_upload($_FILES['file']['tmp_name'], $file_name);
                } else {
                    /* local server */
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
                    /* check if the file uploaded successfully */
                    if(!@move_uploaded_file($_FILES['file']['tmp_name'], $path)) {
                        modal("MESSAGE", __("Upload Error"), __("Sorry, can not upload the file"));
                    }
                }
                
                // return the file new name & exit
                return_json(array("file" => $file_name));

            }
            break;

        case 'audio':
            // check audio upload enabled
            if(!$system['audio_enabled']) {
                modal("MESSAGE", __("Not Allowed"), __("This feature has been disabled"));
            }

            // get allowed file size
            $max_allowed_size = $system['max_audio_size'] * 1024;

            // prepare uploads directory
            $folder = 'sounds';
            $directory = $folder.'/'. date('Y') . '/' . date('m') . '/';

            // valid inputs
            if(!isset($_FILES["file"]) || $_FILES["file"]["error"] != UPLOAD_ERR_OK) {
                modal("MESSAGE", __("Upload Error"), __("Something wrong with upload! Is 'upload_max_filesize' set correctly?"));
            }

            // check file size
            if($_FILES["file"]["size"] > $max_allowed_size) {
                modal("MESSAGE", __("Upload Error"), __("The file size is so big"));
            }

            // check file extesnion
            $extension = get_extension($_FILES['file']['name']);
            if(!valid_extension($extension, $system['audio_extensions'])) {
                modal("MESSAGE", __("Upload Error"), __("The file type is not valid or not supported"));
            }

            // prepare file name & path
            $prefix = $system['uploads_prefix'].'_'.get_hash_token();
            $file_name = $directory.$prefix.'.'.$extension;
            $path = ABSPATH.$system['uploads_directory'].'/'.$file_name;

            // upload to
            if($system['s3_enabled']) {
                /* Amazon S3 */
                aws_s3_upload($_FILES['file']['tmp_name'], $file_name);
            } elseif ($system['digitalocean_enabled']) {
                /* DigitalOcean */
                digitalocean_space_upload($_FILES['file']['tmp_name'], $file_name);
            } elseif ($system['ftp_enabled']) {
                /* FTP */
                ftp_upload($_FILES['file']['tmp_name'], $file_name);
            } else {
                /* local server */
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
                /* check if the file uploaded successfully */
                if(!@move_uploaded_file($_FILES['file']['tmp_name'], $path)) {
                    modal("MESSAGE", __("Upload Error"), __("Sorry, can not upload the file"));
                }
            }

            // return the file new name & exit
            return_json(array("file" => $file_name));
            break;

        case 'file':
            // check file upload enabled
            if(!$system['file_enabled']) {
                modal("MESSAGE", __("Not Allowed"), __("This feature has been disabled"));
            }

            // get allowed file size
            $max_allowed_size = $system['max_file_size'] * 1024;

            // prepare uploads directory
            $folder = 'files';
            $directory = $folder.'/'. date('Y') . '/' . date('m') . '/';

            // valid inputs
            if(!isset($_FILES["file"]) || $_FILES["file"]["error"] != UPLOAD_ERR_OK) {
                modal("MESSAGE", __("Upload Error"), __("Something wrong with upload! Is 'upload_max_filesize' set correctly?"));
            }

            // check file size
            if($_FILES["file"]["size"] > $max_allowed_size) {
                modal("MESSAGE", __("Upload Error"), __("The file size is so big"));
            }

            // check file extesnion
            $extension = get_extension($_FILES['file']['name']);
            if(!valid_extension($extension, $system['file_extensions'])) {
                modal("MESSAGE", __("Upload Error"), __("The file type is not valid or not supported"));
            }

            // prepare file name & path
            $prefix = $system['uploads_prefix'].'_'.get_hash_token();
            $file_name = $directory.$prefix.'.'.$extension;
            $path = ABSPATH.$system['uploads_directory'].'/'.$file_name;

            // upload to
            if($system['s3_enabled']) {
                /* Amazon S3 */
                aws_s3_upload($_FILES['file']['tmp_name'], $file_name);
            } elseif ($system['digitalocean_enabled']) {
                /* DigitalOcean */
                digitalocean_space_upload($_FILES['file']['tmp_name'], $file_name);
            } elseif ($system['ftp_enabled']) {
                /* FTP */
                ftp_upload($_FILES['file']['tmp_name'], $file_name);
            } else {
                /* local server */
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
                /* check if the file uploaded successfully */
                if(!@move_uploaded_file($_FILES['file']['tmp_name'], $path)) {
                    modal("MESSAGE", __("Upload Error"), __("Sorry, can not upload the file"));
                }
            }

            // return the file new name & exit
            return_json(array("file" => $file_name));
            break;

        default:
            _error(403);
            break;
    }

} catch (Exception $e) {
    modal("ERROR", __("Error"), $e->getMessage());
}
    
?>