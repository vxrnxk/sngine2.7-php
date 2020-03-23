/**
 * chat js
 * 
 * @package Sngine
 * @author Zamblek
 */

// initialize API URLs
/* chat */
api['chat/live'] = ajax_path+"chat/live.php";
api['chat/settings'] = ajax_path+"users/settings.php?edit=chat";
api['chat/call'] = ajax_path+"chat/call.php";
api['chat/reaction'] = ajax_path+"chat/reaction.php";
api['chat/post'] = ajax_path+"chat/post.php";
api['chat/messages'] = ajax_path+"chat/messages.php";
api['conversation/check'] = ajax_path+"chat/conversation.php?do=check";
api['conversation/get'] = ajax_path+"chat/conversation.php?do=get";


// reconstruct chat-widgets
function reconstruct_chat_widgets() {
    if($(window).width() < 970) {
        return;
    }
    $('.chat-widget').each(function(index) {
        $(this).attr('style', '');
        index += 1;
        offset = (index*210) + (index*10);
        if($(this).prevAll('.chat-box').length > 0) {
            offset += $(this).prevAll('.chat-box').length*50;
        }
        if($('html').attr('dir') == 'RTL') {
            $(this).css('left', offset);
        } else {
            $(this).css('right', offset);
        }
    });
}


// chat box
function chat_box(user_id, conversation_id, name, name_list, multiple, link) {
    /* open the #chat_key */
    var chat_key_value = 'chat_';
    chat_key_value += (conversation_id)? conversation_id : 'u_'+user_id;
    var chat_key = '#' + chat_key_value;
    var chat_box = $(chat_key);
    /* check if this chat_box already exists */
    if(chat_box.length == 0) {
        /* check if conversation_id is set */
        if(conversation_id == false) {
            var data = {'user_id': user_id};
            if($('.chat-box[data-uid="'+user_id+'"]').length > 0) {
                /* select the opened one */
                chat_box = $('.chat-box[data-uid="'+user_id+'"]');
                /* open chat-box with that chat_key that already exists if not opened */
                if(!chat_box.hasClass('opened')) {
                    chat_box.addClass('opened').find('.chat-widget-content').slideToggle(200);
                }
                return;
            } else {
                /* construct a new one */
                $('body').append(render_template('#chat-box', {'chat_key_value': chat_key_value, 'user_id': user_id, 'conversation_id': conversation_id, 'name': name.substring(0,28), 'name_list': name_list, 'multiple': multiple, 'link': link}));
                chat_box = $(chat_key);
                chat_box.find('.chat-widget-content').show();
                chat_box.find('textarea').focus();
                /* initialize the plugins */
                initialize();
                /* reconstruct chat-widgets */
                reconstruct_chat_widgets();
            }
        } else {
            var data = {'conversation_id': conversation_id};
            /* construct a new one */
            $('body').append(render_template('#chat-box', {'chat_key_value': chat_key_value, 'user_id': user_id, 'conversation_id': conversation_id, 'name': name.substring(0,28), 'name_list': name_list, 'multiple': multiple, 'link': link}));
            chat_box = $(chat_key);
            chat_box.find('.chat-widget-content').show();
            chat_box.find('textarea').focus();
            /* initialize the plugins */
            initialize();
            /* reconstruct chat-widgets */
            reconstruct_chat_widgets();
        }
        /* get conversation messages */
        $.getJSON(api['chat/messages'], data, function(response) {
            /* check the response */
            if(!response) return;
            if(response.callback) {
                eval(response.callback);
                /* remove the chat-box */
                chat_box.remove();
            } else {
                if(response.conversation_id) {
                    if($('#chat_'+response.conversation_id).length > 0) {
                        /* remove the new chat-box */
                        chat_box.remove();
                        /* select the opened one */
                        chat_box = $('#chat_'+response.conversation_id);
                        /* open chat-box with that chat_key that already exists if not opened */
                        if(!chat_box.hasClass('opened')) {
                            chat_box.addClass('opened').find('.chat-widget-content').slideToggle(200);
                        }
                        chat_box.find('textarea').focus();
                        return;
                    } else {
                        chat_box.attr("id", 'chat_'+response.conversation_id);
                        chat_box.attr("data-cid", response.conversation_id);
                    }
                    chat_box.find('.x-form-tools-colors').show();
                }
                if(response.user_online !== undefined && response.user_online) {
                    chat_box.find(".js_chat-box-status").removeClass("fa-user-secret").addClass("fa-circle");
                }
                if(response.messages) {
                    chat_box.find(".js_scroller:first").html(response.messages).scrollTop(chat_box.find(".js_scroller:first")[0].scrollHeight);
                }
                if(response.color) {
                    chat_box.attr("data-color", response.color);
                    color_chat_box(chat_box, response.color);
                }
            }
        })
        .fail(function() {
            /* remove the chat-box */
            chat_box.remove();
            modal('#modal-message', {title: __['Error'], message: __['There is something that went wrong!']});
        });
    } else {
        /* open chat-box with that chat_key that already exists if not opened */
        if(!chat_box.hasClass('opened')) {
            chat_box.addClass('opened').find('.chat-widget-content').slideToggle(200);
        }
        chat_box.find('textarea').focus();
        /* reconstruct chat-widgets */
        reconstruct_chat_widgets();
    }
}


