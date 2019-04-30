<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript" src="<c:url value='/js/jquery-easyui/jquery.role_edatagrid.js'/>"></script>

<div style="height:305px;" >
	<table id="list-detial-table-${currIndex}" toolbar="#list-detial-toolbar" nowrap="false" 
		pagination="false" idField="id" fit="true" rownumbers="true" fitColumns="true" singleSelect="true" >
		<thead>
			<tr>
				<th field="id" hidden="true"></th>
				<th field="orderId" width="50" hidden="true"></th>
				<th field="orderCode" width="50" hidden="true"></th>
				<th field="productName" width="50" hidden="true"></th>
				<th field="productCode" width="100" sortable="true" editor="{type:'combobox'}" formatter="getProductName" >产品名称</th>
				<th field="style" width="100" sortable="true" editor="{type:'combobox'}">款号</th>
				<th field="number" width="50" sortable="true" editor="{type:'numberbox',options:{required:true}}">数量</th>
				<th field="realNumber" width="50" sortable="true" editor="{type:'numberbox',options:{required:false}}">实际数量</th>
				<th field="unit" width="50" sortable="true"
					editor="{type:'combobox',options:{required:true,data:unitValue,valueField:'id',textField:'text',panelHeight:'auto'}}">单位</th>
				<th field="onePrice" width="60" sortable="true"
					editor="{type:'numberbox', options:{required:false,min:'0',precision:'2'}}">单价(元)</th>
				<th field="allPrice" width="60" sortable="true"
					editor="{type:'numberbox', options:{required:false,min:'0',precision:'1'}}">金额(元)</th>
				<th field="description" width="100" formatter="contentWrap" editor="{type:'text'}">备注</th>
			</tr>
		</thead>
	</table>
</div>

<c:if test="${hasOperatePower}">
	<div id="list-detial-toolbar" style="display:none;">	
		<sec:authorize  ifAllGranted="ORDER_PRODUCT_ADD">
				 <a href="javascript:void(0)" class="easyui-linkbutton"	iconCls="icon-add" plain="true"	onclick="productAdd()">新增</a> 
		</sec:authorize>
		<sec:authorize  ifAllGranted="ORDER_PRODUCT_DELETE">
				 <a	href="javascript:void(0)" class="easyui-linkbutton"	iconCls="icon-delete" plain="true"	onclick="delProduct()">删除</a>
		</sec:authorize>
		<sec:authorize  ifAllGranted="ORDER_PRODUCT_SAVE">
				 <a href="javascript:void(0)" class="easyui-linkbutton"	iconCls="icon-save" plain="true"  onclick="saveProduct()">保存</a>
		</sec:authorize>
		<sec:authorize  ifAllGranted="ORDER_PRODUCT_UPDATE">
				 <a href="javascript:void(0)" class="easyui-linkbutton"	iconCls="icon-edit" plain="true"  onclick="productEdit()">编辑</a> 
		</sec:authorize>
		<sec:authorize  ifAllGranted="ORDER_PRODUCT_CANCEL">
				 <a	href="javascript:void(0)" class="easyui-linkbutton"	iconCls="icon-undo" plain="true"  onclick="refrash()">取消</a>
		</sec:authorize>	
	</div>	
</c:if>
	
