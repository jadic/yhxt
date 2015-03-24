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
		$(function(){
			$("#helathMenuNav li").bind("click", function(){
				$("#helathMenuNav li").removeClass("indexMenu_secondary_activation");
				$(this).addClass("indexMenu_secondary_activation");
			});
		});
	
		function reinitIframe() 
		{
			var iframe = document.getElementById("mainFrame");
			try {
				var bHeight = iframe.contentWindow.document.body.scrollHeight;
				var dHeight = iframe.contentWindow.document.documentElement.scrollHeight;
				var height = Math.min(bHeight, dHeight);
				iframe.height = height;
			} catch (ex) {
			}
		}
		window.setInterval("reinitIframe();", 500);

	</script>
  </head>
<body>
	<div class="index_health_header">
      <div class="bgTop_index">
        <div class="index_out">
          <ul>
           <li class="index_wechat"><a href="/jsp/health/index/wechat.jsp" title="995120健康服务中心官方微信" target="_blank">官方微信</a></li>
           <li class="index_bolg"><a href="http://weibo.com/5137507355/profile" title="995120健康服务中心官方微博" target="_blank">官方微博</a></li>
           <li class="index_service_phone" title="400电话">400-0785-120</li>
           <li class="index_username">欢迎您，qbws1</li>
           <li class="index_signout">
               <a href="javascript:void(0)" onclick="logout();" title="安全退出">安全退出</a>
               <form action="/h/level.helowin" id="logoutForm" name="logoutForm" method="post">
               </form>
           </li> 
          </ul>
        </div>
      </div>
      <!--indexMenu start-->
      <div class="logo_menu">
        <div class="bg_logo">
          <div class="index_menu">
           
          </div>
        </div>
      </div>
    </div>
    
    <div class="indexMenu_secondary">
      <div class="indexMenu_secondary_main">
        <ul id="helathMenuNav">
          <li id="hMenu0" class="indexMenu_secondary_activation"><a href="<c:url value='/p/query/home.do'/>" target="mainFrame" title="首页">首页</a></li>
          <li id="hMenu1"><a href="<c:url value='/p/health.do'/>" target="mainFrame" title="健康档案">健康档案</a></li>
          <li id="hMenu2"><a href="<c:url value='/p/healthanalysis.do'/>" target="mainFrame" title="健康分析">健康分析</a></li>
          <li id="hMenu3"><a href="<c:url value='/p/servicedevice.do'/>" target="mainFrame" title="我的设备">我的设备</a></li>
          <li id="hMenu4"><a href="<c:url value='/p/query/mynuser.do'/>" target="mainFrame" title="我的医护人">我的医护人</a></li>
        </ul> 
      </div>
    </div>
    
	<div class="index_health_middle" style="background: #ededed;">
    <div class="index_health_main">
      <!--index_health_left start-->
      <div class="index_health_left">
        <div class="wInformation">
          <ul>
            <li class="wInformation_img">
            	<a href="<c:url value='/p/health.do'/>" onclick="$('#hMenu1').click()"  target="mainFrame" title="健康档案">
            		<c:if test="${empty userModel.photo }">
            		<img width="80" height="90" id="memberHeadImg" src="<c:url value='/patient/themes/images/default_head.gif'/>">
            		</c:if>
            		<c:if test="${not empty userModel.photo }">
            		<img width="80" height="90" id="memberHeadImg" src="<c:url value='/'/>${userModel.photo}">
            		</c:if>
            	</a>
            </li>
            <li class="tGrayMax">您好！</li>
            <li class="tGreen"><a class="title_info" href="<c:url value='/p/health.do'/>" onclick="$('#hMenu1').click()" target="mainFrame" title="${userModel.name }" id="left_memberName" style="color:#0ca7a1;">${userModel.name }</a></li>
            <li class="tGrayMin" style="font-size:8px;">最近2015-02-28 00:14:35</li>
            <li class="wMedical"><a href="<c:url value='/p/health.do'/>" onclick="$('#hMenu1').click()" style="cursor: pointer;" target="mainFrame" title="健康档案">健康档案</a></li>
            <li class="wHome"><a href="<c:url value='/p/healthanalysis.do'/>" onclick="$('#hMenu2').click()" style="cursor: pointer;" target="mainFrame" title="健康分析">健康分析</a></li>
            <li class="tGray">我的家庭成员：
             	<ul>
             		<c:if test="${not empty relativeFlys }">
             		<c:forEach items="${relativeFlys}" var="relativeItem">
             		<li class="wtBlack">
             			<div style="width: 45px; float: left;">${relativeItem.name }</div>
             			<div style="float: left;">
             			【${relativeItem.typeName }】
             			【${relativeItem.cellPhone }】
             			</div>
             		</li>
             		</c:forEach>
             		</c:if>
             		<li class="wtaGreen">
            			<a href="<c:url value='/p/health.do'/>?type=3" onclick="$('#hMenu1').click()" target="mainFrame" title="增加家庭成员">增加家庭成员</a>
            		</li>
            	</ul>
             </li>
            <li class="tGray">我的设备：
            	<ul>
					<c:if test="${not empty deviceFlys }">
             		<c:forEach items="${deviceFlys}" var="deviceItem">
             		<li class="wtBlack">
             			${deviceItem.model } 
             			【${deviceItem.typeName }】
             		</li>
             		</c:forEach>
             		</c:if>
					<li class="wtaGreen"><a href="<c:url value='/p/servicedevice.do'/>?type=1" onclick="$('#hMenu3').click()" target="mainFrame" title="增加设备">增加设备</a></li>
            	</ul>
            </li>
            <li class="tGray" id="hos_doc">我的医护人员：
            	<ul id="hosDocListUL">
            		<li class="wtBlack">
            		<c:if test="${not empty nurseModel }">
            		${nurseModel.name}(${nurseModel.cellphone })
            		</c:if>
            		</li>
            		<li class="wtaGreen">
            		<c:if test="${empty nurseModel }">
            			<a href="<c:url value='/p/query/mynuser.do'/>" onclick="$('#hMenu4').click()" target="mainFrame" title="增加医护人员">增加医护人员</a>
            		</c:if>
            		</li>
            	</ul>
            </li>
          </ul>
        </div>  
      </div>
      <!--index_health_left end-->
      <!--index_health_right start-->
      <div class="index_health_right">
        <iframe src="<c:url value='/p/query/home.do'/>" scrolling="no" frameborder="0" name="mainFrame" id="mainFrame" onload="reinitIframe();" height="1388"></iframe>
      </div>
      <!--index_health_right end-->
    </div>
    </div>
</body>
</html>
