<div class="modal-body plr0 ptb0">
    <div class="x-form publisher mini" data-id="{$album['album_id']}">

        <!-- publisher close -->
        <div class="publisher-close">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
        </div>
        <!-- publisher close -->

        <!-- publisher-message -->
        <div class="publisher-message">
            <img class="publisher-avatar" src="{$user->_data['user_picture']}">
            <textarea dir="auto" class="js_autosize js_mention" placeholder='{__("What is on your mind? #Hashtag.. @Mention.. Link..")}'></textarea>
            <div class="publisher-emojis" style="display: block;">
                <div class="position-relative">
                    <span class="js_emoji-menu-toggle" data-toggle="tooltip" data-placement="top" title='{__("Insert an emoji")}'>
                        <i class="far fa-smile-wink fa-lg"></i>
                    </span>
                </div>
            </div>
        </div>
        <!-- publisher-message -->

        <!-- post attachments -->
        <div class="publisher-attachments attachments clearfix x-hidden"></div>
        <!-- post attachments -->

        <!-- post location -->
        <div class="publisher-meta" data-meta="location">
            <i class="fa fa-map-marker fa-fw"></i>
            <input class="js_geocomplete" type="text" placeholder='{__("Where are you?")}'>
        </div>
        <!-- post location -->

        <!-- post feelings -->
        <div class="publisher-meta feelings" data-meta="feelings">
            <div id="feelings-menu-toggle" data-init-text='{__("What are you doing?")}'>{__("What are you doing?")}</div>
            <div id="feelings-data" style="display: none">
                <input type="text" placeholder='{__("What are you doing?")}'>
                <span></span>
            </div>
            <div id="feelings-menu" class="dropdown-menu dropdown-widget">
                <div class="dropdown-widget-body ptb5">
                    <div class="js_scroller">
                        <ul class="feelings-list">
                            {foreach $feelings as $feeling}
                                <li class="feeling-item js_feelings-add" data-action="{$feeling['action']}" data-placeholder="{__($feeling['placeholder'])}">
                                    <div class="icon">
                                        <i class="twa twa-3x twa-{$feeling['icon']}"></i>
                                    </div>
                                    <div class="data">
                                        {__($feeling['text'])}
                                    </div>
                                </li>
                            {/foreach}
                        </ul>
                    </div>
                </div>
            </div>
            <div id="feelings-types" class="dropdown-menu dropdown-widget">
                <div class="dropdown-widget-body ptb5">
                    <div class="js_scroller">
                        <ul class="feelings-list">
                            {foreach $feelings_types as $type}
                                <li class="feeling-item js_feelings-type" data-type="{$type['action']}" data-icon="{$type['icon']}">
                                    <div class="icon">
                                        <i class="twa twa-3x twa-{$type['icon']}"></i>
                                    </div>
                                    <div class="data">
                                        {__($type['text'])}
                                    </div>
                                </li>
                            {/foreach}
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <!-- post feelings -->

        <!-- publisher-tools-tabs -->
        <div class="publisher-tools-tabs">
            <ul class="row">
                {if $system['photos_enabled']}
                    <li class="col-md-6">
                        <div class="publisher-tools-tab attach js_publisher-tab" data-tab="photos">
                            <i class="fa fa-camera fa-fw js_x-uploader" data-handle="publisher" data-multiple="true"></i> {__("Upload Photos")}
                        </div>
                    </li>
                {/if}
                {if $system['geolocation_enabled']}
                    <li class="col-md-6">
                        <div class="publisher-tools-tab js_publisher-tab" data-tab="location">
                            <i class="fa fa-map-marker fa-fw"></i> {__("Check In")}
                        </div>
                    </li>
                {/if}
                <li class="col-md-6">
                    <div class="publisher-tools-tab js_publisher-feelings">
                        <i class="fa fa-grin-beam fa-fw"></i> {__("Feelings/Activity")}
                    </div>
                </li>
            </ul>
        </div>
        <!-- publisher-tools-tabs -->

        <!-- publisher-footer -->
        <div class="publisher-footer">
            <!-- publisher-buttons -->
            {if $album['user_type'] == 'user' && !$album['in_group'] && !$album['in_event']}
                <!-- privacy -->
                <div class="btn-group" data-toggle="tooltip" data-placement="top" data-value="friends" title='{__("Shared with: Friends")}'>
                    <button type="button" class="btn btn-sm btn-info dropdown-toggle" data-toggle="dropdown" data-display="static">
                        <i class="btn-group-icon fa fa-users mr10"></i><span class="btn-group-text">{__("Friends")}</span>
                    </button>
                    <div class="dropdown-menu dropdown-menu-right">
                        <div class="dropdown-item pointer" data-title='{__("Shared with: Public")}' data-value="public">
                            <i class="fa fa-globe mr5"></i>{__("Public")}
                        </div>
                        <div class="dropdown-item pointer" data-title='{__("Shared with: Friends")}' data-value="friends">
                            <i class="fa fa-users mr5"></i>{__("Friends")}
                        </div>
                        <div class="dropdown-item pointer" data-title='{__("Shared with: Only Me")}' data-value="me">
                            <i class="fa fa-lock mr5"></i>{__("Only Me")}
                        </div>
                    </div>
                </div>
                <!-- privacy -->
            {else}
                <!-- privacy -->
                {if $album['privacy'] == "custom"}
                    <div class="btn-group" data-toggle="tooltip" data-placement="top" data-value="custom" title='{__("Shared with")} {__("Custom People")}'>
                        <button type="button" class="btn btn-sm btn-info">
                            <i class="btn-group-icon fa fa-cog mr10"></i> <span class="btn-group-text">{__("Custom")}</span>
                        </button>
                    </div>
                {elseif $album['privacy'] == "public"}
                    <div class="btn-group" data-toggle="tooltip" data-placement="top" data-value="public" title='{__("Shared with: Public")}'>
                        <button type="button" class="btn btn-sm btn-info">
                            <i class="btn-group-icon fa fa-users mr10"></i> <span class="btn-group-text">{__("Public")}</span>
                        </button>
                    </div>
                {/if}
                <!-- privacy -->
            {/if}
            <button type="button" class="btn btn-sm btn-primary mr5 js_publisher-album">{__("Post")}</button>
            <!-- publisher-buttons -->
        </div>
        <!-- publisher-footer -->
    </div>
</div>