<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
  	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />  
    <title>南京艺格儿展示工程有限公司</title>
 	<%@ include file="/WEB-INF/admin/common/top-include.jsp" %>
 	<script>
 		$(function(){
 			<c:if test="${not empty errorinfo}">
 				alert("${errorinfo}");
 			</c:if>
 		});
 		
 		function funSubmitInfo()
 		{
 			if(document.getElementById("userName").value == "")
 			{
 				alert("登录用户名不能为空！");
 				return false;
 			}	
 			else if(document.getElementById("userPwd").value == "")
 			{
 				alert("登录密码不能为空！");
 				return false;
 			}
 			else if(document.getElementById("rand").value == "")
 			{
 				alert("验证码不能为空！");
 				return false;
 			}
 			return true;
 		}
 	</script>
  </head>
  <body style="padding: 0px; margin: 0px; background: #39609b; padding-top: 200px;">
  	<form action="${ctx}/a/login.do" method="post" onsubmit="return funSubmitInfo()">
	  	<div style="height: 181px; width:100%; background: url('<c:url value='/admin/themes/self/login/001.png'/>') repeat-x;">
	 		<table border="0" style=" width: 700px; margin: auto; ">
	 			<tr>
	 				<td style="width: 340px;" align="center">
	 					<img src="${ctx}/admin/themes/self/login/003.png" alt="" />
	 				</td>
	 				<td>
	 					<table border="0" style="width: 350px;  font-size: 12px; height:180px; background: url('<c:url value='/admin/themes/self/login/002.png'/>') no-repeat;">
							<tr><td colspan="2"></td></tr>
							<tr>
								<td style="height: 25px; width: 100px; font-size: 12px;" align="center">用户名：</td>
								<td><input name="userName" id="userName" class="njty_text"/></td>
							</tr>
							<tr>
								<td style="height: 25px; width: 100px; font-size: 12px;" align="center">密<span style="padding: 0 6px;"></span>码：</td>
								<td><input name="userPwd" id="userPwd" class="njty_text" type="password"/></td>
							</tr>
							<tr>
								<td style="height: 25px; width: 100px; font-size: 12px;" align="center">验证码：</td>
								<td>
									<table border="0" cellpadding="0" cellspacing="0" style="padding: 0px; margin: 0px;">
										<tr>
											<td>
												<input name="rand" id="rand" class="njty_text" style="width: 100px;"/>
											</td>
											<td>
												<img src="${ctx}/a/img.do" style="cursor: pointer;" onclick="this.src=this.src+'?'"/>
											</td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td style="height: 25px;" colspan="2" align="center">
									<input type="submit" />
									<input type="reset"/>
								</td>
							</tr>
							<tr><td colspan="2"></td></tr>
				  		</table>
	 				</td>
	 			</tr>
	 		</table>
	  	</div>
	</form>	
  </body>
</html>