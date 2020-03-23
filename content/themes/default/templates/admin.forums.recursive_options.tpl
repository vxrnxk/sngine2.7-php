<option {if $data['forum_section'] == $forum['forum_id']}selected style="font-weight: 600;"{/if} value="{$forum['forum_id']}" {if !$forum['iteration']}class="bg-info"{/if}>
    {str_repeat("- - ", $forum['iteration'])}{__($forum['forum_name']|truncate:30)}
</option>
{if $forum['childs']}
    {foreach $forum['childs'] as $_forum}
        {include file='admin.forums.recursive_options.tpl' forum = $_forum}
    {/foreach}
{/if}