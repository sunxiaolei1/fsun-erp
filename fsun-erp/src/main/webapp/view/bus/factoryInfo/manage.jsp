<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/view/base_resource.jsp"%>		

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
.textField{text-align:right;}
.table-new{font-size:12px;}


.center{ 
margin:10px auto; 
width:100%; 
}
/* .center{ 
margin:0px auto; 
width:100%; 
}  */
.loading{ 
width:99%; 
height:23px; 
background:url("<c:url value='/images/bak.png'/>") no-repeat; 
} 
.loading div{
height:22px; 
background:url("<c:url value='/images/pro.png'/>") no-repeat; 
color:#000; 
text-align:center; 
font-family:Tahoma; 
font-size:12px; 
line-height:22px; 
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>主机管理</title>
</head>
<body>
	<div class="easyui-layout" fit="true" id='bt_factory_layout'>
		<div region="center" border="false">
			<table id="list-table" title="厂家信息管理" pageSize="20" data-options="nowrap:false"
				pagination="true" idField="id" fit="true" rownumbers="true" fitColumns="false" singleSelect="true" >
				
			</table>
		</div>
		
		<div region="east" border="false" style="width:750px;padding: 2px;" split='true' collapsed="true" title="详情">
			 <div class="easyui-tabs" fit="true" border="false" id="tabs">
	    	 </div>
		</div>
	</div>

	<!-- 主机编辑窗口 -->		
	<div id="addFactory" class="easyui-window" title="新增主机" closed="true" align="center" style="display:none;width:600px;height:auto;top:80px;" modal="true">  
    	 <form id="factoryfm" method="post" name="factoryfm">  
    	 <input id="id" name="id" type="hidden"/>   	
    	 <table border="0"  class="table-new"  cellpadding="5"   cellspacing="5"> 	
    	 	<tr>
    	 		<td class="textField">
    	 			<span style="color:red">*</span>厂商名称：
    	 		</td>
    	 		<td>
    	 		<input class="easyui-validatebox" type="text"  id="name"  name="name"  data-options="required:true,validType:'uniqueValue'" /> 
    	 		</td>
    	 		<td class="textField" >
    	 			<span style="color:red">*</span>厂商类型：
    	 		</td>
    	 		<td >
    	 			<input  class="easyui-combobox" type="text" id="type" name="type" editable="false" />
    	 		</td>
    	 	</tr>
    	 	<tr>	
    	 		<td class="textField" >
    	 			工艺：
    	 		</td>
    	 		<td >
    	 			<input  class="easyui-combobox" type="text" id="technology" name="technology" editable="false" multiple="true" />
    	 		</td>
    	 		<td class="textField">
    	 			联系人：
    	 		</td>
    	 		<td>
    	 			<input class="easyui-validatebox" type="text"  id="legalPerson" name="legalPerson" /> 
    	 		</td>
    	 	</tr>
    	 	<tr>
    	 		<td class="textField">
    	 			电话号码：
    	 		</td>
    	 		<td>
    	 			<input class="easyui-validatebox" type="text"  id="telephone" name="telephone" data-options="validType:'phone'" />
    	 		</td>
    	 		<td class="textField">
    	 			手机号码：
    	 		</td>
    	 		<td>
    	 			<input class="easyui-validatebox" type="text"  id="mobileTelephone" name="mobileTelephone" data-options="validType:'mobile'" />
    	 		</td>
    	 	</tr>
    	 	<tr>
    	 		<td class="textField">
    	 			地址：
    	 		</td>
    	 		<td>
    	 			<textarea name="address" id="address" rows="2" cols="15" ></textarea>
    	 		</td>
    	 		<td class="textField">
    	 			描述：
    	 		</td>
    	 		<td>
    	 			<textarea name="description" id="description" rows="2" cols="15"></textarea>
    	 		</td>
    	 	</tr>
    	 </table>
    	 </form>
    	 <div style="padding:20px;text-align:center;">  
                <a href="#" class="easyui-linkbutton" icon="icon-ok" onclick="saveFactory()">保存</a>  
                <a href="#" class="easyui-linkbutton" icon="icon-cancel" onclick="closeFactoryWin()">取消</a>  
         </div>  
	</div> 
	
	<div id="openDisableFactoryDiv" class="easyui-window" title="选择厂商"  closed="true" style="width:750px;height:400px;top:50px;" modal="true"> 
    	<table id="disableFactory-table" fit="true" data-options="nowrap:false">
            
    	</table>
	</div> 
	
	<div id="openTypeDiv" class="easyui-window" title="选择产品类型"  closed="true" style="width:500px;height:400px;" modal="true"> 
    	<table id="type-table" fit="true">
            
    	</table>
	</div>
	
	<div id="openProductDiv" class="easyui-window" title="选择产品"  closed="true" style="width:500px;height:400px;top:10px;" modal="true"> 
    	<table id="unAddProduct-table" fit="true">
            
    	</table>
	</div>
	
	<script>

		var curFactoryId ='';
		var technologyComboboxInitValue = '';
		var factoryType = [
				{id:'销售类',text:'销售类'},
               	{id:'加工类',text:'加工类'},
            	{id:'制造类',text:'制造类'}
            ];
		
		$.extend($.fn.validatebox.methods, {  
			remove: function(jq, newposition){  
				return jq.each(function(){  
					$(this).removeClass("validatebox-text validatebox-invalid").unbind('focus.validatebox').unbind('blur.validatebox');
				});  
			},
			reduce: function(jq, newposition){  
				return jq.each(function(){  
				   var opt = $(this).data().validatebox.options;
				   $(this).addClass("validatebox-text").validatebox(opt);
				});  
			}	
		}); 
		
		
		$.extend($.fn.validatebox.defaults.rules, { 
				
			maxLength : { // 判断最大长度
				validator : function(value, param) {
					return value.length <= param[0];
				},
				message : '最多只能输入 {0} 个字(包括空格、标点符号)。'
			},
			idcard : {// 验证身份证
				validator : function(value) {
					return /^\d{15}(\d{2}[A-Za-z0-9])?$/i.test(value);
				},
				message : '身份证号码格式不正确'
			}, 
			uniqueValue : {
				validator : function(value) {				
				    var success = false;	
					$.ajax({
			            type: "post",
			            dataType: "json",
			            async:false,
			            url: '<c:url value="/bus/factoryInfo/uniqueName"/>',
			            data: { 'name':value,'id':curFactoryId },
			            success: function(result) {
			            	success = result.success;
			            }
			        });
			        return success;
					
				},
				message : '该名称已经存在,请换一个！'
			},
			intOrFloat: {// 验证整数或小数
		        validator: function (value) {
		            return /^\d+(\.\d+)?$/i.test(value);
		        },
		        message: '请输入数字，并确保格式正确'
		    },
		    date: {// 验证姓名，可以是中文或英文
		        validator: function (value) {
		            //格式yyyy-MM-dd或yyyy-M-d
		            return /^(?:(?!0000)[0-9]{4}([-]?)(?:(?:0?[1-9]|1[0-2])\1(?:0?[1-9]|1[0-9]|2[0-8])|(?:0?[13-9]|1[0-2])\1(?:29|30)|(?:0?[13578]|1[02])\1(?:31))|(?:[0-9]{2}(?:0[48]|[2468][048]|[13579][26])|(?:0[48]|[2468][048]|[13579][26])00)([-]?)0?2\2(?:29))$/i.test(value);
		        },
		        message: '清输入合适的日期格式'
		    },
		    integer: {// 验证整数 可正负数
		        validator: function (value) {
		            //return /^[+]?[1-9]+\d*$/i.test(value);
	
		            return /^([+]?[0-9])|([-]?[0-9])+\d*$/i.test(value);
		        },
		        message: '请输入整数'
		    },
			fingerprintId : {// 指纹序列号
				validator : function(value) {
					return /^[1-9]\d{6}$/i.test(value);
				},
				message : '身份证号码格式不正确'
			}                  
		});

	
		$(function() {

			var url = '<c:url value="/bus/factoryInfo/search"/>';
			var form = document.factoryfm;
    		var $form = $(form);   
			setTimeout(function () {
				$('#addFactory').window({
			    	onBeforeClose:function(){
			        	$('.validatebox-tip').remove();
			        	$('#name', $form).validatebox('remove');
			    	},
			    	onBeforeOpen:function(){
			    		$('#name', $form).validatebox('reduce');
			    	}
			    });
	        }, 0);
			
			
			$('#addFactory').show();

			//设置text须要验证           
            /*厂商信息录入的表单*/

        	$('#technology', $form).combobox({
		        required: false,
			 	valueField: 'key',
			  	textField: 'value',
			  	url: '<c:url value="/sys/dictionary/getGroupList?key=PRODUCT_PROCESS"/>',
			  	width: '151px',
			    panelHeight: 'auto',
			    onLoadSuccess:function(data){  
			    	if(data!=null && data.length>0){
			    		technologyComboboxInitValue = data[0].key;
			    	}
			    }  
			});	
        	
        	$('#type', $form).combobox({
		        required: true,
			 	valueField: 'id',
			  	textField: 'text',
			  	data:factoryType,
			  	//width: '151px',
			    panelHeight: 'auto',
			    onLoadSuccess:function(data){  
			    	if(data!=null && data.length>0){
			    		$(this).combobox("setValue",data[0].id);
			    	}
			    },
			    onSelect:function(record){
			    	//alert(record);
			    	if(record.id!="加工类"){
			    		$('#technology', $form).combobox("disable");
			    		$('#technology', $form).combobox("clear");
			    	}else{
			    		$('#technology', $form).combobox("enable");
			    		$('#technology', $form).combobox('setValue',technologyComboboxInitValue);
			    	}	
			    }   
			});
    		
			$('#list-table').datagrid({
				url: url,
				loadMsg:'加载中，请稍等。。。',
				columns:[[
							{field:'id',checkbox:true},
							{field:'name',sortable:true, title: '厂商名称',width:"150"},
							{field:'type',sortable:true, title: '厂商类型',width:"80"},
							{field:'technology',sortable:true,title: '工艺',width:"200"},
							{field:'telephone',sortable:true,title: '电话号码',width:"90"},
							{field:'mobileTelephone',sortable:true,title: '手机号码',width:"90"},
							{field:'address',sortable:true,title: '地址',width:"250"},
							{field:'description',title: '备注',width:"150"}							
		            	]],
		        toolbar : [ <sec:authorize  ifAllGranted="FACTORY_ADD">{text: '新增',iconCls: 'icon-add',handler: addFactory},</sec:authorize>
	            	<sec:authorize  ifAllGranted="FACTORY_EDIT">{text: '编辑',iconCls: 'icon-edit',handler: editFactory},</sec:authorize>
	            	<sec:authorize  ifAllGranted="FACTORY_DELETE">{text: '删除',iconCls: 'icon-delete',handler: delFactory},</sec:authorize>
	            	<sec:authorize  ifAllGranted="FACTORY_DISABLE">{text: '禁用',iconCls: 'icon-close',handler: disableFactory},</sec:authorize>
	            	<sec:authorize  ifAllGranted="FACTORY_ENABLE">{text: '选择启用厂商',iconCls: 'icon-open',handler: editDisableFactory}</sec:authorize>
	            	],
	            onBeforeLoad: function(param){
				   $('#list-table').datagrid('clearSelections');	    
				},
				onDblClickRow : function(rowIndex, rowData) {
					$('#bt_factory_layout').layout('panel', 'east').panel({ title: '厂家:'+ rowData.name +'外协回执单'});
					var $layout = $('#bt_factory_layout');
					var east = $layout.layout('panel', 'east');
					if (east.panel('options').collapsed) {
						$layout.layout('expand', 'east');
					}	

					closeAllTabs();					
					var table_url = '<c:url value="/bus/outsourcDetail/manage_edit?outsourcName='+ encodeURI(encodeURI(rowData.name)) 
						+'&technology='+ encodeURI(encodeURI(rowData.technology)) +'"/>';
					addTab(table_url,"外协回执单列表");
				}
			});				
		
		});

		//关闭回执单详情的table
	    function closeTable(){
	    	var $layout = $('#bt_factory_layout');
			var east = $layout.layout('panel', 'east');
			var tt = east.panel('options');
			if (!east.panel('options').collapsed) {
				$layout.layout('collapse', 'east');
			}	
	    }


		 //关闭所有tabs
		function closeAllTabs() {
	       $('.tabs li').each(function(index, obj) {
	            //获取所有可关闭的选项卡
	          var tab = $('.tabs-closable', this).text();
	          $('.easyui-tabs').tabs('close', tab);
	       });      
	    }
		
		 //增加单个tab
	    function addTab(url,title){    
	    	var selected = true;	
		 	$('#tabs').tabs('add', {
	            title : title,
	            closable : true,
	            selected : selected,
	            content : '<iframe id='+ title +' name="content-frame" src="'+url+'" frameborder="0" style="width:100%;height:99%;" scrolling="yes"></iframe>'
	        });       	
		}
		
		/***************************************************厂商增删改查开始*******************************************/
		function addFactory(){

			$('#list-table').datagrid('clearSelections');
			closeTable();	
			$('#addFactory').window({title:'新增厂商'});
			$('#factoryfm')[0].reset(); 
			$('#id').val(''); 
			curFactoryId = '';
	    	
	    	var form = document.factoryfm;
    		var $form = $(form); 
	    	$('input[name=name]', $form).attr('disabled',false);
	        $('#type', $form).combobox('select',"销售类");
	    	$('#addFactory').window('open');   	    	 	
	    }
			 
		function editFactory(){

			 closeTable();
			$('#addFactory').window({title:'编辑厂商'});
		    var factory =$('#list-table').datagrid('getSelections');
		    if(factory.length==1){
				var id = factory[0].id;			
				$('#factoryfm')[0].reset(); 
				$('#technology').combobox('clear'); 		    			
    			$.ajax({
    	        	url:'<c:url value="/bus/factoryInfo/load"/>',
    	        	dataType: "json",
    	        	data:{id:id},
    	        	success:function(rowData,user){
    	        		var factory = rowData.rows;
    	        		var form = document.factoryfm;
    	        		var $form = $(form);   		   	 
    	        		
    	        		$('input[name=id]', $form).val(factory.id);
    	        		curFactoryId = factory.id;	        		
    	        		$('input[name=name]', $form).val(factory.name);
    	        		$('input[name=name]', $form).attr('disabled',true);
    	        		$('#type', $form).combobox('setValue',factory.type);
    	        		$('input[name=legalPerson]', $form).val(factory.legalPerson);
    	        		if(factory.technology!=null && factory.technology!=''){
		                 	var array = factory.technology.split(",");
		                 	$('#technology').combobox('setValues',array);
		                 	//失效
		                 	//$('input[name=technology]', $form).combobox('setValues',array);
		                } 
    	        		$('input[name=telephone]', $form).val(factory.telephone);
    	        		$('input[name=mobileTelephone]', $form).val(factory.mobileTelephone);
    	        		$('#address').val(factory.address);
    	        		$('#description').val(factory.description);  	        		  

    	        		$('#addFactory').window('open');   		        		
    	        	}
    	        });  			   	        
    		}else{
    			$.messager.alert('提示','请选择一项进行修改!','info');
    		}
		}
		 
		function saveFactory(){
			$.messager.progress({title: '请等待',msg: '保存中...',text: '',interval: 700});
			var form = document.factoryfm;
    		var $form = $(form);   	
			$('input[name=name]', $form).attr('disabled',false);		
			$('#factoryfm').form('submit',{  
	               url: '<c:url value="/bus/factoryInfo/save"/>',	         
	               dataType: "json",  
	               async:false,
	               onSubmit: function(){
	            		var isValid = $(this).form('validate');
	            		if (!isValid){
	            			$.messager.progress('close');
	            		}
	            		return isValid;
	            	},
	               success: function(result){
						$.messager.progress('close');
						closeFactoryWin();        
	                	var result = eval('(' + result + ')');  // change the JSON string to javascript object   
	                	if(result.success){
	                		$.messager.show({ title: '提示信息', msg : '保存成功!' }); 
	                		$('#list-table').datagrid('reload');		                	
		                }else{
		                	$.messager.show({ title: '提示信息', msg : '保存失败!' });
			            }
	                							
	                }
	            });
		    	
		    }
         
		//Del
		function delFactory() {

			closeTable();	
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
			                url: '<c:url value="/bus/factoryInfo/delete"/>',
			                data: {"id":ids},
			                success: function(returnData) {
			                	if(returnData.success){
				                	$.messager.show({ title: '提示信息', msg : "删除成功!" }); 
				                	$('#list-table').datagrid('reload');								
			                	}else{
				                	$.messager.show({ title: '提示信息', msg : returnData.message });
					            }		                	
			                }
			            });
					}
				});
			} else {
				$.messager.alert('消息', '请选择要删除的数据!','info');
			}
		}
		
		//refresh
		function refreshFactory() {
			$('#list-table').datagrid('clearSelections');
			$('#list-table').datagrid({
				url:this.url,				
				loadMsg:'加载中，请稍等。。。'
			});     	
		}
		
		function closeFactoryWin(){
			$('.validatebox-tip').remove();
	    	$('#addFactory').window('close');
		}

		function disableFactory(){
			closeTable();
			var rows = $('#list-table').datagrid('getSelections');
			if (rows.length > 0) {
			    var ids = '';
				for ( var i = 0; i < rows.length; i++) {
					ids += rows[i].id + ',';
				}
				ids = ids.substring(0, ids.length - 1);
				$.messager.confirm('Confirm','确定要禁用选择的数据吗?', function(r) {
					if (r) {
						$.ajax({
			                type: "post",
			                dataType: "json",
			                url: '<c:url value="/bus/factoryInfo/disable"/>',
			                data: {"id":ids},
			                success: function(returnData) {
			                	if (returnData.success){ 
									$('#list-table').datagrid('reload');									
								} else {  
								    $.messager.show({ title: 'Error', msg : "禁用失败" }); 
								} 
			                }
			            });
					}
				});
			} else {
				$.messager.alert('消息', '请选择要禁用的数据!','info');
			}
		}


		function editDisableFactory(){
			
			$('#list-table').datagrid('clearSelections');
			closeTable();
			$('#disableFactory-table').datagrid({
	        	url: '<c:url value="/bus/factoryInfo/getDisableFactory"/>',
	        	loadMsg:'加载中，请稍等。。。',
	        	dataType: "json",
	        	frozenColumns: [[{ field: 'id', checkbox: true}]],//固定字段
	        	idField: 'id', //标识字段
	        	//sortName: 'id', //排序字段
	        	rownumbers: true, //显示行号
	        	fitColumns: true,
	        	fit: true,
	        	singleSelect:false,
	        	columns:[[
					//{field:'id', checkbox: true},
					{field:'name', title: '厂商名称',width:"140"},
					{field:'type', title: '厂商类型',width:"80"},
					{field:'technology',title: '工艺',width:"80"},
					{field:'address',title: '地址',width:"190"},
					{field:'description',title: '备注',width:"120"}
	        	]],
	        	toolbar: [{
	        		text: '启用',
	        		iconCls: 'icon-save',
	        		handler:function(){
	        			enableFactory();
	        		}
	        	},{
	    			text: '取消',
	    			iconCls:"icon-undo",
	    			handler:function(){
	    				closeWin('openDisableFactoryDiv');
	        		}
	    		}],
	        	onSelect : function(rowIndex, rowData) {
	        		var types=$('#disableFactory-table').datagrid('getSelections');
	        		var parm=[];
	        		for(var i=0;i<types.length;i++){
	        			parm.push(types[i].id);
	        		}
	        	}
	        });  
        	$('#openDisableFactoryDiv').window('open');
		}

		function enableFactory(){
			var products = $('#disableFactory-table').datagrid('getChecked');
	        var productIds =new Array();    
			for(var i=0;i<products.length;i++){
				var product = products[i];
				productIds.push(product.id);
			}
			$.ajax({
				type: "post",
	    	    dataType: "json",
	        	url: "<c:url value='/bus/factoryInfo/enable'/>",
	        	data: {'id':productIds.length!=0?productIds.join(','):''},
	       		success: function(data) {
	       			closeWin('openDisableFactoryDiv');
					if(data.success){
			        	$.messager.alert('提示','启用成功','info');
			        	$('#disableFactory-table').datagrid('clearSelections');
			        	$('#list-table').datagrid('reload');
			        }else{
			        	$.messager.alert('提示','启用失败','info');		        	
					}
		        	
	        	}
	    	});
		}
        
		
		/***************************************************厂商增删改查结束*******************************************/
		
		//close windows
		function closeWin(obj){
			$('#'+obj).window('close');
		}

	</script>
</body>
</html>