<div class="card">
    <div class="card-header with-icon">
        {if $sub_view == "find"}
            <div class="float-right">
                <a href="{$system['system_url']}/{$control_panel['url']}/events" class="btn btn-sm btn-light">
                    <i class="fa fa-arrow-circle-left mr5"></i>{__("Go Back")}
                </a>
            </div>
        {elseif $sub_view == "edit_event"}
            <div class="float-right">
                <a href="{$system['system_url']}/{$control_panel['url']}/events" class="btn btn-sm btn-light">
                    <i class="fa fa-arrow-circle-left"></i><span class="ml5 d-none d-lg-inline-block">{__("Go Back")}</span>
                </a>
                <a target="_blank" href="{$system['system_url']}/events/{$data['event_id']}" class="btn btn-sm btn-info">
                    <i class="fa fa-tv"></i><span class="ml5 d-none d-lg-inline-block">{__("View Event")}</span>
                </a>
                <button type="button" class="btn btn-sm btn-danger js_admin-deleter" data-handle="event_posts" data-id="{$data['event_id']}">
                    <i class="fa fa-trash-alt"></i><span class="ml5 d-none d-lg-inline-block">{__("Delete All Posts")}</span>
                </button>
            </div>
        {elseif $sub_view == "categories"}
            <div class="float-right">
                <a href="{$system['system_url']}/{$control_panel['url']}/events/add_category" class="btn btn-sm btn-primary">
                    <i class="fa fa-plus"></i><span class="ml5 d-none d-lg-inline-block">{__("Add New Category")}</span>
                </a>
            </div>
        {elseif $sub_view == "add_category" || $sub_view == "edit_category"}
            <div class="float-right">
                <a href="{$system['system_url']}/{$control_panel['url']}/events/categories" class="btn btn-sm btn-light">
                    <i class="fa fa-arrow-circle-left"></i><span class="ml5 d-none d-lg-inline-block">{__("Go Back")}</span>
                </a>
            </div>
        {/if}
        <i class="fa fa-calendar mr10"></i>{__("Events")}
        {if $sub_view == "find"} &rsaquo; {__("Find")}{/if}
        {if $sub_view == "edit_event"} &rsaquo; {$data['event_title']}{/if}
        {if $sub_view == "categories"} &rsaquo; {__("Categories")}{/if}
        {if $sub_view == "add_category"} &rsaquo; {__("Categories")} &rsaquo; {__("Add New Category")}{/if}
        {if $sub_view == "edit_category"} &rsaquo; {__("Categories")} &rsaquo; {$data['category_name']}{/if}
    </div>

    {if $sub_view == "" || $sub_view == "find"}

        <div class="card-body">

            <!-- search form -->
            <div class="mb20">
                <form class="form-inline" action="{$system['system_url']}/{$control_panel['url']}/events/find" method="get">
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
                    {__('Search by Event Title')}
                </div>
            </div>
            <!-- search form -->

            <div class="table-responsive">
                <table class="table table-striped table-bordered table-hover">
                    <thead>
                        <tr>
                            <th>{__("ID")}</th>
                            <th>{__("Event")}</th>
                            <th>{__("Admin")}</th>
                            <th>{__("Privacy")}</th>
                            <th>{__("Interested")}</th>
                            <th>{__("Going")}</th>
                            <th>{__("Invited")}</th>
                            <th>{__("Actions")}</th>
                        </tr>
                    </thead>
                    <tbody>
                        {if $rows}
                            {foreach $rows as $row}
                                <tr>
                                    <td>
                                        <a href="{$system['system_url']}/events/{$row['event_id']}" target="_blank">{$row['event_id']}</a>
                                    </td>
                                    <td>
                                        <a target="_blank" href="{$system['system_url']}/events/{$row['event_id']}">
                                            {$row['event_title']}
                                        </a>
                                    </td>
                                    <td>
                                        <a target="_blank" href="{$system['system_url']}/{$row['user_name']}">
                                            <img class="tbl-image" src="{$row['user_picture']}">
                                            {$row['user_firstname']} {$row['user_lastname']}
                                        </a>
                                    </td>
                                    <td>
                                        {if $row['event_privacy'] == "public"}
                                            <i class="fa fa-globe fa-fw mr5"></i>{__("Public")}
                                        {elseif $row['event_privacy'] == "closed"}
                                            <i class="fa fa-unlock-alt fa-fw mr5"></i>{__("Closed")}
                                        {elseif $row['event_privacy'] == "secret"}
                                            <i class="fa fa-lock fa-fw mr5"></i>{__("Secret")}
                                        {/if}
                                    </td>
                                    <td>{$row['event_interested']}</td>
                                    <td>{$row['event_going']}</td>
                                    <td>{$row['event_invited']}</td>
                                    <td>
                                        <a data-toggle="tooltip" data-placement="top" title='{__("Edit")}' href="{$system['system_url']}/{$control_panel['url']}/events/edit_event/{$row['event_id']}" class="btn btn-sm btn-icon btn-rounded btn-primary">
                                            <i class="fa fa-pencil-alt"></i>
                                        </a>
                                        <button data-toggle="tooltip" data-placement="top" title='{__("Delete")}' class="btn btn-sm btn-icon btn-rounded btn-danger js_admin-deleter" data-handle="event" data-id="{$row['event_id']}">
                                            <i class="fa fa-trash-alt"></i>
                                        </button>
                                    </td>
                                </tr>
                            {/foreach}
                        {else}
                            <tr>
                                <td colspan="8" class="text-center">
                                    {__("No data to show")}
                                </td>
                            </tr>
                        {/if}
                    </tbody>
                </table>
            </div>
            {$pager}
        </div>

    {elseif $sub_view == "edit_event"}

        <form class="js_ajax-forms " data-url="admin/events.php?do=edit_event&id={$data['event_id']}">
            <div class="card-body">
                <div class="row">
                    <div class="col-12 col-md-2 text-center mb20">
                        <img class="img-fluid img-thumbnail rounded" src="{$data['event_picture']}">
                    </div>
                    <div class="col-12 col-md-5 mb20">
                        <ul class="list-group">
                            <li class="list-group-item">
                                <span class="float-right badge badge-lg badge-pill badge-secondary">{$data['event_id']}</span>
                                {__("Event ID")}
                            </li>
                            <li class="list-group-item">
                                <span class="float-right badge badge-lg badge-pill badge-secondary">
                                    {if $data['event_privacy'] == "public"}
                                        <i class="fa fa-globe fa-fw mr5"></i>{__("Public")}
                                    {elseif $data['event_privacy'] == "closed"}
                                        <i class="fa fa-unlock-alt fa-fw mr5"></i>{__("Closed")}
                                    {elseif $data['event_privacy'] == "secret"}
                                        <i class="fa fa-lock fa-fw mr5"></i>{__("Secret")}
                                    {/if}
                                </span>
                                {__("Privacy")}
                            </li>
                        </ul>
                    </div>
                    <div class="col-12 col-md-5 mb20">
                        <ul class="list-group">
                            <li class="list-group-item">
                                <span class="float-right badge badge-lg badge-pill badge-secondary">{$data['event_interested']}</span>
                                {__("Interested")}
                            </li>
                            <li class="list-group-item">
                                <span class="float-right badge badge-lg badge-pill badge-secondary">{$data['event_going']}</span>
                                {__("Going")}
                            </li>
                            <li class="list-group-item">
                                <span class="float-right badge badge-lg badge-pill badge-secondary">{$data['event_invited']}</span>
                                {__("Invited")}
                            </li>
                        </ul>
                    </div>
                </div>

                <!-- tabs nav -->
                <ul class="nav nav-tabs mb20">
                    <li class="nav-item">
                        <a class="nav-link active" href="#event_settings" data-toggle="tab">
                            <i class="fa fa-cog fa-fw mr5"></i><strong>{__("Event Settings")}</strong>
                        </a>
                    </li>
                </ul>
                <!-- tabs nav -->

                <!-- tabs content -->
                <div class="tab-content">
                    <!-- settings tab -->
                    <div class="tab-pane active" id="event_settings">
                        <div class="form-group form-row">
                            <label class="col-md-3 form-control-label">
                                {__("Admin")}
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
                                {__("Name Your Event")}
                            </label>
                            <div class="col-md-9">
                                <input class="form-control" name="title" value="{$data['event_title']}">
                            </div>
                        </div>

                        <div class="form-group form-row">
                            <label class="col-md-3 form-control-label">
                                {__("Location")}
                            </label>
                            <div class="col-md-9">
                                <input class="form-control" name="location" value="{$data['event_location']}">
                            </div>
                        </div>

                        <div class="form-group form-row">
                            <label class="col-md-3 form-control-label">
                                {__("Start Date")}
                            </label>
                            <div class="col-md-9">
                                <div class="input-group date js_datetimepicker" id="start_date" data-target-input="nearest">
                                    <input type='text' class="form-control datetimepicker-input" data-target="#start_date" name="start_date" value="{get_datetime($data['event_start_date'])}" />
                                    <div class="input-group-append" data-target="#start_date" data-toggle="datetimepicker">
                                        <span class="input-group-text"><i class="fa fa-calendar"></i></span>
                                    </div>
                                </div>
                                <span class="form-text">
                                    {__("Your current server datetime is")}: {$date} (UTC)
                                </span>
                            </div>
                        </div>

                        <div class="form-group form-row">
                            <label class="col-md-3 form-control-label">
                                {__("End Date")}
                            </label>
                            <div class="col-md-9">
                                <div class="input-group date js_datetimepicker" id="end_date" data-target-input="nearest">
                                    <input type='text' class="form-control datetimepicker-input" data-target="#end_date" name="end_date" value="{get_datetime($data['event_end_date'])}" />
                                    <div class="input-group-append" data-target="#end_date" data-toggle="datetimepicker">
                                        <span class="input-group-text"><i class="fa fa-calendar"></i></span>
                                    </div>
                                </div>
                                <span class="form-text">
                                    {__("Your current server datetime is")}: {$date} (UTC)
                                </span>
                            </div>
                        </div>

                        <div class="form-group form-row">
                            <label class="col-md-3 form-control-label">
                                {__("Select Privacy")}
                            </label>
                            <div class="col-md-9">
                                <select class="form-control selectpicker" name="privacy">
                                    <option {if $data['event_privacy'] == "public"}selected{/if} value="public" data-content="<div class='option'><div class='icon'><i class='fa fa-globe fa-lg'></i></div><div class='text'><b>{__("Public Event")}</b><br>{__("Anyone can see the event, its users and posts")}.
                                    </div></div>">{__("Public Event")}</option>
                                    <option {if $data['event_privacy'] == "closed"}selected{/if} value="closed" data-content="<div class='option'><div class='icon'><i class='fa fa-unlock-alt fa-lg'></i></div><div class='text'><b>{__("Closed Event")}</b><br>{__("Only event users can see posts")}.
                                    </div></div>">{__("Closed Event")}</option>
                                    <option {if $data['event_privacy'] == "secret"}selected{/if} value="secret" data-content="<div class='option'><div class='icon'><i class='fa fa-lock fa-lg'></i></div><div class='text'><b>{__("Secret Event")}</b><br>{__("Only invited users and event users can find the event")}.
                                    </div></div>">{__("Secret Event")}</option>
                                </select>
                            </div>
                        </div>

                        <div class="form-group form-row">
                            <label class="col-md-3 form-control-label">
                                {__("Category")}
                            </label>
                            <div class="col-md-9">
                                <select class="form-control" name="category">
                                    {foreach $data['categories'] as $category}
                                        <option {if $data['event_category'] == $category['category_id']}selected{/if} value="{$category['category_id']}">{__($category['category_name'])}</option>
                                    {/foreach}
                                </select>
                            </div>
                        </div>

                        <div class="form-group form-row">
                            <label class="col-md-3 form-control-label">
                                {__("About")}
                            </label>
                            <div class="col-md-9">
                                <textarea class="form-control" name="description">{$data['event_description']}</textarea>
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
                                <div class="form-text d-none d-sm-block">{__("Members can publish posts or only event admin")}</div>
                            </div>
                            <div class="text-right">
                                <label class="switch" for="event_publish_enabled">
                                    <input type="checkbox" name="event_publish_enabled" id="event_publish_enabled" {if $data['event_publish_enabled']}checked{/if}>
                                    <span class="slider round"></span>
                                </label>
                            </div>
                        </div>

                        <div class="form-table-row">
                            <div>
                                <div class="form-control-label h6">{__("Post Approval")}</div>
                                <div class="form-text d-none d-sm-block">
                                    {__("All posts must be approved by the event admin")}<br>
                                    ({__("Note: Disable it will approve any pending posts")})
                                </div>
                            </div>
                            <div class="text-right">
                                <label class="switch" for="event_publish_approval_enabled">
                                    <input type="checkbox" name="event_publish_approval_enabled" id="event_publish_approval_enabled" {if $data['event_publish_approval_enabled']}checked{/if}>
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
                                    <a data-toggle="tooltip" data-placement="top" title='{__("Edit")}' href="{$system['system_url']}/{$control_panel['url']}/events/edit_category/{$row['category_id']}" class="btn btn-sm btn-icon btn-rounded btn-primary">
                                        <i class="fa fa-pencil-alt"></i>
                                    </a>
                                    <button data-toggle="tooltip" data-placement="top" title='{__("Delete")}' class="btn btn-sm btn-icon btn-rounded btn-danger js_admin-deleter" data-handle="event_category" data-id="{$row['category_id']}">
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

        <form class="js_ajax-forms " data-url="admin/events.php?do=add_category">
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

        <form class="js_ajax-forms " data-url="admin/events.php?do=edit_category&id={$data['category_id']}">
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