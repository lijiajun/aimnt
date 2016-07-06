<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://"
					+ request.getServerName() + ":" + request.getServerPort()
					+ path + "/";
%>
<% 
response.setHeader("Pragma", "no-cache"); 
response.setHeader("Cache-Control", "no-store"); 
response.setDateHeader("Expires", -1); 
%> 
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta content="width=device-width, initial-scale=1" name="viewport" />
<base href="<%=basePath%>">
<link href="static/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="static/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link href="static/plugins/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css" />
<link href="static/plugins/datatables/css/dataTables.bootstrap.css" rel="stylesheet" type="text/css" />
<!-- <link href="static/plugins/icheck/skins/minimal/minimal.css" rel="stylesheet" type="text/css" /> -->
<link href="static/plugins/uniform/css/uniform.default.min.css" rel="stylesheet" type="text/css" />
<link href="static/plugins/bootstrap-datepicker/css/bootstrap-datepicker3.min.css" rel="stylesheet" type="text/css" />
<link href="static/plugins/layer/skin/layer.css" rel="stylesheet" type="text/css" />
<link href="static/plugins/select2/css/select2.min.css" rel="stylesheet" type="text/css" />
<link href="static/plugins/bootstrap-select/css/bootstrap-select.min.css" rel="stylesheet" type="text/css" />
<link href="static/css/components.css" rel="stylesheet" id="style_components" type="text/css" />
<!-- <link href="static/css/plugins.css" rel="stylesheet" id="style_components" type="text/css" /> -->
<link href="static/css/style.css" rel="stylesheet" type="text/css" />
<link rel="shortcut icon" href="static/img/favicon.ico" />