{include file='_head.tpl'}
{include file='_header.tpl'}

<!-- page header -->
<div class="page-header bg-1">
    <img class="floating-img d-none d-md-block" src="{$system['system_url']}/content/themes/{$system['theme']}/images/headers/undraw_bookmarks_r6up.svg">
    <div class="crystal c03"></div>
    <div class="circle-2"></div>
    <div class="circle-3"></div>
    <div class="inner">
        <h2>{__("Directory")}</h2>
        <p>{__("Discover new people, create new connections and make new friends")}</p>
    </div>
</div>
<!-- page header -->

<!-- page content -->
{if $view == ""}

    <div class="container {if $user->_logged_in}offcanvas{/if}" style="margin-top: -25px;">
        <div class="row">
            <!-- side panel -->
            {if $user->_logged_in}
                <div class="col-12 d-block d-sm-none offcanvas-sidebar">
                    {include file='_sidebar.tpl'}
                </div>
            {/if}
            <!-- side panel -->

            <!-- content panel -->
            <div class="col-12 {if $user->_logged_in}offcanvas-mainbar{/if}">
                <div class="card border-0 shadow">
                    <div class="card-body page-content pb25">
                        <div class="row">
                            <div class="col-sm-6 col-md-6 col-lg-4 mb25">
                                <a href="{$system['system_url']}/directory/posts" class="directory-card">
                                    <img src="{$system['system_url']}/content/themes/{$system['theme']}/images/directory/newsfeed.png">
                                    <h5 class="title">{__("News Feed")}</h5>
                                    <p>
                                        {__("See what everyone’s up to and what’s on their minds")}
                                    </p>
                                </a>
                            </div>
                            <div class="col-sm-6 col-md-6 col-lg-4 mb25">
                                <a href="{$system['system_url']}/directory/users" class="directory-card">
                                    <img src="{$system['system_url']}/content/themes/{$system['theme']}/images/directory/users.png">
                                    <h5 class="title">{__("Users")}</h5>
                                    <p>
                                        {__("Help friends know you better and show them what you have in common")}
                                    </p>
                                </a>
                            </div>
                            <div class="col-sm-6 col-md-6 col-lg-4 mb25">
                                <a href="{$system['system_url']}/directory/pages" class="directory-card">
                                    <img src="{$system['system_url']}/content/themes/{$system['theme']}/images/directory/pages.png">
                                    <h5 class="title">{__("Pages")}</h5>
                                    <p>
                                        {__("Never miss a thing out! Keep in touch with your fans and customers")}
                                    </p>
                                </a>
                            </div>
                            <div class="col-sm-6 col-md-6 col-lg-4 mb25">
                                <a href="{$system['system_url']}/directory/groups" class="directory-card">
                                    <img src="{$system['system_url']}/content/themes/{$system['theme']}/images/directory/groups.png">
                                    <h5 class="title">{__("Groups")}</h5>
                                    <p>
                                        {__("Communicate and collaborate with the people who share your interests")}
                                    </p>
                                </a>
                            </div>
                            <div class="col-sm-6 col-md-6 col-lg-4 mb25">
                                <a href="{$system['system_url']}/directory/events" class="directory-card">
                                    <img src="{$system['system_url']}/content/themes/{$system['theme']}/images/directory/events.png">
                                    <h5 class="title">{__("Events")}</h5>
                                    <p>
                                        {__("Members can organize community events for online and offline doings")}
                                    </p>
                                </a>
                            </div>
                            {if $system['forums_enabled']}
                                <div class="col-sm-6 col-md-6 col-lg-4 mb25">
                                    <a href="{$system['system_url']}/forums" class="directory-card">
                                        <img src="{$system['system_url']}/content/themes/{$system['theme']}/images/directory/forums.png">
                                        <h5 class="title">{__("Forums")}</h5>
                                        <p>
                                            {__("Members can hold conversations in the form of posted messages")}
                                        </p>
                                    </a>
                                </div>
                            {elseif $system['games_enabled']}
                                <div class="col-sm-6 col-md-6 col-lg-4 mb25">
                                    <a href="{$system['system_url']}/directory/games" class="directory-card">
                                        <img src="{$system['system_url']}/content/themes/{$system['theme']}/images/directory/photos.png">
                                        <h5 class="title">{__("Games")}</h5>
                                        <p>
                                            {__("Playing games always fun, Play with the people who share your interests")}
                                        </p>
                                    </a>
                                </div>
                            {else}
                                <div class="col-sm-6 col-md-6 col-lg-4 mb25">
                                    <a href="{$system['system_url']}/search" class="directory-card">
                                        <img src="{$system['system_url']}/content/themes/{$system['theme']}/images/directory/search.png">
                                        <h5 class="title">{__("Games")}</h5>
                                        <p>
                                            {__("Discover new people, create new connections and make new friends")}
                                        </p>
                                    </a>
                                </div>
                            {/if}
                        </div>
                    </div>
                </div>
            </div>
            <!-- content panel -->
        </div>
    </div>

