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
<script type="text/javascript"  src="<c:url value='/view/bus/order/operate/reorder.js'/>"></script>
<script type="text/javascript"  src="<c:url value='/view/bus/order/operate/edit_product_common.js'/>"></script>
<script type="text/javascript">

var attReorderManage = function(value,row,index){
	return '<sec:authorize  ifAllGranted="ORDER_PRODUCT_DELETE"><button type="button" onclick="delReorderProduct('+index+');">删除</button></sec:authorize>';				
}

$(function(){

	var $form = $("#reorderfm");
    
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

	$.ajax({
       	url:'<c:url value="/bus/order/getReorderInfo"/>',
       	dataType: "json",
       	data:{id:'${orderId}'},
       	success:function(rowData){
        	if(rowData.success){
    			var orderDto =  rowData.rows.orderDto; 
    			reorderDetailDtos =  rowData.rows.orderDetailDtos;   	    			
    			$('#customerName',$form).combobox("select",orderDto.customerCode);
    			$('#receiveTime',$form).datebox("setValue",GetDateStr(7));   
    			$('#setWay',$form).combobox("setValue",3);

        		$('#reorderTable').edatagrid({
        			loadMsg:'加载中，请稍等。。。',
        			onClickRow:function(rowIndex, rowData){
        			    var editIndex = $(this).edatagrid('options').editIndex;
        			    if(editIndex!=-1 && editIndex!=null){
        			    	setEditing($(this),editIndex,"onePrice","number","allPrice");
            			}	     			    
        			},
        			onDblClickRow:function(rowIndex, rowData){
        				var editIndex = $(this).edatagrid('options').editIndex;
        				if (editIndex!=-1 && editIndex!=null){				
        					setEditing($(this),editIndex,"onePrice","number","allPrice");      					
        				}
        			},  			
        			onBeforeEdit:function(rowIndex, rowData){
        				currProductName='';
	        		},onAfterEdit:function(rowIndex, rowData, changes){
	        			if(currProductName!=''){
	        				for(var i=0;i<reorderDetailDtos.length;i++){
			        			if(rowIndex==i){
			        				reorderDetailDtos[i].productName = currProductName;
			        			}
			                }
	        				$('#reorderTable').datagrid("loadData",reorderDetailDtos);
    	        		}
        				
	        		}
	        		   			
        		}).datagrid("loadData",reorderDetailDtos); 
	        }
       	}
    });
       	
	
	$('#finishBtn').on('click',function(){
		
		if(!gridIsValidate("reorderTable")){
			return;
	    }       
	    var $form = $("#reorderfm");
		$('#orderType', $form).attr("disabled",false);
	    var orderInfo = serializeObject($form);

	    $('#reorderTable').datagrid("acceptChanges");
	    MessageBox.loading();
		$.ajax({
	        type: "post",
	        dataType: "json",
	        async:false,
	        url: '<c:url value="/bus/order/reorder/save"/>',
	        data: {"reorderDetails":JSON.stringify(reorderDetailDtos),"orderInfo":JSON.stringify(orderInfo),"orderId":'${orderId}'},
	        success: function(result) {
	        	MessageBox.closeLoading();     
	        	if(result.success){
	        		window.location.href = "<c:url value='/bus/order/manage'/>";   	
	        	}else{
	        		MessageBox.error("保存失败!");                  	
	        	}    			                				                															                	
	        }
	    });  
		
	});
  	
	 $('#cancelBtn').click(function(){
		 window.location.href = "<c:url value='/bus/order/manage-${orderId}-${pageNumber}-${pageSize}'/>";
	 });

	
});

