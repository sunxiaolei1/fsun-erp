function getEditCell(detailGird,rowIndex,fieldName){
	return detailGird.datagrid('getEditor', {  
         index : rowIndex,  
         field : fieldName  
     });
}
 
function createCombox(id,required,valueField,textField,url){
	$('#'+id).combobox({
        required: required,
	 	valueField: valueField,
	  	textField: textField,
	  	url: url,
	    panelHeight: 100
	});	
}

function createCombox(id,required,valueField,textField,url,height,childId,childRequired,childValueField,childTextField,childUrl,paramName){
	
	if(typeof(height) == 'undefined'){
		height = 100;	
	}
	return $('#'+id).combobox({
		method:'get',
        required: required,
	 	valueField: valueField,
	  	textField: textField,
	  	url: url,
	    panelHeight: height,
	    onSelect:function(value){
			if(paramName!=''&& paramName!=null && value!=null){
				var murl = childUrl + paramName +'='+ value.id; 				
				$('#'+childId).combobox({
					required: childRequired,
				    valueField: childValueField,
			        textField: childTextField,
			        method:'get',
				    url: murl,
					panelHeight: height
				});	 
		    }
			   	 																																																												
		}
	});
}

function createComboxForWidth(id,required,valueField,textField,url,height,width){
	$('#'+id).combobox({
        required: required,
	 	valueField: valueField,
	  	textField: textField,
	  	url: url,
	  	width: width,
	    panelHeight: height
	});	
}

//用于删除成功后修改其刷新的页面
function changeCurrPageForDataGrid(rows,grid){
	var options = grid.datagrid('getPager').data("pagination").options;  		                			                			                	            	
	if(rows.length == (options.total % options.pageSize) && options.pageNumber > 1){			                	
		options.pageNumber = options.pageNumber - 1; 			                						    
        gird.datagrid('getPager').pagination('select',options.pageNumber);					              
	}
}

//获取当前日期
function myformatter(date){  
    var y = date.getFullYear();  
    var m = date.getMonth()+1;  
    var d = date.getDate();  
    return y+'-'+(m<10?('0'+m):m)+'-'+(d<10?('0'+d):d);  
} 

//换行
function formatStr(str){
	return str.replace(/(.{18})/g,'$1\n');
}

//换行
function formatStr30(str,number){
	return str.replace(/(.{30})/g,'$1\n');
}

//获取当前时间前后N天日期的方法，可以得到昨天，今天，明天，一月前，三月前，半年前，一年前的日期，只要修改参数就可以实现得到任何一个天数。
/*  例子
 *	document.write("<br />昨天："+GetDateStr(-1));
	document.write("<br />今天："+GetDateStr(0));
	document.write("<br />明天："+GetDateStr(1));
	document.write("<br />后天："+GetDateStr(2)); 
 */
function GetDateStr(AddDayCount){
    var dd = new Date();
    dd.setDate(dd.getDate()+AddDayCount);//获取AddDayCount天后的日期
    var y = dd.getYear()+1900;
    var m = (dd.getMonth()+1)<10?"0"+(dd.getMonth()+1):(dd.getMonth()+1);//获取当前月份的日期，不足10补0
    var d = dd.getDate()<10?"0"+dd.getDate():dd.getDate(); //获取当前几号，不足10补0
    return y+"-"+m+"-"+d;
}

//对象填充到form中的input
function setValue(obj){    
    // 开始遍历     
    for(var p in obj){        
       // 方法    
       console.info(obj);  
       if(typeof(obj[p])=="function"){        
           // obj[p]();       
        }else{      
            $("#"+p).val(obj[p]);  
            // p 为属性名称，obj[p]为对应属性的值       
                
        }        
    }        
      
}

//将表单中元素序列化成对象
function serializeObject(form) {  
    var o = {};  
    $.each(form.serializeArray(), function(index) {  
        if (o[this['name']]) {  
            o[this['name']] = o[this['name']] + "," + this['value'];  
        } else {  
            o[this['name']] = this['value'];  
        }  
    });  
    return o;  
}; 

//为属性为img的input设置图片路径
function setPath(imgId,url,$form){
    $("#"+imgId,$form).attr("src",url);
}

