<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/patient/common/taglibs-include.jsp" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <base href="<%=basePath%>">
    <title>自已人健康服务中心 </title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">  
	<meta name="viewport" content="width=device-width,height=device-height,initial-scale=1.0,maximum-scale=1.0,user-scalable=no">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0"> 
    <%@ include file="/WEB-INF/patient/common/mobile-include.jsp"%>
    <style>
    	.item_wcl{}
    	input, select,textarea{border:1px solid #ccc; height: 35px; width: 85%; padding-left: 10px;}
    	.circle { 
			width: 65px; 
			height: 65px; 
			border:1px solid #ddd;
			background-color: #fff; 
			text-align:center;
			line-height:60px;
			color:red;
			font-size:18px;
			font-weight:bold;
			-webkit-border-radius: 65px; 
			position: relative;
		} 
		.circle img{width: 65px;  height: 65px;  border-radius:65px}
    </style>
	<script type="text/JavaScript">
	$(function(){
		PageOper.funSearch();
	});
	var PageOper = {
		page:1,
		sumPage:1,
		funSearch : function()
		{
			PageMobile.funLoadIng();
			$.ajax({
				url : "<c:url value='/app/happyHost.do'/>?a=" + Math.random(),
				type : 'post',
				dataType : 'json',
				data : 
				{
					"page"       : PageOper.page						
				},
				error:function(data)
				{
					PageMobile.funLoadHidden();
				},
				success:function(data)
				{
					PageMobile.funLoadHidden();
					if(PageOper.sumPage >= data.sumPage)
					{
						$(".list-more").hide();
					}
					else
					{
						PageOper.sumPage = data.sumPage;
						$(".list-more").show();
					}	
					if(data.success)
					{
						var row = null;
						var tmpPhoto = _ctx_ + "/patient/themes/images/mobile/user_photo.png";
						for(var nItem=0; nItem<data.rows.length; nItem++)
						{
							row = data.rows[nItem];
							tmpPhoto = _ctx_ + "/patient/themes/images/mobile/user_photo.png";
							if(row.url != "" && row.url != null && row.url != "null")
							{
								tmpPhoto = _ctx_ + "/" + row.url;
							}	
							$('<li class="activeable list-item item_wcl" style="display:-webkit-box; display:-moz-box; cursor:pointer;" onclick="PageOper.funGotoInfo('+row.id+',\''+row.title+'\')">'+
								'<div style="width: 80px; -webkit-box-sizing:border-box; -moz-box-sizing:border-box; -webkit-box-ordinal-group:2;-moz-box-ordinal-group:2;">'+
					               '<div class="circle">'+
					               		'<img src="'+tmpPhoto+'" style="border: 0px;">'+
					               '</div>'+
					             '</div>'+
								'<div style="-webkit-box-flex:1; -moz-box-flex:1;vertical-align:middle;  -webkit-box-ordinal-group:2;-moz-box-ordinal-group:2;">'+
									'<table border="0" cellspacing="0" cellpadding="0" style="width:100%; height:100%; min-height:70px;">'+
										'<tr><td style="font-size:16px; font-weight:bold; font-size:18px;">'+row.title+'</td></tr>'+
										'<tr><td style="height:18px;"><p class="item-time">'+row.content+'</p></td></tr>'+
									'</table>'+
				                '</div>'+
				                '<div style="width: 80px; line-height:70px; -webkit-box-sizing:border-box; -moz-box-sizing:border-box; -webkit-box-ordinal-group:2;-moz-box-ordinal-group:2;">'+
				                '<div class="item-next" style="margin-top:30px; float:right;"></div>'+
				                '<div style="float:left; font-size:18px;">'+row.cnt+'话题</div>'+
				                '</div>'+
					       '</li>').insertBefore(".list-more");	
						}	
					}
				}
			});
		},
		funGotoInfo: function(id, title)
		{
			PageMobile.funLoadIng();
			window.location.href = "<c:url value='/p/query/toNext.do'/>?id="+id + "&name="+title
		},
		funLoadMore: function()
		{
			if(PageOper.page < PageOper.sumPage)
			{
				PageOper.page += 1;
				PageOper.funSearch()
			}
		}
	};
	</script>
  </head>
<body>
	<header id="header">
  		驿站
  	</header>
  	<div id="content">
		<ul class="list">
	        <li class="activeable list-more" style="display: none;" onclick="PageOper.funLoadMore()">加载更多</li>
        </ul>
	</div>	
	<footer id="footer">
		<footer id="footer">
		<jsp:include page="/WEB-INF/patient/common/footer-include.jsp">
			<jsp:param value="2" name="selected"/>
		</jsp:include>
	</footer>	
</body>
</html>
