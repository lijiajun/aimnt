<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>更新系统参数</title>
<%@include file="../../included/includedStyle.jsp" %>
</head>

<body class="body-bg">
    <div class="wrapper-box">
        <div class="row">
            <div class="col-md-12">
                <div class="wrapper-body">
                    <div class="portlet-title">
                        <div class="caption font-dark">
                            <i class="icon-layers font-green"></i> <span class="caption-subject bold uppercase"> 新增系统参数表</span>
                        </div>
                    </div>
                    <div class="portlet-body">
                        <form action="#" class="form-horizontal" id="form-update">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                         安装点    <span class="required">*</span>
                                        </label>
                                        <div class="col-md-8">
                                          <%--   <input type="text" class="form-control" placeholder="" value="${sysPara.baseId}" name="baseId" id="baseId"> --%>
                                            
                                            <select name="baseId" class="selectpicker form-control" id="baseId">
                                                
                                                 <c:forEach items="${baseIdEnums}" var="baseIdEnums">
                                                    <c:if test="${baseIdEnums.key == sysPara.baseId}">
                                                        <option value="${baseIdEnums.key}" selected>${baseIdEnums.value}</option>
                                                    </c:if>
                                                    <c:if test="${baseIdEnums.key != sysPara.baseId}">
                                                        <option value="${baseIdEnums.key}">${baseIdEnums.value}</option>
                                                    </c:if>
                                                </c:forEach>
                                              
                                            </select>
                                            
                                            <div class="form-control-focus"></div>
                                            <span class="help-block">请输入安装点代码</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            地区代码 <span class="required">*</span>
                                        </label>
                                        <div class="col-md-8">
                                            <input type="text" class="form-control" placeholder="" value="${sysPara.regionCode}" name="regionCode" id="regionCode">
                                            <div class="form-control-focus"></div>
                                            <span class="help-block">请输入地区代码，系统中对应的地区代码表内容，如果是0表示对所有的地区有效</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            县区代码 <span class="required">*</span>
                                        </label>
                                        <div class="col-md-8">
                                            <input type="text" class="form-control" placeholder="" value="${sysPara.countyCode}" name="countyCode" id="countyCode">
                                            <div class="form-control-focus"></div>
                                            <span class="help-block">请输入县区代码，系统中对应的县区代码表内容，如果是0表示对所有的县区有效</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            参数代码 <span class="required">*</span>
                                        </label>
                                        <div class="col-md-8">
                                            <input type="text" class="form-control" placeholder="" value="${sysPara.paramCode}" name="paramCode" id="paramCode">
                                            <div class="form-control-focus"></div>
                                            <span class="help-block">请输入参数代码</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            参数名称 <span class="required">*</span>
                                        </label>
                                        <div class="col-md-8">
                                            <input type="text" class="form-control" placeholder="" value="${sysPara.paramName}" name="paramName" id="paramName">
                                            <div class="form-control-focus"></div>
                                            <span class="help-block">请输入参数名称</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            所属系统
                        <span class="required">*</span>
                                        </label>
                                        <div class="col-md-8">
                                           <select name="paramClass" class="selectpicker form-control" id="paramClass">
                                                
                                                 <c:forEach items="${paramSystemEnums}" var="paramSystemEnums">
                                                    <c:if test="${paramSystemEnums.key == sysPara.paramClass}">
                                                        <option value="${paramSystemEnums.key}" selected>${paramSystemEnums.value}</option>
                                                    </c:if>
                                                    <c:if test="${paramSystemEnums.key != sysPara.paramClass}">
                                                        <option value="${paramSystemEnums.key}">${paramSystemEnums.value}</option>
                                                    </c:if>
                                                </c:forEach>
                                              
                                            </select>
                                            <div class="form-control-focus"></div>
                                            <span class="help-block">请输入所属系统
            系统基础参数所属的子系统：
            1 －－ 系统管理
            2 －－ 业务管理
            3 －－ 综合客服
            4 －－ 帐务管理
            5 －－ 帐务处理
            6 －－ 接口管理</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            参数类型  <span class="required">*</span>
                                        </label>
                                        <div class="col-md-8">
                                            <select name="paramDataType" class="selectpicker form-control" id="paramDataType">
                                                <%-- <c:forEach items="${paramTypeEnums}" var="paramTypeEnums">
                                                    <option value="${paramTypeEnums.key}">${paramTypeEnums.value}</option>
                                                </c:forEach> --%>
                                                
                                                
                                                 <c:forEach items="${paramTypeEnums}" var="paramTypeEnums">
                                                    <c:if test="${paramTypeEnums.key == sysPara.paramDataType}">
                                                        <option value="${paramTypeEnums.key}" selected>${paramTypeEnums.value}</option>
                                                    </c:if>
                                                    <c:if test="${paramTypeEnums.key != sysPara.paramDataType}">
                                                        <option value="${paramTypeEnums.key}">${paramTypeEnums.value}</option>
                                                    </c:if>
                                                </c:forEach>
                                                
                                            </select>
                                             <div class="form-control-focus"></div>
                                            <span class="help-block">请输入参数类型 参数的数据类别：(1--Char  2--Number  3--Boolean  4？Date 5－Long 6-String 7-Double)SYS_BASE_TYPE.code_type=1</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            参数取值 <span class="required">*</span>
                                        </label>
                                        <div class="col-md-8">
                                            <input type="text" class="form-control" placeholder="" value="${sysPara.paramValue}" name="paramValue" id="paramValue">
                                            <div class="form-control-focus"></div>
                                            <span class="help-block">请输入参数取值</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            参数说明 <span class="required">*</span>
                                        </label>
                                        <div class="col-md-8">
                                            <input type="text" class="form-control" placeholder="" value="${sysPara.paramDesc}" name="paramDesc" id="paramDesc">
                                            <div class="form-control-focus"></div>
                                            <span class="help-block">请输入参数说明</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            所属产品 <span class="required">*</span>
                                        </label>
                                        <div class="col-md-8">
                                             <select name="prodId" class="selectpicker form-control" id="prodId">
                                                <%-- <c:forEach items="${prodEnums}" var="prodEnum">
                                                    <option value="${prodEnum.key}">${prodEnum.value}</option>
                                                </c:forEach> --%>
                                                
                                                <c:forEach items="${prodEnums}" var="prodEnum">
                                                    <c:if test="${prodEnum.key == sysPara.prodId}">
                                                        <option value="${prodEnum.key}" selected>${prodEnum.value}</option>
                                                    </c:if>
                                                    <c:if test="${prodEnum.key != sysPara.prodId}">
                                                        <option value="${prodEnum.key}">${prodEnum.value}</option>
                                                    </c:if>
                                                </c:forEach>
                                            </select>
                                             <div class="form-control-focus"></div>
                                            <span class="help-block">请输入所属产品</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            产品版本 <span class="required">*</span>
                                        </label>
                                        <div class="col-md-8">
                                           <select name="verCode" class="selectpicker form-control" id="verCode">
                                                <c:forEach items="${verEnums}" var="verEnum">
                                                    <option value="${verEnum.key}">${verEnum.value}</option>
                                                </c:forEach>
                                                
                                               <%--  <c:forEach items="${verEnums}" var="verEnums">
                                                     <c:if test="${verEnums.key == sysPara.verCode}">
                                                       <option value="${verEnums.key}" selected>${verEnums.value}</option>
                                                     </c:if>
                                                     <c:if test="${verEnums.key != sysPara.verCode}">
                                                            <option value="${verEnums.key}">${verEnums.value}</option>
                                                     </c:if>   
                                                 </c:forEach> --%>
                                            </select>
                                              <div class="form-control-focus"></div>
                                            <span class="help-block">请输入产品版本</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            发布版本 <span class="required">*</span>
                                        </label>
                                        <div class="col-md-8">
                                           <%--  <input type="text" class="form-control" placeholder="" value="${sysPara.relCode}" name="relCode" id="relCode"> --%>
                                            <select name="relId" class="selectpicker form-control" data-live-search="true" id="relId">
                                            </select>
                                            <div class="form-control-focus"></div>
                                            <span class="help-block">请输入发布版本</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="col-md-9 model-hidden">
                                        <input type="hidden" value="${sysPara.paraId}" name="paraId" id="paraId">
                                    </div>
                                </div>
                            </div>
                            <div class="form-actions">
                                <div class="row">
                                    <div class="col-md-offset-3 col-md-9">
                                        <button type="submit" class="btn green">提交</button>
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

