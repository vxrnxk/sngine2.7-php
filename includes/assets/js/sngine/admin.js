/**
 * admin js
 * 
 * @package Sngine
 * @author Zamblek
 */

// initialize API URLs
api['admin/delete']  = ajax_path+"admin/delete.php";
api['admin/test']  = ajax_path+"admin/test.php";
api['admin/verify']  = ajax_path+"admin/verify.php";
api['admin/bank']  = ajax_path+"admin/bank.php";
api['admin/withdraw']  = ajax_path+"admin/withdraw.php";
api['admin/tagify']  = ajax_path+"admin/tagify.php";


$(function() {

    // run tagify
    $('.js_tagify').tagify({
        duplicates: false,
        addTagOnBlur: false
    })
    .on("input", function(e, tagName) {
        var _tagify = $(this).data('tagify');
        _tagify.settings.enforceWhitelist = true;
        $.post(api['admin/tagify'], {'query': tagName, 'handle': $(this).data('handle')}, function(response) {
            /* check the response */
            if(response.callback) {
                eval(response.callback);
            } else {
                if(response.list !== undefined) {
                    _tagify.settings.whitelist = $.parseJSON(response.list);
                    _tagify.dropdown.show.call(_tagify, tagName);
                }
            }
        }, 'json')
        .fail(function() {
            modal('#modal-message', {title: __['Error'], message: __['There is something that went wrong!']});
        });
    });


    // run colorpicker plugin
    $('.js_colorpicker').colorpicker({
        format: 'hex'
    });


    // run treegrid
    $('.js_treegrid').treegrid();


    // run admin deleter
    $('body').on('click', '.js_admin-deleter', function () {
        var handle = $(this).data('handle');
        var id = $(this).data('id');
        var node = $(this).data('node');
        var redirect_url = $(this).data("redirect");
        confirm(__['Delete'], __['Are you sure you want to delete this?'], function() {
            $.post(api['admin/delete'], {'handle': handle, 'id': id, 'node': node}, function(response) {
                /* check the response */
                if(response.callback) {
                    eval(response.callback);
                } else {
                    if(redirect_url !== undefined) {
                        window.location = redirect_url;
                    } else {
                        window.location.reload();
                    }
                }
            }, 'json')
            .fail(function() {
                modal('#modal-message', {title: __['Error'], message: __['There is something that went wrong!']});
            });
        });
    });


    // run admin tester
    $('body').on('click', '.js_admin-tester', function () {
        var _this = $(this);
        var _parent = _this.parents('form');
        var error =  _parent.find('.alert.alert-danger');
        var success =  _parent.find('.alert.alert-success');
        var handle = _this.data('handle');
        /* show loading */
        _this.data('text', _this.html());
        _this.prop('disabled', true);
        _this.html('<span class="spinner-grow spinner-grow-sm mr10"></span>'+__['Loading']);
        $.post(api['admin/test'], {'handle': handle}, function(response) {
            /* hide loading */
            _this.prop('disabled', false);
            _this.html(_this.data('text'));
            /* handle response */
            if(response.error) {
                if(success.is(":visible")) success.hide(); // hide previous alert
                error.html(response.message).slideDown();
            } else if(response.success) {
                if(error.is(":visible")) error.hide(); // hide previous alert
                success.html(response.message).slideDown();
            } else {
                eval(response.callback);
            }
        }, 'json')
        .fail(function() {
            /* hide loading */
            _this.prop('disabled', false);
            _this.html(_this.data('text'));
            /* handle error */
            if(success.is(":visible")) success.hide(); // hide previous alert
            error.html(__['There is something that went wrong!']).slideDown();
        });
    });


    // run admin verification
    $('body').on('click', '.js_admin-verification-documents', function () {
        modal('#verification-documents', {'photo': $(this).data('photo'), 'passport': $(this).data('passport'), 'message': $(this).data('message'), 'handle': $(this).data('handle'), 'node-id': $(this).data('node-id'), 'request-id': $(this).data('request-id')}, 'large');
    });
    $('body').on('click', '.js_admin-verify', function () {
        var handle = $(this).data('handle');
        var id = $(this).data('id');
        confirm(__['Verify'], __['Are you sure you want to verify this request?'], function() {
            $.post(api['admin/verify'], {'handle': handle, 'id': id}, function(response) {
                /* check the response */
                if(response.callback) {
                    eval(response.callback);
                } else {
                    window.location.reload();
                }
            }, 'json')
            .fail(function() {
                modal('#modal-message', {title: __['Error'], message: __['There is something that went wrong!']});
            });
        });
    });
    $('body').on('click', '.js_admin-unverify', function () {
        var id = $(this).data('id');
        confirm(__['Decline'], __['Are you sure you want to decline this request?'], function() {
            $.post(api['admin/verify'], {'handle': 'decline', 'id': id}, function(response) {
                /* check the response */
                if(response.callback) {
                    eval(response.callback);
                } else {
                    window.location.reload();
                }
            }, 'json')
            .fail(function() {
                modal('#modal-message', {title: __['Error'], message: __['There is something that went wrong!']});
            });
        });
    });


    // run admin bank transfer
    $('body').on('click', '.js_admin-bank-accept', function () {
        var id = $(this).data('id');
        confirm(__['Verify'], __['Are you sure you want to verify this request?'], function() {
            $.post(api['admin/bank'], {'action': "accept", 'id': id}, function(response) {
                /* check the response */
                if(response.callback) {
                    eval(response.callback);
                } else {
                    window.location.reload();
                }
            }, 'json')
            .fail(function() {
                modal('#modal-message', {title: __['Error'], message: __['There is something that went wrong!']});
            });
        });
    });
    $('body').on('click', '.js_admin-bank-decline', function () {
        var id = $(this).data('id');
        confirm(__['Decline'], __['Are you sure you want to decline this request?'], function() {
            $.post(api['admin/bank'], {'action': 'decline', 'id': id}, function(response) {
                /* check the response */
                if(response.callback) {
                    eval(response.callback);
                } else {
                    window.location.reload();
                }
            }, 'json')
            .fail(function() {
                modal('#modal-message', {title: __['Error'], message: __['There is something that went wrong!']});
            });
        });
    });


    // run admin withdraw
    $('body').on('click', '.js_admin-withdraw', function () {
        var type = $(this).data('type');
        var handle = $(this).data('handle');
        var id = $(this).data('id');
        if(handle == "approve") {
            var _title = __['Mark as Paid'];
            var _message = __['Are you sure you want to approve this request?'];
        } else {
            var _title = __['Decline'];
            var _message = __['Are you sure you want to decline this request?'];
        }
        confirm(_title, _message, function() {
            $.post(api['admin/withdraw'], {'type': type, 'handle': handle, 'id': id}, function(response) {
                /* check the response */
                if(response.callback) {
                    eval(response.callback);
                } else {
                    window.location.reload();
                }
            }, 'json')
            .fail(function() {
                modal('#modal-message', {title: __['Error'], message: __['There is something that went wrong!']});
            });
        });
    });


    // handle input dependencies
    /* custom fields */
    $('#js_field-for').on('change', function() {
        if($(this).val() == "user") {
            $('#js_field-place').fadeIn();
        } else {
            $('#js_field-place').hide();
        }
    });
    $('#js_field-type').on('change', function() {
        if($(this).val() == "selectbox") {
            $('#js_field-select-options').fadeIn();
        } else {
            $('#js_field-select-options').hide();
        }
    });
    /* colored posts */
    $('.js_pattern-type').on('change', function() {
        if($(this).val() == "color") {
            $('#js_pattern-type-image').hide();
            $('#js_pattern-type-color').fadeIn();
            $('.js_pattern-preview').css("backgroundImage", "linear-gradient(45deg, "+$('.js_pattern-background-color-1').val()+", "+$('.js_pattern-background-color-2').val()+")");
        } else {
            $('#js_pattern-type-image').fadeIn();
            $('#js_pattern-type-color').hide();
            $('.js_pattern-preview').css("backgroundImage", "url("+uploads_path+"/"+$('.js_pattern-background-image').val()+")");
            
        }
    });
    $('.js_pattern-background-color-1').on('change', function() {
        $('.js_pattern-preview').css("backgroundImage", "linear-gradient(45deg, "+$(this).val()+", "+$('.js_pattern-background-color-2').val()+")");
    });
    $('.js_pattern-background-color-2').on('change', function() {
        $('.js_pattern-preview').css("backgroundImage", "linear-gradient(45deg, "+$('.js_pattern-background-color-1').val()+", "+$(this).val()+")");
    });
    $('.js_pattern-background-image').on('change propertychange', function() {
        $('.js_pattern-preview').css("backgroundImage", "url("+uploads_path+"/"+$(this).val()+")");
    });
    $('.js_pattern-text-color').on('change', function() {
        $('.js_pattern-preview').find('h2').css("color", $(this).val());
    });
    /* custom withdrawal method */
    $('#js_custome-withdrawal').on('click', function() {
        if($(this).find("input").is(":checked")) {
            $('#js_custome-withdrawal-name').fadeIn();
        } else {
            $('#js_custome-withdrawal-name').hide();
        }
    });

});