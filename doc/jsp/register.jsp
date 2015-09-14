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
 		var reg = /^1\d{10}$/;  //定义正则表达式
 		$(function(){
 			<c:if test="${not empty errorinfo}">
 			alert("${errorinfo}")
 			</c:if>
 			
 			var tmp = 60;
 			var mTim = null;
 			
 			$("#retset").bind("click", function(){
 				$("input[type=text],input[type=password]").val('');
 			});
 			
 			$("#smsrand").bind("click", function(){
 				
 				if(reg.test($("#userName").val()) == false)
 				{
 					alert("11位手机号码不正确")
 					return false;
 				}	
 				var me = this;
 				$.ajax({
 				      url : "<c:url value='/p/query/getSmsVal.do'/>",
 				      type : 'post',
 				      dataType : 'json',
 				      data :{"cellphone":$("#userName").val()},
 				      error:function(data)
 				      {
 				    	 
 				      },
 				      success:function(data)
 				      {
 				        if(data.success)
 				        {
 				        	if($(me).text() == "获取验证码" || $(me).text() == "重新获取验证码")
 			 				{
 			 					tmp = 60
 			 					if(mTim != null)
 			 					{
 			 						window.clearInterval(mTim);
 			 						mTim = null;
 			 					}	
 			 					mTim = window.setInterval(function(){
 			 						if(tmp == 0)
 			 						{
 			 							$("#smsrand").text("重新获取验证码");
 			 							window.clearInterval(mTim);
 			 	 						mTim = null;
 			 							return;
 			 						}
 			 						else
 			 						{
 			 							$("#smsrand").text("剩" + tmp + "秒");
 			 							tmp -= 1;
 			 						}	
 			 					}, 1000);
 			 				}	
 				        }
 				        else
 				        {
 				        	alert("短信发送失败！");
 				        }	
 				      }
 				});
 			});
 		});
 		
 		function funSubmitInfo()
 		{
 			if($("#userName").val() == "帐号")
 			{
 				alert("注册手机号！");
 				return false;
 			}	
 			else if(reg.test($("#userName").val()) == false)
			{
				alert("11位手机号码不正确")
				return false;
			}	
 			else if($("#rand").val() == "")
 			{
 				alert("短信验证码！");
 				return false;
 			}
 			else if($("#userPwd").val() == "")
 			{
 				alert("登录密码不能为空！");
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
				<form action="<c:url value='/p/query/goReg.do'/>" method="post" onsubmit="return funSubmitInfo()" name="inputform" id="inputform">
				<table cellpadding="0" cellspacing="0" border="0" style="width: 100%;">
					<tr>
						<td style="height: 6px;" colspan="2"></td>
					</tr>
					<tr>
						<td style="height: 65px; font-size: 36px;" colspan="2" align="center">&nbsp;
							帐号注册
						</td>
					</tr>
					<tr>
						<td style="height: 6px;" colspan="2"></td>
					</tr>
					<tr>
						<td align="right" style="width: 90px;">注册手机号</td>
						<td style="padding-left: 15px;">
							<input type="text" id="userName" name="userName" maxlength="11" placeholder="请输入11位手机号码" style="height: 35px; width: 90%; color: #666666; padding-left: 15px; text-align: left;line-height: 35px;" title="用户名">
						</td>
					</tr>
					<tr>
						<td style="height: 6px;" colspan="2"></td>
					</tr>
					<tr>
						<td align="right">短信验证码</td>
						<td style="padding-left: 15px;">
							<table style="width: 90%;" cellpadding="0" cellspacing="0" border="0">
								<tr>
									<td>
										<input name="rand" type="text" placeholder="请输入短信验证码" maxlength="16" id="rand" onfocus="this.select(); " style="height: 35px; width: 100%; color: #666666; padding-left: 15px; text-align: left;line-height: 35px;">
									</td>
									<td align="left" style="width: 100px; padding-left: 25px;">
										<div style="background:url(<c:url value='/patient/themes/images/btn_bg.png'/>); height:35px; width:100px; line-height:35px; color:#fff; text-align:center; cursor:pointer;" id="smsrand">获取验证码</div>
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td style="height: 6px;" colspan="2"></td>
					</tr>
					<tr>
						<td align="right">登<span style="padding: 0 2px;"></span>录<span style="padding: 0 2px;"></span>密<span style="padding: 0 2px;"></span>码</td>
						<td style="padding-left: 15px;">
							<input name="userPwd" type="password" maxlength="16" placeholder="请输帐号登录密码" id="userPwd" onfocus="this.select(); " style="height: 35px; width: 90%; color: #666666; padding-left: 15px; text-align: left;line-height: 35px; " title="用户名">
						</td>
					</tr>
					<tr>
						<td style="height: 20px;" colspan="2"></td>
					</tr>
					<tr>
						<td colspan="2">
							<table cellspacing="0" cellpadding="0" border="0" style="width: 100%;">
								<tr>
									<td align="center">
										<input  type="submit" id="btnsubmit" name="btnsubmit"  style="display: none;"/>
										<div style="background:url(<c:url value='/patient/themes/images/btn_bg.png'/>); height:35px; width:120px; line-height:35px; color:#fff; text-align:center; cursor:pointer;" onclick="$('#btnsubmit').click()">注册</div>
									</td>
									<td align="center">
										<div style="background:url(<c:url value='/patient/themes/images/btn_bg.png'/>); height:35px; width:120px; line-height:35px; color:#fff; text-align:center; cursor:pointer;" id="retset">重置</div>
									</td>
								</tr>
							</table>
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