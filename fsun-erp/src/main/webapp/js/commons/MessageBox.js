function getRootPath(){
    //获取当前网址，如： http://localhost:8083/uimcardprj/share/meun.jsp
    var curWwwPath=window.document.location.href;
    //获取主机地址之后的目录，如： uimcardprj/share/meun.jsp
    var pathName=window.document.location.pathname;
    var pos=curWwwPath.indexOf(pathName);
    //获取主机地址，如： http://localhost:8083
    var localhostPaht=curWwwPath.substring(0,pos);
    //获取带"/"的项目名，如：/uimcardprj
    var projectName=pathName.substring(0,pathName.substr(1).indexOf('/')+1);
    return(localhostPaht+projectName);
}
/**
 * 正在加载提示框：MessageBox.loading([是否阴影|{id:'提示框的id',mask:true|false(是否要有阴影),text:'提示的文字'}])
 * 					默认为有阴影，默认的提示文字为:'正在努力中，请稍等...'
 * 					例如：MessageBox.loading()|MessageBox.loading(false)|MessageBox.loading({id:'loading_div_id',mask:false,text:'正在努力努力!'})
 *                  
 *                  取消加载提示框：MessageBox.closeLoading()；
 * 
 * 成功：MessageBox.success(['提示文字'|{id:'提示框的id',text:'提示的文字',secs:停留几秒再消失}])
 * 失败: MessageBox.failure()——参数同success
 * 警告: MessageBox.warn()——参数同success
 * 错误: MessageBox.error()——参数同success
 * 一般信息: MessageBox.msg()——参数同success
 * 
 * 
 * 确认框: MessageBox.confirm([提示文字,回调函数])
 * 
 * 
 */
