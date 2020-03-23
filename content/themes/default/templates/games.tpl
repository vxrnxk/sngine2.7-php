{include file='_head.tpl'}
{include file='_header.tpl'}

<!-- page content -->
<div class="container mt20 offcanvas">
    <div class="row">

        {if $view == "game"}

            <!-- side panel -->
            <div class="col-12 d-block d-md-none offcanvas-sidebar">
                {include file='_sidebar.tpl'}
            </div>
            <!-- side panel -->

            <!-- content panel -->
            <div class="col-12 offcanvas-mainbar">
                <div class="post">
                    <div class="ptb20 plr20">
                        <div class="post-header mb0">
                            <div class="post-avatar">
                                <div class="post-avatar-picture" style="background-image:url({$game['thumbnail']});">
                                </div>
                            </div>
                            <div class="post-meta">
                                <div class="float-right">
                                    <a href="{$system['system_url']}/games" class="btn btn-sm btn-light d-none d-lg-block">
                                        <i class="fa fa-arrow-circle-left mr5"></i>{__("Go Back")}
                                    </a>
                                    <a href="{$system['system_url']}/games" class="btn btn-sm btn-icon btn-light d-block d-lg-none">
                                        <i class="fa fa-arrow-circle-left"></i>
                                    </a>
                                </div>
                                <div class="h6 mt5 mb0">{$game['title']}</div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="embed-responsive embed-responsive-16by9">
                    <iframe frameborder="0" src="{$game['source']}"></iframe>
                </div>
            </div>
            <!-- content panel -->

        {else}

            <!-- side panel -->
            <div class="col-md-4 col-lg-3 offcanvas-sidebar js_sticky-sidebar">
                {include file='_sidebar.tpl'}
            </div>
            <!-- side panel -->

            <!-- content panel -->
            <div class="col-md-8 col-lg-9 offcanvas-mainbar">

                <!-- tabs -->
                <div class="content-tabs rounded-sm shadow-sm clearfix">
                    <ul>
                        <li {if $view == ""}class="active"{/if}>
                            <a href="{$system['system_url']}/games">{__("Discover")}</a>
                        </li>
                        <li {if $view == "played"}class="active"{/if}>
                            <a href="{$system['system_url']}/games/played">{__("Your Games")}</a>
                        </li>
                    </ul>
                </div>
                <!-- tabs -->

                <!-- content -->
                <div>
                    {if $games}
                        <ul class="row">
                            {foreach $games as $_game}
                                {include file='__feeds_game.tpl' _tpl='box'}
                            {/foreach}
                        </ul>

                        <!-- see-more -->
                        {if count($games) >= $system['max_results_even']}
                            <div class="alert alert-post see-more js_see-more" data-get="{$get}">
                                <span>{__("See More")}</span>
                                <div class="loader loader_small x-hidden"></div>
                            </div>
                        {/if}
                        <!-- see-more -->
                    {else}
                        <p class="text-center text-muted">
                            {__("No games to show")}
                        </p>
                    {/if}
                </div>
                <!-- content -->

            </div>
            <!-- content panel -->

        {/if}

    </div>
</div>
<!-- page content -->

{include file='_footer.tpl'}