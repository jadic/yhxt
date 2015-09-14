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
    	input, select,textarea{border:1px solid #ccc; height: 40px; width: 85%; padding-left: 10px;}
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
					url : _ctx_ + "/p/query/activityJson.do?a="+ Math.random(),
					type : 'post',
					dataType : 'json',
					data : 
					{
						"name"		 : $("#name").val(),
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
							for(var nItem=0; nItem<data.rows.length; nItem++)
							{
								row = data.rows[nItem];
								$('<li class="activeable list-item item_wcl" style="display:-webkit-box; display:-moz-box;">'+
									'<div style="-webkit-box-flex:1; -moz-box-flex:1; -webkit-box-ordinal-group:2;-moz-box-ordinal-group:2;">'+
										'<h2 class="item-title" style="font-size:18px;">'+row.name+'</h2>'+
						                '<p class="item-time">活动类型：'+row.typeName+'</p>'+
						                '<p class="item-time">开始时间：'+row.sdate+'</p>'+
						                '<p class="item-time">结束时间：'+row.edate+'</p>'+
					                '</div>'+
					                '<div style="width: 20px; -webkit-box-sizing:border-box; -moz-box-sizing:border-box; -webkit-box-ordinal-group:2;-moz-box-ordinal-group:2;">'+
					                	'<div class="item-next" style="margin-top:25px;"></div>'+
					                '</div>'+
						       ' </li>').insertBefore(".list-more");
							}	
						}
					}
				});
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
  		我的活动
  		<div class="left"><a href="<c:url value='/p/my.do'/>"><span class="corner"></span></a></div>
  	</header>
  	<div id="content">
  		<ul class="list">
  			<li class="activeable list-item"> 
    		<form id="inputform" name="inputform" action="<c:url value='/p/query/activity.do'/>" method="post">
		    <table border="0" cellspacing="0" cellpadding="0" style="width:100%; font-size: 18px;">
		    	<tr>
		    		<td>
		    			<input type="text" id="name" name="name" placeholder="活动名称">
		    		</td>
		    		<td style="width: 70px;">
			    		<ul>
			    			<li class="btn_reguster" style="margin-top: 0px;"><a href="javascript:void(0)" id="btnsearch">查询</a></li>
			    		</ul>
		    		</td>
		    	</tr>
		    </table>
			</form>    
       </li>
	   <li class="activeable list-more" style="display: none;" onclick="PageOper.funLoadMore()">加载更多</li>
      </ul>
	</div>
   <footer id="footer">
		<footer id="footer">
		<jsp:include page="/WEB-INF/patient/common/footer-include.jsp">
			<jsp:param value="3" name="selected"/>
		</jsp:include>
	</footer>
</body>
</html>
