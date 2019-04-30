<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>

<script type="text/javascript" src="<c:url value='/js/jquery-easyui/jquery.edatagrid.js'/>"></script>
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

var attManage = function(value,row,index){
	return '<sec:authorize  ifAllGranted="ORDER_PRODUCT_DELETE"><button type="button" onclick="delProduct(\''+index+'\');">删除</button></sec:authorize>';				
}

/**********************************************        订单明细操作开始         ************************************************/

var orderDetailData = [];
/**
 * 初始化工艺流程列表
 */
function initOrderDetailGrid(){
	
	currDetailGrid.edatagrid({
		loadMsg:'加载中，请稍等。。。',	
	}).datagrid("loadData",orderDetailData);
	
}


function productAdd(){
	currDetailGrid.datagrid('clearSelections');
	currDetailGrid.edatagrid('addRow');
	var row = currDetailGrid.edatagrid('getSelected');
	if (row){
		var rowIndex = currDetailGrid.edatagrid('getRowIndex', row); 
		var edSet = currDetailGrid.edatagrid('getEditor', {  
	        index : rowIndex,  
	        field : 'unit'  
	    });
	    $(edSet.target).combobox('setValue',unitValue[0].id);	
	}

}

function cancelProductRow(){
	 //获取可编辑行
	var editIndex = currDetailGrid.edatagrid('options').editIndex;
	//可编辑行存在
	if("undefined" != typeof editIndex){
		if(editIndex==(orderDetailData.length-1)){
			currDetailGrid.datagrid('cancelEdit',editIndex);
		}else{
			currDetailGrid.datagrid("loadData",orderDetailData);  
	    }
	}
}

//单选模式
function delProduct(index){
	//获取可编辑行
	var editIndex = currDetailGrid.edatagrid('options').editIndex;
	//可编辑行不存在
	if("undefined" == typeof editIndex){
		//删除行是最后一行
		if(index==(orderDetailData.length-1)){
			currDetailGrid.datagrid('beginEdit',index);
			currDetailGrid.datagrid('cancelEdit',index);       		
	    }else{           	
	    	var list = [];
	        for(var i=0;i<orderDetailData.length;i++){
				if(index!=i){
					list.push(orderDetailData[i]);
				}
	        }	
	        orderDetailData = list;
	        currDetailGrid.datagrid("loadData",orderDetailData);           	
	    }
	//存在可编辑行
	}else{
		//可编辑行是删除行
		if(index==editIndex){
			currDetailGrid.datagrid('cancelEdit', editIndex);
			currDetailGrid.datagrid('clearSelections'); 
	    }else{
	    	//可编辑行不是删除行
	    	currDetailGrid.datagrid('endEdit', editIndex);
			var list = [];
	        for(var i=0;i<orderDetailData.length;i++){
				if(index!=i){
					list.push(orderDetailData[i]);
				}
	        }	
	        orderDetailData = list;
	        currDetailGrid.datagrid("loadData",orderDetailData);   
	    }   		     				
	}
  	
	
}

/**********************************************        订单明细操作完成         ************************************************/

var $baseForm = null;

var currDetailGrid = null;

/**
 * 创建产品信息
 */
function ajaxCreateProduct(productDetailDto, orderDetailData){
	$.ajax({
        type: "post",
        dataType: "json",
        contentType:"application/json;charset=utf-8",
        async:false,
        url: '<c:url value="/bus/product/create"/>',
        data: JSON.stringify(productDetailDto),
        success: function(result) {
        	MessageBox.closeLoading();     
        	if(result.success){
        		var productCode = result.rows.code;
        		var productName = result.rows.name;
        		if(orderDetailData.length>0){
        			$.each(orderDetailData,function(){
            			this.productCode = productCode;
            			this.productName = productName;
            		});
        		}else{     			
        			var obj = {
        				"productCode":productCode,
        				"productName":productName,
        				"style":'',
        				"number":0,
        				"unit":'只',
        				"onePrice":0.0      				
        			};
        			orderDetailData.push(obj);
        		}
        		addPackagDetail(orderDetailData);
        		closeProductAddDialog();
        	}else{
        		MessageBox.error("保存失败!");                  	
        	}    			                				                															                	
        }
    });   
}

