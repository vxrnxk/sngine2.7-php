<?php
/**
 * movies
 * 
 * @package Sngine
 * @author Zamblek
 */

// fetch bootloader
require('bootloader.php');

// movies enabled
if(!$system['movies_enabled']) {
	_error(404);
}

// user access
if(!$system['system_public']) {
	user_access();
}

try {

	// get view content
	$_GET['view'] = (isset($_GET['view']))? $_GET['view'] : '';
	switch ($_GET['view']) {
		case '':
			// prepare query
			/* prepare where query */
			$where_query = "";
			/* prepare pager url */
			$url = "";

			// page header
			page_header($system['system_title'].' - '.__("Movies"));
			break;

		case 'search':
			// check query
			if(!isset($_GET['query']) || is_empty($_GET['query'])) {
				redirect('/movies');
			}
			/* assign variables */
			$smarty->assign('query', $_GET['query']);

			// prepare query
			/* prepare where query */
			$where_query = sprintf('WHERE (title LIKE %1$s OR description LIKE %1$s OR stars LIKE %1$s)', secure($_GET['query'], 'search') );
			/* prepare pager url */
			$url = "/search/".$_GET['query'];

			// page header
			page_header($system['system_title'].' - '.__("Movies"));
			break;

		case 'genre':
			// get genre
			$genre = $user->get_movies_genre($_GET['genre_id']);
			if(!$genre)  {
				_error(404);
			}
			/* assign variables */
			$smarty->assign('genre', $genre);

			// prepare query
			/* prepare where query */
			$where_query = sprintf("WHERE find_in_set(%s, genres) > 0", secure($genre['genre_id'], 'int'));
			/* prepare pager url */
			$url = "/genre/".$genre['genre_id']."/".$genre['genre_url'];

			// page header
			page_header($system['system_title'].' - '.__("Movies").' - '.__($genre['genre_name']), __($genre['genre_description']));
			break;

		case 'movie':
			// get movie
			$movie = $user->get_movie($_GET['movie_id']);
			if(!$movie)  {
				_error(404);
			}
			/* assign variables */
			$smarty->assign('movie', $movie);

			// page header
			page_header($movie['title'], $movie['description'], $movie['poster']);
			break;

		default:
			_error(404);
			break;
	}

	if($_GET['view'] != "movie") {
		// prepare pager
		require('includes/class-pager.php');
		$params['selected_page'] = ( (int) $_GET['page'] == 0) ? 1 : $_GET['page'];
		$total = $db->query("SELECT COUNT(*) as count FROM movies ".$where_query) or _error("SQL_ERROR");
		$params['total_items'] = $total->fetch_assoc()['count'];
		$params['items_per_page'] = $system['min_results_even'];
		$params['url'] = $system['system_url'].'/movies'.$url.'/%s';
		$pager = new Pager($params);
		$limit_query = $pager->getLimitSql();

		// get movies
		$movies = array();
		$get_movies = $db->query("SELECT * FROM movies ".$where_query." ORDER BY movie_id DESC ".$limit_query) or _error("SQL_ERROR");
		while($movie = $get_movies->fetch_assoc()) {
	        $movie['poster'] = get_picture($movie['poster'], 'movie');
	        $movie['movie_url'] = get_url_text($movie['title']);
	        $movie['genres_list'] = $user->get_movie_genres($movie['genres']);
	        $movies[] = $movie;
		}
		/* assign variables */
		$smarty->assign('movies', $movies);
		$smarty->assign('total', $params['total_items']);
		$smarty->assign('pager', $pager->getPager());

		// get ads
		$ads = $user->ads('movies');
		/* assign variables */
		$smarty->assign('ads', $ads);
	}

	// assign view
	$smarty->assign('view', $_GET['view']);

	// get movies genres
	$genres = $user->get_movies_genres();
	/* assign variables */
	$smarty->assign('genres', $genres);

} catch (Exception $e) {
	_error(__("Error"), $e->getMessage());
}

// page footer
page_footer("movies");

?>