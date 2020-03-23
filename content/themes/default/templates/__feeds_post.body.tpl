<!-- post header -->
<div class="post-header">
    <!-- post picture -->
    <div class="post-avatar">
        <a class="post-avatar-picture" href="{$_post['post_author_url']}" style="background-image:url({$_post['post_author_picture']});">
        </a>
    </div>
    <!-- post picture -->

    <!-- post meta -->
    <div class="post-meta">
        <!-- post menu -->
        {if !$_shared && $user->_logged_in && $_get != "posts_information"}
            <div class="float-right dropdown">
                <i class="fa fa-chevron-down dropdown-toggle" data-toggle="dropdown" data-display="static"></i>
                <div class="dropdown-menu dropdown-menu-right post-dropdown-menu">
                    {if $_post['manage_post'] && $_post['post_type'] == "product"}
                        {if $_post['product']['available']}
                            <div class="dropdown-item pointer js_sold-post">
                                <div class="action no-desc">
                                    <i class="fa fa-tag fa-fw"></i> <span>{__("Mark as Sold")}</span>
                                </div>
                            </div>
                        {else}
                            <div class="dropdown-item pointer js_unsold-post">
                                <div class="action no-desc">
                                    <i class="fa fa-tag fa-fw"></i> <span>{__("Mark as Available")}</span>
                                </div>
                            </div>
                        {/if}
                        <div class="dropdown-divider"></div>
                    {/if}
                    {if $_post['i_save']}
                        <div href="#" class="dropdown-item pointer js_unsave-post">
                            <div class="action no-desc">
                                <i class="fa fa-bookmark fa-fw"></i> <span>{__("Unsave Post")}</span>
                            </div>
                        </div>
                    {else}
                        <div class="dropdown-item pointer js_save-post">
                            <div class="action no-desc">
                                <i class="fa fa-bookmark fa-fw"></i> <span>{__("Save Post")}</span>
                            </div>
                        </div>
                    {/if}
                    <div class="dropdown-divider"></div>
                    {if $_post['manage_post']}
                        <!-- Boost -->
                        {if $system['packages_enabled'] && !$_post['in_group'] && !$_post['in_event']}
                            {if $_post['boosted']}
                                <div class="dropdown-item pointer js_unboost-post">
                                    <div class="action no-desc">
                                        <i class="fa fa-bolt fa-fw"></i> <span>{__("Unboost Post")}</span>
                                    </div>
                                </div>
                            {else}
                                {if $user->_data['can_boost_posts']}
                                    <div class="dropdown-item pointer js_boost-post">
                                        <div class="action no-desc">
                                            <i class="fa fa-bolt fa-fw"></i> <span>{__("Boost Post")}</span>
                                        </div>
                                    </div>
                                {else}
                                    <a href="{$system['system_url']}/packages" class="dropdown-item">
                                        <div class="action no-desc">
                                            <i class="fa fa-bolt fa-fw"></i> <span>{__("Boost Post")}</span>
                                        </div>
                                    </a>
                                {/if}
                            {/if}
                        {/if}
                        <!-- Boost -->
                        <!-- Pin -->
                        {if (!$_post['in_group'] && !$_post['in_event']) || ($_post['in_group'] && $_post['is_group_admin']) || ($_post['in_event'] && $_post['is_event_admin'])}
                            {if $_post['pinned']}
                                <div class="dropdown-item pointer js_unpin-post">
                                    <div class="action no-desc">
                                        <i class="fa fa-thumbtack fa-fw"></i> <span>{__("Unpin Post")}</span>
                                    </div>
                                </div>
                            {else}
                                <div class="dropdown-item pointer js_pin-post">
                                    <div class="action no-desc">
                                        <i class="fa fa-thumbtack fa-fw"></i> <span>{__("Pin Post")}</span>
                                    </div>
                                </div>
                            {/if}
                        {/if}
                        <!-- Pin -->
                        <!-- Edit -->
                        {if $_post['post_type'] == "product"}
                            <div class="dropdown-item pointer" data-toggle="modal" data-url="posts/product.php?do=edit&post_id={$_post['post_id']}">
                                <div class="action no-desc">
                                    <i class="fa fa-pencil-alt fa-fw"></i> {__("Edit Product")}
                                </div>
                            </div>
                        {elseif $_post['post_type'] == "article"}
                            <a href="{$system['system_url']}/blogs/edit/{$_post['post_id']}" class="dropdown-item pointer">
                                <div class="action no-desc">
                                    <i class="fa fa-pencil-alt fa-fw"></i> {__("Edit Article")}
                                </div>
                            </a>
                        {else}
                            <div class="dropdown-item pointer js_edit-post">
                                <div class="action no-desc">
                                    <i class="fa fa-pencil-alt fa-fw"></i> {__("Edit Post")}
                                </div>
                            </div>
                        {/if}
                        <!-- Edit -->
                        <!-- Delete -->
                        <div class="dropdown-item pointer js_delete-post">
                            <div class="action no-desc">
                                <i class="fa fa-trash-alt fa-fw"></i> {__("Delete Post")}
                            </div>
                        </div>
                        <!-- Delete -->
                        <!-- Hide -->
                        {if (!$_post['in_group'] && !$_post['in_event'])}
                            {if $_post['is_hidden']}
                                <div class="dropdown-item pointer js_allow-post">
                                    <div class="action no-desc">
                                        <i class="fa fa-eye fa-fw"></i> <span>{__("Allow on Timeline")}</span>
                                    </div>
                                </div>
                            {else}
                                <div class="dropdown-item pointer js_disallow-post">
                                    <div class="action no-desc">
                                        <i class="fa fa-eye-slash fa-fw"></i> <span>{__("Hide from Timeline")}</span>
                                    </div>
                                </div>
                            {/if}
                        {/if}
                        <!-- Hide -->
                        <!-- Disable Comments -->
                        {if $_post['comments_disabled']}
                            <div class="dropdown-item pointer js_enable-post-comments">
                                <div class="action no-desc">
                                    <i class="fa fa-comment fa-fw"></i> <span>{__("Turn on Commenting")}</span>
                                </div>
                            </div>
                        {else}
                            <div class="dropdown-item pointer js_disable-post-comments">
                                <div class="action no-desc">
                                    <i class="fa fa-comment-slash fa-fw"></i> <span>{__("Turn off Commenting")}</span>
                                </div>
                            </div>
                        {/if}
                        <!-- Disable Comments -->
                    {else}
                        {if $_post['user_type'] == "user"}
                            <div class="dropdown-item pointer js_hide-author" data-author-id="{$_post['user_id']}" data-author-name="{$_post['post_author_name']}">
                                <div class="action">
                                    <i class="fa fa-minus-circle fa-fw"></i> {__("Unfollow")} {$_post['user_firstname']}
                                </div>
                                <div class="action-desc">{__("Stop seeing posts but stay friends")}</div>
                            </div>
                        {/if}
                        <div class="dropdown-item pointer js_hide-post">
                            <div class="action">
                                <i class="fa fa-eye-slash fa-fw"></i> {__("Hide this post")}
                            </div>
                            <div class="action-desc">{__("See fewer posts like this")}</div>
                        </div>
                        <div class="dropdown-item pointer js_report" data-handle="post" data-id="{$_post['post_id']}">
                            <div class="action no-desc">
                                <i class="fa fa-flag fa-fw"></i> {__("Report post")}
                            </div>
                        </div>
                    {/if}
                    <div class="dropdown-divider"></div>
                    <a href="{$system['system_url']}/posts/{$_post['post_id']}" target="_blank" class="dropdown-item">
                        <div class="action no-desc">
                            <i class="fa fa-link fa-fw"></i> {__("Open post in new tab")}
                        </div>
                    </a>
                </div>
            </div>
        {/if}
        <!-- post menu -->

        <!-- post author -->
        <span class="js_user-popover" data-type="{$_post['user_type']}" data-uid="{$_post['user_id']}">
            <a href="{$_post['post_author_url']}">{$_post['post_author_name']}</a>
        </span>
        {if $_post['post_author_verified']}
            {if $_post['user_type'] == "user"}
                <i data-toggle="tooltip" data-placement="top" title='{__("Verified User")}' class="fa fa-check-circle fa-fw verified-badge"></i>
            {else}
                <i data-toggle="tooltip" data-placement="top" title='{__("Verified Page")}' class="fa fa-check-circle fa-fw verified-badge"></i>
            {/if}
        {/if}
        {if $_post['user_subscribed']}
            <i data-toggle="tooltip" data-placement="top" title='{__("Pro User")}' class="fa fa-bolt fa-fw pro-badge"></i>
        {/if}
        <!-- post author -->

        <!-- post-title -->
        <span class="post-title">
            {if !$_shared && $_post['post_type'] == "shared"}
                {__("shared")} 
                <span class="js_user-popover" data-type="{$_post['origin']['user_type']}" data-uid="{$_post['origin']['user_id']}">
                    <a href="{$_post['origin']['post_author_url']}">
                        {$_post['origin']['post_author_name']}
                    </a>{__("'s")}
                </span> 
                <a href="{$system['system_url']}/posts/{$_post['origin']['post_id']}">
                    {if $_post['origin']['post_type'] == 'photos'}
                        {if $_post['origin']['photos_num'] > 1}{__("photos")}{else}{__("photo")}{/if}
                    {elseif $_post['origin']['post_type'] == 'media'}
                        {if $_post['origin']['media']['media_type'] != "soundcloud"}
                            {__("video")}
                        {else}
                            {__("song")}
                        {/if}
                    {elseif $_post['origin']['post_type'] == 'link'}
                        {__("link")}
                    {elseif $_post['origin']['post_type'] == 'poll'}
                        {__("poll")}
                    {elseif $_post['origin']['post_type'] == 'album'}
                        {__("album")}
                    {elseif $_post['origin']['post_type'] == 'video'}
                        {__("video")}
                    {elseif $_post['origin']['post_type'] == 'audio'}
                        {__("audio")}
                    {elseif $_post['origin']['post_type'] == 'file'}
                        {__("file")}
                    {else}
                        {__("post")}
                    {/if}
                </a>

            {elseif $_post['post_type'] == "link"}
                {__("shared a link")}

            {elseif $_post['post_type'] == "album"}
                {__("added")} {$_post['photos_num']} {__("photos to the album")}: <a href="{$system['system_url']}/{$_post['album']['path']}/album/{$_post['album']['album_id']}">{$_post['album']['title']}</a>

            {elseif $_post['post_type'] == "poll"}
                {__("created a poll")}

            {elseif $_post['post_type'] == "product"}
                {__("added new product for sale")}

            {elseif $_post['post_type'] == "article"}
                {__("added new article")}

            {elseif $_post['post_type'] == "video"}
                {__("added a video")}

            {elseif $_post['post_type'] == "audio"}
                {__("added an audio")}

            {elseif $_post['post_type'] == "file"}
                {__("added a file")}

            {elseif $_post['post_type'] == "photos"}
                {if $_post['photos_num'] == 1}
                    {__("added a photo")}
                {else}
                    {__("added")} {$_post['photos_num']} {__("photos")}
                {/if}

            {elseif $_post['post_type'] == "profile_picture"}
                {__("updated the profile picture")}

            {elseif $_post['post_type'] == "profile_cover"}
                {__("updated the cover photo")}

            {elseif $_post['post_type'] == "page_picture"}
                {__("updated page picture")}

            {elseif $_post['post_type'] == "page_cover"}
                {__("updated cover photo")}

            {elseif $_post['post_type'] == "group_picture"}
                {__("updated group picture")}

            {elseif $_post['post_type'] == "group_cover"}
                {__("updated group cover")}

            {elseif $_post['post_type'] == "event_cover"}
                {__("updated event cover")}
                
            {/if}

            {if $_get != 'posts_group' && $_post['in_group']}
                <i class="fa fa-caret-right ml5 mr5"></i><i class="fa fa-users ml5 mr5"></i><a href="{$system['system_url']}/groups/{$_post['group_name']}">{$_post['group_title']}</a>

            {elseif $_get != 'posts_event' && $_post['in_event']}
                <i class="fa fa-caret-right ml5 mr5"></i><i class="fa fa-calendar ml5 mr5"></i><a href="{$system['system_url']}/events/{$_post['event_id']}">{$_post['event_title']}</a>

            {elseif $_post['in_wall']}
                <i class="fa fa-caret-right ml5 mr5"></i>
                <span class="js_user-popover" data-type="user" data-uid="{$_post['wall_id']}">
                    <a href="{$system['system_url']}/{$_post['wall_username']}">{$_post['wall_fullname']}</a>
                </span>
            {/if}
        </span>
        <!-- post-title -->

        <!-- post feeling -->
        {if $_post['feeling_action']}
            <span class="post-title">
                {if $_post['post_type'] != "" && $_post['post_type'] != "map"} & {/if}{__("is")} {__($_post["feeling_action"])} {__($_post["feeling_value"])} <i class="twa twa-lg twa-{$_post['feeling_icon']}"></i>
            </span>
        {/if}
        <!-- post feeling -->
        
        <!-- post time & location & privacy -->
        <div class="post-time">
            <a href="{$system['system_url']}/posts/{$_post['post_id']}" class="js_moment" data-time="{$_post['time']}">{$_post['time']}</a>
            {if $_post['location']}
             - <i class="fa fa-map-marker"></i> <span>{$_post['location']}</span>
            {/if}
            {if $system['post_translation_enabled']}
             - <span class="text-link js_translator">{__("Translate")}</span>
            {/if}
            - 
            {if !$_shared && $_post['manage_post'] && $_post['user_type'] == 'user' && !$_post['in_group'] && !$_post['in_event'] && $_post['post_type'] != "product" && $_post['post_type'] != "article"}
                <!-- privacy -->
                {if $_post['privacy'] == "me"}
                    <div class="btn-group" data-toggle="tooltip" data-placement="top" data-value="me" title='{__("Shared with: Only Me")}'>
                        <button type="button" class="btn dropdown-toggle" data-toggle="dropdown" data-display="static">
                            <i class="btn-group-icon fa fa-lock"></i>
                        </button>
                {elseif $_post['privacy'] == "friends"}
                    <div class="btn-group" data-toggle="tooltip" data-placement="top" data-value="friends" title='{__("Shared with: Friends")}'>
                        <button type="button" class="btn dropdown-toggle" data-toggle="dropdown" data-display="static">
                            <i class="btn-group-icon fa fa-users"></i>
                        </button>
                {elseif $_post['privacy'] == "public"}
                    <div class="btn-group" data-toggle="tooltip" data-placement="top" data-value="public" title='{__("Shared with: Public")}'>
                        <button type="button" class="btn dropdown-toggle" data-toggle="dropdown" data-display="static">
                            <i class="btn-group-icon fa fa-globe"></i>
                        </button>
                {/if}
                    <div class="dropdown-menu dropdown-menu-right">
                        <div class="dropdown-item pointer js_edit-privacy" data-title='{__("Shared with: Public")}' data-value="public">
                            <i class="fa fa-globe"></i> {__("Public")}
                        </div>
                        <div class="dropdown-item pointer js_edit-privacy" data-title='{__("Shared with: Friends")}' data-value="friends">
                            <i class="fa fa-users"></i> {__("Friends")}
                        </div>
                        <div class="dropdown-item pointer js_edit-privacy" data-title='{__("Shared with: Only Me")}' data-value="me">
                            <i class="fa fa-lock"></i> {__("Only Me")}
                        </div>
                    </div>
                </div>
                <!-- privacy -->
            {else}
                {if $_post['privacy'] == "me"}
                    <i class="fa fa-lock" data-toggle="tooltip" data-placement="top" title='{__("Shared with")} {__("Only Me")}'></i>
                {elseif $_post['privacy'] == "friends"}
                    <i class="fa fa-users" data-toggle="tooltip" data-placement="top" title='{__("Shared with")} {__("Friends")}'></i>
                {elseif $_post['privacy'] == "public"}
                    <i class="fa fa-globe" data-toggle="tooltip" data-placement="top" title='{__("Shared with")} {__("Public")}'></i>
                {elseif $_post['privacy'] == "custom"}
                    <i class="fa fa-cog" data-toggle="tooltip" data-placement="top" title='{__("Shared with")} {__("Custom People")}'></i>
                {/if}
            {/if}
        </div>
        <!-- post time & location & privacy -->
    </div>
    <!-- post meta -->
