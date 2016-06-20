<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>AI MNT</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta content="width=device-width, initial-scale=1" name="viewport" />
<link href="../static/plugin/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link href="../static/plugin/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css" />
<link href="../static/plugin/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="../static/plugin/datatables/css/datatables.min.css" rel="stylesheet" type="text/css" />
<link href="../static/plugin/uniform/css/uniform.default.css" rel="stylesheet" type="text/css" />
<link href="../static/css/components.min.css" rel="stylesheet" id="style_components" type="text/css" />
<link href="../static/css/plugins.css" rel="stylesheet" id="style_components" type="text/css" />
<link href="../static/css/custom.css" rel="stylesheet" type="text/css" />
<link href="../static/css/style.css" rel="stylesheet" type="text/css" />
<link rel="shortcut icon" href="../static/img/favicon.ico" />

<style>
.wrapper {
    padding: 20px;
}
</style>


</head>

<body>
    <!-- BEGIN CONTENT -->
    <div class="page-content-wrapper">
        <!-- BEGIN CONTENT BODY -->
        <div class="page-content">
            <!-- BEGIN PAGE HEADER-->
            <!-- BEGIN PAGE TITLE-->
            <h3 class="page-title">
                Managed Datatables <small>managed datatable samples</small>
            </h3>
            <!-- END PAGE TITLE-->
            <!-- END PAGE HEADER-->
            <div class="row">
                <div class="col-md-12">
                    <!-- BEGIN EXAMPLE TABLE PORTLET-->
                    <div class="portlet light bordered">
                        <div class="portlet-title">
                            <div class="caption font-dark">
                                <i class="icon-settings font-dark"></i> <span class="caption-subject bold uppercase"> Managed Table</span>
                            </div>
                            <div class="actions">
                                <div class="btn-group btn-group-devided" data-toggle="buttons">
                                    <label class="btn btn-transparent dark btn-outline btn-circle btn-sm active"> <input type="radio" name="options" class="toggle" id="option1">Actions
                                    </label> <label class="btn btn-transparent dark btn-outline btn-circle btn-sm"> <input type="radio" name="options" class="toggle" id="option2">Settings
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="portlet-body">
                            <div class="table-toolbar">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="btn-group">
                                            <button id="sample_editable_1_new" class="btn sbold green">
                                                Add New <i class="fa fa-plus"></i>
                                            </button>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="btn-group pull-right">
                                            <button class="btn green  btn-outline dropdown-toggle" data-toggle="dropdown">
                                                Tools <i class="fa fa-angle-down"></i>
                                            </button>
                                            <ul class="dropdown-menu pull-right">
                                                <li><a href="javascript:;"> <i class="fa fa-print"></i> Print
                                                </a></li>
                                                <li><a href="javascript:;"> <i class="fa fa-file-pdf-o"></i> Save as PDF
                                                </a></li>
                                                <li><a href="javascript:;"> <i class="fa fa-file-excel-o"></i> Export to Excel
                                                </a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <table class="table table-striped table-bordered table-hover table-checkable order-column" id="sample_1">
                                <thead>
                                    <tr>
                                        <th><input type="checkbox" class="group-checkable" data-set="#sample_1 .checkboxes" /></th>
                                        <th>Username</th>
                                        <th>Email</th>
                                        <th>Points</th>
                                        <th>Joined</th>
                                        <th>Status</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr class="odd gradeX">
                                        <td><input type="checkbox" class="checkboxes" value="1" /></td>
                                        <td>shuxer</td>
                                        <td><a href="mailto:shuxer@gmail.com"> shuxer@gmail.com </a></td>
                                        <td>120</td>
                                        <td class="center">12 Jan 2012</td>
                                        <td><span class="label label-sm label-success"> Approved </span></td>
                                    </tr>
                                    <tr class="odd gradeX">
                                        <td><input type="checkbox" class="checkboxes" value="1" /></td>
                                        <td>looper</td>
                                        <td><a href="mailto:looper90@gmail.com"> looper90@gmail.com </a></td>
                                        <td>120</td>
                                        <td class="center">12.12.2011</td>
                                        <td><span class="label label-sm label-warning"> Suspended </span></td>
                                    </tr>
                                    <tr class="odd gradeX">
                                        <td><input type="checkbox" class="checkboxes" value="1" /></td>
                                        <td>userwow</td>
                                        <td><a href="mailto:userwow@yahoo.com"> userwow@yahoo.com </a></td>
                                        <td>20</td>
                                        <td class="center">12.12.2012</td>
                                        <td><span class="label label-sm label-success"> Approved </span></td>
                                    </tr>
                                    <tr class="odd gradeX">
                                        <td><input type="checkbox" class="checkboxes" value="1" /></td>
                                        <td>user1wow</td>
                                        <td><a href="mailto:userwow@gmail.com"> userwow@gmail.com </a></td>
                                        <td>20</td>
                                        <td class="center">12.12.2012</td>
                                        <td><span class="label label-sm label-default"> Blocked </span></td>
                                    </tr>
                                    <tr class="odd gradeX">
                                        <td><input type="checkbox" class="checkboxes" value="1" /></td>
                                        <td>restest</td>
                                        <td><a href="mailto:userwow@gmail.com"> test@gmail.com </a></td>
                                        <td>20</td>
                                        <td class="center">12.12.2012</td>
                                        <td><span class="label label-sm label-success"> Approved </span></td>
                                    </tr>
                                    <tr class="odd gradeX">
                                        <td><input type="checkbox" class="checkboxes" value="1" /></td>
                                        <td>foopl</td>
                                        <td><a href="mailto:userwow@gmail.com"> good@gmail.com </a></td>
                                        <td>20</td>
                                        <td class="center">19.11.2010</td>
                                        <td><span class="label label-sm label-success"> Approved </span></td>
                                    </tr>
                                    <tr class="odd gradeX">
                                        <td><input type="checkbox" class="checkboxes" value="1" /></td>
                                        <td>weep</td>
                                        <td><a href="mailto:userwow@gmail.com"> good@gmail.com </a></td>
                                        <td>20</td>
                                        <td class="center">19.11.2010</td>
                                        <td><span class="label label-sm label-success"> Approved </span></td>
                                    </tr>
                                    <tr class="odd gradeX">
                                        <td><input type="checkbox" class="checkboxes" value="1" /></td>
                                        <td>coop</td>
                                        <td><a href="mailto:userwow@gmail.com"> good@gmail.com </a></td>
                                        <td>20</td>
                                        <td class="center">19.11.2010</td>
                                        <td><span class="label label-sm label-success"> Approved </span></td>
                                    </tr>
                                    <tr class="odd gradeX">
                                        <td><input type="checkbox" class="checkboxes" value="1" /></td>
                                        <td>pppol</td>
                                        <td><a href="mailto:userwow@gmail.com"> good@gmail.com </a></td>
                                        <td>20</td>
                                        <td class="center">19.11.2010</td>
                                        <td><span class="label label-sm label-success"> Approved </span></td>
                                    </tr>
                                    <tr class="odd gradeX">
                                        <td><input type="checkbox" class="checkboxes" value="1" /></td>
                                        <td>test</td>
                                        <td><a href="mailto:userwow@gmail.com"> good@gmail.com </a></td>
                                        <td>20</td>
                                        <td class="center">19.11.2010</td>
                                        <td><span class="label label-sm label-success"> Approved </span></td>
                                    </tr>
                                    <tr class="odd gradeX">
                                        <td><input type="checkbox" class="checkboxes" value="1" /></td>
                                        <td>userwow</td>
                                        <td><a href="mailto:userwow@gmail.com"> userwow@gmail.com </a></td>
                                        <td>20</td>
                                        <td class="center">12.12.2012</td>
                                        <td><span class="label label-sm label-default"> Blocked </span></td>
                                    </tr>
                                    <tr class="odd gradeX">
                                        <td><input type="checkbox" class="checkboxes" value="1" /></td>
                                        <td>test</td>
                                        <td><a href="mailto:userwow@gmail.com"> test@gmail.com </a></td>
                                        <td>20</td>
                                        <td class="center">12.12.2012</td>
                                        <td><span class="label label-sm label-success"> Approved </span></td>
                                    </tr>
                                    <tr class="odd gradeX">
                                        <td><input type="checkbox" class="checkboxes" value="1" /></td>
                                        <td>goop</td>
                                        <td><a href="mailto:userwow@gmail.com"> good@gmail.com </a></td>
                                        <td>20</td>
                                        <td class="center">12.11.2010</td>
                                        <td><span class="label label-sm label-success"> Approved </span></td>
                                    </tr>
                                    <tr class="odd gradeX">
                                        <td><input type="checkbox" class="checkboxes" value="1" /></td>
                                        <td>weep</td>
                                        <td><a href="mailto:userwow@gmail.com"> good@gmail.com </a></td>
                                        <td>20</td>
                                        <td class="center">15.11.2011</td>
                                        <td><span class="label label-sm label-default"> Blocked </span></td>
                                    </tr>
                                    <tr class="odd gradeX">
                                        <td><input type="checkbox" class="checkboxes" value="1" /></td>
                                        <td>toopl</td>
                                        <td><a href="mailto:userwow@gmail.com"> good@gmail.com </a></td>
                                        <td>20</td>
                                        <td class="center">16.11.2010</td>
                                        <td><span class="label label-sm label-success"> Approved </span></td>
                                    </tr>
                                    <tr class="odd gradeX">
                                        <td><input type="checkbox" class="checkboxes" value="1" /></td>
                                        <td>userwow</td>
                                        <td><a href="mailto:userwow@gmail.com"> userwow@gmail.com </a></td>
                                        <td>20</td>
                                        <td class="center">9.12.2012</td>
                                        <td><span class="label label-sm label-default"> Blocked </span></td>
                                    </tr>
                                    <tr class="odd gradeX">
                                        <td><input type="checkbox" class="checkboxes" value="1" /></td>
                                        <td>tes21t</td>
                                        <td><a href="mailto:userwow@gmail.com"> test@gmail.com </a></td>
                                        <td>20</td>
                                        <td class="center">14.12.2012</td>
                                        <td><span class="label label-sm label-success"> Approved </span></td>
                                    </tr>
                                    <tr class="odd gradeX">
                                        <td><input type="checkbox" class="checkboxes" value="1" /></td>
                                        <td>fop</td>
                                        <td><a href="mailto:userwow@gmail.com"> good@gmail.com </a></td>
                                        <td>20</td>
                                        <td class="center">13.11.2010</td>
                                        <td><span class="label label-sm label-warning"> Suspended </span></td>
                                    </tr>
                                    <tr class="odd gradeX">
                                        <td><input type="checkbox" class="checkboxes" value="1" /></td>
                                        <td>kop</td>
                                        <td><a href="mailto:userwow@gmail.com"> good@gmail.com </a></td>
                                        <td>20</td>
                                        <td class="center">17.11.2010</td>
                                        <td><span class="label label-sm label-success"> Approved </span></td>
                                    </tr>
                                    <tr class="odd gradeX">
                                        <td><input type="checkbox" class="checkboxes" value="1" /></td>
                                        <td>vopl</td>
                                        <td><a href="mailto:userwow@gmail.com"> good@gmail.com </a></td>
                                        <td>20</td>
                                        <td class="center">19.11.2010</td>
                                        <td><span class="label label-sm label-success"> Approved </span></td>
                                    </tr>
                                    <tr class="odd gradeX">
                                        <td><input type="checkbox" class="checkboxes" value="1" /></td>
                                        <td>userwow</td>
                                        <td><a href="mailto:userwow@gmail.com"> userwow@gmail.com </a></td>
                                        <td>20</td>
                                        <td class="center">12.12.2012</td>
                                        <td><span class="label label-sm label-default"> Blocked </span></td>
                                    </tr>
                                    <tr class="odd gradeX">
                                        <td><input type="checkbox" class="checkboxes" value="1" /></td>
                                        <td>wap</td>
                                        <td><a href="mailto:userwow@gmail.com"> test@gmail.com </a></td>
                                        <td>20</td>
                                        <td class="center">12.12.2012</td>
                                        <td><span class="label label-sm label-success"> Approved </span></td>
                                    </tr>
                                    <tr class="odd gradeX">
                                        <td><input type="checkbox" class="checkboxes" value="1" /></td>
                                        <td>test</td>
                                        <td><a href="mailto:userwow@gmail.com"> good@gmail.com </a></td>
                                        <td>20</td>
                                        <td class="center">19.12.2010</td>
                                        <td><span class="label label-sm label-success"> Approved </span></td>
                                    </tr>
                                    <tr class="odd gradeX">
                                        <td><input type="checkbox" class="checkboxes" value="1" /></td>
                                        <td>toop</td>
                                        <td><a href="mailto:userwow@gmail.com"> good@gmail.com </a></td>
                                        <td>20</td>
                                        <td class="center">17.12.2010</td>
                                        <td><span class="label label-sm label-success"> Approved </span></td>
                                    </tr>
                                    <tr class="odd gradeX">
                                        <td><input type="checkbox" class="checkboxes" value="1" /></td>
                                        <td>weep</td>
                                        <td><a href="mailto:userwow@gmail.com"> good@gmail.com </a></td>
                                        <td>20</td>
                                        <td class="center">15.11.2011</td>
                                        <td><span class="label label-sm label-success"> Approved </span></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <!-- END EXAMPLE TABLE PORTLET-->
                </div>
            </div>
            <div class="row">
                <div class="col-md-6 col-sm-12">
                    <!-- BEGIN EXAMPLE TABLE PORTLET-->
                    <div class="portlet light portlet-fit portlet-datatable bordered" id="form_wizard_1">
                        <div class="portlet-title">
                            <div class="caption">
                                <i class=" icon-layers font-green"></i> <span class="caption-subject font-green sbold uppercase">Sample Datatable</span>
                            </div>
                            <div class="actions">
                                <a class="btn btn-circle btn-icon-only btn-default" href="javascript:;"> <i class="icon-cloud-upload"></i>
                                </a> <a class="btn btn-circle btn-icon-only btn-default" href="javascript:;"> <i class="icon-wrench"></i>
                                </a> <a class="btn btn-circle btn-icon-only btn-default" href="javascript:;"> <i class="icon-trash"></i>
                                </a>
                            </div>
                        </div>
                        <div class="portlet-body">
                            <table class="table table-striped table-bordered table-hover table-checkable order-column" id="sample_2">
                                <thead>
                                    <tr>
                                        <th class="table-checkbox"><input type="checkbox" class="group-checkable" data-set="#sample_2 .checkboxes" /></th>
                                        <th>Username</th>
                                        <th>Email</th>
                                        <th>Status</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr class="odd gradeX">
                                        <td><input type="checkbox" class="checkboxes" value="1" /></td>
                                        <td>shuxer</td>
                                        <td><a href="mailto:shuxer@gmail.com"> shuxer@gmail.com </a></td>
                                        <td><span class="label label-sm label-success"> Approved </span></td>
                                    </tr>
                                    <tr class="odd gradeX">
                                        <td><input type="checkbox" class="checkboxes" value="1" /></td>
                                        <td>looper</td>
                                        <td><a href="mailto:looper90@gmail.com"> looper90@gmail.com </a></td>
                                        <td><span class="label label-sm label-warning"> Suspended </span></td>
                                    </tr>
                                    <tr class="odd gradeX">
                                        <td><input type="checkbox" class="checkboxes" value="1" /></td>
                                        <td>userwow</td>
                                        <td><a href="mailto:userwow@yahoo.com"> userwow@yahoo.com </a></td>
                                        <td><span class="label label-sm label-success"> Approved </span></td>
                                    </tr>
                                    <tr class="odd gradeX">
                                        <td><input type="checkbox" class="checkboxes" value="1" /></td>
                                        <td>user1wow</td>
                                        <td><a href="mailto:userwow@gmail.com"> userwow@gmail.com </a></td>
                                        <td><span class="label label-sm label-default"> Blocked </span></td>
                                    </tr>
                                    <tr class="odd gradeX">
                                        <td><input type="checkbox" class="checkboxes" value="1" /></td>
                                        <td>restest</td>
                                        <td><a href="mailto:userwow@gmail.com"> test@gmail.com </a></td>
                                        <td><span class="label label-sm label-success"> Approved </span></td>
                                    </tr>

                                </tbody>
                            </table>
                        </div>
                    </div>
                    <!-- END EXAMPLE TABLE PORTLET-->
                </div>
                <div class="col-md-6 col-sm-12">
                    <!-- BEGIN EXAMPLE TABLE PORTLET-->
                    <div class="portlet box red">
                        <div class="portlet-title">
                            <div class="caption">
                                <i class="fa fa-cogs"></i>Table
                            </div>
                            <div class="actions">
                                <a href="javascript:;" class="btn btn-default btn-sm"> <i class="fa fa-plus"></i> Add
                                </a> <a href="javascript:;" class="btn btn-default btn-sm"> <i class="fa fa-print"></i> Print
                                </a>
                            </div>
                        </div>
                        <div class="portlet-body">
                            <table class="table table-striped table-bordered table-hover table-checkable order-column" id="sample_3">
                                <thead>
                                    <tr>
                                        <th class="table-checkbox"><input type="checkbox" class="group-checkable" data-set="#sample_3 .checkboxes" /></th>
                                        <th>Username</th>
                                        <th>Email</th>
                                        <th>Status</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr class="odd gradeX">
                                        <td><input type="checkbox" class="checkboxes" value="1" /></td>
                                        <td>shuxer</td>
                                        <td><a href="mailto:shuxer@gmail.com"> shuxer@gmail.com </a></td>
                                        <td><span class="label label-sm label-success"> Approved </span></td>
                                    </tr>
                                    <tr class="odd gradeX">
                                        <td><input type="checkbox" class="checkboxes" value="1" /></td>
                                        <td>looper</td>
                                        <td><a href="mailto:looper90@gmail.com"> looper90@gmail.com </a></td>
                                        <td><span class="label label-sm label-warning"> Suspended </span></td>
                                    </tr>
                                    <tr class="odd gradeX">
                                        <td><input type="checkbox" class="checkboxes" value="1" /></td>
                                        <td>userwow</td>
                                        <td><a href="mailto:userwow@yahoo.com"> userwow@yahoo.com </a></td>
                                        <td><span class="label label-sm label-success"> Approved </span></td>
                                    </tr>
                                    <tr class="odd gradeX">
                                        <td><input type="checkbox" class="checkboxes" value="1" /></td>
                                        <td>user1wow</td>
                                        <td><a href="mailto:userwow@gmail.com"> userwow@gmail.com </a></td>
                                        <td><span class="label label-sm label-default"> Blocked </span></td>
                                    </tr>
                                    <tr class="odd gradeX">
                                        <td><input type="checkbox" class="checkboxes" value="1" /></td>
                                        <td>restest</td>
                                        <td><a href="mailto:userwow@gmail.com"> test@gmail.com </a></td>
                                        <td><span class="label label-sm label-success"> Approved </span></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <!-- END EXAMPLE TABLE PORTLET-->
                </div>
            </div>
        </div>
        <!-- END CONTENT BODY -->
    </div>
    <!-- END CONTENT -->


    <!--[if lt IE 9]>
    <script src="../static/plugin/respond.min.js"></script>
    <script src="../static/plugin/excanvas.min.js"></script> 
    <![endif]-->
    <script src="../static/plugin/jquery/jquery.min.js" type="text/javascript"></script>
    <script src="../static/plugin/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="../static/plugin/uniform/jquery.uniform.min.js" type="text/javascript"></script>
        <script src="../static/js/datatable.js" type="text/javascript"></script>
    <script src="../static/plugin/datatables/js/datatables.min.js" type="text/javascript"></script>
    <script src="../static/plugin/datatables/js/datatables.bootstrap.js" type="text/javascript"></script>
    <script src="../static/js/app.js" type="text/javascript"></script>
    <script src="../static/plugin/datatables/table-datatables-managed.js" type="text/javascript"></script>
