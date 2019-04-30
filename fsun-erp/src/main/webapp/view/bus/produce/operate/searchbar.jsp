<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div id="searchbar" class="ui-search-panel" region="north" style="display:none;height:65px; padding:5px 5px;" title="搜索"
	data-options="striped: true,collapsible:false,iconCls:'icon-search',border:false">
		<label>客户名称：</label>
		<input id="customerName1" class="easyui-combobox" /> 
		<label>订单状态：</label>
		<input id="orderStatus" style="width: 80px;" editable="false" class="easyui-combobox" data-options="data:orderStatus,valueField:'id',textField:'text',panelHeight:'auto'"/>      
		<label>订单类型：</label>
		<input id="orderType"  style="width: 80px;" editable="false" class="easyui-combobox" data-options="data:orderType,valueField:'id',textField:'text',panelHeight:'auto'" />          
		<label>交货日期起：</label>
		<input type="text" style="width: 120px;" id="startDate"  editable="false" class="easyui-datebox" validType="startDate" /> 
		<label>交货日期止：</label>
		<input type="text"  style="width: 120px;" id="endDate"  editable="false" class="easyui-datebox" validType="endDate" />
		<input type="button" class="search-btn" value="搜索" onMouseOver="this.className='on-search-btn'" onMouseOut="this.className='search-btn'" onfocus="this.blur()" onclick="javascript:searchA()"/>
		<input type="button" class="reset-btn" value="重置" onMouseOver="this.className='on-reset-btn'" onMouseOut="this.className='reset-btn'" onfocus="this.blur()" onclick="javascript:reset()" />		           		
</div>

<script type="text/javascript">

$.extend($.fn.validatebox.defaults.rules, {
 	startDate: {// 验证
    	validator: function (value) {
 			var endDate =  $('#endDate').datebox('getValue');
 			if(endDate!=null && endDate!=''){
				if(value > endDate){
					return false;
				}
     		}
     		return true;
     	},
     	message: '开始日期不能晚于结束日期'
 	},
 	endDate: {// 验证
    	validator: function (value) {
     		var startDate =  $('#startDate').datebox('getValue');
 			if(startDate!=null && startDate!=''){
				if(value < startDate){
					return false;
				}
     		}
     		return true;
     	},
     	message: '结束日期不能早于开始日期'
		}
});

function searchA(){
	var customerName =  $('#customerName1').combobox('getValue');
	var status =  $('#orderStatus').combobox('getValue');
	var orderType =  $('#orderType').combobox('getValue');	
	var startDate = $("#startDate").datebox("getValue");
	var endDate = $("#endDate").datebox("getValue");
    $('#list-table').datagrid('reload',{
    	customerName:customerName,
        status:status,
        orderType:orderType,
        startDate:startDate,
        endDate:endDate
      });
 };	
	
function reset() {	   
	$('#customerName1').combobox('clear');
    $('#orderStatus').combobox('clear'); 
    $('#orderType').combobox('clear'); 
    $("#startDate").datebox("clear");
    $("#endDate").datebox("clear"); 
    $('.validatebox-tip').remove();  
}; 

$(function() {

	$('#customerName1').combobox({
		method:'get',
        required: false,
	 	valueField: 'name',
	  	textField: 'name',
	  	url: '<c:url value="/bus/customer/list"/>',
	    panelHeight: 'auto'
	});

	$("#searchbar").show();

});
</script>