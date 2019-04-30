<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/view/base_resource.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>添加返单</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />	
<link type="text/css" rel="stylesheet" media="all" href="<c:url value='/css/common.v4.1.0.css' />" />
<link type="text/css" rel="stylesheet" media="all" href="<c:url value='/css/order.1.2.css' />" />
<script type="text/javascript" src="<c:url value='/js/jquery-easyui/jquery.edatagrid.js'/>"></script>
<link type="text/css" rel="stylesheet" media="all" href="<c:url value='/css/message_box.css' />" />
<script type="text/javascript" src="<c:url value='/js/commons/MessageBox.js'/>"></script>
<script type="text/javascript"  src="<c:url value='/view/bus/madeOrder/operate/made-detail-create.js'/>"></script>
<script type="text/javascript"  src="<c:url value='/view/bus/order/operate/edit_product_common.js'/>"></script>
<script type="text/javascript">

//设置要显示的列名
var columns = 
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

/**
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
		onSelect:function(row){
			if(row.id=='定规'){
				$('#specSize', $form).removeAttr("readonly"); 
				$('#specSize', $form).css('background-color','#FFFFFF');
			}else{
				$('#specSize', $form).val('');
				$('#specSize', $form).attr({ readonly: 'true' });
				$('#specSize', $form).css('background-color','#DDDDDD');
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
		    panelHeight: 'auto'
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
		    panelHeight: 'auto'
		});
		
	});
}

$(function(){
    
	
	var $form = $("#processDetailfm");
	
	//初始化选择控件
	initComboBoxs($form);
	
	$.ajax({
       	url: '<c:url value="/bus/product/loadByCode"/>',
       	dataType: "json",
       	data:{productCode:'${productCode}'},
       	success:function(rowData){
        	if(rowData.success){
    			var productDto =  rowData.rows;
    			productDto.productCode = productDto.code;
    			productDto.papers="";
    			productDto.prints="";
    			productDto.expects="";
    			productDto.actuals="";
    			productDto.loss="";
    			productDto.style = productDto.name+"${detailName}" ;
    			productDto.madeCode="${madeCode}";
    			productDto.orderCode="${orderCode}";
    			productDto.processCode="${processCode}";
    			if(productDto.film){
    				productDto.process = "菲林";
    			}
    			
    			$form.form("load", productDto);
    			var spec = productDto.spec!=null?productDto.spec:'';
    			var index = spec.indexOf('-');
    			if(index!=-1){				
    				$("#specSize", $form).val(spec.substring(index+1));
    				$("#spec", $form).combobox('select',spec.substring(index,-(index))); 
    			}
    			
    			processFlowData =  productDto.afterProcess;
    			$.each(processFlowData,function(){
    				this.madeCode="${madeCode}";
        			this.orderCode="${orderCode}";
        			this.processCode="${processCode}";
        			this.number="";
        			delete this.productId;
        			delete this.isOutsourc;
        			delete this.description;
        			delete this.id;
    			});
    			
        		$('#processFlow').edatagrid({
        			loadMsg:'加载中，请稍等。。。',
        			columns:columns,
        			onBeforeEdit:function(rowIndex, rowData){
        				rowData.madeCode = "${madeCode}";
        				rowData.orderCode = "${orderCode}";
        				rowData.processCode = "${processCode}";
        				delete rowData.id;
        				delete rowData.isNewRecord;
        			}
        		}).datagrid("loadData",processFlowData); 
        		
        		
	        }
       	}
    });
	
	$('#finishBtn').on('click',function(){
		
		if(!gridIsValidate("processFlow")){
			return;
	    }       
	    var $form = $("#processDetailfm");
		$('#style', $form).attr("disabled",false);
		
	    var processDetail = serializeObject($form);
	    var specSize = $('#specSize', $form).val();
		if(specSize!=null && specSize!=''){
			processDetail.spec += ("-"+specSize); 
		}
	    
	    $('#processFlow').datagrid("acceptChanges");    
	    window.parent.addProcessDetails(processDetail,processFlowData);
	    window.parent.closeAddMadeDetailWin();
	   
	});
  	
	 $('#cancelBtn').click(function(){
		 window.parent.closeAddMadeDetailWin();
	 });

});

</script>
</head>
<body>
	<div class="content" style='font-family:"微软雅黑";height:92%'>
		<div class="left" style="margin-left:5px;">
			<input id="cancelBtn" type="button" value="取消" class="corres-gray-btn"/>
		</div>
		<div class="right" style="margin-right:10px;">
			<input type="button" class="blue-btn" id="finishBtn" value="提交" />
		</div>
		<h2 class="title"  style="margin-top:10px;margin-left:160px;" >添加工艺明细</h2>
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
							<li class="tl9">&nbsp; 
								<input type="text" name="spec" id="spec" style="width:60px" />
								<input type="text" id="specSize" style="width:70px;" />
							</li>		
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
					<table id="processFlow" toolbar="#processToolbar" fit="true" rownumbers="true" fitColumns="true" singleSelect="true" nowrap="false" >
					</table>
				</div>
				<div class="clear"></div>
			</div>
		</div>
		
	</div>
	
	
	<div id="processToolbar" style="display:none">
		<a href="javascript:void(0)" class="easyui-linkbutton"	iconCls="icon-add" plain="true"	onclick="processAdd()">添加</a> 
		<a href="javascript:void(0)" class="easyui-linkbutton"	iconCls="icon-add" plain="true"	onclick="delProcess()">删除</a>	
		<a href="javascript:void(0)" class="easyui-linkbutton"	iconCls="icon-undo" plain="true"  onclick="cancelProcessRow()">取消</a>	
		<a href="javascript:void(0)" class="easyui-linkbutton"	iconCls="icon-add" plain="true"	title="创建厂家" onclick="addFactory()">厂家</a>
	</div>
	
	<%@include file="./createFactory.jsp"%>
</body>
</html>