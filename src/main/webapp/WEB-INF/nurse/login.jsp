<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/nurse/common/taglibs-include.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
  	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />  
    <title>自已人健康服务中心</title>
 	
  </head>
  <body style="padding: 0px; margin: 0px; padding-top: 200px;">
  	<form action="<c:url value='/n/search/login.do'/>" method="post" onsubmit="return funSubmitInfo()">
	  	<div style="height: 181px; width:100%;">
	 		<table border="0" style="width: 700px; margin: auto; ">
	 			<tr>
	 				<td align="center">
	 					<table border="1" style="width: 350px;  font-size: 12px; height:180px;">
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
												<img src="<c:url value='/n/img.do'/>" style="cursor: pointer;" onclick="this.src=this.src+'?'"/>
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