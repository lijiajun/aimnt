<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="../../included/includedStyle.jsp"%>
<link href="static/plugins/fullcalendar/fullcalendar.min.css" rel="stylesheet" type="text/css" />
<link href="static/css/plugins.min.css" rel="stylesheet" id="style_components" type="text/css" />

<style>
.portlet.calendar .mobile .fc-button {
    padding: 0 6px 20px;
    margin-left: 2px;
    border: 0;
    background-color: #fff;
    background-image: none;
    -webkit-box-shadow: none;
    -moz-box-shadow: none;
    box-shadow: none;
    -webkit-border-radius: 0;
    -moz-border-radius: 0;
    border-radius: 0;
    color: #000;
    text-shadow: none;
    text-align: center;
}

.portlet.calendar .mobile .fc-button.fc-state-active, .portlet.calendar .mobile .fc-button.fc-state-hover {
    background-color: #fff;
}

.portlet.calendar .mobile .fc-content {
    margin-top: 1px;
}

</style>


</head>

<body>
    <div class="wrapper">
        <div class="portlet light portlet-fit bordered calendar">
            <div class="portlet-title">
                <div class="caption">
                    <i class=" icon-layers font-green"></i> 
                    <span class="caption-subject font-green sbold uppercase">我的日历</span>
                </div>
            </div>
            <div class="portlet-body">
                <div class="row">
<!--                     <div class="col-md-3 col-sm-12"> -->
<!--                         <h3 class="event-form-title margin-bottom-20"></h3> -->
<!--                         <div id="external-events"> -->
<!--                             <form class="inline-form"> -->
<!--                                 <input type="text" value="" class="form-control" placeholder="Event Title..." id="event_title" />  -->
<!--                                 <br />  -->
<!--                                 <a href="javascript:;" id="event_add" class="btn green"> -->
<!--                                     添加事件 -->
<!--                                 </a> -->
<!--                             </form> -->
<!--                             <hr /> -->
<!--                             <div id="event_box" class="margin-bottom-10"></div> -->
<!--                             <label for="drop-remove"> <input type="checkbox" id="drop-remove" /> -->
<!--                             拖动后移除 -->
<!--                             </label> -->
<!--                             <hr class="visible-xs" /> -->
<!--                         </div> -->
<!--                     </div> -->
                    <div class="col-md-12 col-sm-12">
                        <div id="myCalendar" class="mobile has-toolbar"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>

<%@include file="../../included/includedJs.jsp"%>
<script src="static/plugins/jquery-ui/jquery-ui.min.js" type="text/javascript"></script>
<script src="static/plugins/moment/moment.min.js" type="text/javascript"></script>
<script src="static/plugins/fullcalendar/fullcalendar.min.js" type="text/javascript"></script>
<script src="static/plugins/fullcalendar/lang/zh-cn.js" type="text/javascript"></script>
<!-- <script src="static/js/calendar.js" type="text/javascript"></script> -->
<script>
$(function() {
	renderCalendar("myCalendar");
});

function renderCalendar(cid) {
    var date = new Date();
    var d = date.getDate();
    var m = date.getMonth();
    var y = date.getFullYear();
    $('#' + cid).addClass("mobile");
    $('#' + cid).fullCalendar({
        header:  {
            left: 'title',
            center: '',
            right: 'prev,next,today,month,agendaWeek,agendaDay'
        },
        defaultView: 'month',
        slotMinutes: 15,
        lang: 'zh-cn',
        editable: true,
        events: 'priv/calendar/query',
        dayClick: function(date, jsEvent, view) {
//             alert('Clicked on: ' + date.format('YYYY-MM-DD HH:mm:ss'));
//             alert('Coordinates: ' + jsEvent.pageX + ',' + jsEvent.pageY);
//             alert('Current view: ' + view.name);
//             $(this).css('background-color', 'red');
        },
        eventClick: function(calEvent, jsEvent, view) {
//             alert('Event: ' + calEvent.id);
            var id = calEvent.id;
            showFullModal(2, [ '1000px', '550px' ], "task/schedule/" + id + "/page");
//             alert('Event: ' + calEvent.title);
//             alert('Event: ' + calEvent.start);
//             alert('Coordinates: ' + jsEvent.pageX + ',' + jsEvent.pageY);
//             alert('View: ' + view.name);
//             $(this).css('background-color', 'red');
        }
    });
}
</script>
</body>
</html>