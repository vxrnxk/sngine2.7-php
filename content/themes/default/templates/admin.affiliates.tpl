<div class="card">
    <div class="card-header with-icon">
        <i class="fa fa-exchange-alt mr10"></i>{__("Affiliates")}
        {if $sub_view == "payments"} &rsaquo; {__("Payment Requests")}{/if}
    </div>

    {if $sub_view == ""}

        <form class="js_ajax-forms " data-url="admin/settings.php?edit=affiliates">
            <div class="card-body">
                <div class="form-table-row">
                    <div>
                        <div class="form-control-label h6">{__("Affiliates Enabled")}</div>
                        <div class="form-text d-none d-sm-block">{__("Enable or Disable the affiliates system")}</div>
                    </div>
                    <div class="text-right">
                        <label class="switch" for="affiliates_enabled">
                            <input type="checkbox" name="affiliates_enabled" id="affiliates_enabled" {if $system['affiliates_enabled']}checked{/if}>
                            <span class="slider round"></span>
                        </label>
                    </div>
                </div>

                <div class="form-group form-row">
                    <label class="col-md-3 form-control-label">
                        {__("User Earn Money When")}
                    </label>
                    <div class="col-md-9">
                        <select class="form-control" name="affiliate_type">
                            <option {if $system['affiliate_type'] == "registration"}selected{/if} value="registration">
                                {__("New User Registered")}
                            </option>
                            <option {if $system['affiliate_type'] == "packages"}selected{/if} value="packages">
                                {__("New User Registered & Bought Pro Package")}
                            </option>
                        </select>
                        <span class="form-text">
                            {__("If registration type is 'Subscriptions Only' User will earn money from new registration only")}
                        </span>
                    </div>
                </div>

                <div class="form-group form-row">
                    <label class="col-md-3 form-control-label">
                        {__("Payment Method")}
                    </label>
                    <div class="col-md-9">
                        <div class="custom-control custom-checkbox custom-control-inline">
                            <input type="checkbox" class="custom-control-input" name="method_paypal" id="method_paypal" {if in_array("paypal", $system['affiliate_payment_method_array'])}checked{/if}>
                            <label class="custom-control-label" for="method_paypal">{__("PayPal")}</label>
                        </div>
                        <div class="custom-control custom-checkbox custom-control-inline">
                            <input type="checkbox" class="custom-control-input" name="method_skrill" id="method_skrill" {if in_array("skrill", $system['affiliate_payment_method_array'])}checked{/if}>
                            <label class="custom-control-label" for="method_skrill">{__("Skrill")}</label>
                        </div>
                        <div class="custom-control custom-checkbox custom-control-inline">
                            <input type="checkbox" class="custom-control-input" name="method_bank" id="method_bank"{if in_array("bank", $system['affiliate_payment_method_array'])}checked{/if}>
                            <label class="custom-control-label" for="method_bank">{__("Bank Transfer")}</label>
                        </div>
                        <div class="custom-control custom-checkbox custom-control-inline" id="js_custome-withdrawal">
                            <input type="checkbox" class="custom-control-input" name="method_custom" id="method_custom" {if in_array("custom", $system['affiliate_payment_method_array'])}checked{/if}>
                            <label class="custom-control-label" for="method_custom">{__("Custom Method")}</label>
                        </div>
                        <span class="form-text">
                            {__("Users can send withdrawal requests via any of these methods")}
                        </span>
                    </div>
                </div>

                <div id="js_custome-withdrawal-name" {if !in_array("custom", $system['affiliate_payment_method_array'])}class="x-hidden"{/if}>
                    <div class="form-group form-row">
                        <label class="col-md-3 form-control-label">
                            {__("Custom Method Name")}
                        </label>
                        <div class="col-md-9">
                            <input type="text" class="form-control" name="affiliate_payment_method_custom" value="{$system['affiliate_payment_method_custom']}">
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
                        <input type="text" class="form-control" name="affiliates_min_withdrawal" value="{$system['affiliates_min_withdrawal']}">
                        <span class="form-text">
                            {__("The minimum amount of money so user can send a withdrawal request")}
                        </span>
                    </div>
                </div>

                <div class="form-group form-row">
                    <label class="col-md-3 form-control-label">
                        {__("Payment Type")}
                    </label>
                    <div class="col-md-9">
                        <div class="custom-control custom-radio custom-control-inline">
                            <input type="radio" name="affiliate_payment_type" id="affiliate_fixed" value="fixed" class="custom-control-input" {if $system['affiliate_payment_type'] == "fixed"}checked{/if}>
                            <label class="custom-control-label" for="affiliate_fixed">{__("Fixed Price/Referred")}</label>
                        </div>
                        <div class="custom-control custom-radio custom-control-inline">
                            <input type="radio" name="affiliate_payment_type" id="affiliate_percentage" value="percentage" class="custom-control-input" {if $system['affiliate_payment_type'] == "percentage"}checked{/if}>
                            <label class="custom-control-label" for="affiliate_percentage">{__("Percentage")} (%)</label>
                        </div>
                        <span class="form-text">
                            {__("Percentage will work only with pro packages")}
                        </span>
                    </div>
                </div>

                <div class="form-group form-row">
                    <label class="col-md-3 form-control-label">
                        {__("Price/Referred")} ({$system['system_currency']})
                    </label>
                    <div class="col-md-9">
                        <input type="text" class="form-control" name="affiliates_per_user" value="{$system['affiliates_per_user']}">
                        <span class="form-text">
                            {__("The price for each new referred user")}
                        </span>
                    </div>
                </div>

                <div class="form-group form-row">
                    <label class="col-md-3 form-control-label">
                        {__("Percentage")} (%)
                    </label>
                    <div class="col-md-9">
                        <input type="text" class="form-control" name="affiliates_percentage" value="{$system['affiliates_percentage']}">
                        <span class="form-text">
                            {__("The percentage from package price for each new referred user registered and bought pro package")}
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
                            <th>{__("Referrals")}</th>
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
                                    <span class="text-link" data-toggle="modal" data-url="admin/referrals.php?user_id={$row['user_id']}">
                                        {__("Show")}
                                    </span>
                                </td>
                                <td>
                                    <button data-toggle="tooltip" data-placement="top" title='{__("Mark as Paid")}' class="btn btn-sm btn-icon btn-rounded btn-success js_admin-withdraw" data-type="affiliates" data-handle="approve" data-id="{$row['payment_id']}">
                                            <i class="fa fa-check"></i>
                                    </button>
                                    <button data-toggle="tooltip" data-placement="top" title='{__("Decline")}' class="btn btn-sm btn-icon btn-rounded btn-danger js_admin-withdraw" data-type="affiliates" data-handle="decline" data-id="{$row['payment_id']}">
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