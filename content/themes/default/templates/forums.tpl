{include file='_head.tpl'}
{include file='_header.tpl'}

<!-- page header -->
<div class="page-header bg-1">
    <img class="floating-img d-none d-md-block" src="{$system['system_url']}/content/themes/{$system['theme']}/images/headers/undraw_elements_cipa.svg">
    <div class="crystal c03"></div>
    <div class="circle-2"></div>
    <div class="circle-3"></div>
    <div class="inner">
        <h2>{__("Forums")}</h2>
        <p>{__("The great place to discuss topics with other users")}</p>
    </div>
</div>
<!-- page header -->

<!-- page content -->
<div class="container {if $user->_logged_in}offcanvas{/if}" style="margin-top: -25px;">
    <div class="row">

        <!-- side panel -->
        {if $user->_logged_in}
            <div class="col-12 d-block d-md-none offcanvas-sidebar">
                {include file='_sidebar.tpl'}
            </div>
        {/if}
        <!-- side panel -->

        <!-- content panel -->
        <div class="col-12 {if $user->_logged_in}offcanvas-mainbar{/if}">
            <!-- tabs -->
            <div class="content-tabs rounded-sm shadow-sm clearfix">
                <ul>
                    <li {if $view == ""}class="active"{/if}>
                        <a href="{$system['system_url']}/forums"><i class="fa fa-home mr5"></i>{__("Home")}</a>
                    </li>
                    <li {if $view == "my-threads"}class="active"{/if}>
                        <a href="{$system['system_url']}/forums/my-threads"><i class="fa fa-copy mr5"></i>{__("My Threads")}</a>
                    </li>
                    <li {if $view == "my-replies"}class="active"{/if}>
                        <a href="{$system['system_url']}/forums/my-replies"><i class="fa fa-comments mr5"></i>{__("My Replies")}</a>
                    </li>
                    <li {if $view == "search"}class="active"{/if}>
                        <a href="{$system['system_url']}/forums/search"><i class="fa fa-search mr5"></i>{__("Search")}</a>
                    </li>
                </ul>
            </div>
            <!-- tabs -->

            {if $view == ""}
                <!-- forums -->
                {foreach $forums as $forum}
                    <div class="forum-category">
                        <a href="{$system['system_url']}/forums/{$forum['forum_id']}/{$forum['title_url']}">{$forum['forum_name']}</a>
                        <div class="float-right pointer">
                            <i class="fa fa-sort js_forum-toggle"></i>
                        </div>
                    </div>
                    {if $forum['childs']}
                        <div class="js_forum-toggle-wrapper">
                            <div class="row forum-head">
                                <div class="col-12 col-sm-8 column">
                                    {__("Forums")}
                                </div>
                                <div class="col-sm-2 d-none d-sm-block column">
                                    {__("Threads")}
                                </div>
                                <div class="col-sm-2 d-none d-sm-block column">
                                    {__("Replies")}
                                </div>
                            </div>
                            {foreach $forum['childs'] as $_forum}
                                <div class="row forum-row">
                                    <div class="col-sm-1 d-none d-sm-block column icon">
                                        <i class="fa fa-comments fa-2x"></i>
                                    </div>
                                    <div class="col-12 col-sm-7 column">
                                        <div class="mb5">
                                            <strong><a href="{$system['system_url']}/forums/{$_forum['forum_id']}/{$_forum['title_url']}">{$_forum['forum_name']}</a></strong>
                                            <span class="visible-xs-inline-block">({$_forum['total_threads']} {__("Threads")} / {$_forum['total_replies']} {__("Replies")})</span>
                                        </div>
                                        <div class="mb5">
                                            {$_forum['forum_description']}
                                        </div>
                                        {if $_forum['childs']}
                                            <div class="mb5"><strong>{__("Sub-Forums")}:</strong></div>
                                            <div>
                                                <ul class="sub-forums">
                                                    {foreach $_forum['childs'] as $__forum}
                                                    <li><a href="{$system['system_url']}/forums/{$__forum['forum_id']}/{$_forum['title_url']}">{$__forum['forum_name']}</a>{if !$__forum@last}, {/if}</li>
                                                    {/foreach}
                                                </ul>
                                            </div>
                                        {/if}
                                    </div>
                                    <div class="col-sm-2 d-none d-sm-block column text-center">
                                        {$_forum['total_threads']}
                                    </div>
                                    <div class="col-sm-2 d-none d-sm-block column text-center">
                                        {$_forum['total_replies']}
                                    </div>
                                </div>
                            {/foreach}
                        </div>
                    {/if}
                {/foreach}
                <!-- forums -->

                <!-- forums meta -->
                {if $system['forums_online_enabled'] || $system['forums_statistics_enabled']}
                    <div class="forum-category">
                        {__("What's Going On?")}
                    </div>
                    <!-- online users -->
                    {if $system['forums_online_enabled']}
                        <div class="forum-meta-head">
                            {__("Who's online")}<span class="badge badge-lg badge-light ml5">{count($online_users)|number_format:0}</span>
                        </div>
                        <div class="forum-meta-conent">
                            {foreach $online_users as $_user}
                                <a href="{$system['system_url']}/{$_user['user_name']}">{$_user['user_firstname']} {$_user['user_lastname']}</a>{if !$_user@last}, {/if}
                            {/foreach}
                        </div>
                    {/if}
                    <!-- online users -->
                    <!-- statistics -->
                    {if $system['forums_statistics_enabled']}
                        <div class="forum-meta-head">
                            {__("Forum Statistics")}
                        </div>
                        <div class="forum-meta-conent">
                            <span class="pr10"><strong>{__("Threads")}</strong>: {$insights['threads']|number_format:0}</span>
                            <span class="pr10"><strong>{__("Replies")}</strong>: {$insights['replies']|number_format:0}</span>
                            <span class="pr10"><strong>{__("Members")}</strong>: {$insights['users']|number_format:0}</span>
                        </div>
                    {/if}
                    <!-- statistics -->
                {/if}
                <!-- forums meta -->

            {elseif $view == "forum"}

                <!-- breadcrumb -->
                <ol class="breadcrumb forum-breadcrumb">
                    <li class="breadcrumb-item"><a href="{$system['system_url']}/forums/"><i class="fa fa-home"></i> {__("Home")}</a></li>
                    {if $forum['parents']}
                        {foreach array_reverse($forum['parents']) as $parent}
                            <li class="breadcrumb-item"><a href="{$system['system_url']}/forums/{$parent['forum_id']}/{$parent['title_url']}">{$parent['forum_name']}</a></li>
                        {/foreach}
                    {/if}
                    <li class="breadcrumb-item active">{$forum['forum_name']}</li>
                </ol>
                <!-- breadcrumb -->

                <!-- forum title & description -->
                <div class="forum-title">
                    {if $forum['forum_section'] != '0'}
                        <div class="float-right">
                            <a href="{$system['system_url']}/forums/new-thread/{$forum['forum_id']}" class="btn btn-sm btn-success">
                                <i class="fa fa-edit mr5"></i>{__("Write New Thread")}
                            </a>
                        </div>
                    {/if}
                    <h1>{$forum['forum_name']}</h1>
                    <p>{$forum['forum_description']}</p>
                </div>
                <!-- forum title & description -->

                <!-- forum-category -->
                {if $forum['forum_section'] == '0'}
                    <div class="forum-category">
                        <a href="{$system['system_url']}/forums/{$forum['forum_id']}/{$forum['title_url']}">{$forum['forum_name']}</a>
                    </div>
                {/if}
                <!-- forum-category -->

                <!-- childs (forums|sub-forums) -->
                {if $forum['childs']}
                    <div class="row forum-head">
                        <div class="col-12 col-sm-8 column">
                            {if $forum['forum_section'] == '0'}{__("Forums")}{else}{__("Sub-Forums")}{/if}
                        </div>
                        <div class="col-sm-2 d-none d-sm-block column">
                            {__("Threads")}
                        </div>
                        <div class="col-sm-2 d-none d-sm-block column">
                            {__("Replies")}
                        </div>
                    </div>
                    {foreach $forum['childs'] as $_forum}
                        <div class="row forum-row">
                            <div class="col-sm-1 d-none d-sm-block column icon">
                                <i class="fa fa-comments fa-2x"></i>
                            </div>
                            <div class="col-12 col-sm-7 column">
                                <div class="mb5">
                                    <strong><a href="{$system['system_url']}/forums/{$_forum['forum_id']}/{$_forum['title_url']}">{$_forum['forum_name']}</a></strong>
                                    <span class="visible-xs-inline-block">({$_forum['total_threads']} {__("Threads")} / {$_forum['total_replies']} {__("Replies")})</span>
                                </div>
                                <div class="mb5">
                                    {$_forum['forum_description']}
                                </div>
                                {if $_forum['childs']}
                                    <div class="mb5"><strong>{__("Sub-Forums")}:</strong></div>
                                    <div>
                                        <ul class="sub-forums">
                                        {foreach $_forum['childs'] as $__forum}
                                            <li><a href="{$system['system_url']}/forums/{$__forum['forum_id']}/{$_forum['title_url']}">{$__forum['forum_name']}</a>{if !$__forum@last}, {/if}</li>
                                        {/foreach}
                                        </ul>
                                    </div>
                                {/if}
                            </div>
                            <div class="col-sm-2 d-none d-sm-block column text-center">
                                {$_forum['total_threads']}
                            </div>
                            <div class="col-sm-2 d-none d-sm-block column text-center">
                                 {$_forum['total_replies']}
                            </div>
                        </div>
                    {/foreach}
                {/if}
                <!-- childs (forums|sub-forums) -->

                <!-- threads -->
                {if $forum['forum_section'] != '0'}
                    <div class="row forum-head threads">
                        <div class="col-12 col-sm-8 column">
                            {__("Thread")}
                        </div>
                        <div class="col-sm-2 d-none d-sm-block column">
                            {__("Replies")} / {__("Views")}
                        </div>
                        <div class="col-sm-2 d-none d-sm-block column">
                            {__("Last Post")}
                        </div>
                    </div>
                    {if $forum['threads']}
                        {foreach $forum['threads'] as $thread}
                            <div class="row forum-row">
                                <div class="col-12 col-sm-8 column">
                                    <div class="mb5">
                                        <strong><a href="{$system['system_url']}/forums/thread/{$thread['thread_id']}/{$thread['title_url']}">{$thread['title']}</a></strong>
                                    </div>
                                    <div class="mb5">
                                        {__("By")}: <a href="{$system['system_url']}/{$thread['user_name']}">{$thread['user_fullname']}</a> <span class="js_moment" data-time="{$thread['time']}">{$thread['time']}</span>
                                    </div>
                                </div>
                                <div class="col-sm-2 d-none d-sm-block column text-center">
                                    {__("Replies")}: {$thread['replies']}<br>{__("Views")}: {$thread['views']}
                                </div>
                                <div class="col-sm-2 d-none d-sm-block column text-center">
                                    <span class="js_moment" data-time="{$thread['last_reply']}">{$thread['last_reply']}</span>
                                </div>
                            </div>
                        {/foreach}
                        {$pager}
                    {else}
                        <div class="row forum-row">
                            <div class="col-12 column text-center">
                                {__("No Threads")}
                            </div>
                        </div>
                    {/if}
                {/if}
                <!-- threads -->

            {elseif $view == "thread"}

                <!-- breadcrumb -->
                <ol class="breadcrumb forum-breadcrumb">
                    <li class="breadcrumb-item"><a href="{$system['system_url']}/forums/"><i class="fa fa-home"></i> {__("Home")}</a></li>
                    {if $thread['forum']['parents']}
                        {foreach array_reverse($thread['forum']['parents']) as $parent}
                            <li class="breadcrumb-item"><a href="{$system['system_url']}/forums/{$parent['forum_id']}/{$parent['title_url']}">{$parent['forum_name']}</a></li>
                        {/foreach}
                    {/if}
                    <li class="breadcrumb-item"><a href="{$system['system_url']}/forums/{$thread['forum']['forum_id']}/{$thread['forum']['title_url']}">{$thread['forum']['forum_name']}</a></li>
                    <li class="breadcrumb-item active">{$thread['title']}</li>
                </ol>
                <!-- breadcrumb -->

                <!-- thread title -->
                <div class="forum-title clearfix">
                    <div class="float-right">
                        <a href="{$system['system_url']}/forums/new-reply/{$thread['thread_id']}" class="btn btn-sm btn-primary">
                            <i class="fa fa-reply mr10"></i>{__("Post Reply")}
                        </a>
                    </div>
                    <h1>{$thread['title']}</h1>
                </div>
                <!-- thread title -->

                <!-- thread -->
                <div class="forum-thread {if $thread['replies'] > 0 && $selected_page != 1}x-hidden{/if}">
                    <div class="row">
                        <div class="col-12 col-sm-2 text-center">
                            <a href="{$system['system_url']}/{$thread['user_name']}"><img class="avatar" src="{$thread['user_picture']}"></a>
                            <h6 class="mt10">
                                <a href="{$system['system_url']}/{$thread['user_name']}">{$thread['user_fullname']}</a>
                            </h6>
                            <div class="mb5">
                                {if $thread['user_group'] == 1}
                                    <i class="fa fa-shield-alt"></i> {__("Admin")}
                                {elseif $thread['user_group'] == 2}
                                    <i class="fab fa-black-tie"></i> {__("Moderator")}
                                {else}
                                    <i class="fa fa-user"></i> {__("Member")}
                                {/if}
                            </div>
                            <div>
                                <small>{__("Joined")}: <span class="js_moment" data-time="{$thread['user_registered']}">{$thread['user_registered']}</span></small>
                            </div>
                        </div>
                        <div class="col-12 col-sm-10">
                            <div class="time clearfix">
                                <!-- buttons -->
                                <div class="float-right">
                                    {if $thread['manage_thread']}
                                        <a data-toggle="tooltip" data-placement="top" title='{__("Edit")}' href="{$system['system_url']}/forums/edit-thread/{$thread['thread_id']}" class="btn btn-sm btn-light btn-icon btn-rounded">
                                            <i class="fa fa-pencil-alt"></i>
                                        </a>
                                        <button data-toggle="tooltip" data-placement="top" title='{__("Delete")}' class="btn btn-sm btn-light btn-icon btn-rounded js_delete-forum" data-handle="thread" data-id="{$thread['thread_id']}">
                                            <i class="fa fa-trash-alt"></i>
                                        </button>
                                    {else}
                                        <button data-toggle="tooltip" data-placement="top" title='{__("Report")}' class="btn btn-sm btn-light btn-icon btn-rounded js_report" data-handle="forum_thread" data-id="{$thread['thread_id']}">
                                            <i class="fa fa-flag fa-fw"></i>
                                        </button>
                                    {/if}
                                </div>
                                <!-- buttons -->
                                <!-- time -->
                                <small><i class="far fa-clock"></i> <span class="js_moment" data-time="{$thread['time']}">{$thread['time']}</span></small>
                                <!-- time -->
                            </div>
                            <div class="text">
                                {$thread['parsed_text']}
                            </div>
                        </div>
                    </div>
                </div>
                <!-- thread -->

                <!-- replies -->
                {if $thread['replies'] > 0}
                    {foreach $thread['thread_replies'] as $reply}
                        <div class="forum-thread" id="reply-{$reply['reply_id']}">
                            <div class="row">
                                <div class="col-12 col-sm-2 text-center">
                                    <a href="{$system['system_url']}/{$reply['user_name']}"><img class="avatar" src="{$reply['user_picture']}"></a>
                                    <h6 class="mt10">
                                        <a href="{$system['system_url']}/{$reply['user_name']}">{$reply['user_fullname']}</a>
                                    </h6>
                                    <div class="mb5">
                                        {if $reply['user_group'] == 1}
                                            <i class="fa fa-shield-alt"></i> {__("Admin")}
                                        {elseif $reply['user_group'] == 2}
                                            <i class="fab fa-black-tie"></i> {__("Moderator")}
                                        {else}
                                            <i class="fa fa-user"></i> {__("Member")}
                                        {/if}
                                    </div>
                                    <div>
                                        <small>{__("Joined")}: <span class="js_moment" data-time="{$reply['user_registered']}">{$reply['user_registered']}</span></small>
                                    </div>
                                </div>
                                <div class="col-12 col-sm-10">
                                    <div class="time clearfix">
                                        <!-- buttons -->
                                        <div class="float-right">
                                            <a data-toggle="tooltip" data-placement="top" title='{__("Link")}' href="{$system['system_url']}/forums/thread/{$thread['thread_id']}/{$thread['title_url']}#reply-{$reply['reply_id']}" class="btn btn-sm btn-light btn-icon btn-rounded">
                                                <i class="fa fa-link"></i>
                                            </a>
                                            {if $reply['manage_reply']}
                                                <a data-toggle="tooltip" data-placement="top" title='{__("Edit")}' href="{$system['system_url']}/forums/edit-reply/{$reply['reply_id']}" class="btn btn-sm btn-light btn-icon btn-rounded">
                                                    <i class="fa fa-pencil-alt"></i>
                                                </a>
                                                <button data-toggle="tooltip" data-placement="top" title='{__("Delete")}' class="btn btn-sm btn-light btn-icon btn-rounded js_delete-forum" data-handle="reply" data-id="{$reply['reply_id']}">
                                                    <i class="fa fa-trash-alt"></i>
                                                </button>
                                            {else}
                                                <button data-toggle="tooltip" data-placement="top" title='{__("Report")}' class="btn btn-sm btn-light btn-icon btn-rounded js_report" data-handle="forum_reply" data-id="{$reply['reply_id']}">
                                                    <i class="fa fa-flag fa-fw"></i>
                                                </button>
                                            {/if}
                                        </div>
                                        <!-- buttons -->
                                        <!-- time -->
                                        <small><i class="far fa-clock"></i> <span class="js_moment" data-time="{$reply['time']}">{$reply['time']}</span></small>
                                        <!-- time -->
                                    </div>
                                    <div class="text">
                                        {$reply['parsed_text']}
                                    </div>
                                </div>
                            </div>
                        </div>
                    {/foreach}
                    <div class="mt10">
                        {$pager}
                    </div>
                {/if}
                <!-- replies -->

            {elseif $view == "new-thread"}

                <!-- breadcrumb -->
                <ol class="breadcrumb forum-breadcrumb">
                    <li class="breadcrumb-item"><a href="{$system['system_url']}/forums/"><i class="fa fa-home"></i> {__("Home")}</a></li>
                    {if $forum['parents']}
                        {foreach array_reverse($forum['parents']) as $parent}
                            <li class="breadcrumb-item"><a href="{$system['system_url']}/forums/{$parent['forum_id']}/{$parent['title_url']}">{$parent['forum_name']}</a></li>
                        {/foreach}
                    {/if}
                    <li class="breadcrumb-item"><a href="{$system['system_url']}/forums/{$forum['forum_id']}/{$forum['title_url']}">{$forum['forum_name']}</a></li>
                    <li class="breadcrumb-item active">{__("Write New Thread")}</li>
                </ol>
                <!-- breadcrumb -->

                <!-- new thread -->
                <div class="card mt20">
                    <div class="card-header with-icon">
                        <i class="fa fa-edit pr5 mr10"></i>{__("Write New Thread")}
                    </div>
                    <form class="js_ajax-forms " data-url="forums/thread.php?do=create&id={$forum['forum_id']}">
                        <div class="card-body">
                            <div class="form-group form-row">
                                <label class="col-md-2 form-control-label">
                                    {__("Title")}
                                </label>
                                <div class="col-md-10">
                                    <input class="form-control" name="title">
                                </div>
                            </div>

                            <div class="form-group form-row">
                                <label class="col-md-2 form-control-label">
                                    {__("Content")}
                                </label>
                                <div class="col-md-10">
                                    <textarea name="text" class="form-control js_wysiwyg"></textarea>
                                </div>
                            </div>

                            <!-- error -->
                            <div class="alert alert-danger mb0 x-hidden"></div>
                            <!-- error -->
                        </div>
                        <div class="card-footer text-right">
                            <button type="submit" class="btn btn-primary">{__("Publish")}</button>
                        </div>
                    </form>
                </div>
                <!-- new thread -->

            {elseif $view == "edit-thread"}

                <!-- breadcrumb -->
                <ol class="breadcrumb forum-breadcrumb">
                    <li class="breadcrumb-item"><a href="{$system['system_url']}/forums/"><i class="fa fa-home"></i> {__("Home")}</a></li>
                    {if $thread['forum']['parents']}
                        {foreach array_reverse($thread['forum']['parents']) as $parent}
                            <li class="breadcrumb-item"><a href="{$system['system_url']}/forums/{$parent['forum_id']}/{$parent['title_url']}">{$parent['forum_name']}</a></li>
                        {/foreach}
                    {/if}
                    <li class="breadcrumb-item"><a href="{$system['system_url']}/forums/{$thread['forum']['forum_id']}/{$thread['forum']['title_url']}">{$thread['forum']['forum_name']}</a></li>
                    <li class="breadcrumb-item"><a href="{$system['system_url']}/forums/thread/{$thread['thread_id']}/{$thread['title_url']}">{$thread['title']}</a></li>
                    <li class="breadcrumb-item active">{__("Edit Thread")}</li>
                </ol>
                <!-- breadcrumb -->

                <!-- edit thread -->
                <div class="card mt20">
                    <div class="card-header with-icon">
                        <i class="fa fa-edit mr10"></i>{__("Edit Thread")}
                    </div>
                    <form class="js_ajax-forms " data-url="forums/thread.php?do=edit&id={$thread['thread_id']}">
                        <div class="card-body">
                            <div class="form-group form-row">
                                <label class="col-md-2 form-control-label">
                                    {__("Title")}
                                </label>
                                <div class="col-md-10">
                                    <input class="form-control" name="title" value="{$thread['title']}">
                                </div>
                            </div>

                            <div class="form-group form-row">
                                <label class="col-md-2 form-control-label">
                                    {__("Content")}
                                </label>
                                <div class="col-md-10">
                                    <textarea name="text" class="form-control js_wysiwyg">{$thread['text']}</textarea>
                                </div>
                            </div>

                            <!-- error -->
                            <div class="alert alert-danger mb0 x-hidden"></div>
                            <!-- error -->
                        </div>
                        <div class="card-footer text-right">
                            <button type="submit" class="btn btn-primary">{__("Update")}</button>
                        </div>
                    </form>
                </div>
                <!-- edit thread -->

            {elseif $view == "new-reply"}

                <!-- breadcrumb -->
                <ol class="breadcrumb forum-breadcrumb">
                    <li class="breadcrumb-item"><a href="{$system['system_url']}/forums/"><i class="fa fa-home"></i> {__("Home")}</a></li>
                    {if $thread['forum']['parents']}
                        {foreach array_reverse($thread['forum']['parents']) as $parent}
                            <li class="breadcrumb-item"><a href="{$system['system_url']}/forums/{$parent['forum_id']}/{$parent['title_url']}">{$parent['forum_name']}</a></li>
                        {/foreach}
                    {/if}
                    <li class="breadcrumb-item"><a href="{$system['system_url']}/forums/{$thread['forum']['forum_id']}/{$thread['forum']['title_url']}">{$thread['forum']['forum_name']}</a></li>
                    <li class="breadcrumb-item"><a href="{$system['system_url']}/forums/thread/{$thread['thread_id']}/{$thread['title_url']}">{$thread['title']}</a></li>
                    <li class="breadcrumb-item active">{__("Post Reply")}</li>
                </ol>
                <!-- breadcrumb -->

                <!-- new reply -->
                <div class="card mt20">
                    <div class="card-header with-icon">
                        <i class="fa fa-reply mr10"></i>{__("Post Reply")}
                    </div>
                    <form class="js_ajax-forms " data-url="forums/reply.php?do=create&id={$thread['thread_id']}">
                        <div class="card-body">
                            <div class="form-group form-row">
                                <label class="col-md-2 form-control-label">
                                    {__("Content")}
                                </label>
                                <div class="col-md-10">
                                    <textarea name="text" class="form-control js_wysiwyg"></textarea>
                                </div>
                            </div>

                            <!-- error -->
                            <div class="alert alert-danger mb0 x-hidden"></div>
                            <!-- error -->
                        </div>
                        <div class="card-footer text-right">
                            <button type="submit" class="btn btn-primary">{__("Reply")}</button>
                        </div>
                    </form>
                </div>
                <!-- new reply -->

            {elseif $view == "edit-reply"}

                <!-- breadcrumb -->
                <ol class="breadcrumb forum-breadcrumb">
                    <li class="breadcrumb-item"><a href="{$system['system_url']}/forums/"><i class="fa fa-home"></i> {__("Home")}</a></li>
                    {if $reply['thread']['forum']['parents']}
                        {foreach array_reverse($reply['thread']['forum']['parents']) as $parent}
                            <li class="breadcrumb-item"><a href="{$system['system_url']}/forums/{$parent['forum_id']}/{$parent['title_url']}">{$parent['forum_name']}</a></li>
                        {/foreach}
                    {/if}
                    <li class="breadcrumb-item"><a href="{$system['system_url']}/forums/{$reply['thread']['forum']['forum_id']}/{$reply['thread']['forum']['title_url']}">{$reply['thread']['forum']['forum_name']}</a></li>
                    <li class="breadcrumb-item"><a href="{$system['system_url']}/forums/thread/{$reply['thread']['thread_id']}/{$reply['thread']['title_url']}">{$reply['thread']['title']}</a></li>
                    <li class="breadcrumb-item active">{__("Edit Reply")}</li>
                </ol>
                <!-- breadcrumb -->

                <!-- new reply -->
                <div class="card mt20">
                    <div class="card-header with-icon">
                        <i class="fa fa-reply mr10"></i>{__("Edit Reply")}
                    </div>
                    <form class="js_ajax-forms " data-url="forums/reply.php?do=edit&id={$reply['reply_id']}">
                        <div class="card-body">
                            <div class="form-group form-row">
                                <label class="col-md-2 form-control-label">
                                    {__("Content")}
                                </label>
                                <div class="col-md-10">
                                    <textarea name="text" class="form-control js_wysiwyg">{$reply['text']}</textarea>
                                </div>
                            </div>

                            <!-- error -->
                            <div class="alert alert-danger mb0 x-hidden"></div>
                            <!-- error -->
                        </div>
                        <div class="card-footer text-right">
                            <button type="submit" class="btn btn-primary">{__("Update")}</button>
                        </div>
                    </form>
                </div>
                <!-- new reply -->

            {elseif $view == "my-threads"}

                <!-- breadcrumb -->
                <ol class="breadcrumb forum-breadcrumb">
                    <li class="breadcrumb-item"><a href="{$system['system_url']}/forums/"><i class="fa fa-home"></i> {__("Home")}</a></li>
                    <li class="breadcrumb-item active">{__("My Threads")}</li>
                </ol>
                <!-- breadcrumb -->

                <!-- threads -->
                {if $threads}
                    {foreach $threads as $thread}
                        <div class="forum-result">
                            <div class="head">
                                <div class="float-right">
                                    {__("Forum")}: <a href="{$system['system_url']}/forums/{$thread['forum']['forum_id']}/{$thread['forum']['title_url']}">{$thread['forum']['forum_name']}</a>
                                </div>
                                <i class="far fa-clock mr5"></i><span class="js_moment" data-time="{$thread['time']}">{$thread['time']}</span>
                            </div>
                            <div class="content">
                                <div class="mb10">
                                    <div class="mb5">
                                        <strong class="title"><a href="{$system['system_url']}/forums/thread/{$thread['thread_id']}/{$thread['title_url']}">{$thread['title']}</a></strong>
                                        <div class="float-right text-right">
                                            {__("Replies")}: <strong>{$thread['replies']}</strong><br>
                                            {__("Views")}: <strong>{$thread['views']}</strong>
                                        </div>
                                    </div>
                                    <div class="mb5">
                                        {__("By")}: <a href="{$system['system_url']}/{$thread['user_name']}">{$thread['user_fullname']}</a> <span class="js_moment" data-time="{$thread['time']}">{$thread['time']}</span>
                                    </div>
                                </div>
                                <div class="snippet">
                                    {$thread['text_snippet']|truncate:300}
                                </div>
                            </div>
                        </div>
                    {/foreach}
                    <div class="mt20">
                        {$pager}
                    </div>
                {else}
                    <!-- no threads -->
                    <div class="text-center text-muted mt20">
                        <i class="fa fa-copy fa-4x"></i>
                        <p class="mt5">{__("No threads to show")}</p>
                    </div>
                    <!-- no threads -->
                {/if}
                <!-- threads -->

            {elseif $view == "my-replies"}

                <!-- breadcrumb -->
                <ol class="breadcrumb forum-breadcrumb">
                    <li class="breadcrumb-item"><a href="{$system['system_url']}/forums/"><i class="fa fa-home"></i> {__("Home")}</a></li>
                    <li class="breadcrumb-item active">{__("My Replies")}</li>
                </ol>
                <!-- breadcrumb -->

                <!-- replies -->
                {if $replies}
                    {foreach $replies as $reply}
                        <div class="forum-result">
                            <div class="head">
                                <div class="float-right">
                                    {__("Forum")}: <a href="{$system['system_url']}/forums/{$reply['thread']['forum']['forum_id']}/{$reply['thread']['forum']['title_url']}">{$reply['thread']['forum']['forum_name']}</a>
                                </div>
                                <i class="far fa-clock mr5"></i><span class="js_moment" data-time="{$reply['time']}">{$reply['time']}</span>
                            </div>
                            <div class="content">
                                <div class="mb10">
                                    <div class="mb5">
                                        <strong class="title"><a href="{$system['system_url']}/forums/thread/{$reply['thread']['thread_id']}/{$reply['thread']['title_url']}">{$reply['thread']['title']}</a></strong>
                                        <div class="float-right text-right">
                                            {__("Replies")}: <strong>{$reply['thread']['replies']}</strong><br>
                                            {__("Views")}: <strong>{$reply['thread']['views']}</strong>
                                        </div>
                                    </div>
                                    <div class="mb5">
                                        {__("By")}: <a href="{$system['system_url']}/{$reply['thread']['user_name']}">{$reply['thread']['user_fullname']}</a> <span class="js_moment" data-time="{$reply['thread']['time']}">{$reply['thread']['time']}</span>
                                    </div>
                                </div>
                                <div class="snippet">
                                    {$reply['text_snippet']|truncate:300}
                                </div>
                            </div>
                        </div>
                    {/foreach}
                    <div class="mt20">
                        {$pager}
                    </div>
                {else}
                    <!-- no replies -->
                    <div class="text-center text-muted mt20">
                        <i class="fa fa-comments fa-4x"></i>
                        <p class="mt5">{__("No replies to show")}</p>
                    </div>
                    <!-- no replies -->
                {/if}
                <!-- replies -->

            {elseif $view == "search"}

                <!-- breadcrumb -->
                <ol class="breadcrumb forum-breadcrumb">
                    <li class="breadcrumb-item"><a href="{$system['system_url']}/forums/"><i class="fa fa-home"></i> {__("Home")}</a></li>
                    <li class="breadcrumb-item active">{__("Search")}</li>
                </ol>
                <!-- breadcrumb -->

                <!-- search -->
                <div class="card mt20">
                    <div class="card-header with-icon">
                        <i class="fa fa-search mr10"></i>{__("Search")}
                    </div>
                    <form action="{$system['system_url']}/forums/search-results" method="get">
                        <div class="card-body">
                            <div class="form-group form-row">
                                <label class="col-md-2 form-control-label">
                                    {__("Keyword(s)")}
                                </label>
                                <div class="col-md-10">
                                    <input class="form-control" name="query" required autofocus>
                                </div>
                            </div>

                            <div class="form-group form-row">
                                <label class="col-md-2 form-control-label">
                                    {__("Search For")}
                                </label>
                                <div class="col-md-10">
                                    <select class="form-control" name="type">
                                        <option value="threads">{__("Threads")}</option>
                                        <option value="replies">{__("Replies")}</option>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group form-row">
                                <label class="col-md-2 form-control-label">
                                    {__("Search in Forum(s)")}
                                </label>
                                <div class="col-md-10">
                                    <select class="form-control" name="forum">
                                        <option value="all">{__("Search All Forums")}</option>
                                        {foreach $forums as $forum}
                                            {include file='admin.forums.recursive_options.tpl'}
                                        {/foreach}
                                    </select>
                                </div>
                            </div>

                            <div class="form-group form-row">
                                <div class="offset-md-2 col-md-10">
                                    <div class="checkbox checkbox-primary">
                                        <input type="checkbox" name="recursive" id="recursive"> 
                                        <label for="recursive">{__("Also search in child forums")}</label>
                                    </div>
                                </div>
                            </div>

                            <!-- error -->
                            <div class="alert alert-danger mb0 x-hidden"></div>
                            <!-- error -->
                        </div>
                        <div class="card-footer text-right">
                            <button type="submit" class="btn btn-primary">{__("Search")}</button>
                        </div>
                    </form>
                </div>
                <!-- search -->

            {elseif $view == "search-results"}

                <!-- breadcrumb -->
                <ol class="breadcrumb forum-breadcrumb">
                    <li class="breadcrumb-item"><a href="{$system['system_url']}/forums/"><i class="fa fa-home"></i> {__("Home")}</a></li>
                    <li class="breadcrumb-item active">{__("Search Results")}</li>
                </ol>
                <!-- breadcrumb -->

                <!-- search title -->
                <div class="forum-meta-head mt20">
                    <div class="float-right">
                        {__("Results Found")}<span class="badge badge-lg badge-light ml5">{if $total}{$total}{else}0{/if}</span>
                    </div>
                    {__("Keyword(s)")}: <u>{$query}</u>
                </div>
                <!-- search title -->

                <!-- search results -->
                {if $type == "threads"}
                    <!-- threads -->
                    {if $results}
                        {foreach $results as $thread}
                            <div class="forum-result">
                                <div class="head">
                                    <div class="float-right">
                                        {__("Forum")}: <a href="{$system['system_url']}/forums/{$thread['forum']['forum_id']}/{$thread['forum']['title_url']}">{$thread['forum']['forum_name']}</a>
                                    </div>
                                    <i class="far fa-clock mr5"></i><span class="js_moment" data-time="{$thread['time']}">{$thread['time']}</span>
                                </div>
                                <div class="content">
                                    <div class="mb10">
                                        <div class="mb5">
                                            <strong class="title"><a href="{$system['system_url']}/forums/thread/{$thread['thread_id']}/{$thread['title_url']}">{$thread['title']}</a></strong>
                                            <div class="float-right text-right">
                                                {__("Replies")}: <strong>{$thread['replies']}</strong><br>
                                                {__("Views")}: <strong>{$thread['views']}</strong>
                                            </div>
                                        </div>
                                        <div class="mb5">
                                            {__("By")}: <a href="{$system['system_url']}/{$thread['user_name']}">{$thread['user_fullname']}</a> <span class="js_moment" data-time="{$thread['time']}">{$thread['time']}</span>
                                        </div>
                                    </div>
                                    <div class="snippet">
                                        {$thread['text_snippet']|truncate:300}
                                    </div>
                                </div>
                            </div>
                        {/foreach}
                        <div class="mt20">
                            {$pager}
                        </div>
                    {else}
                        <!-- no threads -->
                        <div class="text-center text-muted mt20">
                            <i class="fa fa-copy fa-4x"></i>
                            <p class="mt10">{__("No results found")}</p>
                        </div>
                        <!-- no threads -->
                    {/if}
                    <!-- threads -->
                {elseif $type == "replies"}
                    <!-- replies -->
                    {if $results}
                        {foreach $results as $reply}
                            <div class="forum-result">
                                <div class="head">
                                    <div class="float-right">
                                        {__("Forum")}: <a href="{$system['system_url']}/forums/{$reply['thread']['forum']['forum_id']}/{$reply['thread']['forum']['title_url']}">{$reply['thread']['forum']['forum_name']}</a>
                                    </div>
                                    <i class="far fa-clock mr5"></i><span class="js_moment" data-time="{$reply['time']}">{$reply['time']}</span>
                                </div>
                                <div class="content">
                                    <div class="mb10">
                                        <div class="mb5">
                                            <strong class="title"><a href="{$system['system_url']}/forums/thread/{$reply['thread']['thread_id']}/{$reply['thread']['title_url']}">{$reply['thread']['title']}</a></strong>
                                            <div class="float-right">
                                                {__("Replies")}: <strong>{$reply['thread']['replies']}</strong><br>
                                                {__("Views")}: <strong>{$reply['thread']['views']}</strong>
                                            </div>
                                        </div>
                                        <div class="mb5">
                                            {__("By")}: <a href="{$system['system_url']}/{$reply['thread']['user_name']}">{$reply['thread']['user_fullname']}</a> <span class="js_moment" data-time="{$reply['thread']['time']}">{$reply['thread']['time']}</span>
                                        </div>
                                    </div>
                                    <div class="snippet">
                                        {$reply['text_snippet']|truncate:300}
                                    </div>
                                </div>
                            </div>
                        {/foreach}
                        <div class="mt20">
                            {$pager}
                        </div>
                    {else}
                        <!-- no replies -->
                        <div class="text-center text-muted mt20">
                            <i class="fa fa-comments fa-4x"></i>
                            <p class="mt10">{__("No results found")}</p>
                        </div>
                        <!-- no replies -->
                    {/if}
                    <!-- replies -->
                {/if}
                <!-- search results -->

            {/if}
        </div>
        <!-- content panel -->

    </div>
</div>
<!-- page content -->

{include file='_footer.tpl'}