<script>
//     $(function() {
        
//         var tableObj = $("#tab_prod").DataTable(getConfig());
        
//         $("#btnQuery").click(function (e) {
//             var strCustID = $("#custId").val() == "" ? "-1" : $("#custId").val();
//             var strCustName = $("#custName").val() == "" ? "-1" : $("#custName").val();
//             var sUrl = "../prod/" + strCustID + "/" + strCustName + "/0/5/";
//                 tableObj.ajax.url(sUrl).load();
//             });
//         });

//         function getConfig() {
//             return config = {
//                 "processing" : true,
//                 "pageLength" : 5,
//                 "lengthMenu" : [ [ 5, 10, 20, -1 ], [ 5, 10, 20, "All" ] ],
//                 "serverSide" : false, //true服务端处理模式， false 客户端处理模式（浏览器处理）
// //                 "ajax" : {
// //                     "url" : "../prod/prodList",
// //                 },
//                 "scrollY": true,
//                 "scrollX": true,
// //                 "columns" : [ {
// //                     "data" : "序号"
// //                 }, {
// //                     "data" : "产品名称"
// //                 }, {
// //                     "data" : "产品描述"
// //                 }, {
// //                     "data" : "创建人"
// //                 }, {
// //                     "data" : "创建时间"
// //                 }, {
// //                     "data" : "修改人"
// //                 }, {
// //                     "data" : "修改时间"
// //                 } ],
//                 "language" : {
//                     "lengthMenu" : "_MENU_ 条记录每页",
//                     "zeroRecords" : "没有找到记录",
//                     "info" : "第 _PAGE_ 页 ( 总共 _PAGES_ 页 )",
//                     "infoEmpty" : "无记录",
//                     "infoFiltered" : "(从 _MAX_ 条记录过滤)",
//                     "paginate" : {
//                         "previous" : "上一页",
//                         "next" : "下一页"
//                     }
//                 }
//             };
//         }                  
</script>
</body>
</html>