jQuery(document).ready(function() {
    //赋值
      loadVerCodeSelect();
    //产品版本赋值
      var _verCode = '${mntLibRelHis.mntModuleLib.mntProdModule.verCode}';
      $('#verCode').val(_verCode);
      $('#verCode').selectpicker('refresh');
    //加载模块
      loadModuleSelect();
      var _moduleId = '${mntLibRelHis.mntModuleLib.moduleId}';
      $('#moduleId').val(_moduleId);
      $('#moduleId').selectpicker('refresh');
      //加载发布版本
      loadRelSelect();
      var _relId = '${mntLibRelHis.mntReleaseRec.relId}';
      $('#relId').val(_relId);
      $('#relId').selectpicker('refresh');
      
      $('#prodId').change(function(){
          loadVerCodeSelect();
          loadParentModuleSelect();
          loadRelSelect();
      });
      
      $('#verCode').change(function(){
          loadParentModuleSelect();
          loadRelSelect();
      });
    //表单校验提交
    //[1]自定义校验规则
    var rules = {
            paraId:"required",
            regionCode:"required",
            countyCode:"required",
            paramCode:"required",
            paramName:"required",
            paramClass:"required",
            paramDataType:"required",
            paramValue:"required",
            paramDesc:"required",
           /*  prodId:"required",
            verCode:"required",
            relCode:"required" */
    };
    //[2]表单校验初始化
    initFormValidate('form-update', rules, 'prod/sys_para/update', 'update');
    
});

</script>
</body>
</html>