$(function(){
	
	$baseForm = $('#baseInfo');
	currDetailGrid = $('#orderDetail');
		
	//productSpec.unshift({id:'',text:'--选择规格--'});
  	$('#spec', $baseForm).combobox({
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
				$('#specSize', $baseForm).removeAttr("readonly"); 
				$('#specSize', $baseForm).css('background-color','#FFFFFF');
			}else{
				$('#specSize', $baseForm).val('');
				$('#specSize', $baseForm).attr({ readonly: 'true' });
				$('#specSize', $baseForm).css('background-color','#DDDDDD');
			}
		}
	});

   	$.getJSON('<c:url value="/sys/dictionary/getGroupList?key=PRODUCT_MODEL"/>', function(json){
	  	json.unshift({key:'',value:'--选择生产机型--'});
	  	$('#model', $baseForm).combobox({
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
	  	$('#layout', $baseForm).combobox({
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
	
	$.getJSON('<c:url value="/sys/dictionary/getGroupList?key=PRODUCT_PRINT_PROCESS"/>', function(json){	
	  	$('#process', $baseForm).combobox({
	   		required: false,
	   		editable:true,	   	    
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
	
	$.getJSON('<c:url value="/sys/dictionary/getGroupList?key=PRODUCT_PROCESS"/>', function(json){
	  //	json.unshift({key:'',value:'--选择后道工序--'});
	  	$('#afterProcess', $baseForm).combobox({
	   		required: false,
	   		editable:false,
	   	    multiple:true,
		 	valueField: 'key',
		  	textField: 'value',
		  	data:json,
		  	width: '151px',
		    panelHeight: 'auto',
		    onLoadSuccess:function(rows){
				if(rows&&rows.length>0){
					//$(this).combobox('select',rows[0].key);
				}
			}
		});
		
	});
	
	$('#finishBtn1').on('click',function(){
		
		if (!$baseForm.form('validate') || !gridIsValidate("orderDetail")){			
			return ;
		}	 
		
		MessageBox.loading();
		var productInfo = serializeObject($baseForm);
		var specSize = $('#specSize', $baseForm).val();
		if(specSize!=null && specSize!=''){
			productInfo.spec += ("-"+specSize); 
		}
		
		var style = new Array();
		currDetailGrid.edatagrid("acceptChanges");
		$.each(orderDetailData,function(){
			if(!style.contains(this.name)){
				style.push(this.name);
			}
		});
		if(style.length>0){
			productInfo.style = style.join(",");
		}
		var afterProcessArr = $("#afterProcess",$baseForm).combobox("getValues");
		var productDetailDto = {
       	   	"productInfo": productInfo,
       	    "afterProcess": afterProcessArr.join(",")
       	};
		
        var oFile = document.getElementById('ficon');
        if(oFile.value == ""){         	
        	ajaxCreateProduct(productDetailDto, orderDetailData);
        }else{
        	 $baseForm.form('submit',{  
                url: '<c:url value="/bus/product/addFicon"/>',  
                dataType: "json",
                async:false,
                success: function(result){    
                	var result = eval('(' + result + ')'); 
                	if(result.success){
                		productDetailDto.productInfo.icon = result.rows;               		              		
                		ajaxCreateProduct(productDetailDto, orderDetailData);          	
                	}else{
                		MessageBox.closeLoading(); 
                		MessageBox.error("保存失败!");                 	
                	}        							
                }
            });
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
 		 closeImage("<c:url value='/images/no_icon.png'/>","baseInfo");
 	 });
	
     $("#toolbar").show();
     
     initOrderDetailGrid();
});

</script>

<div class="content" style='font-family:"微软雅黑";'>
	<div class="step-wrap" style="width:100%;">
		<div class="step-content display" style="width:99%;height:92%;border:0px #ccc solid;"> 
		    <div class="left" style="margin-top:-10px;width:54%;border-width:1px 1px 1px 0;">                                                           
				<form id="baseInfo" name="baseInfo" method="post" enctype="multipart/form-data">					
					<input name="film" value="false"  style="display:none" />
					<input name="scotch" value="false"  style="display:none" />
					<input name="outsourc" value="false"  style="display:none" />
					<ul>
					    <li class="tl13" >
							<ul>
								<li class="tr13"><span class="red-font">*</span> 产品名称：</li>
								<li class="tl6">&nbsp; <input name="name" type="text"  class="easyui-validatebox" data-options="required:true,missingMessage:'必填项'"/></li>										                								
					            <li class="tr1">生产机型：</li>
								<li class="tl6">&nbsp;  <input type="text" class="easyui-combobox" name="model" id="model" /></li>
					            <li class="tr1">工&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;序：</li>
								<li class="tl6">&nbsp; <input name="process" id="process" type="text" /></li>						            
								<li class="tr1">材质名称：</li>
								<li class="tl6">&nbsp; <input type="text"  id="material" name="material" /></li>																												
								<li class="tr1">规&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;格：</li>
								<li class="tl6">&nbsp; 
									<input type="text"  class="easyui-combobox" id="spec" name="spec" style="width:90px;"  />
									<input type="text" id="specSize" style="width:80px;" />
					            </li>
					            <li class="tr1">拼&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;数：</li>
								<li class="tl6">&nbsp; <input type="text" id="impos" name="impos" /></li>
					         
								
								<li class="tr1">开&nbsp;数(开)：</li>
								<li class="tl6">&nbsp; <input type="text" name="openNum" id="openNum" /></li>						   
								<li class="tr1">印刷方式：</li>
								<li class="tl6">&nbsp; <input type="text" class="easyui-combobox" name="layout" id="layout" /></li>
															
								<li class="tr1">开料尺寸：</li>
								<li class="tl6">&nbsp; <input type="text" id="openSize" name="openSize" /></li>
								<li class="tr1">色&nbsp;数(色)：</li>
								<li class="tl6">&nbsp; <input type="text" id="colors" name="colors" /></li>								
							</ul>
					    </li>
					    <li class="tl13">
					    	<ul>				    		
					    		<li  class="tl8">
					    		    &nbsp;<a href="javascript:void(0);" class="a-upload">
		                           		<input type="file" onchange='previewImage(this,"pre")' accept=".jpeg,.bmp,.png,.jpg,.gif"  id="ficon" name="ficon"  />点击这里上传图片 
		                           	</a>
		                           	<div class="clear"></div>
						    		<div class="yulan1" style="position:relative;height:255px;">
					           		     <input type="button" class="del" value="删除" style="display:none;"/>
					           		     <div id="pre" >
					           		    	<img src="<c:url value='/images/no_icon.png'/>" />
					           		     </div>	   			 
					           		  </div>
					    		</li>			    	   		 
					    	</ul>					   	   		                                  						                           	         			
					    </li>
					    <li class="tl8">
					    	<ul>
					    	    <li class="tr4">注意事项：</li>
								<li class="tl10">
									&nbsp;&nbsp; <input type="text"  name="description" id="description" style='width:460;'></input>
								</li>
								
							    <li class="tr4">工艺流程：</li>
								<li class="tl10"> &nbsp; &nbsp;<input type="text" class="easyui-combobox"  id="afterProcess" style='width:460;' /></li>					    	   
 
							</ul>					   	   		                                  						                           	         			
					    </li> 						
					</ul>
					<div class="clear"></div>
				</form>	
			</div>				
			<div class="right" style="margin-top:-10px;width:45%;height:90%;border-width:1px 0px 1px 1px;">
				<table id="orderDetail"  toolbar="#toolbar" nowrap="false" pagination="false" idField="id" fit="true" rownumbers="true" fitColumns="true" singleSelect="true" >
					<thead>
						<tr>
							<th field="id" hidden="true" chechbox="true"></th>								
							<th field="style" width="90"  editor="{type:'validatebox',options:{validType:'style[20]'}}">款号</th>
							<th field="number" width="65" editor="{type:'numberbox',options:{required:true}}">数量</th>
							<th field="unit" width="40" editor="{type:'combobox',options:{editable:false,required:true,data:unitValue,valueField:'id',textField:'text',panelHeight:'auto'}}">单位</th>
							<th field="onePrice" width="45" editor="{type:'numberbox', options:{required:false,min:'0',max:5000,precision:'2'}}">单价(元)</th>							
							<th field="name" width="40" formatter="attManage" type='linkbutton'>操作</th>							
						</tr>
					</thead>	
				</table>
			</div>
			<div class="clear"></div>
			<div class="tc">
				<input type="button" class="blue-btn" id="finishBtn1" value="完成" />
				<input type="button" value="取消" class="corres-gray-btn" onclick="closeProductAddDialog()"/>
			</div>
		</div>	
	</div>
</div>

<div id="toolbar" style="display:none">
	<sec:authorize  ifAllGranted="ORDER_PRODUCT_ADD">
			 <a href="javascript:void(0)" class="easyui-linkbutton"	iconCls="icon-add" plain="true"	onclick="productAdd()">添加</a> 
	</sec:authorize>
	<sec:authorize  ifAllGranted="ORDER_PRODUCT_CANCEL">
			 <a	href="javascript:void(0)" class="easyui-linkbutton"	iconCls="icon-undo" plain="true"  onclick="cancelProductRow()">取消</a>
	</sec:authorize>
</div>