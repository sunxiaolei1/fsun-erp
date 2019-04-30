<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/view/base_resource.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>仓库管理</title>
<script type="text/javascript"
	src="<c:url value='/js/jquery-easyui/jquery.edatagrid.js'/>"></script>
</head>
<body>
		<!-- DataList  -->
			<table id="list-table" title="仓库管理" toolbar="#toolbar" style="display:none;"
				pagination="false" idField="id" fit="true" rownumbers="true"
				fitColumns="true" singleSelect="false" data-options="nowrap:false" >
				<thead>
					<tr>
						<th data-options="field:'id',checkbox:true"></th>
						<th field="name" width="120" sortable="true"
							editor="{type:'validatebox',options:{required:true}}">仓库名称</th>
						<th field="address" width="200" sortable="true"
							editor="{type:'validatebox',options:{required:false}}">地址</th>
						<th field="contacts" width="200" sortable="true"
							editor="{type:'validatebox',options:{required:false}}">联系人</th>
						<th field="status" width="80" sortable="true">状态</th>
					    <th field="description" width="200" sortable="true" 
					    	editor="{type:'validatebox',options:{required:false}}">描述</th>										    
					</tr>
				</thead>
			</table>
	
	<div id="toolbar" style="display:none;">
		<div id="buttonbar">
			<sec:authorize  ifAllGranted="STORE_ADD">
			<a href="javascript:void(0)" class="easyui-linkbutton"	iconCls="icon-add" plain="true"	onclick="javascript:$('#list-table').edatagrid('addRow')">新增</a> 
			</sec:authorize>
			<sec:authorize  ifAllGranted="STORE_DELETE">
			<a	href="javascript:void(0)" class="easyui-linkbutton"	iconCls="icon-delete" plain="true" onclick="javascript:delStore()">删除</a>
			</sec:authorize>
			<sec:authorize  ifAllGranted="STORE_DISABLE">
			<a	href="javascript:void(0)" class="easyui-linkbutton"	iconCls="icon-close" plain="true" onclick="javascript:disableStore()">禁用</a>
			</sec:authorize>
			<sec:authorize  ifAllGranted="STORE_ENABLE">
			<a	href="javascript:void(0)" class="easyui-linkbutton"	iconCls="icon-open" plain="true" onclick="javascript:enableStore()">启用</a>
			</sec:authorize>
			<sec:authorize  ifAllGranted="STORE_UPDATE">
			<a href="javascript:void(0)" class="easyui-linkbutton"	iconCls="icon-save" plain="true"  onclick="javascript:$('#list-table').edatagrid('saveRow')">保存</a> 
			</sec:authorize>
			<sec:authorize  ifAllGranted="STORE_CANCEL">
			<a	href="javascript:void(0)" class="easyui-linkbutton"	iconCls="icon-undo" plain="true"  onclick="javascript:$('#list-table').edatagrid('cancelRow')">取消</a>
			</sec:authorize>
		</div>
	</div>
	<script type="text/javascript">
	
        $(function(){  
            $("#list-table").show();
            $("#toolbar").show();
            
            $('#list-table').edatagrid({ 
            	loadMsg:'加载中，请稍等。。。',	 
                url: '<c:url value="/bus/store/list"/>',  
                saveUrl: '<c:url value="/bus/store/save"/>',  
                updateUrl: '<c:url value="/bus/store/save"/>',
                destroyUrl: '<c:url value="/bus/store/delete"/>',
                onBeforeLoad: function(param){
				   $('#list-table').datagrid('clearSelections');	    
				},
                onSave: function(index,row){
					$('#list-table').datagrid('clearSelections');
                	$('#list-table').datagrid('reload'); 
                }
			});
		});
	    
        //Del
		function delStore() {
			var rows = $('#list-table').datagrid('getSelections');
			if (rows.length > 0) {
			    var ids = '';
			    var names = '';
				for ( var i = 0; i < rows.length; i++) {
						ids += rows[i].id + ',';
						names += rows[i].name + ',';
				}
				ids = ids.substring(0, ids.length - 1);
				names = names.substring(0, names.length - 1);
				$.messager.confirm('Confirm','确定要删除选择的仓库吗?', function(r) {
					if (r) {
						$.ajax({
			                type: "post",
			                dataType: "json",
			                url: '<c:url value="/bus/store/delete"/>',
			                data: {"id":ids,'names':names},
			                success: function(returnData) {
			                	if (returnData.success){ 
									$('#list-table').datagrid('reload');									
								} else {  
								    $.messager.show({ title: 'Error', msg : "删除失败" }); 
								} 
			                }
			            });
					}
				});
			} else {
				$.messager.alert('消息', '请选择要删除的仓库!','info');
			}
		}

		
		function disableStore() {
			var rows = $('#list-table').datagrid('getSelections');
			if (rows.length > 0) {
			    var ids = '';
			    var names = '';
				for ( var i = 0; i < rows.length; i++) {
						ids += rows[i].id + ',';
						names += rows[i].name + ',';
				}
				ids = ids.substring(0, ids.length - 1);
				names = names.substring(0, names.length - 1);
				$.messager.confirm('Confirm','确定要禁用选择的仓库吗?', function(r) {
					if (r) {
						$.ajax({
			                type: "post",
			                dataType: "json",
			                url: '<c:url value="/bus/store/disable"/>',
			                data: {"id":ids,'names':names},
			                success: function(returnData) {
			                	if (returnData.success){ 
									$('#list-table').datagrid('reload');									
								} else {  
								    $.messager.show({ title: 'Error', msg : "禁用失败" }); 
								} 
			                }
			            });
					}
				});
			} else {
				$.messager.alert('消息', '请选择要禁用的仓库!','info');
			}
		}

		function enableStore() {
			var rows = $('#list-table').datagrid('getSelections');
			if (rows.length > 0) {
			    var ids = '';
			    var names = '';
				for ( var i = 0; i < rows.length; i++) {
						ids += rows[i].id + ',';
						names += rows[i].name + ',';
				}
				ids = ids.substring(0, ids.length - 1);
				names = names.substring(0, names.length - 1);
				$.messager.confirm('Confirm','确定要启用选择的仓库吗?', function(r) {
					if (r) {
						$.ajax({
			                type: "post",
			                dataType: "json",
			                url: '<c:url value="/bus/store/enable"/>',
			                data: {"id":ids,'names':names},
			                success: function(returnData) {
			                	if (returnData.success){ 
									$('#list-table').datagrid('reload');									
								} else {  
								    $.messager.show({ title: 'Error', msg : "启用失败" }); 
								} 
			                }
			            });
					}
				});
			} else {
				$.messager.alert('消息', '请选择要启用的仓库!','info');
			}
		}
		
	</script>
</body>
</html>