<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/view/base_resource.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>新增订单</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />	
<link type="text/css" rel="stylesheet" media="all" href="<c:url value='/css/common.v4.1.0.css' />" />
<link type="text/css" rel="stylesheet" media="all" href="<c:url value='/css/order.1.2.css' />" />
<script type="text/javascript" src="<c:url value='/js/jquery-easyui/jquery.edatagrid.js'/>"></script>	
<!-- 新的loading,confirm及提示框start  -->
<link type="text/css" rel="stylesheet" media="all" href="<c:url value='/css/message_box.css' />" />
<script type="text/javascript" src="<c:url value='/js/commons/MessageBox.js'/>"></script>
<script type="text/javascript"  src="<c:url value='/view/bus/order/operate/add_product.js'/>"></script>
<script type="text/javascript"  src="<c:url value='/view/bus/order/operate/edit_product_common.js'/>"></script>
<style type="text/css">

/*** 上传图片的样式 ****/
.a-upload {
    padding: 4px 10px;
    height: 20px;
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
<script type="text/javascript">

var isOutsourc = [{id:"否",text:'否'},{id:"是",text:'是',"selected":true}];

var attManage = function(value,row,index){
	return '<sec:authorize  ifAllGranted="ORDER_PRODUCT_DELETE"><button type="button" onclick="delProduct(\''+index+'\');">删除</button></sec:authorize>';				
}

$(function(){
		
	productSpec.unshift({id:'',text:'--选择规格--'});
  	$('#spec', '#baseInfo').combobox({
   		required: false,
   		editable:false,
	 	valueField: 'id',
	  	textField: 'text',
	  	data:productSpec,
	  	width: '151px',
	    panelHeight: 'auto',
	    onLoadSuccess:function(rows){
			if(rows&&rows.length>0){
				$(this).combobox('select',rows[0].id);
			}
		},
		onSelect:function(row){
			if(row.id=='定规'){
				$('#specSize', '#baseInfo').removeAttr("readonly"); 
				$('#specSize', '#baseInfo').css('background-color','#FFFFFF');
			}else{
				$('#specSize', '#baseInfo').val('');
				$('#specSize', '#baseInfo').attr({ readonly: 'true' });
				$('#specSize', '#baseInfo').css('background-color','#DDDDDD');
			}
		}
	});

   	$.getJSON('<c:url value="/sys/dictionary/getGroupList?key=PRODUCT_MODEL"/>', function(json){
	  	json.unshift({key:'',value:'--选择生产机型--'});
	  	$('#model', '#baseInfo').combobox({
	   		required: false,
	   		editable:false,
		 	valueField: 'key',
		  	textField: 'value',
		  	data:json,
		  	width: '151px',
		    panelHeight: 'auto',
		    onLoadSuccess:function(rows){
				if(rows&&rows.length>0){
					$(this).combobox('select',rows[0].key);
				}
			}
		});
		
	});	
	
	$.getJSON('<c:url value="/sys/dictionary/getGroupList?key=PRODUCT_LAYOUT"/>', function(json){
	  	json.unshift({key:'',value:'--选择拼版--'});
	  	$('#layout', '#baseInfo').combobox({
	   		required: false,
	   		editable:false,
		 	valueField: 'key',
		  	textField: 'value',
		  	data:json,
		  	width: '151px',
		    panelHeight: 'auto',
		    onLoadSuccess:function(rows){
				if(rows&&rows.length>0){
					$(this).combobox('select',rows[0].key);
				}
			}
		});
		
	});
	
	$('#finishBtn').on('click',function(){
		var validate = true;
		for(var i = 1 ; i <=3 ; i++){
			validate = validData(i);
			if(!validate)
				break;
		}
		if(!validate){
			return ;
		}

		MessageBox.loading();
		var productInfo = serializeObject($('#baseInfo'));
		var specSize = $('#specSize', '#baseInfo').val();
		if(specSize!=null && specSize!=''){
			productInfo.spec += ("-"+specSize); 
		}
		$('#baseInfo').form('submit',{  
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
                        url: '<c:url value="/bus/order/product/save"/>',
                        data: {"products":JSON.stringify(orderDetailData),"productInfo":JSON.stringify(productInfo),"process":JSON.stringify(processFlowData),"orderId":'${orderId}'},
                        success: function(result) {
                        	MessageBox.closeLoading();                          	
                        	if(result.success){                    		
                        		window.location.href = "<c:url value='/bus/order/manage-${orderId}-${pageNumber}-${pageSize}'/>";                          	  	
                        	}else{
                        		MessageBox.error("保存失败!");          	
                        	}    			                				                															                	
                        }
                    });           	
            	}else{
            		MessageBox.closeLoading();
            		MessageBox.error("保存失败!");                	
            	}        							
            }
        });
		
	});
	
	 $(".yulan").mouseover(function () {
         $(this).addClass("border");
         //显示删除
         $(this).find(".del").show();
     });
     $(".yulan").mouseout(function () {
         $(this).removeClass("border");
         //隐藏删除
         $(this).find(".del").hide();
     });

     $('.del').click(function(){
 		 closeImage("<c:url value='/images/no_icon.png'/>","baseInfo");
 	 });
  	
	 $('#cancelBtn').click(function(){
		 window.location.href = "<c:url value='/bus/order/manage-${orderId}-${pageNumber}-${pageSize}'/>";
	 });

	
});

