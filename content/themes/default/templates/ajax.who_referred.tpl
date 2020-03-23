<div class="modal-header">
    <h6 class="modal-title">{__("Referrals")}</h6>
    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
        <span aria-hidden="true">&times;</span>
    </button>
</div>
<div class="modal-body">
    <ul>
        {foreach $users as $_user}
        {include file='__feeds_user.tpl' _tpl="list" _connection=$_user["connection"]}
        {/foreach}
    </ul>

    {if count($users) >= $system['max_results']}
        <!-- see-more -->
        <div class="alert alert-info see-more js_see-more" data-get="affiliates" data-uid="{$id}">
            <span>{__("See More")}</span>
            <div class="loader loader_small x-hidden"></div>
        </div>
        <!-- see-more -->
    {/if}
</div>
