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
            <div class="profile-header no-avatar">
                <!-- profile-cover -->
                <div class="profile-cover-wrapper">
                    {if $event['event_cover_id']}
                        <!-- full-cover -->
                        <img class="js_position-cover-full x-hidden" src="{$event['event_cover_full']}">
                        <!-- full-cover -->
                        
                        <!-- cropped-cover -->
                        <img class="js_position-cover-cropped js_lightbox" data-init-position="{$event['event_cover_position']}" data-id="{$event['event_cover_id']}" data-image="{$event['event_cover_full']}" data-context="album" src="{$event['event_cover']}" alt="{$event['event_title']}">
                        <!-- cropped-cover -->
                    {/if}
                    
                    {if $event['i_admin']}
                        <!-- buttons -->
                        <div class="profile-cover-buttons">
                            <div class="profile-cover-change">
                                <i class="fa fa-camera js_x-uploader" data-handle="cover-event" data-id="{$event['event_id']}"></i>
                            </div>
                            <div class="profile-cover-position {if !$event['event_cover']}x-hidden{/if}">
                                <input class="js_position-picture-val" type="hidden" name="position-picture-val">
                                <i class="fa fa-crop-alt js_init-position-picture" data-handle="event" data-id="{$event['event_id']}"></i>
                            </div>
                            <div class="profile-cover-position-buttons">
                                <i class="fa fa-check fa-fw js_save-position-picture"></i>
                            </div>
                            <div class="profile-cover-position-buttons">
                                <i class="fa fa-times fa-fw js_cancel-position-picture"></i>
                            </div>
                            <div class="profile-cover-delete {if !$event['event_cover']}x-hidden{/if}">
                                <i class="fa fa-trash js_delete-cover" data-handle="cover-event" data-id="{$event['event_id']}"></i>
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

                <!-- profile-date -->
                <div class="profle-date-wrapper">
                    {$event['event_start_date']|date_format:"%b"}<br>{$event['event_start_date']|date_format:"%e"}
                </div>
                <!-- profile-date -->

                <!-- profile-name -->
                <div class="profile-name-wrapper">
                    <a href="{$system['system_url']}/events/{$event['event_id']}">{$event['event_title']}</a>
                    {if $event['event_privacy'] == "public"}
                        <i data-toggle="tooltip" data-placement="top" title='{__("Public Event")}' class="fa fa-globe fa-fw privacy-badge"></i>
                    {elseif $event['event_privacy'] == "closed"}
                        <i data-toggle="tooltip" data-placement="top" title='{__("Closed Event")}' class="fa fa-unlock-alt fa-fw privacy-badge"></i>
                    {elseif $event['event_privacy'] == "secret"}
                        <i data-toggle="tooltip" data-placement="top" title='{__("Secret Event")}' class="fa fa-lock fa-fw privacy-badge"></i>
                    {/if}
                </div>
                <!-- profile-name -->

                <!-- profile-meta -->
                <div class="profle-meta-wrapper">
                    <i class="fa fa-clock"></i> {$event['event_start_date']|date_format:"%I:%M %p"} - {$event['event_end_date']|date_format:"%b %e %I:%M %p"}
                </div>
                <!-- profile-meta -->

                <!-- profile-buttons -->
                <div class="profile-buttons-wrapper">
                    {if $event['event_privacy'] == "public" || $event['i_joined'] || $event['i_admin']}
                        {if $event['i_joined']['is_going']}
                            <button type="button" class="btn btn-sm btn-success js_ungo-event" data-id="{$event['event_id']}">
                                <i class="fa fa-check mr5"></i>{__("Going")}
                            </button>
                        {else}
                            <button type="button" class="btn btn-sm btn-success js_go-event" data-id="{$event['event_id']}">
                                <i class="fa fa-calendar-check mr5"></i>{__("Going")}
                            </button>
                        {/if}
                        {if $event['i_joined']['is_interested']}
                            <button type="button" class="btn btn-sm btn-primary js_uninterest-event" data-id="{$event['event_id']}">
                                <i class="fa fa-check mr5"></i>{__("Interested")}
                            </button>
                        {else}
                            <button type="button" class="btn btn-sm btn-primary js_interest-event" data-id="{$event['event_id']}">
                                <i class="fa fa-star mr5"></i>{__("Interested")}
                            </button>
                        {/if}
                    {/if}

                    {if !$event['i_admin']}
                        <!-- report -->
                        <div class="d-inline-block dropdown ml5">
                            <button type="button" class="btn btn-icon btn-rounded btn-light" data-toggle="dropdown" data-display="static">
                                <i class="fa fa-ellipsis-v fa-fw"></i>
                            </button>
                            <div class="dropdown-menu dropdown-menu-right">
                                <!-- report -->
                                <div class="dropdown-item pointer js_report" data-handle="event" data-id="{$event['event_id']}">
                                    <i class="fa fa-flag fa-fw mr10"></i>{__("Report")}
                                </div>
                                <!-- report -->
                                <!-- manage -->
                                {if $user->_is_admin}
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item" href="{$system['system_url']}/admincp/events/edit_event/{$event['event_id']}">
                                        <i class="fa fa-cog fa-fw mr10"></i>{__("Edit in Admin Panel")}
                                    </a>
                                {elseif $user->_is_moderator}
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item" href="{$system['system_url']}/modcp/events/edit_event/{$event['event_id']}">
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
                <div class="profile-tabs-wrapper custom-scrollbar">
                    <ul>
                        {if $event['event_privacy'] == "public" || $event['i_joined'] || $event['i_admin']}
                            <li>
                                <a href="{$system['system_url']}/events/{$event['event_id']}" {if $view == ""}class="active"{/if}>
                                    <i class="fa fa-newspaper fa-fw mr5"></i>{__("Timeline")}
                                </a>
                            </li>
                            <li>
                                <a href="{$system['system_url']}/events/{$event['event_id']}/photos" {if $view == "photos" || $view == "albums" || $view == "album"}class="active"{/if}>
                                    <i class="fa fa-images fa-fw mr5"></i>{__("Photos")}
                                </a>
                            </li>
                            <li>
                                <a href="{$system['system_url']}/events/{$event['event_id']}/videos" {if $view == "videos"}class="active"{/if}>
                                    <i class="fa fa-video fa-fw mr5"></i>{__("Videos")}
                                </a>
                            </li>
                            <li>
                                <a href="{$system['system_url']}/events/{$event['event_id']}/going" {if $view == "going" || $view == "interested" || $view == "invited" || $view == "invites"}class="active"{/if}>
                                    <i class="fa fa-users fa-fw mr5"></i>{__("Members")}
                                </a>
                            </li>
                            {if $event['i_admin']}
                                <li>
                                    <a href="{$system['system_url']}/events/{$event['event_id']}/settings" {if $view == "settings"}class="active"{/if}>
                                        <i class="fa fa-cog fa-fw mr5"></i>{__("Settings")}
                                    </a>
                                </li>
                            {/if}
                        {else}
                            <li>
                                <a href="{$system['system_url']}/events/{$event['event_id']}" {if $view == "about"}class="active"{/if}>
                                    <i class="fa fa-info-circle fa-fw mr5"></i>{__("About")}
                                </a>
                            </li>
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
                                {if !is_empty($event['event_description'])}
                                    <div class="about-bio">
                                        <div class="js_readmore overflow-hidden">
                                            {$event['event_description']}
                                        </div>
                                    </div>
                                {/if}
                                <ul class="about-list">
                                    <li>
                                        <div class="about-list-item">
                                            {if $event['event_privacy'] == "public"}
                                                <i class="fa fa-globe fa-fw fa-lg"></i>
                                                {__("Public Event")}
                                            {elseif $event['event_privacy'] == "closed"}
                                                <i class="fa fa-unlock-alt fa-fw fa-lg"></i>
                                                {__("Closed Event")}
                                            {elseif $event['event_privacy'] == "secret"}
                                                <i class="fa fa-lock fa-fw fa-lg"></i>
                                                {__("Secret Event")}
                                            {/if}
                                        </div>
                                    </li>
                                    <li>
                                        <div class="about-list-item">
                                            <i class="fa fa-clock fa-fw fa-lg"></i>
                                            {$event['event_start_date']|date_format:"%B %e"} - {$event['event_end_date']|date_format:"%B %e"}<br>
                                            <small class="text-muted">{$event['event_start_date']|date_format:"%b %e %I:%M %p"} {__("to")} {$event['event_end_date']|date_format:"%b %e %I:%M %p"}</small>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="about-list-item">
                                            <i class="fa fa-user fa-fw fa-lg"></i>
                                            {__("Hosted By")} <a target="_blank" href="{$system['system_url']}/{$event['user_name']}">{$event['user_firstname']} {$event['user_lastname']}</a>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="about-list-item">
                                            <i class="fa fa-tag fa-fw fa-lg"></i>
                                            {__($event['event_category_name'])}
                                        </div>
                                    </li>
                                    {if $event['event_location']}
                                        <!-- event location -->
                                        <li>
                                            <div class="about-list-item">
                                                <i class="fa fa-map-marker fa-fw fa-lg"></i>
                                                {$event['event_location']}
                                            </div>
                                        </li>
                                        {if $system['geolocation_enabled']}
                                        <div style="margin-left: -20px; margin-right: -20px;">
                                            <iframe width="100%" frameborder="0" style="border:0;" src="https://www.google.com/maps/embed/v1/place?key={$system['geolocation_key']}&amp;q={$event['event_location']}&amp;language=en"></iframe>
                                        </div>
                                        {/if}
                                        <!-- event location -->
                                    {/if}
                                    <li class="divider mtb10"></li>
                                    <li>
                                        <div class="about-list-item">
                                            <i class="fa fa-calendar-check fa-fw fa-lg"></i>
                                            <a href="{$system['system_url']}/events/{$event['event_id']}/going">{$event['event_going']} {__("Going")}</a>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="about-list-item">
                                            <i class="fa fa-star fa-fw fa-lg"></i>
                                            <a href="{$system['system_url']}/events/{$event['event_id']}/interested">{$event['event_interested']} {__("Interested")}</a>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="about-list-item">
                                            <i class="fa fa-envelope-open fa-fw fa-lg"></i>
                                            <a href="{$system['system_url']}/events/{$event['event_id']}/invited">{$event['event_invited']} {__("Invited")}</a>
                                        </div>
                                    </li>
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
                        {if $event['i_joined'] && $event['invites']}
                            <div class="card">
                                <div class="card-header bg-transparent">
                                    <div class="float-right">
                                        <small><a href="{$system['system_url']}/events/{$event['event_id']}/invites">{__("See All")}</a></small>
                                    </div>
                                    <i class="fa fa-user-tag mr5"></i>
                                    <strong><a href="{$system['system_url']}/events/{$event['event_id']}/invites">{__("Invite Friends")}</a></strong>
                                </div>
                                <div class="card-body">
                                    <ul>
                                        {foreach $event['invites'] as $_user}
                                        {include file='__feeds_user.tpl' _tpl="list" _connection=$_user["connection"] _small=true}
                                        {/foreach}
                                    </ul>
                                </div>
                            </div>
                        {/if}
                        <!-- invite friends -->

                        <!-- photos -->
                        {if $event['photos']}
                            <div class="card panel-photos">
                                <div class="card-header bg-transparent">
                                    <i class="fa fa-images mr5"></i>
                                    <strong><a href="{$system['system_url']}/events/{$event['event_id']}/photos">{__("Photos")}</a></strong>
                                </div>
                                <div class="card-body ptb10 plr10">
                                    <div class="row no-gutters">
                                        {foreach $event['photos'] as $photo}
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
                        {if $user->_data['user_group'] < 3 && ($event['event_privacy'] == "secret" || $event['event_privacy'] == "closed") && (!$event['i_joined'] && !$event['i_admin']) }
                            <div class="alert alert-warning">
                                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span>&times;</span></button>
                                <div class="icon"><i class="fa fa-info-circle fa-2x"></i></div>
                                <div class="text align-middle">
                                    {__("You can access this as your account is system admin account!")}
                                </div>
                            </div>
                        {/if}
                        <!-- super admin alert -->

                        {if $get == "posts_event"}
                            <!-- event pending posts -->
                            {if $event['pending_posts'] > 0}
                                <div class="alert alert-info">
                                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span>&times;</span></button>
                                    <div class="icon"><i class="fa fa-comments fa-lg"></i></div>
                                    <div class="text align-middle">
                                        <a href="?pending" class="alert-link">
                                            {if $event['i_admin']}
                                                <span class="badge badge-light mr5">{$event['pending_posts']}</span>{if $event['pending_posts'] == 1}{__("post")}{else}{__("posts")}{/if} {__("pending needs your approval")}
                                            {else}
                                                {__("You have")}<span class="badge badge-light mlr5">{$event['pending_posts']}</span>{if $event['pending_posts'] == 1}{__("post")}{else}{__("posts")}{/if} {__("pending")}
                                            {/if}
                                        </a>
                                    </div>
                                </div>
                            {/if}
                            <!-- event pending posts -->

                            <!-- publisher -->
                            {if $event['i_joined'] && ($event['event_publish_enabled'] OR (!$group['event_publish_enabled'] && $event['i_admin']))}
                                {include file='_publisher.tpl' _handle="event" _id=$event['event_id']}
                            {/if}
                            <!-- publisher -->

                            <!-- pinned post -->
                            {if $pinned_post}
                                {include file='_pinned_post.tpl' post=$pinned_post _get="posts_event"}
                            {/if}
                            <!-- pinned post -->

                            <!-- posts -->
                            {include file='_posts.tpl' _get="posts_event" _id=$event['event_id']}
                            <!-- posts -->
                        {else}
                            <!-- posts -->
                            {include file='_posts.tpl' _get=$get _id=$event['event_id'] _title=__("Pending Posts")}
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
                                        <a class="nav-link active" href="{$system['system_url']}/events/{$event['event_id']}/photos">{__("Photos")}</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="{$system['system_url']}/events/{$event['event_id']}/albums">{__("Albums")}</a>
                                    </li>
                                </ul>
                                <!-- panel nav -->
                            </div>
                            <div class="card-body">
                                {if $event['photos']}
                                    <ul class="row no-gutters">
                                        {foreach $event['photos'] as $photo}
                                            {include file='__feeds_photo.tpl' _context="photos"}
                                        {/foreach}
                                    </ul>
                                    <!-- see-more -->
                                    <div class="alert alert-info see-more js_see-more" data-get="photos" data-id="{$event['event_id']}" data-type='event'>
                                        <span>{__("See More")}</span>
                                        <div class="loader loader_small x-hidden"></div>
                                    </div>
                                    <!-- see-more -->
                                {else}
                                    <p class="text-center text-muted mt10">
                                        {$event['event_title']} {__("doesn't have photos")}
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
                                        <a class="nav-link" href="{$system['system_url']}/events/{$event['event_id']}/photos">{__("Photos")}</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link active" href="{$system['system_url']}/events/{$event['event_id']}/albums">{__("Albums")}</a>
                                    </li>
                                </ul>
                                <!-- panel nav -->
                            </div>
                            <div class="card-body">
                                {if $event['albums']}
                                    <ul class="row">
                                        {foreach $event['albums'] as $album}
                                        {include file='__feeds_album.tpl'}
                                        {/foreach}
                                    </ul>
                                    {if count($event['albums']) >= $system['max_results_even']}
                                        <!-- see-more -->
                                        <div class="alert alert-info see-more js_see-more" data-get="albums" data-id="{$event['event_id']}" data-type='event'>
                                            <span>{__("See More")}</span>
                                            <div class="loader loader_small x-hidden"></div>
                                        </div>
                                        <!-- see-more -->
                                    {/if}
                                {else}
                                    <p class="text-center text-muted mt10">
                                        {$event['event_title']} {__("doesn't have albums")}
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
                                    <a href="{$system['system_url']}/events/{$event['event_id']}/albums" class="btn btn-sm btn-light">
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
                                        <a class="nav-link" href="{$system['system_url']}/events/{$event['event_id']}/photos">{__("Photos")}</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link active" href="{$system['system_url']}/events/{$event['event_id']}/albums">{__("Albums")}</a>
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
                                {if $event['videos']}
                                    <ul class="row no-gutters">
                                        {foreach $event['videos'] as $video}
                                            {include file='__feeds_video.tpl'}
                                        {/foreach}
                                    </ul>
                                    <!-- see-more -->
                                    <div class="alert alert-info see-more js_see-more" data-get="videos" data-id="{$event['event_id']}" data-type='event'>
                                        <span>{__("See More")}</span>
                                        <div class="loader loader_small x-hidden"></div>
                                    </div>
                                    <!-- see-more -->
                                {else}
                                    <p class="text-center text-muted mt10">
                                        {$event['event_title']} {__("doesn't have videos")}
                                    </p>
                                {/if}
                            </div>
                        </div>
                    </div>
                    <!-- videos -->
                
                {elseif $view == "going" || $view == "interested" || $view == "invited" || $view == "invites"}
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
                                        <a class="nav-link {if $view == "going"}active{/if}" href="{$system['system_url']}/events/{$event['event_id']}/going">
                                            {__("Going")}
                                            <span class="badge badge-pill badge-info">{$event['event_going']}</span>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link {if $view == "interested"}active{/if}" href="{$system['system_url']}/events/{$event['event_id']}/interested">
                                            {__("Interested")}
                                            <span class="badge badge-pill badge-info">{$event['event_interested']}</span>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link {if $view == "invited"}active{/if}" href="{$system['system_url']}/events/{$event['event_id']}/invited">
                                            {__("Invited")}
                                            <span class="badge badge-pill badge-info">{$event['event_invited']}</span>
                                        </a>
                                    </li>
                                    {if $event['i_joined']}
                                        <li class="nav-item">
                                            <a class="nav-link {if $view == "invites"}active{/if}" href="{$system['system_url']}/events/{$event['event_id']}/invites">
                                                {__("Invites")}
                                            </a>
                                        </li>
                                    {/if}
                                </ul>
                                <!-- panel nav -->
                            </div>
                            <div class="card-body">
                                {if $event['total_members'] > 0}
                                    <ul class="row">
                                        {foreach $event['members'] as $_user}
                                        {include file='__feeds_user.tpl' _tpl="box" _connection=$_user["connection"]}
                                        {/foreach}
                                    </ul>

                                    {if $event['total_members'] >= $system['max_results_even']}
                                        <!-- see-more -->
                                        <div class="alert alert-info see-more js_see-more" data-get="event_{$view}" data-id="{$event['event_id']}">
                                            <span>{__("See More")}</span>
                                            <div class="loader loader_small x-hidden"></div>
                                        </div>
                                        <!-- see-more -->
                                    {/if}
                                {else}
                                    <p class="text-center text-muted mt10">
                                        {if $view == "invites"}
                                            {__("No friends to invite")}
                                        {else}
                                            {__("No people available")}
                                        {/if}
                                    </p>
                                {/if}
                            </div>
                        </div>
                    </div>
                    <!-- members -->
                
                {elseif $view == "settings"}
                    <div class="col-lg-3">
                        <div class="card">
                            <div class="card-body with-nav">
                                <ul class="side-nav">
                                    <li {if $sub_view == ""}class="active"{/if}>
                                        <a href="{$system['system_url']}/events/{$event['event_id']}/settings"><i class="fa fa-cog fa-fw mr5"></i>{__("Event Settings")}</a>
                                    </li>
                                    <li {if $sub_view == "delete"}class="active"{/if}>
                                        <a href="{$system['system_url']}/events/{$event['event_id']}/settings/delete"><i class="fa fa-trash fa-fw mr5"></i>{__("Delete Event")}</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-9">
                        <!-- edit -->
                        <div class="card">
                            {if $sub_view == ""}
                                <div class="card-header with-icon">
                                    <i class="fa fa-cog mr10"></i>{__("Event Settings")}
                                </div>
                                <form class="js_ajax-forms" data-url="pages_groups_events/create.php?type=event&do=edit&id={$event['event_id']}">
                                    <div class="card-body">
                                        <div class="form-group">
                                            <label class="form-control-label" for="title">{__("Name Your Event")}</label>
                                            <input type="text" class="form-control" name="title" id="title" value="{$event['event_title']}">
                                        </div>
                                        <div class="form-group">
                                            <label class="form-control-label" for="location">{__("Location")}</label>
                                            <input type="text" class="form-control" name="location" id="location" value="{$event['event_location']}">
                                        </div>
                                        <div class="form-group">
                                            <label class="form-control-label">{__("Start Date")}</label>
                                            <div class="input-group date js_datetimepicker" id="start_date" data-target-input="nearest">
                                                <input type='text' class="form-control datetimepicker-input" data-target="#start_date" name="start_date" value="{get_datetime($event['event_start_date'])}" />
                                                <div class="input-group-append" data-target="#start_date" data-toggle="datetimepicker">
                                                    <span class="input-group-text"><i class="fa fa-calendar"></i></span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="form-control-label">{__("End Date")}</label>
                                            <div class="input-group date js_datetimepicker" id="end_date" data-target-input="nearest">
                                                <input type='text' class="form-control datetimepicker-input" data-target="#end_date" name="end_date" value="{get_datetime($event['event_end_date'])}" />
                                                <div class="input-group-append" data-target="#end_date" data-toggle="datetimepicker">
                                                    <span class="input-group-text"><i class="fa fa-calendar"></i></span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="form-control-label" for="privacy">{__("Select Privacy")}</label>
                                            <select class="form-control selectpicker" name="privacy">
                                                <option {if $event['event_privacy'] == "public"}selected{/if} value="public" data-content="<div class='option'><div class='icon'><i class='fa fa-globe fa-2x'></i></div><div class='text'><b>{__("Public Event")}</b><br>{__("Anyone can see the event, its users and posts")}.
                                                </div></div>">{__("Public Event")}</option>
                                                <option {if $event['event_privacy'] == "closed"}selected{/if} value="closed" data-content="<div class='option'><div class='icon'><i class='fa fa-unlock-alt fa-2x'></i></div><div class='text'><b>{__("Closed Event")}</b><br>{__("Only event users can see posts")}.
                                                </div></div>">{__("Closed Event")}</option>
                                                <option {if $event['event_privacy'] == "secret"}selected{/if} value="secret" data-content="<div class='option'><div class='icon'><i class='fa fa-lock fa-2x'></i></div><div class='text'><b>{__("Secret Event")}</b><br>{__("Only invited users and event users can find the event")}.
                                                </div></div>">{__("Secret Event")}</option>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label class="form-control-label" for="category">{__("Category")}</label>
                                            <select class="form-control" name="category">
                                                {foreach $categories as $category}
                                                    <option {if $event['event_category'] == $category['category_id']}selected{/if} value="{$category['category_id']}">{__($category['category_name'])}</option>
                                                {/foreach}
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label class="form-control-label" for="description">{__("About")}</label>
                                            <textarea class="form-control" name="description">{$event['event_description']}</textarea>
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
                                                <div class="form-text d-none d-sm-block">{__("Members can publish posts or only event admin")}</div>
                                            </div>
                                            <div class="text-right">
                                                <label class="switch" for="event_publish_enabled">
                                                    <input type="checkbox" name="event_publish_enabled" id="event_publish_enabled" {if $event['event_publish_enabled']}checked{/if}>
                                                    <span class="slider round"></span>
                                                </label>
                                            </div>
                                        </div>

                                        <div class="form-table-row">
                                            <div>
                                                <div class="form-control-label h6">{__("Post Approval")}</div>
                                                <div class="form-text d-none d-sm-block">
                                                    {__("All posts must be approved by the event admin")}<br>
                                                    ({__("Note: Disable it will approve any pending posts")})
                                                </div>
                                            </div>
                                            <div class="text-right">
                                                <label class="switch" for="event_publish_approval_enabled">
                                                    <input type="checkbox" name="event_publish_approval_enabled" id="event_publish_approval_enabled" {if $event['event_publish_approval_enabled']}checked{/if}>
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
                            {elseif $sub_view == "delete"}
                                <div class="card-header with-icon">
                                    <i class="fa fa-trash mr10"></i>{__("Delete Event")}
                                </div>
                                <div class="card-body">
                                    <div class="alert alert-warning">
                                        <div class="icon">
                                            <i class="fa fa-exclamation-triangle fa-2x"></i>
                                        </div>
                                        <div class="text pt5">
                                            {__("Once you delete your event you will no longer can access it again")}
                                        </div>
                                    </div>

                                    <div class="text-center">
                                        <button class="btn btn-danger js_delete-event" data-id="{$event['event_id']}">
                                            <i class="fa fa-trash mr10"></i>{__("Delete Event")}
                                        </button>
                                    </div>
                                </div>
                            {/if}
                        </div>
                        <!-- edit -->
                    </div>
                
                {elseif $view == "about"}
                    <!-- info -->
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                                {__("This event is private and you need to be invited to see its info, members and posts")}
                            </div>
                        </div>
                    </div>
                    <!-- info -->
                
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