</div>
<!-- post header -->

<!-- post text -->
{if $_post['post_type'] != "product"}
    {if !$_shared}
        {include file='__feeds_post.text.tpl'}
    {else}
        {if $_post['colored_pattern']}
            <div class="post-colored" {if $_post['colored_pattern']['type'] == "color"} style="background-image: linear-gradient(45deg, {$_post['colored_pattern']['background_color_1']}, {$_post['colored_pattern']['background_color_2']});" {else} style="background-image: url({$system['system_uploads']}/{$_post['colored_pattern']['background_image']})" {/if}>
                <div class="post-colored-text-wrapper js_scroller" data-slimScroll-height="240">
                    <div class="post-text" dir="auto" style="color: {$_post['colored_pattern']['text_color']};">
                        {$_post['text']}
                    </div>
                </div>
            </div>
        {else}
            <div class="post-text js_readmore" dir="auto">{$_post['text']}</div>
        {/if}
        <div class="post-text-translation x-hidden" dir="auto"></div>
    {/if}
{/if}
<!-- post text -->

{if $_post['post_type'] == "album" || ($_post['post_type'] == "product" && $_post['photos_num'] > 0) || $_post['post_type'] == "photos" || $_post['post_type'] == "profile_picture" || $_post['post_type'] == "profile_cover" || $_post['post_type'] == "page_picture" || $_post['post_type'] == "page_cover" || $_post['post_type'] == "group_picture" || $_post['post_type'] == "group_cover" || $_post['post_type'] == "event_cover"}
    <div class="mt10 clearfix">
        <div class="pg_wrapper">
            {if $_post['photos_num'] == 1}
                <div class="pg_1x {if $_post['photos'][0]['blur']}x-blured{/if}">
                    <a href="{$system['system_url']}/photos/{$_post['photos'][0]['photo_id']}" class="js_lightbox" data-id="{$_post['photos'][0]['photo_id']}" data-image="{$system['system_uploads']}/{$_post['photos'][0]['source']}" data-context="{if $_post['post_type'] == 'product'}post{else}album{/if}">
                        <img src="{$system['system_uploads']}/{$_post['photos'][0]['source']}">
                    </a>
                </div>
            {elseif $_post['photos_num'] == 2}
                {foreach $_post['photos'] as $photo}
                    <div class="pg_2x {if $photo['blur']}x-blured{/if}">
                        <a href="{$system['system_url']}/photos/{$photo['photo_id']}" class="js_lightbox" data-id="{$photo['photo_id']}" data-image="{$system['system_uploads']}/{$photo['source']}" data-context="post" style="background-image:url('{$system['system_uploads']}/{$photo['source']}');"></a>
                    </div>
                {/foreach}
            {elseif $_post['photos_num'] == 3}
                <div class="pg_3x">
                    <div class="pg_2o3">
                        <div class="pg_2o3_in {if $_post['photos'][0]['blur']}x-blured{/if}">
                            <a href="{$system['system_url']}/photos/{$_post['photos'][0]['photo_id']}" class="js_lightbox" data-id="{$_post['photos'][0]['photo_id']}" data-image="{$system['system_uploads']}/{$_post['photos'][0]['source']}" data-context="post" style="background-image:url('{$system['system_uploads']}/{$_post['photos'][0]['source']}');"></a>
                        </div>
                    </div>
                    <div class="pg_1o3">
                        <div class="pg_1o3_in {if $_post['photos'][1]['blur']}x-blured{/if}">
                            <a href="{$system['system_url']}/photos/{$_post['photos'][1]['photo_id']}" class="js_lightbox" data-id="{$_post['photos'][1]['photo_id']}" data-image="{$system['system_uploads']}/{$_post['photos'][1]['source']}" data-context="post" style="background-image:url('{$system['system_uploads']}/{$_post['photos'][1]['source']}');"></a>
                        </div>
                        <div class="pg_1o3_in {if $_post['photos'][2]['blur']}x-blured{/if}">
                            <a href="{$system['system_url']}/photos/{$_post['photos'][2]['photo_id']}" class="js_lightbox" data-id="{$_post['photos'][2]['photo_id']}" data-image="{$system['system_uploads']}/{$_post['photos'][2]['source']}" data-context="post" style="background-image:url('{$system['system_uploads']}/{$_post['photos'][2]['source']}');"></a>
                        </div>
                    </div>
                </div>
            {else}
                <div class="pg_4x">
                    <div class="pg_2o3">
                        <div class="pg_2o3_in {if $_post['photos'][0]['blur']}x-blured{/if}">
                            <a href="{$system['system_url']}/photos/{$_post['photos'][0]['photo_id']}" class="js_lightbox" data-id="{$_post['photos'][0]['photo_id']}" data-image="{$system['system_uploads']}/{$_post['photos'][0]['source']}" data-context="post" style="background-image:url('{$system['system_uploads']}/{$_post['photos'][0]['source']}');"></a>
                        </div>
                    </div>
                    <div class="pg_1o3">
                        <div class="pg_1o3_in {if $_post['photos'][1]['blur']}x-blured{/if}">
                            <a href="{$system['system_url']}/photos/{$_post['photos'][1]['photo_id']}" class="js_lightbox" data-id="{$_post['photos'][1]['photo_id']}" data-image="{$system['system_uploads']}/{$_post['photos'][1]['source']}" data-context="post" style="background-image:url('{$system['system_uploads']}/{$_post['photos'][1]['source']}');"></a>
                        </div>
                        <div class="pg_1o3_in {if $_post['photos'][2]['blur']}x-blured{/if}">
                            <a href="{$system['system_url']}/photos/{$_post['photos'][2]['photo_id']}" class="js_lightbox" data-id="{$_post['photos'][2]['photo_id']}" data-image="{$system['system_uploads']}/{$_post['photos'][2]['source']}" data-context="post" style="background-image:url('{$system['system_uploads']}/{$_post['photos'][2]['source']}');"></a>
                        </div>
                        <div class="pg_1o3_in {if $_post['photos'][3]['blur']}x-blured{/if}">
                            <a href="{$system['system_url']}/photos/{$_post['photos'][3]['photo_id']}" class="js_lightbox" data-id="{$_post['photos'][3]['photo_id']}" data-image="{$system['system_uploads']}/{$_post['photos'][3]['source']}" data-context="post" style="background-image:url('{$system['system_uploads']}/{$_post['photos'][3]['source']}');">
                                {if $_post['photos_num'] > 4}
                                <span class="more">+{$_post['photos_num']-4}</span>
                                {/if}
                            </a>
                        </div>
                    </div>
                </div>
            {/if}
        </div>
    </div>
{elseif $_post['post_type'] == "media" && $_post['media']}
    <div class="mt10">
        {if $_post['media']['source_type'] == "photo"}
            <div class="post-media">
                <div class="post-media-image">
                    <div style="background-image:url('{$_post['media']['source_url']}');"></div>
                </div>
                <div class="post-media-meta">
                    <div class="source"><a target="_blank" href="{$_post['media']['source_url']}">{$_post['media']['source_provider']}</a></div>
                </div>
            </div>
        {else}
            {if $_post['media']['source_provider'] == "YouTube"}
                {if $system['smart_yt_player']}
                    {$_post['media']['vidoe_id'] = get_youtube_id($_post['media']['source_html'])}
                    <div class="youtube-player" data-id="{$_post['media']['vidoe_id']}">
                        <img src="https://i.ytimg.com/vi/{$_post['media']['vidoe_id']}/hqdefault.jpg">
                        <div class="play"></div>
                    </div>
                {else}
                    <div class="post-media">
                        <div class="embed-responsive embed-responsive-16by9">
                            {html_entity_decode($_post['media']['source_html'], ENT_QUOTES)}
                        </div>
                    </div>
                    <div class="post-media-meta">
                        <a class="title mb5" href="{$_post['media']['source_url']}" target="_blank">{$_post['media']['source_title']}</a>
                        <div class="text mb5">{$_post['media']['source_text']}</div>
                        <div class="source">{$_post['media']['source_provider']}</div>
                    </div>
                {/if}
                    
            {elseif $_post['media']['source_provider'] == "Vimeo" || $_post['media']['source_provider'] == "SoundCloud" || $_post['media']['source_provider'] == "Vine"}
                <div class="post-media">
                    <div class="embed-responsive embed-responsive-16by9">
                        {html_entity_decode($_post['media']['source_html'], ENT_QUOTES)}
                    </div>
                </div>
                <div class="post-media-meta">
                    <a class="title mb5" href="{$_post['media']['source_url']}" target="_blank">{$_post['media']['source_title']}</a>
                    <div class="text mb5">{$_post['media']['source_text']}</div>
                    <div class="source">{$_post['media']['source_provider']}</div>
                </div>
            {else}
                <div class="embed-ifram-wrapper">
                    {html_entity_decode($_post['media']['source_html'], ENT_QUOTES)}
                </div>
            {/if}
        {/if}
    </div>
{elseif $_post['post_type'] == "link" && $_post['link']}
    <div class="mt10">
        <div class="post-media">
            {if $_post['link']['source_thumbnail']}
                <div class="post-media-image">
                    <div style="background-image:url('{$_post['link']['source_thumbnail']}');"></div>
                </div>
            {/if}
            <div class="post-media-meta">
                <a class="title mb5" href="{$_post['link']['source_url']}" target="_blank">{$_post['link']['source_title']}</a>
                <div class="text mb5">{$_post['link']['source_text']}</div>
                <div class="source">{$_post['link']['source_host']|upper}</div>
            </div>
        </div>
    </div>
{elseif $_post['post_type'] == "poll" && $_post['poll']}
    <div class="poll-options mt10" data-poll-votes="{$_post['poll']['votes']}">
        {foreach $_post['poll']['options'] as $option}
            <div class="mb5">
                <div class="poll-option js_poll-vote" data-id="{$option['option_id']}" data-option-votes="{$option['votes']}">
                    <div class="percentage-bg" {if $_post['poll']['votes'] > 0} style="width: {($option['votes']/$_post['poll']['votes'])*100}%"{/if}></div>
                    <div class="custom-control custom-radio custom-control-inline">
                        <input type="radio" name="poll_{$_post['poll']['poll_id']}" id="option_{$option['option_id']}" class="custom-control-input" {if $option['checked']}checked{/if}>
                        <label class="custom-control-label" for="option_{$option['option_id']}">{$option['text']}</label>
                    </div>
                </div>
                <div class="poll-voters">
                    <div class="more" data-toggle="modal" data-url="posts/who_votes.php?option_id={$option['option_id']}">
                        {$option['votes']}
                    </div>
                </div>
            </div>
        {/foreach}
    </div>
{elseif $_post['post_type'] == "article" && $_post['article']}
    <div class="mt10">
        <div class="post-media">
            {if $_post['article']['cover']}
                <a class="post-media-image" href="{$system['system_url']}/blogs/{$_post['post_id']}/{$_post['article']['title_url']}">
                    <div style="padding-top: 50%; background-image:url('{$system['system_uploads']}/{$_post['article']['cover']}');"></div>
                </a>
            {/if}
            <div class="post-media-meta">
                <a class="title mb5" href="{$system['system_url']}/blogs/{$_post['post_id']}/{$_post['article']['title_url']}">{$_post['article']['title']}</a>
                <div class="text mb5">{$_post['article']['text_snippet']|truncate:400}</div>
            </div>
        </div>
    </div>
{elseif $_post['post_type'] == "video" && $_post['video']}
    <div>
        <video id="video-{$_post['video']['video_id']}{if $pinned || $boosted}-{$_post['post_id']}{/if}" class="js_fluidplayer" {if $user->_logged_in}onplay="update_media_views('video', {$_post['video']['video_id']})"{/if} {if $_post['video']['thumbnail']}poster="{$system['system_uploads']}/{$_post['video']['thumbnail']}"{/if} style="width:100%;height:100%;" width="100%" height="100%" control preload="auto">
            <source src="{$system['system_uploads']}/{$_post['video']['source']}" type="video/mp4">
            <source src="{$system['system_uploads']}/{$_post['video']['source']}" type="video/webm">
        </video>
    </div>
{elseif $_post['post_type'] == "audio" && $_post['audio']}
    <div>
        <audio id="audio-{$_post['audio']['audio_id']}" {if $user->_logged_in}onplay="update_media_views('audio', {$_post['audio']['audio_id']})"{/if} controls preload="auto" style="width: 100%;">
            <source src="{$system['system_uploads']}/{$_post['audio']['source']}" type="audio/mpeg">
            <source src="{$system['system_uploads']}/{$_post['audio']['source']}" type="audio/mp3">
            {__("Your browser does not support HTML5 audio")}
        </audio>
    </div>
{elseif $_post['post_type'] == "file" && $_post['file']}
    <div class="post-downloader">
        <div class="icon">
            <i class="fa fa-file-alt fa-2x"></i>
        </div>
        <div class="info">
            <strong>{__("File Type")}</strong>: {get_extension({$_post['file']['source']})}
            <div class="mt10">
                <a class="btn btn-primary btn-sm" href="{$system['system_uploads']}/{$_post['file']['source']}">{__("Download")}</a>
            </div>
        </div>
    </div>
{elseif $_post['post_type'] == "map"}
    <div class="post-map">
        <img src="https://maps.googleapis.com/maps/api/staticmap?center={$_post['location']}&amp;zoom=13&amp;size=600x250&amp;maptype=roadmap&amp;markers=color:red%7C{$_post['location']}&amp;key={$system['geolocation_key']}" width="100%">
    </div>
{elseif !$_shared && $_post['post_type'] == "shared" && $_post['origin']}
    {if $_snippet}
    <span class="text-link js_show-attachments">{__("Show Attachments")}</span>
    {/if}
    <div class="mt10 {if $_snippet}x-hidden{/if}">
        <div class="post-media">
            <div class="post-media-meta">
            {include file='__feeds_post.body.tpl' _post=$_post['origin'] _shared=true}
            </div>
        </div>
    </div>
{/if}

