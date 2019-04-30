<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script type="text/javascript">


$.extend($.fn.validatebox.defaults.rules, { 
	uniqueValue : {
		validator : function(value) {				
		    var success = false;	
			$.ajax({
	            type: "post",
	            dataType: "json",
	            async:false,
	            url: '<c:url value="/bus/customer/uniqueName"/>',
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


$(function(){	
	$('#addCustomer').show();	
});

function addCustomer(){	
	$('#customerfm')[0].reset(); 
   	$('#addCustomer').window('open');   	    	 	
}

function saveCustomer(){
	$.messager.progress({title: '请等待',msg: '保存中...',text: '',interval: 700});
	var form = document.customerfm;
	var $form = $(form);   	
	$form.form('submit',{  
        url: '<c:url value="/bus/customer/save"/>',	         
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
         		closeCustomerWin();
         		var customer = result.rows;
         		initCustomerCombo(customer.code);																																																								         		
             }else{           	
             	$.messager.show({ title: '提示信息', msg : '保存失败!' });
          	}        							
         }
     });
}

function closeCustomerWin(){
	$('.validatebox-tip').remove();
	$('#addCustomer').window('close');
}

</script>

<div id="addCustomer" class="easyui-window" title="新增客户" closed="true" align="center" style="display:none;width:600px;height:auto;top:100" buttons="#dlg-buttons" modal="true">  
   	 <form id="customerfm" method="post" name="customerfm">
   	 	 <input name="type" value="1" hidden=true />  
	   	 <table border="0"  class="table-new"  cellpadding="5"   cellspacing="5"> 	
	   	 	<tr>
	   	 		<td class="textField"><span style="color:red">*</span>客户名称：</td>
	   	 		<td>
	   	 		<input class="easyui-validatebox" type="text"  id="name"  name="name"  
	   	 			data-options="required:true,validType:'uniqueValue'" /> 
	   	 		</td>
	   	 		<td class="textField">联&nbsp;&nbsp;系&nbsp;&nbsp;人：</td>
	   	 		<td><input class="easyui-validatebox" type="text"  id="contacts" name="contacts" /> </td>  	 		
	   	 	</tr>
	   	 	<tr>
	   	 		<td class="textField">电&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;话：</td>
	   	 		<td><input class="easyui-validatebox" type="text"  id="tel" name="tel" /></td>
	   	 		<td class="textField">传&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;真：</td>
	   	 		<td><input class="easyui-validatebox" type="text"  id="fax" name="fax" data-options="validType:'phone'" /></td>
	   	 	</tr>
	   	 	<tr> 
	   	 		<td class="textField">地&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;址：</td>
	   	 		<td><textarea name="address" rows="2"></textarea></td>  	 		
	   	 		<td class="textField">描&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;述：</td>
	   	 		<td><textarea name="description" rows="2"></textarea></td>
	   	 	</tr>
	   	 </table>
   	 </form>
   	 <div style="padding:20px;text-align:center;">  
            <a href="#" class="easyui-linkbutton" icon="icon-ok" onclick="saveCustomer()">保存</a>  
            <a href="#" class="easyui-linkbutton" icon="icon-cancel" onclick="closeCustomerWin()">取消</a>  
     </div>  
</div>