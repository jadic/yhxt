<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/patient/common/taglibs-include.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
  	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0;">  
    <title>自已人健康服务中心</title>
    <link rel="stylesheet" href="<c:url value='/patient/themes/register_style.css'/>" type="text/css"/>
    <script type="text/javascript" src="<c:url value='/common/scripts/jquery-1.8.0.min.js'/>" ></script>
 	<script>
 		$(function(){
 			<c:if test="${not empty errorinfo}">
 			alert("${errorinfo}")
 			</c:if>
 		});
 		
 		function funSubmitInfo()
 		{
 			if($("#userName").val() == "")
 			{
 				alert("帐号不能为空！");
 				return false;
 			}	
 			else if($("#userPwd").val() == "")
 			{
 				alert("密码不能为空！");
 				return false;
 			}
 			return true;
 		}
 	</script>
  </head>
  <body class="radial">
  	<div class="new_wrapper">
	    <form action="<c:url value='/p/query/login.do'/>" method="post" onsubmit="return funSubmitInfo()" name="inputform" id="inputform">
				<div class="new_register">
	    		<input type="text" placeholder="登录帐号" class="border_btm r_email top" name="userName" id="userName" maxlength="20"/>
	    		<span class="err_email dn"><em>!</em>填写手机号码</span>
	    		<input type="password" placeholder="密码"  id="userPwd" name="userPwd" class="r_psw btm" maxlength="16" />
	    		<span class="err_psw dn"><em>!</em>6~16位密码</span>
	    		<i class="eye"></i>
	    	</div>
	    	<input type="hidden" name="oper" value="1"/>
	    	<input type="submit" class="btn_green" id="login" value="登录"/>
	    </form>
	    <div class="register_text">还没帐号？</div>
	    <a href="<c:url value='/p/toReg.do'/>" class="btn_green_border">注册</a>
	</div>
  	
  </body>
</html>