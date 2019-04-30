<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>菜单管理</title>
<link rel="stylesheet" href="<c:url value='/css/default.css'/>" />
<link rel="stylesheet" type="text/css"
	href="<c:url value='/js/jquery-easyui/themes/default/easyui.css'/>" />
<link rel="stylesheet" type="text/css"
	href="<c:url value='/js/jquery-easyui/themes/icon.css'/>" />
<script type="text/javascript"
	src="<c:url value='/js/jquery-easyui/jquery-1.8.0.min.js'/>"></script>
<script type="text/javascript"
	src="<c:url value='/js/jquery-easyui/jquery.easyui.min.js'/>"></script>
</head>
<body>
	<div id="toolbar">
		<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true"
			onclick="add()">新增</a> <a href="#" class="easyui-linkbutton"
			iconCls="icon-edit" plain="true" onclick="edit()">编辑</a> <a href="#"
			class="easyui-linkbutton" iconCls="icon-save" plain="true"
			onclick="save()">保存</a> <a href="#" class="easyui-linkbutton"
			iconCls="icon-undo" plain="true" onclick="cancel()">取消</a> <a
			href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true"
			onclick="del()">删除</a>
	</div>
	<table id="list-table" class="easyui-treegrid" title="菜单管理" fit="true"
		toolbar="#toolbar"
		data-options="  
                iconCls: 'icon-ok',  
                rownumbers: true,  
                animate: true,  
                collapsible: true,  
                fitColumns: true,  
                url: '<c:url value='/sys/menu/list'/>', 
                method: 'get',
                idField: 'id',  
                treeField: 'name',  
                showFooter: true
            ">
		<thead>
			<tr>
				<th data-options="field:'name',width:180,editor:'validatebox'">名称</th>
				<th data-options="field:'code',width:180,editor:'validatebox'">编码</th>
				<th data-options="field:'icon',width:180,editor:'validatebox'">图标</th>
				<th data-options="field:'url',width:180,editor:'validatebox'">URL</th>
				<th data-options="field:'remark',width:180,editor:'validatebox'">备注</th>
			</tr>
		</thead>
	</table>
</body>
</html>
<script type="text/javascript">
	var editingId;
	function edit() {
		if (editingId != undefined) {
			$('#list-table').treegrid('select', editingId);
			return;
		}
		var row = $('#list-table').treegrid('getSelected');
		if (row) {
			editingId = row.id
			$('#list-table').treegrid('beginEdit', editingId);
		}
	}

	function add() {
		var node = $('#list-table').treegrid('getSelected');
		var data = [ {
			id : '',
			name : '',
			code : '',
			description : ''
		} ];
		var rows = null;
		if (null == node) {
			$('#list-table').treegrid('append', {
				parent : null,
				data : data
			});
			rows = $('#list-table').treegrid('getRoots');
		} else {
			$('#list-table').treegrid('append', {
				parent : node.id,
				data : data
			});
			rows = $('#list-table').treegrid('getChildren', node.id);
		}
		var edit_row_id = rows[rows.length - 1].id;
		$('#list-table').treegrid('select', edit_row_id);
		var row = $('#list-table').treegrid('getSelected');
		if (row) {
			editingId = row.id
			$('#list-table').treegrid('beginEdit', editingId);
		}
	}

	function save() {
		if (editingId != undefined) {
			var node = $('#list-table').treegrid('getSelected');
			if (node) {
				$('#list-table').treegrid('endEdit', node.id);

				$.post("<c:url value='/sys/menu/save'/>", node, function(
						data) {

					$.messager.alert('提示', '保存成功!', 'info');

				}, "JSON");
			}
			;
			$('#list-table').treegrid('reload');
		}
	}

	function del() {
		var node = $('#list-table').treegrid('getSelections');
		//循环给提交删除参数赋值(音乐风格编码)
		var parm;
		$.each(node, function(i, n) {
			if (i == 0) {
				parm = n.id;
			} else {
				parm += n.id;
			}
		});

		$.post('<c:url value='/sys/menu/delete'/>', {
			id : parm
		}, function(msg) {

			if (msg.success) {
				$.messager.alert('提示', "删除成功", 'info', function() {
					//重新加载当前页
					$('#list-table').treegrid('reload');
				});
			} else {
				$.messager.alert('提示', "删除失败", 'info');
			}
		});
		$('#list-table').treegrid('reload');

	}

	function cancel() {
		if (editingId != undefined) {
			$('#list-table').treegrid('cancelEdit', editingId);
			editingId = undefined;
		}
	}
</script>
