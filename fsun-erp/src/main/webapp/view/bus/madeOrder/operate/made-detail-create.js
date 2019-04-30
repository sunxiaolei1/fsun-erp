/*************************************************          产品下的后道工序的添加开始            ********************************************/

var processFlowData = new Array();


function processAdd(){
	$('#processFlow').datagrid('clearSelections');
	$('#processFlow').edatagrid('addRow');
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
