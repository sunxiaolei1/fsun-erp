<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div id="searchbar"  style="padding:2px;display:none;" >
	 <span style="float:right;margin-top:2px;">	
	 	<label>订单号:</label>
		<input id="orderCodeText" type="text" style="width:120px"/> 
		<label>产品:</label>
		<input id="productCodeComb" class="easyui-combobox" style="width:120px" /> 
		<label>客户:</label>
		<input id="customerName1" class="easyui-combobox" style="width:120px" /> 
		<input type="button" class="search-btn" value="搜索" onMouseOver="this.className='on-search-btn'" onMouseOut="this.className='search-btn'" onfocus="this.blur()" onclick="javascript:searchA()"/>
		<input type="button" class="reset-btn" value="重置" onMouseOver="this.className='on-reset-btn'" onMouseOut="this.className='reset-btn'" onfocus="this.blur()" onclick="javascript:reset()" />		           		
     </span>
      	
  	<sec:authorize  ifAllGranted="ORDER_ADD">
  		<a href="javascript:void(0)" class="easyui-linkbutton"	iconCls="icon-add" plain="true"	onclick="javascript:addOrder()">制单</a>
  	</sec:authorize>
  	<sec:authorize  ifAllGranted="ORDER_ADD">
  		<a href="javascript:void(0)" class="easyui-linkbutton"	iconCls="icon-add" plain="true"	onclick="javascript:shortcutOrder()">快捷下单</a>
  	</sec:authorize> 	
	<sec:authorize  ifAllGranted="ORDER_EDIT">
		<a href="javascript:void(0)" class="easyui-linkbutton"	iconCls="icon-edit" plain="true" onclick="javascript:editOrder()">编辑</a>
	</sec:authorize>
	<sec:authorize  ifAllGranted="ORDER_DELETE">
		<a href="javascript:void(0)" class="easyui-linkbutton"	iconCls="icon-delete" plain="true"	onclick="javascript:delOrder()">删除</a>
	</sec:authorize>
	<sec:authorize  ifAllGranted="ORDER_REFRESH">
		<a href="javascript:void(0)" class="easyui-linkbutton"	iconCls="icon-reload" plain="true"	onclick="javascript:refresh()">刷新</a>
	</sec:authorize>
	<sec:authorize  ifAllGranted="ORDER_REORDER">
		<a href="javascript:void(0)" class="easyui-linkbutton"	iconCls="icon-redo" plain="true"	onclick="javascript:reorderShow()">返单</a>
	</sec:authorize>
	<sec:authorize  ifAllGranted="ORDER_PRODUCT_INFO_ADD">
		<a href="javascript:void(0)" class="easyui-linkbutton"	iconCls="icon-add" plain="true"	onclick="javascript:productAddShow()">添加产品信息</a>
	</sec:authorize>	
    <!-- <sec:authorize  ifAllGranted="ORDER_IMPORT">{text: '批量导入',iconCls:'icon-import',handler:templateImport},</sec:authorize>
  	<sec:authorize  ifAllGranted="ORDER_EXPORT">{text: 'EXCEL导出',iconCls: 'icon-export',handler: templateDownload}</sec:authorize>
	-->
</div>

<script type="text/javascript">

function searchA(){
	var customerName =  $('#customerName1').combobox('getValue');
	var productCode =  $('#productCodeComb').combobox('getValue');
	var orderCode = $("#orderCodeText").val();
    $('#list-table').datagrid('reload',{
    	customerName:customerName,
        code:orderCode,
        productCode:productCode
      });
 };	
		
	
function reset() {	   
	$('#customerName1').combobox('clear'); 
	$('#productCodeComb').combobox('clear');
    $("#orderCodeText").val('');
    $('.validatebox-tip').remove();
    $('#list-table').datagrid('reload',{});
}; 

var iconChange = function(value,row,index){
	
	if(row.icon==null||row.icon==""){
		return '<img class="item-img" onerror="this.style.display='+"'none'"+'"/>';
	}
	var imageFile = '<c:url value="/uploads/product"/>'+ row.icon;
	return '<img class="item-img" src="'+imageFile+'" style="height:29px;with:40px;" onerror="this.style.display='+"'none'"+'"/>';
	//var img = document.getElementById('imgid')[0].src;
}

$(function() {
	
	$('#customerName1').combobox({
		method:'get',
        required: false,
	 	valueField: 'name',
	  	textField: 'name',
	  	url: '<c:url value="/bus/customer/list"/>',
	    panelHeight: 'auto'
	});
	
	$("#productCodeComb").combogrid({
	  panelWidth: 440,
      panelHeight: 320,
      idField: 'code',
      textField: 'name',
      url: '<c:url value="/bus/product/search"/>',
      queryParams: {enabled: true},
      multiple: false,
      fitColumns: true,
      striped: true,
      editable: true,
      pagination: true,
      rownumbers: true,
      collapsible: false,
      pageNumber : parseInt('${pageNumber}')||1,
      pageSize : parseInt('${pageSize}')||10,
      method: 'post',
      mode:'remote',
      columns: [[
        {field: "id", checkbox: true},
        {field: "code", title: "产品编号", width: 40,align:'center'},
        {field: "name", title: "产品名称", width: 140},
        {field: "icon", title: "图片", width: 80, formatter: iconChange} 
      ]],
      loadMsg: "数据加载中请稍后……",
      emptyMsg: "没有符合条件的记录"
    });
	
	
	var comboList = $("#customerName1").next('.combo');
	if(typeof(comboList) != "undefined"){
		$(comboList[0]).css("margin-top",'-6px');
	}
	
	comboList = $("#productCodeComb").next('.combo');
	if(typeof(comboList) != "undefined"){
		$(comboList[0]).css("margin-top",'-6px');
	}

	$("#searchbar").show();

});
</script>