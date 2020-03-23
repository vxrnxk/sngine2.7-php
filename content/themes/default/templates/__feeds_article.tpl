{if $_tpl == "featured"}
    <div class="{if $_iteration == 1}col-sm-12 col-md-8 col-lg-6{else}col-sm-6 col-md-4 col-lg-3{/if}">
        <a href="{$system['system_url']}/blogs/{$article['post_id']}/{$article['article']['title_url']}" class="blog-container {if $_iteration == 1}primary{/if}">
            <div class="blog-image">
                <img src="{$article['article']['parsed_cover']}">
            </div>
            <div class="blog-content">
                <h3>{$article['article']['title']}</h3>
                <div class="text">{$article['article']['text_snippet']|truncate:400}</div>
                <div>
                    <div class="post-avatar">
                        <div class="post-avatar-picture small" style="background-image:url('{$article['post_author_picture']}');">
                        </div>
                    </div>
                    <div class="post-meta">
                        <span class="text-link">
                            {$article['post_author_name']}
                        </span>
                        <div class="post-time">
                            <span class="js_moment" data-time="{$article['time']}">{$article['time']}</span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="blog-more">
                <span>{__("More")}</span>
            </div>
        </a>
    </div>
{else}
    <div class="post-media list">
        <div class="post-media-image-wrapper">
            <a class="post-media-image" href="{$system['system_url']}/blogs/{$article['post_id']}/{$article['article']['title_url']}">
                <div style="padding-top: 50%; background-image:url('{$article['article']['parsed_cover']}');"></div>
            </a>
            <div class="post-media-image-meta">
                <a class="article-category {if $_small}small{/if}" href="{$system['system_url']}/blogs/category/{$article['article']['category_id']}/{$article['article']['category_url']}">
                    {$article['article']['category_name']}
                </a>
            </div>
        </div>
        <div class="post-media-meta">
            <a class="title mb5" href="{$system['system_url']}/blogs/{$article['post_id']}/{$article['article']['title_url']}">{$article['article']['title']}</a>
            <div class="text mb5">
                {if $_small}
                    {$article['article']['text_snippet']|truncate:100}
                {else}
                    {$article['article']['text_snippet']|truncate:500}
                {/if}
            </div>
            <div class="info">
                {__("By")} 
                <span class="js_user-popover pr10" data-type="{$article['user_type']}" data-uid="{$article['user_id']}">
                    <a href="{$article['post_author_url']}">{$article['post_author_name']}</a>
                </span>
                <i class="fa fa-clock pr5"></i><span class="js_moment pr10" data-time="{$article['time']}">{$article['time']}</span>
                <i class="fa fa-comments pr5"></i><span class="pr10">{$article['comments']}</span>
                <i class="fa fa-eye pr5"></i><span class="pr10">{$article['article']['views']}</span>
            </div>
        </div>
    </div>
{/if}