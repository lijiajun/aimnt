<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>系统参数表XG.SYSPARA模块</title>
<%@include file="../../included/includedStyle.jsp" %>

</head>

<body class="body-bg">
    <div class="wrapper-box">
        <div class="row">
            <div class="col-md-12">
                <div class="wrapper-body">
                    <div class="portlet-title">
                        <div class="caption font-dark">
                            <i class=" icon-layers font-green"></i> <span class="caption-subject bold uppercase"> 系统参数表XG.SYSPARA </span>
                        </div>
                    </div>
                    <div class="portlet-body">
                        <form action="#" class="form-horizontal" id="form-module">
                            <div class="row border-txt">
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            参数编号 <span class="required">*</span>
                                        </label>
                                        <div class="col-md-8">
                                            <p  class="form-control-static">${sysPara.paraId}</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            地区代码，系统中对应的地区代码表内容，如果是0表示对所有的地区有效 <span class="required">*</span>
                                        </label>
                                        <div class="col-md-8">
                                            <p  class="form-control-static">${sysPara.regionCode}</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row border-txt">
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            县区代码，系统中对应的县区代码表内容，如果是0表示对所有的县区有效 <span class="required">*</span>
                                        </label>
                                        <div class="col-md-8">
                                            <p  class="form-control-static">${sysPara.countyCode}</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            参数代码 <span class="required">*</span>
                                        </label>
                                        <div class="col-md-8">
                                            <p  class="form-control-static">${sysPara.paramCode}</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row border-txt">
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            参数名称 <span class="required">*</span>
                                        </label>
                                        <div class="col-md-8">
                                            <p  class="form-control-static">${sysPara.paramName}</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            所属系统
            系统基础参数所属的子系统：
            1 －－ 系统管理
            2 －－ 业务管理
            3 －－ 综合客服
            4 －－ 帐务管理
            5 －－ 帐务处理
            6 －－ 接口管理 <span class="required">*</span>
                                        </label>
                                        <div class="col-md-8">
                                            <p  class="form-control-static">${sysPara.paramClass}</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row border-txt">
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            参数类型 参数的数据类别：(1--Char  2--Number  3--Boolean  4？Date 5－Long 6-String 7-Double)SYS_BASE_TYPE.code_type=1 <span class="required">*</span>
                                        </label>
                                        <div class="col-md-8">
                                            <p  class="form-control-static">${sysPara.paramDataType}</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            参数取值 <span class="required">*</span>
                                        </label>
                                        <div class="col-md-8">
                                            <p  class="form-control-static">${sysPara.paramValue}</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row border-txt">
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            参数说明 <span class="required">*</span>
                                        </label>
                                        <div class="col-md-8">
                                            <p  class="form-control-static">${sysPara.paramDesc}</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            安装点 <span class="required">*</span>
                                        </label>
                                        <div class="col-md-8">
                                            <p  class="form-control-static">${sysPara.baseId}</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row border-txt">
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            所属产品 <span class="required">*</span>
                                        </label>
                                        <div class="col-md-8">
                                            <p  class="form-control-static">${sysPara.prodId}</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            产品版本 <span class="required">*</span>
                                        </label>
                                        <div class="col-md-8">
                                            <p  class="form-control-static">${sysPara.verCode}</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row border-txt">
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            发布版本 <span class="required">*</span>
                                        </label>
                                        <div class="col-md-8">
                                            <p  class="form-control-static">${sysPara.relCode}</p>
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

</body>
</html>