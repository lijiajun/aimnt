<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>产品线任务统计模块</title>
<%@include file="../../included/includedStyle.jsp" %>

</head>

<body>
    <div class="wrapper">
        <div class="wrapper-content">
            <div class="portlet-title">
                <div class="caption font-dark">
                    <i class=" icon-layers font-green"></i> <span class="caption-subject bold uppercase"> 产品线任务统计 </span>
                </div>
            </div>
            <div class="portlet-body">
                <form action="#" class="form-horizontal" id="form-module">
                    <div class="row border-txt">
                        <div class="col-md-6">
                            <div class="form-group form-md-line-input">
                                <label class="col-md-4 control-label" for="form_control_1">
                                    编号 <span class="required">*</span>
                                </label>
                                <div class="col-md-8">
                                    <p  class="form-control-static">${mntProdTaskStat.id}</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group form-md-line-input">
                                <label class="col-md-4 control-label" for="form_control_1">
                                    产品编号 <span class="required">*</span>
                                </label>
                                <div class="col-md-8">
                                    <p  class="form-control-static">${mntProdTaskStat.prodId}</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row border-txt">
                        <div class="col-md-6">
                            <div class="form-group form-md-line-input">
                                <label class="col-md-4 control-label" for="form_control_1">
                                     <span class="required">*</span>
                                </label>
                                <div class="col-md-8">
                                    <p  class="form-control-static">${mntProdTaskStat.newNum}</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group form-md-line-input">
                                <label class="col-md-4 control-label" for="form_control_1">
                                    处理中需求数 <span class="required">*</span>
                                </label>
                                <div class="col-md-8">
                                    <p  class="form-control-static">${mntProdTaskStat.processingNum}</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row border-txt">
                        <div class="col-md-6">
                            <div class="form-group form-md-line-input">
                                <label class="col-md-4 control-label" for="form_control_1">
                                    已完成需求数 <span class="required">*</span>
                                </label>
                                <div class="col-md-8">
                                    <p  class="form-control-static">${mntProdTaskStat.finishedNum}</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group form-md-line-input">
                                <label class="col-md-4 control-label" for="form_control_1">
                                    未完成需求最早提出时间 <span class="required">*</span>
                                </label>
                                <div class="col-md-8">
                                    <p  class="form-control-static">${mntProdTaskStat.earlSubmTimeUnfinished}</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row border-txt">
                        <div class="col-md-6">
                            <div class="form-group form-md-line-input">
                                <label class="col-md-4 control-label" for="form_control_1">
                                    周期 1周 2月 3季 4年 <span class="required">*</span>
                                </label>
                                <div class="col-md-8">
                                    <p  class="form-control-static">${mntProdTaskStat.cycle}</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group form-md-line-input">
                                <label class="col-md-4 control-label" for="form_control_1">
                                    周期开始日期 <span class="required">*</span>
                                </label>
                                <div class="col-md-8">
                                    <p  class="form-control-static">${mntProdTaskStat.cycleBeginDate}</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row border-txt">
                        <div class="col-md-6">
                            <div class="form-group form-md-line-input">
                                <label class="col-md-4 control-label" for="form_control_1">
                                    周期结束日期 <span class="required">*</span>
                                </label>
                                <div class="col-md-8">
                                    <p  class="form-control-static">${mntProdTaskStat.cycleEndDate}</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group form-md-line-input">
                                <label class="col-md-4 control-label" for="form_control_1">
                                    备注 <span class="required">*</span>
                                </label>
                                <div class="col-md-8">
                                    <p  class="form-control-static">${mntProdTaskStat.remark}</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row border-txt">
                        <div class="col-md-6">
                            <div class="form-group form-md-line-input">
                                <label class="col-md-4 control-label" for="form_control_1">
                                    创建人 <span class="required">*</span>
                                </label>
                                <div class="col-md-8">
                                    <p  class="form-control-static">${mntProdTaskStat.creator}</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group form-md-line-input">
                                <label class="col-md-4 control-label" for="form_control_1">
                                    创建时间 <span class="required">*</span>
                                </label>
                                <div class="col-md-8">
                                    <p  class="form-control-static">${mntProdTaskStat.createDate}</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row border-txt">
                        <div class="col-md-6">
                            <div class="form-group form-md-line-input">
                                <label class="col-md-4 control-label" for="form_control_1">
                                    修改人 <span class="required">*</span>
                                </label>
                                <div class="col-md-8">
                                    <p  class="form-control-static">${mntProdTaskStat.modifier}</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group form-md-line-input">
                                <label class="col-md-4 control-label" for="form_control_1">
                                    修改时间 <span class="required">*</span>
                                </label>
                                <div class="col-md-8">
                                    <p  class="form-control-static">${mntProdTaskStat.modifyDate}</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>

<%@include file="../../included/includedJs.jsp" %>

</body>
</html>