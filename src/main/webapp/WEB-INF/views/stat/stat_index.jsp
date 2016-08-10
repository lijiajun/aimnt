<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="../included/includedStyle.jsp"%>
<link href="static/plugins/fullcalendar/fullcalendar.min.css" rel="stylesheet" type="text/css" />
<link href="static/css/plugins.min.css" rel="stylesheet" id="style_components" type="text/css" />

<style>

/* BODY { */
/*     background-color: #E8E8E8; */
/* } */

/* 日历事件*/
.external-event {
    display: inline-block;
    cursor: move;
    margin-bottom: 2px;
    margin-left: 2px;
}

.portlet.cale .fc-event .fc-content {
  border: 0;
  padding: 1px 1px;
}

/* .fc-resizable { */
/*   width:10px; */
/* } */

.portlet.cale {
    padding-bottom: 3px;
    width:100%;
/*     height:370px; */
    padding-bottom: 10px!important;
    border: 1px solid #cfcfcf !important;
    -moz-box-shadow: 0 1px 3px rgba(0,0,0,0.1);
    -webkit-box-shadow: 0 1px 3px rgba(0,0,0,0.1);
    box-shadow: 0 1px 3px rgba(0,0,0,0.1);
}

.fc-event {
  position: relative;
  display: block;
  font-size: 8px!important;
  line-height: 1;
  border-radius: 3px;
  border: 0px solid #3a87ad;
  background-color: #3a87ad;
  font-weight: 1;
}

.portlet.light.portlet-fit>.portlet-title {
    padding: 10px 20px 1px;
}

.portlet.calendar.light .fc-button {
    top: -10px!important;
    color: #666;
    text-transform: uppercase;
    font-size: 13px!important;
    padding-bottom: 2px!important;
}

.fc-left>h2 {
    top:-60px;
    color: #666;
    text-transform: uppercase;
    font-size: 15px!important;
}

.portlet.cale .mobile .fc-button {
    padding: 0 6px 20px;
    margin-left: 2px;
    border: 0;
    background-color: #fff!important;
    background-image: none;
    -webkit-box-shadow: none;
    -moz-box-shadow: none;
    box-shadow: none;
    -webkit-border-radius: 0;
    -moz-border-radius: 0;
    border-radius: 0;
    color: #000;
    text-shadow: none;
    text-align: center;
}
/* 日历事件 end*/

.portlet.map {
    border: 1px solid #F2F2F2;
    padding-bottom: 10px!important;
    border: 1px solid #cfcfcf!important;
    -moz-box-shadow: 0 1px 3px rgba(0,0,0,0.1);
    -webkit-box-shadow: 0 1px 3px rgba(0,0,0,0.1);
    box-shadow: 0 1px 3px rgba(0,0,0,0.1);
}

.select-box {
    padding: 7px 25px;
}

.fc-basic-view .fc-body .fc-row {
    min-height: 3em;
}

.highcharts-title {
  font-size: 13px!important;
  font-weight: 800;
}
</style>


</head>

<body>
    <div class="wrapper">
        <div class="row">
            <div class="col-md-5 col-sm-5">
                <div class="portlet light cale">
                    <div class="portlet-title">
                        <div class="caption font-green">
                            <i class="icon-cursor"></i>
                            <span class="caption-subject bold uppercase">上线日历</span>
                        </div>
                        <div class="tools">
                            <a href="javascript:;" class="collapse"> </a>
                            <a href="javascript:;" class="reload"> </a>
                            <a href="" class="fullscreen"> </a>
                        </div>
                    </div>
                    <div class="portlet-body">
                        <div id="calendar" class="has-toolbar" style="width:100%; height:310px;"></div>
                    </div>
                </div>
            </div>
            <div class="col-md-7 col-sm-7">
                <div class="portlet light cale">
                    <div class="portlet-title">
                        <div class="caption font-green">
                            <i class="icon-cursor"></i>
                            <span id="ctitle" class="caption-subject bold uppercase">每月发布需求量统计</span>
                        </div>
                        <div class="col-md-5 select-box">
                            <select name="prodId" class="form-control" id="showType">
                                <option value="2">按安装点统计</option>
                                <option value="1">按产品统计</option>
                            </select>
                        </div>
                        <div class="tools hchart">
                            <a href="javascript:;" class="collapse"> </a>
                            <a href="javascript:;" class="reload"> </a>
                            <a href="" class="fullscreen"> </a>
                        </div>
                    </div>
                    <div class="portlet-body">
                        <div id="container" style="width:100%; height:310px;"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
<!--             <div class="col-md-5 col-sm-5"> -->
<!--                 <div class="portlet light cale"> -->
<!--                     <div class="portlet-title"> -->
<!--                         <div class="caption font-green"> -->
<!--                             <i class="icon-cursor"></i> -->
<!--                             <span id="ctitle" class="caption-subject bold uppercase">平台消息</span> -->
<!--                         </div> -->
<!--                         <div class="tools"> -->
<!--                             <a href="javascript:;" class="collapse"> </a> -->
<!--                             <a href="javascript:;" class="reload"> </a> -->
<!--                             <a href="" class="fullscreen"> </a> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                     <div class="portlet-body"> -->
<!--                         <div id="container-msg" style="width:100%; height:300px; margin-bottom:5px"></div> -->
<!--                     </div> -->
<!--                 </div> -->
<!--             </div> -->
            <div class="col-md-12 col-sm-12">
                <div class="portlet light map">
                    <div class="portlet-title">
                        <div class="caption font-green">
                            <i class="icon-cursor"></i>
                            <span id="ctitle" class="caption-subject bold uppercase">产品分布</span>
                        </div>
                        <div class="tools">
                            <a href="javascript:;" class="collapse"> </a>
                            <a href="javascript:;" class="reload"> </a>
                            <a href="" class="fullscreen"> </a>
                        </div>
                    </div>
                    <div class="portlet-body">
                        <div id="prod-map" style="width:100%; height:510px;"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>

