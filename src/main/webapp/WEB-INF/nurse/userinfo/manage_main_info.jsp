<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/nurse/common/taglibs-include.jsp" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <base href="<%=basePath%>">
    <title>自已人健康服务中心 </title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0"> 
	<%@ include file="/WEB-INF/nurse/common/top-include.jsp"%>
	<link rel="stylesheet" href="<c:url value='/nurse/themes/health_records.css'/>" type="text/css"/>
	<script type="text/JavaScript">
		$(function() {
			var $div_li = $("div.tab_menu ul li");
			$div_li.click(function() {
				$(this).addClass("selected").siblings().removeClass("selected");
			});

		});

		function sonIframeResize() 
		{

			var iframe = document.getElementById("indexFrame");
			try 
			{
				var bHeight = iframe.contentWindow.document.body.scrollHeight;
				var dHeight = iframe.contentWindow.document.documentElement.scrollHeight;
				var height = Math.min(bHeight, dHeight);
				iframe.height = height;
			} 
			catch (ex) 
			{

			}
		}
		window.setInterval("sonIframeResize()", 200);
	</script>
  </head>
<body>
 <div style="height: 10px; width: 670px;"></div>	
  <div class="index_tab">   
   <div class="tab_menu">
      <ul>
        <li class="selected" style="width: 132px;"><a style="width:130px; height: 48px; display:block;text-decoration:none;color:#fff; " href="<c:url value='/n/search/userJkzt.do'/>?userId=${query.userId}" target="indexFrame" title="健康状态" >健康状态</a></li>
        <li style="width: 133px;"><a style="width:133px; height: 48px; display:block;text-decoration:none;color:#fff; " href="<c:url value='/n/search/healthBg.do'/>?userId=${query.userId}" target="indexFrame" title="健康报告">健康报告</a></li>
        <li style="width: 133px;"><a style="width:133px; height: 48px; display:block;text-decoration:none;color:#fff; " href="<c:url value='/n/search/jkda.do'/>?userId=${query.userId}" target="indexFrame" title="健康档案">健康档案</a></li>
        <li style="width: 131px;"><a style="width:131px; height: 48px; display:block;text-decoration:none;color:#fff; " href="<c:url value='/n/search/advice.do'/>?userId=${query.userId}" target="indexFrame" title="医嘱">医嘱</a></li>
        <li style="width: 131px;"><a style="width:131px; height: 48px; display:block;text-decoration:none;color:#fff; " href="<c:url value='/n/search/userMsgList.do'/>?userId=${query.userId}&senderId=${query.userId}" target="indexFrame" title="留言">留言</a></li>
      </ul>
   </div>
   <div class="tab_box" >
       <iframe id="indexFrame"  name = "indexFrame" src="<c:url value='/n/search/userJkzt.do'/>?userId=${query.userId}"  frameborder="0" width="100%"  scrolling="no"  onload="sonIframeResize();"></iframe>
   </div> 
  </div>   
   
</body>
</html>
