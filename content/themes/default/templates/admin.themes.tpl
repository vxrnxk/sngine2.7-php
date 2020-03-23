<div class="card">
    <div class="card-header with-icon">
        {if $sub_view == ""}
            <div class="float-right">
                <a href="{$system['system_url']}/{$control_panel['url']}/themes/add" class="btn btn-sm btn-primary">
                    <i class="fa fa-plus mr5"></i>{__("Add New Theme")}
                </a>
            </div>
        {elseif $sub_view == "add" || $sub_view == "edit"}
            <div class="float-right">
                <a href="{$system['system_url']}/{$control_panel['url']}/themes" class="btn btn-sm btn-light">
                    <i class="fa fa-arrow-circle-left mr5"></i>{__("Go Back")}
                </a>
            </div>
        {/if}
        <i class="fa fa-desktop mr10"></i>{__("Themes")}
        {if $sub_view == "edit"} &rsaquo; {$data['name']}{/if}
        {if $sub_view == "add"} &rsaquo; {__("Add New Theme")}{/if}
    </div>
    
    {if $sub_view == ""}

        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-striped table-bordered table-hover js_dataTable">
                    <thead>
                        <tr>
                            <th>{__("ID")}</th>
                            <th>{__("Thumbnail")}</th>
                            <th>{__("Name")}</th>
                            <th>{__("Default")}</th>
                            <th>{__("Actions")}</th>
                        </tr>
                    </thead>
                    <tbody>
                        {foreach $rows as $row}
                            <tr>
                                <td>{$row['theme_id']}</td>
                                <td>
                                    <img width="210" src="{$system['system_url']}/content/themes/{$row['name']}/thumbnail.png">
                                </td>
                                <td>{$row['name']}</td>
                                <td>
                                    {if $row['default']}
                                        <span class="badge badge-pill badge-lg badge-success">{__("Yes")}</span>
                                    {else}
                                        <span class="badge badge-pill badge-lg badge-danger">{__("No")}</span>
                                    {/if}
                                </td>
                                <td>
                                    <a data-toggle="tooltip" data-placement="top" title='{__("Edit")}' href="{$system['system_url']}/{$control_panel['url']}/themes/edit/{$row['theme_id']}" class="btn btn-sm btn-icon btn-rounded btn-primary">
                                        <i class="fa fa-pencil-alt"></i>
                                    </a>
                                    <button data-toggle="tooltip" data-placement="top" title='{__("Delete")}' class="btn btn-sm btn-icon btn-rounded btn-danger js_admin-deleter" data-handle="theme" data-id="{$row['theme_id']}">
                                        <i class="fa fa-trash-alt"></i>
                                    </button>
                                </td>
                            </tr>
                        {/foreach}
                    </tbody>
                </table>
            </div>
        </div>

    {elseif $sub_view == "edit"}
        
        <form class="js_ajax-forms " data-url="admin/themes.php?do=edit&id={$data['theme_id']}">
            <div class="card-body">
                <div class="form-group form-row">
                    <label class="col-md-3 form-control-label">
                        {__("Default")}
                    </label>
                    <div class="col-md-9">
                        <label class="switch" for="default">
                            <input type="checkbox" name="default" id="default" {if $data['default']}checked{/if}>
                            <span class="slider round"></span>
                        </label>
                        <span class="form-text">
                            {__("Make it the default theme of the site")}
                        </span>
                    </div>
                </div>

                <div class="form-group form-row">
                    <label class="col-md-3 form-control-label">
                        {__("Name")}
                    </label>
                    <div class="col-md-9">
                        <input class="form-control" name="name" value="{$data['name']}">
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
        

    {elseif $sub_view == "add"}

        <form class="js_ajax-forms " data-url="admin/themes.php?do=add">
            <div class="card-body">
            <div class="form-group form-row">
                <label class="col-md-3 form-control-label">
                    {__("Default")}
                </label>
                <div class="col-md-9">
                    <label class="switch" for="default">
                        <input type="checkbox" name="default" id="default">
                        <span class="slider round"></span>
                    </label>
                    <span class="form-text">
                        {__("Make it the default theme of the site")}
                    </span>
                </div>
            </div>

            <div class="form-group form-row">
                <label class="col-md-3 form-control-label">
                    {__("Name")}
                </label>
                <div class="col-md-9">
                    <input class="form-control" name="name">
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