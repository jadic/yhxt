<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/nurse/common/taglibs-include.jsp" %>
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
	<%@ include file="/WEB-INF/nurse/common/top-include.jsp"%>
	<%@ include file="/WEB-INF/patient/common/easyui-include.jsp"%>
	
	<link rel="stylesheet" href="<c:url value='/nurse/themes/health_records.css'/>" type="text/css"/>
	<style type="text/css">
		td{word-break:break-all;}
		.index_table table#faceTable tr th{
			line-height: normal;
		}
	</style>
	<script type="text/JavaScript">
		function queryStart()
		{
			$("#inputform").submit();
		}
		
		function goMerge(id, name, command)
		{
			window.location.href = "<c:url value='/n/search/mergeAdvice.do'/>?id="+id + "&name="+name + "&command="+command + "&userId="+${query.userId};
		}
		
		
		function funDelete(obj, id)
		{
			$.messager.confirm('确认', "您确认要删除这条记录吗？", function(r)
			{
				if (r)
				{
					/**打开进度条**/
					PageMain.funOpenProgress();
					
					$.ajax({
						url : _ctx_ + "/n/search/delAdvice.do?a="+ Math.random(),
						type : 'post',
						dataType : 'json',
						data : 
						{
							"id": id						
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
								$.messager.alert('信息提示', data.msg, 'info');
								$(obj).parent().parent().remove();
							}
							else
							{
								$.messager.alert('信息提示', data.msg, 'error');
							}
						}
					});
				}
			});
		}
	</script>
  </head>
<body style="background: #ffffff; min-height: 600px;">
	<div class="account" >
		<div class="account_title" >
	      <ul>
	        <li class="account_titleGreen" >检测分析</li>
	        
	        <li class="account_titleGray" style="padding-top: 1px; padding-bottom:0px; height: 47px;">
	        	<ul style=" padding-right:10px;">
	        	      <li class="select_BPhistory" style="width: 140px; height:40px; padding-top: 3px; float: right;">
	        	      </li>
	        	</ul>
	        </li>
	      </ul>
	    </div>
	</div>    
  <div class="information_modify">
    <div class="information_modify_main" id="main_div">
    
       
		
    </div>
</div>
   
</body>
</html>
