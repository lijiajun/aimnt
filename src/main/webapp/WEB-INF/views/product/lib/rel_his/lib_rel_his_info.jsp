<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="../../../included/includedStyle.jsp" %>
</head>

<body class="body-bg">
    <div class="wrapper-box">
        <div class="row">
            <div class="col-md-12">
                <div class="wrapper-body">
                    <div class="portlet-title">
                        <div class="caption font-dark">
                            <i class="icon-layers font-green"></i> <span class="caption-subject bold uppercase"> 新增库文件发布历史明细 </span>
                        </div>
                    </div>
                    <div class="portlet-body">
                        <form action="#" class="form-horizontal" id="form-add">
                            <div class="row border-txt">
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            产品类型：
                                        </label>
                                        <div class="col-md-8">
                                            <p class="form-control-static">${mntLibRelHis.mntModuleLib.mntProdModule.prodName}</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            产品版本：
                                        </label>
                                        <div class="col-md-8">
                                            <p class="form-control-static">${mntLibRelHis.mntModuleLib.mntProdModule.verName}</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row border-txt">
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            所属模块：
                                        </label>
                                        <div class="col-md-8">
                                            <p class="form-control-static">${mntLibRelHis.mntModuleLib.mntProdModule.moduleName}</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            发布版本：
                                        </label>
                                        <div class="col-md-8">
                                            <p class="form-control-static">${mntLibRelHis.mntReleaseRec.relCode}</p>
                                        </div>
                                    </div>
                                </div>
                                
                            </div>
                            <div class="row border-txt">
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            库文件：
                                        </label>
                                        <div class="col-md-8">
                                            <p class="form-control-static">${mntLibRelHis.mntModuleLib.libName}</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            MD5值：
                                        </label>
                                        <div class="col-md-8">
                                            <p class="form-control-static">${mntLibRelHis.md5Val}</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row border-txt">
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            安装点：
                                        </label>
                                        <div class="col-md-8">
                                            <p class="form-control-static">${mntLibRelHis.baseId}</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            输出文件：
                                        </label>
                                        <div class="col-md-8">
                                            <p class="form-control-static">${mntLibRelHis.outputFile}</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row border-txt">
                                <div class="col-md-12">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-2 control-label" for="form_control_1">
                                            备注：
                                        </label>
                                        <div class="col-md-8">
                                            <p class="form-control-static">${mntLibRelHis.remark}</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

<%@include file="../../../included/includedJs.jsp" %>

<script type="text/javascript">

jQuery(document).ready(function() {
    

    
});


</script>
</body>
</html>