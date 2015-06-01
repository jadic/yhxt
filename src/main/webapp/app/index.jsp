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
		
		
//返回角度
function GetSlideAngle(dx, dy) {
    return Math.atan2(dy, dx) * 180 / Math.PI;
}
 
//根据起点和终点返回方向 1：向上，2：向下，3：向左，4：向右,0：未滑动
function GetSlideDirection(startX, startY, endX, endY) {
    var dy = startY - endY;
    var dx = endX - startX;
    var result = 0;
 
    //如果滑动距离太短
    if (Math.abs(dx) < 2 && Math.abs(dy) < 2) {
        return result;
    }
 
    var angle = GetSlideAngle(dx, dy);
    if (angle >= -45 && angle < 45) {
        result = 4;
    } else if (angle >= 45 && angle < 135) {
        result = 1;
    } else if (angle >= -135 && angle < -45) {
        result = 2;
    }
    else if ((angle >= 135 && angle <= 180) || (angle >= -180 && angle < -135)) {
        result = 3;
    }
 
    return result;
}
 
//滑动处理
var startX, startY;
document.addEventListener('touchstart', function (ev) {
    startX = ev.touches[0].pageX;
    startY = ev.touches[0].pageY;   
}, false);
document.addEventListener('touchend', function (ev) {
    var endX, endY;
    endX = ev.changedTouches[0].pageX;
    endY = ev.changedTouches[0].pageY;
    var direction = GetSlideDirection(startX, startY, endX, endY);
    switch (direction) {
        case 0:
            alert("没滑动");
            break;
        case 1:
            alert("向上");
            break;
        case 2:
            alert("向下");
            break;
        case 3:
            alert("向左");
            break;
        case 4:
            alert("向右");
            break;
        default:            
    }   
}, false);
	
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
