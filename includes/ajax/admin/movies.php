<?php
/**
 * ajax -> admin -> movies
 * 
 * @package Sngine
 * @author Zamblek
 */

// fetch bootstrap
require('../../../bootstrap.php');

// check AJAX Request
is_ajax();

// check admin|moderator permission
if(!$user->_is_admin && !$user->_is_moderator) {
	modal("MESSAGE", __("System Message"), __("You don't have the right permission to access this"));
}

// handle movies
try {

	switch ($_GET['do']) {
		case 'add_movie':
			/* validate source */
			if(isset($_POST['source_url']) && !is_empty($_POST['source_url']) ) {
				$url = $_POST['source_url'];
				$url_parsed = parse_url($url);
		        if(!isset($url_parsed["scheme"]) ) {
		            $url = "http://".$url;
		        }
		        $source = ger_origin_url($url);
		        $source_type = get_video_type($source);
			} elseif (isset($_POST['source_upload']) && !is_empty($_POST['source_upload'])) {
				$source = $_POST['source_upload'];
				$source_type = "uploaded";
			} else {
				throw new Exception(__("You have to select a valid source for the movie"));
			}
			/* validate title */
			if(is_empty($_POST['title'])) {
	            throw new Exception(__("You have to enter title for the movie"));
	        }
	        /* validate imdb link */
	        if(!is_empty($_POST['imdb_url'])) {
                if(!valid_url($_POST['imdb_url'])) {
                    throw new Exception(__("Please enter a valid imdb link"));
                }
            }
            /* validate release year */
            $_POST['release_year'] = (is_empty($_POST['release_year']))? 'null' : $_POST['release_year'];
            /* validate duration */
            $_POST['duration'] = (is_empty($_POST['duration']))? 'null' : $_POST['duration'];
	        /* validate movie genres */
	        if(!isset($_POST['movie_genres']) || !is_array($_POST['movie_genres'])) {
	        	throw new Exception(__("You have to select genre for the movie"));
	        }
        	$_POST['movie_genres'] = implode(',',$_POST['movie_genres']);
			/* insert */
			$db->query(sprintf("INSERT INTO movies (source, source_type, title, description, imdb_url, stars, release_year, duration, genres, poster) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s)", secure($source), secure($source_type), secure($_POST['title']), secure($_POST['description']), secure($_POST['imdb_url']), secure($_POST['stars']), secure($_POST['release_year'], 'int'), secure($_POST['duration'], 'int'), secure($_POST['movie_genres']), secure($_POST['poster']) )) or _error("SQL_ERROR_THROWEN");
			/* return */
			return_json( array('callback' => 'window.location = "'.$system['system_url'].'/'.$control_panel['url'].'/movies";') );
			break;

		case 'edit_movie':
			/* valid inputs */
			if(!isset($_GET['id']) || !is_numeric($_GET['id'])) {
				_error(400);
			}
			/* validate source */
			if(isset($_POST['source_url']) && !is_empty($_POST['source_url']) ) {
				$url = $_POST['source_url'];
				$url_parsed = parse_url($url);
		        if(!isset($url_parsed["scheme"]) ) {
		            $url = "http://".$url;
		        }
		        $source = ger_origin_url($url);
		        $source_type = get_video_type($source);
			} elseif (isset($_POST['source_upload']) && !is_empty($_POST['source_upload'])) {
				$source = $_POST['source_upload'];
				$source_type = "uploaded";
			} else {
				throw new Exception(__("You have to select a valid source for the movie"));
			}
			/* validate title */
			if(is_empty($_POST['title'])) {
	            throw new Exception(__("You have to enter title for the movie"));
	        }
	        /* validate imdb link */
	        if(!is_empty($_POST['imdb_url'])) {
                if(!valid_url($_POST['imdb_url'])) {
                    throw new Exception(__("Please enter a valid imdb link"));
                }
            }
            /* validate release year */
            $_POST['release_year'] = (is_empty($_POST['release_year']))? 'null' : $_POST['release_year'];
            /* validate duration */
            $_POST['duration'] = (is_empty($_POST['duration']))? 'null' : $_POST['duration'];
	        /* validate movie genres */
	        if(!isset($_POST['movie_genres']) || !is_array($_POST['movie_genres'])) {
	        	throw new Exception(__("You have to select genre for the movie"));
	        }
        	$_POST['movie_genres'] = implode(',',$_POST['movie_genres']);
        	/* update */
			$db->query(sprintf("UPDATE movies SET source = %s, source_type = %s, title = %s, description = %s, imdb_url = %s, stars = %s, release_year = %s, duration = %s, genres = %s, poster = %s WHERE movie_id = %s", secure($source), secure($source_type), secure($_POST['title']), secure($_POST['description']), secure($_POST['imdb_url']), secure($_POST['stars']), secure($_POST['release_year'], 'int'), secure($_POST['duration'], 'int'), secure($_POST['movie_genres']), secure($_POST['poster']), secure($_GET['id'], 'int') )) or _error("SQL_ERROR_THROWEN");
			/* return */
			return_json( array('success' => true, 'message' => __("Movie info have been updated")) );
			break;

		case 'add_genre':
			/* insert */
			$db->query(sprintf("INSERT INTO movies_genres (genre_name, genre_order, genre_description) VALUES (%s, %s, %s)", secure($_POST['genre_name']), secure($_POST['genre_order'], 'int'), secure($_POST['genre_description']) )) or _error("SQL_ERROR_THROWEN");
			/* return */
			return_json( array('callback' => 'window.location = "'.$system['system_url'].'/'.$control_panel['url'].'/movies/genres";') );
			break;

		case 'edit_genre':
			/* valid inputs */
			if(!isset($_GET['id']) || !is_numeric($_GET['id'])) {
				_error(400);
			}
			/* update */
			$db->query(sprintf("UPDATE movies_genres SET genre_name = %s, genre_order = %s, genre_description = %s WHERE genre_id = %s", secure($_POST['genre_name']), secure($_POST['genre_order'], 'int'), secure($_POST['genre_description']), secure($_GET['id'], 'int') )) or _error("SQL_ERROR_THROWEN");
			/* return */
			return_json( array('success' => true, 'message' => __("Genre info have been updated")) );
			break;

		default:
			_error(400);
			break;
	}

} catch (Exception $e) {
	return_json( array('error' => true, 'message' => $e->getMessage()) );
}

?>