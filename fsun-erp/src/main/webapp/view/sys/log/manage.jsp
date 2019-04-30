<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/view/resource.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>日志管理</title>
<link rel="stylesheet" href="<c:url value='/css/main.css'/>" />
</head>
<body>
	<div class="easyui-layout" fit="true">
		<!-- Search panel start -->
		<div id="searchbar" class="ui-search-panel" region="north" style="line-height:28px;height:65px;padding:5px 5px;"
			title="搜索"
			data-options="striped: true,collapsible:false,iconCls:'icon-search',border:false">
			 <label>日志类型：</label>
			    <input id="operateType" name="operateType" class="easyui-combobox" data-options="data:isuseds,valueField:'id',textField:'text'">    
			 <label>操作时间：</label>
			    <input id="startDate" name="startDate_str" class="easyui-datebox"  > 
			    <input id="endDate" name="endDate_str" class="easyui-datebox"  >     
			    <input style="vertical-align: middle;" type="button" class="search-btn" value="搜索" onMouseOver="this.className='on-search-btn'" onMouseOut="this.className='search-btn'" onfocus="this.blur()" onclick="javascript:searchA()"/>
				<input style="vertical-align: middle;" type="button" class="reset-btn" value="重置" onMouseOver="this.className='on-reset-btn'" onMouseOut="this.className='reset-btn'" onfocus="this.blur()" onclick="javascript:reset()" />
				<!-- <a href="#" class="easyui-linkbutton" iconCls="icon-search" onclick="javascript:searchA()">搜索</a> -->
		</div>
		<!--  Search panel end -->
		<!-- DataList  -->
		<div region="center" border="false">
			<table id="list-table" title="日志管理" class="easyui-datagrid" pagination="true" idField="id" url="<c:url value="/sys/log/search"/>"
				fit="true" rownumbers="true" fitColumns="false" pageSize="20" singleSelect="true">
				<thead>
					<tr>
						<th field="logContent" width="200" sortable="true" >日志内容</th>
						<th field="note" width="100" sortable="true">操作人IP</th>
						<th field="userName" width="100" sortable="true" >帐号</th>
						<th field="realName" width="100" sortable="true" >姓名</th>
						<th field="operateType" width="100" sortable="true" formatter="aaaa" >日志类型</th>
						<th field="broswer" width="100" sortable="true">浏览器</th>
						<th field="operateTime" width="150" sortable="true" sortable="true" >操作时间</th>
					</tr>
				</thead>
			</table>
		</div>
	</div>
	<script type="text/javascript">
	
			var aaaa = function(value,row,index){
				if(value == 1)
					return "登陆";
				else if(value == 2)
					return "退出";
				else if(value == 3)
					return "插入";
				else if(value == 4)
					return "删除";
				else if(value == 5)
					return "更新";
				else if(value == 6)
					return "打印";
				else if(value == 8)
					return "数据库备份";
				else if(value == 9)
					return "数据库恢复";
				else 
					return "其他";
			};
	
		  var isuseds = [{id:'1',text:'登陆'}, 
		                 {id:'2',text:'退出'}, 
		                 {id:'3',text:'插入'}, 
		                 {id:'4',text:'删除'}, 
		                 {id:'5',text:'更新'}, 
		                 {id:'6',text:'打印'}, 
		                 {id:'7',text:'其他'}
		  ];
		
		
			
		   function searchA(){
			  var startDate =  $('#startDate').combobox('getValue');
			  var endDate =  $('#endDate').combobox('getValue');
	          var operateType = $('#operateType').combobox('getValue');
	          $('#list-table').datagrid('reload',{operateType:operateType,startDate_str:startDate,endDate_str:endDate});
	       };	
			
	       function reset() {
	           $('#operateType').combobox('setValue','');
	           $('#startDate').datebox('setValue','');
	           $('#endDate').datebox('setValue','');
	       };
		
	</script>
</body>
</html>