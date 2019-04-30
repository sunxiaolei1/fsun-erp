Ext.onReady(function(){
	Ext.BLANK_IMAGE_URL= url;
	Ext.QuickTips.init();
	
	forbiddenOrStartDictionary = function(state,obj){//写成function forbiddenOrStartDictionary(){}的形式会报错说这个方法没有定义，所以应该写成这个"方法名" = function(){}
		var currentTr = obj.parentElement.parentElement.parentElement ;
		var str = currentTr.outerHTML.match(/ext:tree-node-id=(['"])[^'"]*\1/)[0] ;
		var nodeId = str.replace(/ext:tree-node-id=/g,"").replace(/['"]/g,"") ;
		nodeId = nodeId.length > 0 ? nodeId:0 ;
		var url = '' ;
		if(state){
			url = 'dictionary/forbiddenDictionary' ;
		}else{
			url = 'dictionary/startUpDictionary' ;
		}
		var requestConfig = {
				url:url ,
				params:{id:nodeId},
				callback:function(options,success,response){
					if(!success){
						Ext.Msg.show('提示','操作失败！') ;
					}else{
						var children = tree.root.childNodes ;
						var currentNode = tree.getNodeById(options.params.id) ;
						currentNode.attributes.inuse = !state ;
						if(state){
							currentTr.style.background= '#ccc';
							obj.parentElement.innerHTML = '<span onclick="forbiddenOrStartDictionary('+!state+',this)">禁用</span>';
						}else{
							currentTr.style.background= '';
							obj.parentElement.innerHTML = '<span onclick="forbiddenOrStartDictionary('+!state+',this)">启用</span>';
						}
					}
				}
		} ;
		Ext.Ajax.request(requestConfig);
	}
	var store= new Ext.data.SimpleStore({
		fields:['enabledName','enabledValue'],
		data:[['启用',true],['禁用',false]]
	});
	var tree = new Ext.ux.tree.EditTreeGrid({
		id:'dictionary-tree',
		//title:'菜单管理',
		width:Ext.getBody().getViewSize().width,
		height:Ext.getBody().getViewSize().height*0.9,
		renderTo:Ext.getBody(),
		enableDD:true,
		
		depth: 10, // 最大节点深度
		
		columns: [{
            header: '数据名称',
            dataIndex: 'name',
            width: 110,
            align: 'center',
            editor: new Ext.form.TextField({
            allowBlank: false
            })
        }, {
            header: '编码',
            dataIndex: 'code',
            width: 150,
            align: 'center',
            editor: new Ext.form.TextField()
        }, {
            header: '领域',
            dataIndex: 'field',
            width: 150,
            align: 'center',
            editor: new Ext.form.TextField()
        }, {
            header: '领域名',
            dataIndex: 'fieldname',
            width: 150,
            align: 'center',
            editor: new Ext.form.TextField()
//        }, {
//            header: '父节点',
//            dataIndex: 'pid',
//            width: 100,
//            editor: new Ext.form.TextField()
        }, {
            header: '数据描述',
            dataIndex: 'description',
            width: 120,
            align: 'center',
            editor: new Ext.form.TextField()
        }, {
            header: '链接地址',
            dataIndex: 'url',
            width: 150,
            align: 'center',
            editor: new Ext.form.TextField()
        },   {
            header: '创建人',
            align: 'center',
            dataIndex: 'createManId',
            width: 50
        },  {
            header: '创建时间',
            align: 'center',
            dataIndex: 'createTime',
            width: 120,
            tpl: new Ext.XTemplate('{createTime:this.formatTime}',{formatTime:function(value){return formatTime(value,'Y-m-d H:i:s')}})
        },{
            header: '修改人',
            align: 'center',
            dataIndex: 'updateManId',
            width: 50
        },	{
            header: '最后更新时间',
            align: 'center',
            dataIndex: 'updateTime',
            width: 120,
            tpl: new Ext.XTemplate('{updateTime:this.formatTime}',{formatTime:function(value){return formatTime(value,'Y-m-d H:i:s')}})
        },{
        	header: '禁止/启用',
        	dataIndex:'enabled',
        	width: 100,
        	align: 'center',
        	editor:new Ext.form.ComboBox({
        			name:'enabled',
        			editable:true,
        			lazyRender:true,
        			triggerAction:'all',
        			store:store,
        			value:true,
        			displayField:'enabledName',
        			valueField:'enabledValue',
        			mode:'local',
        			forceSelection:true,
        			resizable:true,
        			typeAhead:true,
        			handleHeight:10
        			
        		}),
        	tpl: new Ext.XTemplate('{enabled:this.formatButton}',{formatButton:function(state){
	        		if(state){
	        			return '<span onclick="forbiddenOrStartDictionary(true,this);">启用</span>';
	        		}else{
	        			return '<span onclick="forbiddenOrStartDictionary(false,this);">禁用</span>';
	        		}
        		}
        	})
        }, 	{
            header: '排序',
            width: 50,
            align: 'center',
            buttons: ['upgrade', 'degrade'],
            buttonIconCls: ['x-treegrid-button-upgrade', 'x-treegrid-button-degrade'],
            buttonTips: ['上移', '下移']
        }, 	{
            header: '新增子分类',
            width: 50,
            align: 'center',
            buttons: 'add',
            buttonIconCls: 'x-treegrid-button-add',
            buttonTips: '新增'
        }, 	{
            header: '操作',
            width: 100,
            align: 'center',
            buttons: ['update', 'remove'],
            buttonText: ['编辑', '永久删除']
        }],
        loader: new Ext.tree.TreeLoader({
        	dataUrl: 'dictionary/list',
        	requestMethod: 'GET'
        }),
        requestApi: {
            upgrade: 'dictionary/upgrade',
            degrade: 'dictionary/degrade',
            add: 'dictionary/create',
            update: 'dictionary/update',
            remove: 'dictionary/delete',
            forbiddenOrStartDictionary: 'forbiddenOrStartDictionary'
        },
        tbar: [
          { text: '新增一级节点',
        	  icon:'../btglxt/images/add.gif',    
            handler: function() {
            tree.addNode(tree.getRootNode());
            } },
          { text: '全部展开',
            	 icon:'../btglxt/image/ext/expand-all.gif', 
              handler: function() {
            	  tree.expandAll () ;
              } },
          { text: '全部收缩',
            	  icon:'../btglxt/image/ext/collapse-all.gif',
              handler: function() {
            	  
            	  tree.collapseAll () ;
              } }
        ] 
	});
}) ;