</script>
</head>
<body>
	<div class="content" style='font-family:"微软雅黑";'>
		<div class="float_tool_div">
			<a href='<c:url value="/bus/order/manage-${orderId}-${pageNumber}-${pageSize}"/>' >返回列表</a>
		</div>
		<div class="step-wrap">
			<div class="step-by-step">
				<div class="step-by-step-bg"></div>
				<div class="step-by-step-num">
					<a href="#" class="step-on" onclick="clickStepNum(1)">
						<h2>1</h2> <span>基本信息</span>
					</a> 
					<a href="#" onclick="clickStepNum(2)">
						<h2>2</h2> <span>工艺流程</span>
					</a> 
					<a href="#" onclick="clickStepNum(3)">
						<h2>3</h2> <span>订单明细</span>
					</a> 
				</div>
			</div>
			<div id="step-contents" >
			<div class="step-content display" id="baseInfoDiv">                                                            
			<form id="baseInfo" name="baseInfo" method="post" enctype="multipart/form-data">
				<input name="icon" id="icon" type="text" hidden="true"  style="display:none" />
				<ul>
				    <li class="tl4" >
						<ul>
							<li class="tr5"><span class="red-font">*</span> 产品名称：</li>
							<li class="tl9">&nbsp; <input name="name" type="text"  class="easyui-validatebox" data-options="required:true,missingMessage:'必填项'"/></li>				
							<li class="tr5">&nbsp;</li>
							<li class="tl9">
								  &nbsp;<a href="javascript:void(0);" class="a-upload">
			                           		<input type="file" onchange='previewImage(this,"pre")' accept=".jpeg,.bmp,.png,.jpg,.gif"  id="ficon" name="ficon"  />点击这里上传图片 
			                           	</a>
			                </li>
			                
							<li class="tr5">菲林：</li>
							<li class="tl9">&nbsp; <input type="radio" name="film" value = "true" checked="checked" />是
				                        &nbsp;&nbsp;&nbsp;
				                       <input type="radio" name="film" value = "false" />否
				            </li>
				            <li class="tr5">生产机型：</li>
							<li class="tl9">&nbsp;  <input type="text" class="easyui-combobox" name="model" id="model" /></li>
				          
							<li class="tr5">透明纸：</li>
							<li class="tl9">&nbsp; <input type="radio" name="scotch" value = "true"  />是
				                        &nbsp;&nbsp;&nbsp;
				                       <input type="radio" name="scotch" value = "false" checked="checked"  />否
				            </li>
				            <li class="tr5">工&nbsp;&nbsp;序：</li>
							<li class="tl9">&nbsp; <input name="process" id="process" type="text" /></li>
				            
							<li class="tr5">材质名称：</li>
							<li class="tl9">&nbsp; <input type="text"  id="material" name="material" /></li>
							<li class="tr5">是否外协：</li>
							<li class="tl9">&nbsp; <input type="radio" name="outsourc" value = "true" checked="checked" />是
				                        &nbsp;&nbsp;&nbsp;
				                       <input type="radio" name="outsourc" value = "false" />否
				            </li>
								
							<div class="clear"></div>
							<li class="tr5">规格：</li>
							<li class="tl9">&nbsp; 
								<input type="text"  class="easyui-combobox" id="spec" name="spec" style="width:90px;"  />
								<input type="text" id="specSize" style="width:80px;" />
				            </li>
				            <li class="tr5">拼&nbsp;&nbsp;数：</li>
							<li class="tl9">&nbsp; <input type="text" id="impos" name="impos" /></li>
				         
							
							<li class="tr5">开数(开)：</li>
							<li class="tl9">&nbsp; <input type="text" name="openNum" id="openNum" /></li>						   
							<li class="tr5">拼&nbsp;&nbsp;版：</li>
							<li class="tl9">&nbsp; <input type="text" class="easyui-combobox" name="layout" id="layout" /></li>
					
							<div class="clear"></div>
							<li class="tr5">开料尺寸：</li>
							<li class="tl9">&nbsp; <input type="text" id="openSize" name="openSize" /></li>
							<li class="tr5">色&nbsp;数(色)：</li>
							<li class="tl9">&nbsp; <input type="text" id="colors" name="colors" /></li>
							
							
							<li class="tr5">开料方法：</li>
							<li class="tl2">&nbsp; <textarea name="openMethod" id="openMethod" ></textarea>
							</li>
							<li class="tr5">注意事项：</li>
							<li class="tl2">&nbsp; <textarea name="description" id="description" ></textarea>
							</li>
						</ul>
				    </li>
				    <li class="tl5">
				    	<ul>
				    		<li  class="tl8">
					    		<div class="yulan" style="position:relative;">
				           		     <input type="button" class="del" value="删除" style="display:none;"/>
				           		     <div id="pre" >
				           		    	<img src="<c:url value='/images/no_icon.png'/>" />
				           		     </div>	   			 
				           		  </div>
				    		</li>			    	   		 
				    	</ul>					   	   		                                  						                           	         			
				    </li>   
				</ul>
				<div class="clear"></div>
			</form>	
			</div>
			<div class="step-content hidden" id="processFlowDiv">
				<!-- 工艺流程 -->
				<div style="margin-top: -25px;height:400px;" >
					<table id="processFlow" toolbar="#processToolbar" fit="true" rownumbers="true" fitColumns="true" singleSelect="true" nowrap="false" >
						<thead>
							<tr>						
								<th field="name" width="40" editor="{type:'combobox',options:{required:true,url:'<c:url value="/sys/dictionary/getGroupList?key=PRODUCT_PROCESS"/>',valueField:'key',textField:'value',panelHeight:'auto'}}">后道工序</th>
								<th field="isOutsourc" width="30" editor="{type:'combobox',options:{editable:false,required:true,data:isOutsourc,valueField:'id',textField:'text',panelHeight:'auto'}}">外协</th>
								<!-- <th field="number" width="45" editor="{type:'numberbox',options:{required:false,min:'0',precision:'0'}}">应产数量</th>  -->
								<th field="demand" width="100" formatter="contentWrap" editor="{type:'text'}">工艺要求</th>
								<th field="description" width="90" formatter="contentWrap" editor="{type:'text'}">备注</th>
								<!-- <th field="productId" width="30" formatter="attManage" type='linkbutton'>操作</th>	 -->						
							</tr>
						</thead>	
					</table>
				</div>
				<div class="clear"></div>
			</div>
			<div class="step-content hidden" id="orderDetailDiv">
				<!-- 订单明细 -->
				<div style="margin-top: -25px;height:400px;">	
					<table id="orderDetail"  toolbar="#toolbar" nowrap="false" pagination="false" idField="id" fit="true" rownumbers="true" fitColumns="true" singleSelect="true" >
						<thead>
							<tr>
								<th field="id" hidden="true" chechbox="true"></th>
								<th field="orderId" hidden="true" value="${orderId}">订单ID</th>
								<th field="style" width="90"  editor="{type:'validatebox',options:{validType:'style[20]'}}">款号</th>
								<th field="number" width="65" editor="{type:'numberbox',options:{required:true}}">数量</th>
								<th field="unit" width="40" editor="{type:'combobox',options:{editable:false,required:true,data:unitValue,valueField:'id',textField:'text',panelHeight:'auto'}}">单位</th>
								<th field="onePrice" width="45" editor="{type:'numberbox', options:{required:false,min:'0',max:5000,precision:'2'}}">单价(元)</th>
								<th field="allPrice" width="60" editor="{type:'numberbox', options:{required:false,min:'0',precision:'1'}}">金额(元)</th>
								<th field="papers" width="55" hidden="true" sortable="true" editor="{type:'numberbox'}">大张数量</th>
								<th field="prints" width="50" hidden="true" sortable="true" editor="{type:'numberbox'}">印次</th>
								<th field="description" width="90" formatter="contentWrap" editor="{type:'text'}">备注</th>
								<th field="name" width="40" formatter="attManage" type='linkbutton'>操作</th>							
							</tr>
						</thead>	
					</table>
				</div>
				<div class="clear"></div>
			</div>
			</div>
			<div class="tc">
				<input onclick="preStep(this)" type="button" class="white-btn" style="display:none;" value="上一步" /> 
				<input onclick="nextStep(this)" id="nextBtn"
					type="button" class="blue-btn" value="下一步" />
				<input
					type="button" class="white-btn" id="finishBtn" value="完成" />
				<input id="cancelBtn" type="button" value="取消" class="corres-gray-btn"/>
			</div>
		</div>
	</div>
	
	<div id="processToolbar" style="display:none">
		<a href="javascript:void(0)" class="easyui-linkbutton"	iconCls="icon-add" plain="true"	onclick="processAdd()">添加</a> 
		<a href="javascript:void(0)" class="easyui-linkbutton"	iconCls="icon-add" plain="true"	onclick="delProcess()">删除</a>	
		<a	href="javascript:void(0)" class="easyui-linkbutton"	iconCls="icon-undo" plain="true"  onclick="cancelProcessRow()">取消</a>	
	</div>
	
	<div id="toolbar" style="display:none">
		<sec:authorize  ifAllGranted="ORDER_PRODUCT_ADD">
				 <a href="javascript:void(0)" class="easyui-linkbutton"	iconCls="icon-add" plain="true"	onclick="productAdd()">添加</a> 
		</sec:authorize>
		<sec:authorize  ifAllGranted="ORDER_PRODUCT_CANCEL">
				 <a	href="javascript:void(0)" class="easyui-linkbutton"	iconCls="icon-undo" plain="true"  onclick="cancelProductRow()">取消</a>
		</sec:authorize>
	</div>
</body>
</html>