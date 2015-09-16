var PageMobile = {
	init : function()
	{
		$("#footer div").bind("click", function(){
			var url = "";
			PageMobile.funLoadIng();
			switch (parseInt($(this).attr("data-index"), 10))
			{
				case 0:
					url = _ctx_ + "/p/query/home.do";
					break;
				case 1:
					url = _ctx_ + "/p/search.do";
					break;	
				case 2:
					url = _ctx_ + "/p/query/post.do";
					//url = _ctx_ + "/patient/index.jsp?operType=1&userId="+_usxro_;
					break;	
				case 3:
					url = _ctx_ + "/p/my.do";
					break;		
				default:
					break;
			}
			window.location.href = url
		});
	},
	funLoadIng : function()
	{
		if($("#loading").length > 0)
		{
			
		}	
		else
		{
			$("body").append('<div id="loading" style="background: #000; z-index: 9002; display:none; position: absolute; top:0px; opacity: 0.6; filter: alpha(opacity=60);">'+
					'<div class="loading" style="margin-left: 45%; margin-top: 50%;"></div>'+
					'</div>');
		}
		$("#loading").show();
		$("#loading").css({"height": $(document).height(), "width":$(document).width()});
	},
	funLoadHidden: function()
	{
		//$("#loading").length
		$("#loading").hide();
	}
};

$(function(){
	PageMobile.init();
});