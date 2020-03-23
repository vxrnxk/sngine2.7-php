<div class="card">

    {if $sub_view == ""}

        <!-- card-header -->
        <div class="card-header with-icon with-nav">
            <!-- panel title -->
            <div class="mb20">
                <i class="fa fa-cog mr10"></i>{__("Settings")}
            </div>
            <!-- panel title -->

            <!-- panel nav -->
            <ul class="nav nav-tabs">
                <li class="nav-item">
                    <a class="nav-link active" href="#General" data-toggle="tab">
                        <i class="fa fa-server fa-fw mr5"></i><strong>{__("General")}</strong>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#Features" data-toggle="tab">
                        <i class="fa fa-microchip fa-fw mr5"></i><strong>{__("Features")}</strong>
                    </a>
                </li>
            </ul>
            <!-- panel nav -->
        </div>
        <!-- card-header -->

        <!-- tab-content -->
        <div class="tab-content">
            <!-- General -->
            <div class="tab-pane active" id="General">
                <form class="js_ajax-forms " data-url="admin/settings.php?edit=general_settings">
                    <div class="card-body">
                        <div class="form-table-row">
                            <div>
                                <div class="form-control-label h6">{__("Website Public")}</div>
                                <div class="form-text d-none d-sm-block">{__("Make the website public to allow non logged users to view website content")}</div>
                            </div>
                            <div class="text-right">
                                <label class="switch" for="system_public">
                                    <input type="checkbox" name="system_public" id="system_public" {if $system['system_public']}checked{/if}>
                                    <span class="slider round"></span>
                                </label>
                            </div>
                        </div>

                        <div class="form-table-row">
                            <div>
                                <div class="form-control-label h6">{__("Website Live")}</div>
                                <div class="form-text d-none d-sm-block">{__("Turn the entire website On and Off")}</div>
                            </div>
                            <div class="text-right">
                                <label class="switch" for="system_live">
                                    <input type="checkbox" name="system_live" id="system_live" {if $system['system_live']}checked{/if}>
                                    <span class="slider round"></span>
                                </label>
                            </div>
                        </div>

                        <div class="form-group form-row">
                            <label class="col-md-3 form-control-label">
                                {__("Shutdown Message")}
                            </label>
                            <div class="col-md-9">
                                <textarea class="form-control" name="system_message" rows="3">{$system['system_message']}</textarea>
                                <span class="form-text">
                                    {__("The text that is presented when the site is closed")}
                                </span>
                            </div>
                        </div>

                        <div class="form-group form-row">
                            <label class="col-md-3 form-control-label">
                                {__("Website Title")}
                            </label>
                            <div class="col-md-9">
                                <input type="text" class="form-control" name="system_title" value="{$system['system_title']}">
                                <span class="form-text">
                                    {__("Title of your website")}
                                </span>
                            </div>
                        </div>

                        <div class="form-group form-row">
                            <label class="col-md-3 form-control-label">
                                {__("Website Description")}
                            </label>
                            <div class="col-md-9">
                                <textarea class="form-control" name="system_description" rows="3">{$system['system_description']}</textarea>
                                <span class="form-text">
                                    {__("Description of your website")}
                                </span>
                            </div>
                        </div>

                        <div class="form-group form-row">
                            <label class="col-md-3 form-control-label">
                                {__("Website Keywords")}
                            </label>
                            <div class="col-md-9">
                                <textarea class="form-control" name="system_keywords" rows="3">{$system['system_keywords']}</textarea>
                                <span class="form-text">
                                    {__("Example: social, sngine, social site")}
                                </span>
                            </div>
                        </div>

                        <div class="form-group form-row">
                            <label class="col-md-3 form-control-label">
                                {__("Website Email")}
                            </label>
                            <div class="col-md-9">
                                <input type="text" class="form-control" name="system_email" value="{$system['system_email']}">
                                <span class="form-text">
                                    {__("The contact email that all messages send to")}
                                </span>
                            </div>
                        </div>

                        <div class="divider"></div>

                        <div class="form-group form-row">
                            <label class="col-md-3 form-control-label">
                                {__("Datetime Format")}
                            </label>
                            <div class="col-md-9">
                                <select class="form-control" name="system_datetime_format">
                                    <option {if $system['system_datetime_format'] == "d/m/Y H:i"}selected{/if} value="d/m/Y H:i">d/m/Y H:i ({__("Example")}: 30/05/2019 17:30)</option>
                                    <option {if $system['system_datetime_format'] == "m/d/Y H:i"}selected{/if} value="m/d/Y H:i">m/d/Y H:i ({__("Example")}: 05/30/2019 17:30)</option>
                                </select>
                                <span class="form-text">
                                    {__("Select the datetime format of the datetime picker")}
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
            </div>
            <!-- General -->

            <!-- Features -->
            <div class="tab-pane" id="Features">
                <form class="js_ajax-forms " data-url="admin/settings.php?edit=features_settings">
                    <div class="card-body">
                        <div class="form-table-row">
                            <div>
                                <div class="form-control-label h6">{__("Contact Us")}</div>
                                <div class="form-text d-none d-sm-block">{__("Turn the contact us page On and Off")}</div>
                            </div>
                            <div class="text-right">
                                <label class="switch" for="contact_enabled">
                                    <input type="checkbox" name="contact_enabled" id="contact_enabled" {if $system['contact_enabled']}checked{/if}>
                                    <span class="slider round"></span>
                                </label>
                            </div>
                        </div>

                        <div class="divider"></div>

                        <div class="form-table-row">
                            <div>
                                <div class="form-control-label h6"> {__("Directory")}</div>
                                <div class="form-text d-none d-sm-block">
                                    {__("Enable the directory for better SEO results")}<br>
                                    {__("Make the website public to allow non logged users to view website content")}
                                </div>
                            </div>
                            <div class="text-right">
                                <label class="switch" for="directory_enabled">
                                    <input type="checkbox" name="directory_enabled" id="directory_enabled" {if $system['directory_enabled']}checked{/if}>
                                    <span class="slider round"></span>
                                </label>
                            </div>
                        </div>

                        <div class="divider"></div>

                        <div class="form-table-row">
                            <div>
                                <div class="form-control-label h6">{__("Pages")}</div>
                                <div class="form-text d-none d-sm-block">{__("Users can create pages or only admins/moderators")}</div>
                            </div>
                            <div class="text-right">
                                <label class="switch" for="pages_enabled">
                                    <input type="checkbox" name="pages_enabled" id="pages_enabled" {if $system['pages_enabled']}checked{/if}>
                                    <span class="slider round"></span>
                                </label>
                            </div>
                        </div>

                        <div class="form-table-row">
                            <div>
                                <div class="form-control-label h6">{__("Groups")}</div>
                                <div class="form-text d-none d-sm-block">{__("Users can create groups or only admins/moderators")}</div>
                            </div>
                            <div class="text-right">
                                <label class="switch" for="groups_enabled">
                                    <input type="checkbox" name="groups_enabled" id="groups_enabled" {if $system['groups_enabled']}checked{/if}>
                                    <span class="slider round"></span>
                                </label>
                            </div>
                        </div>

                        <div class="form-table-row">
                            <div>
                                <div class="form-control-label h6">{__("Events")}</div>
                                <div class="form-text d-none d-sm-block">{__("Users can create events or only admins/moderators")}</div>
                            </div>
                            <div class="text-right">
                                <label class="switch" for="events_enabled">
                                    <input type="checkbox" name="events_enabled" id="events_enabled" {if $system['events_enabled']}checked{/if}>
                                    <span class="slider round"></span>
                                </label>
                            </div>
                        </div>

                        <div class="form-table-row">
                            <div>
                                <div class="form-control-label h6">{__("Blogs")}</div>
                                <div class="form-text d-none d-sm-block">{__("Allow users to create blogs")}</div>
                            </div>
                            <div class="text-right">
                                <label class="switch" for="blogs_enabled">
                                    <input type="checkbox" name="blogs_enabled" id="blogs_enabled" {if $system['blogs_enabled']}checked{/if}>
                                    <span class="slider round"></span>
                                </label>
                            </div>
                        </div>

                        <div class="form-table-row">
                            <div>
                                <div class="form-control-label h6">{__("Users Can Write Articles?")}</div>
                                <div class="form-text d-none d-sm-block">{__("Users can write articles or only admins/moderators")}</div>
                            </div>
                            <div class="text-right">
                                <label class="switch" for="users_blogs_enabled">
                                    <input type="checkbox" name="users_blogs_enabled" id="users_blogs_enabled" {if $system['users_blogs_enabled']}checked{/if}>
                                    <span class="slider round"></span>
                                </label>
                            </div>
                        </div>

                        <div class="form-table-row">
                            <div>
                                <div class="form-control-label h6">{__("Market")}</div>
                                <div class="form-text d-none d-sm-block">{__("Allow users to sell/buy products")}</div>
                            </div>
                            <div class="text-right">
                                <label class="switch" for="market_enabled">
                                    <input type="checkbox" name="market_enabled" id="market_enabled" {if $system['market_enabled']}checked{/if}>
                                    <span class="slider round"></span>
                                </label>
                            </div>
                        </div>

                        <div class="form-table-row">
                            <div>
                                <div class="form-control-label h6">{__("Movies")}</div>
                                <div class="form-text d-none d-sm-block">{__("Turn the movies On and Off")}</div>
                            </div>
                            <div class="text-right">
                                <label class="switch" for="movies_enabled">
                                    <input type="checkbox" name="movies_enabled" id="movies_enabled" {if $system['movies_enabled']}checked{/if}>
                                    <span class="slider round"></span>
                                </label>
                            </div>
                        </div>

                        <div class="form-table-row">
                            <div>
                                <div class="form-control-label h6">{__("Games")}</div>
                                <div class="form-text d-none d-sm-block">{__("Turn the games On and Off")}</div>
                            </div>
                            <div class="text-right">
                                <label class="switch" for="games_enabled">
                                    <input type="checkbox" name="games_enabled" id="games_enabled" {if $system['games_enabled']}checked{/if}>
                                    <span class="slider round"></span>
                                </label>
                            </div>
                        </div>

                        <div class="divider"></div>

                        <div class="form-table-row">
                            <div>
                                <div class="form-control-label h6">{__("DayTime Messages")}</div>
                                <div class="form-text d-none d-sm-block">{__("Turn the DayTime Messages (Good Morning, Afternoon, Evening) On and Off")}</div>
                            </div>
                            <div class="text-right">
                                <label class="switch" for="daytime_msg_enabled">
                                    <input type="checkbox" name="daytime_msg_enabled" id="daytime_msg_enabled" {if $system['daytime_msg_enabled']}checked{/if}>
                                    <span class="slider round"></span>
                                </label>
                            </div>
                        </div>

                        <div class="divider"></div>

                        <div class="form-table-row">
                            <div>
                                <div class="form-control-label h6">{__("Pokes")}</div>
                                <div class="form-text d-none d-sm-block">{__("Enable users to poke each others")}</div>
                            </div>
                            <div class="text-right">
                                <label class="switch" for="pokes_enabled">
                                    <input type="checkbox" name="pokes_enabled" id="pokes_enabled" {if $system['pokes_enabled']}checked{/if}>
                                    <span class="slider round"></span>
                                </label>
                            </div>
                        </div>

                        <div class="form-table-row">
                            <div>
                                <div class="form-control-label h6">{__("Gifts")}</div>
                                <div class="form-text d-none d-sm-block">{__("Enable users to send gifts to each others")}</div>
                            </div>
                            <div class="text-right">
                                <label class="switch" for="gifts_enabled">
                                    <input type="checkbox" name="gifts_enabled" id="gifts_enabled" {if $system['gifts_enabled']}checked{/if}>
                                    <span class="slider round"></span>
                                </label>
                            </div>
                        </div>

                        <div class="divider"></div>

                        <div class="form-table-row">
                            <div>
                                <div class="form-control-label h6">{__("Profile Visit Notification")}</div>
                                <div class="form-text d-none d-sm-block">{__("Turn the profile visit notification On and Off")}</div>
                            </div>
                            <div class="text-right">
                                <label class="switch" for="profile_notification_enabled">
                                    <input type="checkbox" name="profile_notification_enabled" id="profile_notification_enabled" {if $system['profile_notification_enabled']}checked{/if}>
                                    <span class="slider round"></span>
                                </label>
                            </div>
                        </div>

                        <div class="form-table-row">
                            <div>
                                <div class="form-control-label h6">{__("Browser Notifications")}</div>
                                <div class="form-text d-none d-sm-block">{__("Turn the browser notifications On and Off")}</div>
                            </div>
                            <div class="text-right">
                                <label class="switch" for="browser_notifications_enabled">
                                    <input type="checkbox" name="browser_notifications_enabled" id="browser_notifications_enabled" {if $system['browser_notifications_enabled']}checked{/if}>
                                    <span class="slider round"></span>
                                </label>
                            </div>
                        </div>

                        <div class="form-table-row">
                            <div>
                                <div class="form-control-label h6">{__("Noty Notifications")}</div>
                                <div class="form-text d-none d-sm-block">
                                    {__("Turn the noty notifications On and Off")} (<a target="_blank" href="{$system['system_url']}/content/themes/{$system['theme']}/images/screenshots/noty_notification.png">{__("preview")}</a>)
                                </div>
                            </div>
                            <div class="text-right">
                                <label class="switch" for="noty_notifications_enabled">
                                    <input type="checkbox" name="noty_notifications_enabled" id="noty_notifications_enabled" {if $system['noty_notifications_enabled']}checked{/if}>
                                    <span class="slider round"></span>
                                </label>
                            </div>
                        </div>

                        <div class="divider"></div>

                        <div class="form-table-row">
                            <div>
                                <div class="form-control-label h6">{__("Cookie Consent")} ({__("GDPR")})</div>
                                <div class="form-text d-none d-sm-block">{__("Turn the cookie consent notification On and Off")}</div>
                            </div>
                            <div class="text-right">
                                <label class="switch" for="cookie_consent_enabled">
                                    <input type="checkbox" name="cookie_consent_enabled" id="cookie_consent_enabled" {if $system['cookie_consent_enabled']}checked{/if}>
                                    <span class="slider round"></span>
                                </label>
                            </div>
                        </div>

                        <div class="form-table-row">
                            <div>
                                <div class="form-control-label h6">{__("Adblock Detector")}</div>
                                <div class="form-text d-none d-sm-block">
                                    {__("Turn the Adblock auto detector notification On and Off")}, {__("(Note: Admin is exception)")}<br>
                                    {__("Red block message will appear to make user disable adblock from his browser")}<br>
                                </div>
                            </div>
                            <div class="text-right">
                                <label class="switch" for="adblock_detector_enabled">
                                    <input type="checkbox" name="adblock_detector_enabled" id="adblock_detector_enabled" {if $system['adblock_detector_enabled']}checked{/if}>
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
            </div>
            <!-- Features -->
        </div>
        <!-- tab-content -->

    {elseif $sub_view == "posts"}

        <!-- card-header -->
        <div class="card-header with-icon">
            <!-- panel title -->
            <i class="fa fa-cog mr10"></i>{__("Settings")} &rsaquo; {__("Posts")}
            <!-- panel title -->
        </div>
        <!-- card-header -->

        <!-- Posts -->
        <form class="js_ajax-forms " data-url="admin/settings.php?edit=posts">
            <div class="card-body">
                <div class="form-table-row">
                    <div>
                        <div class="form-control-label h6">{__("Stories")}</div>
                        <div class="form-text d-none d-sm-block">
                            {__("Turn the stories On and Off")}<br>
                            {__("Stories are photos and videos that only last 24 hours")}
                        </div>
                    </div>
                    <div class="text-right">
                        <label class="switch" for="stories_enabled">
                            <input type="checkbox" name="stories_enabled" id="stories_enabled" {if $system['stories_enabled']}checked{/if}>
                            <span class="slider round"></span>
                        </label>
                    </div>
                </div>

                <div class="divider"></div>

                <div class="form-table-row">
                    <div>
                        <div class="form-control-label h6">{__("Popular Posts")}</div>
                        <div class="form-text d-none d-sm-block">
                            {__("Turn the popular posts On and Off")}<br>
                            {__("Popular posts are public posts ordered by most reactions, comments & shares")}
                        </div>
                    </div>
                    <div class="text-right">
                        <label class="switch" for="popular_posts_enabled">
                            <input type="checkbox" name="popular_posts_enabled" id="popular_posts_enabled" {if $system['popular_posts_enabled']}checked{/if}>
                            <span class="slider round"></span>
                        </label>
                    </div>
                </div>

                <div class="form-table-row">
                    <div>
                        <div class="form-control-label h6">{__("Discover Posts")}</div>
                        <div class="form-text d-none d-sm-block">
                            {__("Turn the discover posts On and Off")}<br>
                            {__("Discover posts are public posts ordered from most recent to old")}
                        </div>
                    </div>
                    <div class="text-right">
                        <label class="switch" for="discover_posts_enabled">
                            <input type="checkbox" name="discover_posts_enabled" id="discover_posts_enabled" {if $system['discover_posts_enabled']}checked{/if}>
                            <span class="slider round"></span>
                        </label>
                    </div>
                </div>

                <div class="divider"></div>

                <div class="form-table-row">
                    <div>
                        <div class="form-control-label h6">{__("Memories")}</div>
                        <div class="form-text d-none d-sm-block">
                            {__("Turn the memories On and Off")}<br>
                            {__("Memories are posts from the same day on last year")}
                        </div>
                    </div>
                    <div class="text-right">
                        <label class="switch" for="memories_enabled">
                            <input type="checkbox" name="memories_enabled" id="memories_enabled" {if $system['memories_enabled']}checked{/if}>
                            <span class="slider round"></span>
                        </label>
                    </div>
                </div>

                <div class="divider"></div>

                <div class="form-table-row">
                    <div>
                        <div class="form-control-label h6">{__("Wall Posts")}</div>
                        <div class="form-text d-none d-sm-block">{__("Users can publish posts on their friends walls")}</div>
                    </div>
                    <div class="text-right">
                        <label class="switch" for="wall_posts_enabled">
                            <input type="checkbox" name="wall_posts_enabled" id="wall_posts_enabled" {if $system['wall_posts_enabled']}checked{/if}>
                            <span class="slider round"></span>
                        </label>
                    </div>
                </div>

                <div class="divider"></div>

                <div class="form-table-row">
                    <div>
                        <div class="form-control-label h6">{__("Colored Posts")}</div>
                        <div class="form-text d-none d-sm-block">
                            {__("Turn the colored posts On and Off")}<br>
                            {__("Make sure you have configured")} <a href="{$system['system_url']}/{$control_panel['url']}/colored_posts">{__("Colored Posts")}</a>
                        </div>
                    </div>
                    <div class="text-right">
                        <label class="switch" for="colored_posts_enabled">
                            <input type="checkbox" name="colored_posts_enabled" id="colored_posts_enabled" {if $system['colored_posts_enabled']}checked{/if}>
                            <span class="slider round"></span>
                        </label>
                    </div>
                </div>

                <div class="divider"></div>

                <div class="form-table-row">
                    <div>
                        <div class="form-control-label h6">{__("Feelings/Activity Posts")}</div>
                        <div class="form-text d-none d-sm-block">
                            {__("Turn the feelings and activity posts On and Off")}<br>
                        </div>
                    </div>
                    <div class="text-right">
                        <label class="switch" for="activity_posts_enabled">
                            <input type="checkbox" name="activity_posts_enabled" id="activity_posts_enabled" {if $system['activity_posts_enabled']}checked{/if}>
                            <span class="slider round"></span>
                        </label>
                    </div>
                </div>

                <div class="divider"></div>

                <div class="form-table-row">
                    <div>
                        <div class="form-control-label h6">{__("Polls")}</div>
                        <div class="form-text d-none d-sm-block">{__("Turn the poll posts On and Off")}</div>
                    </div>
                    <div class="text-right">
                        <label class="switch" for="polls_enabled">
                            <input type="checkbox" name="polls_enabled" id="polls_enabled" {if $system['polls_enabled']}checked{/if}>
                            <span class="slider round"></span>
                        </label>
                    </div>
                </div>

                <div class="divider"></div>

                <div class="form-table-row">
                    <div>
                        <div class="form-control-label h6">{__("Geolocation")}</div>
                        <div class="form-text d-none d-sm-block">{__("Turn the post Geolocation On and Off")}</div>
                    </div>
                    <div class="text-right">
                        <label class="switch" for="geolocation_enabled">
                            <input type="checkbox" name="geolocation_enabled" id="geolocation_enabled" {if $system['geolocation_enabled']}checked{/if}>
                            <span class="slider round"></span>
                        </label>
                    </div>
                </div>

                <div class="form-group form-row">
                    <label class="col-md-3 form-control-label">
                        {__("Geolocation Google Key")}
                    </label>
                    <div class="col-md-9">
                        <input type="text" class="form-control" name="geolocation_key" value="{$system['geolocation_key']}">
                        <span class="form-text">
                            {__("Check the documentation to learn how to get this key")}
                        </span>
                    </div>
                </div>

                <div class="divider"></div>

                <div class="form-table-row">
                    <div>
                        <div class="form-control-label h6">{__("GIF")}</div>
                        <div class="form-text d-none d-sm-block">{__("Turn the gif posts On and Off")}</div>
                    </div>
                    <div class="text-right">
                        <label class="switch" for="gif_enabled">
                            <input type="checkbox" name="gif_enabled" id="gif_enabled" {if $system['gif_enabled']}checked{/if}>
                            <span class="slider round"></span>
                        </label>
                    </div>
                </div>

                <div class="form-group form-row">
                    <label class="col-md-3 form-control-label">
                        {__("Giphy API Key")}
                    </label>
                    <div class="col-md-9">
                        <input type="text" class="form-control" name="giphy_key" value="{$system['giphy_key']}">
                        <span class="form-text">
                            {__("Check the documentation to learn how to get this key")}
                        </span>
                    </div>
                </div>

                <div class="divider"></div>

                <div class="form-table-row">
                    <div>
                        <div class="form-control-label h6">{__("Post Translation")}</div>
                        <div class="form-text d-none d-sm-block">{__("Turn the post translation On and Off")}</div>
                    </div>
                    <div class="text-right">
                        <label class="switch" for="post_translation_enabled">
                            <input type="checkbox" name="post_translation_enabled" id="post_translation_enabled" {if $system['post_translation_enabled']}checked{/if}>
                            <span class="slider round"></span>
                        </label>
                    </div>
                </div>

                <div class="form-group form-row">
                    <label class="col-md-3 form-control-label">
                        {__("Yandex Key")}
                    </label>
                    <div class="col-md-9">
                        <input type="text" class="form-control" name="yandex_key" value="{$system['yandex_key']}">
                        <span class="form-text">
                            {__("Check the documentation to learn how to get this key")}
                        </span>
                    </div>
                </div>

                <div class="divider"></div>

                <div class="form-table-row">
                    <div>
                        <div class="form-control-label h6">{__("Smart YouTube Player")}</div>
                        <div class="form-text d-none d-sm-block">{__("Smart YouTube player will save a lot of bandwidth")}</div>
                    </div>
                    <div class="text-right">
                        <label class="switch" for="smart_yt_player">
                            <input type="checkbox" name="smart_yt_player" id="smart_yt_player" {if $system['smart_yt_player']}checked{/if}>
                            <span class="slider round"></span>
                        </label>
                    </div>
                </div>

                <div class="divider"></div>

                <div class="form-table-row">
                    <div>
                        <div class="form-control-label h6">{__("Social Media Share")}</div>
                        <div class="form-text d-none d-sm-block">{__("Turn the social media share for posts On and Off")}</div>
                    </div>
                    <div class="text-right">
                        <label class="switch" for="social_share_enabled">
                            <input type="checkbox" name="social_share_enabled" id="social_share_enabled" {if $system['social_share_enabled']}checked{/if}>
                            <span class="slider round"></span>
                        </label>
                    </div>
                </div>

                <div class="divider"></div>

                <div class="form-group form-row">
                    <label class="col-md-3 form-control-label">
                        {__("Max Post Characters")}
                    </label>
                    <div class="col-md-9">
                        <input type="text" class="form-control" name="max_post_length" value="{$system['max_post_length']}">
                        <span class="form-text">
                            {__("The Maximum allowed post characters length (0 for unlimited)")}
                        </span>
                    </div>
                </div>

                <div class="form-group form-row">
                    <label class="col-md-3 form-control-label">
                        {__("Max Comment Characters")}
                    </label>
                    <div class="col-md-9">
                        <input type="text" class="form-control" name="max_comment_length" value="{$system['max_comment_length']}">
                        <span class="form-text">
                            {__("The Maximum allowed comment characters length (0 for unlimited)")}
                        </span>
                    </div>
                </div>

                <div class="form-group form-row">
                    <label class="col-md-3 form-control-label">
                        {__("Max Posts/Hour")}
                    </label>
                    <div class="col-md-9">
                        <input type="text" class="form-control" name="max_posts_hour" value="{$system['max_posts_hour']}">
                        <span class="form-text">
                            {__("The Maximum number of posts that user can publish per hour (0 for unlimited)")}
                        </span>
                    </div>
                </div>

                <div class="form-group form-row">
                    <label class="col-md-3 form-control-label">
                        {__("Max Comments/Hour")}
                    </label>
                    <div class="col-md-9">
                        <input type="text" class="form-control" name="max_comments_hour" value="{$system['max_comments_hour']}">
                        <span class="form-text">
                            {__("The Maximum number of comments that user can publish per hour (0 for unlimited)")}
                        </span>
                    </div>
                </div>

                <div class="form-group form-row">
                    <label class="col-md-3 form-control-label">
                        {__("Default Posts Privacy")}
                    </label>
                    <div class="col-md-9">
                        <select class="form-control selectpicker" name="default_privacy">
                            <option value="public" {if $system['default_privacy'] == "public"}selected{/if} data-content="<div class='option'><div class='icon'><i class='fa fa-globe fa-lg fa-fw'></i></div><div class='text'><b>{__("Public")}</b><br>{__("Anyone one can see the post")}</div></div>">{__("Public")}</option>
                            <option value="friends" {if $system['default_privacy'] == "friends"}selected{/if} data-content="<div class='option'><div class='icon'><i class='fa fa-users fa-lg fa-fw'></i></div><div class='text'><b>{__("Friends")}</b><br>{__("Only post author friends can see the post")}</div></div>">{__("Friends")}</option>
                            <option value="me" {if $system['default_privacy'] == "me"}selected{/if} data-content="<div class='option'><div class='icon'><i class='fa fa-lock fa-lg fa-fw'></i></div><div class='text'><b>{__("Only Me")}</b><br>{__("Only post author can see the post")}</div></div>">{__("Only Me")}</option>
                        </select>
                    </div>
                </div>

                <div class="divider"></div>

                <div class="form-table-row">
                    <div>
                        <div class="form-control-label h6">{__("Trending Hashtags")}</div>
                        <div class="form-text d-none d-sm-block">{__("Turn the trending hashtags feature On and Off")}</div>
                    </div>
                    <div class="text-right">
                        <label class="switch" for="trending_hashtags_enabled">
                            <input type="checkbox" name="trending_hashtags_enabled" id="trending_hashtags_enabled" {if $system['trending_hashtags_enabled']}checked{/if}>
                            <span class="slider round"></span>
                        </label>
                    </div>
                </div>

                <div class="form-group form-row">
                    <label class="col-md-3 form-control-label">
                        {__("Trending Interval")}
                    </label>
                    <div class="col-md-9">
                        <select class="form-control" name="trending_hashtags_interval">
                            <option {if $system['trending_hashtags_interval'] == "day"}selected{/if} value="day">{__("Last 24 Hours")}</option>
                            <option {if $system['trending_hashtags_interval'] == "week"}selected{/if} value="week">{__("Last Week")}</option>
                            <option {if $system['trending_hashtags_interval'] == "month"}selected{/if} value="month">{__("Last Month")}</option>
                        </select>
                        <span class="form-text">
                            {__("Select the interval of trending hashtags")}
                        </span>
                    </div>
                </div>

                <div class="form-group form-row">
                    <label class="col-md-3 form-control-label">
                        {__("Hashtags Limit")}
                    </label>
                    <div class="col-md-9">
                        <input type="text" class="form-control" name="trending_hashtags_limit" value="{$system['trending_hashtags_limit']}">
                        <span class="form-text">
                            {__("How many hashtags you want to display")}
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
        <!-- Posts -->

    {elseif $sub_view == "registration"}

        <!-- card-header -->
        <div class="card-header with-icon with-nav">
            <!-- panel title -->
            <div class="mb20">
                <i class="fa fa-cog mr10"></i>{__("Settings")} &rsaquo; {__("Registration")}
            </div>
            <!-- panel title -->

            <!-- panel nav -->
            <ul class="nav nav-tabs">
                <li class="nav-item">
                    <a class="nav-link active" href="#General" data-toggle="tab">
                        <i class="fa fa-sign-in-alt fa-fw mr5"></i><strong>{__("General")}</strong>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#Social" data-toggle="tab">
                        <i class="fab fa-facebook fa-fw mr5"></i><strong>{__("Social Login")}</strong>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#Invitation" data-toggle="tab">
                        <i class="far fa-handshake fa-fw mr5"></i><strong>{__("Invitation Codes")}</strong>
                    </a>
                </li>
            </ul>
            <!-- panel nav -->
        </div>
        <!-- card-header -->

        <!-- tabs content -->
        <div class="tab-content">
            <!-- General -->
            <div class="tab-pane active" id="General">
                <form class="js_ajax-forms " data-url="admin/settings.php?edit=registration">
                    <div class="card-body">
                        <div class="alert alert-warning">
                            <div class="icon">
                                <i class="fa fa-exclamation-triangle fa-2x"></i>
                            </div>
                            <div class="text pt5">
                                {__("If Registration is Free and Pro Packages enabled they will be used as an optional upgrading plans")}.
                            </div>
                        </div>
                        <div class="form-table-row">
                            <div>
                                <div class="form-control-label h6">{__("Registration Enabled")}</div>
                                <div class="form-text d-none d-sm-block">{__("Allow users to create accounts")}</div>
                            </div>
                            <div class="text-right">
                                <label class="switch" for="registration_enabled">
                                    <input type="checkbox" name="registration_enabled" id="registration_enabled" {if $system['registration_enabled']}checked{/if}>
                                    <span class="slider round"></span>
                                </label>
                            </div>
                        </div>

                        <div class="form-group form-row">
                            <label class="col-md-3 form-control-label">
                                {__("Registration Type")}
                            </label>
                            <div class="col-md-9">
                                <div class="custom-control custom-radio custom-control-inline">
                                    <input type="radio" name="registration_type" id="registration_free" value="free" class="custom-control-input" {if $system['registration_type'] == "free"}checked{/if}>
                                    <label class="custom-control-label" for="registration_free">{__("Free")}</label>
                                </div>
                                <div class="custom-control custom-radio custom-control-inline">
                                    <input type="radio" name="registration_type" id="registration_paid" value="paid" class="custom-control-input" {if $system['registration_type'] == "paid"}checked{/if}>
                                    <label class="custom-control-label" for="registration_paid">{__("Subscriptions Only")}</label>
                                </div>
                                <span class="form-text">
                                    {__("Allow users to create accounts Free or via Subscriptions only")}<br>
                                    {__("Make sure you have configured")} <a href="{$system['system_url']}/{$control_panel['url']}/packages">{__("Pro Packages")}</a>
                                </span>
                            </div>
                        </div>

                        <div class="divider"></div>

                        <div class="form-table-row">
                            <div>
                                <div class="form-control-label h6">{__("Invitation Enabled")}</div>
                                <div class="form-text d-none d-sm-block">{__("This option is used to invite users by sending invitation code only by admin if the registration is turned off")}</div>
                            </div>
                            <div class="text-right">
                                <label class="switch" for="invitation_enabled">
                                    <input type="checkbox" name="invitation_enabled" id="invitation_enabled" {if $system['invitation_enabled']}checked{/if}>
                                    <span class="slider round"></span>
                                </label>
                            </div>
                        </div>

                        <div class="form-table-row">
                            <div>
                                <div class="form-control-label h6">{__("Invite Friends Widget")}</div>
                                <div class="form-text d-none d-sm-block">{__("Enable users to invite their friends by sending invitation emails (registration must be enabled)")}</div>
                            </div>
                            <div class="text-right">
                                <label class="switch" for="invitation_widget_enabled">
                                    <input type="checkbox" name="invitation_widget_enabled" id="invitation_widget_enabled" {if $system['invitation_widget_enabled']}checked{/if}>
                                    <span class="slider round"></span>
                                </label>
                            </div>
                        </div>

                        <div class="form-group form-row">
                            <label class="col-md-3 form-control-label">
                                {__("Invitations/Day")}
                            </label>
                            <div class="col-md-9">
                                <input type="text" class="form-control" name="invitation_widget_max" value="{$system['invitation_widget_max']}">
                                <span class="form-text">
                                    {__("Number of invitations allowed to each user per day (0 for unlimited)")}
                                </span>
                            </div>
                        </div>

                        <div class="divider"></div>

                        <div class="form-table-row">
                            <div>
                                <div class="form-control-label h6">{__("Pro Packages Enabled")}</div>
                                <div class="form-text d-none d-sm-block">
                                    {__("Enable pro packages to be used as upgrading plans or for subscriptions")}<br>
                                    {__("Make sure you have configured")} <a href="{$system['system_url']}/{$control_panel['url']}/settings/payments">{__("Payments Settings")}</a>
                                </div>
                            </div>
                            <div class="text-right">
                                <label class="switch" for="packages_enabled">
                                    <input type="checkbox" name="packages_enabled" id="packages_enabled" {if $system['packages_enabled']}checked{/if}>
                                    <span class="slider round"></span>
                                </label>
                            </div>
                        </div>

                        <div class="form-table-row">
                            <div>
                                <div class="form-control-label h6">{__("Users Can Buy Packages From Wallet Balance")}</div>
                                <div class="form-text d-none d-sm-block">
                                    {__("Enable users to buy packages from their wallet balance")}<br>
                                    {__("Make sure you have enabled")} <a href="{$system['system_url']}/{$control_panel['url']}/ads">{__("Ads System")}</a>
                                </div>
                            </div>
                            <div class="text-right">
                                <label class="switch" for="packages_wallet_payment_enabled">
                                    <input type="checkbox" name="packages_wallet_payment_enabled" id="packages_wallet_payment_enabled" {if $system['packages_wallet_payment_enabled']}checked{/if}>
                                    <span class="slider round"></span>
                                </label>
                            </div>
                        </div>

                        <div class="divider"></div>

                        <div class="form-table-row">
                            <div>
                                <div class="form-control-label h6">{__("Activation Enabled")}</div>
                                <div class="form-text d-none d-sm-block">{__("Enable account activation to send activation code to user's email/phone")}</div>
                            </div>
                            <div class="text-right">
                                <label class="switch" for="activation_enabled">
                                    <input type="checkbox" name="activation_enabled" id="activation_enabled" {if $system['activation_enabled']}checked{/if}>
                                    <span class="slider round"></span>
                                </label>
                            </div>
                        </div>

                        <div class="form-group form-row">
                            <label class="col-md-3 form-control-label">
                                {__("Activation Via")}
                            </label>
                            <div class="col-md-9">
                                <div class="custom-control custom-radio custom-control-inline">
                                    <input type="radio" name="activation_type" id="activation_email" value="email" class="custom-control-input" {if $system['activation_type'] == "email"}checked{/if}>
                                    <label class="custom-control-label" for="activation_email">{__("Email")}</label>
                                </div>
                                <div class="custom-control custom-radio custom-control-inline">
                                    <input type="radio" name="activation_type" id="activation_sms" value="sms" class="custom-control-input" {if $system['activation_type'] == "sms"}checked{/if}>
                                    <label class="custom-control-label" for="activation_sms">{__("SMS")}</label>
                                </div>
                                <span class="form-text">
                                    {__("Select Email or SMS activation to send activation code to user's email/phone")}<br>
                                    {__("Make sure you have configured")} <a href="{$system['system_url']}/{$control_panel['url']}/settings/sms">{__("SMS Settings")}</a>
                                </span>
                            </div>
                        </div>

                        <div class="divider"></div>

                        <div class="form-table-row">
                            <div>
                                <div class="form-control-label h6">{__("Verification Requests")}</div>
                                <div class="form-text d-none d-sm-block">{__("Turn the verification requests from users & pages On and Off")}</div>
                            </div>
                            <div class="text-right">
                                <label class="switch" for="verification_requests">
                                    <input type="checkbox" name="verification_requests" id="verification_requests" {if $system['verification_requests']}checked{/if}>
                                    <span class="slider round"></span>
                                </label>
                            </div>
                        </div>

                        <div class="divider"></div>

                        <div class="form-table-row">
                            <div>
                                <div class="form-control-label h6">{__("Age Restriction")}</div>
                                <div class="form-text d-none d-sm-block">{__("Enable/Disable age restriction")}</div>
                            </div>
                            <div class="text-right">
                                <label class="switch" for="age_restriction">
                                    <input type="checkbox" name="age_restriction" id="age_restriction" {if $system['age_restriction']}checked{/if}>
                                    <span class="slider round"></span>
                                </label>
                            </div>
                        </div>

                        <div class="form-group form-row">
                            <label class="col-md-3 form-control-label">
                                {__("Minimum Age")}
                            </label>
                            <div class="col-md-9">
                                <input type="text" class="form-control" name="minimum_age" value="{$system['minimum_age']}">
                                <span class="form-text">
                                    {__("The minimum age required to register (in years)")}
                                </span>
                            </div>
                        </div>

                        <div class="divider"></div>

                        <div class="form-table-row">
                            <div>
                                <div class="form-control-label h6">{__("Getting Started")}</div>
                                <div class="form-text d-none d-sm-block">{__("Enable/Disable getting started page after registration")}</div>
                            </div>
                            <div class="text-right">
                                <label class="switch" for="getting_started">
                                    <input type="checkbox" name="getting_started" id="getting_started" {if $system['getting_started']}checked{/if}>
                                    <span class="slider round"></span>
                                </label>
                            </div>
                        </div>

                        <div class="form-table-row">
                            <div>
                                <div class="form-control-label h6">{__("Delete Account")} ({__("GDPR")})</div>
                                <div class="form-text d-none d-sm-block">{__("Allow users to delete their account")}</div>
                            </div>
                            <div class="text-right">
                                <label class="switch" for="delete_accounts_enabled">
                                    <input type="checkbox" name="delete_accounts_enabled" id="delete_accounts_enabled" {if $system['delete_accounts_enabled']}checked{/if}>
                                    <span class="slider round"></span>
                                </label>
                            </div>
                        </div>

                        <div class="form-table-row">
                            <div>
                                <div class="form-control-label h6">{__("Download User Information")} ({__("GDPR")})</div>
                                <div class="form-text d-none d-sm-block">{__("Allow users to download their account information from settings page")}</div>
                            </div>
                            <div class="text-right">
                                <label class="switch" for="download_info_enabled">
                                    <input type="checkbox" name="download_info_enabled" id="download_info_enabled" {if $system['download_info_enabled']}checked{/if}>
                                    <span class="slider round"></span>
                                </label>
                            </div>
                        </div>

                        <div class="form-table-row">
                            <div>
                                <div class="form-control-label h6">{__("Newsletter Consent")} ({__("GDPR")})</div>
                                <div class="form-text d-none d-sm-block">{__("Enable/Disable newsletter consent during the registration")}</div>
                            </div>
                            <div class="text-right">
                                <label class="switch" for="newsletter_consent">
                                    <input type="checkbox" name="newsletter_consent" id="newsletter_consent" {if $system['newsletter_consent']}checked{/if}>
                                    <span class="slider round"></span>
                                </label>
                            </div>
                        </div>

                        <div class="divider"></div>

                        <div class="form-group form-row">
                            <label class="col-md-3 form-control-label">
                                {__("Max Accounts/IP")}
                            </label>
                            <div class="col-md-9">
                                <input type="text" class="form-control" name="max_accounts" value="{$system['max_accounts']}">
                                <span class="form-text">
                                    {__("The Maximum number of accounts allowed to register per IP (0 for unlimited)")}
                                </span>
                            </div>
                        </div>

                        <div class="form-group form-row">
                            <label class="col-md-3 form-control-label">
                                {__("Max Friends/User")}
                            </label>
                            <div class="col-md-9">
                                <input type="text" class="form-control" name="max_friends" value="{$system['max_friends']}">
                                <span class="form-text">
                                    {__("The Maximum number of friends allowed per User (0 for unlimited)")}
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
            </div>
            <!-- General -->

            <!-- Social -->
            <div class="tab-pane" id="Social">
                <form class="js_ajax-forms " data-url="admin/settings.php?edit=social_login">
                    <div class="card-body">
                        <div class="form-table-row">
                            <div>
                                <div class="form-control-label h6">{__("Social Logins")}</div>
                                <div class="form-text d-none d-sm-block">{__("Turn registration/login via social media (Facebook, Twitter and etc) On and Off")}</div>
                            </div>
                            <div class="text-right">
                                <label class="switch" for="social_login_enabled">
                                    <input type="checkbox" name="social_login_enabled" id="social_login_enabled" {if $system['social_login_enabled']}checked{/if}>
                                    <span class="slider round"></span>
                                </label>
                            </div>
                        </div>

                        <div class="divider"></div>

                        <!-- facebook -->
                        <div class="form-table-row">
                            <div class="avatar">
                                <i class="fab fa-facebook-square fa-3x" style="color: #3B579D"></i>
                            </div>
                            <div>
                                <div class="form-control-label h6 mb5">{__("Facebook")}</div>
                                <div class="form-text d-none d-sm-block">{__("Turn registration/login via Facebook On and Off")}</div>
                            </div>
                            <div class="text-right">
                                <label class="switch" for="facebook_login_enabled">
                                    <input type="checkbox" name="facebook_login_enabled" id="facebook_login_enabled" {if $system['facebook_login_enabled']}checked{/if}>
                                    <span class="slider round"></span>
                                </label>
                            </div>
                        </div>

                        <div class="form-group form-row">
                            <label class="col-md-3 form-control-label">
                                {__("Facebook App ID")}
                            </label>
                            <div class="col-md-9">
                                <input type="text" class="form-control" name="facebook_appid" value="{$system['facebook_appid']}">
                            </div>
                        </div>

                        <div class="form-group form-row">
                            <label class="col-md-3 form-control-label">
                                {__("Facebook App Secret")}
                            </label>
                            <div class="col-md-9">
                                <input type="text" class="form-control" name="facebook_secret" value="{$system['facebook_secret']}">
                            </div>
                        </div>
                        <!-- facebook -->

                        <div class="divider"></div>

                        <!-- google -->
                        <div class="form-table-row">
                            <div class="avatar">
                                <i class="fab fa-google fa-3x" style="color: #DC4A38"></i>
                            </div>
                            <div>
                                <div class="form-control-label h6 mb5">{__("Google")}</div>
                                <div class="form-text d-none d-sm-block">{__("Turn registration/login via Google On and Off")}</div>
                            </div>
                            <div class="text-right">
                                <label class="switch" for="google_login_enabled">
                                    <input type="checkbox" name="google_login_enabled" id="google_login_enabled" {if $system['google_login_enabled']}checked{/if}>
                                    <span class="slider round"></span>
                                </label>
                            </div>
                        </div>

                        <div class="form-group form-row">
                            <label class="col-md-3 form-control-label">
                                {__("Google App ID")}
                            </label>
                            <div class="col-md-9">
                                <input type="text" class="form-control" name="google_appid" value="{$system['google_appid']}">
                            </div>
                        </div>

                        <div class="form-group form-row">
                            <label class="col-md-3 form-control-label">
                                {__("Google App Secret")}
                            </label>
                            <div class="col-md-9">
                                <input type="text" class="form-control" name="google_secret" value="{$system['google_secret']}">
                            </div>
                        </div>
                        <!-- google -->

                        <div class="divider"></div>

                        <!-- twitter -->
                        <div class="form-table-row">
                            <div class="avatar">
                                <i class="fab fa-twitter-square fa-3x" style="color: #55ACEE"></i>
                            </div>
                            <div>
                                <div class="form-control-label h6 mb5">{__("Twitter")}</div>
                                <div class="form-text d-none d-sm-block">{__("Turn registration/login via Twitter On and Off")}</div>
                            </div>
                            <div class="text-right">
                                <label class="switch" for="twitter_login_enabled">
                                    <input type="checkbox" name="twitter_login_enabled" id="twitter_login_enabled" {if $system['twitter_login_enabled']}checked{/if}>
                                    <span class="slider round"></span>
                                </label>
                            </div>
                        </div>

                        <div class="form-group form-row">
                            <label class="col-md-3 form-control-label">
                                {__("Twitter App ID")}
                            </label>
                            <div class="col-md-9">
                                <input type="text" class="form-control" name="twitter_appid" value="{$system['twitter_appid']}">
                            </div>
                        </div>

                        <div class="form-group form-row">
                            <label class="col-md-3 form-control-label">
                                {__("Twitter App Secret")}
                            </label>
                            <div class="col-md-9">
                                <input type="text" class="form-control" name="twitter_secret" value="{$system['twitter_secret']}">
                            </div>
                        </div>
                        <!-- twitter -->

                        <div class="divider"></div>

                        <!-- instagram -->
                        <div class="form-table-row">
                            <div class="avatar">
                                <i class="fab fa-instagram fa-3x" style="color: #3f729b"></i>
                            </div>
                            <div>
                                <div class="form-control-label h6 mb5">{__("Instagram")}</div>
                                <div class="form-text d-none d-sm-block">{__("Turn registration/login via Instagram On and Off")}</div>
                            </div>
                            <div class="text-right">
                                <label class="switch" for="instagram_login_enabled">
                                    <input type="checkbox" name="instagram_login_enabled" id="instagram_login_enabled" {if $system['instagram_login_enabled']}checked{/if}>
                                    <span class="slider round"></span>
                                </label>
                            </div>
                        </div>

                        <div class="form-group form-row">
                            <label class="col-md-3 form-control-label">
                                {__("Instagram App ID")}
                            </label>
                            <div class="col-md-9">
                                <input type="text" class="form-control" name="instagram_appid" value="{$system['instagram_appid']}">
                            </div>
                        </div>

                        <div class="form-group form-row">
                            <label class="col-md-3 form-control-label">
                                {__("Instagram App Secret")}
                            </label>
                            <div class="col-md-9">
                                <input type="text" class="form-control" name="instagram_secret" value="{$system['instagram_secret']}">
                            </div>
                        </div>
                        <!-- instagram -->

                        <div class="divider"></div>

                        <!-- linkedin -->
                        <div class="form-table-row">
                            <div class="avatar">
                                <i class="fab fa-linkedin fa-3x" style="color: #1A84BC"></i>
                            </div>
                            <div>
                                <div class="form-control-label h6 mb5">{__("Linkedin")}</div>
                                <div class="form-text d-none d-sm-block">{__("Turn registration/login via Linkedin On and Off")}</div>
                            </div>
                            <div class="text-right">
                                <label class="switch" for="linkedin_login_enabled">
                                    <input type="checkbox" name="linkedin_login_enabled" id="linkedin_login_enabled" {if $system['linkedin_login_enabled']}checked{/if}>
                                    <span class="slider round"></span>
                                </label>
                            </div>
                        </div>

                        <div class="form-group form-row">
                            <label class="col-md-3 form-control-label">
                                {__("Linkedin App ID")}
                            </label>
                            <div class="col-md-9">
                                <input type="text" class="form-control" name="linkedin_appid" value="{$system['linkedin_appid']}">
                            </div>
                        </div>

                        <div class="form-group form-row">
                            <label class="col-md-3 form-control-label">
                                {__("Linkedin App Secret")}
                            </label>
                            <div class="col-md-9">
                                <input type="text" class="form-control" name="linkedin_secret" value="{$system['linkedin_secret']}">
                            </div>
                        </div>
                        <!-- linkedin -->

                        <div class="divider"></div>

                        <!-- vk -->
                        <div class="form-table-row">
                            <div class="avatar">
                                <i class="fab fa-vk fa-3x" style="color: #527498"></i>
                            </div>
                            <div>
                                <div class="form-control-label h6 mb5">{__("Vkontakte")}</div>
                                <div class="form-text d-none d-sm-block">{__("Turn registration/login via Vkontakte On and Off")}</div>
                            </div>
                            <div class="text-right">
                                <label class="switch" for="vkontakte_login_enabled">
                                    <input type="checkbox" name="vkontakte_login_enabled" id="vkontakte_login_enabled" {if $system['vkontakte_login_enabled']}checked{/if}>
                                    <span class="slider round"></span>
                                </label>
                            </div>
                        </div>

                        <div class="form-group form-row">
                            <label class="col-md-3 form-control-label">
                                {__("Vkontakte App ID")}
                            </label>
                            <div class="col-md-9">
                                <input type="text" class="form-control" name="vkontakte_appid" value="{$system['vkontakte_appid']}">
                            </div>
                        </div>

                        <div class="form-group form-row">
                            <label class="col-md-3 form-control-label">
                                {__("Vkontakte App Secret")}
                            </label>
                            <div class="col-md-9">
                                <input type="text" class="form-control" name="vkontakte_secret" value="{$system['vkontakte_secret']}">
                            </div>
                        </div>
                        <!-- vk -->

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
            </div>
            <!-- Social -->

            <!-- Invitation -->
            <div class="tab-pane" id="Invitation">
                <div class="card-body">
                    <div class="alert alert-warning">
                        <div class="icon">
                            <i class="fa fa-exclamation-triangle fa-2x"></i>
                        </div>
                        <div class="text pt5">
                            {__("This system is used to invite users if the registration is turned off")}.
                        </div>
                    </div>

                    <div class="text-center">
                        <button data-toggle="modal" data-url="admin/invitations.php?do=generate" class="btn btn-md btn-success">
                            <i class="fa fa-handshake mr10"></i>{__("Generate New Code")}
                        </button>
                    </div>
                    <div class="divider"></div>
                    <div class="table-responsive">
                        <table class="table table-striped table-bordered table-hover js_dataTable">
                            <thead>
                                <tr>
                                    <th>{__("ID")}</th>
                                    <th>{__("Invitation Code")}</th>
                                    <th>{__("Valid")}</th>
                                    <th>{__("Created")}</th>
                                    <th>{__("Actions")}</th>
                                </tr>
                            </thead>
                            <tbody>
                                {foreach $rows as $row}
                                    <tr>
                                        <td>{$row['code_id']}</td>
                                        <td><span class="label label-default">{$row['code']}</span></td>
                                        <td>
                                            {if $row['valid']}
                                                <span class="badge badge-pill badge-lg badge-success">{__("Yes")}</span>
                                            {else}
                                                <span class="badge badge-pill badge-lg badge-danger">{__("No")}</span>
                                            {/if}
                                        </td>
                                        <td>{$row['date']|date_format:"%e %B %Y"}</td>
                                        <td>
                                            <div class="d-inline-block" data-toggle="tooltip" data-placement="top" title='{__("Send to email")}'>
                                                <button data-toggle="modal" data-url="admin/invitations.php?do=prepare_email&code={$row['code']}" class="btn btn-sm btn-icon btn-rounded btn-primary">
                                                    <i class="fa fa-envelope"></i>
                                                </button>
                                            </div>
                                            <button data-toggle="tooltip" data-placement="top" title='{__("Delete")}' class="btn btn-sm btn-icon btn-rounded btn-danger js_admin-deleter" data-handle="invitation_code" data-id="{$row['code_id']}">
                                                <i class="fa fa-trash-alt"></i>
                                            </button>
                                        </td>
                                    </tr>
                                {/foreach}
                            </tbody>
                        </table>
                    </div>
                </div>
                <!-- Invitation -->
            </div>
        </div>
        <!-- tabs content -->

    {elseif $sub_view == "emails"}

        <!-- card-header -->
        <div class="card-header with-icon with-nav">
            <!-- panel title -->
            <div class="mb20">
                <i class="fa fa-cog mr10"></i>{__("Settings")} &rsaquo; {__("Emails")}
            </div>
            <!-- panel title -->

            <!-- panel nav -->
            <ul class="nav nav-tabs">
                <li class="nav-item">
                    <a class="nav-link active" href="#SMTP" data-toggle="tab">
                        <i class="fa fa-server fa-fw mr5"></i><strong>{__("SMTP")}</strong>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#Notifications" data-toggle="tab">
                        <i class="fa fa-envelope-open fa-fw mr5"></i><strong>{__("Email Notifications")}</strong>
                    </a>
                </li>
            </ul>
            <!-- panel nav -->
        </div>
        <!-- card-header -->

        <!-- tabs content -->
        <div class="tab-content">
            <!-- SMTP -->
            <div class="tab-pane active" id="SMTP">
                <form class="js_ajax-forms " data-url="admin/settings.php?edit=emails">
                    <div class="card-body">
                        <div class="form-table-row">
                            <div>
                                <div class="form-control-label h6">{__("SMTP Emails")}</div>
                                <div class="form-text d-none d-sm-block">
                                    {__("Enable/Disable SMTP email system")}<br/>
                                    {__("PHP mail() function will be used in case of disabled")}
                                </div>
                            </div>
                            <div class="text-right">
                                <label class="switch" for="email_smtp_enabled">
                                    <input type="checkbox" name="email_smtp_enabled" id="email_smtp_enabled" {if $system['email_smtp_enabled']}checked{/if}>
                                    <span class="slider round"></span>
                                </label>
                            </div>
                        </div>

                        <div class="form-table-row">
                            <div>
                                <div class="form-control-label h6">{__("SMTP Require Authentication")}</div>
                                <div class="form-text d-none d-sm-block">{__("Enable/Disable SMTP authentication")}</div>
                            </div>
                            <div class="text-right">
                                <label class="switch" for="email_smtp_authentication">
                                    <input type="checkbox" name="email_smtp_authentication" id="email_smtp_authentication" {if $system['email_smtp_authentication']}checked{/if}>
                                    <span class="slider round"></span>
                                </label>
                            </div>
                        </div>

                        <div class="form-table-row">
                            <div>
                                <div class="form-control-label h6">{__("SMTP SSL Encryption")}</div>
                                <div class="form-text d-none d-sm-block">
                                    {__("Enable/Disable SMTP SSL encryption")}<br/>
                                    {__("TLS encryption will be used in case of disabled")}
                                </div>
                            </div>
                            <div class="text-right">
                                <label class="switch" for="email_smtp_ssl">
                                    <input type="checkbox" name="email_smtp_ssl" id="email_smtp_ssl" {if $system['email_smtp_ssl']}checked{/if}>
                                    <span class="slider round"></span>
                                </label>
                            </div>
                        </div>

                        <div class="form-group form-row">
                            <label class="col-md-3 form-control-label">
                                {__("SMTP Server")}
                            </label>
                            <div class="col-md-9">
                                <input type="text" class="form-control" name="email_smtp_server" value="{$system['email_smtp_server']}">
                            </div>
                        </div>

                        <div class="form-group form-row">
                            <label class="col-md-3 form-control-label">
                                {__("SMTP Port")}
                            </label>
                            <div class="col-md-9">
                                <input type="text" class="form-control" name="email_smtp_port" value="{$system['email_smtp_port']}">
                            </div>
                        </div>

                        <div class="form-group form-row">
                            <label class="col-md-3 form-control-label">
                                {__("SMTP Username")}
                            </label>
                            <div class="col-md-9">
                                <input type="text" class="form-control" name="email_smtp_username" value="{$system['email_smtp_username']}">
                            </div>
                        </div>

                        <div class="form-group form-row">
                            <label class="col-md-3 form-control-label">
                                {__("SMTP Password")}
                            </label>
                            <div class="col-md-9">
                                <input type="text" class="form-control" name="email_smtp_password" value="{$system['email_smtp_password']}">
                            </div>
                        </div>

                        <div class="form-group form-row">
                            <label class="col-md-3 form-control-label">
                                {__("Set From")}
                            </label>
                            <div class="col-md-9">
                                <input type="text" class="form-control" name="email_smtp_setfrom" value="{$system['email_smtp_setfrom']}">
                                <span class="form-text">
                                    {__("Set the From email address")}, {__("For example: email@domain.com")}
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
                        <button type="button" class="btn btn-danger js_admin-tester" data-handle="smtp">
                            <i class="fa fa-bolt mr10"></i>{__("Test Connection")}
                        </button>
                        <button type="submit" class="btn btn-primary">{__("Save Changes")}</button>
                    </div>
                </form>
            </div>
            <!-- SMTP -->

            <!-- Notifications -->
            <div class="tab-pane" id="Notifications">
                <form class="js_ajax-forms " data-url="admin/settings.php?edit=email_notifications">
                    <div class="card-body">
                        <div class="form-table-row">
                            <div>
                                <div class="form-control-label h6">{__("Email Notifications")}</div>
                                <div class="form-text d-none d-sm-block">{__("Enable/Disable email notifications system")}</div>
                            </div>
                            <div class="text-right">
                                <label class="switch" for="email_notifications">
                                    <input type="checkbox" name="email_notifications" id="email_notifications" {if $system['email_notifications']}checked{/if}>
                                    <span class="slider round"></span>
                                </label>
                            </div>
                        </div>

                        <div class="form-group form-row">
                            <label class="col-md-3 form-control-label">
                                {__("Email User When")}
                            </label>
                            <div class="col-md-9">
                                <div class="custom-control custom-checkbox">
                                    <input type="checkbox" class="custom-control-input" name="email_post_likes" id="email_post_likes" {if $system['email_post_likes']}checked{/if}>
                                    <label class="custom-control-label" for="email_post_likes">{__("Someone liked his post")}</label>
                                </div>
                                <div class="custom-control custom-checkbox">
                                    <input type="checkbox" class="custom-control-input" name="email_post_comments" id="email_post_comments" {if $system['email_post_comments']}checked{/if}>
                                    <label class="custom-control-label" for="email_post_comments">{__("Someone commented on his post")}</label>
                                </div>
                                <div class="custom-control custom-checkbox">
                                    <input type="checkbox" class="custom-control-input" name="email_post_shares" id="email_post_shares" {if $system['email_post_shares']}checked{/if}>
                                    <label class="custom-control-label" for="email_post_shares">{__("Someone shared his post")}</label>
                                </div>
                                <div class="custom-control custom-checkbox">
                                    <input type="checkbox" class="custom-control-input" name="email_wall_posts" id="email_wall_posts" {if $system['email_wall_posts']}checked{/if}>
                                    <label class="custom-control-label" for="email_wall_posts">{__("Someone posted on his timeline")}</label>
                                </div>
                                <div class="custom-control custom-checkbox">
                                    <input type="checkbox" class="custom-control-input" name="email_mentions" id="email_mentions" {if $system['email_mentions']}checked{/if}>
                                    <label class="custom-control-label" for="email_mentions">{__("Someone mentioned him")}</label>
                                </div>
                                <div class="custom-control custom-checkbox">
                                    <input type="checkbox" class="custom-control-input" name="email_profile_visits" id="email_profile_visits" {if $system['email_profile_visits']}checked{/if}>
                                    <label class="custom-control-label" for="email_profile_visits">{__("Someone visited his profile")}</label>
                                </div>
                                <div class="custom-control custom-checkbox">
                                    <input type="checkbox" class="custom-control-input" name="email_friend_requests" id="email_friend_requests" {if $system['email_friend_requests']}checked{/if}>
                                    <label class="custom-control-label" for="email_friend_requests">{__("Someone sent him or accepted his friend requset")}</label>
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
            </div>
            <!-- Notifications -->
        </div>
        <!-- tabs content -->

    {elseif $sub_view == "sms"}

        <!-- card-header -->
        <div class="card-header with-icon">
            <!-- panel title -->
            <i class="fa fa-cog mr10"></i>{__("Settings")} &rsaquo; {__("SMS")}
            <!-- panel title -->
        </div>
        <!-- card-header -->

        <!-- SMS -->
        <form class="js_ajax-forms " data-url="admin/settings.php?edit=sms">
            <div class="card-body">

                <div class="form-group form-row">
                    <label class="col-md-3 form-control-label">
                        {__("SMS Provider")}
                    </label>
                    <div class="col-md-9">
                        <div class="custom-control custom-radio custom-control-inline">
                            <input type="radio" name="sms_provider" id="sms_twilio" value="twilio" class="custom-control-input" {if $system['sms_provider'] == "twilio"}checked{/if}>
                            <label class="custom-control-label" for="sms_twilio">{__("Twilio")}</label>
                        </div>
                        <div class="custom-control custom-radio custom-control-inline">
                            <input type="radio" name="sms_provider" id="sms_bulksms" value="bulksms" class="custom-control-input" {if $system['sms_provider'] == "bulksms"}checked{/if}>
                            <label class="custom-control-label" for="sms_bulksms">{__("BulkSMS")}</label>
                        </div>
                        <div class="custom-control custom-radio custom-control-inline">
                            <input type="radio" name="sms_provider" id="sms_infobip" value="infobip" class="custom-control-input" {if $system['sms_provider'] == "infobip"}checked{/if}>
                            <label class="custom-control-label" for="sms_infobip">{__("Infobip")}</label>
                        </div>
                        <span class="form-text">
                            {__("Select your default SMS provider")}<br/>
                        </span>
                    </div>
                </div>

                <div class="divider"></div>

                <!-- Twilio -->
                <div class="heading-small mb20">
                    {__("Twilio")}
                </div>
                <div class="pl-md-4">
                    <div class="form-group form-row">
                        <label class="col-md-3 form-control-label">
                            {__("Twilio Account SID")}
                        </label>
                        <div class="col-md-9">
                            <input type="text" class="form-control" name="twilio_sid" value="{$system['twilio_sid']}">
                        </div>
                    </div>

                    <div class="form-group form-row">
                        <label class="col-md-3 form-control-label">
                            {__("Twilio Auth Token")}
                        </label>
                        <div class="col-md-9">
                            <input type="text" class="form-control" name="twilio_token" value="{$system['twilio_token']}">
                        </div>
                    </div>

                    <div class="form-group form-row">
                        <label class="col-md-3 form-control-label">
                            {__("Twilio Phone Number")}
                        </label>
                        <div class="col-md-9">
                            <input type="text" class="form-control" name="twilio_phone" value="{$system['twilio_phone']}">
                        </div>
                    </div>
                </div>
                <!-- Twilio -->

                <div class="divider"></div>

                <!-- BulkSMS -->
                <div class="heading-small mb20">
                    {__("BulkSMS")}
                </div>
                <div class="pl-md-4">
                    <div class="form-group form-row">
                        <label class="col-md-3 form-control-label">
                            {__("BulkSMS Username")}
                        </label>
                        <div class="col-md-9">
                            <input type="text" class="form-control" name="bulksms_username" value="{$system['bulksms_username']}">
                        </div>
                    </div>

                    <div class="form-group form-row">
                        <label class="col-md-3 form-control-label">
                            {__("BulkSMS Password")}
                        </label>
                        <div class="col-md-9">
                            <input type="text" class="form-control" name="bulksms_password" value="{$system['bulksms_password']}">
                        </div>
                    </div>
                </div>
                <!-- BulkSMS -->

                <div class="divider"></div>

                <!-- Infobip -->
                <div class="heading-small mb20">
                    {__("Infobip")}
                </div>
                <div class="pl-md-4">
                    <div class="form-group form-row">
                        <label class="col-md-3 form-control-label">
                            {__("Infobip Username")}
                        </label>
                        <div class="col-md-9">
                            <input type="text" class="form-control" name="infobip_username" value="{$system['infobip_username']}">
                        </div>
                    </div>

                    <div class="form-group form-row">
                        <label class="col-md-3 form-control-label">
                            {__("Infobip Password")}
                        </label>
                        <div class="col-md-9">
                            <input type="text" class="form-control" name="infobip_password" value="{$system['infobip_password']}">
                        </div>
                    </div>
                </div>
                <!-- Infobip -->

                <div class="divider"></div>

                <div class="form-group form-row">
                    <label class="col-md-3 form-control-label">
                        {__("Test Phone Number")}
                    </label>
                    <div class="col-md-9">
                        <input type="text" class="form-control" name="system_phone" value="{$system['system_phone']}">
                        <span class="form-text">
                            {__("Your phone number to test the SMS service i.e +12344567890")}<br/>
                            {__("A test SMS will be sent to this phone number when you test the connection")}
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
                <button type="button" class="btn btn-danger js_admin-tester" data-handle="sms">
                    <i class="fa fa-bolt mr10"></i>{__("Test Connection")}
                </button>
                <button type="submit" class="btn btn-primary">{__("Save Changes")}</button>
            </div>
        </form>
        <!-- SMS -->

    {elseif $sub_view == "chat"}

        <!-- card-header -->
        <div class="card-header with-icon">
            <!-- panel title -->
            <i class="fa fa-cog mr10"></i>{__("Settings")} &rsaquo; {__("Chat")}
            <!-- panel title -->
        </div>
        <!-- card-header -->

        <!-- Chat -->
        <form class="js_ajax-forms " data-url="admin/settings.php?edit=chat">
            <div class="card-body">
                <div class="form-table-row">
                    <div>
                        <div class="form-control-label h6">{__("Chat Enabled")}</div>
                        <div class="form-text d-none d-sm-block">{__("Turn the chat system On and Off")}</div>
                    </div>
                    <div class="text-right">
                        <label class="switch" for="chat_enabled">
                            <input type="checkbox" name="chat_enabled" id="chat_enabled" {if $system['chat_enabled']}checked{/if}>
                            <span class="slider round"></span>
                        </label>
                    </div>
                </div>

                <div class="form-table-row">
                    <div>
                        <div class="form-control-label h6">{__("User Status Enabled")}</div>
                        <div class="form-text d-none d-sm-block">{__("Turn the Last Seen On and Off")}</div>
                    </div>
                    <div class="text-right">
                        <label class="switch" for="chat_status_enabled">
                            <input type="checkbox" name="chat_status_enabled" id="chat_status_enabled" {if $system['chat_status_enabled']}checked{/if}>
                            <span class="slider round"></span>
                        </label>
                    </div>
                </div>

                <div class="form-table-row">
                    <div>
                        <div class="form-control-label h6">{__("Typing Status Enabled")}</div>
                        <div class="form-text d-none d-sm-block">{__("Turn the Typing Status On and Off")}</div>
                    </div>
                    <div class="text-right">
                        <label class="switch" for="chat_typing_enabled">
                            <input type="checkbox" name="chat_typing_enabled" id="chat_typing_enabled" {if $system['chat_typing_enabled']}checked{/if}>
                            <span class="slider round"></span>
                        </label>
                    </div>
                </div>

                <div class="form-table-row">
                    <div>
                        <div class="form-control-label h6">{__("Seen Status Enabled")}</div>
                        <div class="form-text d-none d-sm-block">{__("Turn the Seen Status On and Off")}</div>
                    </div>
                    <div class="text-right">
                        <label class="switch" for="chat_seen_enabled">
                            <input type="checkbox" name="chat_seen_enabled" id="chat_seen_enabled" {if $system['chat_seen_enabled']}checked{/if}>
                            <span class="slider round"></span>
                        </label>
                    </div>
                </div>

                <div class="divider"></div>

                <div class="form-table-row">
                    <div>
                        <div class="form-control-label h6">{__("Video Call Enabled")}</div>
                        <div class="form-text d-none d-sm-block">{__("Turn the video call system On and Off")}</div>
                    </div>
                    <div class="text-right">
                        <label class="switch" for="video_call_enabled">
                            <input type="checkbox" name="video_call_enabled" id="video_call_enabled" {if $system['video_call_enabled']}checked{/if}>
                            <span class="slider round"></span>
                        </label>
                    </div>
                </div>

                <div class="form-table-row">
                    <div>
                        <div class="form-control-label h6">{__("Audio Call Enabled")}</div>
                        <div class="form-text d-none d-sm-block">{__("Turn the audio call system On and Off")}</div>
                    </div>
                    <div class="text-right">
                        <label class="switch" for="audio_call_enabled">
                            <input type="checkbox" name="audio_call_enabled" id="audio_call_enabled" {if $system['audio_call_enabled']}checked{/if}>
                            <span class="slider round"></span>
                        </label>
                    </div>
                </div>


                <div class="form-group form-row">
                    <label class="col-md-3 form-control-label">
                        {__("Twilio Account SID")}
                    </label>
                    <div class="col-md-9">
                        <input type="text" class="form-control" name="twilio_sid" value="{$system['twilio_sid']}">
                    </div>
                </div>

                <div class="form-group form-row">
                    <label class="col-md-3 form-control-label">
                        {__("Twilio API SID")}
                    </label>
                    <div class="col-md-9">
                        <input type="text" class="form-control" name="twilio_apisid" value="{$system['twilio_apisid']}">
                    </div>
                </div>

                <div class="form-group form-row">
                    <label class="col-md-3 form-control-label">
                        {__("Twilio API SECRET")}
                    </label>
                    <div class="col-md-9">
                        <input type="text" class="form-control" name="twilio_apisecret" value="{$system['twilio_apisecret']}">
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
        <!-- Chat -->

    {elseif $sub_view == "uploads"}

        <!-- card-header -->
        <div class="card-header with-icon with-nav">
            <!-- panel title -->
            <div class="mb20">
                <i class="fa fa-cog mr10"></i>{__("Settings")} &rsaquo; {__("Uploads")}
            </div>
            <!-- panel title -->

            <!-- panel nav -->
            <ul class="nav nav-tabs">
                <li class="nav-item">
                    <a class="nav-link active" href="#General" data-toggle="tab">
                        <i class="fa fa-upload fa-fw mr5"></i><strong class="pr5">{__("General")}</strong>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#S3" data-toggle="tab">
                        <i class="fab fa-amazon fa-fw mr5"></i><strong class="pr5">{__("Amazon S3")}</strong>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#DigitalOcean" data-toggle="tab">
                        <i class="fab fa-digital-ocean fa-fw mr5"></i><strong class="pr5">{__("DigitalOcean")}</strong>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#FTP" data-toggle="tab">
                        <i class="fa fa-cloud-upload-alt fa-fw mr5"></i><strong class="pr5">{__("FTP")}</strong>
                    </a>
                </li>
            </ul>
            <!-- panel nav -->
        </div>
        <!-- card-header -->

        <!-- tabs content -->
        <div class="tab-content">
            <!-- General -->
            <div class="tab-pane active" id="General">
                <form class="js_ajax-forms " data-url="admin/settings.php?edit=uploads">
                    <div class="card-body">
                        <div class="alert alert-warning">
                            <div class="icon">
                                <i class="fa fa-exclamation-triangle fa-2x"></i>
                            </div>
                            <div class="text">
                                {__("Your server max upload size")} = {$max_upload_size}<br>
                                {__("You can't upload files larger than")} {$max_upload_size} - {__("To upload larger files, contact your hosting provider")}
                            </div>
                        </div>

                        <div class="form-group form-row">
                            <label class="col-md-3 form-control-label">
                                {__("Uploads Directory")}
                            </label>
                            <div class="col-md-9">
                                <input type="text" class="form-control" name="uploads_directory" value="{$system['uploads_directory']}">
                                <span class="form-text">
                                    {__("The path of uploads local directory")}
                                </span>
                            </div>
                        </div>

                        <div class="form-group form-row">
                            <label class="col-md-3 form-control-label">
                                {__("Uploads Prefix")}
                            </label>
                            <div class="col-md-9">
                                <input type="text" class="form-control" name="uploads_prefix" value="{$system['uploads_prefix']}">
                                <span class="form-text">
                                    {__("Add a prefix to the uploaded files (No spaces or special characters only like 'mysite' or 'my_site')")}
                                </span>
                            </div>
                        </div>

                        <div class="divider"></div>

                        <div class="form-group form-row">
                            <label class="col-md-3 form-control-label">
                                {__("Max Profile Photo Size")}
                            </label>
                            <div class="col-md-9">
                                <input type="text" class="form-control" name="max_avatar_size" value="{$system['max_avatar_size']}">
                                <span class="form-text">
                                    {__("The Maximum size of profile photo")} {__("in kilobytes (1 M = 1024 KB)")}
                                </span>
                            </div>
                        </div>

                        <div class="form-group form-row">
                            <label class="col-md-3 form-control-label">
                                {__("Max Cover Photo Size")}
                            </label>
                            <div class="col-md-9">
                                <input type="text" class="form-control" name="max_cover_size" value="{$system['max_cover_size']}">
                                <span class="form-text">
                                    {__("The Maximum size of cover photo")} {__("in kilobytes (1 M = 1024 KB)")}
                                </span>
                            </div>
                        </div>

                        <div class="divider"></div>

                        <div class="form-table-row">
                            <div class="avatar">
                                {include file='__svg_icons.tpl' icon="photos" width="40px" height="40px"}
                            </div>
                            <div>
                                <div class="form-control-label h6 mb5">{__("Photo Upload")}</div>
                                <div class="form-text d-none d-sm-block">{__("Enable photo upload to share & upload photos to the site")}</div>
                            </div>
                            <div class="text-right">
                                <label class="switch" for="photos_enabled">
                                    <input type="checkbox" name="photos_enabled" id="photos_enabled" {if $system['photos_enabled']}checked{/if}>
                                    <span class="slider round"></span>
                                </label>
                            </div>
                        </div>

                        <div class="form-group form-row">
                            <label class="col-md-3 form-control-label">
                                {__("Max Photo Size")}
                            </label>
                            <div class="col-md-9">
                                <input type="text" class="form-control" name="max_photo_size" value="{$system['max_photo_size']}">
                                <span class="form-text">
                                    {__("The Maximum size of uploaded photo in posts")} {__("in kilobytes (1M = 1024KB)")}
                                </span>
                            </div>
                        </div>

                        <div class="form-group form-row">
                            <label class="col-md-3 form-control-label">
                                {__("Photo Quality")}
                            </label>
                            <div class="col-md-9">
                                <select class="form-control selectpicker" name="uploads_quality">
                                    <option value="high" {if $system['uploads_quality'] == "high"}selected{/if} data-content="<div class='option'><div class='icon'><i class='fa fa-battery-full fa-lg fa-fw'></i></div><div class='text'><b>{__('High Quality')}</b><br>{__('High quality photos with low compression')}</div></div>">{__("High Quality")}</option>
                                    <option value="medium" {if $system['uploads_quality'] == "medium"}selected{/if} data-content="<div class='option'><div class='icon'><i class='fa fa-battery-half fa-lg fa-fw'></i></div><div class='text'><b>{__('Medium Quality')}</b><br>{__('Medium quality photos with medium compression')}</div></div>">{__("Medium Quality")}</option>
                                    <option value="low" {if $system['uploads_quality'] == "low"}selected{/if} data-content="<div class='option'><div class='icon'><i class='fa fa-battery-empty fa-lg fa-fw'></i></div><div class='text'><b>{__('Low Quality')}</b><br>{__('Low quality photos with high compression')}</div></div>">{__("Low Quality")}</option>
                                </select>
                            </div>
                        </div>

                        <div class="divider"></div>

                        <div class="form-table-row">
                            <div>
                                <div class="form-control-label h6">{__("Watermark Images")}</div>
                                <div class="form-text d-none d-sm-block">
                                    {__("Enable it to add watermark icon to all uploaded photos (except: profile pictures and cover images)")}
                                </div>
                            </div>
                            <div class="text-right">
                                <label class="switch" for="watermark_enabled">
                                    <input type="checkbox" name="watermark_enabled" id="watermark_enabled" {if $system['watermark_enabled']}checked{/if}>
                                    <span class="slider round"></span>
                                </label>
                            </div>
                        </div>

                        <div class="form-group form-row">
                            <label class="col-md-3 form-control-label">
                                {__("Watermark Icon")}
                            </label>
                            <div class="col-md-9">
                                {if $system['watermark_icon'] == ''}
                                    <div class="x-image">
                                        <button type="button" class="close x-hidden js_x-image-remover" title='{__("Remove")}'>
                                            <span>×</span>
                                        </button>
                                        <div class="x-image-loader">
                                            <div class="progress x-progress">
                                                <div class="progress-bar" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
                                            </div>
                                        </div>
                                        <i class="fa fa-camera fa-lg js_x-uploader" data-handle="x-image"></i>
                                        <input type="hidden" class="js_x-image-input" name="watermark_icon" value="">
                                    </div>
                                {else}
                                    <div class="x-image" style="background-image: url('{$system['system_uploads']}/{$system['watermark_icon']}')">
                                        <button type="button" class="close js_x-image-remover" title='{__("Remove")}'>
                                            <span>×</span>
                                        </button>
                                        <div class="x-image-loader">
                                            <div class="progress x-progress">
                                                <div class="progress-bar" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
                                            </div>
                                        </div>
                                        <i class="fa fa-camera fa-lg js_x-uploader" data-handle="x-image"></i>
                                        <input type="hidden" class="js_x-image-input" name="watermark_icon" value="{$system['watermark_icon']}">
                                    </div>
                                {/if}
                                <span class="form-text">
                                    {__("Upload your watermark icon (PNG is recommended)")}
                                </span>
                            </div>
                        </div>

                        <div class="form-group form-row">
                            <label class="col-md-3 form-control-label">
                                {__("Watermark Position")}
                            </label>
                            <div class="col-md-9">
                                <select class="form-control" name="watermark_position">
                                    <option {if $system['watermark_position'] == "top left"}selected{/if} value="top left">{__("Top Left")}</option>
                                    <option {if $system['watermark_position'] == "top right"}selected{/if} value="top right">{__("Top Right")}</option>
                                    <option {if $system['watermark_position'] == "top"}selected{/if} value="top">{__("Top")}</option>
                                    <option {if $system['watermark_position'] == "bottom left"}selected{/if} value="bottom left">{__("Bottom Left")}</option>
                                    <option {if $system['watermark_position'] == "bottom right"}selected{/if} value="bottom right">{__("Bottom Right")}</option>
                                    <option {if $system['watermark_position'] == "bottom"}selected{/if} value="bottom">{__("Bottom")}</option>
                                    <option {if $system['watermark_position'] == "left"}selected{/if} value="left">{__("Left")}</option>
                                    <option {if $system['watermark_position'] == "right"}selected{/if} value="right">{__("Right")}</option>
                                </select>
                                <span class="form-text">
                                    {__("Select the position (the anchor point) of your watermark icon")}
                                </span>
                            </div>
                        </div>

                        <div class="form-group form-row">
                            <label class="col-md-3 form-control-label">
                                {__("Watermark Opacity")}
                            </label>
                            <div class="col-md-9">
                                <input type="text" class="form-control" name="watermark_opacity" value="{$system['watermark_opacity']}">
                                <span class="form-text">
                                    {__("The opacity level of the watermark icon (value between 0 - 1)")}
                                </span>
                            </div>
                        </div>

                        <div class="form-group form-row">
                            <label class="col-md-3 form-control-label">
                                {__("Watermark X Offset")}
                            </label>
                            <div class="col-md-9">
                                <input type="text" class="form-control" name="watermark_xoffset" value="{$system['watermark_xoffset']}">
                                <span class="form-text">
                                    {__("Horizontal offset in pixels")}
                                </span>
                            </div>
                        </div>

                        <div class="form-group form-row">
                            <label class="col-md-3 form-control-label">
                                {__("Watermark Y Offset")}
                            </label>
                            <div class="col-md-9">
                                <input type="text" class="form-control" name="watermark_yoffset" value="{$system['watermark_yoffset']}">
                                <span class="form-text">
                                    {__("Vertical offset in pixels")}
                                </span>
                            </div>
                        </div>

                        <div class="divider"></div>

                        <div class="form-table-row">
                            <div>
                                <div class="form-control-label h6">{__("Adult Images Detection")}</div>
                                <div class="form-text d-none d-sm-block">
                                    {__("Enable it to detect the adult images and system will blur or delete them")}
                                </div>
                            </div>
                            <div class="text-right">
                                <label class="switch" for="adult_images_enabled">
                                    <input type="checkbox" name="adult_images_enabled" id="adult_images_enabled" {if $system['adult_images_enabled']}checked{/if}>
                                    <span class="slider round"></span>
                                </label>
                            </div>
                        </div>

                        <div class="form-group form-row">
                            <label class="col-md-3 form-control-label">
                                {__("Adult Images Action")}
                            </label>
                            <div class="col-md-9">
                                <div class="custom-control custom-radio custom-control-inline">
                                    <input type="radio" name="adult_images_action" id="action_blue" value="blur" class="custom-control-input" {if $system['adult_images_action'] == "blur"}checked{/if}>
                                    <label class="custom-control-label" for="action_blue">{__("Blur")}</label>
                                </div>
                                <div class="custom-control custom-radio custom-control-inline">
                                    <input type="radio" name="adult_images_action" id="action_delete" value="delete" class="custom-control-input" {if $system['adult_images_action'] == "delete"}checked{/if}>
                                    <label class="custom-control-label" for="action_delete">{__("Delete")}</label>
                                </div>
                            </div>
                        </div>

                        <div class="form-group form-row">
                            <label class="col-md-3 form-control-label">
                                {__("Google Vision API Key")}
                            </label>
                            <div class="col-md-9">
                                <input type="text" class="form-control" name="adult_images_api_key" value="{$system['adult_images_api_key']}">
                                <span class="form-text">
                                    {__("Your Cloud Vision API Key")}
                                </span>
                            </div>
                        </div>

                        <div class="divider"></div>

                        <div class="form-table-row">
                            <div class="avatar">
                                {include file='__svg_icons.tpl' icon="videos" width="40px" height="40px"}
                            </div>
                            <div>
                                <div class="form-control-label h6 mb5">{__("Video Upload")}</div>
                                <div class="form-text d-none d-sm-block">{__("Enable video upload to share & upload videos to the site")}</div>
                            </div>
                            <div class="text-right">
                                <label class="switch" for="videos_enabled">
                                    <input type="checkbox" name="videos_enabled" id="videos_enabled" {if $system['videos_enabled']}checked{/if}>
                                    <span class="slider round"></span>
                                </label>
                            </div>
                        </div>

                        <div class="form-group form-row">
                            <label class="col-md-3 form-control-label">
                                {__("Max video size")}
                            </label>
                            <div class="col-md-9">
                                <input type="text" class="form-control" name="max_video_size" value="{$system['max_video_size']}">
                                <span class="form-text">
                                    {__("The Maximum size of uploaded video in posts")} {__("in kilobytes (1M = 1024KB)")}
                                </span>
                            </div>
                        </div>

                        <div class="form-group form-row">
                            <label class="col-md-3 form-control-label">
                                {__("Video extensions")}
                            </label>
                            <div class="col-md-9">
                                <input type="text" class="form-control" name="video_extensions" value="{$system['video_extensions']}">
                                <span class="form-text">
                                    {__("Allowed video extensions (separated with comma ',)")}
                                </span>
                            </div>
                        </div>

                        <div class="divider"></div>

                        <div class="form-table-row">
                            <div class="avatar">
                                {include file='__svg_icons.tpl' icon="audios" width="40px" height="40px"}
                            </div>
                            <div>
                                <div class="form-control-label h6 mb5">{__("Audio Upload")}</div>
                                <div class="form-text d-none d-sm-block">{__("Enable audio upload to share & upload sounds to the site")}</div>
                            </div>
                            <div class="text-right">
                                <label class="switch" for="audio_enabled">
                                    <input type="checkbox" name="audio_enabled" id="audio_enabled" {if $system['audio_enabled']}checked{/if}>
                                    <span class="slider round"></span>
                                </label>
                            </div>
                        </div>

                        <div class="form-group form-row">
                            <label class="col-md-3 form-control-label">
                                {__("Max audio size")}
                            </label>
                            <div class="col-md-9">
                                <input type="text" class="form-control" name="max_audio_size" value="{$system['max_audio_size']}">
                                <span class="form-text">
                                    {__("The Maximum size of uploaded audio in posts")} {__("in kilobytes (1M = 1024KB)")}
                                </span>
                            </div>
                        </div>

                        <div class="form-group form-row">
                            <label class="col-md-3 form-control-label">
                                {__("Audio extensions")}
                            </label>
                            <div class="col-md-9">
                                <input type="text" class="form-control" name="audio_extensions" value="{$system['audio_extensions']}">
                                <span class="form-text">
                                    {__("Allowed audio extensions (separated with comma ',)")}
                                </span>
                            </div>
                        </div>

                        <div class="divider"></div>

                        <div class="form-table-row">
                            <div class="avatar">
                                {include file='__svg_icons.tpl' icon="files" width="40px" height="40px"}
                            </div>
                            <div>
                                <div class="form-control-label h6 mb5">{__("File Upload")}</div>
                                <div class="form-text d-none d-sm-block">{__("Enable file upload to share & upload files to the site")}</div>
                            </div>
                            <div class="text-right">
                                <label class="switch" for="file_enabled">
                                    <input type="checkbox" name="file_enabled" id="file_enabled" {if $system['file_enabled']}checked{/if}>
                                    <span class="slider round"></span>
                                </label>
                            </div>
                        </div>

                        <div class="form-group form-row">
                            <label class="col-md-3 form-control-label">
                                {__("Max file size")}
                            </label>
                            <div class="col-md-9">
                                <input type="text" class="form-control" name="max_file_size" value="{$system['max_file_size']}">
                                <span class="form-text">
                                    {__("The Maximum size of uploaded file in posts")} {__("in kilobytes (1M = 1024KB)")}
                                </span>
                            </div>
                        </div>

                        <div class="form-group form-row">
                            <label class="col-md-3 form-control-label">
                                {__("File extensions")}
                            </label>
                            <div class="col-md-9">
                                <input type="text" class="form-control" name="file_extensions" value="{$system['file_extensions']}">
                                <span class="form-text">
                                    {__("Allowed file extensions (separated with comma ',)")}
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
                        <button type="button" class="btn btn-danger js_admin-tester" data-handle="google_vision">
                            <i class="fa fa-bolt mr10"></i> {__("Test Google Vision API")}
                        </button>
                        <button type="submit" class="btn btn-primary">{__("Save Changes")}</button>
                    </div>
                </form>
            </div>
            <!-- General -->

            <!-- S3 -->
            <div class="tab-pane" id="S3">
                <form class="js_ajax-forms " data-url="admin/settings.php?edit=s3">
                    <div class="card-body">
                        <div class="alert alert-primary">
                            <div class="icon">
                                <i class="fab fa-amazon fa-2x"></i>
                            </div>
                            <div class="text">
                                <strong>{__("Amazon S3 Storage")}</strong><br>
                                {__("Before enabling Amazon S3, make sure you upload the whole 'uploads' folder to your bucket")}.<br>
                                {__("Before disabling Amazon S3, make sure you download the whole 'uploads' folder to your server")}.
                            </div>
                        </div>

                        <div class="form-table-row">
                            <div>
                                <div class="form-control-label h6">{__("Amazon S3 Storage")}</div>
                                <div class="form-text d-none d-sm-block">
                                    {__("Enable Amazon S3 storage")} ({__("Note: Enable this will disable all other options")})
                                </div>
                            </div>
                            <div class="text-right">
                                <label class="switch" for="s3_enabled">
                                    <input type="checkbox" name="s3_enabled" id="s3_enabled" {if $system['s3_enabled']}checked{/if}>
                                    <span class="slider round"></span>
                                </label>
                            </div>
                        </div>

                        <div class="form-group form-row">
                            <label class="col-md-3 form-control-label">
                                {__("Bucket Name")}
                            </label>
                            <div class="col-md-9">
                                <input type="text" class="form-control" name="s3_bucket" value="{$system['s3_bucket']}">
                                <span class="form-text">
                                    {__("Your Amazon S3 bucket name")}
                                </span>
                            </div>
                        </div>

                        <div class="form-group form-row">
                            <label class="col-md-3 form-control-label">
                                {__("Bucket Region")}
                            </label>
                            <div class="col-md-9">
                                <select name="s3_region" class="form-control">
                                    <option value="us-east-2" {if $system['s3_region'] == "us-east-2"}selected{/if}>US East (Ohio)</option>
                                    <option value="us-east-1" {if $system['s3_region'] == "us-east-1"}selected{/if}>US East (N. Virginia)</option>
                                    <option value="us-west-1" {if $system['s3_region'] == "us-west-1"}selected{/if}>US West (N. California)</option>
                                    <option value="us-west-2" {if $system['s3_region'] == "us-west-2"}selected{/if}>US West (Oregon)</option>
                                    <option value="ap-east-1" {if $system['s3_region'] == "ap-east-1"}selected{/if}>Asia Pacific (Hong Kong)</option>
                                    <option value="ap-south-1" {if $system['s3_region'] == "ap-south-1"}selected{/if}>Asia Pacific (Mumbai)</option>
                                    <option value="ap-northeast-3" {if $system['s3_region'] == "ap-northeast-3"}selected{/if}>Asia Pacific (Osaka-Local)</option>
                                    <option value="ap-northeast-2" {if $system['s3_region'] == "ap-northeast-2"}selected{/if}>Asia Pacific (Seoul)</option>
                                    <option value="ap-southeast-1" {if $system['s3_region'] == "ap-southeast-1"}selected{/if}>Asia Pacific (Singapore)</option>
                                    <option value="ap-southeast-2" {if $system['s3_region'] == "ap-southeast-2"}selected{/if}>Asia Pacific (Sydney)</option>
                                    <option value="ap-northeast-1" {if $system['s3_region'] == "ap-northeast-1"}selected{/if}>Asia Pacific (Tokyo)</option>
                                    <option value="ca-central-1" {if $system['s3_region'] == "ca-central-1"}selected{/if}>Canada (Central)</option>
                                    <option value="eu-central-1" {if $system['s3_region'] == "eu-central-1"}selected{/if}>EU (Frankfurt)</option>
                                    <option value="eu-west-1" {if $system['s3_region'] == "eu-west-1"}selected{/if}>EU (Ireland)</option>
                                    <option value="eu-west-2" {if $system['s3_region'] == "eu-west-2"}selected{/if}>EU (London)</option>
                                    <option value="eu-west-3" {if $system['s3_region'] == "eu-west-3"}selected{/if}>EU (Paris)</option>
                                    <option value="eu-north-1" {if $system['s3_region'] == "eu-north-1"}selected{/if}>Europe (Stockholm)</option>
                                    <option value="me-south-1" {if $system['s3_region'] == "me-south-1"}selected{/if}>Middle East (Bahrain)</option>
                                    <option value="sa-east-1" {if $system['s3_region'] == "sa-east-1"}selected{/if}>South America (São Paulo)</option>
                                </select>
                                <span class="form-text">
                                    {__("Your Amazon S3 bucket region")}
                                </span>
                            </div>
                        </div>

                        <div class="form-group form-row">
                            <label class="col-md-3 form-control-label">
                                {__("Access Key ID")}
                            </label>
                            <div class="col-md-9">
                                <input type="text" class="form-control" name="s3_key" value="{$system['s3_key']}">
                                <span class="form-text">
                                    {__("Your Amazon S3 Access Key ID")}
                                </span>
                            </div>
                        </div>

                        <div class="form-group form-row">
                            <label class="col-md-3 form-control-label">
                                {__("Access Key Secret")}
                            </label>
                            <div class="col-md-9">
                                <input type="text" class="form-control" name="s3_secret" value="{$system['s3_secret']}">
                                <span class="form-text">
                                    {__("Your Amazon S3 Access Key Secret")}
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
                        <button type="button" class="btn btn-danger js_admin-tester" data-handle="s3">
                            <i class="fa fa-bolt mr10"></i> {__("Test Connection")}
                        </button>
                        <button type="submit" class="btn btn-primary">{__("Save Changes")}</button>
                    </div>
                </form>
            </div>
            <!-- S3 -->

            <!-- DigitalOcean -->
            <div class="tab-pane" id="DigitalOcean">
                <form class="js_ajax-forms " data-url="admin/settings.php?edit=digitalocean">
                    <div class="card-body">
                        <div class="alert alert-primary">
                            <div class="icon">
                                <i class="fab fa-digital-ocean fa-2x"></i>
                            </div>
                            <div class="text">
                                <strong>{__("DigitalOcean")}</strong><br>
                                {__("Before enabling DigitalOcean Space, make sure you upload the whole 'uploads' folder to your space")}.<br>
                                {__("Before disabling DigitalOcean Space, make sure you download the whole 'uploads' folder to your server")}.
                            </div>
                        </div>

                        <div class="form-table-row">
                            <div>
                                <div class="form-control-label h6">{__("DigitalOcean Space")}</div>
                                <div class="form-text d-none d-sm-block">
                                    {__("Enable DigitalOcean storage")} ({__("Note: Enable this will disable all other options")})
                                </div>
                            </div>
                            <div class="text-right">
                                <label class="switch" for="digitalocean_enabled">
                                    <input type="checkbox" name="digitalocean_enabled" id="digitalocean_enabled" {if $system['digitalocean_enabled']}checked{/if}>
                                    <span class="slider round"></span>
                                </label>
                            </div>
                        </div>

                        <div class="form-group form-row">
                            <label class="col-md-3 form-control-label">
                                {__("Space Name")}
                            </label>
                            <div class="col-md-9">
                                <input type="text" class="form-control" name="digitalocean_space_name" value="{$system['digitalocean_space_name']}">
                                <span class="form-text">
                                    {__("Your DigitalOcean space name")}
                                </span>
                            </div>
                        </div>

                        <div class="form-group form-row">
                            <label class="col-md-3 form-control-label">
                                {__("Space Region")}
                            </label>
                            <div class="col-md-9">
                                <select name="digitalocean_space_region" class="form-control">
                                    <option value="sfo2" {if $system['digitalocean_space_region'] == "sfo2"}selected{/if}>San Francisco</option>
                                    <option value="nyc3" {if $system['digitalocean_space_region'] == "nyc3"}selected{/if}>New York</option>
                                    <option value="ams3" {if $system['digitalocean_space_region'] == "ams3"}selected{/if}>Amsterdam</option>
                                    <option value="sgp1" {if $system['digitalocean_space_region'] == "sgp1"}selected{/if}>Singapore</option>
                                    <option value="fra1" {if $system['digitalocean_space_region'] == "fra1"}selected{/if}>Frankfurt</option>
                                </select>
                                <span class="form-text">
                                    {__("Your DigitalOcean space region")}
                                </span>
                            </div>
                        </div>

                        <div class="form-group form-row">
                            <label class="col-md-3 form-control-label">
                                {__("Access Key ID")}
                            </label>
                            <div class="col-md-9">
                                <input type="text" class="form-control" name="digitalocean_key" value="{$system['digitalocean_key']}">
                                <span class="form-text">
                                    {__("Your DigitalOcean Access Key ID")}
                                </span>
                            </div>
                        </div>

                        <div class="form-group form-row">
                            <label class="col-md-3 form-control-label">
                                {__("Access Key Secret")}
                            </label>
                            <div class="col-md-9">
                                <input type="text" class="form-control" name="digitalocean_secret" value="{$system['digitalocean_secret']}">
                                <span class="form-text">
                                    {__("Your DigitalOcean Access Key Secret")}
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
                        <button type="button" class="btn btn-danger js_admin-tester" data-handle="digitalocean">
                            <i class="fa fa-bolt mr10"></i> {__("Test Connection")}
                        </button>
                        <button type="submit" class="btn btn-primary">{__("Save Changes")}</button>
                    </div>
                </form>
            </div>
            <!-- DigitalOcean -->

            <!-- FTP -->
            <div class="tab-pane" id="FTP">
                <form class="js_ajax-forms " data-url="admin/settings.php?edit=ftp">
                    <div class="card-body">
                        <div class="alert alert-primary">
                            <div class="icon">
                                <i class="fa fa-cloud-upload-alt fa-2x"></i>
                            </div>
                            <div class="text">
                                <strong>{__("FTP Storage")}</strong><br>
                                {__("Before enabling FTP Storage, make sure you upload the whole 'uploads' folder to your space")}.<br>
                                {__("Before disabling FTP Storage, make sure you download the whole 'uploads' folder to your server")}.
                            </div>
                        </div>

                        <div class="form-table-row">
                            <div>
                                <div class="form-control-label h6">{__("FTP Storage")}</div>
                                <div class="form-text d-none d-sm-block">
                                    {__("Enable FTP Storage upload")} ({__("Note: Enable this will disable all other options")})
                                </div>
                            </div>
                            <div class="text-right">
                                <label class="switch" for="ftp_enabled">
                                    <input type="checkbox" name="ftp_enabled" id="ftp_enabled" {if $system['ftp_enabled']}checked{/if}>
                                    <span class="slider round"></span>
                                </label>
                            </div>
                        </div>

                        <div class="form-group form-row">
                            <label class="col-md-3 form-control-label">
                                {__("Hostname")}
                            </label>
                            <div class="col-md-9">
                                <input type="text" class="form-control" name="ftp_hostname" value="{$system['ftp_hostname']}">
                            </div>
                        </div>

                        <div class="form-group form-row">
                            <label class="col-md-3 form-control-label">
                                {__("Port")}
                            </label>
                            <div class="col-md-9">
                                <input type="text" class="form-control" name="ftp_port" value="{$system['ftp_port']}" placeholder="21">
                            </div>
                        </div>

                        <div class="form-group form-row">
                            <label class="col-md-3 form-control-label">
                                {__("Username")}
                            </label>
                            <div class="col-md-9">
                                <input type="text" class="form-control" name="ftp_username" value="{$system['ftp_username']}">
                            </div>
                        </div>

                        <div class="form-group form-row">
                            <label class="col-md-3 form-control-label">
                                {__("Password")}
                            </label>
                            <div class="col-md-9">
                                <input type="text" class="form-control" name="ftp_password" value="{$system['ftp_password']}">
                            </div>
                        </div>

                        <div class="form-group form-row">
                            <label class="col-md-3 form-control-label">
                                {__("FTP Path")}
                            </label>
                            <div class="col-md-9">
                                <input type="text" class="form-control" name="ftp_path" value="{$system['ftp_path']}" placeholder="./">
                                <span class="form-text">
                                    {__("The path to your uploads folder (Examples: './' or 'public_html/uploads')")}
                                </span>
                            </div>
                        </div>

                        <div class="form-group form-row">
                            <label class="col-md-3 form-control-label">
                                {__("FTP Endpoint")}
                            </label>
                            <div class="col-md-9">
                                <input type="text" class="form-control" name="ftp_endpoint" value="{$system['ftp_endpoint']}">
                                <span class="form-text">
                                    {__("The URL to your uploads folder (Examples: 'https://domain.com/uploads' or 'https://64.233.191.255/uploads')")}
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
                        <button type="button" class="btn btn-danger js_admin-tester" data-handle="ftp">
                            <i class="fa fa-bolt mr10"></i> {__("Test Connection")}
                        </button>
                        <button type="submit" class="btn btn-primary">{__("Save Changes")}</button>
                    </div>
                </form>
            </div>
            <!-- FTP -->
        </div>
        <!-- tabs content -->

    {elseif $sub_view == "security"}

        <!-- card-header -->
        <div class="card-header with-icon">
            <!-- panel title -->
            <i class="fa fa-cog mr10"></i>{__("Settings")} &rsaquo; {__("Security")}
            <!-- panel title -->
        </div>
        <!-- card-header -->

        <!-- Security -->
        <form class="js_ajax-forms " data-url="admin/settings.php?edit=security">
            <div class="card-body">
                <div class="form-table-row">
                    <div>
                        <div class="form-control-label h6">{__("Unusual Login Detection")}</div>
                        <div class="form-text d-none d-sm-block">{__("Enable unusual login detection, System will not allow user to login with same session from different device or location")}</div>
                    </div>
                    <div class="text-right">
                        <label class="switch" for="unusual_login_enabled">
                            <input type="checkbox" name="unusual_login_enabled" id="unusual_login_enabled" {if $system['unusual_login_enabled']}checked{/if}>
                            <span class="slider round"></span>
                        </label>
                    </div>
                </div>

                <div class="divider"></div>

                <div class="form-table-row">
                    <div>
                        <div class="form-control-label h6">{__("Brute Force Detection")}</div>
                        <div class="form-text d-none d-sm-block">{__("Enable brute force attack detection, System will block the user account if hacker try to login with invalid password too many times to guess the correct account password")}</div>
                    </div>
                    <div class="text-right">
                        <label class="switch" for="brute_force_detection_enabled">
                            <input type="checkbox" name="brute_force_detection_enabled" id="brute_force_detection_enabled" {if $system['brute_force_detection_enabled']}checked{/if}>
                            <span class="slider round"></span>
                        </label>
                    </div>
                </div>

                <div class="form-group form-row">
                    <label class="col-md-3 form-control-label">
                        {__("Bad Login Limit")}
                    </label>
                    <div class="col-md-9">
                        <input type="text" class="form-control" name="brute_force_bad_login_limit" value="{$system['brute_force_bad_login_limit']}">
                        <span class="form-text">
                            {__("Number of bad login attempts till account get blocked")}
                        </span>
                    </div>
                </div>

                <div class="form-group form-row">
                    <label class="col-md-3 form-control-label">
                        {__("Lockout Time")}
                    </label>
                    <div class="col-md-9">
                        <input type="text" class="form-control" name="brute_force_lockout_time" value="{$system['brute_force_lockout_time']}">
                        <span class="form-text">
                            {__("Number of minutes the account will still locked out")}
                        </span>
                    </div>
                </div>

                <div class="divider"></div>

                <div class="form-table-row">
                    <div>
                        <div class="form-control-label h6">{__("Two-Factor Authentication")}</div>
                        <div class="form-text d-none d-sm-block">{__("Enable two-factor authentication to log in with a code from your email/phone as well as a password")}</div>
                    </div>
                    <div class="text-right">
                        <label class="switch" for="two_factor_enabled">
                            <input type="checkbox" name="two_factor_enabled" id="two_factor_enabled" {if $system['two_factor_enabled']}checked{/if}>
                            <span class="slider round"></span>
                        </label>
                    </div>
                </div>

                <div class="form-group form-row">
                    <label class="col-sm-3 form-control-label">
                        {__("Two-Factor Authentication Via")}
                    </label>
                    <div class="col-md-9">
                        <div class="custom-control custom-radio custom-control-inline">
                            <input type="radio" name="two_factor_type" id="two_factor_email" value="email" class="custom-control-input" {if $system['two_factor_type'] == "email"}checked{/if}>
                            <label class="custom-control-label" for="two_factor_email">{__("Email")}</label>
                        </div>
                        <div class="custom-control custom-radio custom-control-inline">
                            <input type="radio" name="two_factor_type" id="two_factor_sms" value="sms" class="custom-control-input" {if $system['two_factor_type'] == "sms"}checked{/if}>
                            <label class="custom-control-label" for="two_factor_sms">{__("SMS")}</label>
                        </div>
                        <div class="custom-control custom-radio custom-control-inline">
                            <input type="radio" name="two_factor_type" id="two_factor_google" value="google" class="custom-control-input" {if $system['two_factor_type'] == "google"}checked{/if}>
                            <label class="custom-control-label" for="two_factor_google">{__("Google Authenticator")}</label>
                        </div>
                        <span class="form-text">
                            {__("Select Email, SMS or Google Authenticator to send log in code to user")}<br>
                            {__("Make sure you have configured")} <a href="{$system['system_url']}/{$control_panel['url']}/settings/sms">{__("SMS Settings")}</a>
                        </span>
                    </div>
                </div>

                <div class="divider"></div>
                        
                <div class="form-table-row">
                    <div>
                        <div class="form-control-label h6">{__("Censored Words Enabled")}</div>
                        <div class="form-text d-none d-sm-block">{__("Enable/Disable Words to be censored")}</div>
                    </div>
                    <div class="text-right">
                        <label class="switch" for="censored_words_enabled">
                            <input type="checkbox" name="censored_words_enabled" id="censored_words_enabled" {if $system['censored_words_enabled']}checked{/if}>
                            <span class="slider round"></span>
                        </label>
                    </div>
                </div>

                <div class="form-group form-row">
                    <label class="col-md-3 form-control-label">
                        {__("Censored Words")}
                    </label>
                    <div class="col-md-9">
                        <textarea class="form-control" name="censored_words" rows="3">{$system['censored_words']}</textarea>
                        <span class="form-text">
                            {__("Words to be censored, separated by a comma (,)")}
                        </span>
                    </div>
                </div>

                <div class="divider"></div>

                <div class="form-table-row">
                    <div>
                        <div class="form-control-label h6">{__("reCAPTCHA Enabled")}</div>
                        <div class="form-text d-none d-sm-block">{__("Turn reCAPTCHA On and Off")}</div>
                    </div>
                    <div class="text-right">
                        <label class="switch" for="reCAPTCHA_enabled">
                            <input type="checkbox" name="reCAPTCHA_enabled" id="reCAPTCHA_enabled" {if $system['reCAPTCHA_enabled']}checked{/if}>
                            <span class="slider round"></span>
                        </label>
                    </div>
                </div>

                <div class="form-group form-row">
                    <label class="col-md-3 form-control-label">
                        {__("reCAPTCHA Site Key")}
                    </label>
                    <div class="col-md-9">
                        <input type="text" class="form-control" name="reCAPTCHA_site_key" value="{$system['reCAPTCHA_site_key']}">
                    </div>
                </div>

                <div class="form-group form-row">
                    <label class="col-md-3 form-control-label">
                        {__("reCAPTCHA Secret Key")}
                    </label>
                    <div class="col-md-9">
                        <input type="text" class="form-control" name="reCAPTCHA_secret_key" value="{$system['reCAPTCHA_secret_key']}">
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
        <!-- Security -->

    {elseif $sub_view == "payments"}

        <!-- card-header -->
        <div class="card-header with-icon with-nav">
            <!-- panel title -->
            <div class="mb20">
                <i class="fa fa-cog mr10"></i>{__("Settings")} &rsaquo; {__("Payments")}
            </div>
            <!-- panel title -->

            <!-- panel nav -->
            <ul class="nav nav-tabs">
                <li class="nav-item">
                    <a class="nav-link active" href="#Paypal" data-toggle="tab">
                        <i class="fab fa-paypal fa-fw mr5"></i><strong class="pr5">{__("PayPal")}</strong>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#Stripe" data-toggle="tab">
                        <i class="fab fa-stripe-s fa-fw mr5"></i><strong class="pr5">{__("Stripe")}</strong>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#CoinPayments" data-toggle="tab">
                        <i class="fab fa-bitcoin fa-fw mr5"></i><strong class="pr5">{__("CoinPayments")}</strong>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#TwoCheckout" data-toggle="tab">
                        {include file='__svg_icons.tpl' icon="2co" width="20px" height="20px" class="mr5"}<strong class="pr5">{__("2Checkout")}</strong>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#Bank" data-toggle="tab">
                        <i class="fa fa-university fa-fw mr5"></i><strong class="pr5">{__("Bank Transfers")}</strong>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#Currency" data-toggle="tab">
                        <i class="fa fa-dollar-sign fa-fw mr5"></i><strong class="pr5">{__("Currency")}</strong>
                    </a>
                </li>
            </ul>
            <!-- panel nav -->
        </div>
        <!-- card-header -->

        <!-- tabs content -->
        <div class="tab-content">
            <!-- Paypal -->
            <div class="tab-pane active" id="Paypal">
                <form class="js_ajax-forms " data-url="admin/settings.php?edit=paypal">
                    <div class="card-body">
                        <div class="form-table-row">
                            <div>
                                <div class="form-control-label h6">{__("Paypal Enabled")}</div>
                                <div class="form-text d-none d-sm-block">{__("Enable payments via Paypal")}</div>
                            </div>
                            <div class="text-right">
                                <label class="switch" for="paypal_enabled">
                                    <input type="checkbox" name="paypal_enabled" id="paypal_enabled" {if $system['paypal_enabled']}checked{/if}>
                                    <span class="slider round"></span>
                                </label>
                            </div>
                        </div>

                        <div class="form-group form-row">
                            <label class="col-md-3 form-control-label">
                                {__("Paypal Mode")}
                            </label>
                            <div class="col-md-9">
                                <div class="custom-control custom-radio custom-control-inline">
                                    <input type="radio" name="paypal_mode" id="paypal_live" value="live" class="custom-control-input" {if $system['paypal_mode'] == "live"}checked{/if}>
                                    <label class="custom-control-label" for="paypal_live">{__("Live")}</label>
                                </div>
                                <div class="custom-control custom-radio custom-control-inline">
                                    <input type="radio" name="paypal_mode" id="paypal_sandbox" value="sandbox" class="custom-control-input" {if $system['paypal_mode'] == "sandbox"}checked{/if}>
                                    <label class="custom-control-label" for="paypal_sandbox">{__("Sandbox")}</label>
                                </div>
                            </div>
                        </div>

                        <div class="form-group form-row">
                            <label class="col-md-3 form-control-label">
                                {__("PayPal Client ID")}
                            </label>
                            <div class="col-md-9">
                                <input type="text" class="form-control" name="paypal_id" value="{$system['paypal_id']}">
                            </div>
                        </div>

                        <div class="form-group form-row">
                            <label class="col-md-3 form-control-label">
                                {__("PayPal Secret Key")}
                            </label>
                            <div class="col-md-9">
                                <input type="text" class="form-control" name="paypal_secret" value="{$system['paypal_secret']}">
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
            </div>
            <!-- Paypal -->

            <!-- Stripe -->
            <div class="tab-pane" id="Stripe">
                <form class="js_ajax-forms " data-url="admin/settings.php?edit=stripe">
                    <div class="card-body">
                        <div class="form-table-row">
                            <div>
                                <div class="form-control-label h6">{__("Credit Card Enabled")}</div>
                                <div class="form-text d-none d-sm-block">{__("Enable payments via Credit Card")}</div>
                            </div>
                            <div class="text-right">
                                <label class="switch" for="creditcard_enabled">
                                    <input type="checkbox" name="creditcard_enabled" id="creditcard_enabled" {if $system['creditcard_enabled']}checked{/if}>
                                    <span class="slider round"></span>
                                </label>
                            </div>
                        </div>

                        <div class="form-table-row">
                            <div>
                                <div class="form-control-label h6">{__("Alipay Enabled")}</div>
                                <div class="form-text d-none d-sm-block">{__("Enable payments via Alipay")}</div>
                            </div>
                            <div class="text-right">
                                <label class="switch" for="alipay_enabled">
                                    <input type="checkbox" name="alipay_enabled" id="alipay_enabled" {if $system['alipay_enabled']}checked{/if}>
                                    <span class="slider round"></span>
                                </label>
                            </div>
                        </div>

                        <div class="form-group form-row">
                            <label class="col-md-3 form-control-label">
                                {__("Stripe Mode")}
                            </label>
                            <div class="col-md-9">
                                <div class="custom-control custom-radio custom-control-inline">
                                    <input type="radio" name="stripe_mode" id="stripe_live" value="live" class="custom-control-input" {if $system['stripe_mode'] == "live"}checked{/if}>
                                    <label class="custom-control-label" for="stripe_live">{__("Live")}</label>
                                </div>
                                <div class="custom-control custom-radio custom-control-inline">
                                    <input type="radio" name="stripe_mode" id="stripe_test" value="test" class="custom-control-input" {if $system['stripe_mode'] == "test"}checked{/if}>
                                    <label class="custom-control-label" for="stripe_test">{__("Test")}</label>
                                </div>
                            </div>
                        </div>

                        <div class="form-group form-row">
                            <label class="col-md-3 form-control-label">
                                {__("Test Secret Key")}
                            </label>
                            <div class="col-md-9">
                                <input type="text" class="form-control" name="stripe_test_secret" value="{$system['stripe_test_secret']}">
                                <span class="form-text">
                                    {__("Stripe secret key that starts with sk_")}
                                </span>
                            </div>
                        </div>

                        <div class="form-group form-row">
                            <label class="col-md-3 form-control-label">
                                {__("Test Publishable Key")}
                            </label>
                            <div class="col-md-9">
                                <input type="text" class="form-control" name="stripe_test_publishable" value="{$system['stripe_test_publishable']}">
                                <span class="form-text">
                                    {__("Stripe publishable key that starts with pk_")}
                                </span>
                            </div>
                        </div>

                        <div class="form-group form-row">
                            <label class="col-md-3 form-control-label">
                                {__("Live Secret Key")}
                            </label>
                            <div class="col-md-9">
                                <input type="text" class="form-control" name="stripe_live_secret" value="{$system['stripe_live_secret']}">
                                <span class="form-text">
                                    {__("Stripe secret key that starts with sk_")}
                                </span>
                            </div>
                        </div>

                        <div class="form-group form-row">
                            <label class="col-md-3 form-control-label">
                                {__("Live Publishable Key")}
                            </label>
                            <div class="col-md-9">
                                <input type="text" class="form-control" name="stripe_live_publishable" value="{$system['stripe_live_publishable']}">
                                <span class="form-text">
                                    {__("Stripe publishable key that starts with pk_")}
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
            </div>
            <!-- Stripe -->

            <!-- CoinPayments -->
            <div class="tab-pane" id="CoinPayments">
                <form class="js_ajax-forms " data-url="admin/settings.php?edit=coinpayments">
                    <div class="card-body">
                        <div class="form-table-row">
                            <div>
                                <div class="form-control-label h6">{__("CoinPayments Enabled")}</div>
                                <div class="form-text d-none d-sm-block">{__("Enable payments via CoinPayments")}</div>
                            </div>
                            <div class="text-right">
                                <label class="switch" for="coinpayments_enabled">
                                    <input type="checkbox" name="coinpayments_enabled" id="coinpayments_enabled" {if $system['coinpayments_enabled']}checked{/if}>
                                    <span class="slider round"></span>
                                </label>
                            </div>
                        </div>

                        <div class="form-group form-row">
                            <label class="col-md-3 form-control-label">
                                {__("Merchant ID")}
                            </label>
                            <div class="col-md-9">
                                <input type="text" class="form-control" name="coinpayments_merchant_id" value="{$system['coinpayments_merchant_id']}">
                            </div>
                        </div>

                        <div class="form-group form-row">
                            <label class="col-md-3 form-control-label">
                                {__("IPN Secret")}
                            </label>
                            <div class="col-md-9">
                                <input type="text" class="form-control" name="coinpayments_ipn_secret" value="{$system['coinpayments_ipn_secret']}">
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
            </div>
            <!-- CoinPayments -->

            <!-- 2Checkout -->
            <div class="tab-pane" id="TwoCheckout">
                <form class="js_ajax-forms " data-url="admin/settings.php?edit=2checkout">
                    <div class="card-body">
                        <div class="form-table-row">
                            <div>
                                <div class="form-control-label h6">{__("2Checkout Enabled")}</div>
                                <div class="form-text d-none d-sm-block">{__("Enable payments via 2Checkout")}</div>
                            </div>
                            <div class="text-right">
                                <label class="switch" for="2checkout_enabled">
                                    <input type="checkbox" name="2checkout_enabled" id="2checkout_enabled" {if $system['2checkout_enabled']}checked{/if}>
                                    <span class="slider round"></span>
                                </label>
                            </div>
                        </div>

                        <div class="form-group form-row">
                            <label class="col-md-3 form-control-label">
                                {__("2Checkout Mode")}
                            </label>
                            <div class="col-md-9">
                                <div class="custom-control custom-radio custom-control-inline">
                                    <input type="radio" name="2checkout_mode" id="2checkout_live" value="live" class="custom-control-input" {if $system['2checkout_mode'] == "live"}checked{/if}>
                                    <label class="custom-control-label" for="2checkout_live">{__("Live")}</label>
                                </div>
                                <div class="custom-control custom-radio custom-control-inline">
                                    <input type="radio" name="2checkout_mode" id="2checkout_sandbox" value="sandbox" class="custom-control-input" {if $system['2checkout_mode'] == "sandbox"}checked{/if}>
                                    <label class="custom-control-label" for="2checkout_sandbox">{__("Sandbox")}</label>
                                </div>
                            </div>
                        </div>

                        <div class="form-group form-row">
                            <label class="col-md-3 form-control-label">
                                {__("Merchant Code")}
                            </label>
                            <div class="col-md-9">
                                <input type="text" class="form-control" name="2checkout_merchant_code" value="{$system['2checkout_merchant_code']}">
                            </div>
                        </div>

                        <div class="form-group form-row">
                            <label class="col-md-3 form-control-label">
                                {__("API Publishable Key")}
                            </label>
                            <div class="col-md-9">
                                <input type="text" class="form-control" name="2checkout_publishable_key" value="{$system['2checkout_publishable_key']}">
                            </div>
                        </div>

                        <div class="form-group form-row">
                            <label class="col-md-3 form-control-label">
                                {__("API Private Key")}
                            </label>
                            <div class="col-md-9">
                                <input type="text" class="form-control" name="2checkout_private_key" value="{$system['2checkout_private_key']}">
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
            </div>
            <!-- 2Checkout -->

            <!-- Bank -->
            <div class="tab-pane" id="Bank">
                <form class="js_ajax-forms " data-url="admin/settings.php?edit=bank">
                    <div class="card-body">
                        <div class="form-table-row">
                            <div>
                                <div class="form-control-label h6">{__("Bank Transfers Enabled")}</div>
                                <div class="form-text d-none d-sm-block">{__("Enable payments via Bank Transfers")}</div>
                            </div>
                            <div class="text-right">
                                <label class="switch" for="bank_transfers_enabled">
                                    <input type="checkbox" name="bank_transfers_enabled" id="bank_transfers_enabled" {if $system['bank_transfers_enabled']}checked{/if}>
                                    <span class="slider round"></span>
                                </label>
                            </div>
                        </div>

                        <div class="form-group form-row">
                            <label class="col-md-3 form-control-label">
                                {__("Bank Name")}
                            </label>
                            <div class="col-md-9">
                                <input type="text" class="form-control" name="bank_name" value="{$system['bank_name']}">
                                <span class="form-text">
                                    {__("Your Bank Name")}
                                </span>
                            </div>
                        </div>

                        <div class="form-group form-row">
                            <label class="col-md-3 form-control-label">
                                {__("Bank Account Number")}
                            </label>
                            <div class="col-md-9">
                                <input type="text" class="form-control" name="bank_account_number" value="{$system['bank_account_number']}">
                                <span class="form-text">
                                    {__("Your Bank Account Number")}
                                </span>
                            </div>
                        </div>

                        <div class="form-group form-row">
                            <label class="col-md-3 form-control-label">
                                {__("Bank Account Name")}
                            </label>
                            <div class="col-md-9">
                                <input type="text" class="form-control" name="bank_account_name" value="{$system['bank_account_name']}">
                                <span class="form-text">
                                    {__("Your Bank Account Name")}
                                </span>
                            </div>
                        </div>

                        <div class="form-group form-row">
                            <label class="col-md-3 form-control-label">
                                {__("Bank Account Routing Code")}
                            </label>
                            <div class="col-md-9">
                                <input type="text" class="form-control" name="bank_account_routing" value="{$system['bank_account_routing']}">
                                <span class="form-text">
                                    {__("Your Bank Account Routing Code or SWIFT Code")}
                                </span>
                            </div>
                        </div>

                        <div class="form-group form-row">
                            <label class="col-md-3 form-control-label">
                                {__("Bank Account Country")}
                            </label>
                            <div class="col-md-9">
                                <input type="text" class="form-control" name="bank_account_country" value="{$system['bank_account_country']}">
                                <span class="form-text">
                                    {__("Your Bank Account Country")}
                                </span>
                            </div>
                        </div>

                        <div class="form-group form-row">
                            <label class="col-md-3 form-control-label">
                                {__("Transfer Note")}
                            </label>
                            <div class="col-md-9">
                                <textarea class="form-control" name="bank_transfer_note" rows="5">{$system['bank_transfer_note']}</textarea>
                                <span class="form-text">
                                    {__("This note will be displayed to the user while upload his bank transfer receipt")}
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
            </div>
            <!-- Bank -->

            <!-- Currency -->
            <div class="tab-pane" id="Currency">
                <form class="js_ajax-forms " data-url="admin/settings.php?edit=currency">
                    <div class="card-body">
                        <div class="form-group form-row">
                            <label class="col-md-3 form-control-label">
                                {__("Website Currency")}
                            </label>
                            <div class="col-md-9">
                                <select class="form-control" name="system_currency">
                                    {foreach $system_currencies as $currency}
                                        <option {if $currency['default']}selected{/if} value="{$currency['currency_id']}">
                                            {$currency['name']} ({$currency['code']})
                                        </option>
                                    {/foreach}
                                </select>
                                <div class="form-text">
                                    {__("You can add, edit or delete currencies from")} <a href="{$system['system_url']}/{$control_panel['url']}/currencies">{__("Currencies")}</a>
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
            </div>
            <!-- Currency -->
        </div>

    {elseif $sub_view == "limits"}

        <!-- card-header -->
        <div class="card-header with-icon">
            <!-- panel title -->
            <i class="fa fa-cog mr10"></i>{__("Settings")} &rsaquo; {__("Limits")}
            <!-- panel title -->
        </div>
        <!-- card-header -->

        <!-- Limits -->
        <form class="js_ajax-forms " data-url="admin/settings.php?edit=limits">
            <div class="card-body">
                <div class="form-group form-row">
                    <label class="col-md-3 form-control-label">
                        {__("Data Heartbeat")}
                    </label>
                    <div class="col-md-9">
                        <input type="text" class="form-control" name="data_heartbeat" value="{$system['data_heartbeat']}">
                        <span class="form-text">
                            {__("The update interval to check for new data (in seconds)")}
                        </span>
                    </div>
                </div>

                <div class="form-group form-row">
                    <label class="col-md-3 form-control-label">
                        {__("Chat Heartbeat")}
                    </label>
                    <div class="col-md-9">
                        <input type="text" class="form-control" name="chat_heartbeat" value="{$system['chat_heartbeat']}">
                        <span class="form-text">
                            {__("The update interval to check for new messages (in seconds)")}
                        </span>
                    </div>
                </div>

                <div class="form-group form-row">
                    <label class="col-md-3 form-control-label">
                        {__("Offline After")}
                    </label>
                    <div class="col-md-9">
                        <input type="text" class="form-control" name="offline_time" value="{$system['offline_time']}">
                        <span class="form-text">
                            {__("The amount of time to be considered online since the last user's activity (in seconds)")}<br>
                            {__("The maximim value is one day = 86400 seconds")}
                        </span>
                    </div>
                </div>

                <div class="divider"></div>
                
                <div class="form-group form-row">
                    <label class="col-md-3 form-control-label">
                        {__("Minimum Results")}
                    </label>
                    <div class="col-md-9">
                        <input type="text" class="form-control" name="min_results" value="{$system['min_results']}">
                        <span class="form-text">
                            {__("The Min number of results per request")}
                        </span>
                    </div>
                </div>

                <div class="form-group form-row">
                    <label class="col-md-3 form-control-label">
                        {__("Maximum Results")}
                    </label>
                    <div class="col-md-9">
                        <input type="text" class="form-control" name="max_results" value="{$system['max_results']}">
                        <span class="form-text">
                            {__("The Max number of results per request")}
                        </span>
                    </div>
                </div>

                <div class="form-group form-row">
                    <label class="col-md-3 form-control-label">
                        {__("Minimum Even Results")}
                    </label>
                    <div class="col-md-9">
                        <input type="text" class="form-control" name="min_results_even" value="{$system['min_results_even']}">
                        <span class="form-text">
                            {__("The Min even number of results per request")}
                        </span>
                    </div>
                </div>

                <div class="form-group form-row">
                    <label class="col-md-3 form-control-label">
                        {__("Maximum Even Results")}
                    </label>
                    <div class="col-md-9">
                        <input type="text" class="form-control" name="max_results_even" value="{$system['max_results_even']}">
                        <span class="form-text">
                            {__("The Max even number of results per request")}
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
        <!-- Limits -->

    {elseif $sub_view == "analytics"}

        <!-- card-header -->
        <div class="card-header with-icon">
            <!-- panel title -->
            <i class="fa fa-cog mr10"></i>{__("Settings")} &rsaquo; {__("Analytics")}
            <!-- panel title -->
        </div>
        <!-- card-header -->

        <!-- Analytics -->
        <form class="js_ajax-forms " data-url="admin/settings.php?edit=analytics">
            <div class="card-body">
                <div class="form-group form-row">
                    <label class="col-md-3 form-control-label">
                        {__("Tracking Code")}
                    </label>
                    <div class="col-md-9">
                        <textarea class="form-control" name="message" rows="3">{$system['analytics_code']}</textarea>
                        <span class="form-text">
                            {__("The analytics tracking code (Ex: Google Analytics)")}
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
        <!-- Analytics -->

    {/if}

</div>