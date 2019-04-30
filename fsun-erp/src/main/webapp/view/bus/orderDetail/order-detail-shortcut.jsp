<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript"  src="<c:url value='/view/bus/orderDetail/order-detail-shortcut.js'/>"></script>
	
<div class="step-content display" style="margin-top:-15px;" id="madeInfo"> 
	<div class="left" style="margin-top:-20px;width:25%;height:64%;border-width:1px 0px 1px 1px;border-style:solid;border-color:#ddd;">
		<table id="madeDetailTable" fit="true" rownumbers="true" fitColumns="true" singleSelect="true" nowrap="false" >			
		</table>
	</div>
	<div class="left" style="margin-top:-15px;width:40%;border-width:1px 1px 1px 0;">
		<form id="processDetailfm" name="processDetailfm" method="post" >			
			<input name="productCode"  style="display:none" />					
			<ul>
				<li class="tr6"> 产品名称:</li>
				<li class="tl10">&nbsp; <input name="style" id="style" readOnly style="width:355px"/></li>				
				
				<li class="tr4"> 材质名称:</li>
				<li class="tl9">&nbsp; <input  type="text" name="material" id="material" style="width:136px" /></li>	
				<li class="tr4"> 开料尺寸:</li>
				<li class="tl9">&nbsp; <input type="text" name="openSize" id="openSize" style="width:136px" /></li>		
				
				
				<li class="tr4"> 规&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;格:</li>
				<li class="tl9">&nbsp; 
					<input type="text" name="spec" id="spec" style="width:60px" />
					<input type="text" id="specSize" style="width:70px;" />
				</li>		
				<li class="tr4"> 大张数量:</li>
				<li class="tl9">&nbsp; <input class="easyui-numberbox"  type="text"  name="papers" id="papers" style="width:136px" /></li>	
				
				
				<li class="tr4"> 开&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;数:</li>
				<li class="tl9">&nbsp; <input class="easyui-numberbox" type="text"  name="openNum" id="openNum" style="width:136px" /></li>		
				<li class="tr4"> 印张总数:</li>
				<li class="tl9">&nbsp; <input class="easyui-numberbox"  type="text" name="prints" id="prints" style="width:136px" /></li>	
				
				<li class="tr5"> 生产机型:</li>
				<li class="tl9">&nbsp; <input type="text" name="model" id="model" style="width:136px" /></li>
				<li class="tr5"> 色&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;数:</li>
				<li class="tl9">&nbsp; <input class="easyui-numberbox" type="text" name="colors" id="colors" style="width:136px" /></li>
				
				<li class="tr5"> 工&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;序:</li>
				<li class="tl9">&nbsp; <input type="text" name="process" id="process" style="width:136px" /></li>
				<li class="tr5"> 拼&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;数:</li>
				<li class="tl9">&nbsp; <input class="easyui-numberbox"  type="text" name="impos" id="impos" style="width:136px" /></li>
				
				<li class="tr5"> 印刷方式:</li>
				<li class="tl9">&nbsp; <input type="text" name="layout" id="layout" style="width:136px" /></li>						
				<li class="tr5"> 印刷数量:</li>
				<li class="tl9">&nbsp; <input class="easyui-numberbox"  type="text"  name="expects" id="expects" style="width:136px" /></li>	
				
				<li class="tr5"> 印张净数:</li>
				<li class="tl9">&nbsp; <input class="easyui-numberbox"  type="text" name="actuals" id="actuals" style="width:136px" /></li>		
				<li class="tr5"> 印&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;损:</li>
				<li class="tl9">&nbsp; <input class="easyui-numberbox"  type="text" name="loss" id="loss" style="width:136px" /></li>
				
				<li class="tr5">备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注:</li>
				<li class="tl10">&nbsp; <textarea name="description" id="description" style="width: 365px;"></textarea>
				</li>
			</ul>
			<div class="clear"></div>
		</form>					
	</div>
	
	<div class="right" style="margin-top:-20px;width:34%;height:64%;border-width:1px 0px 1px 1px;border-style:solid;border-color:#ddd;">
		<table id="processFlow" toolbar="#processToolbar" fit="true" rownumbers="true" fitColumns="true" singleSelect="true" nowrap="false" >
		</table>
	</div>
	<div class="clear"></div>
