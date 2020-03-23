/**
 * user js
 * 
 * @package Sngine
 * @author Zamblek
 */

// initialize API URLs
/* data */
api['data/live']  = ajax_path+"data/live.php";
api['data/upload']  = ajax_path+"data/upload.php";
api['data/reset']  = ajax_path+"data/reset.php";
api['data/report']  = ajax_path+"data/report.php";
/* users */
api['users/image_delete']  = ajax_path+"users/image_delete.php";
api['users/image_crop']  = ajax_path+"users/image_crop.php";
api['users/image_position']  = ajax_path+"users/image_position.php";
api['users/connect']  = ajax_path+"users/connect.php";
api['users/delete']  = ajax_path+"users/delete.php";
api['users/session']  = ajax_path+"users/session.php";
api['users/location']  = ajax_path+"users/location.php";
api['users/popover']   = ajax_path+"users/popover.php";
api['users/mention']  = ajax_path+"users/mention.php";
api['users/settings']  = ajax_path+"users/settings.php";
api['users/autocomplete']  = ajax_path+"users/autocomplete.php";
/* pages_groups_events */
api['pages_groups_events/delete']  = ajax_path+"pages_groups_events/delete.php";
/* ads */
api['ads/campaign']  = ajax_path+"ads/campaign.php";
/* developers */
api['developers/app']  = ajax_path+"developers/app.php";


// initialize the modal plugins
function initialize_modal() {
    // run Sngine scroll
    $('.js_scroller').each(function(){
        var _this = $(this);
        var ini_height = _this.attr('data-slimScroll-height') || '280px';
        var ini_start = _this.attr('data-slimScroll-start') || 'top';
        /* return if the scroll already running  */
        if(_this.parent().hasClass('custom-scrollbar')) {
            //return;
        }
        /* run if not */
        _this.parent().addClass('custom-scrollbar');
        _this.css({"overflow-y": "auto", "height": ini_height});
        if(ini_start == "bottom") {
            _this.scrollTop(_this.height());
        }
    });
    // run geocomplete plugin
    if(geolocation_enabled) {
        $(".js_geocomplete").geocomplete();
    }
    // run bootstrap selectpicker plugin
    if($(".selectpicker").length > 0) {
        $('.selectpicker').selectpicker({
            style: 'btn-outline-light'
        });
    }
    // run datetimepicker plugin
    if($(".js_datetimepicker").length > 0) {
        $('.js_datetimepicker').datetimepicker({
            format: system_datetime_format,
            locale: $('html').attr('lang').split("_", 1).toString() || 'en'
        });
    }
    // run uploader 
    initialize_uploader();
}


// initialize uploader
function initialize_uploader() {
    $('.js_x-uploader').each(function(index) {
        /* return if the plugin already running  */
        if($(this).parents('form.x-uploader').length > 0) {
            return;
        }
        var multiple = ($(this).data('multiple') !== undefined)? true : false;
        if($(this).data('type') == "video") {
            var accept = accpeted_video_extensions;
        } else if ($(this).data('type') == "audio") {
            var accept = accpeted_audio_extensions;
        } else if ($(this).data('type') == "file") {
            var accept = accpeted_file_extensions;
        } else {
            var accept = ".png, .gif, .jpeg, .jpg";
        }
        $(this).before(render_template("#x-uploader", {'url': api['data/upload'], 'secret': secret, 'multiple': multiple, 'accept': accept}));
        $(this).prev().append($(this));
    });
}


// browser notification
function browser_notification(icon, body, url, tag) {
    /* check if the browser supports notifications */
    if(!("Notification" in window)) {
        return;
    }
    /* check whether notification permissions have alredy been granted */
    if(Notification.permission !== "granted") {
        /* request permission */
        Notification.requestPermission();
    } else {
        /* send notification */
        var notification = new Notification(site_title, {
            icon: icon,
            body: body,
            tag: tag
        });
        notification.onclick = function () {
            window.open(url);
            notification.close();
        };
    }
}


// browser location
function update_location(position) {
    if(!position) {
        return false;
    }
    $.post(api['users/location'], {latitude: position.coords.latitude, longitude: position.coords.longitude}, function(response) {
        return true;
    }, 'json');
}


// noty notification
function noty_notification(image, message, url) {
    new Noty({
        type: 'info',
        layout: 'bottomLeft',
        progressBar: 'true',
        closeWith: ['click', 'button'],
        timeout: "5000",
        text: render_template('#noty-notification', {'image': image, 'message': message}),
        callbacks: {
            onClick: function() {
                window.location.href = url;
            }
        }
    }).show();
}


// notification highlighter
function notification_highlighter() {
    try {
        var search_params = new URLSearchParams(window.location.search);
        var notify_id = search_params.get("notify_id");
    } catch(err) {
        var notify_id = get_parameter_by_name("notify_id");
    }
    if(notify_id) {
        var _elem = $('#'+notify_id);
        if(_elem.length > 0) {
            $('html, body').animate({
                scrollTop: _elem.offset().top
            }, 1000);
            _elem.find('.js_notifier-flasher:first').addClass("x-notifier");
            setTimeout(function() {
                _elem.find('.js_notifier-flasher:first').removeClass("x-notifier");
                }, '2500');
        }
    }
}


// data heartbeat
function data_heartbeat() {
    var data = {};
    data['last_request'] = $(".js_live-requests").find(".js_scroller li:first").data('id') || 0;
    data['last_message'] = $(".js_live-messages").find(".js_scroller li:first").data('last-message') || 0;
    data['last_notification'] = $(".js_live-notifications").find(".js_scroller li:first").data('id') || 0;
    /* newsfeed check */
    var posts_stream =  $('.js_posts_stream');
    /* "popular" && "saved" & "memories" excluded as not ordered by id */
    if(posts_stream.length > 0 && posts_stream.data('get') != 'popular' && posts_stream.data('get') != 'saved' && posts_stream.data('get') != 'memories' && posts_stream.data('loading') === undefined) {
        data['last_post'] = posts_stream.find("li:first .post").data('id') || 0;
        data['get'] = posts_stream.data('get');
        data['filter'] = posts_stream.data('filter');
        data['id'] = posts_stream.data('id');
    }
    $.post(api['data/live'], data, function(response) {
        if(response.callback) {
            eval(response.callback);
        } else {
            if(response.requests) {
                if($(".js_live-requests").find(".js_scroller ul").length > 1) {
                    $(".js_live-requests").find(".js_scroller ul:first").prepend(response.requests);
                } else {
                    $(".js_live-requests").find(".js_scroller p:first").replaceWith("<ul>"+response.requests+"</ul>");
                }
                var requests = parseInt($(".js_live-requests").find("span.counter").text()) + response.requests_count;
                $(".js_live-requests").find("span.counter").text(requests).show();
                if(notifications_sound) {
                    $("#notification-sound")[0].play();    
                }
            }
            if(response.conversations) {
                $(".js_live-messages").find(".js_scroller").html("<ul>"+response.conversations+"</ul>");
                /* update live messages in messages page */
                if(window.location.pathname.indexOf("messages") != -1) {
                    if($(".js_live-messages-alt").find(".js_scroller ul").length > 0) {
                        $(".js_live-messages-alt").find(".js_scroller ul").html(response.conversations);
                    } else {
                        $(".js_live-messages-alt").find(".js_scroller").html("<ul>"+response.conversations+"</ul>");
                    }
                }
                if(response.conversations_count > 0) {
                    $(".js_live-messages").find("span.counter").text(response.conversations_count).show();
                    if(chat_sound) {
                        $("#chat-sound")[0].play();
                    }
                } else {
                    $(".js_live-messages").find("span.counter").text(response.conversations_count);
                }
            }
            if(response.notifications) {
                $.each(response.notifications_json, function(index, element) {
                    /* send browser notifications */
                    if(browser_notifications_enabled) {
                        browser_notification(element.user_picture, element.full_message, element.url, element.notification_id);
                    }
                    /* send noty notifications */
                    if(noty_notifications_enabled) {
                        noty_notification(element.user_picture, element.full_message, element.url);
                    }
                });
                if($(".js_live-notifications").find(".js_scroller ul").length > 0) {
                    $(".js_live-notifications").find(".js_scroller ul").prepend(response.notifications);
                } else {
                    $(".js_live-notifications").find(".js_scroller").html("<ul>"+response.notifications+"</ul>");
                }
                var notifications = parseInt($(".js_live-notifications").find("span.counter").text()) + response.notifications_count;
                $(".js_live-notifications").find("span.counter").text(notifications).show();
                if(notifications_sound) {
                    $("#notification-sound")[0].play();
                }
            }
            if(response.posts) {
                posts_stream.find('ul:first').prepend(response.posts);
                setTimeout(photo_grid(), 200);
            }
            setTimeout('data_heartbeat();',min_data_heartbeat);
        }
    }, 'json');
}


