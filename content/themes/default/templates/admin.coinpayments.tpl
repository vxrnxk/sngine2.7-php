<div class="card">
    <div class="card-header with-icon">
        <i class="fab fa-bitcoin mr10"></i>{__("CoinPayments Transactions")}
    </div>

    <div class="card-body">

        {if !$system['coinpayments_enabled']}
            <div class="alert alert-warning">
                <div class="icon">
                    <i class="fa fa-exclamation-triangle fa-2x"></i>
                </div>
                <div class="text pt5">
                    {__("CoinPayments is disabled")}, {__("Make sure you have configured")} <a class="alert-link" href="{$system['system_url']}/{$control_panel['url']}/settings/payments">{__("Payments Settings")}</a>
                </div>
            </div>
        {/if}

        <div class="alert alert-info">
            <div class="icon">
                <i class="fa fa-info-circle fa-2x"></i>
            </div>
            <div class="text pt5">
                {__("You can visit your CoinPayments account to see the transactions in more details")}
            </div>
        </div>

        <div class="table-responsive">
            <table class="table table-striped table-bordered table-hover js_dataTable">
                <thead>
                    <tr>
                        <th>{__("TXN_ID")}</th>
                        <th>{__("User")}</th>
                        <th>{__("Product")}</th>
                        <th>{__("Amount")}</th>
                        <th>{__("Created")}</th>
                        <th>{__("Updated")}</th>
                        <th>{__("Status")}</th>
                        <th>{__("Status Message")}</th>
                    </tr>
                </thead>
                <tbody>
                    {foreach $coinpayments_transactions as $transaction}
                        <tr>
                            <td>{$transaction['transaction_txn_id']}</td>
                            <td>
                                <a target="_blank" href="{$system['system_url']}/{$transaction['user_name']}">
                                    <img class="tbl-image" src="{$transaction['user_picture']}">
                                    <br>
                                    <span class="badge badge-pill badge-lg badge-light">{$transaction['user_firstname']} {$transaction['user_lastname']}</span>
                                </a>
                            </td>
                            <td>{$transaction['product']}</td>
                            <td>{$system['system_currency_symbol']}{$transaction['amount']}</td>
                            <td>
                                <span class="js_moment" data-time="{$transaction['created_at']}">{$transaction['created_at']}</span>
                            </td>
                            <td>
                                <span class="js_moment" data-time="{$transaction['last_update']}">{$transaction['last_update']}</span>
                            </td>
                            <td>
                                {if $transaction['status'] == '-1'}
                                    <span class="badge badge-pill badge-lg badge-danger">{__("Error")}</span>
                                {elseif $transaction['status'] == '0'}
                                    <span class="badge badge-pill badge-lg badge-info">{__("Processing")}</span>
                                {elseif $transaction['status'] == '1'}
                                    <span class="badge badge-pill badge-lg badge-warning">{__("Pending")}</span>
                                {elseif $transaction['status'] == '2'}
                                    <span class="badge badge-pill badge-lg badge-success">{__("Complete")}</span>
                                {/if}
                            </td>
                            <td>
                                {$transaction['status_message']}
                            </td>
                        </tr>
                    {/foreach}
                </tbody>
            </table>
        </div>
    </div>

</div>