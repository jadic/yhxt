var PageNews = 
{
	mNewsType : 1,	
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
			url: _ctx_ + "/a/news/query.do",
			pageNumber: 1,
			queryParams:
			{
				"name":$("#out01").val()
			},
			columns:[[
				{field:'title',			title:'标题',		width:140,	align:'center'},
				{field:'createTime',	title:'创建时间',		width:140,	align:'center'}
			]],
			onClickRow: function(index, rec) {
				
			},
			toolbar:[{
				text:'新增',
				iconCls:'icon-add',
				handler:function(){
					PageMain.funCreateWinInfo("#div_win", "baseinfo/add_news_info", {param1: "add"});
					PageMain.funInitXheditor("#in04");
				}
			},'-',{
				text:'修改',
				iconCls:'icon-edit',
				handler:function(){
					PageNews.mSelDataGrid = PageMain.funSelectEd("#div_grid");
					if(PageNews.mSelDataGrid != null)
					{
						PageMain.funCreateWinInfo("#div_win", "baseinfo/add_news_info", {param1:"modify"});
						PageNews.funSetDataGrid(PageNews.mSelDataGrid);
					}
				}
			},'-',{
        text:'删除',
        iconCls:'icon-cancel',
        handler:function()
        {
          PageNews.funDelInfo();
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
		$("#in01").val(record.title);
		if (record.icon != null && record.icon != '') {
  		$("#in10").val(record.icon);
  		$("#in02").attr("src", _ctx_+record.icon);
		}
		$("#in04").val(record.content);
		PageMain.funInitXheditor("#in04");
	},
	funSearchInfo : function()
	{
		$("#div_grid").datagrid({
			url: _ctx_ + "/a/news/query.do",
			pageNumber: 1,
			queryParams:
			{
				"title":$("#out01").val()
			}
		});
	},
	funSaveInfo : function(_param)
	{

		if (funIsNull("#in01", "资讯标题") || funIsNull("#in04", "内容"))
		{
			return false;
		}
		
		/**打开进度条**/
		PageMain.funOpenProgress();
		$.ajax({
			url : _ctx_ + "/a/news/"+_param+".do?a="+ Math.random(),
			type : 'post',
			dataType : 'json',
			data : 
			{
				"id"	: $("#in00").val(),	
				"title"	: $("#in01").val(),
				"content"	: $("#in04").val(),
				"icon"	: $("#in10").val()
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
					PageNews.funSearchInfo();
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
		PageNews.mSelDataGrid = PageMain.funSelectEd("#div_grid");
		if(PageNews.mSelDataGrid != null)
		{
			$.messager.confirm('确认', "您确认要删除选中的：【<span style='color:red; font:bold;'>"+PageNews.mSelDataGrid.title+"</span>】这条记录吗？", function(r)
			{
				if (r)
				{
					/**打开进度条**/
					PageMain.funOpenProgress();
					
					$.ajax({
						url : _ctx_ + "/a/news/del.do?a="+ Math.random(),
						type : 'post',
						dataType : 'json',
						data : 
						{
							"id": PageNews.mSelDataGrid.id						
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
								$('#div_grid').datagrid('deleteRow', $('#div_grid').datagrid('getRowIndex', PageNews.mSelDataGrid));
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
			var uploadFile = dwr.util.getValue("in03"); 
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
			    		$("#in10").val(data);
			    		$("#in02").attr("src", _ctx_+data);
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
	PageNews.init();
	PageMain.funCloseProgressInfo();
});