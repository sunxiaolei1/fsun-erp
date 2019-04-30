<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script type="text/javascript" src="<c:url value='/js/jquery-easyui/jquery.edatagrid.js'/>"></script>
<script type="text/javascript"  src="<c:url value='/view/bus/proxyOrder/operate/proxy-common.js'/>"></script>

<script type="text/javascript">

//初始化印刷明细
function initProcessFlow(printProcessDtos){
	var colorsArr = new Array();
	var currEditRow = null;
	//后道工序gird
	$('#processFlow').edatagrid({
		loadMsg:'加载中，请稍等。。。'	,
		columns: [[	
			{field:"id",hidden:true},
			{field:"proxyCode",hidden:true},	
			{field:"price",hidden:true},	
			{field:"totalPrice",hidden:true},
			{field:"model",title:"生产机型",width:70,align:"center",
		 		editor:{
		 			type:'combobox',
		 			options:{
		 				required:true,
		 				editable: false,
		 				url:'<c:url value="/sys/dictionary/getGroupList?key=PRODUCT_MODEL"/>',
		 				valueField:'key',
		 				textField:'value',
		 				panelHeight:'auto',
	 					onLoadSuccess:function(rows){	 						
		 					if(rows&&rows.length>0){
		 						if(currEditRow!=null && typeof(currEditRow.model)!='undefined'){
		 							$(this).combobox('select',currEditRow.model);
		 						}else{
		 							$(this).combobox('select',rows[0].key);
		 						}
		 					}
		 				}
		 			}
				}
			},
			{field:"process",title:"工序",width:60,align:"center",
			 	editor:{
			 		type:'combobox',
			 		options:{
			 			required:true,
			 			editable: false,
			 			url:'<c:url value="/sys/dictionary/getGroupList?key=PRODUCT_PRINT_PROCESS"/>',
		 				valueField:'key',
		 				textField:'value',
		 				panelHeight:'auto',
		 				onLoadSuccess:function(rows){
		 					if(rows&&rows.length>0){
		 						if(currEditRow!=null && typeof(currEditRow.process)!='undefined'){
		 							$(this).combobox('select',currEditRow.process);
		 						}else{
		 							$(this).combobox('select',rows[0].key);
		 						}
		 					}
		 				}
		 			}
				}
			},
			{field:"psNumber",title:"ps版张数",width:50,align:"center",
				editor:{
					type:'numberbox',
					options:{
		 				required:false
		 			}	
				}
			},
		 	{field:"layout",title:"印刷方式",width:40,align:"center",
		 		editor:{
		 			type:'combobox',
		 			options:{
		 				required:true,
		 				editable: false,
		 				url:'<c:url value="/sys/dictionary/getGroupList?key=PRODUCT_LAYOUT"/>',
		 				valueField:'key',
		 				textField:'value',
		 				panelHeight:'auto',
		 				onLoadSuccess:function(rows){
		 					if(rows&&rows.length>0){
		 						if(currEditRow!=null && typeof(currEditRow.layout)!='undefined'){
		 							$(this).combobox('select',currEditRow.layout);
		 						}else{
		 							$(this).combobox('select',rows[0].key);
		 						}		 						
		 					}
		 				}  
				    }
				}
			},
			{field:"colors",title:"色数",width:80,align:"center",
				editor:{
		 			type:'combobox',
		 			options:{
		 				required:true,
		 				editable: false,
		 				url:'<c:url value="/sys/dictionary/getGroupList?key=PRINT_COLORS"/>',
		 				valueField:'key',
		 				textField:'value',
		 				panelHeight:'auto',
		 				onSelect:function(value){
		 					var colorsName = $(this).combobox("getText");
		 					var rindex = $('#processFlow').datagrid('getRowIndex', currEditRow);	
		 					var ed = $('#processFlow').datagrid('getEditor', {index:rindex,field:'spotColors'});		 					
		 					if(colorsName.endWith("专色")){
		 						$(ed.target).attr('disabled',false);//可编辑 	
		 						$(ed.target).attr("style","background:#FFF;");
		 					}else{
		 						$(ed.target).val('');
		 						$(ed.target).attr('disabled',true);//只读
		 						$(ed.target).attr("style","background:#DDD;");
		 					} 
	        		    },
		 				onLoadSuccess:function(rows){
		 					colorsArr = rows;
		 					if(rows&&rows.length>0){
		 						if(currEditRow!=null && typeof(currEditRow.colors)!='undefined'){
		 							$(this).combobox('select',currEditRow.colors);
		 						}else{
		 							$(this).combobox('select',rows[0].key);
		 						}		 						
		 					}
		 				}  
				    }
				},
				formatter:function(value,row){	
					var colorsName = '';
					if(typeof(row.colorsName)!='undefined' && row.colorsName!=null){
						if(currEditRow!=null && typeof(currEditRow.colors)!='undefined'){
							$.each(colorsArr,function(){
								if(this.key==currEditRow.colors){
									colorsName = this.value;
									return ;
								}							
							});
						}else{
							colorsName = row.colorsName;
						} 
					}else{
						if(value!=null){
							$.each(colorsArr,function(){
								if(this.key==value){
									colorsName = this.value;
									return ;
								}
								
							});
						}
					}					
					return colorsName;
			    }
			},
			{field:"spotColors",title:"专色",width:50,align:"center",
				editor:{
					type:'validatebox',
					options:{
		 				required:false
		 			}	
				}
			},
		 	{field:"number",title:"印刷数量",width:50,align:"center",
				editor:{
					type:'numberbox',
					options:{
		 				required:true
		 			}	
				}
			},
		 	{field:"loss",title:"印损",width:40,align:"center",
				editor:{
					type:'numberbox',
					options:{
		 				required:true
		 			}	
				}	
		 	},		 	
			{field:"descr",title:"备注",width:80,align:"center",
		 		editor:{
		 			type:'combobox',
		 			options:{
		 				required:false,
		 				editable: true,
		 				url:'<c:url value="/sys/dictionary/getGroupList?key=PRINT_DESCR"/>',
		 				valueField:'key',
		 				textField:'value',
		 				panelHeight:'auto',
		 				onLoadSuccess:function(rows){
		 					if(rows&&rows.length>0){
		 						if(currEditRow!=null && typeof(currEditRow.descr)!='undefined'){		 							
		 							$(this).combobox('setValue',currEditRow.descr);
		 						}else{
		 							$(this).combobox('setValue',rows[0].key);
		 						}		 						
		 					}
		 				}  
				    }
				}
		 	},
		 ]],
		 onSelect:function(index, row){  			    	  
	    	  currEditRow = row;
	     }
	}).datagrid("loadData",printProcessDtos);

	$("#processToolbar").show();
}



</script>

<table id="processFlow" toolbar="#processToolbar" fit="true" rownumbers="true" fitColumns="true" singleSelect="true" nowrap="false" >
</table>
				
<div id="processToolbar" style="display:none">
	<a href="javascript:void(0)" class="easyui-linkbutton"	iconCls="icon-add" plain="true"	onclick="printProcessAdd($('#processFlow'))">添加</a> 
	<a href="javascript:void(0)" class="easyui-linkbutton"	iconCls="icon-add" plain="true"	onclick="delPrintProcess($('#processFlow'))">删除</a>	
	<a href="javascript:void(0)" class="easyui-linkbutton"	iconCls="icon-undo" plain="true" onclick="cancelPrintProcessRow($('#processFlow'))">取消</a>
</div>