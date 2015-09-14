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
    <%@ include file="/WEB-INF/patient/common/easyui-include.jsp"%>
    <style>
    	input{border:1px solid #ccc; height: 35px; width: 85%; padding-left: 10px;}
    	#content table td{height: 50px;}
    </style>
	<script type="text/JavaScript">
		function changePwd()
		{
			if($("#out01").val() == "")
			{
				$.messager.alert('信息提示', '旧密码不能为空！', 'error');
				return false;
			}
			else if($("#out02").val() == "")
			{
				$.messager.alert('信息提示', '新密码不能为空！', 'error');
				return false;
			}
			else if($("#out02").val() != $("#out03").val())
			{
				$.messager.alert('信息提示', '确认密码与新密码不一致！', 'error');
				return false;
			}
			PageMain.funOpenProgress();
			$.ajax({
				url : _ctx_ + "/p/query/updatePwd.do?a="+ Math.random(),
				type : 'post',
				dataType : 'json',
				data : 
				{
					"userPwd": $('#out01').val(),
					"userNewPwd": $('#out02').val()
				},
				error:function(data)
				{
					/**关闭进度条**/
					PageMain.funCloseProgress();
					$.messager.alert('信息提示', '操作失败：提交超时或此方法不存在！', 'error');
				},
				success:function(data)
				{
					
					/**关闭进度条**/
					PageMain.funCloseProgress();
					
					/**数据处理**/
					if(data.success)
					{
						$.messager.alert('信息提示', '密码修改成功！', 'info');
					}
					else
					{
						$.messager.alert('信息提示', data.msg, 'error');
					}
				}
			});
		}
	</script>
  </head>
 <body style="padding: 0px; margin: 0px">
  	<header id="header">
  		修改密码
  		<div class="left"><a href="javascript:void(0)" onclick="PageMobile.funLoadIng();window.history.back()"><span class="corner"></span></a></div>
  	</header>
  	<div id="content">
       	<table cellpadding="0" border="0" cellspacing="0" style="font-size: 18px; width: 100%;">
    		<tr><td style="height: 20px;"></td></tr>
    		<tr>
    			<td align="center" >
    				<input type="password" id="out01"  onblur="$(this).val($.trim($(this).val()))" placeholder="旧密码">
    			</td>
    		</tr>
    		<tr>
    			<td align="center">
    				<input type="password" id="out02"  onblur="$(this).val($.trim($(this).val()))" placeholder="新密码" >
    			</td>
    		</tr>
    		<tr>
    			<td align="center">
    				<input type="password" id="out03"  onblur="$(this).val($.trim($(this).val()))" placeholder="确认密码">
    			</td>
    		</tr>
    		<tr>
    			<td align="center">
    				<ul>
    					<li class="btn_reguster"><a onclick="changePwd()" style="cursor: pointer;">确定</a></li>
    				</ul>
    			</td>
    		</tr>
    	</table>
   </div>
	
	<footer id="footer">
		<footer id="footer">
		<jsp:include page="/WEB-INF/patient/common/footer-include.jsp">
			<jsp:param value="3" name="selected"/>
		</jsp:include>
	</footer>
</body>
</html>
