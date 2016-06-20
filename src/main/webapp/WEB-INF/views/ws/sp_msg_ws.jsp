<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="../included/includedStyle.jsp" %>
</head>

<body>
    <div class="wrapper">
        <div class="portlet light bordered">
            <div class="portlet-title">
                <div class="caption">
                    <i class="fa fa-search"></i>
                    <span class="caption-subject font-blue-hoki bold uppercase">WS TEST</span>
                </div>
                <div class="tools">
                    <a href="" class="collapse"></a>
                    <a href="" class="reload"></a>
                </div>
            </div>
            <div class="portlet-body form">
                <button class="btn-click" >点我</button>
            </div>
            <br/>
            <hr/>
            <div class="portlet-body form">
                <div class="msg-content"> 11199999999</div>
            </div>
        </div>
    </div>


<script src="static/plugins/jquery/jquery.min.js" type="text/javascript"></script>
<script src="static/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="static/plugins/sockjs/sockjs-1.1.0.min.js" type="text/javascript"></script>
<script>
    $(function() {
        
        $('.btn-click').click(function(){
            $.ajax({
                url: 'ws/push/sp_msg',
                dataType: "json",
                async:false,
                success:function (data) {
                    console.log("push success!" + data.msg);
                },
                error:function() {
                	console.log("push fail!");
                }
            });
        });
        
    });
    
    if ('WebSocket' in window) {
    	sock = new WebSocket("ws://localhost:8080/aimnt/task_sp");
    	console.log('WebSocket');
    }else if ('MozWebSocket' in window) {
    	sock = new MozWebSocket("ws://localhost:8080/aimnt/ws/task");
    	console.log('MozWebSocket');
    }else {
    	sock = new SockJS("http://localhost:8080/aimnt/ws/task");
    	console.log('SockJS');
    }
    
    sock.onopen = function() {
        console.log('open');
    };
    sock.onmessage = function(e) {
        console.log('message', e.data);
        $('.msg-content').html(e.data);
        playSound();
    };
    sock.onerror = function() {
        console.log('onerror');
    };
    sock.onclose = function() {
        console.log('close');
    };

    //sock.send('test');
    //sock.close();
    
    var audio;
    var playSound = function() {
        if (audio == null) {
            audio = new Audio('static/sounds/notify.mp3');
        }
        audio.play();
    };
    
</script>
</body>
</html>