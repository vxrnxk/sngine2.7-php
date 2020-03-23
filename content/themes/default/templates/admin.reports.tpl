<div class="card">
    <div class="card-header with-icon">
        <div class="float-right">
            <button type="button" class="btn btn-sm btn-success js_admin-deleter" data-handle="reports">
                <i class="fa fa-check"></i><span class="ml5 d-none d-lg-inline-block">{__("Mark All As Safe")}</span>
            </button>
        </div>
        <i class="fa fa-exclamation-triangle mr10"></i>{__("Reports")}
    </div>
    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-striped table-bordered table-hover js_dataTable">
                <thead>
                    <tr>
                        <th>{__("ID")}</th>
                        <th>{__("Node")}</th>
                        <th>{__("Type")}</th>
                        <th>{__("Reporter By")}</th>
                        <th>{__("Time")}</th>
                        <th>{__("Actions")}</th>
                    </tr>
                </thead>
                <tbody>
                    {foreach $rows as $row}
                        <tr>
                            <td>{$row['report_id']}</td>
                            <td>
                                {if $row['node_type'] == "user"}
                                    <a target="_blank" href="{$system['system_url']}/{$row['node']['user_name']}">
                                        <img class="tbl-image" src="{$row['node']['user_picture']}">
                                        {$row['node']['user_firstname']} {$row['node']['user_lastname']}
                                    </a>
                                {elseif $row['node_type'] == "page"}
                                    <a target="_blank" href="{$system['system_url']}/pages/{$row['node']['page_name']}">
                                        <img class="tbl-image" src="{$row['node']['page_picture']}">
                                        {$row['node']['page_title']}
                                    </a>
                                {elseif $row['node_type'] == "group"}
                                    <a target="_blank" href="{$system['system_url']}/groups/{$row['node']['group_name']}">
                                        <img class="tbl-image" src="{$row['node']['group_picture']}">
                                        {$row['node']['group_title']}
                                    </a>
                                {elseif $row['node_type'] == "event"}
                                    <a target="_blank" href="{$system['system_url']}/events/{$row['node_id']}">
                                        <img class="tbl-image" src="{$row['node']['event_picture']}">
                                        {$row['node']['event_title']}
                                    </a>
                                {elseif $row['node_type'] == "post"}
                                    <a class="btn btn-sm btn-light" href="{$system['system_url']}/posts/{$row['node_id']}" target="_blank">
                                        <i class="fa fa-eye mr5"></i>{__("View Post")}
                                    </a>
                                {elseif $row['node_type'] == "comment"}
                                    <a class="btn btn-sm btn-light" href="{$row['url']}" target="_blank">
                                        <i class="fa fa-eye mr5"></i>{__("View Comment")}
                                    </a>
                                {elseif $row['node_type'] == "forum_thread"}
                                    <a class="btn btn-sm btn-light" href="{$row['url']}" target="_blank">
                                        <i class="fa fa-eye mr5"></i>{__("View Thread")}
                                    </a>
                                {elseif $row['node_type'] == "forum_reply"}
                                    <a class="btn btn-sm btn-light" href="{$row['url']}" target="_blank">
                                        <i class="fa fa-eye mr5"></i>{__("View Reply")}
                                    </a>
                                {/if}
                            </td>
                            <td>
                                <span class="badge badge-lg badge-{$row['node']['color']}">{$row['node']['name']|capitalize}</span>
                            </td>
                            <td>
                                <a target="_blank" href="{$system['system_url']}/{$row['user_name']}">
                                    <img class="tbl-image" src="{$row['user_picture']}">
                                    {$row['user_firstname']} {$row['user_lastname']}
                                </a>
                            </td>

                            <td>{$row['time']|date_format:"%e %B %Y"}</td>
                            <td>
                                {if $row['node_type'] == "user"}
                                    <a data-toggle="tooltip" data-placement="top" title='{__("Edit")}' target="_blank" href="{$system['system_url']}/{$control_panel['url']}/users/edit/{$row['node_id']}" class="btn btn-sm btn-icon btn-rounded btn-primary">
                                        <i class="fa fa-pencil-alt"></i>
                                    </a>
                                {elseif $row['node_type'] == "page"}
                                    <a data-toggle="tooltip" data-placement="top" title='{__("Edit")}' target="_blank" href="{$system['system_url']}/{$control_panel['url']}/pages/edit_page/{$row['node_id']}" class="btn btn-sm btn-icon btn-rounded btn-primary">
                                        <i class="fa fa-pencil-alt"></i>
                                    </a>
                                {elseif $row['node_type'] == "group"}
                                    <a data-toggle="tooltip" data-placement="top" title='{__("Edit")}' target="_blank" href="{$system['system_url']}/{$control_panel['url']}/groups/edit_group/{$row['node_id']}" class="btn btn-sm btn-icon btn-rounded btn-primary">
                                        <i class="fa fa-pencil-alt"></i>
                                    </a>
                                {elseif $row['node_type'] == "event"}
                                    <a data-toggle="tooltip" data-placement="top" title='{__("Edit")}' target="_blank" href="{$system['system_url']}/{$control_panel['url']}/events/edit_event/{$row['node_id']}" class="btn btn-sm btn-icon btn-rounded btn-primary">
                                        <i class="fa fa-pencil-alt"></i>
                                    </a>
                                {elseif $row['node_type'] == "forum_thread"}
                                    <a data-toggle="tooltip" data-placement="top" title='{__("Edit")}' target="_blank" href="{$system['system_url']}/forums/edit-thread/{$row['node_id']}" class="btn btn-sm btn-icon btn-rounded btn-primary">
                                        <i class="fa fa-pencil-alt"></i>
                                    </a>
                                {elseif $row['node_type'] == "forum_reply"}
                                    <a data-toggle="tooltip" data-placement="top" title='{__("Edit")}' target="_blank" href="{$system['system_url']}/forums/edit-reply/{$row['node_id']}" class="btn btn-sm btn-icon btn-rounded btn-primary">
                                        <i class="fa fa-pencil-alt"></i>
                                    </a>
                                {/if}
                                <button data-toggle="tooltip" data-placement="top" title='{__("Mark as Safe")}' class="btn btn-sm btn-icon btn-rounded btn-success js_admin-deleter" data-handle="report" data-id="{$row['report_id']}">
                                    <i class="fa fa-check"></i>
                                </button>
                                <button data-toggle="tooltip" data-placement="top" title='{__("Delete")}' class="btn btn-sm btn-icon btn-rounded btn-danger js_admin-deleter" data-handle="{$row['node_type']}" data-id="{$row['node_id']}" data-node="{$row['report_id']}">
                                    <i class="fa fa-trash-alt"></i>
                                </button>
                            </td>
                        </tr>
                    {/foreach}
                </tbody>
            </table>
        </div>
    </div>
</div>