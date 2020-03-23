{if !$user->_logged_in}
    <body data-hash-tok="{$session_hash['token']}" data-hash-pos="{$session_hash['position']}" class="{if $system['theme_mode_night']}night-mode{/if} visitor n_chat {if $page == 'index' || $page == 'sign'}index-body{/if}" {if ($page == 'index' || $page == 'sign') && !$system['system_wallpaper_default'] && $system['system_wallpaper']} style="background-image: url('{$system['system_uploads']}/{$system['system_wallpaper']}'); background-size: cover;" {/if} {if $page == 'profile' && $system['system_profile_background_enabled'] && $profile['user_profile_background']}style="background: url({$profile['user_profile_background']}) fixed !important; background-size: 100% auto;"{/if}>
{else}
    <body data-hash-tok="{$session_hash['token']}" data-hash-pos="{$session_hash['position']}" data-chat-enabled="{$user->_data['user_chat_enabled']}" class="{if $system['theme_mode_night']}night-mode{/if} {if !$system['chat_enabled']}n_chat{/if}{if $system['activation_enabled'] && !$user->_data['user_activated']} n_activated{/if}{if !$system['system_live']} n_live{/if}" {if $page == 'profile' && $system['system_profile_background_enabled'] && $profile['user_profile_background']}style="background: url({$profile['user_profile_background']}) fixed !important; background-size: 100% auto;"{/if} {if $page == "share" && $url}onload="initialize_scraper()"{/if}>
{/if}
    
    <!-- main wrapper -->
    <div class="main-wrapper">
        {if $user->_logged_in && $system['activation_enabled'] && !$user->_data['user_activated']}
            <!-- top-bar -->
            <div class="top-bar">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-7 d-none d-sm-block">
                            {if $system['activation_type'] == "email"}
                                {__("Please go to")} <span class="text-primary">{$user->_data['user_email']}</span> {__("to complete the activation process")}.
                            {else}
                                {__("Please check the SMS on your phone")} <strong>{$user->_data['user_phone']}</strong> {__("to complete the activation process")}.
                            {/if}
                        </div>
                        <div class="col-sm-5">
                            {if $system['activation_type'] == "email"}
                                <span class="text-link" data-toggle="modal" data-url="core/activation_email_resend.php">
                                    {__("Resend Verification Email")}
                                </span>
                                 - 
                                <span class="text-link" data-toggle="modal" data-url="#activation-email-reset">
                                    {__("Change Email")}
                                </span>
                            {else}
                                <span class="btn btn-info btn-sm mr10" data-toggle="modal" data-url="#activation-phone">{__("Enter Code")}</span>
                                {if $user->_data['user_phone']}
                                    <span class="text-link" data-toggle="modal" data-url="core/activation_phone_resend.php">
                                        {__("Resend SMS")}
                                    </span>
                                     - 
                                {/if}
                                <span class="text-link" data-toggle="modal" data-url="#activation-phone-reset">
                                    {__("Change Phone Number")}
                                </span>
                            {/if}
                        </div>
                    </div>
                </div>
            </div>
            <!-- top-bar -->
        {/if}

        {if !$system['system_live']}
            <!-- top-bar alert-->
            <div class="top-bar danger">
                <div class="container">
                    <i class="fa fa-exclamation-triangle fa-lg pr5"></i>
                    <span class="d-none d-sm-inline">{__("The system has been shutted down")}.</span>
                    <span>{__("Turn it on from")}</span> <a href="{$system['system_url']}/admincp/settings">{__("Admin Panel")}</a>
                </div>
            </div>
            <!-- top-bar alert-->
        {/if}

        <!-- main-header -->
        <div class="main-header">
            <div class="container">
                <div class="row">

                    <div class="{if !$user->_logged_in}col-6{/if} col-md-4 col-lg-3 {if $user->_logged_in}d-none d-md-block{/if}">
                        <!-- logo-wrapper -->
                        <div class="logo-wrapper {if $user->_logged_in}d-none d-md-block{/if}">
                            <!-- logo -->
                            <a href="{$system['system_url']}" class="logo">
                                {if $system['system_logo']}
                                    <img class="img-fluid" src="{$system['system_uploads']}/{$system['system_logo']}" alt="{$system['system_title']}" title="{$system['system_title']}">
                                {else}
                                    {$system['system_title']}
                                {/if}
                            </a>
                            <!-- logo -->
                        </div>
                        <!-- logo-wrapper -->
                    </div>

                    <div class="{if !$user->_logged_in}col-6{/if} col-md-8 col-lg-9">
                        <div class="row">
                            <div class="col-md-7 col-lg-8">
                                <!-- search-wrapper -->
                                {if $user->_logged_in || (!$user->_logged_in && $system['system_public']) }
                                    {include file='_header.search.tpl'}
                                {/if}
                                <!-- search-wrapper -->
                            </div>
                            <div class="col-md-5 col-lg-4">
                                <!-- navbar-wrapper -->
                                <div class="navbar-wrapper">
                                    <ul class="clearfix">
                                        {if $user->_logged_in}
                                            <!-- bars -->
                                            <li class="d-block d-md-none">
                                                <a href="#" data-toggle="offcanvas">
                                                    <i class="fa fa-bars fa-lg"></i>
                                                </a>
                                            </li>
                                            <!-- bars -->

                                            <!-- home -->
                                            <li class="d-block d-md-none">
                                                <a href="{$system['system_url']}">
                                                    <i class="fa fa-home fa-lg"></i>
                                                </a>
                                            </li>
                                            <!-- home -->

                                            <!-- friend requests -->
                                            {include file='_header.friend_requests.tpl'}
                                            <!-- friend requests -->

                                            <!-- messages -->
                                            {include file='_header.messages.tpl'}
                                            <!-- messages -->

                                            <!-- notifications -->
                                            {include file='_header.notifications.tpl'}
                                            <!-- notifications -->

                                            <!-- search -->
                                            <li class="d-block d-md-none">
                                                <a href="{$system['system_url']}/search">
                                                    <i class="fa fa-search fa-lg"></i>
                                                </a>
                                            </li>
                                            <!-- search -->

                                            <!-- user-menu -->
                                            <li class="dropdown">
                                                <a href="#" class="dropdown-toggle user-menu" data-toggle="dropdown" data-display="static">
                                                    <img src="{$user->_data['user_picture']}">
                                                    <span class="d-none">{$user->_data['user_firstname']}</span>
                                                </a>
                                                <div class="dropdown-menu dropdown-menu-right">
                                                    {if $system['packages_enabled'] && !$user->_data['user_subscribed']}
                                                        <a class="dropdown-item" href="{$system['system_url']}/packages">{__("Upgrade to Pro")}</a>
                                                    {/if}
                                                    {if $system['points_enabled'] || $system['ads_enabled']}
                                                        {if $system['points_enabled']}
                                                            <a class="dropdown-item" href="{$system['system_url']}/settings/points">{__("Points")}: <span class="badge badge-info">{$user->_data['user_points']}</span></a>
                                                        {/if}
                                                        {if $system['ads_enabled']}
                                                            <a class="dropdown-item" href="{$system['system_url']}/wallet">{__("Wallet")}: <span class="badge badge-success">{$system['system_currency_symbol']}{$user->_data['user_wallet_balance']|number_format:2}</span></a>
                                                        {/if}
                                                        <div class="dropdown-divider"></div>
                                                    {/if}
                                                    <a class="dropdown-item" href="{$system['system_url']}/{$user->_data['user_name']}">{__("Profile")}</a>
                                                    <a class="dropdown-item" href="{$system['system_url']}/settings">{__("Settings")}</a>
                                                    <a class="dropdown-item" href="{$system['system_url']}/settings/privacy">{__("Privacy")}</a>
                                                    {if $user->_is_admin}
                                                        <div class="dropdown-divider"></div>
                                                        <a class="dropdown-item" href="{$system['system_url']}/admincp">{__("Admin Panel")}</a>
                                                    {elseif $user->_is_moderator}
                                                        <div class="dropdown-divider"></div>
                                                        <a class="dropdown-item" href="{$system['system_url']}/modcp">{__("Moderator Panel")}</a>
                                                    {/if}
                                                    <div class="dropdown-divider"></div>
                                                    <a class="dropdown-item" href="{$system['system_url']}/signout">{__("Log Out")}</a>
                                                    <div class="dropdown-divider"></div>
                                                    <div class="dropdown-item pointer" data-toggle="modal" data-url="#keyboard-shortcuts" data-size="small">
                                                        {__("Keyboard Shortcuts")}
                                                        <span class="float-right">
                                                            <i class="fas fa-keyboard"></i>
                                                        </span>
                                                    </div>
                                                    {if $system['system_theme_mode_select']}
                                                        {if $system['theme_mode_night']}
                                                            <div class="dropdown-item pointer js_theme-mode" data-mode="day">
                                                                <span class="js_theme-mode-text">{__("Day Mode")}</span>
                                                                <span class="float-right">
                                                                    <i class="js_theme-mode-icon fas fa-sun"></i>
                                                                </span>
                                                            </div>
                                                        {else}
                                                            <div class="dropdown-item pointer js_theme-mode" data-mode="night">
                                                                <span class="js_theme-mode-text">{__("Night Mode")}</span>
                                                                <span class="float-right">
                                                                    <i class="js_theme-mode-icon fas fa-moon"></i>
                                                                </span>
                                                            </div>
                                                        {/if}
                                                    {/if}
                                                </div>
                                            </li>
                                            <!-- user-menu -->

                                        {else}

                                            <li class="dropdown float-right">
                                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" data-display="static">
                                                    <span>{__("Join")}</span>
                                                </a>
                                                <div class="dropdown-menu dropdown-menu-right">
                                                    <a class="dropdown-item" href="{$system['system_url']}/signin">{__("Login")}</a>
                                                    {if $system['registration_enabled'] || (!$system['registration_enabled'] && $system['invitation_enabled'])}
                                                        <a class="dropdown-item" href="{$system['system_url']}/signup">{__("Register")}</a>
                                                    {/if}
                                                    {if $system['system_theme_mode_select']}
                                                        <div class="dropdown-divider"></div>
                                                        {if $system['theme_mode_night']}
                                                            <div class="dropdown-item pointer js_theme-mode" data-mode="day">
                                                                <span class="js_theme-mode-text">{__("Day Mode")}</span>
                                                                <span class="float-right">
                                                                    <i class="js_theme-mode-icon fas fa-sun"></i>
                                                                </span>
                                                            </div>
                                                        {else}
                                                            <div class="dropdown-item pointer js_theme-mode" data-mode="night">
                                                                <span class="js_theme-mode-text">{__("Night Mode")}</span>
                                                                <span class="float-right">
                                                                    <i class="js_theme-mode-icon fas fa-moon"></i>
                                                                </span>
                                                            </div>
                                                        {/if}
                                                    {/if}
                                                </div>
                                            </li>

                                        {/if}
                                    </ul>
                                </div>
                                <!-- navbar-wrapper -->
                            </div>
                        </div>
                            
                    </div>
                </div>
                        
            </div>
        </div>
        <!-- main-header -->
        
        <!-- ads -->
        {include file='_ads.tpl' _ads=$ads_master['header'] _master=true}
        <!-- ads -->