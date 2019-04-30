<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- 厂家编辑窗口 -->		
<div id="addFactory" class="easyui-window" title="新增厂家" closed="true" align="center" style="display:none;width:600px;top:120px;" modal="true">  
   	 <form id="factoryfm" method="post" name="factoryfm">  	
   	 <table border="0"  class="table-new"  cellpadding="5"   cellspacing="5"> 	
   	 	<tr>
   	 		<td class="textField">
   	 			<span style="color:red">*</span>厂商名称：
   	 		</td>
   	 		<td>
   	 		<input class="easyui-validatebox" type="text"  id="name"  name="name"  data-options="required:true,validType:'uniqueValue'" /> 
   	 		</td>
   	 		<td class="textField" >
   	 			<span style="color:red">*</span>厂商类型：
   	 		</td>
   	 		<td >
   	 			<input  class="easyui-combobox" type="text" id="type" name="type" editable="false"
   	 		      data-options="data:factoryType,valueField:'id',textField:'text',panelHeight:'auto'" />
   	 		</td>
   	 	</tr>
   	 	<tr>	
   	 		<td class="textField" >
    	 			工艺：
    	 		</td>
    	 		<td >
    	 			<input  class="easyui-combobox" type="text" id="technology" name="technology" editable="false" multiple="true" />
    	 		</td>
   	 		<td class="textField">
   	 			联系人：
   	 		</td>
   	 		<td>
   	 			<input class="easyui-validatebox" type="text"  id="legalPerson" name="legalPerson" /> 
   	 		</td>
   	 	</tr>
   	 	<tr>
   	 		<td class="textField">
   	 			电话号码：
   	 		</td>
   	 		<td>
   	 			<input class="easyui-validatebox" type="text"  id="telephone" name="telephone" data-options="validType:'phone'" />
   	 		</td>
   	 		<td class="textField">
   	 			手机号码：
   	 		</td>
   	 		<td>
   	 			<input class="easyui-validatebox" type="text"  id="mobileTelephone" name="mobileTelephone" data-options="validType:'mobile'" />
   	 		</td>
   	 	</tr>
   	 	<tr>
	   	 	<td class="textField">
   	 			地址：
   	 		</td>
   	 		<td>
   	 			<textarea name="address" id="address" rows="2" cols="15" ></textarea>
   	 		</td>
   	 		<td class="textField">
   	 			描述：
   	 		</td>
   	 		<td>
   	 			<textarea name="description" id="description" rows="2" cols="15"></textarea>
   	 		</td>
   	 	</tr>
   	 </table>
   	 </form>
   	 <div style="padding:20px;text-align:center;">  
               <a href="#" class="easyui-linkbutton" icon="icon-ok" onclick="saveFactory()">保存</a>  
               <a href="#" class="easyui-linkbutton" icon="icon-cancel" onclick="$('#addFactory').window('close')">取消</a>  
        </div>  
</div> 

<script>
	var factoryType = [
			{id:'加工类',text:'加工类'},
        	{id:'制造类',text:'制造类'}
        ];
	
	$.extend($.fn.validatebox.defaults.rules, { 
		uniqueValue : {
			validator : function(value) {				
			    var success = false;	
				$.ajax({
		            type: "post",
		            dataType: "json",
		            async:false,
		            url: '<c:url value="/bus/factoryInfo/uniqueName"/>',
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
		
		var $form = $("#factoryfm"); 
		  		
    	setTimeout(function () {
			$('#addFactory').window({
		    	onBeforeClose:function(){
		        	$('.validatebox-tip').remove();
		    	},onClose:function(){
		    		$form[0].reset();
		    	},onBeforeOpen:function(){
		    		//$(this).attr("height",auto);
		    	}
		    });
        }, 0);
    	
    	 
    	$('#technology', $form).combobox({
	        required: false,
		 	valueField: 'key',
		  	textField: 'value',
		  	url: '<c:url value="/sys/dictionary/getGroupList?key=PRODUCT_PROCESS"/>',
		  	width: '151px',
		    panelHeight: 'auto',
		    onLoadSuccess:function(data){  
		    	if(data!=null && data.length>0){
		    		technologyComboboxInitValue = data[0].key;
		    	}
		    }  
		});	
    	
    	$('#type', $form).combobox({
	        required: true,
		 	valueField: 'id',
		  	textField: 'text',
		  	data:factoryType,
		  	//width: '151px',
		    panelHeight: 'auto',
		    onSelect:function(record){
		    	if(record.id!="加工类"){
		    		$('#technology', $form).combobox("disable");
		    		$('#technology', $form).combobox("clear");
		    	}else{
		    		$('#technology', $form).combobox("enable");
		    		$('#technology', $form).combobox('setValue',technologyComboboxInitValue);
		    	}	
		    }   
		});
    	
    	$('#addFactory').show();
	});
		
	function addFactory(){
		
		var $form = $("#factoryfm"); 		
		$('#type', $form).combobox("select","加工类");
	  	$('#addFactory').window('open');
	}
	
	function saveFactory(){
		$.messager.progress({title: '请等待',msg: '保存中...',text: '',interval: 700}); 	
		$('#factoryfm').form('submit',{  
               url: '<c:url value="/bus/factoryInfo/save"/>',	         
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
                	var result = eval('(' + result + ')');  // change the JSON string to javascript object   
                	if(result.success){
                		$.messager.alert('提示','保存成功!','info');
                		$('#addFactory').window('close') 
	                }else{
	                	$.messager.alert('提示','保存失败!','info');	                	
		            }
                							
                }
            });
	    	
	    }
	
</script>