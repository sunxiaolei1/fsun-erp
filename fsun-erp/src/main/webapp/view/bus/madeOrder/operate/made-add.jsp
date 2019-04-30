<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/view/base_resource.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />	
<link type="text/css" rel="stylesheet" media="all" href="<c:url value='/css/common.v4.1.0.css' />" />
<link type="text/css" rel="stylesheet" media="all" href="<c:url value='/css/order.1.2.css' />" />
<script type="text/javascript" src="<c:url value='/js/jquery-easyui/jquery.edatagrid.js'/>"></script>
<link type="text/css" rel="stylesheet" media="all" href="<c:url value='/css/message_box.css' />" />
<script type="text/javascript" src="<c:url value='/js/commons/MessageBox.js'/>"></script>
<script type="text/javascript"  src="<c:url value='/view/bus/madeOrder/operate/made-add.js'/>"></script>
<script type="text/javascript"  src="<c:url value='/view/bus/madeOrder/operate/made-detail-create.js'/>"></script>
<script type="text/javascript"  src="<c:url value='/view/bus/order/operate/edit_product_common.js'/>"></script>
<script type="text/javascript">

$(function(){

	var $form = $("#orderfm");
	
	$('#madeType', $form).combobox({
		method:'get',
	    required: true,
	 	valueField: 'id',
	  	textField: 'value',
	  	url: '<c:url value="/json/madeType.json"/>',
	    panelHeight: 100
	});
	
	$.ajax({
       	url:'<c:url value="/bus/orderDetail/getDetailsByIds-${orderDetailIds}" />',
       	dataType: "json",
       	success:function(rowData){
       		var orderCodes = new Array();
       		$.each(rowData,function(){
       			var row = this;
       			row.orderDetailId = row.id;
       			row.realNumber = 0;
       			row.expectNumber = row.number;
       			row.orderNumber = row.number;
       			row.madeCode = "${madeCode}";
       			delete row.allPrice;
       			delete row.endDate;
       			delete row.groupBy;	
       			delete row.onePrice;
       			delete row.order;
       			delete row.page;
       			delete row.pagination;
       			delete row.papers;
       			delete row.prints;
       			delete row.rows;
       			delete row.sort;
       			delete row.startDate;
       			delete row.spec;
       			delete row.number;
       			delete row.enabled;
       			//delete row.orderId;
       			delete row.id;
       			
       			addOrderCodes(orderCodes,row.orderCode);
       			madePackageDtos.push(row);
       		});
       		
       		var headerData = {
       			madeType: 1,
       			orderCode:orderCodes,
       			madeCode: '${madeCode}'
       		}
       		
       		$form.form("load", headerData);
       		$('#packageTable').edatagrid({
       			loadMsg:'加载中，请稍等。。。'	
       		}).datagrid("loadData",madePackageDtos);
       		
       		$('#madeDetailTable').edatagrid({
       			loadMsg:'加载中，请稍等。。。'	,
       			columns:packageColumns
       		}).datagrid("loadData",madeDetailDtos);
       	}
    });
       	
	
	$('#finishBtn').on('click',function(){
		
		if(!gridIsValidate("packageTable")){
			return;
	    }       
	    var $form = $("#orderfm");
	    
	    $('#madeCode', $form).attr("disabled",false);
	    $('#orderCode', $form).attr("disabled",false);
	    var madeHeaderDto = serializeObject($form);

	    $('#packageTable').datagrid("acceptChanges");
	    
	    var madeOrderDto = {
	   		"madeHeaderDto":madeHeaderDto,
	       	"madeDetailDtos":madeDetailDtos,
	       	"madeProcessDtos":madeProcessDtos,
	       	"madePackageDtos":madePackageDtos
	    };
	    
	    MessageBox.loading();
		$.ajax({
	        type: "post",
	        dataType: "json",
	        contentType:"application/json;charset=utf-8",
	        async:false,
	        url: '<c:url value="/bus/madeOrder/saveEntry"/>',
	        data: JSON.stringify(madeOrderDto),
	        success: function(result) {
	        	MessageBox.closeLoading();     
	        	if(result.success){
	        		window.parent.toAddMadeListPage('${madeCode}'); 	
	        	}else{
	        		MessageBox.error("保存失败!");                  	
	        	}    			                				                															                	
	        }
	    });  
		
	});
  	
	 $('#cancelBtn').click(function(){
		 window.parent.toAddMadeListPage('${madeCode}');
	 });

	 initWins();
	 
	 initProcessDetailInfo();
});

