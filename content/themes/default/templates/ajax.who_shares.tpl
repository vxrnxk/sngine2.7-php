<div class="modal-header">
    <h6 class="modal-title">{__("People Who Shared This")}</h6>
    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
        <span aria-hidden="true">&times;</span>
    </button>
</div>
<div class="modal-body">
    {if $posts}
        <ul>
            {foreach $posts as $post}
            {include file='__feeds_post.tpl' _snippet=true}
            {/foreach}
        </ul>

        {if count($posts) >= $system['max_results']}
            <!-- see-more -->
            <div class="alert alert-info see-more js_see-more" data-get="shares" data-id="{$id}">
                <span>{__("See More")}</span>
                <div class="loader loader_small x-hidden"></div>
            </div>
            <!-- see-more -->
        {/if}
    {else}
        <p class="text-center text-muted">
            {__("No people shared this")}
        </p>
    {/if}
    
</div>
