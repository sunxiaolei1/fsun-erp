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
<title>物料管理</title>
</head>
<body>
	<div class="easyui-layout" fit="true">
		<!-- DataList  -->
		<div region="center" border="false">
			<table id="list-table" title="物料列表" toolbar="#toolbar" data-options="nowrap:false"
				pagination="true" idField="id" fit="true" rownumbers="true"
				fitColumns="true" singleSelect="false" pageSize="20">
				<thead>
					<tr>
						<th data-options="field:'id',checkbox:true"></th>
						<th field="name" width="360" sortable="true" id ='name'
							editor="{type:'validatebox',options:{required:true,validType:['uniqueValue','maxLength[36]']}}">物料名称</th>	
   				 		<th field="classifyId" width="180" formatter="getClassifyName" sortable="true" id ='classifyId'
							editor="{type:'combobox',options:{
							    editable:false,
							    url:'<c:url value="/bus/classify/list"/>',
							    valueField:'id',
							    textField:'name',
							    panelHeight:'auto'
							 }}">物料分类</th>	
						<th field="spec" width="150" sortable="true" editor="text">规格型号</th>
						<th field="price" width="100" sortable="true" id ='price'
							editor="{type:'validatebox',options:{validType:'intOrFloat'}}">参考单价(元)</th>
						<th field="description" width="270" editor="{type:'validatebox',options:{validType:'maxLength[36]'}}" sortable="true" >备注</th>
					</tr>
				</thead>
			</table>
		</div>
	</div>
	
	<div id="openDisableProductDiv" class="easyui-window" title="选择物料"  closed="true" style="width:500px;height:400px;top:10px;" modal="true"> 
    	<table id="disableProduct-table" fit="true">
            
    	</table>
	</div>
	
	<%@include file="operate/toolbar.jsp"%> 
	<!--  
	<div id="toolbar">
		<div id="buttonbar">
			<sec:authorize  ifAllGranted="MATERIEL_ADD">
				<a href="javascript:void(0)" class="easyui-linkbutton"	iconCls="icon-add" plain="true"	onclick="javascript:$('#list-table').edatagrid('addRow')">新增</a> 
			</sec:authorize>
			<sec:authorize  ifAllGranted="MATERIEL_EDIT">
				<a href="javascript:void(0)" class="easyui-linkbutton"	iconCls="icon-edit" plain="true"  onclick="javascript:productEdit()">编辑</a> 
			</sec:authorize>
			<sec:authorize  ifAllGranted="MATERIEL_DELETE">
				<a	href="javascript:void(0)" class="easyui-linkbutton"	iconCls="icon-delete" plain="true" onclick="javascript:delProduct()">删除</a>
			</sec:authorize>
			<sec:authorize  ifAllGranted="MATERIEL_DISABLE">
				<a	href="javascript:void(0)" class="easyui-linkbutton"	iconCls="icon-close" plain="true" onclick="javascript:disableProduct()">禁用</a>
			</sec:authorize>
			<sec:authorize  ifAllGranted="MATERIEL_ENABLE">
				<a	href="javascript:void(0)" class="easyui-linkbutton"	iconCls="icon-open" plain="true" onclick="javascript:editProduct()">选择启用物料</a>
			</sec:authorize>
			<sec:authorize  ifAllGranted="MATERIEL_COMMIT">
				<a href="javascript:void(0)" class="easyui-linkbutton"	iconCls="icon-save" plain="true"  onclick="javascript:$('#list-table').edatagrid('saveRow')">保存</a> 
			</sec:authorize>
			<sec:authorize  ifAllGranted="MATERIEL_CANCEL">
				<a	href="javascript:void(0)" class="easyui-linkbutton"	iconCls="icon-undo" plain="true"  onclick="javascript:$('#list-table').edatagrid('cancelRow')">取消</a>
			</sec:authorize>
		</div>
	</div>
	-->
	
	<script type="text/javascript">

	var curProductId ='';
	
	var getClassifyName = function(value,row,index){
		if(value){
			return row.classifyName;
		}else {
			return "";
		}
	};

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
		            url: '<c:url value="/bus/materiel/uniqueName"/>',
		            data: { 'name':value,'id':curProductId },
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
		}              
	});

        $(function(){  

            $('#list-table').edatagrid({
            	loadMsg:'加载中，请稍等。。。',  
                url: '<c:url value="/bus/materiel/search"/>',  
                saveUrl: '<c:url value="/bus/materiel/save"/>',  
                updateUrl: '<c:url value="/bus/materiel/save"/>',
                destroyUrl: '<c:url value="/bus/materiel/delete"/>',
                onDblClickRow : function(rowIndex, rowData) {
                	$(this).edatagrid('clearSelections');
                	$(this).edatagrid('selectRow',rowIndex);
                },
                onSave: function(index,row){
                	$(this).edatagrid('clearSelections');
                	$(this).edatagrid('reload'); 
                },onBeforeLoad: function(param){
                	$(this).edatagrid('clearSelections');	    
 				}
			});
		});       	

        //edit
        function productEdit(){
        	var rows = $('#list-table').datagrid('getSelections');
			if (rows.length == 1) {
				curProductId = rows[0].id;
        		var rowIndex = $('#list-table').edatagrid('getRowIndex', rows[0]); 
        		$('#list-table').edatagrid('editRow', rowIndex);        		
        		var ed = $('#list-table').edatagrid('getEditor', { index: rowIndex, field: 'name' });
            	//$(ed.target).attr("required", false);
            	$(ed.target).attr("disabled", true);
            }else{
            	$('#list-table').datagrid('reload');
            	$('#list-table').datagrid('clearSelections');
                $.messager.alert('提示','请选择一个要编辑的项','info');              
        	}
		}  
	
      	//Del
		function delProduct() {
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
			                url: '<c:url value="/bus/materiel/delete"/>',
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

		function disableProduct(){
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
			                url: '<c:url value="/bus/materiel/disable"/>',
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


		function editProduct(){
			$('#disableProduct-table').edatagrid({
				loadMsg:'加载中，请稍等。。。',
	        	url: '<c:url value="/bus/materiel/getDisableMateriel"/>',
	        	dataType: "json",
	        	frozenColumns: [[{ field: 'id', checkbox: true}]],//固定字段
	        	idField: 'id', //标识字段
	        	//sortName: 'id', //排序字段
	        	rownumbers: true, //显示行号
	        	fit: true,
	        	singleSelect:false,
	        	columns:[[
					{field:'name',title: '物料名称',width:"113"},
					{field:'spec',title: '规格',width:"113"},
					{field:'price',title: '参考单价(元)',width:"113"}
	        	]],
	        	toolbar: [{
	        		text: '启用',
	        		iconCls: 'icon-save',
	        		handler:function(){
	        			enableProduct();
	        		}
	        	},{
	    			text: '取消',
	    			iconCls:"icon-undo",
	    			handler:function(){
	    				closeWin('openDisableProductDiv');
	        		}
	    		}],
	        	onSelect : function(rowIndex, rowData) {
	        		var types=$('#disableProduct-table').edatagrid('getSelections');
	        		var parm=[];
	        		for(var i=0;i<types.length;i++){
	        			parm.push(types[i].id);
	        		}
	        	}
	        });  
        	$('#openDisableProductDiv').window('open');
		}

		function enableProduct(){
			var products = $('#disableProduct-table').datagrid('getChecked');
	        var productIds =new Array();    
			for(var i=0;i<products.length;i++){
				var product = products[i];
				productIds.push(product.id);
			}
			$.ajax({
				type: "post",
	    	    dataType: "json",
	        	url: "<c:url value='/bus/materiel/enable'/>",
	        	data: {'id':productIds.length!=0?productIds.join(','):''},
	       		success: function(data) {
	       			closeWin('openDisableProductDiv');
					if(data.success){
			        	$.messager.alert('提示','启用成功','info');
			        	$('#disableProduct-table').edatagrid('clearSelections');
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