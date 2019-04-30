<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/view/base_resource.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />	
<link type="text/css" rel="stylesheet" media="all" href="<c:url value='/css/common.v4.1.0.css' />" />
<link type="text/css" rel="stylesheet" media="all" href="<c:url value='/css/order.1.2.css' />" />
<link type="text/css" rel="stylesheet" media="all" href="<c:url value='/css/message_box.css' />" />
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

<script type="text/javascript" src="<c:url value='/js/commons/MessageBox.js'/>"></script>
<script type="text/javascript">

$(function(){

	var $headerForm = $("#proxyHeaderfm");	
	var $detailForm = $("#proxyDetailfm");	
	
	initForm($headerForm, $detailForm);
	
	$.ajax({
       	url:'<c:url value="/bus/proxyOrder/getEntry" />',
       	dataType: "json",
       	data: {proxyCode:'${proxyCode}'},
       	success:function(result){
       		if(result.success){
    			var proxyOrderDto =  result.rows;	
    			var proxyOrderHeader = proxyOrderDto.proxyOrderHeader;
       			var proxyOrderDetail = proxyOrderDto.proxyOrderDetail;
       			var proxyPrintDetails = proxyOrderDto.proxyPrintDetails;
       			//初始化客户
       			$("#customerCode",$headerForm).combogrid({
	       			  panelWidth: 500,
	       		      panelHeight: 320,
	       		      idField: 'code',
	       		      textField: 'name',
	       		      url: '<c:url value="/bus/customer/search"/>',
	       		      queryParams: {enabled: true, type:1, q:proxyOrderHeader.customerCode},
	       		      multiple: false,
	       		      fitColumns: true,
	       		      striped: true,
	       		      editable: true,
	       		      pagination: true,
	       		      rownumbers: true,
	       		      collapsible: false,
	       		      pageNumber : parseInt('${pageNumber}')||1,
	       		      pageSize : parseInt('${pageSize}')||10,
	       		      method: 'post',
	       		      mode:'remote',
	       		      columns: [[
	       			        //{field: "id", checkbox: true},
	       			        {field: "code", title: "客户编号", width: 40,align:'center'},
	       			        {field: "name", title: "客户名称", width: 140},
	       			        {field: "tel", title: "电话", width: 100},
	       			        {field: "contacts", title: "联系人", width: 60}
	       		  ]],
	       		  onLoadSuccess:function(data){	       			 	       			 
	       			 $headerForm.form("load", proxyOrderHeader);
	       			 if(proxyOrderHeader.createTime!=null && proxyOrderHeader.createTime.length>10){
	       				proxyOrderHeader.createTime = proxyOrderHeader.createTime.substring(0,10);
	       			 }
	       			 $("#createTime",$headerForm).datebox("setValue",proxyOrderHeader.createTime);
	       			 setTimeout(function(){
	       				 $("input[name=telephone]",$headerForm).val(proxyOrderHeader.telephone);
	       		    	 $("input[name=contract]",$headerForm).val(proxyOrderHeader.contract);
	       			 },1);	       			
	       		  },
	       	      onSelect:function(index, data){  			    	  
	       	    	  $("input[name=telephone]",$headerForm).val(data.tel);
	       	    	  $("input[name=contract]",$headerForm).val(data.contacts);
	       	    	  $("input[name=customerName]",$headerForm).val(data.name);
	       	      },
	       	      loadMsg: "数据加载中请稍后……",
	       	      emptyMsg: "没有符合条件的记录"
	       	    });
       			
       			if(proxyOrderHeader.enabled){
       				
       				$('#finishBtn').on('click',function(){	      
       			        
       					var isValid0 = $headerForm.form('validate');
       			    	var isValid1 = $detailForm.form('validate');
       			    	var isValid2 = gridIsValidate("processFlow");
       					if (!isValid0 || !isValid1 || !isValid2){
       						return ;
       					}
       					
       					$('#processFlow').datagrid("acceptChanges"); 
       					if(printProcessDtos.length==0){
       						MessageBox.warn("没有印刷明细，至少需要一条!");
       						return;
       					}
       				    var proxyOrderHeader = serializeObject($headerForm);   
       				    var proxyOrderDetail = serializeObject($detailForm);	    
       				    var specSize = $('#specSize', $detailForm).val();
       					if(specSize!=null && specSize!=''){
       						proxyOrderDetail.spec += ("-"+specSize); 
       					}
       					
       					//考虑出现提交失败需要重复提交的情况
       					var date = proxyOrderHeader.receiveTime+"";
       					if(date.indexOf("00:00:00")<0){
       						proxyOrderHeader.receiveTime += " 00:00:00";
       					}      					
       					 					
       				    var proxyPrintDetails = new Array();
       				    $.each(printProcessDtos,function(){
       				    	var proxyPrintDetail = this;
       				    	proxyPrintDetail.productName = proxyOrderDetail.productName;
       				    	proxyPrintDetail.proxyCode = '${proxyCode}';
       				    	delete proxyPrintDetail.isNewRecord;	    	
       				    	proxyPrintDetails.push(proxyPrintDetail);
       				    });
       					
       					MessageBox.loading();
       			        var oFile = document.getElementById('ficon');
       			        if(oFile.value == ""){ 
       			        	var proxyOrderDto = {
       			       	   		"proxyOrderHeader":proxyOrderHeader,
       			       	       	"proxyOrderDetail":proxyOrderDetail,
       			       	  		"proxyPrintDetails":proxyPrintDetails
       			       	    };
       			        	$.ajax({
       			    	        type: "post",
       			    	        dataType: "json",
       			    	        contentType:"application/json;charset=utf-8",
       			    	        async:false,
       			    	        url: '<c:url value="/bus/proxyOrder/updateEntry"/>',
       			    	        data: JSON.stringify(proxyOrderDto),
       			    	        success: function(result) {
       			    	        	MessageBox.closeLoading();     
       			    	        	if(result.success){
       			    	        		window.parent.toProxyListPage('${proxyCode}'); 	
       			    	        	}else{
       			    	        		MessageBox.error("保存失败!");                  	
       			    	        	}    			                				                															                	
       			    	        }
       			    	    });    	
       			        }else{
       			        	 $detailForm.form('submit',{  
       			                url: '<c:url value="/bus/product/addFicon"/>',  
       			                dataType: "json",
       			                async:false,
       			                success: function(result){    
       			                	var result = eval('(' + result + ')');  // change the JSON string to javascript object   
       			                	if(result.success){
       			                		proxyOrderDetail.imageUrl = result.rows;
       			                		var proxyOrderDto = {
       			               		   		"proxyOrderHeader":proxyOrderHeader,
       			               		       	"proxyOrderDetail":proxyOrderDetail,
       			               		       	"proxyPrintDetails":proxyPrintDetails
       			               		    };               		
       			                		$.ajax({
       			                			type: "post",
       			                	        dataType: "json",
       			                	        contentType:"application/json;charset=utf-8",
       			                	        async:false,
       			                	        url: '<c:url value="/bus/proxyOrder/updateEntry"/>',
       			                	        data: JSON.stringify(proxyOrderDto),
       			                            success: function(result) {
       			                            	MessageBox.closeLoading();     
       			                            	if(result.success){
       			                	        		window.parent.toProxyListPage('${proxyCode}'); 	
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
       			        }
       				});
       				$('#finishBtnDiv').show();
       			}
       			
       			$detailForm.form("load", proxyOrderDetail);
       			     			   			      	
    			var imageUrl = proxyOrderDetail.imageUrl;
        		var path = "<c:url value='/images/no_icon.png'/>";
        		if(imageUrl!=null && imageUrl!=""){
        			path = '<c:url value="/uploads/product/' + imageUrl + '"/>';         			
        	    }    	        	
        	    document.getElementById("pre").innerHTML = "<img src='"+ path +"'/>";
            	           			
        		var spec = proxyOrderDetail.spec!=null?proxyOrderDetail.spec:'';
    	 		var index = spec.indexOf('-');  
    	 		if(index!=-1){	
    	 			$("#specSize",$detailForm).val(spec.substring(index+1));
    	 			$("#spec", $detailForm).combobox('select',spec.substring(index,-(index))); 
    	 		}  
       		       
    	 		printProcessDtos = proxyPrintDetails;
    	 		initProcessFlow(printProcessDtos);
       		}
	
       	}
    });
	
  	
	 $('#cancelBtn').click(function(){
		 window.parent.toProxyListPage('${proxyCode}');
	 });
	 
	
});
	
/**
 * 重新加载combo
 */
function initCustomerCombo(customerCode){
	var $headerForm = $("#proxyHeaderfm");
	$("#customerCode",$headerForm).combogrid({		 
	   	queryParams: {enabled: true, q:customerCode},	      
	  	onLoadSuccess:function(data){		       			
			$(this).combogrid("setValue", customerCode);			
	  	}
    });			
}

/*
* 初始化选择控件
*/
function initForm($headerForm, $detailForm){
	
 	$('#spec', $detailForm).combobox({
  		required: false,
  		editable:false,
	 	valueField: 'id',
	  	textField: 'text',
	  	data:productSpec,
	  	width: 'auto',
	    panelHeight: 'auto',
		onSelect:function(row){
			if(row.id=='定规'){
				$('#specSize', $detailForm).removeAttr("readonly"); 
				$('#specSize', $detailForm).css('background-color','#FFFFFF');
			}else{
				$('#specSize', $detailForm).val('');
				$('#specSize', $detailForm).attr({ readonly: 'true' });
				$('#specSize', $detailForm).css('background-color','#DDDDDD');
			}
		}
	});
	
	 $(".yulan1").mouseover(function () {
         $(this).addClass("border");
         //显示删除
         $(this).find(".del").show();
     });
     $(".yulan1").mouseout(function () {
         $(this).removeClass("border");
         //隐藏删除
         $(this).find(".del").hide();
     });

     $('.del').click(function(){
 		 closeImage("<c:url value='/images/no_icon.png'/>","proxyDetailfm");
 		 $('#imageUrl', $detailForm).val('');
 	 });
}


</script>
</head>
<body>
	<div class="content" style='font-family:"微软雅黑";height:95%'>
		<div class="left" style="margin-left:5px;">
			<input id="cancelBtn" type="button" value="取消" class="corres-gray-btn"/>
		</div>
		<div class="right" style="margin-right:10px;">
			<input type="button" class="blue-btn" id="finishBtn" value="更新" />
		</div>
		<h3 class="title" style="margin-top:4px;">加工明细</h3>
		<div class="step-wrap" style="width:99%;padding-bottom:2px;margin-top:-5px;">
			<div class="step-content display" style="height:89%;"> 
			    <div class="left" style="margin-top:-10px;width:24%;border-width:1px 1px 1px 0;">
					<form id="proxyHeaderfm" name="proxyHeaderfm" >	
						 <input name="customerName" style="display:none"   />		
						<ul>	
							<li class="tr13"> 加工单号：</li>
							<li class="tl6">&nbsp; <input name="proxyCode" value="${proxyCode}" type="text" readOnly  style="width:156px;"/></li>
							<li class="tr13"> 客户名称：</li>
							<li class="tl6">&nbsp;  
								<input type="text" style="width:130px;" name="customerCode" id="customerCode" />
								<sec:authorize  ifAllGranted="CUSTOMER_ADD">
									<a href="#" class="icon-add" style="text-decoration:none;" title="创建客户" onclick="javascript:addCustomer()" >
							             &nbsp;&nbsp;&nbsp;&nbsp;
									</a>
								</sec:authorize>
							</li>
							<li class="tr13"></span> 交货日期：</li>
							<li class="tl6">&nbsp; <input class="easyui-datebox" editable="false" name="receiveTime" style="width:156px;"
								id="receiveTime"  validType="date" data-options="required:true"/></li>
							<li class="tr11">是否付款：</li>
							<li class="tl6">&nbsp; <input type="text" editable="false" class="easyui-combobox" style="width:156px;"
								name="paid" data-options="data:isGet,valueField:'id',textField:'text',panelHeight:'auto'" />
							</li>
							<li class="tr11">版子总数：</li>
							<li class="tl6" >&nbsp; <input name="totalVersions" type="text"  class="easyui-numberbox" style="width:156px;" data-options="min:0,precision:0" ></input></li>																			              																											              
							<li class="tr11">单据总数：</li>
							<li class="tl6" >&nbsp; <input name="number" id="number" type="text" readOnly class="easyui-numberbox" style="width:156px;" data-options="min:0,precision:0" ></input></li>
							<li class="tr11">单据金额：</li>
							<li class="tl6" >&nbsp; <input name="orderPrice" id="orderPrice"  type="text"  class="easyui-numberbox" style="width:156px;"data-options="min:0,precision:2"></input></li>
							<li class="tr11">电&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;话：</li>
							<li class="tl6" >&nbsp; <input name="telephone" id="telephone"  type="text" style="width:156px;"></input></li>
							<li class="tr11">联&nbsp;&nbsp;系&nbsp;&nbsp;人：</li>
							<li class="tl6" >&nbsp; <input name="contract" id="contract"  type="text" style="width:156px;"></input></li>
							<li class="tr11">制&nbsp;&nbsp;单&nbsp;&nbsp;人：</li>
							<li class="tl6" >&nbsp; <input id="createManName" name="createManName" readOnly  type="text" style="width:156px;"></input></li>
							<li class="tr11">制单时间：</li>
							<li class="tl6" >&nbsp; <input class="easyui-datebox" id="createTime" disabled style="width:156px;"></input></li>
							<li class="tr11">备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注：</li>
							<li class="tl6" >&nbsp; <textarea name="descr" style="width:156px;" ></textarea></li>
							
						</ul>
					</form>	
				</div>	
				<div class="right" style="margin-top:-10px;width:75%;height:90%;border-width:1px 0px 1px 1px;">
					<form id="proxyDetailfm" name="proxyDetailfm" method="post" enctype="multipart/form-data">										
					    <input name="proxyCode" value="${proxyCode}" style="display:none"   />	
						<input name="imageUrl" id="imageUrl" style="display:none" />
						<ul>
						    <li class="tl6" >
								<ul>
									<li class="tr6">产品名称：</li>
									<li class="tl13">&nbsp; <input name="productName" type="text"  class="easyui-validatebox" 
										style="width:252px;" data-options="required:true,missingMessage:'必填项'"/></li>													
									<li class="tl9" style="margin-top:-4px;text-align:left;">											
										&nbsp;<a href="javascript:void(0);" class="a-upload">
			                           		<input type="file" onchange='previewImage(this,"pre")' accept=".jpeg,.bmp,.png,.jpg,.gif"  id="ficon" name="ficon"  />点击这里上传图片 
			                           	</a>				                      
						            </li>
								
					               	<li class="tr4">材质名称：</li>
									<li class="tl9">&nbsp; <input type="text" style="width:152px;" name="material" /></li>																
									<li class="tr4">开料尺寸：</li>
									<li class="tl9">&nbsp; <input type="text" name="openSize" style="width:140px;" /></li>
									
									<li class="tr4">规&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;格：</li>
									<li class="tl9">&nbsp; 
										<input type="text"  class="easyui-combobox" id="spec" name="spec" style="width:70px;"  />
										<input type="text" id="specSize" style="width:80px;" />
						            </li>
						            <li class="tr4">大张数量：</li>
									<li class="tl9">&nbsp; <input type="text" class="easyui-numberbox" name="papers" data-options="min:0,precision:0" style="width:140px;" /></li>
													
									<li class="tr4">开&nbsp;数(开)：</li>
									<li class="tl9">&nbsp; <input type="text" class="easyui-numberbox" name="openNum" data-options="min:0,precision:0" style="width:152px;" /></li>
									<li class="tr6">印张总数：</li>
									<li class="tl9">&nbsp; <input type="text" class="easyui-numberbox" name="prints" data-options="min:0,precision:0,
										   required:true,
										   onChange:function(newValue,oldValue){
										    	//设置单价值
										    	$('#number',$('#proxyHeaderfm')).numberbox('setValue',newValue);										    
										   }" style="width:140px;" />
									</li>
									
							        <ul class="tl13">
							        	<li class="tr4">看&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;样：</li>
										<li style="width:8%;">
											&nbsp; <input type="checkbox" name="viewed" style="zoom:150%;" style="width:152px;" value="true"/>														                       
							            </li>
							            <li class="tr6">打&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;样：</li>
							            <li style="width:8%;">
							           		&nbsp; <input type="checkbox" name="looked" style="zoom:150%;" style="width:140px;" value="true" />															                      					            
							            </li>
							        </ul>
							        
							        <ul class="tl13">
							        	<li class="tr4">上&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;光：</li>
										<li style="width:8%;">
											&nbsp; <input type="checkbox" name="polished" style="zoom:150%;" style="width:152px;" value="true"/>														                       
							            </li>
							            <li class="tr6">覆&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;膜：</li>
							            <li style="width:8%;">
							           		&nbsp; <input type="checkbox" name="filmed" style="zoom:150%;" style="width:140px;" value="true" />															                      					            
							            </li>
							        </ul>		           
													            						            						            
						            <div class="clear"></div>
						            						          			            						
									</li>
									<li class="tr5">注意事项：</li>
									<li class="tl2">&nbsp; <textarea name="descr" ></textarea>
									</li>
								</ul>
						    </li>
						    <li class="tl9">
						    	<ul>						    	
						    		<li  class="tl8">						    			
							    		<div class="yulan1" style="position:relative;margin-top:-5px;height:215px;width:265px;">
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
					<div class="clear"></div>
					<div class="right" style="margin-top:-10px;width:96%;height:45%;margin-right:20px; border-width:1px 1px 1px 1px;border-style:solid;border-color:#ddd;">
						<%@include file="./proxy-print-detail.jsp" %>
					</div>
				</div>	
				<div class="clear"></div>					
			</div>
		</div>
	</div>	
		
	<%@include file="../../customer/operate/createProxyCustomer.jsp" %>
</body>
</html>