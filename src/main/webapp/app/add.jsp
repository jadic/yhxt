<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/patient/common/taglibs-include.jsp" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
    <title>快乐驿站 </title>
    <link rel="stylesheet" href="<c:url value='/app/jquerymobile/jquery.mobile-1.4.5.min.css'/>">
	<script src="<c:url value='/app/jquerymobile/jquery.min.js'/>"></script>
	<script src="<c:url value='/app/jquerymobile/jquery.mobile-1.4.5.min.js'/>"></script>
		<script type="text/javascript">
		$(function(){
			$("#content").css("height", 150);
		});
		
		function funSave()
		{
			
			if($("#title").val() == "")
			{
				PageLoad.funAlert("标题不能为空！")
				return ;	
			}
		
			if($("#content").val() == "")
			{
				PageLoad.funAlert("内容不能为空！")
				return ;	
			}
			PageLoad.funProgress();
			$.ajax({
			      url : "<c:url value='/app/addHappyHostPost.do'/>?a=" + Math.random(),
			      type : 'post',
			      dataType : 'json',
			      data : {
			        "happyHostId" : "${param.id}",
			        "title": $("#title").val(),
			        "content" : $("#content").val(),
			        "userId" : "${param.userId}",
			      },
			      error : function(data) {
			    	  PageLoad.funHide();
			      },
			      success : function(data) 
			      {
			    	  PageLoad.funHide();
			    	  PageLoad.funAlert(data.msg)
			    	  if(data.success)
			    	  {
			    		  window.setTimeout(function(){
				    		  window.location.href='./next.jsp?id=${param.id}&name=${param.name}&userId=${param.userId}'
			    		  }, 1000);
			    	  }
			      }
			  });
		}
		
		var PageLoad = {
			funAlert : function(msg)
			{
				$.mobile.loading( "show", {
					textVisible: true,
					theme: "b",
					textonly: false,
					html:msg
				});
				
				window.setTimeout(function(){
					PageLoad.funHide();
				}, 1000);
			},
			funProgress : function(msg)
			{
				$.mobile.loading( "show", {
					text: msg,
					textVisible: true,
					theme: "b",
					textonly: false,
					html:""
				});
			},
			funHide : function()
			{
				$.mobile.loading( "hide" );
			}
		}
	</script>
</head>
<body style="overflow: hidden; background-color: #fff;">

<div data-role="page" class="jqm-demos" data-add-back-btn="true">
	<div data-role="header" style="border-bottom-width:1px; background: #f6f6f6;">
		<div style="height: 20px; width: 100%;"></div>
		<table cellspacing="0" cellpadding="0" style="width: 100%; height: 44px;">
			<tr>
				<td style="width: 45px;" align="center">
					<img onclick="window.location.href='./next.jsp?id=${param.id}&name=${param.name}&userId=${param.userId}'" src="<c:url value='/app/self/images/back.png'/>" style="height: 35px; height: 35px;cursor: pointer;">
				</td>
				<td style="color: #929292; font-size: 16px; font-weight: normal; " align="center">发表话题</td>
				<td style="width: 45px;" align="center">&nbsp;</td>
			</tr>
		</table>
	</div>
	<div role="main"  class="ui-content jqm-content" style="overflow: auto; background: #fff;" >
		<input type="text" name="text-basic" id="title">
				
		<textarea name="textarea" id="content" height="160"></textarea>	
		
		<input type="button" value="提交" style="background: #fff; color: #7fdf53" onclick="funSave()">
	</div>		
</div>
</body>
</html>