function previewImage(imgFile,toDiv){
    var pattern = /(\.*.jpg$)|(\.*.png$)|(\.*.jpeg$)|(\.*.gif$)|(\.*.bmp$)/;     
    if(!pattern.test(imgFile.value)){
     	alert("系统仅支持jpg/jpeg/png/gif/bmp格式的照片！"); 
     	imgFile.focus();
    }else{
    	var path;	
     	if(document.all){//IE
      		imgFile.select();
      		path = document.selection.createRange().text;
      		document.getElementById(toDiv).innerHTML="";
      		document.getElementById(toDiv).style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enabled='true',sizingMethod='scale',src=\"" + path + "\")";//使用滤镜效果
     	}else{//FF
      		path = URL.createObjectURL(imgFile.files[0]);
      		document.getElementById(toDiv).innerHTML = "<img src='"+path+"'/>";
     	}
    }
} 


//用正则表达式 过滤特殊字符 ,校验所有输入域是否含有特殊符号
function stripscript(s){
	var pattern = new RegExp("[`~!@#$^&*()=|{}':;',\\[\\].<>/?~！@#￥……&*（）&;—|{}【】‘；：”“'。，、？]");
    var rs = "";
    for (var i = 0; i < s.length; i++) {
    	if(s.substr(i, 1).replace(pattern, '')==''){
    		return false;
    	}
    }
    return true;
}

/** 字符串数字金额大写转换(可以处理整数,小数,负数) */
function upDigit(n) {
	if (!/^(0|[1-9]\d*)(\.\d+)?$/.test(n)){
		return "数据非法";
	}	
	var unit = "仟佰拾亿仟佰拾万仟佰拾元角分", str = "";
	n += "00";
	if(n=='0.00' || n=='0.0000'){
		return "元整";
	}
	var p = n.indexOf('.');
	if (p >= 0){
		n = n.substring(0, p) + n.substr(p + 1, 2);
	}		
	unit = unit.substr(unit.length - n.length);
	for (var i = 0; i < n.length; i++){
		str += '零壹贰叁肆伍陆柒捌玖'.charAt(n.charAt(i)) + unit.charAt(i);
	}	
	return str.replace(/零(仟|佰|拾|角)/g, "零").replace(/(零)+/g, "零").replace(
			/零(万|亿|元)/g, "$1").replace(/(亿)万|壹(拾)/g, "$1$2").replace(
			/^元零?|零分/g, "").replace(/元$/g, "元整");
}



//用正则表达式 过滤
/*
	测试用例：demo:
	var value ="123213";
	var pattern = new RegExp("[`~!@#$^&*()=|{}':;',\\[\\].<>/?~！@#￥……&*（）&;—|{}【】‘；：”“'。，、？]");		        
	var e = value.trim(pattern);
	$.messager.show({ title: '提示信息', msg : "zhi :"+ (e==''?false:true) });	
*/
String.prototype.trim=function(pattern){   
    return this.replace(pattern, "");    
}

$.extend($.fn.validatebox.defaults.rules, { 
	style : { // 判断最大长度，且不能有特殊字符
		validator : function(value, param) {
	        if(value.length > param[0]){
	        	return false;
	        }	       
			return stripscript(value);
		},
		message : '最多只能输入 {0} 个字(且不能有特殊字符)。'
	},
	phone : {// 验证电话号码 
	    validator : function(value) { 
	        return /^((\(\d{2,3}\))|(\d{3}\-))?(\(0\d{2,3}\)|0\d{2,3}-)?[1-9]\d{6,7}(\-\d{1,4})?$/i.test(value); 
	    }, 
	    message : '格式不正确,请使用下面格式:020-88888888' 
	}, 
	mobile : {// 验证手机号码 
	    validator : function(value) { 
	        return /^(13|15|18)\d{9}$/i.test(value); 
	    }, 
	    message : '手机号码格式不正确' 
	}, 
	maxLength : { // 判断最大长度
		validator : function(value, param) {
			return value.length <= param[0];
		},
		message : '最多只能输入 {0} 个字(包括空格、标点符号)。'
	},
	idcard : {// 验证身份证
		validator : function(value) {
			return /^\d{15}(\d{2}[A-Za-z0-9])?$/i.test(value);
		},
		message : '身份证号码格式不正确'
	}, 
	uniqueValue : {
		validator : function(value) {	
		alert('value=='+value);
			$.ajax({
	            type: "post",
	            dataType: "json",
	            async:false,
	            url: '<c:url value="/bus/product/tt"/>',
	            success: function(result) {
	            	return result.success;
	            }
	        });
			
		},
		message : '该名称已经存在,请换一个！'
	},
	intOrFloat: {// 验证整数或小数
        validator: function (value) {
            return /^\d+(\.\d+)?$/i.test(value);
        },
        message: '请输入数字，并确保格式正确'
    },
    date: {// 验证姓名，可以是中文或英文
        validator: function (value) {
            //格式yyyy-MM-dd或yyyy-M-d
            return /^(?:(?!0000)[0-9]{4}([-]?)(?:(?:0?[1-9]|1[0-2])\1(?:0?[1-9]|1[0-9]|2[0-8])|(?:0?[13-9]|1[0-2])\1(?:29|30)|(?:0?[13578]|1[02])\1(?:31))|(?:[0-9]{2}(?:0[48]|[2468][048]|[13579][26])|(?:0[48]|[2468][048]|[13579][26])00)([-]?)0?2\2(?:29))$/i.test(value);
        },
        message: '清输入合适的日期格式'
    },
    integer: {// 验证正整数 
        validator: function (value) {
    	 	var type = /^[0-9]*[1-9][0-9]*$/;
    	 	var re = new RegExp(type);
            return value.match(re) != null;
        },
        message: '请输入正整数'
    },
	fingerprintId : {// 指纹序列号
		validator : function(value) {
			return /^[1-9]\d{6}$/i.test(value);
		},
		message : '身份证号码格式不正确'
	}                  
});

