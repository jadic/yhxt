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
    <title>南京通用电器有限公司 </title>
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
		
	</script>
  </head>
<body>
  <div class="information_modify">
    <div class="title_informationModify">
		<span class="tgrey_title_informationModify"><c:choose><c:when test="${query.adviceType == 1 }">用药</c:when><c:when test="${query.adviceType == 2 }">饮食</c:when><c:when test="${query.adviceType == 3 }">运动</c:when><c:when test="${query.adviceType == 4 }">就诊</c:when></c:choose></span>建议
    </div>
    <div class="information_modify_main" id="main_div">
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
		    <li class="page_information">共<span id="showcount">${query.total }</span>条信息，当前：第<span id="showcurrentnum">${query.pageCnt }</span>页，共<span id="showpagecount">${query.page }</span>页</li>
		    <li class="page_button">
			    <a href="###" class="page-first">首页</a>
			    <a href="###" class="page-perv">上一页</a>
			    <a href="###" class="page-next">下一页</a>
			    <a href="###" class="page-last">末页</a>
		    </li>
		    <li class="page_select">
		    转<select id="gopage" onchange="gotoPage()">
		    	<option value="1">1</option>
		    </select>页
		    </li>
		  </ul>
		</div>
    </div>
</div>
   
</body>
</html>
