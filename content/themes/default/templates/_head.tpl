<!doctype html>

<html lang="{$system['language']['code']}" {if $system['language']['dir'] == "RTL"} dir="RTL" {/if}>

<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="generator" content="Sngine">
    <meta name="version" content="{$system['system_version']}">

    <!-- Title -->
    <title>{$page_title|truncate:70}</title>
    <!-- Title -->

    <!-- Meta -->
    <meta name="description" content="{$page_description|truncate:300}">
    <meta name="keywords" content="{$system['system_keywords']}">
    <!-- Meta -->

    <!-- OG-Meta -->
    <meta property="og:title" content="{$page_title|truncate:70}"/>
    <meta property="og:description" content="{$page_description|truncate:300}"/>
    <meta property="og:site_name" content="{$system['system_title']}"/>
    <meta property="og:image" content="{$page_image}"/>
    <!-- OG-Meta -->

    <!-- Twitter-Meta -->
    <meta name="twitter:card" content="summary">
    <meta name="twitter:title" content="{$page_title|truncate:70}"/>
    <meta name="twitter:description" content="{$page_description|truncate:300}"/>
    <meta name="twitter:image" content="{$page_image}"/>
    <!-- Twitter-Meta -->

    <!-- Favicon -->
    {if $system['system_favicon_default']}
        <link rel="shortcut icon" href="{$system['system_url']}/content/themes/{$system['theme']}/images/favicon.png" />
    {elseif $system['system_favicon']}
        <link rel="shortcut icon" href="{$system['system_uploads']}/{$system['system_favicon']}" />
    {/if}
    <!-- Favicon -->

    <!-- Fonts [Roboto|Font-Awesome] -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.12.1/css/all.css">
    <!-- Fonts [Roboto|Font-Awesome] -->
    
    <!-- CSS -->
    {if $system['language']['dir'] == "LTR"}
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <link rel="stylesheet" type='text/css' href="{$system['system_url']}/content/themes/{$system['theme']}/css/style.min.css">
    {else}
        <link rel="stylesheet" href="https://cdn.rtlcss.com/bootstrap/v4.2.1/css/bootstrap.min.css" integrity="sha384-vus3nQHTD+5mpDiZ4rkEPlnkcyTP+49BhJ4wJeJunw06ZAp+wzzeBPUXr42fi8If" crossorigin="anonymous">
        <link rel="stylesheet" type='text/css' href="{$system['system_url']}/content/themes/{$system['theme']}/css/style.rtl.min.css">
    {/if}
    <!-- CSS -->

    <!-- CSS Customized -->
    {include file='_head.css.tpl'}
    <!-- CSS Customized -->

    <!-- Header Custom JavaScript -->
    {if $system['custome_js_header']}
        <script type="text/javascript">
            {html_entity_decode($system['custome_js_header'], ENT_QUOTES)}
        </script>
    {/if}
    <!-- Header Custom JavaScript -->

</head>