{include file='_head.tpl'}
{include file='_header.tpl'}

<!-- page content -->
<div class="container mt30">
	<div class="row">
        <div class="col-md-6 col-lg-5 mx-md-auto">
        	<div class="card-ouath-overlay"></div>
            <div class="card card-ouath">
		        <div class="card-body text-center">
                    <!-- app icon -->
                    <div style="width: 120px; height: 120px; margin: 0 auto;">
                    	<div class="circled-user-box">
	                        <a class="user-box" href="#">
	                            <img alt="{$app['app_name']}" src="{$system['system_uploads']}/{$app['app_icon']}" />
	                        </a>
	                    </div>
                    </div>
                    <!-- app icon -->
                    
                    <!-- app name -->
                    <div>
                        <h3 class="mb5"><span class="text-primary">{$app['app_name']}</span></h3>
                        <p>{$app['app_domain']}</p>
                    </div>
                    <!-- app name -->

                    <!-- app permissions -->
                    <div class="divider"></div>
                    <div class="text-readable">
                    	{__("Will receive your")}:<br>
                    	<span class="badge badge-info">{__("Name")}</span> <span class="badge badge-info">{__("Email Address")}</span> <span class="badge badge-info">{__("Profile Picture")}</span>
                    </div>
                    <div class="divider"></div>
                    <!-- app permissions -->

                    <div class="plr30">
                    	<button type="button" class="btn btn-block btn-primary mb10 js_developers-oauth-app" data-id="{$app['app_auth_id']}">
                    		<i class="fas fa-check-circle mr5"></i>{__("Continue as")} {$user->_data['user_firstname']}
                    	</button>
                    	<a href="{$system['system_url']}" class="btn mr5">{__("Cancel")}</a>
                    </div>
		        </div>
            </div>
        </div>
    </div>
</div>
<!-- page content -->

{include file='_footer.tpl'}