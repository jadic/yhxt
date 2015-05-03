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
				url: _ctx_ + "/a/foodItem/query.do",
				pageNumber: 1,
				queryParams:
				{
					"name":$("#out01").val()
				},
				columns:[[
					{field:'id',			              title:'食品编号',		width:200,	align:'center', hidden: "true"},
					{field:'foodName',			        title:'食品名称',		width:200,	align:'center'},
					{field:'caloriePerHundredGram',	title:'每百克卡路里',		width:200,	align:'center'},
					{field:'foodType',	            title:'食品类型编号',		width:200,	align:'center', hidden: "true"},
					{field:'foodTypeName',	        title:'食品类型',		width:200,	align:'center'}
				]],
				onClickRow: function(index, rec) {
					
				},
				toolbar:[{
					text:'新增',
					iconCls:'icon-add',
					handler:function(){
						PageMain.funCreateWinInfo("#div_win", "dictinfo/add_foodItem_info", {param1: "add"});
					}
				},'-',{
					text:'修改',
					iconCls:'icon-edit',
					handler:function(){
						PageSportItem.mSelDataGrid = PageMain.funSelectEd("#div_grid");
						if(PageSportItem.mSelDataGrid != null)
						{
							PageMain.funCreateWinInfo("#div_win", "dictinfo/add_foodItem_info", {param1:"modify"});
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
			$("#in01").textbox("setValue",record.foodName);
			$("#in02").textbox("setValue",record.caloriePerHundredGram);
			$("#in03").combobox("setValue", record.foodType);
		},
		funSearchInfo : function()
		{
			$("#div_grid").datagrid({
				url: _ctx_ + "/a/foodItem/query.do",
				pageNumber: 1,
				queryParams:
				{
					"foodName":$("#out01").val()
				}
			});
		},
		funSaveInfo : function(_param)
		{
			if (funIsNull("#in01", "食品名称") || funIsNull("#in02", "每百克卡路里"))	{
				return false;
			}
			
			if ($("#in03").combobox("getText") == '') {
			  $.messager.alert('信息提示', '请选择食品类型！','error');
			  return false;
			}
			
			/**打开进度条**/
			PageMain.funOpenProgress();
			$.ajax({
				url : _ctx_ + "/a/foodItem/"+_param+".do?a="+ Math.random(),
				type : 'post',
				dataType : 'json',
				data : 
				{
					"id": $("#in00").val(),	
					"foodName": $("#in01").val(),
					"caloriePerHundredGram": $("#in02").val(),
					"foodType": $("#in03").combobox("getValue")
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
				$.messager.confirm('确认', "您确认要删除选中的：【<span style='color:red; font:bold;'>"+PageSportItem.mSelDataGrid.foodName+"</span>】这条记录吗？", function(r)
				{
					if (r)
					{
						/**打开进度条**/
						PageMain.funOpenProgress();
						
						$.ajax({
							url : _ctx_ + "/a/foodItem/del.do?a="+ Math.random(),
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
		
		}
			
};

$(function()
{
	PageSportItem.init();
	PageMain.funCloseProgressInfo();
});