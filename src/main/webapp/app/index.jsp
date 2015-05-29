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
		var PageData = null;
		$(function(){
			$("li a").bind("click", function(){
				$("li a").css("background", "#fff");
				$(this).css("background", "#f7fbc5");
			});
			$("#main1").css("height", $(window).height() - 105);
			
			funSearch();
		})
	
		function funSearch()
		{
			$.ajax({
		      url : "<c:url value='/app/happyHost.do'/>?a=" + Math.random(),
		      type : 'post',
		      dataType : 'json',
		      data : {
		        "page" : 1,
		        "row" : 10
		      },
		      error : function(data) {
		      },
		      success : function(data) 
		      {
		    	  PageData = data;
		    	  funDealShow();
		      }
		  });
		}
		
		function funBack()
		{
			return 0;	
		}
		
		function funDealShow()
		{
			if(PageData != null && PageData.total > 0)
			{
				for(var nItem=0; nItem<PageData.total; nItem++)
				{
					var row = PageData.rows[nItem];
					var tmp = '<li>' +
								'<a data-ajax="false" href="./next.jsp?id='+row.id+'&name='+row.title+'&userId=${param.userId}"  style="background: #fff;">' +
									'<img src="<c:url value='/app/jquerymobile/img/app_01.png'/>">' +
									'<h2>' +
										'<div style="float: left; font-size: 16px;">'+row.title+'</div>' +
										'<div style="float: right; width: 60px; color: #acc241; font-size: 12px; font-weight: normal;">'+row.cnt+'话题</div>' +
									'</h2>' +
									'<p style="color: #a7a7a7; font-size: 12px;">'+row.content+'</p>' +
								'</a>' +
							'</li>';
					$("#showlist").append(tmp)
				}	
				$('ul').listview('refresh');
			}	
		}
	</script>
  </head>
<body>
	<div data-role="page" class="jqm-demos" data-quicklinks="true">
	<div data-role="header" id="head" style="border-bottom-color: #95b200; border-bottom-width:3px; background: #f6f6f6; height: 64px;">
		<div style="height: 20px;"></div>
		<h1 style="color: #929292; font-size: 16px; font-weight: normal;">圈子</h1>
	</div>
	<div id="main1" role="main"  class="ui-content jqm-content" style="overflow: auto; margin-top: 1px; background: #fff;" >
		<ul data-role="listview" id="showlist">
			
		</ul>
	</div>		
</div>
</body>
</html>
