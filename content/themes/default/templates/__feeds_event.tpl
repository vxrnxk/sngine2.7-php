{if $_tpl == "box"}
    <li class="col-md-6 col-lg-3">
        <div class="ui-box">
            <div class="img">
                <a href="{$system['system_url']}/events/{$_event['event_id']}{if $_search}?ref=qs{/if}">
                    <img alt="{$_event['event_title']}" src="{$_event['event_picture']}" />
                </a>
            </div>
            <div class="mt10">
                <a class="h6" href="{$system['system_url']}/events/{$_event['event_id']}{if $_search}?ref=qs{/if}">{$_event['event_title']}</a>
                <div>{$_event['event_interested']} {__("Interested")}</div>
            </div>
            <div class="mt10">
                {if $_event['i_joined']['is_interested']}
                    <button type="button" class="btn btn-sm btn-primary js_uninterest-event" data-id="{$_event['event_id']}">
                        <i class="fa fa-check mr5"></i>{__("Interested")}
                    </button>
                {else}
                    <button type="button" class="btn btn-sm btn-primary js_interest-event" data-id="{$_event['event_id']}">
                        <i class="fa fa-star mr5"></i>{__("Interested")}
                    </button>
                {/if}
            </div>
        </div>
    </li>
{elseif $_tpl == "list"}
    <li class="feeds-item">
        <div class="data-container {if $_small}small{/if}">
            <a class="data-avatar" href="{$system['system_url']}/events/{$_event['event_id']}{if $_search}?ref=qs{/if}">
                <img src="{$_event['event_picture']}" alt="{$_event['event_title']}">
            </a>
            <div class="data-content">
                <div class="float-right">
                    {if $_event['i_joined']['is_interested']}
                        <button type="button" class="btn btn-sm btn-primary js_uninterest-event" data-id="{$_event['event_id']}">
                            <i class="fa fa-check mr5"></i>{__("Interested")}
                        </button>
                    {else}
                        <button type="button" class="btn btn-sm btn-primary js_interest-event" data-id="{$_event['event_id']}">
                            <i class="fa fa-star mr5"></i>{__("Interested")}
                        </button>
                    {/if}
                </div>
                <div>
                    <span class="name">
                        <a href="{$system['system_url']}/events/{$_event['event_id']}{if $_search}?ref=qs{/if}">{$_event['event_title']}</a>
                    </span>
                    <div>{$_event['event_interested']} {__("Interested")}</div>
                </div>
            </div>
        </div>
    </li>
{/if}