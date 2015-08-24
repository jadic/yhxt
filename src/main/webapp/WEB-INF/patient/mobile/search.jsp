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
	<link rel="stylesheet" href="<c:url value='/patient/themes/index_right.css'/>" type="text/css"/>
	<%@ include file="/WEB-INF/patient/common/easyui-include.jsp"%>
	<style type="text/css">
		.circle { 
			width: 75px; 
			height: 75px; 
			border:1px solid #ddd;
			background-color: #fff; 
			text-align:center;
			line-height:70px;
			color:red;
			font-size:18px;
			font-weight:bold;
			float:left;
			margin-right:15px;
			-webkit-border-radius: 75px; 
		} 
		.circle img{width: 75px;  height: 75px;  border-radius:75px}
		.list .item-logo {
		  display: inline-block;
		  float: left;
		  width: 30px;
		  height: 30px;
		}
		.list .item-desc{
			  margin-left: 40px;
			  height: 32px;
			  color: #333;
			  line-height: 30px;
		}
		.list .list-item {
		  padding: 7px 14px;
		  border-bottom: 1px solid #e8e8e8;
		}
	</style>
  </head>
<body>
	<header id="header">搜索</header>
	<div id="content">
		<ul class="list">
			 <li class="activeable list-item" style="background: #efefef"></li>
	        <li class="activeable list-item" data-positionid="157429" data-companyid="17751">
	            <img src="<c:url value='/patient/themes/images/bpAlarm.png'/>" class="item-logo">
	            <div class="item-desc">
	            	<div style="float: left;">
	            		血糖信息
	            	</div>
	            	<div style="float: right; line-height: 60px; width: 12px;">
	                    <div class="item-next"></div>
	               	</div>
	            </div>
	        </li>
	        <li class="activeable list-item" data-positionid="157429" data-companyid="17751">
	            <img src="<c:url value='/patient/themes/images/bpAlarm.png'/>" class="item-logo">
	            <div class="item-desc">
	            	<div style="float: left;">
	            		血圧信息
	            	</div>
	            	<div style="float: right; line-height: 60px; width: 12px;">
	                    <div class="item-next"></div>
	               	</div>
	            </div>
	        </li>
	        <li class="activeable list-item" data-positionid="157429" data-companyid="17751">
	            <img src="<c:url value='/patient/themes/images/bpAlarm.png'/>" class="item-logo">
	            <div class="item-desc">
	            	<div style="float: left;">
	            		体温信息
	            	</div>
	            	<div style="float: right; line-height: 60px; width: 12px;">
	                    <div class="item-next"></div>
	               	</div>
	            </div>
	        </li>
	        <li class="activeable list-item" data-positionid="157429" data-companyid="17751">
	            <img src="<c:url value='/patient/themes/images/bpAlarm.png'/>" class="item-logo">
	            <div class="item-desc">
	            	<div style="float: left;">
	            		用药管理
	            	</div>
	            	<div style="float: right; line-height: 60px; width: 12px;">
	                    <div class="item-next"></div>
	               	</div>
	            </div>
	        </li>
	        
	        <li class="activeable list-item" style="background: #efefef"></li>
	        <li class="activeable list-item" data-positionid="157429" data-companyid="17751">
	            <img src="<c:url value='/patient/themes/images/bpAlarm.png'/>" class="item-logo">
	            <div class="item-desc">
	            	<div style="float: left;">
	            		健康报告
	            	</div>
	            	<div style="float: right; line-height: 60px; width: 12px;">
	                    <div class="item-next"></div>
	               	</div>
	            </div>
	        </li>
	        <li class="activeable list-item" data-positionid="157429" data-companyid="17751">
	            <img src="<c:url value='/patient/themes/images/bpAlarm.png'/>" class="item-logo">
	            <div class="item-desc">
	            	<div style="float: left;">
	            		用药建议
	            	</div>
	            	<div style="float: right; line-height: 60px; width: 12px;">
	                    <div class="item-next"></div>
	               	</div>
	            </div>
	        </li>
	        <li class="activeable list-item" data-positionid="157429" data-companyid="17751">
	            <img src="<c:url value='/patient/themes/images/bpAlarm.png'/>" class="item-logo">
	            <div class="item-desc">
	            	<div style="float: left;">
	            		饮食建议
	            	</div>
	            	<div style="float: right; line-height: 60px; width: 12px;">
	                    <div class="item-next"></div>
	               	</div>
	            </div>
	        </li>
	        <li class="activeable list-item" data-positionid="157429" data-companyid="17751">
	            <img src="<c:url value='/patient/themes/images/bpAlarm.png'/>" class="item-logo">
	            <div class="item-desc">
	            	<div style="float: left;">
	            		运动建议
	            	</div>
	            	<div style="float: right; line-height: 60px; width: 12px;">
	                    <div class="item-next"></div>
	               	</div>
	            </div>
	        </li>
	        <li class="activeable list-item" data-positionid="157429" data-companyid="17751">
	            <img src="<c:url value='/patient/themes/images/bpAlarm.png'/>" class="item-logo">
	            <div class="item-desc">
	            	<div style="float: left;">
	            		就诊建议
	            	</div>
	            	<div style="float: right; line-height: 60px; width: 12px;">
	                    <div class="item-next"></div>
	               	</div>
	            </div>
	        </li>
	        <li class="activeable list-item" style="background: #efefef"></li>
        </ul>
	</div>
	<footer id="footer">
		<jsp:include page="/WEB-INF/patient/common/footer-include.jsp">
			<jsp:param value="1" name="selected"/>
		</jsp:include>
	</footer>
</body>
</html>
