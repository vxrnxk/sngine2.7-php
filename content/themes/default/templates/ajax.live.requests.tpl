{foreach $requests as $_user}
{include file='__feeds_user.tpl' _tpl="list" _connection="request"}
{/foreach}