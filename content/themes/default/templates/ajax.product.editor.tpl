<div class="modal-header">
    <h6 class="modal-title">
        <i class="fa fa-shopping-cart mr5"></i>{__("Edit Product")}
    </h6>
    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
        <span aria-hidden="true">&times;</span>
    </button>
</div>
<form class="js_ajax-forms" data-url="posts/edit.php">
    <div class="modal-body">
        <div class="row">
            <div class="form-group col-md-8">
                <label class="form-control-label">{__("Product Name")}</label>
                <input type="hidden" name="handle" value="product">
                <input type="hidden" name="id" value="{$post['post_id']}">
                <input name="name" type="text" class="form-control" value="{$post['product']['name']}">
            </div>
            <div class="form-group col-md-4">
                <label class="form-control-label">{__("Price")}</label>
                <input name="price" type="text" class="form-control" value="{$post['product']['price']}">
            </div>
        </div>
        <div class="row">
            <div class="form-group col-md-8">
                <label class="form-control-label">{__("Category")}</label>
                <select name="category" class="form-control">
                    {foreach $market_categories as $category}
                        <option {if $post['product']['category_id'] == $category['category_id']}selected{/if} value="{$category['category_id']}">{__($category['category_name'])}</option>
                    {/foreach}
                </select>
            </div>
            <div class="form-group col-md-4">
                <label class="form-control-label">{__("Status")}</label>
                <select name="status" class="form-control">
                    <option {if $post['product']['status'] == "new"}selected{/if} value="new">{__("New")}</option>
                    <option {if $post['product']['status'] == "old"}selected{/if} value="old">{__("Used")}</option>
                </select>
            </div>
        </div>
        <div class="form-group">
            <label class="form-control-label">{__("Location")}</label>
            <input name="location" type="text" class="form-control js_geocomplete" value="{$post['product']['location']}">
        </div>
        <div class="form-group">
            <label class="form-control-label">{__("Description")}</label>
            <textarea name="message" rows="5" dir="auto" class="form-control">{$post['text_plain']}</textarea>
        </div>
        <!-- error -->
        <div class="alert alert-danger mb0 x-hidden"></div>
        <!-- error -->
    </div>
    <div class="modal-footer">
        <button type="button" class="btn btn-light" data-dismiss="modal">{__("Cancel")}</button>
        <button type="submit" class="btn btn-primary">{__("Save")}</button>
    </div>
</form>