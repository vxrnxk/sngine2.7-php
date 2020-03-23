{if $type == "user"}
    <!-- user popover -->
    <div class="user-popover-content">
        <div class="user-card">
            <div class="user-card-cover" {if $profile['user_cover']}style="background-image:url('{$system['system_uploads']}/{$profile['user_cover']}');"{/if}>
            </div>
            <div class="user-card-avatar">
                <img src="{$profile['user_picture']}" alt="{$profile['user_firstname']} {$profile['user_lastname']}">
            </div>
            <div class="user-card-info">
                <a class="name" href="{$system['system_url']}/{$profile['user_name']}">{$profile['user_firstname']} {$profile['user_lastname']}</a>
                {if $profile['user_verified']}
                    <i data-toggle="tooltip" data-placement="top" title='{__("Verified User")}' class="fa fa-check-circle fa-fw verified-badge"></i>
                {/if}
                <div class="info">
                    <a href="{$system['system_url']}/{$profile['user_name']}/followers">{$profile['followers_count']} {__("followers")}</a>
                </div>
            </div>
        </div>
        <div class="user-card-meta">
            <!-- mutual friends -->
            {if $profile['mutual_friends_count'] && $profile['mutual_friends_count'] > 0}
                <div class="mb10">
                    <i class="fa fa-users fa-fw mr5"></i>
                    <span class="text-underline" data-toggle="modal" data-url="users/mutual_friends.php?uid={$profile['user_id']}">{$profile['mutual_friends_count']} {__("mutual friends")}</span>
                </div>
            {/if}
            <!-- mutual friends -->
            <!-- work -->
            {if !is_empty($profile['user_work_title'])}
                {if $profile['user_id'] == $user->_data['user_id'] || $profile['user_privacy_work'] == "public" || $profile['we_friends']}
                    <div class="mb10">
                        <i class="fa fa-briefcase fa-fw mr5"></i>
                        {$profile['user_work_title']} {__("at")} <span class="text-primary">{$profile['user_work_place']}</span>
                    </div>
                {/if}
            {/if}
            <!-- work -->
            <!-- hometown -->
            {if !is_empty($profile['user_hometown'])}
                {if $profile['user_id'] == $user->_data['user_id'] || $profile['user_privacy_location'] == "public" || $profile['we_friends']}
                    <div class="mb10">
                        <i class="fa fa-map-marker fa-fw mr5"></i>
                        {__("From")} <span class="text-primary">{$profile['user_hometown']}</span>
                    </div>
                {/if}
            {/if}
            <!-- hometown -->
        </div>
        <div class="footer">
            {if $user->_data['user_id'] != $profile['user_id']}
                <!-- add friend -->
                {if $profile['we_friends']}
                    <button type="button" class="btn btn-sm btn-success btn-delete js_friend-remove" data-uid="{$profile['user_id']}">
                        <i class="fa fa-check mr5"></i>{__("Friends")}
                    </button>
                {elseif $profile['he_request']}
                    <button type="button" class="btn btn-sm btn-primary js_friend-accept" data-uid="{$profile['user_id']}">{__("Confirm")}</button>
                    <button type="button" class="btn btn-sm btn-danger js_friend-decline" data-uid="{$profile['user_id']}">{__("Decline")}</button>
                {elseif $profile['i_request']}
                    <button type="button" class="btn btn-sm btn-warning js_friend-cancel" data-uid="{$profile['user_id']}">
                        <i class="fa fa-user-plus mr5"></i>{__("Friend Request Sent")}
                    </button>
                {else}
                    <button type="button" class="btn btn-sm btn-success js_friend-add" data-uid="{$profile['user_id']}">
                        <i class="fa fa-user-plus mr5"></i>{__("Add Friend")}
                    </button>
                {/if}
                <!-- add friend -->

                <!-- follow -->
                {if $profile['i_follow']}
                    <button type="button" class="btn btn-sm btn-info js_unfollow" data-uid="{$profile['user_id']}">
                        <i class="fa fa-check mr5"></i>{__("Following")}
                    </button>
                {else}
                    <button type="button" class="btn btn-sm btn-info js_follow" data-uid="{$profile['user_id']}">
                        <i class="fa fa-rss mr5"></i>{__("Follow")}
                    </button>
                {/if}
                <!-- follow -->

                <!-- message -->
                <button type="button" class="btn btn-sm btn-primary mlr5 js_chat-start" data-uid="{$profile['user_id']}" data-name="{$profile['user_firstname']} {$profile['user_lastname']}" data-link="{$profile['user_name']}">
                    <i class="fa fa-comments mr5"></i>{__("Message")}
                </button>
                <!-- message -->
            {else}
                <!-- edit -->
                <a href="{$system['system_url']}/settings/profile" class="btn btn-sm btn-light">
                    <i class="fa fa-pencil-alt mr5"></i>{__("Update Info")}
                </a>
                <!-- edit -->
            {/if}
        </div>
    </div>
    <!-- user popover -->
{else}
    <!-- page popover -->
    <div class="user-popover-content">
        <div class="user-card">
            <div class="user-card-cover" {if $profile['page_cover']}style="background-image:url('{$system['system_uploads']}/{$profile['page_cover']}');"{/if}></div>
            <div class="user-card-avatar">
                <img class="img-fluid" src="{$profile['page_picture']}" alt="{$profile['page_title']}">
            </div>
            <div class="user-card-info">
                <a class="name" href="{$system['system_url']}/pages/{$profile['page_name']}">{$profile['page_title']}</a>
                {if $profile['page_verified']}
                    <i data-toggle="tooltip" data-placement="top" title='{__("Verified User")}' class="fa fa-check-circle fa-fw verified-badge"></i>
                {/if}
                <div class="info">{$profile['page_likes']} {__("Likes")}</div>
            </div>
        </div>
        <div class="footer">
            <!-- like -->
            {if $profile['i_like']}
                <button type="button" class="btn btn-sm btn-primary js_unlike-page" data-id="{$profile['page_id']}">
                    <i class="fa fa-thumbs-up fa-fw mr5"></i>{__("Unlike")}
                </button>
            {else}
                <button type="button" class="btn btn-primary js_like-page" data-id="{$profile['page_id']}">
                    <i class="fa fa-thumbs-up mr5"></i>{__("Like")}
                </button>
            {/if}
            <!-- like -->
        </div>
    </div>
    <!-- page popover -->
{/if}