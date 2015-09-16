<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/patient/common/taglibs-include.jsp" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
    <base href="<%=basePath%>">
    <title>自已人健康服务中心 </title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">  
	<meta name="viewport" content="width=device-width,height=device-height,initial-scale=1.0,maximum-scale=1.0,user-scalable=no">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0"> 
    <%@ include file="/WEB-INF/patient/common/mobile-include.jsp"%>
    <style>
    	input, select,textarea{border:1px solid #ccc; height: 35px; width: 85%; padding-left: 10px;}
    </style>
	<script type="text/JavaScript">
		function funSave()
		{
			if($("#title").val() == "")
			{
				alert("标题不能为空！")
				return ;	
			}
		
			if($("#content2").val() == "")
			{
				alert("内容不能为空！")
				return ;	
			}
			PageMobile.funLoadIng();
			$.ajax({
			      url : "<c:url value='/app/addHappyHostPost.do'/>?a=" + Math.random(),
			      type : 'post',
			      dataType : 'json',
			      data : {
			        "happyHostId" : "${query.id}",
			        "title": $("#title").val(),
			        "content" : $("#content2").val(),
			        "userId" : "${query.userId}",
			      },
			      error : function(data) {
			    	  PageMobile.funLoadHidden();
			      },
			      success : function(data) 
			      {
			    	  PageMobile.funLoadHidden();
			    	  alert(data.msg)
			    	  if(data.success)
			    	  {
			    		  window.location.href = "<c:url value='/p/query/toNext.do'/>?id=${query.id}&name=${query.name}";
			    	  }
			      }
			  });
		}
	</script>
  </head>
<body>
	<header id="header">
  		发表话题
  		<div class="left"><a id="back" href="<c:url value='/p/query/toNext.do'/>?id=${query.id}&name=${query.name}" onclick="PageMobile.funLoadIng();"><span class="corner"></span></a></div>
  	</header>
  	<div id="content">
  		<table cellpadding="0" border="0" cellspacing="0" style="font-size: 18px; width: 100%;">
    		<tr><td style="height: 25px;"></td></tr>
    		<tr>
    			<td align="center" >
    				<input type="text" id="title"  onblur="$(this).val($.trim($(this).val()))" style="height: 40px;font-size: 18px;" placeholder="标题">
    			</td>
    		</tr>
    		<tr><td style="height: 8px;"></td></tr>
    		<tr>
    			<td align="center">
    				<textarea name="textarea" id="content2" style="height: 150px;font-size: 18px;" placeholder="内容"></textarea>	
    			</td>
    		</tr>
    		<tr>
    			<td align="center">
    				<ul>
    					<li class="btn_reguster"><a onclick="funSave()" style="cursor: pointer;">提交</a></li>
    				</ul>
    			</td>
    		</tr>
    	</table>
	</div>		
	<footer id="footer">
		<jsp:include page="/WEB-INF/patient/common/footer-include.jsp">
			<jsp:param value="2" name="selected"/>
		</jsp:include>
	</footer>	
</body>
</html>
