<div class="post-replace">
	{if $post['colored_pattern']}
		<div class="post-colored" {if $post['colored_pattern']['type'] == "color"} style="background-image: linear-gradient(45deg, {$post['colored_pattern']['background_color_1']}, {$post['colored_pattern']['background_color_2']});" {else} style="background-image: url({$system['system_uploads']}/{$post['colored_pattern']['background_image']})" {/if}>
			<div class="post-colored-text-wrapper js_scroller" data-slimScroll-height="240">
				<div class="post-text" dir="auto" style="color: {$post['colored_pattern']['text_color']};">
					{$post['text']}
				</div>
			</div>
		</div>
	{else}
		<div class="post-text js_readmore" dir="auto">{$post['text']}</div>
	{/if}
    <div class="post-text-translation x-hidden" dir="auto"></div>
    <div class="post-text-plain x-hidden">{$post['text_plain']}</div>
</div>