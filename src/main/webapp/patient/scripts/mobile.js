var PageMobile = {
	init : function()
	{
		$("#footer div").bind("click", function(){
			var url = "";
			switch (parseInt($(this).attr("data-index"), 10))
			{
				case 0:
					url = _ctx_ + "/p/query/home.do"
					break;
				case 1:
					url = _ctx_ + "/p/search.do"
					break;	
				case 2:
					url = _ctx_ + "/p/my.do"
					break;	
				case 3:
					url = _ctx_ + "/p/my.do"
					break;		
				default:
					break;
			}
			window.location.href = url
		});
	}
};

$(function(){
	PageMobile.init();
});