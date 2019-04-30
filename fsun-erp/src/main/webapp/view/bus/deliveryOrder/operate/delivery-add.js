
var deliveryDetailDtos = [];


/**
 * 添加订单号
 * @param orderCodes
 * @param code
 */
function addOrderCodes(orderCodes,code){
	if(code!=null){
		var exist = false;
		for(var i=0; i<orderCodes.length; i++){
			if(orderCodes[i]==code){					
				exist = true;
				break;
			}
		}
		if(!exist){
			orderCodes.push(code);
		}
	}		
}

//添加numberbox的级联计算
function setEditing(detailGird,rowIndex,fromText1,fromText2,toText){       
    var priceEditor = $(getEditCell(detailGird,rowIndex,fromText1).target);   
    var amountEditor = $(getEditCell(detailGird,rowIndex,fromText2).target); 
    var costEditor = $(getEditCell(detailGird,rowIndex,toText).target);
    
    priceEditor.numberbox({  
	     onChange : function(n,o){
   	    calculate();
	     }
	 });	    
    amountEditor.numberbox({  
	     onChange : function(n,o){
   	    calculate();
	     }
	 });   
    function calculate(){   
        var cost = priceEditor.numberbox("getValue") * amountEditor.numberbox("getValue");   
        costEditor.numberbox('setValue',cost);   
    } 
}  



function saveEdits(grid){
	
   	//获取可编辑行
   	var editIndex = grid.edatagrid('options').editIndex;
   	//可编辑行存在
   	if("undefined" != typeof editIndex){
   		if(editIndex==(deliveryDetailDtos.length-1)){
   			grid.datagrid('endEdit',editIndex);
   			grid.datagrid('unselectAll');
       	}else{
       		grid.datagrid("acceptChanges");
        }
    }
}

function cancelEdits(grid){
	
   	//获取可编辑行
   	var editIndex = grid.edatagrid('options').editIndex;
   	//可编辑行存在
   	if("undefined" != typeof editIndex){
   		if(editIndex==(deliveryDetailDtos.length-1)){
   			grid.datagrid('cancelEdit',editIndex);
       	}else{
       		grid.datagrid("loadData",deliveryDetailDtos);
        }
    }else{
    	grid.datagrid("rejectChanges");
    }
}


function delEdits(grid, $form){
	var rows = grid.datagrid('getSelections');
	if(rows.length==0){
		return;
	}
	var productCodes = new Array();
	var productAllNames = new Array();
	$.each(rows,function(){
		productCodes.push(this.productCode);
		var allName = this.productName;
		if(this.style!=null && this.style!=''){
			allName += ("-" + this.style);
		}
		productAllNames.push(allName);
	});
	
	var orderCodes = delDeliveryDetailDtos(productCodes,productAllNames);
	$('input[name=orderCode]', $form).val(orderCodes);
	
	grid.datagrid("clearSelections");
	grid.datagrid("loadData",deliveryDetailDtos);	
	
}


/**
 * 添加明细
 */
function addDeliveryDetailDtos(rows){	
	
	var $form = $("#orderfm"); 
	var oldOrderCodes = $('input[name=orderCode]', $form).val();
	$.each(rows,function(){
		//添加明细
		addDetail(this);
		if(oldOrderCodes!=null && oldOrderCodes!=''){
			if(oldOrderCodes.indexOf(this.orderCode)<0){
				oldOrderCodes += (","+ this.orderCode);
	   		}
		}else{
			oldOrderCodes = this.orderCode;
		}	
	});
	$('input[name=orderCode]', $form).val(oldOrderCodes);
	$("#detailTable").datagrid("loadData",deliveryDetailDtos);		
}



/**
 * 添加单个明细
 * @param row
 * @returns {Boolean} 产品是否重复，重复就更新数量否则添加产品到明细中
 */
function addDetail(row){
	
	var orderCode = row.orderCode;	
	var productCode = row.productCode;
	var style = row.style;
	var allName = row.productName;
	if(style!=null && style!=''){
		allName += ("-"+ style);
	}
	//产品是否重复
	var repeat = false;
	for(var i=0; i<deliveryDetailDtos.length; i++){
		var productCode0 = deliveryDetailDtos[i].productCode;
		var style0 = deliveryDetailDtos[i].style;
		var allName0 = deliveryDetailDtos[i].productName;
		if(style0!=null && style0!=''){
			allName0 += ("-"+ style0);
		}
		if(productCode0 == productCode && allName0 == allName ){
			deliveryDetailDtos[i].number += row.number;
			deliveryDetailDtos[i].allPrice += row.number * deliveryDetailDtos[i].onePrice;
			var orderCode = deliveryDetailDtos[i].orderCode;
			if(orderCode!=null && orderCode!=''){
				if(orderCode.indexOf(row.orderCode)<0){
					deliveryDetailDtos[i].orderCode += ("," + row.orderCode);
				}
			}else{
				deliveryDetailDtos[i].orderCode = row.orderCode;
			}
			
			repeat = true;
			break;
		} 
	}
	if(!repeat){
		delete row.endDate;
		delete row.groupBy;	
		delete row.order;
		delete row.page;
		delete row.pagination;
		delete row.papers;
		delete row.prints;
		delete row.rows;
		delete row.sort;
		delete row.startDate;
		delete row.spec;
		delete row.enabled;
		delete row.orderId;
		delete row.realNumber;
		deliveryDetailDtos.push(row);
	}		
	return repeat;
}



/**
 * 通过产品编号和名称删除明细
 * @param productCodes
 * @param productAllNames
 */
function delDeliveryDetailDtos(productCodes,productAllNames){
	
	//删除后道工序明细
	var length = deliveryDetailDtos.length;
	if(length>0){
		for(var i=length-1; i>=0; i--){
			var productCode = deliveryDetailDtos[i].productCode;
			var style = deliveryDetailDtos[i].style;
			var allName = deliveryDetailDtos[i].productName;
			if(style!=null && style!=''){
				allName += ("-"+ style);
			}
			var index = productAllNames.indexOf(allName);
			if(index>=0 && productCodes[index]==productCode){
				deliveryDetailDtos.splice(i,1);
			}
		}
	}	

	//剩下来的明细中的订单号
	var newOrderCodes = new Array();
	$.each(deliveryDetailDtos,function(){
		var orderCodes = this.orderCode.split(",");
		for (var i = 0; i < orderCodes.length; i++) {
			if(newOrderCodes.indexOf(orderCodes[i])<0){
				newOrderCodes.push(orderCodes[i]);
	   		}
		}			
	});
	return newOrderCodes;
}