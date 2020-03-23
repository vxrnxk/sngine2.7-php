<ul>
    {foreach $users as $_user}
    <li>
        <div class="data-container clickable small {if $type == 'tags'}js_tag-add{else}js_autocomplete-add{/if}" data-uid="{$_user['user_id']}" data-name="{$_user['user_firstname']} {$_user['user_lastname']}">
            <div class="data-avatar">
                <img class="data-avatar" src="{$_user['user_picture']}" alt="{$_user['user_firstname']} {$_user['user_lastname']}">
            </div>
            <div class="data-content">
                <div><strong>{$_user['user_firstname']} {$_user['user_lastname']}</strong></div>
            </div>
        </div>
    </li>
    {/foreach}
</ul>