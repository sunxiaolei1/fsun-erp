<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>

<%@include file="/view/role_resource.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
	.textField{text-align:right;}	
	.table-new{font-size:12px;}
	a {color:#07519A; text-decoration: none}
	a:hover {color: #FF6600; text-decoration: underline}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title></title>
</head>
<body>
	<div class="easyui-layout" fit="true" id='bt_role_layout'>
		<div region="center" style="border-bottom: none;">
			<table id="list-table"
				pagination="false" idField="id" fit="true" rownumbers="true"
				fitColumns="false" singleSelect="true">
			</table>
		</div>
	</div>
	
	<!-- 外协单明细编辑窗口 -->		
	<div id="addOutSide" class="easyui-window" title="新增回执单" closed="true" align="center" style="display:none;width:600px;height:auto;top:20px;" buttons="#dlg-buttons" modal="true">  
    	 <form id="fm1" method="post" name="fm1">  
    	 <input id="id" name="id" type="hidden"/>  
    	  <input id="outsourcName" name="outsourcName" value="${outsourcName}" type="hidden"/> 	
    	 <table border="0"  class="table-new"  cellpadding="5"   cellspacing="5"> 	
    	 	<tr>
    	 		<td class="textField">
    	 			<span style="color:red">*</span>订单编号：
    	 		</td>
    	 		<td>
    	 			<input id="orderCode" name="orderCode" class="easyui-combobox" validType="existOrderCode" />
    	 		</td>
    	 		<td class="textField">
    	 			工艺流程：
    	 		</td>
    	 		<td>
    	 			<input id="process" name="process" class="easyui-combobox" />
    	 		</td>
    	 	</tr>
    	 	<tr>
    	 		<td class="textField">
    	 			金额(元)：
    	 		</td>
    	 		<td>
    	 			<input type="text" class="easyui-numberbox" name="allPrice" id="allPrice" min="0" precision="1" />
    	 		</td>
    	 		<td class="textField" >
    	 			<span style="color:red">*</span>完工时间：
    	 		</td>
    	 		<td >
    	 			<input  class="easyui-datebox" editable="false" id="completeTime" name="completeTime" data-options="required:true" />
    	 		</td>
    	 	</tr>
    	 	<tr>
    	 		<td class="textField">
    	 			描述：
    	 		</td>
    	 		<td>
    	 			<textarea name="description" rows="2" cols="15" ></textarea>
    	 		</td>
    	 	</tr>
    	 </table>
    	 </form>
    	 <div style="padding:20px;text-align:center;">  
                <a href="#" class="easyui-linkbutton" icon="icon-ok" onclick="saveOutSide()">保存</a>  
                <a href="#" class="easyui-linkbutton" icon="icon-cancel" onclick="closeWin('addOutSide')">取消</a>  
         </div>  
	</div> 
	
	<div id="editPictureWin" class="easyui-window" title="图片集编辑栏" closed="true" align="center" style="overflow:visible;display:none;width:630px;height:445px;top:5px;" modal="true">
		<div id="pToolbar" align="right" style="height:10px; padding:5px 5px 2px 0 ;" title="搜索"
			data-options="collapsible:false,border:true">      
				<a href="javascript:void(0)" class="easyui-linkbutton"	iconCls="icon-add" plain="true"	onclick="javascript:pictrueImport()">新增</a> 		
				<a href="javascript:void(0)" class="easyui-linkbutton"	iconCls="icon-delete" plain="true" onclick="javascript:delPictrue()">删除</a>		
		</div>
		<div>
		   <br>
			<!-- <h1 align="center" style="padding:2px 0 2px 0 ;font-size: 22px;">图片集</h1> -->
			<div id="outSidePicture" data-options="border:1px" style="height:375px;width:600px;OVERFLOW-y:auto;" >
				<form id ='pictureFm' name='pictureFm'>
				
				</form>
			</div>
		</div>
		
	</div>
	
	<script>

		var currOrderCode = "";

		$.extend($.fn.validatebox.defaults.rules, { 
			existOrderCode : {
				validator : function(value, param) {
					var validate = false;
		    		$.ajax({
			     	  	url:'<c:url value="/bus/order/existOrderCode"/>',
			     	  	dataType: "json",
			     	  	async:false,
			       		data:{"orderCode":value},
			        	success:function(data){
			        		if(data.success){
			        			validate = true;
			        		}
			       		}
			        });
		    		return validate;
				},
				message : '不存在该订单编号。'
			},		
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
		            return /^([+]?[0-9])|([-]?[0-9])+\d*$/i.test(value);
		        },
		        message: '请输入整数'
		    }                  
		});
		
		$(function() {
			
			$('#orderCode').combobox({
        		method:'get',
                required: true,
        	 	valueField: 'code',
        	  	textField: 'code',
        	  	url: '<c:url value="/bus/order/getCodes"/>',
        	    panelHeight: 'auto'
        	});

			$('#process').combobox({
        		method:'get',
                required: false,
                data: ${technology},
                valueField: 'code',
			  	textField: 'name',
        	    panelHeight: 'auto'
        	});
	
			$('#addOutSide').show();
			$('#editPictureWin').show();
						
			var outsourcName = '${outsourcName}';
			var url = "";
			if(outsourcName!=''){
				url = '<c:url value="/bus/outsourcDetail/getOutsourcDetailByName?outsourcName='+ encodeURI(encodeURI(outsourcName)) +'"/>';
			}				
			$('#list-table').datagrid({
				url: url,
				loadMsg:'加载中，请稍等。。。',
				columns:[[
							{field:'id',checkbox:true},
							{field:'orderCode',sortable:true, title: '订单编号',width:"75"},
							{field:'outsourcName',sortable:true, title: '外协方',width:"130"},
							{field:'process',sortable:true,title: '工艺流程',width:"70"},
							{field:'allPrice',sortable:true,title: '金额(元)',width:"60"},
							{field:'completeTime',sortable:true,title: '完工时间',width:"75"},
							{field:'createManName',sortable:true,title: '制单人',width:"80"},
							{field:'pictures',title: '操作',editor:'linkbutton', width:"85",formatter:attManage},
							{field:'description',title: '描述',width:"100",formatter:showAllItem}
												
		            	]],
		        toolbar : [ <sec:authorize  ifAllGranted="OUTSIDE_ADD">{text: '新增',iconCls: 'icon-add',handler: addOutSide},</sec:authorize>
	            	<sec:authorize  ifAllGranted="OUTSIDE_EDIT">{text: '编辑',iconCls: 'icon-edit',handler: editOutSide},</sec:authorize>
	            	<sec:authorize  ifAllGranted="OUTSIDE_DELETE">{text: '删除',iconCls: 'icon-delete',handler: delOutSide},</sec:authorize>
	            	<sec:authorize  ifAllGranted="OUTSIDE_EXPORT">{text: 'EXCEL导出',iconCls: 'icon-export',handler: templateDownload}</sec:authorize>
	            	],
            	onLoadSuccess : function () {
	        		$(this).datagrid("fixRownumber");
	        	},
	            onBeforeLoad: function(param){
				   $('#list-table').edatagrid('clearSelections');	    
				}					
			});		

		});

		var attManage = function(value,row,index){
			return '<sec:authorize  ifAllGranted="ATT_EDIT"><button type="button" onclick="openPictureWin(\''+row.orderCode+'\');">附件管理</button></sec:authorize>';				
		}

		

		function openPictureWin(orderCode){
			currOrderCode = orderCode;
			$.ajax({
	        	url:'<c:url value="/bus/outsourcDetail/getPictrueIds"/>',
	        	dataType: "json",
	        	data:{'outSideId':orderCode},
	        	async:false,
	        	success:function(list){	
	        		creatHtml(list);
	        	}
	        });
		}

		function creatHtml(productStyleList){
			$('#editPictureWin').window('close');
			var form = $('#pictureFm');
			if(form){
				form.empty();
			} 			
			creatPictures(productStyleList,form);
			$('#editPictureWin').window('open');
		}

		function creatPictures(list,form){	
			var src ='';
			for(var i=0;i<list.length;i++){	
				src='<c:url value="/bus/outsourcDetail/getPictrueById?id='+list[i]+'"/>';
				var styleDiv = "<div style='text-align:center;width:580px;height:450px;float:left'>"+
						"<div><input align='top' type='checkbox' name='styleName' value='"+ list[i] +"'/></div>"+
						"<img style='width:560px;height:420px;' alt='"+list[i]+"' src='" + src +"'/>"+
				    "</div>";
				$(styleDiv).appendTo(form);
			}
		}

		function addOutSide(){
			$('#fm1')[0].reset();
	    	var form = document.fm1;
			var $form = $(form);  
			$('#id',$form).val(''); 
	    	$('#completeTime',$form).datebox("setValue",myformatter(new Date()));
	    	var process = ${technology};
	    	if(process!=null && process.length>0){
	    		$('#process').combobox("setValue",process[0].code);//这里写设置默认值，
	    	} 
	    	$('#addOutSide').window('open');	 
	    }
		
		function editOutSide(){
			var order =$('#list-table').edatagrid('getSelections');
			if(order.length==1){
			 	var ida = order[0].id;
	   			$('#fm1')[0].reset();
	   			$.ajax({
	   	        	url:'<c:url value="/bus/outsourcDetail/load"/>',
	   	        	dataType: "json",
	   	        	data:{id:ida},
	   	        	async:false,
	   	        	success:function(rowData){		    	        		
	   	        		$('#fm1').form('load',rowData.rows);
	   	        		$('#addOutSide').window('open');
	   	        	}
	   	        });			
	   		}else{
	   			$.messager.alert('提示','请选择一项进行修改!','info');
	   			$('#list-table').edatagrid('clearSelections');
	   		}
		}

		function saveOutSide(){
			$.messager.progress({title: '请等待',msg: '保存中...',text: '',interval: 700});
			$('#fm1').form('submit',{  
                url: '<c:url value="/bus/outsourcDetail/save"/>',  
                dataType: "json",
                async:false,
                onSubmit: function(){
	        		var isValid = $(this).form('validate');
	        		if (!isValid){
	        			$.messager.progress('close');
	        		}

	        		/*var form = document.fm1;
	    			var $form = $(form);  
	    			var orderId = $('#orderCode',$form).combobox("getValue");
	    			if(orderId!=null && orderId!=''){
						
		    		}else{
		    			$.messager.progress('close');
		    			$.messager.alert('消息', '不存在该订单编号，请重填!','info');
		    			return false;
			    	}*/
	        		return isValid;
	        	},
                success: function(result){   
	        		$.messager.progress('close');           	
                	var result = eval('(' + result + ')');  // change the JSON string to javascript object   
                	if(result.success){
                		$.messager.show({ title: '提示信息', msg : '保存成功' });
                		$('#list-table').edatagrid('reload');
                    	$('#list-table').datagrid('clearSelections');  
                    	$('#addOutSide').window('close');           	
                	}else{
                		$.messager.show({ title: '提示信息', msg : '保存失败' }); 
                		$('#addOutSide').window('open');           	
                	}        							
                }
            });
		}
		
		//Del
		function delOutSide() {
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
			                url: '<c:url value="/bus/outsourcDetail/delete"/>',
			                data: {"id":ids},
			                success: function(returnData) {
			                	if (returnData.success){ 
									$('#list-table').datagrid('reload');
									$('#list-table').datagrid('clearSelections');
									$.messager.show({ title: 'Error', msg : "删除成功" });
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

		function closeWin(id){
			$('#'+id).window('close');
		}


		//插件js
		/**
		 * 创建上传窗口 公共方法
		 * @param chunk 是否分割大文件
		 * @param callBack 上传成功之后的回调
		 */
		function Uploader(chunk,outSideId,callBack){
			var addWin = $('<div style="overflow: hidden;"/>');
			var upladoer = $('<iframe/>');
			upladoer.attr({'src':'<%=basePath%>view/bus/outsourcDetail/uploader.jsp?outSideId='+outSideId+'&chunk='+chunk,width:'100%',height:'100%',frameborder:'0',scrolling:'no'});
			addWin.window({
				title:"导入文件",
				height:350,
				width:550,
				minimizable:false,
				modal:true,
				collapsible:false,
				maximizable:false,
				resizable:false,
				content:upladoer,
				onClose:function(){
					var fw = GetFrameWindow(upladoer[0]);
					var files = fw.files;
					$(this).window('destroy');
					callBack.call(this,files);
				},
				onOpen:function(){
					var target = $(this);
					setTimeout(function(){
						var fw = GetFrameWindow(upladoer[0]);
						fw.target = target;
					},100);
				}
			});
		}
		
		/**
		 * 根据iframe对象获取iframe的window对象
		 * @param frame
		 * @returns {Boolean}
		 */
		function GetFrameWindow(frame){
			return frame && typeof(frame)=='object' && frame.tagName == 'IFRAME' && frame.contentWindow;
		}
		
		//图片导入
		function pictrueImport(){
			var outSideId = currOrderCode;
			var chunk = false;			
			Uploader(chunk,outSideId,function(files){
				if(files && files.length>0){
					openPictureWin(currOrderCode);				
				}
			});
		}

		//删除图片
		function delPictrue(){
			var form = document.pictureFm;
			var $form = $(form);
			var checkeds = $('input:checked',$form);			
			if(checkeds.length>0){
				var pictrueIds = [];
				for(var i=0;i<checkeds.length;i++){
					pictrueIds.push(checkeds[i].defaultValue);			   				
				}
				$.messager.confirm('Confirm','确定要删除选择的图片吗?', function(r) {
					if (r) {
						$.ajax({
				        	url:'<c:url value="/bus/outsourcDetail/delPictrue"/>',
				        	dataType: "json",
				        	data:{'id':pictrueIds.join(",")},
				        	async:false,
				        	success:function(result){	
					        	if(result.success){
					        		openPictureWin(currOrderCode);	
					        	}else{
					        		$.messager.alert('提示','删除异常!','info');		
						        }
				        		
				        	}
				        });	
					}
				});
			}else{
        		$.messager.alert('提示','请选择要删除的图片!','info');		
	        }
			
			
		}


		//excel表模板导出
		function templateDownload(){
			var outsourcName = '${outsourcName}';
			window.location.href = '<c:url value="/bus/outsourcDetail/excelExport?outsourcName='+ encodeURI(encodeURI(outsourcName)) +'"/>';
		}
		
	</script>
</body>
</html>