//自动调整行号的宽度
$.extend($.fn.datagrid.methods, { 
    fixRownumber : function (jq) { 
    	return jq.each(function () { 
    		var panel = $(this).datagrid("getPanel"); 
    		var clone = $(".datagrid-cell-rownumber", panel).last().clone();
        	clone.css({ "position" : "absolute", left : -1000 }).appendTo("body"); 
        	var width = clone.width("auto").width(); 
        	if (width > 25) { //多加5个像素,保持一点边距 
	        	$(".datagrid-header-rownumber,.datagrid-cell-rownumber", panel).width(width + 5); 
	        	$(this).datagrid("resize"); //一些清理工作 
	        	clone.remove(); 
	        	clone = null; 
	    	} else { //还原成默认状态 
		    	$(".datagrid-header-rownumber,.datagrid-cell-rownumber", panel).removeAttr("style");
	   	 	}
    	}); 
	} 
}); 
/*$.extend($.fn.validatebox.defaults.rules, {
	  idcard : {// 验证身份证 
	        validator : function(value) { 
	            return /^\d{15}(\d{2}[A-Za-z0-9])?$/i.test(value); 
	        }, 
	        message : '身份证号码格式不正确' 
	    },
	      minLength: {
	        validator: function(value, param){
	            return value.length >= param[0];
	        },
	        message: '请输入至少（2）个字符.'
	    },
	    length:{validator:function(value,param){ 
	        var len=$.trim(value).length; 
	            return len>=param[0]&&len<=param[1]; 
	        }, 
	            message:"输入内容长度必须介于{0}和{1}之间." 
	        }, 
	    phone : {// 验证电话号码 
	        validator : function(value) { 
	            return /^((\(\d{2,3}\))|(\d{3}\-))?(\(0\d{2,3}\)|0\d{2,3}-)?[1-9]\d{6,7}(\-\d{1,4})?$/i.test(value); 
	        }, 
	        message : '格式不正确,请使用下面格式:020-88888888' 
	    }, 
	    mobile : {// 验证手机号码 
	        validator : function(value) { 
	            return /^(13|15|18)\d{9}$/i.test(value); 
	        }, 
	        message : '手机号码格式不正确' 
	    }, 
	    intOrFloat : {// 验证整数或小数 
	        validator : function(value) { 
	            return /^\d+(\.\d+)?$/i.test(value); 
	        }, 
	        message : '请输入数字，并确保格式正确' 
	    }, 
	    currency : {// 验证货币 
	        validator : function(value) { 
	            return /^\d+(\.\d+)?$/i.test(value); 
	        }, 
	        message : '货币格式不正确' 
	    }, 
	    qq : {// 验证QQ,从10000开始 
	        validator : function(value) { 
	            return /^[1-9]\d{4,9}$/i.test(value); 
	        }, 
	        message : 'QQ号码格式不正确' 
	    }, 
	    integer : {// 验证整数 
	        validator : function(value) { 
	            return /^[+]?[1-9]+\d*$/i.test(value); 
	        }, 
	        message : '请输入整数' 
	    }, 
	    age : {// 验证年龄
	        validator : function(value) { 
	            return /^(?:[1-9][0-9]?|1[01][0-9]|120)$/i.test(value); 
	        }, 
	        message : '年龄必须是0到120之间的整数' 
	    }, 
	    
	    chinese : {// 验证中文 
	        validator : function(value) { 
	            return /^[\Α-\￥]+$/i.test(value); 
	        }, 
	        message : '请输入中文' 
	    }, 
	    english : {// 验证英语 
	        validator : function(value) { 
	            return /^[A-Za-z]+$/i.test(value); 
	        }, 
	        message : '请输入英文' 
	    }, 
	    unnormal : {// 验证是否包含空格和非法字符 
	        validator : function(value) { 
	            return /.+/i.test(value); 
	        }, 
	        message : '输入值不能为空和包含其他非法字符' 
	    }, 
	    username : {// 验证用户名 
	        validator : function(value) { 
	            return /^[a-zA-Z][a-zA-Z0-9_]{5,15}$/i.test(value); 
	        }, 
	        message : '用户名不合法（字母开头，允许6-16字节，允许字母数字下划线）' 
	    }, 
	    faxno : {// 验证传真 
	        validator : function(value) { 
//	            return /^[+]{0,1}(\d){1,3}[ ]?([-]?((\d)|[ ]){1,12})+$/i.test(value); 
	            return /^((\(\d{2,3}\))|(\d{3}\-))?(\(0\d{2,3}\)|0\d{2,3}-)?[1-9]\d{6,7}(\-\d{1,4})?$/i.test(value); 
	        }, 
	        message : '传真号码不正确' 
	    }, 
	    zip : {// 验证邮政编码 
	        validator : function(value) { 
	            return /^[1-9]\d{5}$/i.test(value); 
	        }, 
	        message : '邮政编码格式不正确' 
	    }, 
	    ip : {// 验证IP地址 
	        validator : function(value) { 
	            return /d+.d+.d+.d+/i.test(value); 
	        }, 
	        message : 'IP地址格式不正确' 
	    }, 
	    name : {// 验证姓名，可以是中文或英文 
	            validator : function(value) { 
	                return /^[\Α-\￥]+$/i.test(value)|/^\w+[\w\s]+\w+$/i.test(value); 
	            }, 
	            message : '请输入姓名' 
	    },
	    date : {// 验证姓名，可以是中文或英文 
	        validator : function(value) { 
	         //格式yyyy-MM-dd或yyyy-M-d
	            return /^(?:(?!0000)[0-9]{4}([-]?)(?:(?:0?[1-9]|1[0-2])\1(?:0?[1-9]|1[0-9]|2[0-8])|(?:0?[13-9]|1[0-2])\1(?:29|30)|(?:0?[13578]|1[02])\1(?:31))|(?:[0-9]{2}(?:0[48]|[2468][048]|[13579][26])|(?:0[48]|[2468][048]|[13579][26])00)([-]?)0?2\2(?:29))$/i.test(value); 
	        },
	        message : '清输入合适的日期格式'
	    },
	    msn:{ 
	        validator : function(value){ 
	        return /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/.test(value); 
	    }, 
	    message : '请输入有效的msn账号(例：abc@hotnail(msn/live).com)' 
	    },
	    same:{ 
	        validator : function(value, param){ 
	            if($("#"+param[0]).val() != "" && value != ""){ 
	                return $("#"+param[0]).val() == value; 
	            }else{ 
	                return true; 
	            } 
	        }, 
	        message : '两次输入的密码不一致！'    
	    } 
	});
*/

