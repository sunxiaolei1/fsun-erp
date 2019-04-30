<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/view/resource.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>菜单管理</title>
</head>
<body>
	<div id="toolbar">
	<sec:authorize  ifAllGranted="MENU_ADD">
		<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="add()">新增</a>
	</sec:authorize>
	<sec:authorize  ifAllGranted="MENU_UPDATE">
	    <a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="edit()">编辑</a> 
	</sec:authorize>
	<sec:authorize  ifAllGranted="MENU_UPDATE">
	    <a href="#" class="easyui-linkbutton" iconCls="icon-save" plain="true"onclick="save()">保存</a> 
	</sec:authorize>
	<sec:authorize  ifAllGranted="MENU_CANCEL"> 
	    <a href="#" class="easyui-linkbutton" iconCls="icon-undo" plain="true" onclick="cancel()">取消</a>
	</sec:authorize>
	<sec:authorize  ifAllGranted="MENU_DELETE"> 
	    <a href="#" class="easyui-linkbutton" iconCls="icon-delete" plain="true" onclick="del()">删除</a>
	</sec:authorize>
	<sec:authorize  ifAllGranted="MENU_EXPAND"> 
	    <a href="#" class="easyui-linkbutton" iconCls="icon-expand"  plain="true" onclick="fileUnfold()">展开</a>
	</sec:authorize>
	<sec:authorize  ifAllGranted="MENU_SHRINK"> 
	    <a href="#" class="easyui-linkbutton" iconCls="icon-shrink" plain="true" onclick="fileToggole()">收缩</a>
	</sec:authorize>
	</div>
	<table id="list-table" class="easyui-treegrid" title="菜单管理" fit="true"
		toolbar="#toolbar"
		data-options="
				animate:true,
				dnd:true,
                iconCls: 'icon-ok',  
                rownumbers: true,  
                animate: true,  
                collapsible: true,  
                fitColumns: true,  
                url: '<c:url value='/sys/menu/search'/>', 
                method: 'get',
                idField: 'id',  
                treeField: 'name',  
                showFooter: true
            ">
		<thead>
			<tr>
			    <th field="name" width="180" editor="{type:'validatebox',options:{required:true}}">名称</th>
				<th field="code" width="180" editor="{type:'validatebox',options:{required:true}}">编码</th>  
				<th data-options="field:'icon',width:180, formatter:aa, editor:{type:'combobox',options:{
						formatter:test,
						url:'<c:url value="/sys/menu/getIcons"/>',
						method:'get',valueField:'path',textField:'name',editable:true}}">图标</th>
				<th data-options="field:'url',width:200,editor:{type:'validatebox'}">URL</th>
				<th data-options="field:'description',width:180,editor:'validatebox'">备注</th>
				<sec:authorize  ifAllGranted="MENU_SORT">
				<th field="aaa" width="80" editor="{type:'linkbutton'}" formatter="sequence">排序</th>
			    </sec:authorize>
			</tr>
		</thead>
	</table>
