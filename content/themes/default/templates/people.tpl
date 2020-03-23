{include file='_head.tpl'}
{include file='_header.tpl'}

<!-- page content -->
<div class="container mt20 offcanvas">
    <div class="row">

        <!-- left panel -->
        <div class="col-md-4 col-lg-3 offcanvas-sidebar js_sticky-sidebar">
            {include file='_sidebar.tpl'}
        </div>
        <!-- left panel -->

        <!-- content panel -->
        <div class="col-md-8 col-lg-9 offcanvas-mainbar">

            <!-- tabs -->
            <div class="content-tabs rounded-sm shadow-sm clearfix">
                <ul>
                    <li {if $view == "" || $view == "find"}class="active"{/if}>
                        <a href="{$system['system_url']}/people">{__("Discover")}</a>
                    </li>
                    <li {if $view == "friend_requests"}class="active"{/if}>
                        <a href="{$system['system_url']}/people/friend_requests">
                            {__("Friend Requests")}
                            {if $user->_data['friend_requests']}
                                <span class="badge badge-lg badge-info ml5">{count($user->_data['friend_requests'])}</span>
                            {/if}
                        </a>
                    </li>
                    <li {if $view == "sent_requests"}class="active"{/if}>
                        <a href="{$system['system_url']}/people/sent_requests">
                            {__("Sent Requests")}
                            {if $user->_data['friend_requests_sent']}
                                <span class="badge badge-lg badge-warning ml5">{count($user->_data['friend_requests_sent'])}</span>
                            {/if}
                        </a>
                    </li>
                </ul>
            </div>
            <!-- tabs -->

            <!-- content -->
            <div class="row">
                <!-- left panel -->
                <div class="col-lg-4 order-lg-2">
                    <!-- search panel -->
                    <div class="card">
                        <div class="card-header">
                            <i class="fa fa-search mr5"></i>{__("Search")}
                        </div>
                        <div class="card-body">
                            <form action="{$system['system_url']}/people/find" method="post">
                                <div class="form-group">
                                    <label>{__("Distance")}</label>
                                    <div>
                                        <input type="range" class="custom-range" min="1" max="5000" value="5000" name="distance_slider" oninput="this.form.distance_value.value=this.value">
                                        <div class="input-group">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text" id="basic-addon1">{__("KM")}</span>
                                            </div>
                                            <input type="number" class="form-control" min="1" max="5000" value="5000" name="distance_value" oninput="this.form.distance_slider.value=this.value">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label>{__("Keyword")}</label>
                                    <input type="text" class="form-control" name="query">
                                </div>
                                <div class="form-group">
                                    <label>{__("Gender")}</label>
                                    <select class="form-control" name="gender">
                                        <option value="any">{__("Any")}</option>
                                        <option value="male">{__("Male")}</option>
                                        <option value="female">{__("Female")}</option>
                                        <option value="other">{__("Other")}</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label>{__("Relationship")}</label>
                                    <select class="form-control" name="relationship">
                                        <option value="any">{__("Any")}</option>
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
                                    <label>{__("Online Status")}</label>
                                    <select class="form-control" name="status">
                                        <option value="any">{__("Any")}</option>
                                        <option value="online">{__("Online")}</option>
                                        <option value="offline">{__("Offline")}</option>
                                    </select>
                                </div>
                                <button type="submit" class="btn btn-block btn-primary" name="submit"><i class="fa fa-search mr5"></i>{__("Search")}</button>
                            </form>
                        </div>
                    </div>
                    <!-- search panel -->

                    {include file='_ads_campaigns.tpl'}
                    {include file='_ads.tpl'}
                    {include file='_widget.tpl'}
                </div>
                <!-- left panel -->

                <!-- right panel -->
                <div class="col-lg-8 order-lg-1">
                    <div class="card">
                        
                        {if $view == ""}
                            <div class="card-header bg-transparent">
                                <strong>{__("People You May Know")}</strong>
                            </div>
                            <div class="card-body">
                                {if $people}
                                    <ul>
                                        {foreach $people as $_user}
                                        {include file='__feeds_user.tpl' _tpl="list" _connection="add"}
                                        {/foreach}
                                    </ul>

                                    <!-- see-more -->
                                    {if count($people) >= $system['min_results']}
                                        <div class="alert alert-info see-more js_see-more" data-get="new_people">
                                            <span>{__("See More")}</span>
                                            <div class="loader loader_small x-hidden"></div>
                                        </div>
                                    {/if}
                                    <!-- see-more -->
                                {else}
                                    <p class="text-center text-muted">
                                        {__("No people available")}
                                    </p>
                                {/if}
                            </div>
                        
                        {elseif $view == "find"}
                            <div class="card-header bg-transparent">
                                <strong>{__("Search Results")}</strong>
                            </div>
                            <div class="card-body">
                                {if count($people) > 0}
                                    <ul>
                                        {foreach $people as $_user}
                                        {include file='__feeds_user.tpl' _tpl="list" _connection=$_user['connection']}
                                        {/foreach}
                                    </ul>
                                {else}
                                    <p class="text-center text-muted">
                                        {__("No people available for your search")}
                                    </p>
                                {/if}
                            </div>
                        
                        {elseif $view == "friend_requests"}
                            <div class="card-header bg-transparent">
                                <strong>{__("Respond to Your Friend Request")}</strong>
                            </div>
                            <div class="card-body">
                                {if $user->_data['friend_requests']}
                                    <ul>
                                        {foreach $user->_data['friend_requests'] as $_user}
                                        {include file='__feeds_user.tpl' _tpl="list" _connection="request"}
                                        {/foreach}
                                    </ul>
                                {else}
                                    <p class="text-center text-muted">
                                        {__("No new requests")}
                                    </p>
                                {/if}

                                <!-- see-more -->
                                {if count($user->_data['friend_requests']) >= $system['max_results']}
                                    <div class="alert alert-info see-more js_see-more" data-get="friend_requests">
                                        <span>{__("See More")}</span>
                                        <div class="loader loader_small x-hidden"></div>
                                    </div>
                                {/if}
                                <!-- see-more -->
                            </div>
                        
                        {elseif $view == "sent_requests"}
                            <div class="card-header bg-transparent">
                                <strong>{__("Friend Requests Sent")}</strong>
                            </div>
                            <div class="card-body">
                                {if $user->_data['friend_requests_sent']}
                                    <ul>
                                        {foreach $user->_data['friend_requests_sent'] as $_user}
                                        {include file='__feeds_user.tpl' _tpl="list" _connection="cancel"}
                                        {/foreach}
                                    </ul>
                                {else}
                                    <p class="text-center text-muted">
                                        {__("No new requests")}
                                    </p>
                                {/if}

                                <!-- see-more -->
                                {if count($user->_data['friend_requests_sent']) >= $system['max_results']}
                                    <div class="alert alert-info see-more js_see-more" data-get="friend_requests_sent">
                                        <span>{__("See More")}</span>
                                        <div class="loader loader_small x-hidden"></div>
                                    </div>
                                {/if}
                                <!-- see-more -->
                            </div>
                        
                        {/if}

                    </div>
                </div>
                <!-- right panel -->
            </div>
            <!-- content -->

        </div>
        <!-- content panel -->

    </div>
</div>
<!-- page content -->

{include file='_footer.tpl'}