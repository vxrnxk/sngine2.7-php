{include file='_head.tpl'}
{include file='_header.tpl'}

{if $view == ""}
    <!-- page header -->
    <div class="page-header bg-1">
        <img class="floating-img d-none d-md-block" src="{$system['system_url']}/content/themes/{$system['theme']}/images/headers/undraw_content_creator_xeju.svg">
        <div class="crystal c03"></div>
        <div class="circle-2"></div>
        <div class="circle-3"></div>
        <div class="inner">
            <h2>{__("Blogs")}</h2>
            <p>{__("Explore the latest articles")}</p>
        </div>
    </div>
    <!-- page header -->
{/if}


<!-- page content -->
<div class="container mt20 {if $user->_logged_in}offcanvas{/if}">
    <div class="row">

        {if $view == ""}

            <!-- side panel -->
            {if $user->_logged_in}
                <div class="col-12 d-block d-md-none offcanvas-sidebar">
                    {include file='_sidebar.tpl'}
                </div>
            {/if}
            <!-- side panel -->

            <!-- content panel -->
            <div class="col-12 {if $user->_logged_in}offcanvas-mainbar{/if}">
                <div class="blogs-wrapper">
                    {if $articles}
                        <ul class="row">
                            <!-- articles -->
                            {foreach $articles as $article}
                            {include file='__feeds_article.tpl' _tpl="featured" _iteration=$article@iteration}
                            {/foreach}
                            <!-- articles -->
                        </ul>

                        <!-- see-more -->
                        <div class="alert alert-post see-more js_see-more" data-get="articles">
                            <span>{__("More Articles")}</span>
                            <div class="loader loader_small x-hidden"></div>
                        </div>
                        <!-- see-more -->
                    {else}
                        <!-- no articles -->
                        <div class="text-center text-muted">
                            <i class="fa fa-newspaper fa-4x"></i>
                            <p class="mb10"><strong>{__("No articles to show")}</strong></p>
                        </div>
                        <!-- no articles -->
                    {/if}
                </div>
            </div>
            <!-- content panel -->
        
        {elseif $view == "category"}

            <!-- side panel -->
            {if $user->_logged_in}
                <div class="col-12 d-block d-md-none offcanvas-sidebar">
                    {include file='_sidebar.tpl'}
                </div>
            {/if}
            <!-- side panel -->

            <!-- content panel -->
            <div class="col-12 {if $user->_logged_in}offcanvas-mainbar{/if}">
                <div class="row">
                    <!-- left panel -->
                    <div class="col-md-8 mb20">
                        {if $articles}
                            <ul>
                                {foreach $articles as $article}
                                {include file='__feeds_article.tpl'}
                                {/foreach}
                            </ul>

                            <!-- see-more -->
                            <div class="alert alert-post see-more js_see-more" data-get="category_articles" data-id="{$category_id}">
                                <span>{__("More Articles")}</span>
                                <div class="loader loader_small x-hidden"></div>
                            </div>
                            <!-- see-more -->
                        {else}
                            <!-- no articles -->
                            <div class="text-center text-muted">
                                <i class="fa fa-newspaper fa-4x"></i>
                                <p class="mb10"><strong>{__("No articles to show")}</strong></p>
                            </div>
                            <!-- no articles -->
                        {/if}
                    </div>
                    <!-- left panel -->

                    <!-- right panel -->
                    <div class="col-md-4">
                        <!-- add new article -->
                        {if $user->_logged_in && $user->_data['can_write_articles']}
                            <div class="mb10 d-none d-sm-block">
                                <a href="{$system['system_url']}/blogs/new" class="btn btn-sm btn-success btn-block">
                                    <i class="fa fa-edit mr5"></i>{__("Write New Article")}
                                </a>
                            </div>
                        {/if}
                        <!-- add new article -->
                        
                        {include file='_ads.tpl'}
                        {include file='_widget.tpl'}

                        <!-- blogs categoris -->
                        <div class="articles-widget-header">
                            <div class="articles-widget-title">{__("Categories")}</div>
                        </div>
                        
                        <ul class="article-categories clearfix">
                            {foreach $blogs_categories as $category}
                                <li>
                                    <a class="article-category" href="{$system['system_url']}/blogs/category/{$category['category_id']}/{$category['category_url']}">
                                        {$category['category_name']}
                                    </a>
                                </li>
                            {/foreach}
                            <li>
                                <a class="article-category" href="{$system['system_url']}/blogs/category/0/Uncategorized">
                                    {__("Uncategorized")}
                                </a>
                            </li>
                        </ul>
                        <!-- blogs categoris -->

                        <!-- read more -->
                        <div class="articles-widget-header">
                            <div class="articles-widget-title">{__("Read More")}</div>
                        </div>
                        
                        {foreach $latest_articles as $article}
                        {include file='__feeds_article.tpl' _small=true}
                        {/foreach}
                        <!-- read more -->
                    </div>
                    <!-- right panel -->
                </div>
            </div>
            <!-- content panel -->
        
        {elseif $view == "article"}

            <!-- side panel -->
            {if $user->_logged_in}
                <div class="col-12 d-block d-md-none offcanvas-sidebar">
                    {include file='_sidebar.tpl'}
                </div>
            {/if}
            <!-- side panel -->

            <!-- content panel -->
            <div class="col-12 {if $user->_logged_in}offcanvas-mainbar{/if}">
                <div class="row">
                    <!-- left panel -->
                    <div class="col-md-8 mb20">
                        <div class="article"  data-id="{$article['post_id']}">
                            <div class="article-wrapper {if $user->_logged_in}pb10{/if}">
                                <!-- article category -->
                                <div class="mb10">
                                    <a class="article-category" href="{$system['system_url']}/blogs/category/{$article['article']['category_id']}/{$article['article']['category_url']}">
                                        {$article['article']['category_name']}
                                    </a>
                                </div>
                                <!-- article category -->

                                <!-- article title -->
                                <h3>{$article['article']['title']}</h3>
                                <!-- article title -->
                                
                                <!-- article meta -->
                                <div class="mb20">
                                    <div class="float-right">
                                        {if $article['manage_post']}
                                            <a class="article-meta-counter unselectable" href="{$system['system_url']}/blogs/edit/{$article['post_id']}">
                                                <i class="fa fa-edit fa-fw"></i> {__("Edit")}
                                            </a>
                                            <a class="article-meta-counter unselectable js_delete-article" href="#" data-id="{$article['post_id']}">
                                                <i class="fa fa-trash fa-fw"></i>
                                            </a>
                                        {/if}
                                        <a class="article-meta-counter unselectable" href="#article-comments">
                                            <i class="fa fa-comments fa-fw"></i> {$article['comments']}
                                        </a>
                                        <div class="article-meta-counter unselectable">
                                            <i class="fa fa-eye fa-fw"></i> {$article['article']['views']}
                                        </div>
                                    </div>

                                    <div class="post-avatar">
                                        <a class="post-avatar-picture" href="{$article['post_author_url']}" style="background-image:url({$article['post_author_picture']});">
                                        </a>
                                    </div>
                                    <div class="post-meta">
                                        <div>
                                            <!-- post author name -->
                                            <span class="js_user-popover" data-type="{$article['user_type']}" data-uid="{$article['user_id']}">
                                                <a href="{$article['post_author_url']}">{$article['post_author_name']}</a>
                                            </span>
                                            {if $article['post_author_verified']}
                                                {if $article['user_type'] == "user"}
                                                <i data-toggle="tooltip" data-placement="top" title='{__("Verified User")}' class="fa fa-check-circle fa-fw verified-badge"></i>
                                                {else}
                                                <i data-toggle="tooltip" data-placement="top" title='{__("Verified Page")}' class="fa fa-check-circle fa-fw verified-badge"></i>
                                                {/if}
                                            {/if}
                                            {if $article['user_subscribed']}
                                                <i data-toggle="tooltip" data-placement="top" title='{__("Pro User")}' class="fa fa-bolt fa-fw pro-badge"></i>
                                            {/if}
                                            <!-- post author name -->
                                        </div>
                                        <div class="post-time">
                                            {__("Posted")} <span class="js_moment" data-time="{$article['time']}">{$article['time']}</span>
                                        </div>
                                    </div>
                                </div>
                                <!-- article meta -->

                                <!-- social share -->
                                <div class="mb20">
                                    <a href="http://www.facebook.com/sharer.php?u={$system['system_url']}/blogs/{$article['post_id']}/{$article['article']['title_url']}" class="btn btn-sm btn-rounded btn-social-icon btn-facebook" target="_blank">
                                        <i class="fab fa-facebook-f"></i>
                                    </a>
                                    <a href="https://twitter.com/intent/tweet?url={$system['system_url']}/blogs/{$article['post_id']}/{$article['article']['title_url']}" class="btn btn-sm btn-rounded btn-social-icon btn-rounded btn-twitter" target="_blank">
                                        <i class="fab fa-twitter"></i>
                                    </a>
                                    <a href="https://vk.com/share.php?url={$system['system_url']}/blogs/{$article['post_id']}/{$article['article']['title_url']}" class="btn btn-sm btn-rounded btn-social-icon btn-vk" target="_blank">
                                        <i class="fab fa-vk"></i>
                                    </a>
                                    <a href="https://www.linkedin.com/shareArticle?mini=true&url={$system['system_url']}/blogs/{$article['post_id']}/{$article['article']['title_url']}" class="btn btn-sm btn-rounded btn-social-icon btn-linkedin" target="_blank">
                                        <i class="fab fa-linkedin"></i>
                                    </a>
                                    <a href="https://api.whatsapp.com/send?text={$system['system_url']}/blogs/{$article['post_id']}/{$article['article']['title_url']}" class="btn btn-sm btn-rounded btn-social-icon btn-whatsapp" target="_blank">
                                        <i class="fab fa-whatsapp"></i>
                                    </a>
                                    <a href="https://reddit.com/submit?url={$system['system_url']}/blogs/{$article['post_id']}/{$article['article']['title_url']}" class="btn btn-sm btn-rounded btn-social-icon btn-reddit" target="_blank">
                                        <i class="fab fa-reddit"></i>
                                    </a>
                                    <a href="https://pinterest.com/pin/create/button/?url={$system['system_url']}/blogs/{$article['post_id']}/{$article['article']['title_url']}" class="btn btn-sm btn-rounded btn-social-icon btn-pinterest" target="_blank">
                                        <i class="fab fa-pinterest"></i>
                                    </a>
                                </div>
                                <!-- social share -->
                                
                                <!-- article cover -->
                                {if $article['article']['cover']}
                                    <div class="mb20">
                                        <img class="img-fluid" src="{$article['article']['parsed_cover']}">
                                    </div>
                                {/if}
                                <!-- article cover -->

                                <!-- article text -->
                                <div class="article-text text-with-list" dir="auto">
                                    {$article['article']['parsed_text']}
                                </div>
                                <!-- article text -->

                                 <!-- article tags -->
                                {if $article['article']['parsed_tags']}
                                    <div class="article-tags">
                                        <ul>
                                            {foreach $article['article']['parsed_tags'] as $tag}
                                                <li>
                                                    <a href="{$system['system_url']}/search/hashtag/{$tag}">{$tag}</a>
                                                </li>
                                            {/foreach}
                                        </ul>
                                    </div>
                                {/if}
                                <!-- article tags -->

                                <!-- post stats -->
                                <div class="post-stats clearfix">
                                    <!-- reactions stats -->
                                    {if $article['reactions_total_count'] > 0}
                                        <div class="float-left mr10" data-toggle="modal" data-url="posts/who_reacts.php?post_id={$article['post_id']}">
                                            <div class="reactions-stats">
                                                {foreach $article['reactions'] as $reaction_type => $reaction_count}
                                                    {if $reaction_count > 0}
                                                        <div class="reactions-stats-item">
                                                            <div class="inline-emoji no_animation">
                                                                {include file='__reaction_emojis.tpl' _reaction=$reaction_type}
                                                            </div>
                                                        </div>
                                                    {/if}
                                                {/foreach}
                                                <!-- reactions count -->
                                                <span>
                                                    {$article['reactions_total_count']}
                                                </span>
                                                <!-- reactions count -->
                                            </div>
                                        </div>
                                    {/if}
                                    <!-- reactions stats -->
                                </div>
                                <!-- post stats -->

                                <!-- post actions -->
                                {if $user->_logged_in}
                                    <div class="post-actions clearfix">
                                        <!-- reactions -->
                                        <div class="action-btn unselectable reactions-wrapper {if $article['i_react']}js_unreact-post{/if}" data-reaction="{$article['i_reaction']}">
                                            <!-- reaction-btn -->
                                            <div class="reaction-btn">
                                                {if !$article['i_react']}
                                                    <div class="reaction-btn-icon">
                                                        <i class="fa fa-thumbs-up fa-fw"></i>
                                                    </div>
                                                    <span class="reaction-btn-name">{__("Like")}</span>
                                                {else}
                                                    <div class="reaction-btn-icon">
                                                        <div class="inline-emoji no_animation">
                                                            {include file='__reaction_emojis.tpl' _reaction=$article['i_reaction']}
                                                        </div>
                                                    </div>
                                                    <span class="reaction-btn-name {$article['i_reaction_details']['color']}">{$article['i_reaction_details']['title']}</span>
                                                {/if}
                                            </div>
                                            <!-- reaction-btn -->

                                            <!-- reactions-container -->
                                            <div class="reactions-container">
                                                {foreach $reactions as $reaction}
                                                    <div class="reactions_item duration-{$reaction@iteration} js_react-post" data-reaction="{$reaction['reaction']}" data-reaction-color="{$reaction['color']}" data-title="{$reaction['title']}">
                                                        {include file='__reaction_emojis.tpl' _reaction=$reaction['reaction']}
                                                    </div>
                                                {/foreach}
                                            </div>
                                            <!-- reactions-container -->
                                        </div>
                                        <!-- reactions -->

                                        <!-- comment -->
                                        <div class="action-btn js_comment {if $article['comments_disabled']}x-hidden{/if}">
                                            <i class="fa fa-comment fa-fw mr5"></i><span>{__("Comment")}</span>
                                        </div>
                                        <!-- comment -->

                                        <!-- share -->
                                        {if $article['privacy'] == "public"}
                                            <div class="action-btn" data-toggle="modal" data-url="posts/share.php?do=create&post_id={$article['post_id']}">
                                                <i class="fa fa-share fa-fw mr5"></i><span>{__("Share")}</span>
                                            </div>
                                        {/if}
                                        <!-- share -->
                                    </div>
                                {/if}
                                <!-- post actions -->
                            </div>

                            <!-- post footer -->
                            <div class="post-footer" id="article-comments">
                                <!-- comments -->
                                {include file='__feeds_post.comments.tpl' post=$article}
                                <!-- comments -->
                            </div>
                            <!-- post footer -->
                        </div>
                    </div>
                    <!-- left panel -->

                    <!-- right panel -->
                    <div class="col-md-4">
                        <!-- add new article -->
                        {if $user->_logged_in && $user->_data['can_write_articles']}
                            <div class="mb10 d-none d-sm-block">
                                <a href="{$system['system_url']}/blogs/new" class="btn btn-sm btn-success btn-block">
                                    <i class="fa fa-edit mr5"></i>{__("Write New Article")}
                                </a>
                            </div>
                        {/if}
                        <!-- add new article -->
                        
                        {include file='_ads.tpl'}
                        {include file='_widget.tpl'}

                        <!-- blogs categoris -->
                        <div class="articles-widget-header">
                            <div class="articles-widget-title">{__("Categories")}</div>
                        </div>
                        <ul class="article-categories clearfix">
                            {foreach $blogs_categories as $category}
                                <li>
                                    <a class="article-category" href="{$system['system_url']}/blogs/category/{$category['category_id']}/{$category['category_url']}">
                                        {$category['category_name']}
                                    </a>
                                </li>
                            {/foreach}
                            <li>
                                <a class="article-category" href="{$system['system_url']}/blogs/category/0/Uncategorized">
                                    {__("Uncategorized")}
                                </a>
                            </li>
                        </ul>
                        <!-- blogs categoris -->

                        <!-- read more -->
                        <div class="articles-widget-header">
                            <div class="articles-widget-title">{__("Read More")}</div>
                        </div>
                        
                        {foreach $latest_articles as $article}
                        {include file='__feeds_article.tpl' _small=true}
                        {/foreach}
                        <!-- read more -->
                    </div>
                    <!-- right panel -->
                </div>
            </div>
            <!-- content panel -->
        
        {elseif $view == "edit"}

            <!-- side panel -->
            <div class="col-md-4 col-lg-3 offcanvas-sidebar js_sticky-sidebar">
                {include file='_sidebar.tpl'}
            </div>
            <!-- side panel -->

            <!-- content panel -->
            <div class="col-md-8 col-lg-9 offcanvas-mainbar">
                <!-- content -->
                <div class="card">
                    <div class="card-header with-icon">
                        <i class="fa fa-edit mr10"></i>{__("Edit Article")}
                        <div class="float-right">
                            <a href="{$system['system_url']}/blogs/{$article['post_id']}/{$article['article']['title_url']}" class="btn btn-sm btn-light">
                                <i class="fa fa-arrow-circle-left mr5"></i>{__("Go Back")}
                            </a>
                        </div>
                    </div>
                    <div class="js_ajax-forms-html " data-url="posts/article.php?do=edit&id={$article['post_id']}">
                        <div class="card-body">
                            <div class="form-group form-row">
                                <label class="col-md-2 form-control-label">
                                    {__("Title")}
                                </label>
                                <div class="col-md-10">
                                    <input class="form-control" name="title" value="{$article['article']['title']}">
                                </div>
                            </div>

                            <div class="form-group form-row">
                                <label class="col-md-2 form-control-label">
                                    {__("Content")}
                                </label>
                                <div class="col-md-10">
                                    <textarea name="text" class="form-control js_wysiwyg">{$article['article']['text']}</textarea>
                                </div>
                            </div>

                            <div class="form-group form-row">
                                <label class="col-md-2 form-control-label">
                                    {__("Cover")}
                                </label>
                                <div class="col-md-10">
                                    {if $article['article']['cover'] == ''}
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
                                            <input type="hidden" class="js_x-image-input" name="cover" value="">
                                        </div>
                                    {else}
                                        <div class="x-image" style="background-image: url('{$system['system_uploads']}/{$article['article']['cover']}')">
                                            <button type="button" class="close js_x-image-remover" title='{__("Remove")}'>
                                                <span>×</span>
                                            </button>
                                            <div class="x-image-loader">
                                                <div class="progress x-progress">
                                                    <div class="progress-bar" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
                                                </div>
                                            </div>
                                            <i class="fa fa-camera fa-lg js_x-uploader" data-handle="x-image"></i>
                                            <input type="hidden" class="js_x-image-input" name="cover" value="{$article['article']['cover']}">
                                        </div>
                                    {/if}
                                </div>
                            </div>

                            <div class="form-group form-row">
                                <label class="col-md-2 form-control-label">
                                    {__("Category")}
                                </label>
                                <div class="col-md-10">
                                    <select class="form-control" name="category">
                                        <option>{__("Select Category")}</option>
                                        {foreach $blogs_categories as $category}
                                        <option value="{$category['category_id']}" {if $article['article']['category_id'] == $category['category_id']}selected{/if}>{__($category['category_name'])}</option>
                                        {/foreach}
                                    </select>
                                </div>
                            </div>

                            <div class="form-group form-row">
                                <label class="col-md-2 form-control-label">
                                    {__("Tags")}
                                </label>
                                <div class="col-md-10">
                                    <input class="form-control" name="tags" value="{$article['article']['tags']}">
                                </div>
                            </div>

                            <!-- error -->
                            <div class="alert alert-danger mb0 x-hidden"></div>
                            <!-- error -->
                        </div>
                        <div class="card-footer text-right">
                            <button type="button" class="btn btn-danger js_delete-article" data-id="{$article['post_id']}">
                                <i class="fa fa-trash mr5"></i>{__("Delete Article")}
                            </button>
                            <button type="submit" class="btn btn-primary">{__("Publish")}</button>
                        </div>
                    </div>
                </div>
                <!-- content -->
            </div>
            <!-- content panel -->
        
        {elseif $view == "new"}
            
            <!-- side panel -->
            <div class="col-md-4 col-lg-3 offcanvas-sidebar js_sticky-sidebar">
                {include file='_sidebar.tpl'}
            </div>
            <!-- side panel -->

            <!-- content panel -->
            <div class="col-md-8 col-lg-9 offcanvas-mainbar">
                <!-- content -->
                <div class="card">
                    <div class="card-header with-icon">
                        <i class="fa fa-edit mr10"></i>{__("Write New Article")}
                    </div>
                    <div class="js_ajax-forms-html" data-url="posts/article.php?do=create">
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

                            <div class="form-group form-row">
                                <label class="col-md-2 form-control-label">
                                    {__("Cover")}
                                </label>
                                <div class="col-md-10">
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
                                        <input type="hidden" class="js_x-image-input" name="cover">
                                    </div>
                                </div>
                            </div>

                            <div class="form-group form-row">
                                <label class="col-md-2 form-control-label">
                                    {__("Category")}
                                </label>
                                <div class="col-md-10">
                                    <select class="form-control" name="category">
                                        <option>{__("Select Category")}</option>
                                        {foreach $blogs_categories as $category}
                                        <option value="{$category['category_id']}">{__($category['category_name'])}</option>
                                        {/foreach}
                                    </select>
                                </div>
                            </div>

                            <div class="form-group form-row">
                                <label class="col-md-2 form-control-label">
                                    {__("Tags")}
                                </label>
                                <div class="col-md-10">
                                    <input class="form-control" name="tags">
                                </div>
                            </div>

                            <!-- error -->
                            <div class="alert alert-danger mb0 x-hidden"></div>
                            <!-- error -->
                        </div>
                        <div class="card-footer text-right">
                            <button type="submit" class="btn btn-primary">{__("Publish")}</button>
                        </div>
                    </div>
                </div>
                <!-- content -->
            </div>
            <!-- content panel -->
        
        {/if}
    </div>
</div>
<!-- page content -->

{include file='_footer.tpl'}