{include file='_head.tpl'}
{include file='_header.tpl'}

<!-- page content -->
<div class="container mt20 offcanvas">
    <div class="row">

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
                        <a href="{$system['system_url']}/events">{__("Discover")}</a>
                    </li>
                    <li {if $view == "going"}class="active"{/if}>
                        <a href="{$system['system_url']}/events/going">{__("Going")}</a>
                    </li>
                    <li {if $view == "interested"}class="active"{/if}>
                        <a href="{$system['system_url']}/events/interested">{__("Interested")}</a>
                    </li>
                    <li {if $view == "invited"}class="active"{/if}>
                        <a href="{$system['system_url']}/events/invited">{__("Invited")}</a>
                    </li>
                    <li {if $view == "manage"}class="active"{/if}>
                        <a href="{$system['system_url']}/events/manage">{__("My Events")}</a>
                    </li>
                </ul>
                {if $user->_data['user_group'] < 3 || $system['events_enabled']}
                    <div class="mt10 float-right">
                        <button class="btn btn-sm btn-success d-none d-lg-block" data-toggle="modal" data-url="#create-event">
                            <i class="fa fa-plus-circle mr5"></i>{__("Create Event")}
                        </button>
                        <button class="btn btn-sm btn-icon btn-success d-block d-lg-none" data-toggle="modal" data-url="#create-event">
                            <i class="fa fa-plus-circle"></i>
                        </button>
                    </div>
                {/if}
            </div>
            <!-- tabs -->

            <!-- content -->
            <div>
                {if $events}
                    <ul class="row">
                        {foreach $events as $_event}
                            {include file='__feeds_event.tpl' _tpl='box'}
                        {/foreach}
                    </ul>

                    <!-- see-more -->
                    {if count($events) >= $system['max_results_even']}
                        <div class="alert alert-post see-more js_see-more" data-get="{$get}">
                            <span>{__("See More")}</span>
                            <div class="loader loader_small x-hidden"></div>
                        </div>
                    {/if}
                    <!-- see-more -->
                {else}
                    <p class="text-center text-muted">
                        {__("No events to show")}
                    </p>
                {/if}
            </div>
            <!-- content -->

        </div>
        <!-- content panel -->

    </div>
</div>
<!-- page content -->

{include file='_footer.tpl'}