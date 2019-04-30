<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/view/base_resource.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
	a {color:#07519A; text-decoration: none}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript"
	src="<c:url value='/js/jquery-easyui/jquery.role_edatagrid.js'/>"></script>
<title></title>
</head>
<body>
	<div class="easyui-layout" fit="true" id='bt_role_layout'>
		<div region="center" style="border-bottom: none;">
			<table id="list-table" toolbar="#toolbar" nowrap="false" style="display:none;"
				pagination="false" idField="id" fit="true" rownumbers="true"
				fitColumns="true" singleSelect="true" data-options="url:'<c:url value="/bus/orderDetail/search?orderId=${orderId}"/>'">
				<thead>
					<tr>
						<th field="id" hidden="true"></th>
						<th field="orderId" width="50" hidden="true">订单ID</th>
						<th field="productCode" width="50" sortable="true"
							editor="{type:'combobox',options:{required:true,url:'<c:url value="/bus/product/getEnableList"/>',valueField:'code',textField:'code',panelHeight:'auto'
														        ,onSelect : function (res) {  
													                //重点在此处   
													                //先获取到当前选中行  
													                //根据当前行获取，当前行的下标  
													                //在根据下标和要获取列的filed获取对应filed的Editor对象  
													                //然后在根据对应的Editor操作  
									                                var row = $('#list-table').edatagrid('getSelected');  
									                                var rindex = $('#list-table').edatagrid('getRowIndex', row);  
									 
									                                var ed = $('#list-table').edatagrid('getEditor', {  
									                                        index : rindex,  
									                                        field : 'productName'  
									                                    });  
									                                $(ed.target).combobox('setValue', res.code);
									                                
									                                var ed1 = $('#list-table').edatagrid('getEditor', {  
									                                        index : rindex,  
									                                        field : 'style'  
									                                    });
									                                $(ed1.target).combobox('reload','<c:url value="/bus/product/getStylesByCode?code=' + res.code + '"/>');
									                            }  
															 }
									}">产品编号</th>
						<th field="productName" width="100" sortable="true" formatter="contentWrap"
							editor="{type:'combobox',options:{required:true,url:'<c:url value="/bus/product/getEnableList"/>',valueField:'code',textField:'name',panelHeight:'auto'
																 ,onSelect : function (res) {  													             
									                                var row = $('#list-table').edatagrid('getSelected');  
									                                var rindex = $('#list-table').edatagrid('getRowIndex', row);  
									                                var ed = $('#list-table').edatagrid('getEditor', {  
									                                        index : rindex,  
									                                        field : 'productCode'  
									                                    });  
									                                $(ed.target).combobox('setValue', res.code);  
									                                
									                                var ed1 = $('#list-table').edatagrid('getEditor', {  
									                                        index : rindex,  
									                                        field : 'style'  
									                                    });
									                                $(ed1.target).combobox('reload','<c:url value="/bus/product/getStylesByCode?code=' + res.code + '"/>');
									                            }  
															}
									}">产品名称</th>
						<th field="style" width="60" sortable="true" editor="{type:'combobox',options:{url:'<c:url value="/bus/product/getStylesByCode?code="/>',valueField:'name',textField:'name',panelHeight:'auto'}}">款号</th>
						<th field="number" width="50" sortable="true" editor="{type:'numberbox',options:{required:true}}">数量</th>
						<th field="realNumber" width="50" sortable="true" editor="{type:'numberbox',options:{required:false}}">实际数量</th>
						<th field="unit" width="50" sortable="true"
							editor="{type:'combobox',options:{required:true,data:unitValue,valueField:'id',textField:'text',panelHeight:'auto'}}">单位</th>
						<th field="onePrice" width="60" sortable="true"
							editor="{type:'numberbox', options:{required:false,min:'0',precision:'2'}}">单价(元)</th>
						<th field="allPrice" width="60" sortable="true"
							editor="{type:'numberbox', options:{required:false,min:'0',precision:'1'}}">金额(元)</th>
						<th field="papers" width="60" sortable="true" editor="{type:'numberbox',options:{required:false}}">大张数量</th>
						<th field="prints" width="50" sortable="true" editor="{type:'numberbox',options:{required:false}}">印次</th>
						<th field="description" width="100" formatter="contentWrap" editor="{type:'text'}">备注</th>
					</tr>
				</thead>
			</table>
		</div>
	</div>
	<div id="toolbar" style="display:none;">	    
		<sec:authorize  ifAllGranted="ORDER_PRODUCT_ADD">
				 <a href="javascript:void(0)" class="easyui-linkbutton"	iconCls="icon-add" plain="true"	onclick="productAdd()">新增</a> 
		</sec:authorize>
		<sec:authorize  ifAllGranted="ORDER_PRODUCT_DELETE">
				 <a	href="javascript:void(0)" class="easyui-linkbutton"	iconCls="icon-delete" plain="true"	onclick="delProduct()">删除</a>
		</sec:authorize>
		<sec:authorize  ifAllGranted="ORDER_PRODUCT_SAVE">
				 <a href="javascript:void(0)" class="easyui-linkbutton"	iconCls="icon-save" plain="true"  onclick="saveProduct()">保存</a>
		</sec:authorize>
		<sec:authorize  ifAllGranted="ORDER_PRODUCT_UPDATE">
				 <a href="javascript:void(0)" class="easyui-linkbutton"	iconCls="icon-edit" plain="true"  onclick="productEdit()">编辑</a> 
		</sec:authorize>
		<sec:authorize  ifAllGranted="ORDER_PRODUCT_CANCEL">
				 <a	href="javascript:void(0)" class="easyui-linkbutton"	iconCls="icon-undo" plain="true"  onclick="javascript:$('#list-table').edatagrid('cancelRow')">取消</a>
		</sec:authorize>		
	</div>	
	
	<script>

		//focusblur自定义输入域的焦点的变化的事件
		 jQuery.focusblur = function(index,grid,field,otherField,setField) {
			 var ed = $('#'+grid).datagrid('getEditor', {  
                 index : index,  
                 field : field  
             }); 
			 var focusblurid = '';
			 var defval ='';			 
             if(ed!=null){
            	focusblurid = $(ed.target);
     		 	defval = focusblurid.numberbox('getValue');
     		 	focusblurid.focus(function(){
    		 		var thisval = $(this).val();
    		 		if(thisval==defval){
    	                 $(this).val("");
    	             }
    	         });
    		     focusblurid.blur(function(){
    		 		var thisval = $(this).val();
    		 		if(thisval==""){
    	                 $(this).val(defval);
    	                 var edSet = $('#'+grid).datagrid('getEditor', {  
                             index : index,  
                             field : setField  
                         });
                         $(edSet.target).numberbox('setValue',"");	               	                 
    	             }else{	            	            
                         var edOther = $('#'+grid).datagrid('getEditor', {  
                             index : index,  
                             field : otherField  
                         });
                         var otherValue = $(edOther.target).numberbox('getValue');
                         if(otherValue!=''){
                        	 var edSet = $('#'+grid).datagrid('getEditor', {  
                                 index : index,  
                                 field : setField  
                             });
                             $(edSet.target).numberbox('setValue',Math.round(thisval*otherValue*10)/10);
                         }
                         
    		         }
    	         });	
             }
		    		         
		 };
		
		
		$(function() {
			$("#toolbar").show();
			
			$('#list-table').edatagrid({
				loadMsg:'加载中，请稍等。。。',
				saveUrl : '<c:url value="/bus/orderDetail/save"/>',
				updateUrl : '<c:url value="/bus/orderDetail/save"/>',
				onBeforeLoad: function(param){				   		 				   
		        	$(this).datagrid('clearSelections');             		 
	    		},
				onSave : function(index, row) {
					if(row.success){
						window.parent.refreshSelectedRow(row.rows);					
						$(this).datagrid("reload");										
					}else{						
						$.messager.alert('提示',"错误："+row.rows,'info');									
					}	
				},onSelect:function(index, row){
					row.orderId = '${orderId}';
					$.focusblur(index,"list-table","number","onePrice","allPrice");
					$.focusblur(index,"list-table","onePrice","number","allPrice");
				}
			});		
		});

		function hasPower(){
			if(!${hasOperatePower}){
				$.messager.alert('提示','该订单已结单,无法进行此操作!','info');
				return false;
			}
			return true;
		}

		function productAdd(){

			if(!hasPower()){
                 return ;
			}

			$('#list-table').edatagrid('addRow');
			var row = $('#list-table').edatagrid('getSelected');
			if (row){
        		var rowIndex = $('#list-table').edatagrid('getRowIndex', row); 
        		var edSet = $('#list-table').edatagrid('getEditor', {  
                    index : rowIndex,  
                    field : 'unit'  
                });
                $(edSet.target).combobox('setValue',unitValue[0].id);	  
            }
			
	    }
		
		function productEdit(){

			if(!hasPower()){
                return ;
			}
			
			var row = $('#list-table').edatagrid('getSelected');
			if (row){
        		var rowIndex = $('#list-table').edatagrid('getRowIndex', row); 
        		$('#list-table').edatagrid('editRow', rowIndex);
        		//$('#list-table').edatagrid('beginEdit', rowIndex);
        		$('#list-table').edatagrid('selectRow', rowIndex);

        		var ed = $('#list-table').edatagrid('getEditor', {  
                    index : rowIndex,  
                    field : 'style'  
                });
            	$(ed.target).combobox('reload','<c:url value="/bus/product/getStylesByCode?code=' + row.productCode + '"/>');

            	var ed1 = $('#list-table').edatagrid('getEditor', {  
                    index : rowIndex,  
                    field : 'productName'  
                });
            	$(ed1.target).combobox("setValue",row.productCode);
            }
        	else{
                $.messager.alert('提示','请选择要编辑的项目','info');
        	}
		}

		function saveProduct(){

			$('#list-table').edatagrid('saveRow');
		/*	//获取可编辑行
	    	var editIndex = $('#list-table').edatagrid('options').editIndex;
	    	//可编辑行存在
	    	if("undefined" != typeof editIndex){
	    		if ($('#list-table').datagrid('validateRow', editIndex)){
	    			var row = $('#list-table').datagrid('selectRow', editIndex);
		    		if(row.productName==''||row.productCode==''){
		    			$.messager.alert('提示','未填选产品!','info');
			    	}
	    			$('#list-table').edatagrid('saveRow');
					return true;
	            }else{
	            	$.messager.alert('提示','要保存的订单信息添加不全!','info');
	            	return false;
	            }
	    	}
			*/
		}
		
		//Del
		function delProduct() {

			if(!hasPower()){
                return ;
			}

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
			                url: '<c:url value="/bus/orderDetail/delete"/>',
			                data: {"id":ids},
			                success: function(returnData) {
			                	if (returnData.success){ 
			                		window.parent.refreshSelectedRow(returnData.rows);			      	                		
									$('#list-table').datagrid('reload');									
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