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
    <title>南京通用电器有限公司 </title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0"> 
	<%@ include file="/WEB-INF/patient/common/top-include.jsp"%>
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
  <div class="index_tab">   
   <div class="tab_menu">
      <ul>
        <li class="selected"><a style="width:166px; height: 48px; display:block;text-decoration:none;color:#fff; " href="<c:url value='/p/query/service.do'/>" target="indexFrame" title="基本信息" >我的服务</a></li>
        <li><a style="width:166px; height: 48px; display:block; text-decoration:none;color:#fff; " href="<c:url value='/p/query/device.do'/>" target="indexFrame" title="健康病历">我的设备</a></li>
      </ul>
   </div>
   <div class="tab_box" >
       <iframe id="indexFrame"  name = "indexFrame" src="<c:url value='/p/query/service.do'/>"  frameborder="0" width="100%"  scrolling="no"  onload="sonIframeResize();"></iframe>
   </div> 
  </div>   
   
</body>
</html>
