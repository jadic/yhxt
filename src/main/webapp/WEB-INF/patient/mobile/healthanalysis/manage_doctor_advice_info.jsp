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
	<%@ include file="/WEB-INF/patient/common/date-include.jsp"%>
    <%@ include file="/WEB-INF/patient/common/mobile-include.jsp"%>
	<style>
		.Wdate{
			height: 28px;
			width:170px;
  			border: 1px solid #aeaeae;
		}
		.search {
		  width: 100%;
		  padding: 3px 0;
		  background: #f7f7f7;
		  float: left;
		  margin-top: 10px;
		   margin-bottom: 10px;
		}
		.item_wcl{}
	</style>
	<script type="text/JavaScript">
	var PageOper = {
			page:1,
			sumPage:1,
			funSearch : function()
			{
				$.ajax({
					url : _ctx_ + "/p/query/adviceJson.do?a="+ Math.random(),
					type : 'post',
					dataType : 'json',
					data : 
					{
						"adviceType":"${query.adviceType}",
						"id": "${advice.id}",						
						"page": PageOper.page						
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
								$('<li class="activeable list-item item_wcl">'+
						                '<div style="word-wrap:break-word; padding-bottom: 10px; font-size: 18px;">'+row.b+'</div>'+
						                '<p class="item-time" style="float: right;">'+row.a+'</p>'+
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
		$(function(){
			PageOper.funSearch();
		});
	</script>
  </head>
<body style="padding: 0px; margin: 0px;">
  	<header id="header">
  		<c:choose><c:when test="${query.adviceType == 1 }">用药</c:when><c:when test="${query.adviceType == 2 }">饮食</c:when><c:when test="${query.adviceType == 3 }">运动</c:when><c:when test="${query.adviceType == 4 }">就诊</c:when></c:choose>建议
  		<div class="left"><a href="javascript:void(0)" onclick="window.history.back()"><span class="corner"></span></a></div>
  	</header>
  	<div id="content">
		<ul class="list">
			<li class="activeable list-item" style="background: #efefef">建议信息</li>
			<li class="activeable list-item">
                <div style="word-wrap:break-word; padding-bottom: 10px; font-size: 18px;"><c:if test="${not empty advice}">${advice.b }</c:if></div>
                <p class="item-time" style="float: right;"><c:if test="${not empty advice}">${advice.a }</c:if></p>
	       	</li>
			
			<li class="activeable list-item" style="background: #efefef">
				执行情况
			</li>
	        <li class="activeable list-more" style="display: none;" onclick="PageOper.funLoadMore()">加载更多</li>
       </ul>
	</div>
	
	<footer id="footer">
		<footer id="footer">
		<jsp:include page="/WEB-INF/patient/common/footer-include.jsp">
			<jsp:param value="1" name="selected"/>
		</jsp:include>
	</footer>	   
</body>
</html>
