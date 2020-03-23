<!doctype html>
<html lang="{$system['language']['code']}" {if $system['language']['dir'] == "RTL"} dir="RTL" {/if}>
    <head>
        <!-- Meta -->
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-type" content="text/html; charset=UTF-8">
        
        <!-- Title -->
        <title>{__("My Information")}</title>

        <!-- Fonts [Roboto|Font-Awesome] -->
        <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700" rel="stylesheet" />
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
        <!-- Fonts [Roboto|Font-Awesome] -->
        
        <!-- CSS -->
        {if $system['language']['dir'] == "LTR"}
            <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
            <style type="text/css">{include file="../css/style.css"}</style>
        {else}
            <link rel="stylesheet" href="https://cdn.rtlcss.com/bootstrap/v4.2.1/css/bootstrap.min.css" integrity="sha384-vus3nQHTD+5mpDiZ4rkEPlnkcyTP+49BhJ4wJeJunw06ZAp+wzzeBPUXr42fi8If" crossorigin="anonymous">
            <style type="text/css">{include file="../css/style.rtl.css"}</style>
        {/if}
        <!-- CSS -->

        <!-- CSS Customized -->
        <style>
            body {
                padding-top: 0;
            }
            header {
                background: var(--header-bg-color);
                text-align: center;
                font-size: 34px;
                font-weight: 300;
                line-height: 70px;
                padding: 70px 0 100px;
            }
            header a, 
            header a:hover {
                color: #fff;
            }
            .user-profile-picture {
                position: absolute;
                top: -50px;
                left: 50%;
                transform: translate(-50%);
            }
        </style>
        <!-- CSS Customized -->
    </head>
    <body {if $system['theme_mode_night']}class="night-mode"{/if}>
        <!-- header -->
        <header>
            <a href="{$system['system_url']}">{$system['system_title']}</a>
        </header>
        <!-- header -->

        <!-- container -->
        <div class="container" style="margin-top: -25px;">
            <div class="card shadow">
                <div class="card-body page-content">
                    <!-- welcome -->
                    <div class="text-center">
                        <img class="img-thumbnail rounded-circle user-profile-picture" src="{$user->_data['user_picture']}" width="99" height="99">
                    </div>
                    <h3 class="mtb20 text-center"><span class="text-primary">{$user->_data['user_firstname']} {$user->_data['user_lastname']}</span></h3>
                    <!-- welcome -->

                    <!-- information & sessions -->
                    {if $user_data['information']}
                        <!-- information -->
                        <div class="section-title bg-gradient-primary mb20">
                            <i class="fa fa-coins mr10"></i>{__("Your Information")}
                        </div>
                        <ul class="list-group mb20">
                            <li class="list-group-item">
                                <span class="float-right badge badge-lg badge-pill badge-secondary">{$user_data['information']['user_id']}</span>
                                {__("User ID")}
                            </li>
                            <li class="list-group-item">
                                <span class="float-right badge badge-lg badge-pill badge-secondary">{$user_data['information']['user_name']}</span>
                                {__("User Name")}
                            </li>
                            <li class="list-group-item">
                                <span class="float-right badge badge-lg badge-pill badge-secondary">{$user_data['information']['user_firstname']}</span>
                                {__("User First Name")}
                            </li>
                            <li class="list-group-item">
                                <span class="float-right badge badge-lg badge-pill badge-secondary">{$user_data['information']['user_lastname']}</span>
                                {__("User Last Name")}
                            </li>
                            <li class="list-group-item">
                                <span class="float-right badge badge-lg badge-pill badge-secondary">{$user_data['information']['user_email']}</span>
                                {__("User Email")}
                            </li>
                            <li class="list-group-item">
                                <span class="float-right badge badge-lg badge-pill badge-secondary">{$user_data['information']['user_phone']}</span>
                                {__("User Phone")}
                            </li>
                            <li class="list-group-item">
                                <span class="float-right badge badge-lg badge-pill badge-secondary">{$user_data['information']['user_gender']}</span>
                                {__("User Gender")}
                            </li>
                            <li class="list-group-item">
                                <span class="float-right badge badge-lg badge-pill badge-secondary">{$user_data['information']['user_registered']|date_format:"%e %B %Y"}</span>
                                {__("Joined")}
                            </li>
                            <li class="list-group-item">
                                <span class="float-right badge badge-lg badge-pill badge-secondary">{$user_data['information']['user_last_seen']|date_format:"%e %B %Y"}</span>
                                {__("Last Login")}
                            </li>
                        </ul>
                        <!-- information -->

                        <!-- sessions -->
                        <div class="section-title bg-gradient-red mb20">
                            <i class="fa fa-shield-alt mr10"></i>{__("Your Sessions")}
                        </div>
                        {if $user_data['information']['sessions']}
                            <div class="table-responsive">
                                <table class="table table-bordered table-hover {if $system['theme_mode_night']}table-dark{/if}">
                                    <thead>
                                        <tr>
                                            <th>{__("ID")}</th>
                                            <th>{__("Browser")}</th>
                                            <th>{__("OS")}</th>
                                            <th>{__("Date")}</th>
                                            <th>{__("IP")}</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        {foreach $user_data['information']['sessions'] as $session}
                                            <tr>
                                                <td>{$session@iteration}</td>
                                                <td>
                                                    {$session['user_browser']} {if $session['session_id'] == $user->_data['active_session_id']}<span class="badge badge-pill badge-lg badge-success">{__("Active Session")}</span>{/if}
                                                </td>
                                                <td>{$session['user_os']}</td>
                                                <td>
                                                    <span class="js_moment" data-time="{$session['session_date']}">{$session['session_date']}</span>
                                                </td>
                                                <td>{$session['user_ip']}</td>
                                            </tr>
                                        {/foreach}
                                    </tbody>
                                </table>
                            </div>
                        {else}
                            <p class="text-center text-muted mt10">
                                {__("No data to show")}
                            </p>
                        {/if}
                        <!-- sessions -->
                    {/if}
                    <!-- information & sessions -->

                    <!-- friends -->
                    {if is_array($user_data['friends'])}
                        <div class="section-title bg-gradient-teal mb20">
                            <i class="fa fa-users mr10"></i>{__("Your Friends")} <span class="badge badge-pill badge-lg badge-warning">{count($user_data['friends'])}</span>
                        </div>
                        {if $user_data['friends']}
                            <ul class="row">
                                {foreach $user_data['friends'] as $_user}
                                {include file='__feeds_user.tpl' _tpl="box" _connection=$_user["connection"] _no_action=true}
                                {/foreach}
                            </ul>
                        {else}
                            <p class="text-center text-muted mt10">
                                {__("No data to show")}
                            </p>
                        {/if}
                    {/if}
                    <!-- friends -->

                    <!-- followings -->
                    {if is_array($user_data['followings'])}
                        <div class="section-title bg-gradient-teal mb20">
                            <i class="fa fa-users mr10"></i>{__("Your Followings")} <span class="badge badge-pill badge-lg badge-warning">{count($user_data['followings'])}</span>
                        </div>
                        {if $user_data['followings']}
                            <ul class="row">
                                {foreach $user_data['followings'] as $_user}
                                {include file='__feeds_user.tpl' _tpl="box" _connection=$_user["connection"] _no_action=true}
                                {/foreach}
                            </ul>
                        {else}
                            <p class="text-center text-muted mt10">
                                {__("No data to show")}
                            </p>
                        {/if}
                    {/if}
                    <!-- followings -->

                    <!-- followers -->
                    {if is_array($user_data['followers'])}
                        <div class="section-title bg-gradient-teal mb20">
                            <i class="fa fa-users mr10"></i>{__("Your Followers")} <span class="badge badge-pill badge-lg badge-warning">{count($user_data['followers'])}</span>
                        </div>
                        {if $user_data['followers']}
                            <ul class="row">
                                {foreach $user_data['followers'] as $_user}
                                {include file='__feeds_user.tpl' _tpl="box" _connection=$_user["connection"] _no_action=true}
                                {/foreach}
                            </ul>
                        {else}
                            <p class="text-center text-muted mt10">
                                {__("No data to show")}
                            </p>
                        {/if}
                    {/if}
                    <!-- followers -->

                    <!-- pages -->
                    {if is_array($user_data['pages'])}
                        <div class="section-title bg-gradient-warning mb20">
                            <i class="fa fa-flag mr10"></i>{__("Your Likes")} <span class="badge badge-pill badge-lg badge-warning">{count($user_data['pages'])}</span>
                        </div>
                        {if $user_data['pages']}
                            <ul class="row">
                                {foreach $user_data['pages'] as $_page}
                                    {include file='__feeds_page.tpl' _tpl="box"}
                                {/foreach}
                            </ul>
                        {else}
                            <p class="text-center text-muted mt10">
                                {__("No data to show")}
                            </p>
                        {/if}
                    {/if}
                    <!-- pages -->

                    <!-- groups -->
                    {if is_array($user_data['groups'])}
                        <div class="section-title bg-gradient-warning mb20">
                            <i class="fa fa-users mr10"></i>{__("Your groups")} <span class="badge badge-pill badge-lg badge-warning">{count($user_data['groups'])}</span>
                        </div>
                        {if $user_data['groups']}
                            <ul class="row">
                                {foreach $user_data['groups'] as $_group}
                                    {include file='__feeds_group.tpl' _tpl="box" _no_action=true}
                                {/foreach}
                            </ul>
                        {else}
                            <p class="text-center text-muted mt10">
                                {__("No data to show")}
                            </p>
                        {/if}
                    {/if}
                    <!-- groups -->

                    <!-- events -->
                    {if is_array($user_data['events'])}
                        <div class="section-title bg-gradient-warning mb20">
                            <i class="fa fa-calendar mr10"></i>{__("Your events")} <span class="badge badge-pill badge-lg badge-warning">{count($user_data['events'])}</span>
                        </div>
                        {if $user_data['events']}
                            <ul class="row">
                                {foreach $user_data['events'] as $_event}
                                    {include file='__feeds_event.tpl' _tpl="box"}
                                {/foreach}
                            </ul>
                        {else}
                            <p class="text-center text-muted mt10">
                                {__("No data to show")}
                            </p>
                        {/if}
                    {/if}
                    <!-- events -->

                    <!-- posts -->
                    {if is_array($user_data['posts'])}
                        <div class="section-title bg-gradient-purple mb20">
                            <i class="fa fa-newspaper mr10"></i>{__("Your posts")}
                        </div>
                        {if $user_data['posts']}
                            <ul>
                                {foreach $user_data['posts'] as $post}
                                {include file='__feeds_post.tpl' _get="posts_information"}
                                {/foreach}
                            </ul>
                        {else}
                            <p class="text-center text-muted mt10">
                                {__("No data to show")}
                            </p>
                        {/if}
                    {/if}
                    <!-- posts -->
                </div>
            </div>
        </div>
        <!-- container -->

        <!-- footer -->
        <div class="container">
            <div class="footer text-center">
                &copy; {'Y'|date} {$system['system_title']}
            </div>
        </div>
        <!-- footer -->
    </body>
</html>