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
	<style type="text/css">
		input, select,textarea{border:1px solid #ccc; height: 35px; width: 85%; padding-left: 10px;}
	</style>
	<script type="text/JavaScript">
		function funSaveInfo()
		{
			PageMain.funOpenProgress();
			$.ajax({
				url : _ctx_ + "/p/query/nurserequest.do?a="+ Math.random(),
				type : 'post',
				dataType : 'json',
				data : 
				{
					"nurseId": "${query.id}",
					"statis": 0,
					"memo": $("#memo").val()
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
						$.messager.confirm('确认', "申请成功，请耐心等待！", function(r)
						{
							window.location.href = "<c:url value='/p/query/mynuser.do'/>";
						});
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
	<header id="header">
  		申请医护人员
  		<div class="left"><a href="javascript:void(0)" onclick="window.history.back()"><span class="corner"></span></a></div>
  	</header>
  	<div id="content">
        	<table cellpadding="0" border="0" cellspacing="0" style="font-size: 13px; width: 100%;">
	    		<tr>
	    			<td align="left" style="padding: 5px 0 0 15px;  height: 30px; color: #aeaeae; font-size: 16px;">
	    				医护人姓名：
	    			</td>
	    		</tr>
	    		<tr>	
	    			<td align="left" style="padding: 5px 0 0 15px">
	    				<input type="text" id="name" name="name" maxlength="50" value="${query.name }">
	    				<span style="color: red;">*</span>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td align="left" style="padding: 5px 0 0 15px;  height: 30px; color: #aeaeae; font-size: 16px;">
	    				备<span style="padding: 0 13px;"></span>注：
	    			</td>
	    		</tr>
	    		<tr>	
	    			<td align="left" style="padding: 5px 0 0 15px">
	    				<input type="hidden" id="id" name="id" value="${diseaseHis.id}"/>
	    				<textarea  style="height: 80px;" id="memo" name="memo" maxlength="250"></textarea>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td align="center">
	    				<ul>
	    					<li class="btn_reguster" style="width: 100%"><a onclick="funSaveInfo()" style="cursor: pointer;">我要申请</a></li>
	    				</ul>
	    			</td>
	    		</tr>
	    	</table>
  
	</div>
	<footer id="footer">
		<jsp:include page="/WEB-INF/patient/common/footer-include.jsp">
			<jsp:param value="3" name="selected"/>
		</jsp:include>
	</footer>   
</body>
</html>
