<div class="card">
    <div class="card-header with-icon">
        {if $sub_view == ""}
            <div class="float-right">
                <a href="{$system['system_url']}/{$control_panel['url']}/forums/add_forum" class="btn btn-sm btn-primary">
                    <i class="fa fa-plus mr5"></i>{__("Add New Forum")}
                </a>
            </div>
        {elseif $sub_view == "add_forum" || $sub_view == "edit_forum"}
            <div class="float-right">
                <a href="{$system['system_url']}/{$control_panel['url']}/forums" class="btn btn-sm btn-light">
                    <i class="fa fa-arrow-circle-left mr5"></i>{__("Go Back")}
                </a>
            </div>
        {elseif $sub_view == "find_threads"}
            <div class="float-right">
                <a href="{$system['system_url']}/{$control_panel['url']}/forums/threads" class="btn btn-sm btn-light">
                    <i class="fa fa-arrow-circle-left mr5"></i>{__("Go Back")}
                </a>
            </div>
        {elseif $sub_view == "find_replies"}
            <div class="float-right">
                <a href="{$system['system_url']}/{$control_panel['url']}/forums/replies" class="btn btn-sm btn-light">
                    <i class="fa fa-arrow-circle-left mr5"></i>{__("Go Back")}
                </a>
            </div>
        {/if}
        <i class="fa fa-comments mr10"></i>{__("Forums")}
        {if $sub_view == "settings"} &rsaquo; {__("Settings")}{/if}
        {if $sub_view == "add_forum"} &rsaquo; {__("Add New Forum")}{/if}
        {if $sub_view == "edit_forum"} &rsaquo; {$data['forum_name']}{/if}
        {if $sub_view == "threads"} &rsaquo; {__("Threads")}{/if}
        {if $sub_view == "find_threads"} &rsaquo; {__("Threads")} &rsaquo; {__("Find")}{/if}
        {if $sub_view == "replies"} &rsaquo; {__("Replies")}{/if}
        {if $sub_view == "find_replies"} &rsaquo; {__("Replies")} &rsaquo; {__("Find")}{/if}
    </div>

    {if $sub_view == "settings"}

        <form class="js_ajax-forms " data-url="admin/forums.php?do=settings">
            <div class="card-body">
                <div class="form-table-row">
                    <div>
                        <div class="form-control-label h6">{__("Forums")}</div>
                        <div class="form-text d-none d-sm-block">{__("Turn the forums On and Off")}</div>
                    </div>
                    <div class="text-right">
                        <label class="switch" for="forums_enabled">
                            <input type="checkbox" name="forums_enabled" id="forums_enabled" {if $system['forums_enabled']}checked{/if}>
                            <span class="slider round"></span>
                        </label>
                    </div>
                </div>

                <div class="form-table-row">
                    <div>
                        <div class="form-control-label h6">{__("Online Users")}</div>
                        <div class="form-text d-none d-sm-block">{__("Show online users")}</div>
                    </div>
                    <div class="text-right">
                        <label class="switch" for="forums_online_enabled">
                            <input type="checkbox" name="forums_online_enabled" id="forums_online_enabled" {if $system['forums_online_enabled']}checked{/if}>
                            <span class="slider round"></span>
                        </label>
                    </div>
                </div>

                <div class="form-table-row">
                    <div>
                        <div class="form-control-label h6">{__("Statistics")}</div>
                        <div class="form-text d-none d-sm-block">{__("Show forums statistics")}</div>
                    </div>
                    <div class="text-right">
                        <label class="switch" for="forums_statistics_enabled">
                            <input type="checkbox" name="forums_statistics_enabled" id="forums_statistics_enabled" {if $system['forums_statistics_enabled']}checked{/if}>
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

    {elseif $sub_view == ""}

        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered table-hover js_treegrid">
                    <thead>
                        <tr>
                            <th>{__("Title")}</th>
                            <th>{__("Description")}</th>
                            <th>{__("Threads")}</th>
                            <th>{__("Order")}</th>
                            <th>{__("Actions")}</th>
                        </tr>
                    </thead>
                    <tbody>
                        {if $rows}
                            {foreach $rows as $row}
                                {include file='admin.forums.recursive_rows.tpl'}
                            {/foreach}
                        {else}
                            <tr>
                                <td colspan="5" class="text-center">
                                    {__("No data to show")}
                                </td>
                            </tr>
                        {/if}
                    </tbody>
                </table>
            </div>
        </div>

    {elseif $sub_view == "add_forum"}

        <form class="js_ajax-forms " data-url="admin/forums.php?do=add_forum">
            <div class="card-body">
                <div class="form-group form-row">
                    <label class="col-md-3 form-control-label">
                        {__("Name")}
                    </label>
                    <div class="col-md-9">
                        <input class="form-control" name="forum_name">
                    </div>
                </div>

                <div class="form-group form-row">
                    <label class="col-md-3 form-control-label">
                        {__("Description")}
                    </label>
                    <div class="col-md-9">
                        <textarea class="form-control" name="forum_description"></textarea>
                    </div>
                </div>

                <div class="form-group form-row">
                    <label class="col-md-3 form-control-label">
                        {__("Section")}
                    </label>
                    <div class="col-md-9">
                        <select class="form-control" name="forum_section">
                            <option value="0" class="text-success">{__("Set as a Section")}</option>
                            {foreach $forums as $forum}
                                {include file='admin.forums.recursive_options.tpl'}
                            {/foreach}
                        </select>
                    </div>
                </div>

                <div class="form-group form-row">
                    <label class="col-md-3 form-control-label">
                        {__("Order")}
                    </label>
                    <div class="col-md-9">
                        <input class="form-control" name="forum_order">
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

    {elseif $sub_view == "edit_forum"}

        <form class="js_ajax-forms " data-url="admin/forums.php?do=edit_forum&id={$data['forum_id']}">
            <div class="card-body">
                <div class="form-group form-row">
                    <label class="col-md-3 form-control-label">
                        {__("Name")}
                    </label>
                    <div class="col-md-9">
                        <input class="form-control" name="forum_name" value="{$data['forum_name']}">
                    </div>
                </div>

                <div class="form-group form-row">
                    <label class="col-md-3 form-control-label">
                        {__("Description")}
                    </label>
                    <div class="col-md-9">
                        <textarea class="form-control" name="forum_description">{$data['forum_description']}</textarea>
                    </div>
                </div>

                <div class="form-group form-row">
                    <label class="col-md-3 form-control-label">
                        {__("Section")}
                    </label>
                    <div class="col-md-9">
                        <select class="form-control" name="forum_section">
                            <option value="0" class="text-success">{__("Set as a Section")}</option>
                            {foreach $data['sections'] as $forum}
                                {include file='admin.forums.recursive_options.tpl'}
                            {/foreach}
                        </select>
                    </div>
                </div>

                <div class="form-group form-row">
                    <label class="col-md-3 form-control-label">
                        {__("Order")}
                    </label>
                    <div class="col-md-9">
                        <input class="form-control" name="forum_order" value="{$data['forum_order']}">
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

    {elseif $sub_view == "threads" || $sub_view == "find_threads"}

        <div class="card-body">

            <!-- search form -->
            <div class="mb20">
                <form class="form-inline" action="{$system['system_url']}/{$control_panel['url']}/forums/find_threads" method="get">
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
                    {__('Search by Thread Title or Text')}
                </div>
            </div>
            <!-- search form -->

            <div class="table-responsive">
                <table class="table table-striped table-bordered table-hover">
                    <thead>
                        <tr>
                            <th>{__("ID")}</th>
                            <th>{__("Author")}</th>
                            <th>{__("Title")}</th>
                            <th>{__("Time")}</th>
                            <th>{__("Link")}</th>
                            <th>{__("Actions")}</th>
                        </tr>
                    </thead>
                    <tbody>
                        {if $rows}
                            {foreach $rows as $row}
                                <tr>
                                    <td>{$row['thread_id']}</td>
                                    <td>
                                        <a target="_blank" href="{$row['thread_author_url']}">
                                            <img class="tbl-image" src="{$row['thread_author_picture']}">
                                            {$row['thread_author_name']}
                                        </a>
                                    </td>
                                    <td>
                                        <span title="{$row['title']}">{$row['title']|truncate:30}</span>
                                    </td>
                                    <td><span class="js_moment" data-time="{$row['time']}">{$row['time']}</span></td>
                                    <td>
                                        <a class="btn btn-sm btn-light" href="{$system['system_url']}/forums/thread/{$row['thread_id']}/{$row['thread_title_url']}" target="_blank">
                                            <i class="fa fa-eye mr5"></i>{__("View")}
                                        </a>
                                    </td>
                                    <td>
                                        <button data-toggle="tooltip" data-placement="top" title='{__("Delete")}' class="btn btn-sm btn-icon btn-rounded btn-danger js_admin-deleter" data-handle="forum_thread" data-id="{$row['thread_id']}">
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

    {elseif $sub_view == "replies" || $sub_view == "find_replies"}

        <div class="card-body">

            <!-- search form -->
            <div class="mb20">
                <form class="form-inline" action="{$system['system_url']}/{$control_panel['url']}/forums/find_replies" method="get">
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
                    {__('Search by Reply Text')}
                </div>
            </div>
            <!-- search form -->

            <div class="table-responsive">
                <table class="table table-striped table-bordered table-hover">
                    <thead>
                        <tr>
                            <th>{__("ID")}</th>
                            <th>{__("Author")}</th>
                            <th>{__("Thread")}</th>
                            <th>{__("Time")}</th>
                            <th>{__("Link")}</th>
                            <th>{__("Actions")}</th>
                        </tr>
                    </thead>
                    <tbody>
                        {if $rows}
                            {foreach $rows as $row}
                                <tr>
                                    <td>{$row['reply_id']}</td>
                                    <td>
                                        <a target="_blank" href="{$row['reply_author_url']}">
                                            <img class="tbl-image" src="{$row['reply_author_picture']}">
                                            {$row['reply_author_name']}
                                        </a>
                                    </td>
                                    <td>
                                        <span title="{$row['title']}">{$row['title']|truncate:30}</span>
                                    </td>
                                    <td><span class="js_moment" data-time="{$row['time']}">{$row['time']}</span></td>
                                    <td>
                                        <a class="btn btn-sm btn-light" href="{$system['system_url']}/forums/thread/{$row['thread_id']}/{$row['thread_title_url']}/#reply-{$row['reply_id']}" target="_blank">
                                            <i class="fa fa-eye mr5"></i>{__("View")}
                                        </a>
                                    </td>
                                    <td>
                                        <button data-toggle="tooltip" data-placement="top" title='{__("Delete")}' class="btn btn-sm btn-icon btn-rounded btn-danger js_admin-deleter" data-handle="forum_reply" data-id="{$row['reply_id']}">
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

    {/if}
</div>