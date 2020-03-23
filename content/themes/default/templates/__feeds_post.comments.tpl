<div class="post-comments">
    {if $user->_logged_in}
        {if $_is_photo}

            <!-- sort comments -->
            {if $photo['comments'] > 0}
                <div class="comments-filter">
                    <div class="btn-group btn-group-sm js_comments-filter" data-value="photo_comments">
                        <button type="button" class="btn dropdown-toggle ptb0 plr0" data-toggle="dropdown" data-display="static">
                            <span class="btn-group-text">{__("Most Recent")}</span>
                        </button>
                        <div class="dropdown-menu dropdown-menu-left">
                            <div class="dropdown-item pointer" data-value="photo_comments" data-id="{$photo['photo_id']}">{__("Most Recent")}</div>
                            <div class="dropdown-item pointer" data-value="photo_comments_top" data-id="{$photo['photo_id']}">{__("Top Comments")}</div>
                        </div>
                    </div>
                </div>
            {/if}
            <!-- sort comments -->

            <!-- post comment -->
            {include file='__feeds_comment.form.tpl' _handle='photo' _id=$photo['photo_id']}
            <!-- post comment -->

            <!-- comments loader -->
            <div class="text-center x-hidden js_comments-filter-loader">
                <div class="loader loader_large"></div>
            </div>
            <!-- comments loader -->

            <!-- comments -->
            <ul class="js_comments {if $photo['comments'] > 0}pt10{/if}">
                {if $photo['comments'] > 0}
                    {foreach $photo['photo_comments'] as $comment}
                    {include file='__feeds_comment.tpl' _comment=$comment}
                    {/foreach}
                {/if}
            </ul>
            <!-- comments -->

            <!-- previous comments -->
            {if $photo['comments'] >= $system['min_results']}
                <div class="pb10 text-center js_see-more" data-get="photo_comments" data-id="{$photo['photo_id']}" data-remove="true" data-target-stream=".js_comments">
                    <span class="text-link">
                        <i class="fa fa-comment"></i>
                        {__("View previous comments")}
                    </span>
                    <div class="loader loader_small x-hidden"></div>
                </div>
            {/if}
            <!-- previous comments -->

        {else}

            <!-- sort comments -->
            {if $post['comments'] > 0}
                <div class="comments-filter">
                    <div class="btn-group btn-group-sm js_comments-filter" data-value="post_comments">
                        <button type="button" class="btn dropdown-toggle ptb0 plr0" data-toggle="dropdown" data-display="static">
                            <span class="btn-group-text">{__("Most Recent")}</span>
                        </button>
                        <div class="dropdown-menu dropdown-menu-left">
                            <div class="dropdown-item pointer" data-value="post_comments" data-id="{$post['post_id']}">{__("Most Recent")}</div>
                            <div class="dropdown-item pointer" data-value="post_comments_top" data-id="{$post['post_id']}">{__("Top Comments")}</div>
                        </div>
                    </div>
                </div>
            {/if}
            <!-- sort comments -->

            <!-- post comment -->
            {include file='__feeds_comment.form.tpl' _handle='post' _id=$post['post_id']}
            <!-- post comment -->

            <!-- comments loader -->
            <div class="text-center x-hidden js_comments-filter-loader">
                <div class="loader loader_large"></div>
            </div>
            <!-- comments loader -->
            
            <!-- comments -->
            <ul class="js_comments {if $post['comments'] > 0}pt10{/if}">
                {if $post['comments'] > 0}
                    {foreach $post['post_comments'] as $comment}
                    {include file='__feeds_comment.tpl' _comment=$comment}
                    {/foreach}
                {/if}
            </ul>
            <!-- comments -->

            <!-- previous comments -->
            {if $post['comments'] >= $system['min_results']}
                <div class="ptb10 text-center js_see-more" data-get="post_comments" data-id="{$post['post_id']}" data-remove="true" data-target-stream=".js_comments">
                    <span class="text-link">
                        <i class="fa fa-comment"></i>
                        {__("View previous comments")}
                    </span>
                    <div class="loader loader_small x-hidden"></div>
                </div>
            {/if}
            <!-- previous comments -->

        {/if}
    {else}
        <div class="pb10">
            <a href="{$system['system_url']}/signin">{__("Please log in to like, share and comment!")}</a>
        </div>
    {/if}
</div>