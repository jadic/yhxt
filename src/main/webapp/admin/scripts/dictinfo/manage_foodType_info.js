var PageFoodType = 
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
				url: _ctx_ + "/a/foodType/query.do",
				pageNumber: 1,
				queryParams:
				{
					"name":$("#out01").val()
				},
				columns:[[
					{field:'id',			title:'食品类型编号',		width:200,	align:'center', hidden: "true"},
					{field:'name',			title:'食品类型名称',		width:200,	align:'center'}
				]],
				onClickRow: function(index, rec) {
					
				},
				toolbar:[{
					text:'新增',
					iconCls:'icon-add',
					handler:function(){
						PageMain.funCreateWinInfo("#div_win", "dictinfo/add_foodType_info", {param1: "add"});
					}
				},'-',{
					text:'修改',
					iconCls:'icon-edit',
					handler:function(){
						PageFoodType.mSelDataGrid = PageMain.funSelectEd("#div_grid");
						if(PageFoodType.mSelDataGrid != null)
						{
							PageMain.funCreateWinInfo("#div_win", "dictinfo/add_foodType_info", {param1:"modify"});
							PageFoodType.funSetDataGrid(PageFoodType.mSelDataGrid);
						}
					}
				},'-',{
					text:'删除',
					iconCls:'icon-cancel',
					handler:function()
					{
						PageFoodType.funDelInfo();
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
		},
		funSearchInfo : function()
		{
			$("#div_grid").datagrid({
				url: _ctx_ + "/a/foodType/query.do",
				pageNumber: 1,
				queryParams:
				{
					"name":$("#out01").val()
				}
			});
		},
		funSaveInfo : function(_param)
		{

			if (funIsNull("#in01", "食品类型"))
			{
				return false;
			}
			
			/**打开进度条**/
			PageMain.funOpenProgress();
			$.ajax({
				url : _ctx_ + "/a/foodType/"+_param+".do?a="+ Math.random(),
				type : 'post',
				dataType : 'json',
				data : 
				{
					"id": $("#in00").val(),	
					"name": $("#in01").val()
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
						PageFoodType.funSearchInfo();
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
			PageFoodType.mSelDataGrid = PageMain.funSelectEd("#div_grid");
			if(PageFoodType.mSelDataGrid != null)
			{
				$.messager.confirm('确认', "您确认要删除选中的：【<span style='color:red; font:bold;'>"+PageFoodType.mSelDataGrid.name+"</span>】这条记录吗？", function(r)
				{
					if (r)
					{
						/**打开进度条**/
						PageMain.funOpenProgress();
						
						$.ajax({
							url : _ctx_ + "/a/foodType/del.do?a="+ Math.random(),
							type : 'post',
							dataType : 'json',
							data : 
							{
								"id": PageFoodType.mSelDataGrid.id						
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
									$('#div_grid').datagrid('deleteRow', $('#div_grid').datagrid('getRowIndex', PageFoodType.mSelDataGrid));
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
		
		}
			
};

$(function()
{
	PageFoodType.init();
	PageMain.funCloseProgressInfo();
});