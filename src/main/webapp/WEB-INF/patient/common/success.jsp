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
			var tmp = 10
			window.setInterval(function(){
				if(tmp <= 0)
				{
					window.location.href = "<c:url value='/p/mobile.do'/>";
				}	
				else
				{
					tmp -= 1;
	 				$("#ms").text(tmp);
				}	
			}, 1000)
		});
	</script>
  </head>
  <body class="radial">
	<div class="new_wrapper">
	   <table cellpadding="0" cellspacing="0" border="0" style="width: 100%;">
		<tr>
			<td style="height: 46px;" colspan="2"></td>
		</tr>
		<tr>
			<td style="height: 65px; font-size: 24px; color: #fff;" colspan="2" align="center">&nbsp;
				${errorinfo}
			</td>
		</tr>
		<tr>
			<td style="height: 65px; color: #fff;" colspan="2" align="center">&nbsp;
				10秒后自动<a href="<c:url value='/p/mobile.do'/>" style="color:red">跳转</a>登录界面,还剩<span id="ms">10</span>秒...<br/>
			</td>
		</tr>
	</table>
	</div>
  </body>
</html>