<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/patient/common/taglibs-include.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
  	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0;">  
    <title>自已人健康服务中心</title>
    <script type="text/javascript" src="<c:url value='/common/scripts/jquery-1.8.0.min.js'/>" ></script>
 	<script>
 		$(function(){
 			<c:if test="${not empty errorinfo}">
 			alert("${errorinfo}")
 			</c:if>
 		});
 		
 		function funSubmitInfo()
 		{
 			if($("#userName").val() == "帐号")
 			{
 				alert("帐号不能为空！");
 				return false;
 			}	
 			else if($("#userPwd").val() == "")
 			{
 				alert("密码不能为空！");
 				return false;
 			}
 			else if($("#rand").val() == "")
 			{
 				alert("验证码不能为空！");
 				return false;
 			}
 			return true;
 		}
 	</script>
  </head>
  <body style="padding: 0px; margin: 0px; overflow: hidden;">
  	<table cellpadding="0" cellspacing="0" style="width: 100%; overflow: hidden;" border="0" id="top-table">
		<tr>
			<td style="height: 130px; max-height: 130px; background: #2aa495; padding-left: 20px;">
				<img src="<c:url value='/patient/themes/images/login_05.png'/>" alt="" />
			</td>
		</tr>
	</table>
	<table border="0" id="center-table" cellpadding="0" cellspacing="0" style="width: 100%; overflow: hidden;" border="0" >
		<tr>
			<td >&nbsp;</td>
			<td style="width: 90%;" valign="top">
				<form action="<c:url value='/p/query/login.do'/>" method="post" onsubmit="return funSubmitInfo()" name="inputform" id="inputform">
				<table cellpadding="0" cellspacing="0" border="0" style="width: 100%;">
					<tr>
						<td style="height: 6px;" colspan="2"></td>
					</tr>
					<tr>
						<td style="height: 65px; font-size: 36px;" colspan="2" align="center">&nbsp;
							登录
						</td>
					</tr>
					<tr>
						<td style="height: 6px;" colspan="2"></td>
					</tr>
					<tr>
						<td align="right" style="width: 60px;">帐<span style="padding: 0 7px;"></span>号</td>
						<td style="padding-left: 15px;">
							<input type="text" id="userName" name="userName" maxlength="20" placeholder="登录帐号" style="height: 35px; width: 90%; color: #666666; padding-left: 15px; text-align: left;line-height: 35px;" title="用户名">
						</td>
					</tr>
					<tr>
						<td style="height: 6px;" colspan="2"></td>
					</tr>
					
					<tr>
						<td align="right" style="width: 60px;">密<span style="padding: 0 7px;"></span>码</td>
						<td style="padding-left: 15px;">
							<input type="password" id="userPwd" name="userPwd" maxlength="16" placeholder="登录帐号" onfocus="this.select(); " style="height: 35px; width: 90%; color: #666666; padding-left: 15px; text-align: left;line-height: 35px;" title="用户名">
						</td>
					</tr>
					<tr>
						<td style="height: 6px;" colspan="2"></td>
					</tr>
					<tr>
						<td align="right" style="width: 60px;">验证码</td>
						<td style="padding-left: 15px;">
							<table cellpadding="0" cellspacing="0" border="0" >
								<tr>
									<td>
										<input type="text" id="rand" name="rand" maxlength="4" placeholder="4位验证码" onfocus="this.select(); " style="height: 35px; width: 90%; color: #666666; padding-left: 15px; text-align: left;line-height: 35px;" title="用户名">
									</td>
									<td align="center" style="width: 80px;">
										<input type="hidden" name="oper" value="1"/>
										<img src="<c:url value='/p/img.do'/>" style="cursor: pointer;" onclick="this.src=this.src+'?'"/>
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td style="height: 16px;" colspan="2"></td>
					</tr>
					<tr>
						<td colspan="2" align="center">
							<input  type="submit" style="display: none;" id="btnsubmit" name="btnsubmit"/>
							<img src="<c:url value='/patient/themes/images/login_btn.jpg'/>" style="cursor: pointer; border: 0px;" onclick="btnsubmit.click()"/>
						</td>
					</tr>
					<tr>
						<td style="height: 16px;" colspan="2"></td>
					</tr>
					<tr>
						<td style="height: 22px;" colspan="2">
							<a href="<c:url value='/p/toReg.do'/>" style="font-size: 12px; float: right; padding-right: 20px;">我要注册</a>
						</td>
					</tr>
				</table>
				</form>
			</td>
			<td >&nbsp;</td>
		</tr>
	</table>
  </body>
</html>