<div class="comment-replace">
    <div class="comment-text js_readmore" dir="auto">{$_comment['text']}</div>
    <div class="comment-text-plain x-hidden">{$_comment['text_plain']}</div>
    {if $_comment['image'] != ""}
        <span class="text-link js_lightbox-nodata" data-image="{$system['system_uploads']}/{$_comment['image']}">
            <img alt="" class="img-fluid" src="{$system['system_uploads']}/{$_comment['image']}">
        </span>
    {/if}
</div>
