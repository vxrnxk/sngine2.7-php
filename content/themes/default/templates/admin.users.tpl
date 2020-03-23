<div class="card">
    <div class="card-header with-icon">
        {if $sub_view == "banned"}
            <div class="float-right">
                <a href="{$system['system_url']}/{$control_panel['url']}/blacklist" class="btn btn-sm btn-danger">
                    <i class="fa fa-minus-circle"></i><span class="ml5 d-none d-lg-inline-block">{__("Manage Banned IPs")}</span>
                </a>
            </div>
        {elseif $sub_view == "find"}
            <div class="float-right">
                <a href="{$system['system_url']}/{$control_panel['url']}/users" class="btn btn-sm btn-light">
                    <i class="fa fa-arrow-circle-left mr5"></i>{__("Go Back")}
                </a>
            </div>
        {elseif $sub_view == "edit"}
            <div class="float-right">
                <a href="{$system['system_url']}/{$control_panel['url']}/users" class="btn btn-sm btn-light">
                    <i class="fa fa-arrow-circle-left"></i><span class="ml5 d-none d-lg-inline-block">{__("Go Back")}</span>
                </a>
                <a target="_blank" href="{$system['system_url']}/{$data['user_name']}" class="btn btn-sm btn-info">
                    <i class="fa fa-tv"></i><span class="ml5 d-none d-lg-inline-block">{__("View Profile")}</span>
                </a>
                <button type="button" class="btn btn-sm btn-danger js_admin-deleter" data-handle="user_posts" data-id="{$data['user_id']}">
                    <i class="fa fa-trash-alt"></i><span class="ml5 d-none d-lg-inline-block">{__("Delete All Posts")}</span>
                </button>
            </div>
        {/if}
        <i class="fa fa-user mr10"></i>{__("Users")}
        {if $sub_view != "" && $sub_view != "edit"} &rsaquo; {__($sub_view|capitalize)}{/if}
        {if $sub_view == "edit"} &rsaquo; {$data['user_firstname']} {$data['user_lastname']}{/if}
    </div>

    {if $sub_view == "" || $sub_view == "admins" || $sub_view == "moderators" || $sub_view == "online" || $sub_view == "banned" || $sub_view == "find"}
        
        <div class="card-body">

            {if $sub_view == ""}
                <div class="form-row">
                    <div class="col-sm-4">
                        <div class="stat-panel bg-gradient-primary">
                            <div class="stat-cell">
                                <i class="fa fa-users bg-icon"></i>
                                <span class="text-xlg">{$insights['users']}</span><br>
                                <span class="text-lg">{__("Users")}</span><br>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="stat-panel bg-gradient-red">
                            <div class="stat-cell">
                                <i class="fa fa-minus-circle bg-icon"></i>
                                <span class="text-xlg">{$insights['banned']}</span><br>
                                <span class="text-lg">{__("Banned")}</span><br>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="stat-panel bg-gradient-warning">
                            <div class="stat-cell">
                                <i class="fa fa-envelope bg-icon"></i>
                                <span class="text-xlg">{$insights['not_activated']}</span><br>
                                <span class="text-lg">{__("Not Activated")}</span><br>
                            </div>
                        </div>
                    </div>
                </div>
            {/if}

            <!-- search form -->
            <div class="mb20">
                <form class="form-inline" action="{$system['system_url']}/{$control_panel['url']}/users/find" method="get">
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
                    {__('Search by Username, First Name, Last Name, Email or Phone')}
                </div>
            </div>
            <!-- search form -->

            <div class="table-responsive">
                <table class="table table-striped table-bordered table-hover">
                    <thead>
                        <tr>
                            <th>{__("ID")}</th>
                            <th>{__("Name")}</th>
                            <th>{__("Username")}</th>
                            <th>{__("Joined")}</th>
                            <th>{__("Activated")}</th>
                            <th>{__("Actions")}</th>
                        </tr>
                    </thead>
                    <tbody>
                        {if $rows}
                            {foreach $rows as $row}
                                <tr>
                                    <td><a href="{$system['system_url']}/{$row['user_name']}" target="_blank">{$row['user_id']}</a></td>
                                    <td>
                                        <a target="_blank" href="{$system['system_url']}/{$row['user_name']}">
                                            <img class="tbl-image" src="{$row['user_picture']}">
                                            {$row['user_firstname']} {$row['user_lastname']}
                                        </a>
                                    </td>
                                    <td>
                                        <a href="{$system['system_url']}/{$row['user_name']}" target="_blank">
                                            {$row['user_name']}
                                        </a>
                                    </td>
                                    <td>{$row['user_registered']|date_format:"%e %B %Y"}</td>
                                    <td>
                                        {if $row['user_activated']}
                                            <span class="badge badge-pill badge-lg badge-success">{__("Yes")}</span>
                                        {else}
                                            <span class="badge badge-pill badge-lg badge-danger">{__("No")}</span>
                                        {/if}
                                    </td>
                                    <td>
                                        <a data-toggle="tooltip" data-placement="top" title='{__("Edit")}' href="{$system['system_url']}/{$control_panel['url']}/users/edit/{$row['user_id']}" class="btn btn-sm btn-icon btn-rounded btn-primary">
                                            <i class="fa fa-pencil-alt"></i>
                                        </a>
                                        <button data-toggle="tooltip" data-placement="top" title='{__("Delete")}' class="btn btn-sm btn-icon btn-rounded btn-danger js_admin-deleter" data-handle="user" data-id="{$row['user_id']}">
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

    {elseif $sub_view == "edit"}
        
        <div class="card-body">
            <div class="row">
                <div class="col-12 col-md-2 text-center mb20">
                    <img class="img-fluid img-thumbnail rounded-circle" src="{$data['user_picture']}">
                </div>
                <div class="col-12 col-md-5 mb20">
                    <ul class="list-group">
                        <li class="list-group-item">
                            <span class="float-right badge badge-lg badge-pill badge-secondary">{$data['user_id']}</span>
                            {__("User ID")}
                        </li>
                        <li class="list-group-item">
                            <span class="float-right badge badge-lg badge-pill badge-secondary">{$data['user_registered']|date_format:"%e %B %Y"}</span>
                            {__("Joined")}
                        </li>
                        <li class="list-group-item">
                            <span class="float-right badge badge-lg badge-pill badge-secondary">{$data['user_last_seen']|date_format:"%e %B %Y"}</span>
                            {__("Last Login")}
                        </li>
                    </ul>
                </div>
                <div class="col-12 col-md-5 mb20">
                    <ul class="list-group">
                        <li class="list-group-item">
                            <span class="float-right badge badge-lg badge-pill badge-secondary">{$data['friends']}</span>
                            {__("Friends")}
                        </li>
                        <li class="list-group-item">
                            <span class="float-right badge badge-lg badge-pill badge-secondary">{$data['followings']}</span>
                            {__("Followings")}
                        </li>
                        <li class="list-group-item">
                            <span class="float-right badge badge-lg badge-pill badge-secondary">{$data['followers']}</span>
                            {__("Followers")}
                        </li>
                    </ul>
                </div>
            </div>

            <!-- tabs nav -->
            <ul class="nav nav-tabs mb20">
                <li class="nav-item">
                    <a class="nav-link active" href="#account" data-toggle="tab">
                        <i class="fa fa-cog fa-fw mr5"></i><strong class="mr5">{__("Account")}</strong>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#profile" data-toggle="tab">
                        <i class="fa fa-user fa-fw mr5"></i><strong class="mr5">{__("Profile")}</strong>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#privacy" data-toggle="tab">
                        <i class="fa fa-lock fa-fw mr5"></i><strong class="mr5">{__("Privacy")}</strong>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#security" data-toggle="tab">
                        <i class="fa fa-shield-alt fa-fw mr5"></i><strong class="mr5">{__("Security")}</strong>
                    </a>
                </li>
                {if $system['packages_enabled']}
                    <li class="nav-item">
                        <a class="nav-link" href="#membership" data-toggle="tab">
                            <i class="fa fa-id-card fa-fw mr5"></i><strong class="mr5">{__("Membership")}</strong>
                        </a>
                    </li>
                {/if}
                {if $system['ads_enabled'] || $system['points_enabled']}
                    <li class="nav-item">
                        <a class="nav-link" href="#extra" data-toggle="tab">
                            <i class="fa fa-cubes fa-fw mr5"></i><strong class="mr5">{__("Extra")}</strong>
                        </a>
                    </li>
                {/if}
            </ul>
            <!-- tabs nav -->

            <!-- tabs content -->
            <div class="tab-content">
                <!-- account tab -->
                <div class="tab-pane active" id="account">
                    <form class="js_ajax-forms " data-url="admin/users.php?id={$data['user_id']}&do=edit_account">
                        <div class="form-group form-row">
                            <label class="col-md-3 form-control-label">
                                {__("Verified User")}
                            </label>
                            <div class="col-md-9">
                                <label class="switch" for="user_verified">
                                    <input type="checkbox" name="user_verified" id="user_verified" {if $data['user_verified']}checked{/if}>
                                    <span class="slider round"></span>
                                </label>
                            </div>
                        </div>

                        <div class="form-group form-row">
                            <label class="col-md-3 form-control-label">
                                {__("Banned")}
                            </label>
                            <div class="col-md-9">
                                <label class="switch" for="user_banned">
                                    <input type="checkbox" name="user_banned" id="user_banned" {if $data['user_banned']}checked{/if}>
                                    <span class="slider round"></span>
                                </label>
                            </div>
                        </div>

                        <div class="form-group form-row">
                            <label class="col-md-3 form-control-label">
                                {__("Account Activated")}
                            </label>
                            <div class="col-md-9">
                                <label class="switch" for="user_activated">
                                    <input type="checkbox" name="user_activated" id="user_activated" {if $data['user_activated']}checked{/if}>
                                    <span class="slider round"></span>
                                </label>
                                <span class="form-text">
                                    {if !$system['activation_enabled']}
                                        {__("Account activation disabled from your system")} <a target="_blank" href="{$system['system_url']}/{$control_panel['url']}/settings/registration">{{__("Registration Settings")}}</a>
                                    {else}
                                        {if $system['activation_type'] == "email"}
                                            {__("Account activation enabled from your system settings by")} {__("Email")}
                                        {else}
                                            {__("Account activation enabled from your system settings by")} {__("SMS")}
                                        {/if}
                                    {/if}
                                </span>
                            </div>
                        </div>

                        {if $system['two_factor_enabled'] && $data['user_two_factor_enabled']}
                            <div class="form-group form-row">
                                <label class="col-md-3 form-control-label">
                                    {__("Two-Factor Authentication")}
                                </label>
                                <div class="col-md-9">
                                    <label class="switch" for="user_two_factor_enabled">
                                        <input type="checkbox" name="user_two_factor_enabled" id="user_two_factor_enabled" {if $data['user_two_factor_enabled']}checked{/if}>
                                        <span class="slider round"></span>
                                    </label>
                                    <span class="form-text">
                                    </span>
                                </div>
                            </div>
                        {/if}

                        <div class="form-group form-row">
                            <label class="col-md-3 form-control-label">
                                {__("User Group")}
                            </label>
                            <div class="col-md-9">
                                <select class="form-control" name="user_group">
                                    <option value="1" {if $data['user_group'] == '1'}selected{/if}>
                                        {__("Administrators")}
                                    </option>
                                    <option value="2" {if $data['user_group'] == '2'}selected{/if}>
                                        {__("Moderators")}
                                    </option>
                                    <option value="3" {if $data['user_group'] == '3'}selected{/if}>
                                        {__("Users")}
                                    </option>
                                </select>
                            </div>
                        </div>

                        <div class="form-group form-row">
                            <label class="col-md-3 form-control-label">
                                {__("Username")}
                            </label>
                            <div class="col-md-9">
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text d-none d-sm-block">{$system['system_url']}/</span>
                                    </div>
                                    <input type="text" class="form-control" name="user_name" value="{$data['user_name']}">
                                </div>
                            </div>
                        </div>

                        <div class="form-group form-row">
                            <label class="col-md-3 form-control-label">
                                {__("Email Address")}
                            </label>
                            <div class="col-md-9">
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"><i class="fas fa-envelope"></i></span>
                                    </div>
                                    <input type="text" class="form-control" name="user_email" value="{$data['user_email']}">
                                </div>
                            </div>
                        </div>

                        <div class="form-group form-row">
                            <label class="col-md-3 form-control-label">
                                {__("Email Verified")}
                            </label>
                            <div class="col-md-9">
                                <label class="switch" for="user_email_verified">
                                    <input type="checkbox" name="user_email_verified" id="user_email_verified" {if $data['user_email_verified']}checked{/if}>
                                    <span class="slider round"></span>
                                </label>
                            </div>
                        </div>

                        {if ($system['activation_enabled'] && $system['activation_type'] == "sms") || ($system['two_factor_enabled'] && $system['two_factor_type'] == "sms")}
                            <div class="form-group form-row">
                                <label class="col-md-3 form-control-label">
                                    {__("Phone Number")}
                                </label>
                                <div class="col-md-9">
                                    <input type="text" class="form-control" name="user_phone" value="{$data['user_phone']}">
                                    <span class="form-text">
                                        {__("Phone number (eg. +905...)")}
                                    </span>
                                </div>
                            </div>

                            <div class="form-group form-row">
                                <label class="col-md-3 form-control-label">
                                    {__("Phone Verified")}
                                </label>
                                <div class="col-md-9">
                                    <label class="switch" for="user_phone_verified">
                                        <input type="checkbox" name="user_phone_verified" id="user_phone_verified" {if $data['user_phone_verified']}checked{/if}>
                                        <span class="slider round"></span>
                                    </label>
                                </div>
                            </div>
                        {/if}

                        <div class="form-group form-row">
                            <label class="col-md-3 form-control-label">
                                {__("Password")}
                            </label>
                            <div class="col-md-9">
                                <input type="password" class="form-control" name="user_password">
                            </div>
                        </div>

                        <div class="form-row">
                            <div class="col-md-9 offset-md-3">
                                <button type="submit" class="btn btn-primary">{__("Save Changes")}</button>
                                <button type="button" class="btn btn-danger js_admin-deleter" data-handle="user" data-id="{$data['user_id']}" data-redirect="{$system['system_url']}/{$control_panel['url']}/users">
                                    <i class="fa fa-trash-alt mr5"></i>{__("Delete User")}
                                </button>
                            </div>
                        </div>

                        <!-- success -->
                        <div class="alert alert-success mb0 mt20 x-hidden"></div>
                        <!-- success -->

                        <!-- error -->
                        <div class="alert alert-danger mb0 mt20 x-hidden"></div>
                        <!-- error -->
                    </form>
                </div>
                <!-- account tab -->

                <!-- profile tab -->
                <div class="tab-pane" id="profile">
                    <form class="js_ajax-forms " data-url="admin/users.php?id={$data['user_id']}&do=edit_profile">

                        <div class="heading-small mb20">
                            {__("Basic")}
                        </div>
                        <div class="pl-md-4">
                            <div class="row">
                                <div class="form-group col-md-6">
                                    <label class="form-control-label">{__("First Name")}</label>
                                    <input class="form-control" name="user_firstname" value="{$data['user_firstname']}">
                                </div>

                                <div class="form-group col-md-6">
                                    <label class="form-control-label">{__("Last Name")}</label>
                                    <input class="form-control" name="user_lastname" value="{$data['user_lastname']}">
                                </div>
                            </div>

                            <div class="row">
                                <div class="form-group col-md-6">
                                    <label class="form-control-label">{__("I am")}</label>
                                    <select class="form-control" name="user_gender">
                                        <option value="none">{__("Select Sex")}:</option>
                                        <option {if $data['user_gender'] == "male"}selected{/if} value="male">{__("Male")}</option>
                                        <option {if $data['user_gender'] == "female"}selected{/if} value="female">{__("Female")}</option>
                                        <option {if $data['user_gender'] == "other"}selected{/if} value="other">{__("Other")}</option>
                                    </select>
                                </div>

                                <div class="form-group col-md-6">
                                    <label class="form-control-label">{__("Relationship Status")}</label>
                                    <select name="user_relationship" class="form-control">
                                        <option value="none">{__("Select Relationship")}</option>
                                        <option {if $data['user_relationship'] == "single"}selected{/if} value="single">{__("Single")}</option>
                                        <option {if $data['user_relationship'] == "relationship"}selected{/if} value="relationship">{__("In a relationship")}</option>
                                        <option {if $data['user_relationship'] == "married"}selected{/if} value="married">{__("Married")}</option>
                                        <option {if $data['user_relationship'] == "complicated"}selected{/if} value="complicated">{__("It's complicated")}</option>
                                        <option {if $data['user_relationship'] == "separated"}selected{/if} value="separated">{__("Separated")}</option>
                                        <option {if $data['user_relationship'] == "divorced"}selected{/if} value="divorced">{__("Divorced")}</option>
                                        <option {if $data['user_relationship'] == "widowed"}selected{/if} value="widowed">{__("Widowed")}</option>
                                    </select>
                                </div>
                            </div>

                            <div class="row">
                                <div class="form-group col-md-6">
                                    <label class="form-control-label">{__("Country")}</label>
                                    <select class="form-control" name="user_country">
                                        <option value="none">{__("Select Country")}</option>
                                        {foreach $countries as $country}
                                            <option {if $data['user_country'] == $country['country_id']}selected{/if} value="{$country['country_id']}">{$country['country_name']}</option>
                                        {/foreach}
                                    </select>
                                </div>

                                <div class="form-group col-md-6">
                                    <label class="form-control-label">{__("Website")}</label>
                                    <input type="text" class="form-control" name="user_website" value="{$data['user_website']}">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="form-control-label">{__("Birthdate")}</label>
                                <div class="form-row">
                                    <div class="col">
                                        <select class="form-control" name="birth_month">
                                            <option value="none">{__("Select Month")}</option>
                                            <option {if $data['user_birthdate_parsed']['month'] == '1'}selected{/if} value="1">{__("Jan")}</option>
                                            <option {if $data['user_birthdate_parsed']['month'] == '2'}selected{/if} value="2">{__("Feb")}</option>
                                            <option {if $data['user_birthdate_parsed']['month'] == '3'}selected{/if} value="3">{__("Mar")}</option>
                                            <option {if $data['user_birthdate_parsed']['month'] == '4'}selected{/if} value="4">{__("Apr")}</option>
                                            <option {if $data['user_birthdate_parsed']['month'] == '5'}selected{/if} value="5">{__("May")}</option>
                                            <option {if $data['user_birthdate_parsed']['month'] == '6'}selected{/if} value="6">{__("Jun")}</option>
                                            <option {if $data['user_birthdate_parsed']['month'] == '7'}selected{/if} value="7">{__("Jul")}</option>
                                            <option {if $data['user_birthdate_parsed']['month'] == '8'}selected{/if} value="8">{__("Aug")}</option>
                                            <option {if $data['user_birthdate_parsed']['month'] == '9'}selected{/if} value="9">{__("Sep")}</option>
                                            <option {if $data['user_birthdate_parsed']['month'] == '10'}selected{/if} value="10">{__("Oct")}</option>
                                            <option {if $data['user_birthdate_parsed']['month'] == '11'}selected{/if} value="11">{__("Nov")}</option>
                                            <option {if $data['user_birthdate_parsed']['month'] == '12'}selected{/if} value="12">{__("Dec")}</option>
                                        </select>
                                    </div>
                                    <div class="col">
                                        <select class="form-control" name="birth_day">
                                            <option value="none">{__("Select Day")}</option>
                                            {for $i=1 to 31}
                                                <option {if $data['user_birthdate_parsed']['day'] == $i}selected{/if} value="{$i}">{$i}</option>
                                            {/for}
                                        </select>
                                    </div>
                                    <div class="col">
                                        <select class="form-control" name="birth_year">
                                            <option value="none">{__("Select Year")}</option>
                                            {for $i=1905 to 2015}
                                                <option {if $data['user_birthdate_parsed']['year'] == $i}selected{/if} value="{$i}">{$i}</option>
                                            {/for}
                                        </select>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="form-control-label">{__("About Me")}</label>
                                <textarea class="form-control" name="user_biography">{$data['user_biography']}</textarea>
                            </div>

                            <!-- custom fields -->
                            {if $custom_fields['basic']}
                            {include file='__custom_fields.tpl' _custom_fields=$custom_fields['basic'] _registration=false}
                            {/if}
                            <!-- custom fields -->
                        </div>

                        <div class="divider"></div>

                        <div class="heading-small mb20">
                            {__("Work")}
                        </div>
                        <div class="pl-md-4">
                            <div class="form-group">
                                <label class="form-control-label">{__("Work Title")}</label>
                                <input type="text" class="form-control" name="user_work_title" value="{$data['user_work_title']}">
                            </div>

                            <div class="row">
                                <div class="form-group col-md-6">
                                    <label class="form-control-label">{__("Work Place")}</label>
                                    <input type="text" class="form-control" name="user_work_place" value="{$data['user_work_place']}">
                                </div>

                                <div class="form-group col-md-6">
                                    <label class="form-control-label">{__("Work Website")}</label>
                                    <input type="text" class="form-control" name="user_work_url" value="{$data['user_work_url']}">
                                </div>
                            </div>

                            <!-- custom fields -->
                            {if $custom_fields['work']}
                            {include file='__custom_fields.tpl' _custom_fields=$custom_fields['work'] _registration=false}
                            {/if}
                            <!-- custom fields -->
                        </div>

                        <div class="divider"></div>

                        <div class="heading-small mb20">
                            {__("Location")}
                        </div>
                        <div class="pl-md-4">
                            <div class="form-group">
                                <label class="form-control-label">{__("Current City")}</label>
                                <input type="text" class="form-control" name="user_current_city" value="{$data['user_current_city']}">
                            </div>

                            <div class="form-group">
                                <label class="form-control-label">{__("Hometown")}</label>
                                <input type="text" class="form-control" name="user_hometown" value="{$data['user_hometown']}">
                            </div>

                            <!-- custom fields -->
                            {if $custom_fields['location']}
                            {include file='__custom_fields.tpl' _custom_fields=$custom_fields['location'] _registration=false}
                            {/if}
                            <!-- custom fields -->
                        </div>

                        <div class="divider"></div>

                        <div class="heading-small mb20">
                            {__("Education")}
                        </div>
                        <div class="pl-md-4">
                            <div class="form-group">
                                <label class="form-control-label">{__("School")}</label>
                                <input type="text" class="form-control" name="user_edu_school" value="{$data['user_edu_school']}">
                            </div>

                            <div class="row">
                                <div class="form-group col-md-6">
                                    <label class="form-control-label">{__("Major")}</label>
                                    <input type="text" class="form-control" name="user_edu_major" value="{$data['user_edu_major']}">
                                </div>

                                <div class="form-group col-md-6">
                                    <label class="form-control-label">{__("Class")}</label>
                                    <input type="text" class="form-control" name="user_edu_class" value="{$data['user_edu_class']}">
                                </div>
                            </div>

                            <!-- custom fields -->
                            {if $custom_fields['education']}
                            {include file='__custom_fields.tpl' _custom_fields=$custom_fields['education'] _registration=false}
                            {/if}
                            <!-- custom fields -->
                        </div>

                        <div class="divider"></div>

                        <div class="heading-small mb20">
                            {__("Social Links")}
                        </div>
                        <div class="pl-md-4">
                            <div class="row">
                                <div class="form-group col-md-6">
                                    <label class="form-control-label">{__("Facebook Profile URL")}</label>
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text bg-transparent"><i class="fab fa-facebook fa-lg" style="color: #3B579D"></i></span>
                                        </div>
                                        <input type="text" class="form-control" name="facebook" value="{$data['user_social_facebook']}" placeholder="{__("Facebook Profile URL")}">
                                    </div>
                                </div>

                                <div class="form-group col-md-6">
                                    <label class="form-control-label">{__("Twitter Profile URL")}</label>
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text bg-transparent"><i class="fab fa-twitter fa-lg" style="color: #55ACEE"></i></span>
                                        </div>
                                        <input type="text" class="form-control" name="twitter" value="{$data['user_social_twitter']}" placeholder="{__("Twitter Profile URL")}">
                                    </div>
                                </div>

                                <div class="form-group col-md-6">
                                    <label class="form-control-label">{__("YouTube Profile URL")}</label>
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text bg-transparent"><i class="fab fa-youtube fa-lg" style="color: #E62117"></i></span>
                                        </div>
                                        <input type="text" class="form-control" name="youtube" value="{$data['user_social_youtube']}" placeholder="{__("YouTube Profile URL")}">
                                    </div>
                                </div>
                            
                                <div class="form-group col-md-6">
                                    <label class="form-control-label">{__("Instagram Profile URL")}</label>
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text bg-transparent"><i class="fab fa-instagram fa-lg" style="color: #3f729b"></i></span>
                                        </div>
                                        <input type="text" class="form-control" name="instagram" value="{$data['user_social_instagram']}" placeholder="{__("Instagram Profile URL")}">
                                    </div>
                                </div>

                                <div class="form-group col-md-6">
                                    <label class="form-control-label">{__("LinkedIn Profile URL")}</label>
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text bg-transparent"><i class="fab fa-linkedin fa-lg" style="color: #1A84BC"></i></span>
                                        </div>
                                        <input type="text" class="form-control" name="linkedin" value="{$data['user_social_linkedin']}" placeholder="{__("LinkedIn Profile URL")}">
                                    </div>
                                </div>
                                
                                <div class="form-group col-md-6">
                                    <label class="form-control-label">{__("Vkontakte Profile URL")}</label>
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text bg-transparent"><i class="fab fa-vk fa-lg" style="color: #527498"></i></span>
                                        </div>
                                        <input type="text" class="form-control" name="vkontakte" value="{$data['user_social_vkontakte']}" placeholder="{__("Vkontakte Profile URL")}">
                                    </div>
                                </div>
                            </div>
                        </div>

                        {if $custom_fields['other']}
                            <div class="divider"></div>
                            <div class="heading-small mb20">
                                {__("Other")}
                            </div>
                            <div class="pl-md-4">
                                <!-- custom fields -->
                                {if $custom_fields['other']}
                                {include file='__custom_fields.tpl' _custom_fields=$custom_fields['other'] _registration=false}
                                {/if}
                                <!-- custom fields -->
                            </div>
                        {/if}
                        
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <button type="reset" class="btn btn-md btn-block btn-light">{__("Reset")}</button>
                            </div>

                            <div class="form-group col-md-6">
                                <button type="submit" class="btn btn-md btn-block btn-primary">{__("Save Changes")}</button>
                            </div>
                        </div>

                        <!-- success -->
                        <div class="alert alert-success x-hidden"></div>
                        <!-- success -->

                        <!-- error -->
                        <div class="alert alert-danger x-hidden"></div>
                        <!-- error -->
                    </form>
                </div>
                <!-- profile tab -->

                <!-- privacy tab -->
                <div class="tab-pane" id="privacy">
                    <form class="js_ajax-forms " data-url="admin/users.php?id={$data['user_id']}&do=edit_privacy">
                        <div class="form-table-row">
                            <div>
                                <div class="form-control-label h6">{__("Chat Enabled")}</div>
                                <div class="form-text d-none d-sm-block">{__("If chat disabled you will appear offline and will no see who is online too")}</div>
                            </div>
                            <div class="text-right">
                                <label class="switch" for="privacy_chat">
                                    <input type="checkbox" name="privacy_chat" id="privacy_chat" {if $data['user_chat_enabled']}checked{/if}>
                                    <span class="slider round"></span>
                                </label>
                            </div>
                        </div>

                        <div class="form-table-row">
                            <div>
                                <div class="form-control-label h6">{__("Email you with our newsletter")}</div>
                                <div class="form-text d-none d-sm-block">{__("From time to time we send newsletter email to all of our members")}</div>
                            </div>
                            <div class="text-right">
                                <label class="switch" for="privacy_newsletter">
                                    <input type="checkbox" name="privacy_newsletter" id="privacy_newsletter" {if $data['user_privacy_newsletter']}checked{/if}>
                                    <span class="slider round"></span>
                                </label>
                            </div>
                        </div>

                        <div class="row">
                            {if $system['pokes_enabled']}
                                <div class="form-group col-md-6">
                                    <label class="form-control-label">{__("Who can poke you")}</label>
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text"><i class="fas fa-hand-point-right"></i></span>
                                        </div>
                                        <select class="form-control" name="privacy_poke">
                                            <option {if $data['user_privacy_poke'] == "public"}selected{/if} value="public">
                                                {__("Everyone")}
                                            </option>
                                            <option {if $data['user_privacy_poke'] == "friends"}selected{/if} value="friends">
                                                {__("Friends")}
                                            </option>
                                            <option {if $data['user_privacy_poke'] == "me"}selected{/if} value="me">
                                                {__("No One")}
                                            </option>
                                        </select>
                                    </div>
                                </div>
                            {/if}

                            {if $system['gifts_enabled']}
                                <div class="form-group col-md-6">
                                    <label class="form-control-label">{__("Who can send you gifts")}</label>
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text"><i class="fas fa-gift"></i></span>
                                        </div>
                                        <select class="form-control" name="privacy_gifts">
                                            <option {if $data['user_privacy_gifts'] == "public"}selected{/if} value="public">
                                                {__("Everyone")}
                                            </option>
                                            <option {if $data['user_privacy_gifts'] == "friends"}selected{/if} value="friends">
                                                {__("Friends")}
                                            </option>
                                            <option {if $data['user_privacy_gifts'] == "me"}selected{/if} value="me">
                                                {__("No One")}
                                            </option>
                                        </select>
                                    </div>
                                </div>
                            {/if}
                            
                            <div class="form-group col-md-6">
                                <label class="form-control-label">{__("Who can post on your wall")}</label>
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"><i class="fas fa-newspaper"></i></span>
                                    </div>
                                    <select class="form-control" name="privacy_wall" id="privacy_wall">
                                        <option {if $data['user_privacy_wall'] == "public"}selected{/if} value="public">
                                            {__("Everyone")}
                                        </option>
                                        <option {if $data['user_privacy_wall'] == "friends"}selected{/if} value="friends">
                                            {__("Friends")}
                                        </option>
                                        <option {if $data['user_privacy_wall'] == "me"}selected{/if} value="me">
                                            {__("Just Me")}
                                        </option>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group col-md-6">
                                <label class="form-control-label">{__("Who can see your")} {__("birthdate")}</label>
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"><i class="fas fa-birthday-cake"></i></span>
                                    </div>
                                    <select class="form-control" name="privacy_birthdate" id="privacy_birthdate">
                                        <option {if $data['user_privacy_birthdate'] == "public"}selected{/if} value="public">
                                            {__("Everyone")}
                                        </option>
                                        <option {if $data['user_privacy_birthdate'] == "friends"}selected{/if} value="friends">
                                            {__("Friends")}
                                        </option>
                                        <option {if $data['user_privacy_birthdate'] == "me"}selected{/if} value="me">
                                            {__("Just Me")}
                                        </option>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group col-md-6">
                                <label class="form-control-label">{__("Who can see your")} {__("relationship")}</label>
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"><i class="fas fa-heart"></i></span>
                                    </div>
                                    <select class="form-control" name="privacy_relationship" id="privacy_relationship">
                                        <option {if $data['user_privacy_relationship'] == "public"}selected{/if} value="public">
                                            {__("Everyone")}
                                        </option>
                                        <option {if $data['user_privacy_relationship'] == "friends"}selected{/if} value="friends">
                                            {__("Friends")}
                                        </option>
                                        <option {if $data['user_privacy_relationship'] == "me"}selected{/if} value="me">
                                            {__("Just Me")}
                                        </option>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group col-md-6">
                                <label class="form-control-label">{__("Who can see your")} {__("basic info")}</label>
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"><i class="fas fa-user"></i></span>
                                    </div>
                                    <select class="form-control" name="privacy_basic" id="privacy_basic">
                                        <option {if $data['user_privacy_basic'] == "public"}selected{/if} value="public">
                                            {__("Everyone")}
                                        </option>
                                        <option {if $data['user_privacy_basic'] == "friends"}selected{/if} value="friends">
                                            {__("Friends")}
                                        </option>
                                        <option {if $data['user_privacy_basic'] == "me"}selected{/if} value="me">
                                            {__("Just Me")}
                                        </option>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group col-md-6">
                                <label class="form-control-label">{__("Who can see your")} {__("work info")}</label>
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"><i class="fas fa-briefcase"></i></span>
                                    </div>
                                    <select class="form-control" name="privacy_work" id="privacy_work">
                                        <option {if $data['user_privacy_work'] == "public"}selected{/if} value="public">
                                            {__("Everyone")}
                                        </option>
                                        <option {if $data['user_privacy_work'] == "friends"}selected{/if} value="friends">
                                            {__("Friends")}
                                        </option>
                                        <option {if $data['user_privacy_work'] == "me"}selected{/if} value="me">
                                            {__("Just Me")}
                                        </option>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group col-md-6">
                                <label class="form-control-label">{__("Who can see your")} {__("location info")}</label>
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"><i class="fas fa-map-marker-alt"></i></span>
                                    </div>
                                    <select class="form-control" name="privacy_location" id="privacy_location">
                                        <option {if $data['user_privacy_location'] == "public"}selected{/if} value="public">
                                            {__("Everyone")}
                                        </option>
                                        <option {if $data['user_privacy_location'] == "friends"}selected{/if} value="friends">
                                            {__("Friends")}
                                        </option>
                                        <option {if $data['user_privacy_location'] == "me"}selected{/if} value="me">
                                            {__("Just Me")}
                                        </option>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group col-md-6">
                                <label class="form-control-label">{__("Who can see your")} {__("education info")}</label>
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"><i class="fas fa-university"></i></span>
                                    </div>
                                    <select class="form-control" name="privacy_education" id="privacy_education">
                                        <option {if $data['user_privacy_education'] == "public"}selected{/if} value="public">
                                            {__("Everyone")}
                                        </option>
                                        <option {if $data['user_privacy_education'] == "friends"}selected{/if} value="friends">
                                            {__("Friends")}
                                        </option>
                                        <option {if $data['user_privacy_education'] == "me"}selected{/if} value="me">
                                            {__("Just Me")}
                                        </option>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group col-md-6">
                                <label class="form-control-label">{__("Who can see your")} {__("other info")}</label>
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"><i class="fas fa-folder-plus"></i></span>
                                    </div>
                                    <select class="form-control" name="privacy_other" id="privacy_other">
                                        <option {if $data['user_privacy_other'] == "public"}selected{/if} value="public">
                                            {__("Everyone")}
                                        </option>
                                        <option {if $data['user_privacy_other'] == "friends"}selected{/if} value="friends">
                                            {__("Friends")}
                                        </option>
                                        <option {if $data['user_privacy_other'] == "me"}selected{/if} value="me">
                                            {__("Just Me")}
                                        </option>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group col-md-6">
                                <label class="form-control-label">{__("Who can see your")} {__("friends")}</label>
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"><i class="fas fa-user-friends"></i></span>
                                    </div>
                                    <select class="form-control" name="privacy_friends" id="privacy_friends">
                                        <option {if $data['user_privacy_friends'] == "public"}selected{/if} value="public">
                                            {__("Everyone")}
                                        </option>
                                        <option {if $data['user_privacy_friends'] == "friends"}selected{/if} value="friends">
                                            {__("Friends")}
                                        </option>
                                        <option {if $data['user_privacy_friends'] == "me"}selected{/if} value="me">
                                            {__("Just Me")}
                                        </option>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group col-md-6">
                                <label class="form-control-label">{__("Who can see your")} {__("photos")}</label>
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"><i class="fas fa-images"></i></span>
                                    </div>
                                    <select class="form-control" name="privacy_photos" id="privacy_photos">
                                        <option {if $data['user_privacy_photos'] == "public"}selected{/if} value="public">
                                            {__("Everyone")}
                                        </option>
                                        <option {if $data['user_privacy_photos'] == "friends"}selected{/if} value="friends">
                                            {__("Friends")}
                                        </option>
                                        <option {if $data['user_privacy_photos'] == "me"}selected{/if} value="me">
                                            {__("Just Me")}
                                        </option>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group col-md-6">
                                <label class="form-control-label">{__("Who can see your")} {__("liked pages")}</label>
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"><i class="fas fa-flag"></i></span>
                                    </div>
                                    <select class="form-control" name="privacy_pages" id="privacy_pages">
                                        <option {if $data['user_privacy_pages'] == "public"}selected{/if} value="public">
                                            {__("Everyone")}
                                        </option>
                                        <option {if $data['user_privacy_pages'] == "friends"}selected{/if} value="friends">
                                            {__("Friends")}
                                        </option>
                                        <option {if $data['user_privacy_pages'] == "me"}selected{/if} value="me">
                                            {__("Just Me")}
                                        </option>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group col-md-6">
                                <label class="form-control-label">{__("Who can see your")} {__("joined groups")}</label>
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"><i class="fas fa-users"></i></span>
                                    </div>
                                    <select class="form-control" name="privacy_groups" id="privacy_groups">
                                        <option {if $data['user_privacy_groups'] == "public"}selected{/if} value="public">
                                            {__("Everyone")}
                                        </option>
                                        <option {if $data['user_privacy_groups'] == "friends"}selected{/if} value="friends">
                                            {__("Friends")}
                                        </option>
                                        <option {if $data['user_privacy_groups'] == "me"}selected{/if} value="me">
                                            {__("Just Me")}
                                        </option>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group col-md-6">
                                <label class="form-control-label">{__("Who can see your")} {__("joined events")}</label>
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"><i class="fas fa-calendar"></i></span>
                                    </div>
                                    <select class="form-control" name="privacy_events" id="privacy_events">
                                        <option {if $data['user_privacy_events'] == "public"}selected{/if} value="public">
                                            {__("Everyone")}
                                        </option>
                                        <option {if $data['user_privacy_events'] == "friends"}selected{/if} value="friends">
                                            {__("Friends")}
                                        </option>
                                        <option {if $data['user_privacy_events'] == "me"}selected{/if} value="me">
                                            {__("Just Me")}
                                        </option>
                                    </select>
                                </div>
                            </div>
                        </div>

                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <button type="reset" class="btn btn-md btn-block btn-light">{__("Reset")}</button>
                            </div>

                            <div class="form-group col-md-6">
                                <button type="submit" class="btn btn-md btn-block btn-primary">{__("Save Changes")}</button>
                            </div>
                        </div>

                        <!-- success -->
                        <div class="alert alert-success x-hidden"></div>
                        <!-- success -->

                        <!-- error -->
                        <div class="alert alert-danger x-hidden"></div>
                        <!-- error -->
                    </form>
                </div>
                <!-- privacy tab -->

                <!-- security tab -->
                <div class="tab-pane" id="security">
                    <div class="table-responsive">
                        <table class="table table-striped table-bordered table-hover js_dataTable">
                            <thead>
                                <tr>
                                    <th>{__("ID")}</th>
                                    <th>{__("Browser")}</th>
                                    <th>{__("OS")}</th>
                                    <th>{__("Date")}</th>
                                    <th>{__("IP")}</th>
                                    <th>{__("Actions")}</th>
                                </tr>
                            </thead>
                            <tbody>
                                {foreach $data['sessions'] as $session}
                                    <tr>
                                        <td>{$session@iteration}</td>
                                        <td>{$session['user_browser']}</td>
                                        <td>{$session['user_os']}</td>
                                        <td>
                                            <span class="js_moment" data-time="{$session['session_date']}">{$session['session_date']}</span>
                                        </td>
                                        <td>{$session['user_ip']}</td>
                                        <td>
                                            <button data-toggle="tooltip" data-placement="top" title='{__("End Session")}' class="btn btn-sm btn-icon btn-rounded btn-danger js_admin-deleter" data-handle="session" data-id="{$session['session_id']}">
                                                <i class="fa fa-trash-alt"></i>
                                            </button>
                                        </td>
                                    </tr>
                                {/foreach}
                            </tbody>
                        </table>
                    </div>
                </div>
                <!-- security tab -->

                <!-- membership tab -->
                <div class="tab-pane" id="membership">
                    <form class="js_ajax-forms " data-url="admin/users.php?id={$data['user_id']}&do=edit_membership">
                        {if $data['user_subscribed']}
                            <div class="heading-small mb20">
                                {__("Package Details")}
                            </div>
                            <div class="pl-md-4">
                                <div class="form-group form-row">
                                    <label class="col-md-3 form-control-label">
                                        {__("Package")}
                                    </label>
                                    <div class="col-md-9">
                                        <p class="form-control-plaintext">
                                            {$data['name']} ({$system['system_currency_symbol']}{$data['price']} 
                                            {if $data['period'] == "life"}{__("Life Time")}{else}{__("per")} {if $data['period_num'] != '1'}{$data['period_num']}{/if} {__($data['period']|ucfirst)}{/if})
                                        </p>
                                    </div>
                                </div>

                                <div class="form-group form-row">
                                    <label class="col-md-3 form-control-label">
                                        {__("Subscription Date")}
                                    </label>
                                    <div class="col-md-9">
                                        <p class="form-control-plaintext">
                                            {$data['user_subscription_date']|date_format:"%e %B %Y"}
                                        </p>
                                    </div>
                                </div>

                                <div class="form-group form-row">
                                    <label class="col-md-3 form-control-label">
                                        {__("Expiration Date")}
                                    </label>
                                    <div class="col-md-9">
                                        <p class="form-control-plaintext">
                                            {if $data['period'] == "life"}
                                                {__("Life Time")}
                                            {else}
                                                {$data['subscription_end']|date_format:"%e %B %Y"} ({if $data['subscription_timeleft'] > 0}{__("Remaining")} {$data['subscription_timeleft']} {__("Days")}{else}{__("Expired")}{/if})
                                            {/if}
                                        </p>
                                    </div>
                                </div>

                                <div class="form-group form-row">
                                    <label class="col-md-3 form-control-label">
                                        {__("Boosted Posts")}
                                    </label>
                                    <div class="col-md-9">
                                        <p class="form-control-plaintext">
                                            {$data['user_boosted_posts']}/{$data['boost_posts']}
                                        </p>
                                        
                                        <div class="progress mb5">
                                            <div class="progress-bar progress-bar-info progress-bar-striped" role="progressbar" aria-valuenow="{($data['user_boosted_posts']/$data['boost_pages'])*100}" aria-valuemin="0" aria-valuemax="100" style="width: {($data['user_boosted_posts']/$data['boost_pages'])*100}%"></div>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group form-row">
                                    <label class="col-md-3 form-control-label">
                                        {__("Boosted Pages")}
                                    </label>
                                    <div class="col-md-9">
                                        <p class="form-control-plaintext">
                                            {$data['user_boosted_pages']}/{$data['boost_pages']}
                                        </p>
                                        
                                        <div class="progress mb5">
                                            <div class="progress-bar progress-bar-warning progress-bar-striped" role="progressbar" aria-valuenow="{($data['user_boosted_pages']/$data['boost_pages'])*100}" aria-valuemin="0" aria-valuemax="100" style="width: {($data['user_boosted_pages']/$data['boost_pages'])*100}%"></div>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-row">
                                    <div class="col-md-9 offset-md-3">
                                        {if $data['user_subscribed']}
                                            <button type="button" class="btn btn-danger js_admin-deleter" data-handle="user_package" data-id="{$data['user_id']}">
                                                <i class="fa fa-trash-alt mr10"></i>{__("Remove Package")}
                                            </button>
                                        {/if}
                                    </div>
                                </div>
                            </div>

                            <div class="divider"></div>
                        {/if}

                        <div class="heading-small mb20">
                            {__("Upgrade Package")}
                        </div>
                        <div class="pl-md-4">
                            <div class="form-group form-row">
                                <label class="col-md-3 form-control-label">
                                    {__("Select Package")}
                                </label>
                                <div class="col-md-9">
                                    <select class="form-control" name="package">
                                        {foreach $packages as $package}
                                            <option value="{$package['package_id']}" {if $data['user_package'] == $package['package_id']}selected{/if}>
                                                {$package['name']} ({$system['system_currency_symbol']}{$package['price']} 
                                                {if $package['period'] == "life"}{__("Life Time")}{else}{__("per")} {if $package['period_num'] != '1'}{$package['period_num']}{/if} {__($package['period']|ucfirst)}{/if})
                                            </option>
                                        {/foreach}
                                    </select>
                                </div>
                            </div>

                            <div class="form-row">
                                <div class="col-md-9 offset-md-3">
                                    <button type="submit" class="btn btn-primary">{__("Save Changes")}</button>
                                </div>
                            </div>

                            <!-- success -->
                            <div class="alert alert-success mb0 mt20 x-hidden"></div>
                            <!-- success -->

                            <!-- error -->
                            <div class="alert alert-danger mb0 mt20 x-hidden"></div>
                            <!-- error -->
                        </div>
                    </form>
                </div>
                <!-- membership tab -->

                <!-- extra tab -->
                <div class="tab-pane" id="extra">
                    {if $system['ads_enabled']}
                        <div class="heading-small mb20">
                            {__("Wallet")}
                        </div>
                        <div class="pl-md-4">
                            <form class="js_ajax-forms " data-url="admin/users.php?id={$data['user_id']}&do=edit_wallet">
                                <div class="form-group form-row">
                                    <label class="col-md-3 form-control-label">
                                        {__("Wallet Balance")}
                                    </label>
                                    <div class="col-md-9">
                                        <div class="input-group">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text">{$system['system_currency_symbol']}</span>
                                            </div>
                                            <input type="text" class="form-control" placeholder="0.00" min="1.00" max="1000" name="user_wallet_balance" value="{$data['user_wallet_balance']}">
                                        </div>
                                    </div>
                                </div>

                                <div class="form-row">
                                    <div class="col-md-9 offset-md-3">
                                        <button type="submit" class="btn btn-primary">{__("Save Changes")}</button>
                                    </div>
                                </div>

                                <!-- success -->
                                <div class="alert alert-success mb0 mt20 x-hidden"></div>
                                <!-- success -->

                                <!-- error -->
                                <div class="alert alert-danger mb0 mt20 x-hidden"></div>
                                <!-- error -->
                            </form>
                        </div>

                        <div class="divider"></div>
                    {/if}

                    {if $system['points_enabled']}
                        <div class="heading-small mb20">
                            {__("Points")}
                        </div>
                        <div class="pl-md-4">
                            <form class="js_ajax-forms " data-url="admin/users.php?id={$data['user_id']}&do=edit_points">
                                <div class="form-group form-row">
                                    <label class="col-md-3 form-control-label">
                                        {__("Points Balance")}
                                    </label>
                                    <div class="col-md-9">
                                        <div class="input-group">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text"><i class="fa fa-piggy-bank"></i></span>
                                            </div>
                                            <input class="form-control" name="user_points" value="{$data['user_points']}">
                                        </div>
                                    </div>
                                </div>

                                <div class="form-row">
                                    <div class="col-md-9 offset-md-3">
                                        <button type="submit" class="btn btn-primary">{__("Save Changes")}</button>
                                    </div>
                                </div>

                                <!-- success -->
                                <div class="alert alert-success mb0 mt20 x-hidden"></div>
                                <!-- success -->

                                <!-- error -->
                                <div class="alert alert-danger mb0 mt20 x-hidden"></div>
                                <!-- error -->
                            </form>
                        </div>
                    {/if}
                </div>
                <!-- extra tab -->
            </div>
            <!-- tabs content -->
        </div>

    {/if}
</div>