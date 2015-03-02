var PageOnLine = 
{
	init : function()
	{
		this.showGrid();
	},
	showGrid : function()
	{

		$('#div_grid').datagrid({
			nowrap: true,
			striped: true,
			fitColumns: true,
			url:_ctx_ + "/a/onlineuser.do?a="+ Math.random(),
			fit: true,
			columns:[[
                {title:'登录名称',		field:'a',	width:300,	sortable:false},
                {title:'登录时间',		field:'b',	width:300,	sortable:false},
                {title:'登录IP',		field:'c',	width:300,	sortable:false},
                {title:'描述',		field:'a1',	width:300,	sortable:false,
                	formatter : function(value, rec)
                	{
	                	if(value == 1)
	                	{
	                		return "<span style='color:red;'>当前登录用户</span>";
	                	}
	                	return "";
	                }
                }
			]],
			rowStyler:function(index,row,css)
			{
				if (row.a1 == 1)
				{
					return 'background-color:#6293BB;color:#fff;font-weight:bold;';
				}
			},
			singleSelect:true,
			rownumbers:true
		});
	}
};

$(function()
{
	PageOnLine.init();
	PageMain.funCloseParentProgressInfo();
});
