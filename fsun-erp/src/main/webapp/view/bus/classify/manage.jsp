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
<title>分类管理</title>
<link rel="stylesheet" href="<c:url value='/css/main.css'/>" />
</head>
<body>
	<div class="easyui-layout" fit="true" id='bt_productType_layout'>
		<div region="center" border="false">
			<table id="list-table" title="分类列表" toolbar="#toolbar"
				pagination="false" idField="id" fit="true" rownumbers="true"
				fitColumns="true" singleSelect="false" pageSize="20">
				<thead>
					<tr>
						<th data-options="field:'id',checkbox:true"></th>
						<th field="name" id="name" width="250" sortable="true"
							editor="{type:'validatebox',options:{required:true,validType:['uniqueValue','maxLength[30]']}}">分类名称</th>	
						<th field="unit" width="80" sortable="true" 
							editor="{type:'combobox',options:{required:true,data:unitValue,valueField:'id',textField:'text',panelHeight:'auto'}}">单位</th>
						<th field="description" id="description" width="460" editor="{type:'validatebox',options:{validType:'maxLength[36]'}}" sortable="true" >备注</th>
					</tr>
				</thead>
			</table>
		</div>
		<div region="east" border="false" style="width:600px;" collapsed="true" split='true' title="物料列表">	
			<table id="product-table" style="width: 100%;" >
			</table>		
		</div>
	</div>
	
	<div id="openProductDiv" class="easyui-window" title="选择物料"  closed="true" style="width:500px;height:400px;top:10px;" modal="true"> 
    	<table id="unAddProduct-table" fit="true">
            
    	</table>
	</div>
	
	<div id="openDisableProductTypeDiv" class="easyui-window" title="选择分类"  closed="true" style="width:500px;height:400px;top:10px;" modal="true"> 
    	<table id="disableProductType-table" fit="true">
            
    	</table>
	</div>
	
	<div id="toolbar">
		<div id="buttonbar">
			<sec:authorize  ifAllGranted="CLASSIFY_ADD">
				<a href="javascript:void(0)" class="easyui-linkbutton"	iconCls="icon-add" plain="true"	onclick="javascript:$('#list-table').edatagrid('addRow')">新增</a> 
			</sec:authorize>
			<sec:authorize  ifAllGranted="CLASSIFY_DELETE">
				<a	href="javascript:void(0)" class="easyui-linkbutton"	iconCls="icon-delete" plain="true" onclick="javascript:delProductType()">删除</a>
			</sec:authorize>
			<sec:authorize  ifAllGranted="CLASSIFY_COMMIT">
				<a href="javascript:void(0)" class="easyui-linkbutton"	iconCls="icon-save" plain="true"  onclick="javascript:$('#list-table').edatagrid('saveRow')">保存</a> 
			</sec:authorize>
			<sec:authorize  ifAllGranted="CLASSIFY_UPDATE">
				<a href="javascript:void(0)" class="easyui-linkbutton"	iconCls="icon-edit" plain="true"  onclick="javascript:typeEdit()">编辑</a> 
			</sec:authorize>
			<sec:authorize  ifAllGranted="CLASSIFY_CANCEL">
				<a	href="javascript:void(0)" class="easyui-linkbutton"	iconCls="icon-undo" plain="true"  onclick="javascript:$('#list-table').edatagrid('cancelRow')">取消</a>
			</sec:authorize>
			<sec:authorize  ifAllGranted="CLASSIFY_DISABLE">
				<a	href="javascript:void(0)" class="easyui-linkbutton"	iconCls="icon-close" plain="true" onclick="javascript:disableProductType()">禁用</a>
			</sec:authorize>
			<sec:authorize  ifAllGranted="CLASSIFY_ENABLE">
				<a	href="javascript:void(0)" class="easyui-linkbutton"	iconCls="icon-open" plain="true" onclick="javascript:editProductType()">选择启用分类</a>
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
			uniqueValue : {
				validator : function(value) {				
				    var success = false;	
					$.ajax({
			            type: "post",
			            dataType: "json",
			            async:false,
			            url: '<c:url value="/bus/classify/uniqueName"/>',
			            data: { 'name':value,'id':curProductTypeId },
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
		    integer: {// 验证整数 可正负数
		        validator: function (value) {
		            //return /^[+]?[1-9]+\d*$/i.test(value);

		            return /^([+]?[0-9])|([-]?[0-9])+\d*$/i.test(value);
		        },
		        message: '请输入整数'
		    }                
		});
	
        $(function(){        	
            
            $('#list-table').edatagrid({  
            	loadMsg:'加载中，请稍等。。。',
                url: '<c:url value="/bus/classify/search"/>',  
                saveUrl: '<c:url value="/bus/classify/save"/>',  
                updateUrl: '<c:url value="/bus/classify/save"/>',
                destroyUrl: '<c:url value="/bus/classify/delete"/>',
                onDblClickRow : function(rowIndex, rowData) {
                	$(this).edatagrid('clearSelections');
                	$(this).edatagrid('selectRow',rowIndex);
                	openProductWin(rowData);	
                },
                onBeforeLoad: function(param){
                   $(this).edatagrid('clearSelections');	    
			       var $layout = $('#bt_productType_layout');
				   var east = $layout.layout('panel', 'east');
				   if (!east.panel('options').collapsed) {
					   $layout.layout('collapse', 'east');
				   } 
 				},  
                onSave: function(index,row){
                	$(this).edatagrid('clearSelections');
                	$(this).edatagrid('reload'); 
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
        		var ed = $('#list-table').edatagrid('getEditor', { index: rowIndex, field: 'name' });
            	$(ed.target).attr("disabled", true);
            }else{
            	$('#list-table').datagrid('reload');
            	$('#list-table').datagrid('clearSelections');
                $.messager.alert('提示','请选择一个要编辑的项','info');              
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
			                url: '<c:url value="/bus/classify/delete"/>',
			                data: {"id":ids},
			                success: function(returnData) {
			                	if (returnData.success){ 
									$('#list-table').datagrid('reload');
									$('#list-table').datagrid('clearSelections');
								} else {  
								    $.messager.show({ title: 'Error', msg : returnData.message }); 
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
		
			$('#bt_productType_layout').layout('panel', 'east').panel({ title: '分类(<a><font color="#FF0000">'+ data.name +'</font></a>)下的物料详情'});		 			
			var $layout = $('#bt_productType_layout');
			var east = $layout.layout('panel', 'east');
			if (east.panel('options').collapsed) {
				$layout.layout('expand', 'east');
			}					
			
			//初始化物料分类
			$('#product-table').edatagrid({
				loadMsg:'加载中，请稍等。。。',
				url: '<c:url value="/bus/materiel/classify/getMateriels?id='+ data.id +'"/>',
				dataType: "json",
            	idField: 'id',
            	rownumbers: true, //显示行号
            	pageSize: 20,
            	fit: true,
            	pagination: true,
            	singleSelect:false,
            	//toolbar : [ 
   		        //    <sec:authorize  ifAllGranted="MATERIEL_IN">{text: '添加物料',iconCls: 'icon-add',handler: addProduct},</sec:authorize>
   		        // 	<sec:authorize  ifAllGranted="MATERIEL_OUT">{text: '去除物料',iconCls: 'icon-delete',handler: removeProduct}</sec:authorize>    
            	//],
            	columns:[[
					{field:'id',checkbox:true},
					{field:'name',title:'物料名称',width:240},
					{field:'format',title:'规格',width:80},
					{field:'price',title:'参考单价(元)',width:80},
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
		        	url: '<c:url value="/bus/materiel/classify/getUnAddedMateries?id='+row.id+'"/>',
		        	dataType: "json",
		        	frozenColumns: [[{ field: 'id', checkbox: true}]],//固定字段
		        	idField: 'id', //标识字段
		        	//sortName: 'id', //排序字段
		        	rownumbers: true, //显示行号
		        	fit: true,
		        	singleSelect:false,
		        	columns:[[
						{field:'name',title: '物料名称',width:"183"},
						{field:'format',title: '规格',width:"100"},
						{field:'price',title: '参考单价(元)',width:"100"}
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
				                url: '<c:url value="/bus/materiel/classify/removeMateriel"/>',
				                data: {"classifyId":productType[0].id,"materielId":productIds},
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
					$.messager.alert('消息', '请选择至少一条要删除的物料数据!','info');
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
	        	url: "<c:url value='/bus/materiel/classify/addMateriels'/>",
	        	data: {'classifyId':productType.id,'materielId':productIds.length!=0?productIds.join(','):''},
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
			                url: '<c:url value="/bus/classify/disable"/>',
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
	        	url: '<c:url value="/bus/classify/getDisableClassify"/>',
	        	dataType: "json",
	        	frozenColumns: [[{ field: 'id', checkbox: true}]],//固定字段
	        	idField: 'id', //标识字段
	        	//sortName: 'id', //排序字段
	        	rownumbers: true, //显示行号
	        	fit: true,
	        	singleSelect:false,
	        	columns:[[
					{field:'name',title: '分类名称',width:"183"},
					{field:'unit',title: '单位',width:"80"},
					{field:'description',title: '备注',width:"153"}
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
	        	url: "<c:url value='/bus/classify/enable'/>",
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