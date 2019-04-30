/**
 * 直接选择第N步
 */
function clickStepNum(num){
	if(!validData($('.step-by-step-num a.step-on').find('h2').html())){
		return false;
	}
	$('.step-by-step-num a').removeClass("step-on");
	$('.step-by-step-num').children().eq(num-1).attr('class','step-on');
	$('#step-contents .display').removeClass('display').addClass('hidden');
	var areaId = $('#step-contents').children().eq(num-1).removeClass('hidden').addClass('display').attr('id');
	if(areaId=='processFlowDiv'){
		try{
			$('#processFlow').edatagrid('getData');
		}catch(e){
			initProcessFlowGrid();
		}
	}else if(areaId=='orderDetailDiv'){	
		try{
			$('#orderDetail').edatagrid('getData');
		}catch(e){
			initOrderDetailGrid();
		}
    }
	
	var nextBtn = $('#nextBtn');
	if(num==maxStepNum){
		nextBtn.prev().attr('class','white-btn').show();
		nextBtn.hide();
		nextBtn.next().attr('class','blue-btn');
	}else {
		nextBtn.next().attr('class','white-btn');
		nextBtn.attr('class','blue-btn').show();
		if(num==minStepNum){
			nextBtn.prev().hide();	
		}else{
			nextBtn.prev().attr('class','white-btn').show();	
		}	
	}
	return true;
}

/**
 * “下一步”
 */
var minStepNum = 1;
var maxStepNum = 3;
function nextStep(thiz){
	var currentStepNum = parseInt($('.step-by-step-num a.step-on h2').html());
	if(currentStepNum <maxStepNum+1){
		if(!clickStepNum(currentStepNum+1)){
			return false;
		}
	}
}

/**
 * “上一步”
 */
function preStep(thiz){
	var currentStepNum = parseInt($('.step-by-step-num a.step-on h2').html());
	if(currentStepNum >minStepNum){	
		if(!clickStepNum(currentStepNum-1)){
			return false;
		}
	}
}

/**
 * “取消”
 */
function cancelFun(url){
	window.location.href = url;
}

/**
 * 各个步骤的类型(form|grid)、id、未通过验证时显示的文字
 */
function formOrGrid(){
	return [{type:'form',id:'baseInfo',warn:'验证未通过'},
	        {type:'grid',id:'processFlow',warn:'验证未通过'},
	        {type:'grid',id:'orderDetail',warn:'验证未通过'},
	        ];
}

function validFun(validObj){
	var result = true ;
	if(validObj['type']=='form'){
		result = $('#'+validObj['id']).form('validate');	
	}else{
		try{
			result = gridIsValidate(validObj['id']+'');
			///if($('#'+validObj['id']).edatagrid('options')['editing']){
			//	$('#'+validObj['id']).edatagrid('saveRow');
			//}
		}catch(e){
			console.log('这里报错了，是因为编辑表格没有渲染过！');
		}
	}
	if(!result){
		MessageBox.warn($('div.step-by-step-num a').eq(currentNum).find('span').html()+validObj['warn']);
	}
	return result;
}

var currentNum = null;

/**
 * 验证
 */
function validData(h2Num){
	currentNum = parseInt(h2Num)-1;
	//0是表单:baseInfo
	//1是datagrid:processFlow
	//3是datagrid:orderDetail
	//$('div.step-content').eq(currentNum)
	var result = true ;
	var a = formOrGrid()[currentNum];
	if(a instanceof Array){
		for(var i in a){
			result=validFun(a[i]);
			if(!result){
				break ;
			}
		}
	}else if(a instanceof Object){
		result=validFun(a);
	}
	return result ;
}


/*************************************************          产品下的后道工序的添加开始            ********************************************/

var processFlowData = [];
/**
 * 初始化工艺流程列表
 */
function initProcessFlowGrid(){
	
	$('#processFlow').edatagrid({
		loadMsg:'加载中，请稍等。。。',
		onSelect:function(index, row){
		
		}	
	}).datagrid("loadData",processFlowData);
}



function processAdd(){
	$('#processFlow').datagrid('clearSelections');
	$('#processFlow').edatagrid('addRow');
	var row = $('#processFlow').edatagrid('getSelected');
	if (row){
		var rowIndex = $('#processFlow').edatagrid('getRowIndex', row); 
		var edSet = $('#processFlow').edatagrid('getEditor', {  
            index : rowIndex,  
            field : 'isOutsourc' 
        });
        $(edSet.target).combobox('setValue',"是");	
    }
}

