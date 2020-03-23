<!-- ads -->
{include file='_ads.tpl' _ads=$ads_master['footer'] _master=true}
<!-- ads -->

{if !($page == "index" && !$user->_logged_in)}
{include file='_footer.links.tpl'}
{/if}

</div>
<!-- main wrapper -->

<!-- Dependencies CSS [Twemoji-Awesome] -->
<link rel="stylesheet" href="{$system['system_url']}/includes/assets/css/twemoji-awesome/twemoji-awesome.min.css">
<!-- Dependencies CSS [Twemoji-Awesome] -->

<!-- JS Files -->
{include file='_js_files.tpl'}
<!-- JS Files -->

<!-- JS Templates -->
{include file='_js_templates.tpl'}
<!-- JS Templates -->

<!-- Footer Custom JavaScript -->
{if $system['custome_js_footer']}
	<script type="text/javascript">
		{html_entity_decode($system['custome_js_footer'], ENT_QUOTES)}
	</script>
{/if}
<!-- Footer Custom JavaScript -->

<!-- Analytics Code -->
{if $system['analytics_code']}{html_entity_decode($system['analytics_code'], ENT_QUOTES)}{/if}
<!-- Analytics Code -->

{if $user->_logged_in}
	<!-- Notification -->
	<audio id="notification-sound" preload="auto">
		<source src="{$system['system_url']}/includes/assets/sounds/notification.mp3" type="audio/mpeg">
	</audio>
	<!-- Notification -->
	<!-- Chat -->
	<audio id="chat-sound" preload="auto">
		<source src="{$system['system_url']}/includes/assets/sounds/chat.mp3" type="audio/mpeg">
	</audio>
	<!-- Chat -->
	<!-- Call -->
	<audio id="chat-calling-sound" preload="auto" loop="true">
		<source src="{$system['system_url']}/includes/assets/sounds/calling.mp3" type="audio/mpeg">
	</audio>
	<!-- Call -->
	<!-- Video -->
	<audio id="chat-ringing-sound" preload="auto" loop="true">
		<source src="{$system['system_url']}/includes/assets/sounds/ringing.mp3" type="audio/mpeg">
	</audio>
	<!-- Video -->
{/if}

</body>
</html>