<div class="card">
    <div class="card-header with-icon">
        <i class="fa fa-piggy-bank mr10"></i>{__("Points System")}
        {if $sub_view == "payments"} &rsaquo; {__("Payment Requests")}{/if}
    </div>

    {if $sub_view == ""}

        <form class="js_ajax-forms " data-url="admin/settings.php?edit=points">
            <div class="card-body">
                <div class="form-table-row">
                    <div>
                        <div class="form-control-label h6">{__("Points Enabled")}</div>
                        <div class="form-text d-none d-sm-block">{__("Enable or Disable the points system")}</div>
                    </div>
                    <div class="text-right">
                        <label class="switch" for="points_enabled">
                            <input type="checkbox" name="points_enabled" id="points_enabled" {if $system['points_enabled']}checked{/if}>
                            <span class="slider round"></span>
                        </label>
                    </div>
                </div>

                <div class="divider"></div>

                <div class="form-table-row">
                    <div>
                        <div class="form-control-label h6">{__("Users Can Withdraw Earned Money")}</div>
                        <div class="form-text d-none d-sm-block">{__("If enabled users will be able to withdraw earned money")}</div>
                    </div>
                    <div class="text-right">
                        <label class="switch" for="points_money_withdraw_enabled">
                            <input type="checkbox" name="points_money_withdraw_enabled" id="points_money_withdraw_enabled" {if $system['points_money_withdraw_enabled']}checked{/if}>
                            <span class="slider round"></span>
                        </label>
                    </div>
                </div>

                <div class="form-group form-row">
                    <label class="col-md-3 form-control-label">
                        {__("Payment Method")}
                    </label>
                    <div class="col-md-9">
                        <div class="custom-control custom-checkbox custom-control-inline">
                            <input type="checkbox" class="custom-control-input" name="method_paypal" id="method_paypal" {if in_array("paypal", $system['points_payment_method_array'])}checked{/if}>
                            <label class="custom-control-label" for="method_paypal">{__("PayPal")}</label>
                        </div>
                        <div class="custom-control custom-checkbox custom-control-inline">
                            <input type="checkbox" class="custom-control-input" name="method_skrill" id="method_skrill" {if in_array("skrill", $system['points_payment_method_array'])}checked{/if}>
                            <label class="custom-control-label" for="method_skrill">{__("Skrill")}</label>
                        </div>
                        <div class="custom-control custom-checkbox custom-control-inline">
                            <input type="checkbox" class="custom-control-input" name="method_bank" id="method_bank"{if in_array("bank", $system['points_payment_method_array'])}checked{/if}>
                            <label class="custom-control-label" for="method_bank">{__("Bank Transfer")}</label>
                        </div>
                        <div class="custom-control custom-checkbox custom-control-inline" id="js_custome-withdrawal">
                            <input type="checkbox" class="custom-control-input" name="method_custom" id="method_custom" {if in_array("custom", $system['points_payment_method_array'])}checked{/if}>
                            <label class="custom-control-label" for="method_custom">{__("Custom Method")}</label>
                        </div>
                        <span class="form-text">
                            {__("Users can send withdrawal requests via any of these methods")}
                        </span>
                    </div>
                </div>

                <div id="js_custome-withdrawal-name" {if !in_array("custom", $system['points_payment_method_array'])}class="x-hidden"{/if}>
                    <div class="form-group form-row">
                        <label class="col-md-3 form-control-label">
                            {__("Custom Method Name")}
                        </label>
                        <div class="col-md-9">
                            <input type="text" class="form-control" name="points_payment_method_custom" value="{$system['points_payment_method_custom']}">
                            <span class="form-text">
                                {__("Set the name of your custom withdrawal payment method")}
                            </span>
                        </div>
                    </div>
                </div>

                <div class="form-group form-row">
                    <label class="col-md-3 form-control-label">
                        {__("Minimum Withdrawal Request")} ({$system['system_currency']})
                    </label>
                    <div class="col-md-9">
                        <input type="text" class="form-control" name="points_min_withdrawal" value="{$system['points_min_withdrawal']}">
                        <span class="form-text">
                            {__("The minimum amount of money so user can send a withdrawal request")}
                        </span>
                    </div>
                </div>

                <div class="divider"></div>

                <div class="form-table-row">
                    <div>
                        <div class="form-control-label h6">{__("Users Can Transfer Earned Money To Wallet")}</div>
                        <div class="form-text d-none d-sm-block">{__("If Ads enabled users will be able to transfer earned money to their wallet")}</div>
                    </div>
                    <div class="text-right">
                        <label class="switch" for="points_money_transfer_enabled">
                            <input type="checkbox" name="points_money_transfer_enabled" id="points_money_transfer_enabled" {if $system['points_money_transfer_enabled']}checked{/if}>
                            <span class="slider round"></span>
                        </label>
                    </div>
                </div>

                <div class="divider"></div>

                <div class="form-group form-row">
                    <label class="col-md-3 form-control-label">
                        {__("Points")}/{$system['system_currency_symbol']}1.00
                    </label>
                    <div class="col-md-9">
                        <input type="text" class="form-control" name="points_per_currency" value="{$system['points_per_currency']}">
                        <span class="form-text">
                            {__("How much points eqaul to")} {$system['system_currency_symbol']}1
                        </span>
                    </div>
                </div>

                <div class="form-group form-row">
                    <label class="col-md-3 form-control-label">
                        {__("Points/Post")}
                    </label>
                    <div class="col-md-9">
                        <input type="text" class="form-control" name="points_per_post" value="{$system['points_per_post']}">
                        <span class="form-text">
                            {__("How many points user will get for each new post")}
                        </span>
                    </div>
                </div>

                <div class="form-group form-row">
                    <label class="col-md-3 form-control-label">
                        {__("Points/Comment")}
                    </label>
                    <div class="col-md-9">
                        <input type="text" class="form-control" name="points_per_comment" value="{$system['points_per_comment']}">
                        <span class="form-text">
                            {__("How many points user will get for each new comment")}
                        </span>
                    </div>
                </div>

                <div class="form-group form-row">
                    <label class="col-md-3 form-control-label">
                        {__("Points/Reaction")}
                    </label>
                    <div class="col-md-9">
                        <input type="text" class="form-control" name="points_per_reaction" value="{$system['points_per_reaction']}">
                        <span class="form-text">
                            {__("How many points user will get for each reaction")}
                        </span>
                    </div>
                </div>

                <div class="divider"></div>

                <div class="form-group form-row">
                    <label class="col-md-3 form-control-label">
                        {__("Free Users Daily Limit")}
                    </label>
                    <div class="col-md-9">
                        <input type="text" class="form-control" name="points_limit_user" value="{$system['points_limit_user']}">
                        <span class="form-text">
                            {__("The maximum number of points regular user can get per day")}
                        </span>
                    </div>
                </div>

                <div class="form-group form-row">
                    <label class="col-md-3 form-control-label">
                        {__("Pro Users Daily Limit")}
                    </label>
                    <div class="col-md-9">
                        <input type="text" class="form-control" name="points_limit_pro" value="{$system['points_limit_pro']}">
                        <span class="form-text">
                            {__("The maximum number of points pro user can get per day")}
                        </span>
                    </div>
                </div>

                <!-- success -->
                <div class="alert alert-success mb0 x-hidden"></div>
                <!-- success -->

                <!-- error -->
                <div class="alert alert-danger mb0 x-hidden"></div>
                <!-- error -->
            </div>
            <div class="card-footer text-right">
                <button type="submit" class="btn btn-primary">{__("Save Changes")}</button>
            </div>
        </form>

    {elseif $sub_view == "payments"}

        <div class="card-body">
            <div class="alert alert-primary">
                <div class="icon">
                    <i class="fa fa-money-check-alt fa-2x"></i>
                </div>
                <div class="text">
                    <strong>{__("Payment Requests")}</strong><br>
                    {__("You will need to make the payments from your Paypal, Skrill, Bank Account... etc")}.<br>
                    {__("After making the payment you can mark the payment request as paid")}.
                </div>
            </div>
            <div class="table-responsive">
                <table class="table table-striped table-bordered table-hover js_dataTable">
                    <thead>
                        <tr>
                            <th>{__("ID")}</th>
                            <th>{__("User")}</th>
                            <th>{__("Amount")}</th>
                            <th>{__("Method")}</th>
                            <th>{__("Transfer To")}</th>
                            <th>{__("Actions")}</th>
                        </tr>
                    </thead>
                    <tbody>
                        {foreach $rows as $row}
                            <tr>
                                <td>{$row['payment_id']}</td>
                                <td>
                                    <a target="_blank" href="{$system['system_url']}/{$row['user_name']}">
                                        <img class="tbl-image" src="{$row['user_picture']}">
                                        {$row['user_firstname']} {$row['user_lastname']}
                                    </a>
                                </td>
                                <td>{$system['system_currency_symbol']}{$row['amount']|number_format:2}</td>
                                <td>
                                    <span class="badge badge-pill badge-lg badge-{$row['method_color']}">
                                        {$row['method']|ucfirst}
                                    </span>
                                </td>
                                <td>{$row['method_value']}</td>
                                <td>
                                    <button data-toggle="tooltip" data-placement="top" title='{__("Mark as Paid")}' class="btn btn-sm btn-icon btn-rounded btn-success js_admin-withdraw" data-type="points" data-handle="approve" data-id="{$row['payment_id']}">
                                            <i class="fa fa-check"></i>
                                    </button>
                                    <button data-toggle="tooltip" data-placement="top" title='{__("Decline")}' class="btn btn-sm btn-icon btn-rounded btn-danger js_admin-withdraw" data-type="points" data-handle="decline" data-id="{$row['payment_id']}">
                                        <i class="fa fa-times"></i>
                                    </button>
                                </td>
                            </tr>
                        {/foreach}
                    </tbody>
                </table>
            </div>
        </div>

    {/if}
</div>