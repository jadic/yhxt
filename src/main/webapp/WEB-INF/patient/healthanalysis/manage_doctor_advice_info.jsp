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
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0"> 
	<%@ include file="/WEB-INF/patient/common/top-include.jsp"%>
	<link rel="stylesheet" href="<c:url value='/patient/themes/health_records.css'/>" type="text/css"/>
	<style type="text/css">
		td{word-break:break-all;}
		.index_table table#faceTable tr th{
			line-height: normal;
		}
	</style>
	<script type="text/JavaScript">
		$(function(){
			$(".page-first").bind("click", function(){
				if($("#gopage").val() > 1)
				{
					$("#page").val("1");
					$("#inputform").submit();
				}	
			});
			
			
			$(".page-perv").bind("click", function(){
				if($("#gopage").val() > 1)
				{
					$("#page").val($("#gopage").val() - 1);
					$("#inputform").submit();
				}	
			});
			
			$(".page-next").bind("click", function(){
				if($("#gopage").val() < "${query.pageCnt}")
				{
					$("#page").val(parseInt($("#gopage").val()) + 1);
					$("#inputform").submit();
				}	
			});
			
			
			$(".page-last").bind("click", function(){
				if($("#gopage").val() < "${query.pageCnt}")
				{
					$("#page").val("${query.pageCnt}");
					$("#inputform").submit();
				}	
			});
			
			$("#gopage").bind("change", function(){
				$("#page").val($(this).val());
				$("#inputform").submit();
			});
		});
	</script>
  </head>
<body>
<div class="account" style="background: #ffffff;">
	<div class="account_title" style="background: #ffffff;">
      <ul>
        <li class="account_titleGreen"><c:choose><c:when test="${query.adviceType == 1 }">用药</c:when><c:when test="${query.adviceType == 2 }">饮食</c:when><c:when test="${query.adviceType == 3 }">运动</c:when><c:when test="${query.adviceType == 4 }">就诊</c:when></c:choose>建议</li>
        <li class="account_titleGray" style="padding-top: 8px; height: 35px;">
        </li>
      </ul>
    </div>
</div> 	
  <div class="information_modify">
  	<div style="float: left; width: 100%; height: 20px;"></div>
    <div class="information_modify_main" id="main_div">
    	<form name="inputform" id="inputform"  style="padding: 0px; margin: 0px;" action="<c:url value='/p/query/advice.do?adviceType=${query.adviceType}'/>" method="post">
			<input id="page" name="page" value="${query.page }" type="hidden"/>
		</form>
    	<div class="search">
		    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="bPhistory_table" id="faceTable" style="display: block;">
		    	<tr>
		    		<td>建议时间：</td>
		    		<td><c:if test="${not empty advice}">${advice.a }</c:if></td>
		    	</tr>
		    	<tr>
		    		<td>建议内容：</td>
		    		<td><c:if test="${not empty advice}">${advice.b }</c:if></td>
		    	</tr>
		    </table>
		</div>
        <div class="index_table">
				<table width="100%" border="0" cellspacing="0" cellpadding="0" class="bPhistory_table" id="faceTable">
					<tbody>
						<tr class="even">
							<th style="width: 25%;">记录时间</th>
							<th style="width: 75%;">执行情况</th>
						</tr>
						<c:if test="${not empty adviceFlys }">
							<c:forEach items="${adviceFlys }" var="adviceitem" varStatus="item">
								<tr class='<c:if test="${item.index mod 2 == 0 }">abnormal odd</c:if><c:if test="${item.index mod 2 == 1 }">even</c:if>' style="height: 40px;">
									<td>${adviceitem.a }</td>
									<td>${adviceitem.b }</td>
								</tr>
							</c:forEach>
						</c:if>
						
					</tbody>
				</table>
		</div>
		<div class="index_page">
		  <ul>
		    <li class="page_information">共<span id="showcount">${query.total }</span>条信息，当前：第<span id="showcurrentnum">${query.page }</span>页，共<span id="showpagecount">${query.pageCnt }</span>页</li>
		    <li class="page_button">
			    <a href="javascript:void(0)" class="page-first">首页</a>
			    <a href="javascript:void(0)" class="page-perv">上一页</a>
			    <a href="javascript:void(0)" class="page-next">下一页</a>
			    <a href="javascript:void(0)" class="page-last">末页</a>
		    </li>
		    <li class="page_select">
		    转<select id="gopage">
		    	<c:forEach  var="temp"   begin="1"   step="1"   end="${ query.pageCnt}"> 
					<option <c:if test="${query.page==temp }">selected="selected"</c:if> value="<c:out  value="${temp}"/>"><c:out  value="${temp}"/></option>
				</c:forEach> 
		    </select>页
		    </li>
		  </ul>
		</div>
    </div>
</div>
   
</body>
</html>
