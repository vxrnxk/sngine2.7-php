<div class="comment js_comment-form {if $post['comments_disabled']}x-hidden{/if}" data-handle="{$_handle}" data-id="{$_id}">
    <div class="comment-avatar">
        <a class="comment-avatar-picture" href="{$system['system_url']}/{$user->_data['user_name']}" style="background-image:url({$user->_data['user_picture']});">
            </a>
    </div>
    <div class="comment-data">
        <div class="x-form comment-form">
            <textarea dir="auto" class="js_autosize js_mention js_post-comment" rows="1" placeholder='{__("Write a comment")}'></textarea>
            <ul class="x-form-tools clearfix">
                <li class="x-form-tools-post js_post-comment">
                    <i class="far fa-paper-plane fa-lg fa-fw"></i>
                </li>
                {if $system['photos_enabled']}
                    <li class="x-form-tools-attach">
                        <i class="far fa-image fa-lg fa-fw js_x-uploader" data-handle="comment"></i>
                    </li>
                {/if}
                <li class="x-form-tools-emoji js_emoji-menu-toggle">
                    <i class="far fa-smile-wink fa-lg fa-fw"></i>
                </li>
            </ul>
        </div>
        <div class="comment-attachments attachments clearfix x-hidden">
            <ul>
                <li class="loading">
                    <div class="progress x-progress"><div class="progress-bar" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div></div>
                </li>
            </ul>
        </div>
    </div>
</div>
<div class="pb10 text-center js_comment-disabled-msg {if !$post['comments_disabled']}x-hidden{/if}">
    {__("Commenting has been turned off for this post")}.
</div>