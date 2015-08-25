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
	<link rel="stylesheet" href="<c:url value='/patient/themes/health_records.css'/>" type="text/css"/>
	<script type="text/JavaScript">
		function mergeRelative(id)
		{
			window.location.href = "<c:url value='/p/query/mergerelative.do' />?id=" + id;
		}
	</script>
  </head>
<body>
  	<header id="header">
  		亲情号码
  		<div class="left"><a href="<c:url value='/p/my.do'/>"><span class="corner"></span></a></div>
  		<div class="right"><a href="javascript:void(0)" onclick="mergeRelative(0)"><span class="cornerAdd"></span></a></div>
  	</header>
  	<div id="content">
		<ul class="list">
		<c:if test="${not empty relativeFlys }">
			<c:forEach items="${relativeFlys }" var="relativeItem" varStatus="item">
				<li class="activeable list-item" style="display:-webkit-box; display:-moz-box;"  onclick="mergeRelative(${relativeItem.id})">
	               <div style="width: 70px; padding-top:10px; -webkit-box-sizing:border-box; -moz-box-sizing:border-box; -webkit-box-ordinal-group:2;-moz-box-ordinal-group:2;">
	              		 <h2 class="item-title" style="color: #0f82c1;">${relativeItem.name }</h2>
	              		 <p class="item-info">${relativeItem.typeName }</p>
	              	</div>
	               <div style="-webkit-box-flex:1; -moz-box-flex:1; -webkit-box-ordinal-group:2;-moz-box-ordinal-group:2;">
		               <p class="item-info">
		               		手机：${relativeItem.cellPhone }
		               </p>
		               <p class="item-info">
		               		固话：${relativeItem.tel }
		               </p>
		               <p class="item-time">地址：${relativeItem.address }</p>
	              </div>
	              <div style="width: 20px; -webkit-box-sizing:border-box; -moz-box-sizing:border-box; -webkit-box-ordinal-group:2;-moz-box-ordinal-group:2;">
	              	<div class="item-next" style="margin-top:25px;"></div>
	              </div>
	      		</li>
			</c:forEach>
		</c:if>
	</div>
	
	<footer id="footer">
		<footer id="footer">
		<jsp:include page="/WEB-INF/patient/common/footer-include.jsp">
			<jsp:param value="3" name="selected"/>
		</jsp:include>
	</footer>
</body>
</html>
