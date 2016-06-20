<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="../../included/includedStyle.jsp"%>
<!-- <link rel="stylesheet" type="text/css" href="static/plugins/mxGraph/styles/grapheditor.css"> -->
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
  padding: 2px 2px;
}

.portlet.cale {
    padding-bottom: 3px;
    width:100%;
    height:500px
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

.portlet.cale {
    border: 1px solid #F2F2F2;
    padding-bottom: 10px!important;
}

.portlet.map {
    border: 1px solid #F2F2F2;
    padding-bottom: 10px!important;
    backgroung-color: 
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
            <div class="col-md-12 col-sm-12">
                <div class="portlet light cale">
                    <div class="portlet-title">
                        <div class="caption font-green">
                            <i class="icon-cursor"></i>
                            <span id="ctitle" class="caption-subject bold uppercase">各安装点主机部署信息</span>
                        </div>
                        <div class="col-md-5 select-box">
                            <select name="prodId" class="form-control" id="showType">
                                <option value="1">江西</option>
                                <option value="2">甘肃</option>
                                <option value="3">内蒙古</option>
                                <option value="4">广西</option>
                            </select>
                        </div>
                        <div class="tools hchart">
                            <a href="javascript:;" class="collapse"> </a>
                            <a href="javascript:;" class="reload"> </a>
                            <a href="" class="fullscreen"> </a>
                        </div>
                    </div>
                    <div class="portlet-body">
                        <div id="graphContainer" style="width:100%; height:300px;"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>

<%@include file="../../included/includedJs.jsp"%>
<script type="text/javascript">
mxBasePath = 'static/plugins/mxGraph';
mxImageBasePath = '<%=basePath%>/static/plugins/mxGraph/images';
var RESOURCES_PATH = '<%=basePath%>/static/plugins/mxGraph/resources';
var RESOURCE_BASE = RESOURCES_PATH + '/grapheditor';
var STENCIL_PATH = '<%=basePath%>/static/plugins/mxGraph/stencils';
var IMAGE_PATH = '<%=basePath%>/static/plugins/mxGraph/images';
var STYLE_PATH = '<%=basePath%>/static/plugins/mxGraph/styles';
var CSS_PATH = '<%=basePath%>/static/plugins/mxGraph/styles';
var urlParams = (function(url)
{
    var result = new Object();
    var idx = url.lastIndexOf('?');

    if (idx > 0)
    {
        var params = url.substring(idx + 1).split('&');
        
        for (var i = 0; i < params.length; i++)
        {
            idx = params[i].indexOf('=');
            
            if (idx > 0)
            {
                result[params[i].substring(0, idx)] = params[i].substring(idx + 1);
            }
        }
    }
    
    return result;
})(window.location.href);
mxLanguage = urlParams['lang'];
mxLanguages = ['zh'];
</script>
<!--     <script type="text/javascript" src="static/plugins/mxGraph/jscolor/jscolor.js"></script> -->
<!--     <script type="text/javascript" src="static/plugins/mxGraph/sanitizer/sanitizer.min.js"></script> -->
    <script type="text/javascript" src="static/plugins/mxGraph/js/mxClient.js"></script>
<!--     <script type="text/javascript" src="static/plugins/mxGraph/js/EditorUi.js"></script> -->
<!--     <script type="text/javascript" src="static/plugins/mxGraph/js/Editor.js"></script> -->
<!--     <script type="text/javascript" src="static/plugins/mxGraph/js/Sidebar.js"></script> -->
<!--     <script type="text/javascript" src="static/plugins/mxGraph/js/Graph.js"></script> -->
<!--     <script type="text/javascript" src="static/plugins/mxGraph/js/Shapes.js"></script> -->
<!--     <script type="text/javascript" src="static/plugins/mxGraph/js/Actions.js"></script> -->
<!--     <script type="text/javascript" src="static/plugins/mxGraph/js/Menus.js"></script> -->
<!--     <script type="text/javascript" src="static/plugins/mxGraph/js/Format.js"></script> -->
<!--     <script type="text/javascript" src="static/plugins/mxGraph/js/Toolbar.js"></script> -->
<!--     <script type="text/javascript" src="static/plugins/mxGraph/js/Dialogs.js"></script> -->
<script>
$(function() {
	main(document.getElementById('graphContainer'));
});

function main(container)
{
    // Checks if browser is supported
    if (!mxClient.isBrowserSupported())
    {
        // Displays an error message if the browser is
        // not supported.
        mxUtils.error('Browser is not supported!', 200, false);
    }
    else
    {
    	var graph = new mxGraph(container);
    	
        var style = graph.getStylesheet().getDefaultVertexStyle();
        // 不设置这个属性 背景图片不出来
        style[mxConstants.STYLE_SHAPE] = mxConstants.SHAPE_LABEL;
        style[mxConstants.STYLE_OVERFLOW] = "hidden";
        style[mxConstants.STYLE_IMAGE_ALIGN] = mxConstants.ALIGN_CENTER;
        style[mxConstants.STYLE_IMAGE_VERTICAL_ALIGN] = mxConstants.ALIGN_BOTTOM;
        style[mxConstants.STYLE_IMAGE_WIDTH] = 70;
        style[mxConstants.STYLE_IMAGE_HEIGHT] = 70;
        // 文字水平方式
//         style[mxConstants.STYLE_ALIGN] = mxConstants.ALIGN_BOTTOM;
//         // 文字垂直对齐
//         style[mxConstants.STYLE_VERTICAL_ALIGN] = mxConstants.ALIGN_BOTTOM;
        graph.setHtmlLabels(true);
        // Load cells and layouts the graph
        graph.getModel().beginUpdate();
        try
        {
            var doc = mxUtils.load('static/mx/host/Drawing1.xml?date'+new Date()).getDocumentElement();
            
//             window.openFile.setData(doc, "111");
            
            console.log(doc);
            var codec = new mxCodec(doc.ownerDocument);
            console.log(codec);
            var model = graph.getModel();
            codec.decode(doc, model);
            
//             var doc = mxUtils.parseXml(xml);
//             var model = new mxGraphModel();
//             var codec = new mxCodec(doc);
//             codec.decode(doc.documentElement, model);
//             var highlight = new mxCellHighlight(graph, '#ff0000', 2);
//             highlight.highlight(graph.view.getState(cell));

                //var children = model.getChildren(model.getChildAt(model.getRoot(), 0));
                //editor.graph.setSelectionCells(editor.graph.importCells(children));
//             var children = model.getChildren(model.getChildAt(model.getRoot(), 0));
//             graph.setSelectionCells(graph.importCells(children));
        }
        finally
        {
            // Updates the display
            graph.setCellStyles('html', '1');
            graph.getModel().endUpdate();
        }
        var root=graph.getChildCells(graph.model.getRoot());
        var cells=root[0].children;

        for (var i = 0; i < cells.length; i++) {
        	
//         	console.log(cells[i]);
        	var preStyle= cells[i].getStyle();
//         	console.log(preStyle);
            var style = graph.getCellStyle(cells[i]);
        	if(style[mxConstants.STYLE_SHAPE] == 'image') {
            	console.log(i);
//                 graph.setCellStyles(mxConstants.STYLE_SHAPE, 'image', [cells[i]]);
                style[mxConstants.STYLE_SHAPE] = mxConstants.SHAPE_IMAGE;
                style[mxConstants.STYLE_OVERFLOW] = "hidden";
                style[mxConstants.STYLE_IMAGE_ALIGN] = mxConstants.ALIGN_BOTTOM;
                style[mxConstants.STYLE_IMAGE_VERTICAL_ALIGN] = mxConstants.ALIGN_BOTTOM;
                style[mxConstants.STYLE_IMAGE_WIDTH] = 70;
                style[mxConstants.STYLE_IMAGE_HEIGHT] = 70;
                graph.getStylesheet().putCellStyle('image', style);
        	}
        	
        	
        }
        //graph.setCellStyles('html', '1');
        //graph.refresh();
        
        // 启动鼠标悬停提示  
        var rubberband = new mxRubberband(graph);  
        var keyHandler = new mxKeyHandler(graph);
     // 安装一个自定义的工具提示单元格  
        graph.getTooltipForCell = function(cell)  
        {  
            return 'Doubleclick and right- or shiftclick';  
        } 
        
        graph.addListener(mxEvent.CELLS_MOVED,function(sender, evt){  
            alert("CELLS_MOVED");
            var cell = evt.getProperty('cell');
            if(cell==null&&sender.graphHandler.cells!=null){  
                cell = sender.graphHandler.cells[0];//保证cell有值，否则移动时cell  
            }   
            if(cell != null && cell.vertex == 1) {//代表鼠标点击的是节点  
                //alert("移动节点"+cell.id);      
                cell.autoSaveNode = '1';//给cell节点增加一个自定义属性,标识处于可保存状态     
            }    
        }); 
        graph.addListener(mxEvent.CLICK,function(sender, evt){  
            var cell = evt.getProperty('cell');
            if (cell != null && this.getModel().isVertex(cell)) {
                alert("CLICK");
            }
        }); 
        
        
    }
}

// Parses the mxGraph XML file format
function read(graph, filename)
{
	console.log(filename);
    var req = mxUtils.load(filename);
	console.log(req);
    var root = req.getDocumentElement();
	console.log(root);
    var dec = new mxCodec(root.ownerDocument);
	console.log(dec);
    dec.decode(root, graph.getModel());
};


// Program starts here. Creates a sample graph in the
// DOM node with the specified ID. This function is invoked
// from the onLoad event handler of the document (see below).
// function main(container)
// {
//     // Checks if the browser is supported
//     if (!mxClient.isBrowserSupported())
//     {
//         // Displays an error message if the browser is not supported.
//         mxUtils.error('Browser is not supported!', 200, false);
//     }
//     else
//     {
//         // Sets the global shadow color
//         mxConstants.SHADOWCOLOR = '#C0C0C0';
//         mxConstants.SHADOW_OPACITY = 0.5;
//         mxConstants.SHADOW_OFFSET_X = 4;
//         mxConstants.SHADOW_OFFSET_Y = 4;
//         mxConstants.HANDLE_FILLCOLOR = '#99ccff';
//         mxConstants.HANDLE_STROKECOLOR = '#0088cf';
//         mxConstants.VERTEX_SELECTION_COLOR = '#00a8ff';
        
//         // Enables connections along the outline
//         mxConnectionHandler.prototype.outlineConnect = true;
//         mxEdgeHandler.prototype.manageLabelHandle = true;
//         mxEdgeHandler.prototype.outlineConnect = true;
//         mxCellHighlight.prototype.keepOnTop = true;
        
//         // Enable rotation handle
//         mxVertexHandler.prototype.rotationEnabled = true;
        
//         // Uses the shape for resize previews
//         mxVertexHandler.prototype.createSelectionShape = function(bounds)
//         {
//             var key = this.state.style[mxConstants.STYLE_SHAPE];
//             var stencil = mxStencilRegistry.getStencil(key);
//             var shape = null;
            
//             if (stencil != null)
//             {
//                 shape = new mxShape(stencil);
//                 shape.apply(this.state);
//             }
//             else
//             {
//                 shape = new this.state.shape.constructor();
//             }
            
//             shape.outline = true;
//             shape.bounds = bounds;
//             shape.stroke = mxConstants.HANDLE_STROKECOLOR;
//             shape.strokewidth = this.getSelectionStrokeWidth();
//             shape.isDashed = this.isSelectionDashed();
//             shape.isShadow = false;
            
//             return shape;
//         };
        
//         // Defines a custom stencil via the canvas API as defined here:
//         // http://jgraph.github.io/mxgraph/docs/js-api/files/util/mxXmlCanvas2D-js.html
//         function CustomShape()
//         {
//             mxShape.call(this);
//         };
//         mxUtils.extend(CustomShape, mxShape);
//         CustomShape.prototype.paintBackground = function(c, x, y, w, h)
//         {
//             c.translate(x, y);
    
//             // Head
//             c.ellipse(w / 4, 0, w / 2, h / 4);
//             c.fillAndStroke();
    
//             c.begin();
//             c.moveTo(w / 2, h / 4);
//             c.lineTo(w / 2, 2 * h / 3);
            
//             // Arms
//             c.moveTo(w / 2, h / 3);
//             c.lineTo(0, h / 3);
//             c.moveTo(w / 2, h / 3);
//             c.lineTo(w, h / 3);
            
//             // Legs
//             c.moveTo(w / 2, 2 * h / 3);
//             c.lineTo(0, h);
//             c.moveTo(w / 2, 2 * h / 3);
//             c.lineTo(w, h);
//             c.end();
            
//             c.stroke();
//         };

//         // Replaces existing actor shape
//         mxCellRenderer.prototype.defaultShapes['customShape'] = CustomShape;
        
//         // Loads the stencils into the registry
//         var req = mxUtils.load('static/mx/host/stencils.xml');
//         var root = req.getDocumentElement();
//         var shape = root.firstChild;
        
//         while (shape != null)
//         {
//             if (shape.nodeType == mxConstants.NODETYPE_ELEMENT)
//             {
//                 mxStencilRegistry.addStencil(shape.getAttribute('name'), new mxStencil(shape));
//             }
            
//             shape = shape.nextSibling;
//         }
        
//         mxEvent.disableContextMenu(container);
        
//         // Creates the graph inside the given container
//         var graph = new mxGraph(container);
//         graph.setConnectable(true);
//         graph.setTooltips(true);
//         graph.setPanning(true);
        
//         graph.getTooltipForCell = function(cell)
//         {
//             if (cell != null)
//             {
//                 return cell.style;
//             }
            
//             return null;
//         };
        
//         // Changes default styles
//         var style = graph.getStylesheet().getDefaultEdgeStyle();
//         style[mxConstants.STYLE_EDGE] = 'orthogonalEdgeStyle';
//         style = graph.getStylesheet().getDefaultVertexStyle();
//         style[mxConstants.STYLE_FILLCOLOR] = '#adc5ff';
//         style[mxConstants.STYLE_GRADIENTCOLOR] = '#7d85df';
//         style[mxConstants.STYLE_SHADOW] = '1';
        
//         // Enables rubberband selection
//         new mxRubberband(graph);
        
//         // Gets the default parent for inserting new cells. This
//         // is normally the first child of the root (ie. layer 0).
//         var parent = graph.getDefaultParent();
                        
//         // Adds cells to the model in a single step
//         graph.getModel().beginUpdate();
//         try
//         {
//             var v1 = graph.insertVertex(parent, null, 'A1', 20, 20, 40, 80, 'shape=and;,.11111111111');
//             var v2 = graph.insertVertex(parent, null, 'A2', 20, 220, 40, 80, 'shape=and');
//             var v3 = graph.insertVertex(parent, null, 'X1', 160, 110, 80, 80, 'shape=xor');
//             var e1 = graph.insertEdge(parent, null, '', v1, v3);
//             e1.geometry.points = [new mxPoint(90, 60), new mxPoint(90, 130)];
//             var e2 = graph.insertEdge(parent, null, '', v2, v3);
//             e2.geometry.points = [new mxPoint(90, 260), new mxPoint(90, 170)];
            
//             var v4 = graph.insertVertex(parent, null, 'A3', 520, 20, 40, 80, 'shape=customShape;flipH=1');
//             var v5 = graph.insertVertex(parent, null, 'A4', 520, 220, 40, 80, 'shape=and;flipH=1');
//             var v6 = graph.insertVertex(parent, null, 'X2', 340, 110, 80, 80, 'shape=xor;flipH=1');
//             var e3 = graph.insertEdge(parent, null, '', v4, v6);
//             e3.geometry.points = [new mxPoint(490, 60), new mxPoint(130, 130)];
//             var e4 = graph.insertEdge(parent, null, '', v5, v6);
//             e4.geometry.points = [new mxPoint(490, 260), new mxPoint(130, 170)];
            
//             var v7 = graph.insertVertex(parent, null, 'O1', 250, 260, 80, 60, 'shape=or;direction=south');
//             var e5 = graph.insertEdge(parent, null, '', v6, v7);
//             e5.geometry.points = [new mxPoint(310, 150)];
//             var e6 = graph.insertEdge(parent, null, '', v3, v7);
//             e6.geometry.points = [new mxPoint(270, 150)];
            
//             var e7 = graph.insertEdge(parent, null, '', v7, v5);
//             e7.geometry.points = [new mxPoint(290, 370)];
//         }
//         finally
//         {
//             // Updates the display
//             graph.getModel().endUpdate();
//         }
        
//         document.body.appendChild(mxUtils.button('FlipH', function()
//         {
//             graph.toggleCellStyles(mxConstants.STYLE_FLIPH);
//         }));
        
//         document.body.appendChild(mxUtils.button('FlipV', function()
//         {
//             graph.toggleCellStyles(mxConstants.STYLE_FLIPV);
//         }));

//         document.body.appendChild(document.createTextNode('\u00a0'));
//         document.body.appendChild(document.createTextNode('\u00a0'));
//         document.body.appendChild(document.createTextNode('\u00a0'));
//         document.body.appendChild(document.createTextNode('\u00a0'));

//         document.body.appendChild(mxUtils.button('Rotate', function()
//         {
//             var cell = graph.getSelectionCell();
            
//             if (cell != null)
//             {
//                 var geo = graph.getCellGeometry(cell);

//                 if (geo != null)
//                 {
//                     graph.getModel().beginUpdate();
//                     try
//                     {
//                         // Rotates the size and position in the geometry
//                         geo = geo.clone();
//                         geo.x += geo.width / 2 - geo.height / 2;
//                         geo.y += geo.height / 2 - geo.width / 2;
//                         var tmp = geo.width;
//                         geo.width = geo.height;
//                         geo.height = tmp;
//                         graph.getModel().setGeometry(cell, geo);
                        
//                         // Reads the current direction and advances by 90 degrees
//                         var state = graph.view.getState(cell);
                        
//                         if (state != null)
//                         {
//                             var dir = state.style[mxConstants.STYLE_DIRECTION] || 'east'/*default*/;
                            
//                             if (dir == 'east')
//                             {
//                                 dir = 'south';
//                             }
//                             else if (dir == 'south')
//                             {
//                                 dir = 'west';
//                             }
//                             else if (dir == 'west')
//                             {
//                                 dir = 'north';
//                             }
//                             else if (dir == 'north')
//                             {
//                                 dir = 'east';
//                             }
                            
//                             graph.setCellStyles(mxConstants.STYLE_DIRECTION, dir, [cell]);
//                         }
//                     }
//                     finally
//                     {
//                         graph.getModel().endUpdate();
//                     }
//                 }
//             }
//         }));

//         document.body.appendChild(document.createTextNode('\u00a0'));
//         document.body.appendChild(document.createTextNode('\u00a0'));
//         document.body.appendChild(document.createTextNode('\u00a0'));
//         document.body.appendChild(document.createTextNode('\u00a0'));
        
//         document.body.appendChild(mxUtils.button('And', function()
//         {
//             graph.setCellStyles(mxConstants.STYLE_SHAPE, 'and');
//         }));
//         document.body.appendChild(mxUtils.button('Or', function()
//         {
//             graph.setCellStyles(mxConstants.STYLE_SHAPE, 'or');
//         }));
//         document.body.appendChild(mxUtils.button('Xor', function()
//         {
//             graph.setCellStyles(mxConstants.STYLE_SHAPE, 'xor');
//         }));

//         document.body.appendChild(document.createTextNode('\u00a0'));
//         document.body.appendChild(document.createTextNode('\u00a0'));
//         document.body.appendChild(document.createTextNode('\u00a0'));
//         document.body.appendChild(document.createTextNode('\u00a0'));
        
//         document.body.appendChild(mxUtils.button('Style', function()
//         {
//             var cell = graph.getSelectionCell();
            
//             if (cell != null)
//             {
//                 var style = mxUtils.prompt('Style', graph.getModel().getStyle(cell));
                
//                 if (style != null)
//                 {
//                     graph.getModel().setStyle(cell, style);
//                 }
//             }
//         }));
        
//         document.body.appendChild(mxUtils.button('+', function()
//         {
//             graph.zoomIn();
//         }));
//         document.body.appendChild(mxUtils.button('-', function()
//         {
//             graph.zoomOut();
//         }));
//     }
// };
</script>
</body>
</html>