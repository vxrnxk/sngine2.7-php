<?php
/**
 * forums
 * 
 * @package Sngine
 * @author Zamblek
 */

// fetch bootloader
require('bootloader.php');

// forums enabled
if(!$system['forums_enabled']) {
	_error(404);
}

// user access
if(!$system['system_public']) {
	user_access();
}

try {

	// get view content
	switch ($_GET['view']) {
		case '':
			// page header
			page_header(__("Forums"));

			// get forums
			$forums = $user->get_forums();
			/* assign variables */
			$smarty->assign('forums', $forums);

			// get online users
			if($system['forums_online_enabled']) {
				$online_users = $user->get_forum_online_users();
				/* assign variables */
				$smarty->assign('online_users', $online_users);
			}

			// get insights
			if($system['forums_statistics_enabled']) {
				/* total threads */
				$get_threads = $db->query("SELECT COUNT(*) as count FROM forums_threads") or _error("SQL_ERROR_THROWEN");
		    	$insights['threads'] = $get_threads->fetch_assoc()['count'];
		    	/* total replies */
				$get_replies = $db->query("SELECT COUNT(*) as count FROM forums_replies") or _error("SQL_ERROR_THROWEN");
		    	$insights['replies'] = $get_replies->fetch_assoc()['count'];
				/* total users */
				$get_users = $db->query("SELECT COUNT(*) as count FROM users") or _error("SQL_ERROR_THROWEN");
		    	$insights['users'] = $get_users->fetch_assoc()['count'];
		    	/* assign variables */
				$smarty->assign('insights', $insights);
			}
			break;

		case 'forum':
			// get forum
			$forum = $user->get_forum($_GET['forum_id']);
			if(!$forum)  {
				_error(404);
			}
			/* get threads */
			if($forum['forum_threads'] > 0) {
				$forum['threads'] = $user->get_forum_threads( array('forum' => $forum) );
			}
			/* assign variables */
			$smarty->assign('forum', $forum);

			// page header
			page_header($forum['forum_name'], $forum['forum_description']);
			break;

		case 'thread':
			// get thread
			$thread = $user->get_forum_thread($_GET['thread_id'], true);
			if(!$thread)  {
				_error(404);
			}
			/* get replies */
			if($thread['replies'] > 0) {
				$thread['thread_replies'] = $user->get_forum_replies( array('thread' => $thread) );
			}
			/* assign variables */
			$smarty->assign('thread', $thread);

			// page header
			page_header($thread['title'], $thread['text_snippet']);
			break;

		case 'new-thread':
			// user access
			user_access();

			// page header
			page_header(__("Forums")." &rsaquo; ".__("Write New Thread"));

			// get forum
			$forum = $user->get_forum($_GET['forum_id'], false);
			if(!$forum)  {
				_error(404);
			}
			/* assign variables */
			$smarty->assign('forum', $forum);
			break;

		case 'edit-thread':
			// user access
			user_access();

			// page header
			page_header(__("Forums")." &rsaquo; ".__("Edit Thread"));

			// get thread
			$thread = $user->get_forum_thread($_GET['thread_id']);
			if(!$thread)  {
				_error(404);
			}
			/* assign variables */
			$smarty->assign('thread', $thread);
			break;

		case 'new-reply':
			// user access
			user_access();

			// page header
			page_header(__("Forums")." &rsaquo; ".__("Post Reply"));

			// get thread
			$thread = $user->get_forum_thread($_GET['thread_id']);
			if(!$thread)  {
				_error(404);
			}
			/* assign variables */
			$smarty->assign('thread', $thread);
			break;

		case 'edit-reply':
			// user access
			user_access();

			// page header
			page_header(__("Forums")." &rsaquo; ".__("Edit Reply"));

			// get reply
			$reply = $user->get_forum_reply($_GET['reply_id']);
			if(!$reply)  {
				_error(404);
			}
			/* assign variables */
			$smarty->assign('reply', $reply);
			break;

		case 'my-threads':
			// user access
			user_access();

			// page header
			page_header(__("Forums")." &rsaquo; ".__("My Threads"));

			// get threads
			$threads = $user->get_forum_threads( array('user_id' => $user->_data['user_id']) );
			/* assign variables */
			$smarty->assign('threads', $threads);
			break;

		case 'my-replies':
			// user access
			user_access();

			// page header
			page_header(__("Forums")." &rsaquo; ".__("My Replies"));

			// get replies
			$replies = $user->get_forum_replies( array('user_id' => $user->_data['user_id']) );
			/* assign variables */
			$smarty->assign('replies', $replies);
			break;

		case 'search':
			// page header
			page_header(__("Forums")." &rsaquo; ".__("Search"));

			// get forums
			$forums = $user->get_forums();
			/* assign variables */
			$smarty->assign('forums', $forums);
			break;

		case 'search-results':
			// page header
			page_header(__("Forums")." &rsaquo; ".__("Search Results"));

			if(!isset($_GET['query']) || !isset($_GET['type']) || !isset($_GET['forum']) ) {
				redirect('/forums/search');
			}
			$results = $user->search_forums($_GET['query'], $_GET['type'], $_GET['forum'], $_GET['recursive']);
			$smarty->assign('query', $_GET['query']);
			$smarty->assign('type', $_GET['type']);
			$smarty->assign('results', $results);
			break;

		default:
			_error(404);
			break;
	}
	/* assign variables */
	$smarty->assign('view', $_GET['view']);
	
} catch (Exception $e) {
	_error(__("Error"), $e->getMessage());
}

// page footer
page_footer("forums");

?>