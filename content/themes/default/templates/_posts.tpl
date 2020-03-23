<!-- posts-filter -->
<div class="posts-filter">
    <span>{if $_title}{$_title}{else}{__("Recent Updates")}{/if}</span>
    {if !$_filter}
	    <div class="float-right">
	        <div class="btn-group btn-group-sm js_posts-filter" data-value="all" title='{__("All")}'>
	            <button type="button" class="btn dropdown-toggle" data-toggle="dropdown" data-display="static">
	                <i class="btn-group-icon fa fa-bars fa-fw"></i> <span class="btn-group-text">{__("All")}</span>
	            </button>
	            <div class="dropdown-menu dropdown-menu-right">
	                <div class="dropdown-item pointer" data-title='{__("All")}' data-value="all"><i class="fa fa-bars fa-fw mr10"></i>{__("All")}</div>
	                <div class="dropdown-item pointer" data-title='{__("Text")}' data-value=""><i class="fa fa-comment fa-fw mr10"></i>{__("Text")}</div>
	                <div class="dropdown-item pointer" data-title='{__("Links")}' data-value="link"><i class="fa fa-link fa-fw mr10"></i>{__("Links")}</div>
	                <div class="dropdown-item pointer" data-title='{__("Media")}' data-value="media"><i class="fa fa-video fa-fw mr10"></i>{__("Media")}</div>
	                <div class="dropdown-item pointer" data-title='{__("Photos")}' data-value="photos"><i class="fa fa-file-image fa-fw mr10"></i>{__("Photos")}</div>
	                {if $system['geolocation_enabled']}
	                	<div class="dropdown-item pointer" data-title='{__("Maps")}' data-value="map"><i class="fa fa-map-marker fa-fw mr10"></i>{__("Maps")}</div>
	                {/if}
	                {if $system['market_enabled'] && $_get != "posts_page" && $_get != "posts_group" && $_get != "posts_event"}
	                	<div class="dropdown-item pointer" data-title='{__("Products")}' data-value="product"><i class="fa fa-tag fa-fw mr10"></i>{__("Products")}</div>
	                {/if}
	                {if $system['blogs_enabled'] && $_get != "posts_page" && $_get != "posts_group" && $_get != "posts_event"}
	                	<div class="dropdown-item pointer" data-title='{__("Articles")}' data-value="article"><i class="fa fa-file-alt fa-fw mr10"></i>{__("Articles")}</div>
	                {/if}
	                {if $system['polls_enabled']}
	                	<div class="dropdown-item pointer" data-title='{__("Polls")}' data-value="poll"><i class="fa fa-chart-pie fa-fw mr10"></i>{__("Polls")}</div>
	                {/if}
	                {if $system['videos_enabled']}
	                	<div class="dropdown-item pointer" data-title='{__("Videos")}' data-value="video"><i class="fa fa-film fa-fw mr10"></i>{__("Videos")}</div>
	                {/if}
	                {if $system['audio_enabled']}
	                	<div class="dropdown-item pointer" data-title='{__("Audios")}' data-value="audio"><i class="fa fa-music fa-fw mr10"></i>{__("Audios")}</div>
	                {/if}
	                {if $system['file_enabled']}
	                	<div class="dropdown-item pointer" data-title='{__("Files")}' data-value="file"><i class="fa fa-file-alt fa-fw mr10"></i>{__("Files")}</div>
	                {/if}
	            </div>
	        </div>
	    </div>
    {elseif $_filter == "article"}
    	{if $user->_data['can_write_articles']}
	    	<div class="float-right">
	    		<a href="{$system['system_url']}/blogs/new" class="btn btn-sm btn-primary">
	                <i class="fa fa-plus-circle mr5"></i>{__("Add New Article")}
	            </a>
	    	</div>
    	{/if}
    {elseif $_filter == "product"}
        <div class="float-right">
            <button type="button" class="btn btn-sm btn-primary" data-toggle="modal" data-url="posts/product.php?do=create">
                <i class="fa fa-plus-circle mr5"></i>{__("Add New Product")}
            </button>
    	</div>
    {/if}
</div>
<!-- posts-filter -->

<!-- posts-loader -->
<div class="post x-hidden js_posts_loader">
	<div class="post-body">
		<div class="panel-effect">
			<div class="fake-effect fe-0"></div>
			<div class="fake-effect fe-1"></div>
			<div class="fake-effect fe-2"></div>
			<div class="fake-effect fe-3"></div>
			<div class="fake-effect fe-4"></div>
			<div class="fake-effect fe-5"></div>
			<div class="fake-effect fe-6"></div>
			<div class="fake-effect fe-7"></div>
			<div class="fake-effect fe-8"></div>
			<div class="fake-effect fe-9"></div>
			<div class="fake-effect fe-10"></div>
			<div class="fake-effect fe-11"></div>
		</div>
	</div>
</div>
<!-- posts-loader -->

<div class="js_posts_stream" data-get="{$_get}" data-filter="{if $_filter}{$_filter}{else}all{/if}" {if $_id}data-id="{$_id}"{/if}>
	{if $posts}
		<ul>
			<!-- posts -->
			{foreach $posts as $post}
				{include file='__feeds_post.tpl' _get=$_get}
			{/foreach}
			<!-- posts -->
		</ul>

		<!-- see-more -->
		<div class="alert alert-post see-more mb20 js_see-more {if $user->_logged_in}js_see-more-infinite{/if}" data-get="{$_get}" data-filter="{if $_filter}{$_filter}{else}all{/if}" {if $_id}data-id="{$_id}"{/if}>
			<span>{__("More Stories")}</span>
			<div class="loader loader_small x-hidden"></div>
		</div>
		<!-- see-more -->
	{else}
		<div class="js_posts_stream" data-get="{$_get}" data-filter="{if $_filter}{$_filter}{else}all{/if}" {if $_id}data-id="{$_id}"{/if}>
			<ul>
				<!-- no posts -->
				<div class="text-center text-muted">
					<i class="fa fa-newspaper fa-4x"></i>
					<p class="mb10"><strong>{__("No posts to show")}</strong></p>
				</div>
				<!-- no posts -->
			</ul>
		</div>
	{/if}
</div>

		
