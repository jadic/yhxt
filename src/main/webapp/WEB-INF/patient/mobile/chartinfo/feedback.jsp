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
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">  
	<meta name="viewport" content="width=device-width,height=device-height,initial-scale=1.0,maximum-scale=1.0,user-scalable=no">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0"> 
    <%@ include file="/WEB-INF/patient/common/mobile-include.jsp"%>
    <%@ include file="/WEB-INF/patient/common/easyui-include.jsp"%>
    <style>
    	input, select{border:1px solid #ccc; height: 35px; width: 90%;}
    	textarea{border:1px solid #ccc; height: 155px; width: 90%;}
    	#content table td{height: 45px;}
    </style>
	<script type="text/JavaScript">
	function funSaveFeedBackInfo()
	{
		/**打开进度条**/
		$.ajax({
			url : _ctx_ + "/p/query/addFeedBack.do?a="+ Math.random(),
			type : 'post',
			dataType : 'json',
			data : 
			{
				"content": $("#in002").val(),
				"type": $("#in001").val()	
			},
			error:function(data)
			{
			},
			success:function(data)
			{
				if(data.success)
				{
					$.messager.confirm('确认', data.msg, function(r)
					{
						window.location.href = "<c:url value='/p/my.do'/>";
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
<body style="padding: 0px; margin: 0px;">
  	<header id="header">
  		意见反馈
  		<div class="left"><a href="javascript:void(0)" onclick="window.history.back()"><span class="corner"></span></a></div>
  	</header>
  	<div id="content">
        	<table cellpadding="0" border="0" cellspacing="0" style="font-size: 18px; width: 100%;">
	    		<tr>
	    			<td align="left" style="padding-left: 15px; width:70px; height:30px; color: #aeaeae; font-size: 18px;" valign="bottom">
	    				反馈类型：
	    			</td>
	    		</tr>
	    		<tr>	
	    			<td align="left" style="padding-left: 15px;" valign="top">
	    				<select id="in001">
		                    <option value="0">网站建设反馈</option>
		                    <option value="1">服务反馈</option>
		               </select>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td align="left" style="padding-left: 15px; width:70px; color: #aeaeae; height:20px; font-size: 18px;" valign="bottom">
	    				反馈内容：
	    			</td>
	    		</tr>
	    		<tr>	
	    			<td align="left" style="padding-left: 15px;">
	    				<textarea id="in002"></textarea>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td align="center">
	    				<ul>
	    					<li class="btn_reguster" style="width: 100%"><a onclick="funSaveFeedBackInfo()" style="cursor: pointer; width: 300px;">确定</a></li>
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
