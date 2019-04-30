<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- 主机编辑窗口 -->		
<div id="addCustomer" class="easyui-window" title="新增客户" closed="true" align="center" style="display:none;width:600px;height:auto;top:80px;" buttons="#dlg-buttons" modal="true">  
   	 <form id="customerfm" method="post" name="customerfm">  
   	 <input id="id" name="id" type="hidden"/>  
   	 <input id="code" name="code" type="hidden"/>  	
   	 <table border="0"  class="table-new"  cellpadding="5"   cellspacing="5"> 	
   	 	<tr>
   	 		<td class="textField">
   	 			<span style="color:red">*</span>客户名称：
   	 		</td>
   	 		<td>
   	 		<input class="easyui-validatebox" type="text"  id="name"  name="name"  data-options="required:true,validType:'uniqueValue'" /> 
   	 		</td>
   	 		<td class="textField">
   	 			联系人：
   	 		</td>
   	 		<td>
   	 		<input class="easyui-validatebox" type="text"  id="contacts" name="contacts" /> 
   	 		</td>  	 		
   	 	</tr>
   	 	<tr>
   	 		<td class="textField">
   	 			电话：
   	 		</td>
   	 		<td>
   	 		<input class="easyui-validatebox" type="text"  id="tel" name="tel" /> 
   	 		</td>
   	 		<td class="textField">
   	 			传真：
   	 		</td>
   	 		<td>
   	 			<input class="easyui-validatebox" type="text"  id="fax" name="fax" />
   	 		</td>
   	 	</tr>
   	 	<tr> 
   	 		<td class="textField">
   	 			地址：
   	 		</td>
   	 		<td>
   	 			<textarea name="address" rows="2"></textarea>
   	 		</td>  	 		
   	 		<td class="textField">
   	 			描述：
   	 		</td>
   	 		<td>
   	 			<textarea name="description" rows="2"></textarea>
   	 		</td>
   	 	</tr>
   	 </table>
   	 </form>
   	 <div style="padding:20px;text-align:center;">  
               <a href="#" class="easyui-linkbutton" icon="icon-ok" onclick="saveCustomer()">保存</a>  
               <a href="#" class="easyui-linkbutton" icon="icon-cancel" onclick="closeCustomerWin()">取消</a>  
        </div>  
</div> 

<div id="openDisableCustomerDiv" class="easyui-window" title="选择客户"  closed="true" style="width:600px;height:400px;top:50px;" modal="true"> 
   	<table id="disableCustomer-table" fit="true">
           
   	</table>
</div> 

<script type="text/javascript">

