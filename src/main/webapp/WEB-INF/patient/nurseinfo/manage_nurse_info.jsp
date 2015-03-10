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
		function queryStart()
		{
			$("#inputform").submit();
		}
		
		function goRequest(id, name)
		{
			window.location.href = "<c:url value='/p/query/goNurseRequest.do'/>?id="+id + "&name="+name;
		}
		
		function funNurseDetail(id)
		{
			window.location.href = "<c:url value='/p/query/nursedetail.do'/>?id="+id;
		}
	</script>
  </head>
<body <c:if test="${query.type == 1}">style="background: #ededed;"</c:if>>
	<div class="account" style="background: #ffffff;">
		<div class="account_title" style="background: #ffffff;">
	      <ul>
	        <li class="account_titleGreen">我的医护人</li>
	        <li class="account_titleGray">当前位置：<c:if test="${query.type == 1}">申请审核中</c:if><c:if test="${query.type == 2}">申请医护人员</c:if></li>
	      </ul>
	    </div>
	</div>    
  <div class="information_modify">
  	<c:if test="${query.type == 1}">
  		<div class="information_modify_main" id="main_div" style="height: 300px; line-height: 300px; font-size: 20px;">
  			<div style="height: 20px; width:100%; background: #ffffff; "></div>
  			
  				正在审核中，请耐心等候。。。
  		</div>
  	</c:if>
  	<c:if test="${query.type == 2}">
    <div class="information_modify_main" id="main_div">
    	<div class="search">
    	<form id="inputform" name="inputform" action="<c:url value='/p/query/mynuser.do'/>" method="post">
		    <table width="100%" border="0" cellspacing="0" cellpadding="0" style="display: block; font-size: 15px;">
		    	<tr>
		    		<td align="right" style="padding: 5px 5px 5px 0; width:100px; height: 30px; color: #aeaeae; font-size: 13px;">
	    				医护人员姓名：
	    			</td>
		    		<td>
		    			<input class="inputMin_informationModify text-input validate[required,funcCall[chinaornumer],minSize[1],maxSize[16]] " type="text" id="name" name="name" value="${query.name }">
		    		</td>
		    		<td>
		    		<ul>
		    			<li class="btn_search"><a href="javascript:void(0)" onclick="queryStart()">查询</a></li>
		    		</ul>
		    		</td>
		    	</tr>
		    </table>
		</form>    
		</div>
        <div class="index_table">
				<table width="100%" border="0" cellspacing="0" cellpadding="0" class="bPhistory_table" id="faceTable">
					<tbody>
						<tr class="even">
							<th style="width: 20%;">姓名</th>
							<th style="width: 16%;">性别</th>
							<th style="width: 16%;">手机号码</th>
							<th style="width: 16%;">签约人数</th>
							<th style="width: 16%;">星级</th>
							<th style="width: 16%;">操作</th>
						</tr>
						<c:if test="${not empty nurseFlys }">
							<c:forEach items="${nurseFlys }" var="nurseItem" varStatus="item">
								<tr class='<c:if test="${item.index mod 2 == 0 }">abnormal odd</c:if><c:if test="${item.index mod 2 == 1 }">even</c:if>' style="height: 40px;">
									<td><a href="javascript:void(0)" onclick="funNurseDetail(${nurseItem.userId})">${nurseItem.name }</a></td>
									<td>${nurseItem.genderStr }</td>
									<td>${nurseItem.cellphone }</td>
									<td>${nurseItem.cnt }</td>
									<td><img src="<c:url value='/patient/themes/images/star_s${ nurseItem.score}.png'/>"></td>
									<td>
										<a href="javascript:void(0)" onclick="goRequest(${nurseItem.userId}, '${nurseItem.name}')"><img src="<c:url value='/patient/themes/images/phone_editor.png'/>">申请签约</a>
									</td>
								</tr>
							</c:forEach>
						</c:if>
					</tbody>
				</table>
		</div>
		<div class="index_page">
		  <ul>
		    <li class="page_information">共<span id="showcount">10</span>条信息，当前：第<span id="showcurrentnum">1</span>页，共<span id="showpagecount">1</span>页</li>
		    <li class="page_button">
			    <a href="###" class="page-first">首页</a>
			    <a href="###" class="page-perv">上一页</a>
			    <a href="###" class="page-next">下一页</a>
			    <a href="###" class="page-last">末页</a>
		    </li>
		    <li class="page_select">
		    转<select id="gopage" onchange="gotoPage()"><option value="1">1</option></select>页
		    </li>
		  </ul>
		</div>
    </div>
    </c:if>
    
</div>
   
</body>
</html>
