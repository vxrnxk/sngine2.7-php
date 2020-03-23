{include file='_head.tpl'}
{include file='_header.tpl'}

<!-- page header -->
<div class="page-header bg-2">
    <img class="floating-img d-none d-md-block" src="{$system['system_url']}/content/themes/{$system['theme']}/images/headers/undraw_message_sent_1030.svg">
    <div class="crystal c03"></div>
    <div class="circle-2"></div>
    <div class="circle-3"></div>
    <div class="inner">
        <h2>{__("Reset Password")}</h2>
        <p>{__("Enter the email address you signed up with and we'll email you a reset link")}</p>
    </div>
</div>
<!-- page header -->

<!-- page content -->
<div class="container" style="margin-top: -25px;">
    <div class="row">
        <div class="col-12 col-md-8 col-lg-6 col-xl-5 mx-md-auto">
            <div class="card px-4 py-4 shadow">
                <div class="card-body">
                    <form class="js_ajax-forms" data-url="core/forget_password.php">
                        <div class="form-group">
                            <label class="form-control-label">{__("Email")}</label>
                            <input name="email" id="email" type="text" class="form-control" required autofocus>
                        </div>

                        {if $system['reCAPTCHA_enabled']}
                            <div class="form-group">
                                <!-- reCAPTCHA -->
                                <script src='https://www.google.com/recaptcha/api.js' async defer></script>
                                <div class="g-recaptcha" data-sitekey="{$system['reCAPTCHA_site_key']}"></div>
                                <!-- reCAPTCHA -->
                            </div>
                        {/if}
                        
                        <div class="form-group">
                            <button type="submit" class="btn btn-md btn-block rounded-pill btn-primary">
                                <i class="far fa-envelope-open mr10"></i>{__("Send")}
                            </button>
                        </div>

                        <!-- error -->
                        <div class="alert alert-danger x-hidden"></div>
                        <!-- error -->
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- page content -->

{include file='_footer.tpl'}