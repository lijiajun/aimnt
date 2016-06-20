<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="../../included/includedStyle.jsp"%>
<link href="static/plugins/fullcalendar/fullcalendar.min.css" rel="stylesheet" type="text/css" />
<link href="static/css/plugins.min.css" rel="stylesheet" id="style_components" type="text/css" />
</head>

<body>
    <div class="wrapper">
        <div class="portlet light portlet-fit bordered calendar">
            <div class="portlet-title">
                <div class="caption">
                    <i class=" icon-layers font-green"></i> 
                    <span class="caption-subject font-green sbold uppercase">上线日历</span>
                </div>
            </div>
            <div class="portlet-body">
                <div class="row">
                    <div class="col-md-3 col-sm-12">
                        <h3 class="event-form-title margin-bottom-20"></h3>
                        <div id="external-events">
                            <form class="inline-form">
                                <input type="text" value="" class="form-control" placeholder="Event Title..." id="event_title" /> 
                                <br /> 
                                <a href="javascript:;" id="event_add" class="btn green">
                                    添加事件
                                </a>
                            </form>
                            <hr />
                            <div id="event_box" class="margin-bottom-10"></div>
                            <label for="drop-remove"> <input type="checkbox" id="drop-remove" />
                            拖动后移除
                            </label>
                            <hr class="visible-xs" />
                        </div>
                    </div>
                    <div class="col-md-9 col-sm-12">
                        <div id="calendar" class="has-toolbar"></div>
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
<script src="static/js/calendar.js" type="text/javascript"></script>

    <script>
                    $(function() {

                    });
                </script>
</body>
</html>