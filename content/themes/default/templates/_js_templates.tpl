{strip}

<!-- Modals -->
<div id="modal" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">
                <div class="loader pt10 pb10"></div>
            </div>
        </div>
    </div>
</div>

<script id="modal-login" type="text/template">
    <div class="modal-header">
        <h6 class="modal-title">{__("Not Logged In")}</h6>
    </div>
    <div class="modal-body">
        <p>{__("Please log in to continue")}</p>
    </div>
    <div class="modal-footer">
        <a class="btn btn-primary" href="{$system['system_url']}/signin">{__("Login")}</a>
    </div>
</script>

<script id="modal-message" type="text/template">
    <div class="modal-header">
        <h6 class="modal-title">{literal}{{title}}{/literal}</h6>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
        </button>
    </div>
    <div class="modal-body">
        <p>{literal}{{message}}{/literal}</p>
    </div>
</script>

<script id="modal-success" type="text/template">
    <div class="modal-body text-center">
        <div class="big-icon success">
            <i class="fa fa-thumbs-up fa-3x"></i>
        </div>
        <h4>{literal}{{title}}{/literal}</h4>
        <p class="mt20">{literal}{{message}}{/literal}</p>
    </div>
</script>

<script id="modal-error" type="text/template">
    <div class="modal-body text-center">
        <div class="big-icon error">
            <i class="fa fa-times fa-3x"></i>
        </div>
        <h4>{literal}{{title}}{/literal}</h4>
        <p class="mt20">{literal}{{message}}{/literal}</p>
    </div>
</script>

<script id="modal-confirm" type="text/template">
    <div class="modal-header">
        <h6 class="modal-title">{literal}{{title}}{/literal}</h6>
    </div>
    <div class="modal-body">
        <p>{literal}{{message}}{/literal}</p>
    </div>
    <div class="modal-footer">
        <button type="button" class="btn btn-light" data-dismiss="modal">{__("Cancel")}</button>
        <button type="button" class="btn btn-primary" id="modal-confirm-ok">{__("Confirm")}</button>
    </div>
</script>

<script id="modal-loading" type="text/template">
    <div class="modal-body text-center">
        <div class="spinner-border text-primary"></div>
    </div>
</script>
<!-- Modals -->


<!-- Translator -->
<script id="translator" type="text/template">
    <div class="modal-header">
        <h6 class="modal-title">{__("Select Your Language")}</h6>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
        </button>
    </div>
    <div class="modal-body">
        <ul>
            {foreach $system['languages'] as $language}
                <li style="width: 18.7%; display: inline-block; text-align: center; margin: 30px 2px 5px;">
                    <a style="display: table; text-decoration: none; font-weight: 700; font-size: 13px; width: 100%;" href="?lang={$language['code']}">
                        {$language['title']}
                        <div style="display: table-caption; width: 50px; height: 50px; background: 0 0; margin: 0 auto 8px; box-shadow: 0 1px 3px rgba(0,0,0,.24); border-radius: 50%; transition: all .2s ease-in-out;">
                            <img width="50" src="{$language['flag']}">
                        </div>
                    </a>
                </li>
            {/foreach}
        </ul>
    </div>
</script>
<!-- Translator -->