// color chat box
function color_chat_box(chat_widget, color) {
    chat_widget.data('color', color);
    chat_widget.find('.js_chat-color-me').each(function() {
        if($(this).hasClass("js_chat-colors-menu-toggle")) {
            $(this).css("color", color);
        } else {
            $(this).css("background-color", color);
        }
    });
}


// chat heartbeat
var chatbox_closing_process = false;
var chat_calling_process = false;
var chat_audiocall_ringing_process = false;
var chat_videocall_ringing_process = false;
var chat_incall_process = false;
function chat_heartbeat() {
    /* check if there is any closing process */
    if(chatbox_closing_process) {
        setTimeout('chat_heartbeat()',min_chat_heartbeat);
        return;
    }
    /* check if chat disabled */
    if(!chat_enabled && window.location.pathname.indexOf("messages") == -1) return;
    /* prepare client opened chat boxes with its last messages */
    var chat_boxes_opened_client = {}; // we use "objects" because JS don't support user-indexed array ;)
    $.each($('.chat-box:not(.fresh)'), function(i,chat_box) {
        if(!$(chat_box).data('sending')) {
            chat_boxes_opened_client[$(chat_box).data('cid')] = $(chat_box).find('.conversation:last').attr('id'); // object = {"cid": "last_message", ....}
        }
    });
    /* check if messages page is opened & there is a loaded converstaion */
    if(window.location.pathname.indexOf("messages") != -1 && $('.panel-messages').data('cid') !== undefined) {
        /* add the current loaded converstion */
        var opened_thread = {};
        if(!$('.panel-messages').data('sending')) {
            opened_thread['conversation_id'] = $('.panel-messages').data('cid');
            opened_thread['last_message_id'] = $('.panel-messages').find('.conversation:last').attr('id');
        }
        /* prepare data */
        var data = {'chat_enabled': $('body').data('chat-enabled'), 'chat_boxes_opened_client': JSON.stringify(chat_boxes_opened_client), 'opened_thread': JSON.stringify(opened_thread)};
    } else {
        /* prepare data */
        var data = {'chat_enabled': $('body').data('chat-enabled'), 'chat_boxes_opened_client': JSON.stringify(chat_boxes_opened_client)};
    }
    /* post to the server and get updates */
    $.post(api['chat/live'], data, function(response) {
        if(response.callback) {
            eval(response.callback);
        } else {
            /* init updated seen conversations if any */
            var updated_seen_conversations = [];
            /* [1] [update] master chat sidebar (online & offline friends list) */
            /* [2] [update] master chat sidebar (online users counter & chat status) */
            if(response.master) {
                $("body").attr("data-chat-enabled", response.master.chat_enabled);
                $(".js_chat-online-users").text(response.master.online_friends_count);
                $(".chat-sidebar-content").find(".js_scroller").html(response.master.sidebar);
                $('.chat-sidebar-filter').keyup();
            }
            /* [3] & [4] & [5] check if the user not in messages page */
            if(window.location.pathname.indexOf("messages") == -1) {
                /* [3] [get] closed chat boxes */
                if(response.chat_boxes_closed !== undefined) {
                    $.each(response.chat_boxes_closed, function(i,conversation) {
                        $("#chat_"+conversation).remove();
                    });
                    /* reconstruct chat-widgets */
                    reconstruct_chat_widgets();
                }
                /* [4] [get] opened chat boxes */
                if(response.chat_boxes_opened) {
                    $.each(response.chat_boxes_opened, function(i,conversation) {
                        chat_box(conversation.user_id, conversation.conversation_id, conversation.name, conversation.name_list, conversation.multiple_recipients, conversation.link);
                    });
                }
                /* [5] [get] updated chat boxes */
                if(response.chat_boxes_updated) {
                    $.each(response.chat_boxes_updated, function(i,conversation) {
                        var chat_box_widget = $("#chat_"+conversation['conversation_id']);
                        /* [1] check for a new messages for this chat box */
                        if(conversation['messages']) {
                            chat_box_widget.find(".js_scroller:first ul").append(conversation['messages']);
                            chat_box_widget.find(".js_scroller:first").scrollTop(chat_box_widget.find(".js_scroller:first")[0].scrollHeight);
                            if(!conversation['is_me']) {
                                if(!chat_box_widget.hasClass("opened")) {
                                    chat_box_widget.addClass("new").find(".js_chat-box-label").text(conversation['messages_count']);
                                } else {
                                    /* update this convertaion seen status (if enabled by the system) */
                                    if(chat_seen_enabled) {
                                        updated_seen_conversations.push(conversation['conversation_id']);
                                    }
                                }
                                if(chat_sound) {
                                    $("#chat-sound")[0].play();
                                }
                            }
                        }
                        /* [2] check if any recipient typing */
                        if(conversation['typing_name_list']) {
                            chat_box_widget.find('.js_chat-typing-users').text(conversation['typing_name_list']);
                            chat_box_widget.find('.chat-typing').show();
                        } else {
                            chat_box_widget.find('.chat-typing').hide();
                        }
                        /* [3] check if any recipient seeing */
                        if(conversation['seen_name_list']) {
                            var last_message_box = chat_box_widget.find(".js_scroller:first li:last .conversation.right");
                            if(last_message_box.length > 0) {
                                if(last_message_box.find('.seen').length == 0) {
                                    /* add seen status */
                                    last_message_box.find('.time').after("<div class='seen'>"+__['Seen by']+" "+conversation['seen_name_list']+"<div>");
                                    chat_box_widget.find(".js_scroller:first").scrollTop(chat_box_widget.find(".js_scroller:first")[0].scrollHeight);
                                } else {
                                    /* update seen status */
                                    last_message_box.find('.seen').replaceWith("<div class='seen'>"+__['Seen by']+" "+conversation['seen_name_list']+"<div>");
                                }
                            }
                        }
                        /* [4] check single user's chat status (online|offline) */
                        if(!conversation['multiple_recipients']) {
                            /* update single user's chat status */
                            if(conversation['user_online']) {
                                chat_box_widget.find(".js_chat-box-status").removeClass("fa-user-secret").addClass("fa-circle");
                            } else {
                                chat_box_widget.find(".js_chat-box-status").removeClass("fa-circle").addClass("fa-user-secret");
                            }
                        }
                        /* update chat widget color */
                        color_chat_box(chat_box_widget, conversation['color']);
                    });
                }
                /* [6] [get] new chat boxes */
                if(response.chat_boxes_new) {
                    $.each(response.chat_boxes_new, function(i,conversation) {
                        chat_box(conversation.user_id, conversation.conversation_id, conversation.name, conversation.name_list, conversation.multiple_recipients, conversation.link);
                        if(chat_sound) {
                            $("#chat-sound")[0].play();
                        }
                    });
                }
            }
            /* [7] [get] updated thread */
            if(response.thread_updated) {
                /* check if the user in messages page */
                if(window.location.pathname.indexOf("messages") != -1) {
                    var converstaion_widget = $('.panel-messages[data-cid="'+response.thread_updated['conversation_id']+'"]');
                    if(converstaion_widget.length > 0) {
                        /* [1] check for a new messages for this chat box */
                        if(response.thread_updated['messages']) {
                            converstaion_widget.find(".js_scroller:first ul").append(response.thread_updated['messages']);
                            converstaion_widget.find(".js_scroller:first").scrollTop(converstaion_widget.find(".js_scroller:first")[0].scrollHeight);
                            if(!response.thread_updated['is_me']) {
                                /* update this convertaion seen status (if enabled by the system) */
                                if(chat_seen_enabled) {
                                    updated_seen_conversations.push(response.thread_updated['conversation_id']);
                                }
                                if(chat_sound) {
                                    $("#chat-sound")[0].play();
                                }
                            }
                        }
                        /* [2] check if any recipient typing */
                        if(response.thread_updated['typing_name_list']) {
                            converstaion_widget.find('.js_chat-typing-users').text(response.thread_updated['typing_name_list']);
                            converstaion_widget.find('.chat-typing').show();
                        } else {
                            converstaion_widget.find('.chat-typing').hide();
                        }
                        /* [3] check if any recipient seeing */
                        if(response.thread_updated['seen_name_list']) {
                            var last_message_box = converstaion_widget.find(".js_scroller:first li:last .conversation.right");
                            if(last_message_box.length > 0) {
                                if(last_message_box.find('.seen').length == 0) {
                                    /* add seen status */
                                    last_message_box.find('.time').after("<div class='seen'>"+__['Seen by']+" "+response.thread_updated['seen_name_list']+"<div>");
                                    converstaion_widget.find(".js_scroller:first").scrollTop(converstaion_widget.find(".js_scroller:first")[0].scrollHeight);
                                } else {
                                    /* update seen status */
                                    last_message_box.find('.seen').replaceWith("<div class='seen'>"+__['Seen by']+" "+response.thread_updated['seen_name_list']+"<div>");
                                }
                            }
                        }
                        /* update chat widget color */
                        color_chat_box(converstaion_widget, response.thread_updated['color']);
                    }   
                }
            }
            /* [8] [get] (audio) calls */
            if(response.has_audiocall == true) {
                if(chat_incall_process == false && chat_audiocall_ringing_process == false) {
                    /* update chat audiocall ringing process */
                    chat_audiocall_ringing_process = true;
                    /* show the ringing modal */
                    modal('#chat-ringing', {type: "audio", is_video: false, is_audio: true, id: response.audiocall['call_id'], name: response.audiocall['caller_name'], image: response.audiocall['caller_picture']});
                    /* play ringing sound */
                    $("#chat-ringing-sound")[0].play();
                }
            } else {
                if(chat_incall_process == false && chat_audiocall_ringing_process == true) {
                    /* update chat audiocall ringing process */
                    chat_audiocall_ringing_process = false;
                    /* close the ringing modal (if exist) */
                    if( $("#modal").hasClass("show") && $("#modal").find(".js_chat-call-answer").length > 0 ) {
                        $('#modal').modal('hide');
                    }
                    /* stop ringing sound */
                    $("#chat-ringing-sound")[0].stop();
                }
            }
            /* [9] [get] (video) calls */
            if(response.has_videocall == true) {
                if(chat_incall_process == false && chat_videocall_ringing_process == false) {
                    /* update chat videocall ringing process */
                    chat_videocall_ringing_process = true;
                    /* show the ringing modal */
                    modal('#chat-ringing', {type: "video", is_video: true, is_audio: false, id: response.videocall['call_id'], name: response.videocall['caller_name'], image: response.videocall['caller_picture']}, "large");
                    /* play ringing sound */
                    $("#chat-ringing-sound")[0].play();
                }
            } else {
                if(chat_incall_process == false && chat_videocall_ringing_process == true) {
                    /* update chat videocall ringing process */
                    chat_videocall_ringing_process = false;
                    /* close the ringing modal (if exist) */
                    if( $("#modal").hasClass("show") && $("#modal").find(".js_chat-call-answer").length > 0 ) {
                        $('#modal').modal('hide');
                    }
                    /* stop ringing sound */
                    $("#chat-ringing-sound")[0].stop();
                }
            }
            // update convertaion(s) seen status
            if(chat_seen_enabled && updated_seen_conversations.length > 0) {
                $.post(api['chat/reaction'], {'do': 'seen', 'ids': updated_seen_conversations}, function(response) {
                    if(response.callback) {
                        eval(response.callback);
                    }
                }, 'json');
            }
        }
        setTimeout('chat_heartbeat()',min_chat_heartbeat);
    }, 'json');
}


