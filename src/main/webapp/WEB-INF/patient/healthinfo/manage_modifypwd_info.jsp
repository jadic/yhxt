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
    <title>南京通用电器有限公司 </title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0"> 
	<%@ include file="/WEB-INF/patient/common/top-include.jsp"%>
	<%@ include file="/WEB-INF/patient/common/easyui-include.jsp"%>
	<link rel="stylesheet" href="<c:url value='/patient/themes/health_records.css'/>" type="text/css"/>
	<script type="text/JavaScript">
		function changePwd()
		{
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
<body>
  <div class="information_modify">
    <div class="title_informationModify"><span class="tgrey_title_informationModify">密码</span>修改</div>
    <div class="information_modify_main" id="main_div">
        <div class="informationModify_main">
        	<table cellpadding="0" border="0" cellspacing="0" style="font-size: 13px; width: 100%;">
	    		<tr>
	    			<td align="right" style="padding: 5px 5px 5px 0; width:70px; height: 45px; color: #aeaeae; font-size: 13px;">
	    				旧<span style="padding: 0 3px;"></span>密<span style="padding: 0 3px;"></span>码：
	    			</td>
	    			<td align="left" class="register_input">
	    				<input type="password" id="out01" >
	    			</td>
	    		</tr>
	    		<tr>
	    			<td align="right" style="padding: 5px 5px 5px 0; width:70px; height: 45px; color: #aeaeae; font-size: 13px;">
	    				新<span style="padding: 0 3px;"></span>密<span style="padding: 0 3px;"></span>码：
	    			</td>
	    			<td align="left" class="register_input">
	    				<input type="password" id="out02" >
	    			</td>
	    		</tr>
	    		<tr>
	    			<td align="right" style="padding: 5px 5px 5px 0; width:70px; height: 45px; color: #aeaeae; font-size: 13px;">
	    				确认密码：
	    			</td>
	    			<td align="left" class="register_input">
	    				<input type="password" id="out03" >
	    			</td>
	    		</tr>
	    		<tr>
	    			<td align="center" colspan="2">
	    				<ul>
	    					<li class="btn_reguster"><a onclick="changePwd()" style="cursor: pointer;">确定</a></li>
	    				</ul>
	    			</td>
	    		</tr>
	    	</table>
	    </div>	
    </div>
</div>
   
</body>
</html>