<!-- Search -->
<script id="search-for" type="text/template">
    <div class="ptb10 plr10">
        <a href="{$system['system_url']}/search/{literal}{{#hashtag}}hashtag/{{/hashtag}}{/literal}{literal}{{query}}{/literal}">
            <i class="fa fa-search pr5"></i> {__("Search for")} {literal}{{#hashtag}}#{{/hashtag}}{/literal}{literal}{{query}}{/literal}
        </a>
    </div>
</script>
<!-- Search -->


<!-- Lightbox -->
<script id="lightbox" type="text/template">
    <div class="lightbox">
        <div class="container lightbox-container">
            <div class="lightbox-preview">
                <div class="lightbox-next js_lightbox-slider">
                    <i class="fa fa-chevron-right fa-3x"></i>
                </div>
                <div class="lightbox-prev js_lightbox-slider">
                    <i class="fa fa-chevron-left fa-3x"></i>
                </div>
                <img alt="" class="img-fluid" src="{literal}{{image}}{/literal}">
            </div>
            <div class="lightbox-data">
                <div class="clearfix">
                    <div class="pt5 pr5 float-right">
                        <button type="button" class="close lightbox-close js_lightbox-close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                </div>
                <div class="lightbox-post">
                    <div class="js_scroller" data-slimScroll-height="100%">
                        <div class="loader mtb10"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</script>

<script id="lightbox-nodata" type="text/template">
    <div class="lightbox">
        <div class="container lightbox-container">
            <div class="lightbox-preview nodata">
                <img alt="" class="img-fluid" src="{literal}{{image}}{/literal}">
            </div>
        </div>
    </div>
</script>
<!-- Lightbox -->


{if !$user->_logged_in}
    
    <!-- Forget Password -->
    <script id="forget-password-confirm" type="text/template">
        <div class="modal-header">
            <h6 class="modal-title">{__("Check Your Email")}</h6>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>
        <form class="js_ajax-forms" data-url="core/forget_password_confirm.php">
            <div class="modal-body">
                <div class="mb20">
                    {__("Check your email")} - {__("We sent you an email with a six-digit confirmation code. Enter it below to continue to reset your password")}.
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <input name="reset_key" type="text" class="form-control" placeholder="######" required autofocus>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <label class="form-control-label mb5">{__("We sent your code to")}</label> <span class="badge badge-lg badge-warning">{literal}{{email}}{/literal}</span>
                    </div>
                </div>

                <!-- error -->
                <div class="alert alert-danger mb0 x-hidden"></div>
                <!-- error -->
            </div>
            <div class="modal-footer">
                <input name="email" type="hidden" value="{literal}{{email}}{/literal}">
                <button type="button" class="btn btn-light" data-dismiss="modal">{__("Cancel")}</button>
                <button type="submit" class="btn btn-primary">{__("Continue")}</button>
            </div>
        </form>
    </script>
    
    <script id="forget-password-reset" type="text/template">
        <div class="modal-header">
            <h6 class="modal-title">{__("Change Your Password!")}</h6>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>
        <form class="js_ajax-forms" data-url="core/forget_password_reset.php">
            <div class="modal-body">
                <div class="form-group">
                    <label class="form-control-label" for="password">{__("New Password")}</label>
                    <input name="password" id="password" type="password" class="form-control" required autofocus>
                </div>
                <div class="form-group">
                    <label class="form-control-label" for="confirm">{__("Confirm Password")}</label>
                    <input name="confirm" id="confirm" type="password" class="form-control" required>
                </div>
                <!-- error -->
                <div class="alert alert-danger mb0 mt10 x-hidden"></div>
                <!-- error -->
            </div>
            <div class="modal-footer">
                <input name="email" type="hidden" value="{literal}{{email}}{/literal}">
                <input name="reset_key" type="hidden" value="{literal}{{reset_key}}{/literal}">
                <button type="button" class="btn btn-light" data-dismiss="modal">{__("Cancel")}</button>
                <button type="submit" class="btn btn-primary">{__("Continue")}</button>
            </div>
        </form>
    </script>
    <!-- Forget Password -->

    <!-- Two-Factor Authentication -->
    <script id="two-factor-authentication" type="text/template">
        <div class="modal-header">
            <h6 class="modal-title">{__("Two-factor authentication required")}</h6>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>
        <form class="js_ajax-forms" data-url="core/two_factor_authentication.php">
            <div class="modal-body">
                <div class="mb20">
                    {__("You've asked us to require a 6-digit login code when anyone tries to access your account from a new device or browser")}.
                </div>
                <div class="mb20">
                    {__("Enter the 6-digit code that we sent to your")} <strong>{literal}{{method}}{/literal}</strong>
                </div>
                <div class="form-group">
                    <input name="two_factor_key" type="text" class="form-control" placeholder="######" required autofocus>
                </div>
                <!-- error -->
                <div class="alert alert-danger mb0 mt10 x-hidden"></div>
                <!-- error -->
            </div>
            <div class="modal-footer">
                <input name="user_id" type="hidden" value="{literal}{{user_id}}{/literal}">
                {literal}{{#remember}}{/literal}<input name="remember" type="hidden" value="true">{literal}{{/remember}}{/literal}
                <button type="submit" class="btn btn-primary">{__("Continue")}</button>
            </div>
        </form>
    </script>
    <!-- Two-Factor Authentication -->

{else}
    
    <!-- Email Activation -->
    <script id="activation-email-reset" type="text/template">
        <div class="modal-header">
            <h6 class="modal-title">{__("Change Email Address")}</h6>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>
        <form class="js_ajax-forms" data-url="core/activation_email_reset.php">
            <div class="modal-body">
                <div class="form-group">
                    <label class="form-control-label mb10">{__("Current Email")}</label><br>
                    <span class="badge badge-lg badge-info">{$user->_data['user_email']}</span>
                    
                </div>
                <div class="form-group">
                    <label class="form-control-label" for="email">{__("New Email")}</label>
                    <input name="email" id="email" type="email" class="form-control" required autofocus>
                </div>
                <!-- error -->
                <div class="alert alert-danger mb0 mt10 x-hidden"></div>
                <!-- error -->
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-light" data-dismiss="modal">{__("Cancel")}</button>
                <button type="submit" class="btn btn-primary">{__("Continue")}</button>
            </div>
        </form>
    </script>
    <!-- Email Activation -->


    <!-- Phone Activation -->
    <script id="activation-phone" type="text/template">
        <div class="modal-header">
            <h6 class="modal-title">{__("Enter the code from the SMS message")}</h6>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>
        <form class="js_ajax-forms" data-url="core/activation_phone_confirm.php">
            <div class="modal-body">
                <div class="mb20">
                    {__("Let us know if this mobile number belongs to you. Enter the code in the SMS")}
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <input name="token" type="text" class="form-control" placeholder="######" required autofocus>
                            {if $user->_data['user_phone']}
                                <span class="form-text">
                                    <span class="text-link" data-toggle="modal" data-url="core/activation_phone_resend.php">{__("Resend SMS")}</span>
                                </span>
                            {/if}
                        </div>

                        <!-- error -->
                        <div class="alert alert-danger mb0 mt10 x-hidden"></div>
                        <!-- error -->
                    </div>
                    <div class="col-md-6">
                        {if $user->_data['user_phone']}
                            {__("We sent your code to")} <strong>{$user->_data['user_phone']}</strong>
                        {/if}
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-light" data-dismiss="modal">{__("Cancel")}</button>
                <button type="submit" class="btn btn-primary">{__("Continue")}</button>
            </div>
        </form>
    </script>

    <script id="activation-phone-reset" type="text/template">
        <div class="modal-header">
            <h6 class="modal-title">{__("Change Phone Number")}</h6>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>
        <form class="js_ajax-forms" data-url="core/activation_phone_reset.php">
            <div class="modal-body">
                {if $user->_data['user_phone']}
                    <div class="form-group">
                        <label class="form-control-label">{__("Current Phone")}</label>
                        <p class="form-control-plaintext">{$user->_data['user_phone']}</p>
                        
                    </div>
                {/if}
                <div class="form-group">
                    <label class="form-control-label">{__("New Phone")}</label>
                    <input name="phone" type="text" class="form-control" required autofocus>
                    <span class="form-text">
                        {__("For example")}: +12344567890
                    </span>
                </div>
                <!-- error -->
                <div class="alert alert-danger mb0 mt10 x-hidden"></div>
                <!-- error -->
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-light" data-dismiss="modal">{__("Cancel")}</button>
                <button type="submit" class="btn btn-primary">{__("Continue")}</button>
            </div>
        </form>
    </script>
    <!-- Phone Activation -->


    <!-- x-uploader -->
    {/strip}
    <script id="x-uploader" type="text/template">
        <form class="x-uploader" action="{literal}{{url}}{/literal}" method="post" enctype="multipart/form-data">
            {literal}{{#multiple}}{/literal}
                <input name="file[]" type="file" multiple="multiple" accept="{literal}{{accept}}{/literal}">
            {literal}{{/multiple}}{/literal}
            {literal}{{^multiple}}{/literal}
                <input name="file" type="file" accept="{literal}{{accept}}{/literal}">
            {literal}{{/multiple}}{/literal}
            <input type="hidden" name="secret" value="{literal}{{secret}}{/literal}">
        </form>
    </script>
    {strip}
    <!-- x-uploader -->


    <!-- Noty Notification -->
    {if $system['noty_notifications_enabled']}
        <script id="noty-notification" type="text/template">
            <div class="data-container small">
                <div class="data-avatar">
                    <img src="{literal}{{image}}{/literal}">
                </div>
                <div class="data-content">{literal}{{message}}{/literal}</div>
            </div>
        </script>
    {/if}
    <!-- Noty Notification -->


    <!-- Adblock Detector -->
    {if $system['adblock_detector_enabled']}
        <script id="adblock-detector" type="text/template">
            <div class="adblock-detector">
                {__("Our website is made possible by displaying online advertisements to our visitors")}<br>
                {__("Please consider supporting us by disabling your ad blocker")}.
            </div>
        </script>
    {/if}
    <!-- Adblock Detector -->


    <!-- Keyboard Shortcuts -->
    <script id="keyboard-shortcuts" type="text/template">
        <div class="modal-header">
            <h6 class="modal-title"><i class="fa fa-keyboard mr5"></i>{__("Keyboard Shortcuts")}</h6>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>
        <div class="modal-body text-readable">
            <div class="mb10">
                <kbd>J</kbd> {__("Scroll to the next post")}
            </div>
            <div>
                <kbd>K</kbd> {__("Scroll to the previous post")}
            </div>
        </div>
    </script>
    <!-- Keyboard Shortcuts -->


    <!-- Emoji Menu -->
    <script id="emoji-menu" type="text/template">
        <div class="emoji-menu">
            <div class="tab-content">
                <div class="tab-pane active" id="tab-emojis-{literal}{{id}}{/literal}">
                    <div class="js_scroller" data-slimScroll-height="180">
                        {foreach from=$user->get_emojis() item=emoji}
                            <div class="item">
                                <i data-emoji="{$emoji['pattern']}" class="js_emoji twa twa-2x twa-{$emoji['class']}"></i>
                            </div>
                        {/foreach}
                    </div>
                </div>

                <div class="tab-pane" id="tab-stickers-{literal}{{id}}{/literal}">
                    <div class="js_scroller" data-slimScroll-height="180">
                        {foreach from=$user->get_stickers() item=sticker}
                            <div class="item">
                                <img data-emoji=":STK-{$sticker['sticker_id']}:" src="{$system['system_uploads']}/{$sticker['image']}" class="js_emoji">
                            </div>
                        {/foreach}
                    </div>
                </div>
            </div>

            <ul class="nav nav-tabs">
                <li class="nav-item">
                    <a class="nav-link active" href="#tab-emojis-{literal}{{id}}{/literal}" data-toggle="tab">
                        <i class="fa fa-smile fa-fw mr5"></i>{__("Emojis")}
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#tab-stickers-{literal}{{id}}{/literal}" data-toggle="tab">
                        <i class="fa fa-hand-peace fa-fw mr5"></i>{__("Stickers")}
                    </a>
                </li>
            </ul>
        </div>
    </script>
    <!-- Emoji Menu -->


    <!-- Chat -->
    {if $system['chat_enabled']}
        <!-- Chat Sidebar -->
        <div class="chat-sidebar {if !$user->_data['user_chat_enabled']}disabled{/if}">
            <div class="chat-sidebar-header">
                <div class="float-right">
                    <a class="js_chat-new mr5" href="{$system['system_url']}/messages/new">
                        <i class="fa fa-edit"></i>
                    </a>
                    <i class="fa fa-cog" data-toggle="dropdown" data-display="static"></i>
                    <div class="dropdown-menu dropdown-menu-right">
                        <a class="dropdown-item" href="{$system['system_url']}/settings/blocking">{__("Manage Blocking")}</a>
                        <a class="dropdown-item" href="{$system['system_url']}/settings/privacy">{__("Privacy Settings")}</a>
                        <div class="dropdown-divider"></div>
                        {if $user->_data['user_chat_enabled']}
                            <div class="dropdown-item pointer js_chat-toggle" data-status="on">{__("Turn Off Chat")}</div>
                        {else}
                            <div class="dropdown-item pointer js_chat-toggle" data-status="off">{__("Turn On Chat")}</div>
                        {/if}
                    </div>
                </div>
                <strong>{__("Chat")}</strong><span class="ml5 badge badge-pill badge-info js_chat-online-users">{$online_friends_count}</span>
            </div>
            <div class="chat-sidebar-content">
                <div class="js_scroller" data-slimScroll-height="100%">
                    <ul>
                        {foreach $sidebar_friends as $_user}
                            <li class="feeds-item">
                                <div class="data-container clickable small js_chat-start" data-uid="{$_user['user_id']}" data-name="{$_user['user_firstname']} {$_user['user_lastname']}" data-link="{$_user['user_name']}">
                                    <div class="data-avatar">
                                        <img src="{$_user['user_picture']}" alt="{$_user['user_firstname']} {$_user['user_lastname']}">
                                    </div>
                                    <div class="data-content">
                                        <div class="float-right">
                                            <i class="fa fa-circle {if $_user['user_is_online'] }online{else}offline{/if}"></i>
                                        </div>
                                        <div>
                                            <strong>{$_user['user_firstname']} {$_user['user_lastname']}</strong>
                                            {if $system['chat_status_enabled'] && !$_user['user_is_online']}
                                                <br>
                                                <small>
                                                    {{__("Last Seen")}} <span class="js_moment" data-time="{$_user['user_last_seen']}">{$_user['user_last_seen']}</span>
                                                </small>
                                            {/if}
                                        </div>
                                    </div>
                                </div>
                            </li>
                        {/foreach}
                    </ul>
                </div>
            </div>
            <div class="chat-sidebar-footer">
                <input type="text" class="form-control form-control-sm js_chat-search" placeholder='{__("Search")}'>
            </div>
        </div>
        <!-- Chat Sidebar -->
    {/if}

    <script id="chat-box-new" type="text/template">
        <div class="chat-widget chat-box opened fresh">
            <!-- head -->
            <div class="chat-widget-head">
                {__("New Message")}
                <!-- buttons-->
                <div class="float-right">
                    <i class="fa fa-times-circle js_chat-box-close"></i>
                </div>
                <!-- buttons-->
            </div>
            <!-- head -->
            <!-- content -->
            <div class="chat-widget-content">
                <div class="chat-conversations js_scroller"></div>
                <div class="chat-to clearfix js_autocomplete-tags">
                    <div class="to">{__("To")}:</div>
                    <ul class="tags"></ul>
                    <div class="typeahead">
                        <input type="text" size="1" autofocus>
                    </div>
                </div>
                <div class="chat-attachments attachments clearfix x-hidden">
                    <ul>
                        <li class="loading">
                            <div class="progress x-progress"><div class="progress-bar" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div></div>
                        </li>
                    </ul>
                </div>
                <div class="x-form chat-form invisible">
                    <div class="chat-form-message">
                        <textarea class="js_autosize js_post-message" dir="auto" rows="1" placeholder='{__("Write a message")}'></textarea>
                    </div>
                    <ul class="x-form-tools clearfix">
                        {if $system['photos_enabled']}
                            <li class="x-form-tools-attach">
                                <i class="far fa-image fa-lg fa-fw js_x-uploader" data-handle="chat"></i>
                            </li>
                        {/if}
                        <li class="x-form-tools-emoji js_emoji-menu-toggle">
                            <i class="far fa-smile-wink fa-lg fa-fw"></i>
                        </li>
                    </ul>
                </div>
            </div>
            <!-- content -->
        </div>
    </script>

    <script id="chat-box" type="text/template">
        <div class="chat-widget chat-box opened" id="{literal}{{chat_key_value}}{/literal}" 
        {literal}{{#conversation_id}}{/literal}data-cid="{literal}{{conversation_id}}{/literal}"{literal}{{/conversation_id}}{/literal}
        {literal}{{#user_id}}{/literal}data-uid="{literal}{{user_id}}{/literal}"{literal}{{/user_id}}{/literal}>
            <!-- head -->
            <div class="chat-widget-head js_chat-color-me">
                {literal}{{^multiple}}{/literal}
                <i class="fa fa-user-secret mr5 js_chat-box-status"></i>
                <a href="{$system['system_url']}/{literal}{{link}}{/literal}" title="{literal}{{name_list}}{/literal}">{literal}{{name}}{/literal}</a>
                {literal}{{/multiple}}{/literal}
                {literal}{{#multiple}}{/literal}
                <a href="{$system['system_url']}/messages/{literal}{{link}}{/literal}" title="{literal}{{name_list}}{/literal}">{literal}{{name}}{/literal}</a>
                {literal}{{/multiple}}{/literal}
                <!-- label -->
                <div class="chat-head-label"><span class="badge badge-pill badge-lg badge-danger js_chat-box-label"></span></div>
                <!-- label -->
                <!-- buttons-->
                <div class="float-right">
                    <!-- video/audio calls (not multiple) -->
                    {literal}{{^multiple}}{/literal}
                        {if $system['video_call_enabled']}
                            <i class="fa fa-video mr10 js_chat-call-start" data-type="video" data-uid="{literal}{{user_id}}{/literal}" data-name="{literal}{{name_list}}{/literal}"></i>
                        {/if}
                        {if $system['audio_call_enabled']}
                            <i class="fa fa-phone-alt mr10 js_chat-call-start" data-type="audio" data-uid="{literal}{{user_id}}{/literal}" data-name="{literal}{{name_list}}{/literal}"></i>
                        {/if}
                    {literal}{{/multiple}}{/literal}
                    <!-- video/audio calls (not multiple) -->
                    <i class="fa fa-times-circle js_chat-box-close"></i>
                </div>
                <!-- buttons-->
            </div>
            <!-- head -->
            <!-- content -->
            <div class="chat-widget-content">
                <div class="chat-conversations js_scroller"><ul></ul></div>
                <div class="chat-typing">
                    <i class="far fa-comment-dots mr5"></i><span class="loading-dots"><span class="js_chat-typing-users"></span> {__("Typing")}</span>
                </div>
                <div class="chat-attachments attachments clearfix x-hidden">
                    <ul>
                        <li class="loading">
                            <div class="progress x-progress"><div class="progress-bar" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div></div>
                        </li>
                    </ul>
                </div>
                <div class="x-form chat-form">
                    <div class="chat-form-message">
                        <textarea class="js_autosize js_post-message" dir="auto" rows="1" placeholder='{__("Write a message")}'></textarea>
                    </div>
                    <ul class="x-form-tools clearfix">
                        {if $system['photos_enabled']}
                            <li class="x-form-tools-attach">
                                <i class="far fa-image fa-lg fa-fw js_x-uploader" data-handle="chat"></i>
                            </li>
                        {/if}
                        <li class="x-form-tools-emoji js_emoji-menu-toggle">
                            <i class="far fa-smile-wink fa-lg fa-fw"></i>
                        </li>
                        <li class="x-form-tools-colors js_chat-colors-menu-toggle js_chat-color-me {literal}{{^conversation_id}}{/literal}x-hidden{literal}{{/conversation_id}}{/literal}">
                            <i class="fa fa-circle fa-lg fa-fw"></i>
                        </li>
                    </ul>
                </div>
            </div>
            <!-- content -->
        </div>
    </script>

    <script id="chat-message" type="text/template">
        <li>
            <div class="conversation clearfix right" id="{literal}{{id}}{/literal}">
                <div class="conversation-body">
                    <div class="text js_chat-color-me" {literal}{{#color}}{/literal}style="background-color: {literal}{{color}}{/literal}"{literal}{{/color}}{/literal}>
                        {literal}{{{message}}}{/literal}
                        {literal}{{#image}}{/literal}
                            <span class="text-link js_lightbox-nodata {literal}{{#message}}{/literal}mt5{literal}{{/message}}{/literal}" data-image="{$system['system_uploads']}/{literal}{{image}}{/literal}">
                                <img alt="" class="img-fluid" src="{$system['system_uploads']}/{literal}{{image}}{/literal}">
                            </span>
                        {literal}{{/image}}{/literal}
                    </div>
                    <div class="time js_moment" data-time="{literal}{{time}}{/literal}">
                        {literal}{{time}}{/literal}
                    </div>
                </div>
            </div>
        </li>
    </script>

    <script id="chat-calling" type="text/template">
        <div class="modal-header border-0">
            <h6 class="modal-title  mx-auto">
                {literal}{{#is_video}}{/literal}<i class="fa fa-video mr5"></i>{literal}{{/is_video}}{/literal}
                {literal}{{#is_audio}}{/literal}<i class="fa fa-phone-volume mr5"></i>{literal}{{/is_audio}}{/literal}
                {__("Calling")}
            </h6>
        </div>
        <div class="modal-body text-center">
            <h3>{literal}{{name}}{/literal}</h3>
            <p class="text-lg js_chat-calling-message">{__("Connecting")}<span class="loading-dots"></span></p>
            
            <div class="twilio-stream-wrapper">
                <div class="twilio-stream"></div>
                <video class="twilio-stream-local" autoplay=""></video>
            </div>

            <div class="mt30">
                <button type="button" class="btn btn-light x-hidden js_chat-call-close" data-dismiss="modal">{__("Close")}</button>
                <button type="button" class="btn btn-icon btn-rounded btn-danger x-hidden js_chat-call-cancel" data-type="{literal}{{type}}{/literal}" data-dismiss="modal">
                    <i class="fas fa-phone-slash fa-lg fa-fw"></i>
                </button>
                <button type="button" class="btn btn-icon btn-rounded btn-danger x-hidden js_chat-call-end" data-type="{literal}{{type}}{/literal}" data-dismiss="modal">
                    <i class="fas fa-phone-slash fa-lg fa-fw"></i>
                </button>
            </div>
        </div>
        <div class="modal-footer border-0"></div>
    </script>

    <script id="chat-ringing" type="text/template">
        <div class="modal-header border-0">
            <h6 class="modal-title mx-auto">
                {literal}{{#is_video}}{/literal}<i class="fa fa-video mr5"></i>{__("New Video Call")}{literal}{{/is_video}}{/literal}
                {literal}{{#is_audio}}{/literal}<i class="fa fa-phone-volume mr5"></i>{__("New Audio Call")}{literal}{{/is_audio}}{/literal}
            </h6>
        </div>
        <div class="modal-body text-center">
            <div class="position-relative mb10" style="height: 106px;">
                <div class="profile-avatar-wrapper static">
                    <img src="{literal}{{image}}{/literal}" alt="{literal}{{name}}{/literal}" style="width: 98px; height: 98px;">
                </div>
            </div>
            <h3>{literal}{{name}}{/literal}</h3>
            {literal}{{#is_video}}{/literal}<p class="text-lg js_chat-ringing-message">{__("Wants to have video call with you")}</p>{literal}{{/is_video}}{/literal}
            {literal}{{#is_audio}}{/literal}<p class="text-lg js_chat-ringing-message">{__("Wants to have audio call with you")}</p>{literal}{{/is_audio}}{/literal}
            
            <div class="twilio-stream-wrapper">
                <div class="twilio-stream"></div>
                <video class="twilio-stream-local" autoplay=""></video>
            </div>

            <div class="mt30">
                <button type="submit" class="btn btn-icon btn-rounded btn-success mr10 js_chat-call-answer" data-type="{literal}{{type}}{/literal}" data-id="{literal}{{id}}{/literal}"><i class="fas fa-phone-alt fa-lg fa-fw"></i></button>
                <button type="button" class="btn btn-icon btn-rounded btn-danger js_chat-call-decline" data-type="{literal}{{type}}{/literal}" data-id="{literal}{{id}}{/literal}" data-dismiss="modal"><i class="fas fa-phone-slash fa-lg fa-fw"></i></button>
                <button type="button" class="btn btn-icon btn-rounded btn-danger x-hidden js_chat-call-end" data-type="{literal}{{type}}{/literal}" data-id="{literal}{{id}}{/literal}" data-dismiss="modal"><i class="fas fa-phone-slash fa-lg fa-fw"></i></button>
            </div>
        </div>
        <div class="modal-footer border-0"></div>
    </script>

    <script id="chat-colors-menu" type="text/template">
        <div class="chat-colors-menu">
            <div class="js_scroller" data-slimScroll-height="180">
                <div class="item js_chat-color" data-color="#3367d6" style="color: #3367d6;">
                    <i class="fa fa-circle fa-2x"></i>
                </div>
                <div class="item js_chat-color" data-color="#0ba05d" style="color: #0ba05d;">
                    <i class="fa fa-circle fa-2x"></i>
                </div>
                <div class="item js_chat-color" data-color="#ed9e6a" style="color: #ed9e6a;">
                    <i class="fa fa-circle fa-2x"></i>
                </div>
                <div class="item js_chat-color" data-color="#a085e2" style="color: #a085e2;">
                    <i class="fa fa-circle fa-2x"></i>
                </div>
                <div class="item js_chat-color" data-color="#01a5a5" style="color: #01a5a5;">
                    <i class="fa fa-circle fa-2x"></i>
                </div>
                <div class="item js_chat-color" data-color="#2b87ce" style="color: #2b87ce;">
                    <i class="fa fa-circle fa-2x"></i>
                </div>
                <div class="item js_chat-color" data-color="#ff72d2" style="color: #ff72d2;">
                    <i class="fa fa-circle fa-2x"></i>
                </div>
                <div class="item js_chat-color" data-color="#c9605e" style="color: #c9605e;">
                    <i class="fa fa-circle fa-2x"></i>
                </div>
                <div class="item js_chat-color" data-color="#056bba" style="color: #056bba;">
                    <i class="fa fa-circle fa-2x"></i>
                </div>
                <div class="item js_chat-color" data-color="#fc9cde" style="color: #fc9cde;">
                    <i class="fa fa-circle fa-2x"></i>
                </div>
                <div class="item js_chat-color" data-color="#70a0e0" style="color: #70a0e0;">
                    <i class="fa fa-circle fa-2x"></i>
                </div>
                <div class="item js_chat-color" data-color="#f2812b" style="color: #f2812b;">
                    <i class="fa fa-circle fa-2x"></i>
                </div>
                <div class="item js_chat-color" data-color="#8ec96c" style="color: #8ec96c;">
                    <i class="fa fa-circle fa-2x"></i>
                </div>
                <div class="item js_chat-color" data-color="#f33d4c" style="color: #f33d4c;">
                    <i class="fa fa-circle fa-2x"></i>
                </div>
                <div class="item js_chat-color" data-color="#aa2294" style="color: #aa2294;">
                    <i class="fa fa-circle fa-2x"></i>
                </div>
                <div class="item js_chat-color" data-color="#0e71ea" style="color: #0e71ea;">
                    <i class="fa fa-circle fa-2x"></i>
                </div>
                <div class="item js_chat-color" data-color="#b582af" style="color: #b582af;">
                    <i class="fa fa-circle fa-2x"></i>
                </div>
                <div class="item js_chat-color" data-color="#a1ce79" style="color: #a1ce79;">
                    <i class="fa fa-circle fa-2x"></i>
                </div>
                <div class="item js_chat-color" data-color="#56c4c5" style="color: #56c4c5;">
                    <i class="fa fa-circle fa-2x"></i>
                </div>
                <div class="item js_chat-color" data-color="#f9a722" style="color: #f9a722;">
                    <i class="fa fa-circle fa-2x"></i>
                </div>
                <div class="item js_chat-color" data-color="#f9c270" style="color: #f9c270;">
                    <i class="fa fa-circle fa-2x"></i>
                </div>
                <div class="item js_chat-color" data-color="#609b41" style="color: #609b41;">
                    <i class="fa fa-circle fa-2x"></i>
                </div>
                <div class="item js_chat-color" data-color="#51bcbc" style="color: #51bcbc;">
                    <i class="fa fa-circle fa-2x"></i>
                </div>
                <div class="item js_chat-color" data-color="#008484" style="color: #008484;">
                    <i class="fa fa-circle fa-2x"></i>
                </div>
                <div class="item js_chat-color" data-color="#5462a5" style="color: #5462a5;">
                    <i class="fa fa-circle fa-2x"></i>
                </div>
            </div>
        </div>
    </script>

    <script id="chat-attachments-item" type="text/template">
        <li class="item deletable" data-src="{literal}{{src}}{/literal}">
            <img alt="" src="{literal}{{image_path}}{/literal}">
            <button type="button" class="close js_chat-attachment-remover" title='{__("Remove")}'><span>&times;</span></button>
        </li>
    </script>
    <!-- Chat -->

    
    <!-- DayTime Messages -->
    {if $system['daytime_msg_enabled'] && $page == "index"}
        <script id="message-morning" type="text/template">
            <div class="card daytime_message">
                <button type="button" class="close float-right js_daytime-remover"><span>&times;</span></button>
                {include file='__svg_icons.tpl' icon="sun" width="40px" height="30px" class="mr5"}
                <strong>{__("Good Morning")}, {$user->_data['user_firstname']}</strong>
            </div>
        </script>

        <script id="message-afternoon" type="text/template">
            <div class="card daytime_message">
                <button type="button" class="close float-right js_daytime-remover"><span>&times;</span></button>
                {include file='__svg_icons.tpl' icon="afternoon" width="40px" height="30px" class="mr5"}
                <strong>{__("Good Afternoon")}, {$user->_data['user_firstname']}</strong>
            </div>
        </script>
        
        <script id="message-evening" type="text/template">
            <div class="card daytime_message">
                <button type="button" class="close float-right js_daytime-remover"><span>&times;</span></button>
                {include file='__svg_icons.tpl' icon="night" width="40px" height="30px" class="mr5"}
                <strong>{__("Good Evening")}, {$user->_data['user_firstname']}</strong>
            </div>
        </script>
    {/if}
    <!-- DayTime Messages -->


    <!-- Gifts -->
    {if $system['gifts_enabled'] && $page == "profile"}
        <script id="gifts" type="text/template">
            <div class="modal-header">
                <h6 class="modal-title"><i class="fa fa-gift mr5"></i>{__("Gifts")}</h6>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form class="js_ajax-forms" data-url="users/gifts.php?do=send&uid={literal}{{uid}}{/literal}">
                <div class="modal-body">
                    <div class="js_scroller" data-slimScroll-height="440">
                        <div class="row no-gutters">
                            {foreach from=$gifts item=gift}
                                <div class="col-12 col-sm-6 col-md-4 ptb5 plr5">
                                    <input class="x-hidden input-label" type="radio" name="gift" value="{$gift['gift_id']}" id="gift_{$gift['gift_id']}"/>
                                    <label class="button-label-image" for="gift_{$gift['gift_id']}">
                                        <img src="{$system['system_uploads']}/{$gift['image']}">
                                    </label>
                                </div>
                            {/foreach}
                        </div>
                    </div>
                    <!-- error -->
                    <div class="alert alert-danger mb0 mt10 x-hidden"></div>
                    <!-- error -->
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary">{__("Send")}</button>
                </div>
            </form>
        </script>

        <script id="gift" type="text/template">
            <div class="modal-header">
                <h6 class="modal-title"><i class="fa fa-gift mr5"></i>{$gift['user_firstname']} {$gift['user_lastname']} {__("sent you a gift")}</h6>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body text-center">
                <img class="img-fluid" src="{$system['system_uploads']}/{$gift['image']}">
            </div>
        </script>
    {/if}
    <!-- Gifts -->


    <!-- Posts [Publisher|Comments] -->
    {if $page == "index" || $page == "profile" || $page == "page" || $page == "group" || $page == "event" || $page == "post" || $page == "photo" || $page == "market" || $page == "blogs" || $page == "directory" || $page == "search" || $page == "share"}
        <!-- Publisher -->
        <script id="publisher-attachments-image-item" type="text/template">
            <li class="item deletable" data-src="{literal}{{src}}{/literal}">
                <img alt="" src="{literal}{{image_path}}{/literal}">
                <button type="button" class="close {literal}{{#mini}}{/literal}js_publisher-mini-attachment-image-remover{literal}{{/mini}}{/literal}{literal}{{^mini}}{/literal}js_publisher-attachment-image-remover{literal}{{/mini}}{/literal}" title='{__("Remove")}'><span>&times;</span></button>
            </li>
        </script>

        <script id="publisher-attachments-video-item" type="text/template">
            <li class="item deletable" data-src="{literal}{{src}}{/literal}">
                <div class="name">{literal}{{name}}{/literal}</div>
                <button type="button" class="close js_publisher-mini-attachment-video-remover" title='{__("Remove")}'><span>&times;</span></button>
            </li>
        </script>

        <script id="scraper-media" type="text/template">
            <div class="publisher-scraper-remover js_publisher-scraper-remover">
                <button type="button" class="close"><span>&times;</span></button>
            </div>
            <div class="post-media">
                <div class="embed-responsive embed-responsive-16by9">
                    {literal}{{{html}}}{/literal}
                </div>
                <div class="post-media-meta">
                    <a class="title mb5" href="{literal}{{url}}{/literal}" target="_blank">{literal}{{title}}{/literal}</a>
                    <div class="text mb5">{literal}{{text}}{/literal}</div>
                    <div class="source">{literal}{{provider}}{/literal}</div>
                </div>
            </div>
        </script>

        <script id="scraper-photo" type="text/template">
            <div class="publisher-scraper-remover js_publisher-scraper-remover">
                <button type="button" class="close"><span>&times;</span></button>
            </div>
            <div class="post-media">
                <div class="post-media-image">
                    <div style="background-image:url('{literal}{{url}}{/literal}');"></div>
                </div>
                <div class="post-media-meta">
                    <div class="source">{literal}{{provider}}{/literal}</div>
                </div>
            </div>
        </script>

        <script id="scraper-link" type="text/template">
            <div class="publisher-scraper-remover js_publisher-scraper-remover">
                <button type="button" class="close"><span>&times;</span></button>
            </div>
            <div class="post-media">
                {literal}{{#thumbnail}}{/literal}
                <div class="post-media-image">
                    <div style="background-image:url('{literal}{{thumbnail}}{/literal}');"></div>
                </div>
                {literal}{{/thumbnail}}{/literal}
                <div class="post-media-meta">
                    <a class="title mb5" href="{literal}{{url}}{/literal}" target="_blank">{literal}{{title}}{/literal}</a>
                    <div class="text mb5">{literal}{{text}}{/literal}</div>
                    <div class="source">{literal}{{host}}{/literal}</div>
                </div>
            </div>
        </script>

        <script id="poll-option" type="text/template">
            <div class="publisher-meta" data-meta="poll">
                <i class="fa fa-plus fa-fw"></i>
                <input type="text" placeholder='{__("Add an option")}...'>
            </div>
        </script>

        <script id="pubisher-gif" type="text/template">
            <div class="publisher-scraper-remover js_publisher-gif-remover">
                <button type="button" class="close"><span>&times;</span></button>
            </div>
            <div class="post-media">
                <div class="post-media-image">
                    <div style="background-image:url('{literal}{{src}}{/literal}');"></div>
                </div>
            </div>
        </script>
        <!-- Publisher -->


        <!-- Comments -->
        <script id="comment-attachments-item" type="text/template">
            <li class="item deletable" data-src="{literal}{{src}}{/literal}">
                <img alt="" src="{literal}{{image_path}}{/literal}">
                <button type="button" class="close js_comment-attachment-remover" title='{__("Remove")}'><span>&times;</span></button>
            </li>
        </script>
        <!-- Comments -->


        <!-- Edit (Posts|Comments) -->
        <script id="edit-post" type="text/template">
            <div class="post-edit">
                <div class="x-form comment-form">
                    <textarea rows="2" class="js_autosize js_mention js_update-post">{literal}{{text}}{/literal}</textarea>
                    <ul class="x-form-tools clearfix">
                        <li class="x-form-tools-post js_update-post">
                            <i class="far fa-paper-plane fa-lg fa-fw"></i>
                        </li>
                        <li class="x-form-tools-emoji js_emoji-menu-toggle">
                            <i class="far fa-smile-wink fa-lg fa-fw"></i>
                        </li>
                    </ul>
                </div>
                <small class="text-link js_unedit-post">{__("Cancel")}</small>
            </div>
        </script>
        
        <script id="edit-comment" type="text/template">
            <div class="comment-edit">
                <div class="x-form comment-form">
                    <textarea rows="1" class="js_autosize js_mention js_update-comment">{literal}{{text}}{/literal}</textarea>
                    <ul class="x-form-tools clearfix">
                        <li class="x-form-tools-post js_update-comment">
                            <i class="far fa-paper-plane fa-lg fa-fw"></i>
                        </li>
                        <li class="x-form-tools-attach">
                            <i class="far fa-image fa-lg fa-fw js_x-uploader" data-handle="comment"></i>
                        </li>
                        <li class="x-form-tools-emoji js_emoji-menu-toggle">
                            <i class="far fa-smile-wink fa-lg fa-fw"></i>
                        </li>
                    </ul>
                </div>
                <div class="comment-attachments attachments clearfix x-hidden">
                    <ul>
                        <li class="loading">
                            <div class="progress x-progress"><div class="progress-bar" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div></div>
                        </li>
                    </ul>
                </div>
                <small class="text-link js_unedit-comment">{__("Cancel")}</small>
            </div>
        </script>
        <!-- Edit (Posts|Comments) -->


        <!-- Hidden (Posts|Authors) -->
        <script id="hidden-post" type="text/template">
            <div class="post flagged" data-id="{literal}{{id}}{/literal}">
                <div class="text-semibold mb5">{__("Post Hidden")}</div>
                {__("This post will no longer appear to you")} <span class="text-link js_unhide-post">{__("Undo")}</span>
            </div>
        </script>

        <script id="hidden-author" type="text/template">
            <div class="post flagged" data-id="{literal}{{id}}{/literal}">
                {__("You won't see posts from")} {literal}{{name}}{/literal} {__("in News Feed anymore")}. <span class="text-link js_unhide-author" data-author-id="{literal}{{uid}}{/literal}" data-author-name="{literal}{{name}}{/literal}">{__("Undo")}</span>
            </div>
        </script>
        <!-- Hidden (Posts|Authors) -->
    {/if}
    <!-- Posts [Publisher|Comments] -->


    <!-- Pages & Groups & Events -->
    {if $page == "pages"}
        <script id="create-page" type="text/template">
            <div class="modal-header">
                <h6 class="modal-title">{__("Create New Page")}</h6>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form class="js_ajax-forms" data-url="pages_groups_events/create.php?type=page&do=create">
                <div class="modal-body">
                    <div class="form-group">
                        <label class="form-control-label" for="title">{__("Name Your Page")}</label>
                        <input type="text" class="form-control" name="title" id="title">
                    </div>
                    <div class="form-group">
                        <label class="form-control-label" for="username">{__("Web Address")}</label>
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text d-none d-sm-block">{$system['system_url']}/pages/</span>
                            </div>
                            <input type="text" class="form-control" name="username" id="username">
                        </div>
                        <span class="form-text">
                            {__("Can only contain alphanumeric characters (A–Z, 0–9) and periods ('.')")}
                        </span>
                    </div>
                    <div class="form-group">
                        <label class="form-control-label" for="category">{__("Category")}</label>
                        <select class="form-control" name="category" id="category">
                            <option>{__("Select Category")}</option>
                            {foreach $categories as $category}
                            <option value="{$category['category_id']}">{__($category['category_name'])}</option>
                            {/foreach}
                        </select>
                    </div>
                    <div class="form-group">
                        <label class="form-control-label" for="description">{__("About")}</label>
                        <textarea class="form-control" name="description" name="description"></textarea>
                    </div>
                    <!-- custom fields -->
                    {if $custom_fields}
                    {include file='__custom_fields.tpl' _custom_fields=$custom_fields _registration=true}
                    {/if}
                    <!-- custom fields -->
                    <!-- error -->
                    <div class="alert alert-danger mb0 mt10 x-hidden"></div>
                    <!-- error -->
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-light" data-dismiss="modal">{__("Cancel")}</button>
                    <button type="submit" class="btn btn-primary">{__("Create")}</button>
                </div>
            </form>
        </script>
    {/if}

    {if $page == "groups"}
        <script id="create-group" type="text/template">
            <div class="modal-header">
                <h6 class="modal-title">{__("Create New Group")}</h6>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form class="js_ajax-forms" data-url="pages_groups_events/create.php?type=group&do=create">
                <div class="modal-body">
                    <div class="form-group">
                        <label class="form-control-label" for="title">{__("Name Your Group")}</label>
                        <input type="text" class="form-control" name="title" id="title">
                    </div>
                    <div class="form-group">
                        <label class="form-control-label" for="username">{__("Web Address")}</label>
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text d-none d-sm-block">{$system['system_url']}/groups/</span>
                            </div>
                            <input type="text" class="form-control" name="username" id="username">
                        </div>
                        <span class="form-text">
                            {__("Can only contain alphanumeric characters (A–Z, 0–9) and periods ('.')")}
                        </span>
                    </div>
                    <div class="form-group">
                        <label class="form-control-label" for="privacy">{__("Select Privacy")}</label>
                        <select class="form-control selectpicker" name="privacy">
                            <option value="public" data-content="<div class='option'><div class='icon'><i class='fa fa-globe fa-2x'></i></div><div class='text'><b>{__("Public Group")}</b><br>{__("Anyone can see the group, its members and their posts")}.
                            </div></div>">{__("Public Group")}</option>
                            <option value="closed" data-content="<div class='option'><div class='icon'><i class='fa fa-unlock-alt fa-2x'></i></div><div class='text'><b>{__("Closed Group")}</b><br>{__("Only members can see posts")}.
                            </div></div>">{__("Closed Group")}</option>
                            <option value="secret" data-content="<div class='option'><div class='icon'><i class='fa fa-lock fa-2x'></i></div><div class='text'><b>{__("Secret Group")}</b><br>{__("Only members can find the group and see posts")}.
                            </div></div>">{__("Secret Group")}</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label class="form-control-label" for="category">{__("Category")}</label>
                        <select class="form-control" name="category" id="category">
                            <option>{__("Select Category")}</option>
                            {foreach $categories as $category}
                            <option value="{$category['category_id']}">{__($category['category_name'])}</option>
                            {/foreach}
                        </select>
                    </div>
                    <div class="form-group">
                        <label class="form-control-label" for="description">{__("About")}</label>
                        <textarea class="form-control" name="description"></textarea>
                    </div>
                    <!-- custom fields -->
                    {if $custom_fields}
                    {include file='__custom_fields.tpl' _custom_fields=$custom_fields _registration=true}
                    {/if}
                    <!-- custom fields -->
                    <!-- error -->
                    <div class="alert alert-danger mb0 mt10 x-hidden"></div>
                    <!-- error -->
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-light" data-dismiss="modal">{__("Cancel")}</button>
                    <button type="submit" class="btn btn-primary">{__("Create")}</button>
                </div>
            </form>
        </script>
    {/if}

    {if $page == "events"}
        <script id="create-event" type="text/template">
            <div class="modal-header">
                <h6 class="modal-title">{__("Create New Event")}</h6>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form class="js_ajax-forms" data-url="pages_groups_events/create.php?type=event&do=create">
                <div class="modal-body">
                    <div class="form-group">
                        <label class="form-control-label" for="title">{__("Name Your Event")}</label>
                        <input type="text" class="form-control" name="title" id="title">
                    </div>
                    <div class="form-group">
                        <label class="form-control-label" for="location">{__("Location")}</label>
                        <input type="text" class="form-control js_geocomplete" name="location" id="location">
                    </div>
                    <div class="form-group">
                        <label class="form-control-label">{__("Start Date")}</label>
                        <div class="input-group date js_datetimepicker" id="start_date" data-target-input="nearest">
                            <input type='text' class="form-control datetimepicker-input" data-target="#start_date" name="start_date" />
                            <div class="input-group-append" data-target="#start_date" data-toggle="datetimepicker">
                                <span class="input-group-text"><i class="fa fa-calendar"></i></span>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="form-control-label">{__("End Date")}</label>
                        <div class="input-group date js_datetimepicker" id="end_date" data-target-input="nearest">
                            <input type='text' class="form-control datetimepicker-input" data-target="#end_date" name="end_date" />
                            <div class="input-group-append" data-target="#end_date" data-toggle="datetimepicker">
                                <span class="input-group-text"><i class="fa fa-calendar"></i></span>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="form-control-label" for="privacy">{__("Select Privacy")}</label>
                        <select class="form-control selectpicker" name="privacy">
                            <option value="public" data-content="<div class='option'><div class='icon'><i class='fa fa-globe fa-2x'></i></div><div class='text'><b>{__("Public Event")}</b><br>{__("Anyone can see the event, its users and posts")}.
                            </div></div>">{__("Public Event")}</option>
                            <option value="closed" data-content="<div class='option'><div class='icon'><i class='fa fa-unlock-alt fa-2x'></i></div><div class='text'><b>{__("Closed Event")}</b><br>{__("Only event users can see posts")}.
                            </div></div>">{__("Closed Event")}</option>
                            <option value="secret" data-content="<div class='option'><div class='icon'><i class='fa fa-lock fa-2x'></i></div><div class='text'><b>{__("Secret Event")}</b><br>{__("Only invited users and event users can find the event")}.
                            </div></div>">{__("Secret Event")}</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label class="form-control-label" for="category">{__("Category")}</label>
                        <select class="form-control" name="category" id="category">
                            <option>{__("Select Category")}</option>
                            {foreach $categories as $category}
                            <option value="{$category['category_id']}">{__($category['category_name'])}</option>
                            {/foreach}
                        </select>
                    </div>
                    <div class="form-group">
                        <label class="form-control-label" for="description">{__("About")}</label>
                        <textarea class="form-control" name="description"></textarea>
                    </div>
                    <!-- custom fields -->
                    {if $custom_fields}
                    {include file='__custom_fields.tpl' _custom_fields=$custom_fields _registration=true}
                    {/if}
                    <!-- custom fields -->
                    <!-- error -->
                    <div class="alert alert-danger mb0 mt10 x-hidden"></div>
                    <!-- error -->
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-light" data-dismiss="modal">{__("Cancel")}</button>
                    <button type="submit" class="btn btn-primary">{__("Create")}</button>
                </div>
            </form>
        </script>
    {/if}
    <!-- Pages & Groups & Events -->


    <!-- Wallet -->
    {if $page == "ads"}
        <script id="wallet-transfer" type="text/template">
            <div class="modal-header">
                <h6 class="modal-title"><i class="fa fa-gift mr5"></i>{__("Send Money")}</h6>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form class="js_ajax-forms" data-url="ads/wallet.php?do=wallet_transfer">
                <div class="modal-body">
                    <div class="form-group">
                        <label class="form-control-label">{__("Amount")}</label>
                        <div class="input-money">
                            <span>{$system['system_currency_symbol']}</span>
                            <input type="text" class="form-control" placeholder="0.00" min="1.00" max="1000" name="amount">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="form-control-label" for="send_to">{__("Send To")}</label>
                        <div class="position-relative js_autocomplete">
                            <input type="text" class="form-control" placeholder="{__("Search for user name or email")}" name="send_to" id="send_to" autocomplete="off">
                            <input type="hidden" name="send_to_id">
                        </div>
                    </div>
                    <!-- error -->
                    <div class="alert alert-danger mb0 mt10 x-hidden"></div>
                    <!-- error -->
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-light" data-dismiss="modal">{__("Cancel")}</button>
                    <button type="submit" class="btn btn-primary">{__("Send")}</button>
                </div>
            </form>
        </script>

        <script id="wallet-replenish" type="text/template">
            <div class="modal-header">
                <h6 class="modal-title"><i class="fab fa-paypal mr5"></i>{__("Replenish Credit")}</h6>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form class="js_ajax-forms" data-url="ads/wallet.php?do=wallet_replenish">
                <div class="modal-body">
                    <div class="form-group">
                        <label class="form-control-label" for="amount">{__("Amount")}</label>
                        <div class="input-money">
                            <span>{$system['system_currency_symbol']}</span>
                            <input type="text" class="form-control" placeholder="0.00" min="1.00" max="1000" name="amount">
                        </div>
                    </div>
                    <!-- error -->
                    <div class="alert alert-danger mb0 mt10 x-hidden"></div>
                    <!-- error -->
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-light" data-dismiss="modal">{__("Cancel")}</button>
                    <button type="submit" class="btn btn-primary">{__("Continue")}</button>
                </div>
            </form>
        </script>
        
        <script id="wallet-withdraw-affiliates" type="text/template">
            <div class="modal-header">
                <h6 class="modal-title"><i class="fa fa-exchange-alt mr5"></i>{__("Withdraw Affiliates Credit")}</h6>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form class="js_ajax-forms" data-url="ads/wallet.php?do=wallet_withdraw_affiliates">
                <div class="modal-body">
                    <div class="form-group">
                        <label class="form-control-label" for="amount">{__("Your Affiliates Credit")}</label>
                        <div class="text-lg">
                            {$system['system_currency_symbol']}{$user->_data['user_affiliate_balance']|number_format:2}
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="form-control-label" for="amount">{__("Amount")}</label>
                        <div class="input-money">
                            <span>{$system['system_currency_symbol']}</span>
                            <input type="text" class="form-control" placeholder="0.00" min="1.00" max="1000" name="amount">
                        </div>
                    </div>
                    <!-- error -->
                    <div class="alert alert-danger mb0 mt10 x-hidden"></div>
                    <!-- error -->
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-light" data-dismiss="modal">{__("Cancel")}</button>
                    <button type="submit" class="btn btn-primary">{__("Continue")}</button>
                </div>
            </form>
        </script>

        <script id="wallet-withdraw-points" type="text/template">
            <div class="modal-header">
                <h6 class="modal-title"><i class="fa fa-piggy-bank mr5"></i>{__("Withdraw Points Credit")}</h6>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form class="js_ajax-forms" data-url="ads/wallet.php?do=wallet_withdraw_points">
                <div class="modal-body">
                    <div class="form-group">
                        <label class="form-control-label" for="amount">{__("Your Points Credit")}</label>
                        <div class="text-lg">
                            {$system['system_currency_symbol']}{((1/$system['points_per_currency'])*$user->_data['user_points'])|number_format:2}
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="form-control-label" for="amount">{__("Amount")}</label>
                        <div class="input-money">
                            <span>{$system['system_currency_symbol']}</span>
                            <input type="text" class="form-control" placeholder="0.00" min="1.00" max="1000" name="amount">
                        </div>
                    </div>
                    <!-- error -->
                    <div class="alert alert-danger mb0 mt10 x-hidden"></div>
                    <!-- error -->
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-light" data-dismiss="modal">{__("Cancel")}</button>
                    <button type="submit" class="btn btn-primary">{__("Continue")}</button>
                </div>
            </form>
        </script>
    {/if}
    <!-- Wallet -->


    <!-- Crop Profile Picture -->
    {if $page == "started" || $page == "profile" || $page == "page" || $page == "group"}
        <script id="crop-profile-picture" type="text/template">
            <div class="modal-header">
                <h6 class="modal-title"><i class="fa fa-crop-alt mr5"></i>{__("Crop Picture")}</h6>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body text-center">
                <img id="cropped-profile-picture" src="{literal}{{image}}{/literal}" style="max-width: 100%;">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-light" data-dismiss="modal">{__("Cancel")}</button>
                <button type="button" class="btn btn-primary js_crop-picture" data-handle="{literal}{{handle}}{/literal}" data-id="{literal}{{id}}{/literal}">{__("Save")}</button>
            </div>
        </script>
    {/if}
    <!-- Crop Profile Picture -->


    <!-- Download Information -->
    {if $page == "settings"}
        <script id="download-information" type="text/template">
            <div class="modal-header">
                <h6 class="modal-title"><i class="fa fa-cloud-download-alt mr5"></i>{__("Download Your Information")}</h6>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="text-center">
                    <img width="128px" src="{$system['system_url']}/content/themes/{$system['theme']}/images/headers/ready.png">
                    <p>{__("Your file is ready to download")}</p>
                    <a href="{$system['system_url']}/settings/download?hash={$user->_data['user_name']}-{$secret}" class="btn btn-md btn-primary bg-gradient-blue border-0 rounded-pill">
                        <i class="fa fa-cloud-download-alt mr10"></i>{__("Download")}
                    </a>
                </div>
            </div>
        </script>
    {/if}
    <!-- Download Information -->



    <!-- Verification Documents -->
    {if $page == "admin"}
        <script id="verification-documents" type="text/template">
            <div class="modal-header">
                <h6 class="modal-title"><i class="fa fa-paperclip mr5"></i>{__("Verification Documents")}</h6>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="form-group form-row">
                    <label class="col-md-3 form-control-label">
                        {__("Documents")}
                    </label>
                    <div class="col-sm-9">
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="section-title mb20">
                                    <i class="fas fa-passport mr10"></i>{__("Personal Photo")}
                                </div>
                                <a target="_blank" href="{literal}{{photo}}{/literal}">
                                    <img class="img-fluid" src="{literal}{{photo}}{/literal}">
                                </a>
                            </div>
                            <div class="col-sm-6">
                                <div class="section-title mb20">
                                    <i class="fas fa-passport mr10"></i>{__("Passport or National ID")}
                                </div>
                                <a target="_blank" href="{literal}{{passport}}{/literal}">
                                    <img class="img-fluid" src="{literal}{{passport}}{/literal}">
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-group form-row">
                    <label class="col-md-3 form-control-label">
                        {__("Message")}
                    </label>
                    <div class="col-sm-9">
                        <p class="pt5 pb0">{literal}{{message}}{/literal}</p>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button class="btn btn-danger js_admin-unverify" data-id="{literal}{{request-id}}{/literal}">
                    <i class="fa fa-times mr5"></i>{__("Decline")}
                </button>
                <button class="btn btn-success js_admin-verify" data-handle="{literal}{{handle}}{/literal}" data-id="{literal}{{node-id}}{/literal}">
                    <i class="fa fa-check mr5"></i>{__("Verify")}
                </button>
            </div>
        </script>
    {/if}
    <!-- Verification Documents -->


    <!-- Payments -->
    {if $page == "packages" || $page == "ads"}
        <script id="payment" type="text/template">
            <div class="modal-header">
                <h6 class="modal-title">{__("Select Your Payment Method")}</h6>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body text-center">
                <div class="row justify-content-center" style="margin-left: -5px; margin-right: -5px;">
                    {if $system['paypal_enabled']}
                        <div class="col-12 col-sm-4 plr5">
                        <button class="js_payment-paypal btn btn-block btn-payment plr20 mb10" 
                        data-handle="{literal}{{handle}}{/literal}" 
                        {literal}{{#id}}{/literal} data-id="{literal}{{id}}{/literal}" {literal}{{/id}}{/literal} 
                        {literal}{{#price}}{/literal} data-price="{literal}{{price}}{/literal}" {literal}{{/price}}{/literal} 
                        {literal}{{#name}}{/literal} data-name="{literal}{{name}}{/literal}" {literal}{{/name}}{/literal} 
                        {literal}{{#img}}{/literal} data-img="{literal}{{img}}{/literal}" {literal}{{/img}}{/literal} 
                        >
                            <i class="fab fa-paypal fa-lg fa-fw mr5" style="color: #00186A;"></i>{__("PayPal")}
                        </button>
                        </div>
                    {/if}
                    {if $system['creditcard_enabled']}
                        <div class="col-12 col-sm-4 plr5">
                            <button class="js_payment-stripe btn btn-block btn-payment plr20 mb10" 
                            data-handle="{literal}{{handle}}{/literal}" 
                            {literal}{{#id}}{/literal} data-id="{literal}{{id}}{/literal}" {literal}{{/id}}{/literal} 
                            {literal}{{#price}}{/literal} data-price="{literal}{{price}}{/literal}" {literal}{{/price}}{/literal} 
                            {literal}{{#name}}{/literal} data-name="{literal}{{name}}{/literal}" {literal}{{/name}}{/literal} 
                            {literal}{{#img}}{/literal} data-img="{literal}{{img}}{/literal}" {literal}{{/img}}{/literal} 
                            data-method="credit"> 
                                <i class="fa fa-credit-card fa-lg fa-fw mr5" style="color: #8798CC;"></i>{__("Credit Card")}
                            </button>
                        </div>
                    {/if}
                    {if $system['alipay_enabled']}
                        <div class="col-12 col-sm-4 plr5">
                            <button class="js_payment-stripe btn btn-block btn-payment plr20 mb10" 
                            data-handle="{literal}{{handle}}{/literal}" 
                            {literal}{{#id}}{/literal} data-id="{literal}{{id}}{/literal}" {literal}{{/id}}{/literal} 
                            {literal}{{#price}}{/literal} data-price="{literal}{{price}}{/literal}" {literal}{{/price}}{/literal} 
                            {literal}{{#name}}{/literal} data-name="{literal}{{name}}{/literal}" {literal}{{/name}}{/literal} 
                            {literal}{{#img}}{/literal} data-img="{literal}{{img}}{/literal}" {literal}{{/img}}{/literal} 
                            data-method="alipay">
                                <i class="fab fa-alipay fa-lg fa-fw mr5" style="color: #5B9EDD;"></i>{__("Alipay")}
                            </button>
                        </div>
                    {/if}
                    {if $system['coinpayments_enabled']}
                        <div class="col-12 col-sm-4 plr5">
                            <button class="js_payment-coinpayments btn btn-block btn-payment plr20 mb10" 
                            data-handle="{literal}{{handle}}{/literal}" 
                            {literal}{{#id}}{/literal} data-id="{literal}{{id}}{/literal}" {literal}{{/id}}{/literal} 
                            {literal}{{#price}}{/literal} data-price="{literal}{{price}}{/literal}" {literal}{{/price}}{/literal} 
                            {literal}{{#name}}{/literal} data-name="{literal}{{name}}{/literal}" {literal}{{/name}}{/literal} 
                            {literal}{{#img}}{/literal} data-img="{literal}{{img}}{/literal}" {literal}{{/img}}{/literal} 
                            >
                                <i class="fab fa-bitcoin fa-lg fa-fw mr5" style="color: #FFC107;"></i>{__("CoinPayments")}
                            </button>
                        </div>
                    {/if}
                    {if $system['2checkout_enabled']}
                        <div class="col-12 col-sm-4 plr5">
                            <button class="btn btn-block btn-payment plr20 mb10" data-toggle="modal" data-url="#twocheckout" data-options='{literal}{{/literal} "handle": "{literal}{{handle}}{/literal}", "price": "{literal}{{price}}{/literal}", "id": "{literal}{{id}}{/literal}" {literal}}{/literal}'>
                                {include file='__svg_icons.tpl' icon="2co" width="20px" height="20px" class="mr5"}{__("2Checkout")}
                            </button>
                        </div>
                    {/if}
                    {if $system['bank_transfers_enabled']}
                        <div class="col-12 col-sm-4 plr5">
                            <button class="btn btn-block btn-payment plr20 mb10" data-toggle="modal" data-url="#bank-transfer" data-options='{literal}{{/literal} "handle": "{literal}{{handle}}{/literal}", "price": "{literal}{{price}}{/literal}", "id": "{literal}{{id}}{/literal}" {literal}}{/literal}' data-size="large">
                                <i class="fa fa-university fa-lg fa-fw mr5" style="color: #4CAF50;"></i>{__("Bank Transfer")}
                            </button>
                        </div>
                    {/if}
                    {if $page == "packages" && $system['ads_enabled'] &&  $system['packages_wallet_payment_enabled']}
                        <div class="col-12 col-sm-4 plr5">
                            <button class="js_payment-wallet-package btn btn-block btn-payment plr20" data-id="{literal}{{id}}{/literal}">
                                <i class="fa fa-wallet fa-lg fa-fw mr5" style="color: #007bff;"></i>{__("Wallet Credit")}
                            </button>
                        </div>
                    {/if}
                </div>
            </div>
        </script>

        <!-- 2Checkout -->
        {if $system['2checkout_enabled']}
            <script id="twocheckout" type="text/template">
                <div class="modal-header">
                    <h6 class="modal-title">{include file='__svg_icons.tpl' icon="2co" width="20px" height="20px" class="mr5"}{__("2Checkout")}</h6>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <form id="twocheckout_form">
                    <div class="modal-body">
                        <div class="heading-small mb20">
                            {__("Card Info")}
                        </div>
                        <div class="pl-md-4 pr-md-4">
                            <div class="row">
                                <div class="form-group col-md-12">
                                    <label class="form-control-label">{__("Card Number")}</label>
                                    <input name="card_number" type="text" class="form-control" required autocomplete="off">
                                </div>
                                <div class="form-group col-md-4">
                                    <label class="form-control-label">{__("Exp Month")}</label>
                                    <select name="card_exp_month" class="form-control" required>
                                        {for $i=1 to 12}
                                            <option value="{if $i < 10}0{/if}{$i}">{if $i < 10}0{/if}{$i}</option>
                                        {/for}
                                    </select>
                                </div>
                                <div class="form-group col-md-4">
                                    <label class="form-control-label">{__("Exp Year")}</label>
                                    <select name="card_exp_year" class="form-control" required>
                                        {for $i=2020 to 2035}
                                            <option value="{$i}">{$i}</option>
                                        {/for}
                                    </select>
                                </div>
                                <div class="form-group col-md-4">
                                    <label class="form-control-label">{__("CVC")}</label>
                                    <input name="card_cvv" type="text" class="form-control" required autocomplete="off">
                                </div>
                            </div>
                        </div>
                        <div class="heading-small mb20">
                            {__("Billing Information")}
                        </div>
                        <div class="pl-md-4 pr-md-4">
                            <div class="row">
                                <div class="form-group col-md-6">
                                    <label class="form-control-label">{__("Name")}</label>
                                    <input name="billing_name" type="text" class="form-control" required value="{$user->_data['user_firstname']} {$user->_data['user_lastname']}">
                                </div>
                                <div class="form-group col-md-6">
                                    <label class="form-control-label">{__("Email")}</label>
                                    <input name="billing_email" type="email" class="form-control" required value="{$user->_data['user_email']}">
                                </div>
                                <div class="form-group col-md-6">
                                    <label class="form-control-label">{__("Phone")}</label>
                                    <input name="billing_phone" type="text" class="form-control" required value="{$user->_data['user_phone']}">
                                </div>
                                <div class="form-group col-md-6">
                                    <label class="form-control-label">{__("Address")}</label>
                                    <input name="billing_address" type="text" class="form-control required">
                                </div>
                                <div class="form-group col-md-6">
                                    <label class="form-control-label">{__("City")}</label>
                                    <input name="billing_city" type="text" class="form-control" required>
                                </div>
                                <div class="form-group col-md-6">
                                    <label class="form-control-label">{__("State")}</label>
                                    <input name="billing_state" type="text" class="form-control" required>
                                </div>
                                <div class="form-group col-md-6">
                                    <label class="form-control-label">{__("Country")}</label>
                                    <select name="billing_country" class="form-control" required>
                                        <option value="none">{__("Select Country")}</option>
                                        {foreach $countries as $country}
                                            <option {if $user->_data['user_country'] == $country['country_id']}selected{/if} value="{$country['country_name']}">{$country['country_name']}</option>
                                        {/foreach}
                                    </select>
                                </div>
                                <div class="form-group col-md-6">
                                    <label class="form-control-label">{__("Zip Code")}</label>
                                    <input name="billing_zip_code" type="text" class="form-control" required>
                                </div>
                            </div>
                        </div>

                        <!-- error -->
                        <div class="alert alert-danger mb0 x-hidden"></div>
                        <!-- error -->
                    </div>
                    <div class="modal-footer">
                        <input type="hidden" name="token" value="" />
                        <input type="hidden" name="handle" value="{literal}{{handle}}{/literal}">
                        <input type="hidden" name="package_id" value="{literal}{{id}}{/literal}">
                        <input type="hidden" name="price" value="{literal}{{price}}{/literal}">
                        <button type="button" class="btn btn-light" data-dismiss="modal">{__("Cancel")}</button>
                        <button type="submit" class="btn btn-primary"><i class="fa fa-check-circle mr10"></i>{__("Pay")}</button>
                    </div>
                </form>
            </script>
        {/if}
        <!-- 2Checkout -->

        <!-- Bank Transfer -->
        {if $system['bank_transfers_enabled']}
            <script id="bank-transfer" type="text/template">
                <div class="modal-header">
                    <h6 class="modal-title"><i class="fa fa-university mr5"></i>{__("Bank Transfer")}</h6>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <form class="js_ajax-forms" data-url="payments/bank.php">
                    <div class="modal-body">
                        <div class="page-header rounded bank-transfer mb30">
                            <div class="circle-1"></div>
                            <div class="circle-2"></div>
                            <div class="inner text-left">
                                <h2 class="mb20"><i class="fa fa-university mr5"></i>{$system['bank_name']}</h2>
                                <div class="mb10">
                                    <div class="bank-info-meta">{$system['bank_account_number']}</div>
                                    <span class="bank-info-help">{__("Account Number / IBAN")}</span>
                                </div>
                                <div class="mb10">
                                    <div class="bank-info-meta">{$system['bank_account_name']}</div>
                                    <span class="bank-info-help">{__("Account Name")}</span>
                                </div>
                                <div class="row mb10">
                                    <div class="col-md-6">
                                        <div class="bank-info-meta">{$system['bank_account_routing']}</div>
                                        <span class="bank-info-help">{__("Routing Code")}</span>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="bank-info-meta">{$system['bank_account_country']}</div>
                                        <span class="bank-info-help">{__("Country")}</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="alert alert-warning">
                            <div class="icon">
                                <i class="fa fa-exclamation-triangle fa-2x"></i>
                            </div>
                            <div class="text">
                                {$system['bank_transfer_note']}
                            </div>
                        </div>
                        <div class="form-group form-row">
                            <label class="col-md-3 form-control-label">
                                {__("Bank Receipt")}
                            </label>
                            <div class="col-md-9">
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
                                    <input type="hidden" class="js_x-image-input" name="bank_receipt" value="">

                                </div>
                                <span class="form-text">
                                    {__("Please attach your bank receipt")}
                                </span>
                            </div>
                        </div>

                        <!-- success -->
                        <div class="alert alert-success mb0 x-hidden"></div>
                        <!-- success -->

                        <!-- error -->
                        <div class="alert alert-danger mb0 x-hidden"></div>
                        <!-- error -->
                    </div>
                    <div class="modal-footer">
                        <input type="hidden" name="handle" value="{literal}{{handle}}{/literal}">
                        <input type="hidden" name="package_id" value="{literal}{{id}}{/literal}">
                        <input type="hidden" name="price" value="{literal}{{price}}{/literal}">
                        <button type="button" class="btn btn-light" data-dismiss="modal">{__("Cancel")}</button>
                        <button type="submit" class="btn btn-primary"><i class="fa fa-check-circle mr10"></i>{__("Send")}</button>
                    </div>
                </form>
            </script>
        {/if}
        <!-- Bank Transfer -->
    {/if}
    <!-- Payments -->

{/if}

{/strip}