// chat incall heartbeat
function chat_incall_heartbeat(type, call_id) {
    if(chat_incall_process == false) return;
    setTimeout(function () {
        chat_incall_heartbeat(type, call_id);
    }, min_chat_heartbeat);
    $.post(api['chat/call'], {'do': 'update_call', type: type, 'id': call_id}, 'json');
}


// init Twilio
function init_Twilio(type, token, room, call_id) {
    var is_audio = (type == "audio")? true : false;
    var is_video = (type == "video")? true : false;

    navigator.getUserMedia = navigator.getUserMedia || navigator.webkitGetUserMedia || navigator.mozGetUserMedia || navigator.msGetUserMedia;
    if (!navigator.getUserMedia) {
        alert('Sorry, WebRTC is not available in your browser');
    }

    Twilio.Video.connect(token, { name: room, audio: true, video: is_video }).then(room => {
        room.participants.forEach(participantConnected);
        room.on('participantConnected', participantConnected);
        room.on('participantDisconnected', participantDisconnected);
        room.once('disconnected', error => room.participants.forEach(participantDisconnected));
        $(document).on('click', '.js_chat-call-end', function() {
            room.disconnect();
        });
    });

    function participantConnected(participant) {
        const div = document.createElement('div');
        div.id = participant.sid;
        participant.on('trackAdded', track => trackAdded(div, track));
        participant.tracks.forEach(track => trackAdded(div, track));
        participant.on('trackRemoved', trackRemoved);
        $('.twilio-stream').html(div);
        if(type == "video") {
            if(navigator.getUserMedia) {
                navigator.mediaDevices.getUserMedia({audio: false, video: true}).then((stream) => {$(".twilio-stream-local")[0].srcObject = stream});
                $(".twilio-stream-local").show();
            }
        }
    }

    function participantDisconnected(participant) {
        participant.tracks.forEach(trackRemoved);
        document.getElementById(participant.sid).remove();
        /* end the call */
        $.post(api['chat/call'], {'do': 'decline_call', type: type, 'id': call_id}, 'json');
        alert(__['Connection has been lost']);
        /* reload the page */
        window.location.reload();
    }

    function trackAdded(div, track) {
        div.appendChild(track.attach());
    }

    function trackRemoved(track) {
        track.detach().forEach(element => element.remove());
    }
}


