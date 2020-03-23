<?php
/**
 * ajax -> data -> search
 * 
 * @package Sngine
 * @author Zamblek
 */

// fetch bootstrap
require('../../../bootstrap.php');

// check AJAX Request
is_ajax();

// valid inputs
if(!isset($_POST['query'])) {
	_error(400);
}

try {

	// initialize the return array
	$return = array();

	// get results
	$results = $user->search_quick($_POST['query']);
	if($results) {
		/* assign variables */
		$smarty->assign('results', $results);
		/* return */
		$return['results'] = $smarty->fetch("ajax.search.tpl");
	}
	
	// return & exit
	return_json($return);

} catch (Exception $e) {
	modal("ERROR", __("Error"), $e->getMessage());
}

?>