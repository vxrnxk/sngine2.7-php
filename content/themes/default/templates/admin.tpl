{include file='_head.tpl'}
{include file='_header.tpl'}

<!-- page content -->
<div class="container mt20 offcanvas">
    <div class="row">

        <!-- left panel -->
        <div class="col-md-4 col-lg-3 offcanvas-sidebar">
            
            <!-- System -->
            <div class="card mb5">
                <div class="card-header block-title">
                    {__("System")}
                </div>
                <div class="card-body with-nav">
                    <ul class="side-nav">
                        <!-- Dashboard -->
                        <li {if $view == "dashboard"}class="active"{/if}>
                            <a href="{$system['system_url']}/{$control_panel['url']}">
                                <i class="fa fa-tachometer-alt fa-fw mr10" style="color: #3F51B5"></i>{__("Dashboard")}
                            </a>
                        </li>
                        <!-- Dashboard -->

                        {if $user->_is_admin}
                            <!-- Settings -->
                            <li {if $view == "settings"}class="active"{/if}>
                                <a href="#settings" data-toggle="collapse" {if $view == "settings"}aria-expanded="true"{/if}>
                                    <i class="fa fa-cog fa-fw mr10" style="color: #3F51B5"></i>{__("Settings")}
                                </a>
                                <div class='collapse {if $view == "settings"}show{/if}' id="settings">
                                    <ul>
                                        <li {if $view == "settings" && $sub_view == ""}class="active"{/if}>
                                            <a href="{$system['system_url']}/{$control_panel['url']}/settings">
                                                <i class="fa fa-cogs fa-fw mr10"></i>{__("System Settings")}
                                            </a>
                                        </li>
                                        <li {if $view == "settings" && $sub_view == "posts"}class="active"{/if}>
                                            <a href="{$system['system_url']}/{$control_panel['url']}/settings/posts">
                                                <i class="fa fa-comment-alt fa-fw mr10"></i>{__("Posts Settings")}
                                            </a>
                                        </li>
                                        <li {if $view == "settings" && $sub_view == "registration"}class="active"{/if}>
                                            <a href="{$system['system_url']}/{$control_panel['url']}/settings/registration">
                                                <i class="fa fa-sign-in-alt fa-fw mr10"></i>{__("Registration Settings")}
                                            </a>
                                        </li>
                                        <li {if $view == "settings" && $sub_view == "emails"}class="active"{/if}>
                                            <a href="{$system['system_url']}/{$control_panel['url']}/settings/emails">
                                                <i class="fa fa-envelope-open fa-fw mr10"></i>{__("Emails Settings")}
                                            </a>
                                        </li>
                                        <li {if $view == "settings" && $sub_view == "sms"}class="active"{/if}>
                                            <a href="{$system['system_url']}/{$control_panel['url']}/settings/sms">
                                                <i class="fa fa-mobile fa-fw mr10"></i>{__("SMS Settings")}
                                            </a>
                                        </li>
                                        <li {if $view == "settings" && $sub_view == "chat"}class="active"{/if}>
                                            <a href="{$system['system_url']}/{$control_panel['url']}/settings/chat">
                                                <i class="fa fa-comments fa-fw mr10"></i>{__("Chat Settings")}
                                            </a>
                                        </li>
                                        <li {if $view == "settings" && $sub_view == "uploads"}class="active"{/if}>
                                            <a href="{$system['system_url']}/{$control_panel['url']}/settings/uploads">
                                                <i class="fa fa-upload fa-fw mr10"></i>{__("Uploads Settings")}
                                            </a>
                                        </li>
                                        <li {if $view == "settings" && $sub_view == "security"}class="active"{/if}>
                                            <a href="{$system['system_url']}/{$control_panel['url']}/settings/security">
                                                <i class="fa fa-shield-alt fa-fw mr10"></i>{__("Security Settings")}
                                            </a>
                                        </li>
                                        <li {if $view == "settings" && $sub_view == "payments"}class="active"{/if}>
                                            <a href="{$system['system_url']}/{$control_panel['url']}/settings/payments">
                                                <i class="fa fa-credit-card fa-fw mr10"></i>{__("Payments Settings")}
                                            </a>
                                        </li>
                                        <li {if $view == "settings" && $sub_view == "limits"}class="active"{/if}>
                                            <a href="{$system['system_url']}/{$control_panel['url']}/settings/limits">
                                                <i class="fa fa-tachometer-alt fa-fw mr10"></i>{__("Limits Settings")}
                                            </a>
                                        </li>
                                        <li {if $view == "settings" && $sub_view == "analytics"}class="active"{/if}>
                                            <a href="{$system['system_url']}/{$control_panel['url']}/settings/analytics">
                                                <i class="fa fa-chart-pie fa-fw mr10"></i>{__("Analytics Settings")}
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                            <!-- Settings -->

                            <!-- Themes -->
                            <li {if $view == "themes"}class="active"{/if}>
                                <a href="{$system['system_url']}/{$control_panel['url']}/themes">
                                    <i class="fa fa-desktop fa-fw mr10" style="color: #3F51B5"></i>{__("Themes")}
                                </a>
                            </li>
                            <!-- Themes -->

                            <!-- Design -->
                            <li {if $view == "design"}class="active"{/if}>
                                <a href="{$system['system_url']}/{$control_panel['url']}/design">
                                    <i class="fa fa-paint-brush fa-fw mr10" style="color: #3F51B5"></i>{__("Design")}
                                </a>
                            </li>
                            <!-- Design -->

                            <!-- Languages -->
                            <li {if $view == "languages"}class="active"{/if}>
                                <a href="{$system['system_url']}/{$control_panel['url']}/languages">
                                    <i class="fa fa-language fa-fw mr10" style="color: #3F51B5"></i>{__("Languages")}
                                </a>
                            </li>
                            <!-- Languages -->

                            <!-- Currencies -->
                            <li {if $view == "currencies"}class="active"{/if}>
                                <a href="{$system['system_url']}/{$control_panel['url']}/currencies">
                                    <i class="fa fa-money-bill-alt fa-fw mr10" style="color: #3F51B5"></i>{__("Currencies")}
                                </a>
                            </li>
                            <!-- Currencies -->
                        {/if}
                    </ul>
                </div>
            </div>
            <!-- System -->

            <!-- Modules -->
            <div class="card mb5">
                <div class="card-header block-title">
                    {__("Modules")}
                </div>
                <div class="card-body with-nav">
                    <ul class="side-nav">

                        {if $user->_is_admin}
                            <!-- Users -->
                            <li {if $view == "users"}class="active"{/if}>
                                <a href="#users" data-toggle="collapse" {if $view == "users"}aria-expanded="true"{/if}>
                                    <i class="fa fa-user fa-fw mr10" style="color: #F44336"></i>{__("Users")}
                                </a>
                                <div class='collapse {if $view == "users"}show{/if}' id="users">
                                    <ul>
                                        <li {if $view == "users" && $sub_view == ""}class="active"{/if}>
                                            <a href="{$system['system_url']}/{$control_panel['url']}/users">
                                                {__("List Users")}
                                            </a>
                                        </li>
                                        <li {if $view == "users" && $sub_view == "admins"}class="active"{/if}>
                                            <a href="{$system['system_url']}/{$control_panel['url']}/users/admins">
                                                {__("List Admins")}
                                            </a>
                                        </li>
                                        <li {if $view == "users" && $sub_view == "moderators"}class="active"{/if}>
                                            <a href="{$system['system_url']}/{$control_panel['url']}/users/moderators">
                                                {__("List Moderators")}
                                            </a>
                                        </li>
                                        <li {if $view == "users" && $sub_view == "online"}class="active"{/if}>
                                            <a href="{$system['system_url']}/{$control_panel['url']}/users/online">
                                                {__("List Online")}
                                            </a>
                                        </li>
                                        <li {if $view == "users" && $sub_view == "banned"}class="active"{/if}>
                                            <a href="{$system['system_url']}/{$control_panel['url']}/users/banned">
                                                {__("List Banned")}
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                            <!-- Users -->
                        {/if}

                        <!-- Posts -->
                        <li {if $view == "posts"}class="active"{/if}>
                            <a href="{$system['system_url']}/{$control_panel['url']}/posts">
                                <i class="fa fa-newspaper fa-fw mr10" style="color: #F44336"></i>{__("Posts")}
                            </a>
                        </li>
                        <!-- Posts -->

                        <!-- Pages -->
                        <li {if $view == "pages"}class="active"{/if}>
                            <a href="#pages" data-toggle="collapse" {if $view == "pages"}aria-expanded="true"{/if}>
                                <i class="fa fa-flag fa-fw mr10" style="color: #F44336"></i>{__("Pages")}
                            </a>
                            <div class='collapse {if $view == "pages"}show{/if}' id="pages">
                                <ul>
                                    <li {if $view == "pages" && $sub_view == ""}class="active"{/if}>
                                        <a href="{$system['system_url']}/{$control_panel['url']}/pages">
                                            {__("List Pages")}
                                        </a>
                                    </li>
                                    <li {if $view == "pages" && $sub_view == "categories"}class="active"{/if}>
                                        <a href="{$system['system_url']}/{$control_panel['url']}/pages/categories">
                                            {__("List Categories")}
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </li>
                        <!-- Pages -->

                        <!-- Groups -->
                        <li {if $view == "groups"}class="active"{/if}>
                            <a href="#groups" data-toggle="collapse" {if $view == "groups"}aria-expanded="true"{/if}>
                                <i class="fa fa-users fa-fw mr10" style="color: #F44336"></i>{__("Groups")}
                            </a>
                            <div class='collapse {if $view == "groups"}show{/if}' id="groups">
                                <ul>
                                    <li {if $view == "groups" && $sub_view == ""}class="active"{/if}>
                                        <a href="{$system['system_url']}/{$control_panel['url']}/groups">
                                            {__("List Groups")}
                                        </a>
                                    </li>
                                    <li {if $view == "groups" && $sub_view == "categories"}class="active"{/if}>
                                        <a href="{$system['system_url']}/{$control_panel['url']}/groups/categories">
                                            {__("List Categories")}
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </li>
                        <!-- Groups -->

                        <!-- Events -->
                        <li {if $view == "events"}class="active"{/if}>
                            <a href="#events" data-toggle="collapse" {if $view == "events"}aria-expanded="true"{/if}>
                                <i class="fa fa-calendar fa-fw mr10" style="color: #F44336"></i>{__("Events")}
                            </a>
                            <div class='collapse {if $view == "events"}show{/if}' id="events">
                                <ul>
                                    <li {if $view == "events" && $sub_view == ""}class="active"{/if}>
                                        <a href="{$system['system_url']}/{$control_panel['url']}/events">
                                            {__("List Events")}
                                        </a>
                                    </li>
                                    <li {if $view == "events" && $sub_view == "categories"}class="active"{/if}>
                                        <a href="{$system['system_url']}/{$control_panel['url']}/events/categories">
                                            {__("List Categories")}
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </li>
                        <!-- Events -->

                        <!-- Blogs -->
                        <li {if $view == "blogs"}class="active"{/if}>
                            <a href="#blogs" data-toggle="collapse" {if $view == "blogs"}aria-expanded="true"{/if}>
                                <i class="fab fa-blogger-b fa-fw mr10" style="color: #F44336"></i>{__("Blogs")}
                            </a>
                            <div class='collapse {if $view == "blogs"}show{/if}' id="blogs">
                                <ul>
                                    <li {if $view == "blogs" && $sub_view == ""}class="active"{/if}>
                                        <a href="{$system['system_url']}/{$control_panel['url']}/blogs">
                                            {__("List Articles")}
                                        </a>
                                    </li>
                                    <li {if $view == "blogs" && $sub_view == "categories"}class="active"{/if}>
                                        <a href="{$system['system_url']}/{$control_panel['url']}/blogs/categories">
                                            {__("List Categories")}
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </li>
                        <!-- Blogs -->

                        <!-- Market -->
                        <li {if $view == "market"}class="active"{/if}>
                            <a href="#market" data-toggle="collapse" {if $view == "market"}aria-expanded="true"{/if}>
                                <i class="fa fa-shopping-bag fa-fw mr10" style="color: #F44336"></i>{__("Market")}
                            </a>
                            <div class='collapse {if $view == "market"}show{/if}' id="market">
                                <ul>
                                    <li {if $view == "market" && $sub_view == "categories"}class="active"{/if}>
                                        <a href="{$system['system_url']}/{$control_panel['url']}/market/categories">
                                            {__("List Categories")}
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </li>
                        <!-- Market -->

                        <!-- Forums -->
                        <li {if $view == "forums"}class="active"{/if}>
                            <a href="#forums" data-toggle="collapse" {if $view == "forums"}aria-expanded="true"{/if}>
                                <i class="fa fa-comments fa-fw mr10" style="color: #F44336"></i>{__("Forums")}
                            </a>
                            <div class='collapse {if $view == "forums"}show{/if}' id="forums">
                                <ul>
                                    {if $user->_is_admin}
                                        <li {if $view == "forums" && $sub_view == "settings"}class="active"{/if}>
                                            <a href="{$system['system_url']}/{$control_panel['url']}/forums/settings">
                                                {__("Forums Settings")}
                                            </a>
                                        </li>
                                    {/if}
                                    <li {if $view == "forums" && $sub_view == ""}class="active"{/if}>
                                        <a href="{$system['system_url']}/{$control_panel['url']}/forums">
                                            {__("List Forums")}
                                        </a>
                                    </li>
                                    <li {if $view == "forums" && $sub_view == "threads"}class="active"{/if}>
                                        <a href="{$system['system_url']}/{$control_panel['url']}/forums/threads">
                                            {__("List Threads")}
                                        </a>
                                    </li>
                                    <li {if $view == "forums" && $sub_view == "replies"}class="active"{/if}>
                                        <a href="{$system['system_url']}/{$control_panel['url']}/forums/replies">
                                            {__("List Replies")}
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </li>
                        <!-- Forums -->

                        <!-- Movies -->
                        <li {if $view == "movies"}class="active"{/if}>
                            <a href="#movies" data-toggle="collapse" {if $view == "movies"}aria-expanded="true"{/if}>
                                <i class="fa fa-film fa-fw mr10" style="color: #F44336"></i>{__("Movies")}
                            </a>
                            <div class='collapse {if $view == "movies"}show{/if}' id="movies">
                                <ul>
                                    <li {if $view == "movies" && $sub_view == ""}class="active"{/if}>
                                        <a href="{$system['system_url']}/{$control_panel['url']}/movies">
                                            {__("List Movies")}
                                        </a>
                                    </li>
                                    <li {if $view == "movies" && $sub_view == "genres"}class="active"{/if}>
                                        <a href="{$system['system_url']}/{$control_panel['url']}/movies/genres">
                                            {__("List Genres")}
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </li>
                        <!-- Movies -->

                        <!-- Games -->
                        <li {if $view == "games"}class="active"{/if}>
                            <a href="{$system['system_url']}/{$control_panel['url']}/games">
                                <i class="fa fa-gamepad fa-fw mr10" style="color: #F44336"></i>{__("Games")}
                            </a>
                        </li>
                        <!-- Games -->

                    </ul>
                </div>
            </div>
            <!-- Modules -->

             <!-- Money -->
            {if $user->_is_admin}
                <div class="card mb5">
                    <div class="card-header block-title">
                        {__("Money")}
                    </div>
                    <div class="card-body with-nav">
                        <ul class="side-nav">
                            
                            <!-- Ads -->
                            <li {if $view == "ads"}class="active"{/if}>
                                <a href="#ads" data-toggle="collapse" {if $view == "ads"}aria-expanded="true"{/if}>
                                    <i class="fa fa-dollar-sign fa-fw mr10" style="color: #4CAF50"></i>{__("Ads")}
                                </a>
                                <div class='collapse {if $view == "ads"}show{/if}' id="ads">
                                    <ul>
                                        <li {if $view == "ads" && $sub_view == ""}class="active"{/if}>
                                            <a href="{$system['system_url']}/{$control_panel['url']}/ads">
                                                {__("Ads Settings")}
                                            </a>
                                        </li>
                                        <li {if $view == "ads" && $sub_view == "system_ads"}class="active"{/if}>
                                            <a href="{$system['system_url']}/{$control_panel['url']}/ads/system_ads">
                                                {__("List System Ads")}
                                            </a>
                                        </li>
                                        <li {if $view == "ads" && $sub_view == "users_ads"}class="active"{/if}>
                                            <a href="{$system['system_url']}/{$control_panel['url']}/ads/users_ads">
                                                {__("List Users Ads")}
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                            <!-- Ads -->

                            <!-- Packages -->
                            <li {if $view == "packages"}class="active"{/if}>
                                <a href="#packages" data-toggle="collapse" {if $view == "packages"}aria-expanded="true"{/if}>
                                    <i class="fa fa-cubes fa-fw mr10" style="color: #4CAF50"></i>{__("Pro Packages")}
                                </a>
                                <div class='collapse {if $view == "packages"}show{/if}' id="packages">
                                    <ul>
                                        <li {if $view == "packages" && $sub_view == ""}class="active"{/if}>
                                            <a href="{$system['system_url']}/{$control_panel['url']}/packages">
                                                {__("List Packages")}
                                            </a>
                                        </li>
                                        <li {if $view == "packages" && $sub_view == "subscribers"}class="active"{/if}>
                                            <a href="{$system['system_url']}/{$control_panel['url']}/packages/subscribers">
                                                {__("List Subscribers")}
                                            </a>
                                        </li>
                                        <li {if $view == "packages" && $sub_view == "earnings"}class="active"{/if}>
                                            <a href="{$system['system_url']}/{$control_panel['url']}/packages/earnings">
                                                {__("Earnings")}
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                            <!-- Packages -->

                            <!-- CoinPayments -->
                            <li {if $view == "coinpayments"}class="active"{/if}>
                                <a href="{$system['system_url']}/{$control_panel['url']}/coinpayments">
                                    <i class="fab fa-bitcoin fa-fw mr10" style="color: #4CAF50"></i>{__("CoinPayments")}
                                </a>
                            </li>
                            <!-- CoinPayments -->

                            <!-- Bank Receipts -->
                            <li {if $view == "bank"}class="active"{/if}>
                                <a href="{$system['system_url']}/{$control_panel['url']}/bank">
                                    {if $bank_transfers_insights}<span class="float-right badge badge-pill badge-danger">{$bank_transfers_insights}</span>{/if}
                                    <i class="fa fa-university fa-fw mr10" style="color: #4CAF50"></i>{__("Bank Receipts")}
                                </a>
                            </li>
                            <!-- Bank Receipts -->

                            <!-- Affiliates -->
                            <li {if $view == "affiliates"}class="active"{/if}>
                                <a href="#affiliates" data-toggle="collapse" {if $view == "affiliates"}aria-expanded="true"{/if}>
                                    <i class="fa fa-exchange-alt fa-fw mr10" style="color: #4CAF50"></i>{__("Affiliates")}
                                </a>
                                <div class='collapse {if $view == "affiliates"}show{/if}' id="affiliates">
                                    <ul>
                                        <li {if $view == "affiliates" && $sub_view == ""}class="active"{/if}>
                                            <a href="{$system['system_url']}/{$control_panel['url']}/affiliates">
                                                {__("Affiliates Settings")}
                                            </a>
                                        </li>
                                        <li {if $view == "affiliates" && $sub_view == "payments"}class="active"{/if}>
                                            <a href="{$system['system_url']}/{$control_panel['url']}/affiliates/payments">
                                                {if $affiliates_payments_insights}<span class="float-right badge badge-pill badge-danger">{$affiliates_payments_insights}</span>{/if}
                                                {__("Payment Requests")}
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                            <!-- Affiliates -->

                            <!-- Points -->
                            <li {if $view == "points"}class="active"{/if}>
                                <a href="#points" data-toggle="collapse" {if $view == "points"}aria-expanded="true"{/if}>
                                    <i class="fa fa-piggy-bank fa-fw mr10" style="color: #4CAF50"></i>{__("Points System")}
                                </a>
                                <div class='collapse {if $view == "points"}show{/if}' id="points">
                                    <ul>
                                        <li {if $view == "points" && $sub_view == ""}class="active"{/if}>
                                            <a href="{$system['system_url']}/{$control_panel['url']}/points">
                                                {__("Points Settings")}
                                            </a>
                                        </li>
                                        <li {if $view == "points" && $sub_view == "payments"}class="active"{/if}>
                                            <a href="{$system['system_url']}/{$control_panel['url']}/points/payments">
                                                {if $points_payments_insights}<span class="float-right badge badge-pill badge-danger">{$points_payments_insights}</span>{/if}
                                                {__("Payment Requests")}
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                            <!-- Points -->

                        </ul>
                    </div>
                </div>
            {/if}
            <!-- Money -->

            <!-- Developers -->
            {if $user->_is_admin}
                <div class="card mb5">
                    <div class="card-header block-title">
                        {__("Developers")}
                    </div>
                    <div class="card-body with-nav">
                        <ul class="side-nav">

                            <!-- Developers -->
                            <li {if $view == "developers"}class="active"{/if}>
                                <a href="#developers" data-toggle="collapse" {if $view == "developers"}aria-expanded="true"{/if}>
                                    <i class="fa fa-cubes fa-fw mr10" style="color: #ffc107"></i>{__("Developers")}
                                </a>
                                <div class='collapse {if $view == "developers"}show{/if}' id="developers">
                                    <ul>
                                        <li {if $view == "developers" && $sub_view == ""}class="active"{/if}>
                                            <a href="{$system['system_url']}/{$control_panel['url']}/developers">
                                                {__("Developers Settings")}
                                            </a>
                                        </li>
                                        <li {if $view == "developers" && $sub_view == "apps"}class="active"{/if}>
                                            <a href="{$system['system_url']}/{$control_panel['url']}/developers/apps">
                                                {__("List Apps")}
                                            </a>
                                        </li>
                                        <li {if $view == "developers" && $sub_view == "categories"}class="active"{/if}>
                                            <a href="{$system['system_url']}/{$control_panel['url']}/developers/categories">
                                                {__("List Categories")}
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                            <!-- Developers -->
                            
                        </ul>
                    </div>
                </div>
            {/if}
            <!-- Developers -->

            <!-- Tools -->
            <div class="card mb5">
                <div class="card-header block-title">
                    {__("Tools")}
                </div>
                <div class="card-body with-nav">
                    <ul class="side-nav">

                        <!-- Reports -->
                        <li {if $view == "reports"}class="active"{/if}>
                            <a href="{$system['system_url']}/{$control_panel['url']}/reports">
                                {if $reports_insights}<span class="float-right badge badge-pill badge-danger">{$reports_insights}</span>{/if}
                                <i class="fa fa-exclamation-triangle fa-fw mr10" style="color: #03A9F4"></i>{__("Reports")}
                            </a>
                        </li>
                        <!-- Reports -->

                        {if $user->_is_admin}
                            <!-- Blacklist -->
                            <li {if $view == "blacklist"}class="active"{/if}>
                                <a href="{$system['system_url']}/{$control_panel['url']}/blacklist">
                                    <i class="fa fa-minus-circle fa-fw mr10" style="color: #03A9F4"></i>{__("Blacklist")}
                                </a>
                            </li>
                            <!-- Blacklist -->
                        {/if}

                        <!-- Verification -->
                        <li {if $view == "verification"}class="active"{/if}>
                            <a href="#verification" data-toggle="collapse" {if $view == "verification"}aria-expanded="true"{/if}>
                                <i class="fa fa-check-circle fa-fw mr10" style="color: #03A9F4"></i>{__("Verification")}
                            </a>
                            <div class='collapse {if $view == "verification"}show{/if}' id="verification">
                                <ul>
                                    <li {if $view == "verification" && $sub_view == ""}class="active"{/if}>
                                        <a href="{$system['system_url']}/{$control_panel['url']}/verification">
                                            {if $verification_requests_insights}<span class="float-right badge badge-pill badge-danger">{$verification_requests_insights}</span>{/if}
                                            {__("List Requests")}
                                        </a>
                                    </li>
                                    <li {if $view == "verification" && $sub_view == "users"}class="active"{/if}>
                                        <a href="{$system['system_url']}/{$control_panel['url']}/verification/users">
                                            {__("List Verified Users")}
                                        </a>
                                    </li>
                                    <li {if $view == "verification" && $sub_view == "pages"}class="active"{/if}>
                                        <a href="{$system['system_url']}/{$control_panel['url']}/verification/pages">
                                            {__("List Verified Pages")}
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </li>
                        <!-- Verification -->

                        {if $user->_is_admin}
                            <!-- Tools -->
                            <li {if $view == "tools"}class="active"{/if}>
                                <a href="#tools" data-toggle="collapse" {if $view == "tools"}aria-expanded="true"{/if}>
                                    <i class="fa fa-toolbox fa-fw mr10" style="color: #03A9F4"></i>{__("Tools")}
                                </a>
                                <div class='collapse {if $view == "tools"}show{/if}' id="tools">
                                    <ul>
                                        <li {if $view == "tools" && $sub_view == "faker"}class="active"{/if}>
                                            <a href="{$system['system_url']}/{$control_panel['url']}/tools/faker">
                                                {__("Fake Users Generator")}
                                            </a>
                                        </li>
                                        <li {if $view == "tools" && $sub_view == "auto-connect"}class="active"{/if}>
                                            <a href="{$system['system_url']}/{$control_panel['url']}/tools/auto-connect">
                                                {__("Auto Connect")}
                                            </a>
                                        </li>
                                        <li {if $view == "tools" && $sub_view == "garbage-collector"}class="active"{/if}>
                                            <a href="{$system['system_url']}/{$control_panel['url']}/tools/garbage-collector">
                                                {__("Garbage Collector")}
                                            </a>
                                        </li>
                                        <li {if $view == "tools" && $sub_view == "backups"}class="active"{/if}>
                                            <a href="{$system['system_url']}/{$control_panel['url']}/tools/backups">
                                                {__("Backup Database & Files")}
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                            <!-- Tools -->
                        {/if}

                    </ul>
                </div>
            </div>
            <!-- Tools -->

            <!-- Customization -->
            {if $user->_is_admin}
                <div class="card mb5">
                    <div class="card-header block-title">
                        {__("Customization")}
                    </div>
                    <div class="card-body with-nav">
                        <ul class="side-nav">

                            <!-- Custom Fields -->
                            <li {if $view == "custom_fields"}class="active"{/if}>
                                <a href="{$system['system_url']}/{$control_panel['url']}/custom_fields">
                                    <i class="fa fa-bars fa-fw mr10" style="color: #FF5722"></i>{__("Custom Fields")}
                                </a>
                            </li>
                            <!-- Custom Fields -->
                            
                            <!-- Static Pages -->
                            <li {if $view == "static"}class="active"{/if}>
                                <a href="{$system['system_url']}/{$control_panel['url']}/static">
                                    <i class="fa fa-file fa-fw mr10" style="color: #FF5722"></i>{__("Static Pages")}
                                </a>
                            </li>
                            <!-- Static Pages -->

                            <!-- Colored Posts -->
                            <li {if $view == "colored_posts"}class="active"{/if}>
                                <a href="{$system['system_url']}/{$control_panel['url']}/colored_posts">
                                    <i class="fa fa-palette fa-fw mr10" style="color: #FF5722"></i>{__("Colored Posts")}
                                </a>
                            </li>
                            <!-- Colored Posts -->

                            <!-- Widgets -->
                            <li {if $view == "widgets"}class="active"{/if}>
                                <a href="{$system['system_url']}/{$control_panel['url']}/widgets">
                                    <i class="fa fa-puzzle-piece fa-fw mr10" style="color: #FF5722"></i>{__("Widgets")}
                                </a>
                            </li>
                            <!-- Widgets -->

                            <!-- Emojis -->
                            <li {if $view == "emojis"}class="active"{/if}>
                                <a href="{$system['system_url']}/{$control_panel['url']}/emojis">
                                    <i class="fa fa-smile fa-fw mr10" style="color: #FF5722"></i>{__("Emojis")}
                                </a>
                            </li>
                            <!-- Emojis -->

                            <!-- Stickers -->
                            <li {if $view == "stickers"}class="active"{/if}>
                                <a href="{$system['system_url']}/{$control_panel['url']}/stickers">
                                    <i class="fa fa-hand-peace fa-fw mr10" style="color: #FF5722"></i>{__("Stickers")}
                                </a>
                            </li>
                            <!-- Stickers -->

                            <!-- Gifts -->
                            <li {if $view == "gifts"}class="active"{/if}>
                                <a href="{$system['system_url']}/{$control_panel['url']}/gifts">
                                    <i class="fa fa-gift fa-fw mr10" style="color: #FF5722"></i>{__("Gifts")}
                                </a>
                            </li>
                            <!-- Gifts -->

                        </ul>
                    </div>
                </div>
            {/if}
            <!-- Customization -->

            <!-- Reach -->
            {if $user->_is_admin}
                <div class="card mb5">
                    <div class="card-header block-title">
                        {__("Reach")}
                    </div>
                    <div class="card-body with-nav">
                        <ul class="side-nav">

                            <!-- Announcements -->
                            <li {if $view == "announcements"}class="active"{/if}>
                                <a href="{$system['system_url']}/{$control_panel['url']}/announcements">
                                    <i class="fa fa-bullhorn fa-fw mr10" style="color: #009688"></i>{__("Announcements")}
                                </a>
                            </li>
                            <!-- Announcements -->

                            <!-- Notifications -->
                            <li {if $view == "notifications"}class="active"{/if}>
                                <a href="{$system['system_url']}/{$control_panel['url']}/notifications">
                                    <i class="fa fa-bell fa-fw mr10" style="color: #009688"></i>{__("Mass Notifications")}
                                </a>
                            </li>
                            <!-- Notifications -->

                            <!-- Newsletter -->
                            <li {if $view == "newsletter"}class="active"{/if}>
                                <a href="{$system['system_url']}/{$control_panel['url']}/newsletter">
                                    <i class="fa fa-paper-plane fa-fw mr10" style="color: #009688"></i>{__("Newsletter")}
                                </a>
                            </li>
                            <!-- Newsletter -->

                        </ul>
                    </div>
                </div>
            {/if}
            <!-- Reach -->

            <!-- Sngine -->
            {if $user->_is_admin}
                <div class="card">
                    <div class="card-header block-title">
                        {__("Sngine")}
                    </div>
                    <div class="card-body with-nav">
                        <ul class="side-nav">

                            <!-- Changelog -->
                            <li {if $view == "changelog"}class="active"{/if}>
                                <a href="{$system['system_url']}/{$control_panel['url']}/changelog">
                                    <i class="fa fa-stopwatch fa-fw mr10" style="color: #795548"></i>{__("Changelog")}
                                </a>
                            </li>
                            <!-- Changelog -->

                            <!-- Build -->
                            <li>
                                <div class="static">
                                    <i class="fa fa-copyright fa-fw mr10" style="color: #795548"></i>{__("Build")} v{$system['system_version']}
                                </div>
                            </li>
                            <!-- Build -->
                            
                        </ul>
                    </div>
                </div>
            {/if}
            <!-- Sngine -->

        </div>
        <!-- left panel -->
        
        <!-- right panel -->
        <div class="col-md-8 col-lg-9 offcanvas-mainbar">
            {include file="admin.$view.tpl"}
        </div>
        <!-- right panel -->
        
    </div>
</div>
<!-- page content -->

{include file='_footer.tpl'}