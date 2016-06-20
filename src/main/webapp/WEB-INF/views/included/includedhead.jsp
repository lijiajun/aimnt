<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://"
					+ request.getServerName() + ":" + request.getServerPort()
					+ path + "/";
%>

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta content="width=device-width, initial-scale=1" name="viewport" />
<base href="<%=basePath%>">
<link href="static/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link href="static/plugins/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css" />
<link href="static/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="static/plugins/datatables/css/dataTables.bootstrap.css" rel="stylesheet" type="text/css" />
<!-- <link href="static/plugins/icheck/skins/minimal/minimal.css" rel="stylesheet" type="text/css" /> -->
<link href="static/plugins/uniform/css/uniform.default.min.css" rel="stylesheet" type="text/css" />
<link href="static/plugins/bootstrap-datepicker/css/bootstrap-datepicker3.min.css" rel="stylesheet" type="text/css" />
<link href="static/plugins/layer/skin/layer.css" rel="stylesheet" type="text/css" />
<link href="static/css/components.min.css" rel="stylesheet" id="style_components" type="text/css" />
<!-- <link href="static/css/plugins.css" rel="stylesheet" id="style_components" type="text/css" /> -->
<link href="static/css/style.css" rel="stylesheet" type="text/css" />
<link rel="shortcut icon" href="static/img/favicon.ico" />


<!--[if lt IE 9]>
    <script src="static/plugins/respond.min.js"></script>
    <script src="static/plugins/excanvas.min.js"></script> 
<![endif]-->
<script src="static/plugins/jquery/jquery.min.js" type="text/javascript"></script>
<script src="static/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<!--     <script src="static/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script> -->
<script src="static/plugins/datatables/js/jquery.dataTables.js" type="text/javascript"></script>
<script src="static/plugins/datatables/js/dataTables.bootstrap.js" type="text/javascript"></script>
<!-- <script src="static/plugins/icheck/icheck.min.js" type="text/javascript"></script> -->
<script src="static/plugins/uniform/jquery.uniform.js" type="text/javascript"></script>
<script src="static/plugins/bootstrap-datepicker/js/bootstrap-datepicker.min.js" type="text/javascript"></script>
<script src="static/plugins/bootstrap-datepicker/locales/bootstrap-datepicker.zh-CN.min.js" charset="UTF-8" type="text/javascript"></script>
<script src="static/plugins/layer/layer.js" type="text/javascript"></script>
<script src="static/js/app.js" type="text/javascript"></script>
<script src="static/js/components-date-time-pickers.min.js" type="text/javascript"></script>
<script src="static/js/common.js" type="text/javascript"></script>