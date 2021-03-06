var PageSportItem = 
{
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
				url: _ctx_ + "/a/sportItem/query.do",
				pageNumber: 1,
				queryParams:
				{
					"name":$("#out01").val()
				},
				columns:[[
					{field:'id',			           title:'运动编号',		width:200,	align:'center', hidden: "true"},
					{field:'sportName',			     title:'运动名称',		width:200,	align:'center'},
					{field:'caloriePerMinute',	 title:'每分钟消耗卡路里',		width:200,	align:'center'},
					{field:'sportTypeName',			 title:'运动类型',		width:200,	align:'center'}
				]],
				onClickRow: function(index, rec) {
					
				},
				toolbar:[{
					text:'新增',
					iconCls:'icon-add',
					handler:function(){
						PageMain.funCreateWinInfo("#div_win", "dictinfo/add_sportItem_info", {param1: "add"});
					}
				},'-',{
					text:'修改',
					iconCls:'icon-edit',
					handler:function(){
						PageSportItem.mSelDataGrid = PageMain.funSelectEd("#div_grid");
						if(PageSportItem.mSelDataGrid != null)
						{
							PageMain.funCreateWinInfo("#div_win", "dictinfo/add_sportItem_info", {param1:"modify"});
							PageSportItem.funSetDataGrid(PageSportItem.mSelDataGrid);
						}
					}
				},'-',{
					text:'删除',
					iconCls:'icon-cancel',
					handler:function()
					{
						PageSportItem.funDelInfo();
					}
				}],
				pagination:true,
				singleSelect:true,
				rownumbers: true
			});
		},
		funSetDataGrid : function(record)
		{
		  console.dir(record);
			$("#in00").val(record.id);
			$("#in01").textbox("setValue",record.sportName);
			$("#in02").textbox("setValue",record.caloriePerMinute);
	    $("#in03").combobox("setValue", record.sportType);
	    if (record.sportIcon != null && record.sportIcon != '') {
	      $("#in04").attr("src", _ctx_+record.sportIcon);
	      $("#in10").val(record.sportIcon);
	    }			
		},
		funSearchInfo : function()
		{
			$("#div_grid").datagrid({
				url: _ctx_ + "/a/sportItem/query.do",
				pageNumber: 1,
				queryParams:
				{
					"sportName":$("#out01").val()
				}
			});
		},
		funSaveInfo : function(_param)
		{

			if (funIsNull("#in01", "运动名称") || funIsNull("#in02", "每分钟消耗的卡路里"))
			{
				return false;
			}
			
			/**打开进度条**/
			PageMain.funOpenProgress();
			$.ajax({
				url : _ctx_ + "/a/sportItem/"+_param+".do?a="+ Math.random(),
				type : 'post',
				dataType : 'json',
				data : 
				{
					"id": $("#in00").val(),	
					"sportName": $("#in01").val(),
					"caloriePerMinute": $("#in02").val(),
	        "sportType" : $("#in03").combobox("getValue"),
	        "sportIcon" : $("#in10").val()
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
						PageSportItem.funSearchInfo();
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
			PageSportItem.mSelDataGrid = PageMain.funSelectEd("#div_grid");
			if(PageSportItem.mSelDataGrid != null)
			{
				$.messager.confirm('确认', "您确认要删除选中的：【<span style='color:red; font:bold;'>"+PageSportItem.mSelDataGrid.sportName+"</span>】这条记录吗？", function(r)
				{
					if (r)
					{
						/**打开进度条**/
						PageMain.funOpenProgress();
						
						$.ajax({
							url : _ctx_ + "/a/sportItem/del.do?a="+ Math.random(),
							type : 'post',
							dataType : 'json',
							data : 
							{
								"id": PageSportItem.mSelDataGrid.id						
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
									$('#div_grid').datagrid('deleteRow', $('#div_grid').datagrid('getRowIndex', PageSportItem.mSelDataGrid));
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
		funUploadFileInfo : function() {
	    try {
	      console.dir("before get upload");
	      var uploadFile = dwr.util.getValue("in05");
	      console.dir("after get upload");
	      var filenames = uploadFile.value.split("\\");
	      if (filenames.length <= 1) {
	        filenames = uploadFile.value.split("/");
	      }
	      var filename = filenames[filenames.length - 1].toLowerCase();
	      var fileType = filename.substring(filename.indexOf("."));
	      if (fileType == ".jpg" || fileType == ".bmp" || fileType == ".png"
	          || fileType == ".gif") {
	        loadDwr.uploadFileInfo(uploadFile, filename, {
	          "callback" : function(data) {
	            console.dir("data:" + data);
	            if (data == 1 || data == "1") {
	              $.messager.alert("提示", "图片上传失败", "error");
	            } else {
	              $("#in04").attr("src", _ctx_ + data);
	              $("#in10").val(data);
	            }
	          }
	        });
	      } else {
	        $.messager.alert("提示", "上传的照片类型应当为jpg/bmp/png/gif！", "error");
	      }
	    } catch (e) {
	    }
	  } 		
			
};

$(function()
{
	PageSportItem.init();
	PageMain.funCloseProgressInfo();
});