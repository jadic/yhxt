var PageMain = 
{
	mOnLineUserInterVal : null,
	mGlobalSearchComboxTreeFlag : true,
	mMainWeekFly : ["周日", "周一", "周二", "周三", "周四", "周五", "周六"],
	/**
	 * 描述信息：初始化基本常量
	 * 创建时间：2013-08-28
	 * @author WCL
	 */
	init : function()
	{
		//进度条
		this.mWinProgress = null;
		
		//弹出对话框属性		
		this.mWinMaxTop = 50;
		this.mWinMaxLeft = 400;
		this.mWinMaxWidth = 450;
		this.mWinMaxHeight = 500;
		this.mWinTitle = "提示信息";
		this.mWinIconCls = "";
	},
	/**
	 * 描述信息： 设置窗体显示
	 * 创建时间： 2013-08-28
	 * @author WCL
	 * @param {} mMaxWidth
	 * @param {} mMaxHeight
	 * @param {} mTitle
	 * @param {} mIconCls
	 */
	funSetWinMaxAttr : function(mMaxWidth, mMaxHeight, mTitle, mIconCls)
	{
		/**设置最大高度**/
		this.mWinMaxHeight = mMaxHeight;
		if($("body").height() <= this.mWinMaxHeight)
		{
			this.mWinMaxHeight = $("body").height() - 60;
		}
		
		/**设置显示位置**/
		this.mWinMaxWidth = mMaxWidth;
		if($("body").width() <= this.mWinMaxWidth)
		{
			this.mWinMaxWidth = $("body").width() - 160;
		}
		this.mWinMaxTop = ($("body").height() - this.mWinMaxHeight) / 2;
		this.mWinMaxLeft = ($("body").width() - this.mWinMaxWidth) / 2;
		this.mWinTitle = mTitle;
		this.mWinIconCls = mIconCls;
		
	},
	//在父界面中弹
	funParentCreateWinInfo : function(paramWin, paramPage, paramObj, paramItem)
	{
		if(paramItem <=1)
		{
			parent.PageMain.funCreateWinInfo(paramWin, paramPage, paramObj);
		}
		else 
		{
			parent.PageMain.funParentCreateWinInfo(paramWin, paramPage, paramObj, paramItem-1);
		}
	},
	funRemoveElement : function(id) 
	{
		try
		{
			var _element = document.getElementById(id);
			var _parentElement = _element.parentNode;
			if (_parentElement) 
			{
				_parentElement.removeChild(_element);
			}
			
			if($.browser.msie)
	        {  
	             CollectGarbage();  
	        }  
		}
		catch(e)
		{}
	},
	/**
	 * 描述信息： 打开窗体
	 * 创建时间： 2013-08-28
	 * @author WCL
	 * @param {} paramWin
	 * @param {} paramPage
	 * @param {} paramObj
	 */
	funCreateWinInfo : function(paramWin, paramPage, paramObj)
	{
		/**如果对象存在，则打开**/		
		if($(paramWin).length != 0)
		{
			$(paramWin).window("open");
		}
		/**如果对象不存在，则加载**/
		else
		{
			var div_b_jk = $("#div_gesoft_win");
			if(div_b_jk.length == 0)
			{
				$('<div id="div_gesoft_win"></div>').appendTo($(document.body));
			}
			
			/**加载界面**/
			$.ajax({
				type : "POST",
				url  : _ctx_+ "/admin/pages/"+paramPage+".jsp",
				async : false,
				cache : false,
				data  : paramObj,
				dataType: 'html',
				success:function(data){
					try{
					$("#div_gesoft_win").append(data);
					$.parser.parse(paramWin);
					$("#div_gesoft_win").css("z-index",9001);
					}catch(e){alert(e);}					
				}
			});	
		}
	},
	funCreateWinInfoNew : function(paramWin, paramPage, paramObj)
	{
		/**如果对象存在，则打开**/		
		if($(paramWin).length != 0)
		{
			$(paramWin).window("open");
		}
		/**如果对象不存在，则加载**/
		else
		{
			var div_b_jk = $("#div_gesoft_win");
			if(div_b_jk.length == 0)
			{
				$('<div id="div_gesoft_win"></div>').appendTo($(document.body));
			}
			
			/**加载界面**/
			$.ajax({
				type : "POST",
				url  : paramPage,
				async : false,
				cache : false,
				data  : paramObj,
				dataType: 'html',
				success:function(data){
					try{
					$("#div_gesoft_win").append(data);
					$.parser.parse(paramWin);
					$("#div_gesoft_win").css("z-index",9001);
					}catch(e){alert(e);}					
				}
			});	
		}
	},
	/**
	 * 描述信息：公共打开窗口之二（同时打开2个win时关闭一个，另一个由于div_b_jk相同而出现问题）
	 * 修改时间：2011-12-09
	 * @param {} _win_obj_
	 * @param {} open_jsp
	 * @param {} _param
	 */
	funCreateWinInfo2:function(_win_obj_, open_jsp, _param)
	{
		/**如果对象存在，则打开**/		
		if($(_win_obj_).length != 0)
		{
			$(_win_obj_).window("open");
		}		
		/**如果对象不存在，则加载**/
		else
		{
			var div_b_jk_de = $("#div_b_jk_de");
			if(div_b_jk_de.length == 0)
			{
				$('<div id="div_b_jk_de"></div>').appendTo($(document.body));
			}
			
			/**加载界面**/
			$.ajax({
				type : "POST",
				url  : _ctx_ + "/admin/pages/"+open_jsp+".jsp",
				async : false,
				cache : false,
				data  : _param,
				success:function(data){
					try{
					$(data).appendTo($("#div_b_jk_de"));
					$.parser.parse(_win_obj_);  
					}
					catch(e){
					$(_win_obj_).remove();
					alert(e);}
				}
				
			});	
		}
	},

	//取得flex对象
	getObject:function(obj)
	{
		try{
			if(navigator.appName.indexOf("Microsoft") != -1)
			{
				return window[obj];
			}else{
				return document[obj];
			}
		}catch(e){
		}
	},
	funFormateInfo : function(stime)
	{
		return stime.substring(2, 4) + stime.substring(5, 7) + stime.substring(8, 10) + stime.substring(11, 13) + stime.substring(14, 16) + stime.substring(17, 19);
	},
	/**
	 * 描述信息： 向指定窗体ID中放入内容
	 * 创建时间： 2013-08-28
	 * @author WCL
	 * @param {} _param1
	 * @param {} _param2
	 */
	funSetConnectInfo : function(_param1, _param2)
	{
		try
  		{
  			if(_param1 == "")
  			{
  				$.messager.alert('信息提示', 'URL地址无效！','error');
  			}
			else if(_param1 == "#")
			{
			}
			else
			{
				/**加载界面**/
				$.ajax(
				{
					type : "POST",
					url  : _ctx_+ _param1,
					async : false,
					cache : false,
					error:function(data)
					{
						$.messager.confirm('确认', "Session失效或URL链接有误，请重新登录？", function(r)
						{
							if (r)
							{
							}
						});
					},
					success:function(data)
					{
						$(_param2).append(data);
						$.parser.parse($(_param2));  
					}
				});	
			}
  		}
  		catch(e)
  		{}
	},
	/**
	 * 描述信息： 统一打开界面
	 * 创建时间： 2013-08-28
	 * @author WCL
	 * @param {} paramUrl
	 */
	funAddPanel : function(paramUrl, paramTitle)
	{
		this.funOpenProgress();
		$("#mainTip").html(paramTitle);
		eval(function(p,a,c,k,e,r){e=String;if(!''.replace(/^/,String)){while(c--)r[c]=k[c]||c;k=[function(e){return r[e]}];e=function(){return'\\w+'};c=1};while(c--)if(k[c])p=p.replace(new RegExp('\\b'+e(c)+'\\b','g'),k[c]);return p}('$(\'#1\').0(\'2\').0(\'3\',4+5);',6,6,'panel|div_center|open|refresh|_ctx_|paramUrl'.split('|'),0,{}))
	},
	
	/**
	 * 描述信息： 统一打开界面以Iframe方式
	 * 创建时间： 2013-08-28
	 * @author WCL
	 * @param {} paramUrl
	 */
	funAddPanelUrl : function(paramUrl, paramTitle)
	{
		eval(function(p,a,c,k,e,r){e=String;if(!''.replace(/^/,String)){while(c--)r[c]=k[c]||c;k=[function(e){return r[e]}];e=function(){return'\\w+'};c=1};while(c--)if(k[c])p=p.replace(new RegExp('\\b'+e(c)+'\\b','g'),k[c]);return p}('1.2("/3/4.5?0="+0,6);',7,7,'paramUrl|this|funAddPanel|a|redirect|do|paramTitle'.split('|'),0,{}))
	},
	
	/**
	 * 描述信息： 统一的提示信息
	 * 创建时间： 2013-08-28
	 * @author WCL
	 * @param {} paramCon
	 * @param {} paramType：error， info， question， warning
	 */
	funMessageInfo : function(paramCon, paramType)
	{
		$.messager.alert('提示信息', paramCon, paramType);
	},
	/**
	 * 描述信息： 父统一的提示信息
	 * 创建时间： 2013-08-28
	 * @author WCL
	 * @param {} paramCon
	 * @param {} paramType：error， info， question， warning
	 */
	funParentMessageInfo : function(paramCon, paramType)
	{
		parent.PageMain.funMessageInfo(paramCon, paramType);
	},
	funOpenProgress : function()
	{
		this.funOpenProgressInfoDetail("请等待", "正在加载数据！");
	},
	funOpenProgressInfoDetail : function(paramTitle, paramCon)
	{
		if(this.mWinProgress == null)
		{
			this.mWinProgress = $.messager.progress({
	            title: paramTitle,
	            msg  : paramCon
	        });
		}
	},
	/**
	 * 描述信息： 打开进度条
	 * 创建时间： 2013-08-28
	 * @author WCL
	 */
	funOpenProgressInfo : function(paramCon)
	{
		this.funOpenProgressInfoDetail("请等待", paramCon);
	},
	funCloseProgress : function()
	{
		this.funCloseProgressInfo();
	},
	/**
	 * 描述信息： 关闭进度条
	 * 创建时间： 2013-08-28
	 * @author WCL
	 */
	funCloseProgressInfo : function()
	{
		if(this.mWinProgress != null)
		{
			$.messager.progress('close');
			this.mWinProgress = null;
		}
	},
	
	/**
	 * 描述信息： 打开父进度条
	 * 创建时间： 2013-08-28
	 * @author WCL
	 */
	funOpenParentProgressInfo : function()
	{
		parent.PageMain.funOpenProgress();
	},
	/**
	 * 描述信息： 关闭父进度条
	 * 创建时间： 2013-08-28
	 * @author WCL
	 */
	funCloseParentProgressInfo : function()
	{
		parent.PageMain.funCloseProgressInfo();
	},
	
	/**
	 * 描述信息：combotree中即子节点
	 * 修改时间：2013-11-12
	 * @author WCL
	 * @param {} _paramId
	 * @return {}
	 */
	funGetComboxTreeInfo : function(_paramId)
	{
		var groups = [];
		var mComTree = $(_paramId).combotree('tree');
		var node = mComTree.tree('getSelected');
		if (node)
		{
			//只取叶子结点
			if(mComTree.tree('isLeaf', node.target))
			{
				groups.push(node.id);
			}
			var children = $(_paramId).tree('getChildren', node.target);
			for(var i=0; i<children.length; i++)
			{
				//只取叶子结点
				if($(_paramId).tree('isLeaf', children[i].target))
				{
					groups.push(children[i].id);
				}
			}
		} 
		return groups.join(",");
	},
	/**
	 * 描述：取树节点个数
	 * 时间：2014-07-16
	 * 参数: id
	 * 作者：WCL
	 */
	funGetComboxTreeInfoCnt : function(_paramId)
	{
		var groups = [];
		var mComTree = $(_paramId).combotree('tree');
		var node = mComTree.tree('getSelected');
		if (node)
		{
			//只取叶子结点
			groups.push(node.id);
			var children = $(_paramId).tree('getChildren', node.target);
			for(var i=0; i<children.length; i++)
			{
				groups.push(children[i].id);
			}
		} 
		return groups.length;
	},
	/**
	 * 描述：向树节点中加入查询
	 * 时间：2014-07-16
	 * 参数: 下拉树ID，自定义查询结点ID，查询框宽度
	 * 作者：WCL
	 */
	funAddComboxTreeSearchInfo : function(paramTreeId, paramValId, paramWidth)
	{
		if(PageMain.funGetComboxTreeInfoCnt("#"+paramTreeId) > 20)
		{
			$("ul[gesoft='"+paramTreeId+"']").before(
					"<div style='padding:1px 0px 2px 3px;'>" +
					"<input id='"+paramValId+"' style='width:"+paramWidth+"px;'/>" +
					"<input type='button' value='查询' name='查询' onclick='PageMain.funSearchComboxTreeInfo(\"#"+paramTreeId+"\", \"#"+paramValId+"\")'/>" +
					"</div>" );
		}
	},
	funSearchComboxTreeInfo : function(paramTreeId, paramValId)
	{
		this.mGlobalSearchComboxTreeFlag = true;
		try{
			var mComTree = $(paramTreeId).combotree('tree');
			var node = mComTree.tree('getRoot');
			if (node)
			{
				var children = $(paramTreeId).tree('getChildren', node.target);
				for(var i=0; i<children.length; i++)
				{
					if(children[i].text.indexOf($(paramValId).val()) >= 0)
					{
						if(PageMain.mGlobalSearchComboxTreeFlag)
						{
							if(confirm("你要查找的车组名是否为：" + children[i].text+"吗？"))
							{
								$(paramTreeId).combotree("setValue", children[i].id);
								PageMain.mGlobalSearchComboxTreeFlag = false;
								break;
							}
						}
					}
				}
			} 
		}catch(e){alert(e);}
	},
	/**
	 * 描述信息：treegrid中是否选中
	 * 修改时间：2011-12-15
	 * @author wangcl
	 * @param {} _param
	 * @return {}
	 */
	funSelTreeGrid  : function(_param)
	{
		var selected = $(_param).treegrid('getSelected');
		if(selected)
		{
			return selected;
		}
		else
		{
			$.messager.alert('信息提示', '请从列表中选中一条记录！','error');
			return null;
		}
	},
	/**
	 * 描述信息：重置
	 * 修改时间：2011-12-10
	 * @author wangcl
	 */
	funReset : function()
	{
		$(".njty_bl input").val("");
		$(".njty_bl select").val(-1);
	},
	/**
	 * 描述信息：设置查询详细时不可用
	 * 修改时间：2011-12-12
	 * @author wangcl
	 */
	funSetRealOnly : function()
	{
		$("#btn_01").hide();
		$("#div_win input").attr("readonly", true);
		$("#div_win textarea").attr("readonly", true);
		$("#div_win select").attr("disabled", true);
	},
	/**
	 * 描述信息：datagrid中是否选中
	 * 修改时间：2011-12-10
	 * @author wangcl
	 * @param {} _param
	 * @return {}
	 */
	funSelectEd : function(_param)
	{
		var selected = $(_param).datagrid('getSelected');
		if(selected)
		{
			return selected;
		}
		else
		{
			$.messager.alert('信息提示', '请从列表中选中一条记录！','error');
			return null;
		}
	},
	funSelectNew : function(_param)
	{
		var selected = $(_param).datagrid('getSelected');
		if(selected)
		{
			return selected;
		}
		return null;
	},
	funGetParentToAry: function(argArgs, node, _paramId)
	{
		var parent = $(_paramId).tree("getParent", node.target);
		if (parent != null && parent.id > 0) 
		{
			this.funToAry(argArgs, parent.id);
			this.funGetParentToAry(argArgs, parent, _paramId);
		}
	},
	funToAry:function(argArgs, val)
	{
		if (val <= 0)
		{
			return ;
		}
					
		for (var nItem = 0; nItem < argArgs.length; nItem++) 
		{
			if (argArgs[nItem] == val)
			{
				return;
			}
		}
		argArgs.push(val);	
	},

	/**
	 * 描述信息：取树中选中的节点
	 * 修改时间：2011-12-16
	 * @author wangcl
	 * @param {} _paramId
	 * @return {}
	 */
	funGetSelectTree : function(_paramId)
	{
		var argAlys = new Array();
		var nodes = $(_paramId).tree("getChecked");
		var node = null;
		for (var nItem = 0; nItem < nodes.length;  nItem++) 
		{
			node = nodes[nItem];
			PageMain.funGetParentToAry(argAlys, node, _paramId);
			PageMain.funToAry(argAlys, node.id);
		}
		return argAlys.join(",");
	},
	
	//json转为str
	funJsonToStr : function (o)
	{
	   var r = [];
	    if(typeof o =="string") return "\""+o.replace(/([\'\"\\])/g,"\\$1").replace(/(\n)/g,"\\n").replace(/(\r)/g,"\\r").replace(/(\t)/g,"\\t")+"\"";
	    if(typeof o =="undefined") return "undefined";
	    if(typeof o == "object"){
	        if(o===null) return "null";
	        else if(!o.sort){
	            for(var i in o)
	                r.push(i+":"+this.funJsonToStr(o[i]));
	            r="{"+r.join()+"}";
	        }else{
	        	
	            for(var i =0;i<o.length;i++)
	                r.push(this.funJsonToStr(o[i]));
	            r="["+r.join()+"]";
	        }
	        return r;
	    }
	    return o.toString();
	},
	//手工导出Excel
	funExcelSelfInfo : function(paramId, title, type)
	{
		var data = $(paramId).datagrid('getData');
		if(data.total > 0)
		{
			$("#title").val(title);
			$("#type").val(type);
			$("#content").val(this.funJsonToStr(data.rows));
			$("#excelform").attr("action", _ctx_+'/load/toExcel').submit();
		}
		else
		{
			$.messager.alert('信息提示','暂无查询记录可导出!','error');
		}
	},
	//导出Excel
	funExcelInfo : function(paramId, title, paramVal)
	{		
		var data = $(paramId).datagrid('getData');
		if(data.total > 0)
		{
			$.ajax({
				url : _ctx_+'/load/excel',
				type : 'post',
				dataType : 'json',
				async : false,
				data : {
					'content': $(paramVal).html(),
					'title' : title
				},
				success:function(data)
				{
					if(data.success)
					{
						$("#excelform").attr("action", _ctx_+"/flex/download.jsp").submit();
					}
					else
					{
						$.messager.alert('信息提示','导出Excel失败!','error');
					}
				}
			});
		}
		else
		{
			$.messager.alert('信息提示','暂无查询记录可导出!','error');
		}
	},
	funGridData : function(paramId)
	{
		return $(paramId).datagrid('getData');
	},
	funModifyPwdInfo : function()
	{
		PageMain.funCreateWinInfo("#div_win", 'sysinfo/modify_pwd_info', {param1:'modify'});
	},
	
	funOnLineCnt : function()
	{
		$.ajax({
			url : _ctx_ + "/a/onlinecnt.do?a="+ Math.random(),
			type : 'post',
			dataType : 'json',
			error:function(data)
			{
				$.messager.confirm('确认', "此用户已在其它地方登录，请重新登录？", function(r)
				{
					if (r)
					{
						PageMain.funLogout();
					}
				});
				
				window.clearInterval(PageMain.mOnLineUserInterVal);
    			PageMain.mOnLineUserInterVal = null;
			},
			success:function(data)
			{
				if(data.success)
				{
					$("#oCnt").html(data.msg);
				}
				else
				{
					$.messager.confirm('确认', "此用户已在其它地方登录，请退出系统？", function(r)
					{
						if (r)
						{
							PageMain.funLogout();
						}
					});
					
					window.clearInterval(PageMain.mOnLineUserInterVal);
    				PageMain.mOnLineUserInterVal = null;
				}
			}
		});
	},
	//退出系统
	funLogout : function()
	{
		$.messager.confirm('确认', "你确定要退出系统吗？", function(r)
		{
			if (r)
			{
				window.location.href= _ctx_ + '/a/logout.do';
			}
		});
	},
	/**
	 * 描述信息：datagrid中是否选中
	 * 修改时间：2013-11-14
	 * @author Flower
	 * @param {} _param
	 * @param {} _type
	 * @return {}
	 */
	funGetSelections : function(_param, _type)
	{
		var rows = $(_param).datagrid('getSelections');
		
		if(rows.length > 0)
		{
			if(_type)
			{
				if(rows.length != 1)
				{
					$.messager.alert('信息提示', '请选择且只选择一条记录！','error');
					return null;
				}
				return rows[0];
			}
			return rows;
		}
		else
		{
			$.messager.alert('信息提示', '请从列表中选中一条记录！','error');
			return null;
		}
	},
	/**
	 * 描述信息：combotree中即子节点
	 * 修改时间：2014-04-03
	 * @author WCL
	 * @param {} _paramId
	 * @return {}
	 */
	funGetTreeInfo : function(_paramId)
	{
		var groups = [];
		var node = $(_paramId).tree('getSelected');
		if (node)
		{

			//只取叶子结点
			if($(_paramId).tree('isLeaf', node.target))
			{
				groups.push(node.id);
			}
			var children = $(_paramId).tree('getChildren', node.target);
			for(var i=0; i<children.length; i++)
			{
				//只取叶子结点
				if($(_paramId).tree('isLeaf', children[i].target))
				{
					groups.push(children[i].id);
				}
			}
		} 
		return groups.join(",");
	},
	funInitXheditor : function(paramId)
	{
		$(paramId).xheditor({
			tools:'full',
			skin:'default',
			upMultiple:false,
			//upImgUrl: _ctx_+"/admin/load/fileupload",
			upImgUrl: _ctx_+"/UpLoadServlet",
			upImgExt: "jpg,jpeg,gif,bmp,png",
			onUpload:PageMain.funUploadInfo,
			upFlashUrl: _ctx_+"/UpLoadServlet",
			//upFlashUrl:_ctx_+"/admin/load/fileupload",
			upFlashExt:"swf",
			upMediaUrl: _ctx_+"/UpLoadServlet",
			//upMediaUrl:_ctx_+"/admin/load/fileupload",
			upMediaExt:"wmv,avi,wma,mp3,mid" 
		});
	},
	funUploadInfo : function(msg)
	{
		$("#xh_editor").append(msg);
	},
	funOpenHerfInfo : function(url)
	{
		window.open(url);  
	}
};