$(function() {

    // start chat heartbeat
    setTimeout('chat_heartbeat()', 1000);

    
    // turn chat (on|off)
    $('body').on('click', '.js_chat-toggle', function (e) {
        e.preventDefault;
        var status = $(this).data('status');
        if(status == "on") {
            $('.chat-sidebar').addClass('disabled');
            $(this).data('status', "off");
            $(this).text(__['Turn On Chat']);
        } else {
            $(this).data('status', "on");
            $(this).text(__['Turn Off Chat']);
            $('.chat-sidebar').removeClass('disabled');
        }
        $.get(api['chat/settings'], {'privacy_chat': (status == "on")? 0 : 1}, function(response) {
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
        return false;
    });
    

    // search chat contacts
    $('body').on('keyup', '.js_chat-search', function(event) {
        var search = $(this).val().toLowerCase();
        $('.chat-sidebar-content ul > li').each(function() {
            var item  = $(this).text().toLowerCase();
            (item.indexOf( search ) != -1) ? $(this).show() : $(this).hide();
        });
    });


    // chat-box
    $('body').on('click', '.js_chat-new', function(e) {
        /* check if chat disabled or opened from mobile */
        if(!chat_enabled || $(window).width() < 970) { // Desktops (≥992px)
            /* chat dissabled or mobile view */
            return;
        } else {
            /* desktop view */
            e.preventDefault();
            /* open fresh chat-box */
            /* check if there is any fresh chat-box already exists */
            if($('.chat-box.fresh').length == 0) {
                /* construct a new one */
                $('body').append(render_template('#chat-box-new'));
                $('.chat-box.fresh').find('.chat-widget-content').show();
                /* initialize the main plugins */
                initialize();
                /* reconstruct chat-widgets */
                reconstruct_chat_widgets();
            } else {
                /* open fresh chat-box that already exists if not opened */
                if(!$('.chat-box.fresh').hasClass('opened')) {
                    $('.chat-box.fresh').addClass('opened');
                    $('.chat-box.fresh').find('.chat-widget-content').slideToggle(200);
                }
            }
        }
    });
    $('body').on('click', '.js_chat-start', function(e) {
        /* get data from (header conversation feeds || chat sidebar) */
        /* mandatory */
        var user_id = $(this).data('uid') || false;
        var conversation_id = $(this).data('cid') || false;
        /* optional */
        var name = $(this).data('name');
        var name_list = $(this).data('name-list') || name;
        var multiple = ($(this).data('multiple'))? true: false;
        var link = $(this).data('link');
        /* load previous conversation */
        /* check if the viewer in the messages page & open already conversation */
        if(window.location.pathname.indexOf("messages") != -1 && conversation_id) {
            e.preventDefault();
            $(".js_conversation-container").html('<div class="loader loader_medium pr10"></div>');
            $.getJSON(api['conversation/get'], {'conversation_id': conversation_id}, function(response) {
                /* check the response */
                if(response.callback) {
                    eval(response.callback);
                } else {
                    $(".js_conversation-container").html(response.conversation_html);
                    $('.panel-messages').attr("data-color", response.conversation.color);
                    color_chat_box($('.panel-messages'), response.conversation.color);
                }
            })
            .fail(function() {
                modal('#modal-message', {title: __['Error'], message: __['There is something that went wrong!']});
            });
        } else {
            /* check if chat disabled or opened from mobile */
            if(!chat_enabled || $(window).width() < 970) { // Desktops (≥992px)
                /* chat dissabled or mobile view */
                if(conversation_id) {
                    /* conversation_id is set so return (return will allow default behave of anchor tag) */
                    return;
                } else {
                    e.preventDefault();
                    $.getJSON(api['conversation/check'], {'uid': user_id}, function(response) {
                        /* check the response */
                        if(!response) return;
                        if(response.callback) {
                            eval(response.callback);
                        } else {
                            if(response.conversation_id) {
                                window.location = site_path + "/messages/" + response.conversation_id;
                            } else {
                                window.location = site_path + "/messages/new?uid="+user_id;
                            }
                        }
                    })
                    .fail(function() {
                        modal('#modal-message', {title: __['Error'], message: __['There is something that went wrong!']});
                    });
                }
            } else {
                /* desktop view */
                e.preventDefault();
                /* load chat-box */
                chat_box(user_id, conversation_id, name, name_list, multiple, link);
            }
        }
    });

    
    // post message
    /* post message */
    function _post_message(element) {
        var _this = $(element);
        var widget = _this.parents('.chat-widget, .panel-messages');
        var textarea = widget.find('textarea.js_post-message');
        var message = textarea.val();
        var conversation_id = widget.data('cid');
        var attachments = widget.find('.chat-attachments');
        /* get photo from widget data */
        var photo = widget.data('photo');
        /* check if message is empty */
        if(is_empty(message) && photo === undefined) {
            return;
        }
        /* check if posting the message to (new || existed) conversation */
        if(widget.hasClass('fresh')) {
            /* post the message to -> a new conversation */
            /* check recipients */
            if(widget.find('.tags li').length == 0) {
                return;
            }
            /* get recipients */
            var recipients = [];
            $.each(widget.find('.tags li'), function(i,tag) {
                recipients.push($(tag).data('uid'));
            });
            var data = {'message': message, 'photo': JSON.stringify(photo), 'recipients': JSON.stringify(recipients)};
        } else {
            if(conversation_id === undefined) {
                /* post the message to -> a new conversation */
                /* get recipients */
                var recipients = [];
                recipients.push(widget.data('uid'));
                var data = {'message': message, 'photo': JSON.stringify(photo), 'recipients': JSON.stringify(recipients)};
            } else {
                /* post the message to -> already existed conversation */
                var data = {'message': message, 'photo': JSON.stringify(photo), 'conversation_id': conversation_id};
            }
        }
        /* add the message directly if widget not fresh & not sending photo */
        if(!widget.hasClass('fresh') && photo === undefined) {
            textarea.focus().val('').height(textarea.css('line-height'));
            var _guid = guid()
            widget.find(".js_scroller:first ul").append(render_template('#chat-message', {'message': message, 'id': _guid, 'time': moment.utc().format("YYYY-MM-DD H:mm:ss")}));
            widget.find(".js_scroller:first .seen").remove(); // remove any seen status before
            widget.find(".js_scroller:first").scrollTop(widget.find(".js_scroller:first")[0].scrollHeight);
        } else {
            /* widget is fresh or sending photo */
            /* check if there is current (sending) process */
            if(widget.data('sending')) {
                return false;
            }
        }
        /* add currenet sending process */
        widget.data('sending', true);
        /* process */
        $.post(api['chat/post'], data, function(response) {
            /* check the response */
            if(!response) return;
            /* check if there is a callback */
            if(response.callback) {
                eval(response.callback);
            } else {
                if(widget.hasClass('fresh')) {
                    if(window.location.pathname.indexOf("messages") != -1) {
                        /* in messages page */
                        window.location.replace(site_path+'/messages/'+response.conversation_id);
                    } else {
                        widget.remove();
                        chat_box(response.user_id, response.conversation_id, response.name, response.name_list, response.multiple_recipients, response.link);
                    }
                } else {
                    if(conversation_id === undefined) {
                        widget.attr("id", "chat_"+response.conversation_id);
                        widget.attr("data-cid", response.conversation_id);
                        widget.find('.x-form-tools-colors').show();
                    }
                    if(photo === undefined) {
                        widget.find(".js_scroller:first ul").find("#"+_guid).replaceWith(render_template('#chat-message', {'message': response.message, 'image': response.image, 'id': response.last_message_id, 'time': moment.utc().format("YYYY-MM-DD H:mm:ss"), 'color': widget.data('color')}));
                    } else {
                        textarea.focus().val('').height(textarea.css('line-height'));
                        widget.find(".js_scroller:first ul").append(render_template('#chat-message', {'message': response.message, 'image': response.image, 'id': response.last_message_id, 'time': moment.utc().format("YYYY-MM-DD H:mm:ss"), 'color': widget.data('color')}));
                        widget.find(".js_scroller:first .seen").remove(); // remove any seen status before
                        widget.find(".js_scroller:first").scrollTop(widget.find(".js_scroller:first")[0].scrollHeight);
                        /* handle attachments */
                        attachments.hide();
                        attachments.find('li.item').remove();
                        widget.removeData('photo');
                        widget.find('.x-form-tools-attach').show();
                    }
                    /* remove currenet sending process */
                    widget.removeData('sending');
                }
            }
        }, 'json')
        .fail(function() {
            modal('#modal-message', {title: __['Error'], message: __['There is something that went wrong!']});
        });
    }
    $('body').on('keydown', 'textarea.js_post-message', function (event) {
        if($(window).width() >= 970 && (event.keyCode == 13 && event.shiftKey == 0)) {
            event.preventDefault();
            _post_message(this);
        }
    });
    $('body').on('click', 'li.js_post-message', function (event) {
        if($(window).width() < 970) {
            _post_message(this);
        }
    });
    /* chat attachment remover */
    $('body').on('click', '.js_chat-attachment-remover', function() {
        var widget = $(this).parents('.chat-widget, .panel-messages');
        var attachments = widget.find('.chat-attachments');
        var item = $(this).parents('li.item');
        /* remove the attachment from widget data */
        widget.removeData('photo')
        /* remove the attachment item */
        item.remove();
        /* hide attachments */
        attachments.hide();
        /* show widget form tools */
        widget.find('.x-form-tools-attach').show();
    });


    // chat typing status
    var chat_typing_timer;
    $('body').on('keyup paste change input propertychange', 'textarea.js_post-message', function() {
        if(!chat_typing_enabled) {
            return;
        }
        var _this = $(this);
        var widget = _this.parents('.chat-widget, .panel-messages');
        var conversation_id = widget.data('cid') || false;
        var is_typing = (_this.val())? 1 : 0;
        if(!conversation_id) {
            return;
        }
        clearTimeout(chat_typing_timer);
        /* check if there is current (sending) process */
        if(widget.data('sending')) {
            return;
        }
        chat_typing_timer = setTimeout(function() {
            $.post(api['chat/reaction'], {'do': 'typing', 'is_typing': is_typing, 'conversation_id': conversation_id}, function(response) {
                if(response.callback) {
                    eval(response.callback);
                }
            }, 'json');
        }, 500);
    });


    // toggle chat-widget
    $('body').on('click', '.chat-widget-head', function(e) {
        /* check if user just starting video/audio call */
        if($(e.target).hasClass('js_chat-call-start')) {
           return;
       }
        var widget = $(this).parents('.chat-widget');
        var conversation_id = widget.data('cid') || false;
        /* toggle 'opened' class */
        widget.toggleClass('opened');
        /* toggle widget content */
        widget.find('.chat-widget-content').slideToggle(200);
        /* scroll to latest message if has class new (new = there is new messages not seen) */
        if(widget.hasClass('new')) {
            widget.find(".js_scroller:first").scrollTop(widget.find(".js_scroller:first")[0].scrollHeight);
            widget.removeClass('new');
            /* update this convertaion seen status (if enabled by the system) */
            if(chat_seen_enabled && conversation_id) {
                $.post(api['chat/reaction'], {'do': 'seen', 'ids': conversation_id}, function(response) {
                    if(response.callback) {
                        eval(response.callback);
                    }
                }, 'json');
            }
        }
    });


    // close chat-widget
    $('body').on('click', '.js_chat-box-close', function() {
        var widget = $(this).parents('.chat-widget');
        widget.remove();
        /* reconstruct chat-widgets */
        reconstruct_chat_widgets();
        /* update chatbox closing process */
        chatbox_closing_process = true;
        /* unset from session */
        if(widget.data('cid') !== undefined) {
            $.post(api['chat/reaction'], {'do': 'close', 'conversation_id': widget.data('cid')}, function(response) {
                if(response.callback) {
                    eval(response.callback);
                }
                /* update chatbox closing process */
                chatbox_closing_process = false;
            }, 'json')
            .fail(function() {
                modal('#modal-message', {title: __['Error'], message: __['There is something that went wrong!']});
            });
        }
    });


    // reconstruct chat widgets when resize window
    $(window).bind("resize", function() {
        reconstruct_chat_widgets();
    });


    // delete conversation
    $('body').on('click', '.js_delete-conversation', function() {
        confirm(__['Delete Conversation'], __['Are you sure you want to delete this conversation?'], function() {
            $.post(api['chat/reaction'], {'do': 'delete', 'conversation_id': $('.panel-messages').data('cid')}, function(response) {
                if(response.callback) {
                    eval(response.callback);
                }
            }, 'json')
            .fail(function() {
                modal('#modal-message', {title: __['Error'], message: __['There is something that went wrong!']});
            });
        });
    });


    // run chat colors
    /* color panel messages (messages page) */
    if(window.location.pathname.indexOf("messages") != -1 && $('.panel-messages').data('cid') !== undefined) {
        color_chat_box($('.panel-messages'), $('.panel-messages').attr("data-color"));
    }
    /* toggle(close|open) colors-menu */
    $('body').on('click', '.js_chat-colors-menu-toggle', function() {
        if($(this).parent().find('.chat-colors-menu').length == 0) {
            $(this).after(render_template("#chat-colors-menu"));
        }
        $(this).parent().find('.chat-colors-menu').toggle();
    });
    /* close chat-colors-menu when clicked outside */
    $('body').on('click', function(e) {
        if($(e.target).hasClass('js_chat-colors-menu-toggle') || $(e.target).parents('.js_chat-colors-menu-toggle').length > 0 || $(e.target).hasClass('chat-colors-menu') || $(e.target).parents('.chat-colors-menu').length > 0) {
           return;
       }
       $('.chat-colors-menu').hide();
    });
    /* change chat color */
    $('body').on('click', '.js_chat-color', function() {
        var chat_widget = $(this).parents('.chat-widget, .panel-messages');
        var conversation_id = chat_widget.data('cid');
        var color = $(this).data('color');
        color_chat_box(chat_widget, color);
        $('.chat-colors-menu').hide();
        $.post(api['chat/reaction'], {'do': 'color', 'conversation_id': conversation_id, 'color': color}, function(response) {
            if(response.callback) {
                eval(response.callback);
            }
        }, 'json')
        .fail(function() {
            modal('#modal-message', {title: __['Error'], message: __['There is something that went wrong!']});
        });
    });


    // run video/audio calls
    /* check calling response */
    function check_calling_response(type, call_id) {
        /* check if there is chat calling process */
        if(chat_calling_process == false) {
            /* if no -> return */
            return;
        }
        $.post(api['chat/call'], {'do': 'check_calling_response', 'type': type, 'id': call_id}, function(response) {
            if(response.callback) {
                eval(response.callback);
            } else {
                switch(response.call) {
                    /* no answer */
                    case "no_answer":
                        /* check calling response (after 2 seconds) */
                        setTimeout(function () {
                            check_calling_response(type, call_id);
                        }, 2000);
                        break;

                    /* declined */
                    case "declined":
                        /* update chat calling process */
                        chat_calling_process = false;
                        /* show the modal close button */
                        $(".js_chat-call-close").show();
                        /* hide the call cancel button */
                        $(".js_chat-call-cancel").hide();
                        /* update calling message */
                        $('.js_chat-calling-message').html(__['The recipient declined the call']);
                        /* stop calling sound */
                        $("#chat-calling-sound")[0].stop();
                        /* remove the end_call timeout */
                        clearTimeout(end_call);
                        break;

                    /* answered */
                    default:
                        /* update chat calling process */
                        chat_calling_process = false;
                        /* update chat incall process */
                        chat_incall_process = true;
                        /* hide cancel call btn */
                        $(".js_chat-call-cancel").hide();
                        /* show the call end button & update its id */
                        $(".js_chat-call-end").data("id", response.call['call_id']);
                        $(".js_chat-call-end").show();
                        /* update calling message */
                        var timer = new easytimer.Timer();
                        timer.start();
                        timer.addEventListener('secondsUpdated', function (e) {
                            $('.js_chat-calling-message').html("<span style='color: red'>"+timer.getTimeValues().toString()+"</span>");
                        });
                        /* stop calling sound */
                        $("#chat-calling-sound")[0].stop();
                        /* remove the end_call timeout */
                        clearTimeout(end_call);
                        /* init_Twilio */
                        init_Twilio(type, response.call['from_user_token'], response.call['room'], response.call['call_id']);
                }
            }
        }, 'json')
        .fail(function() {
            modal('#modal-message', {title: __['Error'], message: __['There is something that went wrong!']});
        });
    }
    /* start call */
    $('body').on('click', '.js_chat-call-start', function() {
        var type = $(this).data("type");
        var is_video = (type == "video")? true : false;
        var is_audio = (type == "audio")? true : false;
        var name = $(this).data('name');
        var user_id = $(this).data('uid');
        /* show the calling modal */
        modal('#chat-calling', {type: type, is_video: is_video, is_audio: is_audio, name: name}, (is_video)? "large" : "default");
        $.post(api['chat/call'], {'do': 'create_call', 'type': type, 'user_id': user_id}, function(response) {
            if(response.callback) {
                eval(response.callback);
            } else {
                if(response.call_id == false) {
                    /* show the modal close button */
                    $(".js_chat-call-close").show();
                    /* update calling message */
                    $('.js_chat-calling-message').html(__['You can not connect to this user']);

                } else if(response.call_id == "recipient_offline") {
                    /* show the modal close button */
                    $(".js_chat-call-close").show();
                    /* update calling message */
                    $('.js_chat-calling-message').html("<span style='color: red'>"+__['is Offline']+"</span>");
                    
                } else if(response.call_id == "recipient_busy") {
                    /* show the modal close button */
                    $(".js_chat-call-close").show();
                    /* update calling message */
                    $('.js_chat-calling-message').html("<span style='color: red'>"+__['is Busy']+"</span>");

                } else if(response.call_id == "caller_busy") {
                    /* show the modal close button */
                    $(".js_chat-call-close").show();
                    /* update calling message */
                    $('.js_chat-calling-message').html("<span style='color: red'>"+__['You have an active call already']+"</span>");

                } else {
                    /* update chat calling process */
                    chat_calling_process = true;
                    /* show the call cancel button & update its id */
                    $(".js_chat-call-cancel").data("id", response.call_id);
                    $(".js_chat-call-cancel").show();
                    /* update calling message */
                    $('.js_chat-calling-message').html(__['Ringing']+'<span class="loading-dots"></span>');
                    /* play calling sound */
                    $("#chat-calling-sound")[0].play();
                    /* check calling response (after 2 seconds) */
                    calling_response = setTimeout(function () {
                        check_calling_response(type, response.call_id);
                    }, 2000);
                    /* if there is no response end the call (after 42 seconds) */
                    end_call = setTimeout(function () {
                        /* update chat calling process */
                        chat_calling_process = false;
                        /* hide the call cancel button */
                        $(".js_chat-call-cancel").hide();
                        /* show the modal close button */
                        $(".js_chat-call-close").show();
                        /* update calling message */
                        $('.js_chat-calling-message').html("<span style='color: red'>"+__['No Answer']+"</span>");
                        /* stop calling sound */
                        $("#chat-calling-sound")[0].stop();
                        /* end call */
                        $.post(api['chat/call'], {'do': 'decline_call', type: type, 'id': response.call_id}, 'json');
                    }, 42000);
                }
            }
        }, 'json')
        .fail(function() {
            modal('#modal-message', {title: __['Error'], message: __['There is something that went wrong!']});
        });
    });
    /* (cancel|decline|end) call */
    $('body').on('click', '.js_chat-call-cancel, .js_chat-call-decline, .js_chat-call-end', function() {
        var type = $(this).data("type");
        var id = $(this).data("id");
        var reload = false;
        /* cancel call */
        if($(this).hasClass('js_chat-call-cancel')) {
            /* update chat calling process */
            chat_calling_process = false;
            /* stop calling sound */
            $("#chat-calling-sound")[0].stop();
            /* remove the end_call timeout */
            clearTimeout(end_call);
        }
        /* decline call */
        if($(this).hasClass('js_chat-call-decline')) {
            /* stop ringing sound */
            $("#chat-ringing-sound")[0].stop();
        }
        /* end call */
        if($(this).hasClass('js_chat-call-end')) {
            /* reload */
            reload = true;
        }
        $.post(api['chat/call'], {'do': 'decline_call', type: type, 'id': id}, function(response) {
            if(response.callback) {
                eval(response.callback);
            }
            /* check reload */
            if(reload) window.location.href = site_path;
        }, 'json')
        .fail(function() {
            modal('#modal-message', {title: __['Error'], message: __['There is something that went wrong!']});
        });
    });
    /* answer call */
    $('body').on('click', '.js_chat-call-answer', function() {
        var type = $(this).data("type");
        var id = $(this).data("id");
        $.post(api['chat/call'], {'do': 'answer_call', type: type, 'id': id}, function(response) {
            if(response.callback) {
                eval(response.callback);
            } else {
                /* update chat audiocall ringing process */
                if(type == "audio") {
                    chat_audiocall_ringing_process = false;
                }
                /* update chat videocall ringing process */
                if(type == "video") {
                    chat_videocall_ringing_process = false;
                }
                /* update chat incall process */
                chat_incall_process = true;
                chat_incall_heartbeat(type, id);
                /* hide answer call btn */
                $(".js_chat-call-answer").hide();
                /* hide decline call btn */
                $(".js_chat-call-decline").hide();
                /* show end call btn */
                $(".js_chat-call-end").show();
                /* update ringing message */
                var timer = new easytimer.Timer();
                timer.start();
                timer.addEventListener('secondsUpdated', function (e) {
                    $('.js_chat-ringing-message').html("<span style='color: red'>"+timer.getTimeValues().toString()+"</span>");
                });
                /* stop ringing sound */
                $("#chat-ringing-sound")[0].stop();
                /* init_Twilio */
                init_Twilio(type, response.call['to_user_token'], response.call['room'], response.call['call_id']);
            }
        }, 'json')
        .fail(function() {
            modal('#modal-message', {title: __['Error'], message: __['There is something that went wrong!']});
        });
    });

});