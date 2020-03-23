{include file='_head.tpl'}
{include file='_header.tpl'}

<!-- page content -->
<div class="page-title">
	<div class="squares square-1"></div>
    <div class="squares square-2"></div>
    <div class="squares square-3"></div>
    {$static['page_title']}
</div>

<div class="container {if $user->_logged_in}offcanvas{/if}" style="margin-top: -25px;">
    <div class="row">

	    <!-- side panel -->
	    {if $user->_logged_in}
		    <div class="col-12 d-block d-sm-none offcanvas-sidebar">
		        {include file='_sidebar.tpl'}
		    </div>
	    {/if}
	    <!-- side panel -->

	    <!-- content panel -->
	    <div class="col-12 {if $user->_logged_in}offcanvas-mainbar{/if}">
    		<div class="card shadow">
    			<div class="card-body page-content text-readable text-with-list">
			        {$static['page_text']}
    			</div>
    		</div>
	    </div>
	    <!-- content panel -->
	    
	</div>
</div>
<!-- page content -->

{include file='_footer.tpl'}