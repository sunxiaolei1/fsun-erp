<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/view/base_resource.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>采购计划</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />	
<link type="text/css" rel="stylesheet" media="all" href="<c:url value='/css/common.v4.1.0.css' />" />
<link type="text/css" rel="stylesheet" media="all" href="<c:url value='/css/order.1.2.css' />" />
<link type="text/css" rel="stylesheet" media="all" href="<c:url value='/css/message_box.css' />" />
<script type="text/javascript" src="<c:url value='/js/commons/MessageBox.js'/>"></script>
<script type="text/javascript"  src="<c:url value='/view/bus/purchase/operate/edit_product_common.js'/>"></script>
<script type="text/javascript">

$(function(){

	var $form = $("#orderfm");
    
	$.ajax({
       	url:'<c:url value="/bus/store/listEnabled"/>',	
       	dataType: "json",
       	async:false,
       	success:function(json){
        	if(json.length>0){
        		$('#storeId',$form).combobox({      			
        	        required: false,
        	   	 	valueField: 'id',
        	   	  	textField: 'name',
        	   	  	data: json,
        	   	    panelHeight: 200   	 																																																											
        	   	});
        	}
       	}
	});

	var currData = {
		id:'',
		setWay:"0",
		carriage:'',
		consignee:'',
		storeId:'',
		description:''
	};

	if('${orderId}'!=''){
		$.ajax({
	       	url:'<c:url value="/bus/purchase/load"/>',
	       	dataType: "json",
	       	data:{id:'${orderId}'},
	       	success:function(rowData){
	        	if(rowData.success){	
	        		currData = rowData.rows;       		
	    			$form.form('load',currData);    			     		
		        }
	       	}
	    });
	}else{
		$(".content h2").html("制定采购计划");
		$form.form('load',currData); 
	}
	
	$('#finishBtn').on('click',function(){       
	    MessageBox.loading();
	    $form.form('submit',{  
            url: '<c:url value="/bus/purchase/save"/>',  
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
	        		window.location.href = "<c:url value='/bus/purchase/manage-${orderId}-${pageNumber}-${pageSize}'/>";   	
	        	}else{
	        		MessageBox.error("保存失败!");                  	
	        	}           								
            }
        });
		
	});
  	
	 $('#cancelBtn').click(function(){
		 window.location.href = "<c:url value='/bus/purchase/manage-${orderId}-${pageNumber}-${pageSize}'/>";
	 });

	 
	 $('#resetBtn').click(function(){
		 $form.form("clear");
		 $form.form('load',currData);
	 });	 

	  
	
});

</script>
</head>
<body>
	<div class="content" style='font-family:"微软雅黑";height:92%' >
		<div class="float_tool_div">
			<a href='<c:url value="/bus/purchase/manage-${orderId}-${pageNumber}-${pageSize}"/>' >返回列表</a>
		</div>
		<h2 class="title" >编辑采购计划</h2>
		<div class="step-wrap" style="width:70%;padding-bottom:20px;">
			<div class="step-content display" id="reorderInfo" style="padding-bottom:30px;"> 				
				<form id="orderfm" name="orderfm" method="post" >	
				    <input name="id" style="display:none;"/>		
					<ul>	
						<li class="tr">结算方式：</li>
						<li class="tl">&nbsp; <input class="easyui-combobox" editable="false" type="text" id="setWay" name="setWay" data-options="data:setWay,valueField:'id',textField:'text',panelHeight:'auto'" /> 
						</li>
						
						<li class="tr">存放仓库：</li>
						<li class="tl">&nbsp; <input type="text" editable="false" class="easyui-combobox" id="storeId" name="storeId"  />
						</li>
						
						<li class="tr">需求日期：</li>
						<li class="tl">&nbsp; <input type="text" class="easyui-datebox" name="expire" id="expire"  /></li>						
						<li class="tr">收货人：</li>
						<li class="tl">&nbsp; <input type="text" name="consignee" id="consignee"  /></li>
		               
		                <li class="tr">运费：</li>
						<li class="tl3">&nbsp; <input type="text" name="carriage" id="carriage" class="easyui-numberbox" min="0" precision="1" />（元）</li>						
		               
						<li class="tr">采购说明：</li>
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
	
</body>
</html>