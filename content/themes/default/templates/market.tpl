{include file='_head.tpl'}
{include file='_header.tpl'}

<!-- page header -->
<div class="page-header market-header">
    <div class="container">
        <h2>{$system['system_title']} {__("Market")}</h2>
        <div class="row mt20">
            <div class="col-sm-9 col-lg-6 mx-sm-auto">
                <form class="js_search-form" data-handle="market">
                    <div class="input-group">
                        <input type="text" class="form-control" name="query" placeholder='{__("Search for products")}'>
                        <div class="input-group-append">
                            <button type="submit" class="btn btn-danger">{__("Search")}</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- page header -->

<!-- page content -->
<div class="container mt20 offcanvas">
	<div class="row">

		<!-- left panel -->
		<div class="col-md-4 col-lg-3 offcanvas-sidebar">
			<!-- add new product -->
			<div class="mb10">
				<button type="button" class="btn btn-sm btn-primary btn-block rounded-pill" data-toggle="modal" data-url="posts/product.php?do=create">
	                <i class="fa fa-cart-plus mr10"></i>{__("Add New Product")}
	            </button>
			</div>
            <!-- add new product -->

            <!-- categories -->
			<div class="card">
				<div class="card-body with-nav">
					<ul class="side-nav">
						<li {if $view == "" || $view == "search"}class="active"{/if}>
							<a href="{$system['system_url']}/market">
                                {__("All")}
                            </a>
						</li>
						{foreach $categories as $category}
							<li {if $view == "category" && $category_id == $category['category_id']}class="active"{/if}>
								<a href="{$system['system_url']}/market/category/{$category['category_id']}/{$category['category_url']}">
	                                {__($category['category_name'])}
	                            </a>
							</li>
						{/foreach}
					</ul>
				</div>
			</div>
			<!-- categories -->
		</div>
		<!-- left panel -->

		<!-- right panel -->
		<div class="col-md-8 col-lg-9 offcanvas-mainbar">

			{include file='_ads.tpl'}

			{if $view == "search"}
				<div class="bs-callout bs-callout-info mt0">
                    <!-- results counter -->
                    <span class="badge badge-pill badge-lg badge-light">{$total}</span> {__("results were found for the search for")} "<strong class="text-primary">{$query}</strong>"
                    <!-- results counter -->
                </div>
            {/if}

            {if $view == "" && $promoted_products}
				<div class="articles-widget-header">
                    <div class="articles-widget-title">{__("Promoted Products")}</div>
                </div>
				<div class="row mb20">
					{foreach $promoted_products as $post}
						<div class="col-md-6 col-lg-4">
							<div class="card product boosted">
								<div class="boosted-icon" data-toggle="tooltip" title="{__("Promoted")}">
					                <i class="fa fa-bullhorn"></i>
					            </div>
								<div class="product-image">
									<div class="product-price">
										{if $post['product']['price'] > 0}
						                    {$system['system_currency_symbol']}{$post['product']['price']}
						                {else}
						                    {__("Free")}
						                {/if}
									</div>
									{if $post['photos_num'] > 0}
										<img src="{$system['system_uploads']}/{$post['photos'][0]['source']}">
									{else}
										<img src="{$system['system_url']}/content/themes/{$system['theme']}/images/blank_product.jpg">
									{/if}
									<div class="product-overlay">
										<a class="btn btn-sm btn-outline-secondary rounded-pill" href="{$system['system_url']}/posts/{$post['post_id']}">
											{__("More")}
										</a>
										{if $post['author_id'] != $user->_data['user_id'] }
									        <button type="button" class="btn btn-sm btn-info rounded-pill js_chat-start" data-uid="{$post['author_id']}" data-name="{$post['post_author_name']}"><i class="fa fa-comments mr5"></i>{__("Buy")}</button>
									    {/if}
									</div>
								</div>
								<div class="product-info">
									<div class="product-meta title">
										<a href="{$system['system_url']}/posts/{$post['post_id']}" class="title">{$post['product']['name']}</a>
									</div>
									<div class="product-meta">
										<i class="fa fa-tag fa-fw mr5" style="color: #1f9cff;"></i>{__("Type")}: 
										{if $post['product']['status'] == "new"}{__("New")}{else}{__("Used")}{/if}
									</div>
									<div class="product-meta">
										<i class="fa fa-map-marker fa-fw"></i> {if $post['product']['location']}{$post['product']['location']}{else}{__("N/A")}{/if}
									</div>
								</div>
							</div>
						</div>
					{/foreach}
				</div>
            {/if}
			
			{if $rows}
				<div class="row">
					{foreach $rows as $post}
						<div class="col-md-6 col-lg-4">
							<div class="card product">
								<div class="product-image">
									<div class="product-price">
										{if $post['product']['price'] > 0}
						                    {$system['system_currency_symbol']}{$post['product']['price']}
						                {else}
						                    {__("Free")}
						                {/if}
									</div>
									{if $post['photos_num'] > 0}
										<img src="{$system['system_uploads']}/{$post['photos'][0]['source']}">
									{else}
										<img src="{$system['system_url']}/content/themes/{$system['theme']}/images/blank_product.jpg">
									{/if}
									<div class="product-overlay">
										<a class="btn btn-sm btn-outline-secondary rounded-pill" href="{$system['system_url']}/posts/{$post['post_id']}">
											{__("More")}
										</a>
										{if $post['author_id'] != $user->_data['user_id'] }
									        <button type="button" class="btn btn-sm btn-info rounded-pill js_chat-start" data-uid="{$post['author_id']}" data-name="{$post['post_author_name']}"><i class="fa fa-comments mr5"></i>{__("Buy")}</button>
									    {/if}
									</div>
								</div>
								<div class="product-info">
									<div class="product-meta title">
										<a href="{$system['system_url']}/posts/{$post['post_id']}" class="title">{$post['product']['name']}</a>
									</div>
									<div class="product-meta">
										<i class="fa fa-tag fa-fw mr5" style="color: #1f9cff;"></i>{__("Type")}: 
										{if $post['product']['status'] == "new"}{__("New")}{else}{__("Used")}{/if}
									</div>
									<div class="product-meta">
										<i class="fa fa-map-marker fa-fw"></i> {if $post['product']['location']}{$post['product']['location']}{else}{__("N/A")}{/if}
									</div>
								</div>
							</div>
						</div>
					{/foreach}
				</div>

				{$pager}
			{else}
				<div class="text-center text-muted">
                    <i class="fa fa-cart-plus fa-4x"></i>
                    <p class="mt10"><strong>{__("No products to show")}</strong></p>
                </div>
			{/if}
		</div>
		<!-- right panel -->

	</div>
</div>
<!-- page content -->

{include file='_footer.tpl'}