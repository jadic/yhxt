var PageDevice = 
{
		mSelDataGrid : null,	
		init : function()
		{
			this.showGrid();
			ComDwr.loadDevType("out01", true, "");
		},
		
		showGrid : function()
		{
			$("#div_grid").datagrid({
				fit:true,
				nowrap: true,
				stripe:true,
				url: _ctx_ + "/a/device/query.do",
				pageNumber: 1,
				queryParams:
				{
					"type":-1,
					"sim":$("#out02").val()
				},
				columns:[[
					{field:'no',			title:'设备编号',		width:140,	align:'center'},
					{field:'typeName',		title:'设备类型',		width:140,	align:'center'},
					{field:'model',			title:'设备型号',		width:140,	align:'center'},
					{field:'sim',			title:'SIM卡号',		width:140,	align:'center'}
				]],
				onClickRow: function(index, rec) {
					
				},
				toolbar:[{
					text:'新增',
					iconCls:'icon-add',
					handler:function(){
						PageMain.funCreateWinInfo("#div_win", "baseinfo/add_device_info", {param1: "add"});
						ComDwr.loadDevType("in01", true, "-1");
					}
				},'-',{
					text:'修改',
					iconCls:'icon-edit',
					handler:function(){
						PageDevice.mSelDataGrid = PageMain.funSelectEd("#div_grid");
						if(PageDevice.mSelDataGrid != null)
						{
							PageMain.funCreateWinInfo("#div_win", "baseinfo/add_device_info", {param1:"modify"});
							PageDevice.funSetDataGrid(PageDevice.mSelDataGrid);
						}
					}
				},'-',{
					text:'删除',
					iconCls:'icon-cancel',
					handler:function()
					{
						PageDevice.funDelInfo();
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
			ComDwr.loadDevType("in01", true, record.type);
			$("#in02").val(record.no);
			$("#in03").val(record.model);
			$("#in04").val(record.sim);
		},
		funSearchInfo : function()
		{
			$("#div_grid").datagrid({
				url: _ctx_ + "/a/device/query.do",
				pageNumber: 1,
				queryParams:
				{
					"type":$("#out01").val(),
					"sim":$("#out02").val()
				}
			});
		},
		funSaveInfo : function(_param)
		{

			if (funIsSelect("#in01", "设备类型")
					|| funIsNull("#in02", "设备编号")
					|| funIsNull("#in03", "设备型号")
					|| funIsNull("#in04", "SIM卡号"))
			{
				return false;
			}
			
			/**打开进度条**/
			PageMain.funOpenProgress();
			$.ajax({
				url : _ctx_ + "/a/device/"+_param+".do?a="+ Math.random(),
				type : 'post',
				dataType : 'json',
				data : 
				{
					"id"	: $("#in00").val(),	
					"type"	: $("#in01").val(),
					"no"	: $("#in02").val(),
					"model"	: $("#in03").val(),
					"sim"	: $("#in04").val()
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
						PageDevice.funSearchInfo();
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
			PageDevice.mSelDataGrid = PageMain.funSelectEd("#div_grid");
			if(PageDevice.mSelDataGrid != null)
			{
				$.messager.confirm('确认', "您确认要删除选中的：【<span style='color:red; font:bold;'>"+PageDevice.mSelDataGrid.name+"</span>】这条记录吗？", function(r)
				{
					if (r)
					{
						/**打开进度条**/
						PageMain.funOpenProgress();
						
						$.ajax({
							url : _ctx_ + "/a/device/del.do?a="+ Math.random(),
							type : 'post',
							dataType : 'json',
							data : 
							{
								"id": PageDevice.mSelDataGrid.id						
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
									$('#div_grid').datagrid('deleteRow', $('#div_grid').datagrid('getRowIndex', PageDevice.mSelDataGrid));
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
	PageDevice.init();
	PageMain.funCloseProgressInfo();
});