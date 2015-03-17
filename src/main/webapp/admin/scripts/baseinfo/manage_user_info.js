var PageUser = 
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
			url: _ctx_ + "/a/user/query.do",
			pageNumber: 1,
			queryParams:
			{
				"userName":$("#out01").val()
			},
			columns:[[
				{field:'userName',			title:'登录帐号',		width:140,	align:'left'},
				{field:'userPwd',			title:'登录密码',		width:140,	align:'left'},
				{field:'realName',			title:'用户名称',		width:140,	align:'left'},
				{field:'userTel',			title:'联系电话',		width:140,	align:'left'},
				{field:'userMemo',			title:'备注',		    width:200,	align:'left'}
			]],
			onClickRow: function(index, rec) {
				
			},
			toolbar:[{
				text:'新增',
				iconCls:'icon-add',
				handler:function(){
					PageMain.funCreateWinInfo("#div_win", "baseinfo/add_user_info", {param1: "add"});
				}
			},'-',{
				text:'修改',
				iconCls:'icon-edit',
				handler:function(){
					PageUser.mSelDataGrid = PageMain.funSelectEd("#div_grid");
					if(PageUser.mSelDataGrid != null)
					{
						PageMain.funCreateWinInfo("#div_win", "baseinfo/add_user_info", {param1:"modify"});
						PageUser.funSetDataGrid(PageUser.mSelDataGrid);
					}
				}
			},'-',{
				text:'删除',
				iconCls:'icon-cancel',
				handler:function()
				{
					PageUser.funDelInfo();
				}
			}],
			pagination:true,
			singleSelect:true,
			rownumbers: true
		});
	},
	funSetDataGrid : function(record)
	{
		$("#in00").val(record.userId);
		$("#in01").val(record.userName);
		$("#in02").val(record.userPwd);
		$("#in03").val(record.realName);
		$("#in04").val(record.userTel);
		$("#in05").val(record.userMemo);
	},
	funSearchInfo : function()
	{
		$("#div_grid").datagrid({
			url: _ctx_ + "/a/user/query.do",
			pageNumber: 1,
			queryParams:
			{
				"userName":$("#out01").val()
			}
		});
	},
	funSaveInfo : function(_param)
	{

		if (funIsNull("#in01", "登录帐号") 
			|| funIsNull("#in02", "登录密码") 
			|| funIsNull("#in03", "用户姓名") 
			|| funIsNull("#in04", "联系电话") 
			|| funMaxLen("#in05", "备注"))
		{
			return false;
		}
		
		/**打开进度条**/
		PageMain.funOpenProgress();
		$.ajax({
			url : _ctx_ + "/a/user/"+_param+".do?a="+ Math.random(),
			type : 'post',
			dataType : 'json',
			data : 
			{
				"userId": $("#in00").val(),	
				"userName": $("#in01").val(),
				"userPwd": $("#in02").val(),
				"realName": $("#in03").val(),
				"userTel": $("#in04").val(),
				"userMemo": $("#in05").val()
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
					PageUser.funSearchInfo();
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
		PageUser.mSelDataGrid = PageMain.funSelectEd("#div_grid");
		if(PageUser.mSelDataGrid != null)
		{
			$.messager.confirm('确认', "您确认要删除选中的：【<span style='color:red; font:bold;'>"+PageUser.mSelDataGrid.userName+"</span>】这条记录吗？", function(r)
			{
				if (r)
				{
					/**打开进度条**/
					PageMain.funOpenProgress();
					
					$.ajax({
						url : _ctx_ + "/a/user/del?a="+ Math.random(),
						type : 'post',
						dataType : 'json',
						data : 
						{
							"userId": PageUser.mSelDataGrid.userId						
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
								$('#div_grid').datagrid('deleteRow', $('#div_grid').datagrid('getRowIndex', PageUser.mSelDataGrid));
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
	PageUser.init();
	PageMain.funCloseProgressInfo();
});
