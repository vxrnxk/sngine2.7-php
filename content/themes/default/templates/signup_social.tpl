{include file='_head.tpl'}
{include file='_header.tpl'}

<!-- page header -->
<div class="page-header bg-3">
    <img class="floating-img d-none d-md-block" src="{$system['system_url']}/content/themes/{$system['theme']}/images/headers/undraw_product_teardown_elol.svg">
    <div class="crystal c03"></div>
    <div class="circle-2"></div>
    <div class="circle-3"></div>
    <div class="inner">
        <h2>{__("Getting Started")}</h2>
        <p>{__("This information will let us know more about you")}</p>
    </div>
</div>
<!-- page header -->

<!-- page content -->
<div class="container" style="margin-top: -25px;">
    <div class="row">
        <div class="col-12 col-md-8 col-lg-6 col-xl-5 mx-md-auto">
            <div class="card card-register px-4 py-4 shadow">
                <h3 class="mb20 text-center">{__("Welcome")} <span class="text-primary">{$user_profile->displayName}</span></h3>
                <div class="text-center">
                    <img class="img-thumbnail rounded-circle" src="{$user_profile->photoURL}" width="99" height="99">
                </div>
                <form class="js_ajax-forms" data-url="core/signup_social.php">
                    {if !$system['registration_enabled'] && $system['invitation_enabled']}
                        <div class="form-group">
                            <label class="form-control-label">{__("Invitation Code")}</label>
                            <div class="input-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="fas fa-handshake fa-fw"></i></span>
                                </div>
                                <input name="invitation_code" type="text" class="form-control" required autofocus>
                            </div>
                        </div>
                    {/if}
                    <div class="form-group">
                        <label class="form-control-label">{__("First name")}</label>
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text"><i class="fas fa-user fa-fw"></i></span>
                            </div>
                            <input name="first_name" type="text" class="form-control" value="{$user_profile->firstName}" required autofocus>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="form-control-label">{__("Last name")}</label>
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text"><i class="fas fa-user fa-fw"></i></span>
                            </div>
                            <input name="last_name" type="text" class="form-control" value="{$user_profile->lastName}" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="form-control-label">{__("Username")}</label>
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text"><i class="fas fa-globe fa-fw"></i></span>
                            </div>
                            <input name="username" type="text" class="form-control" value="{$user_profile->username}" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="form-control-label">{__("Email")}</label>
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text"><i class="fas fa-envelope fa-fw"></i></span>
                            </div>
                            <input name="email" type="email" class="form-control" value="{$user_profile->email}" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="form-control-label">{__("Password")}</label>
                        <div class="form-group">
                            <div class="input-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="fas fa-key fa-fw"></i></span>
                                </div>
                                <input name="password" type="password" class="form-control" required>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="form-control-label">{__("I am")}</label>
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text"><i class="fas fa-mars fa-fw"></i></span>
                            </div>
                            <select name="gender" class="form-control" required>
                                <option value="none">{__("Select Sex")}:</option>
                                <option {if $user_profile->gender == "male"}selected{/if} value="male">{__("Male")}</option>
                                <option {if $user_profile->gender == "female"}selected{/if} value="female">{__("Female")}</option>
                                <option value="other">{__("Other")}</option>
                            </select>
                        </div>
                    </div>
                    <!-- newsletter consent -->
                    {if $system['newsletter_consent']}
                        <div class="custom-control custom-checkbox mb10">
                            <input type="checkbox" class="custom-control-input" name="newsletter_agree" id="newsletter_agree">
                            <label class="custom-control-label" for="newsletter_agree">
                                {__("I expressly agree to receive the newsletter")}
                            </label>
                        </div>
                    {/if}
                    <!-- newsletter consent -->
                    <div class="custom-control custom-checkbox mb10">
                        <input type="checkbox" class="custom-control-input" name="privacy_agree" id="privacy_agree">
                        <label class="custom-control-label" for="privacy_agree">
                            {__("By creating your account, you agree to our")} <a href="{$system['system_url']}/static/terms" target="_blank">{__("Terms")}</a> & <a href="{$system['system_url']}/static/privacy" target="_blank">{__("Privacy Policy")}</a>
                        </label>
                    </div>
                    <div class="form-group">
                        <input value="{$user_profile->photoURL}" name="avatar" type="hidden">
                        <input value="{$provider}" name="provider" type="hidden">
                        <button type="submit" class="btn btn-block btn-success bg-gradient-green border-0 rounded-pill">{__("Sign Up")}</button>
                    </div>
                    <!-- error -->
                    <div class="alert alert-danger mb0 x-hidden"></div>
                    <!-- error -->
                </form>
            </div>
        </div>
    </div>
</div>
<!-- page content -->

{include file='_footer.tpl'}