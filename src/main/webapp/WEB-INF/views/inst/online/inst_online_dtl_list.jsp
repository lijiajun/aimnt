<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>上线版本号明细信息</title>
<%@include file="../../included/includedStyle.jsp" %>
</head>

<body>
    <div class="wrapper">
        <div class="row">
            <div class="col-md-12">
                <div class="wrapper-content">
                    <div class="portlet-title">
                        <div class="caption font-dark">
                            <i class=" icon-layers font-green"></i> <span class="caption-subject bold uppercase">上线版本号 ${mntReleaseRec.relCode }详细信息  </span>
                        </div>
                    </div>
                    <div class="portlet-body">
                        <form action="#" class="form-horizontal" id="form-rel">
                            <div class="row border-txt">
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            产品类型:
                                        </label>
                                        <div class="col-md-8">
                                            <p class="form-control-static"> ${prodIdTxt} </p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            产品版本:
                                        </label>
                                        <div class="col-md-8">
                                            <p class="form-control-static"> ${mntReleaseRec.verCode} </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row border-txt">
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            发布版本号:
                                        </label>
                                        <div class="col-md-8">
                                            <p class="form-control-static"> ${mntReleaseRec.relCode} </p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            发布类型:
                                        </label>
                                        <div class="col-md-8">
                                            <p class="form-control-static">${relTypeTxt } </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row border-txt">
                               
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            发布时间:
                                        </label>
                                        <div class="col-md-8">
                                            <p class="form-control-static"> 
                                            <fmt:formatDate value="${mntReleaseRec.relDate}" pattern="yyyy-MM-dd" />
                                            </p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            创建人:
                                        </label>
                                        <div class="col-md-8">
                                            <div class="col-md-8">
                                                <p class="form-control-static">${mntReleaseRec.creator } </p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row border-txt">
                               <div class="col-md-12">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-2 control-label" for="form_control_1">
                                           发布版本号描述:
                                        </label>
                                        <div class="col-md-10">
                                            <p class="form-control-static"> ${mntReleaseRec.relDesc} </p>
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

<%@include file="../../included/includedJs.jsp" %>


<script type="text/javascript">

</script>
</body>
</html>