<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div id="vmuserwin-${currIndex}" class="easyui-window" title="新增采购明细" closed="true" align="center" style="display:none;width:600px;height:290px;top:120px;" modal="true">  
   	 <form id="buyInfofm-${currIndex}" method="post" name="buyInfofm-${currIndex}"> 
   	 <input id="id" name="id" type="hidden"/>
   	 <input id="purchaseId" name="purchaseId" value="${purchaseId}" type="hidden"/>
   	 <table border="0" class="table-new"  cellpadding="5"  cellspacing="5" style="padding-top:10px;">
   	 	<tr>
   	 		<td class="textField" >
   	 			<span style="color:red">*</span>物料分类：
   	 		</td >
   	 		<td colspan="2" >
   	 			<input name="classifyId" id="classifyId" editable="false"  />
   	 		</td>
   	 		<td class="textField">
   	 			<span style="color:red">*</span>物料名称：
   	 		</td>
   	 		<td id="materielIdTD">
   	 			<input name="materielId" id="materielId" />
   	 		</td>
   	 		<td id="materielNameTD" style="display:none;">
   	 			<input class="easyui-validatebox" name="materielName" id="materielName" data-options="validType:['uniqueMaterielValue','maxLength[36]']" />
   	 		</td> 	 		
   	 	</tr>
   	 	<tr>
   	 		<td class="textField">
   	 			<span style="color:red">*</span>数量：
   	 		</td>
   	 		<td>
   	 			<input type="text" name="number" id="number" class="easyui-numberbox" style="width:90px;"
   	 				data-options="required:true" min="0" >
   	 		</td>
   	 		<td>
   	 			<input name="unit" id="unit" style="width:48px;" class="easyui-combobox" editable="false" data-options="required:true,data:unitValue,valueField:'id',textField:'text',panelHeight:'auto'"/>
   	 		</td>
   	 		<td class="textField">
   	 			单价：
   	 		</td>
   	 		<td>
   	 			<input type="text" name="onePrice" id="onePrice" class="easyui-numberbox" precision="2" min="0" >(元)
   	 		</td>
   	 	</tr>
   	 	<tr>  
   	 		<td class="textField">
   	 			规格型号：
   	 		</td>
   	 		<td colspan="2">
   	 			<input name="spec" id="spec" type="text" />
   	 		</td>
   	 		<td class="textField">
   	 			供货厂家：
   	 		</td>
   	 		<td>
   	 			<input name="factoryId" id="factoryId" editable="false" class="easyui-combobox" 
   	 				data-options="url:'<c:url value="/bus/factoryInfo/sale/list"/>',valueField:'id',textField:'name',panelHeight:'auto'" />
   	 		</td>   	 		
   	 	</tr>
   	 	<tr>  
   	 		<td class="textField">
   	 			备注：
   	 		</td>
   	 		<td colspan="4">
   	 		 	<textarea name="description" rows="2" cols="55"  class="easyui-validatebox" validType="maxLength[56]" ></textarea>
   	 		</td >
   	 	</tr>
   	 </table>
   	 </form>
   	 <div style="padding:10px;text-align:center;">  
            <a href="#" class="easyui-linkbutton" icon="icon-ok"onclick="saveOrder()">保存</a>  
            <a href="#" class="easyui-linkbutton" icon="icon-cancel"onclick="closeWin()">取消</a>  
     </div>   
</div>  	

