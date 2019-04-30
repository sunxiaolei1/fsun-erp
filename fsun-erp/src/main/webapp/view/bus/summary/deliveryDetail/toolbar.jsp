<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="<c:url value='/css/main.css'/>" />
<!-- Search panel start -->
<div id="toolbar"  style="padding:2px;display:none;" >
	 <span style="float:right;margin-top:2px;">	
	 	<label>订单编号：</label>
		<input id="orderCodeText" style="width:100px"  />
		<label>送货单号：</label>
		<input id="deliveryCodeText" style="width:100px"  />
		<label>客户名称：</label>
		<input id="customerCodeCombo" class="easyui-combobox" style="width:100px;" />
		<label>开始日期：</label>
		<input type="text" id="startDate" class="easyui-datebox" editable="false" data-options="width:90" validType="startDate" /> 
		<label>结束日期：</label>
		<input type="text"  id="endDate" class="easyui-datebox" editable="false" data-options="width:90" validType="endDate" />							  
    
		<input type="button" id="searchBtn" class="search-btn" value="搜索" onMouseOver="this.className='on-search-btn'" onMouseOut="this.className='search-btn'" onfocus="this.blur()" onclick="javascript:asnQuery()"/>
		<input type="button" id="resetBtn" class="reset-btn" value="重置" onMouseOver="this.className='on-reset-btn'" onMouseOut="this.className='reset-btn'" onfocus="this.blur()" onclick="javascript:resetSearch()" />		           		
     </span>
     
	 <a href="javascript:void(0)" class="easyui-linkbutton"	iconCls="icon-add" plain="true"	onclick="javascript:templateDownload()">导出excel</a>
</div>
<!--  Search panel end --> 	

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

	var deliveryTypeJson ='';

    $(function(){	
    	
    	/* $.getJSON('<c:url value="/json/deliveryType.json"/>',function(data){  
    		deliveryTypeJson = data;
    		$('#deliveryTypeCombo').combobox({
    			method:'get',
    		    required: false,
    		 	valueField: 'id',
    		  	textField: 'value',
    		  	data: deliveryTypeJson,
    		    panelHeight: 100
    		});
        }); */
    	
    	$("#customerCodeCombo").combogrid({
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
  	
    	
    	var comboList = $("#customerCodeCombo").next('.combo');
    	if(typeof(comboList) != "undefined"){
    		$(comboList[0]).css("margin-top",'-6px');
    	}
    	
    	var comboList = $("#startDate").next('.combo');
    	if(typeof(comboList) != "undefined"){
    		$(comboList[0]).css("margin-top",'-6px');
    	}
    	
    	var comboList = $("#endDate").next('.combo');
    	if(typeof(comboList) != "undefined"){
    		$(comboList[0]).css("margin-top",'-6px');
    	}
    	
		$("#toolbar").show(); 
	});

    //清空查询BasCodes条件
	function resetSearch() {
		$("#orderCodeText").val("");
        $("#deliveryCodeText").val("");
        $("#customerCodeCombo").combogrid("clear"); 
        $("#startDate").datebox("clear");
        $("#endDate").datebox("clear");
       // $("#deliveryTypeCombo").combobox("setValue","");  
        var queryParams = detailGird.datagrid("options").queryParams;
        queryParams.deliveryCode = "";
        queryParams.orderCode = "";
        queryParams.customerCode = "";
        queryParams.startDate = "";
        queryParams.endDate = "";
        detailGird.datagrid("reload");
    }
    
	//根据条件查询BasCodes
	function asnQuery() {
		var orderCode = $("#orderCodeText").val();
		var deliveryCode = $("#deliveryCodeText").val();
		var customerCode = $("#customerCodeCombo").combogrid("getValue");
		var startDate = $("#startDate").datebox("getValue");
    	var endDate = $("#endDate").datebox("getValue");
        var queryParams = detailGird.datagrid("options").queryParams;
        queryParams.deliveryCode = deliveryCode;
        queryParams.orderCode = orderCode;
        queryParams.customerCode = customerCode;
        queryParams.startDate = startDate;
        queryParams.endDate = endDate;
        detailGird.datagrid("reload");
    }
	
	//excel表模板导出
	function templateDownload(){
	    var orderCode = $("#orderCodeText").val();
		var deliveryCode = $("#deliveryCodeText").val();
		var customerCode = $("#customerCodeCombo").combogrid("getValue");
		var startDate = $("#startDate").datebox("getValue");
    	var endDate = $("#endDate").datebox("getValue");
		 $.messager.progress({title: '请等待',msg: '明细导出中...',text: '',interval: 700});
         $.ajax({
             type: "post",
             dataType: "json",
             async:false,
             url: '<c:url value="/bus/summary/deliveryDetail/writeExcel"/>',
             data: {
	             "orderCode":orderCode,
	             "deliveryCode":deliveryCode,
	             "customerCode":customerCode,
	             "startDate":startDate,
	             "endDate":endDate,
	            },
             success: function(result) {
             	$.messager.progress('close');
             	if(result.success){
             		var fileName = "送货单明细汇总";
             		window.location.href = '<c:url value="/bus/summary/detail/excelExport1?file='
             			+ encodeURI(encodeURI(result.rows))+'&fileName='+ encodeURI(encodeURI(fileName))+'"/>';
             	}else{
             		$.messager.show({ title: '提示信息', msg : '导出明细异常!' });                 	
             	}    			                				                															                	
             }
         });              
	}
 
</script>