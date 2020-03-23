{if !$standalone}<li>{/if}
    <!-- post -->
    <div class="post 
                {if $_get == "posts_profile" && $user->_data['user_id'] == $post['author_id'] && $post['is_hidden']}is_hidden{/if} 
                {if $boosted}boosted{/if} 
                {if ($post['in_group'] && !$post['group_approved']) OR ($post['in_event'] && !$post['event_approved'])}pending{/if}
            " 
            data-id="{$post['post_id']}">

        {if ($post['in_group'] && !$post['group_approved']) OR ($post['in_event'] && !$post['event_approved'])}
            <div class="pending-icon" data-toggle="tooltip" title="{__("Pending Post")}">
                <i class="fa fa-clock"></i>
            </div>
        {/if}

        {if $standalone && $pinned}
            <div class="pin-icon" data-toggle="tooltip" title="{__("Pinned Post")}">
                <i class="fa fa-bookmark"></i>
            </div>
        {/if}

        {if $standalone && $boosted}
            <div class="boosted-icon" data-toggle="tooltip" title="{__("Promoted")}">
                <i class="fa fa-bullhorn"></i>
            </div>
        {/if}

        <!-- memory post -->
        {if $_get == "memories"}
            <div class="post-memory-header">
                <span class="js_moment" data-time="{$post['time']}">{$post['time']}</span>
            </div>
        {/if}
        <!-- memory post -->

        <!-- post body -->
        <div class="post-body">

            {include file='__feeds_post.body.tpl' _post=$post _shared=false}

            <!-- post stats -->
            <div class="post-stats clearfix">
                <!-- reactions stats -->
                {if $post['reactions_total_count'] > 0}
                    <div class="float-left mr10" data-toggle="modal" data-url="posts/who_reacts.php?post_id={$post['post_id']}">
                        <div class="reactions-stats">
                            {foreach $post['reactions'] as $reaction_type => $reaction_count}
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
                                {$post['reactions_total_count']}
                            </span>
                            <!-- reactions count -->
                        </div>
                    </div>
                {/if}
                <!-- reactions stats -->

                <!-- video views -->
                {if $post['post_type'] == "video"}
                    <span>
                        <i class="fa fa-eye"></i> {$post['video']['views']}
                    </span>
                {/if}
                <!-- video views -->

                <!-- audio views -->
                {if $post['post_type'] == "audio"}
                    <span>
                        <i class="fa fa-eye"></i> {$post['audio']['views']}
                    </span>
                {/if}
                <!-- audio views -->

                <!-- comments & shares -->
                <span class="float-right">
                    <!-- comments -->
                    <span class="pointer js_comments-toggle">
                        <i class="fa fa-comments"></i> {$post['comments']} {__("Comments")}
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
            {if $user->_logged_in && $_get != "posts_information"}
                <div class="post-actions clearfix">
                    <!-- reactions -->
                    <div class="action-btn unselectable reactions-wrapper {if $post['i_react']}js_unreact-post{/if}" data-reaction="{$post['i_reaction']}">
                        <!-- reaction-btn -->
                        <div class="reaction-btn">
                            {if !$post['i_react']}
                                <div class="reaction-btn-icon">
                                    <i class="fa fa-thumbs-up fa-fw"></i>
                                </div>
                                <span class="reaction-btn-name">{__("Like")}</span>
                            {else}
                                <div class="reaction-btn-icon">
                                    <div class="inline-emoji no_animation">
                                        {include file='__reaction_emojis.tpl' _reaction=$post['i_reaction']}
                                    </div>
                                </div>
                                <span class="reaction-btn-name {$post['i_reaction_details']['color']}">{$post['i_reaction_details']['title']}</span>
                            {/if}
                        </div>
                        <!-- reaction-btn -->

                        <!-- reactions-container -->
                        <div class="reactions-container">
                            {foreach $reactions as $reaction}
                                <div class="reactions_item duration-{$reaction@iteration} js_react-post" data-reaction="{$reaction['reaction']}" data-reaction-color="{$reaction['color']}" data-title="{$reaction['title']}">
                                    {include file='__reaction_emojis.tpl' _reaction=$reaction['reaction']}
                                </div>
                            {/foreach}
                        </div>
                        <!-- reactions-container -->
                    </div>
                    <!-- reactions -->

                    <!-- comment -->
                    <div class="action-btn js_comment {if $post['comments_disabled']}x-hidden{/if}">
                        <i class="fa fa-comment fa-fw mr5"></i><span>{__("Comment")}</span>
                    </div>
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
        <!-- post body -->

        <!-- post footer -->
        <div class="post-footer {if !$standalone}x-hidden{/if}">
            <!-- comments -->
            {include file='__feeds_post.comments.tpl'}
            <!-- comments -->
        </div>
        <!-- post footer -->

        <!-- post approval -->
        {if ($post['in_group'] && $post['is_group_admin'] &&!$post['group_approved']) OR ($post['in_event'] && $post['is_event_admin'] &&!$post['event_approved']) }
            <div class="post-approval">
                <button class="btn btn-success btn-sm mr5 js_approve-post"><i class="fa fa-check mr5"></i>{__("Approve")}</button>
                <button class="btn btn-danger btn-sm js_delete-post"><i class="fa fa-times mr5"></i>{__("Decline")}</button>
            </div>
        {/if}
        <!-- post approval -->

    </div>
    <!-- post -->
{if !$standalone}</li>{/if}