{include file='_head.tpl'}
{include file='_header.tpl'}

<!-- page content -->
<div class="container {if $user->_logged_in}offcanvas{/if}">
    <div class="row">

        <!-- side panel -->
        {if $user->_logged_in}
            <div class="col-12 col-md-4 col-lg-3 d-block d-sm-none d-md-block offcanvas-sidebar mt20 js_sticky-sidebar">
                {include file='_sidebar.tpl'}
            </div>
        {/if}
        <!-- side panel -->

        <!-- content panel -->
        <div class="col-12 {if $user->_logged_in}col-md-8 col-lg-9 offcanvas-mainbar{/if}">
            <!-- profile-header -->
            <div class="profile-header">
                <!-- profile-cover -->
                <div class="profile-cover-wrapper">
                    {if $group['group_cover_id']}
                        <!-- full-cover -->
                        <img class="js_position-cover-full x-hidden" src="{$group['group_cover_full']}">
                        <!-- full-cover -->
                        
                        <!-- cropped-cover -->
                        <img class="js_position-cover-cropped js_lightbox" data-init-position="{$group['group_cover_position']}" data-id="{$group['group_cover_id']}" data-image="{$group['group_cover_full']}" data-context="album" src="{$group['group_cover']}" alt="{$group['group_title']}">
                        <!-- cropped-cover -->
                    {/if}

                    {if $group['i_admin']}
                        <!-- buttons -->
                        <div class="profile-cover-buttons">
                            <div class="profile-cover-change">
                                <i class="fa fa-camera js_x-uploader" data-handle="cover-group" data-id="{$group['group_id']}"></i>
                            </div>
                            <div class="profile-cover-position {if !$group['group_cover']}x-hidden{/if}">
                                <input class="js_position-picture-val" type="hidden" name="position-picture-val">
                                <i class="fa fa-crop-alt js_init-position-picture" data-handle="group" data-id="{$group['group_id']}"></i>
                            </div>
                            <div class="profile-cover-position-buttons">
                                <i class="fa fa-check fa-fw js_save-position-picture"></i>
                            </div>
                            <div class="profile-cover-position-buttons">
                                <i class="fa fa-times fa-fw js_cancel-position-picture"></i>
                            </div>
                            <div class="profile-cover-delete {if !$group['group_cover']}x-hidden{/if}">
                                <i class="fa fa-trash js_delete-cover" data-handle="cover-group" data-id="{$group['group_id']}"></i>
                            </div>
                        </div>

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
                    <img {if $group['group_picture_id']} class="js_lightbox" data-id="{$group['group_picture_id']}" data-context="album" data-image="{$group['group_picture_full']}" {elseif !$group['group_picture_default']} class="js_lightbox-nodata" data-image="{$group['group_picture']}" {/if}  src="{$group['group_picture']}" alt="{$group['group_title']}">
                    
                    {if $group['i_admin']}
                        <!-- buttons -->
                        <div class="profile-avatar-change">
                            <i class="fa fa-camera js_x-uploader" data-handle="picture-group" data-id="{$group['group_id']}"></i>
                        </div>
                        <div class="profile-avatar-crop {if $group['group_picture_default']}x-hidden{/if}">
                            <i class="fa fa-crop-alt js_init-crop-picture" data-image="{$group['group_picture_full']}" data-handle="group" data-id="{$group['group_id']}"></i>
                        </div>
                        <div class="profile-avatar-delete {if $group['group_picture_default']}x-hidden{/if}">
                            <i class="fa fa-trash js_delete-picture" data-handle="picture-group"></i>
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
                    <a href="{$system['system_url']}/groups/{$group['group_name']}">{$group['group_title']}</a>
                    {if $group['group_privacy'] == "public"}
                        <i data-toggle="tooltip" data-placement="top" title='{__("Public Group")}' class="fa fa-globe fa-fw privacy-badge"></i>
                    {elseif $group['group_privacy'] == "closed"}
                        <i data-toggle="tooltip" data-placement="top" title='{__("Closed Group")}' class="fa fa-unlock-alt fa-fw privacy-badge"></i>
                    {elseif $group['group_privacy'] == "secret"}
                        <i data-toggle="tooltip" data-placement="top" title='{__("Secret Group")}' class="fa fa-lock fa-fw privacy-badge"></i>
                    {/if}
                </div>
                <!-- profile-name -->

                <!-- profile-buttons -->
                <div class="profile-buttons-wrapper">
                    {if $group['i_joined'] == "approved"}
                        <button type="button" class="btn btn-sm btn-success btn-delete js_leave-group" data-id="{$group['group_id']}" data-privacy="{$group['group_privacy']}">
                            <i class="fa fa-check mr5"></i>{__("Joined")}
                        </button>
                    {elseif $group['i_joined'] == "pending"}
                        <button type="button" class="btn btn-sm btn-warning js_leave-group" data-id="{$group['group_id']}" data-privacy="{$group['group_privacy']}">
                            <i class="fa fa-clock mr5"></i>{__("Pending")}
                        </button>
                    {else}
                        <button type="button" class="btn btn-sm btn-success js_join-group" data-id="{$group['group_id']}" data-privacy="{if $group['i_admin']}public{else}{$group['group_privacy']}{/if}">
                            <i class="fa fa-user-plus mr5"></i>{__("Join")}
                        </button>
                    {/if}
                    
                    {if !$group['i_admin']}
                        <!-- report -->
                        <div class="d-inline-block dropdown ml5">
                            <button type="button" class="btn btn-icon btn-rounded btn-light" data-toggle="dropdown" data-display="static">
                                <i class="fa fa-ellipsis-v fa-fw"></i>
                            </button>
                            <div class="dropdown-menu dropdown-menu-right">
                                <!-- report -->
                                <div class="dropdown-item pointer js_report" data-handle="group" data-id="{$group['group_id']}">
                                    <i class="fa fa-flag fa-fw mr10"></i>{__("Report")}
                                </div>
                                <!-- report -->
                                <!-- manage -->
                                {if $user->_is_admin}
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item" href="{$system['system_url']}/admincp/groups/edit_group/{$group['group_id']}">
                                        <i class="fa fa-cog fa-fw mr10"></i>{__("Edit in Admin Panel")}
                                    </a>
                                {elseif $user->_is_moderator}
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item" href="{$system['system_url']}/modcp/groups/edit_group/{$group['group_id']}">
                                        <i class="fa fa-cog fa-fw mr10"></i>{__("Edit in Moderator Panel")}
                                    </a>
                                {/if}
                                <!-- manage -->
                            </div>
                        </div>
                        <!-- report -->
                    {/if}
                </div>
                <!-- profile-buttons -->

                <!-- profile-tabs -->
                <div class="profile-tabs-wrapper narrow custom-scrollbar">
                    <ul>
                        {if $group['group_privacy'] == "closed" && $group['i_joined'] != "approved" && !$group['i_admin']}
                            <li>
                                <a href="{$system['system_url']}/groups/{$group['group_name']}">
                                    <i class="fa fa-info-circle fa-fw mr5"></i>{__("About")}
                                </a>
                            </li>
                        {else}
                            <li>
                                <a href="{$system['system_url']}/groups/{$group['group_name']}" {if $view == ""}class="active"{/if}>
                                    <i class="fa fa-newspaper fa-fw mr5"></i>{__("Timeline")}
                                </a>
                            </li>
                            <li>
                                <a href="{$system['system_url']}/groups/{$group['group_name']}/photos" {if $view == "photos" || $view == "albums" || $view == "album"}class="active"{/if}>
                                    <i class="fa fa-images fa-fw mr5"></i>{__("Photos")}
                                </a>
                            </li>
                            <li>
                                <a href="{$system['system_url']}/groups/{$group['group_name']}/videos" {if $view == "videos"}class="active"{/if}>
                                    <i class="fa fa-video fa-fw mr5"></i>{__("Videos")}
                                </a>
                            </li>
                            {if !$group['i_admin']}
                                <li>
                                    <a href="{$system['system_url']}/groups/{$group['group_name']}/members" {if $view == "members" || $view == "invites"}class="active"{/if}>
                                        <i class="fa fa-users fa-fw mr5"></i>{__("Members")}
                                    </a>
                                </li>
                            {else}
                                <li>
                                    <a href="{$system['system_url']}/groups/{$group['group_name']}/settings" {if $view == "settings"}class="active"{/if}>
                                        <i class="fa fa-cog"></i> {__("Settings")}
                                    </a>
                                </li>
                            {/if}
                        {/if}
                    </ul>
                </div>
                <!-- profile-tabs -->
            </div>
            <!-- profile-header -->

            <!-- profile-content -->
            <div class="row">
                <!-- view content -->
                {if $view == ""}

                    <!-- right panel -->
                    <div class="order-1 col-lg-4 order-lg-2">
                        <!-- panel [about] -->
                        <div class="card">
                            <div class="card-body">
                                {if !is_empty($group['group_description'])}
                                    <div class="about-bio">
                                        <div class="js_readmore overflow-hidden">
                                            {$group['group_description']}
                                        </div>
                                    </div>
                                {/if}
                                <ul class="about-list">
                                    <!-- privacy -->
                                    <li>
                                        <div class="about-list-item">
                                            {if $group['group_privacy'] == "public"}
                                                <i class="fa fa-globe fa-fw fa-lg"></i>
                                                {__("Public Group")}
                                            {elseif $group['group_privacy'] == "closed"}
                                                <i class="fa fa-unlock-alt fa-fw fa-lg"></i>
                                                {__("Closed Group")}
                                            {elseif $group['group_privacy'] == "secret"}
                                                <i class="fa fa-lock fa-fw fa-lg"></i>
                                                {__("Secret Group")}
                                            {/if}
                                        </div>
                                    </li>
                                    <!-- privacy -->
                                    <!-- members -->
                                    <li>
                                        <div class="about-list-item">
                                            <i class="fa fa-users fa-fw fa-lg"></i>
                                            <a href="{$system['system_url']}/groups/{$group['group_name']}/members">{$group['group_members']} {__("members")}</a>
                                        </div>
                                    </li>
                                    <!-- members -->
                                    <!-- category -->
                                    <li>
                                        <div class="about-list-item">
                                            <i class="fa fa-tag fa-fw fa-lg"></i>
                                            {__($group['group_category_name'])}
                                        </div>
                                    </li>
                                    <!-- category -->
                                </ul>
                            </div>
                        </div>
                        <!-- panel [about] -->

                        <!-- custom fields [basic] -->
                        {if $custom_fields['basic']}
                            <div class="card">
                                <div class="card-header bg-transparent">
                                    <i class="fa fa-info-circle mr5"></i>
                                    <strong>{__("Info")}</strong>
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
                        <!-- custom fields [basic] -->

                        <!-- invite friends -->
                        {if $group['i_joined'] == "approved" && $group['invites']}
                            <div class="card">
                                <div class="card-header bg-transparent">
                                    <div class="float-right">
                                        <small><a href="{$system['system_url']}/groups/{$group['group_name']}/invites">{__("See All")}</a></small>
                                    </div>
                                    <i class="fa fa-user-tag mr5"></i>
                                    <strong><a href="{$system['system_url']}/groups/{$group['group_name']}/invites">{__("Invite Friends")}</a></strong>
                                </div>
                                <div class="card-body">
                                    <ul>
                                        {foreach $group['invites'] as $_user}
                                        {include file='__feeds_user.tpl' _tpl="list" _connection=$_user["connection"] _small=true}
                                        {/foreach}
                                    </ul>
                                </div>
                            </div>
                        {/if}
                        <!-- invite friends -->

                        <!-- photos -->
                        {if $group['photos']}
                            <div class="card panel-photos">
                                <div class="card-header bg-transparent">
                                    <i class="fa fa-images mr5"></i>
                                    <strong><a href="{$system['system_url']}/groups/{$group['group_name']}/photos">{__("Photos")}</a></strong>
                                </div>
                                <div class="card-body ptb10 plr10">
                                    <div class="row no-gutters">
                                        {foreach $group['photos'] as $photo}
                                            {include file='__feeds_photo.tpl' _context="photos" _small=true}
                                        {/foreach}
                                    </div>
                                </div>
                            </div>
                        {/if}
                        <!-- photos -->
                    </div>
                    <!-- right panel -->

                    <!-- left panel -->
                    <div class="order-2 col-lg-8 order-lg-1">
                        <!-- super admin alert -->
                        {if $user->_data['user_group'] < 3 && ($group['group_privacy'] == "secret" || $group['group_privacy'] == "closed") && ($group['i_joined'] != "approved" && !$group['i_admin']) }
                            <div class="alert alert-warning">
                                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span>&times;</span></button>
                                <div class="icon"><i class="fa fa-info-circle fa-2x"></i></div>
                                <div class="text align-middle">
                                    {__("You can access this as your account is system admin account!")}
                                </div>
                            </div>
                        {/if}
                        <!-- super admin alert -->

                        {if $get == "posts_group"}
                            <!-- group requests -->
                            {if $group['i_admin'] && $group['total_requests'] > 0}
                                <div class="alert alert-info">
                                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span>&times;</span></button>
                                    <div class="icon"><i class="fa fa-users fa-lg"></i></div>
                                    <div class="text align-middle">
                                        <a href="{$system['system_url']}/groups/{$group['group_name']}/settings/requests" class="alert-link">
                                            <span class="badge badge-light mr5">{$group['total_requests']}</span>{if $group['total_requests'] == 1}{__("person")}{else}{__("persons")}{/if} {__("wants to join this group")}
                                        </a>
                                    </div>
                                </div>
                            {/if}
                            <!-- group requests -->

                            <!-- group pending posts -->
                            {if $group['pending_posts'] > 0}
                                <div class="alert alert-info">
                                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span>&times;</span></button>
                                    <div class="icon"><i class="fa fa-comments fa-lg"></i></div>
                                    <div class="text align-middle">
                                        <a href="?pending" class="alert-link">
                                            {if $group['i_admin']}
                                                <span class="badge badge-light mr5">{$group['pending_posts']}</span>{if $group['pending_posts'] == 1}{__("post")}{else}{__("posts")}{/if} {__("pending needs your approval")}
                                            {else}
                                                {__("You have")}<span class="badge badge-light mlr5">{$group['pending_posts']}</span>{if $group['pending_posts'] == 1}{__("post")}{else}{__("posts")}{/if} {__("pending")}
                                            {/if}
                                        </a>
                                    </div>
                                </div>
                            {/if}
                            <!-- group pending posts -->

                            <!-- publisher -->
                            {if $group['i_joined'] == "approved" && ($group['group_publish_enabled'] OR (!$group['group_publish_enabled'] && $group['i_admin']))}
                                {include file='_publisher.tpl' _handle="group" _id=$group['group_id']}
                            {/if}
                            <!-- publisher -->

                            <!-- pinned post -->
                            {if $pinned_post}
                                {include file='_pinned_post.tpl' post=$pinned_post _get="posts_group"}
                            {/if}
                            <!-- pinned post -->

                            <!-- posts -->
                            {include file='_posts.tpl' _get="posts_group" _id=$group['group_id']}
                            <!-- posts -->
                        {else}
                            <!-- posts -->
                            {include file='_posts.tpl' _get=$get _id=$group['group_id'] _title=__("Pending Posts")}
                            <!-- posts -->
                        {/if}
                    </div>
                    <!-- left panel -->
                
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
                                        <a class="nav-link active" href="{$system['system_url']}/groups/{$group['group_name']}/photos">{__("Photos")}</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="{$system['system_url']}/groups/{$group['group_name']}/albums">{__("Albums")}</a>
                                    </li>
                                </ul>
                                <!-- panel nav -->
                            </div>
                            <div class="card-body">
                                {if $group['photos']}
                                    <ul class="row no-gutters">
                                        {foreach $group['photos'] as $photo}
                                            {include file='__feeds_photo.tpl' _context="photos"}
                                        {/foreach}
                                    </ul>
                                    <!-- see-more -->
                                    <div class="alert alert-info see-more js_see-more" data-get="photos" data-id="{$group['group_id']}" data-type='group'>
                                        <span>{__("See More")}</span>
                                        <div class="loader loader_small x-hidden"></div>
                                    </div>
                                    <!-- see-more -->
                                {else}
                                    <p class="text-center text-muted mt10">
                                        {$group['group_title']} {__("doesn't have photos")}
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
                                        <a class="nav-link" href="{$system['system_url']}/groups/{$group['group_name']}/photos">{__("Photos")}</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link active" href="{$system['system_url']}/groups/{$group['group_name']}/albums">{__("Albums")}</a>
                                    </li>
                                </ul>
                                <!-- panel nav -->
                            </div>
                            <div class="card-body">
                                {if $group['albums']}
                                    <ul class="row">
                                        {foreach $group['albums'] as $album}
                                        {include file='__feeds_album.tpl'}
                                        {/foreach}
                                    </ul>
                                    {if count($group['albums']) >= $system['max_results_even']}
                                        <!-- see-more -->
                                        <div class="alert alert-info see-more js_see-more" data-get="albums" data-id="{$group['group_id']}" data-type='group'>
                                            <span>{__("See More")}</span>
                                            <div class="loader loader_small x-hidden"></div>
                                        </div>
                                        <!-- see-more -->
                                    {/if}
                                {else}
                                    <p class="text-center text-muted mt10">
                                        {$group['group_title']} {__("doesn't have albums")}
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
                                    <a href="{$system['system_url']}/groups/{$group['group_name']}/albums" class="btn btn-sm btn-light">
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
                                        <a class="nav-link" href="{$system['system_url']}/groups/{$group['group_name']}/photos">{__("Photos")}</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link active" href="{$system['system_url']}/groups/{$group['group_name']}/albums">{__("Albums")}</a>
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
                                {if $group['videos']}
                                    <ul class="row no-gutters">
                                        {foreach $group['videos'] as $video}
                                            {include file='__feeds_video.tpl'}
                                        {/foreach}
                                    </ul>
                                    <!-- see-more -->
                                    <div class="alert alert-info see-more js_see-more" data-get="videos" data-id="{$group['group_id']}" data-type='group'>
                                        <span>{__("See More")}</span>
                                        <div class="loader loader_small x-hidden"></div>
                                    </div>
                                    <!-- see-more -->
                                {else}
                                    <p class="text-center text-muted mt10">
                                        {$group['group_title']} {__("doesn't have videos")}
                                    </p>
                                {/if}
                            </div>
                        </div>
                    </div>
                    <!-- videos -->
                
                {elseif $view == "members"}
                    <!-- members -->
                    <div class="col-12">
                        <div class="card">
                            <div class="card-header with-icon with-nav">
                                <!-- panel title -->
                                <div class="mb20">
                                    <i class="fa fa-users mr10"></i>{__("Members")}
                                </div>
                                <!-- panel title -->

                                <!-- panel nav -->
                                <ul class="nav nav-tabs">
                                    <li class="nav-item">
                                        <a class="nav-link active" href="{$system['system_url']}/groups/{$group['group_name']}/members">
                                            {__("Members")}
                                            <span class="badge badge-pill badge-info">{$group['group_members']}</span>
                                        </a>
                                    </li>
                                    {if $group['i_joined'] == "approved"}
                                        <li class="nav-item">
                                            <a class="nav-link" href="{$system['system_url']}/groups/{$group['group_name']}/invites">
                                                {__("Invites")}
                                            </a>
                                        </li>
                                    {/if}
                                </ul>
                                <!-- panel nav -->
                            </div>
                            <div class="card-body">
                                {if $group['group_members'] > 0}
                                    <ul class="row">
                                        {foreach $group['members'] as $_user}
                                        {include file='__feeds_user.tpl' _tpl="box" _connection=$_user["connection"]}
                                        {/foreach}
                                    </ul>

                                    {if $group['group_members'] >= $system['max_results_even']}
                                        <!-- see-more -->
                                        <div class="alert alert-info see-more js_see-more" data-get="group_members" data-id="{$group['group_id']}">
                                            <span>{__("See More")}</span>
                                            <div class="loader loader_small x-hidden"></div>
                                        </div>
                                        <!-- see-more -->
                                    {/if}
                                {else}
                                    <p class="text-center text-muted mt10">
                                        {$group['group_title']} {__("doesn't have members")}
                                    </p>
                                {/if}
                            </div>
                        </div>
                    </div>
                    <!-- members -->
                
                {elseif $view == "invites"}
                    <!-- invites -->
                    <div class="col-12">
                        <div class="card">
                            <div class="card-header with-icon with-nav">
                                <!-- panel title -->
                                <div class="mb20">
                                    <i class="fa fa-users mr10"></i>{__("Members")}
                                </div>
                                <!-- panel title -->

                                <!-- panel nav -->
                                <ul class="nav nav-tabs">
                                    <li class="nav-item">
                                        <a class="nav-link" href="{$system['system_url']}/groups/{$group['group_name']}/members">
                                            {__("Members")}
                                            <span class="badge badge-pill badge-info">{$group['group_members']}</span>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link active" href="{$system['system_url']}/groups/{$group['group_name']}/invites">
                                            {__("Invites")}
                                        </a>
                                    </li>
                                </ul>
                                <!-- panel nav -->
                            </div>
                            <div class="card-body">
                                {if $group['invites']}
                                    <ul class="row">
                                        {foreach $group['invites'] as $_user}
                                        {include file='__feeds_user.tpl' _tpl="box" _connection=$_user["connection"]}
                                        {/foreach}
                                    </ul>

                                    {if count($group['invites']) >= $system['max_results_even']}
                                        <!-- see-more -->
                                        <div class="alert alert-info see-more js_see-more" data-get="group_invites" data-id="{$group['group_id']}">
                                            <span>{__("See More")}</span>
                                            <div class="loader loader_small x-hidden"></div>
                                        </div>
                                        <!-- see-more -->
                                    {/if}
                                {else}
                                    <p class="text-center text-muted mt10">
                                        {__("No friends to invite")}
                                    </p>
                                {/if}
                            </div>
                        </div>
                    </div>
                    <!-- invites -->
                
                {elseif $view == "settings"}
                    <div class="col-lg-3">
                        <div class="card">
                            <div class="card-body with-nav">
                                <ul class="side-nav">
                                    <li {if $sub_view == ""}class="active"{/if}>
                                        <a href="{$system['system_url']}/groups/{$group['group_name']}/settings"><i class="fa fa-cog fa-fw mr5"></i>{__("Group Settings")}</a>
                                    </li>
                                    {if $group['group_privacy'] != "public"}
                                        <li {if $sub_view == "requests"}class="active"{/if}>
                                            <a href="{$system['system_url']}/groups/{$group['group_name']}/settings/requests"><i class="fa fa-user-plus fa-fw mr5"></i>{__("Join Requests")}</a>
                                        </li>
                                    {/if}
                                    <li {if $sub_view == "members"}class="active"{/if}>
                                        <a href="{$system['system_url']}/groups/{$group['group_name']}/settings/members"><i class="fa fa-users fa-fw mr5"></i>{__("Members")}</a>
                                    </li>
                                    {if $user->_data['user_id'] == $group['group_admin']}
                                        <li {if $sub_view == "delete"}class="active"{/if}>
                                            <a href="{$system['system_url']}/groups/{$group['group_name']}/settings/delete"><i class="fa fa-trash fa-fw mr5"></i>{__("Delete Group")}</a>
                                        </li>
                                    {/if}
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-9">
                        <!-- edit -->
                        <div class="card">
                            {if $sub_view == ""}
                                <div class="card-header with-icon">
                                    <i class="fa fa-cog mr10"></i>{__("Group Settings")}
                                </div>
                                <form class="js_ajax-forms" data-url="pages_groups_events/create.php?type=group&do=edit&id={$group['group_id']}">
                                    <div class="card-body">
                                        <div class="form-group">
                                            <label class="form-control-label" for="title">{__("Name Your Group")}</label>
                                            <input type="text" class="form-control" name="title" id="title" placeholder='{__("Name of your group")}' value="{$group['group_title']}">
                                        </div>
                                        <div class="form-group">
                                            <label class="form-control-label" for="username">{__("Web Address")}</label>
                                            <div class="input-group">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text d-none d-sm-block">{$system['system_url']}/groups/</span>
                                                </div>
                                                <input type="text" class="form-control" name="username" id="username" value="{$group['group_name']}">
                                            </div>
                                            <span class="form-text">
                                                {__("Can only contain alphanumeric characters (A–Z, 0–9) and periods ('.')")}
                                            </span>
                                        </div>
                                        <div class="form-group">
                                            <label class="form-control-label" for="privacy">{__("Select Privacy")}</label>
                                            <select class="form-control selectpicker" name="privacy">
                                                <option {if $group['group_privacy'] == "public"}selected{/if} value="public" data-content="<div class='option'><div class='icon'><i class='fa fa-globe fa-2x'></i></div><div class='text'><b>{__("Public Group")}</b><br>{__("Anyone can see the group, its members and their posts")}.
                                                </div></div>">{__("Public Group")}</option>
                                                <option {if $group['group_privacy'] == "closed"}selected{/if} value="closed" data-content="<div class='option'><div class='icon'><i class='fa fa-unlock-alt fa-2x'></i></div><div class='text'><b>{__("Closed Group")}</b><br>{__("Only members can see posts")}.
                                                </div></div>">{__("Closed Group")}</option>
                                                <option {if $group['group_privacy'] == "secret"}selected{/if} value="secret" data-content="<div class='option'><div class='icon'><i class='fa fa-lock fa-2x'></i></div><div class='text'><b>{__("Secret Group")}</b><br>{__("Only members can find the group and see posts")}.
                                                </div></div>">{__("Secret Group")}</option>
                                            </select>
                                            <span class="form-text">
                                                ({__("Note: Change group privacy to public will approve any pending join requests")})
                                            </span>
                                        </div>
                                        <div class="form-group">
                                            <label class="form-control-label" for="title">{__("Category")}</label>
                                            <select class="form-control" name="category" id="category">
                                                {foreach $categories as $category}
                                                    <option {if $group['group_category'] == $category['category_id']}selected{/if} value="{$category['category_id']}">{__($category['category_name'])}</option>
                                                {/foreach}
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label class="form-control-label" for="description">{__("About")}</label>
                                            <textarea class="form-control" name="description" id="description">{$group['group_description']}</textarea>
                                        </div>
                                        <!-- custom fields -->
                                        {if $custom_fields['basic']}
                                        {include file='__custom_fields.tpl' _custom_fields=$custom_fields['basic'] _registration=false}
                                        {/if}
                                        <!-- custom fields -->

                                        <div class="divider"></div>

                                        <div class="form-table-row">
                                            <div>
                                                <div class="form-control-label h6">{__("Members Can Publish Posts?")}</div>
                                                <div class="form-text d-none d-sm-block">{__("Members can publish posts or only group admins")}</div>
                                            </div>
                                            <div class="text-right">
                                                <label class="switch" for="group_publish_enabled">
                                                    <input type="checkbox" name="group_publish_enabled" id="group_publish_enabled" {if $group['group_publish_enabled']}checked{/if}>
                                                    <span class="slider round"></span>
                                                </label>
                                            </div>
                                        </div>

                                        <div class="form-table-row">
                                            <div>
                                                <div class="form-control-label h6">{__("Post Approval")}</div>
                                                <div class="form-text d-none d-sm-block">
                                                    {__("All posts must be approved by a group admin")}<br>
                                                    ({__("Note: Disable it will approve any pending posts")})
                                                </div>
                                            </div>
                                            <div class="text-right">
                                                <label class="switch" for="group_publish_approval_enabled">
                                                    <input type="checkbox" name="group_publish_approval_enabled" id="group_publish_approval_enabled" {if $group['group_publish_approval_enabled']}checked{/if}>
                                                    <span class="slider round"></span>
                                                </label>
                                            </div>
                                        </div>

                                        <!-- error -->
                                        <div class="alert alert-danger mb0 x-hidden"></div>
                                        <!-- error -->
                                    </div>
                                    <div class="card-footer text-right">
                                        <button type="submit" class="btn btn-primary">{__("Save Changes")}</button>
                                    </div>
                                </form>
                            {elseif $sub_view == "requests"}
                                <div class="card-header with-icon">
                                    <i class="fa fa-user-plus mr10"></i>{__("Member Requests")}
                                </div>
                                <div class="card-body">
                                    {if $group['requests']}
                                        <ul>
                                            {foreach $group['requests'] as $_user}
                                            {include file='__feeds_user.tpl' _tpl="list" _connection=$_user["connection"]}
                                            {/foreach}
                                        </ul>

                                        {if count($group['requests']) >= $system['max_results']}
                                            <!-- see-more -->
                                            <div class="alert alert-info see-more js_see-more" data-get="group_requests" data-id="{$group['group_id']}">
                                                <span>{__("See More")}</span>
                                                <div class="loader loader_small x-hidden"></div>
                                            </div>
                                            <!-- see-more -->
                                        {/if}
                                    {else}
                                        <p class="text-center text-muted mt10">
                                            {__("No Requests")}
                                        </p>
                                    {/if}
                                </div>
                            {elseif $sub_view == "members"}
                                <div class="card-header with-icon">
                                    <i class="fa fa-users mr10"></i>{__("Members")}
                                </div>
                                <div class="card-body">
                                    <!-- admins -->
                                    <div class="heading-small mb20">
                                        {__("Admins")} <span class="text-muted">({$group['group_admins_count']})</span>
                                    </div>
                                    <div class="pl-md-4">
                                        {if $group['group_admins']}
                                            <ul>
                                                {foreach $group['group_admins'] as $_user}
                                                {include file='__feeds_user.tpl' _tpl="list" _connection=$_user["connection"]}
                                                {/foreach}
                                            </ul>

                                            {if $group['group_admins_count'] >= $system['max_results_even']}
                                                <!-- see-more -->
                                                <div class="alert alert-info see-more js_see-more" data-get="group_admins" data-id="{$group['group_id']}">
                                                    <span>{__("See More")}</span>
                                                    <div class="loader loader_small x-hidden"></div>
                                                </div>
                                                <!-- see-more -->
                                            {/if}
                                        {else}
                                            <p class="text-center text-muted mt10">
                                                {$group['group_title']} {__("doesn't have admins")}
                                            </p>
                                        {/if}
                                    </div>
                                    <!-- admins -->

                                    <div class="divider"></div>

                                    <!-- members -->
                                    <div class="heading-small mb20">
                                        {__("All Members")} <span class="text-muted">({$group['group_members']})</span>
                                    </div>
                                    <div class="pl-md-4">
                                        {if $group['group_members'] > 0}
                                            <ul>
                                                {foreach $group['members'] as $_user}
                                                {include file='__feeds_user.tpl' _tpl="list" _connection=$_user["connection"]}
                                                {/foreach}
                                            </ul>

                                            {if $group['group_members'] >= $system['max_results_even']}
                                                <!-- see-more -->
                                                <div class="alert alert-info see-more js_see-more" data-get="group_members_manage" data-id="{$group['group_id']}">
                                                    <span>{__("See More")}</span>
                                                    <div class="loader loader_small x-hidden"></div>
                                                </div>
                                                <!-- see-more -->
                                            {/if}
                                        {else}
                                            <p class="text-center text-muted mt10">
                                                {$group['group_title']} {__("doesn't have members")}
                                            </p>
                                        {/if}
                                    </div>
                                    <!-- members -->
                                </div>
                            {elseif $sub_view == "delete"}
                                <div class="card-header with-icon">
                                    <i class="fa fa-trash mr10"></i>{__("Delete Group")}
                                </div>
                                <div class="card-body">
                                    <div class="alert alert-warning">
                                        <div class="icon">
                                            <i class="fa fa-exclamation-triangle fa-2x"></i>
                                        </div>
                                        <div class="text pt5">
                                            {__("Once you delete your group you will no longer can access it again")}
                                        </div>
                                    </div>

                                    <div class="text-center">
                                        <button class="btn btn-danger js_delete-group" data-id="{$group['group_id']}">
                                            <i class="fa fa-trash mr10"></i>{__("Delete Group")}
                                        </button>
                                    </div>
                                </div>
                            {/if}
                        </div>
                        <!-- edit -->
                    </div>
                
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