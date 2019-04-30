<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="<c:url value='/css/main.css'/>" />
<!-- Search panel start -->
<div id="toolbar"  style="padding:2px;display:none;" >
	 <span style="float:right;margin-top:2px;">	
	 	<label>产品编号：</label>
		<input id="productCode" class="easyui-combobox" />     
		<label>产品名称：</label>
		<input id="productName" class="easyui-combobox" />          
		<input type="button" class="search-btn" value="搜索" onMouseOver="this.className='on-search-btn'" onMouseOut="this.className='search-btn'" onfocus="this.blur()" onclick="javascript:searchA()"/>
		<input type="button" class="reset-btn" value="重置" onMouseOver="this.className='on-reset-btn'" onMouseOut="this.className='reset-btn'" onfocus="this.blur()" onclick="javascript:reset()" />		           		
     </span>
     <sec:authorize  ifAllGranted="PRODUCT_ADD">
		 <a href="javascript:void(0)" class="easyui-linkbutton"	iconCls="icon-add" plain="true"	onclick="javascript:productAdd()">新增</a> 
	 </sec:authorize>
	 <sec:authorize  ifAllGranted="PRODUCT_EDIT">
		 <a href="javascript:void(0)" class="easyui-linkbutton"	iconCls="icon-edit" plain="true"  onclick="javascript:productEdit()">编辑</a> 
	 </sec:authorize>
	 <sec:authorize  ifAllGranted="PRODUCT_DELETE">
		 <a	href="javascript:void(0)" class="easyui-linkbutton"	iconCls="icon-delete" plain="true" onclick="javascript:delProduct()">删除</a>
	 </sec:authorize>
	 <sec:authorize  ifAllGranted="PRODUCT_DISABLE">
		<a	href="javascript:void(0)" class="easyui-linkbutton"	iconCls="icon-close" plain="true" onclick="javascript:disableProduct()">禁用</a>
	 </sec:authorize>
	 <sec:authorize  ifAllGranted="PRODUCT_ENABLE">
		 <a	href="javascript:void(0)" class="easyui-linkbutton"	iconCls="icon-open" plain="true" onclick="javascript:editProduct()">选择启用产品</a>
	 </sec:authorize>
</div>
<!--  Search panel end -->

<script type="text/javascript">

    $(function(){
		$('#productCode').combobox({
			method:'get',
		    required: false,
		 	valueField: 'code',
		  	textField: 'code',
		  	url: '<c:url value="/bus/product/list"/>',
		    panelHeight: 100
		});
		
		$('#productName').combobox({
			method:'get',
		    required: false,
		 	valueField: 'name',
		  	textField: 'name',
		  	url: '<c:url value="/bus/product/getNames"/>',
		    panelHeight: 100
		});

		$("#toolbar").show(); 
	});

	 function searchA(){
		var code =  $('#productCode').combobox('getValue');
		var name =  $('#productName').combobox('getValue');
        $('#list-table').datagrid('reload',{
	        code:code,
	        name:name
	      });
     };	
		
    function reset() {	   
       	$('#productCode').combobox('clear');
        $('#productName').combobox('clear'); 
    };  
 
</script>