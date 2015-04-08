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
 			
 			if(top.location!=self.location)
 		    {
 		        top.location=self.location;
 		    }
 			
 			$("#loginbg, #logincon").css("top", $("#top-table").height());
 			$("#loginbg img").css("height", $(window).height() - $("#top-table").height());
 			$("#loginbg img").css("width", $(window).width());
 			
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
  	<table cellpadding="0" cellspacing="0" style="width: 100%; min-width:904px; overflow: hidden;" border="0" id="top-table" name="top-table">
		<tr>
			<td style="height: 90px; max-height: 90px; width:452px; min-width:452px; background: url('<c:url value='/patient/themes/images/top-left.png'/>')  repeat-y;">&nbsp;</td>
			<td style="height: 90px;;; max-height: 90px;;; background: #aaa0a1;">&nbsp;</td>
			<td style="height: 90px; max-height: 90px; width:452px; min-width:452px; background: url('<c:url value='/patient/themes/images/top-right.png'/>')  repeat-y;">&nbsp;</td>
		</tr>
		<tr>
			<td style="height: 40px; max-height: 40px;" colspan="3">
				<table cellpadding="0" cellspacing="0" border="0" style="height:40px; width: 100%;">
					<tr>
						<td style="width:226px; min-width:226px; background: url('<c:url value='/patient/themes/images/menu-left.png'/>')  no-repeat;">&nbsp;</td>
						<td style=" background: url('<c:url value='/patient/themes/images/menu-center.png'/>');">&nbsp;</td>
						<td style="width:226px; min-width:226px; background: url('<c:url value='/patient/themes/images/menu-right.png'/>')  no-repeat;">&nbsp;</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	<div style="width:100%; position: absolute; top: 125px; z-index: 1;" id="loginbg">
		<img src="<c:url value='/patient/themes/images/login_04.png'/>" alt="" style="height: 400px;"/>
  	</div>
  	<div style="width:100%; position: absolute; top: 125px; z-index: 1;" id="logincon">
		<table id="center-table" cellpadding="0" cellspacing="0" style="width: 100%; min-width:904px; height:500px; overflow: hidden; z-index: 1000" border="0" >
			<tr>
				<td >&nbsp;</td>
				<td style="width: 400px; max-height: 400px;" valign="top">
					<div style="height: 80px; width: 370px;"></div>
					<img src="<c:url value='/patient/themes/images/login_01.png'/>" alt="" />
				</td>
				<td >&nbsp;</td>
				<td >&nbsp;</td>
				<td style="width: 240px; max-width: 240px; background: url('<c:url value='/patient/themes/images/login_02.png'/>') no-repeat;" valign="top">
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
				</td>
				<td >&nbsp;</td>
			</tr>
		</table>
	</div>
	<div style="height:70px; width:100%; position: absolute; top: 15px; background: url('<c:url value='/patient/themes/images/login_00.png'/>') center no-repeat;">
  	</div>
  </body>
</html>