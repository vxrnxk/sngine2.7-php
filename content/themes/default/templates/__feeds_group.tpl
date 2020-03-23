{if $_tpl == "box"}
    <li class="col-md-6 col-lg-3">
        <div class="ui-box">
            <div class="img">
                <a href="{$system['system_url']}/groups/{$_group['group_name']}{if $_search}?ref=qs{/if}">
                    <img alt="{$_group['group_title']}" src="{$_group['group_picture']}" />
                </a>
            </div>
            <div class="mt10">
                <a class="h6" href="{$system['system_url']}/groups/{$_group['group_name']}{if $_search}?ref=qs{/if}">{$_group['group_title']}</a>
                <div>{$_group['group_members']} {__("Members")}</div>
            </div>
            <div class="mt10">
                {if $_group['i_joined'] == "approved"}
                    <button type="button" class="btn btn-sm btn-success {if !$_no_action}btn-delete{/if} js_leave-group" data-id="{$_group['group_id']}" data-privacy="{$_group['group_privacy']}">
                        <i class="fa fa-check mr5"></i>{__("Joined")}
                    </button>
                {elseif $_group['i_joined'] == "pending"}
                    <button type="button" class="btn btn-sm btn-warning js_leave-group" data-id="{$_group['group_id']}" data-privacy="{$_group['group_privacy']}">
                        <i class="fa fa-clock mr5"></i>{__("Pending")}
                    </button>
                {else}
                    <button type="button" class="btn btn-sm btn-success js_join-group" data-id="{$_group['group_id']}" data-privacy="{if $user->_data['user_id'] == $_group['group_admin']}public{else}{$_group['group_privacy']}{/if}">
                        <i class="fa fa-user-plus mr5"></i>{__("Join")}
                    </button>
                {/if}
            </div>
        </div>
    </li>
{elseif $_tpl == "list"}
    <li class="feeds-item">
        <div class="data-container {if $_small}small{/if}">
            <a class="data-avatar" href="{$system['system_url']}/groups/{$_group['group_name']}{if $_search}?ref=qs{/if}">
                <img src="{$_group['group_picture']}" alt="{$_group['group_title']}">
            </a>
            <div class="data-content">
                <div class="float-right">
                    {if $_group['i_joined'] == "approved"}
                        <button type="button" class="btn btn-sm btn-success {if !$_no_action}btn-delete{/if} js_leave-group" data-id="{$_group['group_id']}" data-privacy="{$_group['group_privacy']}">
                            <i class="fa fa-check mr5"></i>{__("Joined")}
                        </button>
                    {elseif $_group['i_joined'] == "pending"}
                        <button type="button" class="btn btn-sm btn-warning js_leave-group" data-id="{$_group['group_id']}" data-privacy="{$_group['group_privacy']}">
                            <i class="fa fa-clock mr5"></i>{__("Pending")}
                        </button>
                    {else}
                        <button type="button" class="btn btn-sm btn-success js_join-group" data-id="{$_group['group_id']}" data-privacy="{if $user->_data['user_id'] == $_group['group_admin']}public{else}{$_group['group_privacy']}{/if}">
                            <i class="fa fa-user-plus mr5"></i>{__("Join")}
                        </button>
                    {/if}
                </div>
                <div>
                    <span class="name">
                        <a href="{$system['system_url']}/groups/{$_group['group_name']}{if $_search}?ref=qs{/if}">{$_group['group_title']}</a>
                    </span>
                    <div>{$_group['group_members']} {__("Members")}</div>
                </div>
            </div>
        </div>
    </li>
{/if}