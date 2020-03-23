{include file='_head.tpl'}
{include file='_header.tpl'}

<!-- page header -->
<div class="page-header bg-2">
    {if $view == "share"}
        <img class="floating-img d-none d-md-block" src="{$system['system_url']}/content/themes/{$system['theme']}/images/headers/undraw_share_766i.svg">
    {else}
        <img class="floating-img d-none d-md-block" src="{$system['system_url']}/content/themes/{$system['theme']}/images/headers/undraw_code_typing_7jnv.svg">
    {/if}
    <div class="crystal c03"></div>
    <div class="circle-2"></div>
    <div class="circle-3"></div>
    <div class="inner">
        <h2>{__("Developers")}</h2>
        <p>{__("Explore the developer tools we offer")}</p>
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
                    {if $system['developers_apps_enabled']}
                        <li {if $view == ""}class="active"{/if}>
                            <a href="{$system['system_url']}/developers"><i class="fa fa-book mr5"></i>{__("Documentation")}</a>
                        </li>
                    {/if}
                    {if $system['developers_apps_enabled']}
                        <li {if $view == "apps" || $view == "new" || $view == "edit"}class="active"{/if}>
                            <a href="{$system['system_url']}/developers/apps"><i class="fa fa-cubes mr5"></i>{__("My Apps")}</a>
                        </li>
                    {/if}
                    {if $system['developers_share_enabled']}
                        <li {if $view == "share"}class="active"{/if}>
                            <a  href="{$system['system_url']}/developers/share"><i class="fa fa-share-alt-square mr5"></i>{__("Share Plugin")}</a>
                        </li>
                    {/if}
                </ul>
            </div>
            <!-- tabs -->

            {if $view == ""}

                <!-- docs -->
                <div class="card mt20">
                    <div class="card-header with-icon">
                        <i class="fa fa-book mr10"></i>{__("Documentation")}
                    </div>
                    <div class="card-body page-content pt30" style="font-size: 1.1em;">
                        <p>
                            <small>{__("API Version")} <span class="badge badge-light">1.1</span></small>
                        </p>
                        <p>
                            {__("This documentation explain how to register, configure, and develop your app so you can successfully use our APIs")}
                        </p>

                        <h5 class="mt30 mb20">{__("Create App")}</h5>
                        <p>
                            {__("In order for your app to access our APIs, you must register your app using the")} <a href="{$system['system_url']}/developers/apps">{__("App Dashboard")}</a>. {__("Registration creates an App ID that lets us know who you are, helps us distinguish your app from other apps")}.
                        </p>
                        <ol>
                            <li class="mb20">
                                {__("You will need to create a new App")} 
                                <a class="btn btn-sm btn-primary ml10" href="{$system['system_url']}/developers/new">
                                    <i class="fa fa-plus-circle mr5"></i>{__("Create New App")}
                                </a>
                            </li>
                            <li class="mb20">
                                {__("Once you created your App you will get your")} <span class="badge badge-primary">app_id</span> {__("and")} <span class="badge badge-primary">app_secret</span>
                            </li>
                        </ol>

                        <h5 class="mt30 mb20">{__("Log in With")}</h5>
                        <p>
                            {__("Log in With system is a fast and convenient way for people to create accounts and log into your app. Our Log in With system enables two scenarios, authentication and asking for permissions to access people's data. You can use Login With system simply for authentication or for both authentication and data access")}.
                        </p>
                        <ol>
                            <li class="mb20">
                                {__("Starting the OAuth login process, You need to use a link for your app like this")}:
                                <pre class="mtb10">&lt;a href="{$system['system_url']}/api/oauth?app_id=YOUR_APP_ID"&gt;Log in With {$system['system_title']}&lt;/a&gt;</pre>
                                <p style="font-size: 15px;">
                                   {__("The user will be redirect to Log in With page like this")}
                                </p>
                                <div class="text-center">
                                    <img class="img-fluid" width="400" src="{$system['system_url']}/content/themes/{$system['theme']}/images/screenshots/login_with.png">
                                </div>
                            </li>
                            <li class="mb20">
                                {__("Once the user accpeted your app, the user will be redirected to your App Redirect URL with")} <span class="badge badge-info">auth_key</span> {__("like this")}:
                                <pre class="mtb10">https://mydomain.com/my_redirect_url.php?auth_key=AUTH_KEY</pre>
                                {__("This")} <span class="badge badge-info">auth_key</span> {__("valid only for one time usage, so once you used it you will not be able to use it again and generate new code you will need to redirect the user to the log in with link again")}.
                            </li>
                        </ol>

                        <h5 class="mt30 mb20">{__("Access Token")}</h5>
                        <p>
                            {__("Once you get the user approval of your app Log in With window and returned with the")} <span class="badge badge-info">auth_key</span> {__("which means that now you are ready to retrive data from our APIs and to start this process you will need to authorize your app and get the")} <span class="badge badge-danger">access_token</span> {__("and you can follow our steps to learn how to get it")}.
                        </p>
                        <ol>
                            <li class="mb20">
                                {__("To get an access token, make an HTTP GET request to the following endpoint like this")}:
                                <pre class="mtb10">&lt;?php
