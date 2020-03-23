<li class="dropdown js_live-requests">
    <a href="#" data-toggle="dropdown" data-display="static">
        <i class="fa fa-users fa-lg"></i>
        <span class="counter purple shadow-sm {if $user->_data['user_live_requests_counter'] == 0}x-hidden{/if}">
            {$user->_data['user_live_requests_counter']}
        </span>
    </a>
    <div class="dropdown-menu dropdown-menu-right dropdown-widget with-arrow js_dropdown-keepopen">
        <div class="dropdown-widget-header">
            <span class="title">{__("Friend Requests")}</span>
        </div>
        <div class="dropdown-widget-body">
            <div class="js_scroller">
                <!-- Friend Requests -->
                {if $user->_data['friend_requests']}
                    <ul>
                        {foreach $user->_data['friend_requests'] as $_user}
                        {include file='__feeds_user.tpl' _tpl="list" _connection="request"}
                        {/foreach}
                    </ul>
                {else}
                    <p class="text-center text-muted mt10">
                        {__("No new requests")}
                    </p>
                {/if}
                <!-- Friend Requests -->
            </div>
        </div>
        <a class="dropdown-widget-footer" href="{$system['system_url']}/people/friend_requests">{__("See All")}</a>
    </div>
</li>