MessageBox={
//		proBarId:null,
//		proBarMask:true,
//		preBarUrl:null,
//		preBarText：'',
		setProgressBarValue:function(obj){
			MessageBox.proBarId=obj.id||'progress_bar';
			MessageBox.proBarMask=obj.mask||true;
			MessageBox.preBarUrl=getRootPath()+'/images/v4.1.0/msg/loading.gif';
			MessageBox.preBarText=obj.text||'正在努力中，请稍等...';
		},
		getWidthAndHeight:function(){
			return {
				width:(document.documentElement.scrollWidth>document.documentElement.clientWidth) ? document.documentElement.scrollWidth : document.documentElement.scrollWidth,
				height:(document.documentElement.scrollHeight >document.documentElement.clientHeight) ? document.documentElement.scrollHeight : document.documentElement.clientHeight
			}
		},
		progressBar:function(){
			//var temp = '<img src="'+ url +'/images/load.gif" />正在查询，请稍等．．．';
			var temp = '<img src="'+ MessageBox.preBarUrl +'" />'+MessageBox.preBarText;
			var progressBar = document.createElement("div");
			progressBar.id = MessageBox.proBarId;
			progressBar.className = 'progress_bar';//MessageBox.proBarId;
			progressBar.innerHTML=temp;
		    document.body.appendChild(progressBar);
//		    $("#"+progress_bar).show();
		    if(MessageBox.proBarMask){
		    	var mask =  document.createElement("div");
		    	mask.id = MessageBox.proBarId+'_mask';
		    	mask.className = 'progress_bar_mask';//MessageBox.proBarId+'_mask';
		    	var wAndHeight = MessageBox.getWidthAndHeight();
		    	mask.style.width=wAndHeight.width+'px';
		    	mask.style.height=wAndHeight.height+'px';
		        document.body.appendChild(mask);
		    }
		    return progressBar;
		},
		loading:function(params){
			var obj ;
			if(typeof params == 'boolean'){
				obj = {
						mask:params
				};
			}else if(typeof params == 'object'){
				obj = params ;
			}else if(!params){
				obj = {};
			}
			MessageBox.setProgressBarValue(obj);
			MessageBox.progressBar();
		},
		closeLoading:function(){
			var progress_bar = document.getElementById(MessageBox.proBarId);
		    document.body.removeChild(progress_bar);
		    var mask = document.getElementById(MessageBox.proBarId+'_mask');
		    if(mask){
		    	document.body.removeChild(mask);
		    }
		    return progress_bar;
		},
		
		
		/*secs:5,
		msgBox:function(msgBoxId){
			msgBoxId=msgBoxId||'msg_div';
			//var temp = '<img src="'+ url +'/images/load.gif" />正在查询，请稍等．．．';
			var temp = '<div class="msg_img_div"><img src="'+ getRootPath() +'/images/v4.1.0/msg/success.png" /></div>';
			temp+='<div class="msg_text_div">操作成功，<span id="msg_text_num">5</span>秒后返回</div>';
			var progressBar = document.createElement("div");
			progressBar.id = msgBoxId;
			progressBar.className = 'msg_div';
			progressBar.innerHTML=temp;
		    document.body.appendChild(progressBar);
//		    $("#"+progress_bar).show();
		    if(mask){
		    	var mask =  document.createElement("div");
		    	mask.id = 'progress_bar_mask';
		    	mask.className = 'progress_bar_mask';
		    	mask.style.width=document.body.scrollWidth+'px';
		    	mask.style.height=document.body.scrollHeight+'px';
		        document.body.appendChild(mask);
		    }
		    MessageBox.load();
		    return msgBoxId;
		},
		load:function(){ 
			for(var i=MessageBox.secs;i>=0;i--){ 
				window.setTimeout('MessageBox.doUpdate(' + i + ')', (MessageBox.secs-i) * 1000); 
			} 
		}, 
		doUpdate:function(num){ 
			document.getElementById('msg_text_num').innerHTML = num ; 
			if(num == 0) { 
				document.body.removeChild(document.getElementById('msg_div')) ; 
			} 
		}*/
		msgBox:function(msgBox){
			if(!msgBox||!(msgBox.url&&msgBox.id&&msgBox.text)){
				alert('参数出错！')
				return ;
			}
			//var temp = '<img src="'+ url +'/images/load.gif" />正在查询，请稍等．．．';
			var temp = '<div class="msg_img_div"><img src="'+ msgBox.url +'" /></div>';
			temp+='<div class="msg_text_div"><table cellspacing="0" cellpadding="0"><tr><td align="left" valign="middle" height="85">';
			temp+=msgBox.text;
			temp+='</td></tr></table></div>';
			var messageBox = document.createElement("div");
			messageBox.id = msgBox.id;
			messageBox.className = 'msg_div  testCls';
			messageBox.innerHTML=temp;
		    document.body.appendChild(messageBox);
		    MessageBox.showMsg(msgBox.id,msgBox.secs);
		    return msgBox.id;
		},
		getTopValue:function(msgBoxId,styleParam){
			var topPx = document.getElementById(msgBoxId).style[styleParam];
			var topValue = parseInt(topPx.replace('px',''));
			return topValue;
		},
		maxTop : 10,
		minTop : -90,
		maxLight : 1,
		minLight:0.05,
		showMsg:function(msgBoxId,secs){
			document.getElementById(msgBoxId).style.opacity=(MessageBox.maxLight);
			var currentTop = MessageBox.minTop;
			var sh = setInterval(function(){
				if(currentTop>=MessageBox.maxTop){
					clearInterval(sh);
					MessageBox.show(msgBoxId,secs);
					return false;
				}
				currentTop += 10 ;
				document.getElementById(msgBoxId).style['top']=(currentTop)+'px';
			},50);
		},
//		secs : 2,
		show:function(msgBoxId,secs){ 
//			for(var i=MessageBox.secs;i>=0;i--){ 
//				window.setTimeout('MessageBox.removeMsg(' + i + ',\''+msgBoxId+'\')', (MessageBox.secs-i) * 1000); 
//			} 
			if(secs<=0){
				MessageBox.removeMsg(0,msgBoxId);
			}else{
				for(var i=secs;i>=0;i--){ 
					window.setTimeout('MessageBox.removeMsg(' + i + ',\''+msgBoxId+'\')', (secs-i) * 1000); 
				}
			}
		} ,
		removeMsg:function(num,msgBoxId){ 
			if(num == 0) { 
				var currentTop = MessageBox.maxTop;
				var currentLight = MessageBox.maxLight ;
				var rm = setInterval(function(){
					if(currentTop<=MessageBox.minTop){
						clearInterval(rm);
						//showMsg();
						document.body.removeChild(document.getElementById(msgBoxId)) ; 
						return false;
					}
					currentTop -= 10;
					document.getElementById(msgBoxId).style['top']=(currentTop)+'px';
					if(currentLight>MessageBox.minLight){
						currentLight -= 0.1 ;
						document.getElementById(msgBoxId).style.opacity=(currentLight);
					}
				},50);
			} 
		},
		setMsgBoxValue:function(params){
			params.id=params.id||('msg_div_'+Math.round(Math.random()*1000));
			params.url=getRootPath()+'/images/v4.1.0/msg/'+params.type+'.png';
			params.text=params.text||params.type;
			var secs = parseInt(params.secs);
			params.secs=(secs==0)?0:(secs||2);
		},
		success:function(params){
			var obj ;
			if(typeof params == 'string'){
				obj = {
						text:params
				};
			}else if(typeof params == 'object'){
				obj = params ;
			}else if(!params){
				obj = {};
			}
			obj.type='success';
			obj.text=obj.text||'操作成功！';
			
			MessageBox.setMsgBoxValue(obj);
			MessageBox.msgBox(obj);
		},
		failure:function(params){
			var obj ;
			if(typeof params == 'string'){
				obj = {
						text:params
				};
			}else if(typeof params == 'object'){
				obj = params ;
			}else if(!params){
				obj = {};
			}
			obj.type='failure';
			obj.text=obj.text||'操作失败！';
			
			MessageBox.setMsgBoxValue(obj);
			MessageBox.msgBox(obj);
		},
		error:function(params){
			var obj ;
			if(typeof params == 'string'){
				obj = {
						text:params
				};
			}else if(typeof params == 'object'){
				obj = params ;
			}else if(!params){
				obj = {};
			}
			obj.type='error';
			obj.text=obj.text||'操作错误！';
			
			MessageBox.setMsgBoxValue(obj);
			MessageBox.msgBox(obj);
		},
		warn:function(params){
			var obj ;
			if(typeof params == 'string'){
				obj = {
						text:params
				};
			}else if(typeof params == 'object'){
				obj = params ;
			}else if(!params){
				obj = {};
			}
			obj.type='warn';
			obj.text=obj.text||'警告信息！';
			
			MessageBox.setMsgBoxValue(obj);
			MessageBox.msgBox(obj);
		},
		msg:function(params){
			var obj ;
			if(typeof params == 'string'){
				obj = {
						text:params
				};
			}else if(typeof params == 'object'){
				obj = params ;
			}else if(!params){
				obj = {};
			}
			obj.type='message';
			obj.text=obj.text||'普通的信息！';
			MessageBox.setMsgBoxValue(obj);
			MessageBox.msgBox(obj);
		},
		
		
		setConfirmValue:function(params){
			MessageBox.confirmId=params.id||'confirm_div';
			MessageBox.confirmUrl=getRootPath()+'/images/v4.1.0/msg/question.png';
			MessageBox.confirmText=params.text||'确定如此操作？';
			
		},
		confirmBox:function(fun){
			if(!(MessageBox.confirmId&&MessageBox.confirmUrl&&MessageBox.confirmText)){
				return ;
			}
			var temp = '<div style="100%">';
			temp+='<div class="msg_img_div confirm_img_div"><img src="'+ MessageBox.confirmUrl +'" /></div>';
			temp+='<div class="msg_text_div confirm_text_div"><table cellspacing="0" cellpadding="0"><tr><td align="left" valign="middle" height="85">';
			temp+=MessageBox.confirmText;
			temp+='</td></tr></table></div>';
			temp+='<div style="clear:both;"></div></div>';
			temp+='<div class="confirm_to_buton"><input id="confirm-to-yes" class="confirm-blue-btn" type="button" value="确定"/><input id="confirm-to-no" class="confirm-gray-btn" type="button" value="取消"/>';
			temp+='</div>';
			var messageBox = document.createElement("div");
			messageBox.id = MessageBox.confirmId;
			messageBox.className = 'msg_div confirm_div';
			messageBox.innerHTML=temp;
		    document.body.appendChild(messageBox);
		    
		    var mask =  document.createElement("div");
	    	mask.id = MessageBox.confirmId+'_mask';
	    	mask.className = 'progress_bar_mask';//MessageBox.proBarId+'_mask';
	    	var wAndHeight = MessageBox.getWidthAndHeight();
	    	mask.style.width=wAndHeight.width+'px';
	    	mask.style.height=wAndHeight.height+'px';
	        document.body.appendChild(mask);
	        document.getElementById('confirm-to-yes').focus();
	        document.getElementById('confirm-to-yes').onclick=function(a,b){
	        	MessageBox.removeConfirmBox();
	        	if(fun&&(typeof fun=='function')){
	        		fun('yes');
	        	}
	        }
	        document.getElementById('confirm-to-no').onclick=function(a,b){
	        	MessageBox.removeConfirmBox();
	        	if(fun&&(typeof fun=='function')){
	        		fun('no');
	        	}
	        }
		    return messageBox.id;
			
		},
		removeConfirmBox:function(){
			var confirmBox = document.getElementById(MessageBox.confirmId);
		    document.body.removeChild(confirmBox);
		    var mask = document.getElementById(MessageBox.confirmId+'_mask');
		    if(mask){
		    	document.body.removeChild(mask);
		    }
		    return confirmBox;
		},
		confirm:function(msg,fun){
			if((typeof msg != 'string')||!msg){
				msg=msg||'确定如此操作？';
			}
			var obj={
					text:msg,
			}
			MessageBox.setConfirmValue(obj);
			MessageBox.confirmBox(fun);
		}
}