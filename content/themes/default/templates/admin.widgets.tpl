<div class="card">
    <div class="card-header with-icon">
        {if $sub_view == ""}
            <div class="float-right">
                <a href="{$system['system_url']}/{$control_panel['url']}/widgets/add" class="btn btn-sm btn-primary">
                    <i class="fa fa-plus mr5"></i>{__("Add New widget")}
                </a>
            </div>
        {else}
            <div class="float-right">
                <a href="{$system['system_url']}/{$control_panel['url']}/widgets" class="btn btn-sm btn-light">
                    <i class="fa fa-arrow-circle-left mr5"></i>{__("Go Back")}
                </a>
            </div>
        {/if}
        <i class="fa fa-puzzle-piece mr10"></i>{__("Widgets")}
        {if $sub_view == "edit"} &rsaquo; {$data['title']}{/if}
        {if $sub_view == "add"} &rsaquo; {__("Add New widget")}{/if}
    </div>

    {if $sub_view == ""}

        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-striped table-bordered table-hover js_dataTable">
                    <thead>
                        <tr>
                            <th>{__("ID")}</th>
                            <th>{__("Title")}</th>
                            <th>{__("Place")}</th>
                            <th>{__("Order")}</th>
                            <th>{__("Actions")}</th>
                        </tr>
                    </thead>
                    <tbody>
                        {foreach $rows as $row}
                            <tr>
                                <td>{$row['widget_id']}</td>
                                <td>{$row['title']}</td>
                                <td>
                                    {if $row['place'] == "home"}<i class='fa fa-home fa-fw mr5'></i>{__("Home  Page")}{/if}
                                    {if $row['place'] == "search"}<i class='fa fa-search fa-fw mr5'></i>{__("Search  Page")}{/if}
                                    {if $row['place'] == "people"}<i class='fa fa-users fa-fw mr5'></i>{__("Discover People  Page")}{/if}
                                    {if $row['place'] == "notifications"}<i class='fa fa-bell fa-fw mr5'></i>{__("Notifications  Page")}{/if}
                                    {if $row['place'] == "post"}<i class='fa fa-file-powerpoint fa-fw mr5'></i>{__("Post  Page")}{/if}
                                    {if $row['place'] == "photo"}<i class='fa fa-file-image fa-fw mr5'></i>{__("Photo  Page")}{/if}
                                    {if $row['place'] == "article"}<i class='fa fa-file-alt fa-fw mr5'></i>{__("Article  Page")}{/if}
                                    {if $row['place'] == "directory"}<i class='fa fa-th-list fa-fw mr5'></i>{__("Directory  Page")}{/if}
                                </td>
                                <td>{$row['place_order']}</td>
                                <td>
                                    <a data-toggle="tooltip" data-placement="top" title='{__("Edit")}' href="{$system['system_url']}/{$control_panel['url']}/widgets/edit/{$row['widget_id']}" class="btn btn-sm btn-icon btn-rounded btn-primary">
                                        <i class="fa fa-pencil-alt"></i>
                                    </a>
                                    <button data-toggle="tooltip" data-placement="top" title='{__("Delete")}' class="btn btn-sm btn-icon btn-rounded btn-danger js_admin-deleter" data-handle="widget" data-id="{$row['widget_id']}">
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

        <form class="js_ajax-forms " data-url="admin/widgets.php?do=edit&id={$data['widget_id']}">
            <div class="card-body">
                <div class="form-group form-row">
                    <label class="col-md-3 form-control-label">
                        {__("Title")}
                    </label>
                    <div class="col-md-9">
                        <input class="form-control" name="title" value="{$data['title']}">
                    </div>
                </div>

                <div class="form-group form-row">
                    <label class="col-md-3 form-control-label">
                        {__("Place")}
                    </label>
                    <div class="col-md-9">
                        <select class="form-control selectpicker" name="place">
                            <option {if $data['place'] == "home"}selected{/if} value="home" data-content="<div class='option'><div class='icon'><i class='fa fa-home fa-fw fa-lg'></i></div><div class='text'><b>{__("Home")}</b><br>{__("Appears on the right panel of home page")}.
                            </div></div>">{__("Home")}</option>

                            <option {if $data['place'] == "search"}selected{/if} value="search" data-content="<div class='option'><div class='icon'><i class='fa fa-search fa-fw fa-lg'></i></div><div class='text'><b>{__("Search")}</b><br>{__("Appears on the right panel of search page")}.
                            </div></div>">{__("Search")}</option>

                            <option {if $data['place'] == "people"}selected{/if} value="people" data-content="<div class='option'><div class='icon'><i class='fa fa-users fa-fw fa-lg'></i></div><div class='text'><b>{__("Discover People")}</b><br>{__("Appears on the right panel of discover people page")}.
                            </div></div>">{__("Discover People")}</option>

                            <option {if $data['place'] == "notifications"}selected{/if} value="notifications" data-content="<div class='option'><div class='icon'><i class='fa fa-bell fa-fw fa-lg'></i></div><div class='text'><b>{__("Notifications")}</b><br>{__("Appears on the right panel of notifications page")}.
                            </div></div>">{__("Notifications")}</option>

                            <option {if $data['place'] == "post"}selected{/if} value="post" data-content="<div class='option'><div class='icon'><i class='fa fa-file-powerpoint fa-fw fa-lg'></i></div><div class='text'><b>{__("Post")}</b><br>{__("Appears on the right panel of post page")}.
                            </div></div>">{__("Post")}</option>

                            <option {if $data['place'] == "photo"}selected{/if} value="photo" data-content="<div class='option'><div class='icon'><i class='fa fa-file-image fa-fw fa-lg'></i></div><div class='text'><b>{__("Photo")}</b><br>{__("Appears on the right panel of photo page")}.
                            </div></div>">{__("Photo")}</option>

                            <option {if $data['place'] == "article"}selected{/if} value="article" data-content="<div class='option'><div class='icon'><i class='fa fa-file-alt fa-fw fa-lg'></i></div><div class='text'><b>{__("Article Page")}</b><br>{__("Appears on the sidebar on article page")}.
                            </div></div>">{__("Article Page")}</option>

                            <option {if $data['place'] == "directory"}selected{/if} value="directory" data-content="<div class='option'><div class='icon'><i class='fa fa-th-list fa-fw fa-lg'></i></div><div class='text'><b>{__("Directory")}</b><br>{__("Appears on the right panel of directory")}.
                            </div></div>">{__("Directory")}</option>
                        </select>
                    </div>
                </div>

                <div class="form-group form-row">
                    <label class="col-md-3 form-control-label">
                        {__("Order")}
                    </label>
                    <div class="col-md-9">
                        <input class="form-control" name="place_order" value="{$data['place_order']}">
                    </div>
                </div>

                <div class="form-group form-row">
                    <label class="col-md-3 form-control-label">
                        {__("HTML")}
                    </label>
                    <div class="col-md-9">
                        <textarea class="form-control" name="message" rows="8">{$data['code']}</textarea>
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

        <form class="js_ajax-forms " data-url="admin/widgets.php?do=add">
            <div class="card-body">
                <div class="form-group form-row">
                    <label class="col-md-3 form-control-label">
                        {__("Title")}
                    </label>
                    <div class="col-md-9">
                        <input class="form-control" name="title">
                    </div>
                </div>

                <div class="form-group form-row">
                    <label class="col-md-3 form-control-label">
                        {__("Place")}
                    </label>
                    <div class="col-md-9">
                        <select class="form-control selectpicker" name="place">
                            <option value="home" data-content="<div class='option'><div class='icon'><i class='fa fa-home fa-fw fa-lg'></i></div><div class='text'><b>{__("Home")}</b><br>{__("Appears on the right panel of home page")}.
                            </div></div>">{__("Home")}</option>

                            <option value="search" data-content="<div class='option'><div class='icon'><i class='fa fa-search fa-fw fa-lg'></i></div><div class='text'><b>{__("Search")}</b><br>{__("Appears on the right panel of search page")}.
                            </div></div>">{__("Search")}</option>

                            <option value="people" data-content="<div class='option'><div class='icon'><i class='fa fa-users fa-fw fa-lg'></i></div><div class='text'><b>{__("Discover People")}</b><br>{__("Appears on the right panel of discover people page")}.
                            </div></div>">{__("Discover People")}</option>

                            <option value="notifications" data-content="<div class='option'><div class='icon'><i class='fa fa-bell fa-fw fa-lg'></i></div><div class='text'><b>{__("Notifications")}</b><br>{__("Appears on the right panel of notifications page")}.
                            </div></div>">{__("Notifications")}</option>

                            <option value="post" data-content="<div class='option'><div class='icon'><i class='fa fa-file-powerpoint fa-fw fa-lg'></i></div><div class='text'><b>{__("Post")}</b><br>{__("Appears on the right panel of post page")}.
                            </div></div>">{__("Post")}</option>

                            <option value="photo" data-content="<div class='option'><div class='icon'><i class='fa fa-file-image fa-fw fa-lg'></i></div><div class='text'><b>{__("Photo")}</b><br>{__("Appears on the right panel of photo page")}.
                            </div></div>">{__("Photo")}</option>

                            <option value="article" data-content="<div class='option'><div class='icon'><i class='fa fa-file-alt fa-fw fa-lg'></i></div><div class='text'><b>{__("Article Page")}</b><br>{__("Appears on the sidebar on article page")}.
                            </div></div>">{__("Article Page")}</option>

                            <option value="directory" data-content="<div class='option'><div class='icon'><i class='fa fa-th-list fa-fw fa-lg'></i></div><div class='text'><b>{__("Directory")}</b><br>{__("Appears on the right panel of directory")}.
                            </div></div>">{__("Directory")}</option>
                        </select>
                    </div>
                </div>

                <div class="form-group form-row">
                    <label class="col-md-3 form-control-label">
                        {__("Order")}
                    </label>
                    <div class="col-md-9">
                        <input class="form-control" name="place_order">
                    </div>
                </div>
                
                <div class="form-group form-row">
                    <label class="col-md-3 form-control-label">
                        {__("HTML")}
                    </label>
                    <div class="col-md-9">
                        <textarea class="form-control" name="message" rows="8"></textarea>
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