</body>
</html>
<script type="text/javascript">

	function changeTreeUrl(){
		$('#list-table').treegrid('options').url = '<c:url value="/sys/menu/search?timeid=' + Math.random() +'"/>';
	};

	function test(row){
		//var imageFile = 'images/' + row.icon;
		var imageFile = '<c:url value="/images/icons/"/>'+ row.name;
		return '<img class="item-img" src="'+imageFile+'"/>';
	}
	
	var aa = function(value,row,index){
		
		if(row.icon==null){
			return '<img class="item-img" onerror="this.style.display='+"'none'"+'"/>';
		}
		var imageFile = '<c:url value="/"/>'+ row.icon;
		return '<img class="item-img" src="'+imageFile+'"  onerror="this.style.display='+"'none'"+'"/>';
		//var img = document.getElementById('imgid')[0].src;
	}
			
	//  move(event,this,true)   move(event,this,false)
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
		var row = $(target).closest('tr.datagrid-row'); //点击移动的菜单
		var rowId = row.attr('node-id'); //点击移动的菜单id
		var rows = new Array();
		if(isUp){ //上移
			var url = '<c:url value="/sys/menu/upgrade"/>';
			var subMenu = row.next("tr.treegrid-tr-tree");
			if(subMenu.length){ //点击上移的菜单有子菜单
				rows[0] = row;
				rows[1] = subMenu;
				if(row.prev('tr.treegrid-tr-tree').length){ //点击上移的菜单上面有子菜单
					var prevBrotherId = row.prev().prev().attr('node-id');
					moveAJaxMethod(rowId, prevBrotherId, 'up', url); //数据库请求
					row.prev().prev().before(rows); //移动
				}else if(row.prev('tr.datagrid-row').length){ //点击上移的菜单上面没有子菜单
					var prevBrotherId = row.prev().attr('node-id');
					moveAJaxMethod(rowId, prevBrotherId, 'up', url); //数据库请求
					row.prev('tr.datagrid-row').before(rows);//移动
				}
			}else{ //点击上移的菜单没有子菜单
				if(row.prev('tr.treegrid-tr-tree').length){ //点击上移的菜单上面有子菜单
					var prevBrotherId = row.prev().prev().attr('node-id');
					moveAJaxMethod(rowId, prevBrotherId, 'up', url); //数据库请求
					row.prev().prev().before(row); //移动
				}else if(row.prev('tr.datagrid-row').length){ //点击上移的菜单上面没有子菜单
					var prevBrotherId = row.prev().attr('node-id');
					moveAJaxMethod(rowId, prevBrotherId, 'up', url); //数据库请求
					row.prev('tr.datagrid-row').before(row);//移动
				}
			}
			
		}else{ //下移
			var url = '<c:url value="/sys/menu/degrade"/>';
			var subMenu = row.next('tr.treegrid-tr-tree');
			if(subMenu.length){
				var moveMenu = row.next().next('tr.datagrid-row');
				var moveSubMenu = moveMenu.next('tr.treegrid-tr-tree');
				if(moveSubMenu.length){ //该被移动菜单下面有子菜单
					var nextBrotherId = moveMenu.attr('node-id');
					moveAJaxMethod(rowId, nextBrotherId, 'down', url); //数据库请求
					rows[0] = moveMenu;
					rows[1] = moveSubMenu;
					row.before(rows); //移动菜单和子菜单
				}else if(moveMenu.length){ //该菜单下面没有子菜单
					var nextBrotherId = moveMenu.attr('node-id');
					moveAJaxMethod(rowId, nextBrotherId, 'down', url); //数据库请求
					row.before(moveMenu);//移动菜单
				}
			}else{ //该菜单没有子菜单
				var moveMenu = row.next('tr.datagrid-row');
				var moveSubMenu = moveMenu.next('tr.treegrid-tr-tree');
				if(moveSubMenu.length){ //该被移动菜单下面有子菜单
					var nextBrotherId = moveMenu.attr('node-id');
					moveAJaxMethod(rowId, nextBrotherId, 'down', url); //数据库请求
					rows[0] = moveMenu;
					rows[1] = moveSubMenu;
					row.before(rows); //移动菜单和子菜单
				}else if(moveMenu.length){ //该菜单下面没有子菜单
					var nextBrotherId = moveMenu.attr('node-id');
					moveAJaxMethod(rowId, nextBrotherId, 'down', url); //数据库请求
					row.before(moveMenu);//移动菜单
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
			$.messager.alert('提示', '不能增加一级菜单!', 'info');
			//$.messager.confirm('警告框', '字段为空 ', 'info');
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
				$.ajax({
					async:false,
					type:"POST",
					dataType: "json",
					url:"<c:url value='/sys/menu/save'/>",
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
      		url:'<c:url value="/sys/menu/delete"/>',
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