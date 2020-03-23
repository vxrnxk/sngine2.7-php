<div class="js_scroller">
    <ul>
        {foreach $results as $result}
            {if $result['type'] == "user"}
                {include file='__feeds_user.tpl' _user=$result _tpl="list" _connection=$result['connection'] _search=true}
            
            {elseif $result['type'] == "page"}
                {include file='__feeds_page.tpl' _page=$result _tpl="list" _search=true}
            
            {elseif $result['type'] == "group"}
                {include file='__feeds_group.tpl' _group=$result _tpl="list" _search=true}

            {elseif $result['type'] == "event"}
                {include file='__feeds_event.tpl' _event=$result _tpl="list" _search=true}

            {/if}
        {/foreach}
    </ul>
</div>