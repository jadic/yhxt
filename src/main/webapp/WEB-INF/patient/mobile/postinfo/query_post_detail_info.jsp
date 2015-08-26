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
	<%@ include file="/WEB-INF/patient/common/easyui-include.jsp"%>
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
			
			$("#btnsearch").bind("click", function(){
				$("#inputform").submit();
			});
		});
	
		function funSaveInfo()
		{
			if($("#content").val() == "")
			{
				alert("评论内容不为空")
				return ;
			}	
			else if($("#content").val().length > 200)
			{
				alert("评论内容在太长")
				return ;
			}	
			$("#inputform2").submit();
		}
	</script>
  </head>
<body>
<div class="account" style="background: #ffffff;">
		<div class="account_title" style="background: #ffffff;">
	      <ul>
	        <li class="account_titleGreen">快乐驿站</li>
	        <li class="account_titleGray">当前位置：<a href="<c:url value='/p/query/post.do'/>" >快乐驿站</a> >> 论坛
	        </li>
	      </ul>
	    </div>
	</div> 
	
  <div class="information_modify">
    <div class="information_modify_main" id="main_div">
        <div class="index_table">
        	<div style="height: 20px; width: 100%;">
        		<form id="inputform" name="inputform" action="<c:url value='/p/query/postDetail.do'/>" method="post">
		    		<input id="page" name="page" value="${query.page }" type="hidden"/>
		    		<input id="id" name="id" value="${query.id }" type="hidden"/>
				</form>    
        	</div>
        	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="bPhistory_table" id="faceTable">
        		<tr>
        			<td rowspan="2" style="border: 1px #ccc solid; background: #cbeccf; width: 120px; padding: 5px 0px;" align="center">
        				<c:if test="${not empty post.photo}">
        					<img style="width:100px; height: 120px;" id="header_photo" src="<c:url value='/'/>${post.photo}"></img></br>
        				</c:if>
        				<c:if test="${empty post.photo}">
        				<img style="width:100px; height: 120px;" id="header_photo" src="<c:url value='/patient/themes/images/default_head.gif'/>"></img></br>
        				</c:if>
        				<span style="padding-top: 10px; font-size: 14px; color: #3c8cd6; font-weight: bold;">${post.userName }</span>
        					
        			</td>
        			<td style="border: #ccc solid; border-width: 1px 0px 1px 0px; height: 35px; padding: 0px 5px">
        				发布时间：${post.stime }
        			</td>
        			<td style="width: 30px; border: #ccc solid; border-width: 1px 1px 1px 0px; height: 35px; padding: 0px 5px">楼主</td>
        		</tr>
        		<tr>
        			<td style="border: #ccc solid; border-width: 0px 1px 1px 0px; padding: 0px 5px" colspan="2" valign="top">
	        				<div style="line-height: 35px; font-weight: bolder; width: 100%; text-align: center; font-size: 16px; color: #000;">${post.title }</div>
        					<div style="width: 100%">
        						${post.content }
        					</div>
        			</td>
        		</tr>
        		
        	<c:if test="${not empty commentFlys }">
				<c:forEach items="${commentFlys }" var="commentItem" varStatus="item">
					<tr>
        			<td rowspan="2" style="border: #ccc solid; border-width: 0px 1px 1px 1px;  background: #cbeccf; width: 120px; padding: 5px 0px;" align="center">
        				<c:if test="${not empty commentItem.photo}">
        					<img style="width:100px; height: 120px;" id="header_photo" src="<c:url value='/'/>${commentItem.photo}"></img></br>
        				</c:if>
        				<c:if test="${empty commentItem.photo}">
        				<img style="width:100px; height: 120px;" id="header_photo" src="<c:url value='/patient/themes/images/default_head.gif'/>"></img></br>
        				</c:if>
        				<span style="padding-top: 10px; font-size: 14px; color: #3c8cd6; font-weight: bold;">${commentItem.userName }</span>
        					
        			</td>
        			<td style="border: #ccc solid; border-width: 0px 0px 1px 0px; height: 35px; padding: 0px 5px">
        				发布时间：${commentItem.stime }
        			</td>
        			<td style="width: 30px; border: #ccc solid; border-width: 0px 1px 1px 0px; height: 35px; padding: 0px 5px"><span style="padding: 0px 2px;">${item.index + 1 + (query.page - 1) * query.rows }</span>楼</td>
        		</tr>
        		<tr>
        			<td style="border: #ccc solid; border-width: 0px 1px 1px 0px; padding: 0px 5px" colspan="2" valign="top">
        					<div style="width: 100%">
        						${commentItem.content }
        					</div>
        			</td>
        		</tr>
				</c:forEach>
			</c:if>
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
		
		<form id="inputform2" name="inputform2" action="<c:url value='/p/query/addComment.do'/>" method="post">
		
		<table width="100%" border="0" cellspacing="0" cellpadding="0" class="bPhistory_table" id="faceTable">
			<tr>
				<td style="height: 30px;"></td>
			</tr>
			<tr>
				<td style="border: #ccc solid; border-width: 1px 1px 1px 1px; padding: 5px; height: 30px; background: #cbeccf; font-weight: bold; font-size: 16px;">
					我要评论
				</td>
			</tr>
			<tr>
				<td style="border: #ccc solid; border-width: 0px 1px 0px 1px; padding: 5px; height: 180px; ">
					<textarea name="content" id="content" class="inputMin_informationModify text-input" style="width: 98%; height: 100%;"></textarea>
				</td>
			</tr>
			<tr>
				<td align="center" style="border: #ccc solid; border-width: 0px 1px 1px 1px; padding: 5px; height: 60px;">
					<ul>
    					<li class="btn_reguster" style="margin-top: 0px;"><a onclick="funSaveInfo()" style="cursor: pointer;">确定</a></li>
    				</ul>
				</td>
			</tr>
			<tr>
				<td style="height: 10px;">
					<input type="hidden" name="pid" value="${post.id }"/>
				</td>
			</tr>
		</table>
		</form>
    </div>
</div>
   
</body>
</html>
