<li class="dropdown js_live-messages">
    <a href="#" data-toggle="dropdown" data-display="static">
        <i class="fa fa-comments fa-lg"></i>
        <span class="counter blue shadow-sm {if $user->_data['user_live_messages_counter'] == 0}x-hidden{/if}">
            {$user->_data['user_live_messages_counter']}
        </span>
    </a>
    <div class="dropdown-menu dropdown-menu-right dropdown-widget with-arrow">
        <div class="dropdown-widget-header">
            <span class="title">{__("Messages")}</span>
            <a class="float-right text-link js_chat-new" href="{$system['system_url']}/messages/new">{__("Send a New Message")}</a>
        </div>
        <div class="dropdown-widget-body">
            <div class="js_scroller">
                {if $user->_data['conversations']}
                    <ul>
                        {foreach $user->_data['conversations'] as $conversation}
                        {include file='__feeds_conversation.tpl'}
                        {/foreach}
                    </ul>
                {else}
                    <p class="text-center text-muted mt10">
                        {__("No messages")}
                    </p>
                {/if}
            </div>
        </div>
        <a class="dropdown-widget-footer" href="{$system['system_url']}/messages">{__("See All")}</a>
    </div>
</li>