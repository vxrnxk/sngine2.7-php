{assign var="post" value=$photo['post']}

<div class="lightbox-post" data-id="{if $photo['is_single']}{$post['post_id']}{else}{$photo['photo_id']}{/if}">
	<div class="js_scroller" data-slimScroll-height="100%">
        {include file='__feeds_post_photo.tpl' _lightbox=true}
	</div>
</div>