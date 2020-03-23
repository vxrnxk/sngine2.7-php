<div class="card">
    <div class="card-header with-icon">
        {if $sub_view == ""}
            <div class="float-right">
                <a href="{$system['system_url']}/{$control_panel['url']}/blacklist/add" class="btn btn-sm btn-primary">
                    <i class="fa fa-plus mr5"></i>{__("Add New")}
                </a>
            </div>
        {elseif $sub_view == "add"}
            <div class="float-right">
                <a href="{$system['system_url']}/{$control_panel['url']}/blacklist" class="btn btn-sm btn-light">
                    <i class="fa fa-arrow-circle-left mr5"></i>{__("Go Back")}
                </a>
            </div>
        {/if}
        <i class="fa fa-minus-circle mr5"></i>{__("Blacklist")}
        {if $sub_view == "add"} &rsaquo; {__("Add New")}{/if}
    </div>

    {if $sub_view == ""}

        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-striped table-bordered table-hover js_dataTable">
                    <thead>
                        <tr>
                            <th>{__("ID")}</th>
                            <th>{__("Type")}</th>
                            <th>{__("Value")}</th>
                            <th>{__("Added")}</th>
                            <th>{__("Actions")}</th>
                        </tr>
                    </thead>
                    <tbody>
                        {foreach $rows as $row}
                        <tr>
                            <td>{$row['node_id']}</td>
                            <td>
                                {if $row['node_type'] == "ip"}
                                    <span class="badge badge-lg badge-danger">IP</span>
                                {elseif $row['node_type'] == "email"}
                                    <span class="badge badge-lg badge-primary">{$row['node_type']|capitalize}</span>
                                {elseif $row['node_type'] == "username"}
                                    <span class="badge badge-lg badge-info">{$row['node_type']|capitalize}</span>
                                {/if}
                            </td>
                            <td><span class="badge badge-lg badge-warning">{$row['node_value']}</span></td>
                            <td><span class="js_moment" data-time="{$row['created_time']}">{$row['created_time']}</span></td>
                            <td>
                                <button data-toggle="tooltip" data-placement="top" title='{__("Delete")}' class="btn btn-sm btn-icon btn-rounded btn-danger js_admin-deleter" data-handle="blacklist_node" data-id="{$row['node_id']}">
                                    <i class="fa fa-trash-alt"></i>
                                </button>
                            </td>
                        </tr>
                        {/foreach}
                    </tbody>
                </table>
            </div>
        </div>

    {elseif $sub_view == "add"}

        <form class="js_ajax-forms " data-url="admin/blacklist.php?do=add">
            <div class="card-body">
                <div class="form-group form-row">
                    <label class="col-md-3 form-control-label">
                        {__("Type")}
                    </label>
                    <div class="col-md-9">
                        <div class="custom-control custom-radio custom-control-inline">
                            <input type="radio" name="node_type" id="ip" value="ip" class="custom-control-input" checked>
                            <label class="custom-control-label" for="ip">{__("IP")}</label>
                        </div>
                        <div class="custom-control custom-radio custom-control-inline">
                            <input type="radio" name="node_type" id="email" value="email" class="custom-control-input">
                            <label class="custom-control-label" for="email">{__("Email Provider")}</label>
                        </div>
                        <div class="custom-control custom-radio custom-control-inline">
                            <input type="radio" name="node_type" id="username" value="username" class="custom-control-input">
                            <label class="custom-control-label" for="username">{__("Username")}</label>
                        </div>
                        <span class="form-text">
                            {__("Select what you want to add to the blackist")}
                        </span>
                    </div>
                </div>

                <div class="form-group form-row">
                    <label class="col-md-3 form-control-label">
                        {__("Value")}
                    </label>
                    <div class="col-md-9">
                        <input class="form-control" name="node_value">
                        <span class="form-text">
                            {__("IP (example: 192.168.687.123) | Email Povider (example: outlook.com or gmail.com) | Username (example: admin or superadmin)")}<br>
                        </span>
                    </div>
                </div>

                <!-- success -->
                <div class="alert alert-success mb0 x-hidden"></div>
                <!-- success -->

                <!-- error -->
                <div class="alert alert-danger mb0 x-hidden"></div>
                <!-- error -->
            </div>
            <div class="card-footer text-right">
                <button type="submit" class="btn btn-primary">{__("Save Changes")}</button>
            </div>
        </form>

    {/if}
</div>