var makeProcess = function (value, row, index){
	return "background-color:#259ff2;color:black";
}

var printProcess = function (value, row, index){
	return "background-color:#FF6699;color:black";
}
	
//设置要显示的列名
var packageColumns = 
[[
	{field:"processCode",title:"后道工序编码",checkbox:true},
	{field:"madeCode",title:"生产单号",hidden:true},
	{field:"orderCode",title:"订单编号",hidden:true},
	{field:"style",title:"产品名称",width:70,align:"center"},
	{field:"productCode",title:"产品编号",width:45,align:"center"},
	{field:"material",title:"材质名称",width:70,align:"center", styler:makeProcess},
	{field:"spec",title:"规格",width:45,align:"center", styler:makeProcess},
	{field:"openNum",title:"开数",width:30,align:"center", styler:makeProcess},
	{field:"openSize",title:"开料尺寸",width:45,align:"center", styler:makeProcess},
	{field:"papers",title:"大张数量",width:45,align:"center", styler:makeProcess},
	{field:"prints",title:"印张总数",width:45,align:"center", styler:makeProcess},
	{field:"model",title:"生产机型",width:45,align:"center", styler:printProcess},
	{field:"process",title:"工序",width:30,align:"center", styler:printProcess},
	{field:"layout",title:"印刷方式",width:45,align:"center", styler:printProcess},
	{field:"colors",title:"色数",width:30,align:"center", styler:printProcess},
	{field:"impos",title:"拼数",width:30,align:"center", styler:printProcess},
	{field:"expects",title:"印刷数量",width:45,align:"center", styler:printProcess},
	{field:"actuals",title:"印张净数",width:45,align:"center", styler:printProcess},
	{field:"loss",title:"印损",width:45,align:"center", styler:printProcess},
	{field:"description",title:"备注",width:120,align:"center", styler:printProcess}
]];

//设置要显示的列名
var madeProcessColumns = 
[[
	{field:"processCode",title:"后道工序编码",hidden:true},
	{field:"madeCode",title:"生产单号",hidden:true},
	{field:"orderCode",title:"订单编号",hidden:true},
	{field:"name",title:"后道工序",width:40,align:"center",
		editor:{type:'combobox',options:{required:true,url:'<c:url value="/sys/dictionary/getGroupList?key=PRODUCT_PROCESS"/>',
			valueField:'key',textField:'value',panelHeight:'auto'}}},
	{field:"outsourcer",title:"外协方",width:40,align:"center",
		editor:{type:'combobox',options:{url:'<c:url value="/bus/factoryInfo/factory/list"/>',
			valueField:'name',textField:'name',panelHeight:'auto'}}},
	{field:"number",title:"数量",width:40,align:"center",editor:{type:'numberbox'}},
	{field:"demand",title:"工艺要求",width:90,align:"center",editor:'text'}
]];

//打开新增物料窗口
function openAddMadeDetail(grid){
	var rows = grid.datagrid('getSelections');
	var orderCodes = new Array();
	var detailName = getDetailName(rows,orderCodes);
	if(detailName!=null){
		if(detailHasExisted(rows[0].productCode,rows[0].productName, detailName)){
			$.messager.alert('提示',"该生产明细已存在!",'info');
			return;
		}
		var url ='<c:url value="/bus/madeOrder/madeDetail/create-"/>'
			+ rows[0].productCode+"?madeCode=${madeCode}&orderCode="+orderCodes.join(",")+"&detailName="+encodeURI(encodeURI(detailName));
		$("#openAddMadeDetailWin").find('iframe').attr('src',url);
		$("#openAddMadeDetailWin").window("open");
	}	
}

function openMadeDetails(grid){
	var rows = grid.datagrid('getSelections');
	if(rows!=null && rows.length==1){
		    var row = rows[0];
			$("#processDetailfm").form("load", row);
			processFlowData = getProcessDetail(row.processCode);
			console.log(processFlowData);
       		$('#processFlow').edatagrid({
       			loadMsg:'加载中，请稍等。。。'	,
       			columns:madeProcessColumns,
    			onBeforeEdit:function(rowIndex, rowData){
    				rowData.madeCode = row.madeCode;
    				rowData.orderCode = row.orderCode;
    				rowData.processCode = row.processCode;
    				delete rowData.id;
    				delete rowData.isNewRecord;
    			}
       		}).datagrid("loadData",processFlowData);
       		$("#openMadeDetailsWin").window("open");
       		
       		$('#processToolbar').show();
	}else{
		$.messager.alert('提示',"请选择一项查看!",'info');
	}
}

