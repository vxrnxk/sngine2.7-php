<tr class="treegrid-{$row['forum_id']} {if $row['forum_section'] != '0'}treegrid-parent-{$row['forum_section']}{/if}">
    <td>
        <a target="_blank" href="{$system['system_url']}/forums/{$row['forum_id']}/{$row['title_url']}">
            {$row['forum_name']}
        </a>
    </td>
    <td>
        {$row['forum_description']|truncate:50}
    </td>
    <td>{$row['forum_threads']}</td>
    <td><span class="badge badge-pill badge-lg badge-info">{$row['forum_order']}</span></td>
    <td>
        <a data-toggle="tooltip" data-placement="top" title='{__("Edit")}' href="{$system['system_url']}/{$control_panel['url']}/forums/edit_forum/{$row['forum_id']}" class="btn btn-sm btn-icon btn-rounded btn-primary">
            <i class="fa fa-pencil-alt"></i>
        </a>
        <button data-toggle="tooltip" data-placement="top" title='{__("Delete")}' class="btn btn-sm btn-icon btn-rounded btn-danger js_admin-deleter" data-handle="forum" data-id="{$row['forum_id']}">
            <i class="fa fa-trash-alt"></i>
        </button>
    </td>
</tr>
{if $row['childs']}
    {foreach $row['childs'] as $_row}
        {include file='admin.forums.recursive_rows.tpl' row = $_row}
    {/foreach}
{/if}