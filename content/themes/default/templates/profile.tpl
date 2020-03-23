{include file='_head.tpl'}
{include file='_header.tpl'}

<!-- page content -->
<div class="container {if $user->_logged_in}offcanvas{/if}">
    <div class="row">

        <!-- side panel -->
        {if $user->_logged_in}
            <div class="col-12 d-block d-md-none offcanvas-sidebar mt20">
                {include file='_sidebar.tpl'}
            </div>
        {/if}
        <!-- side panel -->

        <!-- content panel -->
        <div class="col-12 {if $user->_logged_in}offcanvas-mainbar{/if}">
            <!-- profile-header -->
            <div class="profile-header">
                <!-- profile-cover -->
                <div class="profile-cover-wrapper">
                    {if $profile['user_cover_id']}
                        <!-- full-cover -->
                        <img class="js_position-cover-full x-hidden" src="{$profile['user_cover_full']}">
                        <!-- full-cover -->
                        
                        <!-- cropped-cover -->
                        <img class="js_position-cover-cropped {if $user->_logged_in && $profile['user_cover_lightbox']}js_lightbox{/if}" data-init-position="{$profile['user_cover_position']}" data-id="{$profile['user_cover_id']}" data-image="{$profile['user_cover_full']}" data-context="album" src="{$profile['user_cover']}" alt="{$profile['user_firstname']} {$profile['user_lastname']}">
                        <!-- cropped-cover -->
                    {/if}
                    
                    {if $profile['user_id'] == $user->_data['user_id']}
                        <!-- buttons -->
                        <div class="profile-cover-buttons">
                            <div class="profile-cover-change">
                                <i class="fa fa-camera js_x-uploader" data-handle="cover-user"></i>
                            </div>
                            <div class="profile-cover-position {if !$profile['user_cover']}x-hidden{/if}">
                                <input class="js_position-picture-val" type="hidden" name="position-picture-val">
                                <i class="fa fa-crop-alt js_init-position-picture" data-handle="user" data-id="{$profile['user_id']}"></i>
                            </div>
                            <div class="profile-cover-position-buttons">
                                <i class="fa fa-check fa-fw js_save-position-picture"></i>
                            </div>
                            <div class="profile-cover-position-buttons">
                                <i class="fa fa-times fa-fw js_cancel-position-picture"></i>
                            </div>
                            <div class="profile-cover-delete {if !$profile['user_cover']}x-hidden{/if}">
                                <i class="fa fa-trash js_delete-cover" data-handle="cover-user"></i>
                            </div>
                        </div>
                        <!-- buttons -->
                        
                        <!-- loaders -->
                        <div class="profile-cover-change-loader">
                            <div class="progress x-progress">
                                <div class="progress-bar" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
                            </div>
                        </div>
                        <div class="profile-cover-position-loader">
                            <i class="fa fa-arrows-alt mr5"></i>{__("Drag to reposition cover")}
                        </div>
                        <!-- loaders -->
                    {/if}
                </div>
                <!-- profile-cover -->

                <!-- profile-avatar -->
                <div class="profile-avatar-wrapper">
                    <img {if $profile['user_picture_id']} {if $user->_logged_in && $profile['user_picture_lightbox']}class="js_lightbox"{/if} data-id="{$profile['user_picture_id']}" data-context="album" data-image="{$profile['user_picture_full']}" {elseif !$profile['user_picture_default']} class="js_lightbox-nodata" data-image="{$profile['user_picture']}" {/if}  src="{$profile['user_picture']}" alt="{$profile['user_firstname']} {$profile['user_lastname']}">
                    
                    {if $profile['user_id'] == $user->_data['user_id']}
                        <!-- buttons -->
                        <div class="profile-avatar-change">
                            <i class="fa fa-camera js_x-uploader" data-handle="picture-user"></i>
                        </div>
                        <div class="profile-avatar-crop {if $profile['user_picture_default'] || !$profile['user_picture_id']}x-hidden{/if}">
                            <i class="fa fa-crop-alt js_init-crop-picture" data-image="{$profile['user_picture_full']}" data-handle="user" data-id="{$profile['user_id']}"></i>
                        </div>
                        <div class="profile-avatar-delete {if $profile['user_picture_default']}x-hidden{/if}">
                            <i class="fa fa-trash js_delete-picture" data-handle="picture-user"></i>
                        </div>
                        <!-- buttons -->
                        <!-- loaders -->
                        <div class="profile-avatar-change-loader">
                            <div class="progress x-progress">
                                <div class="progress-bar" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
                            </div>
                        </div>
                        <!-- loaders -->
                    {/if}
                </div>
                <!-- profile-avatar -->

                <!-- profile-name -->
                <div class="profile-name-wrapper">
                    <a href="{$system['system_url']}/{$profile['user_name']}">{$profile['user_firstname']} {$profile['user_lastname']}</a>
                    {if $profile['user_verified']}
                        <i data-toggle="tooltip" data-placement="top" title='{__("Verified User")}' class="fa fa-check-circle fa-fw verified-badge"></i>
                    {/if}
                    {if $profile['user_subscribed']}
                        <a href="{$system['system_url']}/packages" class="badge badge-warning" data-toggle="tooltip" data-placement="top" title="{$profile['package_name']} {__('Member')}">{__("PRO")}</a>
                    {/if}
                </div>
                <!-- profile-name -->

                <!-- profile-buttons -->
                <div class="profile-buttons-wrapper">
                    {if $user->_logged_in}
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
                                    <i class="fa fa-clock mr5"></i>{__("Friend Request Sent")}
                                </button>
                            {elseif !$profile['friendship_declined']}
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
                            <button type="button" class="btn btn-icon btn-rounded btn-primary mlr5 js_chat-start" data-uid="{$profile['user_id']}" data-name="{$profile['user_firstname']} {$profile['user_lastname']}" data-link="{$profile['user_name']}">
                                <i class="fa fa-comments fa-fw fa-lg"></i>
                            </button>
                            <!-- message -->

                            <!-- poke & report & block -->
                            <div class="d-inline-block dropdown">
                                <button type="button" class="btn btn-icon btn-rounded btn-light" data-toggle="dropdown" data-display="static">
                                    <i class="fa fa-ellipsis-v fa-fw"></i>
                                </button>
                                <div class="dropdown-menu dropdown-menu-right">
                                    <!-- poke -->
                                    {if $system['pokes_enabled'] && !$profile['i_poked']}
                                        {if $profile['user_privacy_poke'] == "public" || ($profile['user_privacy_poke'] == "friends" && $profile['we_friends'])}
                                            <div class="dropdown-item pointer js_poke" data-id="{$profile['user_id']}" data-name="{$profile['user_firstname']} {$profile['user_lastname']}">
                                                <i class="fa fa-hand-point-right fa-fw mr10"></i>{__("Poke")}
                                            </div>
                                        {/if}
                                    {/if}
                                    <!-- poke -->
                                    <!-- report -->
                                    <div class="dropdown-item pointer js_report" data-handle="user" data-id="{$profile['user_id']}">
                                        <i class="fa fa-flag fa-fw mr10"></i>{__("Report")}
                                    </div>
                                    <!-- report -->
                                    <!-- block -->
                                    <div class="dropdown-item pointer js_block-user" data-uid="{$profile['user_id']}">
                                        <i class="fa fa-minus-circle fa-fw mr10"></i>{__("Block")}
                                    </div>
                                    <!-- block -->
                                    <!-- manage -->
                                    {if $user->_is_admin}
                                        <div class="dropdown-divider"></div>
                                        <a class="dropdown-item" href="{$system['system_url']}/admincp/users/edit/{$profile['user_id']}">
                                            <i class="fa fa-cog fa-fw mr10"></i>{__("Edit in Admin Panel")}
                                        </a>
                                    {elseif $user->_is_moderator}
                                        <div class="dropdown-divider"></div>
                                        <a class="dropdown-item" href="{$system['system_url']}/modcp/users/edit/{$profile['user_id']}">
                                            <i class="fa fa-cog fa-fw mr10"></i>{__("Edit in Moderator Panel")}
                                        </a>
                                    {/if}
                                    <!-- manage -->
                                </div>
                            </div>
                            <!-- poke & report & block -->
                        {else}
                            <!-- edit -->
                            <a href="{$system['system_url']}/settings/profile" class="btn btn-icon btn-rounded btn-light">
                                <i class="fa fa-pencil-alt fa-fw"></i>
                            </a>
                            <!-- edit -->
                        {/if}
                    {/if}
                </div>
                <!-- profile-buttons -->

                <!-- profile-tabs -->
                <div class="profile-tabs-wrapper custom-scrollbar">
                    <ul>
                        <li>
                            <a href="{$system['system_url']}/{$profile['user_name']}" {if $view == ""}class="active"{/if}>
                                <i class="fa fa-newspaper fa-fw mr5"></i>{__("Timeline")}
                            </a>
                        </li>
                        <li>
                            <a href="{$system['system_url']}/{$profile['user_name']}/friends" {if $view == "friends" || $view == "followers" || $view == "followings"}class="active"{/if}>
                                <i class="fa fa-users fa-fw mr5"></i>{__("Friends")}
                            </a>
                        </li>
                        <li>
                            <a href="{$system['system_url']}/{$profile['user_name']}/photos" {if $view == "photos" || $view == "albums" || $view == "album"}class="active"{/if}>
                                <i class="fa fa-images fa-fw mr5"></i>{__("Photos")}
                            </a>
                        </li>
                        <li>
                            <a href="{$system['system_url']}/{$profile['user_name']}/videos" {if $view == "videos"}class="active"{/if}>
                                <i class="fa fa-video fa-fw mr5"></i>{__("Videos")}
                            </a>
                        </li>
                        <li>
                            <a href="{$system['system_url']}/{$profile['user_name']}/likes" {if $view == "likes"}class="active"{/if}>
                                <i class="fa fa-flag fa-fw mr5"></i>{__("Likes")} 
                            </a>
                        </li>
                        <li>
                            <a href="{$system['system_url']}/{$profile['user_name']}/groups" {if $view == "groups"}class="active"{/if}>
                                <i class="fa fa-users fa-fw mr5"></i>{__("Groups")}
                            </a>
                        </li>
                        <li>
                            <a href="{$system['system_url']}/{$profile['user_name']}/events" {if $view == "events"}class="active"{/if}>
                                <i class="fa fa-calendar fa-fw mr5"></i>{__("Events")}
                            </a>
                        </li>
                    </ul>
                </div>
                <!-- profile-tabs -->
            </div>
            <!-- profile-header -->

            <!-- profile-content -->
            <div class="row">
                <!-- panel [mutual-friends] -->
                {if $user->_logged_in && $user->_data['user_id'] != $profile['user_id'] && !$profile['we_friends'] && !$profile['friendship_declined']}
                    <div class="col-sm-12">
                        <div class="card panel-mutual-friends">
                            <div class="card-header text-uppercase">
                                {__("Do you know")} {$profile['user_firstname']}
                            </div>
                            <div class="card-body">
                                <div>
                                    {__("To see what")} {$profile['user_firstname']} {__("shares with friends")}, 
                                    <span class="text-primary">
                                        {__("send a friend request")}
                                    </span>
                                    <div class="float-right">
                                        <!-- add friend -->
                                        {if $profile['he_request']}
                                            <button class="btn btn-primary btn-sm js_friend-accept" data-uid="{$profile['user_id']}">{__("Confirm")}</button>
                                            <button class="btn btn-secondary btn-sm js_friend-decline" data-uid="{$profile['user_id']}">{__("Delete Request")}</button>
                                        {elseif $profile['i_request']}
                                            <button class="btn btn-secondary btn-sm js_friend-cancel" data-uid="{$profile['user_id']}">
                                                <i class="fa fa-user-plus mr5"></i>{__("Friend Request Sent")}
                                            </button>
                                        {else}
                                            <button type="button" class="btn btn-success btn-sm js_friend-add" data-uid="{$profile['user_id']}">
                                                <i class="fa fa-user-plus mr5"></i>{__("Add Friend")}
                                            </button>
                                        {/if}
                                        <!-- add friend -->
                                    </div>
                                </div>
                                {if $profile['mutual_friends_count'] && $profile['mutual_friends_count'] > 0}
                                    <div class="mt10 clearfix">
                                        <ul class="float-left mr20">
                                            {foreach $profile['mutual_friends'] as $mutual_friend}
                                                <li>
                                                    <a data-toggle="tooltip" data-placement="top" title="{$mutual_friend['user_firstname']} {$mutual_friend['user_lastname']}" class="post-avatar-picture" href="{$system['system_url']}/{$mutual_friend['user_name']}" style="background-image:url({$mutual_friend['user_picture']});">
                                                    </a>
                                                </li>
                                                {if $mutual_friend@index > 3}{break}{/if}
                                            {/foreach}
                                        </ul>
                                        <div class="float-left mt10">
                                            <span class="text-underline" data-toggle="modal" data-url="users/mutual_friends.php?uid={$profile['user_id']}">{$profile['mutual_friends_count']} {__("Mutual Friends")}</span>
                                        </div>
                                    </div>
                                {/if}
                            </div>
                        </div>
                    </div>
                {/if}
                <!-- panel [mutual-friends] -->

                <!-- view content -->
                {if $view == ""}

                    <!-- left panel -->
                    <div class="order-1 col-lg-3 order-lg-1">

                        <!-- panel [profile completion] -->
                        {if isset($profile['profile_completion']) && $profile['profile_completion'] < 100}
                            <div class="card">
                                <div class="card-header bg-transparent">
                                    <span class="float-right">{$profile['profile_completion']}%</span>
                                    <strong>{__("Profile Completion")}</strong>
                                    <div class="progress mt5">
                                        <div class="progress-bar progress-bar-info progress-bar-striped" role="progressbar" aria-valuenow="{$profile['profile_completion']}" aria-valuemin="0" aria-valuemax="100" style="width: {$profile['profile_completion']}%"></div>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <div class="mb5">
                                        {if $profile['user_picture_default']}
                                            <span class="text-link">
                                                <i class="fas fa-plus-circle mr5"></i>{__("Add your profile picture")}
                                            </a>
                                        {else}
                                            <i class="fas fa-check-circle green mr5"></i>
                                            <span style="text-decoration: line-through;">{__("Add your profile picture")}</span>
                                        {/if}
                                    </div>
                                    <div class="mb5">
                                        {if $profile['user_cover_default']}
                                            <span class="text-link">
                                                <i class="fas fa-plus-circle mr5"></i>{__("Add your profile cover")}
                                            </a>
                                        {else}
                                            <i class="fas fa-check-circle green mr5"></i>
                                            <span style="text-decoration: line-through;">{__("Add your profile cover")}</span>
                                        {/if}
                                    </div>
                                    <div class="mb5">
                                        {if !$profile['user_biography']}
                                            <a href="{$system['system_url']}/settings/profile">
                                                <i class="fas fa-plus-circle mr5"></i>{__("Add your biography")}
                                            </a>
                                        {else}
                                            <i class="fas fa-check-circle green mr5"></i>
                                            <span style="text-decoration: line-through;">{__("Add your biography")}</span>
                                        {/if}
                                    </div>
                                    <div class="mb5">
                                        {if !$profile['user_birthdate']}
                                            <a href="{$system['system_url']}/settings/profile">
                                                <i class="fas fa-plus-circle mr5"></i>{__("Add your birthdate")}
                                            </a>
                                        {else}
                                            <i class="fas fa-check-circle green mr5"></i>
                                            <span style="text-decoration: line-through;">{__("Add your birthdate")}</span>
                                        {/if}
                                    </div>
                                    <div class="mb5">
                                        {if !$profile['user_relationship']}
                                            <a href="{$system['system_url']}/settings/profile">
                                                <i class="fas fa-plus-circle mr5"></i>{__("Add your relationship")}
                                            </a>
                                        {else}
                                            <i class="fas fa-check-circle green mr5"></i>
                                            <span style="text-decoration: line-through;">{__("Add your relationship")}</span>
                                        {/if}
                                    </div>
                                    <div class="mb5">
                                        {if !$profile['user_work_title'] || !$profile['user_work_place']}
                                            <a href="{$system['system_url']}/settings/profile/work">
                                                <i class="fas fa-plus-circle mr5"></i>{__("Add your work info")}
                                            </a>
                                        {else}
                                            <i class="fas fa-check-circle green mr5"></i>
                                            <span style="text-decoration: line-through;">{__("Add your work info")}</span>
                                        {/if}
                                    </div>
                                    <div class="mb5">
                                        {if !$profile['user_current_city'] || !$profile['user_hometown']}
                                            <a href="{$system['system_url']}/settings/profile/location">
                                                <i class="fas fa-plus-circle mr5"></i>{__("Add your location info")}
                                            </a>
                                        {else}
                                            <i class="fas fa-check-circle green mr5"></i>
                                            <span style="text-decoration: line-through;">{__("Add your location info")}</span>
                                        {/if}
                                    </div>
                                    <div class="mb5">
                                        {if !$profile['user_edu_major'] || !$profile['user_edu_school']}
                                            <a href="{$system['system_url']}/settings/profile/education">
                                                <i class="fas fa-plus-circle mr5"></i>{__("Add your education info")}
                                            </a>
                                        {else}
                                            <i class="fas fa-check-circle green mr5"></i>
                                            <span style="text-decoration: line-through;">{__("Add your education info")}</span>
                                        {/if}
                                    </div>
                                </div>
                            </div>
                        {/if}
                        <!-- panel [profile completion] -->


                        <!-- panel [about] -->
                        <div class="card">
                            <div class="card-body">
                                {if !is_empty($profile['user_biography'])}
                                    <div class="about-bio">
                                        <div class="js_readmore overflow-hidden">
                                            {$profile['user_biography']}
                                        </div>
                                    </div>
                                {/if}
                                <ul class="about-list">
                                    {if $profile['user_subscribed']}
                                        <li class="package" {if $profile['package_color']} style="background: {$profile['package_color']}" {/if}>
                                            <i class="fa fa-bolt fa-fw"></i> {$profile['package_name']} {__("Member")}
                                        </li>
                                    {/if}

                                    {if $profile['user_work_title']}
                                        {if $profile['user_id'] == $user->_data['user_id'] || $profile['user_privacy_work'] == "public" || ($profile['user_privacy_work'] == "friends" && $profile['we_friends'])}
                                            <li>
                                                <div class="about-list-item">
                                                    <i class="fa fa-briefcase fa-fw fa-lg"></i>
                                                    {$profile['user_work_title']} 
                                                    {if $profile['user_work_place']}
                                                        {__("at")} 
                                                        {if $profile['user_work_url']}
                                                            <a target="_blank" href="{$profile['user_work_url']}">{$profile['user_work_place']}</a>
                                                        {else}
                                                            <span>{$profile['user_work_place']}</span>
                                                        {/if}
                                                    {/if}
                                                </div>
                                            </li>
                                        {/if}
                                    {/if}

                                    {if $profile['user_edu_major']}
                                        {if $profile['user_id'] == $user->_data['user_id'] || $profile['user_privacy_education'] == "public" || ($profile['user_privacy_education'] == "friends" && $profile['we_friends'])}
                                            <li>
                                                <div class="about-list-item">
                                                    <i class="fa fa-graduation-cap fa-fw fa-lg"></i>
                                                    {__("Studied")} {$profile['user_edu_major']} 
                                                    {__("at")}  <span class="text-info">{$profile['user_edu_school']}</span>
                                                    {if $profile['user_edu_class']}
                                                        <div class="details">
                                                            Class of {$profile['user_edu_class']}
                                                        </div>
                                                    {/if}
                                                </div>
                                            </li>
                                        {/if}
                                    {/if}

                                    {if $profile['user_current_city']}
                                        {if $profile['user_id'] == $user->_data['user_id'] || $profile['user_privacy_location'] == "public" || ($profile['user_privacy_location'] == "friends" && $profile['we_friends'])}
                                            <li>
                                                <div class="about-list-item">
                                                    <i class="fa fa-home fa-fw fa-lg"></i>
                                                    {__("Lives in")} <span class="text-info">{$profile['user_current_city']}</span>
                                                </div>
                                            </li>
                                        {/if}
                                    {/if}
                                    
                                    {if $profile['user_hometown']}
                                        {if $profile['user_id'] == $user->_data['user_id'] || $profile['user_privacy_location'] == "public" || ($profile['user_privacy_location'] == "friends" && $profile['we_friends'])}
                                            <li>
                                                <div class="about-list-item">
                                                    <i class="fa fa-map-marker fa-fw fa-lg"></i>
                                                    {__("From")} <span class="text-info">{$profile['user_hometown']}</span>
                                                </div>
                                            </li>
                                        {/if}
                                    {/if}

                                    <li>
                                        <div class="about-list-item">
                                            {if $profile['user_gender'] == "male"}
                                                <i class="fa fa-male fa-fw fa-lg"></i>
                                                {__("Male")}
                                            {elseif $profile['user_gender'] == "female"}
                                                <i class="fa fa-female fa-fw fa-lg"></i>
                                                {__("Female")}
                                            {else}
                                                <i class="fa fa-user fa-fw fa-lg"></i>
                                                {__("Other")}
                                            {/if}
                                        </div>
                                    </li>

                                    {if $profile['user_relationship']}
                                        {if $profile['user_id'] == $user->_data['user_id'] || $profile['user_privacy_relationship'] == "public" || ($profile['user_privacy_relationship'] == "friends" && $profile['we_friends'])}
                                            <li>
                                                <div class="about-list-item">
                                                    <i class="fa fa-heart fa-fw fa-lg"></i>
                                                    {if $profile['user_relationship'] == "relationship"}
                                                        {__("In a relationship")}
                                                    {elseif $profile['user_relationship'] == "complicated"}
                                                        {__("It's complicated")}
                                                    {else}
                                                        {__($profile['user_relationship']|ucfirst)}
                                                    {/if}
                                                </div>
                                            </li>
                                        {/if}
                                    {/if}
                                    
                                    {if $profile['user_birthdate'] != null}
                                        {if $profile['user_id'] == $user->_data['user_id'] || $profile['user_privacy_birthdate'] == "public" || ($profile['user_privacy_birthdate'] == "friends" && $profile['we_friends'])}
                                            <li>
                                                <div class="about-list-item">
                                                    <i class="fa fa-birthday-cake fa-fw fa-lg"></i>
                                                    {if $system['system_datetime_format'] == "d/m/Y H:i"}
                                                        {$profile['user_birthdate']|date_format:"%d/%m/%Y"}
                                                    {else}
                                                        {$profile['user_birthdate']|date_format:"%m/%d/%Y"}
                                                    {/if}
                                                    
                                                </div>
                                            </li>
                                        {/if}
                                    {/if}

                                    {if $profile['user_website']}
                                        <li>
                                            <div class="about-list-item">
                                                <i class="fa fa-globe fa-fw fa-lg"></i>
                                                <a target="_blank" href="{$profile['user_website']}">{$profile['user_website']}</a>
                                            </div>
                                        </li>
                                    {/if}
                                    
                                    <li>
                                        <div class="about-list-item">
                                            <i class="fa fa-rss fa-fw fa-lg"></i>
                                            {__("Followed by")} 
                                            <a href="{$system['system_url']}/{$profile['user_name']}/followers">{$profile['followers_count']} {__("people")}</a>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <!-- panel [about] -->

                        <!-- custom fields [basic] -->
                        {if $custom_fields['basic']}
                            {if $profile['user_id'] == $user->_data['user_id'] || $profile['user_privacy_basic'] == "public" || ($profile['user_privacy_basic'] == "friends" && $profile['we_friends'])}
                                <div class="card">
                                    <div class="card-header bg-transparent">
                                        <i class="fa fa-user mr5"></i>
                                        <strong>{__("Basic Info")}</strong>
                                    </div>
                                    <div class="card-body">
                                        <ul class="about-list">
                                            {foreach $custom_fields['basic'] as $custom_field}
                                                {if $custom_field['value']}
                                                    <li>
                                                        <strong>{$custom_field['label']}</strong><br>
                                                        {$custom_field['value']}
                                                    </li>
                                                {/if}
                                            {/foreach}
                                        </ul>
                                    </div>
                                </div>
                            {/if}
                        {/if}
                        <!-- custom fields [basic] -->


                        <!-- custom fields [work] -->
                        {if $custom_fields['work']}
                            {if $profile['user_id'] == $user->_data['user_id'] || $profile['user_privacy_work'] == "public" || ($profile['user_privacy_work'] == "friends" && $profile['we_friends'])}
                                <div class="card">
                                    <div class="card-header bg-transparent">
                                        <i class="fa fa-briefcase mr5"></i>
                                        <strong>{__("Work Info")}</strong>
                                    </div>
                                    <div class="card-body">
                                        <ul class="about-list">
                                            {foreach $custom_fields['work'] as $custom_field}
                                                {if $custom_field['value']}
                                                    <li>
                                                        <strong>{$custom_field['label']}</strong><br>
                                                        {$custom_field['value']}
                                                    </li>
                                                {/if}
                                            {/foreach}
                                        </ul>
                                    </div>
                                </div>
                            {/if}
                        {/if}
                        <!-- custom fields [work] -->

                        <!-- custom fields [location] -->
                        {if $custom_fields['location']}
                            {if $profile['user_id'] == $user->_data['user_id'] || $profile['user_privacy_location'] == "public" || ($profile['user_privacy_location'] == "friends" && $profile['we_friends'])}
                                <div class="card">
                                    <div class="card-header bg-transparent">
                                        <i class="fa fa-home mr5"></i>
                                        <strong>{__("Location Info")}</strong>
                                    </div>
                                    <div class="card-body">
                                        <ul class="about-list">
                                            {foreach $custom_fields['location'] as $custom_field}
                                                {if $custom_field['value']}
                                                    <li>
                                                        <strong>{$custom_field['label']}</strong><br>
                                                        {$custom_field['value']}
                                                    </li>
                                                {/if}
                                            {/foreach}
                                        </ul>
                                    </div>
                                </div>
                            {/if}
                        {/if}
                        <!-- custom fields [location] -->

                        <!-- custom fields [education] -->
                        {if $custom_fields['education']}
                            {if $profile['user_id'] == $user->_data['user_id'] || $profile['user_privacy_education'] == "public" || ($profile['user_privacy_education'] == "friends" && $profile['we_friends'])}
                                <div class="card">
                                    <div class="card-header bg-transparent">
                                        <i class="fa fa-graduation-cap mr5"></i>
                                        <strong>{__("Education Info")}</strong>
                                    </div>
                                    <div class="card-body">
                                        <ul class="about-list">
                                            {foreach $custom_fields['education'] as $custom_field}
                                                {if $custom_field['value']}
                                                    <li>
                                                        <strong>{$custom_field['label']}</strong><br>
                                                        {$custom_field['value']}
                                                    </li>
                                                {/if}
                                            {/foreach}
                                        </ul>
                                    </div>
                                </div>
                            {/if}
                        {/if}
                        <!-- custom fields [education] -->

                        <!-- custom fields [other] -->
                        {if $custom_fields['other']}
                            {if $profile['user_id'] == $user->_data['user_id'] || $profile['user_privacy_other'] == "public" || ($profile['user_privacy_other'] == "friends" && $profile['we_friends'])}
                                <div class="card">
                                    <div class="card-header bg-transparent">
                                        <i class="fa fa-info-circle mr5"></i>
                                        <strong>{__("Other Info")}</strong>
                                    </div>
                                    <div class="card-body">
                                        <ul class="about-list">
                                            {foreach $custom_fields['other'] as $custom_field}
                                                {if $custom_field['value']}
                                                    <li>
                                                        <strong>{$custom_field['label']}</strong><br>
                                                        {$custom_field['value']}
                                                    </li>
                                                {/if}
                                            {/foreach}
                                        </ul>
                                    </div>
                                </div>
                            {/if}
                        {/if}
                        <!-- custom fields [other] -->

                        <!-- social links -->
                        {if $profile['user_social_facebook'] || $profile['user_social_twitter'] || $profile['user_social_youtube'] || $profile['user_social_instagram'] || $profile['user_social_linkedin'] || $profile['user_social_vkontakte']}
                            <div class="card">
                                <div class="card-header bg-transparent">
                                    <i class="fa fa-share-alt mr5"></i>
                                    <strong>{__("Social Links")}</strong>
                                </div>
                                <div class="card-body text-center">
                                    {if $profile['user_social_facebook']}
                                        <a target="_blank" href="{$profile['user_social_facebook']}" class="btn btn-sm btn-rounded btn-social-icon btn-facebook">
                                            <i class="fab fa-facebook-f"></i>
                                        </a>
                                    {/if}
                                    {if $profile['user_social_twitter']}
                                        <a target="_blank" href="{$profile['user_social_twitter']}" class="btn btn-sm btn-rounded btn-social-icon btn-twitter">
                                           <i class="fab fa-twitter"></i>
                                        </a>
                                    {/if}
                                    {if $profile['user_social_youtube']}
                                        <a target="_blank" href="{$profile['user_social_youtube']}" class="btn btn-sm btn-rounded btn-social-icon btn-pinterest">
                                            <i class="fab fa-youtube"></i>
                                        </a>
                                    {/if}
                                    {if $profile['user_social_instagram']}
                                        <a target="_blank" href="{$profile['user_social_instagram']}" class="btn btn-sm btn-rounded btn-social-icon btn-instagram">
                                            <i class="fab fa-instagram"></i>
                                        </a>
                                    {/if}
                                    {if $profile['user_social_linkedin']}
                                        <a target="_blank" href="{$profile['user_social_linkedin']}" class="btn btn-sm btn-rounded btn-social-icon btn-linkedin">
                                            <i class="fab fa-linkedin"></i>
                                        </a>
                                    {/if}
                                    {if $profile['user_social_vkontakte']}
                                        <a target="_blank" href="{$profile['user_social_vkontakte']}" class="btn btn-sm btn-rounded btn-social-icon btn-vk">
                                            <i class="fab fa-vk"></i>
                                        </a>
                                    {/if}
                                </div>
                            </div>
                        {/if}
                        <!-- social links -->
                    </div>
                    <!-- left panel -->
                    
                    <!-- right panel -->
                    <div class="order-2 col-lg-3 order-lg-3">
                        <!-- gifts -->
                        {if $user->_logged_in && $user->_data['user_id'] != $profile['user_id'] && $system['gifts_enabled']}
                            {if $profile['user_privacy_gifts'] == "public" || ($profile['user_privacy_gifts'] == "friends" && $profile['we_friends'])}
                                <button type="button" class="btn btn-block btn-md bg-gradient-pink border-0 rounded-pill mb20" data-toggle="modal" data-url="#gifts" data-options='{literal}{{/literal}"uid": {$profile["user_id"]}{literal}}{/literal}'>
                                    <i class="fas fa-gift fa-lg mr10"></i>{__("Send a Gift")}
                                </button>
                            {/if}
                        {/if}
                        <!-- gifts -->

                        <!-- photos -->
                        {if $profile['photos']}
                            <div class="card panel-photos">
                                <div class="card-header bg-transparent">
                                    <i class="fa fa-images mr5"></i>
                                    <strong><a href="{$system['system_url']}/{$profile['user_name']}/photos">{__("Photos")}</a></strong>
                                </div>
                                <div class="card-body ptb10 plr10">
                                    <div class="row no-gutters">
                                        {foreach $profile['photos'] as $photo}
                                            {include file='__feeds_photo.tpl' _context="photos" _small=true}
                                        {/foreach}
                                    </div>
                                </div>
                            </div>
                        {/if}
                        <!-- photos -->

                        <!-- friends -->
                        {if $profile['friends_count'] > 0}
                            <div class="card">
                                <div class="card-header bg-transparent">
                                    <i class="fa fa-users mr5"></i>
                                    <strong><a href="{$system['system_url']}/{$profile['user_name']}/friends">{__("Friends")}</a></strong>
                                    <span class="badge badge-pill badge-info ml5">{$profile['friends_count']}</span> 
                                    {if $profile['mutual_friends_count'] && $profile['mutual_friends_count'] > 0}
                                        <small>
                                            (<span class="text-underline" data-toggle="modal" data-url="users/mutual_friends.php?uid={$profile['user_id']}">{$profile['mutual_friends_count']} {__("mutual friends")}</span>)
                                        </small>
                                    {/if}
                                </div>
                                <div class="card-body ptb10 plr10">
                                    <div class="row no-gutters">
                                        {foreach $profile['friends'] as $_friend}
                                            <div class="col-3 col-lg-4">
                                                <div class="circled-user-box">
                                                    <a class="user-box" href="{$system['system_url']}/{$_friend['user_name']}">
                                                        <img alt="{$_friend['user_firstname']} {$_friend['user_lastname']}" src="{$_friend['user_picture']}" />
                                                        <div class="name" title="{$_friend['user_firstname']} {$_friend['user_lastname']}">
                                                            {$_friend['user_firstname']} {$_friend['user_lastname']}
                                                        </div>
                                                    </a>
                                                </div>
                                            </div>
                                        {/foreach}
                                    </div>
                                </div>
                            </div>
                        {/if}
                        <!-- friends -->

                        <!-- pages -->
                        {if count($profile['pages']) > 0}
                            <div class="card">
                                <div class="card-header bg-transparent">
                                    <i class="fa fa-flag mr5"></i>
                                    <strong><a href="{$system['system_url']}/{$profile['user_name']}/likes">{__("Likes")}</a></strong>
                                </div>
                                <div class="card-body ptb10 plr10">
                                    <div class="row no-gutters">
                                        {foreach $profile['pages'] as $_page}
                                            <div class="col-3 col-lg-4">
                                                <div class="circled-user-box">
                                                    <a class="user-box" href="{$system['system_url']}/pages/{$_page['page_name']}">
                                                        <img alt="{$_page['page_title']}" src="{$_page['page_picture']}" />
                                                        <div class="name" title="{$_page['page_title']}">
                                                            {$_page['page_title']}
                                                        </div>
                                                    </a>
                                                </div>
                                            </div>
                                        {/foreach}
                                    </div>
                                </div>
                            </div>
                        {/if}
                        <!-- pages -->

                        <!-- groups -->
                        {if count($profile['groups']) > 0}
                            <div class="card">
                                <div class="card-header bg-transparent">
                                    <i class="fa fa-users mr5"></i>
                                    <strong><a href="{$system['system_url']}/{$profile['user_name']}/groups">{__("Groups")}</a></strong>
                                </div>
                                <div class="card-body ptb10 plr10">
                                    <div class="row no-gutters">
                                        {foreach $profile['groups'] as $_group}
                                            <div class="col-3 col-lg-4">
                                                <div class="circled-user-box">
                                                    <a class="user-box" href="{$system['system_url']}/groups/{$_group['group_name']}">
                                                        <img alt="{$_group['group_title']}" src="{$_group['group_picture']}" />
                                                        <div class="name" title="{$_group['group_title']}">
                                                            {$_group['group_title']}
                                                        </div>
                                                    </a>
                                                </div>
                                            </div>
                                        {/foreach}
                                    </div>
                                </div>
                            </div>
                        {/if}
                        <!-- groups -->

                        <!-- events -->
                        {if count($profile['events']) > 0}
                            <div class="card">
                                <div class="card-header bg-transparent">
                                    <i class="fa fa-calendar mr5"></i>
                                    <strong><a href="{$system['system_url']}/{$profile['user_name']}/events">{__("Events")}</a></strong>
                                </div>
                                <div class="card-body ptb10 plr10">
                                    <div class="row no-gutters">
                                        {foreach $profile['events'] as $_event}
                                            <div class="col-3 col-lg-4">
                                                <div class="circled-user-box">
                                                    <a class="user-box" href="{$system['system_url']}/events/{$_event['event_id']}">
                                                        <img alt="{$_event['event_title']}" src="{$_event['event_picture']}" />
                                                        <div style="" class="name" title="{$_event['event_title']}">
                                                            {$_event['event_title']}
                                                        </div>
                                                    </a>
                                                </div>
                                            </div>
                                        {/foreach}
                                    </div>
                                </div>
                            </div>
                        {/if}
                        <!-- events -->
                    </div>
                    <!-- right panel -->
                    
                    <!-- center panel -->
                    <div class="order-3 col-lg-6 order-lg-2">
                        <!-- publisher -->
                        {if $user->_logged_in}
                            {if $user->_data['user_id'] == $profile['user_id']}
                                {include file='_publisher.tpl' _handle="me" _privacy=true}
                            {elseif $system['wall_posts_enabled'] && ( $profile['user_privacy_wall'] == 'friends' && $profile['we_friends'] || $profile['user_privacy_wall'] == 'public' )}
                                {include file='_publisher.tpl' _handle="user" _id=$profile['user_id'] _privacy=true}
                            {/if}

                        {/if}
                        <!-- publisher -->

                        <!-- pinned post -->
                        {if $pinned_post}
                            {include file='_pinned_post.tpl' post=$pinned_post}
                        {/if}
                        <!-- pinned post -->

                        <!-- posts -->
                        {include file='_posts.tpl' _get="posts_profile" _id=$profile['user_id']}
                        <!-- posts -->
                    </div>
                    <!-- center panel -->
                
                {elseif $view == "friends"}
                    <!-- friends -->
                    <div class="col-12">
                        <div class="card">
                            <div class="card-header with-icon with-nav">
                                <!-- panel title -->
                                <div class="mb20">
                                    <i class="fa fa-users mr10"></i>{__("Friends")}
                                </div>
                                <!-- panel title -->

                                <!-- panel nav -->
                                <ul class="nav nav-tabs">
                                    <li class="nav-item">
                                        <a class="nav-link active" href="{$system['system_url']}/{$profile['user_name']}/friends">
                                            {__("Friends")}
                                            <span class="badge badge-pill badge-info">{$profile['friends_count']}</span>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="{$system['system_url']}/{$profile['user_name']}/followers">{__("Followers")}</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="{$system['system_url']}/{$profile['user_name']}/followings">{__("Followings")}</a>
                                    </li>
                                </ul>
                                <!-- panel nav -->
                            </div>
                            <div class="card-body pb0">
                                {if $profile['friends_count'] > 0}
                                    <ul class="row">
                                        {foreach $profile['friends'] as $_user}
                                        {include file='__feeds_user.tpl' _tpl="box" _connection=$_user["connection"]}
                                        {/foreach}
                                    </ul>
                                    {if count($profile['friends']) >= $system['min_results_even']}
                                        <!-- see-more -->
                                        <div class="alert alert-info see-more mt0 mb20 js_see-more" data-get="friends" data-uid="{$profile['user_id']}">
                                            <span>{__("See More")}</span>
                                            <div class="loader loader_small x-hidden"></div>
                                        </div>
                                        <!-- see-more -->
                                    {/if}
                                {else}
                                    <p class="text-center text-muted mt10">
                                        {$profile['user_firstname']} {__("doesn't have friends")}
                                    </p>
                                {/if}
                            </div>
                        </div>
                    </div>
                    <!-- friends -->
                
                {elseif $view == "followers"}
                    <!-- followers -->
                    <div class="col-12">
                        <div class="card">
                            <div class="card-header with-icon with-nav">
                                <!-- panel title -->
                                <div class="mb20">
                                    <i class="fa fa-users mr10"></i>{__("Friends")}
                                </div>
                                <!-- panel title -->

                                <!-- panel nav -->
                                <ul class="nav nav-tabs">
                                    <li class="nav-item">
                                        <a class="nav-link" href="{$system['system_url']}/{$profile['user_name']}/friends">{__("Friends")}</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link active" href="{$system['system_url']}/{$profile['user_name']}/followers">
                                            {__("Followers")}
                                            <span class="badge badge-pill badge-info">{$profile['followers_count']}</span>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="{$system['system_url']}/{$profile['user_name']}/followings">{__("Followings")}</a>
                                    </li>
                                </ul>
                                <!-- panel nav -->
                            </div>
                            <div class="card-body pb0">
                                {if $profile['followers_count'] > 0}
                                    <ul class="row">
                                        {foreach $profile['followers'] as $_user}
                                            {include file='__feeds_user.tpl' _tpl="box" _connection=$_user["connection"]}
                                        {/foreach}
                                    </ul>

                                    {if count($profile['followers']) >= $system['min_results_even']}
                                    <!-- see-more -->
                                    <div class="alert alert-info see-more mt0 mb20 js_see-more" data-get="followers" data-uid="{$profile['user_id']}">
                                        <span>{__("See More")}</span>
                                        <div class="loader loader_small x-hidden"></div>
                                    </div>
                                    <!-- see-more -->
                                    {/if}
                                {else}
                                    <p class="text-center text-muted mt10">
                                        {$profile['user_firstname']} {__("doesn't have followers")}
                                    </p>
                                {/if}
                            </div>
                        </div>
                    </div>
                    <!-- followers -->
                
                {elseif $view == "followings"}
                    <!-- followings -->
                    <div class="col-12">
                        <div class="card">
                            <div class="card-header with-icon with-nav">
                                <!-- panel title -->
                                <div class="mb20">
                                    <i class="fa fa-users mr10"></i>{__("Friends")}
                                </div>
                                <!-- panel title -->

                                <!-- panel nav -->
                                <ul class="nav nav-tabs">
                                    <li class="nav-item">
                                        <a class="nav-link" href="{$system['system_url']}/{$profile['user_name']}/friends">{__("Friends")}</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="{$system['system_url']}/{$profile['user_name']}/followers">
                                            <strong class="pr5">{__("Followers")}</strong>
                                            <span class="badge badge-pill badge-info">{$profile['followers_count']}</span>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link active" href="{$system['system_url']}/{$profile['user_name']}/followings">
                                            {__("Followings")}
                                            <span class="badge badge-pill badge-info">{$profile['followings_count']}</span>
                                        </a>
                                    </li>
                                </ul>
                                <!-- panel nav -->
                            </div>
                            <div class="card-body pb0">
                                {if $profile['followings_count'] > 0}
                                    <ul class="row">
                                        {foreach $profile['followings'] as $_user}
                                            {include file='__feeds_user.tpl' _tpl="box" _connection=$_user["connection"]}
                                        {/foreach}
                                    </ul>

                                    {if count($profile['followings']) >= $system['min_results_even']}
                                    <!-- see-more -->
                                    <div class="alert alert-info see-more mt0 mb20 js_see-more" data-get="followings" data-uid="{$profile['user_id']}">
                                        <span>{__("See More")}</span>
                                        <div class="loader loader_small x-hidden"></div>
                                    </div>
                                    <!-- see-more -->
                                    {/if}
                                {else}
                                    <p class="text-center text-muted mt10">
                                        {$profile['user_firstname']} {__("doesn't have followings")}
                                    </p>
                                {/if}
                            </div>
                        </div>
                    </div>
                    <!-- followings -->
                
                {elseif $view == "photos"}
                    <!-- photos -->
                    <div class="col-12">
                        <div class="card panel-photos">
                            <div class="card-header with-icon with-nav">
                                <!-- panel title -->
                                <div class="mb20">
                                    <i class="fa fa-images mr10"></i>{__("Photos")}
                                </div>
                                <!-- panel title -->

                                <!-- panel nav -->
                                <ul class="nav nav-tabs">
                                    <li class="nav-item">
                                        <a class="nav-link active" href="{$system['system_url']}/{$profile['user_name']}/photos">{__("Photos")}</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="{$system['system_url']}/{$profile['user_name']}/albums">{__("Albums")}</a>
                                    </li>
                                </ul>
                                <!-- panel nav -->
                            </div>
                            <div class="card-body">
                                {if $profile['photos']}
                                    <ul class="row no-gutters">
                                        {foreach $profile['photos'] as $photo}
                                            {include file='__feeds_photo.tpl' _context="photos"}
                                        {/foreach}
                                    </ul>
                                    <!-- see-more -->
                                    <div class="alert alert-info see-more mt20 js_see-more" data-get="photos" data-id="{$profile['user_id']}" data-type='user'>
                                        <span>{__("See More")}</span>
                                        <div class="loader loader_small x-hidden"></div>
                                    </div>
                                    <!-- see-more -->
                                {else}
                                    <p class="text-center text-muted mt10">
                                        {$profile['user_firstname']} {__("doesn't have photos")}
                                    </p>
                                {/if}
                            </div>
                        </div>
                    </div>
                    <!-- photos -->
                
                {elseif $view == "albums"}
                    <!-- albums -->
                    <div class="col-12">
                        <div class="card">
                            <div class="card-header with-icon with-nav">
                                <!-- panel title -->
                                <div class="mb20">
                                    <i class="fa fa-images mr10"></i>{__("Photos")}
                                </div>
                                <!-- panel title -->

                                <!-- panel nav -->
                                <ul class="nav nav-tabs">
                                    <li class="nav-item">
                                        <a class="nav-link" href="{$system['system_url']}/{$profile['user_name']}/photos">{__("Photos")}</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link active" href="{$system['system_url']}/{$profile['user_name']}/albums">{__("Albums")}</a>
                                    </li>
                                </ul>
                                <!-- panel nav -->
                            </div>
                            <div class="card-body">
                                {if $profile['albums']}
                                    <ul class="row">
                                        {foreach $profile['albums'] as $album}
                                        {include file='__feeds_album.tpl'}
                                        {/foreach}
                                    </ul>
                                    {if count($profile['albums']) >= $system['max_results_even']}
                                        <!-- see-more -->
                                        <div class="alert alert-info see-more js_see-more" data-get="albums" data-id="{$profile['user_id']}" data-type='user'>
                                            <span>{__("See More")}</span>
                                            <div class="loader loader_small x-hidden"></div>
                                        </div>
                                        <!-- see-more -->
                                    {/if}
                                {else}
                                    <p class="text-center text-muted mt10">
                                        {$profile['user_firstname']} {__("doesn't have albums")}
                                    </p>
                                {/if}
                            </div>
                        </div>
                    </div>
                    <!-- albums -->
                
                {elseif $view == "album"}
                    <!-- albums -->
                    <div class="col-12">
                        <div class="card panel-photos">
                            <div class="card-header with-icon with-nav">
                                <!-- back to albums -->
                                <div class="float-right">
                                    <a href="{$system['system_url']}/{$profile['user_name']}/albums" class="btn btn-sm btn-light">
                                        <i class="fa fa-arrow-circle-left mr5"></i>{__("Back to Albums")}
                                    </a>
                                </div>
                                <!-- back to albums -->

                                <!-- panel title -->
                                <div class="mb20">
                                    <i class="fa fa-images mr10"></i>{__("Photos")}
                                </div>
                                <!-- panel title -->

                                <!-- panel nav -->
                                <ul class="nav nav-tabs">
                                    <li class="nav-item">
                                        <a class="nav-link" href="{$system['system_url']}/{$profile['user_name']}/photos">{__("Photos")}</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link active" href="{$system['system_url']}/{$profile['user_name']}/albums">{__("Albums")}</a>
                                    </li>
                                </ul>
                                <!-- panel nav -->
                            </div>
                            <div class="card-body">
                            {include file='_album.tpl'}
                            </div>
                        </div>
                    </div>
                    <!-- albums -->

                {elseif $view == "videos"}
                    <!-- videos -->
                    <div class="col-12">
                        <div class="card panel-videos">
                            <div class="card-header with-icon">
                                <!-- panel title -->
                                <div class="mb20">
                                    <i class="fa fa-video mr10"></i>{__("Videos")}
                                </div>
                                <!-- panel title -->
                            </div>
                            <div class="card-body">
                                {if $profile['videos']}
                                    <ul class="row no-gutters">
                                        {foreach $profile['videos'] as $video}
                                            {include file='__feeds_video.tpl'}
                                        {/foreach}
                                    </ul>
                                    <!-- see-more -->
                                    <div class="alert alert-info see-more js_see-more" data-get="videos" data-id="{$profile['user_id']}" data-type='user'>
                                        <span>{__("See More")}</span>
                                        <div class="loader loader_small x-hidden"></div>
                                    </div>
                                    <!-- see-more -->
                                {else}
                                    <p class="text-center text-muted mt10">
                                        {$profile['user_firstname']} {__("doesn't have videos")}
                                    </p>
                                {/if}
                            </div>
                        </div>
                    </div>
                    <!-- videos -->
                
                {elseif $view == "likes"}
                    <!-- likes -->
                    <div class="col-12">
                        <div class="card">
                            <div class="card-header with-icon">
                                <!-- panel title -->
                                <i class="fa fa-thumbs-up mr10"></i>{__("Likes")}
                                <!-- panel title -->
                            </div>
                            <div class="card-body">
                                {if $profile['user_id'] == $user->_data['user_id'] || $profile['user_privacy_pages'] == "public" || ($profile['user_privacy_pages'] == "friends" && $profile['we_friends'])}
                                    {if count($profile['pages']) > 0}
                                        <ul class="row">
                                            {foreach $profile['pages'] as $_page}
                                                {include file='__feeds_page.tpl' _tpl="box"}
                                            {/foreach}
                                        </ul>

                                        {if count($profile['pages']) >= $system['max_results_even']}
                                            <!-- see-more -->
                                            <div class="alert alert-info see-more js_see-more" data-get="profile_pages" data-uid="{$profile['user_id']}">
                                                <span>{__("See More")}</span>
                                                <div class="loader loader_small x-hidden"></div>
                                            </div>
                                            <!-- see-more -->
                                        {/if}
                                    {else}
                                        <p class="text-center text-muted mt10">
                                            {__("No pages to show")}
                                        </p>
                                    {/if}
                                {else}
                                    <p class="text-center text-muted mt10">
                                        {__("No pages to show")}
                                    </p>
                                {/if}
                            </div>
                        </div>
                    </div>
                    <!-- likes -->
                
                {elseif $view == "groups"}
                    <!-- groups -->
                    <div class="col-12">
                        <div class="card">
                            <div class="card-header with-icon">
                                <!-- panel title -->
                                <i class="fa fa-users mr10"></i>{__("Groups")}
                                <!-- panel title -->
                            </div>
                            <div class="card-body">
                                {if $profile['user_id'] == $user->_data['user_id'] || $profile['user_privacy_groups'] == "public" || ($profile['user_privacy_groups'] == "friends" && $profile['we_friends'])}
                                    {if count($profile['groups']) > 0}
                                        <ul class="row">
                                            {foreach $profile['groups'] as $_group}
                                                {include file='__feeds_group.tpl' _tpl="box"}
                                            {/foreach}
                                        </ul>

                                        {if count($profile['groups']) >= $system['max_results_even']}
                                            <!-- see-more -->
                                            <div class="alert alert-info see-more js_see-more" data-get="profile_groups" data-uid="{$profile['user_id']}">
                                                <span>{__("See More")}</span>
                                                <div class="loader loader_small x-hidden"></div>
                                            </div>
                                            <!-- see-more -->
                                        {/if}
                                    {else}
                                        <p class="text-center text-muted mt10">
                                            {__("No groups to show")}
                                        </p>
                                    {/if}
                                {else}
                                    <p class="text-center text-muted mt10">
                                        {__("No groups to show")}
                                    </p>
                                {/if}
                            </div>
                        </div>
                    </div>
                    <!-- groups -->
                
                {elseif $view == "events"}
                    <!-- events -->
                    <div class="col-12">
                        <div class="card">
                            <div class="card-header with-icon">
                                <!-- panel title -->
                                <i class="fa fa-calendar mr10"></i>{__("Events")}
                                <!-- panel title -->
                            </div>
                            <div class="card-body">
                                {if $profile['user_id'] == $user->_data['user_id'] || $profile['user_privacy_events'] == "public" || ($profile['user_privacy_events'] == "friends" && $profile['we_friends'])}
                                    {if count($profile['events']) > 0}
                                        <ul class="row">
                                            {foreach $profile['events'] as $_event}
                                                {include file='__feeds_event.tpl' _tpl="box"}
                                            {/foreach}
                                        </ul>

                                        {if count($profile['events']) >= $system['max_results_even']}
                                            <!-- see-more -->
                                            <div class="alert alert-info see-more js_see-more" data-get="profile_events" data-uid="{$profile['user_id']}">
                                                <span>{__("See More")}</span>
                                                <div class="loader loader_small x-hidden"></div>
                                            </div>
                                            <!-- see-more -->
                                        {/if}
                                    {else}
                                        <p class="text-center text-muted mt10">
                                            {__("No events to show")}
                                        </p>
                                    {/if}
                                {else}
                                    <p class="text-center text-muted mt10">
                                        {__("No events to show")}
                                    </p>
                                {/if}
                            </div>
                        </div>
                    </div>
                    <!-- events -->
                
                {/if}
                <!-- view content -->
            </div>
            <!-- profile-content -->
        </div>
        <!-- content panel -->

    </div>
</div>
<!-- page content -->

{include file='_footer.tpl'}

{if $gift}
    <script>
        $(function () {
            modal('#gift');
        });
    </script>
{/if}