function closeAddMadeDetailWin(){
	$("#openAddMadeDetailWin").window("close");	
}


/**
 * 初始化工艺明细表单
 */
function initProcessDetailInfo(){
	//初始化选择控件
	var $form = $("#processDetailfm");
	
	initComboBoxs($form);
	
	$('#processDetailFinishBtn').on('click',function(){
	
		if(!gridIsValidate("processFlow")){
			return;
	    }       
		$('#style', $form).attr("disabled",false);
		
	    var processDetail = serializeObject($form);
	    $('#processFlow').datagrid("acceptChanges");
	    delProcessDetails(processDetail.processCode);
	    addProcessDetails(processDetail,processFlowData);
	    $("#openMadeDetailsWin").window("close");	
	});
  	
	 $('#processDetailCancelBtn').click(function(){
		 $("#openMadeDetailsWin").window("close");	
	 });
}

/*
* 初始化选择控件
*/
function initComboBoxs($form){
 	$('#spec', $form).combobox({
  		required: false,
  		editable:false,
	 	valueField: 'id',
	  	textField: 'text',
	  	data:productSpec,
	  	width: 'auto',
	    panelHeight: 'auto',
	    onLoadSuccess:function(rows){
			if(rows&&rows.length>0){
				$(this).combobox('select',rows[0].id);
			}
		}
	});

  	$.getJSON('<c:url value="/sys/dictionary/getGroupList?key=PRODUCT_MODEL"/>', function(json){
	  	$('#model', $form).combobox({
	   		required: false,
	   		editable:false,
		 	valueField: 'key',
		  	textField: 'value',
		  	data:json,
		  	width: 'auto',
		    panelHeight: 'auto',
		    onLoadSuccess:function(rows){
				if(rows&&rows.length>0){
					$(this).combobox('select',rows[0].key);
				}
			}
		});
		
	});	 
	
	$.getJSON('<c:url value="/sys/dictionary/getGroupList?key=PRODUCT_LAYOUT"/>', function(json){
	  	$('#layout', $form).combobox({
	   		required: false,
	   		editable:false,
		 	valueField: 'key',
		  	textField: 'value',
		  	data:json,
		  	width: 'auto',
		    panelHeight: 'auto',
		    onLoadSuccess:function(rows){
				if(rows&&rows.length>0){
					$(this).combobox('select',rows[0].key);
				}
			}
		});
		
	});

}


