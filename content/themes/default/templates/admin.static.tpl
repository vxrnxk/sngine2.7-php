<div class="card">
    <div class="card-header with-icon">
        {if $sub_view == ""}
            <div class="float-right">
                <a href="{$system['system_url']}/{$control_panel['url']}/static/add" class="btn btn-sm btn-primary">
                    <i class="fa fa-plus mr5"></i>{__("Add New Page")}
                </a>
            </div>
        {else}
            <div class="float-right">
                <a href="{$system['system_url']}/{$control_panel['url']}/static" class="btn btn-sm btn-light">
                    <i class="fa fa-arrow-circle-left mr5"></i>{__("Go Back")}
                </a>
            </div>
        {/if}
        <i class="fa fa-file mr10"></i>{__("Static Pages")}
        {if $sub_view == "edit"} &rsaquo; {$data['page_title']}{/if}
        {if $sub_view == "add"} &rsaquo; {__("Add New Page")}{/if}
    </div>

    {if $sub_view == ""}

        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-striped table-bordered table-hover js_dataTable">
                    <thead>
                        <tr>
                            <th>{__("ID")}</th>
                            <th>{__("Page URL")}</th>
                            <th>{__("Page Title")}</th>
                            <th>{__("In Footer Menu")}</th>
                            <th>{__("Order")}</th>
                            <th>{__("Actions")}</th>
                        </tr>
                    </thead>
                    <tbody>
                        {foreach $rows as $row}
                            <tr>
                                <td>{$row['page_id']}</td>
                                <td>
                                    <a target="_blank" href="{$system['system_url']}/static/{$row['page_url']}">
                                        {$row['page_url']}
                                    </a>
                                </td>
                                <td>{$row['page_title']}</td>
                                <td>
                                    {if $row['page_in_footer']}
                                        <span class="badge badge-pill badge-lg badge-success">{__("Yes")}</span>
                                    {else}
                                        <span class="badge badge-pill badge-lg badge-danger">{__("No")}</span>
                                    {/if}
                                </td>
                                <td>{$row['page_order']}</td>
                                <td>
                                    <a data-toggle="tooltip" data-placement="top" title='{__("Edit")}' href="{$system['system_url']}/{$control_panel['url']}/static/edit/{$row['page_id']}" class="btn btn-sm btn-icon btn-rounded btn-primary">
                                        <i class="fa fa-pencil-alt"></i>
                                    </a>
                                    <button data-toggle="tooltip" data-placement="top" title='{__("Delete")}' class="btn btn-sm btn-icon btn-rounded btn-danger js_admin-deleter" data-handle="static_page" data-id="{$row['page_id']}">
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

        <form class="js_ajax-forms " data-url="admin/static.php?do=edit&id={$data['page_id']}">
            <div class="card-body">
                <div class="form-group form-row">
                    <label class="col-md-3 form-control-label">
                        {__("Web Address")}
                    </label>
                    <div class="col-md-9">
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text d-none d-sm-block">{$system['system_url']}/static/</span>
                            </div>
                            <input type="text" class="form-control" name="page_url" value="{$data['page_url']}">
                        </div>
                        <span class="form-text">
                            {__("Valid web address must be a-z0-9_.")}
                        </span>
                    </div>
                </div>

                <div class="form-group form-row">
                    <label class="col-md-3 form-control-label">
                        {__("Page Title")}
                    </label>
                    <div class="col-md-9">
                        <input class="form-control" name="page_title" value="{$data['page_title']}">
                    </div>
                </div>

                <div class="form-group form-row">
                    <label class="col-md-3 form-control-label">
                        {__("Page Content")}
                    </label>
                    <div class="col-md-9">
                        <textarea class="form-control js_wysiwyg-advanced" name="page_text">{$data['page_text']}</textarea>
                    </div>
                </div>

                <div class="form-group form-row">
                    <label class="col-md-3 form-control-label">
                        {__("Add to Footer Menu")}
                    </label>
                    <div class="col-md-9">
                        <label class="switch" for="page_in_footer">
                            <input type="checkbox" name="page_in_footer" id="page_in_footer" {if $data['page_in_footer']}checked{/if}>
                            <span class="slider round"></span>
                        </label>
                        <span class="form-text">
                            {__("Show the page in the footer links menu")}
                        </span>
                    </div>
                </div>

                <div class="form-group form-row">
                    <label class="col-md-3 form-control-label">
                        {__("Order")}
                    </label>
                    <div class="col-md-9">
                        <input class="form-control" name="page_order" value="{$data['page_order']}">
                        <span class="form-text">
                            {__("The order of the page in the footer menu")}
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

    {elseif $sub_view == "add"}

        <form class="js_ajax-forms " data-url="admin/static.php?do=add">
            <div class="card-body">
                <div class="form-group form-row">
                    <label class="col-md-3 form-control-label">
                        {__("Web Address")}
                    </label>
                    <div class="col-md-9">
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text d-none d-sm-block">{$system['system_url']}/static/</span>
                            </div>
                            <input type="text" class="form-control" name="page_url">
                        </div>
                        <span class="form-text">
                            {__("Valid web address must be a-z0-9_.")}
                        </span>
                    </div>
                </div>

                <div class="form-group form-row">
                    <label class="col-md-3 form-control-label">
                        {__("Page Title")}
                    </label>
                    <div class="col-md-9">
                        <input class="form-control" name="page_title">
                    </div>
                </div>

                <div class="form-group form-row">
                    <label class="col-md-3 form-control-label">
                        {__("Page Content")}
                    </label>
                    <div class="col-md-9">
                        <textarea class="form-control js_wysiwyg-advanced" name="page_text"></textarea>
                    </div>
                </div>

                <div class="form-group form-row">
                    <label class="col-md-3 form-control-label">
                        {__("Add to Footer Menu")}
                    </label>
                    <div class="col-md-9">
                        <label class="switch" for="page_in_footer">
                            <input type="checkbox" name="page_in_footer" id="page_in_footer">
                            <span class="slider round"></span>
                        </label>
                        <span class="form-text">
                            {__("Show the page in the footer links menu")}
                        </span>
                    </div>
                </div>

                <div class="form-group form-row">
                    <label class="col-md-3 form-control-label">
                        {__("Order")}
                    </label>
                    <div class="col-md-9">
                        <input class="form-control" name="page_order">
                        <span class="form-text">
                            {__("The order of the page in the footer menu")}
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