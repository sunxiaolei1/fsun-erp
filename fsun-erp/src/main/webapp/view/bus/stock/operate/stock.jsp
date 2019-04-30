<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String rootPath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort();
	String projectPath = request.getContextPath() + "/"; 
%>
<%@include file="stockDetail.jsp"%> 
<style type="text/css"> 

	/*编辑样式*/
body,div,ul,li{margin:0;padding:0;font-family:Arial, Helvetica, sans-serif,"宋体";}
ul li{list-style:none;font-size:12px;line-height:24px;}
.movie-edit{margin:15px 55px 15px 55px;width:780px;font-size:12px;}
.red-font{color:#FF0000;}
.input-border{border:1px #d3d3d3 solid;height:19px;line-height:19px;padding:0 5px;margin:2px 0 2px 0;font-family: Arial, Helvetica, sans-serif,"宋体";}
.input-border-red{border:1px #ff3333 solid;background:#ffe5e5;height:19px;line-height:19px;padding:0 5px;margin:2px 0 1px 0;font-family: Arial, Helvetica, sans-serif,"宋体";}
ul.movie-edit-ul1 li,ul.movie-edit-ul2 li{float:left;}
.movie-edit-li1{ text-align:right;padding-right:5px;width:175px;}
.movie-edit-li3{ text-align:right;padding-right:5px;width:75px;}
.movie-edit-li2,.movie-edit-li4{width:180px;line-height:24px;}
.yulan{margin:0 0 3px 0 ;margin-left:5px; border:1px #ccc solid;background:#f7f7f7; text-align:center;padding:5px 0;width:243px;}
.yulan img{width:230px;height:200px;}	

.border
{
   box-shadow: 2px 2px 3px  rgba(34,25,25,0.4) ;
    -moz-box-shadow: 2px 2px 3px  rgba(34,25,25,0.4) ;
    -webkit-box-shadow: 2px 2px 3px rgba(34,25,25,0.4) ;
  cursor:pointer;      
}
	
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
<div id="addStock" class="easyui-window" title="新增货物" closed="true" align="center" minimizable=false maximizable=false
   style="display:none;width:660px;height:520px;top:10px;" buttons="#dlg-buttons" modal="true">  
   	 <form id="stockfm" method="post" name="stockfm" enctype="multipart/form-data">  
   	 <input name="id" type="text" style="display:none"></input>
   	 <input name="image" type="text" style="display:none" /> 
   	 <input name="stockDetails" type="text" style="display:none" /> 
   	 <input name="imageChanged" type="text" style="display:none" />
   	 <div class="movie-edit">
            <ul class="movie-edit-ul1"> 
           	             
              <li class="movie-edit-li3">
                                                  图&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;片:<br />      
              	   <span class="red-font">*</span>货&nbsp;&nbsp;物&nbsp;&nbsp;名&nbsp;&nbsp;称:<br />	               	                                                                                                                                             
              	         货&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号:<br />    
              	   <span class="red-font">*</span>机&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;架&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号:<br />      		               	   				      			        
                                                    所&nbsp;&nbsp;属&nbsp;&nbsp;仓&nbsp;&nbsp;库:<br />                                                                                                                                                                   	                                                                                                                                                                        
                                                    所&nbsp;&nbsp;属&nbsp;&nbsp;客&nbsp;&nbsp;户:<br />                                                 
                                                    备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注:<br />                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
              </li>
              <li class="movie-edit-li4">
                  <a href="javascript:;" class="a-upload">
                  	  <input type="file" onchange='previewImage(this,"pre")'  accept=".jpeg,.bmp,.png,.jpg,.gif"  id="ficon" name="ficon"  />点击这里上传图片 
                  </a>	 
                  <input class="input-border" type="text" id="name" name="name" size="18" data-options="required:true" />
                  <br />	                                 
                  <input class="input-border"  type="text" id="artNum" name="artNum" size="18" />
                  <br />	                                   		              	
                  <input type="text" class="input-border" editable="false" id="rackNum" name="rackNum" size="18" />
                  <br />
                  <input type="text" class="input-border" editable="false" name="storeId" id="storeId" size="18" />
                  <br />
                  <input type="text"  class="input-border" id="customerCode" name="customerCode" size="18" />
              	  <br />                                 	             	                       	                
                  <textarea name="description" id="description"  rows="2" style="width: 151px;"></textarea>	                                          	                                           
              </li> 
              <li class="movie-edit-li1">          	   	        	   	                 	   		                                  						                           	
           		  <div class="yulan" style="position:relative;">
           		     <input type="button" class="del" value="删除" onclick="closeImage()" style="display:none; position:absolute; right:5px; top:5px;  border:0;background:#333;color:#fff;width:50px; cursor:pointer;"/>
           		     <div id="pre" >
           		    	<img src='' />
           		     </div>	   			 
           		  </div>	                   			                                                                                                                 
              </li>
                         
          </ul>   	 
  	 </div>
   	 </form>
   	 <div id="stockDetailPanel" class="easyui-panel"  style="width:580px;height:200px;" > 	   	 	    
			 <table id="stockDetail-table"  toolbar="#stockDetailToolbar" fit="true" rownumbers="true"
				fitColumns="true" singleSelect="true" nowrap="false" >
				<thead>
					<tr>	
						<th field="style" width="70" editor="{type:'validatebox',options:{validType:'maxLength[20]'}}">款号</th>										
						<th field="num" width="45" editor="{type:'numberbox',options:{required:true,min:'0',precision:'0'}}">数量</th>
						<th field="unit" width="40" editor="{type:'combobox',options:{required:true,data:unitValue,valueField:'id',textField:'text',panelHeight:'auto'}}">单位</th>
						<th field="description" width="100" editor="{type:'validatebox',options:{validType:'maxLength[36]'}}">备注</th>					
					</tr>
				</thead>	
			 </table>			
		 </div> 	
   	 <div style="padding:5px;text-align:center;">  
               <a href="#" class="easyui-linkbutton" icon="icon-ok" onclick="saveStock()">保存</a>  
               <a href="#" class="easyui-linkbutton" icon="icon-cancel" onclick="closeWin('addStock')">取消</a>  
     </div>  
</div> 

<div id="stockDetailToolbar" style="display:none">
	<a href="javascript:void(0)" class="easyui-linkbutton"	iconCls="icon-add" plain="true"	onclick="detailAdd()">添加</a> 
	<a href="javascript:void(0)" class="easyui-linkbutton"	iconCls="icon-add" plain="true"	onclick="delDetail()">删除</a>	
	<a	href="javascript:void(0)" class="easyui-linkbutton"	iconCls="icon-undo" plain="true"  onclick="cancelDetailRow()">取消</a>	
</div>
	
<script type="text/javascript">

var isAdd = true;

$(function(){
	
	 $('#addStock').window({
		 onBeforeClose:function(){ 
			$('.validatebox-tip').remove();	
			$('#stockDetail-table').datagrid("rejectChanges");	
			stockDetailList = []; 
			var form = document.stockfm;
			var $form = $(form);   	
			$('input[name=id]', $form).val(''); 
			$('input[name=stockDetails]', $form).val(''); 
			closeImage();	
     	 }
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

	var form = document.stockfm;
	var $form = $(form);   

	$('input[name=name]', $form).validatebox();	
		
	jQuery.getJSON('<c:url value="/bus/customer/getEnableList"/>', null, function(result) {
		//result.unshift({code:'',name:'--空--'});
		$('#customerCode', $form).combobox({
			method:'get',
            required: false,
    	 	valueField: 'code',
    	  	textField: 'name',
    	  	data: result,
    	    panelHeight: 'auto'																																																								
    	});
    	
    });


	jQuery.getJSON('<c:url value="/bus/store/listEnabled"/>', null, function(result) {
		//result.unshift({id:'',name:'--选择仓库--'});
		$('#storeId', $form).combobox({
			method:'get',
            required: false,
    	 	valueField: 'id',
    	  	textField: 'name',
    	  	data: result,
    	    panelHeight: 'auto'   	 																																																											
    	});
		
    });

	jQuery.getJSON('<c:url value="/sys/dictionary/getGroupList?key=STOCK_RACK_NUM"/>', null, function(result) {
		$('#rackNum', $form).combobox({
			required: true,
		 	valueField: 'key',
		  	textField: 'value',
		  	data: result,
		  	width: '151px',
		    panelHeight: 'auto'
		});

		$('#s_rackNum').combobox({
			required: false,
		 	valueField: 'key',
		  	textField: 'value',
		  	data: result,
		  	width: 'auto',
		    panelHeight: 'auto'   	 																																																											
    	});
	});

	$("#addStock").show(); 
})


function closeImage(){
     var path = "<c:url value='/images/no_icon.png'/>";
     document.getElementById("pre").innerHTML = "<img src='"+path+"'/>";
     var form = document.stockfm;
 	 var $form = $(form); 
     var file = $('input[name=ficon]',$form);
     file.after(file.clone().val(''));
     file.remove();
 }


/***************************************************库存增删改查开始*******************************************/

function addStock(){

	$('#list-table').datagrid('clearSelections');
	$('#addStock').window({title:'新增货物'});
	$('#stockfm')[0].reset();
	closeImage();
	isAdd = true;	

	var form = document.stockfm;
	var $form = $(form);   
    var storeIds = $('#storeId', $form).combobox("getData");
    if(storeIds.length>0){
    	$('#storeId', $form).combobox("select",storeIds[0].id);
    }
    var rackNums = $('#rackNum', $form).combobox("getData");
    if(rackNums.length>0){
    	$('#rackNum', $form).combobox("select",rackNums[0].key);
    }
    
	stockDetailList = [];
	$('#stockDetail-table').edatagrid({
		loadMsg:'加载中，请稍等。。。',
		onSelect:function(index, row){
			//row.orderId = selectedOrderId;
		}
		
	}).datagrid("loadData",stockDetailList);
	
	$('#addStock').window('open');   	    	 	
}
	 
function editStock(id){

	$('#list-table').datagrid('unselectAll');  	
	setTimeout(function () {
		 $('#list-table').datagrid('selectRecord',id);
    }, 1); 
	
	$('#addStock').window({title:'编辑货物'});  		
	$('#stockfm')[0].reset(); 
	isAdd = false;		    			
	$.ajax({
       	url:'<c:url value="/bus/stock/load"/>',
       	dataType: "json",
       	data:{id:id},
       	success:function(rowData){  
           	
       		      		
       		//$('#list-table').datagrid('selectRecord',id);
       				
           	var stockDto = rowData.rows;
           	var stockBase = stockDto.stockBaseDto;
       		$('#stockfm').form('load',stockBase);	        
	     	if(stockBase.image!=null && stockBase.image!=""){
       			var imagepath = '<c:url value="/uploads/product/' + stockBase.image + '"/>';
       			document.getElementById("pre").innerHTML = "<img src='"+imagepath+"'/>";
   	        }else{
   	        	var path = "<c:url value='/images/no_icon.png'/>";
   	        	document.getElementById("pre").innerHTML = "<img src='"+path+"'/>";
       	    }  

	     	stockDetailList = stockDto.stockDetails;
	     	$('#stockDetail-table').edatagrid({
	    		loadMsg:'加载中，请稍等。。。',
	    		onSelect:function(index, row){
	    			//row.orderId = selectedOrderId;
	    		}
	    		
	    	}).datagrid("loadData",stockDetailList);
	    	   	 
       		$('#addStock').window('open');   		        		
       	}
    });  			   	        	
}
 
function saveStock(){ 

	if(!gridIsValidate("stockDetail-table")){
		return;
    }

	var form = document.stockfm;
 	var $form = $(form);   	
 	$('input[name=stockDetails]', $form).val(JSON.stringify(stockDetailList)); 	

 	var url = '<c:url value="/bus/stock/save"/>';
	if(!isAdd){
		url = '<c:url value="/bus/stock/update"/>';
		var oldPath = '<%=rootPath%><c:url value="/uploads/product/' + $('input[name=image]', $form).val() + '"/>';	
		var newPath = $('#pre').find("img")[0].src; 
		if(oldPath!=newPath){
			$('input[name=imageChanged]',$form).val(true);
		}else{
			$('input[name=imageChanged]',$form).val(false);
		}
	}
	$.messager.progress({title: '请等待',msg: '保存中...',text: '',interval: 700});	
	$('#stockfm').form('submit',{  
           url: url,	         
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
				closeWin("addStock");   
            	var result = eval('(' + result + ')');  // change the JSON string to javascript object   
            	if(result.success){
            		$.messager.show({ title: '提示信息', msg : '保存成功!' }); 
            		$('#list-table').datagrid('reload');		                	
                }else{
                	$.messager.show({ title: '提示信息', msg : '保存失败!' });
	            }
            							
            }
        });
    	
    }
 
//Del

function delOneStock(id,artNum) {
	$('#list-table').datagrid('unselectAll');  	
	 setTimeout(function () {
		 $('#list-table').datagrid('selectRecord',id);
     }, 1); 
	
	delStock(id,artNum);
}

function delStock(ids,artNums) {
	$.messager.confirm('Confirm','确定要删除选择的数据吗?', function(r) {
		if (r) {
			$.ajax({
                type: "post",
                dataType: "json",
                url: '<c:url value="/bus/stock/delete"/>',
                data: {"ids":ids,"artNums":artNums},
                success: function(returnData) {
                	if(returnData.success){
	                	$.messager.show({ title: '提示信息', msg : "删除成功!" }); 
	                	$('#list-table').datagrid('reload');								
                	}else{
	                	$.messager.show({ title: '提示信息', msg : '删除失败!' });
		            }		                	
                }
            });
		}
	});
}

function delStocks() {

	var rows = $('#list-table').datagrid('getSelections');
	if (rows.length > 0) {
	    var ids = '';
	    var artNums = '';
		for ( var i = 0; i < rows.length; i++) {
			ids += rows[i].id + ',';
			artNums += rows[i].artNum + ',';
		}
		ids = ids.substring(0, ids.length - 1);
		artNums = artNums.substring(0, artNums.length - 1);
		delStock(ids,artNums);
	} else {
		$.messager.alert('消息', '请选择要删除的数据!','info');
	}
}

/***************************************************库存增删改查结束*******************************************/

function closeWin(obj){
	$('#'+obj).window('close');
}

</script>