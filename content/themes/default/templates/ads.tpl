{include file='_head.tpl'}
{include file='_header.tpl'}

<!-- page header -->
<div class="page-header bg-2">
    {if $view == "wallet"}
        <img class="floating-img d-none d-md-block" src="{$system['system_url']}/content/themes/{$system['theme']}/images/headers/undraw_wallet_aym5.svg">
    {else}
        <img class="floating-img d-none d-md-block" src="{$system['system_url']}/content/themes/{$system['theme']}/images/headers/undraw_growth_analytics_8btt.svg">
    {/if}
    <div class="crystal c03"></div>
    <div class="circle-2"></div>
    <div class="circle-3"></div>
    <div class="inner">
        <h2>{__("Ads Manager")}</h2>
        <p>{__("Manage Ads, Create new Campaign and Access your Wallet")}</p>
    </div>
</div>
<!-- page header -->

<!-- page content -->
<div class="container offcanvas" style="margin-top: -25px;">
    <div class="row">

        <!-- side panel -->
        <div class="col-12 d-block d-md-none offcanvas-sidebar">
            {include file='_sidebar.tpl'}
        </div>
        <!-- side panel -->

        <!-- content panel -->
        <div class="col-12 offcanvas-mainbar">

            <!-- tabs -->
            <div class="content-tabs rounded-sm shadow-sm clearfix">
                <ul>
                    <li {if $view == ""}class="active"{/if}>
                        <a href="{$system['system_url']}/ads"><i class="fa fa-chart-line mr5"></i>{__("Ads Campaigns")}</a>
                    </li>
                    <li {if $view == "wallet"}class="active"{/if}>
                        <a  href="{$system['system_url']}/wallet"><i class="fa fa-wallet mr5"></i>{__("Wallet")}</a>
                    </li>
                </ul>
            </div>
            <!-- tabs -->

            <!-- adblock-warning-message -->
            <div class="adblock-warning-message mtb10">
                {__("Turn off the ad blocker or add this web page's URL as an exception so you use ads system without any problems")}, {__("After you turn off the ad blocker, you'll need to refresh your screen")}
            </div>
            <!-- adblock-warning-message -->

            {if $view == ""}
                
                <!-- ads campaigns -->
                <div class="card mt20">
                    <div class="card-header with-icon">
                        <a class="btn btn-sm btn-primary float-right" href="{$system['system_url']}/ads/new">
                            <i class="fa fa-plus-circle mr5"></i>{__("New Campaign")}
                        </a>
                        <i class="fa fa-chart-line mr10"></i>{__("My Campaigns")}
                    </div>
                    <div class="card-body">
                        {if $campaigns}
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover js_dataTable">
                                    <thead>
                                        <tr>
                                            <th>{__("Title")}</th>
                                            <th>{__("Start - End Date")}</th>
                                            <th>{__("Budget")}</th>
                                            <th>{__("Spend")}</th>
                                            <th>{__("Bidding")}</th>
                                            <th>{__("Clicks/Views")}</th>
                                            <th>{__("Status")}</th>
                                            <th>{__("Created")}</th>
                                            <th>{__("Actions")}</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        {foreach $campaigns as $campaign}
                                            <tr>
                                                <td>{$campaign['campaign_title']}</td>
                                                <td>
                                                    {$campaign['campaign_start_date']|date_format:"%e %B %Y"} - {$campaign['campaign_end_date']|date_format:"%e %B %Y"}
                                                </td>
                                                <td>{$system['system_currency_symbol']}{$campaign['campaign_budget']|number_format:2}</td>
                                                <td>{$system['system_currency_symbol']}{$campaign['campaign_spend']|number_format:2}</td>
                                                <td>
                                                    <span class="label label-default">
                                                        {if $campaign['campaign_bidding'] == "click"}
                                                            <i class="fa fa-hand-pointer mr5"></i>{__("Click")}
                                                        {else}
                                                            <i class="fa fa-eye mr5"></i>{__("View")}
                                                        {/if}
                                                    </span>
                                                </td>
                                                <td>
                                                    {if $campaign['campaign_bidding'] == "click"}
                                                        {$campaign['campaign_clicks']} {__("Clicks")}
                                                    {else}
                                                        {$campaign['campaign_views']} {__("Views")}
                                                    {/if}
                                                </td>
                                                <td>
                                                    {if $campaign['campaign_is_active']}
                                                        <span class="badge badge-pill badge-lg badge-success">{__("Active")}</span>
                                                    {else}
                                                        <span class="badge badge-pill badge-lg badge-danger">{__("Not Active")}</span>
                                                    {/if}
                                                </td>
                                                <td>
                                                    <span class="js_moment" data-time="{$campaign['campaign_created_date']}">{$campaign['campaign_created_date']}</span>
                                                </td>
                                                <td>
                                                    <a data-toggle="tooltip" data-placement="top" title='{__("Edit")}' href="{$system['system_url']}/ads/edit/{$campaign['campaign_id']}" class="btn btn-sm btn-icon btn-rounded btn-primary">
                                                        <i class="fa fa-pencil-alt"></i>
                                                    </a>
                                                    {if $campaign['campaign_is_active']}
                                                        <button data-toggle="tooltip" data-placement="top" title='{__("Stop")}' class="btn btn-sm btn-icon btn-rounded btn-warning js_ads-stop-campaign" data-id="{$campaign['campaign_id']}">
                                                            <i class="fas fa-stop-circle"></i>
                                                        </button>
                                                    {else}
                                                        <button data-toggle="tooltip" data-placement="top" title='{__("Resume")}' class="btn btn-sm btn-icon btn-rounded btn-success js_ads-resume-campaign" data-id="{$campaign['campaign_id']}">
                                                            <i class="fas fa-play-circle"></i>
                                                        </button>
                                                    {/if}
                                                    <button data-toggle="tooltip" data-placement="top" title='{__("Delete")}' class="btn btn-sm btn-icon btn-rounded btn-danger js_ads-delete-campaign" data-id="{$campaign['campaign_id']}">
                                                        <i class="fas fa-trash"></i>
                                                    </button>
                                                </td>
                                            </tr>
                                        {/foreach}
                                    </tbody>
                                </table>
                            </div>
                        {else}
                            <div class="text-center text-muted mtb10">
                                <img width="15%" src="{$system['system_url']}/content/themes/{$system['theme']}/images/no_results.png">
                                <p class="mt10 mb10"><strong>{__("No data to show")}</strong></p>
                            </div>
                        {/if}
                    </div>
                </div>
                <!-- ads campaigns -->

            {elseif $view == "new"}

                <!-- new campaign -->
                <div class="card mt20">
                    <div class="card-header with-icon">
                        <i class="fa fa-plus-circle mr10"></i>{__("New Campaign")}
                        <div class="float-right">
                            <a href="{$system['system_url']}/ads" class="btn btn-sm btn-light">
                                <i class="fa fa-arrow-circle-left mr5"></i>{__("Go Back")}
                            </a>
                        </div>
                    </div>
                    <form class="js_ajax-forms" data-url="ads/campaign.php?do=create">
                        <div class="card-body">
                            {if $user->_data['user_wallet_balance'] == 0}
                                <div class="bs-callout bs-callout-warning mt0">
                                    {__("Your current wallet credit is")}: <strong>{$system['system_currency_symbol']}{$user->_data['user_wallet_balance']|number_format:2}</strong> {__("You need to")} <a href="{$system['system_url']}/wallet">{__("Replenish your wallet credit")}</a>
                                </div>
                            {/if}

                            <div class="row">
                                <!-- campaign details & target audience -->
                                <div class="col-sm-6">
                                    <!-- campaign details -->
                                    <div class="section-title mb20">
                                        <i class="fa fa-cog mr5"></i>{__("Campaign Details")}
                                    </div>
                                    <div class="form-group">
                                        <label class="form-control-label" for="campaign_title">{__("Campaign Title")}</label>
                                        <input type="text" class="form-control" name="campaign_title" id="campaign_title">
                                        <span class="form-text">
                                            {__("Set a title for your campaign")}
                                        </span>
                                    </div>
                                    <div class="form-group">
                                        <label class="form-control-label" for="campaign_start_date">{__("Campaign Start Date")}</label>
                                        <div class="input-group date js_datetimepicker" id="campaign_start_date" data-target-input="nearest">
                                            <input type='text' class="form-control datetimepicker-input" data-target="#campaign_start_date" name="campaign_start_date" />
                                            <div class="input-group-append" data-target="#campaign_start_date" data-toggle="datetimepicker">
                                                <span class="input-group-text"><i class="fa fa-calendar"></i></span>
                                            </div>
                                        </div>
                                        <span class="form-text">
                                            {__("Set Campaign start datetime (UTC)")}
                                        </span>
                                    </div>
                                    <div class="form-group">
                                        <label class="form-control-label" for="campaign_end_date">{__("Campaign End Date")}</label>
                                        <div class="input-group date js_datetimepicker" id="campaign_end_date" data-target-input="nearest">
                                            <input type='text' class="form-control datetimepicker-input" data-target="#campaign_end_date" name="campaign_end_date" />
                                            <div class="input-group-append" data-target="#campaign_end_date" data-toggle="datetimepicker">
                                                <span class="input-group-text"><i class="fa fa-calendar"></i></span>
                                            </div>
                                        </div>
                                        <span class="form-text">
                                            {__("Set Campaign end datetime (UTC)")}
                                        </span>
                                    </div>
                                    <div class="form-group">
                                        <label class="form-control-label" for="campaign_budget">{__("Campaign Budget")}</label>
                                        <div class="input-money">
                                            <span>{$system['system_currency_symbol']}</span>
                                            <input type="text" class="form-control" placeholder="0.00" min="1.00" max="1000" name="campaign_budget">
                                        </div>
                                        <span class="form-text">
                                            {__("Set a budget for your campaign, campaign will be paused if reached its limit")}
                                        </span>
                                    </div>
                                    <div class="form-group">
                                        <label class="form-control-label" for="campaign_bidding">{__("Campaign Bidding")}</label>
                                        <select class="form-control" name="campaign_bidding">
                                            <option value="click">{__("Pay Per Click")} ({$system['system_currency_symbol']}{$system['ads_cost_click']})</option>
                                            <option value="view">{__("Pay Per View")} ({$system['system_currency_symbol']}{$system['ads_cost_view']})</option>
                                        </select>
                                    </div>
                                    <!-- campaign details -->

                                    <!-- target audience -->
                                    <div class="section-title mb20">
                                        <i class="fa fa-crosshairs mr5"></i>{__("Target Audience")}
                                    </div>
                                    <div class="form-group">
                                        <label class="form-control-label" for="audience_countries">{__("Audience Country")}</label>
                                        <select class="form-control selectpicker" multiple data-actions-box="true" name="audience_countries[]" id="js_ads-audience-countries">
                                            {foreach $countries as $country}
                                                <option value="{$country['country_id']}">{$country['country_name']}</option>
                                            {/foreach}
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label class="form-control-label" for="audience_gender">{__("Audience Gender")}</label>
                                        <select class="form-control" name="audience_gender" id="js_ads-audience-gender">
                                            <option value="all">{__("All")}</option>
                                            <option value="male">{__("Male")}</option>
                                            <option value="female">{__("Female")}</option>
                                            <option value="other">{__("Other")}</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label class="form-control-label" for="audience_relationship">{__("Audience Relationship")}</label>
                                        <select class="form-control" name="audience_relationship" id="js_ads-audience-relationship">
                                            <option value="all">{__("All")}</option>
                                            <option value="single">{__("Single")}</option>
                                            <option value="relationship">{__("In a relationship")}</option>
                                            <option value="married">{__("Married")}</option>
                                            <option value="complicated">{__("It's complicated")}</option>
                                            <option value="separated">{__("Separated")}</option>
                                            <option value="divorced">{__("Divorced")}</option>
                                            <option value="widowed">{__("Widowed")}</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label class="form-control-label" for="potential_reach">{__("Potential Reach")}</label>
                                        <div class="text-lg">
                                            <div class="float-right x-hidden" id="js_ads-potential-reach-loader">
                                                <div class="spinner-border text-info"></div>
                                            </div>
                                            <i class="fa fa-users"></i> <span class="badge badge-pill badge-lg badge-warning" id="js_ads-potential-reach">{$potential_reach}</span> {__("People")}
                                        </div>
                                    </div>
                                    <!-- target audience -->
                                </div>
                                <!-- campaign details & target audience -->

                                <!-- ads details -->
                                <div class="col-sm-6">
                                    <div class="section-title mb20">
                                        <i class="fa fa-bullhorn mr5"></i>{__("Ads Details")}
                                    </div>
                                    <div class="form-group">
                                        <label class="form-control-label" for="ads_title">{__("Ads Title")}</label>
                                        <input type="text" class="form-control" name="ads_title" id="ads_title">
                                        <span class="form-text">
                                            {__("Set a title for your ads")}
                                        </span>
                                    </div>
                                    <div class="form-group">
                                        <label class="form-control-label" for="ads_description">{__("Ads Description")}</label>
                                        <textarea class="form-control" name="ads_description" rows="5"></textarea>
                                        <span class="form-text">
                                            {__("Set a description for your ads (maximum 200 characters)")}
                                        </span>
                                    </div>
                                    <div class="form-group">
                                        <label class="form-control-label" for="ads_type">{__("Advertise For")}</label>
                                        <select class="form-control" name="ads_type" id="js_campaign-type">
                                            <option value="url">{__("URL")}</option>
                                            <option value="page">{__("Page")}</option>
                                            <option value="group">{__("Group")}</option>
                                            <option value="event">{__("Event")}</option>
                                        </select>
                                        <span class="form-text">
                                            {__("You can advertise for a URL or one of your pages, groups or events")}
                                        </span>
                                    </div>
                                    <div class="form-group" id="js_campaign-type-url">
                                        <label class="form-control-label" for="ads_url">{__("Target URL")}</label>
                                        <input type="text" class="form-control" name="ads_url">
                                        <span class="form-text">
                                            {__("Enter your URL you want to advertise for")}
                                        </span>
                                    </div>
                                    <div class="form-group x-hidden" id="js_campaign-type-page">
                                        <label class="form-control-label" for="ads_page">{__("Target Page")}</label>
                                        <select class="form-control" name="ads_page">
                                            <option value="none">{__("Select Page")}</option>
                                            {foreach $pages as $page}
                                            <option value="{$page['page_id']}">{__($page['page_title'])}</option>
                                            {/foreach}
                                        </select>
                                        <span class="form-text">
                                            {__("Select one of your pages you want to advertise for")}
                                        </span>
                                    </div>
                                    <div class="form-group x-hidden" id="js_campaign-type-group">
                                        <label class="form-control-label" for="ads_group">{__("Target Group")}</label>
                                        <select class="form-control" name="ads_group">
                                            <option value="none">{__("Select Group")}</option>
                                            {foreach $groups as $group}
                                            <option value="{$group['group_id']}">{__($group['group_title'])}</option>
                                            {/foreach}
                                        </select>
                                        <span class="form-text">
                                            {__("Select one of your groups you want to advertise for")}
                                        </span>
                                    </div>
                                    <div class="form-group x-hidden" id="js_campaign-type-event">
                                        <label class="form-control-label" for="ads_event">{__("Target Event")}</label>
                                        <select class="form-control" name="ads_event">
                                            <option value="none">{__("Select Event")}</option>
                                            {foreach $events as $event}
                                            <option value="{$event['event_id']}">{__($event['event_title'])}</option>
                                            {/foreach}
                                        </select>
                                        <span class="form-text">
                                            {__("Select one of your events you want to advertise for")}
                                        </span>
                                    </div>
                                    <div class="form-group">
                                        <label class="form-control-label" for="ads_placement">{__("Ads Placement")}</label>
                                        <select class="form-control" name="ads_placement">
                                            <option value="newsfeed">{__("Newsfeed")}</option>
                                            <option value="sidebar">{__("Sidebar")}</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label class="form-control-label" for="ads_image">{__("Ads Image")}</label>
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
                                            <input type="hidden" class="js_x-image-input" name="ads_image">
                                        </div>
                                        <span class="form-text">
                                            {__("The image of your ads, supported formats (JPG, PNG, GIF)")}
                                        </span>
                                    </div>
                                </div>
                                <!-- ads details -->
                            </div>

                            <!-- error -->
                            <div class="alert alert-danger mb0 x-hidden"></div>
                            <!-- error -->
                        </div>
                        <div class="card-footer text-right">
                            <button type="submit" class="btn btn-primary">
                                <i class="fas fa-plus mr10"></i>{__("Publish")}
                            </button>
                        </div>
                    </form>
                </div>
                <!-- new campaign -->

            {elseif $view == "edit"}

                <!-- edit campaign -->
                <div class="card mt20">
                    <div class="card-header with-icon">
                        <i class="fa fa-edit mr10"></i>{__("Edit Campaign")}
                        <div class="float-right">
                            <a href="{$system['system_url']}/ads" class="btn btn-sm btn-light">
                                <i class="fa fa-arrow-circle-left mr5"></i>{__("Go Back")}
                            </a>
                        </div>
                    </div>
                    <form class="js_ajax-forms" data-url="ads/campaign.php?do=edit&id={$campaign['campaign_id']}">
                        <div class="card-body">
                            {if $user->_data['user_wallet_balance'] == 0}
                                <div class="bs-callout bs-callout-warning mt0">
                                    {__("Your current wallet credit is")}: <strong>{$system['system_currency_symbol']}{$user->_data['user_wallet_balance']|number_format:2}</strong> {__("You need to")} <a href="{$system['system_url']}/wallet">{__("Replenish your wallet credit")}</a>
                                </div>
                            {/if}

                            <div class="row">
                                <!-- campaign details & target audience -->
                                <div class="col-sm-6">
                                    <!-- campaign details -->
                                    <div class="section-title mb20">
                                        <i class="fa fa-cog mr5"></i>{__("Campaign Details")}
                                    </div>
                                    <div class="form-group">
                                        <label class="form-control-label" for="campaign_title">{__("Campaign Title")}</label>
                                        <input type="text" class="form-control" name="campaign_title" value="{$campaign['campaign_title']}">
                                        <span class="form-text">
                                            {__("Set a title for your campaign")}
                                        </span>
                                    </div>
                                    <div class="form-group">
                                        <label class="form-control-label" for="campaign_start_date">{__("Campaign Start Date")}</label>
                                        <div class='input-group date js_datetimepicker'>
                                            <div class="input-group date js_datetimepicker" id="campaign_start_date" data-target-input="nearest">
                                                <input type='text' class="form-control datetimepicker-input" data-target="#campaign_start_date" name="campaign_start_date" value="{get_datetime($campaign['campaign_start_date'])}" />
                                                <div class="input-group-append" data-target="#campaign_start_date" data-toggle="datetimepicker">
                                                    <span class="input-group-text"><i class="fa fa-calendar"></i></span>
                                                </div>
                                            </div>
                                        </div>
                                        <span class="form-text">
                                            {__("Set Campaign start datetime (UTC)")}
                                        </span>
                                    </div>
                                    <div class="form-group">
                                        <label class="form-control-label" for="campaign_end_date">{__("Campaign End Date")}</label>
                                        <div class='input-group date js_datetimepicker'>
                                            <div class="input-group date js_datetimepicker" id="campaign_end_date" data-target-input="nearest">
                                                <input type='text' class="form-control datetimepicker-input" data-target="#campaign_end_date" name="campaign_end_date" value="{get_datetime($campaign['campaign_end_date'])}" />
                                                <div class="input-group-append" data-target="#campaign_end_date" data-toggle="datetimepicker">
                                                    <span class="input-group-text"><i class="fa fa-calendar"></i></span>
                                                </div>
                                            </div>
                                        </div>
                                        <span class="form-text">
                                            {__("Set Campaign end datetime (UTC)")}
                                        </span>
                                    </div>
                                    <div class="form-group">
                                        <label class="form-control-label" for="campaign_budget">{__("Campaign Budget")}</label>
                                        <div class="input-money">
                                            <span>{$system['system_currency_symbol']}</span>
                                            <input type="text" class="form-control" placeholder="0.00" min="1.00" max="1000" name="campaign_budget" value="{$campaign['campaign_budget']}">
                                        </div>
                                        <span class="form-text">
                                            {__("Set a budget for your campaign, campaign will be paused if reached its limit")}
                                        </span>
                                    </div>
                                    <div class="form-group">
                                        <label class="form-control-label" for="campaign_bidding">{__("Campaign Bidding")}</label>
                                        <select class="form-control" name="campaign_bidding">
                                            <option {if $campaign['campaign_bidding'] == "click"}selected{/if} value="click">{__("Pay Per Click")} ({$system['system_currency_symbol']}{$system['ads_cost_click']})</option>
                                            <option {if $campaign['campaign_bidding'] == "view"}selected{/if} value="view">{__("Pay Per View")} ({$system['system_currency_symbol']}{$system['ads_cost_view']})</option>
                                        </select>
                                    </div>
                                    <!-- campaign details -->

                                    <!-- target audience -->
                                    <div class="section-title mb20">
                                        <i class="fa fa-crosshairs mr5"></i>{__("Target Audience")}
                                    </div>
                                    <div class="form-group">
                                        <label class="form-control-label" for="audience_countries">{__("Audience Country")}</label>
                                        <select class="form-control selectpicker" multiple data-actions-box="true" name="audience_countries[]" id="js_ads-audience-countries">
                                            {foreach $countries as $country}
                                                <option {if in_array($country['country_id'], $campaign['audience_countries'])}selected{/if} value="{$country['country_id']}">{$country['country_name']}</option>
                                            {/foreach}
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label class="form-control-label" for="audience_gender">{__("Audience Gender")}</label>
                                        <select class="form-control" name="audience_gender" id="js_ads-audience-gender">
                                            <option {if $campaign['audience_gender'] == "all"}selected{/if} value="all">{__("All")}</option>
                                            <option {if $campaign['audience_gender'] == "male"}selected{/if} value="male">{__("Male")}</option>
                                            <option {if $campaign['audience_gender'] == "female"}selected{/if} value="female">{__("Female")}</option>
                                            <option {if $campaign['audience_gender'] == "other"}selected{/if} value="other">{__("Other")}</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label class="form-control-label" for="audience_relationship">{__("Audience Relationship")}</label>
                                        <select class="form-control" name="audience_relationship" id="js_ads-audience-relationship">
                                            <option {if $campaign['audience_relationship'] == "all"}selected{/if} value="all">{__("All")}</option>
                                            <option {if $campaign['audience_relationship'] == "single"}selected{/if} value="single">{__("Single")}</option>
                                            <option {if $campaign['audience_relationship'] == "relationship"}selected{/if} value="relationship">{__("In a relationship")}</option>
                                            <option {if $campaign['audience_relationship'] == "married"}selected{/if} value="married">{__("Married")}</option>
                                            <option {if $campaign['audience_relationship'] == "complicated"}selected{/if} value="complicated">{__("It's complicated")}</option>
                                            <option {if $campaign['audience_relationship'] == "separated"}selected{/if} value="separated">{__("Separated")}</option>
                                            <option {if $campaign['audience_relationship'] == "divorced"}selected{/if} value="divorced">{__("Divorced")}</option>
                                            <option {if $campaign['audience_relationship'] == "widowed"}selected{/if} value="widowed">{__("Widowed")}</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label class="form-control-label" for="potential_reach">{__("Potential Reach")}</label>
                                        <div class="text-lg">
                                            <div class="float-right x-hidden" id="js_ads-potential-reach-loader">
                                                <div class="spinner-border text-info"></div>
                                            </div>
                                            <i class="fa fa-users"></i> <span class="text-primary" id="js_ads-potential-reach">{$campaign['campaign_potential_reach']}</span> {__("People")}
                                        </div>
                                    </div>
                                    <!-- target audience -->
                                </div>
                                <!-- campaign details & target audience -->

                                <!-- ads details -->
                                <div class="col-sm-6">
                                    <div class="section-title mb20">
                                        <i class="fa fa-bullhorn mr5"></i>{__("Ads Details")}
                                    </div>
                                    <div class="form-group">
                                        <label class="form-control-label" for="ads_title">{__("Ads Title")}</label>
                                        <input type="text" class="form-control" name="ads_title" id="ads_title" value="{$campaign['ads_title']}">
                                        <span class="form-text">
                                            {__("Set a title for your ads")}
                                        </span>
                                    </div>
                                    <div class="form-group">
                                        <label class="form-control-label" for="ads_description">{__("Ads Description")}</label>
                                        <textarea class="form-control" name="ads_description" rows="5">{$campaign['ads_description']}</textarea>
                                        <span class="form-text">
                                            {__("Set a description for your ads (maximum 200 characters)")}
                                        </span>
                                    </div>
                                    <div class="form-group">
                                        <label class="form-control-label" for="ads_type">{__("Advertise For")}</label>
                                        <select class="form-control" name="ads_type" id="js_campaign-type">
                                            <option {if $campaign['ads_type'] == "url"}selected{/if} value="url">{__("URL")}</option>
                                            <option {if $campaign['ads_type'] == "page"}selected{/if} value="page">{__("Page")}</option>
                                            <option {if $campaign['ads_type'] == "group"}selected{/if} value="group">{__("Group")}</option>
                                            <option {if $campaign['ads_type'] == "event"}selected{/if} value="event">{__("Event")}</option>
                                        </select>
                                        <span class="form-text">
                                            {__("You can advertise for a URL or one of your pages, groups or events")}
                                        </span>
                                    </div>
                                    <div class="form-group {if $campaign['ads_type'] != 'url'}x-hidden{/if}" id="js_campaign-type-url">
                                        <label class="form-control-label" for="ads_url">{__("Target URL")}</label>
                                        <input type="text" class="form-control" name="ads_url" value="{$campaign['ads_url']}">
                                        <span class="form-text">
                                            {__("Enter your URL you want to advertise for")}
                                        </span>
                                    </div>
                                    <div class="form-group {if $campaign['ads_type'] != 'page'}x-hidden{/if}" id="js_campaign-type-page">
                                        <label class="form-control-label" for="ads_page">{__("Target Page")}</label>
                                        <select class="form-control" name="ads_page">
                                            <option value="none">{__("Select Page")}</option>
                                            {foreach $pages as $page}
                                            <option {if $campaign['ads_page'] == $page['page_id']}selected{/if} value="{$page['page_id']}">{__($page['page_title'])}</option>
                                            {/foreach}
                                        </select>
                                        <span class="form-text">
                                            {__("Select one of your pages you want to advertise for")}
                                        </span>
                                    </div>
                                    <div class="form-group {if $campaign['ads_type'] != 'group'}x-hidden{/if}" id="js_campaign-type-group">
                                        <label class="form-control-label" for="ads_group">{__("Target Group")}</label>
                                        <select class="form-control" name="ads_group">
                                            <option value="none">{__("Select Group")}</option>
                                            {foreach $groups as $group}
                                            <option {if $campaign['ads_group'] == $group['group_id']}selected{/if} value="{$group['group_id']}">{__($group['group_title'])}</option>
                                            {/foreach}
                                        </select>
                                        <span class="form-text">
                                            {__("Select one of your groups you want to advertise for")}
                                        </span>
                                    </div>
                                    <div class="form-group {if $campaign['ads_type'] != 'event'}x-hidden{/if}" id="js_campaign-type-event">
                                        <label class="form-control-label" for="ads_event">{__("Target Event")}</label>
                                        <select class="form-control" name="ads_event">
                                            <option value="none">{__("Select Event")}</option>
                                            {foreach $events as $event}
                                            <option {if $campaign['ads_event'] == $event['event_id']}selected{/if} value="{$event['event_id']}">{__($event['event_title'])}</option>
                                            {/foreach}
                                        </select>
                                        <span class="form-text">
                                            {__("Select one of your events you want to advertise for")}
                                        </span>
                                    </div>
                                    <div class="form-group">
                                        <label class="form-control-label" for="ads_placement">{__("Ads Placement")}</label>
                                        <select class="form-control" name="ads_placement">
                                            <option {if $campaign['ads_placement'] == "newsfeed"}selected{/if} value="newsfeed">{__("Newsfeed")}</option>
                                            <option {if $campaign['ads_placement'] == "sidebar"}selected{/if} value="sidebar">{__("Sidebar")}</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label class="form-control-label" for="ads_image">{__("Ads Image")}</label>
                                        {if $campaign['ads_image'] == ''}
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
                                                <input type="hidden" class="js_x-image-input" name="ads_image">
                                            </div>
                                        {else}
                                            <div class="x-image" style="background-image: url('{$system['system_uploads']}/{$campaign['ads_image']}')">
                                                <button type="button" class="close js_x-image-remover" title='{__("Remove")}'>
                                                    <span>×</span>
                                                </button>
                                                <div class="x-image-loader">
                                                    <div class="progress x-progress">
                                                        <div class="progress-bar" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
                                                    </div>
                                                </div>
                                                <i class="fa fa-camera fa-lg js_x-uploader" data-handle="x-image"></i>
                                                <input type="hidden" class="js_x-image-input" name="ads_image" value="{$campaign['ads_image']}">
                                            </div>
                                        {/if}
                                        <span class="form-text">
                                            {__("The image of your ads, supported formats (JPG, PNG, GIF)")}
                                        </span>
                                    </div>
                                </div>
                                <!-- ads details -->
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
                <!-- edit campaign -->

            {elseif $view == "wallet"}

                <!-- wallet -->
                <div class="card mt20">
                    <div class="card-header with-icon">
                        <i class="fa fa-wallet mr10"></i>{__("Wallet")}
                    </div>
                    <div class="card-body">
                        {if $wallet_transfer_amount}
                            <div class="alert alert-success mb20">
                                <i class="fas fa-check-circle mr5"></i>
                                {__("Your")} <span class="badge badge-pill badge-lg badge-light">{$system['system_currency_symbol']}{$wallet_transfer_amount|number_format:2}</span> {__("transfer transaction successfuly sent")}
                            </div>
                        {/if}
                        {if $wallet_replenish_amount}
                            <div class="alert alert-success mb20">
                                <i class="fas fa-check-circle mr5"></i>
                                {__("Congratulation! Your wallet credit replenished successfully with")} <span class="badge badge-pill badge-lg badge-light">{$system['system_currency_symbol']}{$wallet_replenish_amount|number_format:2}</span>
                            </div>
                        {/if}
                        {if $wallet_withdraw_affiliates_amount}
                            <div class="alert alert-success mb20">
                                <i class="fas fa-check-circle mr5"></i>
                                {__("Congratulation! Your wallet credit replenished successfully with")} <span class="badge badge-pill badge-lg badge-light">{$system['system_currency_symbol']}{$wallet_withdraw_affiliates_amount|number_format:2}</span> {__("from your affiliates credit")}
                            </div>
                        {/if}
                        {if $wallet_withdraw_points_amount}
                            <div class="alert alert-success mb20">
                                <i class="fas fa-check-circle mr5"></i>
                                {__("Congratulation! Your wallet credit replenished successfully with")} <span class="badge badge-pill badge-lg badge-light">{$system['system_currency_symbol']}{$wallet_withdraw_points_amount|number_format:2}</span> {__("from your points credit")}
                            </div>
                        {/if}
                        {if $wallet_package_payment_amount}
                            <div class="alert alert-success mb20">
                                <i class="fas fa-check-circle mr5"></i>
                                {__("Your")} <span class="badge badge-pill badge-lg badge-light">{$system['system_currency_symbol']}{$wallet_package_payment_amount|number_format:2}</span> {__("payment transaction successfuly done")}
                            </div>
                        {/if}

                        <div class="row">
                            <!-- credit -->
                            <div class="col-md-5">
                                <div class="section-title mb20">
                                    <i class="fa fa-money-bill-alt mr10"></i> {__("Your Credit")}
                                </div>
                                <div class="stat-panel bg-gradient-info">
                                    <div class="stat-cell small">
                                        <i class="fa fa-money-bill-alt bg-icon"></i>
                                        <div class="h3 mtb10">
                                            {$system['system_currency_symbol']}{$user->_data['user_wallet_balance']|number_format:2}
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- credit -->

                            <!-- send & recieve money -->
                            <div class="col-md-7">
                                <div class="section-title mb20">
                                    <i class="fas fa-donate mr10"></i> {__("Send & Recieve Money")}
                                </div>
                                <button class="btn btn-success btn-block mb10" data-toggle="modal" data-url="#wallet-transfer">
                                    <i class="fa fa-gift"></i> {__("Send Money")}
                                </button>
                                {if $system['affiliates_enabled'] && ($system['points_enabled'] && $system['points_money_transfer_enabled'])}
                                    <div class="form-row">
                                        <div class="col-12 col-md-4">
                                            <button class="btn btn-primary btn-block mb10" data-toggle="modal" data-url="#wallet-replenish">
                                                <i class="fab fa-paypal mr5"></i>{__("Replenish Credit")}
                                            </button>
                                        </div>
                                        <div class="col-12 col-md-4">
                                            <button class="btn btn-primary btn-block mb10" data-toggle="modal" data-url="#wallet-withdraw-affiliates">
                                                <i class="fa fa-exchange-alt mr5"></i>{__("Affiliates Credit")}
                                            </button>
                                        </div>
                                        <div class="col-12 col-md-4">
                                            <button class="btn btn-primary btn-block mb10" data-toggle="modal" data-url="#wallet-withdraw-points">
                                                <i class="fa fa-piggy-bank mr5"></i>{__("Points Credit")}
                                            </button>
                                        </div>
                                    </div>
                                {elseif $system['affiliates_enabled']}
                                    <div class="row">
                                        <div class="col-12 col-sm-6">
                                            <button class="btn btn-primary btn-block mb10" data-toggle="modal" data-url="#wallet-replenish">
                                                <i class="fab fa-paypal mr5"></i>{__("Replenish Credit")}
                                            </button>
                                        </div>
                                        <div class="col-12 col-sm-6">
                                            <button class="btn btn-primary btn-block mb10" data-toggle="modal" data-url="#wallet-withdraw-affiliates">
                                                <i class="fa fa-exchange-alt mr5"></i>{__("Withdraw Affiliates Credit")}
                                            </button>
                                        </div>
                                    </div>
                                {elseif ($system['points_enabled'] && $system['points_money_transfer_enabled'])}
                                    <div class="row">
                                        <div class="col-12 col-sm-6">
                                            <button class="btn btn-primary btn-block mb10" data-toggle="modal" data-url="#wallet-replenish">
                                                <i class="fab fa-paypal mr5"></i>{__("Replenish Credit")}
                                            </button>
                                        </div>
                                        <div class="col-12 col-sm-6">
                                            <button class="btn btn-primary btn-block mb10" data-toggle="modal" data-url="#wallet-withdraw-points">
                                                <i class="fa fa-piggy-bank mr5"></i>{__("Withdraw Points Credit")}
                                            </button>
                                        </div>
                                    </div>
                                {else}
                                    <button class="btn btn-primary btn-block mb10" data-toggle="modal" data-url="#wallet-replenish">
                                        <i class="fab fa-paypal mr5"></i>{__("Replenish Credit")}
                                    </button>
                                {/if}
                            </div>
                            <!-- send & recieve money -->

                            <!-- wallet transactions -->
                            <div class="col-12">
                                <div class="section-title mt10 mb20">
                                    <i class="fas fa-file-alt mr10"></i> {__("Wallet Transactions")}
                                </div>
                                {if $transactions}
                                    <div class="table-responsive">
                                        <table class="table table-striped table-bordered table-hover js_dataTable">
                                            <thead>
                                                <tr>
                                                    <th>{__("ID")}</th>
                                                    <th>{__("Amount")}</th>
                                                    <th>{__("From / To")}</th>
                                                    <th>{__("Time")}</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                {foreach $transactions as $transaction}
                                                    <tr>
                                                        <td>{$transaction['transaction_id']}</td>
                                                        <td>
                                                            {if $transaction['type'] == "out"}
                                                                <span class="badge badge-pill badge-lg badge-danger mr5"><i class="far fa-arrow-alt-circle-down"></i></span>
                                                                <strong class="text-danger">{$system['system_currency_symbol']}{$transaction['amount']|number_format:2}</strong>
                                                            {else}
                                                                <span class="badge badge-pill badge-lg badge-success mr5"><i class="far fa-arrow-alt-circle-up"></i></span>
                                                                <strong class="text-success">{$system['system_currency_symbol']}{$transaction['amount']|number_format:2}</strong>
                                                            {/if}
                                                        </td>
                                                        <td>
                                                            {if $transaction['type'] == "out"}
                                                                <span class="badge badge-pill badge-lg badge-danger mr10">{__("To")}</span>
                                                            {else}
                                                                <span class="badge badge-pill badge-lg badge-success mr10">{__("From")}</span>
                                                            {/if}
                                                            {if $transaction['node_type'] == "user"}
                                                                <a  target="_blank" href="{$system['system_url']}/{$transaction['user_name']}">
                                                                    <img class="tbl-image" src="{$transaction['user_picture']}" style="float: none;">
                                                                    {$transaction['user_firstname']} {$transaction['user_lastname']}
                                                                </a>
                                                            {elseif $transaction['node_type'] == "recharge"}
                                                                {__("Replenish Credit")}
                                                            {elseif $transaction['node_type'] == "withdraw_affiliates"}
                                                                {__("Affiliates Credit")}
                                                            {elseif $transaction['node_type'] == "withdraw_points"}
                                                                {__("Points Credit")}
                                                             {elseif $transaction['node_type'] == "package_payment"}
                                                                {__("Buy Pro Package")}
                                                            {/if}
                                                        </td>
                                                        <td><span class="js_moment" data-time="{$transaction['date']}">{$transaction['date']}</span></td>
                                                    </tr>
                                                {/foreach}
                                            </tbody>
                                        </table>
                                    </div>
                                {else}
                                    <div class="text-center text-muted mtb10">
                                        <img width="15%" src="{$system['system_url']}/content/themes/{$system['theme']}/images/no_results.png">
                                        <p class="mt10 mb10"><strong>{__("No data to show")}</strong></p>
                                    </div>
                                {/if}
                            </div>
                            <!-- wallet transactions -->
                        </div>
                    </div>
                </div>
                <!-- wallet -->

            {/if}
        </div>
        <!-- content panel -->

    </div>
</div>
<!-- page content -->

{include file='_footer.tpl'}