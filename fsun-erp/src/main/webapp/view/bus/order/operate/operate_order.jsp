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
<script type="text/javascript" src="<c:url value='/js/commons/MessageBox.js'/>"></script>
<script type="text/javascript"  src="<c:url value='/view/bus/order/operate/edit_product_common.js'/>"></script>
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
		setWay:"3",
		isGet:false,
		receiveTime:GetDateStr(7),
		express:'',
		contract:'',
		description:''
	};

	if('${orderId}'!=''){
		$.ajax({
	       	url:'<c:url value="/bus/order/load"/>',
	       	dataType: "json",
	       	data:{id:'${orderId}'},
	       	success:function(rowData){
	        	if(rowData.success){	
	        		currData = rowData.rows;       		
	    			$form.form('load',currData);
	        		$('#customerName',$form).combobox("select",currData.customerCode);    			     		
		        }
	       	}
	    });
	}else{
		$(".content h2").html("新增订单");
		$form.form('load',currData); 
	}
	
	$('#finishBtn').on('click',function(){       
	    MessageBox.loading();
	    $form.form('submit',{  
            url: '<c:url value="/bus/order/save"/>',  
            dataType: "json",
            async:false, 
            onSubmit: function(){
        		var isValid = $(this).form('validate');
        		if (!isValid){
        			MessageBox.closeLoading(); 
        		}
        		return isValid;
        	},            
            success: function(result){
        		MessageBox.closeLoading();
            	var result = eval('(' + result + ')');  // change the JSON string to javascript object   
	        	if(result.success){
	        		window.location.href = "<c:url value='/bus/order/manage-${orderId}-${pageNumber}-${pageSize}'/>";   	
	        	}else{
	        		MessageBox.error("保存失败!");                  	
	        	}           								
            }
        });
		
	});
  	
	 $('#cancelBtn').click(function(){
		 window.location.href = "<c:url value='/bus/order/manage-${orderId}-${pageNumber}-${pageSize}'/>";
	 });

	 
	 $('#resetBtn').click(function(){
		 $form.form("clear");
		 $form.form('load',currData);
		 if('${orderId}'!=''){			 	        			
       		$('#customerName',$form).combobox("select",currData.customerCode);    			     					     		   
		 }
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
	<div class="content" style='font-family:"微软雅黑";height:72%' >
		<div class="float_tool_div">
			<a href='<c:url value="/bus/order/manage-${orderId}-${pageNumber}-${pageSize}"/>' >返回列表</a>
		</div>
		<h2 class="title" >编辑订单</h2>
		<div class="step-wrap" style="width:70%;padding-bottom:20px;">
			<div class="step-content display" id="reorderInfo" style="padding-bottom:30px;"> 				
				<form id="orderfm" name="orderfm" method="post" >	
				    <input name="id" style="display:none;"/>		
					<ul>	
						<li class="tr"><span class="red-font">*</span> 客户名称：</li>
						<li class="tl">
							&nbsp; <input name="customerName" id="customerName" style="width:150px;"/>
							<sec:authorize  ifAllGranted="CUSTOMER_ADD">
								<a href="#" class="icon-add" style="text-decoration:none;" title="创建客户" onclick="javascript:addCustomer()" >
						             &nbsp;&nbsp;&nbsp;&nbsp;
								</a>
							</sec:authorize>
						</li>										
						<li class="tr"><span class="red-font">*</span> 客户编号：</li>
						<li class="tl">&nbsp; <input name="customerCode" id="customerCode" /></li>
						
						<li class="tr"><span class="red-font">*</span> 订单类型：</li>
						<li class="tl">&nbsp; <input type="text" editable="false" class="easyui-combobox" name="orderType" id="orderType" data-options="required:true,data:orderType,valueField:'id',textField:'text',panelHeight:'auto'" /></li>						
						<li class="tr"><span class="red-font">*</span> 交货时间：</li>
						<li class="tl">&nbsp; <input class="easyui-datebox" editable="false" name="receiveTime" id="receiveTime"  validType="date" data-options="required:true"/></li>
						
						<li class="tr">结算方式：</li>
						<li class="tl">&nbsp; <input class="easyui-combobox" editable="false" type="text" id="setWay" name="setWay" data-options="data:setWay,valueField:'id',textField:'text',panelHeight:'auto'" /> 
						</li>
						
						<li class="tr">是否已付款：</li>
						<li class="tl">&nbsp; <input type="text" editable="false" class="easyui-combobox" id="isGet" name="isGet" data-options="data:isGet,valueField:'id',textField:'text',panelHeight:'auto'" />
						</li>
						
						<li class="tr">快件单号：</li>
						<li class="tl">&nbsp; <input type="text" name="express" id="express"  /></li>						
						<li class="tr">合同号：</li>
						<li class="tl">&nbsp; <input type="text" name="contract" id="contract"  /></li>
		               
						<li class="tr">备注：</li>
						<li class="tl3" >&nbsp; <textarea name="description" id="description" ></textarea>
						</li>
					</ul>
				</form>							
				<div class="clear"></div>
			</div>
		</div>
		<div class="tc">
			<input type="button" class="blue-btn" id="finishBtn" value="保存" />
			<input type="button" class="white-btn" id="resetBtn" value="重置" />
			<input id="cancelBtn" type="button" value="取消" class="corres-gray-btn"/>
		</div>
	</div>
	
	<%@include file="../../customer/operate/createCustomer.jsp" %>
	
</body>
</html>