$app_id = "YOUR_APP_ID"; // your app id
$app_secret = "YOUR_APP_SECRET"; // your app secret
$auth_key = $_GET['auth_key']; // the returned auth key from previous step

$get = file_get_contents("{$system['system_url']}/api/authorize?app_id=$app_id&app_secret=$app_secret&auth_key=$auth_key");

$json = json_decode($get, true);
if(!empty($json['access_token'])) {
    $access_token = $json['access_token']; // your access token
}
?&gt;</pre>
                            {__("This")} <span class="badge badge-danger">access_token</span> {__("valid only for only one 1 hour, so once it got invalid you will need to genarte new one by redirect the user to the log in with link again")}.
                            </li>
                        </ol>

                        <h5 class="mt30 mb20">{__("APIs")}</h5>
                        <p>
                            {__("Once you get your")} <span class="badge badge-danger">access_token</span> {__("Now you can retrieve informations from our system via HTTP GET requests which supports the following parameters")}
                        </p>
                        <div class="table-responsive">
                            <table class="table table-striped table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th>{__("Endpoint")}</th>
                                        <th>{__("Description")}</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>api/<span class="badge badge-warning">get_user_info</span></td>
                                        <td>
                                            <p>
                                                {__("get user info")}
                                            </p>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <p>
                            {__("You can retrive user info like this")}
                        </p>
                        <pre>if(!empty($json['access_token'])) {
   $access_token = $json['access_token']; // your access token
   $get = file_get_contents("{$system['system_url']}/api/get_user_info?access_token=$access_token");
}</pre>
                        <p>
                            {__("The result will be")}:
                        </p>
                        <pre>{
    "user_info": {
        "user_id": "",
        "user_name": "",
        "user_email": "",
        "user_firstname": "",
        "user_lastname": "",
        "user_gender": "",
        "user_birthdate": "",
        "user_picture": "",
        "user_cover": "",
        "user_registered": "",
        "user_verified": "",
        "user_relationship": "",
        "user_biography": "",
        "user_website": ""
    }
}</pre>
                    </div>
                </div>
                <!-- docs -->

            {elseif $view == "apps"}
                
                <!-- apps -->
                <div class="card mt20">
                    <div class="card-header with-icon">
                        <a class="btn btn-sm btn-primary float-right" href="{$system['system_url']}/developers/new">
                            <i class="fa fa-plus-circle mr5"></i>{__("Create New App")}
                        </a>
                        <i class="fa fa-cubes mr10"></i>{__("My Apps")}
                    </div>
                    <div class="card-body">
                        {if $apps}
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover js_dataTable">
                                    <thead>
                                        <tr>
                                            <th>{__("ID")}</th>
                                            <th>{__("App Name")}</th>
                                            <th>{__("App ID")}</th>
                                            <th>{__("App Secret")}</th>
                                            <th>{__("Created")}</th>
                                            <th>{__("Actions")}</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        {foreach $apps as $app}
                                            <tr>
                                                <td>{$app@iteration}</td>
                                                <td>
                                                    <a target="_blank" href="{$system['system_url']}/developers/edit/{$app['app_auth_id']}">
                                                        <img class="tbl-image" src="{$system['system_uploads']}/{$app['app_icon']}">
                                                        {$app['app_name']}
                                                    </a>
                                                </td>
                                                <td>{$app['app_auth_id']}</td>
                                                <td>{$app['app_auth_secret']}</td>
                                                <td>
                                                    <span class="js_moment" data-time="{$app['app_date']}">{$app['app_date']}</span>
                                                </td>
                                                <td>
                                                    <a data-toggle="tooltip" data-placement="top" title='{__("Edit")}' href="{$system['system_url']}/developers/edit/{$app['app_auth_id']}" class="btn btn-sm btn-icon btn-rounded btn-primary">
                                                        <i class="fa fa-pencil-alt"></i>
                                                    </a>
                                                    <button data-toggle="tooltip" data-placement="top" title='{__("Delete")}' class="btn btn-sm btn-icon btn-rounded btn-danger js_developers-delete-app" data-id="{$app['app_auth_id']}">
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
                <!-- apps -->

            {elseif $view == "new"}

                <!-- new app -->
                <div class="card mt20">
                    <div class="card-header with-icon">
                        <i class="fa fa-plus-circle mr10"></i>{__("Create New App")}
                        <div class="float-right">
                            <a href="{$system['system_url']}/developers/apps" class="btn btn-sm btn-light">
                                <i class="fa fa-arrow-circle-left mr5"></i>{__("Go Back")}
                            </a>
                        </div>
                    </div>
                    <form class="js_ajax-forms" data-url="developers/app.php?do=create">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-12 col-md-8 col-lg-6 col-xl-5 mx-md-auto">
                                    <div class="form-group">
                                        <label class="form-control-label" for="app_name">{__("App Name")}</label>
                                        <input type="text" class="form-control" name="app_name">
                                        <span class="form-text">
                                            {__("Your App Name")}
                                        </span>
                                    </div>
                                    <div class="form-group">
                                        <label class="form-control-label" for="app_domain">{__("App Domain")}</label>
                                        <input type="text" class="form-control" name="app_domain">
                                        <span class="form-text">
                                            {__("Your App domain (example: www.domain.com)")}
                                        </span>
                                    </div>
                                    <div class="form-group">
                                        <label class="form-control-label" for="app_redirect_url">{__("Redirect URL")}</label>
                                        <input type="text" class="form-control" name="app_redirect_url">
                                        <span class="form-text">
                                            {__("Your App Redirect URL (example: https://www.domain.com/test.php)")}
                                        </span>
                                    </div>
                                    <div class="form-group">
                                        <label class="form-control-label" for="app_description">{__("App Description")}</label>
                                        <textarea class="form-control" name="app_description" rows="5"></textarea>
                                        <span class="form-text">
                                            {__("Set a description for your App (maximum 200 characters)")}
                                        </span>
                                    </div>
                                    <div class="form-group">
                                        <label class="form-control-label" for="app_category">{__("Category")}</label>
                                        <select class="form-control" name="app_category" id="app_category">
                                            <option>{__("Select Category")}</option>
                                            {foreach $categories as $category}
                                                <option value="{$category['category_id']}">{__($category['category_name'])}</option>
                                            {/foreach}
                                        </select>
                                        <span class="form-text">
                                            {__("Select a category for your App")}
                                        </span>
                                    </div>
                                    <div class="form-group">
                                        <label class="form-control-label" for="app_icon">{__("App Icon (1024 x 1024)")}</label>
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
                                            <input type="hidden" class="js_x-image-input" name="app_icon">
                                        </div>
                                        <span class="form-text">
                                            {__("App Icon (1024 x 1024), supported formats (JPG, PNG)")}
                                        </span>
                                    </div>

                                    <!-- error -->
                                    <div class="alert alert-danger mb0 x-hidden"></div>
                                    <!-- error -->
                                </div>
                            </div>
                        </div>
                        <div class="card-footer text-right">
                            <button type="submit" class="btn btn-primary">
                                <i class="fas fa-plus mr10"></i>{__("Create")}
                            </button>
                        </div>
                    </form>
                </div>
                <!-- new app -->

            {elseif $view == "edit"}

                <!-- edit app -->
                <div class="card mt20">
                    <div class="card-header with-icon">
                        <i class="fa fa-edit mr10"></i>{__("Edit App")}
                        <div class="float-right">
                            <a href="{$system['system_url']}/developers/apps" class="btn btn-sm btn-light">
                                <i class="fa fa-arrow-circle-left mr5"></i>{__("Go Back")}
                            </a>
                        </div>
                    </div>
                    <form class="js_ajax-forms" data-url="developers/app.php?do=edit&id={$app['app_auth_id']}">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-12 col-md-8 col-lg-6 col-xl-5 mx-md-auto">
                                    <div class="form-group">
                                        <label class="form-control-label" for="app_auth_id">{__("App ID")}</label>
                                        <input disabled type="text" class="form-control" name="app_auth_id" value="{$app['app_auth_id']}">
                                    </div>
                                    <div class="form-group">
                                        <label class="form-control-label" for="app_auth_secret">{__("App Secret")}</label>
                                        <input disabled type="text" class="form-control" name="app_auth_secret" value="{$app['app_auth_secret']}">
                                    </div>
                                    <div class="form-group">
                                        <label class="form-control-label" for="app_name">{__("App Name")}</label>
                                        <input type="text" class="form-control" name="app_name" value="{$app['app_name']}">
                                        <span class="form-text">
                                            {__("Your App Name")}
                                        </span>
                                    </div>
                                    <div class="form-group">
                                        <label class="form-control-label" for="app_domain">{__("App Domain")}</label>
                                        <input type="text" class="form-control" name="app_domain" value="{$app['app_domain']}">
                                        <span class="form-text">
                                            {__("Your App domain (example: www.domain.com)")}
                                        </span>
                                    </div>
                                    <div class="form-group">
                                        <label class="form-control-label" for="app_redirect_url">{__("Redirect URL")}</label>
                                        <input type="text" class="form-control" name="app_redirect_url" value="{$app['app_redirect_url']}">
                                        <span class="form-text">
                                            {__("Your App Redirect URL (example: https://www.domain.com/test.php)")}
                                        </span>
                                    </div>
                                    <div class="form-group">
                                        <label class="form-control-label" for="app_description">{__("App Description")}</label>
                                        <textarea class="form-control" name="app_description" rows="5">{$app['app_description']}</textarea>
                                        <span class="form-text">
                                            {__("Set a description for your App (maximum 200 characters)")}
                                        </span>
                                    </div>
                                    <div class="form-group">
                                        <label class="form-control-label" for="app_category">{__("Category")}</label>
                                        <select class="form-control" name="app_category" id="app_category">
                                            <option>{__("Select Category")}</option>
                                            {foreach $categories as $category}
                                                <option {if $app['app_category_id'] == $category['category_id']}selected{/if} value="{$category['category_id']}">{__($category['category_name'])}</option>
                                            {/foreach}
                                        </select>
                                        <span class="form-text">
                                            {__("Select a category for your App")}
                                        </span>
                                    </div>
                                    <div class="form-group">
                                        <label class="form-control-label" for="app_icon">{__("App Icon (1024 x 1024)")}</label>

                                        {if $app['app_icon'] == ''}
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
                                                <input type="hidden" class="js_x-image-input" name="app_icon">
                                            </div>
                                        {else}
                                            <div class="x-image" style="background-image: url('{$system['system_uploads']}/{$app['app_icon']}')">
                                                <button type="button" class="close js_x-image-remover" title='{__("Remove")}'>
                                                    <span>×</span>
                                                </button>
                                                <div class="x-image-loader">
                                                    <div class="progress x-progress">
                                                        <div class="progress-bar" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
                                                    </div>
                                                </div>
                                                <i class="fa fa-camera fa-lg js_x-uploader" data-handle="x-image"></i>
                                                <input type="hidden" class="js_x-image-input" name="app_icon" value="{$app['app_icon']}">
                                            </div>
                                        {/if}
                                        <span class="form-text">
                                            {__("App Icon (1024 x 1024), supported formats (JPG, PNG)")}
                                        </span>
                                    </div>

                                    <!-- success -->
                                    <div class="alert alert-success mb0 x-hidden"></div>
                                    <!-- success -->

                                    <!-- error -->
                                    <div class="alert alert-danger mb0 x-hidden"></div>
                                    <!-- error -->
                                </div>
                            </div>
                        </div>
                        <div class="card-footer text-right">
                            <button type="submit" class="btn btn-primary">{__("Save Changes")}</button>
                        </div>
                    </form>
                </div>
                <!-- edit app -->

            {elseif $view == "share"}

                <!-- share plugin -->
                <div class="card mt20">
                    <div class="card-header with-icon">
                        <i class="fa fa-share-alt-square mr10"></i>{__("Share Plugin")}
                    </div>
                    <div class="card-body page-content">
                        <h6>
                            {__("Add the following code in your site, inside the head tag")}:
                        </h6>
                        <pre>&lt;script&gt;
    function SocialShare(url) {
        window.open('{$system['system_url']}/share?url=' + url, '', 'height=600,width=800');
    }
&lt;/script&gt;</pre>
                        <h6>
                            {__("Then place the share button after changing the URL you want to share to your page HTML")}:
                        </h6>
                        <pre>&lt;button onclick="SocialShare('http://yoursite.com/')"&gt;Click me&lt;/button&gt;</pre>
                        <h6>
                            {__("Example")}:
                        </h6>
                        <script>
                            function SocialShare(url) {
                                window.open(site_path+'/share?url='+url, '', 'height=600,width=800');
                            }
                        </script>
                        <button class="btn btn-sm btn-primary" onclick="SocialShare(site_path)" >{__("Click Here")}</button>
                    </div>
                </div>
                <!-- share plugin -->

            {/if}
        </div>
        <!-- content panel -->

    </div>
</div>
<!-- page content -->

{include file='_footer.tpl'}