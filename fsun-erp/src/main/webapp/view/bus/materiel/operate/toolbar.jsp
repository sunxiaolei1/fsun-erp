<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="<c:url value='/css/main.css'/>" />
<!-- Search panel start -->
<div id="toolbar"  style="padding:2px;display:none;" >
	 <span style="float:right;margin-top:-2px;">	
	 	<label>分类：</label>
		<input id="classify" class="easyui-combobox"  />     
		<label>物料名称：</label>
		<input id="materielName" type="text" style="margin-top:3px;" />          
		<input type="button" class="search-btn" value="搜索" onMouseOver="this.className='on-search-btn'" onMouseOut="this.className='search-btn'" onfocus="this.blur()" onclick="javascript:searchA()"/>
		<input type="button" class="reset-btn" value="重置" onMouseOver="this.className='on-reset-btn'" onMouseOut="this.className='reset-btn'" onfocus="this.blur()" onclick="javascript:reset()" />		           		
     </span>
	<!--<sec:authorize  ifAllGranted="MATERIEL_ADD">-->
		<a href="javascript:void(0)" class="easyui-linkbutton"	iconCls="icon-add" plain="true"	onclick="javascript:$('#list-table').edatagrid('addRow')">新增</a> 
	<!--</sec:authorize>-->
	<sec:authorize  ifAllGranted="MATERIEL_EDIT">
		<a href="javascript:void(0)" class="easyui-linkbutton"	iconCls="icon-edit" plain="true"  onclick="javascript:productEdit()">编辑</a> 
	</sec:authorize>
	<sec:authorize  ifAllGranted="MATERIEL_DELETE">
		<a	href="javascript:void(0)" class="easyui-linkbutton"	iconCls="icon-delete" plain="true" onclick="javascript:delProduct()">删除</a>
	</sec:authorize>
	<sec:authorize  ifAllGranted="MATERIEL_DISABLE">
		<a	href="javascript:void(0)" class="easyui-linkbutton"	iconCls="icon-close" plain="true" onclick="javascript:disableProduct()">禁用</a>
	</sec:authorize>
	<sec:authorize  ifAllGranted="MATERIEL_ENABLE">
		<a	href="javascript:void(0)" class="easyui-linkbutton"	iconCls="icon-open" plain="true" onclick="javascript:editProduct()">选择启用物料</a>
	</sec:authorize>
	<sec:authorize  ifAllGranted="MATERIEL_COMMIT">
		<a href="javascript:void(0)" class="easyui-linkbutton"	iconCls="icon-save" plain="true"  onclick="javascript:$('#list-table').edatagrid('saveRow')">保存</a> 
	</sec:authorize>
	<sec:authorize  ifAllGranted="MATERIEL_CANCEL">
		<a	href="javascript:void(0)" class="easyui-linkbutton"	iconCls="icon-undo" plain="true"  onclick="javascript:$('#list-table').edatagrid('cancelRow')">取消</a>
	</sec:authorize>	
</div>
<!--  Search panel end -->

<script type="text/javascript">

    $(function(){
		$('#classify').combobox({
			method:'get',
		    required: false,
		 	valueField: 'id',
		  	textField: 'name',
		  	url: '<c:url value="/bus/classify/list"/>',
		    panelHeight: 100
		});
	
		$("#toolbar").show(); 
	});

	 function searchA(){
		var classifyId =  $('#classify').combobox('getValue');
		var name =  $('#materielName').val();
        $('#list-table').datagrid('reload',{
        	classifyId:classifyId,
	        name:name
	      });
     };	
		
    function reset() {	   
       	$('#classify').combobox('clear');
        $('#materielName').val(''); 
    };  
 
</script>