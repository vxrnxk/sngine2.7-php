<div class="card">
    <div class="card-header with-icon">
        {if $sub_view == "categories"}
            <div class="float-right">
                <a href="{$system['system_url']}/{$control_panel['url']}/market/add_category" class="btn btn-sm btn-primary">
                    <i class="fa fa-plus mr5"></i>{__("Add New Category")}
                </a>
            </div>
        {elseif $sub_view == "add_category" || $sub_view == "edit_category"}
            <div class="float-right">
                <a href="{$system['system_url']}/{$control_panel['url']}/market/categories" class="btn btn-sm btn-light">
                    <i class="fa fa-arrow-circle-left mr5"></i>{__("Go Back")}
                </a>
            </div>
        {/if}
        <i class="fa fa-shopping-bag mr10"></i>{__("Market")}
        {if $sub_view == "categories"} &rsaquo; {__("Categories")}{/if}
        {if $sub_view == "add_category"} &rsaquo; {__("Categories")} &rsaquo; {__("Add New Category")}{/if}
        {if $sub_view == "edit_category"} &rsaquo; {__("Categories")} &rsaquo; {$data['category_name']}{/if}
    </div>

    {if $sub_view == "categories"}

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
                                    <a data-toggle="tooltip" data-placement="top" title='{__("Edit")}' href="{$system['system_url']}/{$control_panel['url']}/market/edit_category/{$row['category_id']}" class="btn btn-sm btn-icon btn-rounded btn-primary">
                                        <i class="fa fa-pencil-alt"></i>
                                    </a>
                                    <button data-toggle="tooltip" data-placement="top" title='{__("Delete")}' class="btn btn-sm btn-icon btn-rounded btn-danger js_admin-deleter" data-handle="market_category" data-id="{$row['category_id']}">
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

        <form class="js_ajax-forms " data-url="admin/market.php?do=add_category">
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

        <form class="js_ajax-forms " data-url="admin/market.php?do=edit_category&id={$data['category_id']}">
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