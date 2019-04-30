<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- Search panel start -->
<div id="toolbar"  style="padding:2px;display:none;" >
	 <span style="float:right;margin-top:2px;">	
	 	<label>客户编号：</label>
		<input id="customerCode" class="easyui-combobox" style="width: 100px;" />     
		<label>客户名称：</label>
		<input id="customerName" class="easyui-combobox" style="width: 100px;"/> 
		<label>联系人：</label>
		<input id="customerContacts" class="easyui-combobox" style="width: 80px;"/>         
		<input type="button" class="search-btn" value="搜索" onMouseOver="this.className='on-search-btn'" onMouseOut="this.className='search-btn'" onfocus="this.blur()" onclick="javascript:searchA()"/>
		<input type="button" class="reset-btn" value="重置" onMouseOver="this.className='on-reset-btn'" onMouseOut="this.className='reset-btn'" onfocus="this.blur()" onclick="javascript:reset()" />		           		
     </span>
     <sec:authorize  ifAllGranted="CUSTOMER_ADD"><a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="javascript:addCustomer()">新增</a></sec:authorize>
	 <sec:authorize  ifAllGranted="CUSTOMER_EDIT"><a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="javascript:editCustomer()">编辑</a></sec:authorize>
	 <sec:authorize  ifAllGranted="CUSTOMER_DELETE"><a href="#" class="easyui-linkbutton" iconCls="icon-delete" plain="true" onclick="javascript:delCustomer()">删除</a></sec:authorize>
	 <sec:authorize  ifAllGranted="CUSTOMER_DISABLE"><a href="#" class="easyui-linkbutton" iconCls="icon-close" plain="true" onclick="javascript:disableCustomer()">禁用</a></sec:authorize>
	 <sec:authorize  ifAllGranted="CUSTOMER_ENABLE"><a href="#" class="easyui-linkbutton" iconCls="icon-open" plain="true" onclick="javascript:editDisableCustomer()">选择启用客户</a></sec:authorize>   	
</div>
<!--  Search panel end -->

<script type="text/javascript">

	$(function(){

		$('#customerCode').combobox({
    		method:'get',
            required: false,
    	 	valueField: 'code',
    	  	textField: 'code',
    	  	url: '<c:url value="/bus/customer/list"/>',
    	    panelHeight: 100
    	});

    	$('#customerName').combobox({
    		method:'get',
            required: false,
    	 	valueField: 'name',
    	  	textField: 'name',
    	  	url: '<c:url value="/bus/customer/getNames"/>',
    	    panelHeight: 100
    	});

    	$('#customerContacts').combobox({
    		method:'get',
            required: false,
    	 	valueField: 'name',
    	  	textField: 'name',
    	  	url: '<c:url value="/bus/customer/getContacts"/>',
    	    panelHeight: 100
    	});

		$("#toolbar").show(); 
	})

	function searchA(){
		var code = $('#customerCode').combobox('getValue');
		var name = $('#customerName').combobox('getValue');
		var contacts = $('#customerContacts').combobox('getValue');
        $('#list-table').datagrid('reload',{
	        code:code,
	        name:name,
	        contacts:contacts
	      });
     };	
		
    function reset() {	   
       	$('#customerCode').combobox('clear');
        $('#customerName').combobox('clear'); 
        $('#customerContacts').combobox('clear');
    };   
 
</script>