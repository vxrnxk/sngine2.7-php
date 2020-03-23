<div class="card card-register">

    <!-- signin -->
    <div class="js_panel {if $do == 'up'}x-hidden{/if}">
        <div class="card-header">
            <img class="card-img" src="{$system['system_url']}/content/themes/{$system['theme']}/images/home/square1.jpg">
            <h4 class="card-title">{__("Login")}</h4>
        </div>
        <div class="card-body">
            {if $highlight}<div class="alert alert-warning">{$highlight}</div>{/if}
            <form class="js_ajax-forms" data-url="core/signin.php">
                <div class="form-group">
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="far fa-user fa-fw"></i></span>
                        </div>
                        <input type="text" class="form-control" placeholder='{__("Email")} {__("or")} {__("Username")}' name="username_email" required>
                    </div>
                </div>
                <div class="form-group">
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="fas fa-key fa-fw"></i></span>
                        </div>
                        <input type="password" class="form-control" placeholder='{__("Password")}' name="password" required>
                    </div>
                </div>
                <div class="custom-control custom-checkbox mb10">
                    <input type="checkbox" class="custom-control-input" name="remember" id="remember">
                    <label class="custom-control-label" for="remember">{__("Remember me")}</label>
                    <a class="float-right" href="{$system['system_url']}/reset">{__("Forgotten password?")}</a>
                </div>
                <div class="form-group">
                    <button type="submit" class="btn btn-block btn-primary bg-gradient-blue border-0 rounded-pill">{__("Login")}</button>
                </div>
                <!-- error -->
                <div class="alert alert-danger mb0 x-hidden"></div>
                <!-- error -->
            </form>
            {if $system['social_login_enabled']}
                {if $system['facebook_login_enabled'] || $system['google_login_enabled'] || $system['twitter_login_enabled'] || $system['linkedin_login_enabled'] || $system['vkontakte_login_enabled'] || $system['instagram_login_enabled']}
                    <div class="hr-heading mt5 mb10">
                        <div class="hr-heading-text">
                            {__("or")} {__("login with")}
                        </div>
                    </div>
                    <div class="text-center">
                        {if $system['facebook_login_enabled']}
                            <a href="{$system['system_url']}/connect/facebook" class="btn btn-sm btn-rounded btn-social-icon btn-facebook">
                                <i class="fab fa-facebook-f"></i>
                            </a>
                        {/if}
                        {if $system['google_login_enabled']}
                            <a href="{$system['system_url']}/connect/google" class="btn btn-sm btn-rounded btn-social-icon btn-google">
                                <i class="fab fa-google"></i>
                            </a>
                        {/if}
                        {if $system['twitter_login_enabled']}
                            <a href="{$system['system_url']}/connect/twitter" class="btn btn-sm btn-rounded btn-social-icon btn-twitter">
                                <i class="fab fa-twitter"></i>
                            </a>
                        {/if}
                        {if $system['instagram_login_enabled']}
                            <a href="{$system['system_url']}/connect/instagram" class="btn btn-sm btn-rounded btn-social-icon btn-instagram">
                                <i class="fab fa-instagram"></i>
                            </a>
                        {/if}
                        {if $system['linkedin_login_enabled']}
                            <a href="{$system['system_url']}/connect/linkedin" class="btn btn-sm btn-rounded btn-social-icon btn-linkedin">
                                <i class="fab fa-linkedin"></i>
                            </a>
                        {/if}
                        {if $system['vkontakte_login_enabled']}
                            <a href="{$system['system_url']}/connect/vkontakte" class="btn btn-sm btn-rounded btn-social-icon btn-vk">
                                <i class="fab fa-vk"></i>
                            </a>
                        {/if}
                    </div>
                {/if}
            {/if}
            {if $system['registration_enabled'] || (!$system['registration_enabled'] && $system['invitation_enabled'])}
                <div class="mt20 text-center">
                    {__("Not registered?")} <a href="{$system['system_url']}/signup" class="js_toggle-panel text-link">{__("Create an account")}</a>
                </div>
            {/if}
        </div>
    </div>
    <!-- signin -->

    <!-- signup -->
    <div class="js_panel {if $do != 'up'}x-hidden{/if}">
        <div class="card-header">
            <img class="card-img" src="{$system['system_url']}/content/themes/{$system['theme']}/images/home/square1.jpg">
            <h4 class="card-title">{__("Register")}</h4>
        </div>
        <div class="card-body">
            <form class="js_ajax-forms" data-url="core/signup.php">
                {if !$system['registration_enabled'] && $system['invitation_enabled']}
                    <div class="form-group">
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text"><i class="fas fa-handshake fa-fw"></i></span>
                            </div>
                            <input name="invitation_code" type="text" class="form-control" placeholder='{__("Invitation Code")}' required>
                        </div>
                    </div>
                {/if}
                <div class="form-group">
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="fas fa-user fa-fw"></i></span>
                        </div>
                        <input name="first_name" type="text" class="form-control" placeholder='{__("First name")}' required>
                    </div>
                </div>
                <div class="form-group">
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="fas fa-user fa-fw"></i></span>
                        </div>
                        <input name="last_name" type="text" class="form-control" placeholder='{__("Last name")}' required>
                    </div>
                </div>
                <div class="form-group">
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="fas fa-globe fa-fw"></i></span>
                        </div>
                        <input name="username" type="text" class="form-control" placeholder='{__("Username")}' required>
                    </div>
                </div>
                <div class="form-group">
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="fas fa-envelope fa-fw"></i></span>
                        </div>
                        <input name="email" type="email" class="form-control" placeholder='{__("Email")}' required>
                    </div>
                </div>
                {if $system['activation_enabled'] && $system['activation_type'] == "sms"}
                    <div class="form-group">
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text"><i class="fas fa-phone fa-fw"></i></span>
                            </div>
                            <input name="phone" type="text" class="form-control" placeholder='{__("Phone number (eg. +905...)")}' required>
                        </div>
                    </div>
                {/if}
                <div class="form-group">
                    <div class="form-group">
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text"><i class="fas fa-key fa-fw"></i></span>
                            </div>
                            <input name="password" type="password" class="form-control" placeholder='{__("Password")}' required>
                        </div>
                    </div>
                </div>
                <div class="js_hidden-section x-hidden">
                    <div class="form-group">
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text"><i class="fas fa-mars fa-fw"></i></span>
                            </div>
                            <select name="gender" id="gender" class="form-control" required>
                                <option value="none">{__("Select Sex")}:</option>
                                <option value="male">{__("Male")}</option>
                                <option value="female">{__("Female")}</option>
                                <option value="other">{__("Other")}</option>
                            </select>
                        </div>
                    </div>
                    {if $system['age_restriction']}
                        <div class="form-group">
                            <label class="form-control-label">{__("Birthdate")}</label>
                            <div class="form-row">
                                <div class="col">
                                    <select class="form-control" name="birth_month">
                                        <option value="none">{__("Month")}</option>
                                        <option {if $user->_data['user_birthdate_parsed']['month'] == '1'}selected{/if} value="1">{__("Jan")}</option>
                                        <option {if $user->_data['user_birthdate_parsed']['month'] == '2'}selected{/if} value="2">{__("Feb")}</option>
                                        <option {if $user->_data['user_birthdate_parsed']['month'] == '3'}selected{/if} value="3">{__("Mar")}</option>
                                        <option {if $user->_data['user_birthdate_parsed']['month'] == '4'}selected{/if} value="4">{__("Apr")}</option>
                                        <option {if $user->_data['user_birthdate_parsed']['month'] == '5'}selected{/if} value="5">{__("May")}</option>
                                        <option {if $user->_data['user_birthdate_parsed']['month'] == '6'}selected{/if} value="6">{__("Jun")}</option>
                                        <option {if $user->_data['user_birthdate_parsed']['month'] == '7'}selected{/if} value="7">{__("Jul")}</option>
                                        <option {if $user->_data['user_birthdate_parsed']['month'] == '8'}selected{/if} value="8">{__("Aug")}</option>
                                        <option {if $user->_data['user_birthdate_parsed']['month'] == '9'}selected{/if} value="9">{__("Sep")}</option>
                                        <option {if $user->_data['user_birthdate_parsed']['month'] == '10'}selected{/if} value="10">{__("Oct")}</option>
                                        <option {if $user->_data['user_birthdate_parsed']['month'] == '11'}selected{/if} value="11">{__("Nov")}</option>
                                        <option {if $user->_data['user_birthdate_parsed']['month'] == '12'}selected{/if} value="12">{__("Dec")}</option>
                                    </select>
                                </div>
                                <div class="col">
                                    <select class="form-control" name="birth_day">
                                        <option value="none">{__("Day")}</option>
                                        {for $i=1 to 31}
                                        <option {if $user->_data['user_birthdate_parsed']['day'] == $i}selected{/if} value="{$i}">{$i}</option>
                                        {/for}
                                    </select>
                                </div>
                                <div class="col">
                                    <select class="form-control" name="birth_year">
                                        <option value="none">{__("Year")}</option>
                                        {for $i=1905 to 2017}
                                        <option {if $user->_data['user_birthdate_parsed']['year'] == $i}selected{/if} value="{$i}">{$i}</option>
                                        {/for}
                                    </select>
                                </div>
                            </div>
                        </div>
                    {/if}
                    <!-- custom fields -->
                    {if $custom_fields}
                    {include file='__custom_fields.tpl' _custom_fields=$custom_fields _registration=true}
                    {/if}
                    <!-- custom fields -->
                    {if $system['reCAPTCHA_enabled']}
                        <div class="form-group">
                            <!-- reCAPTCHA -->
                            <script src='https://www.google.com/recaptcha/api.js' async defer></script>
                            <div class="g-recaptcha" data-sitekey="{$system['reCAPTCHA_site_key']}"></div>
                            <!-- reCAPTCHA -->
                        </div>
                    {/if}
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
                </div>
                <div class="form-group">
                    <button type="submit" class="btn btn-block btn-success bg-gradient-green border-0 rounded-pill">{__("Sign Up")}</button>
                </div>
                <!-- error -->
                <div class="alert alert-danger mb0 x-hidden"></div>
                <!-- error -->
            </form>
            {if $system['social_login_enabled']}
                {if $system['facebook_login_enabled'] || $system['google_login_enabled'] || $system['twitter_login_enabled'] || $system['linkedin_login_enabled'] || $system['vkontakte_login_enabled'] || $system['instagram_login_enabled']}
                    <div class="hr-heading mt5 mb10">
                        <div class="hr-heading-text">
                            {__("or")} {__("register with")}
                        </div>
                    </div>
                    <div class="text-center">
                        {if $system['facebook_login_enabled']}
                            <a href="{$system['system_url']}/connect/facebook" class="btn btn-sm btn-rounded btn-social-icon btn-facebook">
                                <i class="fab fa-facebook-f"></i>
                            </a>
                        {/if}
                        {if $system['google_login_enabled']}
                            <a href="{$system['system_url']}/connect/google" class="btn btn-sm btn-rounded btn-social-icon btn-google">
                                <i class="fab fa-google"></i>
                            </a>
                        {/if}
                        {if $system['twitter_login_enabled']}
                            <a href="{$system['system_url']}/connect/twitter" class="btn btn-sm btn-rounded btn-social-icon btn-twitter">
                                <i class="fab fa-twitter"></i>
                            </a>
                        {/if}
                        {if $system['instagram_login_enabled']}
                            <a href="{$system['system_url']}/connect/instagram" class="btn btn-sm btn-rounded btn-social-icon btn-instagram">
                                <i class="fab fa-instagram"></i>
                            </a>
                        {/if}
                        {if $system['linkedin_login_enabled']}
                            <a href="{$system['system_url']}/connect/linkedin" class="btn btn-sm btn-rounded btn-social-icon btn-linkedin">
                                <i class="fab fa-linkedin"></i>
                            </a>
                        {/if}
                        {if $system['vkontakte_login_enabled']}
                            <a href="{$system['system_url']}/connect/vkontakte" class="btn btn-sm btn-rounded btn-social-icon btn-vk">
                                <i class="fab fa-vk"></i>
                            </a>
                        {/if}
                    </div>
                {/if}
            {/if}
            <div class="mt20 text-center">
                {__("Have an account?")} <a href="{$system['system_url']}/signin" class="js_toggle-panel text-link">{__("Login Now")}</a>
            </div>
        </div>
    </div>
    <!-- signup -->
</div>