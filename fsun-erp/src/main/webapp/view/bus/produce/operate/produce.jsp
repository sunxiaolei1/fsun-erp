<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div id="toolbar" style="display:none;"> 		
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-reload"  plain="true" onclick="refreshData()">刷新</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-print"  plain="true" onclick="makeProduce()">制作生产单</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-print"  plain="true" onclick="makeDeliver('')">制作送货单</a>	      
</div>
 
<%@include file="printProduce1.jsp"%>
	
<%@include file="printDeliver1.jsp"%>

<div id="orderDetailswin" class="easyui-window" shadow= "false" title="生产单详情" closed="true" align="center" style="display:none;width:900px;height:500px;top:10px;" modal="true">
	<iframe frameborder="0" width="100%" height="100%"></iframe>
</div>
	
<script type="text/javascript">

$(function() {
	
	$("#toolbar").show();
	$('#orderDetailswin').window({
		 onBeforeClose:function(){ 
		      $("#orderDetailswin").find('iframe').removeAttr("src");		
    	 }
	});
	$('#orderDetailswin').show();
});

function refreshData(){
	$('#list-table').datagrid('clearSelections');	
	$('#list-table').datagrid('reload');
}

//判别有没操作权限
function operatePower(orderId){
	var operatePower = false;
	$.ajax({
       type: "get",
       dataType: "json",
       async:false,
       url: '<c:url value="/bus/order/operatePower"/>',
       data: {"orderId":orderId},
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

//编辑生产单
function editProduce(orderDto){
 	if(!operatePower(orderDto.id)){
	 	return ;
	}
 	$("#orderDetailswin").find('iframe').attr('src','<c:url value="/bus/produce/orderDetail-"/>'+orderDto.id+"-"+true);
	$("#orderDetailswin").window("open");
}

</script>