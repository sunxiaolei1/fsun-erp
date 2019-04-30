<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
<!-- 公共资源CSS,JS  -->
<!--Css -->
<link rel="stylesheet" type="text/css"
	href="<c:url value='/js/jquery-easyui/themes/default/easyui.css'/>" />
<link rel="stylesheet" type="text/css"
	href="<c:url value='/js/jquery-easyui/themes/icon.css'/>" />
<!-- ** Javascript ** -->
<script type="text/javascript"
	src="<c:url value='/js/jquery-easyui/jquery-1.8.0.min.js'/>"></script>
<script type="text/javascript"
	src="<c:url value='/js/jquery-easyui/jquery.easyui.min.js'/>"></script>
<script type="text/javascript"
	src="<c:url value='/js/jquery-easyui/jquery.role_edatagrid.js'/>"></script>
<script type="text/javascript"
	src="<c:url value='/js/jquery-easyui/locale/easyui-lang-zh_CN.js'/>"></script>
	

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
</style>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>角色管理</title>
</head>
<body>
	<div class="easyui-layout" fit="true" id='bt_role_layout'>
		<div region="center" style="border-bottom: none;">
			<table id="list-table" title="角色管理" toolbar="#toolbar"
				pagination="true" idField="id" fit="true" rownumbers="true"
				fitColumns="true" singleSelect="true" data-options="url:'<c:url value="/sys/role/search"/>'">
				<thead>
					<tr>
						<th data-options="field:'id',checkbox:true"></th>
						<th field="code" width="50" sortable="true"
							editor="{type:'validatebox',options:{required:true}}">角色编码</th>
						<th field="name" width="50" sortable="true"
							editor="{type:'validatebox',options:{required:true}}">角色名称</th>
						<th field="description" width="100" editor="text">备注</th>
					</tr>
				</thead>
			</table>
		</div>
		
		<div region="south" style="height:350px; padding: 2px;" collapsed="true" split='true' title="角色详情">
			<div class="easyui-layout" fit="true">
			
				<div region="east" title="成员配置" style="width: 500;height:200;border-left: none;">
					<table id="users-table" title="用户列表"
						style="width: 100%;" idField="id"  fit="true"
						rownumbers="false" fitColumns="true" singleSelect="false" pagination="true">
					</table>
				</div>
				<div region="center"  title="菜单权限配置" style="width:728;">
						
							<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="javascript:saveRolePower(this);">授权</a>
						
						<div class="easyui-layout" style="height:263px;">
							<div region="west" title="菜单" style="width: 200px;">
								<ul id="menu-tree"></ul>
								<input type="hidden" id="roleId_selected" name="roleId_selected"
									value="" />
							</div>
							<div region="center" >
								<table id="powers-table" title="权限" class="easyui-datagrid"
									style="width: 100%;" idField="id" fit="true"
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
				</div>
			</div>
		</div>
	</div>
	<div id="toolbar">
		<sec:authorize  ifAllGranted="ROLE_ADD">
				 <a href="javascript:void(0)" class="easyui-linkbutton"	iconCls="icon-add" plain="true"	onclick="javascript:$('#list-table').edatagrid('addRow')">新增</a> 
		</sec:authorize>
		<sec:authorize  ifAllGranted="ROLE_DELETE">
				 <a	href="javascript:void(0)" class="easyui-linkbutton"	iconCls="icon-delete" plain="true"	onclick="delRole()">删除</a>
		</sec:authorize>
		<sec:authorize  ifAllGranted="ROLE_UPDATE">
				 <a href="javascript:void(0)" class="easyui-linkbutton"	iconCls="icon-save" plain="true"  onclick="javascript:$('#list-table').edatagrid('saveRow')">保存</a>
		</sec:authorize>
		<sec:authorize  ifAllGranted="ROLE_UPDATE">
				 <a href="javascript:void(0)" class="easyui-linkbutton"	iconCls="icon-edit" plain="true"  onclick="roleEdit()">编辑</a> 
		</sec:authorize>
		<sec:authorize  ifAllGranted="ROLE_CANCEL">
				 <a	href="javascript:void(0)" class="easyui-linkbutton"	iconCls="icon-undo" plain="true"  onclick="javascript:$('#list-table').edatagrid('cancelRow')">取消</a>
		</sec:authorize>
		<a	href="javascript:void(0)" class="easyui-linkbutton"	iconCls="icon-undo" plain="true"  onclick="dataBackup()">数据库备份</a>
		<a	href="javascript:void(0)" class="easyui-linkbutton"	iconCls="icon-undo" plain="true"  onclick="fileBackup()">产品图片备份</a>
	</div>
	<div id="userToolbar">
		<a
			href="javascript:void(0)" class="easyui-linkbutton"
			iconCls="icon-add" plain="true"
			onclick="addUser()">新增</a> <a
			href="javascript:void(0)" class="easyui-linkbutton"
			iconCls="icon-delete" plain="true"
			onclick="deleteUser()">删除</a>
	</div>
	
	<div id="window" class="easyui-window" title="角色添加用户" style="width:550px;padding:10px" 
		 data-options="modal:true,closed:true,iconCls:'icon-save'">

		<!--<div id="dlg-toolbar" style="padding: 2px 0">
			<form>
				<label>姓名：</label><input type="text" name="Q_uname_like" /> <label>邮箱：</label><input
					type="text" name="Q_mail_like" /> <label><a
					href="javascript:void(0)" class="easyui-linkbutton"
					id="bt_common_chooseuser_user_grid_seachBtn" iconCls="icon-search"
					plain="true">检索</a></label>
			</form>
		</div>  -->
		<table id="bt_common_chooseuser_user_grid" class="easyui-datagrid" idField="id" fit="true"  
									rownumbers="false" fitColumns="true" singleSelect="false" pagination="true"
									>
				<thead>
										<tr>
											<th data-options="field:'id',checkbox:true"></th>
											<th field="username" width="150px">姓名</th>
											<th field="account" width="150px">帐号</th>
											<th field="email" width="150px">邮箱</th>
										</tr>
				</thead>
		</table>
		<div style="float:right;padding:10px">
			<a href="#" class="easyui-linkbutton" data-options="toggle:true" onclick="btnAddUser()">确认添加</a>
		</div>
	</div>
	
	<script>
		
		$(function() {
			var rid;
			var isInitialize =false;
			$('#list-table').edatagrid({
				loadMsg:'加载中，请稍等。。。',
				saveUrl : '<c:url value="/sys/role/save"/>',
				updateUrl : '<c:url value="/sys/role/save"/>',
				destroyUrl : '<c:url value="/sys/role/delete"/>',
				onSave : function(index, row) {
					$.messager.alert('角色管理', '角色添加成功');
					$('#list-table').edatagrid('clearSelections');
					$('#list-table').datagrid('reload');
				},
				onDblClickRow : function(rowIndex, rowData) {
		 			//if (rid && rid === rowData.id) {
					//	return;
					//}
		 			if(!rid){
		 				isInitialize = true;
		 			}
					var $layout = $('#bt_role_layout');
					var south = $layout.layout('panel', 'south');
					if (south.panel('options').collapsed) {
						$layout.layout('expand', 'south');
					}
					
					rid = rowData.id;
					
					//初始化权限列表
					$.ajax({
						type : "get",
						dataType : "json",
						url : '<c:url value="/sys/role/getOperateIdsByRoleId"/>',
						data : {
							"roleId" : rid
						},
						success : function(returnData) {
							$('#powers-table').datagrid('clearSelections'); 
							returnData += "";
							var powerId = returnData.split(",");
							for ( var i = 0; i < powerId.length; i++) {
								var row = $('#powers-table').edatagrid('selectRecord',
										powerId[i]);
							}
						}
					});
					
					//初始化菜单树
					$.ajax({
						type : "get",
						dataType : "json",
						url : '<c:url value="/sys/role/getMenuIdsByRoleId"/>',
						data : {
							"roleId" : rid
						},
						success : function(returnData) {
							//取消上前一次菜单选择
							var test = $('#menu-tree').tree('getChecked');
							for(var i=0; i<test.length; i++){
								$('#menu-tree').tree('uncheck', test[i].target);
							}
							if (returnData && typeof(returnData)!="undefined"){
								returnData += "";
								var menuIds = returnData.split(",");
								for ( var i = 0; i < menuIds.length; i++) {
									var node = $('#menu-tree').tree('find', menuIds[i]);
									//如果是叶子节点，则选中
									if($('#menu-tree').tree('isLeaf', node.target)){
										$('#menu-tree').tree('check', node.target);
									}

								}
							}
						}
					});
					
					
					//初始化用户
					$('#users-table').datagrid({
						loadMsg:'加载中，请稍等。。。',
		            	url: '<c:url value="/sys/user/getUsersByRoleID"/>',
		            	dataType: "json",
		            	frozenColumns: [[{ field: 'id', checkbox: true}]],//固定字段
		            	queryParams:{"roleId" : rid,"flag" : true},
		            	//idField: 'id', //标识字段
		            	//sortName: 'id', //排序字段
		            	rownumbers: true, //显示行号
		            	//fit: true,
		            	columns:[[
							{field:'username',title: '帐号',width:"50",editor:'validatebox'},
							{field:'realname',title: '姓名',width:"100",editor:'validatebox'},
							{field:'description',title: '描述',width:"100",editor:'validatebox'}
		            	]],
		            	toolbar: [{
		            		text: '新增',
		            		iconCls: 'icon-add',
		            		handler:function(){
		            			addUser();
		            		}
		            	},{
		        			text: '删除',
		        			iconCls:"icon-remove",
		        			handler:function(){
		        				deleteUser();
		            		}
		        		}
		            	]
		            }); 

				},
				
				onUnselect : function(rowIndex, rowData){
					
					$('#powers-table').datagrid('clearSelections'); 
					
					var test = $('#menu-tree').tree('getChecked');
					for(var i=0; i<test.length; i++){
						$('#menu-tree').tree('uncheck', test[i].target);
					}
				}
			});
			
			//初始化菜单
			$('#menu-tree').tree({  
	         	checkbox:true,
	         	cascadeCheck:false,
	 		    url: '<c:url value="/sys/menu/listTree"/>',
	 		   	dataType: "json",
	 		    onClick : function(node) {
					var rows = $('#powers-table').datagrid('getRows');
					var len = rows.length;
					if(rows){
						for(var i=0;i<len;i++){
							var row = rows[i];
							var tr = $('input[name=id][value='+row.id+']').parent().parent().parent();
							if(row.menuId!=node.id){
								var highestNodeId = $('#menu-tree').children().children().attr('node-id');
								if(highestNodeId == node.id){
									tr.show();
								}else{
									tr.hide();
								}
							}
							else
								tr.show();
								
						}
					}
	 			},
	 			onCheck : function(node,checked){
	 				if(!isInitialize){
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
	 			}
	 		});
		});
		
		//删除用户
		function deleteUser(){
			var checked = $('#users-table').datagrid('getChecked');
			var selected = $('#list-table').datagrid('getSelected');
	        var roleId_selected = selected.id;
			if (checked && checked.length > 0) {
				$.messager.confirm('删除用户', '确认删除？', function(r) {
		            if (r) {
		                var uids = [];
		                $.each(checked, function() {
		                    uids.push(this.id);
		                });
		                $.post('<c:url value="/sys/role/removeUser"/>', {roleId: roleId_selected, userIds: uids.join(',')}, function(rsp) {
		                    if (rsp.success) {
		                    	$('#users-table').datagrid('reload');
		                    } else {
		                    	$.messager.alert('错误','删除失败!','error');
		                    }
		                }, 'JSON');
		            }
		        });
		    }
		}
		
		//授权
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
	        
	        var selected = $('#list-table').datagrid('getSelected');
	        var roleId_selected = selected.id;
	        if(roleId_selected !='' && roleId_selected != null){
				$.post('<c:url value="/sys/role/savePowerAndMenu"/>',{'roleId':roleId_selected,'powerIds':powerIds.join(','),'menuIds':menuIds.join(',')}, function(rsp){
					if(rsp.success){
						$.messager.alert('菜单授权', '角色授权成功');
					}else{
						$.messager.alert('菜单授权', '角色授权失败')
					}
				}, 'JSON');
			}
		}
		
		
		//新增用户窗口
		function addUser(){
			$('#window').window('open');
			var selected = $('#list-table').datagrid('getSelected');
	        var roleId_selected = selected.id;
			$.ajax({
				type : "get",
				dataType : "json",
				url : '<c:url value="/sys/user/getUsersByRoleID"/>',
				data : {
					"roleId" : roleId_selected,
					"flag" : false
				},
				success : function(returnData) {
					var test = $('#bt_common_chooseuser_user_grid').datagrid('getData');
					for(var i=test.total-1; i>=0; i--){
						 $('#bt_common_chooseuser_user_grid').datagrid('deleteRow',i);
						}
					var temp = returnData.rows;
					var row = eval(temp);
					for ( var i = 0; i < row.length; i++) {
						$('#bt_common_chooseuser_user_grid').datagrid('appendRow',row[i]);
					}
				}
			});
		}
		
		//按钮用户添加
		function btnAddUser(){
			var checked = $('#bt_common_chooseuser_user_grid').datagrid('getChecked');
			var selected = $('#list-table').datagrid('getSelected');
	        var roleId_selected = selected.id;
            var uids = [];
            $.each(checked, function() {
                uids.push(this.id);
            });
            $.post('<c:url value="/sys/role/addUser"/>', {roleId: roleId_selected, userIds: uids.join(',')}, function(rsp) {
                if (rsp.success) {
                	$('#window').window('close');
                	$('#users-table').edatagrid('reload');
                } else {
                    $.messager.alert('添加用户','添加失败失败!','error');
                }
            }, 'JSON');
		}
		
		function roleEdit(){
			var row = $('#list-table').edatagrid('getSelected');
			if (row){
        		var rowIndex = $('#list-table').edatagrid('getRowIndex', row); 
        		$('#list-table').edatagrid('editRow', rowIndex);
        		//$('#list-table').edatagrid('beginEdit', rowIndex);
            }
        	else{
                $.messager.alert('提示','请选择要编辑的项目','info');
        	}
		}
		
		//Del
		function delRole() {
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
			                url: '<c:url value="/sys/role/delete"/>',
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

		//数据备份
		function dataBackup(){
			window.open('<c:url value="/sys/system/dataBackup" />');
		}

		function fileBackup(){			
			window.open('<c:url value="/sys/system/fileBackup" />');		
		}
		
		
	</script>
</body>
</html>