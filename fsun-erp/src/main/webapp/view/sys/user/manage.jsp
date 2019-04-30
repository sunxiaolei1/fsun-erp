<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/view/resource.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<style type="text/css">
.textField{text-align:right;}
.table-new{font-size:12px;}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>用户管理</title>
<link rel="stylesheet" href="<c:url value='/css/main.css'/>" />
</head>
<body>
	<div class="easyui-layout" fit="true">
		<!-- Search panel start -->
		<div id="searchbar" class="ui-search-panel" region="north" style="height:65px;;padding:5px 5px;"
			title="搜索"
			data-options="striped: true,collapsible:false,iconCls:'icon-search',border:false">
				<label>登录名：</label>
				<input type="text" value="" id="username" name="username" class="search_text"> 
				<label>姓名：</label>
				<input type="text" value="" id="realname" name="realname" class="search_text" /> 
				<input type="button" class="search-btn" value="搜索" onMouseOver="this.className='on-search-btn'" onMouseOut="this.className='search-btn'" onfocus="this.blur()" onclick="javascript:searchA()"/>
				<input type="button" class="reset-btn" value="重置" onMouseOver="this.className='on-reset-btn'" onMouseOut="this.className='reset-btn'" onfocus="this.blur()" onclick="javascript:reset()" />
		</div>
		<!--  Search panel end -->
		<!-- DataList  -->
		<div region="center" border="false">
			<table id="list-table" title="用户管理"
		            toolbar="#toolbar" pagination="true" idField="id"  fit="true" 
		            rownumbers="true" fitColumns="true" singleSelect="false">  
		        <thead>  
		            <tr>  
		            	<th data-options="field:'id',checkbox:true"></th>
		                <th field="username" width="50" sortable="true" editor="{type:'validatebox',options:{required:true}}">登录名</th>
		                <th field="realname" width="50" sortable="true" editor="{type:'validatebox',options:{required:true}}">姓名</th>
		                <th field="roleNames" width="50" sortable="true" editor="{type:'validatebox',options:{required:true}}">角色</th>
		               <!--  <th field="enabled"width="50" formatter="bb"editor="{type:'combobox',options:{data:isuseds,valueField:'id',textField:'text',required:true}}">帐号状态</th> -->
		                <th field="email" width="50" sortable="true" editor="{type:'validatebox' ,options:{validType:'email'}}" >邮箱</th>
		                <th field="description" width="50" editor="text">备注</th>
		                <!-- <th field="attr1" width="250" editor="{type:'linkbutton'}" formatter="aa">选择角色</th> -->
		            </tr>  
		        </thead>  
		    </table>
	    </div>
    </div> 
    <div id="openRoleDiv" class="easyui-window" title="选择角色"  closed="true"style="width:500px;height:400px;"> 
    	<table id="userRole-table"fit="true"singleSelect="false">
            
    	</table>
    	 <div id="hidden" align="center" style="display:'none'"> 
    	 	<form id="fm" method="post">
    	 		<table>
    	 			<tr>
    	 				<td><input type="text" id="userId" name="userId"></td>
    	 				<td><input type="text" id="roleId" name="roleId"></td>
    	 			</tr>
    	 		</table>   	 		
    	 	</form>
    	 </div>
	</div>
	<div id="win" class="easyui-window" title="新增用户" closed="true" align="center" style="width:600px;height:400px;top:100px;" buttons="#dlg-buttons" modal="true">  
    	 <form id="fm2" method="post"> 
    	 <input id="vmUserId" name="id" type="hidden"/>
    	 <table border="0"  class="table-new"  cellpadding="5"   cellspacing="5">
    	 	<tr>
    	 		<td class="textField">
    	 		   <span style="color:red">*</span>登录名：
    	 		</td>
    	 		<td>
    	 		 <input class="easyui-validatebox" type="text" name="username" data-options="required:true"/> 
    	 		</td>
    	 		<td class="textField">
    	 			<span style="color:red">*</span>姓名：
    	 		</td>
    	 		<td>
    	 		<input class="easyui-validatebox" type="text" name="realname" data-options="required:true"/> 
    	 		</td>
    	 		</tr>
    	 	<tr class='getIpWay' style="display:none;">
    	 		<td class="textField">
    	 			<span style="color:red">*</span>密码：
    	 		</td>
    	 		<td>
    	 			<input type="password" name="password" id="password1" data-options="required:true" class="easyui-validatebox"/>
    	 		</td>
    	 			<td class="textField">
    	 			<span style="color:red">*</span>确认密码：
    	 		</td>
    	 		<td>
    	 			<input type="password" name="repassword" id="repassword1" data-options="required:true" class="easyui-validatebox"  validType="equalTo['#password1']" invalidMessage="两次输入密码不匹配"/>
    	 		</td>
    	 	</tr>
    	 	<tr>
    	 	    <td class="textField">
    	 			电子邮箱：
    	 		</td>
    	 		<td colspan="3" >
    	 			<input class="easyui-validatebox" type="text" name="email" id="email"  validType="email" style="height:20px;width:220px"/>
    	 		</td>
    	 	<!-- 	<td class="textField">
    	 			<span style="color:red">*</span>帐号状态：
    	 		</td>
    	 		<td class="textField">
    	 			<input type="radio" name="enabled" id="enabled1" value="true" checked/> 启用
    	 			<input type="radio" name="enabled" id="enabled2"value="false" /> 禁用
    	 		</td> -->
    	 		
    	 	</tr>	
    	 	<tr>
    	 		<td class="textField">
    	 			备注：
    	 		</td>
    	 		<td colspan="3" >
    	 			<input textarea class="easyui-validatebox" style="height:100px;width:300px"  name="description"/>
    	 		</td>
    	 	</tr>	
    	 </table>
    	 </form>
    	 <div style="padding:20px;text-align:center;">  
                <a href="#" class="easyui-linkbutton" icon="icon-ok"onclick="saveUser()">保存</a>  
                <a href="#" class="easyui-linkbutton" icon="icon-cancel"onclick="closeWin3()">取消</a>  
         </div>  
	</div>  
    <div id="toolbar">
       <div id="buttonbar">
       <sec:authorize  ifAllGranted="USER_ADD">
        	<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="addUser()">新增</a>
       </sec:authorize>
       <sec:authorize  ifAllGranted="USER_DEL">
        	<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-delete" plain="true" onclick="delUser()">删除</a>
       </sec:authorize>
       <sec:authorize  ifAllGranted="USER_EDIT">
        	<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editUser()">编辑</a>
       </sec:authorize>
       <!--<sec:authorize  ifAllGranted="USER_EDIT">
        	<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-save" plain="true" onclick="javascript:$('#list-table').edatagrid('saveRow')">保存</a>
       </sec:authorize>
        <sec:authorize  ifAllGranted="USER_CANCEL">
        	<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-undo" plain="true" onclick="javascript:$('#list-table').edatagrid('cancelRow')">取消</a>
       </sec:authorize>
       --> 
       <sec:authorize  ifAllGranted="USER_RESET">
       <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-reset" plain="true" onclick="resetPassword()">密码初始化</a>
      </sec:authorize>
      </div>  
    </div>
    <script type="text/javascript"><!--
    
	    $.extend($.fn.validatebox.defaults.rules, {   
	        /*必须和某个字段相等*/
	        equalTo: { 
	            validator:function(value,param){ 
	                return $(param[0]).val() == value; 
	            }, 
	            message:'字段不匹配'
	        } 
	                
	    });
	    
	    function addUser(){
	    	$('.getIpWay').show();
	    	$('#list-table').datagrid('clearSelections');
	    	$('#vmUserId').val(''); 	
	    	$('#win').window('open');
	    	$('#fm2')[0].reset();
	    	$('input[id=enabled1]').attr('checked','checked');
	    	
	    }
	  
	   	var isuseds = [{id:true,text:'启用'}, {id:false,text:'禁用'}];
	   
	    var aa = function(value,row,index){
			return '<span onclick="selectRole(\''+row.id+'\');">选择角色</span>'
		}
	   
	    var bb = function(value,row,index){
          if (value)
			return "启用";
          else
  			return "禁用";
		}
	    
	       //密码初始化
	    function resetPassword(){
	    	var user = $('#list-table').edatagrid('getSelected');
	    	if(user){
	    		$.messager.confirm('Confirm','确定要初始化?', function(r){
		    		$.ajax({
		                type: "post",
		               // dataType: "json",
		                url: "pwdReset",
		                data: {"id":user.id},
		                success: function(result) {
		                	$.messager.alert('提示','初始化成功!','info');
		                }
		            })
	    		})
	    	}else{
	    		$.messager.alert('提示','请选择一项进行修改!','info');
	    	}
	    		
	    }
		
	    
	    function closeWin3(){
	    	$('#win').window('close');
	    }
	    
	    function saveUser(){
	    	$('#fm2').form('submit',{  
                url: '<c:url value="/sys/user/save"/>',  
                dataType: "json",
                success: function(result){
	                	closeWin3();
	                	if(eval('('+result+')').success){
	                		$.messager.alert('提示','保存成功!','info');
	                	}else{
	                		$.messager.alert('提示','保存失败!','info');
	                	}
	                	$('#list-table').edatagrid('reload');
                }
            });
	    	
	    }
	    
	  //Del
		function delUser() {
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
			                url: '<c:url value="/sys/user/delete"/>',
			                data: {"id":ids},
			                success: function(returnData) {
			                	if (returnData.success){ 
									$('#list-table').datagrid('reload');
									$('#list-table').datagrid('clearSelections');
								} else {  
									if(returnData.message){
										$.messager.show({ title: 'Error', msg : returnData.message }); 
									}else{
									    $.messager.show({ title: 'Error', msg : "删除失败" }); 
									}
								} 
			                }
			            });
					}
				});
			} else {
				$.messager.alert('消息', '请选择要删除的数据!','info');
			}
		}


		function editUser(){
			 var user=$('#list-table').edatagrid('getSelections');
			 if(user.length==1){
					var ida = user[0].id;
	    			$('#fm2')[0].reset();
	    			$('.getIpWay').hide();
	    			$('#win').window('open');
				    $.ajax({
	    	        	url:'<c:url value="/sys/user/load"/>',
	    	        	dataType: "json",
	    	        	data:{id:ida},
	    	        	success:function(rowData,user){
	    	        		//$('#fm2').form('load',rowData.rows);
	    	        		//if(rowData.rows.bootproto === 'static'){
	    	        		///	$('.getIpWay').show();
	    	        		//}
	    	        		$('#repassword1').val(rowData.rows.password);
	    	        		$('#fm2').form('load',rowData.rows);
	    	        	}
	    	        }) 
	    			
    		}else{
    			$.messager.alert('提示','请选择一项进行修改!','info');
    		}
		}
	    
	    function selectRole(id){
	    	$('#userRole-table').edatagrid('clearSelections');
    		$.ajax({
                type: "get",
                dataType: "json",
                url: "listRoleIdByUserId",
                data: {"userId":id},
                success: function(returnData) {
                	returnData+="";
                    var roleId = returnData.split(",");
                    for(var i=0;i<roleId.length;i++){
                    	var row = $('#userRole-table').edatagrid('selectRecord',roleId[i]);
                    }
                }
            })
            $('#openRoleDiv').window('open');
	    }
	    
	    function closeWin(){
	    	$('#openRoleDiv').window('close');
    		$('#userRole-table').edatagrid('clearSelections');
	    }
	    
	    function closeWin2(){
	    	$('#openRoleDiv1').window('close');
	    	$('#fm1').form('clear');
	    }
	    
	     $(function(){
            $('#userRole-table').edatagrid({
            	loadMsg:'加载中，请稍等。。。',
            	onSelect : function(rowIndex, rowData) {
            		var users=$('#userRole-table').edatagrid('getSelections');
            		var parm=[];
            		for(var i=0;i<users.length;i++){
            			parm.push(users[i].id);
            		}
            		document.getElementById("roleId").value=parm;
            	}
            });
		}); 
    	
	    
	    
	    function saveUserRole(){
	    	var user = $('#list-table').edatagrid('getSelected');
	    	var rows = $('#userRole-table').datagrid('getChecked');
    		var ids = null;
    		if(rows !=''){
    	        var roleIds =new Array();    
    			for(var i=0;i<rows.length;i++){
    				var row = rows[i];
    				roleIds.push(row.id);
    			}
				$.post('<c:url value="/sys/user/saveRole"/>',{'userId':user.id,'roleIds':roleIds.join(',')});
    		}
    		closeWin();
        	$.messager.alert('提示','保存成功!','info');
    		$('#userRole-table').edatagrid('clearSelections');
    		$('#list-table').edatagrid('reload');

	    }
	    
		$(function(){
            $('#userRole-table').edatagrid({
            	url: '<c:url value="/sys/role/list"/>',
            	dataType: "json",
            	frozenColumns: [[{ field: 'id', checkbox: true}]],//固定字段
            	idField: 'id', //标识字段
            	//sortName: 'id', //排序字段
            	rownumbers: true, //显示行号
            	fit: true,
            	columns:[[
					{field:'name',title: '角色名称',width:"100",editor:'validatebox'},
					{field:'code',title: '角色编码',width:"100",editor:'validatebox'},
					{field:'description',title: '备注',width:"100",editor:'validatebox'}
            	]],
            	toolbar: [{
            		text: '确定',
            		iconCls: 'icon-save',
            		handler:function(){
            			saveUserRole();
            		}
            	},{
        			text: '取消',
        			iconCls:"icon-undo",
        			handler:function(){
        				$('#openRoleDiv').window('close');;
            		}
        		}
            	]
            });  
        });
		
	    
        $(function(){  
            $('#list-table').datagrid({  
                url: '<c:url value="/sys/user/search"/>',
               	saveUrl: '<c:url value="/sys/user/save"/>',  
                updateUrl: '<c:url value="/sys/user/save"/>',  
                destroyUrl: '<c:url value="/sys/user/delete"/>',
                onSave: function(index,row){
                	$('#list-table').edatagrid('reload'); 
                	$('#list-table').datagrid('clearSelections');
                }
            });  
        });  
        
        
        function searchA(){
       	 var username = $('#username').val();
       	 var realname = $('#realname').val();
            $('#list-table').edatagrid('reload',{username:username,realname:realname});
        }
        
        function reset() {
       	 document.getElementById("username").value="";
       	 document.getElementById("realname").value="";
       }
        
        
    --></script>   
	
</body>
</html>