<%@include file="../included/includedJs.jsp"%>
<script src="static/plugins/jquery-ui/jquery-ui.min.js" type="text/javascript"></script>
<script src="static/plugins/moment/moment.min.js" type="text/javascript"></script>
<script src="static/plugins/fullcalendar/fullcalendar.min.js" type="text/javascript"></script>
<script src="static/plugins/fullcalendar/lang/zh-cn.js" type="text/javascript"></script>
<script src="static/plugins/highcharts/highcharts.src.js" type="text/javascript"></script>
<!-- <script src="static/plugins/highcharts/highmaps.js" type="text/javascript"></script> -->
<!-- <script src="static/plugins/highcharts/modules/data.js" type="text/javascript"></script> -->
<!-- <script src="static/plugins/highcharts/cn-all-sar-taiwan.js" type="text/javascript"></script> -->
<script src="static/plugins/echarts/echarts.min.js" type="text/javascript"></script>
<script src="static/plugins/echarts/china.js" type="text/javascript"></script>

<script>
    $(function() {
    	renderCalendar("calendar", "");
    	
        var moment = $('#calendar').fullCalendar('getDate');
        var sUrl = "stat/req/prod/2?beginDate=" + moment.format('YYYY-MM-DD');
    	renderProdCountChart (sUrl);
    	
    	$('.fc-state-default:not(.fc-month-button )').click(function() {
    		var _type = $("#showType").val();
    	    var moment = $('#calendar').fullCalendar('getDate');
    	    sUrl = "stat/req/prod/" + _type + "?beginDate=" + moment.format('YYYY-MM-DD');
    	    renderProdCountChart(sUrl);
    	});
    	
    	$(".hchart .fullscreen").click(function() {
    		renderProdCountChart(sUrl);
        });
    	
        $(".hchart .reload").click(function() {
            renderProdCountChart(sUrl);
        });
        
        $("#showType").change(function(){
        	var _type = $(this).val();
            var moment = $('#calendar').fullCalendar('getDate');
            sUrl = "stat/req/prod/" + _type + " ?beginDate=" + moment.format('YYYY-MM-DD');
            renderProdCountChart(sUrl);
        })
        
//         var data = [
//             {name:'江西', selected:true},
//             {name:'广西', selected:true},
//             {name:'甘肃', selected:true},
//             {name:'内蒙古', selected:true},
//         ];
        
//         var geoCoordMap = {
//             '产品':'帐管,帐处',
//             '产品':'帐管,帐处',
//             '产品':'帐管,帐处',
//             '产品':'帐管,帐处',
//         }
        
//         var convertData = function (data) {
//             var res = [];
//             for (var i = 0; i < data.length; i++) {
//                 var geoCoord = geoCoordMap[data[i].name];
//                 if (geoCoord) {
//                     res.push({
//                         name: data[i].name,
//                         value: geoCoord.concat(data[i].value)
//                     });
//                 }
//             }
//             return res;
//         };
        
        var prodChart = echarts.init(document.getElementById('prod-map'));
        
        function randomData() {
            return Math.round(Math.random()*1000);
        }

        var option = {
            title: {
                text: '各产品安装点分布',
                //subtext: '纯属虚构',
                left: 'center'
            },
            tooltip: {
                trigger: 'item'
            },
            legend: {
                orient: 'vertical',
                left: 'left',
                data:['计费','帐务','帐管']
            },
            visualMap: {
                min: 0,
                max: 2500,
                left: 'left',
                top: 'bottom',
                text: ['高','低'],           // 文本，默认为数值文本
                calculable: true
            },
            toolbox: {
                show: true,
                orient: 'vertical',
                left: 'right',
                top: 'center',
                feature: {
                    dataView: {readOnly: false},
                    restore: {},
                    saveAsImage: {}
                }
            },
            series: [
                {
                    name: '计费',
                    type: 'map',
                    mapType: 'china',
                    label: {
                        normal: {
                            show: true
                        },
                        emphasis: {
                            show: true
                        }
                    },
                    data:[
                          {name: '广西',value: randomData() },
                          {name: '江西',value: randomData() },
                          {name: '甘肃',value: randomData() },
                          {name: '内蒙古',value: randomData() },
                          {name: '北京',value: randomData() },
                          {name: '辽宁',value: randomData() }
                    ]
                },
                {
                    name: '帐管',
                    type: 'map',
                    mapType: 'china',
                    roam: false,
                    label: {
                        normal: {
                            show: true
                        },
                        emphasis: {
                            show: true
                        }
                    },
                    data:[
                        {name: '广西',value: randomData() },
                        {name: '江西',value: randomData() },
                        {name: '甘肃',value: randomData() },
                        {name: '内蒙古',value: randomData() },
                    ]
                },
                {
                    name: '帐务',
                    type: 'map',
                    mapType: 'china',
                    label: {
                        normal: {
                            show: true
                        },
                        emphasis: {
                            show: true
                        }
                    },
                    data:[
                          {name: '广西',value: randomData() },
                          {name: '江西',value: randomData() },
                          {name: '甘肃',value: randomData() },
                          {name: '内蒙古',value: randomData() }
                    ]
                }
            ]
        };

        // 使用刚指定的配置项和数据显示图表。
        prodChart.setOption(option);
        
        
    });
    
    
    function renderProdCountChart(sUrl) {
    	$.ajax({
            url: sUrl,
            type: "post",
            dataType: "json",
            data: {},
            success: function(data) {
                var options = data;
                chart1 = new Highcharts.Chart(options);
            }
        });
    }
    
    
</script>
</body>
</html>