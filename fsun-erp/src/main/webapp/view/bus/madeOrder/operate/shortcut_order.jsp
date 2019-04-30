<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/view/base_resource.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>操作订单</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />	
<link type="text/css" rel="stylesheet" media="all" href="<c:url value='/css/common.v4.1.0.css' />" />
<link type="text/css" rel="stylesheet" media="all" href="<c:url value='/css/order.1.2.css' />" />
<link type="text/css" rel="stylesheet" media="all" href="<c:url value='/css/message_box.css' />" />
<script type="text/javascript" src="<c:url value='/js/jquery-easyui/jquery.edatagrid.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/commons/MessageBox.js'/>"></script>
<script type="text/javascript"  src="<c:url value='/view/bus/order/operate/edit_product_common.js'/>"></script>
<script type="text/javascript"  src="<c:url value='/js/commons/LodopFuncs.js'/>"></script>
<style type="text/css">
.table-new{font-size:12px;}
.table-new td { height:36px; width:175px;}
.table-new td.textfield {text-align:right;width:76px;}
</style>

<script type="text/javascript"> 	

$(function(){

	var $form = $("#orderfm");
    
	$.ajax({
       	url:'<c:url value="/bus/customer/getEnableList"/>',	
       	dataType: "json",
       	async:false,
       	success:function(json){
        	if(json.length>0){
        		$('#customerName',$form).combobox({      			
        	        required: true,
        	   	 	valueField: 'code',
        	   	  	textField: 'name',
        	   	  	data: json,
        	   	    panelHeight: 200,
        	   	    onSelect:function(value){				
        				$('#customerCode',$form).combobox("setValue",value.code);	 
        		    }   			   	 																																																											
        	   	});
        		$('#customerCode', $form).combobox({    			
        	        required: true,
        	   	 	valueField: 'code',
        	   	  	textField: 'code',
        	   	  	data: json,
        	   	    panelHeight: 200,
        	   	    onSelect:function(value){	            	    			
        				$('#customerName', $form).combobox("setValue",value.code);	 
        		    }   			   	 																																																											
        	   	});
        	}
       	}
	});	

	var currData = {
		id:'',
		customerName:'',
		customerCode:'',
		orderType:"新单",
		status:'已下单',
		setWay:"3",
		isGet:false,
		receiveTime:GetDateStr(0),
		express:'',
		contract:'',
		description:''
	};
	$form.form('load',currData); 
	
	$('#finishBtn').on('click',function(){       
		saveOrders(false,"<c:url value='/bus/madeOrder/manage'/>");	
	});
	
	$('#finishAndPrintBtn').on('click',function(){       
		saveOrders(true,"<c:url value='/bus/madeOrder/manage'/>");
	})
  	
	$('#cancelBtn').click(function(){
		 window.location.href = "<c:url value='/bus/madeOrder/manage'/>";
	});

});
   
/**
 * 重新初始化客户选择框
 */
