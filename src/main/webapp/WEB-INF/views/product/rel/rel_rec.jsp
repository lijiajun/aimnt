<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro" %>
<!DOCTYPE html>
<html>
<head>
<%@include file="../../included/includedStyle.jsp" %>
</head>

<body>
    <div class="wrapper">
        <div class="portlet light bordered">
            <div class="portlet-title">
                <div class="caption">
                    <i class="fa fa-search"></i>
                    <span class="caption-subject font-blue-hoki bold uppercase">查询条件</span>
                </div>
                <div class="tools">
                    <a href="" class="collapse"></a>
                    <a href="" class="reload"></a>
                </div>
            </div>
            <div class="portlet-body form">
                <!-- BEGIN FORM-->
                <form action="#" class="form-horizontal">
                    <div class="form-body">
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label class="control-label col-md-4">发布版本</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" id="relCode">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label class="control-label col-md-4">发布日期</label>
                                    <div class="col-md-8">
                                        <div class="input-group date-picker input-daterange" data-date="10/11/2012" data-date-format="yyyy-mm-dd">
                                            <input type="text" class="form-control" name="from" id="beginDate" readonly AUTOCOMPLETE="off">
                                            <span class="input-group-addon"> 到 </span>
                                            <input type="text" class="form-control" name="to" id="endDate" readonly AUTOCOMPLETE="off">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label class="control-label col-md-4">所属产品</label>
                                    <div class="col-md-8">
                                        <select name="prodId" class="select2 form-control" id="prodId">
                                            <option value="-1">全部</option>
                                            <c:forEach items="${prodEnums}" var="prodEnum">
                                                <option value="${prodEnum.key}">${prodEnum.value}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label class="control-label col-md-4">大版本</label>
                                    <div class="col-md-8">
                                        <select name="verCode" class="select2 form-control" id="verCode">
                                            <option value="-1">全部</option>
                                            <c:forEach items="${verEnums}" var="verEnum">
                                                <option value="${verEnum.key}">${verEnum.value}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <div class="control-label col-md-4">
                                        <button type="button" id="btnQuery" class="btn green btn-mnt">查询</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
                <!-- END FORM-->
            </div>
        </div>

        <div class="row">
            <div class="col-md-12">
                <div class="portlet light wrapper-content">
<!--                     <div class="portlet-title"> -->
<!--                         <div class="caption"> -->
<!--                             <i class=" icon-layers font-green"></i> -->
<!--                             <span class="caption-subject font-blue-hoki bold uppercase">查询结果</span> -->
<!--                         </div> -->
<!--                         <div class="tools"> -->
<!--                             <a href="javascript:;" class="collapse"> </a> -->
<!--                             <a href="" class="fullscreen result-full"> </a> -->
<!--                         </div> -->
<!--                     </div> -->
                    <div class="portlet-body">
                        <table class="table table-striped table-bordered table-hover table-checkable order-column" id="tabRelease" cellspacing="0" width="100%">
                            <thead>
                                <tr>
                                    <th class="checkbox-datatables"><input type="checkbox" id="tab-th-chk" /></th>
                                    <th>发布版本号</th>
                                    <th>发布类型</th>
                                    <th>所属产品</th>
                                    <th>大版本</th>
                                    <th>发布日期</th>
                                    <th>发布描述</th>
                                    <th>创建时间</th>
                                    <th>操作</th>
                                </tr>
                            </thead>
                            <tbody>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div style="display:none" id="btn-data-tools">
        <shiro:hasPermission name="prod:operate">
        <span class="dt-buttons">
            <a class="dt-button btn purple btn-outline btn-mnt" id="btnImport" >
                <span>导入</span>
            </a>
        </span>
        <span class="dt-buttons">
            <a class="dt-button btn red btn-outline btn-mnt" id="btnDelete" >
                <span>删除</span>
            </a>
        </span>
        <span class="dt-buttons">
            <a class="dt-button btn yellow btn-outline btn-mnt" id="btnModify">
                <span>修改</span>
            </a>
         </span>
        <span class="dt-buttons">
            <a class="dt-button btn dark btn-outline btn-mnt btnAdd" id="btnAdd">
                <span>添加</span>
            </a>
         </span>
         </shiro:hasPermission>
    </div>
<%@include file="../../included/includedJs.jsp" %>



