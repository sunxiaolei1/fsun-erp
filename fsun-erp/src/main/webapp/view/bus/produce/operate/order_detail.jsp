<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/view/base_resource.jsp" %>
<link rel="stylesheet" href="<c:url value='/css/style.css'/>"  media="all" />
<link rel="stylesheet" href="<c:url value='/css/order.1.2.css'/>"  media="all" />
<script type="text/javascript"  src="<c:url value='/js/commons/LodopFuncs.js'/>"></script>
<script type="text/javascript" 
	src="<c:url value='/js/jquery-easyui/datagrid-detailview.js'/>"></script>
<style type="text/css">
.step-content ul li{ float:left;padding-bottom:0px;}
</style>	

<div class="step-content" style="padding:4px 0 0 0;"> 
	<div class="title1">
		<span class="right"><a class="edit-icon" id="order_edit_btn" href="javascript:void(orderEdit());"></a></span>
		<h2>基本信息</h2>
	</div>
	<div id="orderBaseInfo">
	    <ul>
			<li class="tr2">订单编号：</li>
			<li class="tl" id="code_show" >&nbsp;${orderDto.code}</li>								
			<li class="tr2">订单类型：</li>
			<li class="tl7" id="orderType_show" >&nbsp;${orderDto.orderType}</li>				
			<li class="tr2">制单人：</li>
			<li class="tl7" id="createManName_show" >&nbsp;${orderDto.createManName}</li>
			
			<li class="tr2">交货时间：</li>
			<li class="tl" id="receiveTime_show" >&nbsp;${orderDto.receiveTime}</li>					
			<li class="tr2">快件单号：</li>
			<li class="tl7" id="express_show" >&nbsp;${orderDto.express}</li>			
			<li class="tr2">合同号：</li>
			<li class="tl7" id="contract_show" >&nbsp;${orderDto.contract}</li>
			
			<li class="tr2">客户名称：</li>
			<li class="tl" id="customerName_show" >&nbsp;${orderDto.customerName}</li>					
			<li class="tr2">联系电话：</li>
			<li class="tl7" id="tel_show" >&nbsp;${orderDto.tel}</li>		
			<li class="tr2">联系人：</li>
			<li class="tl7" id="contacts_show" >&nbsp;${orderDto.contacts}</li>
			
			<li class="tr2">客户地址：</li>
			<li class="tl2" id="address_show" >&nbsp;${orderDto.address}</li>	
			<div class="clear"></div>
			<li class="tr2">备注：</li>
			<li class="tl2" id="description_show" >&nbsp;${orderDto.description}</li>
			<div class="clear"></div>
			<li style="height:29px;"></li>
        </ul>    
		<div class="clear"></div>
	</div>
	<div id="orderBaseInfo_edit" style="display:none;">
	    <input hidden="true" name="id" value="${orderDto.id}" />
		    <ul>
				<li class="tr2">订单编号：</li>
				<li class="tl">&nbsp;${orderDto.code}</li>								
				<li class="tr2">订单类型：</li>
				<li class="tl7">&nbsp;${orderDto.orderType}</li>				
				<li class="tr2">制单人：</li>
				<li class="tl7">&nbsp;${orderDto.createManName}</li>
				
				<li class="tr2">交货时间：</li>
				<li class="tl">&nbsp;${orderDto.receiveTime}</li>					
				<li class="tr2">快件单号：</li>
					
				<li class="tl7">&nbsp;<input name="express"  type="text" value="${orderDto.express }" style="width:140px;"/></li>		
				<li class="tr2">合同号：</li>
				<li class="tl7">&nbsp;${orderDto.contract}</li>
				<div class="clear"></div>
				<li class="tr2">客户名称：</li>
				<li class="tl">&nbsp;${orderDto.customerName}</li>					
				<li class="tr2">联系电话：</li>
				<li class="tl7">&nbsp;${orderDto.tel}</li>		
				<li class="tr2">联系人：</li>
				<li class="tl7">&nbsp;${orderDto.contacts}</li>
				
				<li class="tr2">客户地址：</li>
				<li class="tl2">&nbsp;${orderDto.address}</li>	
				<div class="clear"></div>
				<li class="tr2">备注：</li>
				<li class="tl2">&nbsp;${orderDto.description}</li>
				<div class="clear"></div>
				<li style="float:right;"><input id="submitBtn" type="button" value="保存" class="corres-blue-btn"/><input id="cancelBtn" type="button" value="取消" class="corres-gray-btn"/></li>
	        </ul>    
		<div class="clear"></div>
	</div>
	<div class="title1">
		<span class="right">
			<label style="font-size:13px;color:red" >工艺流程：</label>
      	 	<input id="process"  class="easyui-combobox" style="width:80px;" editable="false" />
      		<label style="font-size:13px;color:red" >外协方：</label>
      	 	<input id="outsourcier"  style="width:80px;" class="easyui-combobox" editable="false" /> 	      	 	
		    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-redo"  plain="true" onclick="outsourcing()">制作外协单</a>
		    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-print"  plain="true" onclick="definedMakeDeliver()">自定义送货单</a>
		</span>
		<h2>生产明细</h2>
	</div>
	
	<div style="width:100%;height:57.2%;">
		<table id="productDetailsList"  >
	       	
	   	</table>
	</div>
	
</div>	


<%@include file="outsourcing.jsp"%>