function initCustomerCombo(customerCode){
	
	var $form = $("#orderfm");
	$.ajax({
       	url:'<c:url value="/bus/customer/getEnableList"/>',	
       	dataType: "json",
       	async:false,
       	success:function(json){
        	if(json.length>0){
        		$('#customerName',$form).combobox("loadData",json);
        		$('#customerCode', $form).combobox("loadData",json).combobox("select", customerCode);
        	}
       	}
	});	
}
   
   
</script>
</head>
<body>
	<div class="content" style='font-family:"微软雅黑";height:90%;' >
		<div class="left" style="margin-left:5px;">
			<input id="cancelBtn" type="button" value="取消" class="corres-gray-btn"/>
		</div>
		<div class="right" style="margin-right:10px;">
			<input type="button" class="blue-btn" id="finishBtn" value="保存" />
		</div>
		<div class="right" style="margin-right:10px;">
			<input type="button" class="blue-btn" id="finishAndPrintBtn" value="保存并打印" />
		</div>
		<h3 class="title" style="margin: 10px 0 10px 0;">快捷下单</h3>
		<div class="step-wrap" style="width:99%;padding-bottom:2px;margin-top:-5px;">
		    <div class="step-content display" id="reorderInfo"> 
				    <div class="left" style="margin-top:-15px;width:25%;border-width:1px 1px 1px 0;">
						<form id="orderfm" name="orderfm" method="post" >	
						    <input name="status" hidden =true />		
							<ul>	
								<li class="tr1"><span class="red-font">*</span> 客户名称：</li>
								<li class="tl6">
									&nbsp; <input name="customerName" id="customerName" style="width: 140px;" />
									<sec:authorize  ifAllGranted="CUSTOMER_ADD">
										<a href="#" class="icon-add" style="text-decoration:none;" title="创建客户" onclick="javascript:addCustomer()" >
								             &nbsp;&nbsp;&nbsp;&nbsp;
										</a>
									</sec:authorize>
								</li>										
								<li class="tr1"><span class="red-font">*</span> 客户编号：</li>
								<li class="tl6">&nbsp; <input name="customerCode" id="customerCode" style="width: 160px;" /></li>
								<li class="tr1"><span class="red-font">*</span> 订单类型：</li>
								<li class="tl6">&nbsp; <input type="text" editable="false" class="easyui-combobox" name="orderType" id="orderType" 
									style="width: 160px;" data-options="required:true,data:orderType,valueField:'id',textField:'text',panelHeight:'auto'" /></li>						
								<li class="tr1"><span class="red-font">*</span> 交货时间：</li>
								<li class="tl6">&nbsp; <input class="easyui-datebox" editable="false" name="receiveTime" id="receiveTime"  
									style="width: 160px;" validType="date" data-options="required:true"/></li>
								<li class="tr1">结算方式：</li>
								<li class="tl6">&nbsp; <input class="easyui-combobox" editable="false" type="text" id="setWay" name="setWay" 
									style="width: 160px;" data-options="data:setWay,valueField:'id',textField:'text',panelHeight:'auto'" /> 
								</li>
								<li class="tr1">是否付款：</li>
								<li class="tl6">&nbsp; <input type="text" editable="false" class="easyui-combobox" name="isGet" 
									style="width: 160px;" data-options="data:isGet,valueField:'id',textField:'text',panelHeight:'auto'" />
								</li>
								<li class="tr1">备注：</li>
								<li class="tl6">&nbsp; <textarea name="description" id="description" rows="2" style="width: 160px;"></textarea>
								</li>						
							</ul>
						</form>					
					</div>
					
					<div class="right" style="margin-top:-22px;width:74%;height:50%;border-width:1px 0px 1px 1px;border-style:solid;border-color:#ddd;">
						<table id="packageTable"  toolbar="#packageToolbar" pagination="false"  fit="true" nowrap="false" 
							style="display:none;" fitColumns="true" data-options="rownumbers:true,singleSelect:false">
							<thead>
								<tr>						
									<th field="lineNo" checkbox=true ></th>																						
									<th field="productCode" width="40" >产品编号</th>
									<th field="productName" width="180" formatter="contentWrap" >产品名称</th>
									<th field="style" width="80" editor="{type:'text'}" >款号</th>
									<th field="orderNumber" width="50" editor="{type:'numberbox',options:{required:true}}" >订单数量</th>	
									<th field="expectNumber" width="50" editor="{type:'numberbox',options:{required:true}}">预计数量</th>	
									<th field="realNumber" hidden="true" >数量</th>				
									<th field="unit" width="30" >单位</th>
									<th field="description" width="140" formatter="contentWrap" editor="{type:'text'}">备注</th>							
								</tr>
							</thead>	
						</table>
					</div>	
					<div class="clear"></div>
			</div>
		
			<%@include file="../../orderDetail/order-detail-shortcut.jsp" %>		
		</div>
		
	</div>
	
	<%@include file="../../madeOrder/operate/printMades.jsp"%>
	
	<%@include file="../../customer/operate/createCustomer.jsp" %>
</body>
</html>