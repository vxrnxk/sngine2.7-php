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
                        <a href="{$system['system_url']}/groups">{__("Discover")}</a>
                    </li>
                    <li {if $view == "joined"}class="active"{/if}>
                        <a href="{$system['system_url']}/groups/joined">{__("Joined Groups")}</a>
                    </li>
                    <li {if $view == "manage"}class="active"{/if}>
                        <a href="{$system['system_url']}/groups/manage">{__("My Groups")}</a>
                    </li>
                </ul>
                {if $user->_data['user_group'] < 3 || $system['groups_enabled']}
                    <div class="mt10 float-right">
                        <button class="btn btn-sm btn-success d-none d-lg-block" data-toggle="modal" data-url="#create-group">
                            <i class="fa fa-plus-circle mr5"></i>{__("Create Group")}
                        </button>
                        <button class="btn btn-sm btn-icon btn-success d-block d-lg-none" data-toggle="modal" data-url="#create-group">
                            <i class="fa fa-plus-circle"></i>
                        </button>
                    </div>
                {/if}
            </div>
            <!-- tabs -->

            <!-- content -->
            <div>
                {if $groups}
                    <ul class="row">
                        {foreach $groups as $_group}
                            {include file='__feeds_group.tpl' _tpl='box'}
                        {/foreach}
                    </ul>

                    <!-- see-more -->
                    {if count($groups) >= $system['max_results_even']}
                        <div class="alert alert-post see-more js_see-more" data-get="{$get}" data-uid="{$user->_data['user_id']}">
                            <span>{__("See More")}</span>
                            <div class="loader loader_small x-hidden"></div>
                        </div>
                    {/if}
                    <!-- see-more -->
                {else}
                    <p class="text-center text-muted">
                        {__("No groups to show")}
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