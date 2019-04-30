<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<%@include file="/view/resource.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>权限管理</title>
<link rel="stylesheet" href="<c:url value='/css/main.css'/>" />
</head>
<body>
	<div class="easyui-layout" fit="true">
		<!-- Search panel start -->
		<div id="searchbar" class="ui-search-panel" region="north" style="height:65px;;padding:5px 5px;"
			title="搜索"
			data-options="striped: true,collapsible:false,iconCls:'icon-search',border:false">
				<label>权限编码：</label>
				<input type="text" value="" id="code" name="code" class="search_text"> 
				<label>权限名称：</label>
				<input type="text" value="" id="name" name="name" class="search_text" /> 
				<label>所属模块：</label>
				<input id="menuId" name="menuId" class="easyui-combotree" data-options="url:'<c:url value="/sys/menu/listTree"/>',editable:true">
				<input type="button" class="search-btn" value="搜索" onMouseOver="this.className='on-search-btn'" onMouseOut="this.className='search-btn'" onfocus="this.blur()" onclick="javascript:searchA()"/>
				<input type="button" class="reset-btn" value="重置" onMouseOver="this.className='on-reset-btn'" onMouseOut="this.className='reset-btn'" onfocus="this.blur()" onclick="javascript:reset()" />
			<!-- 	<a href="#"  class="search-btn" value="搜索" onMouseOver="this.className='on-search-btn'" onMouseOut="this.className='search-btn'" onfocus="this.blur()" onclick="javascript:searchA()">搜索</a>
				<a href="#"  class="reset-btn" value="重置" onMouseOver="this.className='on-reset-btn'" onMouseOut="this.className='reset-btn'" onfocus="this.blur()"  onclick="javascript:reset()">重置</a> -->
		</div>
		<!--  Search panel end -->
		<!-- DataList  -->
		<div region="center" border="false">
			<table id="list-table" title="权限管理" toolbar="#toolbar"
				pagination="true" idField="id" fit="true" rownumbers="true"
				fitColumns="true" singleSelect="false" pageSize="20">
				<thead>
					<tr>
						<th data-options="field:'id',checkbox:true"></th>
						<th field="code" width="100" sortable="true"
							editor="{type:'validatebox',options:{required:true}}">权限编码</th>
						<th field="name" width="70" sortable="true"
							editor="{type:'validatebox',options:{required:true}}">权限名称</th>
						<!-- <th field="icon" width="100">图标</th>  --> 
						<th field="url" width="150" sortable="true" editor="{type:'validatebox'}">URL</th>
					    <th field="menuId" width="70" formatter="getMenuName" sortable="true"
							editor="{type:'combotree',options:{required:true,valueField:'id',textField:'text', url:'<c:url value="/sys/menu/listTree"/>'}}">所属模块</th> 
	                    <th field="description" width="150" editor="text" sortable="true" >备注</th>
						
					</tr>
				</thead>
			</table>
		</div>
	</div>
	
	<div id="toolbar">
		<div id="buttonbar">
			<sec:authorize  ifAllGranted="POWER_ADD">
				<a href="javascript:void(0)" class="easyui-linkbutton"	iconCls="icon-add" plain="true"	onclick="javascript:$('#list-table').edatagrid('addRow')">新增</a> 
			</sec:authorize>
			<sec:authorize  ifAllGranted="POWER_DELETE">
				<a	href="javascript:void(0)" class="easyui-linkbutton"	iconCls="icon-delete" plain="true" onclick="javascript:delPower()">删除</a>
			</sec:authorize>
			<sec:authorize  ifAllGranted="POWER_UPDATE">
				<a href="javascript:void(0)" class="easyui-linkbutton"	iconCls="icon-save" plain="true"  onclick="javascript:$('#list-table').edatagrid('saveRow')">保存</a> 
			</sec:authorize>
			<sec:authorize  ifAllGranted="POWER_CANCEL">
				<a	href="javascript:void(0)" class="easyui-linkbutton"	iconCls="icon-undo" plain="true"  onclick="javascript:$('#list-table').edatagrid('cancelRow')">取消</a>
			</sec:authorize>
		</div>
	</div>
	<script type="text/javascript">
		//插件js
		/**
		 * 创建上传窗口 公共方法
		 * @param chunk 是否分割大文件
		 * @param callBack 上传成功之后的回调
		 */
		function Uploader(chunk,callBack){
			var addWin = $('<div style="overflow: hidden;"/>');
			var upladoer = $('<iframe/>');
			upladoer.attr({'src':'<%=basePath%>view/sys/power/uploader.jsp?chunk='+chunk,width:'100%',height:'100%',frameborder:'0',scrolling:'no'});
			addWin.window({
				title:"上传文件",
				height:350,
				width:550,
				minimizable:false,
				modal:true,
				collapsible:false,
				maximizable:false,
				resizable:false,
				content:upladoer,
				onClose:function(){
					var fw = GetFrameWindow(upladoer[0]);
					var files = fw.files;
					$(this).window('destroy');
					callBack.call(this,files);
				},
				onOpen:function(){
					var target = $(this);
					setTimeout(function(){
						var fw = GetFrameWindow(upladoer[0]);
						fw.target = target;
					},100);
				}
			});
		}
		
		/**
		 * 根据iframe对象获取iframe的window对象
		 * @param frame
		 * @returns {Boolean}
		 */
		function GetFrameWindow(frame){
			return frame && typeof(frame)=='object' && frame.tagName == 'IFRAME' && frame.contentWindow;
		}
		
		//excel表导入
		function excelImport(chunk){
			Uploader(chunk,function(files){
				if(files && files.length>0){
					$('#list-table').edatagrid('reload');
				}
			});
		}
		
		function excelExport(){
			
		}
		//excel表导出
	
		var getMenuName=function(value,row,index){
			if(value){
				return row.menuName;
			}else {
				return null;
			}
		}
	
        $(function(){  
            $('#list-table').edatagrid({  
            	loadMsg:'加载中，请稍等。。。',
                url: '<c:url value="/sys/power/search"/>',  
                saveUrl: '<c:url value="/sys/power/save"/>',  
                updateUrl: '<c:url value="/sys/power/save"/>',
                destroyUrl: '<c:url value="/sys/power/delete"/>',
                onSave: function(index,row){
                	$('#list-table').edatagrid('clearSelections');
                	$('#list-table').edatagrid('reload'); 
                }
			});
		});
        
         function searchA(){
        	 var code = $('#code').val();
        	 var name = $('#name').val();
             var menuId = $('#menuId').combotree('getValue');
             $('#list-table').edatagrid('reload',{code:code,name:name,menuId:menuId});
         }	
     /*     	$('#list-table').edatagrid({
				queryParams: {
					code: $('#code').val(),
					name: $('#name').val(),
					menuId: $('#menuId').combotree('getValue')
				}
			}); 
        }  */
        
        
        function reset() {
        	 document.getElementById("name").value="";
        	 document.getElementById("code").value="";
        	 $('#menuId').combotree('setValue', "");
        }
     
    	
		
      //Del
		function delPower() {
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
			                url: '<c:url value="/sys/power/delete"/>',
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
        
	</script>
</body>
</html>