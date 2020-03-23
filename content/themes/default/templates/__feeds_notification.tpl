<li class="feeds-item {if !$notification['seen']}unread{/if}" data-id="{$notification['notification_id']}">
    <a class="data-container" href="{$notification['url']}">
        <div class="data-avatar">
            <img src="{$notification['user_picture']}" alt="{$notification['user_firstname']} {$notification['user_lastname']}">
        </div>
        <div class="data-content">
            <div>
            	<span class="name">{$notification['user_firstname']} {$notification['user_lastname']}</span>
            	{if $notification['user_verified']}
                    <i data-toggle="tooltip" data-placement="top" title='{__("Verified User")}' class="fa fa-check-circle fa-fw verified-badge"></i>
                {/if}
                {if $notification['user_subscribed']}
                    <i data-toggle="tooltip" data-placement="top" title='{__("Pro User")}' class="fa fa-bolt fa-fw pro-badge"></i>
                {/if}
           	</div>
            <div>
                {if $notification['reaction']}
                    <div class="reaction-btn float-left mr5">
                        <div class="reaction-btn-icon">
                            <div class="inline-emoji no_animation">
                                {include file='__reaction_emojis.tpl' _reaction=$notification['reaction']}
                            </div>
                        </div>
                    </div>
                {else}
                    <i class="{$notification['icon']} pr5"></i> 
                {/if}
                {$notification['message']}
            </div>
            <div class="time js_moment" data-time="{$notification['time']}">{$notification['time']}</div>
        </div>
    </a>
</li>