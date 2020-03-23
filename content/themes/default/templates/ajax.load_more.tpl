{if $get == 'newsfeed' || $get == 'posts_profile' || $get == 'posts_page' || $get == 'posts_group' || $get == 'posts_group_pending' || $get == 'posts_group_pending_all' || $get == 'posts_event' || $get == 'posts_event_pending' || $get == 'posts_event_pending_all' || $get == 'saved' || $get == 'memories' || $get == 'boosted' || $get == 'popular' || $get == 'discover' }
	{include file='_ads_campaigns.tpl'}
	{include file='_ads.tpl'}

	{foreach $data as $post}
		{include file='__feeds_post.tpl' _get=$get}
	{/foreach}


{elseif $get == 'articles'}
	{foreach $data as $article}
		{include file='__feeds_article.tpl' _tpl="featured"}
	{/foreach}


{elseif $get == 'category_articles'}
	{foreach $data as $article}
		{include file='__feeds_article.tpl'}
	{/foreach}


{elseif $get == 'shares'}
	{foreach $data as $post}
		{include file='__feeds_post.tpl' _snippet=true}
	{/foreach}


{elseif $get == 'post_comments' || $get == 'post_comments_top' || $get == 'photo_comments' || $get == 'photo_comments_top'}
	{foreach $data as $comment}
		{include file='__feeds_comment.tpl' _comment=$comment}
	{/foreach}

{elseif $get == 'comment_replies'}
	{foreach $data as $comment}
		{include file='__feeds_comment.tpl' _comment=$comment _is_reply=true}
	{/foreach}


{elseif $get == 'photos'}
	{foreach $data as $photo}
		{include file='__feeds_photo.tpl' _context=$context}
	{/foreach}


{elseif $get == 'albums'}
	{foreach $data as $album}
		{include file='__feeds_album.tpl'}
	{/foreach}


{elseif $get == 'videos'}
	{foreach $data as $video}
		{include file='__feeds_video.tpl'}
	{/foreach}


{elseif $get == 'post_reactions' || $get == 'photo_reactions' || $get == 'comment_reactions' || $get == 'voters' || $get == 'blocks' || $get == 'affiliates' || $get == 'group_requests'}
	{foreach $data as $_user}
		{include file='__feeds_user.tpl' _tpl="list" _connection=$_user["connection"] _reaction=$_user["reaction"]}
	{/foreach}


{elseif $get == 'friend_requests'}
	{foreach $data as $_user}
		{include file='__feeds_user.tpl' _tpl="list" _connection="request"}
	{/foreach}


{elseif $get == 'friend_requests_sent'}
	{foreach $data as $_user}
		{include file='__feeds_user.tpl' _tpl="list" _connection="cancel"}
	{/foreach}


{elseif $get == 'mutual_friends'}
	{foreach $data as $_user}
		{include file='__feeds_user.tpl' _tpl="list" _connection="remove"}
	{/foreach}


{elseif $get == 'new_people'}
	{foreach $data as $_user}
		{include file='__feeds_user.tpl' _tpl="list" _connection="add"}
	{/foreach}


{elseif $get == 'friends' || $get == 'followers' || $get == 'followings' || $get == 'page_invites' || $get == 'group_members' || $get == 'group_invites'  || $get == 'event_going'  || $get == 'event_interested'  || $get == 'event_invited'  || $get == 'event_invites'}
	{foreach $data as $_user}
		{include file='__feeds_user.tpl' _tpl="box" _connection=$_user["connection"]}
	{/foreach}

{elseif $get == 'page_members' || $get == 'page_admins' || $get == 'group_members_manage' || $get == 'group_admins'}
	{foreach $data as $_user}
		{include file='__feeds_user.tpl' _tpl="list" _connection=$_user["connection"]}
	{/foreach}


{elseif $get == 'pages' || $get == 'suggested_pages' || $get == 'liked_pages' || $get == 'profile_pages'}
	{foreach $data as $_page}
		{include file='__feeds_page.tpl' _tpl='box'}
	{/foreach}


{elseif $get == 'boosted_pages'}
	{foreach $data as $_page}
		{include file='__feeds_page.tpl' _tpl='list'}
	{/foreach}


{elseif $get == 'groups' || $get == 'suggested_groups' || $get == 'joined_groups' || $get == 'profile_groups'}
	{foreach $data as $_group}
		{include file='__feeds_group.tpl' _tpl='box'}
	{/foreach}


{elseif $get == 'events' || $get == 'suggested_events' || $get == 'going_events' || $get == 'interested_events' || $get == 'invited_events' || $get == 'profile_events'}
	{foreach $data as $_event}
		{include file='__feeds_event.tpl' _tpl='box'}
	{/foreach}


{elseif $get == 'games' || $get == 'played_games'}
	{foreach $data as $_game}
		{include file='__feeds_game.tpl' _tpl='box'}
	{/foreach}


{elseif $get == 'notifications'}
	{foreach $data as $notification}
		{include file='__feeds_notification.tpl'}
	{/foreach}


{elseif $get == 'conversations'}
	{foreach $data as $conversation}
		{include file='__feeds_conversation.tpl'}
	{/foreach}


{elseif $get == 'messages'}
	{foreach $data as $message}
		{include file='__feeds_message.tpl'}
	{/foreach}


{/if}