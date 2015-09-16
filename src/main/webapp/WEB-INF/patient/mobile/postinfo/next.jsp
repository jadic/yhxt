<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/patient/common/taglibs-include.jsp" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
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
		PageOper.funSearch("<c:url value='/app/happyHostPost.do'/>", {
	    	"happyHostId" : "${query.id}",  
	        "page" : PageOper.leftPage,
	      }, "#aa");
		PageOper.funSearch("<c:url value='/app/happyHostZrPost.do'/>", {
	    	"happyHostId" : "${query.id}",  
	        "page" : PageOper.rightPage,
	      }, "#bb");
	
		$("#show1").bind("click", function(){
			$("#show2").css({"border-bottom":"3px solid #e7e7e7", "color":"#000"});
			$("#show1").css({"border-bottom":"3px solid #95b200", "color":"#95b200"});
			$("#aa").show();
			$("#bb").hide();
		})
		$("#show2").bind("click", function(){
			$("#show1").css({"border-bottom":"3px solid #e7e7e7", "color":"#000"});
			$("#show2").css({"border-bottom":"3px solid #95b200", "color":"#95b200"});
			$("#aa").hide();
			$("#bb").show();
		})
		$("#show1").click();
	});
	var PageOper = {
		leftPage:1,
		leftSumPage:1,
		rightPage:1,
		rightSumPage:1,
		funSearch : function(paramUrl, paramObj, paramId)
		{
			PageMobile.funLoadIng();
			$.ajax({
				url : paramUrl,
				type : 'post',
				dataType : 'json',
				data : paramObj,
				error:function(data)
				{
					PageMobile.funLoadHidden();
				},
				success:function(data)
				{
					PageMobile.funLoadHidden();
					if(paramId == "#aa")
			    	{
						if(PageOper.leftPage >= data.sumPage)
						{
							$("#aa .list-more").hide();
						}
						else
						{
							PageOper.leftSumPage = data.sumPage;
							$("#aa .list-more").show();
						}	
			    	}	 
			    	else if (paramId == "#bb") 
			    	{
			    		if(PageOper.rightPage >= data.sumPage)
						{
							$("#bb .list-more").hide();
						}
						else
						{
							PageOper.rightSumPage = data.sumPage;
							$("#bb .list-more").show();
						}	
					}
					if(data.success)
					{
						var row = null;
						for(var nItem=0; nItem<data.rows.length; nItem++)
						{
							row = data.rows[nItem];
							var tmp = '<li class="activeable list-item item_wcl">' +
								'<a  href="javascript:void(0)" onclick="PageOper.funDetailInfo('+row.id+')"  style="background: #fff; height: 55px; padding: 5px;">' +
									'<div style="font-size: 18px; font-weight: normal; padding-left: 25px; line-height: 20px; height: 20px; padding-bottom: 4px; color:#000;">'+row.title+'</div>' +
									'<table cellspacing="0" cellpadding="0" style="width: 100%; font-size: 16px; font-weight: normal; height: 24px;">' +
										'<tr>' +
											'<td style="width: 25px;"><img src="<c:url value="/'+row.photo+'"/>" style="width: 20px; height: 20px;"></td>' +
											'<td style="color: #95b200; width:40%; padding-left:5px;">'+row.userName+'</td>' +
											'<td style="color: #878887;  width:40%;">'+row.stime+'</td>' +
											'<td style="color: #878887;  min-width:30px;" align="right">'+row.laudCnt+'</td>' +
											'<td style="color: #878887;  width: 20px;" align="left"><img src="<c:url value='/app/self/images/bbs_good.png'/>" style="width: 16px; height: 16px;"></td>' +
											'<td style="color: #878887;  min-width:30px;" align="right">'+row.replyCnt+'</td>' +
											'<td style="color: #878887;  min-width: 50px;" align="left"><img src="<c:url value='/app/self/images/bbs_reply.png'/>" style="width: 16px; height: 16px;"></td>' +
											'<td style="width:20px; max-width:20px;"><div class="item-next"></div></td>'
										'</tr>' +
									'</table>' +
								'</a>' +
							'</li>';
							$(tmp).insertBefore(paramId + " .list-more");	
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
		funDetailInfo : function(id)
		{
			PageMobile.funLoadIng();
			window.location.href = "<c:url value='/p/query/toDetail.do'/>?id=${query.id}&name=${query.name}&postId=" + id
		},
		funLoadMore: function(paramId)
		{
			if (paramId == 1)
			{
				if(PageOper.leftPage < PageOper.leftSumPage)
				{
					PageOper.leftPage += 1;
					PageOper.funSearch("<c:url value='/app/happyHostPost.do'/>", {
				    	"happyHostId" : "${query.id}",  
				        "page" : PageOper.leftPage,
				      }, "#aa");
				}
			}
			else
			{
				if(PageOper.rightPage < PageOper.rightSumPage)
				{
					PageOper.rightPage += 1;
					PageOper.funSearch("<c:url value='/app/happyHostZrPost.do'/>", {
				    	"happyHostId" : "${query.id}",  
				        "page" : PageOper.rightPage,
				      }, "#bb");
				}
			}	
		},
		funToAdd : function()
		{
			PageMobile.funLoadIng();
			window.location.href='<c:url value='/p/query/toAdd.do'/>?id=${query.id}&name=${query.name}'
		}
	};
	</script>
  </head>
<body>
	<header id="header">
  		${query.name}
  		<div class="left"><a href="<c:url value='/p/query/post.do'/>" onclick="PageMobile.funLoadIng();"><span class="corner"></span></a></div>
  		<div class="right"><a href="javascript:void(0)" onclick="PageOper.funToAdd()"><span class="cornerAdd"></span></a></div>
  	</header>
  	<div id="content">
  		<div style="position: relative; width:100%;  background: #f6f6f6;">
			<div id="show1" style="width:50%; background: #f6f6f6; border-bottom:3px solid #95b200; line-height:40px; float: left; text-align: center; font-size: 14px; font-weight: normal; color: #95b200; ">最新</div>
			<div id="show2" style="width:50%; background: #f6f6f6; border-bottom:3px solid #e7e7e7; line-height:40px; float: left; text-align: center; font-size: 14px; font-weight: normal;">最热</div>
		</div>
		<ul class="list" id="aa">
	        <li class="activeable list-more" style="display: none;" onclick="PageOper.funLoadMore(1)">加载更多</li>
        </ul>
        <ul class="list" id="bb">
	        <li class="activeable list-more" style="display: none;" onclick="PageOper.funLoadMore(2)">加载更多</li>
        </ul>
	</div>		
	<footer id="footer">
		<jsp:include page="/WEB-INF/patient/common/footer-include.jsp">
			<jsp:param value="2" name="selected"/>
		</jsp:include>
	</footer>	
</body>
</body>
</html>
