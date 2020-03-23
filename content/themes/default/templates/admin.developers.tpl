<div class="card">
    <div class="card-header with-icon">
        {if $sub_view == "categories"}
            <div class="float-right">
                <a href="{$system['system_url']}/{$control_panel['url']}/developers/add_category" class="btn btn-sm btn-primary">
                    <i class="fa fa-plus mr5"></i>{__("Add New Category")}
                </a>
            </div>
        {elseif $sub_view == "add_category" || $sub_view == "edit_category"}
            <div class="float-right">
                <a href="{$system['system_url']}/{$control_panel['url']}/developers/categories" class="btn btn-sm btn-light">
                    <i class="fa fa-arrow-circle-left mr5"></i>{__("Go Back")}
                </a>
            </div>
        {/if}
        <i class="fa fa-cubes mr10"></i>{__("Developers")}
        {if $sub_view == ""} &rsaquo; {__("Settings")}{/if}
        {if $sub_view == "apps"} &rsaquo; {__("Apps")}{/if}
        {if $sub_view == "categories"} &rsaquo; {__("Categories")}{/if}
        {if $sub_view == "add_category"} &rsaquo; {__("Categories")} &rsaquo; {__("Add New Category")}{/if}
        {if $sub_view == "edit_category"} &rsaquo; {__("Categories")} &rsaquo; {$data['category_name']}{/if}
    </div>

    {if $sub_view == ""}

        <form class="js_ajax-forms " data-url="admin/developers.php?do=settings">
            <div class="card-body">
                <div class="form-table-row">
                    <div>
                        <div class="form-control-label h6">{__("Developers Apps")}</div>
                        <div class="form-text d-none d-sm-block">
                            {__("Turn the developers apps On and Off")}<br>
                            {__("Developers apps will allow other developers to use your system APIs like login with and get user info")}<br>
                        </div>
                    </div>
                    <div class="text-right">
                        <label class="switch" for="developers_apps_enabled">
                            <input type="checkbox" name="developers_apps_enabled" id="developers_apps_enabled" {if $system['developers_apps_enabled']}checked{/if}>
                            <span class="slider round"></span>
                        </label>
                    </div>
                </div>

                <div class="form-table-row">
                    <div>
                        <div class="form-control-label h6">{__("Share Plugin")}</div>
                        <div class="form-text d-none d-sm-block">{__("Turn the share plugin On and Off")}</div>
                    </div>
                    <div class="text-right">
                        <label class="switch" for="developers_share_enabled">
                            <input type="checkbox" name="developers_share_enabled" id="developers_share_enabled" {if $system['developers_share_enabled']}checked{/if}>
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
            <div class="card-footer text-right">
                <button type="submit" class="btn btn-primary">{__("Save Changes")}</button>
            </div>
        </form>

    {elseif $sub_view == "apps"}

        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-striped table-bordered table-hover js_dataTable">
                    <thead>
                        <tr>
                            <th>{__("ID")}</th>
                            <th>{__("App Name")}</th>
                            <th>{__("App ID")}</th>
                            <th>{__("App Secret")}</th>
                            <th>{__("Created")}</th>
                            <th>{__("Actions")}</th>
                        </tr>
                    </thead>
                    <tbody>
                        {foreach $rows as $row}
                            <tr>
                                <td>{$row['app_id']}</td>
                                <td>
                                    <a target="_blank" href="{$system['system_url']}/developers/edit/{$row['app_auth_id']}">
                                        <img class="tbl-image" src="{$system['system_uploads']}/{$row['app_icon']}">
                                        {$row['app_name']}
                                    </a>
                                </td>
                                <td>{$row['app_auth_id']}</td>
                                <td>{$row['app_auth_secret']}</td>
                                <td>{$row['app_date']|date_format:"%e %B %Y"}</td>
                                <td>
                                    <a data-toggle="tooltip" data-placement="top" title='{__("Edit")}' href="{$system['system_url']}/developers/edit/{$row['app_auth_id']}" class="btn btn-sm btn-icon btn-rounded btn-primary">
                                        <i class="fa fa-pencil-alt"></i>
                                    </a>
                                    <button data-toggle="tooltip" data-placement="top" title='{__("Delete")}' class="btn btn-sm btn-icon btn-rounded btn-danger js_developers-delete-app" data-id="{$row['app_auth_id']}">
                                        <i class="fas fa-trash"></i>
                                    </button>
                                </td>
                            </tr>
                        {/foreach}
                    </tbody>
                </table>
            </div>
        </div>

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
                                    <a data-toggle="tooltip" data-placement="top" title='{__("Edit")}' href="{$system['system_url']}/{$control_panel['url']}/developers/edit_category/{$row['category_id']}" class="btn btn-sm btn-icon btn-rounded btn-primary">
                                        <i class="fa fa-pencil-alt"></i>
                                    </a>
                                    <button data-toggle="tooltip" data-placement="top" title='{__("Delete")}' class="btn btn-sm btn-icon btn-rounded btn-danger js_admin-deleter" data-handle="apps_category" data-id="{$row['category_id']}">
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

        <form class="js_ajax-forms " data-url="admin/developers.php?do=add_category">
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

        <form class="js_ajax-forms " data-url="admin/developers.php?do=edit_category&id={$data['category_id']}">
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