<div class="card">
    <div class="card-header with-icon">
        <i class="fa fa-tachometer-alt mr10"></i>{__("Dashboard")}
    </div>
    <div class="card-body">
        {if $user->_is_admin}
            <div id="admin-chart-dashboard" class="admin-chart mb20"></div>
            <div class="form-row">
                <div class="col-sm-3">
                    <div class="stat-panel bg-gradient-primary">
                        <div class="stat-cell">
                            <i class="fa fa-users bg-icon"></i>
                            <span class="text-xlg">{$insights['users']}</span><br>
                            <span class="text-lg">{__("Users")}</span><br>
                            <a href="{$system['system_url']}/{$control_panel['url']}/users">{__("Manage Users")}</a>
                        </div>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="stat-panel bg-gradient-indigo">
                        <div class="stat-cell">
                            <i class="fa fa-male bg-icon"></i>
                            <span class="text-xlg">{$insights['users_males']}</span><br>
                            <span>{$insights['users_males_percent']}%</span><br>
                            <span class="text-lg">{__("Males")}</span><br>
                        </div>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="stat-panel bg-gradient-pink">
                        <div class="stat-cell">
                            <i class="fa fa-female bg-icon"></i>
                            <span class="text-xlg">{$insights['users_females']}</span><br>
                            <span>{$insights['users_females_percent']}%</span><br>
                            <span class="text-lg">{__("Females")}</span><br>
                        </div>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="stat-panel bg-gradient-purple">
                        <div class="stat-cell">
                            <i class="fa fa-user bg-icon"></i>
                            <span class="text-xlg">{$insights['users_others']}</span><br>
                            <span>{$insights['users_others_percent']}%</span><br>
                            <span class="text-lg">{__("Others")}</span><br>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-4">
                    <div class="stat-panel bg-gradient-red">
                        <div class="stat-cell">
                            <i class="fa fa-minus-circle bg-icon"></i>
                            <span class="text-xlg">{$insights['banned']}</span><br>
                            <span class="text-lg">{__("Banned")}</span><br>
                            <a href="{$system['system_url']}/{$control_panel['url']}/users/banned">{__("Manage Banned")}</a>
                        </div>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="stat-panel bg-gradient-warning">
                        <div class="stat-cell">
                            <i class="fa fa-envelope bg-icon"></i>
                            <span class="text-xlg">{$insights['not_activated']}</span><br>
                            <span class="text-lg">{__("Not Activated")}</span><br>
                            <a href="{$system['system_url']}/{$control_panel['url']}/users">{__("Manage Users")}</a>
                        </div>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="stat-panel bg-gradient-teal">
                        <div class="stat-cell">
                            <i class="fa fa-clock bg-icon"></i>
                            <span class="text-xlg">{$insights['online']}</span><br>
                            <span class="text-lg">{__("Online")}</span><br>
                            <a href="{$system['system_url']}/{$control_panel['url']}/users/online">{__("Manage Online")}</a>
                        </div>
                    </div>
                </div>
            </div>
        {/if}
        <div class="form-row">
            <div class="col-sm-6">
                <div class="stat-panel bg-gradient-success">
                    <div class="stat-cell">
                        <i class="fa fa-newspaper bg-icon"></i>
                        <span class="text-xlg">{$insights['posts']}</span><br>
                        <span class="text-lg">{__("Posts")}</span><br>
                        <a href="{$system['system_url']}/{$control_panel['url']}/posts">{__("Manage Posts")}</a>
                    </div>
                </div>
            </div>
            <div class="col-sm-6">
                <div class="stat-panel bg-gradient-success">
                    <div class="stat-cell">
                        <i class="fa fa-comments bg-icon"></i>
                        <span class="text-xlg">{$insights['comments']}</span><br>
                        <span class="text-lg">{__("Comments")}</span><br>
                        <a href="{$system['system_url']}/{$control_panel['url']}/reports">{__("Manage Reports")}</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="form-row">
            <div class="col-sm-4">
                <div class="stat-panel bg-gradient-primary">
                    <div class="stat-cell">
                        <i class="fa fa-flag bg-icon"></i>
                        <span class="text-xlg">{$insights['pages']}</span><br>
                        <span class="text-lg">{__("Pages")}</span><br>
                        <a href="{$system['system_url']}/{$control_panel['url']}/pages">{__("Manage Pages")}</a>
                    </div>
                </div>
            </div>
            <div class="col-sm-4">
                <div class="stat-panel bg-gradient-primary">
                    <div class="stat-cell">
                        <i class="fa fa-users bg-icon"></i>
                        <span class="text-xlg">{$insights['groups']}</span><br>
                        <span class="text-lg">{__("Groups")}</span><br>
                        <a href="{$system['system_url']}/{$control_panel['url']}/groups">{__("Manage Groups")}</a>
                    </div>
                </div>
            </div>
            <div class="col-sm-4">
                <div class="stat-panel bg-gradient-primary">
                    <div class="stat-cell">
                        <i class="fa fa-calendar bg-icon"></i>
                        <span class="text-xlg">{$insights['events']}</span><br>
                        <span class="text-lg">{__("Events")}</span><br>
                        <a href="{$system['system_url']}/{$control_panel['url']}/events">{__("Manage Events")}</a>
                    </div>
                </div>
            </div>
        </div>
        {if $user->_is_admin}
            <div class="form-row">
                <div class="col-sm-6">
                    <div class="stat-panel bg-gradient-info">
                        <div class="stat-cell">
                            <i class="fa fa-comments bg-icon"></i>
                            <span class="text-xlg">{$insights['messages']}</span><br>
                            <span class="text-lg">{__("Messages")}</span><br>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="stat-panel bg-gradient-cyan">
                        <div class="stat-cell">
                            <i class="fa fa-globe bg-icon"></i>
                            <span class="text-xlg">{$insights['notifications']}</span><br>
                            <span class="text-lg">{__("Notifications")}</span><br>
                        </div>
                    </div>
                </div>
            </div>
        {/if}
    </div>
</div>