</div>

<div id="packageToolbar" style="display:none">	
	 <a href="javascript:void(0)" class="easyui-linkbutton"	iconCls="icon-add" plain="true"	onclick="openAddMadeDetail($('#packageTable'))">添加生产明细</a> 
	 <a	href="javascript:void(0)" class="easyui-linkbutton"	iconCls="icon-save" plain="true"  onclick="saveEdits($('#packageTable'))">保存</a>
	 <a	href="javascript:void(0)" class="easyui-linkbutton"	iconCls="icon-undo" plain="true"  onclick="cancelEdits($('#packageTable'))">取消</a>		
	 <a	href="javascript:void(0)" class="easyui-linkbutton"	iconCls="icon-delete" plain="true"  onclick="delEdits($('#packageTable'))">删除</a>	
	 <a	href="javascript:void(0)" class="easyui-linkbutton"	iconCls="icon-add" plain="true"  onclick="openProductAddDialog()">新增产品</a>					
	 <a	href="javascript:void(0)" class="easyui-linkbutton"	iconCls="icon-add" plain="true"  onclick="openExistProductAddDialog()">添加已有产品</a>	
</div>

<div id="processToolbar" style="display:none">
	<a href="javascript:void(0)" class="easyui-linkbutton"	iconCls="icon-add" plain="true"	onclick="processAdd($('#processFlow'))">添加</a> 
	<a href="javascript:void(0)" class="easyui-linkbutton"	iconCls="icon-add" plain="true"	onclick="delProcess($('#processFlow'))">删除</a>	
	<a href="javascript:void(0)" class="easyui-linkbutton"	iconCls="icon-undo" plain="true" onclick="cancelProcessRow($('#processFlow'))">取消</a>
	<a href="javascript:void(0)" class="easyui-linkbutton"	iconCls="icon-add" plain="true"	title="创建厂家" onclick="openFactoryAddDialog()">厂家</a>		
</div>
	