<script type="text/javascript">

	$(function(){

		$("#outsourcingToolbar").show();

		$('#process').combobox({							
			method:'get',
	        required: true,
		    url:'<c:url value="/sys/dictionary/getGroupList?key=PRODUCT_PROCESS"/>',
			valueField:'key',
			textField:'value',
			panelHeight:'auto',
			onLoadSuccess:function(result){		
				if(result.length>0){
					$(this).combobox("select",result[0].key);
			    }													 
			},
		    onSelect:function(value){	
		    	$('#outsourcier').combobox({							
					method:'get',
		            required: true,
		    	    url:'<c:url value="/bus/factoryInfo/getFactorylistByTechnology?technology="/>'+encodeURI(encodeURI(value.key)),
					valueField:'name',
					textField:'name',
					panelHeight:'auto',
					onLoadSuccess:function(result){		
	    				 if(result.length>0){
	    					 $(this).combobox("select",result[0].name);
	        		     }													 
					  }			   	 																																																											
		    	});			
		    }   			   	 																																																											
		});

		$('#productDetailsList').datagrid({
			pagination: false,
			fit: true,
			nowrap: false,
			rownumbers: true,
			fitColumns: false,
			singleSelect: false,
			ctrlSelect: false,
			pageSize: 20,
			method:'GET',
			loadMsg:'加载中，请稍等。。。',
        	url: '<c:url value="/bus/orderDetail/search?orderId=${orderId}"/>',
        	columns:[[	
       	          {field:'id',checkbox:true,width:"80"},					
       			  {field:'orderId',hidden:true},	
       		      {field:'productCode',title: '产品编号',hidden:true},				
       			  {field:'productName',title: '产品名称',width:"130",formatter:contentWrap},
       			  {field:'style',title: '款号',width:"90"},
   				  {field:'number',title: '数量',width:"70"},									
   				  {field:'realNumber',title: '实际数量',width:"70",editor:'numberbox'},
   				  {field:'unit',title: '单位',width:"30"},	
   				  {field:'papers',title: '大张数量',width:"70"},
   				  {field:'prints',title: '印次',width:"70"},											
   				  {field:'description',title: '备注',width:"235",formatter:contentWrap}
        	]],   
        	toolbar:"#outsourcingToolbar",   
        	view: detailview,
			detailFormatter:function(index,row){  
	            return '<div id="detailForm-'+index+'"></div>';  
	        },  
	        onExpandRow: function(index,row){  		
	            $('#detailForm-'+index).panel({  
	                doSize:true,  
	                border:false,  
	                cache:false,                
	               	href:'<c:url value="/bus/produce/product/view?rowIndex='+ index +'&productCode=' + row.productCode + '"/>',
	                onLoad:function(){
	                    $('#productDetailsList').datagrid('selectRow',index);
	                    $('#productDetailsList').datagrid('fixDetailRowHeight',index);
	                }  
	            });
	            $('#productDetailsList').datagrid('fixDetailRowHeight',index);
	        }
        });

        if('${isEdit}'=='true'){
        	$('#orderBaseInfo').hide();
        	$('#orderBaseInfo_edit').show();
        }

		$('#submitBtn','#orderBaseInfo_edit').on('click',submitFun);
		$('#cancelBtn','#orderBaseInfo_edit').on('click',cancelFun);
	});


function orderEdit(){
	if(!operatePower()){
		return;			
	}
	$('#orderBaseInfo').hide();
	$('#orderBaseInfo_edit').show();
}
	
function cancelFun(){
	$('#orderBaseInfo_edit').hide();
	$('#orderBaseInfo').show();
}

//判别有没操作权限
function operatePower(){
	var operatePower = false;
	$.ajax({
       type: "get",
       dataType: "json",
       async:false,
       url: '<c:url value="/bus/order/operatePower"/>',
       data: {"orderId":'${orderId}'},
       success: function(result) {
           	if(result.success){			    
           		operatePower = true;
            }else{
            	$.messager.alert('提示','此订单已结单,无法进行此操作!','info'); 
            }		                				                														                	
       }
    });	
	return operatePower;			
}

function submitFun(){
	var $_values = $('#orderBaseInfo_edit').find('input,select,textarea');
	var submitParams={};
	for(var i=0;i<$_values.length;i++){
		var $_value = $($_values[i]);
		submitParams[$_value.attr('name')]=$_value.val();
	}
	$.post('<c:url value="/bus/produce/order/update"/>', submitParams,
	   function(result){
			if(result.success){
				$.messager.alert('提示',"保存成功!",'info');
				var $_showValues = $_values.filter(':not(:hidden,:button)');
				for(var i=0;i<$_showValues.length;i++){
					var $_input = $($_showValues[i]);
					var showText = $_input.val()||''+'&nbsp;';
					var $_inputShow = $('#orderBaseInfo').find('#'+$_input.attr('name')+'_show');				
					$_inputShow.html(showText);
				}
				cancelFun();				
			}else{
				$.messager.alert('提示',"保存失败:"+result.message,'info');
			}
	}, "json");
	
}

	/**
    可以选择部分产品来制作送货单
**/
function definedMakeDeliver(){
	var products = $('#productDetailsList').datagrid('getChecked');	 
	var productIds = new Array();   
	if(products.length>0){		    	 
		for(var i=0;i<products.length;i++){
			var product = products[i];
			productIds.push(product.id);   				
		}  
	}
	window.parent.makeDeliver(productIds.length!=0?productIds.join(','):'');
}
</script>