<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro" %>
<!DOCTYPE html>
<html>
<head>
<%@include file="../../included/includedStyle.jsp"%>
<link href="static/plugins/jstree/themes/default/style.min.css" rel="stylesheet" id="style_components" type="text/css" />
<!-- <link href="static/css/plugins.min.css" rel="stylesheet" id="style_components" type="text/css" /> -->
</head>

<body>
    <div class="wrapper">
        <div class="portlet light portlet-fit">
<!--             <div class="portlet-title"> -->
<!--                 <div class="caption"> -->
<!--                     <i class=" icon-layers font-green"></i>  -->
<!--                     <span class="caption-subject font-green sbold uppercase">资源管理</span> -->
<!--                 </div> -->
<!--             </div> -->
            <div class="portlet-body">
                <div class="row">
                    <div class="col-md-3 col-sm-12 ">
                        <div class="portlet light bordered">
                            <div class="portlet-title">
                                <div class="caption">
                                    <span class="font-green">资源层级</span>
                                </div>
                            </div>
                            <div class="portlet-body">
                                <div id="res_tree" class="tree-box"> </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-9 col-sm-12 ">
                            <div class="wrapper-content portlet light">
                                <div class="portlet-title">
                                    <div class="caption">
                                        <i class=" icon-layers font-green"></i>
                                        <span class="font-green">资源列表</span>
                                    </div>
                                    <div class="tools">
                                        <shiro:hasPermission name="auth:operate">
                                        <span class="dt-buttons">
                                            <a class="dt-button btn red btn-outline btn-mnt" id="btnDelete" >
                                                <span>删除</span>
                                            </a>
                                        </span>
                                        <span class="dt-buttons">
                                            <a class="dt-button btn yellow btn-outline btn-mnt" id="btnUpdate">
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
                                </div>
                                <div class="portlet-body">
                                    <table class="table table-striped table-bordered table-hover display table-checkable" id="tabSysRes" cellspacing="0" width="100%">
                                        <thead>
                                            <tr>
                                                <th class="checkbox-datatables"><input type="checkbox" id="tab-th-chk" /></th>
                                                <th>资源名称</th>
                                                <th>资源类型</th>
                                                <th>父节点名称</th>
                                                <th>所有父节点</th>
                                                <th>资源路径</th>
                                                <th>资源权限</th>
                                                <th>资源图标</th>
                                                <th>资源顺序</th>
                                                <th>资源状态</th>
                                                <th>创建日期</th>
                                                <th>备注</th>
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
        </div>
    </div>

<%@include file="../../included/includedJs.jsp"%>
<script src="static/plugins/jstree/jstree.min.js" type="text/javascript"></script>

<script>

$(function() {
    
    createResTree();
    
    var tableObj = $('#tabSysRes').DataTable(getConfig());
    
    $('#res_tree').on('changed.jstree', function (e, data) {
      var resId = data.instance.get_node(data.selected).id;
      if(resId === '#') {
    	  resId = -1;
      }
      var sUrl = 'sys/res/query?parentId=' + resId;
      tableObj.ajax.url(sUrl).load();
    });
    
    //新增
    $('#btnAdd').on('click', function(){
        showModal(2, " ", ['1000px', '500px'], "sys/res/page_add", tableObj);
    });
    
    //修改按钮
    $('#btnUpdate').on('click',function() {
        var checkedBox = $("#tabSysRes tbody tr td .checked");
        var checkedLength = checkedBox.length;
        if(checkedLength == 0) {
            showMsg("请选择需要修改的数据！");
            return;
        }
        if(checkedLength > 1) {
            showMsg("只能选择一条数据进行修改操作！");
            return;
        }
        var strResId = checkedBox.find('input:checkbox').val();
        showModal(2, "修改发布信息", [ '1000px', '500px' ], "sys/res/page_update/" + strResId, tableObj);
    });
    
    //删除按钮
    $('#btnDelete').on('click',function() {
        
        var checkedBox = $("#tabSysRes tbody tr td .checked");
        comfirmDeleteData(tableObj, checkedBox, 'sys/res/delete/');
        
//         var checkedBox = $("#tabSysRes tbody tr td .checked");
//         var checkedLength = checkedBox.length;
//         if(checkedLength == 0) {
//             showMsg("请选择需要删除的数据！");
//             return;
//         }
//         var resIdAry = [];
        
//         checkedBox.find('input:checkbox').each(function(){
//             alert($(this).val());
//             resIdAry.push($(this).val());
//         });
//         alert(resIdAry);
//         $.ajax({
//             url: 'sys/res/delete/' + resIdAry,
//             dataType: 'json',
//             async:false,
//             success:function (data) {
//                 showMsg("删除成功！");
//                 tableObj.ajax.reload(null,false);
//             },
//             error:function() {
//                 showMsg("删除操作发生错误！");
//             }
//         });
    });
    
});


