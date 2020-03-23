<div class="card">
    <div class="card-body with-nav">
        <ul class="main-side-nav">
            <!-- basic -->
            <li>
                <a href="{$system['system_url']}/{$user->_data['user_name']}">
                    <img class="rounded-circle" src="{$user->_data.user_picture}" alt="{$user->_data['user_firstname']} {$user->_data['user_lastname']}">
                    <span>{$user->_data['user_firstname']} {$user->_data['user_lastname']}</span>
                </a>
            </li>

            <li>
                <a href="{$system['system_url']}/messages">
                    <img src="{$system['system_url']}/content/themes/{$system['theme']}/images/icons/chat.png">
                    {__("Messages")}
                </a>
            </li>

            <li>
                <a href="{$system['system_url']}/settings">
                    <img src="{$system['system_url']}/content/themes/{$system['theme']}/images/icons/settings.png">
                    {__("Settings")}
                </a>
            </li>

            {if $user->_is_admin}
                <li>
                    <a href="{$system['system_url']}/admincp">
                        <img src="{$system['system_url']}/content/themes/{$system['theme']}/images/icons/admin.png">
                        {__("Admin Panel")}
                    </a>
                </li>
            {elseif $user->_is_moderator}
                <li>
                    <a href="{$system['system_url']}/modcp">
                        <img src="{$system['system_url']}/content/themes/{$system['theme']}/images/icons/admin.png">
                        {__("Moderator Panel")}
                    </a>
                </li>
            {/if}
            <!-- basic -->

            <!-- favorites -->
            <li class="ptb5">
                <strong><small class="text-muted">{__("favorites")|upper}</small></strong>
            </li>

            <li {if $page== "index" && ($view == "" || $view == "discover" || $view == "popular")}class="active"{/if}>
                {if !$system['popular_posts_enabled'] && !$system['discover_posts_enabled']}
                    <a href="{$system['system_url']}">
                        <img src="{$system['system_url']}/content/themes/{$system['theme']}/images/icons/newfeed.png">
                        {__("News Feed")}
                    </a>
                {else}
                    <a href="#newsfeed" data-toggle="collapse" {if $page== "index" && ($view == "" || $view == "discover" || $view == "popular")}aria-expanded="true"{/if}>
                        <img src="{$system['system_url']}/content/themes/{$system['theme']}/images/icons/newfeed.png">
                        {__("News Feed")}
                    </a>
                    <div class='collapse {if $page== "index" && ($view == "" || $view == "discover" || $view == "popular")}show{/if}' id="newsfeed">
                        <ul>
                            <li {if $page== "index" && $view == ""}class="active"{/if}>
                                <a href="{$system['system_url']}">
                                    <img src="{$system['system_url']}/content/themes/{$system['theme']}/images/icons/posts_recent.png">
                                    {__("Recent Updates")}
                                </a>
                            </li>
                            {if $system['popular_posts_enabled']}
                                <li {if $page== "index" && $view == "popular"}class="active"{/if}>
                                    <a href="{$system['system_url']}/popular">
                                        <img src="{$system['system_url']}/content/themes/{$system['theme']}/images/icons/posts_popular.png">
                                        {__("Popular Posts")}
                                    </a>
                                </li>
                            {/if}
                            {if $system['discover_posts_enabled']}
                                <li {if $page== "index" && $view == "discover"}class="active"{/if}>
                                    <a href="{$system['system_url']}/discover">
                                        <img src="{$system['system_url']}/content/themes/{$system['theme']}/images/icons/posts_discover.png">
                                        {__("Discover Posts")}
                                    </a>
                                </li>
                            {/if}
                        </ul>
                    </div>
                {/if}
            </li>

            {if $system['blogs_enabled']}
                <li {if $page== "index" && $view == "articles"}class="active"{/if}>
                    <a href="{$system['system_url']}/articles">
                        <img src="{$system['system_url']}/content/themes/{$system['theme']}/images/icons/article.png">
                        {__("My Articles")}
                    </a>
                </li>
            {/if}
            
            {if $system['market_enabled']}
                <li {if $page== "index" && $view == "products"}class="active"{/if}>
                    <a href="{$system['system_url']}/products">
                        <img src="{$system['system_url']}/content/themes/{$system['theme']}/images/icons/products.png">
                        {__("My Products")}
                    </a>
                </li>
            {/if}

            <li {if $page== "index" && $view == "saved"}class="active"{/if}>
                <a href="{$system['system_url']}/saved">
                    <img src="{$system['system_url']}/content/themes/{$system['theme']}/images/icons/saved.png">
                    {__("Saved Posts")}
                </a>
            </li>

            {if $system['memories_enabled']}
                <li {if $page== "index" && $view == "memories"}class="active"{/if}>
                    <a href="{$system['system_url']}/memories">
                        <img src="{$system['system_url']}/content/themes/{$system['theme']}/images/icons/memories.png">
                        {__("Memories")}
                    </a>
                </li>
            {/if}
            <!-- favorites -->

            <!-- advertising -->
            {if $system['ads_enabled'] || $system['packages_enabled']}
                <li class="ptb5">
                    <small class="text-muted">{__("Advertising")|upper}</small>
                </li>

                {if $system['ads_enabled']}
                    <li {if $page== "ads"}class="active"{/if}>
                        <a href="{$system['system_url']}/ads">
                            <img src="{$system['system_url']}/content/themes/{$system['theme']}/images/icons/ads_manager.png">
                            {__("Ads Manager")}
                        </a>
                    </li>
                {/if}

                {if $system['packages_enabled']}
                    <li {if $page== "index" && $view == "boosted_posts"}class="active"{/if}>
                        <a href="{$system['system_url']}/boosted/posts">
                            <img src="{$system['system_url']}/content/themes/{$system['theme']}/images/icons/boosted_posts.png">
                            {__("Boosted Posts")}
                        </a>
                    </li>
                    
                    <li {if $page== "index" && $view == "boosted_pages"}class="active"{/if}>
                        <a href="{$system['system_url']}/boosted/pages">
                            <img src="{$system['system_url']}/content/themes/{$system['theme']}/images/icons/boosted_pages.png">
                            {__("Boosted Pages")}
                        </a>
                    </li>
                {/if}
            {/if}
            <!-- advertising -->

            <!-- explore -->
            <li class="ptb5">
                <small class="text-muted">{__("explore")|upper}</small>
            </li>

            <li {if $page== "people"}class="active"{/if}>
                <a href="{$system['system_url']}/people">
                    <img src="{$system['system_url']}/content/themes/{$system['theme']}/images/icons/people.png">
                    {__("People")}
                </a>
            </li>
            
            <li {if $page== "pages"}class="active"{/if}>
                <a href="{$system['system_url']}/pages">
                    <img src="{$system['system_url']}/content/themes/{$system['theme']}/images/icons/pages.png">
                    {__("Pages")}
                </a>
            </li>

            <li {if $page== "groups"}class="active"{/if}>
                <a href="{$system['system_url']}/groups">
                    <img src="{$system['system_url']}/content/themes/{$system['theme']}/images/icons/groups.png">
                    {__("Groups")}
                </a>
            </li>

            <li {if $page== "events"}class="active"{/if}>
                <a href="{$system['system_url']}/events">
                    <img src="{$system['system_url']}/content/themes/{$system['theme']}/images/icons/events.png">
                    {__("Events")}
                </a>
            </li>

            {if $system['blogs_enabled']}
                <li>
                    <a href="{$system['system_url']}/blogs">
                        <img src="{$system['system_url']}/content/themes/{$system['theme']}/images/icons/blogs.png">
                        {__("Blogs")}
                    </a>
                </li>
            {/if}

            {if $system['market_enabled']}
                <li>
                    <a href="{$system['system_url']}/market">
                        <img src="{$system['system_url']}/content/themes/{$system['theme']}/images/icons/market.png">
                        {__("Market")}
                    </a>
                </li>
            {/if}

            {if $system['forums_enabled']}
                <li>
                    <a href="{$system['system_url']}/forums">
                        <img src="{$system['system_url']}/content/themes/{$system['theme']}/images/icons/forums.png">
                        {__("Forums")}
                    </a>
                </li>
            {/if}

            {if $system['movies_enabled']}
                <li {if $page== "movies"}class="active"{/if}>
                    <a href="{$system['system_url']}/movies">
                        <img src="{$system['system_url']}/content/themes/{$system['theme']}/images/icons/movies.png">
                        {__("Movies")}
                    </a>
                </li>
            {/if}

            {if $system['games_enabled']}
                <li {if $page== "games"}class="active"{/if}>
                    <a href="{$system['system_url']}/games">
                        <img src="{$system['system_url']}/content/themes/{$system['theme']}/images/icons/games.png">
                        {__("Games")}
                    </a>
                </li>
            {/if}
            <!-- explore -->
        </ul>
    </div>
</div>