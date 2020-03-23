<div class="card">
    <div class="card-header with-icon">
        <i class="fa fa-toolbox mr10"></i>{__("Tools")}
        {if $sub_view == "faker"} &rsaquo; {__("Fake Users Generator")}{/if}
        {if $sub_view == "auto-connect"} &rsaquo; {__("Auto Connect")}{/if}
        {if $sub_view == "garbage-collector"} &rsaquo; {__("Garbage Collector")}{/if}
        {if $sub_view == "backups"} &rsaquo; {__("Backup Database & Files")}{/if}
    </div>

    {if $sub_view == "faker"}

        <form class="js_ajax-forms " data-url="admin/tools.php?do=faker">
            <div class="card-body">
                <div class="form-table-row">
                    <div>
                        <div class="form-control-label h6">{__("Random Pictures")}</div>
                        <div class="form-text d-none d-sm-block">{__("Profile pictures will be generated randomly and may be dublicated")}</div>
                    </div>
                    <div class="text-right">
                        <label class="switch" for="random_Avatar">
                            <input type="checkbox" name="random_Avatar" id="random_Avatar">
                            <span class="slider round"></span>
                        </label>
                    </div>
                </div>

                <div class="form-group form-row">
                    <label class="col-md-3 form-control-label">
                        {__("Number of Users")}
                    </label>
                    <div class="col-md-9">
                        <input type="number" class="form-control" name="users_num" value="10">
                        <span class="form-text">
                            {__("How many users you want to generate (Maximum is 1000 per request)")}
                        </span>
                    </div>
                </div>

                <div class="form-group form-row">
                    <label class="col-md-3 form-control-label">
                        {__("Password")}
                    </label>
                    <div class="col-md-9">
                        <input type="text" class="form-control" name="default_password">
                        <span class="form-text">
                            {__("This password will be used for all generated accounts (Default is 123456789)")}
                        </span>
                    </div>
                </div>

                <div class="form-group form-row">
                    <label class="col-md-3 form-control-label">
                        {__("Names Language")}
                    </label>
                    <div class="col-md-9">
                        <select class="form-control" name="language">
                            {foreach $system['languages'] as $language}
                                {$parts = explode('_', $language['code'])}
                                <option {if $system['default_language']['language_id'] == $language['language_id']}selected{/if} value="{$parts[0]}_{strtoupper($parts[1])}">{$language['title']}</option>
                            {/foreach}
                        </select>
                        <span class="form-text">
                            {__("Select the language of generated account names")}
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
                <button type="submit" class="btn btn-danger"><i class="fa fa-bolt mr10"></i>{__("Generate")}</button>
            </div>
        </form>

    {elseif $sub_view == "auto-connect"}

        <form class="js_ajax-forms " data-url="admin/tools.php?do=auto-connect">
            <div class="card-body">
                <div class="heading-small mb20">
                    {__("Auto Friend")}
                </div>
                <div class="pl-md-4">
                    <div class="form-table-row">
                        <div>
                            <div class="form-control-label h6">{__("Auto Friend")}</div>
                            <div class="form-text d-none d-sm-block">{__("When a user creates a new account, select which users you want to auto friend (following included)")}</div>
                        </div>
                        <div class="text-right">
                            <label class="switch" for="auto_friend">
                                <input type="checkbox" name="auto_friend" id="auto_friend" {if $system['auto_friend']}checked{/if}>
                                <span class="slider round"></span>
                            </label>
                        </div>
                    </div>
                    <div class="form-group form-row">
                        <label class="col-md-3 form-control-label">
                            {__("Select Users")}
                        </label>
                        <div class="col-md-9">
                            <input type="text" class="js_tagify x-hidden" data-handle="users" name="auto_friend_users" value='{$system['auto_friend_users']}'>
                            <span class="form-text">
                                {__("Search for users you want new accounts to auto friend")}
                            </span>
                        </div>
                    </div>
                </div>

                <div class="divider"></div>

                <div class="heading-small mb20">
                    {__("Auto Follow")}
                </div>
                <div class="pl-md-4">
                    <div class="form-table-row">
                        <div>
                            <div class="form-control-label h6">{__("Auto Follow")}</div>
                            <div class="form-text d-none d-sm-block">{__("When a user creates a new account, select which users you want to auto follow")}</div>
                        </div>
                        <div class="text-right">
                            <label class="switch" for="auto_follow">
                                <input type="checkbox" name="auto_follow" id="auto_follow" {if $system['auto_follow']}checked{/if}>
                                <span class="slider round"></span>
                            </label>
                        </div>
                    </div>
                    <div class="form-group form-row">
                        <label class="col-md-3 form-control-label">
                            {__("Select Users")}
                        </label>
                        <div class="col-md-9">
                            <input type="text" class="js_tagify x-hidden" data-handle="users" name="auto_follow_users" value='{$system['auto_follow_users']}'>
                            <span class="form-text">
                                {__("Search for users you want new accounts to auto follow")}
                            </span>
                        </div>
                    </div>
                </div>

                <div class="divider"></div>

                <div class="heading-small mb20">
                    {__("Auto Like")}
                </div>
                <div class="pl-md-4">
                    <div class="form-table-row">
                        <div>
                            <div class="form-control-label h6">{__("Auto Like")}</div>
                            <div class="form-text d-none d-sm-block">{__("When a user creates a new account, select which pages you want to auto like")}</div>
                        </div>
                        <div class="text-right">
                            <label class="switch" for="auto_like">
                                <input type="checkbox" name="auto_like" id="auto_like" {if $system['auto_like']}checked{/if}>
                                <span class="slider round"></span>
                            </label>
                        </div>
                    </div>
                    <div class="form-group form-row">
                        <label class="col-md-3 form-control-label">
                            {__("Select Pages")}
                        </label>
                        <div class="col-md-9">
                            <input type="text" class="js_tagify x-hidden" data-handle="pages" name="auto_like_pages" value='{$system['auto_like_pages']}'>
                            <span class="form-text">
                                {__("Search for pages you want new accounts to auto like")}
                            </span>
                        </div>
                    </div>
                </div>

                <div class="divider"></div>

                <div class="heading-small mb20">
                    {__("Auto Join")}
                </div>
                <div class="pl-md-4">
                    <div class="form-table-row">
                        <div>
                            <div class="form-control-label h6">{__("Auto Join")}</div>
                            <div class="form-text d-none d-sm-block">{__("When a user creates a new account, select which groups you want to auto join")}</div>
                        </div>
                        <div class="text-right">
                            <label class="switch" for="auto_join">
                                <input type="checkbox" name="auto_join" id="auto_join" {if $system['auto_join']}checked{/if}>
                                <span class="slider round"></span>
                            </label>
                        </div>
                    </div>
                    <div class="form-group form-row">
                        <label class="col-md-3 form-control-label">
                            {__("Select Groups")}
                        </label>
                        <div class="col-md-9">
                            <input type="text" class="js_tagify x-hidden" data-handle="groups" name="auto_join_groups" value='{$system['auto_join_groups']}'>
                            <span class="form-text">
                                {__("Search for groups you want new accounts to auto join")}
                            </span>
                        </div>
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

    {elseif $sub_view == "garbage-collector"}

        <form class="js_ajax-forms " data-url="admin/tools.php?do=garbage-collector">
            <div class="card-body">

                <div class="alert alert-info">
                    <div class="icon">
                        <i class="fa fa-info-circle fa-2x"></i>
                    </div>
                    <div class="text pt5">
                        {__("Garbage collector will remove all selected data and might take some time")}
                    </div>
                </div>

                <div class="form-group form-row">
                    <label class="col-md-3 form-control-label">
                        {__("What you want to delete")}
                    </label>
                    <div class="col-md-9">
                        <select class="form-control" name="delete">
                            <option value="users_not_activated">{__("Delete all not activated accounts")} ({$insights['users_not_activated']} {__("user")})</option>
                            <option value="users_not_logged_week">{__("Delete users that are not logged in more than 1 week")} ({$insights['users_not_logged_week']} {__("user")})</option>
                            <option value="users_not_logged_month">{__("Delete users that are not logged in more than 1 month")} ({$insights['users_not_logged_month']} {__("user")})</option>
                            <option value="users_not_logged_year">{__("Delete users that are not logged in more than 1 year")} ({$insights['users_not_logged_year']} {__("user")})</option>
                            <option value="posts_longer_week">{__("Delete posts that are longer than 1 week")} ({$insights['posts_longer_week']} {__("post")})</option>
                            <option value="posts_longer_month">{__("Delete posts that are longer than 1 month")} ({$insights['posts_longer_month']} {__("post")})</option>
                            <option value="posts_longer_year">{__("Delete posts that are longer than 1 year")} ({$insights['posts_longer_year']} {__("post")})</option>
                        </select>
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
                <button type="submit" class="btn btn-danger"><i class="fa fa-bolt mr10"></i>{__("Run")}</button>
            </div>
        </form>

    {elseif $sub_view == "backups"}

        <form class="js_ajax-forms " data-url="admin/tools.php?do=backups">
            <div class="card-body">

                <div class="alert alert-primary">
                    <div class="icon">
                        <i class="fa fa-server fa-2x"></i>
                    </div>
                    <div class="text">
                        {__("You last backup")} <span class="badge badge-pill badge-lg badge-warning">{if $system['last_backup_time']}{$system['last_backup_time']}{else}{__("N/A")}{/if}</span><br>
                        {__("You can find backups in")} <strong>content/backups</strong><br>
                        {__("Taking backup might take some time and you can download backups via FTP")}
                    </div>
                </div>

                <div class="h5 mb20 text-center">
                    {__("Select which backup you would like to generate")}
                </div>
                <!-- backup options -->
                <div class="text-center">
                    <!-- Database -->
                    <input class="x-hidden input-label" type="radio" name="backup_option" value="datebase_backup" id="datebase_backup"/>
                    <label class="button-label" for="datebase_backup">
                        <div class="icon">
                            <img src="{$system['system_url']}/content/themes/{$system['theme']}/images/icons/database.png">
                        </div>
                        <div class="title">{__("Database")}</div>
                    </label>
                    <!-- Database -->
                    <!-- Files -->
                    <input class="x-hidden input-label" type="radio" name="backup_option" value="files_backup" id="files_backup"/>
                    <label class="button-label" for="files_backup">
                        <div class="icon">
                            <img src="{$system['system_url']}/content/themes/{$system['theme']}/images/icons/folder.png">
                        </div>
                        <div class="title">{__("Files")}</div>
                    </label>
                    <!-- Files -->
                    <!-- Full -->
                    <input class="x-hidden input-label" type="radio" name="backup_option" value="full_backup" id="full_backup"/>
                    <label class="button-label" for="full_backup">
                        <div class="icon">
                            <img src="{$system['system_url']}/content/themes/{$system['theme']}/images/icons/server.png">
                        </div>
                        <div class="title">{__("Full Backup")}</div>
                    </label>
                    <!-- Full -->
                </div>
                <!-- backup options -->

                <!-- success -->
                <div class="alert alert-success mt10 mb0 x-hidden"></div>
                <!-- success -->

                <!-- error -->
                <div class="alert alert-danger mt10 mb0 x-hidden"></div>
                <!-- error -->
            </div>
            <div class="card-footer text-right">
                <button type="submit" class="btn btn-danger"><i class="fa fa-bolt mr10"></i>{__("Run")}</button>
            </div>
        </form>

    {/if}
</div>