// initialize picture crop
function init_picture_crop(node) {
    setTimeout(function () {
        $('#cropped-profile-picture').rcrop({
            minSize : [200,200],
            preserveAspectRatio : true,
            grid : true
        });
    }, 200);
    modal('#crop-profile-picture', {'image': node.data('image'), 'handle': node.data('handle'), 'id': node.data('id')});
}


// initialize picture position
function init_picture_position() {
    /* hide profile cover buttons */
    $('.profile-cover-change').hide();
    $('.profile-cover-position').hide();
    $('.profile-cover-delete').hide();
    $('.profile-buttons-wrapper').hide();
    /* hide cropped cover */
    $('.js_position-cover-cropped').hide();
    /* hide profile cover position buttons */
    $('.profile-cover-position-loader').show();
    $('.profile-cover-position-buttons').show();
    /* show full cover */
    $('.js_position-cover-full').show();
    /* init imagedrag with init-position value */
    var position = $('.js_position-cover-cropped').data('init-position');
    $('.profile-cover-wrapper').imagedrag({
        position: position,
        input: ".js_position-picture-val"
    });
}


$(function() {

    // run sticky-sidebar
    $('.js_sticky-sidebar').theiaStickySidebar({
        additionalMarginTop: 66,
        minWidth: 768
    });


    // run slick slider
    if($(".js_slick").length > 0) {
        $('.js_slick').slick({
            rtl: theme_dir_rtl,
            centerMode: true,
            centerPadding: '0',
            slidesToShow: 3,
            slidesToScroll: 1,
            autoplay: true,
            autoplaySpeed: 2000,
            arrows: false,
            speed: 900,
            responsive: [
            {
                breakpoint: 1200,
                settings: {
                    slidesToShow: 3
                }
            },
            {
                breakpoint: 992,
                settings: {
                    slidesToShow: 5
                }
            },
            {
                breakpoint: 768,
                settings: {
                    slidesToShow: 5
                }
            },
            {
                breakpoint: 520,
                settings: {
                    slidesToShow: 5
                }
            },
            {
                breakpoint: 420,
                settings: {
                    slidesToShow: 3
                }
            },
            {
                breakpoint: 340,
                settings: {
                    slidesToShow: 3
                }
            }
            ]
        });
    }


    // run DataTable
    if($(".js_dataTable").length > 0) {
        $('.js_dataTable').DataTable();
    }
    

    // init geocomplete plugin
    if(geolocation_enabled) {
        $(".js_geocomplete").geocomplete();
    }


    // init datetimepicker plugin
    if($(".js_datetimepicker").length > 0) {
        $('.js_datetimepicker').datetimepicker({
            format: system_datetime_format,
            locale: $('html').attr('lang').split("_", 1).toString() || 'en'
        });
    }


    // init bootstrap selectpicker plugin
    if($(".selectpicker").length > 0) {
        $('.selectpicker').selectpicker({
            style: 'btn-outline-light'
        });
    }


    // init tinymce
    if($(".js_wysiwyg").length > 0) {
        tinymce.init({
            selector: '.js_wysiwyg',
            branding: false,
            height: 300,
            relative_urls : false,
            remove_script_host : false,
            convert_urls : true,
            toolbar: 'insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image  uploadImages |  preview media fullpage | forecolor backcolor | ltr rtl',
            plugins: [
                'advlist autolink link image  lists charmap  preview hr anchor pagebreak spellchecker',
                'searchreplace wordcount visualblocks visualchars code fullscreen insertdatetime media nonbreaking',
                'save table directionality template paste'
            ]
        });
    }
    if($(".js_wysiwyg-advanced").length > 0) {
        tinymce.init({
            selector: '.js_wysiwyg-advanced',
            branding: false,
            height: 300,
            relative_urls : false,
            remove_script_host : false,
            convert_urls : true,
            toolbar: 'insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image  uploadImages |  preview media fullpage | forecolor backcolor | ltr rtl',
            plugins: [
                'advlist autolink link image  lists charmap  preview hr anchor pagebreak spellchecker',
                'searchreplace wordcount visualblocks visualchars code fullscreen insertdatetime media nonbreaking',
                'save table directionality template paste'
            ],
            extended_valid_elements : "script[src|async|defer|type|charset]"
        });
    }


    // init browser notifications
    if(browser_notifications_enabled) {
        if(("Notification" in window)) {
            if(Notification.permission !== "granted") {
                Notification.requestPermission();
            }
        }
    }


    // init browser location
    if(navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(update_location);
    }


    // run notification highlighter
    notification_highlighter();


    // run data heartbeat
    data_heartbeat();


    // run autocomplete
    /* focus the input */
    $('body').on('click', '.js_autocomplete', function() {
        var input = $(this).find('input').focus();
    });
    /* show and get the results if any */
    $('body').on('keyup', '.js_autocomplete input', function() {
        var _this = $(this);
        var query = _this.val();
        var parent = _this.parents('.js_autocomplete');
        /* check the query string */
        if(query != '') {
            /* check if results dropdown-menu not exist */
            if(_this.next('.dropdown-menu').length == 0) {
                /* construct a new one */
                var offset = _this.offset();
                var posX = offset.left - $(window).scrollLeft();
                if($(window).width() - posX < 180) {
                    _this.after('<div class="dropdown-menu auto-complete tl"></div>');
                } else {
                    _this.after('<div class="dropdown-menu auto-complete"></div>');
                }
            }
            $.post(api['users/autocomplete'], {'type': 'single', 'query': query}, function(response) {
                if(response.callback) {
                    eval(response.callback);
                } else if(response.autocomplete) {
                    _this.next('.dropdown-menu').show().html(response.autocomplete);
                }
            }, 'json');
        } else {
            /* check if results dropdown-menu already exist */
            if(_this.next('.dropdown-menu').length > 0) {
                _this.next('.dropdown-menu').hide();
            }
        }
    });
    /* show previous results dropdown-menu when the input is clicked */
    $('body').on('click focus', '.js_autocomplete input', function() {
        /* only show again if the input & dropdown-menu are not empty */
        if($(this).val() != '' && $(this).next('.dropdown-menu').find('li').length > 0) {
            $(this).next('.dropdown-menu').show();
        }
    });
    /* hide the results dropdown-menu when clicked outside the input */
    $('body').on('click', function(e) {
        if(!$(e.target).is(".js_autocomplete")) {
            $('.js_autocomplete .dropdown-menu').hide();
        }
    });
    /* add result */
    $('body').on('click', '.js_autocomplete-add', function() {
        var uid = $(this).data('uid');
        var name = $(this).data('name');
        var parent = $(this).parents('.js_autocomplete');
        parent.find('input').val(name).data('uid', uid);
        parent.find('input[type="hidden"]').val(uid);
    });

    
    // run autocomplete tags
    /* focus the input */
    $('body').on('click', '.js_autocomplete-tags', function() {
        var input = $(this).find('input').focus();
    });
    /* show and get the results if any */
    $('body').on('keyup', '.js_autocomplete-tags input', function() {
        var _this = $(this);
        var query = _this.val();
        var parent = _this.parents('.js_autocomplete-tags');
        /* change the width of typehead input */
        prev_length = _this.data('length') || 0;
        new_length = query.length;
        if(new_length > prev_length && _this.width() < 250) {
            _this.width(_this.width()+6);
        } else if(new_length < prev_length) {
            _this.width(_this.width()-6);
        }
        _this.data('length', query.length);
        /* check maximum number of tags */
        if(parent.find('ul.tags li').length > 9) {
            return;
        }
        /* check the query string */
        if(query != '') {
            /* check if results dropdown-menu not exist */
            if(_this.next('.dropdown-menu').length == 0) {
                /* construct a new one */
                var offset = _this.offset();
                var posX = offset.left - $(window).scrollLeft();
                if($(window).width() - posX < 180) {
                    _this.after('<div class="dropdown-menu auto-complete tl"></div>');
                } else {
                    _this.after('<div class="dropdown-menu auto-complete"></div>');
                }
            }
            /* get skipped ids */
            var skipped_ids = [];
            $.each(parent.find('ul.tags li'), function(i,tag) {
                skipped_ids.push($(tag).data('uid'));
            });
            $.post(api['users/autocomplete'], {'type': 'tags', 'query': query, 'skipped_ids': JSON.stringify(skipped_ids)}, function(response) {
                if(response.callback) {
                    eval(response.callback);
                } else if(response.autocomplete) {
                    _this.next('.dropdown-menu').show().html(response.autocomplete);
                }
            }, 'json');
        } else {
            /* check if results dropdown-menu already exist */
            if(_this.next('.dropdown-menu').length > 0) {
                _this.next('.dropdown-menu').hide();
            }
        }
    });
    /* show previous results dropdown-menu when the input is clicked */
    $('body').on('click focus', '.js_autocomplete-tags input', function() {
        /* check maximum number of tags */
        if($(this).parents('.js_autocomplete-tags').find('ul.tags li').length > 9) {
            return;
        }
        /* only show again if the input & dropdown-menu are not empty */
        if($(this).val() != '' && $(this).next('.dropdown-menu').find('li').length > 0) {
            $(this).next('.dropdown-menu').show();
        }
    });
    /* hide the results dropdown-menu when clicked outside the input */
    $('body').on('click', function(e) {
        if(!$(e.target).is(".js_autocomplete-tags")) {
            $('.js_autocomplete-tags .dropdown-menu').hide();
        }
    });
    /* add a tag */
    $('body').on('click', '.js_tag-add', function() {
        var uid = $(this).data('uid');
        var name = $(this).data('name');
        var parent = $(this).parents('.js_autocomplete-tags');
        var tag = '<li data-uid="'+uid+'">'+name+'<button type="button" class="close js_tag-remove" title="'+__['Remove']+'"><span>&times;</span></button></li>'
        parent.find('.tags').append(tag);
        parent.find('input').val('').focus();
        /* check if there is chat-form next to js_autocomplete-tags */
        if(parent.siblings('.chat-form').length > 0) {
            if(parent.find('ul.tags li').length == 0) {
                if(!parent.siblings('.chat-form').hasClass('invisible')) {
                    parent.siblings('.chat-form').addClass('invisible');
                }
            } else {
                parent.siblings('.chat-form').removeClass('invisible');
            }
        }
    });
    /* remove a tag */
    $('body').on('click', '.js_tag-remove', function() {
        var tag = $(this).parents('li');
        var parent = $(this).parents('.js_autocomplete-tags');
        tag.remove();
        /* check if there is chat-form next to js_autocomplete-tags */
        if(parent.siblings('.chat-form').length > 0) {
            if(parent.find('ul.tags li').length == 0) {
                if(!parent.siblings('.chat-form').hasClass('invisible')) {
                    parent.siblings('.chat-form').addClass('invisible');
                }
            } else {
                parent.siblings('.chat-form').removeClass('invisible');
            }
        }
        return false;
    });


    // run @mention
    $('body').on('focus', '.js_mention', function() {
        $(this).triggeredAutocomplete({
            hidden: '#hidden_inputbox',
            source: api['users/mention'],
            trigger: "@",
            maxLength: 20
        });
    });


    // run user-popover
    $('body').on('mouseenter', '.js_user-popover', function() {
        /* do not run if window size < 768px */
        if($(window).width() < 751) {
            return;
        }
        var _this = $(this);
        var uid = _this.data('uid');
        var type = _this.data('type') || 'user';
        var _timeout = setTimeout(function() {
            var offset = _this.offset();
            var posY = (offset.top - $(window).scrollTop()) + _this.height();
            var posX = offset.left - $(window).scrollLeft();
            if($('html').attr('dir') == "RTL") {
                var available =  posX + _this.width();
                if(available < 400) {
                    $('body').append('<div class="user-popover-wrapper tl" style="position: fixed; top: '+posY+'px; left:'+posX+'px"><div class="user-popover-content ptb10 plr10"><div class="loader loader_small"></div></div></div>');
                } else {
                    var right = $(window).width() - available;
                    $('body').append('<div class="user-popover-wrapper tr" style="position: fixed; top: '+posY+'px; right:'+right+'px"><div class="user-popover-content ptb10 plr10"><div class="loader loader_small"></div></div></div>');
                }
            } else {
                var available = $(window).width() - posX;
                if(available < 400) {
                    var right = available - _this.width();
                    $('body').append('<div class="user-popover-wrapper tl" style="position: fixed; top: '+posY+'px; right:'+right+'px"><div class="user-popover-content ptb10 plr10"><div class="loader loader_small"></div></div></div>');
                } else {
                    $('body').append('<div class="user-popover-wrapper tr" style="position: fixed; top: '+posY+'px; left:'+posX+'px"><div class="user-popover-content ptb10 plr10"><div class="loader loader_small"></div></div></div>');
                }
            }
            $.getJSON(api['users/popover'], {'type': type, 'uid': uid} , function(response) {
                if(response.callback) {
                    eval(response.callback);
                } else {
                    if(response.popover) {
                        $('.user-popover-wrapper').html(response.popover);
                    }
                }
            });
        }, 1000);
        _this.data('timeout', _timeout);
    });
    $('body').on('mouseleave', '.js_user-popover', function(e) {
        var to = e.toElement || e.relatedTarget;
        if(!$(to).is(".user-popover-wrapper")) {
            clearTimeout($(this).data('timeout'));
            $('.user-popover-wrapper').remove();
        }
    });
    $('body').on('mouseleave', '.user-popover-wrapper', function() {
        $('.user-popover-wrapper').remove();
    });


    // run x-uploader
    /* initialize the uplodaer */
    initialize_uploader();
    $(document).ajaxComplete(function() {
        initialize_uploader();
    });
    /* initialize uploading */
    $('body').on('change', '.x-uploader input[type="file"]', function() {
        $(this).parent('.x-uploader').submit();
    });
    /* uploading */
    $('body').on('submit', '.x-uploader', function(e) {
        e.preventDefault;
        /* initialize AJAX options */
        var options = {
            dataType: "json",
            uploadProgress: _handle_progress,
            success: _handle_success,
            error: _handle_error,
            resetForm: true
        };
        options['data'] = {};
        /* get uploader input */
        var uploader = $(this).find('input[type="file"]');
        /* get type */
        var type = $(this).find('.js_x-uploader').data('type') || "photos";
        options['data']['type'] = type;
        /* get handle */
        var handle = $(this).find('.js_x-uploader').data('handle');
        if(handle === undefined) {
            return false;
        }
        options['data']['handle'] = handle;
        /* get multiple */
        var multiple = ($(this).find('.js_x-uploader').data('multiple') !== undefined)? true : false;
        options['data']['multiple'] = multiple;
        /* get id */
        var id = $(this).find('.js_x-uploader').data('id');
        if(id !== undefined) {
            options['data']['id'] = id;
        }
        /* check type */
        if(type == "photos") {
            /* check handle */
            if(handle == "cover-user" || handle == "cover-page" || handle == "cover-group" || handle == "cover-event") {
                var loader = $('.profile-cover-change-loader');
                loader.show();

            } else if(handle == "picture-user" || handle == "picture-page" || handle == "picture-group") {
                var loader = $('.profile-avatar-change-loader');
                loader.show();

            } else if(handle == "publisher") {
                var publisher = $(this).parents('.publisher');
                var files_num = uploader.get(0).files.length;
                /* check if there is current (scrabing|video|audio|file) process */
                if(publisher.data('scrabing') || publisher.data('video') || publisher.data('audio') || publisher.data('file')) {
                    return false;
                }
                /* check if there is already uploading process */
                if(!publisher.data('photos')) {
                    publisher.data('photos', {});
                }
                var attachments = publisher.find('.attachments');
                var loader = $('<ul></ul>').appendTo(attachments);
                attachments.show();
                for (var i = 0; i < files_num; ++i) {
                    $('<li class="loading"><div class="progress x-progress"><div class="progress-bar" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div></div></li>').appendTo(loader).show();
                }
                /* handle publisher tab */
                if(jQuery.isEmptyObject(publisher.data('photos'))) {
                    publisher_tab(publisher, type);
                }

            } else if(handle == "publisher-mini") {
                var publisher = $(this).parents('.publisher-mini');
                var files_num = uploader.get(0).files.length;
                /* check if there is already uploading process */
                if(!publisher.data('photos')) {
                    publisher.data('photos', {});
                }
                var attachments = publisher.find('.attachments[data-type="photos"]');
                var loader = $('<ul></ul>').appendTo(attachments);
                for (var i = 0; i < files_num; ++i) {
                    $('<li class="loading"><div class="progress x-progress"><div class="progress-bar" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div></div></li>').appendTo(loader).show();
                }

            } else if(handle == "comment") {
                var comment = $(this).parents('.comment');
                /* check if there is already uploading process */
                if(comment.data('photos')) {
                    return false;
                }
                var attachments = comment.find('.comment-attachments');
                var loader = attachments.find('li.loading');
                attachments.show();
                loader.show();

            } else if(handle == "chat") {
                var chat_widget = $(this).parents('.chat-widget, .panel-messages');
                /* check if there is already uploading process */
                if(chat_widget.data('photo')) {
                    return false;
                }
                var attachments = chat_widget.find('.chat-attachments');
                var loader = attachments.find('li.loading');
                attachments.show();
                loader.show();

            } else if(handle == "x-image") {
                var parent = $(this).parents('.x-image');
                var loader = parent.find('.x-image-loader');
                loader.show();

            }
        } else if (type == "video") {
            /* check handle */
            if(handle == "publisher") {
                var publisher = $(this).parents('.publisher');
                /* check if there is current (scrabing|photos|video|audio|file) process */
                if(publisher.data('scrabing') || publisher.data('photos') || publisher.data('video')  || publisher.data('audio') || publisher.data('file')) {
                    return false;
                }
                publisher.data(type, {});
                var attachments = publisher.find('.attachments');
                var loader = $('<ul></ul>').appendTo(attachments);
                attachments.show();
                $('<li class="loading"><div class="progress x-progress"><div class="progress-bar" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div></div></li>').appendTo(loader).show();
                /* handle publisher tab */
                publisher_tab(publisher, type);

            } else if(handle == "publisher-mini") {
                var publisher = $(this).parents('.publisher-mini');
                var files_num = uploader.get(0).files.length;
                /* check if there is already uploading process */
                if(!publisher.data(type)) {
                    publisher.data(type, {});
                }
                var attachments = publisher.find('.attachments[data-type="videos"]');
                var loader = $('<ul></ul>').appendTo(attachments);
                var files_names = [];
                for (var i = 0; i < files_num; ++i) {
                    files_names[i] = uploader.get(0).files[i].name;
                    $('<li class="loading"><div class="progress x-progress"><div class="progress-bar" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div></div></li>').appendTo(loader).show();
                }

            } else if(handle == "x-video") {
                var parent = $(this).parents('.x-image');
                var loader = parent.find('.x-image-loader');
                loader.show();

            }
        } else if (type == "audio" || type == "file") {
            /* check handle */
            if(handle == "publisher") {
                /* show upload loader */
                var publisher = $(this).parents('.publisher');
                /* check if there is current (scrabing|photos|video|audio|file) process */
                if(publisher.data('scrabing') || publisher.data('photos') || publisher.data('video')  || publisher.data('audio') || publisher.data('file')) {
                    return false;
                }
                publisher.data(type, {});
                var attachments = publisher.find('.attachments');
                var loader = $('<ul></ul>').appendTo(attachments);
                attachments.show();
                $('<li class="loading"><div class="progress x-progress"><div class="progress-bar" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div></div></li>').appendTo(loader).show();
                /* handle publisher tab */
                publisher_tab(publisher, type);

            }
        }
        /* handle progress */
        function _handle_progress(e) {
            /* disable uploader input during uploading */
            uploader.prop('disabled', true);
            /* get progress percent */
            var percent = parseInt((e.loaded / e.total * 100));
            /* add percent to loader progress bar */
            if(loader) loader.find('.progress-bar').css('width', percent+'%').attr('aria-valuenow', percent);
        }
        /* handle success */
        function _handle_success(response) {
            /* enable uploader input */
            uploader.prop('disabled', false);
            /* hide upload loader */
            if(loader) loader.hide();
            /* handle the response */
            if(response.callback) {
                if(handle == "publisher") {
                    /* hide the attachment from publisher */
                    if( (type == "photos" && jQuery.isEmptyObject(publisher.data('photos'))) || type != "photos" ) {
                        /* hide attachments */
                        attachments.hide();
                        /* remove the type object from publisher data */
                        publisher.removeData(type);
                        /* handle publisher tab */
                        publisher_tab(publisher, type);
                    }
                    /* remove upload loader */
                    if(loader) loader.remove();
                }
                eval(response.callback);
            } else {
                /* check type */
                if(type == "photos") {
                    /* check the handle */
                    if(handle == "cover-user" || handle == "cover-page" || handle == "cover-group" || handle == "cover-event") {
                        /* update (user|page|group|event) cover */
                        var image_path = uploads_path+'/'+response.file;
                        var cover_image = $('.profile-cover-wrapper img');
                        if(cover_image.length == 0) {
                            $('.profile-cover-wrapper').prepend("<img class='js_position-cover-cropped' data-init-position='0px' src='"+image_path+"' />");
                            $('.profile-cover-wrapper').prepend("<img class='js_position-cover-full x-hidden' src='"+image_path+"' />");
                        } else {
                            cover_image.attr('src', image_path);
                            /* remove lightbox */
                            cover_image.removeClass('js_lightbox').removeAttr('data-id').removeAttr('data-image').removeAttr('data-context');
                        }
                        /* init picture position */
                        setTimeout(function () {
                            init_picture_position();
                        }, 1000);

                    } else if(handle == "picture-user" || handle == "picture-page" || handle == "picture-group") {
                        /* update (user|page|group) picture */
                        var image_path = uploads_path+'/'+response.file;
                        $('.profile-avatar-wrapper img').attr("src", image_path);
                        /* update crop image source */
                        $('.js_init-crop-picture').data('image', image_path);
                        init_picture_crop($('.js_init-crop-picture'));

                    } else if(handle == "publisher") {
                        /* remove upload loader */
                        if(loader) loader.remove();
                        /* add the attachment to publisher data */
                        var files = publisher.data('photos');
                        if( attachments.find('ul').length == 0) {
                            attachments.append('<ul></ul>');
                        }
                        for(var i in response.files) {
                            files[i] = response.files[i];
                            /* add publisher-attachments */
                            var image_path = uploads_path + '/' + response.files[i]['source'];
                            attachments.find('ul').append(render_template("#publisher-attachments-image-item", {'src':response.files[i]['source'], 'image_path':image_path}));
                        }
                        publisher.data('photos', files);
                        /* handle publisher tabs */
                        publisher.find('.js_publisher-tab[data-tab="'+type+'"]').addClass('activated');

                    } else if(handle == "publisher-mini") {
                        /* remove upload loader */
                        if(loader) loader.remove();
                        /* add the attachment to publisher data */
                        var files = publisher.data('photos');
                        if( attachments.find('ul').length == 0) {
                            attachments.append('<ul></ul>');
                        }
                        for(var i in response.files) {
                            files[i] = response.files[i];
                            /* add publisher-attachments */
                            var image_path = uploads_path + '/' + response.files[i]['source'];
                            attachments.find('ul').append(render_template("#publisher-attachments-image-item", {'src':response.files[i]['source'], 'image_path':image_path, 'mini': true}));
                        }
                        publisher.data('photos', files);

                    } else if(handle == "comment") {
                        /* add the attachment to comment data */
                        comment.data('photos', response.file);
                        /* hide comment x-form-tools */
                        comment.find('.x-form-tools-attach').hide();
                        /* add comment-attachments */
                        var image_path = uploads_path+'/'+response.file;
                        attachments.find('ul').append(render_template("#comment-attachments-item", {'src':response.file, 'image_path':image_path}));

                    } else if(handle == "chat") {
                        /* add the attachment to chat widget data */
                        chat_widget.data('photo', response.file);
                        /* hide chat widget x-form-tools */
                        chat_widget.find('.x-form-tools-attach').hide();
                        /* add chat-attachments */
                        var image_path = uploads_path+'/'+response.file;
                        attachments.find('ul').append(render_template("#chat-attachments-item", {'src':response.file, 'image_path':image_path}));

                    } else if(handle == "x-image") {
                        /* update x-image picture */
                        var image_path = uploads_path+'/'+response.file;
                        parent.css("background-image", 'url('+image_path+')');
                        /* add the image to input */
                        parent.find('.js_x-image-input').val(response.file).change();
                        /* show the remover */
                        parent.find('button').show();
                        
                    }

                } else if (type == "video") {
                    /* check the handle */
                    if(handle == "publisher") {
                        /* hide the attachment from publisher data */
                        attachments.hide();
                        /* remove upload loader */
                        if(loader) loader.remove();
                        /* show publisher meta */
                        $('.publisher-meta[data-meta="'+type+'"]').show();
                        $('.publisher-custom-thumbnail').show();
                        /* add the attachment to publisher data */
                        var object = publisher.data(type);
                        object['source'] = response.file;
                        /* add publisher-attachments */
                        publisher.data(type, object);
                        /* handle publisher tabs */
                        publisher.find('.js_publisher-tab[data-tab="'+type+'"]').addClass('activated');

                    } else if(handle == "publisher-mini") {
                        /* remove upload loader */
                        if(loader) loader.remove();
                        /* add the attachment to publisher data */
                        var files = publisher.data(type);
                        if( attachments.find('ul').length == 0) {
                            attachments.append('<ul></ul>');
                        }
                        for(var i in response.files) {
                            files[response.files[i]] = response.files[i];
                            /* add publisher-attachments */
                            attachments.find('ul').append(render_template("#publisher-attachments-video-item", {'src':response.files[i], 'name':files_names[i]}));
                        }
                        publisher.data(type, files);

                    } else if(handle == "x-video") {
                        /* update x-video */
                        parent.find('.x-image-success').show();
                        /* add the image to input */
                        parent.find('.js_x-image-input').val(response.file);
                        /* show the remover */
                        parent.find('button').show();

                    }

                } else if (type == "audio" || type == "file") {
                    /* check the handle */
                    if(handle == "publisher") {
                        /* hide the attachment from publisher data */
                        attachments.hide();
                        /* remove upload loader */
                        if(loader) loader.remove();
                        /* show publisher meta */
                        $('.publisher-meta[data-meta="'+type+'"]').show();
                        /* add the attachment to publisher data */
                        var object = publisher.data(type);
                        object['source'] = response.file;
                        /* add publisher-attachments */
                        publisher.data(type, object);
                        /* handle publisher tabs */
                        publisher.find('.js_publisher-tab[data-tab="'+type+'"]').addClass('activated');

                    }

                }   
            }
        }
        /* handle error */
        function _handle_error() {
            /* enable uploader input */
            uploader.prop('disabled', false);
            /* hide upload loader */
            if(loader) loader.hide();
            /* check the handle */
            if(handle == "publisher") {
                /* hide the attachment from publisher */
                if( (type == "photos" && jQuery.isEmptyObject(publisher.data('photos'))) || type != "photos" ) {
                    /* hide attachments */
                    attachments.hide();
                    /* remove the type object from publisher data */
                    publisher.removeData(type);
                    /* handle publisher tab */
                    publisher_tab(publisher, type);
                }
                /* remove upload loader */
                if(loader) loader.remove();
            }
            modal('#modal-message', {title: __['Error'], message: __['There is something that went wrong!']});
        }
        /* submit the form */
        $(this).ajaxSubmit(options);
        return false;
    });
    /* handle profile (cover|picture) remover */
    $('body').on('click', '.js_delete-cover, .js_delete-picture', function (e) {
        e.stopPropagation();
        var id = $(this).data('id');
        var handle = $(this).data('handle');
        var remove = ($(this).hasClass('js_delete-cover'))? 'cover' : 'picture';
        if(remove == 'cover') {
            var wrapper = $('.profile-cover-wrapper');
            var _title = __['Delete Cover'];
            var _message = __['Are you sure you want to remove your cover photo?'];
        } else {
            var wrapper = $('.profile-avatar-wrapper');
            var _title = __['Delete Picture'];
            var _message = __['Are you sure you want to remove your profile picture?'];
        }
        confirm(_title, _message, function() {
            $.post(api['users/image_delete'], {'handle': handle, 'id': id}, function(response) {
                /* check the response */
                if(response.callback) {
                    eval(response.callback);
                } else {
                    if(remove == 'cover') {
                        /* hide delete btn  */
                        wrapper.find('.profile-cover-delete').hide();
                        /* hide position btn  */
                        wrapper.find('.profile-cover-position').hide();
                        /* remove (user|page|group) cover */
                        wrapper.find('img').remove();
                    } else {
                        /* hide delete btn  */
                        wrapper.find('.profile-avatar-delete').hide();
                        /* hide crop btn  */
                        wrapper.find('.profile-avatar-crop').hide();
                        /* remove lightbox */
                        wrapper.find('img').removeClass('js_lightbox').removeAttr('data-id').removeAttr('data-image').removeAttr('data-context');
                        /* update (user|page|group) picture with default picture */
                        wrapper.find('img').attr("src", response.file);
                    }
                    $('#modal').modal('hide');
                }
            }, 'json')
            .fail(function() {
                modal('#modal-message', {title: __['Error'], message: __['There is something that went wrong!']});
            });
        });
    });
    /* handle x-image remover */
    $('body').on('click', '.js_x-image-remover', function() {
        var _this = $(this);
        var parent = _this.parents('.x-image');
        confirm(__['Delete'], __['Are you sure you want to delete this?'], function() {
            /* remove x-image image */
            parent.attr('style', '');
            /* add the image to input */
            parent.find('.js_x-image-input').val('').change();
            /* hide the remover */
            _this.hide();
            /* hide x-image-success (if any) */
            parent.find('.x-image-success').attr('style', '');
            /* hide the confimation */
            $('#modal').modal('hide');
        });
    });


    // handle picture crop
    /* init crop picture */
    $('body').on('click', '.js_init-crop-picture', function() {
        init_picture_crop($(this));
    });
    /* crop picture */
    $('body').on('click', '.js_crop-picture', function() {
        var id = $(this).data('id');
        var handle = $(this).data('handle');
        var values = $('#cropped-profile-picture').rcrop('getValues');
        $.post(api['users/image_crop'], {'handle': handle, 'id': id, 'x': values.x, 'y': values.y, 'height': values.height, 'width': values.width}, function(response) {
            /* check the response */
            if(response.callback) {
                eval(response.callback);
            } else {
                $('#modal').modal('hide');
                window.location.reload();
            }
        }, 'json')
        .fail(function() {
            modal('#modal-message', {title: __['Error'], message: __['There is something that went wrong!']});
        });
    });


    // handle picture position
    /* init position picture */
    $('body').on('click', '.js_init-position-picture', function() {
        init_picture_position();
    });
    /* save position picture */
    $('body').on('click', '.js_save-position-picture', function() {
        var handle = $('.js_init-position-picture').data('handle');
        var id = $('.js_init-position-picture').data('id');
        var position = $('.js_position-picture-val').val();
        $.post(api['users/image_position'], {'handle': handle, 'id': id, 'position': position}, function(response) {
            /* check the response */
            if(response.callback) {
                eval(response.callback);
            } else {
                $('#modal').modal('hide');
                window.location.reload();
            }
        }, 'json')
        .fail(function() {
            modal('#modal-message', {title: __['Error'], message: __['There is something that went wrong!']});
        });
    });
    /* cancel position picture */
    $('body').on('click', '.js_cancel-position-picture', function() {
        /* destroy draggable cover image */
        $('.profile-cover-wrapper img').removeAttr("style").draggable("destroy");
        /* show profile cover buttons */
        $('.profile-cover-change').show();
        $('.profile-cover-position').show();
        $('.profile-cover-delete').show();
        $('.profile-buttons-wrapper').show();
        /* show cropped cover */
        $('.js_position-cover-cropped').show();
        /* hide profile cover position buttons */
        $('.profile-cover-position-loader').hide();
        $('.profile-cover-position-buttons').hide();
    });


    // handle recent searches
    $('body').on('click', '.js_clear-searches', function () {
        confirm(__['Delete'], __['Are you sure you want to delete this?'], function() {
            $.get(api['users/settings'], {'edit': 'clear_search_log'}, function(response) {
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

    
    // handle data reseter
    $('body').on('show.bs.dropdown', '.js_live-requests, .js_live-messages, .js_live-notifications', function () {
        var _this = $(this);
        var counter = parseInt(_this.find("span.counter").text()) || 0;
        if(counter > 0) {
            /* reset the client counter & hide it */
            _this.find("span.counter").text('0').hide();
            /* get the reset target */
            if(_this.hasClass('js_live-requests')) {
                var data = {'reset': 'friend_requests'};
            } else if (_this.hasClass('js_live-messages')) {
                var data = {'reset': 'messages'};
            } else if(_this.hasClass('js_live-notifications')) {
                var data = {'reset': 'notifications'};
            }
            /* reset the server counter */
            $.post(api['data/reset'], data, function(response) {
                /* check the response */
                if(!response) return;
                /* check if there is a callback */
                if(response.callback) {
                    eval(response.callback);
                }
            }, 'json')
            .fail(function() {
                modal('#modal-message', {title: __['Error'], message: __['There is something that went wrong!']});
            });
        }
    });


    // handle notifications sound
    $('body').on('click', '.js_notifications-sound-toggle', function () {
        notifications_sound = $(this).is(":checked");
        $.get(api['users/settings'], {'edit': 'notifications_sound', 'notifications_sound': (notifications_sound)? 1 : 0}, function(response) {
            /* check the response */
            if(!response) return;
            /* check if there is a callback */
            if(response.callback) {
                eval(response.callback);
            }
        }, 'json')
        .fail(function() {
            modal('#modal-message', {title: __['Error'], message: __['There is something that went wrong!']});
        });
    });


    // handle connection
    /* friend request */
    $('body').on('click', '.js_friend-accept, .js_friend-decline', function () {
        var id = $(this).data('uid');
        var parent = $(this).parent();
        var accept = parent.find('.js_friend-accept');
        var decline = parent.find('.js_friend-decline');
        var _do = ($(this).hasClass('js_friend-accept'))? 'friend-accept' : 'friend-decline';
        /* hide buttons & show loader */
        accept.hide();
        decline.hide();
        parent.append('<div class="loader loader_medium pr10"></div>');
        /* post the request */
        $.post(api['users/connect'], {'do': _do, 'id': id} , function(response) {
            if(response.callback) {
                parent.find('.loader').remove();
                accept.show();
                decline.show();
                eval(response.callback);
            } else {
                parent.find('.loader').remove();
                accept.remove();
                decline.remove();
                if(_do == 'friend-accept') {
                    parent.append('<button type="button" class="btn btn-sm btn-success btn-delete js_friend-remove" data-uid="'+id+'"><i class="fa fa-check mr5"></i>'+__['Friends']+'</button>');
                }
            }
        }, "json")
        .fail(function() {
            parent.find('.loader').remove();
            accept.show();
            decline.show();
            modal('#modal-message', {title: __['Error'], message: __['There is something that went wrong!']});
        });
    });
    /* friend & unfriend */
    $('body').on('click', '.js_friend-add, .js_friend-cancel, .js_friend-remove', function () {
        var _this = $(this);
        var id = _this.data('uid');
        if(_this.hasClass('js_friend-add')) {
            var _do = 'friend-add';
        } else if (_this.hasClass('js_friend-cancel')) {
            var _do = 'friend-cancel';
        } else {
            var _do = 'friend-remove';
        }
        /* button loading */
        button_status(_this, "loading");
        /* post the request */
        $.post(api['users/connect'], {'do': _do, 'id': id} , function(response) {
            if(response.callback) {
                /* button reset */
                button_status(_this, "reset");
                eval(response.callback);
            } else {
                /* button reset */
                button_status(_this, "reset");
                if(_do == 'friend-add') {
                    _this.after('<button type="button" class="btn btn-sm btn-warning js_friend-cancel" data-uid="'+id+'"><i class="fa fa-clock mr5"></i>'+__['Friend Request Sent']+'</button>');
                } else {
                    _this.after('<button type"button" class="btn btn-sm btn-success js_friend-add" data-uid="'+id+'"><i class="fa fa-user-plus mr5"></i>'+__['Add Friend']+'</button>');
                }
                _this.remove();
            }
        }, "json")
        .fail(function() {
            /* button reset */
            button_status(_this, "reset");
            modal('#modal-message', {title: __['Error'], message: __['There is something that went wrong!']});
        });
    });
    /* follow & unfollow */
    $('body').on('click', '.js_follow, .js_unfollow', function () {
        var _this = $(this);
        var id = _this.data('uid');
        var _do = (_this.hasClass('js_follow'))? 'follow' : 'unfollow';
        /* button loading */
        button_status(_this, "loading");
        /* post the request */
        $.post(api['users/connect'], {'do': _do, 'id': id} , function(response) {
            if(response.callback) {
                /* button reset */
                button_status(_this, "reset");
                eval(response.callback);
            } else {
                if(_do == 'follow') {
                    _this.replaceWith('<button type="button" class="btn btn-sm btn-info js_unfollow" data-uid="'+id+'"><i class="fa fa-check mr5"></i>'+__['Following']+'</button>');
                } else {
                    _this.replaceWith('<button type="button" class="btn btn-sm btn-info js_follow" data-uid="'+id+'"><i class="fa fa-rss mr5"></i>'+__['Follow']+'</button>');
                }
            }
        }, "json")
        .fail(function() {
            /* button reset */
            button_status(_this, "reset");
            modal('#modal-message', {title: __['Error'], message: __['There is something that went wrong!']});
        });
    });
    /* block user */
    $('body').on('click', '.js_block-user', function (e) {
        e.preventDefault();
        var id = $(this).data('uid');
        confirm(__['Block User'], __['Are you sure you want to block this user?'], function() {
            $.post(api['users/connect'], {'do': 'block', 'id': id} , function(response) {
                /* check the response */
                if(response.callback) {
                    eval(response.callback);
                } else {
                    window.location = site_path;
                }
            }, 'json')
            .fail(function() {
                modal('#modal-message', {title: __['Error'], message: __['There is something that went wrong!']});
            });
        });
    });
    /* unblock user */
    $('body').on('click', '.js_unblock-user', function (e) {
        e.preventDefault();
        var id = $(this).data('uid');
        confirm(__['Unblock User'], __['Are you sure you want to unblock this user?'], function() {
            $.post(api['users/connect'], {'do': 'unblock', 'id': id} , function(response) {
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
    /* delete user */
    $('body').on('click', '.js_delete-user', function (e) {
        e.preventDefault();
        confirm(__['Delete'], __['Are you sure you want to delete your account?'], function() {
            $.post(api['users/delete'], function(response) {
                /* check the response */
                if(response.callback) {
                    eval(response.callback);
                } else {
                    window.location = site_path;
                }
            }, 'json')
            .fail(function() {
                modal('#modal-message', {title: __['Error'], message: __['There is something that went wrong!']});
            });
        });
    });
    /* poke */
    $('body').on('click', '.js_poke', function () {
        var _this = $(this);
        var id = _this.data('id');
        var name = _this.data('name');
        /* post the request */
        $.post(api['users/connect'], {'do': 'poke', 'id': id} , function(response) {
            /* remove poke */
            _this.remove();
            if(response.callback) {
                eval(response.callback);
            } else {
                modal('#modal-message', {title: __['Message'], message: __['You haved poked']+" "+name});
            }
        }, "json")
        .fail(function() {
            modal('#modal-message', {title: __['Error'], message: __['There is something that went wrong!']});
        });
    });
    /* like & unlike page */
    $('body').on('click', '.js_like-page, .js_unlike-page', function () {
        var _this = $(this);
        var id = _this.data('id');
        var _do = (_this.hasClass('js_like-page'))? 'page-like' : 'page-unlike';
        /* button loading */
        button_status(_this, "loading");
        /* post the request */
        $.post(api['users/connect'], {'do': _do, 'id': id} , function(response) {
            if(response.callback) {
                /* button reset */
                button_status(_this, "reset");
                eval(response.callback);
            } else {
                if(_do == 'page-like') {
                    _this.replaceWith('<button type="button" class="btn btn-sm btn-primary js_unlike-page" data-id="'+id+'"><i class="fa fa-thumbs-up mr5"></i>'+__['Unlike']+'</button>');
                } else {
                    _this.replaceWith('<button type="button" class="btn btn-sm btn-primary js_like-page" data-id="'+id+'"><i class="fa fa-thumbs-up mr5"></i>'+__['Like']+'</button>');
                }
            }
        }, "json")
        .fail(function() {
            /* button reset */
            button_status(_this, "reset");
            modal('#modal-message', {title: __['Error'], message: __['There is something that went wrong!']});
        });
    });
    /* boost & unboost page */
    $('body').on('click', '.js_boost-page, .js_unboost-page', function () {
        var _this = $(this);
        var id = _this.data('id');
        var _do = (_this.hasClass('js_boost-page'))? 'page-boost' : 'page-unboost';
        /* button loading */
        button_status(_this, "loading");
        /* post the request */
        $.post(api['users/connect'], {'do': _do, 'id': id} , function(response) {
            if(response.callback) {
                /* button reset */
                button_status(_this, "reset");
                eval(response.callback);
            } else {
                if(_do == 'page-boost') {
                    _this.replaceWith('<button type="button" class="btn btn-sm btn-danger js_unboost-page" data-id="'+id+'"><i class="fa fa-bolt mr5"></i>'+__['Unboost']+'</button>');
                } else {
                    _this.replaceWith('<button type="button" class="btn btn-sm btn-danger js_boost-page" data-id="'+id+'"><i class="fa fa-bolt mr5"></i>'+__['Boost']+'</button>');
                }
            }
        }, "json")
        .fail(function() {
            /* button reset */
            button_status(_this, "reset");
            modal('#modal-message', {title: __['Error'], message: __['There is something that went wrong!']});
        });
    });
    /* page admin addation & remove */
    $('body').on('click', '.js_page-admin-addation, .js_page-admin-remove', function () {
        var _this = $(this);
        var id = _this.data('id');
        var uid = _this.data('uid') || 0;
        var _do = (_this.hasClass('js_page-admin-addation'))? 'page-admin-addation' : 'page-admin-remove';
        /* button loading */
        button_status(_this, "loading");
        /* post the request */
        $.post(api['users/connect'], {'do': _do, 'id': id, 'uid': uid} , function(response) {
            if(response.callback) {
                /* button reset */
                button_status(_this, "reset");
                eval(response.callback);
            } else {
                if(_this.hasClass('js_page-admin-addation')) {
                    _this.replaceWith('<button type="button" class="btn btn-sm btn-danger js_page-admin-remove" data-id="'+id+'" data-uid="'+uid+'"><i class="fa fa-trash mr5"></i>'+__['Remove Admin']+'</button>');
                } else {
                    _this.replaceWith('<button type="button" class="btn btn-sm btn-primary js_page-admin-addation" data-id="'+id+'" data-uid="'+uid+'"><i class="fa fa-check mr5"></i>'+__['Make Admin']+'</button>');
                }
            }
        }, "json")
        .fail(function() {
            /* button reset */
            button_status(_this, "reset");
            modal('#modal-message', {title: __['Error'], message: __['There is something that went wrong!']});
        });
    });
    /* page member remove */
    $('body').on('click', '.js_page-member-remove', function () {
        var _this = $(this);
        var id = _this.data('id');
        var uid = _this.data('uid') || 0;
        /* button loading */
        button_status(_this, "loading");
        /* post the request */
        $.post(api['users/connect'], {'do': 'page-member-remove', 'id': id, 'uid': uid} , function(response) {
            if(response.callback) {
                /* button reset */
                button_status(_this, "reset");
                eval(response.callback);
            } else {
                _this.closest('.feeds-item').slideUp();
            }
        }, "json")
        .fail(function() {
            /* button reset */
            button_status(_this, "reset");
            modal('#modal-message', {title: __['Error'], message: __['There is something that went wrong!']});
        });
    });
    /* group join & leave */
    $('body').on('click', '.js_join-group, .js_leave-group', function () {
        var _this = $(this);
        var id = _this.data('id');
        var privacy = _this.data('privacy');
        var _do = (_this.hasClass('js_join-group'))? 'group-join' : 'group-leave';
        /* button loading */
        button_status(_this, "loading");
        /* post the request */
        $.post(api['users/connect'], {'do': _do, 'id': id} , function(response) {
            if(response.callback) {
                /* button reset */
                button_status(_this, "reset");
                eval(response.callback);
            } else {
                if(_this.hasClass('js_join-group')) {
                    if(privacy == "public") {
                        _this.replaceWith('<button type="button" class="btn btn-sm btn-success btn-delete js_leave-group" data-id="'+id+'" data-privacy="'+privacy+'"><i class="fa fa-check mr5"></i>'+__['Joined']+'</button>');
                    } else {
                        _this.replaceWith('<button type="button" class="btn btn-sm btn-warning js_leave-group" data-id="'+id+'" data-privacy="'+privacy+'"><i class="fa fa-clock mr5"></i>'+__['Pending']+'</button>');
                    }
                } else {
                    _this.replaceWith('<button type="button" class="btn btn-sm btn-success js_join-group" data-id="'+id+'" data-privacy="'+privacy+'"><i class="fa fa-user-plus mr5"></i>'+__['Join']+'</button>');
                }
            }
        }, "json")
        .fail(function() {
            /* button reset */
            button_status(_this, "reset");
            modal('#modal-message', {title: __['Error'], message: __['There is something that went wrong!']});
        });
    });
    /* group request (accept|decline) */
    $('body').on('click', '.js_group-request-accept, .js_group-request-decline', function () {
        var _this = $(this);
        var id = _this.data('id');
        var uid = _this.data('uid') || 0;
        var _do = (_this.hasClass('js_group-request-accept'))? 'group-accept' : 'group-decline';
        /* button loading */
        button_status(_this, "loading");
        /* post the request */
        $.post(api['users/connect'], {'do': _do, 'id': id, 'uid': uid} , function(response) {
            if(response.callback) {
                /* button reset */
                button_status(_this, "reset");
                eval(response.callback);
            } else {
                _this.closest('.feeds-item').slideUp();
            }
        }, "json")
        .fail(function() {
            /* button reset */
            button_status(_this, "reset");
            modal('#modal-message', {title: __['Error'], message: __['There is something that went wrong!']});
        });
    });
    /* group admin addation & remove */
    $('body').on('click', '.js_group-admin-addation, .js_group-admin-remove', function () {
        var _this = $(this);
        var id = _this.data('id');
        var uid = _this.data('uid') || 0;
        var _do = (_this.hasClass('js_group-admin-addation'))? 'group-admin-addation' : 'group-admin-remove';
        /* button loading */
        button_status(_this, "loading");
        /* post the request */
        $.post(api['users/connect'], {'do': _do, 'id': id, 'uid': uid} , function(response) {
            if(response.callback) {
                /* button reset */
                button_status(_this, "reset");
                eval(response.callback);
            } else {
                if(_this.hasClass('js_group-admin-addation')) {
                    _this.replaceWith('<button type="button" class="btn btn-sm btn-danger js_group-admin-remove" data-id="'+id+'" data-uid="'+uid+'"><i class="fa fa-trash mr5"></i>'+__['Remove Admin']+'</button>');
                } else {
                    _this.replaceWith('<button type="button" class="btn btn-sm btn-primary js_group-admin-addation" data-id="'+id+'" data-uid="'+uid+'"><i class="fa fa-check mr5"></i>'+__['Make Admin']+'</button>');
                }
            }
        }, "json")
        .fail(function() {
            /* button reset */
            button_status(_this, "reset");
            modal('#modal-message', {title: __['Error'], message: __['There is something that went wrong!']});
        });
    });
    /* group member remove */
    $('body').on('click', '.js_group-member-remove', function () {
        var _this = $(this);
        var id = _this.data('id');
        var uid = _this.data('uid') || 0;
        /* button loading */
        button_status(_this, "loading");
        /* post the request */
        $.post(api['users/connect'], {'do': 'group-member-remove', 'id': id, 'uid': uid} , function(response) {
            if(response.callback) {
                /* button reset */
                button_status(_this, "reset");
                eval(response.callback);
            } else {
                _this.closest('.feeds-item').slideUp();
            }
        }, "json")
        .fail(function() {
            /* button reset */
            button_status(_this, "reset");
            modal('#modal-message', {title: __['Error'], message: __['There is something that went wrong!']});
        });
    });
    /* event go & ungo */
    $('body').on('click', '.js_go-event, .js_ungo-event', function () {
        var _this = $(this);
        var id = _this.data('id');
        var _do = (_this.hasClass('js_go-event'))? 'event-go': 'event-ungo';
        /* button loading */
        button_status(_this, "loading");
        /* post the request */
        $.post(api['users/connect'], {'do': _do, 'id': id} , function(response) {
            if(response.callback) {
                /* button reset */
                button_status(_this, "reset");
                eval(response.callback);
            } else {
                if(_do == 'event-go') {
                    _this.replaceWith('<button type="button" class="btn btn-sm btn-success js_ungo-event" data-id="'+id+'"><i class="fa fa-check mr5"></i>'+__['Going']+'</button>');
                } else {
                    _this.replaceWith('<button type="button" class="btn btn-sm btn-success js_go-event" data-id="'+id+'"><i class="fa fa-calendar-check mr5"></i>'+__['Going']+'</button>');
                }
            }
        }, "json")
        .fail(function() {
            /* button reset */
            button_status(_this, "reset");
            modal('#modal-message', {title: __['Error'], message: __['There is something that went wrong!']});
        });
    });
    /* event interest & uninterest */
    $('body').on('click', '.js_interest-event, .js_uninterest-event', function () {
        var _this = $(this);
        var id = _this.data('id');
        var _do = (_this.hasClass('js_interest-event'))? 'event-interest': 'event-uninterest';
        /* button loading */
        button_status(_this, "loading");
        /* post the request */
        $.post(api['users/connect'], {'do': _do, 'id': id} , function(response) {
            if(response.callback) {
                /* button reset */
                button_status(_this, "reset");
                eval(response.callback);
            } else {
                if(_do == 'event-interest') {
                    _this.replaceWith('<button type="button" class="btn btn-sm btn-primary js_uninterest-event" data-id="'+id+'"><i class="fa fa-check mr5"></i>'+__['Interested']+'</button>');
                } else {
                    _this.replaceWith('<button type="button" class="btn btn-sm btn-primary js_interest-event" data-id="'+id+'"><i class="fa fa-star mr5"></i>'+__['Interested']+'</button>');
                }
            }
        }, "json")
        .fail(function() {
            /* button reset */
            button_status(_this, "reset");
            modal('#modal-message', {title: __['Error'], message: __['There is something that went wrong!']});
        });
    });
    /* invite (page|group|event) */
    $('body').on('click', '.js_page-invite, .js_group-invite, .js_event-invite', function () {
        var _this = $(this);
        var id = _this.data('id');
        var uid = _this.data('uid') || 0;
        var _do = 'event-invite';
        if(_this.hasClass('js_page-invite')) {
            var _do = 'page-invite';
        } else if (_this.hasClass('js_group-invite')) {
            var _do = 'group-invite';
        } else {
            var _do = 'event-invite';
        }
        /* button loading */
        button_status(_this, "loading");
        /* post the request */
        $.post(api['users/connect'], {'do': _do, 'id': id, 'uid': uid} , function(response) {
            if(response.callback) {
                /* button reset */
                button_status(_this, "reset");
                eval(response.callback);
            } else {
                _this.remove();
            }
        }, "json")
        .fail(function() {
            /* button reset */
            button_status(_this, "reset");
            modal('#modal-message', {title: __['Error'], message: __['There is something that went wrong!']});
        });
    });
    /* delete (page|group|event) */
    $('body').on('click', '.js_delete-page, .js_delete-group, .js_delete-event', function (e) {
        e.preventDefault();
        var id = $(this).data('id');
        if($(this).hasClass('js_delete-page')) {
            var handle = 'page';
        } else if($(this).hasClass('js_delete-group')) {
            var handle = 'group';
        } else if($(this).hasClass('js_delete-event')) {
            var handle = 'event';
        }
        confirm(__['Delete'], __['Are you sure you want to delete this?'], function() {
            $.post(api['pages_groups_events/delete'], {'handle': handle, 'id': id} , function(response) {
                /* check the response */
                if(response.callback) {
                    eval(response.callback);
                } else {
                    window.location = site_path;
                }
            }, 'json')
            .fail(function() {
                modal('#modal-message', {title: __['Error'], message: __['There is something that went wrong!']});
            });
        });
    });


    // handle reports
    $('body').on('click', '.js_report', function (e) {
        e.preventDefault;
        var id = $(this).data('id');
        var handle = $(this).data('handle');
        confirm(__['Report'], __['Are you sure you want to report this?'], function() {
            $.post(api['data/report'], {'handle': handle, 'id': id}, function(response) {
                /* check the response */
                if(response.callback) {
                    eval(response.callback);
                }
            }, 'json')
            .fail(function() {
                modal('#modal-message', {title: __['Error'], message: __['There is something that went wrong!']});
            });
        });
        return false;
    });
    

    // handle session
    /* delete a session */
    $('body').on('click', '.js_session-deleter', function () {
        var id = $(this).data('id');
        confirm(__['Delete'], __['Are you sure you want to delete this?'], function() {
            $.post(api['users/session'], {'handle': 'session', 'id': id}, function(response) {
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
    /* delete all sessions */
    $('body').on('click', '.js_session-delete-all', function () {
        var id = $(this).data('id');
        confirm(__['Delete'], __['Are you sure you want to delete this?'], function() {
            $.post(api['users/session'], {'handle': 'sessions'}, function(response) {
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


    // handle ads
    /* delete campaign */
    $('body').on('click', '.js_ads-delete-campaign', function () {
        var id = $(this).data('id');
        confirm(__['Delete'], __['Are you sure you want to delete this?'], function() {
            $.post(api['ads/campaign'], {'do': 'delete', 'id': id}, function(response) {
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
    /* (stop|resume) campaign */
    $('body').on('click', '.js_ads-stop-campaign, .js_ads-resume-campaign', function () {
        var id = $(this).data('id');
        var _do = ($(this).hasClass('js_ads-stop-campaign'))? 'stop' : 'resume';
        confirm(__['Delete'], __['Are you sure you want to do this?'], function() {
            $.post(api['ads/campaign'], {'do': _do, 'id': id}, function(response) {
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
    /* get potential reach */
    $('#js_ads-audience-countries, #js_ads-audience-gender, #js_ads-audience-relationship').on('change', function() {
        /* get values */
        var countries = $('#js_ads-audience-countries').val();
        var gender = $('#js_ads-audience-gender').val();
        var relationship = $('#js_ads-audience-relationship').val();
        /* show loader */
        $('#js_ads-potential-reach-loader').show();
        /* post the request */
        $.post(api['ads/campaign'], {'do': 'potential_reach', 'countries': countries, 'gender': gender, 'relationship': relationship} , function(response) {
            if(response.callback) {
                eval(response.callback);
            } else {
                $('#js_ads-potential-reach').text(response);
            }
            /* hide loader */
            $('#js_ads-potential-reach-loader').hide();
        }, "json")
        .fail(function() {
            modal('#modal-message', {title: __['Error'], message: __['There is something that went wrong!']});
        });
    });
    /* change campaign type */
    $('#js_campaign-type').on('change', function() {
        if($(this).val() == "url") {
            $('#js_campaign-type-url').fadeIn();
            $('#js_campaign-type-page').hide();
            $('#js_campaign-type-group').hide();
            $('#js_campaign-type-event').hide();
        }
        if($(this).val() == "page") {
            $('#js_campaign-type-url').hide();
            $('#js_campaign-type-page').fadeIn();
            $('#js_campaign-type-group').hide();
            $('#js_campaign-type-event').hide();
        }
        if($(this).val() == "group") {
            $('#js_campaign-type-url').hide();
            $('#js_campaign-type-page').hide();
            $('#js_campaign-type-group').fadeIn();
            $('#js_campaign-type-event').hide();
        }
        if($(this).val() == "event") {
            $('#js_campaign-type-url').hide();
            $('#js_campaign-type-page').hide();
            $('#js_campaign-type-group').hide();
            $('#js_campaign-type-event').fadeIn();
        }
    });
    /* adblocker detector */
    if(window.canRunAds === undefined) {
        if($(".adblock-warning-message").length > 0) {
            $(".adblock-warning-message").slideDown();
            return;
        } 
        if(adblock_detector) {
            $(render_template("#adblock-detector")).appendTo('body').show();
        }
    }


    // handle developers
    /* oauth app */
    $('body').on('click', '.js_developers-oauth-app', function () {
        var id = $(this).data('id');
        $.post(api['developers/app'], {'do': 'oauth', 'id': id}, function(response) {
            /* check the response */
            if(response.callback) {
                eval(response.callback);
            } else {
                window.location = response.redirect_url
            }
        }, 'json')
        .fail(function() {
            modal('#modal-message', {title: __['Error'], message: __['There is something that went wrong!']});
        });
    });
    /* delete app */
    $('body').on('click', '.js_developers-delete-app', function () {
        var id = $(this).data('id');
        confirm(__['Delete'], __['Are you sure you want to delete this?'], function() {
            $.post(api['developers/app'], {'do': 'delete', 'id': id}, function(response) {
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
    /* delete user app */
    $('body').on('click', '.js_delete-user-app', function () {
        var id = $(this).data('id');
        confirm(__['Delete'], __['Are you sure you want to delete this?'], function() {
            $.post(api['users/connect'], {'do': 'delete-app', 'id': id} , function(response) {
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
    
});