var PageActivity = 
{
	mActivityType : 1,	
	mSelDataGrid : null,	
	init : function()
	{
		this.showGrid();
	},
	
	showGrid : function()
	{
		$("#div_grid").datagrid({
			fit:true,
			nowrap: true,
			stripe:true,
			url: _ctx_ + "/a/activity/query.do",
			pageNumber: 1,
			queryParams:
			{
				"type":PageActivity.mActivityType,
				"name":$("#out01").val()
			},
			columns:[[
				{field:'name',			title:'活动名称',		width:140,	align:'center'},
				{field:'type',			title:'活动类型',		width:140,	align:'center',
					formatter: function(value,row,index)
					{
						switch(parseInt(value))
						{
							case 1:
								return "平台创建";
							case 2:
								return "医护联系人创建";
							case 3:
								return "第三方服务创建";
							default :
								return "-";
						}
					}
				},
				{field:'sdate',			title:'开始时间',		width:140,	align:'center'},
				{field:'edate',			title:'结束时间',		width:140,	align:'center'},
				{field:'createTime',	title:'创建时间',		width:140,	align:'center'},
				{field:'userName',		title:'创建者',		width:140,	align:'center'}
			]],
			onClickRow: function(index, rec) {
				
			},
			toolbar:[{
				text:'新增',
				iconCls:'icon-add',
				handler:function(){
					PageMain.funCreateWinInfo("#div_win", "baseinfo/add_activity_info", {param1: "add"});
					PageMain.funInitXheditor("#in06");
				}
			},'-',{
				text:'修改',
				iconCls:'icon-edit',
				handler:function(){
					PageActivity.mSelDataGrid = PageMain.funSelectEd("#div_grid");
					if(PageActivity.mSelDataGrid != null)
					{
						PageMain.funCreateWinInfo("#div_win", "baseinfo/add_activity_info", {param1:"modify"});
						PageActivity.funSetDataGrid(PageActivity.mSelDataGrid);
					}
				}
			},'-',{
				text:'删除',
				iconCls:'icon-cancel',
				handler:function()
				{
				  PageActivity.funDelInfo();
				}
			}],
			pagination:true,
			singleSelect:true,
			rownumbers: true
		});
	},
	funSetDataGrid : function(record)
	{
		$("#in00").val(record.id);
		$("#in01").val(record.name);
		$("#in02").val(record.sdate);
		$("#in03").val(record.edate);
		$("#in04").val(record.memo);
		$("#in06").val(record.content);
		$("#in07").val(record.icon);
		$("#in08").attr("src", _ctx_+record.icon);
		$("#in09").val(record.type);
		PageMain.funInitXheditor("#in06");
	},
	funSearchInfo : function()
	{
		$("#div_grid").datagrid({
			url: _ctx_ + "/a/activity/query.do",
			pageNumber: 1,
			queryParams:
			{
				"type":PageActivity.mActivityType,
				"name":$("#out01").val()
			}
		});
	},
	funSaveInfo : function(_param)
	{

		if (funIsNull("#in01", "活动名称")
				|| funIsNull("#in02", "开始时间")
				|| funIsNull("#in03", "结束时间")
				|| funIsSDateAfterEDate("#in02", "#in03", "开始时间", "结束时间")
				|| funMaxLen("#in04", "备注")
				|| funIsNull("#in06", "内容"))
		{
			return false;
		}
		
		/**打开进度条**/
		PageMain.funOpenProgress();
		$.ajax({
			url : _ctx_ + "/a/activity/"+_param+".do?a="+ Math.random(),
			type : 'post',
			dataType : 'json',
			data : 
			{
				"id"	: $("#in00").val(),	
				"name"	: $("#in01").val(),
				"sdate"	: $("#in02").val(),
				"edate"	: $("#in03").val(),
				"memo"	: $("#in04").val(),
				"content"	: $("#in06").val(),
				"icon"	: $("#in07").val(),
				"type"	: PageActivity.mActivityType
			},
			error:function(data)
			{
				/**关闭进度条**/
				PageMain.funCloseProgress();
				$.messager.alert('信息提示', '操作失败：提交超时或此方法不存在！', 'error');
			},
			success:function(data)
			{
				
				/**关闭进度条**/
				PageMain.funCloseProgress();
				
				/**数据处理**/
				if(data.success)
				{
					$("#out01").val($("#in01").val());
					$('#div_win').window('close');
					PageActivity.funSearchInfo();
					$.messager.alert('信息提示', data.msg, 'info');
				}
				else
				{
					$.messager.alert('信息提示', data.msg, 'error');
				}
			}
		});
	},
	funDelInfo : function()
	{
	    PageActivity.mSelDataGrid = PageMain.funSelectEd("#div_grid");
		if(PageActivity.mSelDataGrid != null)
		{
			$.messager.confirm('确认', "您确认要删除选中的：【<span style='color:red; font:bold;'>"+PageActivity.mSelDataGrid.name+"</span>】这条记录吗？", function(r)
			{
				if (r)
				{
					/**打开进度条**/
					PageMain.funOpenProgress();
					
					$.ajax({
						url : _ctx_ + "/a/activity/del.do?a="+ Math.random(),
						type : 'post',
						dataType : 'json',
						data : 
						{
							"id": PageActivity.mSelDataGrid.id						
						},
						error:function(data)
						{
							/**关闭进度条**/
							PageMain.funCloseProgress();
							$.messager.alert('信息提示', '操作失败：提交超时或此方法不存在！', 'error');
						},
						success:function(data)
						{
							/**关闭进度条**/
							PageMain.funCloseProgress();
							
							/**数据处理**/
							if(data.success)
							{
								$('#div_grid').datagrid('deleteRow', $('#div_grid').datagrid('getRowIndex', PageActivity.mSelDataGrid));
								$.messager.alert('信息提示', data.msg, 'info');
							}
							else
							{
								$.messager.alert('信息提示', data.msg, 'error');
							}
						}
					});
				}
			});
		}
	
	},
	funUploadFileInfo : function()
	{
		try
		{
			var uploadFile = dwr.util.getValue("in05"); 
		    var filenames = uploadFile.value.split("\\"); 
		    if(filenames.length <= 1)
		    {
		    	filenames = uploadFile.value.split("/"); 
		    }	
		    var filename = filenames[filenames.length-1].toLowerCase(); 
		    var fileType = filename.substring(filename.indexOf("."));
		    if(fileType == ".jpg" || fileType == ".bmp" || fileType == ".png" || fileType == ".gif")
		    {
			    loadDwr.uploadFileInfo(uploadFile, filename, {"callback":function(data){
			    	if(data == 1 || data == "1")
			    	{
			    		$.messager.alert("提示", "图片上传失败", "error");
			    		$("#showtitle").val("图片上传在功！");
			    	}
			    	else
			    	{
			    		$("#showtitle").val("图片上传在功！");
			    		$("#in07").val(data);
			    		$("#in08").attr("src", _ctx_+data);
			    	}	
				}});  
		    }
		    else
		    {
		    	$.messager.alert("提示", "上传的照片类型应当为jpg/bmp/png/gif！", "error");
		    }
		}catch(e)
		{
		}
	}
};

$(function()
{
	PageActivity.init();
	PageMain.funCloseProgressInfo();
});