</script>
</head>
<body>
	<div class="content" style='font-family:"微软雅黑";height:92%'>
		<div class="left" style="margin-left:5px;">
			<input id="cancelBtn" type="button" value="取消" class="corres-gray-btn"/>
		</div>
		<div class="right" style="margin-right:10px;">
			<input type="button" class="blue-btn" id="finishBtn" value="生成生产单" />
		</div>
		<h3 class="title" style="margin-top:4px;">新增生产明细</h3>
		<div class="step-wrap" style="width:99%;">
			<div class="step-content display" style="padding: 15px 0 0 0;"> 
				<form id="orderfm" name="orderfm" method="post" >		
					<ul>	
						<li class="tr2"><span class="red-font">*</span> 生产单号：</li>
						<li class="tl7">&nbsp; <input name="madeCode" id="madeCode" value="${madeOrder}" disabled="true" style="width:180px;"/></li>									
						<li class="tr2"><span class="red-font">*</span> 单据类型：</li>
						<li class="tl7">&nbsp; <input type="text" editable="false" class="easyui-combobox" name="madeType" id="madeType" 
							data-options="required:true,data:madeType,valueField:'id',textField:'text',panelHeight:'auto'" />
						</li>						              
						<li class="tr2">订单编号：</li>
						<li class="tl9" >&nbsp; <input name="orderCode" id="orderCode" disabled="true" style="width:336px;" ></input></li>
					</ul>
				</form>		
				<div class="clear"></div>
				<div style="width:98%;height:50%;margin-left:10px;margin-right:10px;">
					<table id="packageTable"  toolbar="#packageToolbar" pagination="false"  fit="true" nowrap="false" 
						style="display:none;" fitColumns="true" data-options="rownumbers:true,singleSelect:false">
						<thead>
							<tr>						
								<th field="orderDetailId" checkbox=true ></th>
								<th field="madeCode" hidden="true" >生产单号</th>
								<th field="orderId" hidden="true" >订单编号</th>
								<th field="orderCode" width="70" >订单号</th>					
								<th field="productCode" width="40" >产品编号</th>
								<th field="productName" width="100" formatter="contentWrap" >产品名称</th>
								<th field="style" width="80" >款号</th>
								<th field="orderNumber" width="50" >订单数量</th>	
								<th field="expectNumber" width="50" editor="{type:'numberbox',options:{required:true}}">预计数量</th>	
								<th field="realNumber" hidden="true" >数量</th>				
								<th field="unit" width="30" >单位</th>
								<th field="description" width="140" formatter="contentWrap" editor="{type:'text'}">备注</th>							
							</tr>
						</thead>	
					</table>
				 </div>
				 <div class="clear"></div>
				 <div style="width:98%;height:50%;margin:10px;">
					<table id="madeDetailTable"  toolbar="#detailToolbar" pagination="false"  fit="true" nowrap="false" 
						 fitColumns="true" data-options="rownumbers:true,singleSelect:true">
						 
					</table>
				</div>
				<div class="clear"></div>
			</div>
		</div>
		<!-- 
		<div class="tc">
			<input type="button" class="blue-btn" id="finishBtn" value="生成生产单" />
			<input id="cancelBtn" type="button" value="取消" class="corres-gray-btn"/>
		</div>
		 -->
	</div>
	
	
	<div id="packageToolbar" style="display:none">	
		 <a href="javascript:void(0)" class="easyui-linkbutton"	iconCls="icon-add" plain="true"	onclick="openAddMadeDetail($('#packageTable'))">添加生产明细</a> 
		 <a	href="javascript:void(0)" class="easyui-linkbutton"	iconCls="icon-save" plain="true"  onclick="saveEdits($('#packageTable'))">保存</a>
		 <a	href="javascript:void(0)" class="easyui-linkbutton"	iconCls="icon-undo" plain="true"  onclick="cancelEdits($('#packageTable'))">取消</a>		
		 <a	href="javascript:void(0)" class="easyui-linkbutton"	iconCls="icon-delete" plain="true"  onclick="delEdits($('#packageTable'))">删除</a>	
		 <a	href="javascript:void(0)" class="easyui-linkbutton"	iconCls="icon-add" plain="true"  onclick="openOrderWin()">新增</a>					
	</div>
	
	<div id="processToolbar" style="display:none">
		<a href="javascript:void(0)" class="easyui-linkbutton"	iconCls="icon-add" plain="true"	onclick="processAdd()">添加</a> 
		<a href="javascript:void(0)" class="easyui-linkbutton"	iconCls="icon-add" plain="true"	onclick="delProcess()">删除</a>	
		<a href="javascript:void(0)" class="easyui-linkbutton"	iconCls="icon-undo" plain="true" onclick="cancelProcessRow()">取消</a>
		<a href="javascript:void(0)" class="easyui-linkbutton"	iconCls="icon-add" plain="true"	title="创建厂家" onclick="addFactory()">厂家</a>		
	</div>
	
	<div id="detailToolbar" style="display:none">	
		 <a	href="javascript:void(0)" class="easyui-linkbutton"	iconCls="icon-edit" plain="true"  onclick="openMadeDetails($('#madeDetailTable'))">编辑</a>
		 <a	href="javascript:void(0)" class="easyui-linkbutton"	iconCls="icon-delete" plain="true"  onclick="delMadeDetail($('#madeDetailTable'))">删除</a>		
	</div>
	
	<div id="openAddMadeDetailWin" class="easyui-window" shadow= "false" title="生产工序明细" closed="true" 
		align="center" style="display:none;width:1000px;height:450px;top:24px;" modal="true">
		<iframe frameborder="0" width="100%" height="100%"></iframe>
	</div>
	
	<div id="openMadeDetailsWin" class="easyui-window" shadow= "false" title="工序明细详情" closed="true" 
		align="center" style="display:none;width:1000px;height:450px;top:24px;" modal="true">
			
		<div class="content" style='font-family:"微软雅黑";height:93%'>
			<div class="left" style="margin-left:5px;">
				<input id="processDetailCancelBtn" type="button" value="取消" class="corres-gray-btn"/>
			</div>
			<div class="right" style="margin-right:10px;">
				<input type="button" class="blue-btn" id="processDetailFinishBtn" value="提交" />
			</div>
			<h2 class="title"  style="margin-top:10px;margin-left:160px;" >编辑工艺明细</h2>
			<div class="step-wrap" style="width:99%;">
				<div class="step-content display" id="reorderInfo"> 
					<div class="left" style="margin-top:-5px;width:45%;border-width:1px 1px 1px 0;">
						<form id="processDetailfm" name="processDetailfm" method="post" >
							<input name="madeCode"  style="display:none"   />	
							<input name="orderCode"   style="display:none" />
							<input name="productCode"  style="display:none" />
							<input name="processCode"  style="display:none" />		
							<ul>
								<li class="tr6"> 产品名称:</li>
								<li class="tl10">&nbsp; <input name="style" id="style" disabled=true style="width:350px"/></li>				
								
								<li class="tr4"> 材质名称:</li>
								<li class="tl9">&nbsp; <input  type="text" name="material" id="material" style="width:136px" /></li>	
								<li class="tr4"> 开料尺寸:</li>
								<li class="tl9">&nbsp; <input type="text" name="openSize" id="openSize" style="width:136px" /></li>		
								
								
								<li class="tr4"> 规&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;格:</li>
								<li class="tl9">&nbsp; <input type="text" name="spec" id="spec" style="width:136px" /></li>		
								<li class="tr4"> 大张数量:</li>
								<li class="tl9">&nbsp; <input class="easyui-numberbox"  type="text"  name="papers" id="papers" style="width:136px" /></li>	
								
								
								<li class="tr4"> 开&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;数:</li>
								<li class="tl9">&nbsp; <input class="easyui-numberbox" type="text"  name="openNum" id="openNum" style="width:136px" /></li>		
								<li class="tr4"> 印张总数:</li>
								<li class="tl9">&nbsp; <input class="easyui-numberbox"  type="text" name="prints" id="prints" style="width:136px" /></li>	
								
								<li class="tr5"> 生产机型:</li>
								<li class="tl9">&nbsp; <input type="text" name="model" id="model" style="width:136px" /></li>
								<li class="tr5"> 色&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;数:</li>
								<li class="tl9">&nbsp; <input class="easyui-numberbox" type="text" name="colors" id="colors" style="width:136px" /></li>
								
								<li class="tr5"> 工&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;序:</li>
								<li class="tl9">&nbsp; <input type="text" name="process" id="process" style="width:136px" /></li>
								<li class="tr5"> 拼&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;数:</li>
								<li class="tl9">&nbsp; <input class="easyui-numberbox"  type="text" name="impos" id="impos" style="width:136px" /></li>
								
								<li class="tr5"> 印刷方式:</li>
								<li class="tl9">&nbsp; <input type="text" name="layout" id="layout" style="width:136px" /></li>						
								<li class="tr5"> 印刷数量:</li>
								<li class="tl9">&nbsp; <input class="easyui-numberbox"  type="text"  name="expects" id="expects" style="width:136px" /></li>	
								
								<li class="tr5"> 印张净数:</li>
								<li class="tl9">&nbsp; <input class="easyui-numberbox"  type="text" name="actuals" id="actuals" style="width:136px" /></li>		
								<li class="tr5"> 印&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;损:</li>
								<li class="tl9">&nbsp; <input class="easyui-numberbox"  type="text" name="loss" id="loss" style="width:136px" /></li>
								
								<li class="tr5">备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注:</li>
								<li class="tl10">&nbsp; <textarea name="description" id="description" style="width: 350px;"></textarea>
								</li>
							</ul>
							<div class="clear"></div>
						</form>			
					</div>
					<div class="right" style="margin-top:-10px;width:54%;height:88%;border-width:1px 0px 1px 1px;border-style:solid;border-color:#ddd;">
						<table id="processFlow" toolbar="#processToolbar" pagination="false"  fit="true" nowrap="false" fitColumns="true" data-options="rownumbers:true,singleSelect:true">
						</table>
					</div>
					<div class="clear"></div>
				</div>
			</div>	
		</div>
		
	</div>  
	
	<%@include file="./order-reSelect.jsp" %>
	
	<%@include file="./createFactory.jsp"%>  
	
</body>
</html>