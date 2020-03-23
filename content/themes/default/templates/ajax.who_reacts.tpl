<div class="modal-header with-nav">
    <div class="modal-title">
        <!-- panel nav -->
        <ul class="nav nav-tabs">
            <li class="nav-item">
                <a class="nav-link {if $reaction_type == "all"}active{/if}" href="#" data-toggle="modal" data-url="posts/who_reacts.php?{$get}={$id}&reaction_type=all">
                    {__("All")}
                </a>
            </li>
            {foreach $reactions as $reaction}
                <li class="nav-item">
                    <a class="nav-link {if $reaction_type == $reaction['reaction']}active{/if}" href="#" data-toggle="modal" data-url="posts/who_reacts.php?{$get}={$id}&reaction_type={$reaction['reaction']}">
                        <div style="height: 19px;">
                            <div class="inline-emoji no_animation">
                                {include file='__reaction_emojis.tpl' _reaction=$reaction['reaction']}
                            </div>
                        </div>
                    </a>
                </li>
            {/foreach}
        </ul>
        <!-- panel nav -->
    </div>
    <!-- close -->
    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
        <span aria-hidden="true">&times;</span>
    </button>
    <!-- close -->
</div>
<div class="modal-body">
    {if $users}
        <ul>
            {foreach $users as $_user}
            {include file='__feeds_user.tpl' _tpl="list" _connection=$_user["connection"] _reaction=$_user["reaction"]}
            {/foreach}
        </ul>

        {if count($users) >= $system['max_results']}
            <!-- see-more -->
            <div class="alert alert-info see-more js_see-more" data-get="{$handle}_reactions" data-filter="{$reaction_type}" data-id="{$id}">
                <span>{__("See More")}</span>
                <div class="loader loader_small x-hidden"></div>
            </div>
            <!-- see-more -->
        {/if}
    {else}
        <p class="text-center text-muted">
            {__("No reactions yet")}
        </p>
    {/if}
</div>
