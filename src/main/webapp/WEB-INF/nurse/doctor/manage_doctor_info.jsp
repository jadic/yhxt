<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/nurse/common/taglibs-include.jsp" %>
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
	<%@ include file="/WEB-INF/nurse/common/top-include.jsp"%>
	
	<link rel="stylesheet" href="<c:url value='/nurse/themes/health_records.css'/>" type="text/css"/>
	<style type="text/css">
		td{word-break:break-all;}
		.index_table table#faceTable tr th{
			line-height: normal;
		}
		.even{
			border-bottom: 1px dashed #ccc; background: #f9f9f9;
		}
		.odd{
			border-bottom: 1px dashed #ccc; border-left: 1px solid #f9f9f9; border-right: 1px solid #f9f9f9;
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
<body style="background: #ffffff; min-height: 600px;">
	<div class="account" >
		<div class="account_title" >
	      <ul>
	        <li class="account_titleGreen">平台医生</li>
	        <li class="account_titleGray" >当前位置：医生风采
	        </li>
	      </ul>
	    </div>
	</div>    
  <div class="information_modify">
    <div class="information_modify_main" id="main_div">
    	<div style="width: 100%; float: left; height: 20px;">
    		<form name="inputform" id="inputform"  style="padding: 0px; margin: 0px;" action="<c:url value='/n/search/doctor.do'/>" method="post">
				<input id="page" name="page" value="${query.page }" type="hidden"/>
			</form>
		</div>
        <div class="index_table">
				<table width="100%" border="0" cellspacing="0" cellpadding="0" class="bPhistory_table" id="faceTable">
					<tbody>
					<c:if test="${not empty doctorFlys }">
						<c:forEach items="${doctorFlys }" var="doctorItem" varStatus="item">
						<tr>
							<td class="<c:if test="${item.index mod 2 == 0 }">even</c:if><c:if test="${item.index mod 2 == 1 }">odd</c:if>">
								<table border="0" cellpadding="0" cellspacing="0" style="font-size: 12px;">
									<tr>
										<td rowspan="4" style="width: 130px; padding: 0px;">
											<c:if test="${empty doctorItem.doctorPhoto}">
												<img src="<c:url value='/nurse/themes/images/default_head.gif'/>" style="border: 0px; height: 120px; width: 100px" />
											</c:if>
											<c:if test="${not empty doctorItem.doctorPhoto}">
												<img src="<c:url value='/'/>${doctorItem.doctorPhoto}" style="border: 0px; height: 120px; width: 100px" />
											</c:if>
										</td>
										<td align="left" style="height: 22px; padding: 0px; font-weight: bold;">
											<a href="<c:url value='/n/search/doctorDetail.do?id=${doctorItem.doctorId}'/>" style="color: 07b; text-decoration: none; padding: 0px 6px 0px 0px; margin: 0px;">${doctorItem.doctorName }</a>   
											<span style="padding: 0 6px;">${doctorItem.doctorTitle }</span>   
										</td>
									</tr>
									<tr>
										<td align="left" style="height: 22px; padding: 0px;">
											所属科室：${doctorItem.deptName }
										</td>
									</tr>
									<tr>
										<td align="left" style="height: 22px; padding: 0px;">
											就职医院：${doctorItem.hospitalName }
										</td>
									</tr>
									<tr>
										<td align="left" style="height: 22px; line-height: 22px; padding: 0px;">
											擅长疾病： ${doctorItem.doctorSkill }
										</td>
									</tr>
								</table>
							</td>
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
