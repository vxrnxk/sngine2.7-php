<div class="card">
    <div class="card-header with-icon">
        <i class="fa fa-paper-plane mr10"></i>{__("Newsletter")}
    </div>

    <!-- Newsletter -->
    <form class="js_ajax-forms " data-url="admin/newsletter.php">
        <div class="card-body">
            <div class="form-table-row">
                <div>
                    <div class="form-control-label h6">{__("Is HTML")}</div>
                    <div class="form-text d-none d-sm-block">{__("The message will be sent as HTML instead of plain text")}</div>
                </div>
                <div class="text-right">
                    <label class="switch" for="is_html">
                        <input type="checkbox" name="is_html" id="is_html">
                        <span class="slider round"></span>
                    </label>
                </div>
            </div>

            <div class="form-table-row">
                <div>
                    <div class="form-control-label h6">{__("Test Message")}</div>
                    <div class="form-text d-none d-sm-block">{__("The message will sent to Website Email only")}</div>
                </div>
                <div class="text-right">
                    <label class="switch" for="is_test">
                        <input type="checkbox" name="is_test" id="is_test">
                        <span class="slider round"></span>
                    </label>
                </div>
            </div>

            <div class="form-group form-row">
                <label class="col-md-3 form-control-label">
                    {__("Send to")}
                </label>
                <div class="col-sm-9">
                    <select class="form-control" name="to">
                        <option value="all">{__("All Users")}</option>
                        <option value="active">{__("Active Users")}</option>
                        <option value="inactive">{__("Inactive Users")}</option>
                    </select>
                </div>
            </div>

            <div class="form-group form-row">
                <label class="col-md-3 form-control-label">
                    {__("Subject")}
                </label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" name="subject">
                </div>
            </div>
            
            <div class="form-group form-row">
                <label class="col-md-3 form-control-label">
                    {__("Message")}
                </label>
                <div class="col-sm-9">
                    <textarea class="form-control" rows="10" name="message"></textarea>
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
            <button type="submit" class="btn btn-success">
                <i class="fa fa-paper-plane mr10"></i>{__("Send")}
            </button>
        </div>
    </form>
    <!-- Newsletter -->

</div>