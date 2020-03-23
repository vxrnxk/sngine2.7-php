{include file='_head.tpl'}
{include file='_header.tpl'}

{assign var="post" value=$photo['post']}

<!-- page content -->
<div class="container mt20 {if $user->_logged_in}offcanvas{/if}">
	<div class="row">

        <!-- side panel -->
        {if $user->_logged_in}
            <div class="col-12 d-block d-md-none offcanvas-sidebar mt20">
                {include file='_sidebar.tpl'}
            </div>
        {/if}
        <!-- side panel -->

        <!-- content panel -->
        <div class="col-12 {if $user->_logged_in}offcanvas-mainbar{/if}">
            <div class="row">
                <!-- left panel -->
                <div class="col-md-8 col-lg-6 offset-lg-3">
                    <div class="post" data-id="{if $photo['is_single']}{$post['post_id']}{else}{$photo['photo_id']}{/if}">
                        {include file='__feeds_post_photo.tpl' standalone=true}
                    </div>
                </div>
                <!-- left panel -->

                <!-- right panel -->
                <div class="col-md-4 col-lg-3">
                    {include file='_ads_campaigns.tpl'}
                    {include file='_ads.tpl'}
                    {include file='_widget.tpl'}
                </div>
                <!-- right panel -->
            </div>
        </div>
        <!-- content panel -->

	</div>
</div>
<!-- page content -->

{include file='_footer.tpl'}