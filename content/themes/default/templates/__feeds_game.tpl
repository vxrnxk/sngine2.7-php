{if $_tpl != "list"}
    <li class="col-md-6 col-lg-3">
        <div class="ui-box">
            <div class="img">
                <a href="{$system['system_url']}/games/{$_game['game_id']}/{$_game['title_url']}">
                    <img alt="{$_game['title']}" src="{$_game['thumbnail']}" />
                </a>
            </div>
            <div class="mt10">
                <a class="h6" href="{$system['system_url']}/games/{$_game['game_id']}/{$_game['title_url']}">{$_game['title']}</a>
                {if $_game['played']}
                    <div class="mb5">
                        <i class="far fa-clock mr5"></i>{__("Played")}: <span class="js_moment" data-time="{$_game['last_played_time']}">{$_game['last_played_time']}</span>
                    </div>
                {/if}
            </div>
            <div class="mt10">
                <a class="btn btn-sm btn-primary" href="{$system['system_url']}/games/{$_game['game_id']}/{$_game['title_url']}">
                    <i class="fa fa-gamepad mr5"></i>{__("Play")}
                </a>
            </div>
        </div>
    </li>
{elseif $_tpl == "list"}
    <li class="feeds-item">
        <div class="data-container">
            <a class="data-avatar" href="{$system['system_url']}/games/{$_game['game_id']}/{$_game['title_url']}">
                <img src="{$_game['thumbnail']}" alt="{$_game['title']}">
            </a>
            <div class="data-content">
                <div class="float-right">
                    <a class="btn btn-primary" href="{$system['system_url']}/games/{$_game['game_id']}/{$_game['title_url']}">{__("Play")}</a>
                </div>
                <div>
                    <span class="name">
                        <a href="{$system['system_url']}/games/{$_game['game_id']}/{$_game['title_url']}">{$_game['title']}</a>
                    </span>
                </div>
            </div>
        </div>
    </li>
{/if}