function initTree() {
    $.ajax({
        url:"sys/res/query/tree",
        dataType: "json",
        async:false,
        success:function (data) {
            console.log(data);
            createResTree(data);
        },
        error:function() {
            alert("获取资源树数据错误！");
        }
    });
}

function createResTree() {
    $('#res_tree').jstree({
        'plugins': ["wholerow", "types"],
        'core': {
            "themes" : {
                "responsive": false
            },    
            'data': {
                "url" : "sys/res/query/tree",
                "dataType" : "json" 
            }
        },
        "types" : {
            "default" : {
                "icon" : "fa fa-folder icon-state-warning icon-lg"
            },
            "file" : {
                "icon" : "fa fa-file icon-state-warning icon-lg"
            }
        }
    });
}

function getConfig() {
    return config = {
        "processing" : true,
        "pageLength" : 10,
        "destroy": true,
        "lengthMenu" : [ [ 5, 10, 20, -1 ], [ 5, 10, 20, "All" ] ],
        "order" : [ [ 7, "asc" ] ],
        "serverSide" : false,
        "ajax" : {
            "url" : 'sys/res/query'
//             "async": false
        },
        "columns" : [ {
            "data" : "resId",
        }, {
            "data" : "resName",
        }, {
            "data" : "resTypeTxt",
        }, {
            "data" : "parentName",
        }, {
            "data" : "parentIds",
        }, {
            "data" : "resUrl",
        }, {
            "data" : "permission",
        }, {
            "data" : "resIcon",
        },{
            "data" : "resOrder",
        }, {
            "data" : "resStsTxt",
        }, {
            "data" : "createDate",
        }, {
            "data" : "remark",
        }],
        'columnDefs': [{
            'orderable' : false,
            "searchable" : false,
            "targets": [0],
            "data": "resId",
            "render": function (data, type, full) {
                return '<input type="checkbox" name="data-checkbox" value="' + data + '" />';
             }
        },{
            "targets": [7],
            "data": "resIcon",
            "render": function (data, type, full) {
                if(data == null || data == '') {
                    return '';
                }
                return "<i class=" + data + "></i>";
             }
        },{
            "targets": [10],
            "data": "createDate",
            "render": function (data, type, full) {
                if(data == null || data == '') {
                    return '';
                }
                return new Date(data).format("yyyy-MM-dd");
             }
        }],
        "sScrollX": "100%",
        "sScrollXInner": "150%",
//         "bScrollCollapse": true,
//         "scrollY": "200px",
        "dom" : '<"top"lf<"div_right">>rt<"bottom"ip><"clear">',
        'initComplete' : initTab,
        "createdRow": function ( row, data, index ) {
                $('td', row).eq(0).addClass('checkbox-datatables');
        },
        "language" : {
        	"processing" : "努力加载数据中...",
            "lengthMenu" : "_MENU_ 条记录每页",
            "zeroRecords" : "没有查询到数据",
            "info" : "第 _PAGE_ 页 ( 总共 _PAGES_ 页 _MAX_ 条记录 )",
            "infoEmpty" : "无记录",
            "infoFiltered" : "(从 _MAX_ 条记录过滤)",
            "paginate" : {
                "previous" : "上一页",
                "next" : "下一页"
            }
        }
    };
}
</script>
</body>
</html>