var curCustomerId ='';

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
		            url: '<c:url value="/bus/customer/uniqueName"/>',
		            data: { 'name':value,'id':curCustomerId },
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

	$(function(){

		//设置text须要验证           
        /*厂商信息录入的表单*/
		var form = document.customerfm;
		var $form = $(form);   		
		$('input[name=name]', $form).validatebox();
		
		$('#addCustomer').show();
		  
	})


	/***************************************************客户增删改查开始*******************************************/

	    function comBoxReload(){
	    	$('#customerCode').combobox('reload');
	        $('#customerName').combobox('reload'); 
	        $('#customerContacts').combobox('reload');
		} 
		
		
		function addCustomer(){	
			$('#list-table').datagrid('clearSelections');
			$('#addCustomer').window({title:'新增客户'});
			$('#customerfm')[0].reset(); 
			$('#id').val('');
			$('#code').val(''); 
	    	
	    	var form = document.customerfm;
    		var $form = $(form); 
	    	$('input[name=name]', $form).attr('disabled',false); 
	    	$('#addCustomer').window('open');   	    	 	
	    }
			 
		function editCustomer(){
		
			$('#addCustomer').window({title:'编辑客户'});
		    var customer =$('#list-table').datagrid('getSelections');
		    if(customer.length==1){
				var id = customer[0].id;			
				$('#customerfm')[0].reset();  		    			
    			$.ajax({
    	        	url:'<c:url value="/bus/customer/load"/>',
    	        	dataType: "json",
    	        	data:{id:id},
    	        	success:function(rowData,user){
    	        		$('#customerfm').form('load',rowData.rows);
    	        		var form = document.customerfm;
    	        		var $form = $(form);   		
    	        		$('input[name=name]', $form).attr('disabled',true); 
    	        		curCustomerId = $('input[name=id]', $form).val();  
    	        		$('#addCustomer').window('open');   		        		
    	        	}
    	        });  			   	        
    		}else{
    			$.messager.alert('提示','请选择一项进行修改!','info');
    		}
		}
		 
		function saveCustomer(){
			$.messager.progress({title: '请等待',msg: '保存中...',text: '',interval: 700});
			//var form = document.customerfm;
    		//var $form = $(form);   	
			//$('input[name=name]', $form).attr('disabled',false);

			$('#customerfm').form('submit',{  
	               url: '<c:url value="/bus/customer/save"/>',	         
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
						closeCustomerWin();        
	                	var result = eval('(' + result + ')');  // change the JSON string to javascript object   
	                	if(result.success){
	                		$.messager.show({ title: '提示信息', msg : '保存成功!' }); 
	                		$('#list-table').datagrid('reload');		                	
		                	comBoxReload();
		                }else{
		                	$.messager.show({ title: '提示信息', msg : result.message });
			            }
	                							
	                }
	            });
		    	
		    }
         
		//Del
		function delCustomer() {
				
			var rows = $('#list-table').datagrid('getSelections');
			if (rows.length > 0) {
				var ids = '';
			    var customerCodes = '';
				for ( var i = 0; i < rows.length; i++) {
					ids += rows[i].id + ',';
					customerCodes += rows[i].code + ',';
				}
				ids = ids.substring(0, ids.length - 1);
				customerCodes = customerCodes.substring(0, customerCodes.length - 1);

				$.ajax({
	                type: "GET",
	                dataType: "json",
	                async:false,
	                url: '<c:url value="/bus/order/existOrderByCustomerCode"/>-'+customerCodes,           
	                success: function(result) {
	                	if (result.success){ 
	                		$.messager.alert('警告', '选中的客户中有已经使用在订单中不能删除，请勾掉已经使用在订单中的客户!','info');
						}else{
							$.messager.confirm('Confirm','确定要删除选择的数据吗?', function(r) {
								if (r) {
									$.ajax({
						                type: "post",
						                dataType: "json",
						                url: '<c:url value="/bus/customer/delete"/>',
						                data: {"id":ids},
						                success: function(returnData) {
						                	if(returnData.success){
							                	$.messager.show({ title: '提示信息', msg : "删除成功!" }); 
							                	$('#list-table').datagrid('reload');									
												comBoxReload();
						                	}else{
							                	$.messager.show({ title: '提示信息', msg : '删除失败!' });
								            }		                	
						                }
						            });
								}
							});
						}
	                }
	            });	
			} else {
				$.messager.alert('消息', '请选择要删除的数据!','info');
			}
		}
		
		//refresh
		function refreshCustomer() {
			$('#list-table').datagrid({
				url:this.url,				
				loadMsg:'加载中，请稍等。。。'
			});     	
		}
		
		function closeCustomerWin(){
			$('.validatebox-tip').remove();
	    	$('#addCustomer').window('close');
		}

		function disableCustomer(){
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
			                url: '<c:url value="/bus/customer/disable"/>',
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


		function editDisableCustomer(){
			$('#list-table').datagrid('clearSelections');
			$('#disableCustomer-table').datagrid({
	        	url: '<c:url value="/bus/customer/getDisableCustomer"/>',
	        	loadMsg:'加载中，请稍等。。。',
	        	dataType: "json",
	        	frozenColumns: [[{ field: 'id', checkbox: true}]],//固定字段
	        	idField: 'id', //标识字段
	        	//sortName: 'id', //排序字段
	        	rownumbers: true, //显示行号
	        	fit: true,
	        	singleSelect:false,
	        	columns:[[
	      	        
					{field:'name', title: '客户名称',width:"200"},
					{field:'contacts',title: '联系人',width:"80"}, 					
					{field:'address',title: '地址',width:"230"}
	        	]],
	        	toolbar: [{
	        		text: '启用',
	        		iconCls: 'icon-save',
	        		handler:function(){
	        			enableCustomer();
	        		}
	        	},{
	    			text: '取消',
	    			iconCls:"icon-undo",
	    			handler:function(){
	    				closeWin('openDisableCustomerDiv');
	        		}
	    		}],
	        	onSelect : function(rowIndex, rowData) {
	        		var types=$('#disableCustomer-table').datagrid('getSelections');
	        		var parm=[];
	        		for(var i=0;i<types.length;i++){
	        			parm.push(types[i].id);
	        		}
	        	}
	        });  
        	$('#openDisableCustomerDiv').window('open');
		}

		function enableCustomer(){
			var products = $('#disableCustomer-table').datagrid('getChecked');
	        var productIds =new Array();    
			for(var i=0;i<products.length;i++){
				var product = products[i];
				productIds.push(product.id);
			}
			$.ajax({
				type: "post",
	    	    dataType: "json",
	        	url: "<c:url value='/bus/customer/enable'/>",
	        	data: {'id':productIds.length!=0?productIds.join(','):''},
	       		success: function(data) {
	       			closeWin('openDisableCustomerDiv');
					if(data.success){
			        	$.messager.alert('提示','启用成功','info');
			        	$('#disableCustomer-table').datagrid('clearSelections');
			        	$('#list-table').datagrid('reload');
			        }else{
			        	$.messager.alert('提示','启用失败','info');		        	
					}
		        	
	        	}
	    	});
		}
        
		
	/***************************************************客户增删改查结束*******************************************/

	
	//close windows
	function closeWin(obj){
		$('#'+obj).window('close');
	}


</script>