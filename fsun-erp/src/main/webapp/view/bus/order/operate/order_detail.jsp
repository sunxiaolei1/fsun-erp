<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/view/base_resource.jsp" %>
<link rel="stylesheet" href="<c:url value='/css/style.css'/>"  media="all" />
<script type="text/javascript" 
	src="<c:url value='/js/jquery-easyui/datagrid-detailview.js'/>"></script>
	
<div id="baseInfoPanel" class="easyui-panel" title="基本信息"  style="width:886px;height:auto;padding:5px;">
	<form id ="detailfm" method="GET">
	    <input hidden="true" name="id" />
		<table border="0" class="table-new"  cellpadding="3"   cellspacing="3">
    	 	<tr>
    	 		<td class="textField1">
    	 			订单编号：
    	 		</td >
    	 		<td>
    	 			<input class="unFrameTextField" readonly="readonly" name="code" />
    	 		</td> 
    	 		<td class="textField1">
    	 			订单类型：
    	 		</td >
    	 		<td>
    	 			<input class="unFrameTextField" readonly="readonly" name="orderType"/>
    	 		</td> 
    	 		<td class="textField1" >
    	 			制单人：
    	 		</td >
   	 			<td>
    	 			<input class="unFrameTextField" readonly="readonly" name="createManName" />
    	 		</td> 	 				    	 		
    	 	</tr>
    	 	<tr>		    	 		
	    	 	<td class="textField1">
    	 			交货时间：
    	 		</td>   	 		
    	 		<td>
    	 			<input  class="unFrameTextField" readonly="readonly" name="receiveTime" />
    	 		</td>	    	 	    		    	 		
       	 		<td class="textField1">
    	 			快件单号：
    	 		</td>
    	 		<td>
    	 		 <input class="unFrameTextField" readonly="readonly" name="express" /> 
    	 		</td >
    	 		<td class="textField1" >
    	 			    合同号：
    	 		</td >
    	 		<td>
    	 			<input class="unFrameTextField" readonly="readonly" name="contract" />
       	 		</td>
    	 	</tr>
    	 	<tr>
    	 		<td class="textField1">
    	 			客户名称：
    	 		</td >
    	 		<td>
    	 			<input class="unFrameTextField"   style="width: 200px;" readonly="readonly" name="customerName" />
    	 		</td> 		    	 		
    	 		<td class="textField1" >
    	 			联系电话：
    	 		</td >
   	 			<td>
    	 			<input class="unFrameTextField" readonly="readonly" name="tel" />
    	 		</td> 
    	 		<td class="textField1">
    	 			联系人：
    	 		</td >
    	 		<td>
    	 			<input class="unFrameTextField" readonly="readonly" name="contacts"/>
    	 		</td> 	 				    	 		
    	 	</tr>	    	 	
    	 </table>	    	
    	 <table border="0" class="table-new"  cellpadding="3"   cellspacing="3">
    	 	<tr>	   	 		
    	 		<td class="textField1">
    	 			客户地址：
    	 		</td>
    	 		<td>
    	 		 	<input class="unFrameTextField" readonly="readonly" style="width: 600px;" name="address" ></input>
    	 		</td >		    	 		
    	 	</tr>
    	 	<tr>	   	 		
    	 		<td class="textField1">
    	 			备注：
    	 		</td>
    	 		<td>
    	 		 	<input class="unFrameTextField" readonly="readonly" style="width: 600px" name="description" ></input>
    	 		</td >		    	 		
    	 	</tr>
    	 </table>
	</form>
</div>
<div id="productDetailsPanel" class="easyui-panel" title="货物信息" style="width:886px;height:324px;padding:5px;">
	<table id="productDetailsList" style="width:820px;height:auto" >
       	
   	</table>
</div>
	


<script type="text/javascript">

	$(function(){

		$.ajax({
        	url:'<c:url value="/bus/order/load"/>',
        	dataType: "json",
        	data:{id:'${orderId}'},
        	async:false,
        	success:function(rowData){	
        		var detail = rowData.rows;     		   	        		
        		$('#detailfm').form('load',detail);
        	}
        });
		$('#productDetailsList').datagrid({
			pagination: false,
			fit: true,
			nowrap:false,
			rownumbers: true,
			fitColumns: false,
			singleSelect: true,
			ctrlSelect: false,
			pageSize: 20,
			method:'GET',
			loadMsg:'加载中，请稍等。。。',
        	url: '<c:url value="/bus/orderDetail/search?orderId=${orderId}"/>',
        	columns:[[	
        	    {field:'id',checkbox:true,width:"80",hidden:true},					
				{field:'orderId',hidden:true},	
				{field:'productCode',title: '产品编号',hidden:true},				
				{field:'productName',title: '产品名称',width:"150"},
				{field:'style',title: '款号',width:"120",formatter:contentWrap},
				{field:'number',title: '数量',width:"60"},									
				{field:'realNumber',title: '实际数量',width:"60",editor:'numberbox'},
				{field:'unit',title: '单位',width:"60"},		
				{field:'onePrice',title: '单价(元)',width:"70"},
				{field:'allPrice',title: '金额(元)',width:"70"},
				{field:'papers',title: '大张数量',width:"55",hidden:true},
				{field:'prints',title: '印次',width:"60",hidden:true},										
				{field:'description',title: '备注',width:"185",formatter:contentWrap}
        	]],      
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
	});


</script>