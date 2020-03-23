{if $_tpl == "box"}
    <li class="col-md-6 col-lg-3">
        <div class="ui-box">
            <div class="img">
                <a href="{$system['system_url']}/pages/{$_page['page_name']}{if $_search}?ref=qs{/if}">
                    <img alt="{$_page['page_title']}" src="{$_page['page_picture']}" />
                </a>
            </div>
            <div class="mt10">
                <span class="js_user-popover" data-uid="{$_page['page_id']}" data-type="page">
                    <a class="h6" href="{$system['system_url']}/pages/{$_page['page_name']}{if $_search}?ref=qs{/if}">{$_page['page_title']}</a>
                </span>
                {if $_page['page_verified']}
                    <i data-toggle="tooltip" data-placement="top" title='{__("Verified Page")}' class="fa fa-check-circle fa-fw verified-badge"></i>
                {/if}
                <div>{$_page['page_likes']} {__("Likes")}</div>
            </div>
            <div class="mt10">
                {if $_page['i_like']}
                    <button type="button" class="btn btn-sm btn-primary js_unlike-page" data-id="{$_page['page_id']}">
                        <i class="fa fa-thumbs-up mr5"></i>{__("Unlike")}
                    </button>
                {else}
                    <button type="button" class="btn btn-sm btn-primary js_like-page" data-id="{$_page['page_id']}">
                        <i class="fa fa-thumbs-up mr5"></i>{__("Like")}
                    </button>
                {/if}
            </div>
        </div>
    </li>
{elseif $_tpl == "list"}
    <li class="feeds-item">
        <div class="data-container {if $_small}small{/if}">
            <a class="data-avatar" href="{$system['system_url']}/pages/{$_page['page_name']}{if $_search}?ref=qs{/if}">
                <img src="{$_page['page_picture']}" alt="{$_page['page_title']}">
            </a>
            <div class="data-content">
                <div class="float-right">
                    {if $_page['i_like']}
                        <button type="button" class="btn btn-sm btn-primary js_unlike-page" data-id="{$_page['page_id']}">
                            <i class="fa fa-thumbs-up mr5"></i>{__("Unlike")}
                        </button>
                    {else}
                        <button type="button" class="btn btn-sm btn-primary js_like-page" data-id="{$_page['page_id']}">
                            <i class="fa fa-thumbs-up mr5"></i>{__("Like")}
                        </button>
                    {/if}
                </div>
                <div>
                    <span class="name js_user-popover" data-uid="{$_page['page_id']}" data-type="page">
                        <a href="{$system['system_url']}/pages/{$_page['page_name']}{if $_search}?ref=qs{/if}">{$_page['page_title']}</a>
                    </span>
                    {if $_page['page_verified']}
                    <i data-toggle="tooltip" data-placement="top" title='{__("Verified Page")}' class="fa fa-check-circle fa-fw verified-badge"></i>
                    {/if}
                    <div>{$_page['page_likes']} {__("Likes")}</div>
                </div>
            </div>
        </div>
    </li>
{/if}