</script>
</head>
<body>
	<div class="content" style='font-family:"微软雅黑";height:92%'>
		<div class="float_tool_div">
			<a href='<c:url value="/bus/order/manage-${orderId}-${pageNumber}-${pageSize}"/>' >返回列表</a>
		</div>
		<h2 class="title" >编辑返单</h2>
		<div class="step-wrap" style="width:97%;">
			<div class="step-content display" id="reorderInfo"> 
				<div class="left" style="margin-top:-5px;width:29%;border-width:1px 1px 1px 0;">
					<form id="reorderfm" name="reorderfm" method="post" >				
						<ul>
						
						    <li class="tr1"><span class="red-font">*</span> 订单类型：</li>
							<li class="tl6">&nbsp; <input name="orderType" id="orderType" value="返单" disabled="true" /></li>
							
							<li class="tr1"><span class="red-font">*</span> 客户名称：</li>
							<li class="tl6">&nbsp; <input name="customerName" id="customerName" /></li>				
							
							<li class="tr1"><span class="red-font">*</span> 客户编号：</li>
							<li class="tl6">&nbsp; <input name="customerCode" id="customerCode" /></li>
							
							<li class="tr1"><span class="red-font">*</span> 交货时间：</li>
							<li class="tl6">&nbsp; <input class="easyui-datebox" editable="false" name="receiveTime" id="receiveTime"  validType="date" data-options="required:true"/></li>
							
							<li class="tr1">结算方式：</li>
							<li class="tl6">&nbsp; <input class="easyui-combobox" editable="false" type="text" name="setWay" id="setWay"  data-options="data:setWay,valueField:'id',textField:'text',panelHeight:'auto'" /> 
							</li>
							
							<li class="tr1">是否已付款：</li>
							<li class="tl6">&nbsp; <input type="text" editable="false" class="easyui-combobox" name="isGet" data-options="data:isGet,valueField:'id',textField:'text',panelHeight:'auto'" />
							</li>
							
							<li class="tr1">快件单号：</li>
							<li class="tl6">&nbsp; <input type="text" name="express" id="express"  /></li>
							
							<li class="tr1">合同号：</li>
							<li class="tl6">&nbsp; <input type="text" name="contract" id="contract"  /></li>
			               
							<li class="tr1">备注：</li>
							<li class="tl6">&nbsp; <textarea name="description" id="description" style="width: 152px;"></textarea>
							</li>
						</ul>
						<div class="clear"></div>
					</form>	
				</div>
				<div class="right" style="margin-top:-10px;width:70%;height:60%;border-width:1px 0px 1px 1px;border-style:solid;border-color:#ddd;">
					<table id="reorderTable"  toolbar="#reorderToolbar" pagination="false"  fit="true" nowrap="false" style="display:none;"
						fitColumns="true" data-options="rownumbers:true,singleSelect:true">
						<thead>
							<tr>						
								<th field="orderId" hidden="true"></th>
								<th field="productCode" width="70" sortable="true"
									editor="{type:'combobox',options:{required:true,url:'<c:url value="/bus/product/getEnableList"/>',valueField:'code',textField:'code',panelHeight:'auto'
																        ,onSelect : function (res) {  
															                //重点在此处   
															                //先获取到当前选中行  
															                //根据当前行获取，当前行的下标  
															                //在根据下标和要获取列的filed获取对应filed的Editor对象  
															                //然后在根据对应的Editor操作  
											                                var row = $('#reorderTable').edatagrid('getSelected');  
											                                var rindex = $('#reorderTable').edatagrid('getRowIndex', row);  
											 
											                                var ed = $('#reorderTable').edatagrid('getEditor', {  
											                                        index : rindex,  
											                                        field : 'productName'  
											                                    });  
											                                $(ed.target).combobox('setValue', res.code);										                                
																		    currProductName = $(ed.target).combobox('getText');
											                                	
											                                var ed1 = $('#reorderTable').edatagrid('getEditor', {  
											                                        index : rindex,  
											                                        field : 'style'  
											                                    });
											                                $(ed1.target).combobox('reload','<c:url value="/bus/product/getStylesByCode?code=' + res.code + '"/>');
											                            }  
																	 }
											}">产品编号</th>
								<th field="productName" width="100" sortable="true" formatter="contentWrap"
									editor="{type:'combobox',options:{required:true,url:'<c:url value="/bus/product/getEnableList"/>',valueField:'code',textField:'name',panelHeight:'auto'
																		 ,onSelect : function (res) { 
																		    currProductName = res.name; 													             
											                               
											                                var row = $('#reorderTable').edatagrid('getSelected');  
											                                var rindex = $('#reorderTable').edatagrid('getRowIndex', row);  
											                                var ed = $('#reorderTable').edatagrid('getEditor', {  
											                                        index : rindex,  
											                                        field : 'productCode'  
											                                    });  
											                                $(ed.target).combobox('setValue', res.code);  				                               
											                                
											                                var ed1 = $('#reorderTable').edatagrid('getEditor', {  
											                                        index : rindex,  
											                                        field : 'style'  
											                                    });
											                                $(ed1.target).combobox('reload','<c:url value="/bus/product/getStylesByCode?code=' + res.code + '"/>');
											                            }  
																	}
											}">产品名称</th>
								<th field="style" width="80"  editor="{type:'combobox',options:{editable:false,valueField:'name',textField:'name',panelHeight:'auto'}}">款号</th>
								<th field="number" width="50" editor="{type:'numberbox',options:{required:true}}">数量</th>				
								<th field="unit" width="40" editor="{type:'combobox',options:{editable:false,required:true,data:unitValue,valueField:'id',textField:'text',panelHeight:'auto'}}">单位</th>
								<th field="onePrice" width="50" editor="{type:'numberbox', options:{required:false,min:'0',max:5000,precision:'2'}}">单价(元)</th>
								<th field="allPrice" width="60" editor="{type:'numberbox', options:{required:false,min:'0',precision:'1'}}">金额(元)</th>
								<th field="papers" width="55" sortable="true" editor="{type:'numberbox',options:{required:false}}">大张数量</th>
								<th field="prints" width="55" sortable="true" editor="{type:'numberbox',options:{required:false}}">印次</th>
								<th field="description" width="90" formatter="contentWrap" editor="{type:'text'}">备注</th>							
							</tr>
						</thead>	
					</table>
				</div>
				<div class="clear"></div>
			</div>
		</div>
		<div class="tc">
			<input type="button" class="blue-btn" id="finishBtn" value="提交订单" />
			<input id="cancelBtn" type="button" value="取消" class="corres-gray-btn"/>
		</div>
	</div>
	
	
	<div id="reorderToolbar" style="display:none">
		<sec:authorize  ifAllGranted="ORDER_PRODUCT_ADD">
				 <a href="javascript:void(0)" class="easyui-linkbutton"	iconCls="icon-add" plain="true"	onclick="reorderProductAdd()">添加</a> 
		</sec:authorize>
		<sec:authorize  ifAllGranted="ORDER_PRODUCT_DELETE">
				 <a href="javascript:void(0)" class="easyui-linkbutton"	iconCls="icon-add" plain="true"	onclick="delReorderProduct()">删除</a> 
		</sec:authorize>
		<sec:authorize  ifAllGranted="ORDER_PRODUCT_CANCEL">
				 <a	href="javascript:void(0)" class="easyui-linkbutton"	iconCls="icon-undo" plain="true"  onclick="cancelReorderProductRow()">取消</a>
		</sec:authorize>
		
	</div>
	
</body>
</html>