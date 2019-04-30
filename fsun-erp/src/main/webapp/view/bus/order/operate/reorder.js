
var reorderDetailDtos = []; 
var currProductName = '';

function reorderProductAdd(){
	var grid = $('#reorderTable');
	grid.datagrid('clearSelections');
	grid.edatagrid('addRow');
	 
	//获取可编辑行
	var editIndex = grid.edatagrid('options').editIndex;	
	$(getEditCell(grid,editIndex,'unit').target).combobox('setValue', unitValue[0].id);
	grid.datagrid('getSelected').orderId = '${orderId}';
	setEditing(grid,editIndex,"onePrice","number","allPrice");
}

//单选模式
function delReorderProduct(){
    
	var row = $('#reorderTable').datagrid('getSelected'); 
	if(row!='' && row!=null){
		var index  = $('#reorderTable').datagrid('getRowIndex',row); 
    	
        //获取可编辑行
    	var editIndex = $('#reorderTable').edatagrid('options').editIndex;
    	//可编辑行不存在
    	if(typeof(editIndex) == 'undefined' || editIndex==-1){
    		var list = [];
            for(var i=0;i<reorderDetailDtos.length;i++){
    			if(index!=i){
    				list.push(reorderDetailDtos[i]);
    			}
            }	
            reorderDetailDtos = list;
        	$('#reorderTable').datagrid("loadData",reorderDetailDtos);
    		      	
    	}else{
        	//可编辑行是删除行
        	if(index==editIndex){
        		$('#reorderTable').datagrid('cancelEdit', editIndex);
        		$('#reorderTable').datagrid('clearSelections'); 
        	}		     				
    	}
	}
	
     		
}

function cancelReorderProductRow(){
   	//获取可编辑行
   	var editIndex = $('#reorderTable').edatagrid('options').editIndex;
   	//可编辑行存在
   	if("undefined" != typeof editIndex){
   		if(editIndex==(reorderDetailDtos.length-1)){
   			$('#reorderTable').datagrid('cancelEdit',editIndex);
       	}else{
       		$('#reorderTable').datagrid("loadData",reorderDetailDtos);  
           }
    }
}
