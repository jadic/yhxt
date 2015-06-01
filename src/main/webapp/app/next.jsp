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
		var PageZjData = null;
		$(function(){
			//$("#aa, #bb").css("width", $("#cc").width())
			$("li a").bind("click", function(){
				$("li a").css("background", "#fff");
				$(this).css("background", "#f7fbc5");
			});
			$("#main1").css("height", $(window).height() - 120);
			$("body").on("swipeleft",function(){
				
				$("#aa").animate({"left":-$("#aa").width() - 5}, function(){
					$("#show1").css({"border-bottom":"3px solid #e7e7e7", "color":"#000"});
					$("#show2").css({"border-bottom":"3px solid #95b200", "color":"#95b200"});
				});
				$("#bb").animate({"left":0});
			});
			$("body").on("swiperight",function(){
				$("#aa").animate({"left":0}, function(){
					$("#show2").css({"border-bottom":"3px solid #e7e7e7", "color":"#000"});
					$("#show1").css({"border-bottom":"3px solid #95b200", "color":"#95b200"});
				});
				$("#bb").animate({"left":$("#aa").width() + 5});
			});
			
			PageShow.funSearch("<c:url value='/app/happyHostPost.do'/>", {
		    	"happyHostId" : "${param.id}",  
		        "page" : 1,
		        "row" : 10
		      }, "#aa");
			
			PageShow.funSearch("<c:url value='/app/happyHostZrPost.do'/>", {
		    	"happyHostId" : "${param.id}",  
		        "page" : 1,
		        "row" : 10
		      }, "#bb");
			PageShow.funSwipeDiv();
		})
		
		
		var PageShow = 
		{
			funSearch : function(paramUrl, paramObj, paramId)
			{
				$.ajax({
				      url : paramUrl + "?a=" + Math.random(),
				      type : 'post',
				      dataType : 'json',
				      data : paramObj,
				      error : function(data) {
				      },
				      success : function(data) 
				      {
				    	  PageShow.funDealZjShow(data, paramId);
				      }
				  });
			},
			funDealZjShow : function(data, paramId)
			{
				if(data != null && data.total > 0)
				{
					for(var nItem=0; nItem<data.total; nItem++)
					{
						var row = data.rows[nItem];
						var tmp = '<li>' +
									'<a data-ajax="false" href="./detail.jsp?id=${param.id}&name=${param.name}&userId=${param.userId}&postId='+row.id+'"  style="background: #fff; height: 55px; padding: 5px;">' +
										'<div style="font-size: 14px; font-weight: normal; padding-left: 25px; line-height: 20px; height: 20px; padding-bottom: 4px;">'+row.title+'</div>' +
										'<table cellspacing="0" cellpadding="0" style="width: 100%; font-size: 12px; font-weight: normal; height: 24px;">' +
											'<tr>' +
												'<td style="width: 25px;"><img src="<c:url value="/'+row.photo+'"/>" style="width: 20px; height: 20px;"></td>' +
												'<td style="color: #95b200; width:40%; padding-left:5px;">'+row.userName+'</td>' +
												'<td style="color: #878887;  width:40%;">'+row.stime+'</td>' +
												'<td style="color: #878887;  min-width:30px;" align="right">'+row.laudCnt+'</td>' +
												'<td style="color: #878887;  width: 20px;" align="left"><img src="<c:url value='/app/self/images/bbs_good.png'/>" style="width: 16px; height: 16px;"></td>' +
												'<td style="color: #878887;  min-width:30px;" align="right">'+row.replyCnt+'</td>' +
												'<td style="color: #878887;  min-width: 50px;" align="left"><img src="<c:url value='/app/self/images/bbs_reply.png'/>" style="width: 16px; height: 16px;"></td>' +
											'</tr>' +
										'</table>' +
									'</a>' +
								'</li>';
						$(paramId).append(tmp)
					}	
					$(paramId).listview('refresh');
				}	
				
				PageShow.funSwipeDiv();
			},
			funSwipeDiv : function()
			{
				try
				{
					$("#aa").css({"left":0, "position":"relative", "top":1});
					$("#bb").css({"left":$("#aa").width(), "position":"relative", "top":17-$("#aa").height()});
				}
				catch(e)
				{
					alert(e);
				}
			}
		}
	</script>
</head>
<body style="overflow: hidden; background-color: #fff;">

<div data-role="page" id="pageone" class="jqm-demos" data-add-back-btn="true">
	<div data-role="header" id="head" style="border-bottom-width:0px; background: #f6f6f6; height: 64px;">
		<div style="height: 20px; width: 100%;"></div>
		<table cellspacing="0" cellpadding="0" style="width: 100%; height: 44px;">
			<tr>
				<td style="width: 45px;" align="center"><img  onclick="window.location.href='<c:url value='/app/index.jsp'/>?userId=${param.userId}'" data-ajax="false" src="<c:url value='/app/self/images/back.png'/>" style="height: 35px; height: 35px;  cursor: pointer;"></td>
				<td style="color: #929292; font-size: 16px; font-weight: normal; " align="center">${param.name }</td>
				<td style="width: 45px;" align="center"><img onclick="window.location.href='<c:url value='/app/add.jsp'/>?id=${param.id}&name=${param.name}&userId=${param.userId}'" data-ajax="false" src="<c:url value='/app/self/images/subject_publish_n.png'/>" style="height: 35px; height: 35px; cursor: pointer;"></td>
			</tr>
		</table>
	</div>
	<div style="position: relative; width:100%;  background: #f6f6f6;">
		<div id="show1" style="width:50%; background: #f6f6f6; border-bottom:3px solid #95b200; line-height:40px; float: left; text-align: center; font-size: 14px; font-weight: normal; color: #95b200; ">最新</div>
		<div id="show2" style="width:50%; background: #f6f6f6; border-bottom:3px solid #e7e7e7; line-height:40px; float: left; text-align: center; font-size: 14px; font-weight: normal;">最热</div>
	</div>
	<div id="main1" role="main"  class="ui-content jqm-content" style="overflow: auto; background: #fff;" >
		<ul id="aa" data-role="listview" style="position: relative;">
			
		</ul>	
	
		<ul id="bb" data-role="listview">
			
		</ul>	
	</div>		
</div>
</body>
</html>
