<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<%@include file="/view/resource.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<style type="text/css">
	.search-btn,.reset-btn,.on-search-btn,.on-reset-btn{display:inline-block;width:70px;height:22px;line-height:22px;margin:0;padding:0 15px 0 5px!important;*padding:2px 15px 5px 0!important;border:none;color:#333;font-size:12px;cursor:pointer; text-align:right;}
	.search-btn{background:url(../../images/search-button1.png) left top no-repeat;}
	.on-search-btn{background:url(../../images/search-button1.png) 0 -22px no-repeat;}
	.reset-btn{background:url(../../images/search-button1.png) 0 -44px no-repeat;}
	.on-reset-btn{background:url(../../images/search-button1.png) 0 -66px no-repeat;} 
	
	/*** 上传图片的样式 ****/
	.a-upload {
	    padding: 4px 10px;
	    height: 18px;
	    line-height: 20px;
	    position: relative;
	    cursor: pointer;
	    color: #888;
	    background: #fafafa;
	    border: 1px solid #ddd;
	    border-radius: 4px;
	    overflow: hidden;
	    display: inline-block;
	    *display: inline;
	    *zoom: 1
	}
	
	.a-upload  input {
	    position: absolute;
	    font-size: 100px;
	    right: 0;
	    top: 0;
	    opacity: 0;
	    filter: alpha(opacity=0);
	    cursor: pointer
	}
	
	.a-upload:hover {
	    color: #444;
	    background: #eee;
	    border-color: #ccc;
	    text-decoration: none
	}
</style>
<title>产品管理</title>
<link rel="stylesheet" href="<c:url value='/css/style.css'/>"  media="all" />
<script type="text/javascript"  src="<c:url value='/js/commons/LodopFuncs.js'/>"></script>
</head>
<body>
	
	<!-- DataList  -->
	<table id="list-table" title="产品列表" toolbar="#toolbar" style="display:none;"
		pagination="true" idField="id" fit="true" rownumbers="true"
		fitColumns="false" singleSelect="false" pageSize="20">
		<thead>
			<tr>
				<th data-options="field:'id',checkbox:true"></th>
				<th field="code" width="80" sortable="true">产品编号</th>						
				<th field="name" width="200" sortable="true">产品名称</th>
				<th field="price" width="70" sortable="true">单价(元)</th>
				<th field="icon" width="110" formatter="iconChange" sortable="true">图片</th>
				<th field="description" width="280" sortable="true">注意事项</th>										
			</tr>
		</thead>
	</table>

	<%@include file="operate/toolbar.jsp"%> 

	<!-- 主机编辑窗口 -->		
	<div id="addProductwin" class="easyui-window" title="新增产品" closed="true" align="center" style="display:none;width:860px;height:500px;top:10px;" buttons="#dlg-buttons" modal="true">  
    	 <form id="productfm" method="post" name="productfm" enctype="multipart/form-data">  	
    	 	 <div class="movie-edit">
                  <ul class="movie-edit-ul1">
	                   
	                   <li class="movie-edit-li3">
	                   	   <span class="red-font">*</span>产&nbsp;品&nbsp;名&nbsp;称:<br />	                                                                 
                           <div id="productCodeName">
                           		<span class="red-font">*</span>产&nbsp;品&nbsp;编&nbsp;号:<br />
                           </div>                                                                         
	                   	         菲&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;林:<br />                   	   
       					         透&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;明&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;纸:<br />      					        
                                                                         材&nbsp;&nbsp;质&nbsp;&nbsp;名&nbsp;&nbsp;称:<br />
                                                                         规&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;格:<br />   
                                                                         开&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;数(开):<br />                                                                                                                 	                                                                                                                                                                        
                                                                         开&nbsp;&nbsp;料&nbsp;&nbsp;尺&nbsp;&nbsp;寸:<br />                                                                                                                                                                                                                                                                                                                          
                                                                         开&nbsp;&nbsp;料&nbsp;&nbsp;方&nbsp;&nbsp;法:<br />                                                                                                              
	                   </li>
	                   <li class="movie-edit-li4">
	                       <input class="input-border" type="text" id="name" name="name" size="18" style="width: 151px;" data-options="required:true"></input>
	                       <br />	                       
	                       <div id="productCodeValue">
	                        	<input class="input-border"  disabled="true" type="text" id="code" name="code" size="18" style="width: 151px;"></input>	                  
	                       </div>		              	
	                   	   <input type="radio" name="film" value = "true" checked="checked" style="margin:0px 6px 0px 0;" />是
	                        &nbsp;&nbsp;&nbsp;
	                       <input type="radio" name="film" value = "false" style="margin:0px 6px 0px 0;" />否
	                       <br /> 
	                       <input type="radio" name="scotch" value = "true"  style="margin:0px 6px 0px 0;" />是
	                        &nbsp;&nbsp;&nbsp;
	                       <input type="radio" name="scotch" value = "false" checked="checked" style="margin:0px 6px 0px 0;" />否
	                       <br /> 
	                       <input type="text" class="input-border" id="material" name="material" size="18" style="width: 151px;margin-top:6px;" />
	                       <br />
	                       <input type="text"  id="spec" name="spec" style="height: 21px;width: 71px;" />
		                    <input type="text"  id="specSize" style="height: 21px;line-height:40px;width:75px;" />
		                   <br />
	                       <input type="text" class="input-border" name="openNum" id="openNum" size="18" style="width: 151px;"/>
	                       <br />	             
	                       <input type="text" class="input-border" id="openSize" name="openSize" size="18" style="width: 151px;"/>
	                       <br />	                       	                
	                       <textarea name="openMethod" id="openMethod"  rows="2" style="width: 151px;"></textarea>	                       	                                           
	                   </li>
	               	   <li class="movie-edit-li5">
                   	                   生&nbsp;&nbsp;产&nbsp;&nbsp;机&nbsp;&nbsp;型:<br />                                                                   
                                                                        工&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;序:<br />          
                                                                        是&nbsp;&nbsp;否&nbsp;&nbsp;外&nbsp;&nbsp;协:<br />    
                                                                        拼&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;版:<br />    
                                                                        拼&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;数:<br />                                                                                                                                                  	                                                                                                    
                                                                        色&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;数(色):<br />  
                                                                        产&nbsp;&nbsp;品&nbsp;&nbsp;款&nbsp;&nbsp;号:<br /><br />                                             
                                                                        注&nbsp;&nbsp;意&nbsp;&nbsp;事&nbsp;&nbsp;项:<br />                                                                                                                                                                                                                                                                               
                       </li>
                       <li class="movie-edit-li6">                                
	                       <input type="text" class="easyui-combobox"  editable="false" name="model" id="model" style="height: 21px;width: 151px;"/>	                       
	                       <input name="process" id="process" class="input-border" type="text" size="18" style="margin-top:5px;width: 151px;"/>
	                       <br />
	                       <input type="radio" name="outsourc" value = "true" checked="checked" style="margin:0px 6px 0px 0;"/>是
	                        &nbsp;&nbsp;&nbsp;
	                       <input type="radio" name="outsourc" value = "false" style="margin:0px 6px 0px 0;" />否
	                       <br />        
	                       <input type="text" class="easyui-combobox" editable="false" name="layout" id="layout" style="height: 21px;width: 151px;"/>
	                       <br />
	         			   <input type="text" class="input-border" id="impos" name="impos" size="18"  style="width: 151px;margin-top:5px;" />
	         			   <input type="text" class="input-border" id="colors" name="colors" size="18" style="width: 151px;" />                   
	                       <textarea name="style" id="style" ondblclick="editStyle(event)" readonly="readonly" rows="2" style="width: 151px;"></textarea>	                       	                            
	                   	   <br />
	                       <textarea name="description" id="description"  rows="2" style="width: 151px;"></textarea>	                                                                 
                   	   </li>
                   	   <li class="movie-edit-li1"> 
                   	   		<input name="icon" id="icon" type="text" hidden="true"  style="display:none" />
                   	   	           图&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;片:<br />       	   		                                  						                           	
	                   		<div class="yulan">
	                   		    <div id="pre" >
	                   		    	<img name="iconimg" id="iconimg" src='' />
	                   		    </div>	
	                   			<br />
	                   			<input type="button" class="del" value="删除" onclick="closeiconimg()"/>
	                   		</div>	                   			                                                                                                                 
	                   </li>
	                   <li class="movie-edit-li2">
	                        <input name="id" id="id" type="text"   style="display:none"></input>	 
	                        <a href="javascript:;" class="a-upload">
                           		<input type="file" onchange='previewImage(this,"pre")'  accept=".jpeg,.bmp,.png,.jpg,.gif"  id="ficon" name="ficon"  />点击这里上传图片 
                           	</a>                                                        	                                              
	                   </li>
	             </ul>
		     	 
	     	 </div>
    	 </form>
    	 <div id="addProcessListPanel" class="easyui-panel"  style="width:780px;height:200px;" > 	   	 	    
			 <table id="processList-table"  toolbar="#processToolbar" fit="true" rownumbers="true"
				fitColumns="true" singleSelect="true" >
				<thead>
					<tr>						
						<th field="name" width="60" editor="{type:'combobox',options:{required:true,url:'<c:url value="/sys/dictionary/getGroupList?key=PRODUCT_PROCESS"/>',valueField:'key',textField:'value',panelHeight:'auto'}}">后道工序</th>
						<th field="isOutsourc" width="30" editor="{type:'combobox',options:{required:true,data:isOutsourc,valueField:'id',textField:'text',panelHeight:'auto'}}">外协</th>
						<!-- <th field="number" width="45" editor="{type:'numberbox',options:{required:false,min:'0',precision:'0'}}">应产数量</th>  -->
						<th field="demand" width="100" formatter="showAllItem" editor="{type:'validatebox',options:{validType:'maxLength[36]'}}">工艺要求</th>
						<th field="description" width="90" formatter="showAllItem" editor="{type:'validatebox',options:{validType:'maxLength[36]'}}">备注</th>
						<!-- <th field="productId" width="30" formatter="attManage" type='linkbutton'>操作</th>	 -->						
					</tr>
				</thead>	
			 </table>			
		 </div> 	 
    	 <div style="padding:6px;text-align:center;">  
                <a href="#" class="easyui-linkbutton" icon="icon-ok" onclick="saveProduct()">保存</a>  
                <a href="#" class="easyui-linkbutton" icon="icon-cancel" onclick="closeProductWin()">取消</a>  
         </div>  
	</div> 
	
	<div id="openDisableProductDiv" class="easyui-window" title="选择产品"  closed="true" style="width:500px;height:400px;top:10px;" modal="true"> 
    	<table id="disableProduct-table" fit="true">
            
    	</table>
	</div>
	
	<div id="printview" title="打印页面" class="easyui-window" closed="true" style="display:none; width:914px;height:382px;top:30px;" modal="true">
		<iframe id="printProduct" src="" style="width:914px;height:382px;" ></iframe>
	</div>
	
	<div id="editStyleWin" class="easyui-window" title="产品款号编辑栏" closed="true" align="center" style="display:none;width:620px;height:518px;top:10px;" modal="true">
		<div id="pToolbar" align="right" style="height:25px; padding:5px;" title="搜索"
			data-options="collapsible:false,border:true">      
				<a href="javascript:void(0)" class="easyui-linkbutton"	iconCls="icon-add" plain="true"	onclick="javascript:openAddStyle()">新增</a> 		
				<a href="javascript:void(0)" class="easyui-linkbutton"	iconCls="icon-delete" plain="true" onclick="javascript:delStyle()">删除</a>		
				<a href="javascript:void(0)" class="easyui-linkbutton"	iconCls="icon-ok" plain="true" onclick="javascript:changeStyle()">完成</a>		
		</div>
		<div>
			<h1 align="center" style="padding:2px 0 20px 0 ;font-size: 22px;">产品款号信息</h1>
			<div id="productStyle" data-options="border:1px">
				<form id ='styleFm'>
				
				</form>
			</div>
		</div>
		
	</div>
	
	<div id="addStyleName" class="easyui-window" title="添加款号" closed="true"  align="center"  style="display:none;width:350px;height:140px;" modal="true">  
		<form id="fm1" name="fm1"> 
		<table border="0"   cellpadding="5"   cellspacing="5" class="table-new" align="center">
    	 	<tr style="padding:100px 0 0 0">
    	 		<td class="textField">
    	 			<span style="color:red">*</span>款号：
    	 		</td>
    	 		<td>
    	 			<input type="text" id="newStyleName" name="newStyleName" class="easyui-validatebox" data-options="validType:'style[20]',required:true"/>
    	 		</td>
    	 	</tr>
    	 </table>
    	 </form>
    	 <div style="padding:20px;text-align:center;">  
                <a href="#" class="easyui-linkbutton" icon="icon-ok"onclick="makesure()">确定</a>  
                <a href="#" class="easyui-linkbutton" icon="icon-cancel"onclick="closeWin('addStyleName')">取消</a>  
         </div>  
	</div> 
	
	<div id="processToolbar" style="display:none">
		<a href="javascript:void(0)" class="easyui-linkbutton"	iconCls="icon-add" plain="true"	onclick="processAdd()">添加</a> 
		<a href="javascript:void(0)" class="easyui-linkbutton"	iconCls="icon-add" plain="true"	onclick="delProcess()">删除</a>	
		<a	href="javascript:void(0)" class="easyui-linkbutton"	iconCls="icon-undo" plain="true"  onclick="cancelProcessRow()">取消</a>	
	</div>
	
	<script type="text/javascript">


	var isOutsourc = [{id:"否",text:'否'},{id:"是",text:'是',"selected":true}];
	
	var attManage = function(value,row,index){
		return '<button type="button" onclick="delProcess(\''+index+'\');">删除</button>';				
	}
	
	var iconChange = function(value,row,index){
		
		if(row.icon==null||row.icon==""){
			return '<img class="item-img" onerror="this.style.display='+"'none'"+'"/>';
		}
		var imageFile = '<c:url value="/uploads/product"/>'+ row.icon;
		return '<img class="item-img" src="'+imageFile+'" style="height:29px;with:40px;" onerror="this.style.display='+"'none'"+'"/>';
		//var img = document.getElementById('imgid')[0].src;
	}

	var curProductId ='';

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
		            url: '<c:url value="/bus/product/uniqueName"/>',
		            data: { 'name':value,'id':curProductId },
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

        	$('#addProductwin').window({
				 onBeforeClose:function(){ 
					$('.validatebox-tip').remove();						
					$('#processList-table').datagrid("rejectChanges");
					closeiconimg();						
		      	 }
        		
			});

        	//编辑栏中的控件
        	var form = document.productfm;
			var $form = $(form);
			
			productSpec.unshift({id:'',text:'-未选择-'});
		  	$('#spec', $form).combobox({
		   		required: false,
		   		editable:false,
			 	valueField: 'id',
			  	textField: 'text',
			  	data:productSpec,
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
		  	
			
		  	$.getJSON('<c:url value="/sys/dictionary/getGroupList?key=PRODUCT_LAYOUT"/>', function(json){
			  	json.unshift({key:'',value:'--选择拼版--'});
			  	$('#layout', $form).combobox({
			   		required: false,
			   		editable:false,
				 	valueField: 'key',
				  	textField: 'value',
				  	data:json,
				  	width: '151px',
				    panelHeight: 'auto'
				});
			});

	    	$.getJSON('<c:url value="/sys/dictionary/getGroupList?key=PRODUCT_MODEL"/>', function(json){
	    	  	json.unshift({key:'',value:'--选择生产机型--'});
	    	  	$('#model', $form).combobox({
	    	   		required: false,
	    	   		editable:false,
	    		 	valueField: 'key',
	    		  	textField: 'value',
	    		  	data:json,
	    		  	width: '151px',
	    		    panelHeight: 'auto'
	    		});
	    		
	    	});	

        	$('#name', $form).validatebox();
			
        	$('#addProductwin').show();
        	$('#editStyleWin').show();   
        	$('#fm1').show();  
        	$('#addStyleName').show(); 
        	$('#processToolbar').show();  
	
            $('#list-table').edatagrid({
            	loadMsg:'加载中，请稍等。。。',  
                url: '<c:url value="/bus/product/search"/>',  
                onBeforeLoad: function(param){
 				   $('#list-table').edatagrid('clearSelections');	    
 				},
 				onLoadSuccess : function () {
	        		$(this).datagrid("fixRownumber");
	        	},
 				view: detailview,
 				detailFormatter:function(index,row){  
 		            return '<div id="detailForm-'+index+'"></div>';  
 		        },  
 		        onExpandRow: function(index,row){  		
 		            $('#detailForm-'+index).panel({  
 		                doSize:true,  
 		                border:false,  
 		                cache:false,  
 		                //href:'form.jsp?id='+id+'&index='+index,  
 		               	href:'<c:url value="/bus/product/view?rowIndex='+ index +'&id=' + row.id + '"/>',
 		                onLoad:function(){
 		                    $('#list-table').edatagrid('selectRow',index);
 		                    $('#list-table').edatagrid('fixDetailRowHeight',index);
 		                }  
 		            });
 		            $('#list-table').edatagrid('fixDetailRowHeight',index);
 		        },
 		       	onDblClickRow : function(rowIndex, rowData) {
        			$(this).datagrid('unselectAll');
           			$(this).datagrid('selectRow', rowIndex); 
				}
			});
            
            $("#printview").show();
            $("#list-table").show();
		});  

	    function comBoxReload(){
	    	$('#productCode').combobox('reload');
	        $('#productName').combobox('reload');
		}    	

        function productAdd(){

        	$('#addProductwin').window({title:'新增产品'});
        	$('#productfm')[0].reset();
       
	    	$('#id').val('');	    	
	    	$('#code').val('');
	    	$('#productCodeName').hide();
			$('#productCodeValue').hide(); 
			setPath("iconimg", "<c:url value='/images/no_icon.png'/>");   
			$('#spec').combobox("select",'');
			$('#layout').combobox("setValue",'');
			$('#model').combobox("setValue",'');

			processList = [];
			$('#processList-table').edatagrid({
				loadMsg:'加载中，请稍等。。。',
				onSelect:function(index, row){
					//row.orderId = selectedOrderId;
				}
				
			}).datagrid("loadData",processList);
				
	    	$('#addProductwin').window('open');	 	  	
        }

        //判别可编辑的grid中的可编辑行是否通过验证
        function gridIsValidate(id){
        	//获取可编辑行
        	var editIndex = $('#'+id).edatagrid('options').editIndex;
        	//可编辑行存在
        	if("undefined" != typeof editIndex){
        		if ($('#'+id).datagrid('validateRow', editIndex)){
            		if(id=='processList-table'){
            			$('#'+id).edatagrid('acceptChanges');
                	}  			
    				return true;
                }else{
                	$.messager.alert('提示','后道工序列表信息添加不全!','info');
                	return false;
                }
        	}else{
        		return true;
            }
        }

        var productInfo = '';

        function saveProduct(){     	
        	if(!gridIsValidate("processList-table")){
        		return;
            }     

        	var form2  = document.productfm;
            var $form2 = $(form2);
            productInfo = serializeObject($(form2));
            var specSize = $('#specSize', $form2).val();
    		if(specSize!=null && specSize!=''){
    			productInfo.spec += ("-"+specSize); 
    		}
            

            $.messager.progress({title: '请等待',msg: '保存中...',text: '',interval: 700});
            var oFile = document.getElementById('ficon');
            if(oFile.value == ""){
            	var isValid = $('#productfm').form('validate');
        		if (!isValid){
        			$.messager.progress('close');
        		}else{
        			$.ajax({
                        type: "post",
                        dataType: "json",
                        async:false,
                        url: '<c:url value="/bus/product/save"/>',
                        data: {"process":JSON.stringify(processList),"productInfo":JSON.stringify(productInfo)},
                        success: function(result) {
                        	$.messager.progress('close');  
                        	if(result.success){
                        		closeWin('addProductwin');
                        		$.messager.show({ title: '提示信息', msg : '保存成功' });
                        		$('#list-table').edatagrid('reload');                              	  	
                        	}else{
                        		$.messager.show({ title: '提示信息', msg : '保存失败' });                 	
                        	}    			                				                															                	
                        }
                    }); 
                }	
            }else{
            	$('#productfm').form('submit',{  
                    url: '<c:url value="/bus/product/addFicon"/>',  
                    dataType: "json",
                    async:false,
                    success: function(result){    
                    	var result = eval('(' + result + ')');  // change the JSON string to javascript object   
                    	if(result.success){
                    		productInfo.icon = result.rows;
                    		$.ajax({
                                type: "post",
                                dataType: "json",
                                async:false,
                                url: '<c:url value="/bus/product/save"/>',
                                data: {"process":JSON.stringify(processList),"productInfo":JSON.stringify(productInfo)},
                                success: function(result) {
                                	$.messager.progress('close');  
                                	if(result.success){
                                		closeWin('addProductwin');
                                		$.messager.show({ title: '提示信息', msg : '保存成功' });
                                		$('#list-table').edatagrid('reload');                              	  	
                                	}else{
                                		$.messager.show({ title: '提示信息', msg : '保存失败' });                 	
                                	}    			                				                															                	
                                }
                            });           	
                    	}else{
                    		$.messager.progress('close');
                    		$.messager.show({ title: '提示信息', msg : '保存失败' });                 	
                    	}        							
                    }
                });
            }
        	
	    	
	    }
        
        //edit
        function productEdit(){

        	$('#addProductwin').window({title:'编辑产品'});
        	
        	var product = $('#list-table').datagrid('getSelections');
        	if(product.length==1){
			 	var ida = product[0].id;
    			$('#productfm')[0].reset(); 			
    			$('#productCodeName').show();
    			$('#productCodeValue').show();   			
    			$('#addProductwin').window('open');
    			$.ajax({
    	        	url:'<c:url value="/bus/product/load"/>',
    	        	async:false,
    	        	dataType: "json",
    	        	data:{id:ida},
    	        	success:function(rowData){ 
    	        		var product = rowData.rows;  

    	        		if(product.icon!=null && product.icon!=""){
    	           			var imagepath = '<c:url value="/uploads/product/' + product.icon + '"/>';
    	           			document.getElementById("pre").innerHTML = "<img src='"+imagepath+"'/>";
    	       	        }else{
    	       	        	var path = "<c:url value='/images/no_icon.png'/>";
    	       	        	document.getElementById("pre").innerHTML = "<img src='"+path+"'/>";
    	           	    }  
    	           	    	        			      	        		      	        		        		
       	        		//$('#productfm').form('load',product);  

       	        		document.getElementById("id").value=product.id;
       	                document.getElementById("name").value=product.name;
       	             	document.getElementById("code").value=product.code;
       	             	document.getElementById("icon").value=product.icon;
       	          	    	          		
       	        	 	if(product.film){
                     		$("input[name='film'][value=true]").attr("checked",true);
                     	}else{
                     		$("input[name='film'][value=false]").attr("checked",true);        		
                     	}
       	        	 	if(product.scotch){
	                  		$("input[name='scotch'][value=true]").attr("checked",true);
	                  	}else{
	                  		$("input[name='scotch'][value=false]").attr("checked",true);        		
	                  	}
       	        	    document.getElementById("material").value=product.material;
       	        	    document.getElementById("openNum").value=product.openNum; 
       	        		document.getElementById("openSize").value=product.openSize; 
       	        		document.getElementById("openMethod").value=product.openMethod; 
       	        		document.getElementById("style").value=product.style;
       	        		$('#layout').combobox('select',product.layout);
       	        		$('#model').combobox('select',product.model);    
       	        		document.getElementById("process").value=product.process; 
       	        		document.getElementById("impos").value=product.impos;
       	        		document.getElementById("colors").value=product.colors; 	  
       	        		//document.getElementById("spec").value=product.spec;
       	        		
       	        		
       	        		var spec = product.spec!=null?product.spec:'';
	       	 			var index = spec.indexOf('-');
	       	 			if(index!=-1){			
	       	 			    document.getElementById("specSize").value=spec.substring(index+1); 
	       	 				$("#spec").combobox('select',spec.substring(index,-(index))); 
	       	 			}           		
	       	        	if(product.outsourc){
	                 		$("input[name='outsourc'][value=true]").attr("checked",true);
	                 	}else{
	                 		$("input[name='outsourc'][value=false]").attr("checked",true);        		
	                 	}	                 	    	        	
	       	        	document.getElementById("description").value = product.description; 
	       	        	
                     	//var spec = rowData.rows.spec;
       	        		//if(spec!=null && spec!=''){
       	        		//	var r = spec.split(" x ");
       	        		//	$('#mheight').numberbox('setValue',r[0]);
       	        		//	$('#mwidth').numberbox('setValue',r[1]);
       	        		//	$('#mheight').attr('required',true); 
 				        //     $('#mwidth').attr('required',true); 
 				        //     $('#specTr').show();      	        			
           	        	//}   
           	        	if(product.afterProcess){
           	        		processList =  product.afterProcess;
                   	    }else{
                   	    	processList =  [];
                       	}		       	        	
	       	        	$('#processList-table').edatagrid({
	       					loadMsg:'加载中，请稍等。。。'
	       				}).datagrid("loadData",processList);	
	       	        	$('#processList-table').edatagrid("clearSelections");	
    	        	}
    	        });
    		}else{
    			$.messager.alert('提示','请选择一项进行修改!','info');
    			$('#list-table').edatagrid('clearSelections');
    		}
		} 		 
	
      	//Del
		function delProduct() {
			var rows = $('#list-table').datagrid('getSelections');
			if (rows.length > 0) {
			    var ids = '';
			    var productCodes = '';
				for ( var i = 0; i < rows.length; i++) {
					ids += rows[i].id + ',';
					productCodes += rows[i].code + ',';
				}
				ids = ids.substring(0, ids.length - 1);
				productCodes = productCodes.substring(0, productCodes.length - 1);
				$.ajax({
	                type: "GET",
	                dataType: "json",
	                async:false,
	                url: '<c:url value="/bus/orderDetail/existDetailByProductCode"/>-'+productCodes,           
	                success: function(result) {
	                	if (result.success){ 
	                		$.messager.alert('警告', '选中的产品中有已经使用在订单中不能删除，请勾掉已经使用在订单中的产品!','info');
						}else{
							$.messager.confirm('Confirm','确定要删除选择的数据吗?', function(r) {
								if (r) {
									$.ajax({
						                type: "post",
						                dataType: "json",
						                url: '<c:url value="/bus/product/delete"/>',
						                data: {"id":ids,'productCodes':productCodes},
						                success: function(returnData) {
						                	if (returnData.success){ 
												$('#list-table').datagrid('reload');
												$('#list-table').datagrid('clearSelections');
												comBoxReload();
											} else {  
											    $.messager.show({ title: 'Error', msg : "删除失败" }); 
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

		function disableProduct(){
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
			                url: '<c:url value="/bus/product/disable"/>',
			                data: {"id":ids},
			                success: function(returnData) {
			                	if (returnData.success){ 
									$('#list-table').datagrid('reload');
									$('#list-table').datagrid('clearSelections');
									comBoxReload();
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


		function editProduct(){
			$('#disableProduct-table').edatagrid({
				loadMsg:'加载中，请稍等。。。',
	        	url: '<c:url value="/bus/product/getDisableProduct"/>',
	        	dataType: "json",
	        	frozenColumns: [[{ field: 'id', checkbox: true}]],//固定字段
	        	idField: 'id', //标识字段
	        	//sortName: 'id', //排序字段
	        	rownumbers: true, //显示行号
	        	fit: true,
	        	singleSelect:false,
	        	columns:[[
					{field:'name',title: '产品名称',width:"113"},
					{field:'code',title: '产品编号',width:"70"},
					{field:'icon',title: '图片',width:"140", formatter:iconChange},
					{field:'price',title: '单价(元)',width:"80"}
	        	]],
	        	toolbar: [{
	        		text: '启用',
	        		iconCls: 'icon-save',
	        		handler:function(){
	        			enableProduct();
	        		}
	        	},{
	    			text: '取消',
	    			iconCls:"icon-undo",
	    			handler:function(){
	    				closeWin('openDisableProductDiv');
	        		}
	    		}],
	        	onSelect : function(rowIndex, rowData) {
	        		var types=$('#disableProduct-table').edatagrid('getSelections');
	        		var parm=[];
	        		for(var i=0;i<types.length;i++){
	        			parm.push(types[i].id);
	        		}
	        	}
	        });  
        	$('#openDisableProductDiv').window('open');
		}

		function enableProduct(){
			var products = $('#disableProduct-table').datagrid('getChecked');
	        var productIds =new Array();    
			for(var i=0;i<products.length;i++){
				var product = products[i];
				productIds.push(product.id);
			}
			$.ajax({
				type: "post",
	    	    dataType: "json",
	        	url: "<c:url value='/bus/product/enable'/>",
	        	data: {'id':productIds.length!=0?productIds.join(','):''},
	       		success: function(data) {
	       			closeWin('openDisableProductDiv');
					if(data.success){
			        	$.messager.alert('提示','启用成功','info');
			        	$('#disableProduct-table').edatagrid('clearSelections');
			        	$('#list-table').edatagrid('reload');
			        	comBoxReload();
			        }else{
			        	$.messager.alert('提示','启用失败','info');		        	
					}
		        	
	        	}
	    	});
		}

		//close windows
		function closeProductWin(){
			$('#addProductwin').window('close');
		}

		function closeWin(id){
			$('#'+id).window('close');
		}

	    function closeiconimg(){
	        var path = "<c:url value='/images/no_icon.png'/>";
	        document.getElementById("pre").innerHTML = "<img src='"+path+"'/>";
	        //previewImage("<c:url value='/images/no_icon.png'/>");	   
	        
	 	    //setPath("iconimg", "<c:url value='/images/no_icon.png'/>");
	 	    $("#ficon","#productfm").val('');
	 	    $("#icon","#productfm").val('');
	    }
					
		/*********************************************   产品款号的编辑操作开始         ***************************************************/
		
		//打开 编辑款号的窗口
		function editStyle(element){
			//var o = e.srcElement || e.target;
			//o.innerHTML = o.innerHTML.split('：')[0] + '：' + document.getElementById('selScore').value;
			
			$("#fm1")[0].reset();
			var styles = document.getElementById("style").value;
			if(styles!=null && styles!=""){
				creatHtml(styles.split(","));
			}else{
				creatHtml(new Array());
			}
			
		}

		function creatHtml(productStyleList){
			$('#editStyleWin').window('close');
			var form = $('#styleFm');
			if(form){
				form.empty();
			} 			
			creatStyles(productStyleList,form);
			$('#editStyleWin').window('open');
		}

		function creatStyles(list,form){	
			for(var i=0;i<list.length;i++){	
				var styleDiv = "<div style='text-align:center;width:100px;height:50px;float:left'>"+
						"<input type='checkbox' name='styleName' value='"+ list[i] +"'>"+list[i]+"</input>"+
				    "</div>";
				$(styleDiv).appendTo(form);
			}
		}

		function openAddStyle(){				
			var form = document.fm1;
			form.reset();
			var $form = $(form);						
	    	$("input[name=newStyleName]", $form).val("");
	    	$('#addStyleName').window('open');			
		}

		function makesure(){
			var form = $('#styleFm');				
	    	var styleValue = $("#newStyleName").val();
	    	var list =new Array();  
	    	list.push(styleValue);
	    	creatStyles(list,form);
	    	closeWin('addStyleName');
		}

		function delStyle(){
			var checkeds = $('input:checked');	
			var inputs = $("input[name='styleName']");						
			var uncheckedList =new Array();  
			for(var j=0;j<inputs.length;j++){
				var isdel = false;
				for(var i=0;i<checkeds.length;i++){
					if(inputs[j].defaultValue==checkeds[i].defaultValue){
						isdel = true;						
						break;
					}						
				}
				if(!isdel){
					uncheckedList.push(inputs[j].defaultValue);
				}					
			}  				
			creatHtml(uncheckedList);
			
		}

		function changeStyle(){
			var inputs = $("input[name='styleName']");
			var list = new Array();
			for(var j=0;j<inputs.length;j++){
				list.push(inputs[j].defaultValue);
			}		
			document.getElementById("style").value = list.join(",");
			$('#editStyleWin').window('close');
		}
        /*********************************************   产品款号的编辑操作开始         ***************************************************/
        
      /*************************************************          产品下的后道工序的添加开始            ********************************************/
    
    var processList = [];
      
    function processAdd(){
    	$('#processList-table').datagrid('clearSelections');
		$('#processList-table').edatagrid('addRow');	
		var row = $('#processList-table').edatagrid('getSelected');
		if (row){
    		var rowIndex = $('#processList-table').edatagrid('getRowIndex', row); 
    		var edSet = $('#processList-table').edatagrid('getEditor', {  
                index : rowIndex,  
                field : 'isOutsourc' 
            });
            $(edSet.target).combobox('setValue',"是");	
        }
    }

    function cancelProcessRow(){
    	 //获取可编辑行
    	var editIndex = $('#processList-table').edatagrid('options').editIndex;
    	//可编辑行存在
    	if("undefined" != typeof editIndex){
    		if(editIndex==(processList.length-1)){
    			$('#processList-table').datagrid('cancelEdit',editIndex);
        	}else{
        		$('#processList-table').datagrid("loadData",processList);  
            }
        }
    }

    //单选模式
    function delProcess(index){

    	var row = $('#processList-table').datagrid('getSelected'); 
    	if(row!='' && row!=null){
    		var index  = $('#processList-table').datagrid('getRowIndex',row); 
        	
            //获取可编辑行
        	var editIndex = $('#processList-table').edatagrid('options').editIndex;
        	//可编辑行不存在
        	if(typeof(editIndex) == 'undefined' || editIndex==-1){
        		var list = [];
                for(var i=0;i<processList.length;i++){
        			if(index!=i){
        				list.push(processList[i]);
        			}
                }	
                processList = list;
            	$('#processList-table').datagrid("loadData",processList);
        		      	
        	}else{
            	//可编辑行是删除行
            	if(index==editIndex){
            		$('#processList-table').datagrid('cancelEdit', editIndex);
            		$('#processList-table').datagrid('clearSelections'); 
            	}		     				
        	}
    	}
    		
    }

    /*************************************************          产品下的后道工序的添加结束            ********************************************/
	</script>
</body>
</html>