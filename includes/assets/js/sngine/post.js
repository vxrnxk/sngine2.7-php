/**
 * post js
 * 
 * @package Sngine
 * @author Zamblek
 */

// initialize API URLs
/* posts */
api['comments/filter']  = ajax_path+"posts/filter.php?handle=comments";
api['posts/filter']  = ajax_path+"posts/filter.php?handle=posts";
api['posts/post']  = ajax_path+"posts/post.php";
api['posts/scraper']  = ajax_path+"posts/scraper.php";
api['posts/lightbox']  = ajax_path+"posts/lightbox.php";
api['posts/comment']  = ajax_path+"posts/comment.php";
api['posts/reaction']  = ajax_path+"posts/reaction.php";
api['posts/edit']  = ajax_path+"posts/edit.php";
api['posts/product'] = ajax_path+"posts/product.php";
api['posts/story'] = ajax_path+"posts/story.php";
/* albums */
api['albums/action']  = ajax_path+"albums/action.php";
/* forums */
api['forums/delete']  = ajax_path+"forums/delete.php";


// publisher tab
function publisher_tab(publisher, tab) {
    /* toggle active class */
    publisher.find('.js_publisher-tab[data-tab="'+tab+'"]').toggleClass('active');
    /* toggle conflicted tabs */
    switch (tab) {
        case "photos":
            /* toggle conflicted tabs */
            if(!publisher.find('.js_publisher-tab[data-tab="album"]').hasClass('active')) {
                publisher.find('.js_publisher-tab[data-tab="colored"]').toggleClass('disabled');
                publisher.find('.js_publisher-tab[data-tab="gif"]').toggleClass('disabled');
                publisher.find('.js_publisher-tab[data-tab="product"]').toggleClass('disabled');
                publisher.find('.js_publisher-tab[data-tab="article"]').toggleClass('disabled');
                publisher.find('.js_publisher-tab[data-tab="poll"]').toggleClass('disabled');
                publisher.find('.js_publisher-tab[data-tab="video"]').toggleClass('disabled');
                publisher.find('.js_publisher-tab[data-tab="audio"]').toggleClass('disabled');
                publisher.find('.js_publisher-tab[data-tab="file"]').toggleClass('disabled');
            }
            break;

        case "album":
            /* toggle meta */
            publisher.find('.publisher-meta[data-meta="album"]').slideToggle('fast').find('input').focus();
            /* toggle conflicted tabs */
            if(!publisher.find('.js_publisher-tab[data-tab="photos"]').hasClass('active')) {
                publisher.find('.js_publisher-tab[data-tab="colored"]').toggleClass('disabled');
                publisher.find('.js_publisher-tab[data-tab="gif"]').toggleClass('disabled');
                publisher.find('.js_publisher-tab[data-tab="product"]').toggleClass('disabled');
                publisher.find('.js_publisher-tab[data-tab="article"]').toggleClass('disabled');
                publisher.find('.js_publisher-tab[data-tab="poll"]').toggleClass('disabled');
                publisher.find('.js_publisher-tab[data-tab="video"]').toggleClass('disabled');
                publisher.find('.js_publisher-tab[data-tab="audio"]').toggleClass('disabled');
                publisher.find('.js_publisher-tab[data-tab="file"]').toggleClass('disabled');
            }
            break;

        case "location":
            /* toggle meta */
            publisher.find('.publisher-meta[data-meta="location"]').slideToggle('fast').find('input').focus();
            break;

        case "colored":
            /* toggle meta */
            publisher.find('.publisher-meta[data-meta="colored"]').slideToggle('fast').find('input').focus();
            /* toggle conflicted tabs */
            publisher.find('.js_publisher-tab[data-tab="photos"]').toggleClass('disabled');
            publisher.find('.js_publisher-tab[data-tab="album"]').toggleClass('disabled');
            publisher.find('.js_publisher-tab[data-tab="gif"]').toggleClass('disabled');
            publisher.find('.js_publisher-tab[data-tab="product"]').toggleClass('disabled');
            publisher.find('.js_publisher-tab[data-tab="article"]').toggleClass('disabled');
            publisher.find('.js_publisher-tab[data-tab="poll"]').toggleClass('disabled');
            publisher.find('.js_publisher-tab[data-tab="video"]').toggleClass('disabled');
            publisher.find('.js_publisher-tab[data-tab="audio"]').toggleClass('disabled');
            publisher.find('.js_publisher-tab[data-tab="file"]').toggleClass('disabled');
            break;

        case "gif":
            /* toggle meta */
            publisher.find('.publisher-meta[data-meta="gif"]').slideToggle('fast').find('input').focus();
            /* toggle conflicted tabs */
            publisher.find('.js_publisher-tab[data-tab="photos"]').toggleClass('disabled');
            publisher.find('.js_publisher-tab[data-tab="album"]').toggleClass('disabled');
            publisher.find('.js_publisher-tab[data-tab="colored"]').toggleClass('disabled');
            publisher.find('.js_publisher-tab[data-tab="product"]').toggleClass('disabled');
            publisher.find('.js_publisher-tab[data-tab="article"]').toggleClass('disabled');
            publisher.find('.js_publisher-tab[data-tab="poll"]').toggleClass('disabled');
            publisher.find('.js_publisher-tab[data-tab="video"]').toggleClass('disabled');
            publisher.find('.js_publisher-tab[data-tab="audio"]').toggleClass('disabled');
            publisher.find('.js_publisher-tab[data-tab="file"]').toggleClass('disabled');
            break;

        case "poll":
            /* toggle meta */
            publisher.find('.publisher-meta[data-meta="poll"]').slideToggle('fast');
            /* toggle textarea placeholder */
            if(publisher.find('.js_publisher-tab[data-tab="poll"]').hasClass('active')) {
                publisher.find('textarea').attr('placeholder', __['Ask something']+"...").focus();
            } else {
                publisher.find('textarea').attr('placeholder', publisher.find('textarea').data('init-placeholder')).focus();
            }
            /* toggle conflicted tabs */
            publisher.find('.js_publisher-tab[data-tab="photos"]').toggleClass('disabled');
            publisher.find('.js_publisher-tab[data-tab="album"]').toggleClass('disabled');
            publisher.find('.js_publisher-tab[data-tab="colored"]').toggleClass('disabled');
            publisher.find('.js_publisher-tab[data-tab="gif"]').toggleClass('disabled');
            publisher.find('.js_publisher-tab[data-tab="product"]').toggleClass('disabled');
            publisher.find('.js_publisher-tab[data-tab="article"]').toggleClass('disabled');
            publisher.find('.js_publisher-tab[data-tab="video"]').toggleClass('disabled');
            publisher.find('.js_publisher-tab[data-tab="audio"]').toggleClass('disabled');
            publisher.find('.js_publisher-tab[data-tab="file"]').toggleClass('disabled');
            break;

        case "video":
            /* toggle conflicted tabs */
            publisher.find('.js_publisher-tab[data-tab="photos"]').toggleClass('disabled');
            publisher.find('.js_publisher-tab[data-tab="album"]').toggleClass('disabled');
            publisher.find('.js_publisher-tab[data-tab="colored"]').toggleClass('disabled');
            publisher.find('.js_publisher-tab[data-tab="gif"]').toggleClass('disabled');
            publisher.find('.js_publisher-tab[data-tab="product"]').toggleClass('disabled');
            publisher.find('.js_publisher-tab[data-tab="article"]').toggleClass('disabled');
            publisher.find('.js_publisher-tab[data-tab="poll"]').toggleClass('disabled');
            publisher.find('.js_publisher-tab[data-tab="audio"]').toggleClass('disabled');
            publisher.find('.js_publisher-tab[data-tab="file"]').toggleClass('disabled');
            break;

        case "audio":
            /* toggle conflicted tabs */
            publisher.find('.js_publisher-tab[data-tab="photos"]').toggleClass('disabled');
            publisher.find('.js_publisher-tab[data-tab="album"]').toggleClass('disabled');
            publisher.find('.js_publisher-tab[data-tab="colored"]').toggleClass('disabled');
            publisher.find('.js_publisher-tab[data-tab="gif"]').toggleClass('disabled');
            publisher.find('.js_publisher-tab[data-tab="product"]').toggleClass('disabled');
            publisher.find('.js_publisher-tab[data-tab="article"]').toggleClass('disabled');
            publisher.find('.js_publisher-tab[data-tab="poll"]').toggleClass('disabled');
            publisher.find('.js_publisher-tab[data-tab="video"]').toggleClass('disabled');
            publisher.find('.js_publisher-tab[data-tab="file"]').toggleClass('disabled');
            break;

        case "file":
            /* toggle conflicted tabs */
            publisher.find('.js_publisher-tab[data-tab="photos"]').toggleClass('disabled');
            publisher.find('.js_publisher-tab[data-tab="album"]').toggleClass('disabled');
            publisher.find('.js_publisher-tab[data-tab="colored"]').toggleClass('disabled');
            publisher.find('.js_publisher-tab[data-tab="gif"]').toggleClass('disabled');
            publisher.find('.js_publisher-tab[data-tab="product"]').toggleClass('disabled');
            publisher.find('.js_publisher-tab[data-tab="article"]').toggleClass('disabled');
            publisher.find('.js_publisher-tab[data-tab="poll"]').toggleClass('disabled');
            publisher.find('.js_publisher-tab[data-tab="video"]').toggleClass('disabled');
            publisher.find('.js_publisher-tab[data-tab="audio"]').toggleClass('disabled');
            break;

        case "scraper":
            /* toggle conflicted tabs */
            publisher.find('.js_publisher-tab[data-tab="photos"]').toggleClass('disabled');
            publisher.find('.js_publisher-tab[data-tab="album"]').toggleClass('disabled');
            publisher.find('.js_publisher-tab[data-tab="colored"]').toggleClass('disabled');
            publisher.find('.js_publisher-tab[data-tab="gif"]').toggleClass('disabled');
            publisher.find('.js_publisher-tab[data-tab="product"]').toggleClass('disabled');
            publisher.find('.js_publisher-tab[data-tab="article"]').toggleClass('disabled');
            publisher.find('.js_publisher-tab[data-tab="poll"]').toggleClass('disabled');
            publisher.find('.js_publisher-tab[data-tab="video"]').toggleClass('disabled');
            publisher.find('.js_publisher-tab[data-tab="audio"]').toggleClass('disabled');
            publisher.find('.js_publisher-tab[data-tab="file"]').toggleClass('disabled');
            break;
    }
}


