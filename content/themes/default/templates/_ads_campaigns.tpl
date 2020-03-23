{if $ads_campaigns}
	<!-- ads campaigns -->
	{foreach $ads_campaigns as $campaign}
		<div class="card">
		    <div class="card-header bg-transparent">
		        <i class="fa fa-bullhorn fa-fw mr5 yellow"></i>{__("Sponsored")}
		    </div>
		    <div class="card-body {if $campaign['campaign_bidding'] == 'click'}js_ads-click-campaign{/if}" data-id="{$campaign['campaign_id']}">
		    	<a href="{$campaign['ads_url']}" target="_blank">
		    		<img class="img-fluid" src="{$system['system_uploads']}/{$campaign['ads_image']}">
		    	</a>
		    	{if $campaign['ads_title'] || $campaign['ads_description']}
			    	<div class="ptb5 plr10">
			    		<p class="ads-title">
				    		<a href="{$campaign['ads_url']}" target="_blank">{$campaign['ads_title']}</a>
				    	</p>
				    	<p class="ads-descrition">
				    		{$campaign['ads_description']|truncate:200}
				    	</p>
			    	</div>
		    	{/if}
		    </div>
		</div>
	{/foreach}
	<!-- ads campaigns -->
{/if}