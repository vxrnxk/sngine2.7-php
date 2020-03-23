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
                    {if $spage['page_cover_id']}
                        <!-- full-cover -->
                        <img class="js_position-cover-full x-hidden" src="{$spage['page_cover_full']}">
                        <!-- full-cover -->
                        
                        <!-- cropped-cover -->
                        <img class="js_position-cover-cropped js_lightbox" data-init-position="{$spage['page_cover_position']}" data-id="{$spage['page_cover_id']}" data-image="{$spage['page_cover_full']}" data-context="album" src="{$spage['page_cover']}" alt="{$spage['page_title']}">
                        <!-- cropped-cover -->
                    {/if}

                    {if $spage['i_admin']}
                        <!-- buttons -->
                        <div class="profile-cover-buttons">
                            <div class="profile-cover-change">
                                <i class="fa fa-camera js_x-uploader" data-handle="cover-page" data-id="{$spage['page_id']}"></i>
                            </div>
                            <div class="profile-cover-position {if !$spage['page_cover']}x-hidden{/if}">
                                <input class="js_position-picture-val" type="hidden" name="position-picture-val">
                                <i class="fa fa-crop-alt js_init-position-picture" data-handle="page" data-id="{$spage['page_id']}"></i>
                            </div>
                            <div class="profile-cover-position-buttons">
                                <i class="fa fa-check fa-fw js_save-position-picture"></i>
                            </div>
                            <div class="profile-cover-position-buttons">
                                <i class="fa fa-times fa-fw js_cancel-position-picture"></i>
                            </div>
                            <div class="profile-cover-delete {if !$spage['page_cover']}x-hidden{/if}">
                                <i class="fa fa-trash js_delete-cover" data-handle="cover-page" data-id="{$spage['page_id']}"></i>
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
                    <img {if !$spage['page_picture_default']} class="js_lightbox" data-id="{$spage['page_picture_id']}" data-image="{$spage['page_picture_full']}" data-context="album" {/if} src="{$spage['page_picture']}" alt="{$spage['page_title']}">
                    
                    {if $spage['i_admin']}
                        <!-- buttons -->
                        <div class="profile-avatar-change">
                            <i class="fa fa-camera js_x-uploader" data-handle="picture-page" data-id="{$spage['page_id']}"></i>
                        </div>
                        <div class="profile-avatar-crop {if $spage['page_picture_default']}x-hidden{/if}">
                            <i class="fa fa-crop-alt js_init-crop-picture" data-image="{$spage['page_picture_full']}" data-handle="page" data-id="{$spage['page_id']}"></i>
                        </div>
                        <div class="profile-avatar-delete {if $spage['page_picture_default']}x-hidden{/if}">
                            <i class="fa fa-trash js_delete-picture" data-handle="picture-page" data-id="{$spage['page_id']}"></i>
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
                    <a href="{$system['system_url']}/pages/{$spage['page_name']}">{$spage['page_title']}</a>
                    {if $spage['page_verified']}
                        <i data-toggle="tooltip" data-placement="top" title='{__("Verified Page")}' class="fa fa-check-circle fa-fw verified-badge"></i>
                    {/if}
                </div>
                <!-- profile-name -->

                <!-- profile-buttons -->
                <div class="profile-buttons-wrapper">
                    <!-- like -->
                    {if $spage['i_like']}
                        <button type="button" class="btn btn-sm btn-primary js_unlike-page" data-id="{$spage['page_id']}">
                            <i class="fa fa-thumbs-up fa-fw mr5"></i>{__("Unlike")}
                        </button>
                    {else}
                        <button type="button" class="btn btn-sm btn-primary js_like-page" data-id="{$spage['page_id']}">
                            <i class="fa fa-thumbs-up mr5"></i>{__("Like")}
                        </button>
                    {/if}
                    <!-- like -->

                    <!-- custom button -->
                    {if $spage['page_action_text'] && $spage['page_action_url']}
                        <a target="_blank" href="{$spage['page_action_url']}" class="btn btn-sm btn-{$spage['page_action_color']}">{$spage['page_action_text']}</a>
                    {/if}
                    <!-- custom button -->
                    
                    {if $spage['i_admin']}
                        {if $system['packages_enabled']}
                            <!-- boost -->
                            {if $user->_data['can_boost_pages']}
                                {if $spage['page_boosted']}
                                    <button type="button" class="btn btn-sm btn-danger js_unboost-page" data-id="{$spage['page_id']}">
                                        <i class="fa fa-bolt mr5"></i>{__("Unboost")}
                                    </button>
                                {else}
                                    <button type="button" class="btn btn-sm btn-danger js_boost-page" data-id="{$spage['page_id']}">
                                        <i class="fa fa-bolt mr5"></i>{__("Boost")}
                                    </button>
                                {/if}
                            {else}
                                <a href="{$system['system_url']}/packages" class="btn btn-sm btn-danger">
                                    <i class="fa fa-bolt mr5"></i>{__("Boost Page")}
                                </a>
                            {/if}
                            <!-- boost -->
                        {/if}
                    {else}
                        <!-- report -->
                        <div class="d-inline-block dropdown ml5">
                            <button type="button" class="btn btn-icon btn-rounded btn-light" data-toggle="dropdown" data-display="static">
                                <i class="fa fa-ellipsis-v fa-fw"></i>
                            </button>
                            <div class="dropdown-menu dropdown-menu-right">
                                <!-- report -->
                                <div class="dropdown-item pointer js_report" data-handle="page" data-id="{$spage['page_id']}">
                                    <i class="fa fa-flag fa-fw mr10"></i>{__("Report")}
                                </div>
                                <!-- report -->
                                <!-- manage -->
                                {if $user->_is_admin}
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item" href="{$system['system_url']}/admincp/pages/edit_page/{$spage['page_id']}">
                                        <i class="fa fa-cog fa-fw mr10"></i>{__("Edit in Admin Panel")}
                                    </a>
                                {elseif $user->_is_moderator}
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item" href="{$system['system_url']}/modcp/pages/edit_page/{$spage['page_id']}">
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
                        <li>
                            <a href="{$system['system_url']}/pages/{$spage['page_name']}" {if $view == ""}class="active"{/if}>
                                <i class="fa fa-newspaper fa-fw mr5"></i>{__("Timeline")}
                            </a>
                        </li>
                        <li>
                            <a href="{$system['system_url']}/pages/{$spage['page_name']}/photos" {if $view == "photos" || $view == "albums" || $view == "album"}class="active"{/if}>
                                <i class="fa fa-images fa-fw mr5"></i>{__("Photos")}
                            </a>
                        </li>
                        <li>
                            <a href="{$system['system_url']}/pages/{$spage['page_name']}/videos" {if $view == "videos"}class="active"{/if}>
                                <i class="fa fa-video fa-fw mr5"></i>{__("Videos")}
                            </a>
                        </li>
                        {if $spage['i_like']}
                            <li>
                                <a href="{$system['system_url']}/pages/{$spage['page_name']}/invites" {if $view == "invites"}class="active"{/if}>
                                    <i class="fa fa-user-tag fa-fw mr5"></i>{__("Invite Friends")}
                                </a>
                            </li>
                        {/if}
                        {if $spage['i_admin']}
                            <li>
                                <a href="{$system['system_url']}/pages/{$spage['page_name']}/settings" {if $view == "settings"}class="active"{/if}>
                                    <i class="fa fa-cog fa-fw mr5"></i>{__("Settings")}
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
                    
                    <!-- left panel -->
                    <div class="order-1 col-lg-3 order-lg-1">
                        <!-- panel [about] -->
                        <div class="card">
                            <div class="card-body">
                                {if !is_empty($spage['page_description'])}
                                    <div class="about-bio">
                                        <div class="js_readmore overflow-hidden">
                                            {$spage['page_description']}
                                        </div>
                                    </div>
                                {/if}
                                <ul class="about-list">
                                    <!-- likes -->
                                    <li>
                                        <div class="about-list-item">
                                            <i class="fa fa-thumbs-up fa-fw fa-lg"></i>
                                            {$spage['page_likes']} {__("people like this")}
                                        </div>
                                    </li>
                                    <!-- likes -->
                                    <!-- category -->
                                    <li>
                                        <div class="about-list-item">
                                            <i class="fa fa-tag fa-fw fa-lg"></i>
                                            {__($spage['page_category_name'])}
                                        </div>
                                    </li>
                                    <!-- category -->
                                    <!-- info -->
                                    {if $spage['page_company']}
                                        <li>
                                            <div class="about-list-item">
                                                <i class="fa fa-briefcase fa-fw fa-lg"></i>
                                                {$spage['page_company']}
                                            </div>
                                        </li>
                                    {/if}
                                    {if $spage['page_phone']}
                                        <li>
                                            <div class="about-list-item">
                                                <i class="fa fa-phone fa-fw fa-lg"></i>
                                                {$spage['page_phone']}
                                            </div>
                                        </li>
                                    {/if}
                                    {if $spage['page_website']}
                                        <li>
                                            <div class="about-list-item">
                                                <i class="fa fa-link fa-fw fa-lg"></i>
                                                <a target="_blank" href="{$spage['page_website']}">{$spage['page_website']}</a>
                                            </div>
                                        </li>
                                    {/if}
                                    {if $spage['page_location']}
                                        <li>
                                            <div class="about-list-item">
                                                <i class="fa fa-map-marker fa-fw fa-lg"></i>
                                                {$spage['page_location']}
                                            </div>
                                        </li>
                                        <div style="margin-left: -20px; margin-right: -20px;">
                                            <iframe width="100%" frameborder="0" style="border:0;" src="https://www.google.com/maps/embed/v1/place?key={$system['geolocation_key']}&amp;q={$spage['page_location']}&amp;language=en"></iframe>
                                        </div>
                                    {/if}
                                    <!-- info -->
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

                        <!-- social links -->
                        {if $spage['page_social_facebook'] || $spage['page_social_twitter'] || $spage['page_social_youtube'] || $spage['page_social_instagram'] || $spage['page_social_linkedin'] || $spage['page_social_vkontakte']}
                            <div class="card">
                                <div class="card-header bg-transparent">
                                    <i class="fa fa-share-alt mr5"></i>
                                    <strong>{__("Social Links")}</strong>
                                </div>
                                <div class="card-body text-center">
                                    {if $spage['page_social_facebook']}
                                        <a target="_blank" href="{$spage['page_social_facebook']}" class="btn btn-sm btn-rounded btn-social-icon btn-facebook">
                                            <i class="fab fa-facebook"></i>
                                        </a>
                                    {/if}
                                    {if $spage['page_social_twitter']}
                                        <a target="_blank" href="{$spage['page_social_twitter']}" class="btn btn-sm btn-rounded btn-social-icon btn-twitter">
                                            <i class="fab fa-twitter"></i>
                                        </a>
                                    {/if}
                                    {if $spage['page_social_youtube']}
                                        <a target="_blank" href="{$spage['page_social_youtube']}" class="btn btn-sm btn-rounded btn-social-icon btn-pinterest">
                                            <i class="fab fa-youtube"></i>
                                        </a>
                                    {/if}
                                    {if $spage['page_social_instagram']}
                                        <a target="_blank" href="{$spage['page_social_instagram']}" class="btn btn-sm btn-rounded btn-social-icon btn-instagram">
                                            <i class="fab fa-instagram"></i>
                                        </a>
                                    {/if}
                                    {if $spage['page_social_linkedin']}
                                        <a target="_blank" href="{$spage['page_social_linkedin']}" class="btn btn-sm btn-rounded btn-social-icon btn-linkedin">
                                            <i class="fab fa-linkedin"></i>
                                        </a>
                                    {/if}
                                    {if $spage['page_social_vkontakte']}
                                        <a target="_blank" href="{$spage['page_social_vkontakte']}" class="btn btn-sm btn-rounded btn-social-icon btn-vk">
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
                        <!-- photos -->
                        {if $spage['photos']}
                            <div class="card panel-photos">
                                <div class="card-header bg-transparent">
                                    <i class="fa fa-images mr5"></i>
                                    <strong><a href="{$system['system_url']}/pages/{$spage['page_name']}/photos">{__("Photos")}</a></strong>
                                </div>
                                <div class="card-body ptb10 plr10">
                                    <div class="row no-gutters">
                                        {foreach $spage['photos'] as $photo}
                                            {include file='__feeds_photo.tpl' _context="photos" _small=true}
                                        {/foreach}
                                    </div>
                                </div>
                            </div>
                        {/if}
                        <!-- photos -->

                        <!-- invite friends -->
                        {if $spage['i_like'] && $spage['invites']}
                            <div class="card">
                                <div class="card-header bg-transparent">
                                    <div class="float-right">
                                        <small><a href="{$system['system_url']}/pages/{$spage['page_name']}/invites">{__("See All")}</a></small>
                                    </div>
                                    <i class="fa fa-user-tag mr5"></i>
                                    <strong><a href="{$system['system_url']}/pages/{$spage['page_name']}/invites">{__("Invite Friends")}</a></strong>
                                </div>
                                <div class="card-body">
                                    <ul>
                                        {foreach $spage['invites'] as $_user}
                                        {include file='__feeds_user.tpl' _tpl="list" _connection=$_user["connection"] _small=true}
                                        {/foreach}
                                    </ul>
                                </div>
                            </div>
                        {/if}
                        <!-- invite friends -->
                    </div>
                    <!-- right panel -->

                    <!-- center panel -->
                    <div class="order-3 col-lg-6 order-lg-2">
                        <!-- publisher -->
                        {if $spage['i_admin']}
                            {include file='_publisher.tpl' _handle="page" _id=$spage['page_id']}
                        {/if}
                        <!-- publisher -->

                        <!-- pinned post -->
                        {if $pinned_post}
                            {include file='_pinned_post.tpl' post=$pinned_post}
                        {/if}
                        <!-- pinned post -->
                        
                        <!-- posts -->
                        {include file='_posts.tpl' _get="posts_page" _id=$spage['page_id']}
                        <!-- posts -->
                    </div>
                    <!-- center panel -->
                
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
                                        <a class="nav-link active" href="{$system['system_url']}/pages/{$spage['page_name']}/photos">{__("Photos")}</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="{$system['system_url']}/pages/{$spage['page_name']}/albums">{__("Albums")}</a>
                                    </li>
                                </ul>
                                <!-- panel nav -->
                            </div>
                            <div class="card-body">
                                {if $spage['photos']}
                                    <ul class="row no-gutters">
                                        {foreach $spage['photos'] as $photo}
                                            {include file='__feeds_photo.tpl' _context="photos"}
                                        {/foreach}
                                    </ul>
                                    <!-- see-more -->
                                    <div class="alert alert-info see-more js_see-more" data-get="photos" data-id="{$spage['page_id']}" data-type='page'>
                                        <span>{__("See More")}</span>
                                        <div class="loader loader_small x-hidden"></div>
                                    </div>
                                    <!-- see-more -->
                                {else}
                                    <p class="text-center text-muted mt10">
                                        {$spage['page_title']} {__("doesn't have photos")}
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
                                        <a class="nav-link" href="{$system['system_url']}/pages/{$spage['page_name']}/photos">{__("Photos")}</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link active" href="{$system['system_url']}/pages/{$spage['page_name']}/albums">{__("Albums")}</a>
                                    </li>
                                </ul>
                                <!-- panel nav -->
                            </div>
                            <div class="card-body">
                                {if count($spage['albums']) > 0}
                                    <ul class="row">
                                        {foreach $spage['albums'] as $album}
                                        {include file='__feeds_album.tpl'}
                                        {/foreach}
                                    </ul>
                                    {if count($spage['albums']) >= $system['max_results_even']}
                                        <!-- see-more -->
                                        <div class="alert alert-info see-more js_see-more" data-get="albums" data-id="{$spage['page_id']}" data-type='page'>
                                            <span>{__("See More")}</span>
                                            <div class="loader loader_small x-hidden"></div>
                                        </div>
                                        <!-- see-more -->
                                    {/if}
                                {else}
                                    <p class="text-center text-muted mt10">
                                        {$spage['page_title']} {__("doesn't have albums")}
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
                                    <a href="{$system['system_url']}/pages/{$spage['page_name']}/albums" class="btn btn-sm btn-light">
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
                                        <a class="nav-link" href="{$system['system_url']}/pages/{$spage['page_name']}/photos">{__("Photos")}</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link active" href="{$system['system_url']}/pages/{$spage['page_name']}/albums">{__("Albums")}</a>
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
                                {if $spage['videos']}
                                    <ul class="row no-gutters">
                                        {foreach $spage['videos'] as $video}
                                            {include file='__feeds_video.tpl'}
                                        {/foreach}
                                    </ul>
                                    <!-- see-more -->
                                    <div class="alert alert-info see-more js_see-more" data-get="videos" data-id="{$spage['page_id']}" data-type='page'>
                                        <span>{__("See More")}</span>
                                        <div class="loader loader_small x-hidden"></div>
                                    </div>
                                    <!-- see-more -->
                                {else}
                                    <p class="text-center text-muted mt10">
                                        {$spage['page_title']} {__("doesn't have videos")}
                                    </p>
                                {/if}
                            </div>
                        </div>
                    </div>
                    <!-- videos -->
                
                {elseif $view == "invites"}
                    <!-- invites -->
                    <div class="col-12">
                        <div class="card">
                            <div class="card-header with-icon">
                                <!-- panel title -->
                                <div>
                                    <i class="fa fa-user-tag mr10"></i>{__("Invites")}
                                </div>
                                <!-- panel title -->
                            </div>
                            <div class="card-body">
                                {if $spage['invites']}
                                    <ul class="row">
                                        {foreach $spage['invites'] as $_user}
                                        {include file='__feeds_user.tpl' _tpl="box" _connection=$_user["connection"]}
                                        {/foreach}
                                    </ul>

                                    {if count($spage['invites']) >= $system['max_results_even']}
                                        <!-- see-more -->
                                        <div class="alert alert-info see-more js_see-more" data-get="page_invites" data-id="{$spage['page_id']}">
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
                                        <a href="{$system['system_url']}/pages/{$spage['page_name']}/settings">
                                            <i class="fa fa-cog fa-fw mr10"></i>{__("Page Settings")}
                                        </a>
                                    </li>
                                    <li {if $sub_view == "info"}class="active"{/if}>
                                        <a href="{$system['system_url']}/pages/{$spage['page_name']}/settings/info">
                                            <i class="fa fa-info-circle fa-fw mr10"></i>{__("Page Information")}
                                        </a>
                                    </li>
                                    <li {if $sub_view == "admins"}class="active"{/if}>
                                        <a href="{$system['system_url']}/pages/{$spage['page_name']}/settings/admins">
                                            <i class="fa fa-users fa-fw mr10"></i>{__("Admins")}
                                        </a>
                                    </li>
                                    {if $system['verification_requests']}
                                        <li {if $sub_view == "verification"}class="active"{/if}>
                                            <a href="{$system['system_url']}/pages/{$spage['page_name']}/settings/verification">
                                                <i class="fa fa-check-circle fa-fw mr10"></i>{__("Verification")}
                                            </a>
                                        </li>
                                    {/if}
                                    {if $user->_data['user_id'] == $spage['page_admin']}
                                        <li {if $sub_view == "delete"}class="active"{/if}>
                                            <a href="{$system['system_url']}/pages/{$spage['page_name']}/settings/delete">
                                                <i class="fa fa-trash fa-fw mr10"></i>{__("Delete Page")}
                                            </a>
                                        </li>
                                    {/if}
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-9">
                        <div class="card">
                            {if $sub_view == ""}
                                <div class="card-header with-icon">
                                    <i class="fa fa-cog mr10"></i>{__("Page Settings")}
                                </div>
                                <form class="js_ajax-forms " data-url="pages_groups_events/create.php?type=page&do=edit&edit=settings&id={$spage['page_id']}">
                                    <div class="card-body">
                                        <div class="form-group">
                                            <label class="form-control-label" for="title">{__("Name Your Page")}</label>
                                            <input type="text" class="form-control" name="title" id="title" value="{$spage['page_title']}">
                                        </div>
                                        <div class="form-group">
                                            <label class="form-control-label" for="username">{__("Web Address")}</label>
                                            <div class="input-group">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text d-none d-sm-block">{$system['system_url']}/pages/</span>
                                                </div>
                                                <input type="text" class="form-control" name="username" id="username" value="{$spage['page_name']}">
                                            </div>
                                            <span class="form-text">
                                                {__("Can only contain alphanumeric characters (A–Z, 0–9) and periods ('.')")}
                                            </span>
                                        </div>
                                        <div class="form-group">
                                            <label class="form-control-label" for="category">{__("Category")}</label>
                                            <select class="form-control" name="category" id="category">
                                                <option>{__("Select Category")}</option>
                                                {foreach $categories as $category}
                                                    <option {if $spage['page_category'] == $category['category_id']}selected{/if} value="{$category['category_id']}">{__($category['category_name'])}</option>
                                                {/foreach}
                                            </select>
                                        </div>
                                        
                                        <!-- error -->
                                        <div class="alert alert-danger mb0 x-hidden"></div>
                                        <!-- error -->
                                    </div>
                                    <div class="card-footer text-right">
                                        <button type="submit" class="btn btn-primary">{__("Save Changes")}</button>
                                    </div>
                                </form>
                            
                            {elseif $sub_view == "info"}
                                <div class="card-header with-icon with-nav">
                                    <!-- panel title -->
                                    <div class="mb20">
                                        <i class="fa fa-info-circle mr10"></i>{__("Page Information")}
                                    </div>
                                    <!-- panel title -->

                                    <!-- panel nav -->
                                    <ul class="nav nav-tabs">
                                        <li class="nav-item">
                                            <a class="nav-link active" href="#basic" data-toggle="tab">
                                                <i class="fa fa-flag fa-fw mr5"></i><strong class="pr5">{__("Basic")}</strong>
                                            </a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="#action" data-toggle="tab">
                                                <i class="fa fa-magic fa-fw mr5"></i><strong class="pr5">{__("Action Button")}</strong>
                                            </a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="#social" data-toggle="tab">
                                                <i class="fab fa-facebook fa-fw mr5"></i><strong class="pr5">{__("Social Links")}</strong>
                                            </a>
                                        </li>
                                    </ul>
                                    <!-- panel nav -->
                                </div>

                                <!-- tab-content -->
                                <div class="tab-content">
                                    <!-- basic tab -->
                                    <div class="tab-pane active" id="basic">
                                        <form class="js_ajax-forms " data-url="pages_groups_events/create.php?type=page&do=edit&edit=info&id={$spage['page_id']}">
                                            <div class="card-body">
                                                <div class="row">
                                                    <div class="form-group col-md-6">
                                                        <label class="form-control-label" for="company">{__("Company")}</label>
                                                        <input type="text" class="form-control" name="company" id="company" value="{$spage['page_company']}">
                                                    </div>
                                                    <div class="form-group col-md-6">
                                                        <label class="form-control-label" for="phone">{__("Phone")}</label>
                                                        <input type="text" class="form-control" name="phone" id="phone" value="{$spage['page_phone']}">
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="form-group col-md-6">
                                                        <label class="form-control-label" for="website">{__("Website")}</label>
                                                        <input type="text" class="form-control" name="website" id="website" value="{$spage['page_website']}">
                                                        <span class="form-text">
                                                            {__("Website link must start with http:// or https://")}
                                                        </span>
                                                    </div>
                                                    <div class="form-group col-md-6">
                                                        <label class="form-control-label" for="location">{__("Location")}</label>
                                                        <input type="text" class="form-control js_geocomplete" name="location" id="location" value="{$spage['page_location']}">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="form-control-label" for="description">{__("About")}</label>
                                                    <textarea class="form-control" name="description" id="description">{$spage['page_description']}</textarea>
                                                </div>
                                                <!-- custom fields -->
                                                {if $custom_fields['basic']}
                                                {include file='__custom_fields.tpl' _custom_fields=$custom_fields['basic'] _registration=false}
                                                {/if}
                                                <!-- custom fields -->

                                                <!-- error -->
                                                <div class="alert alert-danger mb0 x-hidden"></div>
                                                <!-- error -->
                                            </div>
                                            <div class="card-footer text-right">
                                                <button type="submit" class="btn btn-primary">{__("Save Changes")}</button>
                                            </div>
                                        </form>
                                    </div>
                                    <!-- basic tab -->

                                    <!-- action tab -->
                                    <div class="tab-pane" id="action">
                                        <form class="js_ajax-forms " data-url="pages_groups_events/create.php?type=page&do=edit&edit=action&id={$spage['page_id']}">
                                            <div class="card-body">
                                                <div class="form-group">
                                                    <label class="form-control-label">{__("Action Button Text")}</label>
                                                    <input type="text" class="form-control" name="action_text" id="action_text" value="{$spage['page_action_text']}">
                                                    <span class="form-text">
                                                        {__("For example: Subscribe, Get tickets, Preorder now or Shop now")}
                                                    </span>
                                                </div>
                                                <div class="form-group">
                                                    <label class="form-control-label">{__("Action Button Color")}</label>
                                                    <div class="mt10">
                                                        <div class="custom-control custom-radio custom-control-inline">
                                                            <input type="radio" name="action_color" id="action_color_light" value="light" class="custom-control-input" {if $spage['page_action_color'] == "light"}checked{/if}>
                                                            <label class="custom-control-label" for="action_color_light">
                                                                <button type="button" class="btn btn-sm btn-light">{__("Action")}</button>
                                                            </label>
                                                        </div>
                                                        <div class="custom-control custom-radio custom-control-inline">
                                                            <input type="radio" name="action_color" id="action_color_primary" value="primary" class="custom-control-input" {if $spage['page_action_color'] == "primary"}checked{/if}>
                                                            <label class="custom-control-label" for="action_color_primary">
                                                                 <button type="button" class="btn btn-sm btn-primary">{__("Action")}</button>
                                                            </label>
                                                        </div>
                                                        <div class="custom-control custom-radio custom-control-inline">
                                                            <input type="radio" name="action_color" id="action_color_success" value="success" class="custom-control-input" {if $spage['page_action_color'] == "success"}checked{/if}>
                                                            <label class="custom-control-label" for="action_color_success">
                                                                 <button type="button" class="btn btn-sm btn-success">{__("Action")}</button>
                                                            </label>
                                                        </div>
                                                        <div class="custom-control custom-radio custom-control-inline">
                                                            <input type="radio" name="action_color" id="action_color_info" value="info" class="custom-control-input" {if $spage['page_action_color'] == "info"}checked{/if}>
                                                            <label class="custom-control-label" for="action_color_info">
                                                                 <button type="button" class="btn btn-sm btn-info">{__("Action")}</button>
                                                            </label>
                                                        </div>
                                                        <div class="custom-control custom-radio custom-control-inline">
                                                            <input type="radio" name="action_color" id="action_color_warning" value="warning" class="custom-control-input" {if $spage['page_action_color'] == "warning"}checked{/if}>
                                                            <label class="custom-control-label" for="action_color_warning">
                                                                 <button type="button" class="btn btn-sm btn-warning">{__("Action")}</button>
                                                            </label>
                                                        </div>
                                                        <div class="custom-control custom-radio custom-control-inline">
                                                            <input type="radio" name="action_color" id="action_color_danger" value="danger" class="custom-control-input" {if $spage['page_action_color'] == "danger"}checked{/if}>
                                                            <label class="custom-control-label" for="action_color_danger">
                                                                 <button type="button" class="btn btn-sm btn-danger">{__("Action")}</button>
                                                            </label>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="form-control-label">{__("Action Button URL")}</label>
                                                    <input type="text" class="form-control" name="action_url" id="action_url" value="{$spage['page_action_url']}">
                                                </div>

                                                <!-- error -->
                                                <div class="alert alert-danger mb0 x-hidden"></div>
                                                <!-- error -->
                                            </div>
                                            <div class="card-footer text-right">
                                                <button type="submit" class="btn btn-primary">{__("Save Changes")}</button>
                                            </div>
                                        </form>
                                    </div>
                                    <!-- action tab -->

                                    <!-- social tab -->
                                    <div class="tab-pane" id="social">
                                        <form class="js_ajax-forms " data-url="pages_groups_events/create.php?type=page&do=edit&edit=social&id={$spage['page_id']}">
                                            <div class="card-body">
                                                <div class="row">
                                                    <div class="form-group col-md-6">
                                                        <label class="form-control-label">{__("Facebook Profile URL")}</label>
                                                        <div class="input-group">
                                                            <div class="input-group-prepend">
                                                                <span class="input-group-text bg-transparent"><i class="fab fa-facebook fa-lg" style="color: #3B579D"></i></span>
                                                            </div>
                                                            <input type="text" class="form-control" name="facebook" value="{$spage['page_social_facebook']}">
                                                        </div>
                                                    </div>

                                                    <div class="form-group col-md-6">
                                                        <label class="form-control-label">{__("Twitter Profile URL")}</label>
                                                        <div class="input-group">
                                                            <div class="input-group-prepend">
                                                                <span class="input-group-text bg-transparent"><i class="fab fa-twitter fa-lg" style="color: #55ACEE"></i></span>
                                                            </div>
                                                            <input type="text" class="form-control" name="twitter" value="{$spage['page_social_twitter']}">
                                                        </div>
                                                    </div>
                                                
                                                    <div class="form-group col-md-6">
                                                        <label class="form-control-label">{__("YouTube Profile URL")}</label>
                                                        <div class="input-group">
                                                            <div class="input-group-prepend">
                                                                <span class="input-group-text bg-transparent"><i class="fab fa-youtube fa-lg" style="color: #E62117"></i></span>
                                                            </div>
                                                            <input type="text" class="form-control" name="youtube" value="{$spage['page_social_youtube']}">
                                                        </div>
                                                    </div>
                                                
                                                    <div class="form-group col-md-6">
                                                        <label class="form-control-label">{__("Instagram Profile URL")}</label>
                                                        <div class="input-group">
                                                            <div class="input-group-prepend">
                                                                <span class="input-group-text bg-transparent"><i class="fab fa-instagram fa-lg" style="color: #3f729b"></i></span>
                                                            </div>
                                                            <input type="text" class="form-control" name="instagram" value="{$spage['page_social_instagram']}">
                                                        </div>
                                                    </div>

                                                    <div class="form-group col-md-6">
                                                        <label class="form-control-label">{__("LinkedIn Profile URL")}</label>
                                                        <div class="input-group">
                                                            <div class="input-group-prepend">
                                                                <span class="input-group-text bg-transparent"><i class="fab fa-linkedin fa-lg" style="color: #1A84BC"></i></span>
                                                            </div>
                                                            <input type="text" class="form-control" name="linkedin" value="{$spage['page_social_linkedin']}">
                                                        </div>
                                                    </div>
                                                
                                                    <div class="form-group col-md-6">
                                                        <label class="form-control-label">{__("Vkontakte Profile URL")}</label>
                                                        <div class="input-group">
                                                            <div class="input-group-prepend">
                                                                <span class="input-group-text bg-transparent"><i class="fab fa-vk fa-lg" style="color: #527498"></i></span>
                                                            </div>
                                                            <input type="text" class="form-control" name="vkontakte" value="{$spage['page_social_vkontakte']}">
                                                        </div>
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
                                    </div>
                                    <!-- social tab -->
                                </div>
                                <!-- tab-content -->
                            
                            {elseif $sub_view == "admins"}
                                <div class="card-header with-icon">
                                    <i class="fa fa-users mr10"></i>{__("Members")}
                                </div>
                                <div class="card-body">
                                    <!-- admins -->
                                    <div class="heading-small mb20">
                                        {__("Admins")} <span class="text-muted">({$spage['page_admins_count']})</span>
                                    </div>
                                    <div class="pl-md-4">
                                        {if $spage['page_admins']}
                                            <ul>
                                                {foreach $spage['page_admins'] as $_user}
                                                {include file='__feeds_user.tpl' _tpl="list" _connection=$_user["connection"]}
                                                {/foreach}
                                            </ul>

                                            {if $spage['page_admins_count'] >= $system['max_results_even']}
                                                <!-- see-more -->
                                                <div class="alert alert-info see-more js_see-more" data-get="page_admins" data-id="{$spage['page_id']}">
                                                    <span>{__("See More")}</span>
                                                    <div class="loader loader_small x-hidden"></div>
                                                </div>
                                                <!-- see-more -->
                                            {/if}
                                        {else}
                                            <p class="text-center text-muted mt10">
                                                {$spage['page_title']} {__("doesn't have admins")}
                                            </p>
                                        {/if}
                                    </div>
                                    <!-- admins -->

                                    <div class="divider"></div>

                                    <!-- members -->
                                    <div class="heading-small mb20">
                                        {__("All Members")} <span class="text-muted">({$spage['page_likes']})</span>
                                    </div>
                                    <div class="pl-md-4">
                                        {if $spage['page_likes'] > 0}
                                            <ul>
                                                {foreach $spage['members'] as $_user}
                                                {include file='__feeds_user.tpl' _tpl="list" _connection=$_user["connection"]}
                                                {/foreach}
                                            </ul>

                                            {if $spage['page_likes'] >= $system['max_results_even']}
                                                <!-- see-more -->
                                                <div class="alert alert-info see-more js_see-more" data-get="page_members" data-id="{$spage['page_id']}">
                                                    <span>{__("See More")}</span>
                                                    <div class="loader loader_small x-hidden"></div>
                                                </div>
                                                <!-- see-more -->
                                            {/if}
                                        {else}
                                            <p class="text-center text-muted mt10">
                                                {$spage['page_title']} {__("doesn't have members")}
                                            </p>
                                        {/if}
                                    </div>
                                    <!-- members -->
                                </div>
                            
                            {elseif $sub_view == "verification"}
                                <div class="card-header with-icon">
                                    <i class="fa fa-check-circle mr10"></i>{__("Verification")}
                                </div>
                                {if $case == "verified"}
                                    <div class="card-body">
                                        <div class="text-center">
                                            <div class="big-icon success">
                                                <i class="fa fa-thumbs-up fa-3x"></i>
                                            </div>
                                            <h4>{__("Congratulations")}</h4>
                                            <p class="mt20">{__("This page is verified")}</p>
                                        </div>
                                    </div>
                                {elseif $case == "request"}
                                    <form class="js_ajax-forms " data-url="users/verify.php?node=page&node_id={$spage['page_id']}">
                                        <div class="card-body">
                                            <div class="form-group form-row">
                                                <label class="col-md-3 form-control-label">
                                                    {__("Verification Documents")}
                                                </label>
                                                <div class="col-md-9">
                                                    <div class="row">
                                                        <div class="col-sm-6">
                                                            <div class="section-title mb20">
                                                                <i class="fas fa-camera-retro mr10"></i>{__("Your Photo")}
                                                            </div>
                                                            <div class="x-image full">
                                                                <button type="button" class="close x-hidden js_x-image-remover" title='{__("Remove")}'>
                                                                    <span>×</span>
                                                                </button>
                                                                <div class="x-image-loader">
                                                                    <div class="progress x-progress">
                                                                        <div class="progress-bar" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
                                                                    </div>
                                                                </div>
                                                                <i class="fa fa-camera fa-2x js_x-uploader" data-handle="x-image"></i>
                                                                <input type="hidden" class="js_x-image-input" name="photo" value="">
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-6">
                                                            <div class="section-title mb20">
                                                                <i class="fas fa-passport mr10"></i>{__("Passport or National ID")}
                                                            </div>
                                                            <div class="x-image full">
                                                                <button type="button" class="close x-hidden js_x-image-remover" title='{__("Remove")}'>
                                                                    <span>×</span>
                                                                </button>
                                                                <div class="x-image-loader">
                                                                    <div class="progress x-progress">
                                                                        <div class="progress-bar" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
                                                                    </div>
                                                                </div>
                                                                <i class="fa fa-camera fa-2x js_x-uploader" data-handle="x-image"></i>
                                                                <input type="hidden" class="js_x-image-input" name="passport" value="">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <span class="form-text">
                                                        {__("Please attach your photo and your Passport or National ID")}
                                                    </span>
                                                </div>
                                            </div>
                                            
                                            <div class="form-group form-row">
                                                <label class="col-md-3 form-control-label">
                                                    {__("Additional Information")}
                                                </label>
                                                <div class="col-md-9">
                                                    <textarea class="form-control" name="message"></textarea>
                                                    <span class="form-text">
                                                        {__("Please share why your account should be verified")}
                                                    </span>
                                                </div>
                                            </div>
                                            
                                            <!-- success -->
                                            <div class="alert alert-success mb0 x-hidden"></div>
                                            <!-- success -->

                                            <!-- error -->
                                            <div class="alert alert-danger mb0 x-hidden"></div>
                                            <!-- error -->
                                        </div>
                                        <div class="card-footer text-right">
                                            <button type="submit" class="btn btn-primary">
                                                <i class="fa fa-check-circle mr10"></i>{__("Send Verification Request")}
                                            </button>
                                        </div>
                                    </form>
                                {elseif $case == "pending"}
                                    <div class="card-body">
                                        <div class="text-center">
                                            <div class="big-icon warning">
                                                <i class="fa fa-clock fa-3x"></i>
                                            </div>
                                            <h4>{__("Pending")}</h4>
                                            <p class="mt20">{__("Your verification request is still awaiting admin approval")}</p>
                                        </div>
                                    </div>
                                {elseif $case == "declined"}
                                    <div class="card-body">
                                        <div class="text-center">
                                            <div class="big-icon error">
                                                <i class="fa fa-frown fa-3x"></i>
                                            </div>
                                            <h4>{__("Sorry")}</h4>
                                            <p class="mt20">{__("Your verification request has been declined by the admin")}</p>
                                        </div>
                                    </div>
                                {/if}
                            
                            {elseif $sub_view == "delete"}
                                <div class="card-header with-icon">
                                    <i class="fa fa-trash mr10"></i>{__("Delete Page")}
                                </div>
                                <div class="card-body">
                                    <div class="alert alert-warning">
                                        <div class="icon">
                                            <i class="fa fa-exclamation-triangle fa-2x"></i>
                                        </div>
                                        <div class="text pt5">
                                            {__("Once you delete your page you will no longer can access it again")}
                                        </div>
                                    </div>

                                    <div class="text-center">
                                        <button class="btn btn-danger js_delete-page" data-id="{$spage['page_id']}">
                                            <i class="fa fa-trash mr5"></i>{__("Delete Page")}
                                        </button>
                                    </div>
                                </div>
                            
                            {/if}
                        </div>
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