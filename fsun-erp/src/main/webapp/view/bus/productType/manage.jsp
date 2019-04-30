<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<%@include file="/view/role_resource.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>产品类型管理</title>
<link rel="stylesheet" href="<c:url value='/css/main.css'/>" />
</head>
<body>
	<div class="easyui-layout" fit="true" id='bt_productType_layout'>
		<div region="center" border="false">
			<table id="list-table" title="产品类型列表" toolbar="#toolbar"
				pagination="true" idField="id" fit="true" rownumbers="true"
				fitColumns="false" singleSelect="true" pageSize="20">
				<thead>
					<tr>
						<th data-options="field:'id',checkbox:true"></th>
						<th field="typeName" id="typeName" width="350" sortable="true"
							editor="{type:'validatebox',options:{required:true,validType:['uniqueValue','maxLength[20]']}}">分类名称</th>	
						<th field="unit" width="80" sortable="true" 
							editor="{type:'combobox',options:{required:true,data:unitValue,valueField:'id',textField:'text',panelHeight:'auto'}}">单位</th>
						<th field="description" id="description" width="360" editor="{type:'validatebox',options:{validType:'maxLength[36]'}}" sortable="true" >备注</th>
					</tr>
				</thead>
			</table>
		</div>
		<div region="east" border="false" style="width:600px;" collapsed="true" split='true' title="产品列表">	
			<table id="product-table" style="width: 100%;" >
			</table>		
		</div>
	</div>
	
	<div id="openProductDiv" class="easyui-window" title="选择产品"  closed="true" style="width:500px;height:400px;top:10px;" modal="true"> 
    	<table id="unAddProduct-table" fit="true">
            
    	</table>
	</div>
	
	<div id="openDisableProductTypeDiv" class="easyui-window" title="选择产品分类"  closed="true" style="width:500px;height:400px;top:10px;" modal="true"> 
    	<table id="disableProductType-table" fit="true">
            
    	</table>
	</div>
	
	<div id="toolbar">
		<div id="buttonbar">
			<sec:authorize  ifAllGranted="PRODUCTTYPE_ADD">
				<a href="javascript:void(0)" class="easyui-linkbutton"	iconCls="icon-add" plain="true"	onclick="javascript:$('#list-table').edatagrid('addRow')">新增</a> 
			</sec:authorize>
			<sec:authorize  ifAllGranted="PRODUCTTYPE_DELETE">
				<a	href="javascript:void(0)" class="easyui-linkbutton"	iconCls="icon-delete" plain="true" onclick="javascript:delProductType()">删除</a>
			</sec:authorize>
			<sec:authorize  ifAllGranted="PRODUCTTYPE_UPDATE">
				<a href="javascript:void(0)" class="easyui-linkbutton"	iconCls="icon-save" plain="true"  onclick="javascript:$('#list-table').edatagrid('saveRow')">保存</a> 
			</sec:authorize>
			<sec:authorize  ifAllGranted="PRODUCTTYPE_SAVE">
				<a href="javascript:void(0)" class="easyui-linkbutton"	iconCls="icon-edit" plain="true"  onclick="javascript:typeEdit()">编辑</a> 
			</sec:authorize>
			<sec:authorize  ifAllGranted="PRODUCTTYPE_CANCEL">
				<a	href="javascript:void(0)" class="easyui-linkbutton"	iconCls="icon-undo" plain="true"  onclick="javascript:$('#list-table').edatagrid('cancelRow')">取消</a>
			</sec:authorize>
			<sec:authorize  ifAllGranted="PRODUCTTYPE_DISABLE">
				<a	href="javascript:void(0)" class="easyui-linkbutton"	iconCls="icon-close" plain="true" onclick="javascript:disableProductType()">禁用</a>
			</sec:authorize>
			<sec:authorize  ifAllGranted="PRODUCTTYPE_ENABLE">
				<a	href="javascript:void(0)" class="easyui-linkbutton"	iconCls="icon-open" plain="true" onclick="javascript:editProductType()">选择启用产品分类</a>
			</sec:authorize>
		</div>
	</div>
	
	<script type="text/javascript">

		var curProductTypeId ='';

		$.extend($.fn.validatebox.defaults.rules, { 
			
			maxLength : { // 判断最大长度
				validator : function(value, param) {
					return value.length <= param[0];
				},
				message : '最多只能输入 {0} 个字(包括空格、标点符号)。'
			},
			idcard : {// 验证身份证
				validator : function(value) {
					return /^\d{15}(\d{2}[A-Za-z0-9])?$/i.test(value);
				},
				message : '身份证号码格式不正确'
			}, 
			uniqueValue : {
				validator : function(value) {				
				    var success = false;	
					$.ajax({
			            type: "post",
			            dataType: "json",
			            async:false,
			            url: '<c:url value="/bus/productType/uniqueName"/>',
			            data: { 'typeName':value,'id':curProductTypeId },
			            success: function(result) {
			            	success = result.success;
			            }
			        });
			        return success;
					
				},
				message : '该名称已经存在,请换一个！'
			},
			intOrFloat: {// 验证整数或小数
		        validator: function (value) {
		            return /^\d+(\.\d+)?$/i.test(value);
		        },
		        message: '请输入数字，并确保格式正确'
		    },
		    date: {// 验证姓名，可以是中文或英文
		        validator: function (value) {
		            //格式yyyy-MM-dd或yyyy-M-d
		            return /^(?:(?!0000)[0-9]{4}([-]?)(?:(?:0?[1-9]|1[0-2])\1(?:0?[1-9]|1[0-9]|2[0-8])|(?:0?[13-9]|1[0-2])\1(?:29|30)|(?:0?[13578]|1[02])\1(?:31))|(?:[0-9]{2}(?:0[48]|[2468][048]|[13579][26])|(?:0[48]|[2468][048]|[13579][26])00)([-]?)0?2\2(?:29))$/i.test(value);
		        },
		        message: '清输入合适的日期格式'
		    },
		    integer: {// 验证整数 可正负数
		        validator: function (value) {
		            //return /^[+]?[1-9]+\d*$/i.test(value);

		            return /^([+]?[0-9])|([-]?[0-9])+\d*$/i.test(value);
		        },
		        message: '请输入整数'
		    },
			fingerprintId : {// 指纹序列号
				validator : function(value) {
					return /^[1-9]\d{6}$/i.test(value);
				},
				message : '身份证号码格式不正确'
			}                  
		});
	
        $(function(){        	
            
            $('#list-table').edatagrid({  
            	loadMsg:'加载中，请稍等。。。',
                url: '<c:url value="/bus/productType/search"/>',  
                saveUrl: '<c:url value="/bus/productType/save"/>',  
                updateUrl: '<c:url value="/bus/productType/save"/>',
                destroyUrl: '<c:url value="/bus/productType/delete"/>',
                onDblClickRow : function(rowIndex, rowData) {
                	openProductWin(rowData);
                },
                onBeforeLoad: function(param){
 				   $('#list-table').edatagrid('clearSelections');	    
			       var $layout = $('#bt_productType_layout');
				   var east = $layout.layout('panel', 'east');
				   if (!east.panel('options').collapsed) {
					   $layout.layout('collapse', 'east');
				   } 
 				},  
                onSave: function(index,row){
                	$('#list-table').edatagrid('clearSelections');
                	$('#list-table').edatagrid('reload'); 
                }
			});
		});   

        //edit
        function typeEdit(){

			var rows = $('#list-table').datagrid('getSelections');
			if (rows.length == 1) {
				curProductTypeId = rows[0].id;
        		var rowIndex = $('#list-table').edatagrid('getRowIndex', rows[0]); 
        		$('#list-table').edatagrid('editRow', rowIndex);        		
        		var ed = $('#list-table').edatagrid('getEditor', { index: rowIndex, field: 'typeName' });
            	$(ed.target).attr("disabled", true);
            }else{
            	$('#list-table').datagrid('reload');
            	$('#list-table').datagrid('clearSelections');
                $.messager.alert('提示','请选择一个要编辑的项目','info');              
        	}
		}    	
		
      	//Del
		function delProductType() {
			var rows = $('#list-table').datagrid('getSelections');
			if (rows.length > 0) {
			    var ids = '';
				for ( var i = 0; i < rows.length; i++) {
							ids += rows[i].id + ',';
				}
				ids = ids.substring(0, ids.length - 1);
				$.messager.confirm('Confirm','确定要删除选择的数据吗?', function(r) {
					if (r) {
						$.ajax({
			                type: "post",
			                dataType: "json",
			                url: '<c:url value="/bus/productType/delete"/>',
			                data: {"id":ids},
			                success: function(returnData) {
			                	if (returnData.success){ 
									$('#list-table').datagrid('reload');
									$('#list-table').datagrid('clearSelections');
								} else {  
								    $.messager.show({ title: 'Error', msg : "删除失败" }); 
								} 
			                }
			            });
					}
				});
			} else {
				$.messager.alert('消息', '请选择要删除的数据!','info');
			}
		}

		function openProductWin(data){
		
			$('#bt_productType_layout').layout('panel', 'east').panel({ title: '分类'+ data.typeName +'下的产品详情'});		 			
			var $layout = $('#bt_productType_layout');
			var east = $layout.layout('panel', 'east');
			if (east.panel('options').collapsed) {
				$layout.layout('expand', 'east');
			}					
			
			//初始化产品分类
			$('#product-table').edatagrid({
				loadMsg:'加载中，请稍等。。。',
				url: '<c:url value="/bus/product/productType/getProducts?id='+ data.id +'"/>',
				dataType: "json",
            	idField: 'id',
            	rownumbers: true, //显示行号
            	pageSize: 20,
            	fit: true,
            	pagination: true,
            	singleSelect:false,
            	toolbar : [ 
   		            <sec:authorize  ifAllGranted="PRODUCT_IN">{text: '添加产品',iconCls: 'icon-add',handler: addProduct},</sec:authorize>
   		         	<sec:authorize  ifAllGranted="PRODUCT_OUT">{text: '去除产品',iconCls: 'icon-delete',handler: removeProduct}</sec:authorize>    
            	],
            	columns:[[
					{field:'id',checkbox:true},
					{field:'name',title:'产品名称',width:280},
					{field:'format',title:'规格',width:60},
					{field:'price',title:'单价(元)',width:60},
					{field:'description',title:'备注',width:130}					
            	]],
            	onBeforeLoad: function(param){
				   $('#product-table').edatagrid('clearSelections');	    
				}
            }); 
		}

		function addProduct(){
			var row = $('#list-table').edatagrid('getSelected');
			if(row == null){
				$.messager.alert('提示', '请选择一项分类进行选择!', 'info');
			}else{
				$('#unAddProduct-table').edatagrid({
					loadMsg:'加载中，请稍等。。。',
		        	url: '<c:url value="/bus/product/productType/getUnAddedProducts?id='+row.id+'"/>',
		        	dataType: "json",
		        	frozenColumns: [[{ field: 'id', checkbox: true}]],//固定字段
		        	idField: 'id', //标识字段
		        	//sortName: 'id', //排序字段
		        	rownumbers: true, //显示行号
		        	fit: true,
		        	singleSelect:false,
		        	columns:[[
						{field:'name',title: '产品名称',width:"113"},
						{field:'format',title: '规格',width:"113"},
						{field:'price',title: '单价(元)',width:"113"}
		        	]],
		        	toolbar: [{
		        		text: '确定',
		        		iconCls: 'icon-save',
		        		handler:function(){
		        			authorizationProduct();
		        		}
		        	},{
		    			text: '取消',
		    			iconCls:"icon-undo",
		    			handler:function(){
		    				closeWin('openProductDiv');
		        		}
		    		}],
		        	onSelect : function(rowIndex, rowData) {
		        		var types=$('#unAddProduct-table').edatagrid('getSelections');
		        		var parm=[];
		        		for(var i=0;i<types.length;i++){
		        			parm.push(types[i].id);
		        		}
		        	}
		        });  
	        	$('#openProductDiv').window('open');
			}
		}

		//Del
		function removeProduct() {
			var productType = $('#list-table').datagrid('getSelections');
			var product = $('#product-table').datagrid('getSelections');
			if(productType.length ==1){
				if (product.length > 0) {	
					var productIds = '';
					for ( var i = 0; i < product.length; i++) {
						productIds += product[i].id + ',';
					}
					productIds = productIds.substring(0, productIds.length - 1);			   
					$.messager.confirm('Confirm','确定要删除选择的数据吗?', function(r) {
						if (r) {
							$.ajax({
				                type: "post",
				                dataType: "json",
				                url: '<c:url value="/bus/product/productType/removeProduct"/>',
				                data: {"productTypeId":productType[0].id,"productId":productIds},
				                success: function(returnData) {
				                	if(returnData.success){
					                	$.messager.show({ title: '提示信息', msg : "删除成功!" });
					                	$('#product-table').datagrid('clearSelections'); 
					                	$('#product-table').datagrid('reload');
										
				                	}else{
					                	$.messager.show({ title: '提示信息', msg : '删除失败!' });
						            }		                	
				                }
				            });
						}
					});
				} else {
					$.messager.alert('消息', '请选择至少一条要删除的产品数据!','info');
				}
			}else{
				$.messager.alert('消息', '需要先选中一个分类!','info');
			}
			
		}

		function authorizationProduct(){
			var productType = $('#list-table').edatagrid('getSelected');
	    	var products = $('#unAddProduct-table').datagrid('getChecked');
	        var productIds =new Array();    
			for(var i=0;i<products.length;i++){
				var product = products[i];
				productIds.push(product.id);
			}
			$.ajax({
				type: "post",
	    	    dataType: "json",
	        	url: "<c:url value='/bus/product/productType/typeToProduct'/>",
	        	data: {'productTypeId':productType.id,'productId':productIds.length!=0?productIds.join(','):''},
	       		success: function(data) {
	       			closeWin('openProductDiv');
					if(data.success){
			        	$.messager.alert('提示','保存成功','info');
			        	$('#unAddProduct-table').edatagrid('clearSelections');
			        	$('#product-table').edatagrid('reload');
			        }else{
			        	$.messager.alert('提示','保存失败','info');		        	
					}
		        	
	        	}
	    	});
		}

		function disableProductType(){
			var rows = $('#list-table').datagrid('getSelections');
			if (rows.length > 0) {
			    var ids = '';
				for ( var i = 0; i < rows.length; i++) {
					ids += rows[i].id + ',';
				}
				ids = ids.substring(0, ids.length - 1);
				$.messager.confirm('Confirm','确定要禁用选择的数据吗?', function(r) {
					if (r) {
						$.ajax({
			                type: "post",
			                dataType: "json",
			                url: '<c:url value="/bus/productType/disable"/>',
			                data: {"id":ids},
			                success: function(returnData) {
			                	if (returnData.success){ 
									$('#list-table').datagrid('reload');
									$('#list-table').datagrid('clearSelections');
								} else {  
								    $.messager.show({ title: 'Error', msg : "禁用失败" }); 
								} 
			                }
			            });
					}
				});
			} else {
				$.messager.alert('消息', '请选择要禁用的数据!','info');
			}
		}


		function editProductType(){
			$('#disableProductType-table').edatagrid({
				loadMsg:'加载中，请稍等。。。',
	        	url: '<c:url value="/bus/productType/getDisableProductType"/>',
	        	dataType: "json",
	        	frozenColumns: [[{ field: 'id', checkbox: true}]],//固定字段
	        	idField: 'id', //标识字段
	        	//sortName: 'id', //排序字段
	        	rownumbers: true, //显示行号
	        	fit: true,
	        	singleSelect:false,
	        	columns:[[
					{field:'typeName',title: '分类名称',width:"113"},
					{field:'description',title: '备注',width:"113"}
	        	]],
	        	toolbar: [{
	        		text: '启用',
	        		iconCls: 'icon-save',
	        		handler:function(){
	        			enableProductType();
	        		}
	        	},{
	    			text: '取消',
	    			iconCls:"icon-undo",
	    			handler:function(){
	    				closeWin('openDisableProductTypeDiv');
	        		}
	    		}],
	        	onSelect : function(rowIndex, rowData) {
	        		var types=$('#disableProductType-table').edatagrid('getSelections');
	        		var parm=[];
	        		for(var i=0;i<types.length;i++){
	        			parm.push(types[i].id);
	        		}
	        	}
	        });  
        	$('#openDisableProductTypeDiv').window('open');
		}

		function enableProductType(){
			var products = $('#disableProductType-table').datagrid('getChecked');
	        var productIds =new Array();    
			for(var i=0;i<products.length;i++){
				var product = products[i];
				productIds.push(product.id);
			}
			$.ajax({
				type: "post",
	    	    dataType: "json",
	        	url: "<c:url value='/bus/productType/enable'/>",
	        	data: {'id':productIds.length!=0?productIds.join(','):''},
	       		success: function(data) {
	       			closeWin('openDisableProductTypeDiv');
					if(data.success){
			        	$.messager.alert('提示','启用成功','info');
			        	$('#disableProductType-table').edatagrid('clearSelections');
			        	$('#list-table').edatagrid('reload');
			        }else{
			        	$.messager.alert('提示','启用失败','info');		        	
					}
		        	
	        	}
	    	});
		}

		//close windows
		function closeWin(obj){
			$('#'+obj).window('close');
		}			
	</script>
</body>
</html>