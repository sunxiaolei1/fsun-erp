<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="<c:url value='/css/main.css'/>" />
<!-- Search panel start -->
<div id="toolbar"  style="padding:2px;display:none;" >
	 <span style="float:right;margin-top:2px;">	
	 	<label>订单号：</label>
		<input id="orderCodeText" style="width:100px"  />     
		<label>生产单号：</label>
		<input id="madeCodeText" style="width:100px"  />  
		<label>产品:</label>
		<input id="productCodeComb" class="easyui-combobox" style="width:120px" /> 
		<div style="display:none;"> 
			<label>单据类型：</label>
			<input id="madeTypeCombo" class="easyui-combobox" style="width:100px;" />  
		</div>   
		<input type="button" id="searchBtn" class="search-btn" value="搜索" onMouseOver="this.className='on-search-btn'" onMouseOut="this.className='search-btn'" onfocus="this.blur()" onclick="javascript:asnQuery()"/>
		<input type="button" id="resetBtn" class="reset-btn" value="重置" onMouseOver="this.className='on-reset-btn'" onMouseOut="this.className='reset-btn'" onfocus="this.blur()" onclick="javascript:resetSearch()" />		           		
     </span>
     
	 <a href="javascript:void(0)" class="easyui-linkbutton"	iconCls="icon-add" plain="true"	onclick="javascript:openOrderWin()">新增</a>
	 <sec:authorize  ifAllGranted="ORDER_ADD">
  		<a href="javascript:void(0)" class="easyui-linkbutton"	iconCls="icon-add" plain="true"	onclick="javascript:shortcutOrder()">快捷下单</a>
  	</sec:authorize> 	
	 <a href="javascript:void(0)" class="easyui-linkbutton"	iconCls="icon-edit" plain="true" onclick="javascript:toMadeDetailsPage()">明细</a>
	 <a href="javascript:void(0)" class="easyui-linkbutton"	iconCls="icon-delete" plain="true" onclick="javascript:deleteMades()">删除</a>
	 <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-save" plain="true" onclick="javascript:completeMades()">结单</a>
	 <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-export" plain="true" onclick="javascript:toOrderPage()">相关订单</a>
	 <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-print" plain="true" onclick="javascript:printMades()">制作打印</a>

</div>
<!--  Search panel end --> 	

<script type="text/javascript">
	var madeTypeJson ='';
	
	var iconChange = function(value,row,index){
		
		if(row.icon==null||row.icon==""){
			return '<img class="item-img" onerror="this.style.display='+"'none'"+'"/>';
		}
		var imageFile = '<c:url value="/uploads/product"/>'+ row.icon;
		return '<img class="item-img" src="'+imageFile+'" style="height:29px;with:40px;" onerror="this.style.display='+"'none'"+'"/>';
		//var img = document.getElementById('imgid')[0].src;
	}

    $(function(){	
    	
    	$.getJSON('<c:url value="/json/madeType.json"/>',function(data){  
    		madeTypeJson = data;
    		$('#madeTypeCombo').combobox({
    			method:'get',
    		    required: false,
    		 	valueField: 'id',
    		  	textField: 'value',
    		  	data: madeTypeJson,
    		    panelHeight: 100
    		});
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
   
    	var comboList = $("#madeTypeCombo").next('.combo');
    	if(typeof(comboList) != "undefined"){
    		$(comboList[0]).css("margin-top",'-6px');
    	}
    	
    	comboList = $("#productCodeComb").next('.combo');
		if(typeof(comboList) != "undefined"){
			$(comboList[0]).css("margin-top",'-6px');
		}
    	
		$("#toolbar").show(); 
	});

    //清空查询BasCodes条件
	function resetSearch() {
        $("#madeCodeText").val("");
        $("#ordercodeText").val("");
        $('#productCodeComb').combobox('clear');
        $("#madeTypeCombo").combobox("setValue","");      
        var queryParams = detailGird.datagrid("options").queryParams;
        queryParams.madeCode = "";
        queryParams.orderCode = "";
        queryParams.productCode = "";
        queryParams.madeType = "";
        detailGird.datagrid("reload");
    }
    
	//根据条件查询BasCodes
	function asnQuery() {
		var orderCode = $("#orderCodeText").val();
		var madeCode = $("#madeCodeText").val();
		var productCode =  $('#productCodeComb').combobox('getValue');
		var madeType = $("#madeTypeCombo").combobox("getValue");
        var queryParams = detailGird.datagrid("options").queryParams;
        queryParams.madeCode = madeCode;
        queryParams.orderCode = orderCode;
        queryParams.productCode = productCode;
        queryParams.madeType = madeType;
        detailGird.datagrid("reload");
    }
 
</script>