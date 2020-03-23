<!-- post body -->
<div class="post-body {if $_lightbox}pt0{/if}">

    <!-- post header -->
    <div class="post-header">
        <!-- post picture -->
        <div class="post-avatar">
            <a class="post-avatar-picture" href="{$post['post_author_url']}" style="background-image:url({$post['post_author_picture']});">
            </a>
        </div>
        <!-- post picture -->

        <!-- post meta -->
        <div class="post-meta">
            <!-- post author -->
            <span class="js_user-popover" data-type="{$post['user_type']}" data-uid="{$post['user_id']}">
                <a href="{$post['post_author_url']}">{$post['post_author_name']}</a>
            </span>
            {if $post['post_author_verified']}
                {if $post['user_type'] == "user"}
                    <i data-toggle="tooltip" data-placement="top" title='{__("Verified User")}' class="fa fa-check-circle fa-fw verified-badge"></i>
                {else}
                    <i data-toggle="tooltip" data-placement="top" title='{__("Verified Page")}' class="fa fa-check-circle fa-fw verified-badge"></i>
                {/if}
            {/if}
            {if $post['user_subscribed']}
                <i data-toggle="tooltip" data-placement="top" title='{__("Pro User")}' class="fa fa-bolt fa-fw pro-badge"></i>
            {/if}
            <!-- post author -->

            <!-- post time & location & privacy -->
            <div class="post-time">
                <a href="{$system['system_url']}/posts/{$post['post_id']}" class="js_moment" data-time="{$post['time']}">{$post['time']}</a>

                {if $post['location']}
                ·
                <i class="fa fa-map-marker"></i> <span>{$post['location']}</span>
                {/if}

                - 
                {if $post['privacy'] == "me"}
                    <i class="fa fa-lock" data-toggle="tooltip" data-placement="top" title='{__("Shared with")} {__("Only Me")}'></i>
                {elseif $post['privacy'] == "friends"}
                    <i class="fa fa-users" data-toggle="tooltip" data-placement="top" title='{__("Shared with")} {__("Friends")}'></i>
                {elseif $post['privacy'] == "public"}
                    <i class="fa fa-globe" data-toggle="tooltip" data-placement="top" title='{__("Shared with")} {__("Public")}'></i>
                {elseif $post['privacy'] == "custom"}
                    <i class="fa fa-cog" data-toggle="tooltip" data-placement="top" title='{__("Shared with")} {__("Custom People")}'></i>
                {/if}
            </div>
            <!-- post time & location & privacy -->
        </div>
        <!-- post meta -->
    </div>
    <!-- post header -->

    <!-- photo -->
    {if !$_lightbox}
        <div class="mt10 clearfix">
            <div class="pg_wrapper">
                <div class="pg_1x {if $photo['blur']}x-blured{/if}">
                    <a href="{$system['system_url']}/photos/{$photo['photo_id']}" class="js_lightbox" data-id="{$photo['photo_id']}" data-image="{$system['system_uploads']}/{$photo['source']}" data-context="{if $photo['is_single']}album{else}post{/if}">
                        <img src="{$system['system_uploads']}/{$photo['source']}">
                    </a>
                </div>
            </div>
        </div>
    {/if}
    <!-- photo -->

    <!-- post stats -->
    <div class="post-stats clearfix">
        <!-- reactions stats -->
        {if $photo['reactions_total_count'] > 0}
            <div class="float-left" data-toggle="modal" data-url="posts/who_reacts.php?{if $photo['is_single']}post_id={$post['post_id']}{else}photo_id={$photo['photo_id']}{/if}">
                <div class="reactions-stats">
                    {foreach $photo['reactions'] as $reaction_type => $reaction_count}
                        {if $reaction_count > 0}
                            <div class="reactions-stats-item">
                                <div class="inline-emoji no_animation">
                                    {include file='__reaction_emojis.tpl' _reaction=$reaction_type}
                                </div>
                            </div>
                        {/if}
                    {/foreach}
                    <!-- reactions count -->
                    <span>
                        {$photo['reactions_total_count']}
                    </span>
                    <!-- reactions count -->
                </div>
            </div>
        {/if}
        <!-- reactions stats -->

        <!-- comments & shares -->
        <span class="float-right">
            <!-- comments -->
            <span class="pointer js_comments-toggle">
                <i class="fa fa-comments"></i> {$photo['comments']} {__("Comments")}
            </span>
            <!-- comments -->

            <!-- shares -->
            <span class="pointer ml10 {if $post['shares'] == 0}x-hidden{/if}" data-toggle="modal" data-url="posts/who_shares.php?post_id={$post['post_id']}">
                <i class="fa fa-share"></i> {$post['shares']} {__("Shares")}
            </span>
            <!-- shares -->
        </span>
        <!-- comments & shares -->
    </div>
    <!-- post stats -->

    <!-- post actions -->
    {if $user->_logged_in}
        <div class="post-actions clearfix">
            <!-- reactions -->
            <div class="action-btn unselectable reactions-wrapper {if $photo['i_react']}js_unreact-{if $photo['is_single']}post{else}photo{/if}{/if}" data-reaction="{$photo['i_reaction']}">
                <!-- reaction-btn -->
                <div class="reaction-btn">
                    {if !$photo['i_react']}
                        <div class="reaction-btn-icon">
                            <i class="fa fa-thumbs-up fa-fw"></i>
                        </div>
                        <span class="reaction-btn-name">{__("Like")}</span>
                    {else}
                        <div class="reaction-btn-icon">
                            <div class="inline-emoji no_animation">
                                {include file='__reaction_emojis.tpl' _reaction=$photo['i_reaction']}
                            </div>
                        </div>
                        <span class="reaction-btn-name {$photo['i_reaction_details']['color']}">{$photo['i_reaction_details']['title']}</span>
                    {/if}
                </div>
                <!-- reaction-btn -->

                <!-- reactions-container -->
                <div class="reactions-container">
                    {foreach $reactions as $reaction}
                        <div class="reactions_item duration-{$reaction@iteration} js_react-{if $photo['is_single']}post{else}photo{/if}" data-reaction="{$reaction['reaction']}" data-reaction-color="{$reaction['color']}" data-title="{$reaction['title']}">
                            {include file='__reaction_emojis.tpl' _reaction=$reaction['reaction']}
                        </div>
                    {/foreach}
                </div>
                <!-- reactions-container -->
            </div>
            <!-- reactions -->

            <!-- comment -->
            <span class="action-btn js_comment {if $post['comments_disabled']}x-hidden{/if}">
                <i class="fa fa-comment"></i> <span>{__("Comment")}</span>
            </span>
            <!-- comment -->

            <!-- share -->
            {if $post['privacy'] == "public"}
                <div class="action-btn" data-toggle="modal" data-url="posts/share.php?do=create&post_id={$post['post_id']}">
                    <i class="fa fa-share fa-fw mr5"></i><span>{__("Share")}</span>
                </div>
            {/if}
            <!-- share -->
        </div>
    {/if}
    <!-- post actions -->
</div>

<!-- post footer -->
<div class="post-footer">
    <!-- comments -->
    {include file='__feeds_post.comments.tpl' _is_photo=(!$photo['is_single'])?true:false}
    <!-- comments -->
</div>
<!-- post footer -->