<script>
	 
	 var detailGird = '';
	 
	 var orderDetailDtos = [];
	 
	 var getProductName = function(value,row,index){
		 var name = row.productName;
		 if((name==null || name=='')&&row.productCode!=null && row.productCode!=''){
			 name = row.productCode;
		 }
		 return name;
	 }
 
	 var iconChange = function(value,row,index){
			
		if(row.icon==null||row.icon==""){
			return '<img class="item-img" onerror="this.style.display='+"'none'"+'"/>';
		}
		var imageFile = '<c:url value="/uploads/product"/>'+ row.icon;
		return '<img class="item-img" src="'+imageFile+'" style="height:29px;with:40px;" onerror="this.style.display='+"'none'"+'"/>';
		//var img = document.getElementById('imgid')[0].src;
	 }
	 	
	 $(function() {
		
		detailGird = $('#list-detial-table-${currIndex}');
		/* $.post('<c:url value="/bus/orderDetail/search?orderId=${orderId}"/>',function(result){
			if(result.success){
				orderDetailDtos = result.rows;
				detailGird.datagrid("loadData", orderDetailDtos);
			}	
		},'json'); */ 
		
		detailGird.edatagrid({
			loadMsg:'加载中，请稍等。。。',
			url: '<c:url value="/bus/orderDetail/search"/>',
			saveUrl : '<c:url value="/bus/orderDetail/save"/>',
			updateUrl : '<c:url value="/bus/orderDetail/save"/>',
			queryParams: { orderId: "${orderId}"},
			onBeforeLoad: function(param){				   		 				   
	        	$(this).datagrid('clearSelections');             		 
    		},
			onSave : function(index, result) {
				if(result.success){	
					var row = $(this).datagrid('getSelected'); 
					$(this).datagrid('reload');
					refreshSelectedRow(result.order,'${currIndex}');									
				}else{						
					$.messager.alert('提示',"错误："+result.rows,'info');										
				}	
			},
			onSelect : function(rowIndex, rowData){
			
				var editors = $(this).datagrid('getEditors', rowIndex);
				for (var i = 0, len = editors.length; i < len; i++) {
					var editor = editors[i];
					$(editor.target).bind('keyup', function (e) {
					    var code = e.keyCode || e.which;
					    if (code == 13) {
					    	
					    	//detailGird.edatagrid('endEdit', rowIndex);
					    	///////detailGird.edatagrid('saveRow');
					    	//detailGird.edatagrid("addRow");
					    	detailGird.edatagrid('acceptChanges');
					    	if(i==len-1){
					    		//detailGird.datagrid('endEdit', rowIndex);
						    	//detailGird.edatagrid("addRow");
					    	}else{
					    		//$(this).datagrid('endEdit', rowIndex);
					    	}
					    	
					    }
					});
				} 
			}
		});
		
		$("#list-detial-toolbar").show();
	});

	 //添加numberbox的级联计算
	 function setEditing(detailGird,rowIndex,fromText1,fromText2,toText){       
	     var priceEditor = $(getEditCell(detailGird,rowIndex,fromText1).target);   
	     var amountEditor = $(getEditCell(detailGird,rowIndex,fromText2).target); 
	     var costEditor = $(getEditCell(detailGird,rowIndex,toText).target);
	     
	     priceEditor.numberbox({  
    	     onChange : function(n,o){
	    	    calculate();
    	     }
    	 });	    
	     amountEditor.numberbox({  
    	     onChange : function(n,o){
	    	    calculate();
    	     }
    	 });   
	     function calculate(){   
	         var cost = priceEditor.numberbox("getValue") * amountEditor.numberbox("getValue");   
	         costEditor.numberbox('setValue',cost);   
	     } 
	 }  

	function productAdd(){

		detailGird.edatagrid('acceptChanges');
		
		detailGird.edatagrid('addRow');
		
		//获取可编辑行
		var editIndex = detailGird.edatagrid('options').editIndex;	
		$(getEditCell(detailGird,editIndex,'unit').target).combobox('setValue', unitValue[0].id);
		detailGird.datagrid('getSelected').orderId = '${orderId}';
		detailGird.datagrid('getSelected').orderCode = '${orderCode}';
		detailGird.datagrid('getSelected').enabled = true;
		setEditing(detailGird,editIndex,"onePrice","number","allPrice");
		
		$(getEditCell(detailGird,editIndex,'productCode').target).combogrid({
		    width:180,
		    panelWidth: 440,
	     	panelHeight: 320,
	      	idField: 'code',
	      	textField: 'name',
	      	url: '<c:url value="/bus/product/search"/>',
	      	queryParams: {enabled: true},
	      	multiple: false,
	      	fitColumns: true,
	      	striped: true,
	        required:true,
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
	   	        {field: "style", hidden: true},
	   	        {field: "code", title: "产品编号", width: 40,align:'center'},
	   	        {field: "name", title: "产品名称", width: 140},
	   	        {field: "icon", title: "图片", width: 80, formatter: iconChange} 
	        ]],
	        loadMsg: "数据加载中请稍后……",
	        emptyMsg: "没有符合条件的记录",
		    onSelect: function(rowIndex, rowData) {
		    	detailGird.datagrid('getSelected').productName = rowData.name; 
		    	//detailGird.datagrid('getSelected').productCode = rowData.code; 
		    	var styleJsonArr = [];
		    	var styles = [];
		    	if(rowData.style!=null){
		    		styles = rowData.style.split(",");
		    		for (var i = 0; i < styles.length; i++) {
		    			styleJsonArr[i] = { name:styles[i] };
					}
		    	}		       	
		    	$(getEditCell(detailGird, editIndex, 'style').target).combobox({
		    		editable:true, 
		    		data: styleJsonArr,
		    		valueField:'name',
		    		textField:'name',
		    		panelHeight:"auto",
		    		onLoadSuccess:function(){
		    			if(styles.length>0){
		    				$(this).combobox("setValue",styles[0]);
		    			}
   		    		}
		    	});
		    	
			}
		});
		
        //$(".datagrid-row-editing td[field=number]").keyup(function(){
        //	var number = $(detailGird.edatagrid('getEditor', {index : editIndex,field : 'number'}).target);
		//});	       	
    }
	
	function productEdit(){
		
		var row = detailGird.datagrid('getSelected');
		if (row){
       		var editIndex = detailGird.datagrid('getRowIndex', row); 
       		detailGird.edatagrid('editRow', editIndex);
       		//$('#list-table').edatagrid('beginEdit', rowIndex);
       		//detailGird.edatagrid('selectRow', rowIndex);
       		
       		setEditing(detailGird,editIndex,"onePrice","number","allPrice");
       		
       		$(getEditCell(detailGird,editIndex,'productCode').target).combogrid({
    		    width:180,
    		    panelWidth: 440,
    	     	panelHeight: 320,
    	      	idField: 'code',
    	      	textField: 'name',
    	      	url: '<c:url value="/bus/product/search"/>',
    	      	queryParams: {enabled: true},
    	      	multiple: false,
    	      	fitColumns: true,
    	      	striped: true,
    	        required:true,
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
    	   	        {field: "style", hidden: true},
    	   	        {field: "code", title: "产品编号", width: 40,align:'center'},
    	   	        {field: "name", title: "产品名称", width: 140},
    	   	        {field: "icon", title: "图片", width: 80, formatter: iconChange} 
    	        ]],
    	        loadMsg: "数据加载中请稍后……",
    	        emptyMsg: "没有符合条件的记录",
    	        onLoadSuccess:function(){
    	        	$(this).combogrid("setValue",row.productCode);
	    		},
    		    onSelect: function(rowIndex, rowData) {
    		    	detailGird.datagrid('getSelected').productName = rowData.name; 
    		    	//detailGird.datagrid('getSelected').productCode = rowData.code; 
    		    	var styleJsonArr = []; 
    		    	var styles = [];
    		    	if(rowData.style!=null){
    		    		styles = rowData.style.split(",");
    		    		for (var i = 0; i < styles.length; i++) {
    		    			styleJsonArr[i] = { name:styles[i] };
    					}
    		    	}		       	
    		    	$(getEditCell(detailGird, editIndex, 'style').target).combobox({
    		    		editable:true, 
    		    		data: styleJsonArr,
    		    		valueField:'name',
    		    		textField:'name',
    		    		panelHeight:"auto",
    		    		onLoadSuccess:function(){
    		    		     if($.inArray(row.style, styles)>=0){
    		    		    	 $(this).combobox("setValue",row.style);
    		    		     }else{
    		    		    	 //$(this).combobox("clear");
    		    		    	 if(styles.length>0){
    		    		    		 $(this).combobox("setValue",styles[0]);
    		    		    	 }
    		    		     }
    		    		}
    		    	});
    		    	
    			}
    		});
       		
       		
        }else{
               $.messager.alert('提示','请选择要编辑的项目','info');
       	}
	}

	function saveProduct(){
		detailGird.edatagrid('acceptChanges');
	}
	
	//Del
	function delProduct() {

		var row = detailGird.datagrid('getSelections');
		if (row.length ==0) {
			$.messager.alert('消息', '请选择要删除的数据!','info');
			return ;
		}
		$.messager.confirm('Confirm','确定要删除选择的数据吗?', function(r) {
			if (r) {
				for(var i=0;i<row.length;i++){
					var index = detailGird.datagrid('getRowIndex', row[i]);
					if (row[i].isNewRecord){
						detailGird.datagrid('cancelEdit', index);
					} else {	
						$.post('<c:url value="/bus/orderDetail/delete"/>', {id:row[i].id}, function(result){
							if(result.success){
								detailGird.datagrid('reload');
								refreshSelectedRow(result.rows,'${currIndex}');	
							}
							result.rows = [];										
						},"json");				
					}
				}
			}		
		});
	}
	
	function refrash(){
         detailGird.edatagrid('reload');
	}
	

</script>