<!-- product -->
{if $_post['post_type'] == "product"}
    <div class="mtb10 text-lg">
        <strong>{$_post['product']['name']}</strong>
    </div>
    {if $_post['product']['location']}
        <div class="mb10 text-muted">
            <i class="fa fa-map-marker fa-fw"></i> {$_post['product']['location']}
        </div>
    {/if}
    <!-- post text -->
    {if !$_shared}
        {include file='__feeds_post.text.tpl'}
    {else}
        <div class="post-text js_readmore text-muted" dir="auto">{$_post['text']}</div>
        <div class="post-text-translation x-hidden" dir="auto"></div>
    {/if}
    <!-- post text -->
    <div class="post-product-wrapper mt10">
        <div class="post-product-details">
            <div class="title">
                <i class="fa fa-tag fa-fw mr5" style="color: #1f9cff;"></i>{__("Type")}
            </div>
            <div class="description">
                {if $_post['product']['status'] == "new"}
                    {__("New")}
                {else}
                    {__("Used")}
                {/if}
            </div>
        </div>
        <div class="post-product-details">
            <div class="title">
                <i class="fa fa-money-bill-alt fa-fw mr5" style="color: #2bb431;"></i>{__("Price")}
            </div>
            <div class="description">
                {if $_post['product']['price'] > 0}
                    {$system['system_currency_symbol']}{$_post['product']['price']} ({$system['system_currency']})
                {else}
                    {__("Free")}
                {/if}
            </div>
        </div>
        <div class="post-product-details">
            <div class="title">
                <i class="fa fa-box fa-fw mr5" style="color: #a038b2;"></i>{__("Status")}
            </div>
            <div class="description">
                {if $_post['product']['available']}
                    {__("In stock")}
                {else}
                    {__("SOLD")}
                {/if}
            </div>
        </div>
    </div>
    {if $_post['author_id'] != $user->_data['user_id'] }
        <div class="mt10 clearfix">
            <button type="button" class="btn btn-sm btn-primary float-right js_chat-start" data-uid="{$_post['author_id']}" data-name="{$_post['post_author_name']}">
                <i class="fa fa-comments mr5"></i>{__("Contact Seller")}
            </button>
        </div>
    {/if}
{/if}
<!-- product -->