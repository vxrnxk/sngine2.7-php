<div class="{if $_small}col-4{else}col-6 col-md-4 col-lg-2{/if} {if $photo['blur']}x-blured{/if}">
    <a class="pg_photo {if !$_small}large{/if} js_lightbox" href="{$system['system_url']}/photos/{$photo['photo_id']}" data-id="{$photo['photo_id']}" data-image="{$system['system_uploads']}/{$photo['source']}" data-context="{$_context}" style="background-image:url({$system['system_uploads']}/{$photo['source']});">
    	{if !$_small && ($_manage || $photo['manage'])}
	    	<div class="pg_photo-btn">
	            <button type="button" class="close js_delete-photo" data-id="{$photo['photo_id']}" data-toggle="tooltip" data-placement="top" title='{__("Delete")}'>
	                <span aria-hidden="true">&times;</span>
	            </button>
	        </div>
        {/if}
    </a>
</div>