String.prototype.endWith=function(s){
	if(s==null||s==""||this.length==0||s.length>this.length)
		return false;
	if(this.substring(this.length-s.length)==s)
		return true;
	else
		return false;
	return true;
}

String.prototype.startWith=function(s){
	if(s==null||s==""||this.length==0||s.length>this.length)
		return false;
	if(this.substr(0,s.length)==s)
		return true;
	else
		return false;
	return true;
}

/**
 * 获取字符串的长度(英文占1个字符，中文汉字占2个字符)
 */
String.prototype.getLength=function(){
	var len = 0;
	if(this.length!=null){
		 for (var i = 0; i < this.length; i++) {
			if (this.charCodeAt(i) > 127 || this.charCodeAt(i) == 94) {
				len += 2;
			} else {
				len++;
			}
		}  
	}
    return len;
}

/**
 * 截取字符串(支持中英文混合) 
 */
String.prototype.getSub = function(n) {
	var r = /[^\x00-\xff]/g;
	if (this.replace(r, "mm").length <= n) {
		return this;
	}
	var m = Math.floor(n / 2);
	for (var i = m; i < this.length; i++) {
		if (this.substr(0, i).replace(r, "mm").length >= n) {
			return this.substr(0, i) + "...";
		}
	}
	return this;
} 

/**
 * 判断一个数组中是否包含某个值
 */
Array.prototype.contains = function(val) {  
    for (var i = 0; i < this.length; i++) {  
       if (this[i] == val) {  
    	   return true;  
       }  
    }  
    return false;  
}; 
