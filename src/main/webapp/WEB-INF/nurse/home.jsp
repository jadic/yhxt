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
    <title>自已人健康服务中心 </title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0"> 
	<%@ include file="/WEB-INF/nurse/common/top-include.jsp"%>
	<%@ include file="/WEB-INF/nurse/common/easyui-include.jsp"%>
	<link rel="stylesheet" href="<c:url value='/nurse/themes/health_records.css'/>" type="text/css"/>
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
		
		
		function goMerge(id)
		{
			window.location.href = "<c:url value='/n/search/goRequestDeal.do'/>?id="+id;
		}
		
		function funNurseDetail(id)
		{
			window.location.href = "<c:url value='/n/search/userdetail.do'/>?id="+id;
		}
		
		function funOpenInfo(obj, id, userId, userName, stime, content)
		{
			$.ajax({
				url : _ctx_ + "/n/search/goMsg.do?a="+ Math.random(),
				type : 'post',
				dataType : 'json',
				data : 
				{
					"id"	: id,
					"userId": userId,
					"name": userName
				},
				error:function(data)
				{
				},
				success:function(data)
				{
					if(data.success)
					{
						$(obj).attr("onclick", "");
						$(obj).find("img").attr("src", "<c:url value='/nurse/themes/images/mail_01.png'/>");
						parent.PageMain.funCreateWinInfoNew("#div_win", "<c:url value='/nurse/pages/send_msg_info.jsp'/>", {userId: userId, userNmae:userName, stime:stime, content:content});
					}
				}
			});
		}
		
	</script>
  </head>
<body style="background: #ffffff; min-height: 600px;">
	<div class="account" >
		<div class="account_title" >
	      <ul>
	        <li class="account_titleGreen">首页</li>
	        <li class="account_titleGray">当前位置：留言列表</li>
	      </ul>
	    </div>
	</div>    
  <div class="information_modify">
    <div class="information_modify_main" id="main_div">
		<div class="search">
    	<form id="inputform" name="inputform" action="<c:url value='/n/search/home.do'/>" method="post">
		    <table width="100%" border="0" cellspacing="0" cellpadding="0" style="display: block; font-size: 15px;">
		    	<tr>
		    		<td align="right" style="padding: 5px 5px 5px 0; width:70px; height: 30px; color: #aeaeae; font-size: 13px;">
	    				姓名：
	    			</td>
		    		<td>
		    			<input id="page" name="page" value="${query.page }" type="hidden"/>
		    			<input class="inputMin_informationModify text-input" type="text" id="name" name="name" value="${query.name }">
		    		</td>
		    		<td>
		    		<ul>
		    			<li class="btn_search"><a href="javascript:void(0)"  id="btnsearch">查询</a></li>
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
							<th style="width: 15%;">姓名</th>
							<th style="width: 140px;">时间</th>
							<th style="width: 45%;">内容</th>
							<th style="width: 60px;">状态</th>
						</tr>
						<c:if test="${not empty messageFlys }">
							<c:forEach items="${messageFlys }" var="msgItem" varStatus="item">
								<tr class='<c:if test="${item.index mod 2 == 0 }">abnormal odd</c:if><c:if test="${item.index mod 2 == 1 }">even</c:if>' style="height: 40px;">
									<td><a href="javascript:void(0)" onclick="funNurseDetail(${msgItem.senderId})">${msgItem.name }</a></td>
									<td>${msgItem.sendTime }</td>
									<td><div style="width:280px; white-space:nowrap; text-overflow:ellipsis;-o-text-overflow:ellipsis;overflow: hidden;">${msgItem.msg }</div></td>
									<td>
										<a <c:if test="${msgItem.status == 0 }">onclick="funOpenInfo(this, ${msgItem.id}, ${msgItem.senderId}, '${msgItem.name}', '${msgItem.sendTime }','${msgItem.msg }')"</c:if> href="javascript:void(0)" ><img src="<c:url value='/nurse/themes/images/mail_0${msgItem.status}.png'/>"></a>
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
