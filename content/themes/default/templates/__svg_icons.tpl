<svg 
    {if $width}width="{$width}"{/if} 
    {if $height}height="{$height}"{/if} 
    {if $class}class="{$class}"{/if} 
    {if $style}style="{$style}"{/if} 
    version="1.1" xmlns="http://www.w3.org/2000/svg" x="0px" y="0px" viewBox="0 0 512 512" xml:space="preserve">
    {if $icon == "2co"}

        {include file='../images/svg/2co.svg'}

    {elseif $icon == "photos"}

    	{include file='../images/svg/photo.svg'}

    {elseif $icon == "videos"}
    
    	{include file='../images/svg/play-button.svg'}

    {elseif $icon == "audios"}
    
    	{include file='../images/svg/record.svg'}

    {elseif $icon == "files"}
    
    	{include file='../images/svg/file.svg'}

    {elseif $icon == "sun"}
    
        {include file='../images/svg/sun.svg'}

    {elseif $icon == "night"}
    
        {include file='../images/svg/night.svg'}

    {elseif $icon == "afternoon"}
    
        {include file='../images/svg/sunrise.svg'}

    {/if}
</svg>