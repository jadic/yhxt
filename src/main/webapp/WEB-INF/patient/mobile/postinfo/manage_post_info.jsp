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
    <style>
    	.item_wcl{}
    	input, select,textarea{border:1px solid #ccc; height: 35px; width: 85%; padding-left: 10px;}
    	.circle { 
			width: 45px; 
			height: 45px; 
			border:1px solid #ddd;
			background-color: #fff; 
			text-align:center;
			line-height:40px;
			color:red;
			font-size:18px;
			font-weight:bold;
			-webkit-border-radius: 45px; 
			position: relative;
  			left: 15px;
		} 
		.circle img{width: 45px;  height: 45px;  border-radius:45px}
    </style>
	<script type="text/JavaScript">
	$(function(){
		PageOper.funSearch();
		$("#btnsearch").bind("click", function(){
			$(".item_wcl").remove()
			PageOper.page = 1;
			PageOper.sumPage = 1;
			PageOper.funSearch()
		});
	});
	var PageOper = {
		page:1,
		sumPage:1,
		funSearch : function()
		{
			$.ajax({
				url : _ctx_ + "/p/query/postJson.do?a="+ Math.random(),
				type : 'post',
				dataType : 'json',
				data : 
				{
					"title"		 : $("#title").val(),
					"page"       : PageOper.page						
				},
				error:function(data)
				{
					
				},
				success:function(data)
				{
					if(PageOper.sumPage >= data.sumPage)
					{
						$(".list-more").hide();
					}
					else
					{
						PageOper.sumPage = data.sumPage;
						$(".list-more").show();
					}	
					if(data.success)
					{
						var row = null;
						var tmpPhoto = _ctx_ + "/patient/themes/images/mobile/user_photo.png";
						for(var nItem=0; nItem<data.rows.length; nItem++)
						{
							row = data.rows[nItem];
							tmpPhoto = _ctx_ + "/patient/themes/images/mobile/user_photo.png";
							if(row.photo != "" && row.photo != null && row.photo != "null")
							{
								tmpPhoto = _ctx_ + "/" + row.photo;
							}	
							$('<li class="activeable list-item item_wcl" style="display:-webkit-box; display:-moz-box; cursor:pointer;" onclick="PageOper.funGotoInfo('+row.id+')">'+
								'<div style="width: 70px; -webkit-box-sizing:border-box; -moz-box-sizing:border-box; -webkit-box-ordinal-group:2;-moz-box-ordinal-group:2;">'+
					               '<div class="circle">'+
					               		'<img src="'+tmpPhoto+'" style="border: 0px;">'+
					               '</div>'+
					              	'<div class="item-info" style="text-align:center; height:20px; line-height:20px;font-size:16px; width:100%;">'+row.userName+'</div>'+
					             '</div>'+
								'<div style="-webkit-box-flex:1; -moz-box-flex:1;vertical-align:middle;  -webkit-box-ordinal-group:2;-moz-box-ordinal-group:2;">'+
									'<table border="0" cellspacing="0" cellpadding="0" style="width:100%; height:100%; min-height:70px;">'+
										'<tr><td style="font-size:16px; font-weight:bold;">'+row.title+'</td></tr>'+
										'<tr><td style="height:18px;"><p class="item-time">'+row.stime+'</p></td></tr>'+
									'</table>'+
				                '</div>'+
				                '<div style="width: 20px; line-height:70px; -webkit-box-sizing:border-box; -moz-box-sizing:border-box; -webkit-box-ordinal-group:2;-moz-box-ordinal-group:2;">'+
				                '<div class="item-next" style="margin-top:30px;"></div>'+
				                '</div>'+
					       '</li>').insertBefore(".list-more");	
						}	
					}
				}
			});
		},
		funGotoInfo : function(id)
		{
			window.location.href = _ctx_ + "/p/query/postDetail.do?id=" + id;
		},
		funLoadMore: function()
		{
			if(PageOper.page < PageOper.sumPage)
			{
				PageOper.page += 1;
				PageOper.funSearch()
			}
		}
	};
	</script>
  </head>
<body>
  	<header id="header">
  		快乐驿站
  		<div class="right"><a href="<c:url value='/p/query/mergePost.do'/>"><span class="cornerAdd"></span></a></div>
  	</header>
  	<div id="content">
		<ul class="list">
		<li class="activeable list-item"> 
		    <table border="0" cellspacing="0" cellpadding="0" style="width:100%; font-size: 15px;">
		    	<tr>
		    		<td align="center">
		    			<input type="text" id="title" name="title"  placeholder="标题" value="${query.title }">
		    		</td>
		    		<td align="center" style="width: 100px;">
			    		<ul>
			    			<li class="btn_reguster" style="margin-top: 0px;"><a href="javascript:void(0)" id="btnsearch">查询</a></li>
			    		</ul>
		    		</td>
		    	</tr>
		    </table>
		    </li>
	        <li class="activeable list-more" style="display: none;" onclick="PageOper.funLoadMore()">加载更多</li>
        </ul>
	</div>
   <footer id="footer">
		<footer id="footer">
		<jsp:include page="/WEB-INF/patient/common/footer-include.jsp">
			<jsp:param value="2" name="selected"/>
		</jsp:include>
	</footer>
</body>
</html>
