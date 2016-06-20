<%@ page language="java" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
response.setHeader("Pragma", "no-cache"); 
response.setHeader("Cache-Control", "no-store"); 
response.setDateHeader("Expires", -1); 
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>AI MNT</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta content="width=device-width, initial-scale=1" name="viewport" />
<base href="<%=basePath%>">
<link href="static/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="static/plugins/icheck/skins/polaris/polaris.css" rel="stylesheet" type="text/css" />
<link href="static/css/components.min.css" rel="stylesheet" id="style_components" type="text/css" />
<link href="static/css/login.css" rel="stylesheet" type="text/css" />
<link rel="shortcut icon" href="static/img/favicon.ico" />

</head>

    <body class=" login">
        <div class="logo">
            <img src="static/img/ai-logo.png" width="60" height="60"><h2>AI MNT</h2>
        </div>
        <div class="content">
            <form class="login-form" action="login" method="post">
                <div class="form-title">
                    <span class="form-title">欢迎登录</span>
                    <span class="form-subtitle">运维管理平台</span>
                </div>
                <div class="error-tip">
                    <span> ${error} </span>
                </div>
                <div class="form-group">
                    <label class="control-label visible-ie8 visible-ie9">用户名</label>
                    <input class="form-control form-control-solid placeholder-no-fix" type="text" autocomplete="off" placeholder="用户名" name="username" /> </div>
                <div class="form-group">
                    <label class="control-label visible-ie8 visible-ie9">密码</label>
                    <input class="form-control form-control-solid placeholder-no-fix" type="password" autocomplete="off" placeholder="密码" name="password" /> </div>
                <div class="form-actions">
                    <button type="submit" class="btn red btn-block uppercase" id="btnLogin">登&nbsp;&nbsp;录</button>
                </div>
                <div class="form-actions">
                    <div class="pull-left">
                        <label class="rememberme check">
                            <input type="checkbox" name="rememberMe" checked/> 记住我一周 </label>
                    </div>
<!--                     <div class="pull-right forget-password-block"> -->
<!--                         <a href="javascript:;" id="forget-password" class="forget-password">Forgot Password?</a> -->
<!--                     </div> -->
                </div>
            </form>
<!--             <form class="forget-form" action="index.html" method="post"> -->
<!--                 <div class="form-title"> -->
<!--                     <span class="form-title">Forget Password ?</span> -->
<!--                     <span class="form-subtitle">Enter your e-mail to reset it.</span> -->
<!--                 </div> -->
<!--                 <div class="form-group"> -->
<!--                     <input class="form-control placeholder-no-fix" type="text" autocomplete="off" placeholder="Email" name="email" /> </div> -->
<!--                 <div class="form-actions"> -->
<!--                     <button type="button" id="back-btn" class="btn btn-default">Back</button> -->
<!--                     <button type="submit" class="btn btn-primary uppercase pull-right">Submit</button> -->
<!--                 </div> -->
<!--             </form> -->
        </div>
        <div class="copyright hide"> 2016 © AI MNT 运维管理平台 </div>

<!--[if lt IE 9]>
    <script src="static/plugins/respond.min.js"></script>
    <script src="static/plugins/excanvas.min.js"></script> 
<![endif]-->
<script src="static/plugins/jquery/jquery.min.js" type="text/javascript"></script>
<script src="static/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="static/plugins/icheck/icheck.min.js" type="text/javascript"></script>

<script>
$(document).ready(function(){
  $('input').iCheck({
    checkboxClass: 'icheckbox_polaris',
    radioClass: 'iradio_polaris',
    increaseArea: '-10' // optional
  });
  
  $('#btnLogin').on('click',function(){
      
//       window.location = 'index';
  });
});
</script>


</body>
</html>