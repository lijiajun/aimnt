<%@ page language="java" pageEncoding="UTF-8"%>
<% 
response.setHeader("Pragma", "no-cache"); 
response.setHeader("Cache-Control", "no-store"); 
response.setDateHeader("Expires", -1); 
%> 
<!DOCTYPE html>
<html>
<!-- BEGIN HEAD -->
<head>
<meta charset="utf-8" />
<title>AI MNT</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta content="width=device-width, initial-scale=1" name="viewport" />
<meta content="" name="ai mnt" />
<meta content="" name="ai" />
<!--         <link href='http://fonts.useso.com/css?family=Open+Sans:300,400,600&subset=latin,latin-ext' rel='stylesheet'> -->
<link href="static/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link href="static/plugins/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css" />
<link href="static/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="static/css/components.min.css" rel="stylesheet" id="style_components" type="text/css" />
<link href="static/css/error.min.css" rel="stylesheet" type="text/css" />
<link href="static/css/layout.css" rel="stylesheet" type="text/css" />
<link href="static/css/themes/grey.min.css" rel="stylesheet" type="text/css" id="style_color" />
<link href="static/css/mnt.css" rel="stylesheet" type="text/css" />
<link rel="shortcut icon" href="static/img/favicon.ico" />

</head>
<!-- END HEAD -->

<body class="page-header-fixed page-sidebar-closed-hide-logo page-content-white page-sidebar-fixed">

    <jsp:include page="head.jsp"></jsp:include>

    <!-- BEGIN HEADER & CONTENT DIVIDER -->
    <div class="clearfix"></div>
    <!-- END HEADER & CONTENT DIVIDER -->
    <!-- BEGIN CONTAINER -->
    <div class="page-container">
        <jsp:include page="left.jsp"></jsp:include>
        <!-- BEGIN CONTENT -->
        <div class="page-content-wrapper">
            <!-- BEGIN CONTENT BODY -->
            <div class="page-content">
                <!-- BEGIN PAGE HEADER-->
                <!-- BEGIN PAGE BAR -->
                <div class="page-bar">
                    <ul class="page-breadcrumb">
                        <li><span>当前位置：</span></li>
                        <li><span id="title-txt">主页</span></li>
                    </ul>
<!--                     <div class="page-toolbar"> -->
<!--                         <div class="btn-group pull-right"> -->
<!--                             <button type="button" class="btn green btn-sm btn-outline dropdown-toggle" data-toggle="dropdown"> -->
<!--                                 Actions <i class="fa fa-angle-down"></i> -->
<!--                             </button> -->
<!--                             <ul class="dropdown-menu pull-right" role="menu"> -->
<!--                                 <li><a href="#"> <i class="icon-bell"></i> Action -->
<!--                                 </a></li> -->
<!--                                 <li><a href="#"> <i class="icon-shield"></i> Another action -->
<!--                                 </a></li> -->
<!--                                 <li><a href="#"> <i class="icon-user"></i> Something else here -->
<!--                                 </a></li> -->
<!--                                 <li class="divider"></li> -->
<!--                                 <li><a href="#"> <i class="icon-bag"></i> Separated link -->
<!--                                 </a></li> -->
<!--                             </ul> -->
<!--                         </div> -->
<!--                     </div> -->
                </div>
                <!-- END PAGE BAR -->
                <!-- END PAGE HEADER-->
                <div class="page-content-body">
<!--                     <div class="row"> -->
                        <iframe id="page-content-frame" name="page-content-frame" target="page-content-frame" 
                        runat="server" src="stat/index" width="100%"
                        noresize marginwidth="0" marginheight="0" scrolling="yes" 
                        width=100% frameborder="no" height="500px" border="0" marginwidth="0"></iframe>
<!--                     </div> -->
                </div>
            </div>
            <!-- END CONTENT BODY -->
        </div>
        <!-- END CONTENT -->
    </div>
    <!-- END CONTAINER -->
    <!-- BEGIN FOOTER -->
<%--     <jsp:include page="footer.jsp"></jsp:include> --%>
    <!-- END FOOTER -->

    <!--[if lt IE 9]>
        <script src="static/plugins/respond.min.js"></script>
        <script src="static/plugins/excanvas.min.js"></script> 
    <![endif]-->
    <script src="static/plugins/jquery/jquery.min.js" type="text/javascript"></script>
    <script src="static/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="static/plugins/bootstrap-hover-dropdown/bootstrap-hover-dropdown.min.js" type="text/javascript"></script>
    <script src="static/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
    <script src="static/js/app.js" type="text/javascript"></script>
    <script src="static/js/layout.js" type="text/javascript"></script>
    <script src="static/js/quick-sidebar.min.js" type="text/javascript"></script>
    <script src="static/plugins/layer/layer.js" type="text/javascript"></script>
    <script src="static/js/mnt.js" type="text/javascript"></script>
    
<!--     <script type='text/javascript'> -->
<!-- //         window.history.forward(); -->
<!-- //         window.onbeforeunload=function (){} -->
<!--     </script> -->
    
</body>

</html>