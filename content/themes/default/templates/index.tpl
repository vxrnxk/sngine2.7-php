{include file='_head.tpl'}
{include file='_header.tpl'}

<!-- page content -->
{if !$user->_logged_in}
    
    <div class="container pt30">
        <div class="index-intro">
            <h1>
                {__("Welcome to")} {$system['system_title']}
            </h1>
            <p>
                {__("Share your memories, connect with others, make new friends")}
            </p>
        </div>
        <div class="row">
            <div class="col-md-6 col-lg-7">
                <img style="width: 100%; max-height: 500px;" class="d-none d-md-block" src="{$system['system_url']}/content/themes/{$system['theme']}/images/home/drawkit-nature-man-colour.svg">
            </div>

            <div class="col-md-6 col-lg-5">
                {include file='_sign_form.tpl'}
            </div>
        </div>
    </div>

    {include file='_footer.links.tpl'}

{else}

    <div class="container mt20 offcanvas">
        <div class="row">

            <!-- side panel -->
            <div class="col-md-4 col-lg-3 offcanvas-sidebar js_sticky-sidebar">
                {include file='_sidebar.tpl'}
            </div>
            <!-- side panel -->

            <!-- content panel -->
            <div class="col-md-8 col-lg-9 offcanvas-mainbar">
                <div class="row">
                    <!-- center panel -->
                    <div class="col-lg-8">

                        <!-- announcments -->
                        {include file='_announcements.tpl'}
                        <!-- announcments -->

                        {if $view == ""}

                            <!-- stories -->
                            {if $system['stories_enabled']}
                                <div class="card">
                                    <div class="card-header bg-transparent border-bottom-0">
                                        <strong class="text-muted">{__("Stories")}</strong>
                                        {if $has_story}
                                            <div class="float-right">
                                                <button data-toggle="tooltip" data-placement="top" title='{__("Delete Your Story")}' class="btn btn-sm btn-icon btn-rounded btn-danger js_story-deleter">
                                                    <i class="fa fa-trash-alt"></i>
                                                </button>
                                            </div>
                                        {else}
                                            <div class="d-none d-sm-block text-muted pointer float-right">
                                                <i class="fa fa-info-circle" data-toggle="tooltip" data-placement="top" title='{__("Stories are photos and videos that only last 24 hours")}'></i>
                                            </div>
                                        {/if}
                                            
                                    </div>
                                    <div class="card-body pt5 stories-wrapper">
                                        <div id="stories" data-json='{$stories["json"]}'>
                                            <div class="add-story" data-toggle="modal" data-url="posts/story.php?do=create">
                                                <div class="img" style="background-image:url({$user->_data['user_picture']});">
                                                </div>
                                                <div class="add">
                                                    <i class="fa fa-plus-circle"></i>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            {/if}
                            <!-- stories -->

                            <!-- publisher -->
                            {include file='_publisher.tpl' _handle="me" _privacy=true}
                            <!-- publisher -->

                            <!-- boosted post -->
                            {if $boosted_post}
                                {include file='_boosted_post.tpl' post=$boosted_post}
                            {/if}
                            <!-- boosted post -->

                            <!-- posts -->
                            {include file='_posts.tpl' _get="newsfeed"}
                            <!-- posts -->

                        {elseif $view == "popular"}
                            <!-- popular posts -->
                            {include file='_posts.tpl' _get="popular" _title=__("Popular Posts")}
                            <!-- popular posts -->

                        {elseif $view == "discover"}
                            <!-- discover posts -->
                            {include file='_posts.tpl' _get="discover" _title=__("Discover Posts")}
                            <!-- discover posts -->

                        {elseif $view == "saved"}
                            <!-- saved posts -->
                            {include file='_posts.tpl' _get="saved" _title=__("Saved Posts")}
                            <!-- saved posts -->

                        {elseif $view == "memories"}
                            <!-- page header -->
                            <div class="page-header mini rounded-top mb10">
                                <div class="crystal c03"></div>
                                <div class="circle-1"></div>
                                <div class="circle-2"></div>
                                <div class="inner">
                                    <h2>{__("Memories")}</h2>
                                    <p>{__("Enjoy looking back on your memories")}</p>
                                </div>
                            </div>
                            <!-- page header -->

                            <!-- memories posts -->
                            {include file='_posts.tpl' _get="memories" _title=__("ON THIS DAY") _filter="all"}
                            <!-- memories posts -->

                        {elseif $view == "articles"}
                            <!-- articles posts -->
                            {include file='_posts.tpl' _get="posts_profile" _id=$user->_data['user_id'] _filter="article" _title=__("My Articles")}
                            <!-- articles posts -->

                        {elseif $view == "products"}
                            <!-- products posts -->
                            {include file='_posts.tpl' _get="posts_profile" _id=$user->_data['user_id'] _filter="product" _title=__("My Products")}
                            <!-- products posts -->

                        {elseif $view == "boosted_posts"}
                            {if $user->_is_admin || $user->_data['user_subscribed']}
                                <!-- boosted posts -->
                                {include file='_posts.tpl' _get="boosted" _title=__("My Boosted Posts")}
                                <!-- boosted posts -->
                            {else}
                                <!-- upgrade -->
                                <div class="alert alert-warning">
                                    <div class="icon">
                                        <i class="fa fa-id-card fa-2x"></i>
                                    </div>
                                    <div class="text">
                                        <strong>{__("Membership")}</strong><br>
                                        {__("Choose the Plan That's Right for You")}, {__("Check the package from")} <a href="{$system['system_url']}/packages">{__("Here")}</a>
                                    </div>
                                </div>
                                <div class="text-center">
                                    <a href="{$system['system_url']}/packages" class="btn btn-primary"><i class="fa fa-rocket mr5"></i>{__("Upgrade to Pro")}</a>
                                </div>
                                <!-- upgrade -->
                            {/if}

                        {elseif $view == "boosted_pages"}
                            {if $user->_is_admin || $user->_data['user_subscribed']}
                                <div class="card">
                                    <div class="card-header">
                                        <strong>{__("My Boosted Pages")}</strong>
                                    </div>
                                    <div class="card-body">
                                        {if $boosted_pages}
                                            <ul>
                                                {foreach $boosted_pages as $_page}
                                                    {include file='__feeds_page.tpl' _tpl="list"}
                                                {/foreach}
                                            </ul>

                                            {if count($boosted_pages) >= $system['max_results_even']}
                                            <!-- see-more -->
                                            <div class="alert alert-info see-more js_see-more" data-get="boosted_pages">
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
                                    </div>
                                </div>
                            {else}
                                <!-- upgrade -->
                                <div class="alert alert-warning">
                                    <div class="icon">
                                        <i class="fa fa-id-card fa-2x"></i>
                                    </div>
                                    <div class="text">
                                        <strong>{__("Membership")}</strong><br>
                                        {__("Choose the Plan That's Right for You")}, {__("Check the package from")} <a href="{$system['system_url']}/packages">{__("Here")}</a>
                                    </div>
                                </div>
                                <div class="text-center">
                                    <a href="{$system['system_url']}/packages" class="btn btn-primary"><i class="fa fa-rocket mr5"></i>{__("Upgrade to Pro")}</a>
                                </div>
                                <!-- upgrade -->
                            {/if}

                        {/if}
                    </div>
                    <!-- center panel -->

                    <!-- right panel -->
                    <div class="col-lg-4 js_sticky-sidebar">
                        
                        <!-- pro users -->
                        {if $pro_members}
                            <div class="card bg-gradient-indigo border-0">
                                <div class="card-header ptb20 bg-transparent border-bottom-0">
                                    {if $system['packages_enabled'] && !$user->_data['user_subscribed']}
                                        <div class="float-right">
                                            <small><a class="text-white text-underline" href="{$system['system_url']}/packages">{__("Upgrade")}</a></small>
                                        </div>
                                    {/if}
                                    <h6 class="pb0"><i class="fa fa-user-shield mr5"></i> {__("Pro Users")}</h6>
                                </div>
                                <div class="card-body pt0 plr5">
                                    <div class="pro-box-wrapper {if count($pro_members) > 3}js_slick{else}full-opacity{/if}">
                                        {foreach $pro_members as $_member}
                                            <a class="user-box text-white" href="{$system['system_url']}/{$_member['user_name']}">
                                                <img alt="{$_member['user_firstname']} {$_member['user_lastname']}" src="{$_member['user_picture']}" />
                                                <div class="name" title="{$_member['user_firstname']} {$_member['user_lastname']}">
                                                    {$_member['user_firstname']} {$_member['user_lastname']}
                                                </div>
                                            </a>
                                        {/foreach}
                                    </div>
                                </div>
                            </div>
                        {/if}
                        <!-- pro users -->

                        <!-- pro pages -->
                        {if $promoted_pages}
                            <div class="card bg-gradient-teal border-0">
                                <div class="card-header ptb20 bg-transparent border-bottom-0">
                                    {if $system['packages_enabled'] && !$user->_data['user_subscribed']}
                                        <div class="float-right">
                                            <small><a class="text-white text-underline" href="{$system['system_url']}/packages">{__("Upgrade")}</a></small>
                                        </div>
                                    {/if}
                                    <h6 class="pb0"><i class="fa fa-flag-checkered mr5"></i> {__("Pro Pages")}</h6>
                                </div>
                                <div class="card-body pt0 plr5">
                                    <div class="pro-box-wrapper {if count($promoted_pages) > 3}js_slick{else}full-opacity{/if}">
                                        {foreach $promoted_pages as $_page}
                                            <a class="user-box text-white" href="{$system['system_url']}/pages/{$_page['page_name']}">
                                                <img alt="{$_page['page_title']}" src="{$_page['page_picture']}" />
                                                <div class="name" title="{$_page['page_title']}">
                                                    {$_page['page_title']}
                                                </div>
                                            </a>
                                        {/foreach}
                                    </div>
                                </div>
                            </div>
                        {/if}
                        <!-- pro pages -->

                        <!-- trending -->
                        {if $trending_hashtags}
                            <div class="card bg-gradient-red border-0">
                                <div class="card-header pt20 pb10 bg-transparent border-bottom-0">
                                    <h6 class="mb0"><i class="fa fa-fire mr5"></i> {__("Trending")}</h6>
                                </div>
                                <div class="card-body pt0">
                                    {foreach $trending_hashtags as $hashtag}
                                        <a class="trending-item" href="{$system['system_url']}/search/hashtag/{$hashtag['hashtag']}">
                                            <span class="hash">
                                                #{$hashtag['hashtag']}
                                            </span>
                                            <span class="frequency">
                                                {$hashtag['frequency']} {__("Posts")}
                                            </span>
                                        </a>
                                    {/foreach}
                                </div>
                            </div>
                        {/if}
                        <!-- trending -->

                        {include file='_ads_campaigns.tpl'}
                        {include file='_ads.tpl'}
                        {include file='_widget.tpl'}

                        <!-- friend suggestions -->
                        {if $new_people}
                            <div class="card">
                                <div class="card-header bg-transparent">
                                    <div class="float-right">
                                        <small><a href="{$system['system_url']}/people">{__("See All")}</a></small>
                                    </div>
                                    {__("Friend Suggestions")}
                                </div>
                                <div class="card-body with-list">
                                    <ul>
                                        {foreach $new_people as $_user}
                                        {include file='__feeds_user.tpl' _tpl="list" _connection="add" _small=true}
                                        {/foreach}
                                    </ul>
                                </div>
                            </div>
                        {/if}
                         <!-- friend suggestions -->

                        <!-- suggested pages -->
                        {if $new_pages}
                            <div class="card">
                                <div class="card-header bg-transparent">
                                    <div class="float-right">
                                        <small><a href="{$system['system_url']}/pages">{__("See All")}</a></small>
                                    </div>
                                    {__("Suggested Pages")}
                                </div>
                                <div class="card-body with-list">
                                    <ul>
                                        {foreach $new_pages as $_page}
                                        {include file='__feeds_page.tpl' _tpl="list"}
                                        {/foreach}
                                    </ul>
                                </div>
                            </div>
                        {/if}
                        <!-- suggested pages -->

                        <!-- suggested groups -->
                        {if $new_groups}
                            <div class="card">
                                <div class="card-header bg-transparent">
                                    <div class="float-right">
                                        <small><a href="{$system['system_url']}/groups">{__("See All")}</a></small>
                                    </div>
                                    {__("Suggested Groups")}
                                </div>
                                <div class="card-body with-list">
                                    <ul>
                                        {foreach $new_groups as $_group}
                                        {include file='__feeds_group.tpl' _tpl="list"}
                                        {/foreach}
                                    </ul>
                                </div>
                            </div>
                        {/if}
                        <!-- suggested groups -->

                        <!-- suggested events -->
                        {if $new_events}
                            <div class="card">
                                <div class="card-header bg-transparent">
                                    <div class="float-right">
                                        <small><a href="{$system['system_url']}/events">{__("See All")}</a></small>
                                    </div>
                                    {__("Suggested Events")}
                                </div>
                                <div class="card-body with-list">
                                    <ul>
                                        {foreach $new_events as $_event}
                                        {include file='__feeds_event.tpl' _tpl="list" _small=true}
                                        {/foreach}
                                    </ul>
                                </div>
                            </div>
                        {/if}
                        <!-- suggested events -->

                        <!-- invitation widget -->
                        {if $system['invitation_widget_enabled']}
                            <div class="card">
                                <div class="card-header bg-transparent">
                                    <i class="fa fa-envelope-open-text mr5"></i> {__("Invite Your Friends")}
                                </div>
                                <div class="card-body with-form">
                                    <form class="js_ajax-forms" data-url="users/invitation.php">
                                        <div class="form-group">
                                            <div class="input-group">
                                                <input type="text" class="form-control" name="email" placeholder='{__("Email")}'>
                                                <div class="input-group-append">
                                                    <button type="submit" name="submit" class="btn btn-primary plr20"><i class="fas fa-paper-plane"></i></button>
                                                </div>
                                            </div>
                                        </div>

                                        <!-- success -->
                                        <div class="alert alert-success mb0 x-hidden"></div>
                                        <!-- success -->

                                        <!-- error -->
                                        <div class="alert alert-danger mb0 x-hidden"></div>
                                        <!-- error -->
                                    </form>
                                </div>
                            </div>
                        {/if}
                        <!-- invitation widget -->

                        <!-- mini footer -->
                        {if $new_people || $new_pages || $new_groups || $new_events}
                            <div class="mtb20 plr10 d-none d-sm-block">
                                <div class="col-12 mb5">
                                    {if $static_pages}
                                        {foreach $static_pages as $static_page}
                                            <a href="{$system['system_url']}/static/{$static_page['page_url']}">
                                                {$static_page['page_title']}
                                            </a>{if !$static_page@last} · {/if}
                                        {/foreach}
                                    {/if}
                                    {if $system['contact_enabled']}
                                         · 
                                        <a href="{$system['system_url']}/contacts">
                                            {__("Contacts Us")}
                                        </a>
                                    {/if}
                                    {if $system['developers_apps_enabled'] || $system['developers_share_enabled']}
                                         · 
                                        <a href="{$system['system_url']}/developers{if !$system['developers_apps_enabled']}/share{/if}">
                                            {__("Developers")}
                                        </a>
                                    {/if}
                                    {if $system['directory_enabled']}
                                         · 
                                        <a href="{$system['system_url']}/directory">
                                            {__("Directory")}
                                        </a>
                                    {/if}
                                    {if $system['market_enabled']}
                                         · 
                                        <a href="{$system['system_url']}/market">
                                            {__("Market")}
                                        </a>
                                    {/if}
                                    {if $system['forums_enabled']}
                                         · 
                                        <a href="{$system['system_url']}/forums">
                                            {__("Forums")}
                                        </a>
                                    {/if}
                                </div>
                                <div class="col-12">
                                    &copy; {'Y'|date} {$system['system_title']} · <span class="text-link" data-toggle="modal" data-url="#translator">{$system['language']['title']}</span>
                                </div>
                            </div>
                        {/if}
                        <!-- mini footer -->
                        
                    </div>
                    <!-- right panel -->
                </div>
            </div>
            <!-- content panel -->

        </div>
    </div>

{/if}
<!-- page content -->

{include file='_footer.tpl'}