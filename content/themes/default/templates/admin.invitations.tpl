{if $view == "generate"}
	<div class="modal-header">
        <h6 class="modal-title">{__("New Invitation Code")}</h6>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
        </button>
	</div>
	<div class="modal-body text-center">
	    <div class="text-readable">
	        {__("Your invitation code is")}
	    </div>
        <h3><span class="badge badge-warning">{$code}</span></h3>
	</div>
{elseif $view == "prepare_email"}
	<div class="modal-header">
        <h6 class="modal-title">{__("Send Invitation Code")}</h6>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
        </button>
	</div>
    <form class="js_ajax-forms" data-url="admin/invitations.php?do=send_email">
        <div class="modal-body">
            <div class="form-group">
                <label class="form-control-label">{__("Email")}</label>
                <div class="input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text"><i class="fas fa-envelope"></i></span>
                    </div>
                    <input name="email" id="email" type="email" class="form-control" required autofocus>
                    <input type="hidden" name="code" value="{$code}">
                </div>
                <span class="form-text">
                    {__("To which email address you want to send this invitation code")}: <span class="badge badge-warning text-lg">{$code}</strong>
                </span>
            </div>

            <!-- success -->
            <div class="alert alert-success mb0 x-hidden"></div>
            <!-- success -->

            <!-- error -->
            <div class="alert alert-danger mb0 x-hidden"></div>
            <!-- error -->
        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-light" data-dismiss="modal">{__("Cancel")}</button>
            <button type="submit" class="btn btn-success">{__("Send")}</button>
        </div>
    </form>
{/if}
