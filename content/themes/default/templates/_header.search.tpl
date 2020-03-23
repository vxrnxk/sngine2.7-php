<div class="search-wrapper d-none d-md-block">
    <form>
        <input id="search-input" type="text" class="form-control" placeholder='{__("Search")}' autocomplete="off">
        <div id="search-results" class="dropdown-menu dropdown-widget dropdown-search js_dropdown-keepopen">
            <div class="dropdown-widget-header">
                <span class="title">{__("Search Results")}</span>
            </div>
            <div class="dropdown-widget-body">
                <div class="loader loader_small ptb10"></div>
            </div>
            <a class="dropdown-widget-footer" id="search-results-all" href="{$system['system_url']}/search/">{__("See All Results")}</a>
        </div>
        {if $user->_logged_in && $user->_data['search_log']}
            <div id="search-history" class="dropdown-menu dropdown-widget dropdown-search js_dropdown-keepopen">
                <div class="dropdown-widget-header">
                    <span class="text-link float-right js_clear-searches">
                        {__("Clear")}
                    </span>
                    <span class="title"><i class="fa fa-clock mr5"></i>{__("Recent Searches")}</span>
                </div>
                <div class="dropdown-widget-body">
                    {include file='ajax.search.tpl' results=$user->_data['search_log']}
                </div>
                <a class="dropdown-widget-footer" id="search-results-all" href="{$system['system_url']}/search/">{__("Advanced Search")}</a>
            </div>
        {/if}
    </form>
</div>