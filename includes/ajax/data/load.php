<?php
/**
 * ajax -> data -> load
 * 
 * @package Sngine
 * @author Zamblek
 */

// fetch bootstrap
require('../../../bootstrap.php');

// check AJAX Request
is_ajax();

// user access
user_access(true);

// valid inputs
if(!isset($_POST['offset']) || !is_numeric($_POST['offset'])) {
	_error(400);
}

try {

	// initialize the return array
	$return = array();

	// initialize the attach type
	$append = true;

	// get data
	/* get newsfeed || popular || discover || saved || memories || boosted */
	if($_POST['get'] == "newsfeed" || $_POST['get'] == "popular" || $_POST['get'] == "discover" || $_POST['get'] == "saved" || $_POST['get'] == "memories" || $_POST['get'] == "boosted") {
		$data = $user->get_posts( array('get' => $_POST['get'], 'filter' => $_POST['filter'], 'offset' => $_POST['offset']) );

		// get ads campaigns
		$ads_campaigns = $user->ads_campaigns('newsfeed');
		/* assign variables */
		$smarty->assign('ads_campaigns', $ads_campaigns);

		// get ads
		switch ($_POST['offset']) {
			case '1':
				$ads = $user->ads('newfeed_1');
				break;
			
			case '2':
				$ads = $user->ads('newfeed_2');
				break;

			case '3':
				$ads = $user->ads('newfeed_3');
				break;
		}
		/* assign variables */
		$smarty->assign('ads', $ads);


	/* get posts_profile || posts_page || posts_group || posts_group_pending || posts_group_pending_all || posts_event || posts_event_pending ||  posts_event_pending_all */
	} elseif ($_POST['get'] == "posts_profile" || $_POST['get'] == "posts_page" || $_POST['get'] == "posts_group" || $_POST['get'] == "posts_group_pending" || $_POST['get'] == "posts_group_pending_all" || $_POST['get'] == "posts_event" || $_POST['get'] == "posts_event_pending" || $_POST['get'] == "posts_event_pending_all") {
		/* check id */
		if(!isset($_POST['id']) || !is_numeric($_POST['id'])) {
			_error(400);
		}
		$data = $user->get_posts( array('get' => $_POST['get'], 'filter' => $_POST['filter'], 'offset' => $_POST['offset'], 'id' => $_POST['id']) );

		// get ads campaigns
		$ads_campaigns = $user->ads_campaigns('newsfeed');
		/* assign variables */
		$smarty->assign('ads_campaigns', $ads_campaigns);

		// get ads
		switch ($_POST['offset']) {
			case '1':
				$ads = $user->ads('newfeed_1');
				break;
			
			case '2':
				$ads = $user->ads('newfeed_2');
				break;

			case '3':
				$ads = $user->ads('newfeed_3');
				break;
		}
		/* assign variables */
		$smarty->assign('ads', $ads);


	/* get who shares the post */
	} elseif ($_POST['get'] == "shares") {
		/* check id */
		if(!isset($_POST['id']) || !is_numeric($_POST['id'])) {
			_error(400);
		}
		$data = $user->who_shares($_POST['id'], $_POST['offset']);


	/* get articles */
	} elseif ($_POST['get'] == "articles") {
		$data = $user->get_articles( array('offset' => $_POST['offset']) );


	/* get category articles */
	} elseif ($_POST['get'] == "category_articles") {
		/* check id */
		if(!isset($_POST['id']) || !is_numeric($_POST['id'])) {
			_error(400);
		}
		$data = $user->get_articles( array("category" => $_POST['id'], 'offset' => $_POST['offset']) );


	/* get post comments */
	} elseif ($_POST['get'] == "post_comments") {
		/* check id */
		if(!isset($_POST['id']) || !is_numeric($_POST['id'])) {
			_error(400);
		}
		$data = $user->get_comments($_POST['id'], $_POST['offset'], true, false);

	/* get post comments top */
	} elseif ($_POST['get'] == "post_comments_top") {
		/* check id */
		if(!isset($_POST['id']) || !is_numeric($_POST['id'])) {
			_error(400);
		}
		$data = $user->get_comments($_POST['id'], $_POST['offset'], true, false, [], true);


	/* get photo comments */
	} elseif ($_POST['get'] == "photo_comments") {
		/* check id */
		if(!isset($_POST['id']) || !is_numeric($_POST['id'])) {
			_error(400);
		}
		$data = $user->get_comments($_POST['id'], $_POST['offset'], false, false);

	/* get photo comments top */
	} elseif ($_POST['get'] == "photo_comments_top") {
		/* check id */
		if(!isset($_POST['id']) || !is_numeric($_POST['id'])) {
			_error(400);
		}
		$data = $user->get_comments($_POST['id'], $_POST['offset'], false, false, [], true);
		

	/* get comment replies */
	} elseif ($_POST['get'] == "comment_replies") {
		/* check id */
		if(!isset($_POST['id']) || !is_numeric($_POST['id'])) {
			_error(400);
		}
		$append = false;
		$data = $user->get_replies($_POST['id'], $_POST['offset'], false);


	/* get photos */
	} elseif ($_POST['get'] == "photos") {
		/* check uid */
		if(!isset($_POST['id']) || !is_numeric($_POST['id'])) {
			_error(400);
		}
		$data = $user->get_photos($_POST['id'], $_POST['type'], $_POST['offset'], false);
		$context = ($_POST['type'] == "album")? "album" : "photos";
		$smarty->assign('context', $context);


	/* get albums */
	} elseif ($_POST['get'] == "albums") {
		/* check uid */
		if(!isset($_POST['id']) || !is_numeric($_POST['id'])) {
			_error(400);
		}
		$data = $user->get_albums($_POST['id'], $_POST['type'], $_POST['offset']);


	/* get videos */
	} elseif ($_POST['get'] == "videos") {
		/* check uid */
		if(!isset($_POST['id']) || !is_numeric($_POST['id'])) {
			_error(400);
		}
		$data = $user->get_videos($_POST['id'], $_POST['type'], $_POST['offset']);


	/* get who reacted to the post */
	} elseif ($_POST['get'] == "post_reactions") {
		/* check id */
		if(!isset($_POST['id']) || !is_numeric($_POST['id'])) {
			_error(400);
		}
		$data = $user->who_reacts( ['post_id' => $_POST['id'], 'reaction_type'=> $_POST['filter'], 'offset' => $_POST['offset']] );


	/* get who reacted to the photo */
	} elseif ($_POST['get'] == "photo_reactions") {
		/* check id */
		if(!isset($_POST['id']) || !is_numeric($_POST['id'])) {
			_error(400);
		}
		$data = $user->who_reacts( ['photo_id' => $_POST['id'], 'reaction_type'=> $_POST['filter'], 'offset' => $_POST['offset']] );


	/* get who reacted to the comment */
	} elseif ($_POST['get'] == "comment_reactions") {
		/* check id */
		if(!isset($_POST['id']) || !is_numeric($_POST['id'])) {
			_error(400);
		}
		$data = $user->who_reacts( ['comment_id' => $_POST['id'], 'reaction_type'=> $_POST['filter'], 'offset' => $_POST['offset']] );

	
	/* get voters */
	} elseif ($_POST['get'] == "voters") {
		/* check id */
		if(!isset($_POST['id']) || !is_numeric($_POST['id'])) {
			_error(400);
		}
		$data = $user->who_votes($_POST['id'], $_POST['offset']);


	/* get blocks */
	} elseif ($_POST['get'] == "blocks") {
		$data = $user->get_blocked($_POST['offset']);


	/* get affiliates */
	} elseif ($_POST['get'] == "affiliates") {
		/* check uid */
		if(!isset($_POST['uid']) || !is_numeric($_POST['uid'])) {
			_error(400);
		}
		$data = $user->get_affiliates($_POST['uid'], $_POST['offset']);


	/* get friend requests */
	} elseif ($_POST['get'] == "friend_requests") {
		$data = $user->get_friend_requests($_POST['offset']);


	/* get friend requests sent */
	} elseif ($_POST['get'] == "friend_requests_sent") {
		$data = $user->get_friend_requests_sent($_POST['offset']);


	/* get mutual friends */
	} elseif ($_POST['get'] == "mutual_friends") {
		/* check uid */
		if(!isset($_POST['uid']) || !is_numeric($_POST['uid'])) {
			_error(400);
		}
		$data = $user->get_mutual_friends($_POST['uid'], $_POST['offset']);


	/* get new people */
	} elseif ($_POST['get'] == "new_people") {
		$data = $user->get_new_people($_POST['offset']);
	

	/* get friends */
	} elseif ($_POST['get'] == "friends") {
		/* check uid */
		if(!isset($_POST['uid']) || !is_numeric($_POST['uid'])) {
			_error(400);
		}
		$data = $user->get_friends($_POST['uid'], $_POST['offset']);
	

	/* get followers */
	} elseif ($_POST['get'] == "followers") {
		/* check uid */
		if(!isset($_POST['uid']) || !is_numeric($_POST['uid'])) {
			_error(400);
		}
		$data = $user->get_followers($_POST['uid'], $_POST['offset']);
	

	/* get followings */
	} elseif ($_POST['get'] == "followings") {
		/* check uid */
		if(!isset($_POST['uid']) || !is_numeric($_POST['uid'])) {
			_error(400);
		}
		$data = $user->get_followings($_POST['uid'], $_POST['offset']);


	/* get page invites */
	} elseif ($_POST['get'] == "page_invites") {
		/* check id */
		if(!isset($_POST['id']) || !is_numeric($_POST['id'])) {
			_error(400);
		}
		$data = $user->get_page_invites($_POST['id'], $_POST['offset']);


	/* get page members */
	} elseif ($_POST['get'] == "page_members") {
		/* check id */
		if(!isset($_POST['id']) || !is_numeric($_POST['id'])) {
			_error(400);
		}
		$data = $user->get_page_members($_POST['id'], $_POST['offset']);


	/* get page admins */
	} elseif ($_POST['get'] == "page_admins") {
		/* check id */
		if(!isset($_POST['id']) || !is_numeric($_POST['id'])) {
			_error(400);
		}
		$data = $user->get_page_admins($_POST['id'], $_POST['offset']);


	/* get group members */
	} elseif ($_POST['get'] == "group_members") {
		/* check id */
		if(!isset($_POST['id']) || !is_numeric($_POST['id'])) {
			_error(400);
		}
		$data = $user->get_group_members($_POST['id'], $_POST['offset']);


	/* get group members manage */
	} elseif ($_POST['get'] == "group_members_manage") {
		/* check id */
		if(!isset($_POST['id']) || !is_numeric($_POST['id'])) {
			_error(400);
		}
		$data = $user->get_group_members($_POST['id'], $_POST['offset'], true);


	/* get group admins */
	} elseif ($_POST['get'] == "group_admins") {
		/* check id */
		if(!isset($_POST['id']) || !is_numeric($_POST['id'])) {
			_error(400);
		}
		$data = $user->get_group_admins($_POST['id'], $_POST['offset']);
		

	/* get group invites */
	} elseif ($_POST['get'] == "group_invites") {
		/* check id */
		if(!isset($_POST['id']) || !is_numeric($_POST['id'])) {
			_error(400);
		}
		$data = $user->get_group_invites($_POST['id'], $_POST['offset']);


	/* get group requests */
	} elseif ($_POST['get'] == "group_requests") {
		/* check id */
		if(!isset($_POST['id']) || !is_numeric($_POST['id'])) {
			_error(400);
		}
		$data = $user->get_group_requests($_POST['id'], $_POST['offset']);


	/* get event going members */
	} elseif ($_POST['get'] == "event_going") {
		/* check id */
		if(!isset($_POST['id']) || !is_numeric($_POST['id'])) {
			_error(400);
		}
		$data = $user->get_event_members($_POST['id'], 'going', $_POST['offset']);


	/* get event interested members */
	} elseif ($_POST['get'] == "event_interested") {
		/* check id */
		if(!isset($_POST['id']) || !is_numeric($_POST['id'])) {
			_error(400);
		}
		$data = $user->get_event_members($_POST['id'], 'interested', $_POST['offset']);


	/* get event invited members */
	} elseif ($_POST['get'] == "event_invited") {
		/* check id */
		if(!isset($_POST['id']) || !is_numeric($_POST['id'])) {
			_error(400);
		}
		$data = $user->get_event_members($_POST['id'], 'invited', $_POST['offset']);


	/* get event invites */
	} elseif ($_POST['get'] == "event_invites") {
		/* check id */
		if(!isset($_POST['id']) || !is_numeric($_POST['id'])) {
			_error(400);
		}
		$data = $user->get_event_invites($_POST['id'], $_POST['offset']);
		

	/* get viewer pages */
	} elseif ($_POST['get'] == "pages") {
		$data = $user->get_pages( array('offset' => $_POST['offset']) );


	/* get suggested pages */
	} elseif ($_POST['get'] == "suggested_pages") {
		$data = $user->get_pages(array('suggested' => true, 'offset' => $_POST['offset']));


	/* get liked pages & profile pages */
	} elseif ($_POST['get'] == "liked_pages" || $_POST['get'] == "profile_pages") {
		/* check uid */
		if(!isset($_POST['uid']) || !is_numeric($_POST['uid'])) {
			_error(400);
		}
		$data = $user->get_pages( array('user_id' => $_POST['uid'], 'offset' => $_POST['offset']) );


	/* get boosted pages */
	} elseif ($_POST['get'] == "boosted_pages") {
		$data = $user->get_pages(array('boosted' => true, 'offset' => $_POST['offset']));


	/* get viewer groups */
	} elseif ($_POST['get'] == "groups") {
		$data = $user->get_groups( array('offset' => $_POST['offset']) );


	/* get suggested groups */
	} elseif ($_POST['get'] == "suggested_groups") {
		$data = $user->get_groups(array('suggested' => true, 'offset' => $_POST['offset']));


	/* get joined groups & profile groups */
	} elseif ($_POST['get'] == "joined_groups" || $_POST['get'] == "profile_groups") {
		/* check uid */
		if(!isset($_POST['uid']) || !is_numeric($_POST['uid'])) {
			_error(400);
		}
		$data = $user->get_groups( array('user_id' => $_POST['uid'], 'offset' => $_POST['offset']) );


	/* get viewer events */
	} elseif ($_POST['get'] == "events") {
		$data = $user->get_events( array('offset' => $_POST['offset']) );
	

	/* get suggested events */
	} elseif ($_POST['get'] == "suggested_events") {
		$data = $user->get_events(array('suggested' => true, 'offset' => $_POST['offset']));


	/* get going events */
	} elseif ($_POST['get'] == "going_events") {
		$data = $user->get_events(array('filter' => 'going', 'offset' => $_POST['offset']));

	/* get interested events */
	} elseif ($_POST['get'] == "interested_events") {
		$data = $user->get_events(array('filter' => 'interested', 'offset' => $_POST['offset']));

	/* get invited events */
	} elseif ($_POST['get'] == "invited_events") {
		$data = $user->get_events(array('filter' => 'invited', 'offset' => $_POST['offset']));


	/* get profile events */
	} elseif ($_POST['get'] == "profile_events") {
		/* check uid */
		if(!isset($_POST['uid']) || !is_numeric($_POST['uid'])) {
			_error(400);
		}
		$data = $user->get_events( array('user_id' => $_POST['uid'], 'offset' => $_POST['offset']) );


	/* get notifications */
	} elseif ($_POST['get'] == "notifications") {
		$data = $user->get_notifications($_POST['offset']);
	

	/* get conversations */
	} elseif ($_POST['get'] == "conversations") {
		$data = $user->get_conversations($_POST['offset']);
	

	/* get conversation messages */
	} elseif ($_POST['get'] == "messages") {
		/* check id */
		if(!isset($_POST['id']) || !is_numeric($_POST['id'])) {
			_error(400);
		}
		$append = false;
		$data = $user->get_conversation_messages($_POST['id'], $_POST['offset']);

	
	/* get games */
	} elseif ($_POST['get'] == "games") {
		$data = $user->get_games($_POST['offset']);


	/* get played games */
	} elseif ($_POST['get'] == "played_games") {
		$data = $user->get_games($_POST['offset'], true);


	/* bad request */
	} else {
		_error(400);
	}

	// handle data
	if($data) {
		/* assign variables */
		$smarty->assign('offset', $_POST['offset']);
		$smarty->assign('get', $_POST['get']);
		$smarty->assign('data', $data);
		/* return */
		$return['append'] = $append;
		$return['data'] = $smarty->fetch("ajax.load_more.tpl");
	}

	// return & exit
	return_json($return);

} catch (Exception $e) {
	modal("ERROR", __("Error"), $e->getMessage());
}

?>