{else}

    <div class="container mt20 offcanvas">
        <div class="row">

            <!-- left panel -->
            <div class="col-md-4 col-lg-3 offcanvas-sidebar">
                <div class="card">
                    <div class="card-body with-nav">
                        <ul class="side-nav">
                            <li {if $view == "posts"}class="active"{/if}>
                                <a href="{$system['system_url']}/directory/posts"><i class="fa fa-newspaper fa-fw mr10"></i> {__("Posts")}</a>
                            </li>
                            <li {if $view == "users"}class="active"{/if}>
                                <a href="{$system['system_url']}/directory/users"><i class="fa fa-user fa-fw mr10"></i> {__("Users")}</a>
                            </li>
                            <li {if $view == "pages"}class="active"{/if}>
                                <a href="{$system['system_url']}/directory/pages"><i class="fa fa-flag fa-fw mr10"></i> {__("Pages")}</a>
                            </li>
                            <li {if $view == "groups"}class="active"{/if}>
                                <a href="{$system['system_url']}/directory/groups"><i class="fa fa-users fa-fw mr10"></i> {__("Groups")}</a>
                            </li>
                            <li {if $view == "events"}class="active"{/if}>
                                <a href="{$system['system_url']}/directory/events"><i class="fa fa-calendar fa-fw mr10"></i> {__("Events")}</a>
                            </li>
                            {if $system['games_enabled']}
                                <li {if $view == "games"}class="active"{/if}>
                                    <a href="{$system['system_url']}/directory/games"><i class="fa fa-gamepad fa-fw mr10"></i> {__("Games")}</a>
                                </li>
                            {/if}
                            <li>
                                <a href="{$system['system_url']}/search"><i class="fa fa-search fa-fw mr10"></i> {__("Search")}</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- left panel -->

            <!-- right panel -->
            <div class="col-md-8 col-lg-9 offcanvas-mainbar">
                <div class="row">
                    <!-- center panel -->
                    <div class="col-lg-8">
                        {if $view == "posts"}
                            {if count($rows) > 0}
                                <ul>
                                    {foreach $rows as $post}
                                    {include file='__feeds_post.tpl'}
                                    {/foreach}
                                </ul>
                                {$pager}
                            {else}
                                <p class="text-center text-muted">
                                    {__("No posts to show")}
                                </p>
                            {/if}

                        {elseif $view == "users"}
                            {if count($rows) > 0}
                                <ul>
                                    {foreach $rows as $_user}
                                    {include file='__feeds_user.tpl' _tpl="list" _connection=$_user["connection"]}
                                    {/foreach}
                                </ul>
                                {$pager}
                            {else}
                                <p class="text-center text-muted">
                                    {__("No users to show")}
                                </p>
                            {/if}

                        {elseif $view == "pages"}
                            {if count($rows) > 0}
                                <ul>
                                    {foreach $rows as $_page}
                                    {include file='__feeds_page.tpl' _tpl="list"}
                                    {/foreach}
                                </ul>
                                {$pager}
                            {else}
                                <p class="text-center text-muted">
                                    {__("No pages to show")}
                                </p>
                            {/if}

                        {elseif $view == "groups"}
                            {if count($rows) > 0}
                                <ul>
                                    {foreach $rows as $_group}
                                    {include file='__feeds_group.tpl' _tpl="list"}
                                    {/foreach}
                                </ul>
                                {$pager}
                            {else}
                                <p class="text-center text-muted">
                                    {__("No groups to show")}
                                </p>
                            {/if}

                        {elseif $view == "events"}
                            {if count($rows) > 0}
                                <ul>
                                    {foreach $rows as $_event}
                                    {include file='__feeds_event.tpl' _tpl="list"}
                                    {/foreach}
                                </ul>
                                {$pager}
                            {else}
                                <p class="text-center text-muted">
                                    {__("No events to show")}
                                </p>
                            {/if}

                        {elseif $view == "games"}
                            {if count($rows) > 0}
                                <ul>
                                    {foreach $rows as $_game}
                                    {include file='__feeds_game.tpl' _tpl="list"}
                                    {/foreach}
                                </ul>
                                {$pager}
                            {else}
                                <p class="text-center text-muted">
                                    {__("No games to show")}
                                </p>
                            {/if}

                        {/if}
                    </div>
                    <!-- center panel -->

                    <!-- right panel -->
                    <div class="col-lg-4">
                        {include file='_ads_campaigns.tpl'}
                        {include file='_ads.tpl'}
                        {include file='_widget.tpl'}
                    </div>
                    <!-- right panel -->
                </div>
            </div>
            <!-- right panel -->

        </div>
    </div>

{/if}
<!-- page content -->

{include file='_footer.tpl'}