{include file='_head.tpl'}
{include file='_header.tpl'}

<!-- page header -->
<div class="page-header bg-1">
    <img class="floating-img d-none d-md-block" src="{$system['system_url']}/content/themes/{$system['theme']}/images/headers/hugo-searching.png">
    <div class="crystal c03"></div>
    <div class="circle-2"></div>
    <div class="circle-3"></div>
    <div class="inner">
        <h2>{__("Search")}</h2>
        <p>{__("Discover new people, create new connections and make new friends")}</p>
    </div>
</div>
<!-- page header -->

<!-- page content -->
<div class="container {if $user->_logged_in}offcanvas{/if}" style="margin-top: -45px;">
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
            <!-- search form -->
            <div class="card">
                <div class="card-body">
                    <form class="js_search-form">
                        <div class="form-group mb0">
                            <div class="input-group">
                                <input type="text" class="form-control" name="query" placeholder='{__("Search for people, pages and #hashtags")}' {if $query}value="{$query}"{/if} >
                                <div class="input-group-append">
                                    <button type="submit" name="submit" class="btn btn-danger plr30"><i class="fas fa-search mr10"></i>{__("Search")}</button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <!-- search form -->

            <div class="row">
                <!-- left panel -->
                <div class="col-lg-8">
                    <!-- panel nav -->
                    <ul class="nav nav-pills nav-fill nav-search mb10">
                        <li class="nav-item">
                            <a class="nav-link rounded-pill active" href="#posts" data-toggle="tab">
                                <i class="fa fa-newspaper mr5"></i><strong>{__("Posts")}</strong>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link rounded-pill" href="#articles" data-toggle="tab">
                                <i class="fab fa-blogger-b mr5"></i><strong>{__("Articles")}</strong>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link rounded-pill" href="#users" data-toggle="tab">
                                <i class="fa fa-user mr5"></i><strong>{__("Users")}</strong>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link rounded-pill" href="#pages" data-toggle="tab">
                                <i class="fa fa-flag mr5"></i><strong>{__("Pages")}</strong>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link rounded-pill" href="#groups" data-toggle="tab">
                                <i class="fa fa-users mr5"></i><strong>{__("Groups")}</strong>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link rounded-pill" href="#events" data-toggle="tab">
                                <i class="fa fa-calendar mr5"></i><strong>{__("Events")}</strong>
                            </a>
                        </li>
                    </ul>
                    <!-- panel nav -->
                    
                    <div class="tab-content">

                        <!-- posts -->
                        <div class="tab-pane active" id="posts">
                            {if count($results['posts']) > 0}
                                <ul>
                                    {foreach $results['posts'] as $post}
                                    {include file='__feeds_post.tpl'}
                                    {/foreach}
                                </ul>
                            {else}
                                <div class="text-center text-muted mtb10">
                                    <img width="25%" src="{$system['system_url']}/content/themes/{$system['theme']}/images/no_results.png">
                                    <p class="mt10 mb10"><strong>{__("No results to show")}</strong></p>
                                </div>
                            {/if}
                        </div>
                        <!-- posts -->

                        <!-- blogd -->
                        {if $system['blogs_enabled']}
                            <div class="tab-pane" id="articles">
                                {if count($results['articles']) > 0}
                                    <ul>
                                        {foreach $results['articles'] as $post}
                                        {include file='__feeds_post.tpl'}
                                        {/foreach}
                                    </ul>
                                {else}
                                    <div class="text-center text-muted mtb10">
                                        <img width="25%" src="{$system['system_url']}/content/themes/{$system['theme']}/images/no_results.png">
                                        <p class="mt10 mb10"><strong>{__("No results to show")}</strong></p>
                                    </div>
                                {/if}
                            </div>
                        {/if}
                        <!-- blogs -->

                        <!-- users -->
                        <div class="tab-pane" id="users">
                            {if count($results['users']) > 0}
                                <ul>
                                    {foreach $results['users'] as $_user}
                                    {include file='__feeds_user.tpl' _tpl="list" _connection=$_user['connection']}
                                    {/foreach}
                                </ul>
                            {else}
                                <div class="text-center text-muted mtb10">
                                    <img width="25%" src="{$system['system_url']}/content/themes/{$system['theme']}/images/no_results.png">
                                    <p class="mt10 mb10"><strong>{__("No results to show")}</strong></p>
                                </div>
                            {/if}
                        </div>
                        <!-- users -->

                        <!-- pages -->
                        <div class="tab-pane" id="pages">
                            {if count($results['pages']) > 0}
                                <ul>
                                    {foreach $results['pages'] as $_page}
                                    {include file='__feeds_page.tpl' _tpl="list"}
                                    {/foreach}
                                </ul>
                            {else}
                                <div class="text-center text-muted mtb10">
                                    <img width="25%" src="{$system['system_url']}/content/themes/{$system['theme']}/images/no_results.png">
                                    <p class="mt10 mb10"><strong>{__("No results to show")}</strong></p>
                                </div>
                            {/if}
                        </div>
                        <!-- pages -->

                        <!-- groups -->
                        <div class="tab-pane" id="groups">
                            {if count($results['groups']) > 0}
                                <ul>
                                    {foreach $results['groups'] as $_group}
                                    {include file='__feeds_group.tpl' _tpl="list"}
                                    {/foreach}
                                </ul>
                            {else}
                                <div class="text-center text-muted mtb10">
                                    <img width="25%" src="{$system['system_url']}/content/themes/{$system['theme']}/images/no_results.png">
                                    <p class="mt10 mb10"><strong>{__("No results to show")}</strong></p>
                                </div>
                            {/if}
                        </div>
                        <!-- groups -->

                        <!-- events -->
                        <div class="tab-pane" id="events">
                            {if count($results['events']) > 0}
                                <ul>
                                    {foreach $results['events'] as $_event}
                                    {include file='__feeds_event.tpl' _tpl="list"}
                                    {/foreach}
                                </ul>
                            {else}
                                <div class="text-center text-muted mtb10">
                                    <img width="25%" src="{$system['system_url']}/content/themes/{$system['theme']}/images/no_results.png">
                                    <p class="mt10 mb10"><strong>{__("No results to show")}</strong></p>
                                </div>
                            {/if}
                        </div>
                        <!-- events -->

                    </div>
                </div>
                <!-- left panel -->

                <!-- right panel -->
                <div class="col-lg-4">
                    {include file='_ads_campaigns.tpl'}
                    {include file='_ads.tpl'}
                    {include file='_widget.tpl'}
                </div>
                <!-- right panel -->
            </div>
        </div>
        <!-- content panel -->
        
    </div>
</div>
<!-- page content -->

{include file='_footer.tpl'}