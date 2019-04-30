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


$.extend($.fn.validatebox.defaults.rules, { 
	
	maxLength : { // 判断最大长度
		validator : function(value, param) {
			return value.length <= param[0];
		},
		message : '最多只能输入 {0} 个字(包括空格、标点符号)。'
	},
	intOrFloat: {// 验证整数或小数
        validator: function (value) {
            return /^\d+(\.\d+)?$/i.test(value);
        },
        message: '请输入数字，并确保格式正确'
    },
    date: {// 验证姓名，可以是中文或英文
        validator: function (value) {
            //格式yyyy-MM-dd或yyyy-M-d
            return /^(?:(?!0000)[0-9]{4}([-]?)(?:(?:0?[1-9]|1[0-2])\1(?:0?[1-9]|1[0-9]|2[0-8])|(?:0?[13-9]|1[0-2])\1(?:29|30)|(?:0?[13578]|1[02])\1(?:31))|(?:[0-9]{2}(?:0[48]|[2468][048]|[13579][26])|(?:0[48]|[2468][048]|[13579][26])00)([-]?)0?2\2(?:29))$/i.test(value);
        },
        message: '清输入合适的日期格式'
    }               
});  	

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
	
	var deliveryInfo = window.parent.getCurrDeliveryInfo();

	var currData = {
		id:'',
		customerName:deliveryInfo.customerName,
		customerCode:deliveryInfo.customerCode,
		orderType:"新单",
		status:'已下单',
		setWay:"3",
		isGet:false,
		receiveTime:GetDateStr(1),
		express:'',
		contract:'',
		description:''
	};
	$form.form('load',currData); 
	
	$('#finishBtn').on('click',function(){       
	    MessageBox.loading();
	    
	    var isValid =  $form.form('validate');
		if (!isValid){
			MessageBox.closeLoading(); 
		}
	    
		var orderDto = serializeObject($form);    
		var date = orderDto.receiveTime+"";
		if(date.indexOf("00:00:00")<0){
			orderDto.receiveTime += " 00:00:00";
		} 
		
		saveProduct();
		for(var i=0;i<orderDetailDtos.length;i++){
			delete orderDetailDtos[i].isNewRecord;
		}
		var orderTackDto = {
			"orderDto":orderDto,
			"orderDetailDtos": orderDetailDtos
		}
		
		$.ajax({
	        type: "post",
	        dataType: "json",
	        contentType:"application/json;charset=utf-8",
	        async:false,
	        url: '<c:url value="/bus/order/tack"/>',
	        data: JSON.stringify(orderTackDto),
	        success: function(result) {
	        	MessageBox.closeLoading();     
	        	if(result.success){	        		
	        		var tackInfos = result.rows;
	        		$.each(tackInfos,function(){
						this.deliveryCode = "${deliveryCode}";
					});
	        		window.parent.addTackInfo(tackInfos);
	        		window.parent.closeDetailTackWin(); 	
	        	}else{
	        		MessageBox.error("保存失败!");                  	
	        	}    			                				                															                	
	        }
	    });  
		
	});
  	
	 $('#cancelBtn').click(function(){
		 window.parent.closeDetailTackWin();
	 });

});
   
</script>
</head>
<body>
	<div class="content" style='font-family:"微软雅黑";height:90%;' >
		<h2 class="title" style="margin: 10px 0 10px 0;">追加订单</h2>
		<div class="step-wrap" style="width:95%;padding-bottom:10px;">
			<div class="step-content display" id="reorderInfo" > 				
				<form id="orderfm" name="orderfm" method="post" >	
				    <input name="status" hidden =true />		
					<ul>	
						<li class="tr"><span class="red-font">*</span> 客户名称：</li>
						<li class="tl">&nbsp; <input name="customerName" id="customerName" /></li>										
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
					</ul>
				</form>							
				<div class="clear"></div>
				<%@include file="../../orderDetail/order-detail-tack.jsp" %>
			</div>
		</div>
		<div class="tc">
			<input type="button" class="blue-btn" id="finishBtn" value="保存" />
			<input id="cancelBtn" type="button" value="取消" class="corres-gray-btn"/>
		</div>
	</div>
	
</body>
</html>