<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/view/resource.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>数据字典管理</title>
</head>
<body>
	<div id="toolbar">
		<sec:authorize  ifAllGranted="DICTIONARY_ADD">
		    <a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="add()">新增</a>
		</sec:authorize>
		<sec:authorize  ifAllGranted="DICTIONARY_UPDATE">
		    <a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="edit()">编辑</a> 
		</sec:authorize>
		<sec:authorize  ifAllGranted="DICTIONARY_UPDATE">
		    <a href="#" class="easyui-linkbutton" iconCls="icon-save" plain="true"onclick="save()">保存</a> 
		</sec:authorize>
		<sec:authorize  ifAllGranted="DICTIONARY_CANCEL"> 
		    <a href="#" class="easyui-linkbutton" iconCls="icon-undo" plain="true" onclick="cancel()">取消</a>
		</sec:authorize>
		<sec:authorize  ifAllGranted="DICTIONARY_DELETE"> 
		    <a href="#" class="easyui-linkbutton" iconCls="icon-delete" plain="true" onclick="del()">删除</a>
		</sec:authorize>
		<sec:authorize  ifAllGranted="DICTIONARY_EXPAND"> 
		    <a href="#" class="easyui-linkbutton" iconCls="icon-expand"  plain="true" onclick="fileUnfold()">展开</a>
		</sec:authorize>
		<sec:authorize  ifAllGranted="DICTIONARY_SHRINK"> 
		    <a href="#" class="easyui-linkbutton" iconCls="icon-shrink" plain="true" onclick="fileToggole()">收缩</a>
		</sec:authorize>
	</div>
	<table id="list-table" class="easyui-treegrid" title="数据字典管理" fit="true"
		toolbar="#toolbar"
		data-options="
				animate:true,
				dnd:true,
                iconCls: 'icon-ok',  
                rownumbers: true,  
                animate: true,  
                collapsible: true,  
                fitColumns: true,  
                url: '<c:url value="/sys/dictionary/search"/>', 
                method: 'get',
                idField: 'id',
                treeField: 'name',  
                showFooter: true
            ">
		<thead>
			<tr>
			   <th field="name" width="150" editor="{type:'validatebox',options:{required:true}}">名称</th>
				<th field="code" width="120" editor="{type:'validatebox',options:{required:true}}">编码</th>
				<th field="description" width="120" editor="{type:'validatebox'}">数据描述</th>
				<sec:authorize  ifAllGranted="DICTIONARY_SORT">
				<th field="aaa" width="100" editor="{type:'linkbutton'}" formatter="sequence">排序</th>
				</sec:authorize>
			</tr>
		</thead>
	</table>