<script>

  /***************************************** 订单的增删改查 开始  **************************************************/
	var defaultClassifyId = "";
	 /*进货信息录入的表单*/
	var $form = $("#buyInfofm-${currIndex}");
	 
	$.extend($.fn.validatebox.defaults.rules, { 
		
		maxLength : { // 判断最大长度
			validator : function(value, param) {
				return value.length <= param[0];
			},
			message : '最多只能输入 {0} 个字(包括空格、标点符号)。'
		}, 
		uniqueMaterielValue : {
			validator : function(value) {				
			    var success = false;	
				$.ajax({
		            type: "post",
		            dataType: "json",
		            async:false,
		            url: '<c:url value="/bus/materiel/uniqueName"/>',
		            data: { 'name':value },
		            success: function(result) {
		            	success = result.success;
		            }
		        });
		        return success;
				
			},
			message : '该名称已经存在,请换一个！'
		}            
	});

	
    $(function() {
    	
		 $('#materielId',$form).combobox({      			
        	required: true,
   	 		valueField: 'id',
   	  		textField: 'name',
   	   		panelHeight: 200,
   	   	    onSelect:function(record){
	    		$('#onePrice',$form).numberbox("setValue",record.price);
	    		$('#spec',$form).val(record.spec);
	    	}   
   		});
		 
		freshFactoryCombobox($form);

		$.ajax({
	       	url:'<c:url value="/bus/classify/list"/>',	
	       	dataType: "json",
	       	async:false,
	       	success:function(json){
	        	if(json.length>0){
	        		$('#classifyId',$form).combobox({      			
	        	        required: true,
	        	   	 	valueField: 'id',
	        	   	  	textField: 'name',
	        	   	  	data: json,
	        	   	    panelHeight: 200,
	        	   	 	onLoadSuccess:function(data){  
	 			    		if(data!=null && data.length>0){
	 			    		    defaultClassifyId = data[0].id;
	 			    		}
	 			    	},
	 			    	onSelect:function(record){
	 			    		var disabled = $('#materielId',$form).attr("disabled");	 			    		
 			    			$('#materielId',$form).combobox("clear");
	 			    		var url = '<c:url value="/bus/materiel/list?classifyId="/>'+ record.id;
	 			    		$('#materielId',$form).combobox("reload",url); 			    		
	 			    		$('#unit',$form).combobox("select",record.unit);
	 			    	}   
	        	   	});
	        	}
	       	}
		});

		
		//设置text须要验证             		
		$('input[name=description]', $form).validatebox(); 
		
		setTimeout(function () {
			$('#vmuserwin-${currIndex}').window({
		    	onBeforeClose:function(){
		    		$('#materielId',$form).combobox({required: true});
		        	$('#materielIdTD').show();
		        	$('#materielNameTD',$form).hide();
		        	$('#materielName',$form).attr("disabled",true);
		        	$('#materielName',$form).validatebox({required: false});
		        	$('.validatebox-tip').remove();
		    	},onBeforeOpen:function(){
		    		//$(this).attr("height",auto);
		    	}
		    });
        }, 0);
		
	    $('#vmuserwin-${currIndex}').show();
		
	    
	});
  
    function closeWin(){		
    	$('#vmuserwin-${currIndex}').window('close');
    }
	 
	function addOrder(){
    	$('#vmuserwin-${currIndex}').window('open');
    	$('#buyInfofm-${currIndex}')[0].reset();
    	$('#id').val('');
    	$('#classifyId',$form).combobox("select",defaultClassifyId);
    }
	 
	function createMaterielAndDetail(){
		$('#vmuserwin-${currIndex}').window('open');
    	$('#materielIdTD',$form).hide();
    	$('#materielNameTD',$form).show();
    	$('#materielName',$form).attr("disabled",false);
    	$('#materielName',$form).validatebox({required: true});
    	$('#buyInfofm-${currIndex}')[0].reset();
    	$('#id').val('');
    	$('#classifyId',$form).combobox("select",defaultClassifyId);
    	$('#materielId',$form).combobox({required: false});
	}
	 
	 function editOrder(){

		 var rows = detailGird.datagrid('getSelections');
		 if(rows.length==1){
			if(acceptSuccess(rows)){
				return ; 
			 }
		 	var ida = rows[0].id;
		 	$('#buyInfofm-${currIndex}')[0].reset();
   			$.ajax({
   	        	url:'<c:url value="/bus/buyInfo/load"/>',
   	            type: "GET",
   	        	async:false,
   	        	dataType: "json",
   	        	data:{id:ida},
   	        	success:function(rowData){   	               
   	         		var obj = rowData.rows;
   	        		$('#id',$form).val(obj.id);
   	        		$('#classifyId',$form).combobox('select',obj.classifyId);
      	        	$('#materielId',$form).combobox('setValue',obj.materielId);
      	        	$('#number',$form).numberbox('setValue',obj.number);
      	        	$('#onePrice',$form).numberbox('setValue',obj.onePrice);
      	        	$('#unit',$form).combobox('select',obj.unit);
      	        	$('#factoryId',$form).combobox('select',obj.factoryId);
      	        	$('#description',$form).val(obj.description);
      	        	$('#spec',$form).val(obj.spec);
      	        	$('#vmuserwin-${currIndex}').window('open');
   	        	}
   	        });
   		}else{
   			$.messager.alert('提示','请选择一项进行修改!','info');
   			detailGird.datagrid('clearSelections');
   		}
	 }
	 
	 function updateFactory(){

		 var factoryId = $("#updateFactoryId-${currIndex}").combobox("getValue");
		 if(factoryId==null || factoryId==''){
			 $.messager.alert('提示','请选择一个厂家!','info')
			 return;
		 }
		 var rows = detailGird.datagrid('getSelections');	    	
		 if (rows.length > 0) {
			if(acceptSuccess(rows)){
				return ; 
			 }
				 
			var ids = new Array();   
	    	var names = new Array();     	 
   			for(var i=0;i<rows.length;i++){
   				ids.push(rows[i].id);
   				names.push(rows[i].materielName); 				
   			}
			$.messager.confirm('Confirm','确定要更新吗?', function(r) {
				if (r) {
					$.ajax({
		                type: "post",
		                dataType: "json",
		                async:false,
		                url: '<c:url value="/bus/buyInfo/updateFactory"/>',
		                data: {	
		                	"purchaseId": '${purchaseId}',
			                "ids":ids.length!=0?ids.join(','):'',
	                		"names":names.length!=0?names.join(','):'',
	                	    "factoryId":factoryId			
				        },
		                success: function(returnData) {
		                	if(returnData.success){				                
		                		$.messager.show({ title: '提示信息', msg : '更新供货厂家成功' });
		                		detailGird.datagrid('reload');
		                		detailGird.datagrid('clearSelections');				              			                		 
			                }else{
			                	$.messager.show({ title: '提示信息', msg : returnData.message }); 
			                }				                				                														                	
		                }
		            });
				}
			});
		} else{
   			$.messager.alert('提示','请至少选择一项进行更新厂家!','info');
   		}
	 }
	 
	 function saveOrder(){
		 $form.form('submit',{  
               url: '<c:url value="/bus/buyInfo/save"/>',  
               dataType: "json",
               async:false,
               success: function(result){
               	    closeWin();
               		var result = eval('(' + result + ')');  // change the JSON string to javascript object   
               		if(result.success){
               			$.messager.show({ title: '提示信息', msg : '保存成功' });
               			detailGird.datagrid('reload');
               			detailGird.datagrid('clearSelections');
               			refreshSelectedRow(result.order,'${currIndex}');
               		}else{
               			$.messager.show({ title: '提示信息', msg : '保存失败' });                 	
               		}        							
               }
           });
    }
	 
	  //Del
		function delOrder() {

			var rows = detailGird.datagrid('getSelections');
			if (rows.length > 0) {
				if(acceptSuccess(rows)){
					return ; 
				 }
				
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
			                async:false,
			                url: '<c:url value="/bus/buyInfo/delete"/>',
			                data: {"id":ids,"purchaseId":'${purchaseId}'},
			                success: function(returnData) {
			                	if(returnData.success){
			                		$.messager.show({ title: '提示信息', msg : '删除成功' });			            
			                		detailGird.datagrid('reload');
			                		detailGird.datagrid('clearSelections');	
			                		refreshSelectedRow(returnData.order,'${currIndex}');
				                }else{
				                	$.messager.show({ title: '提示信息', msg : '删除失败' }); 
				                }				                				                														                	
			                } 
			            });
					}
				});
			} else {
				$.messager.alert('消息', '请选择要删除的数据!','info');
			}
		}

	    function acceptOrder(){

	    	var rows = detailGird.datagrid('getSelections');		
			if (rows.length > 0) {
				if(acceptSuccess(rows)){
					return ; 
				}
				
				var ids = new Array();   
		    	var names = new Array();     	 
	   			for(var i=0;i<rows.length;i++){
	   				ids.push(rows[i].id);
	   				names.push(rows[i].materielName); 				
	   			}
				$.messager.confirm('Confirm','确定要验收选择的数据吗?', function(r) {
					if (r) {
						$.ajax({
			                type: "post",
			                dataType: "json",
			                async:false,
			                url: '<c:url value="/bus/buyInfo/accept"/>',
			                data: {	
			                	"purchaseId": '${purchaseId}',
				                "ids":ids.length!=0?ids.join(','):'',
		                		"names":names.length!=0?names.join(','):''
					        },
			                success: function(returnData) {
			                	if(returnData.success){				                
			                		$.messager.show({ title: '提示信息', msg : '验收成功' });
			                		detailGird.datagrid('reload');
			                		detailGird.datagrid('clearSelections');				              			                		 
				                }else{
				                	$.messager.show({ title: '提示信息', msg : returnData.message }); 
				                }				                				                														                	
			                }
			            });
					}
				});
			} else {
				$.messager.alert('消息', '请选择要验收的数据!','info');
			}
	    }

	    function acceptSuccess(rows){
			if (rows.length > 0) {
				var ids = new Array();   
		    	var names = new Array(); 			    	 
	   			for(var i=0;i<rows.length;i++){
	   				var row = rows[i];
	   				ids.push(row.id);
	   				names.push(row.materielName);		   					   				
	   			}
	   			var acceptSuccess = true;
	   			$.ajax({
	                type: "POST",
	                dataType: "json",
	                async:false,
	                url: '<c:url value="/bus/buyInfo/acceptSuccess"/>',
	                data: {			             
		                "ids":ids.length!=0?ids.join(','):'',
                		"names":names.length!=0?names.join(','):''       				
			        },
	                success: function(result) {
	                	if(result.success){	
	                		$.messager.alert('提示',result.message,'info');			    		              			                		 
		                }else{
		                	acceptSuccess = false;
			            }			                				                														                	
	                }
	            });
			}
			return acceptSuccess;
		}
	    
	    /**
		    可以选择部分产品来制作送货单
		**/
		function definedMakePos(){
			var buyInfos = detailGird.datagrid('getSelections');
			var buyInfoIds = new Array();   
			if(buyInfos.length>0){	
				if(acceptSuccess(buyInfos)){
					return ; 
				}
				for(var i=0;i<buyInfos.length;i++){
					var buyInfo = buyInfos[i];
					buyInfoIds.push(buyInfo.id);   				
				}  
			}else{
				var rows = detailGird.datagrid('getData');
				if(acceptSuccess(rows)){
					return ; 
				}
			}
			makePos(buyInfoIds.length!=0?buyInfoIds.join(','):'');
		}
	    
	    function freshFactoryCombobox($form){
	    	$.ajax({
		       	url:'<c:url value="/bus/factoryInfo/sale/list"/>',	
		       	dataType: "json",
		       	async:false,
		       	success:function(json){
		        	if(json.length>0){
		        		$('#factoryId',$form).combobox({      			
		        	   	 	valueField: 'id',
		        	   	  	textField: 'name',
		        	   	  	data: json,
		        	   	    panelHeight: 200  
		        	   	});
		        		$('#updateFactoryId-${currIndex}').combobox({      			
		        	   	 	valueField: 'id',
		        	   	  	textField: 'name',
		        	   	  	data: json,
		        	   	    panelHeight: 200  
		        	   	});
		        	}
		       	}
			});
	    }
	    
	    
		//excel表模板导出
		function templateDownload(){	
			window.location.href = '<c:url value="/bus/buyInfo/excelExport?purchaseId=${purchaseId}"/>';
		}

			
	 /***************************************** 订单的增删改查 结束  **************************************************/
</script>		

