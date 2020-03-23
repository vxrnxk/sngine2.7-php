<div class="card">
    <div class="card-header with-icon">
        {if $sub_view == "system_ads"}
            <div class="float-right">
                <a href="{$system['system_url']}/{$control_panel['url']}/ads/add" class="btn btn-sm btn-primary">
                    <i class="fa fa-plus mr5"></i>{__("Add New Ads")}
                </a>
            </div>
        {elseif $sub_view == "add" || $sub_view == "edit"}
            <div class="float-right">
                <a href="{$system['system_url']}/{$control_panel['url']}/ads/system_ads" class="btn btn-sm btn-light">
                    <i class="fa fa-arrow-circle-left mr5"></i>{__("Go Back")}
                </a>
            </div>
        {/if}
        <i class="fa fa-dollar-sign mr10"></i>{__("Ads")}
        {if $sub_view == ""} &rsaquo; {__("Settings")}{/if}
        {if $sub_view == "system_ads"} &rsaquo; {__("System Ads")}{/if}
        {if $sub_view == "users_ads"} &rsaquo; {__("Users Ads")}{/if}
        {if $sub_view == "edit"} &rsaquo; {$data['title']}{/if}
        {if $sub_view == "add"} &rsaquo; {__("Add New Ads")}{/if}
    </div>

    {if $sub_view == ""}

        <form class="js_ajax-forms " data-url="admin/ads.php?do=settings">
            <div class="card-body">
                <!-- adblock-warning-message -->
                <div class="adblock-warning-message mb10">
                    {__("Turn off the ad blocker or add this web page's URL as an exception so you use ads system without any problems")}, {__("After you turn off the ad blocker, you'll need to refresh your screen")}
                </div>
                <!-- adblock-warning-message -->

                <div class="alert alert-warning">
                    <div class="icon">
                        <i class="fa fa-exclamation-triangle fa-2x"></i>
                    </div>
                    <div class="text pt5">
                        {__("Make sure you have configured")} <a class="alert-link" href="{$system['system_url']}/{$control_panel['url']}/settings/payments">{__("Payments Settings")}</a>
                    </div>
                </div>
            
            
                <div class="form-table-row">
                    <div>
                        <div class="form-control-label h6">{__("Ads")}</div>
                        <div class="form-text d-none d-sm-block">{__("Allow users to create ads")}</div>
                    </div>
                    <div class="text-right">
                        <label class="switch" for="ads_enabled">
                            <input type="checkbox" name="ads_enabled" id="ads_enabled" {if $system['ads_enabled']}checked{/if}>
                            <span class="slider round"></span>
                        </label>
                    </div>
                </div>

                <div class="form-group form-row">
                    <label class="col-sm-3 control-label">
                        {__("Cost by View")}
                    </label>
                    <div class="col-md-9">
                        <input type="text" class="form-control" name="ads_cost_view" value="{$system['ads_cost_view']}">
                    </div>
                </div>

                <div class="form-group form-row">
                    <label class="col-sm-3 control-label">
                        {__("Cost by Click")}
                    </label>
                    <div class="col-md-9">
                        <input type="text" class="form-control" name="ads_cost_click" value="{$system['ads_cost_click']}">
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

    {elseif $sub_view == "system_ads"}

        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-striped table-bordered table-hover js_dataTable">
                    <thead>
                        <tr>
                            <th>{__("ID")}</th>
                            <th>{__("Title")}</th>
                            <th>{__("Place")}</th>
                            <th>{__("Date")}</th>
                            <th>{__("Actions")}</th>
                        </tr>
                    </thead>
                    <tbody>
                        {foreach $rows as $row}
                            <tr>
                                <td>{$row['ads_id']}</td>
                                <td>{$row['title']}</td>
                                <td>
                                    {if $row['place'] == "home"}<i class='fa fa-home fa-fw mr5'></i>{__("Home  Page")}{/if}
                                    {if $row['place'] == "search"}<i class='fa fa-search fa-fw mr5'></i>{__("Search  Page")}{/if}
                                    {if $row['place'] == "people"}<i class='fa fa-users fa-fw mr5'></i>{__("Discover People  Page")}{/if}
                                    {if $row['place'] == "notifications"}<i class='fa fa-bell fa-fw mr5'></i>{__("Notifications  Page")}{/if}
                                    {if $row['place'] == "post"}<i class='fa fa-file-powerpoint fa-fw mr5'></i>{__("Post  Page")}{/if}
                                    {if $row['place'] == "photo"}<i class='fa fa-file-image fa-fw mr5'></i>{__("Photo  Page")}{/if}
                                    {if $row['place'] == "directory"}<i class='fa fa-th-list fa-fw mr5'></i>{__("Directory  Page")}{/if}
                                    {if $row['place'] == "market"}<i class='fa fa-shopping-bag fa-fw mr5'></i>{__("Market  Page")}{/if}
                                    {if $row['place'] == "movies"}<i class='fa fa-film fa-fw mr5'></i>{__("Movies  Page")}{/if}
                                    {if $row['place'] == "newfeed_1"}<i class='fa fa-newspaper fa-fw mr5'></i>{__("Posts Feed")} 1{/if}
                                    {if $row['place'] == "newfeed_2"}<i class='fa fa-newspaper fa-fw mr5'></i>{__("Posts Feed")} 2{/if}
                                    {if $row['place'] == "newfeed_3"}<i class='fa fa-newspaper fa-fw mr5'></i>{__("Posts Feed")} 3{/if}
                                    {if $row['place'] == "article"}<i class='fa fa-file-alt fa-fw mr5'></i>{__("Article Page")}{/if}
                                    {if $row['place'] == "header"}<i class='fa fa-chevron-circle-up fa-fw mr5'></i>{__("Header")}{/if}
                                    {if $row['place'] == "footer"}<i class='fa fa-chevron-circle-down fa-fw mr5'></i>{__("Footer")}{/if}
                                </td>
                                <td>{$row['time']|date_format:"%e %B %Y"}</td>
                                <td>
                                    <a data-toggle="tooltip" data-placement="top" title='{__("Edit")}' href="{$system['system_url']}/{$control_panel['url']}/ads/edit/{$row['ads_id']}" class="btn btn-sm btn-icon btn-rounded btn-primary">
                                        <i class="fa fa-pencil-alt"></i>
                                    </a>
                                    <button data-toggle="tooltip" data-placement="top" title='{__("Delete")}' class="btn btn-sm btn-icon btn-rounded btn-danger js_admin-deleter" data-handle="ads_system" data-id="{$row['ads_id']}">
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

        <form class="js_ajax-forms " data-url="admin/ads.php?do=edit&id={$data['ads_id']}">
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

                            <option {if $data['place'] == "directory"}selected{/if} value="directory" data-content="<div class='option'><div class='icon'><i class='fa fa-th-list fa-fw fa-lg'></i></div><div class='text'><b>{__("Directory")}</b><br>{__("Appears on the right panel of directory")}.
                            </div></div>">{__("Directory")}</option>

                            <option {if $data['place'] == "market"}selected{/if} value="market" data-content="<div class='option'><div class='icon'><i class='fa fa-shopping-bag fa-fw fa-lg'></i></div><div class='text'><b>{__("Market")}</b><br>{__("Appears on the top of products list")}.
                            </div></div>">{__("Market")}</option>

                            <option {if $data['place'] == "movies"}selected{/if} value="movies" data-content="<div class='option'><div class='icon'><i class='fa fa-film fa-fw fa-lg'></i></div><div class='text'><b>{__("Movies")}</b><br>{__("Appears on the top of movies page")}.
                            </div></div>">{__("Movies")}</option>

                            <option {if $data['place'] == "newfeed_1"}selected{/if} value="newfeed_1" data-content="<div class='option'><div class='icon'><i class='fa fa-newspaper fa-fw fa-lg'></i></div><div class='text'><b>{__("Posts Feed")} 1</b><br>{__("Appears after")} {$system['max_results']} {__("posts are loaded, between the posts")}.
                            </div></div>">{__("Posts Feed")} 1</option>

                            <option {if $data['place'] == "newfeed_2"}selected{/if} value="newfeed_2" data-content="<div class='option'><div class='icon'><i class='fa fa-newspaper fa-fw fa-lg'></i></div><div class='text'><b>{__("Posts Feed")} 2</b><br>{__("Appears after")} {$system['max_results']*2} {__("posts are loaded, between the posts")}.
                            </div></div>">{__("Posts Feed")} 2</option>

                            <option {if $data['place'] == "newfeed_3"}selected{/if} value="newfeed_3" data-content="<div class='option'><div class='icon'><i class='fa fa-newspaper fa-fw fa-lg'></i></div><div class='text'><b>{__("Posts Feed")} 3</b><br>{__("Appears after")} {$system['max_results']*3} {__("posts are loaded, between the posts")}.
                            </div></div>">{__("Posts Feed")} 3</option>

                            <option {if $data['place'] == "article"}selected{/if} value="article" data-content="<div class='option'><div class='icon'><i class='fa fa-file-alt fa-fw fa-lg'></i></div><div class='text'><b>{__("Article Page")}</b><br>{__("Appears on the sidebar on article page")}.
                            </div></div>">{__("Article Page")}</option>

                            <option {if $data['place'] == "header"}selected{/if} value="header" data-content="<div class='option'><div class='icon'><i class='fa fa-chevron-circle-up fa-fw fa-lg'></i></div><div class='text'><b>{__("Header")}</b><br>{__("Appears on all pages right after the header")}.
                            </div></div>">{__("Header")}</option>

                            <option {if $data['place'] == "footer"}selected{/if} value="footer" data-content="<div class='option'><div class='icon'><i class='fa fa-chevron-circle-down fa-fw fa-lg'></i></div><div class='text'><b>{__("Footer")}</b><br>{__("Appears on all pages right before the footer")}.
                            </div></div>">{__("Footer")}</option>
                        </select>
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

        <form class="js_ajax-forms " data-url="admin/ads.php?do=add">
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

                            <option value="directory" data-content="<div class='option'><div class='icon'><i class='fa fa-th-list fa-fw fa-lg'></i></div><div class='text'><b>{__("Directory")}</b><br>{__("Appears on the right panel of directory")}.
                            </div></div>">{__("Directory")}</option>

                            <option value="market" data-content="<div class='option'><div class='icon'><i class='fa fa-shopping-bag fa-fw fa-lg'></i></div><div class='text'><b>{__("Market")}</b><br>{__("Appears on the top of products list")}.
                            </div></div>">{__("Market")}</option>

                            <option value="movies" data-content="<div class='option'><div class='icon'><i class='fa fa-film fa-fw fa-lg'></i></div><div class='text'><b>{__("Movies")}</b><br>{__("Appears on the top of movies page")}.
                            </div></div>">{__("Movies")}</option>

                            <option value="newfeed_1" data-content="<div class='option'><div class='icon'><i class='fa fa-newspaper fa-fw fa-lg'></i></div><div class='text'><b>{__("Posts Feed")} 1</b><br>{__("Appears after")} {$system['max_results']} {__("posts are loaded, between the posts")}.
                            </div></div>">{__("Posts Feed")} 1</option>

                            <option value="newfeed_2" data-content="<div class='option'><div class='icon'><i class='fa fa-newspaper fa-fw fa-lg'></i></div><div class='text'><b>{__("Posts Feed")} 2</b><br>{__("Appears after")} {$system['max_results']*2} {__("posts are loaded, between the posts")}.
                            </div></div>">{__("Posts Feed")} 2</option>

                            <option value="newfeed_3" data-content="<div class='option'><div class='icon'><i class='fa fa-newspaper fa-fw fa-lg'></i></div><div class='text'><b>{__("Posts Feed")} 3</b><br>{__("Appears after")} {$system['max_results']*3} {__("posts are loaded, between the posts")}.
                            </div></div>">{__("Posts Feed")} 3</option>

                            <option value="article" data-content="<div class='option'><div class='icon'><i class='fa fa-file-alt fa-fw fa-lg'></i></div><div class='text'><b>{__("Article Page")}</b><br>{__("Appears on the sidebar on article page")}.
                            </div></div>">{__("Article Page")}</option>

                            <option value="header" data-content="<div class='option'><div class='icon'><i class='fa fa-chevron-circle-up fa-fw fa-lg'></i></div><div class='text'><b>{__("Header")}</b><br>{__("Appears on all pages right after the header")}.
                            </div></div>">{__("Header")}</option>

                            <option value="footer" data-content="<div class='option'><div class='icon'><i class='fa fa-chevron-circle-down fa-fw fa-lg'></i></div><div class='text'><b>{__("Footer")}</b><br>{__("Appears on all pages right before the footer")}.
                            </div></div>">{__("Footer")}</option>
                        </select>
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

    {elseif $sub_view == "users_ads"}

        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-striped table-bordered table-hover js_dataTable">
                    <thead>
                        <tr>
                            <th>{__("ID")}</th>
                            <th>{__("Title")}</th>
                            <th>{__("By")}</th>
                            <th>{__("Budget")}</th>
                            <th>{__("Spend")}</th>
                            <th>{__("Clicks/Views")}</th>
                            <th>{__("Status")}</th>
                            <th>{__("Actions")}</th>
                        </tr>
                    </thead>
                    <tbody>
                        {foreach $rows as $row}
                            <tr>
                                <td>{$row['campaign_id']}</td>
                                <td>{$row['campaign_title']}</td>
                                <td>
                                    <a target="_blank" href="{$system['system_url']}/{$row['user_name']}">
                                        <img class="tbl-image" src="{$row['user_picture']}">
                                        {$row['user_firstname']} {$row['user_lastname']}
                                    </a>
                                </td>
                                
                                <td>{$system['system_currency_symbol']}{$row['campaign_budget']|number_format:2}</td>
                                <td>{$system['system_currency_symbol']}{$row['campaign_spend']|number_format:2}</td>
                                <td>
                                    {if $row['campaign_bidding'] == "click"}
                                        {$row['campaign_clicks']} {__("Clicks")}
                                    {else}
                                        {$row['campaign_views']} {__("Views")}
                                    {/if}
                                </td>
                                <td>
                                    {if $row['campaign_is_active']}
                                        <span class="badge badge-pill badge-lg badge-success">{__("Active")}</span>
                                    {else}
                                        <span class="badge badge-pill badge-lg badge-danger">{__("Not Active")}</span>
                                    {/if}
                                </td>
                                <td>
                                    <a data-toggle="tooltip" data-placement="top" title='{__("Edit")}' href="{$system['system_url']}/ads/edit/{$row['campaign_id']}" class="btn btn-sm btn-icon btn-rounded btn-primary">
                                        <i class="fa fa-pencil-alt"></i>
                                    </a>
                                    {if $row['campaign_is_active']}
                                        <button data-toggle="tooltip" data-placement="top" title='{__("Stop")}' class="btn btn-sm btn-icon btn-rounded btn-warning js_ads-stop-campaign" data-id="{$row['campaign_id']}">
                                            <i class="fas fa-stop-circle"></i>
                                        </button>
                                    {else}
                                        <button data-toggle="tooltip" data-placement="top" title='{__("Resume")}' class="btn btn-sm btn-icon btn-rounded btn-success js_ads-resume-campaign" data-id="{$row['campaign_id']}">
                                            <i class="fas fa-play-circle"></i>
                                        </button>
                                    {/if}
                                    <button data-toggle="tooltip" data-placement="top" title='{__("Delete")}' class="btn btn-sm btn-icon btn-rounded btn-danger js_ads-delete-campaign" data-id="{$row['campaign_id']}">
                                        <i class="fas fa-trash"></i>
                                    </button>
                                </td>
                            </tr>
                        {/foreach}
                    </tbody>
                </table>
            </div>
        </div>

    {/if}
</div>