// update media views
function update_media_views(media_type, media_id) {
    var _do = (media_type == "video")? 'update_video_views' : 'update_audio_views';
    setTimeout(function() {
        $.post(api['posts/reaction'], {'do': _do, 'id': media_id}, function(response) {
            if(response.callback) {
                eval(response.callback);
            } else {
                /* remove onplay */
                $("#"+media_type+"-"+media_id).removeAttr('onplay');
            }
        }, 'json');
    }, 5000);
}


// initialize scraper
function initialize_scraper() {
    $(".js_publisher-scraper").trigger("keyup");
    $('body').addClass('publisher-focus');
    $('.publisher-slider').slideDown();
    $('.publisher-emojis').fadeIn();
}


$(function() {

    // run stories
    if($("#stories").length > 0) {
        var stories = new Zuck('stories', {
            skin: 'Sngine',
            avatars: true,
            list: false,
            backNative: true,
            previousTap: true,
            autoFullScreen: false,
            localStorage: false,
            stories: $("#stories").data("json")
        });
    }
    /* delete story */
    $('body').on('click', '.js_story-deleter', function () {
        var id = $(this).data('id');
        confirm(__['Delete'], __['Are you sure you want to delete this?'], function() {
            $.post(api['posts/story'], {'do': 'delete'}, function(response) {
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


    // run daytime messages
    if(current_page == "index" && daytime_msg_enabled && $('.publisher').length > 0) {
        var now = new Date();
        var hours = now.getHours();
        if ( hours >= 5 && hours <= 11 ) {
            $(render_template('#message-morning')).insertAfter('.publisher').fadeIn();
        } else if ( hours >= 12 && hours <= 18 ) {
            $(render_template('#message-afternoon')).insertAfter('.publisher').fadeIn();
        } else if ( hours >= 19 || hours <= 4 ) {
            $(render_template('#message-evening')).insertAfter('.publisher').fadeIn();
        }
    }
    
    
    // run publisher
    /* publisher focus */
    $('body').on('click', function(e) {
        /* check if there is a publisher in the page */
        if($(".publisher:not(.mini)").length > 0) {
            if($(e.target).parents(".publisher:not(.mini)").length > 0 || $(e.target).parents(".js_publisher-attachment-image-remover").length > 0 || $(e.target).parents(".js_publisher-gif-remover").length > 0 || $(e.target).parents(".js_publisher-scraper-remover").length > 0) {
                $('body').addClass('publisher-focus');
                $('.publisher-slider').slideDown();
                $('.publisher-emojis').fadeIn();
                /* check if publisher colored tab activated */
                if($('.js_publisher-tab[data-tab="colored"]').hasClass('activated')) {
                    var publisher = $('.publisher');
                    var publisher_message =  publisher.find(".publisher-message");
                    var publisher_textarea = publisher_message.find('textarea');
                    /* check if publisher_message already colored */
                    if(!publisher_message.hasClass("colored")) {
                        var active_pattern = $(".colored-pattern-item.active");
                        /* [1] add colored class */
                        publisher_message.addClass("colored");
                        /* [2] add pattern background-image */
                        if(active_pattern.data("type") == "color") {
                            publisher_message.css("backgroundImage", "linear-gradient(45deg, "+active_pattern.data('background-color-1')+", "+active_pattern.data('background-color-2')+")");
                        } else {
                            publisher_message.css("backgroundImage", "url("+uploads_path+"/"+active_pattern.data('background-image')+")");
                        }
                        /* [3] add pattern text-color */
                        publisher_textarea.css("color", active_pattern.data('text-color'));
                        autosize.update(publisher_textarea);
                    }
                }
            } else {
                $('body').removeClass('publisher-focus');
                $('.publisher-slider').slideUp();
                $('.publisher-emojis').fadeOut();
                /* check if publisher colored tab activated */
                if($('.js_publisher-tab[data-tab="colored"]').hasClass('activated')) {
                    var publisher = $('.publisher');
                    var publisher_message =  publisher.find(".publisher-message");
                    var publisher_textarea = publisher_message.find('textarea');
                    /* [1] remove colored class */
                    publisher_message.removeClass("colored");
                    /* [2] remove pattern background-image */
                    publisher_message.css("backgroundImage", "");
                    /* [3] remove pattern text-color */
                    publisher_textarea.css("color", "");
                    autosize.update(publisher_textarea);
                }
            }
        }
    });
    /* publisher tabs */
    $('body').on('click', '.js_publisher-tab', function() {
        var _this = $(this);
        var publisher = _this.parents('.publisher');
        var tab = _this.data('tab');
        if(_this.hasClass('link') && _this.hasClass('disabled')) {
            return false;
        }
        /* check if already activated or disabled */
        if(_this.hasClass('activated') || _this.hasClass('disabled')) {
            return;
        }
        /* check if the current scraping process */
        if(tab != "location" && publisher.data('scraping')) {
            return;
        }
        /* handle publisher tab */
        if(!_this.hasClass('attach') && !_this.hasClass('link')) {
            publisher_tab(publisher, tab);
        }
    });
    /* publisher scraper */
    var typing_timer;
    $('body').on('keyup paste input propertychange', '.js_publisher-scraper', function() {
        var _this = $(this);
        var publisher = _this.parents('.publisher');
        var loader = publisher.find('.publisher-loader');
        var button = publisher.find('.js_publisher');
        clearTimeout(typing_timer);
        if(_this.val()) {
            typing_timer = setTimeout(function() {
                /* check if the current process */
                if(publisher.data('photos') || publisher.data('scraping') || publisher.data('video') || publisher.data('audio') || publisher.data('file')) {
                    return;
                }
                /* check if there is any active publisher tab than location */
                if(publisher.find('.js_publisher-tab.active[data-tab!="location"]').length > 0) {
                    return;
                }
                var raw_query = _this.val().match(/((?:https?:|www\.)[^\s]+)/gi);
                if(raw_query === null || raw_query.length == 0) {
                    return;
                }
                var query = raw_query[0];
                /* show the loader */
                loader.show();
                /* disable submit button */
                button_status(button, "loading");
                /* handle publisher tab */
                publisher_tab(publisher, "scraper");
                /* scrabe the link */
                $.post(api['posts/scraper'], {'query': query}, function(response) {
                    /* hide the loader */
                    loader.hide();
                    /* enable submit button */
                    button_status(button, "reset");
                    if(response.callback) {
                        eval(response.callback);
                    } else if(response.link) {
                        /* add the link to publisher data */
                        publisher.data('scraping', response.link);
                        /* hide photos uploader */
                        $('.js_publisher-photos').hide();
                        /* get the template */
                        if(response.link['source_type'] == "link") {
                            /* link */
                            var template = render_template('#scraper-link', {'thumbnail': response.link['source_thumbnail'], 'host': response.link['source_host'], 'url': response.link['source_url'], 'title': response.link['source_title'], 'text': response.link['source_text'] });
                        } else if (response.link['source_type'] == "photo") {
                            var template = render_template('#scraper-photo', {'url': response.link['source_url'], 'provider': response.link['source_provider']});
                        } else {
                            /* media */
                            var template = render_template('#scraper-media', {'url': response.link['source_url'], 'title': response.link['source_title'], 'text': response.link['source_text'], 'html': response.link['source_html'], 'provider': response.link['source_provider'] });
                        }
                        /* show the publisher scraper */
                        publisher.find('.publisher-scraper').html(template).fadeIn();
                    }
                }, 'json');
            }, 500);
        }
    });
    /* publisher scraper remover */
    $('body').on('click', '.js_publisher-scraper-remover', function() {
        var publisher = $(this).parents('.publisher');
        /* remove the link from publisher data */
        publisher.removeData('scraping');
        /* hide the publisher scraper */
        publisher.find('.publisher-scraper').html('').fadeOut();
        /* handle publisher tab */
        publisher_tab(publisher, "scraper");
    });
    /* publisher album */
    $('body').on('keyup', '.publisher-meta[data-meta="album"] input', function() {
        if($(this).val() == '') {
            $('.js_publisher-tab[data-tab="album"]').removeClass('activated');
        } else {
            $('.js_publisher-tab[data-tab="album"]').addClass('activated');
        }
    });
    /* publisher location */
    $('body').on('keyup', '.publisher-meta[data-meta="location"] input', function() {
        if($(this).val() == '') {
            $('.js_publisher-tab[data-tab="location"]').removeClass('activated');
        } else {
            $('.js_publisher-tab[data-tab="location"]').addClass('activated');
        }
    });
    /* publisher feelings */
    $('body').on('click', '.js_publisher-feelings', function() {
        $(this).toggleClass('active');
        $('.publisher-meta[data-meta="feelings"]').slideToggle('fast');
        /* show feelings menu */
        $('#feelings-menu:hidden').slideDown('fast');
    });
    $('body').on('keyup', '.publisher-meta[data-meta="feelings"] input', function() {
        if($(this).val() == '') {
            $('.js_publisher-feelings').removeClass('activated');
        } else {
            $('.js_publisher-feelings').addClass('activated');
        }
    });
    $('body').on('click', '#feelings-menu-toggle', function() {
        /* show feelings menu */
        $('#feelings-menu').slideToggle('fast');
        /* hide feelings types */
        $('#feelings-types:visible').hide();
        /* update feelings menu toggle */
        $(this).removeClass('active').text($(this).data("init-text"));
        /* hide feelings data */
        $('#feelings-data').hide();
        /* update/show feelings data input */
        $('#feelings-data input').show().attr('placeholder', $(this).data('init-text')).removeData('action').val('');
        /* update feelings data span */
        $('#feelings-data span').html('');
        /* update publisher feelings */
        $('.js_publisher-feelings').removeClass('activated');
    });
    $('body').on('click', '.js_feelings-add', function() {
        /* hide feelings menu */
        $('#feelings-menu').hide();
        /* update feelings menu toggle */
        $('#feelings-menu-toggle').addClass('active').text($(this).find('.data').text());
        /* show feelings data */
        $('#feelings-data').show();
        if($(this).data('action') == "Feeling") {
            /* update/hide feelings data input */
            $('#feelings-data input').hide().attr('placeholder', $(this).data('placeholder')).data('action', $(this).data('action'));
            /* update feelings data span */
            $('#feelings-data span').html($(this).data('placeholder'));
            /* show feelings types */
            $('#feelings-types').slideToggle('fast');
        } else {
            /* update/show feelings data input */
            $('#feelings-data input').show().attr('placeholder', $(this).data('placeholder')).data('action', $(this).data('action')).val('').focus();
            /* update feelings data span */
            $('#feelings-data span').html('');
            /* update publisher feelings */
            $('.js_publisher-feelings').removeClass('activated');
        }
    });
    $('body').on('click', '.js_feelings-type', function() {
        /* hide feelings types */
        $('#feelings-types').hide();
        /* update/hide feelings data input */
        $('#feelings-data input').hide().val($(this).data("type"));
        /* update feelings data span */
        $('#feelings-data span').html('<i class="twa twa-lg twa-'+$(this).data("icon")+'"></i>'+$(this).find('.data').text());
        /* update publisher feelings */
        $('.js_publisher-feelings').addClass('activated');
    });
    /* publisher patterns */
    $('body').on('click', '.js_publisher-pattern', function() {
        var _this = $(this);
        var publisher = _this.parents('.publisher');
        var publisher_message =  publisher.find(".publisher-message");
        var publisher_textarea = publisher_message.find('textarea');
        /* deactivate any active previous pattern */
        $(".colored-pattern-item.active").not(this).removeClass("active");
        _this.toggleClass("active");
        if(_this.hasClass("active")) {
            /* [1] add colored class */
            publisher_message.addClass("colored");
            /* [2] add pattern background-image */
            if(_this.data("type") == "color") {
                publisher_message.css("backgroundImage", "linear-gradient(45deg, "+_this.data('background-color-1')+", "+_this.data('background-color-2')+")");
            } else {
                publisher_message.css("backgroundImage", "url("+uploads_path+"/"+_this.data('background-image')+")");
            }
            /* [3] add pattern text-color */
            publisher_textarea.css("color", _this.data('text-color'));
            autosize.update(publisher_textarea);
            /* [4] activate the publisher colored tab */
            $('.js_publisher-tab[data-tab="colored"]').addClass('activated');
            /* [5] add pattern to the publisher */
            publisher.data("colored_pattern", _this.data("id"));
        } else {
            /* [1] remove colored class */
            publisher_message.removeClass("colored");
            /* [2] remove pattern background-image */
            publisher_message.css("backgroundImage", "");
            /* [3] remove pattern text-color */
            publisher_textarea.css("color", "");
            autosize.update(publisher_textarea);
            /* [4] dectivate the publisher colored tab */
            $('.js_publisher-tab[data-tab="colored"]').removeClass('activated');
            /* [5] remove pattern from the publisher */
            publisher.removeData("colored_pattern");
        }
    });
    /* publisher gif search */
    $('body').on('keyup', '.js_publisher-gif-search', function() {
        var _this = $(this);
        //var raw_query = _this.val().match(/@(\w+)/ig);
        var query = _this.val();
        if(!is_empty(query)) {
            /* check if results dropdown-menu already exist */
            if(_this.next('.dropdown-menu').length == 0) {
                /* construct a new one */
                _this.after('<div class="dropdown-menu gif-search"></div>');
            }
            /* add the loader */
            _this.next('.dropdown-menu').show().html('<div class="loader loader_small ptb10"></div>');
            /* get results */
            $.get('https://api.giphy.com/v1/gifs/search?', {q: query, api_key: giphy_key, limit: 20}, function(response) {
                if(response.meta.status == 200 && response.data.length > 0) {
                    _this.next('.dropdown-menu').show().html("<div class='js_scroller' data-slimScroll-height='180'><div>");
                    for (var i = 0; i < response.data.length; i++) {
                        _this.next('.dropdown-menu').find('.js_scroller').append($('<div class="item"><img class="js_publisher-gif-add" src="'+response.data[i].images.fixed_height_small.url+'" data-gif="' + response.data[i].images.fixed_height.url + '" autoplay loop></div>'));
                    }
                } else {
                    _this.next('.dropdown-menu').show().html('<div class="ptb5 plr10">'+__['No result found']+'</div>');
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
    $('body').on('click focus', '.js_publisher-gif-search', function() {
        var query = $(this).val();
        if(!is_empty(query)) {
            $(this).next('.dropdown-menu').show();
        }
    });
    /* hide the results dropdown-menu when clicked outside the input */
    $('body').on('click', function(e) {
        if(!$(e.target).is(".js_publisher-gif-search")) {
            $('.js_publisher-gif-search').next('.dropdown-menu').hide();
        }
    });
    /* publisher gif add */
    $('body').on('click', '.js_publisher-gif-add', function() {
        var _this = $(this);
        var publisher = _this.parents('.publisher');
        var link = {};
        link['source_html'] = 'null';
        link['source_provider'] = 'giphy';
        link['source_text'] = 'null';
        link['source_title'] = _this.data('gif');
        link['source_type'] = 'photo';
        link['source_url'] = _this.data('gif');
        /* add the link to publisher data */
        publisher.data('scraping', link);
        var template = render_template('#pubisher-gif', {'src': link['source_url']});
        /* show the publisher scraper */
        publisher.find('.publisher-scraper').html(template).fadeIn();
        $('.js_publisher-tab[data-tab="gif"]').addClass('activated');
    });
    /* publisher gif remover */
    $('body').on('click', '.js_publisher-gif-remover', function() {
        var publisher = $(this).parents('.publisher');
        /* remove the link from publisher data */
        publisher.removeData('scraping');
        /* hide the publisher scraper */
        publisher.find('.publisher-scraper').html('').fadeOut();
        /* handle publisher tab */
        publisher_tab(publisher, "gif");
        publisher.find('.js_publisher-tab[data-tab="gif"]').removeClass('activated');
        publisher.find('.js_publisher-gif-search').val('');
    });
    /* publisher poll */
    $('body').on('keyup', '.publisher-meta[data-meta="poll"] input', function() {
        var $emptyFields = $('.publisher-meta[data-meta="poll"] input').filter(function() {
            return $.trim(this.value) === "";
        });
        if($emptyFields.length == $('.publisher-meta[data-meta="poll"] input').length) {
            $('.js_publisher-tab[data-tab="poll"]').removeClass('activated');
        } else {
            $('.js_publisher-tab[data-tab="poll"]').addClass('activated');
        }
    });
    $('body').on('focus', '.publisher-meta[data-meta="poll"] input:last', function() {
        $(render_template('#poll-option')).insertAfter($(this).parent()).fadeIn();
    });
    /* publisher attachment image remover */
    $('body').on('click', '.js_publisher-attachment-image-remover, .js_publisher-mini-attachment-image-remover', function() {
        var mini = ($(this).hasClass('js_publisher-mini-attachment-image-remover'))? true : false;
        var item = $(this).parents('li.item');
        var src = item.data('src');
        /* remove the attachment from publisher data */
        var publisher = (!mini)? $(this).parents('.publisher') : $(this).parents('.publisher-mini');
        var files = publisher.data('photos');
        delete files[src];
        if(Object.keys(files).length > 0) {
            publisher.data('photos', files);
        } else {
            publisher.removeData('photos');
            if(!mini) {
                publisher.find('.attachments').hide();
                /* handle publisher tab */
                publisher_tab(publisher, "photos");
                publisher.find('.js_publisher-tab[data-tab="photos"]').removeClass('activated');
            }
        }
        /* remove the attachment item */
        item.remove();
    });
    /* publisher mini attachment video remover */
    $('body').on('click', '.js_publisher-mini-attachment-video-remover', function() {
        var item = $(this).parents('li.item');
        var src = item.data('src');
        /* remove the attachment from publisher data */
        var publisher = $(this).parents('.publisher-mini');
        var files = publisher.data('video');
        delete files[src];
        if(Object.keys(files).length > 0) {
            publisher.data('video', files);
        } else {
            publisher.removeData('video');
        }
        /* remove the attachment item */
        item.remove();
    });
    /* publisher attachment file remover (video|audio|file) */
    $('body').on('click', '.js_publisher-attachment-file-remover', function() {
        var _this = $(this);
        var type = _this.data("type");
        var publisher = _this.parents('.publisher');
        /* remove the uploads from publisher data */
        publisher.removeData(type);
        publisher.find('.publisher-meta[data-meta="'+type+'"]').hide();
        if(type == "video") {
            var attachments_video_thumbnail = publisher.find('.publisher-custom-thumbnail');
            attachments_video_thumbnail.find('.x-image').removeAttr("style");
            attachments_video_thumbnail.find('input.js_x-image-input').val("");
            attachments_video_thumbnail.hide();
        }
        /* handle publisher tab */
        publisher_tab(publisher, type);
        publisher.find('.js_publisher-tab[data-tab="'+type+'"]').removeClass('activated');
    });
    /* publish new post */
    $('body').on('click', '.js_publisher', function() {
        var _this = $(this);
        /* get posts stream */
        var posts_stream =  $('.js_posts_stream');
        /* get publisher */
        var publisher = _this.parents('.publisher');
        /* get handle */
        var handle = publisher.data('handle');
        /* get (user|page|group|event) id */
        var id = publisher.data('id');
        /* get text */
        var textarea = publisher.find('textarea');
        /* get link */
        var link = publisher.data('scraping');
        /* get photos */
        var attachments = publisher.find('.attachments');
        var photos = publisher.data('photos');
        /* get album */
        var album_meta = publisher.find('.publisher-meta[data-meta="album"]');
        var album = album_meta.find('input');
        /* get location */
        var location_meta = publisher.find('.publisher-meta[data-meta="location"]');
        var location = location_meta.find('input');
        /* get feeling */
        var feeling_meta = publisher.find('.publisher-meta[data-meta="feelings"]');
        var feeling = feeling_meta.find('input');
        /* get colored pattern */
        var colored_pattern_meta = publisher.find('.publisher-meta[data-meta="colored"]');
        /* get gif */
        var gif_meta = publisher.find('.publisher-meta[data-meta="gif"]');
        var gif = gif_meta.find('input');
        /* get poll options */
        var poll_options = [];
        publisher.find('.publisher-meta[data-meta="poll"] input').each(function(index) {
            if($(this).val() != "") {
                poll_options[index] = $(this).val();
            }
        });
        poll_options = (poll_options.length > 0)? poll_options : undefined;
        /* get video */
        var attachments_video = publisher.find('.publisher-meta[data-meta="video"]');
        var video = publisher.data('video');
        var attachments_video_thumbnail = publisher.find('.publisher-custom-thumbnail');
        var video_thumbnail = attachments_video_thumbnail.find('input.js_x-image-input').val();
        /* get audio */
        var attachments_audio = publisher.find('.publisher-meta[data-meta="audio"]');
        var audio = publisher.data('audio');
        /* get file */
        var attachments_file = publisher.find('.publisher-meta[data-meta="file"]');
        var file = publisher.data('file');
        /* get privacy */
        var privacy = publisher.find('.btn-group').data('value');
        /* return if no data to post */
        if(is_empty(textarea.val()) && link === undefined && poll_options === undefined && video === undefined && audio === undefined && file === undefined && photos === undefined && feeling.val() == "" && location.val() == "" ) {
            return;
        }
        /* button loading */
        button_status(_this, "loading");
        posts_stream.data('loading', true);
        $.post(api['posts/post'], {'handle': handle, 'id': id, 'message': textarea.val(), 'link': JSON.stringify(link), 'photos': JSON.stringify(photos), 'album':album.val(), 'location':location.val(), 'feeling_action':feeling.data('action'), 'feeling_value':feeling.val(), 'colored_pattern':publisher.data('colored_pattern'), 'poll_options': JSON.stringify(poll_options), 'video': JSON.stringify(video), 'video_thumbnail': video_thumbnail, 'audio': JSON.stringify(audio), 'file': JSON.stringify(file), 'privacy': privacy}, function(response) {
            if(response.callback) {
                /* button reset */
                button_status(_this, "reset");
                eval(response.callback);
            } else {
                /* button reset */
                button_status(_this, "reset");
                /* prepare publisher */
                /* remove (active|activated|disabled) from all tabs */
                publisher.find('.js_publisher-tab').removeClass('active activated disabled');
                textarea.val('').removeAttr('style');
                textarea.attr('placeholder', textarea.data('init-placeholder'));
                /* hide & empty album */
                album.val('');
                album_meta.hide();
                /* hide & empty location */
                location.val('');
                location_meta.hide();
                /* hide & empty feelings */
                feeling_meta.hide();
                $("#feelings-menu-toggle").removeClass('active').text($("#feelings-menu-toggle").data("init-text"));
                $('#feelings-data').hide();
                $('#feelings-data input').show().attr('placeholder', $("#feelings-menu-toggle").data('init-text')).removeData('action').val('');
                $('#feelings-data span').html('');
                $('.js_publisher-feelings').removeClass('activated active');
                /* hide & empty colored patterns */
                publisher.removeData("colored_pattern");
                publisher.find(".publisher-message").removeAttr('style').removeClass("colored");
                colored_pattern_meta.hide();
                /* hide & empty gif */
                gif.val('');
                gif_meta.hide();
                /* hide & remove poll meta */
                $('.publisher-meta[data-meta="poll"]').hide().find('input').val('');
                /* hide & empty attachments */
                attachments.hide();
                attachments.find('li.item').remove();
                publisher.removeData('photos');
                attachments_video.hide();
                publisher.removeData('video');
                attachments_audio.hide();
                publisher.removeData('audio');
                attachments_file.hide();
                publisher.removeData('file');
                /* hide & empty video custom thumbnail */
                attachments_video_thumbnail.find('.x-image').removeAttr("style");
                attachments_video_thumbnail.find('input.js_x-image-input').val("");
                attachments_video_thumbnail.hide();
                /* hide & empty scraper */
                $('.publisher-scraper').hide().html('');
                publisher.removeData('scraping');
                /* collapse the publisher */
                $('body').removeClass('publisher-focus');
                publisher.find('.publisher-slider').slideUp();
                publisher.find('.publisher-emojis').fadeOut();
                /* attache the new post */
                $('.js_posts_stream').find('ul:first').prepend(response.post);
                /* release the loading status */
                posts_stream.removeData('loading');
                /* rerun photo grid */
                photo_grid();
                /* close the window if share plugin */
                if(current_page == "share") {
                    window.close();
                }
            }
        }, "json")
        .fail(function() {
            /* button reset */
            button_status(_this, "reset");
            modal('#modal-message', {title: __['Error'], message: __['There is something that went wrong!']});
        });
    });
    /* publish new story */
    $('body').on('click', '.js_publisher-story', function() {
        var _this = $(this);
        /* get publisher */
        var publisher = _this.parents('.publisher-mini');
        /* get text */
        var textarea = publisher.find('textarea');
        /* get photos */
        var photos = publisher.data('photos');
        /* get videos */
        var videos = publisher.data('video');
        /* return if no data to post */
        if(photos === undefined && videos === undefined) {
            return;
        }
        /* button loading */
        button_status(_this, "loading");
        $.post(api['posts/story'], {'do': 'publish', 'message': textarea.val(), 'photos': JSON.stringify(photos), 'videos': JSON.stringify(videos)}, function(response) {
            if(response.callback) {
                /* button reset */
                button_status(_this, "reset");
                eval(response.callback);
            }
        }, "json")
        .fail(function() {
            /* button reset */
            button_status(_this, "reset");
            modal('#modal-message', {title: __['Error'], message: __['There is something that went wrong!']});
        });
    });
    /* publish new product */
    $('body').on('click', '.js_publisher-product', function() {
        var _this = $(this);
        /* get publisher */
        var publisher = _this.parents('.publisher-mini');
        /* get product */
        var product = {};
        publisher.find('input').each(function(index) {
            if($(this).val() != "") {
                product[$(this).attr('name')] = $(this).val();
            }
        });
        if(!$.isEmptyObject(product)) {
            product['category'] = publisher.find('select[name="category"]').val();
            product['status'] = publisher.find('select[name="status"]').val();
        } else {
            return;
        }
        /* get text */
        var textarea = publisher.find('textarea');
        /* get photos */
        var photos = publisher.data('photos');
        /* button loading */
        button_status(_this, "loading");
        $.post(api['posts/product'], {'do': 'publish', 'product': JSON.stringify(product), 'message': textarea.val(), 'photos': JSON.stringify(photos)}, function(response) {
            /* button reset */
            button_status(_this, "reset");
            if(response.error) {
                publisher.find('.alert.alert-danger').html(response.message).slideDown();
            } else if(response.callback) {
                eval(response.callback);
            }
        }, "json")
        .fail(function() {
            /* button reset */
            button_status(_this, "reset");
            modal('#modal-message', {title: __['Error'], message: __['There is something that went wrong!']});
        });
    });
    /* publish new photos to album */
    $('body').on('click', '.js_publisher-album', function() {
        var _this = $(this);
        /* get publisher */
        var publisher = _this.parents('.publisher');
        /* get album id */
        var id = publisher.data('id');
        /* get text */
        var textarea = publisher.find('textarea');
        /* get photos */
        var attachments = publisher.find('.attachments');
        var photos = publisher.data('photos');
        /* get location */
        var location_meta = publisher.find('.publisher-meta[data-meta="location"]');
        var location = location_meta.find('input');
        /* get feeling */
        var feeling_meta = publisher.find('.publisher-meta[data-meta="feelings"]');
        var feeling = feeling_meta.find('input');
        /* get privacy */
        var privacy = publisher.find('.btn-group').data('value');
        /* return if no data to post */
        if(photos === undefined) {
            return;
        }
        /* button loading */
        button_status(_this, "loading");
        $.post(api['albums/action'], {'do': 'add_photos', 'id': id, 'message': textarea.val(), 'photos': JSON.stringify(photos), 'feeling_action':feeling.data('action'), 'feeling_value':feeling.val(), 'location':location.val(), 'privacy': privacy}, function(response) {
            if(response.callback) {
                /* button reset */
                button_status(_this, "reset");
                eval(response.callback);
            }
        }, "json")
        .fail(function() {
            /* button reset */
            button_status(_this, "reset");
            modal('#modal-message', {title: __['Error'], message: __['There is something that went wrong!']});
        });
    });


    // run posts filter
    $('body').on('click', '.js_posts-filter .dropdown-item', function() {
        var posts_stream =  $('.js_posts_stream');
        var posts_loader = $('.js_posts_loader');
        var data = {};
        data['get'] = posts_stream.data('get');
        data['filter'] = $(this).data('value');
        if(posts_stream.data('id') !== undefined) {
            data['id'] = posts_stream.data('id');
        }
        posts_stream.data('loading', true);
        posts_stream.data('filter', data['filter']);
        posts_stream.html('');
        posts_loader.show();
        /* get filtered posts */
        $.post(api['posts/filter'], data, function(response) {
            if(response.callback) {
                eval(response.callback);
            } else {
                if(response.posts) {
                    posts_loader.hide();
                    posts_stream.removeData('loading');
                    posts_stream.html(response.posts);
                    setTimeout(photo_grid(), 200);
                }
            }
        }, 'json');
    });


    // run lightbox
    /* open the lightbox */
    $('body').on('click', '.js_lightbox', function(e) {
        e.preventDefault();
        /* initialize vars */
        var id = $(this).data('id');
        var image = $(this).data('image');
        var context = $(this).data('context');
        /* load lightbox */
        var lightbox = $(render_template("#lightbox", {'image': image}));
        var next = lightbox.find('.lightbox-next');
        var prev = lightbox.find('.lightbox-prev');
        $('body').addClass('lightbox-open').append(lightbox.fadeIn('fast'));
        /* get photo */
        $.post(api['posts/lightbox'], {'id': id, 'context': context}, function(response) {
            /* check the response */
            if(response.callback) {
                $('body').removeClass('lightbox-open');
                $('.lightbox').remove();
                eval(response.callback);
            } else {
                /* update next */
                if(response.next != null) {
                    next.show();
                    next.data('id', response.next.photo_id);
                    next.data('source', response.next.source);
                    next.data('context', context);
                } else {
                    next.hide();
                    next.data('id', '');
                    next.data('source', '');
                    next.data('context', '');
                }
                /* update prev */
                if(response.prev != null) {
                    prev.show();
                    prev.data('id', response.prev.photo_id);
                    prev.data('source', response.prev.source);
                    prev.data('context', context);
                } else {
                    prev.hide();
                    prev.data('id', '');
                    prev.data('source', '');
                    prev.data('context', '');
                }
                lightbox.find('.lightbox-post').replaceWith(response.lightbox);
            }
        }, 'json');
    });
    $('body').on('click', '.js_lightbox-slider', function(e) {
        /* initialize vars */
        var id = $(this).data('id');
        var image = $(this).data('source');
        var context = $(this).data('context');
        /* load lightbox */
        var lightbox = $(this).parents('.lightbox');
        var next = lightbox.find('.lightbox-next');
        var prev = lightbox.find('.lightbox-prev');
        /* loading */
        next.hide();
        prev.hide();
        lightbox.find('.lightbox-post').html('<div class="loader mtb10"></div>');
        lightbox.find('.lightbox-preview img').attr('src', uploads_path + '/' + image);
        /* get photo */
        $.post(api['posts/lightbox'], {'id': id, 'context': context}, function(response) {
            /* check the response */
            if(response.callback) {
                $('body').removeClass('lightbox-open');
                lightbox.remove();
                eval(response.callback);
            } else {
                /* update next */
                if(response.next != null) {
                    next.show();
                    next.data('id', response.next.photo_id);
                    next.data('source', response.next.source);
                    next.data('context', context);
                } else {
                    next.hide();
                    next.data('id', '');
                    next.data('source', '');
                    next.data('context', '');
                }
                /* update prev */
                if(response.prev != null) {
                    prev.show();
                    prev.data('id', response.prev.photo_id);
                    prev.data('source', response.prev.source);
                    prev.data('context', context);
                } else {
                    prev.hide();
                    prev.data('id', '');
                    prev.data('source', '');
                    prev.data('context', '');
                }
                lightbox.find('.lightbox-post').replaceWith(response.lightbox);
            }
        }, 'json');
    });
    /* open the lightbox with no data */
    $('body').on('click', '.js_lightbox-nodata', function(e) {
        e.preventDefault();
        /* initialize vars */
        var image = $(this).data('image');
        /* load lightbox */
        var lightbox = $(render_template("#lightbox-nodata", {'image': image}));
        $('body').addClass('lightbox-open').append(lightbox.fadeIn('fast'));
    });
    /* close the lightbox (when click outside the lightbox content) */
    $('body').on('click', '.lightbox', function(e) {
        if($(e.target).is(".lightbox")) {
            $('body').removeClass('lightbox-open');
            $('.lightbox').remove();
        }
    });
    /* close the lightbox (when click the close button) */
    $('body').on('click', '.js_lightbox-close', function() {
        $('body').removeClass('lightbox-open');
        $('.lightbox').remove();
    });
    /* close the lightbox (when press Esc button) */
    $('body').on('keydown', function(e) {
        if(e.keyCode === 27 && $('.lightbox').length > 0) {
            $('body').removeClass('lightbox-open');
            $('.lightbox').remove();
        }
    });


    // run emoji
    /* toggle(close|open) emoji-menu */
    $('body').on('click', '.js_emoji-menu-toggle', function() {
        if($(this).parent().find('.emoji-menu').length == 0) {
            $(this).after(render_template("#emoji-menu", {'id': guid()}));
            initialize();
        }
        $(this).parent().find('.emoji-menu').toggle();
    });
    /* close emoji-menu when clicked outside */
    $('body').on('click', function(e) {
        if($(e.target).hasClass('js_emoji-menu-toggle') || $(e.target).parents('.js_emoji-menu-toggle').length > 0 || $(e.target).hasClass('emoji-menu') || $(e.target).parents('.emoji-menu').length > 0) {
           return;
       }
       $('.emoji-menu').hide();
    });
    /* add an emoji */
    $('body').on('click', '.js_emoji', function() {
        var emoji = $(this).data('emoji');
        var textarea = $(this).parents('.x-form').find('textarea');
        /* check if textarea value is empty || end with a space then no prefix space */
        var prefix = ( textarea.val() == "" || /\s+$/.test(textarea.val()) ) ? "": " ";
        textarea.val(textarea.val()+prefix+emoji+" ").change().focus();
    });

	
	// handle post
    /* edit post */
    $('body').on('click', '.js_edit-post', function () {
        var post = $(this).parents('.post');
        if(post.find('.post-edit').length > 0) {
            return;
        }
        post.find('.post-replace').hide().after(render_template("#edit-post", {'text': post.find('.post-text-plain').text()}));
        autosize(post.find('.post-edit textarea'));
    });
    /* unedit post */
    $('body').on('click', '.js_unedit-post', function () {
        var post = $(this).parents('.post');
        post.find('.post-edit').remove();
        post.find('.post-replace').show();        
    });
    /* update post */
    function _update_post(element) {
        var _this = $(element);
        var post = _this.parents('.post');
        var id = post.data('id');
        var textarea = post.find('textarea.js_update-post');
        var message = textarea.val();
        /* check if message is empty */
        if(is_empty(message)) {
            return;
        }
        $.post(api['posts/edit'], {'handle': 'post', 'id': id, 'message': message}, function(response) {
            /* check if there is a callback */
            if(response.callback) {
                eval(response.callback);
            } else {
                post.find('.post-edit').remove();
                post.find('.post-replace').replaceWith(response.post).show();
            }
        }, 'json')
        .fail(function() {
            modal('#modal-message', {title: __['Error'], message: __['There is something that went wrong!']});
        });
    }
    $('body').on('keydown', 'textarea.js_update-post', function (event) {
        if($(window).width() >= 970 && (event.keyCode == 13 && event.shiftKey == 0)) {
            event.preventDefault();
            _update_post(this);
        }
    });
    $('body').on('click', 'li.js_update-post', function () {
        if($(window).width() < 970) {
            _update_post(this);
        }
    });
    /* edit privacy */
    $('body').on('click', '.js_edit-privacy', function () {
        var _this = $(this);
        var post = _this.parents('.post');
        var id = post.data('id');
        var privacy = _this.data('value');
        $.post(api['posts/edit'], {'handle': 'privacy', 'id': id, 'privacy': privacy}, function(response) {
            /* check if there is a callback */
            if(response.callback) {
                eval(response.callback);
            }
        }, 'json')
        .fail(function() {
            modal('#modal-message', {title: __['Error'], message: __['There is something that went wrong!']});
        });
    });
    /* delete post */
    $('body').on('click', '.js_delete-post', function (e) {
        e.preventDefault();
        var post = $(this).parents('.post');
        var id = post.data('id');
        confirm(__['Delete Post'], __['Are you sure you want to delete this post?'], function() {
            post.hide();
            $.post(api['posts/reaction'], {'do': 'delete_post', 'id': id}, function(response) {
                /* check the response */
                $('#modal').modal('hide');
                if(response.refresh && (current_page == "profile" || current_page == "page" || current_page == "group" || current_page == "event")) {
                    window.location.reload();
                } else if (response.callback) {
                    eval(response.callback);
                }
            }, 'json')
            .fail(function() {
                modal('#modal-message', {title: __['Error'], message: __['There is something that went wrong!']});
            });
        });
    });
    /* approve post */
    $('body').on('click', '.js_approve-post', function (e) {
        e.preventDefault();
        var _this = $(this);
        var post = _this.parents('.post');
        var id = post.data('id');
        /* button loading */
        button_status(_this, "loading");
        $.post(api['posts/reaction'], {'do': 'approve_post', 'id': id}, function(response) {
            /* button reset */
            button_status(_this, "reset");
            /* check the response */
            if (response.callback) {
                eval(response.callback);
            } else {
                post.hide();
            }
        }, 'json')
        .fail(function() {
            /* button reset */
            button_status(_this, "reset");
            modal('#modal-message', {title: __['Error'], message: __['There is something that went wrong!']});
        });
    });
    /* delete article */
    $('body').on('click', '.js_delete-article', function (e) {
        e.preventDefault();
        var id = $(this).data('id');
        confirm(__['Delete Post'], __['Are you sure you want to delete this post?'], function() {
            $.post(api['posts/reaction'], {'do': 'delete_post', 'id': id}, function(response) {
                /* check the response */
                $('#modal').modal('hide');
                if(response.callback) {
                    eval(response.callback);
                }
                window.location = site_path + "/articles";
            }, 'json')
            .fail(function() {
                modal('#modal-message', {title: __['Error'], message: __['There is something that went wrong!']});
            });
        });
    });
    /* sold post */
    $('body').on('click', '.js_sold-post', function () {
        var _this = $(this);
        var post = _this.parents('.post');
        var id = post.data('id');
        $.post(api['posts/reaction'], {'do': 'sold_post', 'id': id}, function(response) {
            /* check the response */
            if(response.callback) {
                eval(response.callback);
            } else {
                _this.removeClass('js_sold-post').addClass('js_unsold-post').find('span').text(__['Mark as Available']);
            }
        }, 'json')
        .fail(function() {
            modal('#modal-message', {title: __['Error'], message: __['There is something that went wrong!']});
        });
    });
    /* unsold post */
    $('body').on('click', '.js_unsold-post', function () {
        var _this = $(this);
        var post = _this.parents('.post');
        var id = post.data('id');
        $.post(api['posts/reaction'], {'do': 'unsold_post', 'id': id}, function(response) {
            /* check the response */
            if(response.callback) {
                eval(response.callback);
            } else {
                _this.removeClass('js_unsold-post').addClass('js_sold-post').find('span').text(__['Mark as Sold']);
            }
        }, 'json')
        .fail(function() {
            modal('#modal-message', {title: __['Error'], message: __['There is something that went wrong!']});
        });
    });
    /* save post */
    $('body').on('click', '.js_save-post', function () {
        var _this = $(this);
        var post = _this.parents('.post');
        var id = post.data('id');
        $.post(api['posts/reaction'], {'do': 'save_post', 'id': id}, function(response) {
            /* check the response */
            if(response.callback) {
                eval(response.callback);
            } else {
                _this.removeClass('js_save-post').addClass('js_unsave-post').find('span').text(__['Unsave Post']);
            }
        }, 'json')
        .fail(function() {
            modal('#modal-message', {title: __['Error'], message: __['There is something that went wrong!']});
        });
    });
    /* unsave post */
    $('body').on('click', '.js_unsave-post', function () {
        var _this = $(this);
        var post = _this.parents('.post');
        var id = post.data('id');
        $.post(api['posts/reaction'], {'do': 'unsave_post', 'id': id}, function(response) {
            /* check the response */
            if(response.callback) {
                eval(response.callback);
            } else {
                _this.removeClass('js_unsave-post').addClass('js_save-post').find('span').text(__['Save Post']);
            }
        }, 'json')
        .fail(function() {
            modal('#modal-message', {title: __['Error'], message: __['There is something that went wrong!']});
        });
    });
    /* boost post */
    $('body').on('click', '.js_boost-post', function () {
        var _this = $(this);
        var post = _this.parents('.post');
        var id = post.data('id');
        $.post(api['posts/reaction'], {'do': 'boost_post', 'id': id}, function(response) {
            /* check the response */
            if(response.callback) {
                eval(response.callback);
            } else {
                _this.removeClass('js_boost-post').addClass('js_unboost-post').find('span').text(__['Unboost Post']);
            }
        }, 'json')
        .fail(function() {
            modal('#modal-message', {title: __['Error'], message: __['There is something that went wrong!']});
        });
    });
    /* unboost post */
    $('body').on('click', '.js_unboost-post', function () {
        var _this = $(this);
        var post = _this.parents('.post');
        var id = post.data('id');
        $.post(api['posts/reaction'], {'do': 'unboost_post', 'id': id}, function(response) {
            /* check the response */
            if(response.callback) {
                eval(response.callback);
            } else {
                _this.removeClass('js_unboost-post').addClass('js_boost-post').find('span').text(__['Boost Post']);
            }
        }, 'json')
        .fail(function() {
            modal('#modal-message', {title: __['Error'], message: __['There is something that went wrong!']});
        });
    });
    /* pin post */
    $('body').on('click', '.js_pin-post', function () {
        var _this = $(this);
        var post = _this.parents('.post');
        var id = post.data('id');
        $.post(api['posts/reaction'], {'do': 'pin_post', 'id': id}, function(response) {
            /* check the response */
            if(response.callback) {
                eval(response.callback);
            } else {
                _this.removeClass('js_pin-post').addClass('js_unpin-post').find('span').text(__['Unpin Post']);
            }
        }, 'json')
        .fail(function() {
            modal('#modal-message', {title: __['Error'], message: __['There is something that went wrong!']});
        });
    });
    /* unpin post */
    $('body').on('click', '.js_unpin-post', function () {
        var _this = $(this);
        var post = _this.parents('.post');
        var id = post.data('id');
        $.post(api['posts/reaction'], {'do': 'unpin_post', 'id': id}, function(response) {
            /* check the response */
            if(response.callback) {
                eval(response.callback);
            } else {
                _this.removeClass('js_unpin-post').addClass('js_pin-post').find('span').text(__['Pin Post']);
            }
        }, 'json')
        .fail(function() {
            modal('#modal-message', {title: __['Error'], message: __['There is something that went wrong!']});
        });
    });
    /* hide post */
    $('body').on('click', '.js_hide-post', function () {
        var post = $(this).parents('.post');
        var id = post.data('id');
        $.post(api['posts/reaction'], {'do': 'hide_post', 'id': id}, function(response) {
            /* check the response */
            if(response.callback) {
                eval(response.callback);
            } else {
                post.hide();
                post.after(render_template("#hidden-post", {'id': id}));
            }
        }, 'json')
        .fail(function() {
            modal('#modal-message', {title: __['Error'], message: __['There is something that went wrong!']});
        });
    });
    /* unhide post */
    $('body').on('click', '.js_unhide-post', function () {
        var post = $(this).parents('.post');
        var id = post.data('id');
        $.post(api['posts/reaction'], {'do': 'unhide_post', 'id': id}, function(response) {
            /* check the response */
            if(response.callback) {
                eval(response.callback);
            } else {
                post.prev().show();
                post.remove();
            }
        }, 'json')
        .fail(function() {
            modal('#modal-message', {title: __['Error'], message: __['There is something that went wrong!']});
        });
    });
    /* hide author */
    $('body').on('click', '.js_hide-author', function () {
        var post = $(this).parents('.post');
        var author_id = $(this).data('author-id');
        var author_name = $(this).data('author-name');
        var id = post.data('id');
        $.post(api['users/connect'], {'do': 'unfollow', 'id': author_id} , function(response) {
            if(response.callback) {
                eval(response.callback);
            } else {
                post.hide();
                post.after(render_template("#hidden-author", {'id': id, 'name': author_name, 'uid': author_id}));
            }
        }, "json")
        .fail(function() {
            modal('#modal-message', {title: __['Error'], message: __['There is something that went wrong!']});
        });
    });
    /* unhide author */
    $('body').on('click', '.js_unhide-author', function () {
        var post = $(this).parents('.post');
        var author_id = $(this).data('author-id');
        var author_name = $(this).data('author-name');
        var id = post.data('id');
        $.post(api['users/connect'], {'do': 'follow', 'id': author_id} , function(response) {
            if(response.callback) {
                eval(response.callback);
            } else {
                post.prev().show();
                post.remove();
            }
        }, "json")
        .fail(function() {
            modal('#modal-message', {title: __['Error'], message: __['There is something that went wrong!']});
        });
    });
    /* disable comments */
    $('body').on('click', '.js_disable-post-comments', function () {
        var _this = $(this);
        var post = _this.parents('.post');
        var comment_form = post.find('.comment:last');
        var id = post.data('id');
        _this.removeClass('js_disable-post-comments').addClass('js_enable-post-comments').find('span').text(__['Turn on Commenting']);
        post.find('.js_comment, .js_reply, .js_reply-form').hide();
        post.find('.js_comment-form').hide();
        post.find('.js_comment-disabled-msg').show();
        $.post(api['posts/reaction'], {'do': 'disable_comments', 'id': id}, function(response) {
            /* check the response */
            if(response.callback) {
                eval(response.callback);
            }
        }, 'json')
        .fail(function() {
            modal('#modal-message', {title: __['Error'], message: __['There is something that went wrong!']});
        });
    });
    /* enable comments */
    $('body').on('click', '.js_enable-post-comments', function () {
        var _this = $(this);
        var post = _this.parents('.post');
        var comment_form = post.find('.comment:last');
        var id = post.data('id');
        _this.removeClass('js_enable-post-comments').addClass('js_disable-post-comments').find('span').text(__['Turn off Commenting']);
        post.find('.js_comment, .js_reply').show();
        post.find('.js_comment-form').show();
        post.find('.js_comment-disabled-msg').hide();
        $.post(api['posts/reaction'], {'do': 'enable_comments', 'id': id}, function(response) {
            /* check the response */
            if(response.callback) {
                eval(response.callback);
            }
        }, 'json')
        .fail(function() {
            modal('#modal-message', {title: __['Error'], message: __['There is something that went wrong!']});
        });
    });
    /* disallow post */
    $('body').on('click', '.js_disallow-post', function () {
        var _this = $(this);
        var post = $(this).parents('.post');
        var id = post.data('id');
        confirm(__['Hide from Timeline'], __['Are you sure you want to hide this post from your profile timeline? It may still appear in other places like newsfeed and search results'], function() {
            $.post(api['posts/reaction'], {'do': 'disallow_post', 'id': id}, function(response) {
                /* check the response */
                $('#modal').modal('hide');
                /* check the response */
                if(response.callback) {
                    eval(response.callback);
                } else {
                    post.addClass('is_hidden');
                    _this.removeClass('js_disallow-post').addClass('js_allow-post').find('span').text(__['Allow on Timeline']);
                }
            }, 'json')
            .fail(function() {
                modal('#modal-message', {title: __['Error'], message: __['There is something that went wrong!']});
            });
        });
    });
    /* allow post */
    $('body').on('click', '.js_allow-post', function () {
        var _this = $(this);
        var post = _this.parents('.post');
        var id = post.data('id');
        $.post(api['posts/reaction'], {'do': 'allow_post', 'id': id}, function(response) {
            /* check the response */
            if(response.callback) {
                eval(response.callback);
            } else {
                post.removeClass('is_hidden');
                _this.removeClass('js_allow-post').addClass('js_disallow-post').find('span').text(__['Hide from Timeline']);
            }
        }, 'json')
        .fail(function() {
            modal('#modal-message', {title: __['Error'], message: __['There is something that went wrong!']});
        });
    });
    /* show shared post attachments */
    $('body').on('click', '.js_show-attachments', function () {
        $(this).next().toggle();
    });
    /* poll vote */
    $('body').on('click', '.js_poll-vote', function (event) {
        if($(event.target).is('input[type="radio"]')) {
            return false;
        }
        var _this = $(this);
        var id = _this.data('id');
        var radio = _this.find('input[type="radio"]');
        var parent = _this.parents('.poll-options');
        var poll_votes = parent.data('poll-votes');
        var checked_id = parent.find('input[type="radio"]:checked').parents('.poll-option').data('id');
        if(checked_id === undefined) {
            var _do = "add_vote";
        } else if (checked_id == id) {
            var _do = "delete_vote";
        } else {
            var _do = "change_vote";
        }
        if(_do == "add_vote") {
            /* update poll votes */
            poll_votes = poll_votes + 1;
            parent.data('poll-votes', poll_votes);
            /* update all option */
            parent.find('.poll-option').each(function() {
                var option_votes = $(this).data('option-votes');
                /* update option votes */
                if($(this).data('id') == id) {
                    option_votes = option_votes + 1;
                    $(this).data('option-votes', option_votes);
                }
                var width = (option_votes / poll_votes) * 100;
                $(this).find('.percentage-bg').width(width+'%');
                $(this).next('.poll-voters').find('.more').html(option_votes);
            });
            /* uncheck all inputs */
            parent.find('input[type="radio"]').removeAttr("checked").prop("checked", false);
            /* check the active radio */
            radio.attr("checked", "checked").prop("checked", true);

        } else if (_do == "delete_vote") {
            /* update poll votes */
            poll_votes = poll_votes - 1;
            parent.data('poll-votes', poll_votes);
            /* update all option */
            parent.find('.poll-option').each(function() {
                var option_votes = $(this).data('option-votes');
                /* update option votes */
                if($(this).data('id') == id) {
                    option_votes = option_votes - 1;
                    $(this).data('option-votes', option_votes);
                }
                var width = (poll_votes == 0)? 0 : (option_votes / poll_votes) * 100;
                $(this).find('.percentage-bg').width(width+'%');
                $(this).next('.poll-voters').find('.more').html(option_votes);
            });
            /* uncheck all inputs */
            parent.find('input[type="radio"]').removeAttr("checked").prop("checked", false);

        } else {
            /* update poll votes */
            poll_votes = poll_votes;
            /* update all option */
            parent.find('.poll-option').each(function() {
                var option_votes = $(this).data('option-votes');
                /* update option votes */
                if($(this).data('id') == id) {
                    option_votes = option_votes + 1;
                    $(this).data('option-votes', option_votes);
                }
                if($(this).data('id') == checked_id) {
                    option_votes = option_votes - 1;
                    $(this).data('option-votes', option_votes);
                }
                var width = (option_votes / poll_votes) * 100;
                $(this).find('.percentage-bg').width(width+'%');
                $(this).next('.poll-voters').find('.more').html(option_votes);
            });
            /* uncheck all inputs */
            parent.find('input[type="radio"]').removeAttr("checked").prop("checked", false);
            /* check the active radio */
            radio.attr("checked", "checked").prop("checked", true);
        }
        $.post(api['posts/reaction'], {'do': _do, 'id': id, 'checked_id': checked_id}, function(response) {
            /* check the response */
            if(response.callback) {
                eval(response.callback);
            }
        }, 'json')
        .fail(function() {
            modal('#modal-message', {title: __['Error'], message: __['There is something that went wrong!']});
        });
    });
    $('body').on('mouseup', '.js_poll-vote input', function (event) {
        event.stopPropagation();
        event.preventDefault();
        $(this).parents('.js_poll-vote').trigger('click');
        return false;
    });


    // handle comment
    /* comments toggle */
    $('body').on('click', '.js_comments-toggle', function () {
        $(this).parents('.post, .lightbox-post').find('.post-footer').toggle();
    });
    /* show comment form */
    $('body').on('click', '.js_comment', function () {
        var footer = $(this).parents('.post, .lightbox-post, .article').find('.post-footer');
        footer.show();
        footer.find('.post-comments').show();
        footer.find('textarea.js_post-comment').focus();
    });
    /* comment attachment remover */
    $('body').on('click', '.js_comment-attachment-remover', function() {
        var comment = $(this).parents('.comment');
        var attachments = comment.find('.comment-attachments');
        var item = $(this).parents('li.item');
        /* remove the attachment from comment data */
        comment.removeData('photos');
        /* remove the attachment item */
        item.remove();
        /* hide attachments */
        attachments.hide();
        /* show comment form tools */
        comment.find('.x-form-tools-attach').show();
    });
    /* post comment */
    function _comment(element) {
        var _this = $(element);
        var comment = _this.parents('.comment');
        var stream = _this.parents('.post-comments').find('.js_comments');
        var handle = comment.data('handle');
        var id = comment.data('id');
        var textarea = comment.find('textarea.js_post-comment');
        var message = textarea.val();
        var attachments = comment.find('.comment-attachments');
        /* check if there is current (sending) process */
        if(comment.data('sending')) {
            return false;
        }
        /* check if there is filtering process */
        if(stream.data('filtering')) {
            return false;
        }
        /* get photo from comment data */
        var photo = comment.data('photos');
        /* check if message is empty */
        if(is_empty(message) && !photo) {
            return;
        }
        /* add currenet sending process */
        comment.data('sending', true);
        $.post(api['posts/comment'], {'handle': handle, 'id': id, 'message': message, 'photo': JSON.stringify(photo)}, function(response) {
            /* check if there is a callback */
            if(response.callback) {
                eval(response.callback);
            } else {
                textarea.val('');
                textarea.attr('style', '');
                attachments.hide();
                attachments.find('li.item').remove();
                comment.removeData('photos');
                comment.find('.x-form-tools-attach').show();
                stream.prepend(response.comment);
                /* remove currenet sending process */
                comment.removeData('sending');
            }
        }, 'json')
        .fail(function() {
            modal('#modal-message', {title: __['Error'], message: __['There is something that went wrong!']});
        });
    }
    $('body').on('keydown', 'textarea.js_post-comment', function (event) {
        if($(window).width() >= 970 && (event.keyCode == 13 && event.shiftKey == 0)) {
            event.preventDefault();
            _comment(this);
        }
    });
    $('body').on('click', 'li.js_post-comment', function () {
        if($(window).width() < 970) {
            _comment(this);
        }
    });
    /* replies toggle */
    $('body').on('click', '.js_replies-toggle', function () {
        $(this).parents('.comment').find('.comment-replies').show();
        $(this).remove();
    });
    /* show reply form */
    $('body').on('click', '.js_reply', function () {
        var comment = $(this).parents('.comment');
        var form = comment.find('.js_reply-form');
        var textarea = form.find('textarea:first');
        var username = $(this).data('username') || "";
        comment.find('.js_replies-toggle').remove();
        comment.find('.comment-replies').show();
        form.show();
        (username == "")? textarea.val(''): textarea.val('['+username+'] ');
        textarea.focus();
    });
    /* post reply */
    function _reply(element) {
        var _this = $(element);
        var comment = _this.parents('.comment');
        var stream = comment.find('.js_replies');
        var handle = 'comment';
        var id = comment.data('id');
        var textarea = comment.find('textarea.js_post-reply');
        var message = textarea.val();
        var attachments = comment.find('.comment-attachments');
        /* get photo from comment data */
        var photo = comment.data('photos');
        /* check if message is empty */
        if(is_empty(message) && !photo) {
            return;
        }
        $.post(api['posts/comment'], {'handle': handle, 'id': id, 'message': message, 'photo': JSON.stringify(photo)}, function(response) {
            /* check if there is a callback */
            if(response.callback) {
                eval(response.callback);
            } else {
                textarea.val('');
                textarea.attr('style', '');
                attachments.hide();
                attachments.find('li.item').remove();
                comment.removeData('photos');
                comment.find('.x-form-tools-attach').show();
                stream.append(response.comment);
            }
        }, 'json')
        .fail(function() {
            modal('#modal-message', {title: __['Error'], message: __['There is something that went wrong!']});
        });
    }
    $('body').on('keydown', 'textarea.js_post-reply', function (event) {
        if($(window).width() >= 970 && (event.keyCode == 13 && event.shiftKey == 0)) {
            event.preventDefault();
            _reply(this);
        }
    });
    $('body').on('click', 'li.js_post-reply', function () {
        if($(window).width() < 970) {
            _reply(this);
        }
    });
    /* delete comment */
    $('body').on('click', '.js_delete-comment', function (e) {
        e.preventDefault();
        var comment = $(this).closest('.comment');
        var id = comment.data('id');
        confirm(__['Delete Comment'], __['Are you sure you want to delete this comment?'], function() {
            comment.hide();
            $.post(api['posts/reaction'], {'do': 'delete_comment', 'id': id}, function(response) {
                /* check the response */
                if(response.callback) {
                    eval(response.callback);
                } else {
                    $('#modal').modal('hide');
                }
            }, 'json')
            .fail(function() {
                modal('#modal-message', {title: __['Error'], message: __['There is something that went wrong!']});
            });
        });
    });
    /* edit comment */
    $('body').on('click', '.js_edit-comment', function (e) {
        e.preventDefault();
        var comment = $(this).closest('.comment');
        comment.find('.comment-data:first').hide().after(render_template("#edit-comment", {'text': comment.find('.comment-text-plain:first').text()}));
        autosize(comment.find('.comment-edit textarea'));
    });
    /* unedit comment */
    $('body').on('click', '.js_unedit-comment', function () {
        var comment = $(this).closest('.comment');
        comment.find('.comment-edit').remove();
        comment.find('.comment-data').show();        
    });
    /* update comment */
    function _update_comment(element) {
        var _this = $(element);
        var comment = _this.closest('.comment');
        var id = comment.data('id');
        var textarea = comment.find('textarea.js_update-comment');
        var message = textarea.val();
        var photo = comment.data('photos');
        /* check if message is empty */
        if(is_empty(message) && !photo) {
            return;
        }
        $.post(api['posts/edit'], {'handle': 'comment', 'id': id, 'message': message, 'photo': JSON.stringify(photo)}, function(response) {
            /* check if there is a callback */
            if(response.callback) {
                eval(response.callback);
            } else {
                comment.find('.comment-edit').remove();
                comment.find('.comment-replace').html(response.comment);
                comment.find('.comment-data').show();
            }
        }, 'json')
        .fail(function() {
            modal('#modal-message', {title: __['Error'], message: __['There is something that went wrong!']});
        });
    }
    $('body').on('keydown', 'textarea.js_update-comment', function (event) {
        if($(window).width() >= 970 && (event.keyCode == 13 && event.shiftKey == 0)) {
            event.preventDefault();
            _update_comment(this);
        }
    });
    $('body').on('click', 'li.js_update-comment', function (event) {
        if($(window).width() < 970) {
            _update_comment(this);
        }
    });


    // run comments filter
    $('body').on('click', '.js_comments-filter .dropdown-item', function() {
        var _this = $(this);
        var _parent =  _this.parents('.post-comments');
        var comments_stream =  _parent.find('.js_comments');
        var comments_loader = _parent.find('.js_comments-filter-loader');
        var comments_see_more = _parent.find('.js_see-more');
        var data = {};
        data['get'] = _this.data('value');
        data['id'] = _this.data('id');
        comments_see_more.data('get', data['get']);
        comments_see_more.removeData('offset');
        comments_stream.data('filtering', true);
        comments_stream.html('');
        comments_loader.show();
        comments_see_more.hide();
        /* get filtered comments */
        $.post(api['comments/filter'], data, function(response) {
            if(response.callback) {
                eval(response.callback);
            } else {
                comments_loader.hide();
                comments_see_more.show();
                comments_stream.removeData('filtering');
                comments_stream.html(response.comments);
            }
        }, 'json');
    });


    // handle reactions
    function _show_reactions(element) {
        var _this = $(element);
        var reactions = _this.find('.reactions-container');
        var offset = _this.offset();
        var reactions_height = ($(window).width() < 480)? 144 : 48;
        var posY = (offset.top - $(window).scrollTop()) - reactions_height;
        var posX = offset.left - $(window).scrollLeft();
        if($('html').attr('dir') == "RTL") {
            var right = $(window).width() - posX - _this.width();
            reactions.css({'top': posY+'px', 'right': right+'px'});
        } else {
            reactions.css({'top': posY+'px', 'left': posX+'px'});
        }
        reactions.show();
    }
    function _hide_reactions(element) {
        var _this = $(element);
        var reactions = _this.find('.reactions-container:first');
        reactions.removeAttr('style').hide();
    }
    /* reactions toggle */
    $('body').on('mouseenter', '.reactions-wrapper', function() {
        if($(window).width() >= 970) {
            /* desktop -> show the reactions */
            _show_reactions(this);
        }
    });
    $('body').on('mouseleave', '.reactions-wrapper', function() {
        if($(window).width() >= 970) {
            /* desktop -> hide the reactions */
            _hide_reactions(this);
        }
    });
    $('body').on('click', '.reactions-wrapper', function() {
        if($(window).width() < 970) {
            /* mobile -> toggle the reactions */
            if($(this).find('.reactions-container:first').is(":visible")) {
                /* hide the reactions */
                _hide_reactions(this);
            } else {
                /* hide any previous reactions */
                $('.reactions-container').removeAttr('style').hide();
                /* show the reactions */
                _show_reactions(this);
            }
        } else {
            /* desktop -> unreact */
            var _this = $(this);
            var old_reaction = _this.data('reaction');
            if(old_reaction) {
                if(_this.hasClass('js_unreact-post')) {
                    var _undo = 'unreact_post';
                    var handle = 'post';
                    var _parent = _this.closest('.post, .lightbox-post, .article');
                } else if(_this.hasClass('js_unreact-photo')) {
                    var _undo = 'unreact_photo';
                    var handle = 'photo';
                    var _parent = _this.closest('.post, .lightbox-post');
                } else if(_this.hasClass('js_unreact-comment')) {
                    var _undo = 'unreact_comment';
                    var handle = 'comment';
                    var _parent = _this.closest('.comment');
                }
                var id = _parent.data('id');
                var reactions_wrapper = _parent.find('.reactions-wrapper:first');
                /* remove unreact from reactions-wrapper */
                reactions_wrapper.removeClass('js_unreact-'+handle);
                /* remove reactions-wrapper data-reaction */
                reactions_wrapper.data('reaction', '');
                /* change reaction-btn-name */
                _parent.find('.reaction-btn-name:first').text(__['Like']).removeClass('blue red yellow orange');
                /* change reaction-btn-icon */
                _parent.find('.reaction-btn-icon:first').html('<i class="fa fa-thumbs-up fa-fw"></i>');
                /* hide reactions-container */
                _parent.find('.reactions-container:visible').removeAttr('style').hide();
                /* AJAX */
                $.post(api['posts/reaction'], {'do': _undo, 'reaction': old_reaction, 'id': id}, function(response) {
                    /* check the response */
                    if(response.callback) {
                        eval(response.callback);
                    }
                }, 'json')
                .fail(function() {
                    modal('#modal-message', {title: __['Error'], message: __['There is something that went wrong!']});
                });
            }
        }
    });
    /* close reactions when clicked outside */
    $('body').on('click', function(e) {
        if($(e.target).hasClass('reactions-wrapper') || $(e.target).parents('.reactions-wrapper').length > 0) {
           return;
       }
       $('.reactions-container').removeAttr('style').hide();
    });
    /* close reactions when user scroll (vertical) */
    var prevTop = 0;
    $(window).scroll(function(e) {
        var currentTop = $(this).scrollTop();
        if(prevTop !== currentTop) {
            prevTop = currentTop;
            $('.reactions-container').removeAttr('style').hide();
        }
    });
    /* react post & photo & comment */
    $('body').on('click', '.js_react-post, .js_react-photo, .js_react-comment', function (e) {
        e.stopPropagation();
        var _this = $(this);
        var reaction = _this.data('reaction');
        var reaction_color = _this.data('reaction-color');
        var reaction_html = _this.html();
        if(_this.hasClass('js_react-post')) {
            var _do = 'react_post';
            var _undo = 'unreact_post';
            var handle = 'post';
            var _parent = _this.closest('.post, .lightbox-post, .article');
        } else if(_this.hasClass('js_react-photo')) {
            var _do = 'react_photo';
            var _undo = 'unreact_photo';
            var handle = 'photo';
            var _parent = _this.closest('.post, .lightbox-post');
        } else if(_this.hasClass('js_react-comment')) {
            var _do = 'react_comment';
            var _undo = 'unreact_comment';
            var handle = 'comment';
            var _parent = _this.closest('.comment');
        }
        var id = _parent.data('id');
        var reactions_wrapper = _parent.find('.reactions-wrapper:first');
        var old_reaction = reactions_wrapper.data('reaction');
        /* check if user react or unreact */
        if(reactions_wrapper.hasClass('js_unreact-'+handle) && old_reaction == reaction) {
            /* [1] user unreact */
            /* remove unreact class from reactions-wrapper */
            reactions_wrapper.removeClass('js_unreact-'+handle);
            /* remove reactions-wrapper data-reaction */
            reactions_wrapper.data('reaction', '');
            /* change reaction-btn-name */
            _parent.find('.reaction-btn-name:first').text(__['Like']).removeClass('blue red yellow orange');
            /* change reaction-btn-icon */
            _parent.find('.reaction-btn-icon:first').html('<i class="fa fa-thumbs-up fa-fw"></i>');
            /* hide reactions-container */
            _parent.find('.reactions-container:visible').removeAttr('style').hide();
            /* AJAX */
            $.post(api['posts/reaction'], {'do': _undo, 'reaction': old_reaction, 'id': id}, function(response) {
                /* check the response */
                if(response.callback) {
                    eval(response.callback);
                }
            }, 'json')
            .fail(function() {
                modal('#modal-message', {title: __['Error'], message: __['There is something that went wrong!']});
            });
        } else {
            /* [2] user react */
            /* add unreact class to reactions wrapper */
            if(!reactions_wrapper.hasClass('js_unreact-'+handle)) {
                reactions_wrapper.addClass('js_unreact-'+handle);
            }
            /* change reactions-wrapper data-reaction */
            reactions_wrapper.data('reaction', reaction);
            /* change reaction-btn-name */
            _parent.find('.reaction-btn-name:first').text(reaction).removeClass('blue red yellow orange').addClass(reaction_color);
            /* change reaction-btn-icon */
            _parent.find('.reaction-btn-icon:first').html('<div class="inline-emoji no_animation">'+reaction_html+'</div>');
            /* hide reactions-container */
            _parent.find('.reactions-container:visible').removeAttr('style').hide();
            /* AJAX */
            $.post(api['posts/reaction'], {'do': _do, 'reaction': reaction, 'id': id}, function(response) {
                /* check the response */
                if(response.callback) {
                    eval(response.callback);
                }
            }, 'json')
            .fail(function() {
                modal('#modal-message', {title: __['Error'], message: __['There is something that went wrong!']});
            });
        }
    });


    // handle translator
    $('body').on('click', '.js_translator', function () {
        /* check if translator is enabled */
        if(!post_translation_enabled) {
            return;
        }
        var _this = $(this);
        var post = _this.closest('.post, .lightbox-post, .post-media');
        var text = post.find('.post-text:first').text();
        var to_lang = $('html').attr('lang').substring(0, 2);
        /* check text */
        if(is_empty(text)) {
            _this.removeClass('text-link js_translator').text(__['Translated']);
            return;
        }
        /* detect language */
        $.get('https://translate.yandex.net/api/v1.5/tr.json/detect', {'key': yandex_key, 'text': text}, function(response) {
            /* check the target langauge is current langauge */
            if(to_lang === response.lang) {
                _this.removeClass('text-link js_translator').text(__['Translated']);
                return;
            }
            /* translate */
            $.getJSON('https://translate.yandex.net/api/v1.5/tr.json/translate', {'key': yandex_key, 'text': text, 'lang': to_lang}, function(response) {
                /* check the response */
                _this.removeClass('text-link js_translator').text(__['Translated']);
                post.find('.post-text-translation:first').text(response.text).show().addClass("x-notifier");
                setTimeout(function() {
                    post.find('.post-text-translation:first').removeClass("x-notifier");
                    }, '2500');
            }, 'json')
            .fail(function() {
                modal('#modal-message', {title: __['Error'], message: __['There is something that went wrong!']});
            });
        }, 'json')
        .fail(function() {
                modal('#modal-message', {title: __['Error'], message: __['There is something that went wrong!']});
            });
    });


    // handle album
    /* delete album */
    $('body').on('click', '.js_delete-album', function() {
        var id = $(this).data('id');
        confirm(__['Delete'], __['Are you sure you want to delete this?'], function() {
            $.post(api['albums/action'], {'do': 'delete_album', 'id': id} , function(response) {
                /* check the response */
                if(response.callback) {
                    eval(response.callback);
                }
            }, 'json')
            .fail(function() {
                modal('#modal-message', {title: __['Error'], message: __['There is something that went wrong!']});
            });
        });
    });
    /* delete photo */
    $('body').on('click', '.js_delete-photo', function(e) {
        e.stopPropagation();
        e.preventDefault();
        var _this = $(this);
        var id = $(this).data('id');
        confirm(__['Delete'], __['Are you sure you want to delete this?'], function() {
            $.post(api['albums/action'], {'do': 'delete_photo', 'id': id} , function(response) {
                /* check the response */
                if(response.callback) {
                    eval(response.callback);
                } else {
                    /* remove photo */
                    _this.parents('.pg_photo').parent().fadeOut(300, function() { $(this).remove(); });
                    /* hide the confimation */
                    $('#modal').modal('hide');
                }
            }, 'json')
            .fail(function() {
                modal('#modal-message', {title: __['Error'], message: __['There is something that went wrong!']});
            });
        });
    });


    // handle announcment
    /* hide */
    $('body').on('click', '.js_announcment-remover', function() {
        var announcment = $(this).parents('.alert');
        var id = announcment.data('id');
        confirm(__['Delete'], __['Are you sure you want to delete this?'], function() {
            /* remove the announcment */
            announcment.fadeOut();
            $.post(api['posts/reaction'], {'do': 'hide_announcement', 'id': id} , function(response) {
                /* check the response */
                if(response.callback) {
                    eval(response.callback);
                }
            }, 'json')
            .fail(function() {
                modal('#modal-message', {title: __['Error'], message: __['There is something that went wrong!']});
            });
            /* hide the confimation */
            $('#modal').modal('hide');
        });
    });


    // handle daytime messages
    /* hide */
    $('body').on('click', '.js_daytime-remover', function() {
        var daytime_message = $(this).parents('.panel');
        confirm(__['Delete'], __['Are you sure you want to delete this?'], function() {
            /* remove the daytime message */
            daytime_message.fadeOut();
            $.post(api['posts/reaction'], {'do': 'hide_daytime_message', 'id': '1'} , function(response) {
                /* check the response */
                if(response.callback) {
                    eval(response.callback);
                }
            }, 'json')
            .fail(function() {
                modal('#modal-message', {title: __['Error'], message: __['There is something that went wrong!']});
            });
            /* hide the confimation */
            $('#modal').modal('hide');
        });
    });


    // handle forums
    /* forum toggle */
    $('body').on('click', '.js_forum-toggle', function () {
        $(this).parents('.forum-category').next('.js_forum-toggle-wrapper').slideToggle();
    });
    /* delete forum [thread|reply] */
    $('body').on('click', '.js_delete-forum', function() {
        var id = $(this).data('id');
        var handle = $(this).data('handle');
        confirm(__['Delete'], __['Are you sure you want to delete this?'], function() {
            $.post(api['forums/delete'], {'id': id, 'handle': handle} , function(response) {
                /* check the response */
                if(response.callback) {
                    eval(response.callback);
                }
            }, 'json')
            .fail(function() {
                modal('#modal-message', {title: __['Error'], message: __['There is something that went wrong!']});
            });
        });
    });


    // handle keyboard shortcuts
    highlighted_post = 0;
    $('body').on('keypress', function (key) {
        var target = key.target.tagName.toLowerCase();
        var key_value = parseInt(key.which, 10);
        if(highlighted_post >= 0) {
            /* (J) next post */
            if(key_value == 106 && target != 'input' && target != 'textarea') {
                var post = $('.js_posts_stream .post').eq(highlighted_post);
                if(post.length) {
                    post.addClass('highlighted');
                    $('html, body').animate({
                        scrollTop: parseInt(post.offset().top - 41)
                    }, 600);
                    setTimeout(function() {
                        post.removeClass('highlighted');
                    }, 500);
                }
                highlighted_post++;

            /* (K) prev post */
            } else if(key_value == 107 && target != 'input' && target != 'textarea') {
                if(highlighted_post == 0) return;
                highlighted_post--;
                var post = $('.js_posts_stream .post').eq(highlighted_post);
                if(post.length) {
                    post.addClass('highlighted');
                    $('html, body').animate({
                        scrollTop: parseInt(post.offset().top - 41)
                    }, 600);
                    setTimeout(function() {
                        post.removeClass('highlighted');
                    }, 500);
                }
            }
        }
    });
    
});