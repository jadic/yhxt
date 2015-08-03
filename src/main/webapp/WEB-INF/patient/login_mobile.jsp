<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/patient/common/taglibs-include.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
  	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />  
    <title>自已人健康服务中心</title>
    <style>
    	.inputMin_informationModify{width:218px; height:28px; border:1px solid #aeaeae; padding-left:10px; font:13px/28px "微软雅黑"; color:#000}
    </style>
    <script type="text/javascript" src="<c:url value='/common/scripts/jquery-1.8.0.min.js'/>" ></script>
 	<script>
 		$(function(){
 			var tmp = $(window).height() - $("#top-table").height() - $("#center-table").height();
 			if(tmp > 0)
 			{
	 			$("#table_footer").attr("height", $(window).height() - $("#top-table").height() - $("#center-table").height());
 			}
 			
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
 
	<form action="<c:url value='/p/query/login.do'/>" method="post" onsubmit="return funSubmitInfo()" name="inputform" id="inputform">
				<table cellpadding="0" cellspacing="0" border="0" style="width: 100%;">
					<tr>
						<td style="height: 65px;">&nbsp;</td>
					</tr>
					<tr>
						<td style="color: #30bcb4; font-size: 14px; font-weight: bold; padding-left: 10px;" valign="middle">&nbsp;登录</td>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td style="height: 15px;"></td>
					</tr>
					<tr>
						<td style="padding-left: 15px;">
							<input type="text" id="userName" name="userName" value="帐号" onblur="if(userName.value=='')userName.value='帐号';" onfocus="this.select(); if(userName.value=='帐号')userName.value='';" style="height: 35px; width: 165px; color: #666666; padding-left: 35px; text-align: left;line-height: 35px; background: url('<c:url value='/patient/themes/images/login_user.jpg'/>') no-repeat left;border: none" title="用户名">
						</td>
					</tr>
					<tr>
						<td style="height: 10px;"></td>
					</tr>
					<tr>
						<td style="padding-left: 15px;">
							<input name="userPwd" type="password" maxlength="16" id="userPwd" onfocus="this.select(); " style="height: 35px; width: 165px; color: #666666; padding-left: 35px; text-align: left;line-height: 35px; background: url('<c:url value='/patient/themes/images/login_pwd.jpg'/>') no-repeat left;border: none" title="用户名">
						</td>
					</tr>
					<tr>
						<td style="height: 10px;"></td>
					</tr>
					<tr>
						<td style="padding-left: 15px;">
							<table>
								<tr>
									<td>
										<input name=rand type="text" maxlength="16" id="rand" onfocus="this.select(); " style="height: 35px; width: 85px; color: #666666; padding-left: 35px; text-align: left;line-height: 35px; background: url('<c:url value='/patient/themes/images/login_rand.jpg'/>') no-repeat left;border: none" title="用户名">
									</td>
									<td align="left">
										<img src="<c:url value='/p/img.do'/>" style="cursor: pointer;" onclick="this.src=this.src+'?'"/>
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td style="height: 10px;"></td>
					</tr>
					<tr>
						<td style="padding-left: 15px;">
							<input  type="submit" style="display: none;" id="btnsubmit" name="btnsubmit"/>
							<img src="<c:url value='/patient/themes/images/login_btn.jpg'/>" style="cursor: pointer; border: 0px;" onclick="btnsubmit.click()"/>
						</td>
					</tr>
					<tr>
						<td></td>
					</tr>
				</table>
				</form>
	
  </body>
</html>