<script>
	 	
	 var $processDetailfm = $("#processDetailfm");	
	 	
	 $(function() {
		//打包grid
		$('#packageTable').edatagrid({
    		loadMsg:'加载中，请稍等。。。'	
    	}).datagrid("loadData",madePackageDtos);
		
		//生产明细grid
		$('#madeDetailTable').datagrid({
			columns:[[
			 	{field:"productCode",title:"编码",width:30,align:"center"}, 	
			 	{field:"style",title:"产品名称",width:150,align:"center",formatter:contentWrap},
			 	{field:"operate",title:"操作",width:30,align:"center",formatter:attManage}		 	
			 ]],
			loadMsg:'加载中，请稍等。。。',
			onSelect:function(rowIndex, rowData){			
				if(!madeDetailDataValidate()){							
		 			$.messager.alert('提示',"生产明细数据未填完整!",'info');		
				}else{
					//保存上一个明细数据
					if(madeDetailDtos!=null && madeDetailDtos.length>0){
						acceptChangesMadeDetailData();
					}	
					//使当前明细同步页面初始化
					synMadeDetails(rowData);					
				}				
			}
		}).datagrid("loadData",madeDetailDtos);
		
		//后道工序gird
		$('#processFlow').edatagrid({
   			loadMsg:'加载中，请稍等。。。'	,
   			columns: [[			 	
			 	{field:"name",title:"后道工序",width:40,align:"center",
			 		editor:{type:'combobox',options:{required:true,url:'<c:url value="/sys/dictionary/getGroupList?key=PRODUCT_PROCESS"/>',
			 			valueField:'key',textField:'value',panelHeight:'auto'}}},
			 	{field:"outsourcer",title:"外协方",width:40,align:"center",
			 		editor:{type:'combobox',options:{url:'<c:url value="/bus/factoryInfo/factory/list"/>',
			 			valueField:'name',textField:'name',panelHeight:'auto'}}},
			 	{field:"number",title:"数量",width:40,align:"center",editor:{type:'numberbox'}},
			 	{field:"demand",title:"工艺要求",width:90,align:"center",editor:'text'}
			 ]],   			
			onBeforeEdit:function(rowIndex, rowData){
				delete rowData.id;
				delete rowData.isNewRecord;
			}
   		});
		
		$("#packageToolbar").show();
		$("#processToolbar").show();
			
		//初始化选择控件
		initComboBoxs($processDetailfm);
	
		
	});
	 
	 /****************************     打包信息            *****************************************/
	
	 //打开新增产品窗口
	 function openProductAddDialog(){
		 $("<div></div>").dialog({
	    		id:"productAddDialog",
	    		title:"新增产品及单据明细",
			    width:1100,
			    height:480,
			    top:40,
			    iconCls:"",
			    closed:false,
			    cache:false,
			    href:'<c:url value="/bus/product/order"/>',
			    modal:true,
			    minimizable:false,
	            maximizable:false,
	            closable:true,
	            collapsible:false,
	            resizable:true,
				onBeforeOpen:function(){
					//return isHaveToShopName(toShopId);
				},
	            onClose:function(){
	            	$(this).dialog("destroy");
	            }
			});
	 }
	 
	 //关闭当前窗口
	 function closeProductAddDialog(){
		 $("#productAddDialog").dialog("destroy");
	 }
	 
	 //打开添加已存在产品窗口
	 function openExistProductAddDialog(){
		 $("<div></div>").dialog({
	    		id:"existProductAddDialog",
	    		title:"新增产品及单据明细",
			    width:900,
			    height:400,
			    top:40,
			    iconCls:"",
			    closed:false,
			    cache:false,
			    href:'<c:url value="/bus/product/select/order"/>',
			    modal:true,
			    minimizable:false,
	            maximizable:false,
	            closable:true,
	            collapsible:false,
	            resizable:true,
				onBeforeOpen:function(){
					//return isHaveToShopName(toShopId);
				},
	            onClose:function(){
	            	$(this).dialog("destroy");
	            }
			});
	 }
	 
	 //关闭当前窗口
	 function closeExistProductAddDialog(){
		 $("#existProductAddDialog").dialog("destroy");
	 }
	 
	 
	 //添加打包明细
	 function addPackagDetail(madePackageDtos){
		 addMadePackages(madePackageDtos,$("#packageTable"));
	 }
	 
	  
	 /****************************     生产列表信息            *****************************************/
	 
	 var attManage = function(value,row,index){
		 return '<a href="javascript:delMadeDetail(\''+ row.productCode +'\',\''+row.style+'\',\''+index+'\');"><i>删除</i></a>';				
	 } 
	 
	 //var attManage = function(value,row,index){
	//	return '<button type="button" onclick="delMadeDetail('+ row +',\''+index+'\');">删除</button>';				
	 //}
	 
	 //添加生产明细
	 function openAddMadeDetail(grid){
		 		
	 	var rows = grid.datagrid('getSelections');
	 	var detailName = getDetailName(rows);
	 	if(detailName!=null){
	 		if(detailHasExisted(rows[0].productCode,rows[0].productName, detailName)){
	 			$.messager.alert('提示',"该生产明细已存在!",'info');
	 			return;
	 		}
	 		
	 		if(!madeDetailDataValidate()){
	 			$.messager.alert('提示',"生产明细数据未填完整!",'info');
				return; 
			}
	 		var rowData = {
	 			"productCode": rows[0].productCode,
	 			"style": detailName!='' ? (rows[0].productName+"("+detailName+")") : rows[0].productName,
	 		    "spec":"",
	 		    "madeProcessDtos":[]
	 		};
	 		madeDetailDtos.push(rowData);
	 		$('#madeDetailTable').datagrid("loadData",madeDetailDtos); 
	 		initMadeDetails(rowData);
	 		$('#madeDetailTable').datagrid("selectRow",madeDetailDtos.length-1);
	 	}	
	 }
	 
	 //删除明细
	 function delMadeDetail(productCode, style, index){
	     var length = madeDetailDtos.length;		
		 if(length>0){
			 for(var i=length-1; i>=0; i--){
				var row = madeDetailDtos[i];
				if(productCode == row.productCode && style == row.style){
					madeDetailDtos.splice(i,1);
				}
		     }
		 } 
		 //console.log(madeDetailDtos);
		 $processDetailfm[0].reset(); 
		 $('#processFlow').datagrid("loadData",[]); 
		 $('#madeDetailTable').datagrid("loadData",madeDetailDtos);
		 
		/*  $processDetailfm[0].reset(); 
		 $('#processFlow').datagrid("loadData",[]); 
		 $('#madeDetailTable').datagrid("deleteRow",index);  */
	 }
	  
	 //生产明细数据完整性验证
	 function madeDetailDataValidate(){
		 var isTrue = true;
		 if(!$processDetailfm.form('validate') || !gridIsValidate("processFlow")){
			 isTrue = false;
		 }
		 return isTrue;
	 }
	 
	 //提交新建或变化的生产明细
	 function acceptChangesMadeDetailData(){
		 
	    var madeDetailDto = serializeObject($processDetailfm);
	    var specSize = $('#specSize', $processDetailfm).val();
		if(specSize!=null && specSize!=''){
			madeDetailDto.spec += ("-"+specSize); 
		}	
	    $('#processFlow').datagrid("acceptChanges"); 
	    var madeProcessDtos = $('#processFlow').datagrid("getData");
	    if(madeProcessDtos!=null){
	    	madeDetailDto.madeProcessDtos = madeProcessDtos;
	    }
	    acceptChangesMadeDetails(madeDetailDto);
	 }
	  
	 //初始化生产明细
	 function initMadeDetails(rowData){	 
		 
		 $.ajax({
	       	url: '<c:url value="/bus/product/loadByCode"/>',
	       	async: false,
	       	dataType: "json",
	       	data:{productCode:rowData.productCode},
	       	success:function(resultData){
	        	if(resultData.success){
	    			var productDto =  resultData.rows;
	    			productDto.productCode = productDto.code;
	    			productDto.papers="";
	    			productDto.prints="";
	    			productDto.expects="";
	    			productDto.actuals="";
	    			productDto.loss="";
	    			productDto.style = rowData.style ;
	    			if(productDto.film){
	    				productDto.process = "菲林";
	    			}
	    			
	    			$processDetailfm.form("load", productDto);
	    			var spec = productDto.spec!=null?productDto.spec:'';
	    			var index = spec.indexOf('-');
	    			if(index!=-1){				
	    				$("#specSize", $processDetailfm).val(spec.substring(index+1));
	    				$("#spec", $processDetailfm).combobox('select',spec.substring(index,-(index))); 
	    			}else{
	    				$("#specSize", $processDetailfm).val('');
	    			}
	    			
	    			var madeProcessDtos =  productDto.afterProcess;
	    			$.each(madeProcessDtos,function(){		    				
	        			this.number="";
	        			delete this.productId;
	        			delete this.isOutsourc;
	        			delete this.description;
	        			delete this.id;
	    			});		    			
	        		$('#processFlow').datagrid("loadData",madeProcessDtos); 	        		
		        }
	       	}
	    });
	 }
	 
	 
	 //同步生产明细
	 function synMadeDetails(rowData){
		 //如果已在本地
		 var madeDetailDto = getMadeDetailDto(rowData);
		 if(madeDetailDto!=null){
			$processDetailfm.form("load", madeDetailDto);
 			var spec = madeDetailDto.spec!=null?madeDetailDto.spec:'';
 			var index = spec.indexOf('-');
 			if(index!=-1){				
 				$("#specSize", $processDetailfm).val(spec.substring(index+1));
 				$("#spec", $processDetailfm).combobox('select',spec.substring(index,-(index))); 
 			}else{
 				$("#specSize", $processDetailfm).val('');
 			}
 			$('#processFlow').datagrid("loadData",madeDetailDto.madeProcessDtos); 
		 }	 
	 }


	
	
	/****************************     生产明细信息            *****************************************/
	
	/**
	 * 初始化选择控件
	 */
	function initComboBoxs($form){
	  	$('#spec', $form).combobox({
	   		required: false,
	   		editable:false,
		 	valueField: 'id',
		  	textField: 'text',
		  	data:productSpec,
		  	width: 'auto',
		    panelHeight: 'auto',
			onSelect:function(row){
				if(row.id=='定规'){
					$('#specSize', $form).removeAttr("readonly"); 
					$('#specSize', $form).css('background-color','#FFFFFF');
				}else{
					$('#specSize', $form).val('');
					$('#specSize', $form).attr({ readonly: 'true' });
					$('#specSize', $form).css('background-color','#DDDDDD');
				}
			}
		});
	
	   	$.getJSON('<c:url value="/sys/dictionary/getGroupList?key=PRODUCT_MODEL"/>', function(json){
		  	$('#model', $form).combobox({
		   		required: false,
		   		editable:false,
			 	valueField: 'key',
			  	textField: 'value',
			  	data:json,
			  	width: 'auto',
			    panelHeight: 'auto'
			});
			
		});	 
		
		$.getJSON('<c:url value="/sys/dictionary/getGroupList?key=PRODUCT_LAYOUT"/>', function(json){
		  	$('#layout', $form).combobox({
		   		required: false,
		   		editable:false,
			 	valueField: 'key',
			  	textField: 'value',
			  	data:json,
			  	width: 'auto',
			    panelHeight: 'auto'
			});
			
		});
	}
	
	
	
	/****************************     厂家信息            *****************************************/
	
	 //打开新增厂家窗口
	 function openFactoryAddDialog(){
		 $("<div></div>").dialog({
	    		id:"factoryAddDialog",
	    		title:"新增厂家信息",
			    width:600,
			    height:300,
			    top:80,
			    iconCls:"",
			    closed:false,
			    cache:false,
			    href:'<c:url value="/bus/factoryInfo/toCreate"/>',
			    modal:true,
			    minimizable:false,
	            maximizable:false,
	            closable:true,
	            collapsible:false,
	            resizable:true,
	            onClose:function(){
	            	$(this).dialog("destroy");
	            }
			});
	 }
	 
	 //关闭当前窗口
	 function closeFactoryAddDialog(){
		 $("#factoryAddDialog").dialog("destroy");
	 }
	 
	 
	/******************************  整个单据的保存    **********************************/
	 
	 
	 //保存单据
	function saveOrders(isPrint, succToUrl){
		var $form = $("#orderfm");
		if (!$form.form('validate') || !gridIsValidate("packageTable") 
			||!madeDetailDataValidate() ){	
			return;
		}
		if(madePackageDtos==null || madePackageDtos.length==0){
			MessageBox.warn("必须添加至少一条打包数据!");      
			return;
		}
		if(madeDetailDtos==null || madeDetailDtos.length==0){
			MessageBox.warn("必须添加至少一条生产明细数据!");   
			return;
		}
		acceptChangesMadeDetailData();
		
		MessageBox.loading();
		var orderDto = serializeObject($form);    
		var date = orderDto.receiveTime+"";
		if(date.indexOf("00:00:00")<0){
			orderDto.receiveTime += " 00:00:00";
		}
		
		var madePackageDtos0 = new Array();
		var allPrice = 0;
		$.each(madePackageDtos,function(){
			var row = this;
			allPrice += (row.number * row.onePrice); 
   			delete row.isNewRecord;
   			delete row.number;
   			delete row.lineNo;
   			madePackageDtos0.push(row);
   		});
		orderDto.allPrice = allPrice;
		orderDto.strip = madePackageDtos.length;
		
		var madeDetailDtos0 = new Array();
		$.each(madeDetailDtos,function(){
			var row = this;
			if(this.madeProcessDtos!=null && this.madeProcessDtos.rows!=null 
				&& this.madeProcessDtos.rows.length>0){
				row.madeProcessDtos = this.madeProcessDtos.rows;
			}else{
				row.madeProcessDtos = [];
			}
			madeDetailDtos0.push(row);
   		});
		
		var shortcutOrderDto = {
			"orderDto": orderDto,
			"madePackageDtos": madePackageDtos0,
			"shortcutMadeDetailDtos": madeDetailDtos0
		}
		
		$.ajax({
	        type: "post",
	        dataType: "json",
	        contentType:"application/json;charset=utf-8",
	        async:false,
	        url: '<c:url value="/bus/madeOrder/shortcut/create"/>',
	        data: JSON.stringify(shortcutOrderDto),
	        success: function(result) {     
	        	if(result.success){	        
	        		if(isPrint){
	        			printMadeOrder(result.rows, succToUrl);
	        		}else{
	        			MessageBox.closeLoading();
	        			window.location.href = succToUrl;
	        		}	        		
	        	}else{
	        		MessageBox.closeLoading();
	        		MessageBox.error("保存失败!");                  	
	        	}    			                				                															                	
	        }
	    });  
			
	}
	  

</script>