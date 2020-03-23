<div class="card">
    <div class="card-header with-icon">
        {if $sub_view == "find"}
            <div class="float-right">
                <a href="{$system['system_url']}/{$control_panel['url']}/groups" class="btn btn-sm btn-light">
                    <i class="fa fa-arrow-circle-left mr5"></i>{__("Go Back")}
                </a>
            </div>
        {elseif $sub_view == "edit_group"}
            <div class="float-right">
                <a href="{$system['system_url']}/{$control_panel['url']}/groups" class="btn btn-sm btn-light">
                    <i class="fa fa-arrow-circle-left"></i><span class="ml5 d-none d-lg-inline-block">{__("Go Back")}</span>
                </a>
                <a target="_blank" href="{$system['system_url']}/groups/{$data['group_name']}" class="btn btn-sm btn-info">
                    <i class="fa fa-tv"></i><span class="ml5 d-none d-lg-inline-block">{__("View Group")}</span>
                </a>
                <button type="button" class="btn btn-sm btn-danger js_admin-deleter" data-handle="group_posts" data-id="{$data['group_id']}">
                    <i class="fa fa-trash-alt"></i><span class="ml5 d-none d-lg-inline-block">{__("Delete All Posts")}</span>
                </button>
            </div>
        {elseif $sub_view == "categories"}
            <div class="float-right">
                <a href="{$system['system_url']}/{$control_panel['url']}/groups/add_category" class="btn btn-sm btn-primary">
                    <i class="fa fa-plus"></i><span class="ml5 d-none d-lg-inline-block">{__("Add New Category")}</span>
                </a>
            </div>
        {elseif $sub_view == "add_category" || $sub_view == "edit_category"}
            <div class="float-right">
                <a href="{$system['system_url']}/{$control_panel['url']}/groups/categories" class="btn btn-sm btn-light">
                    <i class="fa fa-arrow-circle-left"></i><span class="ml5 d-none d-lg-inline-block">{__("Go Back")}</span>
                </a>
            </div>
        {/if}
        <i class="fa fa-users mr10"></i>{__("Groups")}
        {if $sub_view == "find"} &rsaquo; {__("Find")}{/if}
        {if $sub_view == "edit_group"} &rsaquo; {$data['group_title']}{/if}
        {if $sub_view == "categories"} &rsaquo; {__("Categories")}{/if}
        {if $sub_view == "add_category"} &rsaquo; {__("Categories")} &rsaquo; {__("Add New Category")}{/if}
        {if $sub_view == "edit_category"} &rsaquo; {__("Categories")} &rsaquo; {$data['category_name']}{/if}
    </div>

    {if $sub_view == "" || $sub_view == "find"}

        <div class="card-body">

            <!-- search form -->
            <div class="mb20">
                <form class="form-inline" action="{$system['system_url']}/{$control_panel['url']}/groups/find" method="get">
                    <div class="form-group mb0">
                        <div class="input-group">
                            <input type="text" class="form-control" name="query">
                            <div class="input-group-append">
                                <button type="submit" class="btn btn-sm btn-primary"><i class="fas fa-search mr5"></i>{__("Search")}</button>
                            </div>
                        </div>
                    </div>
                </form>
                <div class="form-text small">
                    {__('Search by Group Web Address or Title')}
                </div>
            </div>
            <!-- search form -->

            <div class="table-responsive">
                <table class="table table-striped table-bordered table-hover">
                    <thead>
                        <tr>
                            <th>{__("ID")}</th>
                            <th>{__("Group")}</th>
                            <th>{__("Admin")}</th>
                            <th>{__("Privacy")}</th>
                            <th>{__("Members")}</th>
                            <th>{__("Actions")}</th>
                        </tr>
                    </thead>
                    <tbody>
                        {if $rows}
                            {foreach $rows as $row}
                                <tr>
                                    <td>
                                        <a href="{$system['system_url']}/groups/{$row['group_name']}" target="_blank">{$row['group_id']}</a>
                                    </td>
                                    <td>
                                        <a target="_blank" href="{$system['system_url']}/groups/{$row['group_name']}">
                                            <img class="tbl-image" src="{$row['group_picture']}">
                                            {$row['group_title']}
                                        </a>
                                    </td>
                                    <td>
                                        <a target="_blank" href="{$system['system_url']}/{$row['user_name']}">
                                            <img class="tbl-image" src="{$row['user_picture']}">
                                            {$row['user_firstname']} {$row['user_lastname']}
                                        </a>
                                    </td>
                                    <td>
                                        {if $row['group_privacy'] == "public"}
                                            <i class="fa fa-globe fa-fw mr5"></i>{__("Public")}
                                        {elseif $row['group_privacy'] == "closed"}
                                            <i class="fa fa-unlock-alt fa-fw mr5"></i>{__("Closed")}
                                        {elseif $row['group_privacy'] == "secret"}
                                            <i class="fa fa-lock fa-fw mr5"></i>{__("Secret")}
                                        {/if}
                                    </td>
                                    <td>{$row['group_members']}</td>
                                    <td>
                                        <a data-toggle="tooltip" data-placement="top" title='{__("Edit")}' href="{$system['system_url']}/{$control_panel['url']}/groups/edit_group/{$row['group_id']}" class="btn btn-sm btn-icon btn-rounded btn-primary">
                                            <i class="fa fa-pencil-alt"></i>
                                        </a>
                                        <button data-toggle="tooltip" data-placement="top" title='{__("Delete")}' class="btn btn-sm btn-icon btn-rounded btn-danger js_admin-deleter" data-handle="group" data-id="{$row['group_id']}">
                                            <i class="fa fa-trash-alt"></i>
                                        </button>
                                    </td>
                                </tr>
                            {/foreach}
                        {else}
                            <tr>
                                <td colspan="6" class="text-center">
                                    {__("No data to show")}
                                </td>
                            </tr>
                        {/if}
                    </tbody>
                </table>
            </div>
            {$pager}
        </div>

    {elseif $sub_view == "edit_group"}

        <form class="js_ajax-forms " data-url="admin/groups.php?do=edit_group&id={$data['group_id']}">
            <div class="card-body">
                <div class="row">
                    <div class="col-12 col-md-2 text-center mb20">
                        <img class="img-fluid img-thumbnail rounded-circle" src="{$data['group_picture']}">
                    </div>
                    <div class="col-12 col-md-10 mb20">
                        <ul class="list-group">
                            <li class="list-group-item">
                                <span class="float-right badge badge-lg badge-pill badge-secondary">{$data['group_id']}</span>
                                {__("Group ID")}
                            </li>
                            <li class="list-group-item">
                                <span class="float-right badge badge-lg badge-pill badge-secondary">{$data['group_members']}</span>
                                {__("Members")}
                            </li>
                            <li class="list-group-item">
                                <span class="float-right badge badge-lg badge-pill badge-secondary">
                                    {if $data['group_privacy'] == "public"}
                                        <i class="fa fa-globe fa-fw mr5"></i>{__("Public")}
                                    {elseif $data['group_privacy'] == "closed"}
                                        <i class="fa fa-unlock-alt fa-fw mr5"></i>{__("Closed")}
                                    {elseif $data['group_privacy'] == "secret"}
                                        <i class="fa fa-lock fa-fw mr5"></i>{__("Secret")}
                                    {/if}
                                </span>
                                {__("Privacy")}
                            </li>
                        </ul>
                    </div>
                </div>

                <!-- tabs nav -->
                <ul class="nav nav-tabs mb20">
                    <li class="nav-item">
                        <a class="nav-link active" href="#group_settings" data-toggle="tab">
                            <i class="fa fa-cog fa-fw mr5"></i><strong>{__("Group Settings")}</strong>
                        </a>
                    </li>
                </ul>
                <!-- tabs nav -->

                <!-- tabs content -->
                <div class="tab-content">
                    <!-- settings tab -->
                    <div class="tab-pane active" id="group_settings">
                        <div class="form-group form-row">
                            <label class="col-md-3 form-control-label">
                                {__("Founder")}
                            </label>
                            <div class="col-md-9">
                                <a target="_blank" href="{$system['system_url']}/{$data['user_name']}">
                                    <img class="tbl-image" src="{$data['user_picture']}">
                                    {$data['user_firstname']} {$data['user_lastname']}
                                </a>
                                <a target="_blank" data-toggle="tooltip" data-placement="top" title='{__("Edit")}' href="{$system['system_url']}/{$control_panel['url']}/users/edit/{$data['user_id']}" class="btn btn-sm btn-light btn-icon btn-rounded ml10">
                                    <i class="fa fa-pencil-alt"></i>
                                </a>
                            </div>
                        </div>

                        <div class="form-group form-row">
                            <label class="col-md-3 form-control-label">
                                {__("Name Your Group")}
                            </label>
                            <div class="col-md-9">
                                <input class="form-control" name="title" value="{$data['group_title']}">
                            </div>
                        </div>

                        <div class="form-group form-row">
                            <label class="col-md-3 form-control-label">
                                {__("Web Address")}
                            </label>
                            <div class="col-md-9">
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text d-none d-sm-block">{$system['system_url']}/groups/</span>
                                    </div>
                                    <input type="text" class="form-control" name="username" id="username" value="{$data['group_name']}">
                                </div>
                            </div>
                        </div>

                        <div class="form-group form-row">
                            <label class="col-md-3 form-control-label">
                                {__("Select Privacy")}
                            </label>
                            <div class="col-md-9">
                                <select class="form-control selectpicker" name="privacy">
                                    <option {if $data['group_privacy'] == "public"}selected{/if} value="public" data-content="<div class='option'><div class='icon'><i class='fa fa-globe fa-lg'></i></div><div class='text'><b>{__("Public Group")}</b><br>{__("Anyone can see the group, its members and their posts")}.
                                    </div></div>">{__("Public Group")}</option>
                                    <option {if $data['group_privacy'] == "closed"}selected{/if} value="closed" data-content="<div class='option'><div class='icon'><i class='fa fa-unlock-alt fa-lg'></i></div><div class='text'><b>{__("Closed Group")}</b><br>{__("Only members can see posts")}.
                                    </div></div>">{__("Closed Group")}</option>
                                    <option {if $data['group_privacy'] == "secret"}selected{/if} value="secret" data-content="<div class='option'><div class='icon'><i class='fa fa-lock fa-lg'></i></div><div class='text'><b>{__("Secret Group")}</b><br>{__("Only members can find the group and see posts")}.
                                    </div></div>">{__("Secret Group")}</option>
                                </select>
                                <span class="form-text">
                                    ({__("Note: Change group privacy to public will approve any pending join requests")})
                                </span>
                            </div>
                        </div>

                        <div class="form-group form-row">
                            <label class="col-md-3 form-control-label">
                                {__("Category")}
                            </label>
                            <div class="col-md-9">
                                <select class="form-control" name="category">
                                    {foreach $data['categories'] as $category}
                                        <option {if $data['group_category'] == $category['category_id']}selected{/if} value="{$category['category_id']}">{__($category['category_name'])}</option>
                                    {/foreach}
                                </select>
                            </div>
                        </div>

                        <div class="form-group form-row">
                            <label class="col-md-3 form-control-label">
                                {__("About")}
                            </label>
                            <div class="col-md-9">
                                <textarea class="form-control" name="description" rows="5">{$data['group_description']}</textarea>
                            </div>
                        </div>

                        <!-- custom fields -->
                        {if $custom_fields['basic']}
                        {include file='__custom_fields.tpl' _custom_fields=$custom_fields['basic'] _registration=false _inline=true}
                        {/if}
                        <!-- custom fields -->

                        <div class="divider"></div>

                        <div class="form-table-row">
                            <div>
                                <div class="form-control-label h6">{__("Members Can Publish Posts?")}</div>
                                <div class="form-text d-none d-sm-block">{__("Members can publish posts or only group admins")}</div>
                            </div>
                            <div class="text-right">
                                <label class="switch" for="group_publish_enabled">
                                    <input type="checkbox" name="group_publish_enabled" id="group_publish_enabled" {if $data['group_publish_enabled']}checked{/if}>
                                    <span class="slider round"></span>
                                </label>
                            </div>
                        </div>

                        <div class="form-table-row">
                            <div>
                                <div class="form-control-label h6">{__("Post Approval")}</div>
                                <div class="form-text d-none d-sm-block">
                                    {__("All posts must be approved by a group admin")}<br>
                                    ({__("Note: Disable it will approve any pending posts")})
                                </div>
                            </div>
                            <div class="text-right">
                                <label class="switch" for="group_publish_approval_enabled">
                                    <input type="checkbox" name="group_publish_approval_enabled" id="group_publish_approval_enabled" {if $data['group_publish_approval_enabled']}checked{/if}>
                                    <span class="slider round"></span>
                                </label>
                            </div>
                        </div>

                        <!-- success -->
                        <div class="alert alert-success mb0 x-hidden"></div>
                        <!-- success -->

                        <!-- error -->
                        <div class="alert alert-danger mb0 x-hidden"></div>
                        <!-- error -->
                    </div>
                    <!-- settings tab -->
                </div>
                <!-- tabs content -->
            </div>
            <div class="card-footer text-right">
                <button type="submit" class="btn btn-primary">{__("Save Changes")}</button>
            </div>
        </form>

    {elseif $sub_view == "categories"}

        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-striped table-bordered table-hover js_dataTable">
                    <thead>
                        <tr>
                            <th>{__("ID")}</th>
                            <th>{__("Title")}</th>
                            <th>{__("Order")}</th>
                            <th>{__("Actions")}</th>
                        </tr>
                    </thead>
                    <tbody>
                        {foreach $rows as $row}
                            <tr>
                                <td>{$row['category_id']}</td>
                                <td>{$row['category_name']}</td>
                                <td>{$row['category_order']}</td>
                                <td>
                                    <a data-toggle="tooltip" data-placement="top" title='{__("Edit")}' href="{$system['system_url']}/{$control_panel['url']}/groups/edit_category/{$row['category_id']}" class="btn btn-sm btn-icon btn-rounded btn-primary">
                                        <i class="fa fa-pencil-alt"></i>
                                    </a>
                                    <button data-toggle="tooltip" data-placement="top" title='{__("Delete")}' class="btn btn-sm btn-icon btn-rounded btn-danger js_admin-deleter" data-handle="group_category" data-id="{$row['category_id']}">
                                        <i class="fa fa-trash-alt"></i>
                                    </button>
                                </td>
                            </tr>
                        {/foreach}
                    </tbody>
                </table>
            </div>
        </div>

    {elseif $sub_view == "add_category"}

        <form class="js_ajax-forms " data-url="admin/groups.php?do=add_category">
            <div class="card-body">
                <div class="form-group form-row">
                    <label class="col-md-3 form-control-label">
                        {__("Name")}
                    </label>
                    <div class="col-md-9">
                        <input class="form-control" name="category_name">
                    </div>
                </div>

                <div class="form-group form-row">
                    <label class="col-md-3 form-control-label">
                        {__("Order")}
                    </label>
                    <div class="col-md-9">
                        <input class="form-control" name="category_order">
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
        
    {elseif $sub_view == "edit_category"}

        <form class="js_ajax-forms " data-url="admin/groups.php?do=edit_category&id={$data['category_id']}">
            <div class="card-body">
                <div class="form-group form-row">
                    <label class="col-md-3 form-control-label">
                        {__("Name")}
                    </label>
                    <div class="col-md-9">
                        <input class="form-control" name="category_name" value="{$data['category_name']}">
                    </div>
                </div>

                <div class="form-group form-row">
                    <label class="col-md-3 form-control-label">
                        {__("Order")}
                    </label>
                    <div class="col-md-9">
                        <input class="form-control" name="category_order" value="{$data['category_order']}">
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