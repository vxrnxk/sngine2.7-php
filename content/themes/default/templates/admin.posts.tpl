<div class="card">
    <div class="card-header with-icon">
        {if $sub_view == "find"}
            <div class="float-right">
                <a href="{$system['system_url']}/{$control_panel['url']}/posts" class="btn btn-sm btn-light">
                    <i class="fa fa-arrow-circle-left mr5"></i>{__("Go Back")}
                </a>
            </div>
        {/if}
        <i class="fa fa-newspaper mr10"></i>{__("Posts")}
        {if $sub_view == "find"} &rsaquo; {__("Find")}{/if}
    </div>

    {if $sub_view == "" || $sub_view == "find"}

        <div class="card-body">

            {if $sub_view == ""}
                <div class="form-row">
                    <div class="col-sm-4">
                        <div class="stat-panel bg-gradient-indigo">
                            <div class="stat-cell">
                                <i class="fa fa-newspaper bg-icon"></i>
                                <span class="text-xlg">{$insights['posts']}</span><br>
                                <span class="text-lg">{__("Posts")}</span><br>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="stat-panel bg-gradient-primary">
                            <div class="stat-cell">
                                <i class="fa fa-comments bg-icon"></i>
                                <span class="text-xlg">{$insights['posts_comments']}</span><br>
                                <span class="text-lg">{__("Comments")}</span><br>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="stat-panel bg-gradient-info">
                            <div class="stat-cell">
                                <i class="fa fa-thumbs-up bg-icon"></i>
                                <span class="text-xlg">{$insights['posts_likes']}</span><br>
                                <span class="text-lg">{__("Total Reactions")}</span><br>
                            </div>
                        </div>
                    </div>
                </div>
            {/if}

            <!-- search form -->
            <div class="mb20">
                <form class="form-inline" action="{$system['system_url']}/{$control_panel['url']}/posts/find" method="get">
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
                    {__('Search by Post ID or Text')}
                </div>
            </div>
            <!-- search form -->

            <div class="table-responsive">
                <table class="table table-striped table-bordered table-hover">
                    <thead>
                        <tr>
                            <th>{__("ID")}</th>
                            <th>{__("Author")}</th>
                            <th>{__("Type")}</th>
                            <th>{__("Time")}</th>
                            <th>{__("Link")}</th>
                            <th>{__("Actions")}</th>
                        </tr>
                    </thead>
                    <tbody>
                        {if $rows}
                            {foreach $rows as $row}
                                <tr>
                                    <td>{$row['post_id']}</td>
                                    <td>
                                        <a target="_blank" href="{$row['post_author_url']}">
                                            <img class="tbl-image" src="{$row['post_author_picture']}">
                                            {$row['post_author_name']}
                                        </a>
                                    </td>
                                    <td>
                                        {if $row['post_type'] == ""}
                                            {__("Text")}

                                        {elseif $row['post_type'] == "shared"}
                                            {__("Share")}

                                        {elseif $row['post_type'] == "link"}
                                            {__("Link")}

                                        {elseif $row['post_type'] == "album"}
                                            {__("Album")}

                                        {elseif $row['post_type'] == "poll"}
                                            {__("Poll")}

                                        {elseif $row['post_type'] == "product"}
                                            {__("Product")}

                                        {elseif $row['post_type'] == "article"}
                                            {__("Article")}

                                        {elseif $row['post_type'] == "video"}
                                            {__("Video")}

                                        {elseif $row['post_type'] == "audio"}
                                            {__("Audio")}

                                        {elseif $row['post_type'] == "file"}
                                            {__("File")}

                                        {elseif $row['post_type'] == "photos"}
                                            {__("Photos")}

                                        {elseif $row['post_type'] == "profile_picture"}
                                            {__("Profile Picture")}

                                        {elseif $row['post_type'] == "profile_cover"}
                                            {__("Cover Photo")}

                                        {elseif $row['post_type'] == "page_picture"}
                                            {__("Page Picture")}

                                        {elseif $row['post_type'] == "page_cover"}
                                            {__("Page Cover")}

                                        {elseif $row['post_type'] == "group_picture"}
                                            {__("Group Picture")}

                                        {elseif $row['post_type'] == "group_cover"}
                                            {__("Group Cover")}

                                        {elseif $row['post_type'] == "event_cover"}
                                            {__("Event Cover")}
                                            
                                        {/if}
                                    </td>
                                    <td><span class="js_moment" data-time="{$row['time']}">{$row['time']}</span></td>
                                    <td>
                                        <a class="btn btn-sm btn-light" href="{$system['system_url']}/posts/{$row['post_id']}" target="_blank">
                                            <i class="fa fa-eye mr5"></i>{__("View")}
                                        </a>
                                    </td>
                                    <td>
                                        <button data-toggle="tooltip" data-placement="top" title='{__("Delete")}' class="btn btn-sm btn-icon btn-rounded btn-danger js_admin-deleter" data-handle="post" data-id="{$row['post_id']}">
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