<div class="card">
    <div class="card-header with-icon">
        {if $sub_view == ""}
            <div class="float-right">
                <a href="{$system['system_url']}/{$control_panel['url']}/emojis/add" class="btn btn-sm btn-primary">
                    <i class="fa fa-plus mr5"></i>{__("Add New Emoji")}
                </a>
            </div>
        {else}
            <div class="float-right">
                <a href="{$system['system_url']}/{$control_panel['url']}/emojis" class="btn btn-sm btn-light">
                    <i class="fa fa-arrow-circle-left mr5"></i>{__("Go Back")}
                </a>
            </div>
        {/if}
        <i class="fa fa-smile mr10"></i>{__("Emojis")}
        {if $sub_view == "add"} &rsaquo; {__("Add New Emoji")}{/if}
        {if $sub_view == "edit"} &rsaquo; {__("Edit Emoji")}{/if}
    </div>

    {if $sub_view == ""}

        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-striped table-bordered table-hover js_dataTable">
                    <thead>
                        <tr>
                            <th>{__("ID")}</th>
                            <th>{__("Preview")}</th>
                            <th>{__("Pattern")}</th>
                            <th>{__("Class")}</th>
                            <th>{__("Actions")}</th>
                        </tr>
                    </thead>
                    <tbody>
                        {foreach $rows as $row}
                            <tr>
                                <td>{$row['emoji_id']}</td>
                                <td><i class="twa twa-2x twa-{$row['class']}"></i></td>
                                <td>{$row['pattern']}</td>
                                <td>{$row['class']}</td>
                                <td>
                                    <a data-toggle="tooltip" data-placement="top" title='{__("Edit")}' href="{$system['system_url']}/{$control_panel['url']}/emojis/edit/{$row['emoji_id']}" class="btn btn-sm btn-icon btn-rounded btn-primary">
                                        <i class="fa fa-pencil-alt"></i>
                                    </a>
                                    <button data-toggle="tooltip" data-placement="top" title='{__("Delete")}' class="btn btn-sm btn-icon btn-rounded btn-danger js_admin-deleter" data-handle="emoji" data-id="{$row['emoji_id']}">
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

        <form class="js_ajax-forms " data-url="admin/emojis.php?do=add">
            <div class="card-body">
                <div class="alert alert-info">
                    <div class="icon">
                        <i class="fa fa-info-circle fa-2x"></i>
                    </div>
                    <div class="text pt5">
                        {__("Sngine uses Twemoji Awesome and you can check")} <a class="alert-link" target="_blank" href="https://www.webpagefx.com/tools/emoji-cheat-sheet/">{__("Emoji Cheat Sheet")}</a>  {__("for the Emojis, You must replace underscores with hyphens, For example: :hatching_chick: for pattern and hatching-chickas for class")}.
                    </div>
                </div>

                <div class="form-group form-row">
                    <label class="col-md-3 form-control-label">
                        {__("Pattern")}
                    </label>
                    <div class="col-md-9">
                        <input class="form-control" name="pattern">
                    </div>
                </div>

                <div class="form-group form-row">
                    <label class="col-md-3 form-control-label">
                        {__("Class")}
                    </label>
                    <div class="col-md-9">
                        <input class="form-control" name="class">
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

    {elseif $sub_view == "edit"}

        <form class="js_ajax-forms " data-url="admin/emojis.php?do=edit&id={$data['emoji_id']}">
            <div class="card-body">
                <div class="alert alert-warning">
                    <div class="icon">
                        <i class="fa fa-exclamation-triangle fa-2x"></i>
                    </div>
                    <div class="text pt5">
                        {__("Sngine uses Twemoji Awesome and you can check")} <a class="alert-link" target="_blank" href="https://www.webpagefx.com/tools/emoji-cheat-sheet/">{__("Emoji Cheat Sheet")}</a>  {__("for the Emojis, You must replace underscores with hyphens, For example: :hatching_chick: for pattern and hatching-chickas for class")}.
                    </div>
                </div>

                <div class="form-group form-row">
                    <label class="col-md-3 form-control-label">
                        {__("Pattern")}
                    </label>
                    <div class="col-md-9">
                        <input class="form-control" name="pattern" value="{$data['pattern']}">
                    </div>
                </div>

                <div class="form-group form-row">
                    <label class="col-md-3 form-control-label">
                        {__("Class")}
                    </label>
                    <div class="col-md-9">
                        <input class="form-control" name="class" value="{$data['class']}">
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