function cancelProcessRow(){
	 //获取可编辑行
	var editIndex = $('#processFlow').edatagrid('options').editIndex;
	//可编辑行存在
	if("undefined" != typeof editIndex){
		if(editIndex==(processFlowData.length-1)){
			$('#processFlow').datagrid('cancelEdit',editIndex);
    	}else{
    		$('#processFlow').datagrid("loadData",processFlowData);  
        }
    }
}

//单选模式
function delProcess(index){

	var row = $('#processFlow').datagrid('getSelected'); 
	if(row!='' && row!=null){
		var index  = $('#processFlow').datagrid('getRowIndex',row); 
    	
        //获取可编辑行
    	var editIndex = $('#processFlow').edatagrid('options').editIndex;
    	//可编辑行不存在
    	if(typeof(editIndex) == 'undefined' || editIndex==-1){
    		var list = [];
            for(var i=0;i<processFlowData.length;i++){
    			if(index!=i){
    				list.push(processFlowData[i]);
    			}
            }	
            processFlowData = list;
            $('#processFlow').datagrid("loadData",processFlowData);
    		      	
    	}else{
        	//可编辑行是删除行
        	if(index==editIndex){
        		$('#processFlow').datagrid('cancelEdit', editIndex);
        		$('#processFlow').datagrid('clearSelections'); 
        	}		     				
    	}
	}
		
}

/*************************************************          产品下的后道工序的添加结束            ********************************************/


/**********************************************        订单明细操作开始         ************************************************/

var orderDetailData = [];
/**
 * 初始化工艺流程列表
 */
function initOrderDetailGrid(){
	
	$('#orderDetail').edatagrid({
		loadMsg:'加载中，请稍等。。。',
		onSelect:function(index, row){
			$.focusblur(index,"orderDetail","number","onePrice","allPrice");
			$.focusblur(index,"orderDetail","onePrice","number","allPrice");
		}	
	}).datagrid("loadData",orderDetailData);
	
}


function productAdd(){
	$('#orderDetail').datagrid('clearSelections');
	$('#orderDetail').edatagrid('addRow');
	var row = $('#orderDetail').edatagrid('getSelected');
	if (row){
		var rowIndex = $('#orderDetail').edatagrid('getRowIndex', row); 
		var edSet = $('#orderDetail').edatagrid('getEditor', {  
	        index : rowIndex,  
	        field : 'unit'  
	    });
	    $(edSet.target).combobox('setValue',unitValue[0].id);	
	}

}

function cancelProductRow(){
	 //获取可编辑行
	var editIndex = $('#orderDetail').edatagrid('options').editIndex;
	//可编辑行存在
	if("undefined" != typeof editIndex){
		if(editIndex==(orderDetailData.length-1)){
			$('#orderDetail').datagrid('cancelEdit',editIndex);
		}else{
			$('#orderDetail').datagrid("loadData",orderDetailData);  
	    }
	}
}

//单选模式
function delProduct(index){
	//获取可编辑行
	var editIndex = $('#orderDetail').edatagrid('options').editIndex;
	//可编辑行不存在
	if("undefined" == typeof editIndex){
		//删除行是最后一行
		if(index==(orderDetailData.length-1)){
			$('#orderDetail').datagrid('beginEdit',index);
			$('#orderDetail').datagrid('cancelEdit',index);       		
	    }else{           	
	    	var list = [];
	        for(var i=0;i<orderDetailData.length;i++){
				if(index!=i){
					list.push(orderDetailData[i]);
				}
	        }	
	        orderDetailData = list;
	        $('#orderDetail').datagrid("loadData",orderDetailData);           	
	    }
	//存在可编辑行
	}else{
		//可编辑行是删除行
		if(index==editIndex){
			$('#orderDetail').datagrid('cancelEdit', editIndex);
			$('#orderDetail').datagrid('clearSelections'); 
	    }else{
	    	//可编辑行不是删除行
	    	$('#orderDetail').datagrid('endEdit', editIndex);
			var list = [];
	        for(var i=0;i<orderDetailData.length;i++){
				if(index!=i){
					list.push(orderDetailData[i]);
				}
	        }	
	        orderDetailData = list;
	        $('#orderDetail').datagrid("loadData",orderDetailData);   
	    }   		     				
	}
  	
	
}

/**********************************************        订单明细操作完成         ************************************************/