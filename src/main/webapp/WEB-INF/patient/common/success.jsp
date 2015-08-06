<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/patient/common/taglibs-include.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
  	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">  
    <title>自已人健康服务中心</title>
    <style>
    	.inputMin_informationModify{width:218px; height:28px; border:1px solid #aeaeae; padding-left:10px; font:13px/28px "微软雅黑"; color:#000}
    </style>
    <script type="text/javascript" src="<c:url value='/common/scripts/jquery-1.8.0.min.js'/>" ></script>
 	<script>
 		$(function(){
 			var tmp = 10
 			window.setInterval(function(){
 				if(tmp == 0)
 				{
 					window.location.href = "<c:url value='/p/mobile.do'/>";
 				}	
 				tmp -= 1;
 				$("#ms").text(tmp);
 			}, 1000)
 		});
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
				<table cellpadding="0" cellspacing="0" border="0" style="width: 100%;">
					<tr>
						<td style="height: 46px;" colspan="2"></td>
					</tr>
					<tr>
						<td style="height: 65px; font-size: 20px;" colspan="2" align="center">&nbsp;
							${errorinfo}
						</td>
					</tr>
					<tr>
						<td style="height: 65px;" colspan="2" align="center">&nbsp;
							10秒后自动<a href="<c:url value='/p/mobile.do'/>">跳转</a>登录界面,还剩<span id="ms">10</span>秒...<br/>
						</td>
					</tr>
				</table>
			</td>
			<td >&nbsp;</td>
		</tr>
	</table>
  </body>
</html>