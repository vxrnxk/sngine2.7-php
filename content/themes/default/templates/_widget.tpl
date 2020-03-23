{if $widgets}
	<!-- Widgets -->
	{foreach $widgets as $widget}
		<div class="card">
		    <div class="card-header">
		        <strong>{$widget['title']}</strong>
		    </div>
		    <div class="card-body">{$widget['code']}</div>
		</div>
	{/foreach}
	<!-- Widgets -->
{/if}