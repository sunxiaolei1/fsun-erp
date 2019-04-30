<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/view/resource.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">

#left {
	width: 236px;
	height: 100%;
	float:left;
}

#right {
	width: 350px;
	height: 100%;
	float:left;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>角色管理</title>
</head>
<body>
	<table id="list-table" title="角色管理" toolbar="#toolbar"
		pagination="true" idField="id" fit="true" rownumbers="true"
		fitColumns="true" singleSelect="false">
		<thead>
			<tr>
				<th data-options="field:'id',checkbox:true"></th>
				<th field="code" width="50"
					editor="{type:'validatebox',options:{required:true}}">角色编码</th>
				<th field="name" width="50"
					editor="{type:'validatebox',options:{required:true}}">角色名称</th>
				<th field="description" width="100" editor="text">备注</th>
				<th field="rows" width="50">操作</th>
			</tr>
		</thead>
	</table>
	<div id="toolbar">
		<a href="javascript:void(0)" class="easyui-linkbutton"
			iconCls="icon-add" plain="true"
			onclick="grantPower()">授权</a> <a
			href="javascript:void(0)" class="easyui-linkbutton"
			iconCls="icon-add" plain="true" onclick="javascript:$('#list-table').edatagrid('addRow')">新增</a> <a
			href="javascript:void(0)" class="easyui-linkbutton"
			iconCls="icon-remove" plain="true"
			onclick="javascript:$('#list-table').edatagrid('destroyRow')">删除</a>
		<a href="javascript:void(0)" class="easyui-linkbutton"
			iconCls="icon-save" plain="true"
			onclick="javascript:$('#list-table').edatagrid('saveRow')">保存</a> <a
			href="javascript:void(0)" class="easyui-linkbutton"
			iconCls="icon-undo" plain="true"
			onclick="javascript:$('#list-table').edatagrid('cancelRow')">取消</a>
	</div>

	<div id="powerWin" class="easyui-dialog" title="权限配置"
		buttons="#button_div" closed="true"
		style="width: 600px; height: 400px;top:100px;">
		<div id="left">
			<div class="easyui-panel" title="菜单" style="height: 329px">
				<ul id="menu-tree"></ul>
				<input type="hidden" id="roleId_selected" name="roleId_selected"
					value="" />
			</div>
		</div>
		<div id="right">
			<table id="powers-table" title="权限" class="easyui-datagrid"
				style="width: 100%; height: 328px;" idField="id" fit="true"
				rownumbers="false" fitColumns="true" singleSelect="false"
				data-options="url:'<c:url value="/sys/power/list"/>'">
				<thead>
					<tr>
						<th data-options="field:'id',checkbox:true"></th>
						<th field="code" width="50">权限编码</th>
						<th field="name" width="100">权限名称</th>
						<th field="menuId" width="100" hidden="true">所属模块</th>
						<th field="description" width="100" editor="text">备注</th>
					</tr>
				</thead>
			</table>
		</div>
	</div>
	<div id="button_div">
		<a href="#" class="easyui-linkbutton" onclick="saveRolePower()">保存</a>
		<a href="#" class="easyui-linkbutton" onclick="closeDialog()">关闭</a>
	</div>
	<script type="text/javascript">
		$(function() {
			$('#list-table').edatagrid({
				url : '<c:url value="/sys/role/search"/>',
				saveUrl : '<c:url value="/sys/role/save"/>',
				updateUrl : '<c:url value="/sys/role/save"/>',
				destroyUrl : '<c:url value="/sys/role/delete"/>',
				onSave : function(index, row) {
					$('#list-table').datagrid('reload');
				}
			});
		});

		function grantPower(){
			var selected = $('#list-table').datagrid('getSelected');  
            if (selected){  
            	powerWin_open(selected.id);
            }  
		}
		
		function powerWin_open(id) {
			$('#roleId_selected').val(id);
			$.ajax({
				type : "get",
				dataType : "json",
				url : '<c:url value="/sys/role/getOperateIdsByRoleId"/>',
				data : {
					"roleId" : id
				},
				success : function(returnData) {
					returnData += "";
					var powerId = returnData.split(",");
					for ( var i = 0; i < powerId.length; i++) {
						var row = $('#powers-table').edatagrid('selectRecord',
								powerId[i]);
					}
				}
			})
			$('#powerWin').dialog('open');
		}
		
		function closeDialog(){
   		 $('#powerWin').dialog('close');
   		 $('#powers-table').datagrid('clearChecked').datagrid('clearSelections');
   		 var items = $('#menu-tree').tree('getChecked');
   		 if(items){
	    		 for(var i=0 ;i<items.length;i++){
	    			 $('#menu-tree').tree('uncheck',items[i].target);
	    		 }
   		 }
   		 $('#roleId_selected').val('');
   	}
		
		
		$('#menu-tree').tree({  
         	checkbox:true,
         	cascadeCheck:false,
 		    url: '<c:url value="/sys/menu/listTree"/>',
 			onClick : function(node) {
				var rows = $('#powers-table').datagrid('getRows');
				var len = rows.length;
				if(rows){
					for(var i=0;i<len;i++){
						var row = rows[i];
						var tr = $('input[name=id][value='+row.id+']').parent().parent().parent();
						if(row.menuId!=node.id)
							tr.hide();
						else
							tr.show();
							
					}
				}
 			},
 			onCheck : function(node,checked){
 				var rows = $('#powers-table').datagrid('getRows');
				var len = rows.length;
				if(rows){
					for(var i=0;i<len;i++){
						var row = rows[i];
						//var tr = $('input[name=id][value='+row.id+']').parent().parent().parent();
						var rowIndex = $('#powers-table').datagrid('getRowIndex',row);
						if(row.menuId==node.id){
							if(checked)
								$('#powers-table').datagrid('checkRow',rowIndex);
							else
								$('#powers-table').datagrid('uncheckRow',rowIndex);
						}
					}
				}
 			}
 		});
   	
   	function saveRolePower(){
   		
   		var nodes = $('#menu-tree').tree('getChecked');  
   	 	var menuIds =new Array(); 
        for(var i=0; i<nodes.length; i++){
        	menuIds.push(nodes[i].id);
        }  
        
        var rows = $('#powers-table').datagrid('getChecked');
        var powerIds =new Array();
        for(var i=0;i<rows.length;i++){
        	powerIds.push(rows[i].id);
		}
        
        if(roleId_selected !='' && roleId_selected != null){
			$.post('<c:url value="/sys/role/savePowerAndMenu"/>',{'roleId':$('#roleId_selected').val(),'powerIds':powerIds.join(','),'menuIds':menuIds.join(',')});
		}
        
   		
   		
   		closeDialog();
   	}
	</script>

</body>
</html>