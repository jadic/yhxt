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
    	input, select,textarea{border:1px solid #ccc; height: 30px; width: 95%; padding-left: 10px;}
    	#content table td{height: 35px;}
    </style>
	<script type="text/JavaScript">
		function funSaveInfo()
		{
			if($("#out1").val() == "")
			{
				alert("标题不能为空！");
				return false;
			}
			if($("#out2").val() == "")
			{
				alert("内容不能为空！");
				return false;
			}
			
			/**打开进度条**/
			PageMain.funOpenProgress();
			$.ajax({
				url : _ctx_ + '/p/query/addPost.do?a='+ Math.random(),
				type : 'post',
				dataType : 'json',
				data : 
				{
					"title"	: $("#out1").val(),
					"content": $("#out2").val()
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
						$.messager.confirm('确认', "操作成功，你要返回查询列表吗？", function(r)
						{
							if (r)
							{
								window.location.href = "<c:url value='/p/query/post.do'/>";
							}
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
	<header id="header">
  		我要发帖
  		<div class="left"><a href="javascript:void(0)" onclick="window.history.back()"><span class="corner"></span></a></div>
  	</header>
  	<div id="content" style="padding: 14px;">
       	<table cellpadding="0" border="0" cellspacing="0" style="font-size: 13px; width: 100%;">
    		<tr>
    			<td align="left" style="padding: 5px; color: #aeaeae; font-size: 13px;">
    				帖子标题：
    			</td>
    		</tr>
    		<tr>
    			<td align="left">
    				<input type="text" id="out1">
    			</td>
    		</tr>
    		<tr>
    			<td align="left" style="padding: 5px; color: #aeaeae; font-size: 13px;">
    				帖子内容：
    			</td>
    		</tr>
    		<tr>
    			<td align="left">
    				<textarea id="out2" style="height: 150px;" >${activity.content }</textarea>
    			</td>
    		</tr>
    		<tr>
    			<td align="center" >
    				<ul>
    					<li class="btn_reguster" style="margin-top: 20px;"><a onclick="funSaveInfo()" style="cursor: pointer;">保存</a></li>
    				</ul>
    			</td>
    		</tr>
    	</table>
   </div>
   <footer id="footer">
		<footer id="footer">
		<jsp:include page="/WEB-INF/patient/common/footer-include.jsp">
			<jsp:param value="2" name="selected"/>
		</jsp:include>
	</footer> 
</body>
</html>
