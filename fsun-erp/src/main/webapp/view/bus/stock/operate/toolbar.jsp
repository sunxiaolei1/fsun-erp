<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="<c:url value='/css/main.css'/>" />
<!-- Search panel start -->
<div id="toolbar"  style="padding:2px;display:none;" >
	 <span style="float:right;margin-top:2px;">	
	 	 <label>名称：</label>
		 <input id="s_name" type="text" style="width: 120px;" >   
		 <label >货号：</label>
		 <input id="s_artNum" type="text" style="width: 120px;">
		 <label >机架号：</label>
		 <input id="s_rackNum" type="text" style="width: 100px;" class="easyui-combobox">
		 <input type="button" class="search-btn" value="搜索" onMouseOver="this.className='on-search-btn'" onMouseOut="this.className='search-btn'" onfocus="this.blur()" onclick="javascript:searchA()"/>
	     <input type="button" class="reset-btn" value="重置" onMouseOver="this.className='on-reset-btn'" onMouseOut="this.className='reset-btn'" onfocus="this.blur()" onclick="javascript:reset()" />
     </span>
     <sec:authorize  ifAllGranted="STOCK_ADD"><a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="javascript:addStock()">新增</a></sec:authorize>
	 <sec:authorize  ifAllGranted="STOCK_DELETE"><a href="#" class="easyui-linkbutton" iconCls="icon-delete" plain="true" onclick="javascript:delStocks()">删除</a></sec:authorize> 
	 <a href="#" class="easyui-linkbutton" iconCls="icon-reload" plain="true" onclick="javascript:refresh()">刷新</a>  
	 <a href="<c:url value="/bus/stock/toSearch-1-10"/>" class="easyui-linkbutton" iconCls="icon-search" plain="true">高级搜索</a>    	
</div>
<!--  Search panel end -->

<script type="text/javascript">

	$(function(){
		$("#toolbar").show(); 
	})

	function searchA(){
		var name =  $('#s_name').val();
		var artNum =  $('#s_artNum').val();
		var rackNum =  $('#s_rackNum').combobox('getValue');
	    $('#list-table').datagrid('reload',{artNum:artNum,name:name,rackNum:rackNum});
	};	
		
	 function reset() {
		 $('#s_name').val('');
		 $('#s_artNum').val('');
		 $('#s_rackNum').combobox('clear');
	 };

	 function refresh(){
		 reset();
		 $('#list-table').datagrid({
			url:'<c:url value="/bus/stock/search"/>?id=${stockId}',
			queryParams: {},
			sortName:null
		 });
     }
	 
</script>