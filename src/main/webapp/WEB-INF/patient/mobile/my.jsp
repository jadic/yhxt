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
		  width: 35px;
		  height: 35px;
		}
		.list .item-desc{
			  margin-left: 50px;
			  height: 40px;
			  color: #333;
			  line-height: 40px;
		}
		.list .item-desc div{font-size: 18px;}
		.list .list-item {
		  padding: 7px 14px;
		  border-bottom: 1px solid #e8e8e8;
		}
	</style>
	<script type="text/JavaScript">
		function funClick(url)
		{	
			window.location.href = url;
		}	
		
		function funLogout()
		{
			var r=confirm("Press a button")
  			if (r==true)
    		{
				alert("2")
    		}
  			else
    		{
				alert("12")
    		}
		}
	</script>
  </head>
<body>
	<header id="header">我的</header>
	<div id="content">
		<ul class="list">
			<li class="activeable list-item" onclick="funClick('<c:url value='/p/query/userbase.do'/>')">
				<div class="circle">
					<c:choose>
						<c:when test="${not empty pphoto }">
						<img src="<c:url value='/'/>${pphoto}" style="border: 0px;">
						</c:when>
						<c:otherwise>
							<img src="<c:url value='/patient/themes/images/mobile/user_photo.png'/>" style="border: 0px;">
						</c:otherwise>
					</c:choose>
				</div>
				<div style="float: left; line-height: 75px; font-size: 18px; padding-left: 15px;">
					${pfullname}
				</div>
			</li>
			<li class="activeable list-item" style="background: #efefef"></li>
	        <li class="activeable list-item" >
	        	<a href="<c:url value='/p/query/relative.do'/>">
		            <img src="<c:url value='/patient/themes/images/bpAlarm.png'/>" class="item-logo">
		            <div class="item-desc">
		            	<div style="float: left;">
		            		我的亲情号码
		            	</div>
		            	<div style="float: right; line-height: 60px; width: 12px;">
		                    <div class="item-next"></div>
		               	</div>
		            </div>
	        	</a>
	        </li>
	        <li class="activeable list-item" >
	        	<a href="<c:url value='/p/query/mynuser.do'/>">
		            <img src="<c:url value='/patient/themes/images/bpAlarm.png'/>" class="item-logo">
		            <div class="item-desc">
		            	<div style="float: left;">
		            		我的医护人员
		            	</div>
		            	<div style="float: right; line-height: 60px; width: 12px;">
		                    <div class="item-next"></div>
		               	</div>
		            </div>
	        	</a>
	        </li>
	        
	        <li class="activeable list-item" style="background: #efefef"></li>
	        <li class="activeable list-item" >
	        	<a href="<c:url value='/p/query/activity.do'/>">
		            <img src="<c:url value='/patient/themes/images/bpAlarm.png'/>" class="item-logo">
		            <div class="item-desc">
		            	<div style="float: left;">
		            		我的活动
		            	</div>
		            	<div style="float: right; line-height: 60px; width: 12px;">
		                    <div class="item-next"></div>
		               	</div>
		            </div>
	            </a>
	        </li>
	        <li class="activeable list-item" >
	        	<a href="<c:url value='/p/query/service.do?type=1'/>">
		            <img src="<c:url value='/patient/themes/images/bpAlarm.png'/>" class="item-logo">
		            <div class="item-desc">
		            	<div style="float: left;">
		            		我的服务
		            	</div>
		            	<div style="float: right; line-height: 60px; width: 12px;">
		                    <div class="item-next"></div>
		               	</div>
		            </div>
		          </a>
	        </li>
	        <li class="activeable list-item" >
	        	<a href="<c:url value='/p/query/device.do'/>">
		            <img src="<c:url value='/patient/themes/images/bpAlarm.png'/>" class="item-logo">
		            <div class="item-desc">
		            	<div style="float: left;">
		            		我的设备
		            	</div>
		            	<div style="float: right; line-height: 60px; width: 12px;">
		                    <div class="item-next"></div>
		               	</div>
		            </div>
		         </a>
	        </li>
	         
	        <li class="activeable list-item" style="background: #efefef"></li>
	        <li class="activeable list-item" >
	        	<a href="<c:url value='/p/query/memberhabit.do'/>">
		            <img src="<c:url value='/patient/themes/images/bpAlarm.png'/>" class="item-logo">
		            <div class="item-desc">
		            	<div style="float: left;">
		            		生活习惯
		            	</div>
		            	<div style="float: right; line-height: 60px; width: 12px;">
		                    <div class="item-next"></div>
		               	</div>
		            </div>
		         </a>
	        </li>
	        <li class="activeable list-item" >
	        	<a href="<c:url value='/p/query/familydisease.do'/>">
		            <img src="<c:url value='/patient/themes/images/bpAlarm.png'/>" class="item-logo">
		            <div class="item-desc">
		            	<div style="float: left;">
		            		家族遗传史
		            	</div>
		            	<div style="float: right; line-height: 60px; width: 12px;">
		                    <div class="item-next"></div>
		               	</div>
		            </div>
		         </a>
	        </li>
	        <li class="activeable list-item" >
	        	<a href="<c:url value='/p/query/diseasehis.do'/>">
		            <img src="<c:url value='/patient/themes/images/bpAlarm.png'/>" class="item-logo">
		            <div class="item-desc">
		            	<div style="float: left;">
		            		疾病史
		            	</div>
		            	<div style="float: right; line-height: 60px; width: 12px;">
		                    <div class="item-next"></div>
		               	</div>
		            </div>
		        </a>    
	        </li>
	       
	         
	        <li class="activeable list-item" style="background: #efefef"></li>
	        <li class="activeable list-item" >
	        	<a href="<c:url value='/p/query/goFeedBack.do'/>">
		            <img src="<c:url value='/patient/themes/images/bpAlarm.png'/>" class="item-logo">
		            <div class="item-desc">
		            	<div style="float: left;">
		            		意见反馈
		            	</div>
		            	<div style="float: right; line-height: 60px; width: 12px;">
		                    <div class="item-next"></div>
		               	</div>
		            </div>
		         </a>   
	        </li>
	        <li class="activeable list-item" >
	        	<a href="<c:url value='/p/modifypwd.do'/>">
		            <img src="<c:url value='/patient/themes/images/bpAlarm.png'/>" class="item-logo">
		            <div class="item-desc">
		            	<div style="float: left;">
		            		修改密码
		            	</div>
		            	<div style="float: right; line-height: 60px; width: 12px;">
		                    <div class="item-next"></div>
		               	</div>
		            </div>
		          </a>  
	        </li>
	        <li class="activeable list-item">
	        	<a href="<c:url value='/p/query/logout.do'/>">
	        		 <img src="<c:url value='/patient/themes/images/bpAlarm.png'/>" class="item-logo">
		            <div class="item-desc">
		            	<div style="float: left;">
		            		安全退出
		            	</div>
		            	<div style="float: right; line-height: 60px; width: 12px;">
		                    <div class="item-next"></div>
		               	</div>
		            </div>
	        	</a>
	        </li>
        </ul>
	</div>
	<footer id="footer">
		<jsp:include page="/WEB-INF/patient/common/footer-include.jsp">
			<jsp:param value="3" name="selected"/>
		</jsp:include>
	</footer>
</body>
</html>
