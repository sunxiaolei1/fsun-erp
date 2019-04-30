<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div id="searchbar" class="ui-search-panel" region="north" style="display:none;height:36px; padding:5px 5px;"
	data-options="striped: true,collapsible:false,border:false">
		<label>单号：</label>
		<input id="purchaseId" class="easyui-combobox" /> 
		<input type="button" class="search-btn" value="搜索" onMouseOver="this.className='on-search-btn'" onMouseOut="this.className='search-btn'" onfocus="this.blur()" onclick="javascript:searchA()"/>
		<input type="button" class="reset-btn" value="重置" onMouseOver="this.className='on-reset-btn'" onMouseOut="this.className='reset-btn'" onfocus="this.blur()" onclick="javascript:reset()" />		           		
</div>

<%@include file="makePos.jsp"%>

<script type="text/javascript">

function searchA(){
	var purchaseId =  $('#purchaseId').combobox('getValue');
    $('#list-table').datagrid('reload',{
    	id:purchaseId
      });
 };	
		
	
function reset() {	   
	$('#purchaseId').combobox('clear');
    $('.validatebox-tip').remove();  
}; 

$(function() {

	$('#purchaseId').combobox({
		method:'get',
        required: false,
	 	valueField: 'id',
	  	textField: 'id',
	  	url: '<c:url value="/bus/purchase/list"/>',
	    panelHeight: 'auto'
	});

	$("#searchbar").show();

});
</script>