<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div region="center"  title="订单详情" fit="true" style="margin-top:-2px;">
	<div id="baseInfoPanel" class="easyui-panel"  collapsible="true"  collapsed="false"  style="width:628px;padding:5px;">
		<form id ="detailfm" method="GET">
		    <input hidden="true" name="id" />
			<table border="0" class="table-new"  cellpadding="3"   cellspacing="3">
	    	 	<tr>
	    	 		<td class="textField1">
	    	 			订单编号：
	    	 		</td >
	    	 		<td>
	    	 			<input class="unFrameTextField"  readonly="readonly" name="code" />
	    	 		</td> 
	    	 		<td class="textField1">
	    	 			订单类型：
	    	 		</td >
	    	 		<td>
	    	 			<input class="unFrameTextField" readonly="readonly" name="orderType"/>
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
	    	 	</tr>
	    	 	<tr>
	    	 		<td class="textField1" >
	    	 			制单人：
	    	 		</td >
    	 			<td>
	    	 			<input class="unFrameTextField" readonly="readonly" name="createManName" />
	    	 		</td> 
	    	 		<td class="textField1">
	    	 			客户名称：
	    	 		</td >
	    	 		<td>
	    	 			<input class="unFrameTextField" readonly="readonly" name="customerName"  style="width: 200px;" />
	    	 		</td> 		    	 		
	    	 						    	 		
	    	 	</tr>	    	 	
	    	 </table>	    	
	    	 <table border="0" class="table-new"  cellpadding="3"   cellspacing="3">
	    	 	<tr>	   	 		
	    	 		<td class="textField1">
	    	 			客户地址：
	    	 		</td>
	    	 		<td>
	    	 		 	<input class="unFrameTextField" readonly="readonly" style="width: 400px;" name="address" ></input>
	    	 		</td >		    	 		
	    	 	</tr>
	    	 	<tr>	   	 		
	    	 		<td class="textField1">
	    	 			备注：
	    	 		</td>
	    	 		<td>
	    	 		 	<input class="unFrameTextField" readonly="readonly" style="width: 400px" name="description" ></input>
	    	 		</td >		    	 		
	    	 	</tr>
	    	 </table>
		</form>
	</div>
	<div id="productDetailsPanel" class="easyui-panel" title="货物信息" style="width:628px;height:365px;">
		<table id="productDetailsList" style="width:100%;height:auto;padding:2px;">
        	
    	</table>
	</div>
</div>

<script type="text/javascript">

function openOrderDiv(orderId){
	$.ajax({
    	url:'<c:url value="/bus/order/load"/>',
    	dataType: "json",
    	data:{id:orderId},
    	async:false,
    	success:function(rowData){	
    		var detail = rowData.rows;     		   	        		
    		$('#detailfm').form('load',detail);
    	}
    });
	$('#productDetailsList').datagrid({
		pagination: false,
		nowrap: false,
		fit: true,
		rownumbers: true,
		fitColumns: false,
		singleSelect: true,
		ctrlSelect: false,
		pageSize: 20,
		method:'GET',
		loadMsg:'加载中，请稍等。。。',
    	url: '<c:url value="/bus/orderDetail/search?orderId=' + orderId + '"/>',
    	columns:[[	
    	    {field:'id',hidden:true},						
			{field:'productCode',title: '产品编号',width:"55"},				
			{field:'productName',title: '产品名称',width:"145",formatter:contentWrap},
			{field:'style',title: '款号',width:"80",formatter:contentWrap},
			{field:'number',title: '数量',width:"60"},													
			{field:'unit',title: '单位',width:"35"},																
			{field:'description',title: '备注',width:"140",formatter:contentWrap}
    	]]
    }); 

}
</script>