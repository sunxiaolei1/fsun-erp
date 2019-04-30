<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="<c:url value='/css/main.css'/>" />
<!-- Search panel start -->
<div id="toolbar"  style="padding:2px;display:none;" >
	 <span style="float:right;margin-top:2px;">	 
		<label>加工单号：</label>
		<input id="proxyCodeText" style="width:150px"  />  
		<label>客户名称:</label>
		<input id="customerCodeComb" class="easyui-combobox" style="width:180px" />    
		<input type="button" id="searchBtn" class="search-btn" value="搜索" onMouseOver="this.className='on-search-btn'" onMouseOut="this.className='search-btn'" onfocus="this.blur()" onclick="javascript:asnQuery()"/>
		<input type="button" id="resetBtn" class="reset-btn" value="重置" onMouseOver="this.className='on-reset-btn'" onMouseOut="this.className='reset-btn'" onfocus="this.blur()" onclick="javascript:resetSearch()" />		           		
     </span>
     
	 <a href="javascript:void(0)" class="easyui-linkbutton"	iconCls="icon-add" plain="true"	onclick="javascript:toAddHeaderPage()">新增</a>
	 <a href="javascript:void(0)" class="easyui-linkbutton"	iconCls="icon-edit" plain="true" onclick="javascript:toDetailsPage()">明细</a>
	 <a href="javascript:void(0)" class="easyui-linkbutton"	iconCls="icon-delete" plain="true" onclick="javascript:deleteProxys()">删除</a>
	 <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-save" plain="true" onclick="javascript:completeProxys()">结单</a>
	 <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-reload" plain="true" onclick="javascript:flushDataGrid()">刷新</a>
	 <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-print" plain="true" onclick="javascript:printProxys()">制作打印</a>
	 <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-export" plain="true" onclick="javascript:templateDownload()">导出excel</a>

</div>
<!--  Search panel end --> 	

<script type="text/javascript">

    $(function(){
    	
    	$("#customerCodeComb").combogrid({
  		  panelWidth: 500,
  	      panelHeight: 320,
  	      idField: 'code',
  	      textField: 'name',
  	      url: '<c:url value="/bus/customer/search"/>',
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
  	        {field: "code", title: "客户编号", width: 40,align:'center'},
  	        {field: "name", title: "客户名称", width: 140},
  	        {field: "address", title: "地址", width: 140} 
  	      ]],
  	      loadMsg: "数据加载中请稍后……",
  	      emptyMsg: "没有符合条件的记录"
  	    });
   
    	comboList = $("#customerCodeComb").next('.combo');
		if(typeof(comboList) != "undefined"){
			$(comboList[0]).css("margin-top",'-6px');
		}
    	
		$("#toolbar").show(); 
	});

    //清空查询BasCodes条件
	function resetSearch() {
        $("#proxyCodeText").val("");
        $('#customerCodeComb').combobox('clear');   
        var queryParams = detailGird.datagrid("options").queryParams;
        queryParams.proxyCode = "";
        queryParams.customerCode = "";   
        clearDataGridSelections();
        detailGird.datagrid("reload");
    }
    
	//根据条件查询BasCodes
	function asnQuery() {
		var proxyCode = $("#proxyCodeText").val();
		var customerCode =  $('#customerCodeComb').combobox('getValue');		
        var queryParams = detailGird.datagrid("options").queryParams;
        queryParams.proxyCode = proxyCode;    
        queryParams.customerCode = customerCode;  
        clearDataGridSelections();
        detailGird.datagrid("reload");
    }
	
	//excel表模板导出
	function templateDownload(){    
		var proxyCode = $("#proxyCodeText").val();		
		var customerCode = $("#customerCodeComb").combobox("getValue");				  
		window.location.href = '<c:url value="/bus/proxyOrder/excelExport?proxyCode='
  			+ proxyCode +'&customerCode='+ customerCode +'"/>';          
	}
 
</script>