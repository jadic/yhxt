var PageClientMain = 
{
	init : function()
	{
		this.initMenu();
		this.initMenuItem();
		PageMain.funOnLineCnt();
		PageMain.mOnLineUserInterVal = window.setInterval(function(){PageMain.funOnLineCnt();}, 60000);
		$(".njty_menu").eq(0).click();
	},

	/**
	 * 初始化菜单操作
	 */
	initMenu : function()
	{
		$(".njty_menu").each(function(){
			$(this).attr("tag", false);
		});
		
		$(".njty_menu").bind("mouseover", function()
		{
			if($(this).attr("tag") == true || $(this).attr("tag") == "true")
			{
				$(this).removeClass("njty_menu_click");
			}
			$(this).addClass("njty_menu_over");
		});
		$(".njty_menu").bind("mouseout", function()
		{
			$(this).removeClass("njty_menu_over");
			if($(this).attr("tag") == true || $(this).attr("tag") == "true")
			{
				$(this).addClass("njty_menu_click");
			}
		});
		$(".njty_menu").bind("click", function(){
			$(".njty_menu").each(function(){
				if($(this).attr("tag") == true || $(this).attr("tag") == "true")
				{
					$(this).removeClass("njty_menu_click");
					$(this).attr("tag", false);
					return false;
				}
			});
			$(this).attr("tag", true);
			$(this).addClass("njty_menu_click");
		});
	},
	
	/**
	 * 菜单项的显示
	 */
	initMenuItem : function()
	{
		for(var nItem=2; nItem<=9; nItem++)
		{
			var tmp = 400000 + nItem * 10000;
			$('#'+tmp.toString()).menubutton({  
				menu: '#mm'+tmp.toString()  
			});
		}
	}
};


$(function()
{
	PageClientMain.init();
});