</body>
</html>
<script type="text/javascript">

	function changeTreeUrl(){
		$('#list-table').treegrid('options').url = '<c:url value="/sys/dictionary/search?timeid=' + Math.random() +'"/>';
	};
	
	var sequence = function(){
		var imageFile = '<c:url value="/images/up.png"/>';
		var imageFile1 = '<c:url value="/images/down.png"/>';
		return '<img class="item-img" src="'+imageFile+'"  alt="上移" onclick="move(event,this,true)"/><img class="item-img" src="'+imageFile1+'"  alt="下移" onclick="move(event,this,false)"/>';
	}
	
	function moveAJaxMethod(id, BrotherId, direction, url){
		if(direction == 'up'){
			var moveData = {"id":id, "prevBrotherId":BrotherId};
		}else if(direction == 'down'){
			var moveData = {"id":id, "nextBrotherId":BrotherId};
		}
		$.post(url, moveData, function(returnData) {
				if(returnData.success){
					return true;
				}else{
					return false;
				}
			}
		);
		
	}
	
	function move(e, target, isUp) {
		var row = $(target).closest('tr.datagrid-row'); //点击移动的数据字典
		var rowId = row.attr('node-id'); //点击移动的数据字典id
		var rows = new Array();
		if(isUp){ //上移
			var url = '<c:url value="/sys/dictionary/upgrade"/>';
			var subMenu = row.next("tr.treegrid-tr-tree");
			if(subMenu.length){ //点击上移的数据字典有子数据字典
				rows[0] = row;
				rows[1] = subMenu;
				if(row.prev('tr.treegrid-tr-tree').length){ //点击上移的数据字典上面有子数据字典
					var prevBrotherId = row.prev().prev().attr('node-id');
					moveAJaxMethod(rowId, prevBrotherId, 'up', url); //数据库请求
					row.prev().prev().before(rows); //移动
				}else if(row.prev('tr.datagrid-row').length){ //点击上移的数据字典上面没有子数据字典
					var prevBrotherId = row.prev().attr('node-id');
					moveAJaxMethod(rowId, prevBrotherId, 'up', url); //数据库请求
					row.prev('tr.datagrid-row').before(rows);//移动
				}
			}else{ //点击上移的数据字典没有子数据字典
				if(row.prev('tr.treegrid-tr-tree').length){ //点击上移的数据字典上面有子数据字典
					var prevBrotherId = row.prev().prev().attr('node-id');
					moveAJaxMethod(rowId, prevBrotherId, 'up', url); //数据库请求
					row.prev().prev().before(row); //移动
				}else if(row.prev('tr.datagrid-row').length){ //点击上移的数据字典上面没有子数据字典
					var prevBrotherId = row.prev().attr('node-id');
					moveAJaxMethod(rowId, prevBrotherId, 'up', url); //数据库请求
					row.prev('tr.datagrid-row').before(row);//移动
				}
			}
			
		}else{ //下移
			var url = '<c:url value="/sys/dictionary/degrade"/>';
			var subMenu = row.next('tr.treegrid-tr-tree');
			if(subMenu.length){
				var moveMenu = row.next().next('tr.datagrid-row');
				var moveSubMenu = moveMenu.next('tr.treegrid-tr-tree');
				if(moveSubMenu.length){ //该被移动数据字典下面有子数据字典
					var nextBrotherId = moveMenu.attr('node-id');
					moveAJaxMethod(rowId, nextBrotherId, 'down', url); //数据库请求
					rows[0] = moveMenu;
					rows[1] = moveSubMenu;
					row.before(rows); //移动数据字典和子数据字典
				}else if(moveMenu.length){ //该数据字典下面没有子数据字典
					var nextBrotherId = moveMenu.attr('node-id');
					moveAJaxMethod(rowId, nextBrotherId, 'down', url); //数据库请求
					row.before(moveMenu);//移动数据字典
				}
			}else{ //该数据字典没有子数据字典
				var moveMenu = row.next('tr.datagrid-row');
				var moveSubMenu = moveMenu.next('tr.treegrid-tr-tree');
				if(moveSubMenu.length){ //该被移动数据字典下面有子数据字典
					var nextBrotherId = moveMenu.attr('node-id');
					moveAJaxMethod(rowId, nextBrotherId, 'down', url); //数据库请求
					rows[0] = moveMenu;
					rows[1] = moveSubMenu;
					row.before(rows); //移动数据字典和子数据字典
				}else if(moveMenu.length){ //该数据字典下面没有子数据字典
					var nextBrotherId = moveMenu.attr('node-id');
					moveAJaxMethod(rowId, nextBrotherId, 'down', url); //数据库请求
					row.before(moveMenu);//移动数据字典
				}
			}
		}
	}
	

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
			editingId = row.id;
			$('#list-table').treegrid('beginEdit', editingId);
		}
	}

	function save() {
		if (editingId != undefined) {
			var node = $('#list-table').treegrid('getSelected');
			if (node) {
				$('#list-table').treegrid('endEdit', node.id);
				$.ajax({
					async:false,
					type:"POST",
					dataType: "json",
					url:"<c:url value='/sys/dictionary/save'/>",
					data: node, 
					success:function(data) {
						$.messager.alert('提示', '保存成功!', 'info');
						changeTreeUrl();
						$('#list-table').treegrid('reload');
						$('#list-table').treegrid('clearSelections');
					}
				});
			};
			editingId = null;
		}
	}

	

	  function del(){
      	var node = $('#list-table').treegrid('getSelections');
      	//循环给提交删除参数赋值(音乐风格编码)
      	var parm; 
      	$.each(node, function (i, n) {
      		if(i==0){
      			parm = n.id;
      		}else{
      			parm += n.id;
      		}
      	}); 
      	$.ajax({
      		async:false,
			type:"POST",
			dataType: "json",
      		url:'<c:url value="/sys/dictionary/delete"/>',
      		data:{id:parm},
      		success:function (msg) { 
      			if (msg.success) {
      				$.messager.alert('提示', "删除成功", 'info');
      			} else {
      				$.messager.alert('提示', "删除失败", 'info');
      			}
      			changeTreeUrl();
				$('#list-table').treegrid('reload');
      		}
      	});
      }
	  
	function cancel() {
		if (editingId != undefined) {
			$('#list-table').treegrid('cancelEdit', editingId);
			editingId = undefined;
		}
		if (editingId == undefined) {
			$('#list-table').treegrid('reload');
		}
	}
	
	//文件展开
	function fileUnfold(){
		$('#list-table').treegrid('expandAll');
	}
	
	//文件收缩
	function fileToggole(){
		$('#list-table').treegrid('collapseAll');
	}
	
</script>