<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div id="list-operate-toolbar-${currIndex}" region="north" style="display:none; padding:2px 2px;border-bottom:none;"
			data-options="collapsible:false">	
	<sec:authorize  ifAllGranted="BUYINFO_ADD">
		<a href="javascript:void(0)" class="easyui-linkbutton"	iconCls="icon-add" plain="true"	onclick="addOrder()">新增</a> 
	</sec:authorize>
	<sec:authorize  ifAllGranted="BUYINFO_EDIT">
		<a href="javascript:void(0)" class="easyui-linkbutton"	iconCls="icon-edit" plain="true"  onclick="editOrder()">编辑</a> 
	</sec:authorize>
	<sec:authorize  ifAllGranted="BUYINFO_DELETE">
		<a	href="javascript:void(0)" class="easyui-linkbutton"	iconCls="icon-delete" plain="true"	onclick="delOrder()">删除</a>
	</sec:authorize>
	<sec:authorize  ifAllGranted="BUYINFO_ADD">
		<a	href="javascript:void(0)" class="easyui-linkbutton"	iconCls="icon-add" plain="true"	onclick="createMaterielAndDetail()">建物料和明细</a>
	</sec:authorize>
	<sec:authorize  ifAllGranted="BUYINFO_ACCEPT">
		<a href="javascript:void(0)" class="easyui-linkbutton"	iconCls="icon-save" plain="true"  onclick="acceptOrder()">验收</a>
	</sec:authorize>
	<sec:authorize  ifAllGranted="PURCHASE_POS">
		<a href="javascript:void(0)" class="easyui-linkbutton"	iconCls="icon-print" plain="true"  onclick="definedMakePos()">自定义采购单</a>
	</sec:authorize>
	<sec:authorize  ifAllGranted="BUYINFO_TEMPLETE_EXPORT">
		<a	href="javascript:void(0)" class="easyui-linkbutton"	iconCls="icon-undo" plain="true"  onclick="templateDownload()">EXCEL导出</a>
	</sec:authorize>
	<sec:authorize  ifAllGranted="BUYINFO_UPDATE_FACTORY">
		<span style="float:right;">		   
			<sec:authorize  ifAllGranted="FACTORY_ADD">
		    	<a href="javascript:void(0)" title="创建厂家" class="easyui-linkbutton"	iconCls="icon-add" plain="true"	onclick="addFactory()">厂家：</a>
			</sec:authorize>
			<input id="updateFactoryId-${currIndex}" editable="false" /> 
			<a	href="javascript:void(0)" class="easyui-linkbutton"	iconCls="icon-reload" plain="true"  onclick="updateFactory()">更新</a>
		</span>
	</sec:authorize>
			
</div>