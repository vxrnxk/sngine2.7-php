<div class="card">
    <div class="card-header with-icon">
        {if $sub_view == ""}
            <div class="float-right">
                <a href="{$system['system_url']}/{$control_panel['url']}/currencies/add" class="btn btn-sm btn-primary">
                    <i class="fa fa-plus mr5"></i>{__("Add New Currency")}
                </a>
            </div>
        {elseif $sub_view == "add" || $sub_view == "edit"}
            <div class="float-right">
                <a href="{$system['system_url']}/{$control_panel['url']}/currencies" class="btn btn-sm btn-light">
                    <i class="fa fa-arrow-circle-left mr5"></i>{__("Go Back")}
                </a>
            </div>
        {/if}
        <i class="fa fa-money-bill-alt mr10"></i>{__("Currencies")}
        {if $sub_view == "edit"} &rsaquo; {$data['name']}{/if}
        {if $sub_view == "add"} &rsaquo; {__("Add New Currency")}{/if}
    </div>

    {if $sub_view == ""}

        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-striped table-bordered table-hover js_dataTable">
                    <thead>
                        <tr>
                            <th>{__("ID")}</th>
                            <th>{__("Name")}</th>
                            <th>{__("Code")}</th>
                            <th>{__("Symbol")}</th>
                            <th>{__("Default")}</th>
                            <th>{__("Actions")}</th>
                        </tr>
                    </thead>
                    <tbody>
                        {foreach $rows as $row}
                            <tr>
                                <td>{$row['currency_id']}</td>
                                <td>{$row['name']}</td>
                                <td>{$row['code']}</td>
                                <td>{$row['symbol']}</td>
                                <td>
                                    {if $row['default']}
                                        <span class="badge badge-pill badge-lg badge-success">{__("Yes")}</span>
                                    {else}
                                        <span class="badge badge-pill badge-lg badge-danger">{__("No")}</span>
                                    {/if}
                                </td>
                                <td>
                                    <a data-toggle="tooltip" data-placement="top" title='{__("Edit")}' href="{$system['system_url']}/{$control_panel['url']}/currencies/edit/{$row['currency_id']}" class="btn btn-sm btn-icon btn-rounded btn-primary">
                                        <i class="fa fa-pencil-alt"></i>
                                    </a>
                                    <button data-toggle="tooltip" data-placement="top" title='{__("Delete")}' class="btn btn-sm btn-icon btn-rounded btn-danger js_admin-deleter" data-handle="currency" data-id="{$row['currency_id']}">
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

        <form class="js_ajax-forms " data-url="admin/currencies.php?do=edit&id={$data['currency_id']}">
            <div class="card-body">
                <div class="form-group form-row">
                    <label class="col-md-3 form-control-label">
                        {__("Currency Name")}
                    </label>
                    <div class="col-md-9">
                        <input class="form-control" name="name" value="{$data['name']}">
                        <span class="form-text">
                            {__("Currency name, For Example: U.S. Dollar, Euro or Pound Sterling")}
                        </span>
                    </div>
                </div>

                <div class="form-group form-row">
                    <label class="col-md-3 form-control-label">
                        {__("Currency Code")}
                    </label>
                    <div class="col-md-9">
                        <input class="form-control" name="code" value="{$data['code']}">
                        <span class="form-text">
                            {__("Currency code, For Example: USD, EUR or GBP")}
                        </span>
                    </div>
                </div>

                <div class="form-group form-row">
                    <label class="col-md-3 form-control-label">
                        {__("Currency Symbol")}
                    </label>
                    <div class="col-md-9">
                        <input class="form-control" name="symbol" value="{$data['symbol']}">
                        <span class="form-text">
                            {__("Currency symbol, For Example: $, € or £")}
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

        <form class="js_ajax-forms " data-url="admin/currencies.php?do=add">
            <div class="card-body">
                <div class="form-group form-row">
                    <label class="col-md-3 form-control-label">
                        {__("Currency Name")}
                    </label>
                    <div class="col-md-9">
                        <input class="form-control" name="name">
                        <span class="form-text">
                            {__("Currency name, For Example: U.S. Dollar, Euro or Pound Sterling")}
                        </span>
                    </div>
                </div>

                <div class="form-group form-row">
                    <label class="col-md-3 form-control-label">
                        {__("Currency Code")}
                    </label>
                    <div class="col-md-9">
                        <input class="form-control" name="code">
                        <span class="form-text">
                            {__("Currency code, For Example: USD, EUR or GBP")}
                        </span>
                    </div>
                </div>

                <div class="form-group form-row">
                    <label class="col-md-3 form-control-label">
                        {__("Currency Symbol")}
                    </label>
                    <div class="col-md-9">
                        <input class="form-control" name="symbol">
                        <span class="form-text">
                            {__("Currency symbol, For Example: $, € or £")}
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