<script>
    $(function() {
//     	$.fn.select2.defaults.set("theme", "bootstrap");
    
        $('#prodId').change(function(){
            loadVerCodeSelect(2);
        });
    	
        var tableObj = $("#tabRelease").DataTable(getConfig());
        $("#btnQuery").click(function(e) {
            var strRelCode = $("#relCode").val();
            var strBeginDate = $("#beginDate").val();
            var strEndDate = $("#endDate").val();
            var strVerCode = $("#verCode").val();
            var strProdId = $("#prodId").val();
            strVerCode = strVerCode == -1 ? "" : strVerCode;
            strProdId = strProdId == -1 ? "" : strProdId;
            var sUrl = "rel/rec/query?relCode=" + strRelCode + 
            		"&beginDate=" + strBeginDate + "&endDate=" + 
            		strEndDate + "&verCode=" + strVerCode + "&prodId=" + strProdId;
            tableObj.ajax.url(sUrl).load();
        });
        
        $('.reload').on('click', function() {
            $('#relCode').val('');
            $('#beginDate').val('');
            $('#endDate').val('');
            $('#verCode').val(-1);
            $('#prodId').val(-1);
            tableObj.ajax.url('rel/rec/query?relCode=-1').load();
        });
        

        
        //修改按钮
        $('.div_right').on('click', '.dt-buttons>#btnModify',function() {
            //console.log($("#tabRelease tbody tr td .checked").length);
            //console.log($("#tabRelease tbody tr td .checked"));
            var checkedBox = $("#tabRelease tbody tr td .checked");
            var checkedLength = checkedBox.length;
            if(checkedLength == 0) {
                showMsg("请选择需要修改的数据！");
                return;
            }
            if(checkedLength > 1) {
                showMsg("只能选择一条数据进行修改操作！");
                return;
            }
            //console.log(checkedBox.find('input:checkbox'));
            //console.log(checkedBox.find('input:checkbox').val());
            var strRelId = checkedBox.find('input:checkbox').val();
            showModal(2, "修改发布信息", [ '1000px', '450px' ], "rel/rec/page_update/" + strRelId, tableObj);
        });
        
        //添加按钮
        $('.div_right').on('click', '.dt-buttons>#btnAdd', function() {
            showModal(2, "新增产品", [ '1000px', '450px' ], "rel/rec/page_add", tableObj);
        });
        
        //删除按钮
        $('.div_right').on('click', '.dt-buttons>#btnDelete',function() {
            
            var checkedBox = $("#tabRelease tbody tr td .checked");
            comfirmDeleteData(tableObj, checkedBox, 'rel/rec/delete/');
            
//             var checkedBox = $("#tabRelease tbody tr td .checked");
//             var checkedLength = checkedBox.length;
//             if(checkedLength == 0) {
//                 showMsg("请选择需要删除的数据！");
//                 return;
//             }
//             var relIdAry = [];
            
//             checkedBox.find('input:checkbox').each(function(){
//             	relIdAry.push($(this).val());
//             });
//             $.ajax({
//                 url: 'rel/rec/delete/' + relIdAry,
//                 dataType: 'json',
//                 async:false,
//                 success:function (data) {
//                     showMsg("删除成功！");
//                     tableObj.ajax.reload(null,false);
//                 },
//                 error:function() {
//                     showMsg("删除操作发生错误！");
//                 }
//             });
        });
        
      //导入
        $('.div_right').on('click', '.dt-buttons>#btnImport', function() {
            showModal(2, " ", [ '1000px', '400px' ], "rel/rec/import_page", tableObj);
        });
       
        $('#tabRelease tbody').on( 'click', 'tr', function () {
            //$(this).toggleClass('selected');
            //alert("dd")
            console.log( tableObj.row('.selected').data());
           
        } );
      
      
    });

    function getConfig() {
        return config = {
            "processing" : true,
            "pageLength" : 5,
            "lengthMenu" : [ [ 5, 10, 20, -1 ], [ 5, 10, 20, "All" ] ],
            "order" : [ [ 7, "desc" ] ],  //默认第八列的排序
            "serverSide" : false,
            "ajax" : {
                "url" : "rel/rec/query?relCode=-1",
                "async": false
            },
            "columns" : [ {
                "data" : "relId"
            }, {
                "data" : "relCode",
            }, {
                "data" : "relTypeTxt",
            }, {
                "data" : "prodName"
            }, {
                "data" : "verName"
            }, {
                "data" : "relDate"
            }, {
                "data" : "relDesc",
            }, {
                "data" : "createDate"
            }, {
                "data" : "relId"
            }],
            'columnDefs': [{
            	'orderable' : false,
            	"searchable" : false,
                "targets": [0],
                "data": "relId",
                "render": function (data, type, full) {
                    return '<input type="checkbox" name="data-checkbox" value="' + data + '" />';
                 }
            },{
                "targets": [5],
                "data": "relDate",
                "render": function (data, type, full) {
                    return new Date(data).format("yyyy-MM-dd");
                 }
            },{
                "targets": [7],
                "data": "createDate",
                "render": function (data, type, full) {
                    return new Date(data).format("yyyy-MM-dd hh:mm:ss");
                 }
            },{
                "targets": [8],
                "data": "relId",
                "render": function (data, type, full) {
                    return '<a href="javascript:;" onclick="showRelDetail(' + data + ')"><span class="label label-sm label-info"> 发布明细 </span></a>';
                 }
            }],
            'scrollX': '2000px',
            'dom' : '<"top"l<"div_right">>rt<"bottom"ip><"clear">',
            'initComplete' : initTab,
            "createdRow": function ( row, data, index ) {
                    $('td', row).eq(0).addClass('checkbox-datatables');
            },
            "language" : {
                "processing" : "努力加载数据中...",
                "lengthMenu" : "_MENU_ 条记录每页",
                "zeroRecords" : "没有查询到数据",
                "info" : "第 _PAGE_ 页 ( 总共 _PAGES_ 页 _MAX_ 条记录)",
                "infoEmpty" : "无记录",
                "infoFiltered" : "(从 _MAX_ 条记录过滤)",
                "paginate" : {
                    "previous" : "上一页",
                    "next" : "下一页"
                }
            }
        };
    }
    
    function showRelDetail(relId) {
        showModal(2, ' ', [ '1000px', '600px' ], "rel/dtl/" + relId + "/page");
    }
    //console.log($("#tabRelease tbody tr td .checked"));
    //console.log($("#tabRelease tr").slice(1).each());
    //console.log(this);
    $("#tabRelease tbody tr").slice(1).each(function(g){
        var p = this;
        $(this).children().slice(1).click(function(){
            $($(p).children()[0]).children().each(function(){
                if(this.type=="checkbox"){
                    if(!this.checked){
                        this.checked = true;
                    }else{
                        this.checked = false;
                    }
                }
            });
        });
    });
    
    
    
</script>
</body>
</html>