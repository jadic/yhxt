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
				//url: _ctx_ + "/a/query/queryFeedback.do",
				pageNumber: 1,
				queryParams:
				{
					"name":$("#out01").val()
				},
				columns:[[
					{field:'id',       title:'运动编号',		width:200,	align:'center', hidden: "true"},
					{field:'type',     title:'类型',		    width:50,	  align:'center'},
					{field:'userName', title:'反馈人',		  width:100,	align:'center'},
					{field:'stime',	   title:'反馈时间',		width:200,	align:'center'},
					{field:'content',	 title:'反馈内容',		width:300,	align:'center'}
				]],
				pagination:true,
				singleSelect:true,
				rownumbers: true
			});
		},
		funSearchInfo : function()
		{
			$("#div_grid").datagrid({
				//url: _ctx_ + "/a/query/queryFeedback.do",
				pageNumber: 1,
				queryParams:
				{
					"sportName":$("#out01").val()
				}
			});
		}
};

$(function()
{
	PageSportItem.init();
	PageMain.funCloseProgressInfo();
});