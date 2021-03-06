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
	function delDiseaseHis(obj, id)
	{
		$.messager.confirm('确认', "您确认要删除这条记录吗？", function(r)
		{
			if (r)
			{
				/**打开进度条**/
				PageMain.funOpenProgress();
				
				$.ajax({
					url : _ctx_ + "/n/search/delDiseaseHis.do?a="+ Math.random(),
					type : 'post',
					dataType : 'json',
					data : 
					{
						"id": id						
					},
					error:function(data)
					{
						/**关闭进度条**/
						PageMain.funCloseProgress();
						$.messager.alert('信息提示', '操作失败：提交超时或此方法不存在！', 'error');
					},
					success:function(data)
					{
						/**关闭进度条**/
						PageMain.funCloseProgress();
						
						/**数据处理**/
						if(data.success)
						{
							$.messager.alert('信息提示', data.msg, 'info');
							$(obj).parent().parent().remove();
						}
						else
						{
							$.messager.alert('信息提示', data.msg, 'error');
						}
					}
				});
			}
		});
	}
	
	function mergeDiseaseHis(id)
	{
		window.location.href = "<c:url value='/n/search/mergeDiseaseHis.do' />?id=" + id + "&userId=${query.userId}";
	}
	</script>
  </head>
<body style="background: #ededed;">
	<form name="inputform" id="inputform" style="padding: 0px; margin: 0px;"  action="<c:url value='/n/search/diseasehis.do?userId=${query.userId}'/>" method="post">
			<input id="page" name="page" value="${query.page }" type="hidden"/>
		</form>
	<div style="font-size:13px;font-family:微软雅黑;color:#5a5a5a;">	
	  	<div class="bp_history">
		    <div class="search">
		    	<ul>
		      		<li class="criteria_search" style="height: 40px;">疾病史</li>
		      		<li class="btn_search" style="height: 40px;"><a href="javascript:void(0)" onclick="mergeDiseaseHis(0)">新建疾病史</a></li>           
		    	</ul>
		  	</div>
			<div class="index_table">
				<table width="100%" border="0" cellspacing="0" cellpadding="0" class="bPhistory_table" id="faceTable">
					<tbody>
						<tr class="even">
							<th style="width: 35%;">疾病名称</th>
							<th style="width: 20%;">开始日期</th>
							<th style="width: 20%;">结束日期</th>
							<th style="width: 25%;">操作</th>
						</tr>
						<c:if test="${not empty diseaseHisFlys }">
							<c:forEach items="${diseaseHisFlys }" var="diseaseHisItem" varStatus="item">
								<tr class='<c:if test="${item.index mod 2 == 0 }">abnormal odd</c:if><c:if test="${item.index mod 2 == 1 }">even</c:if>' style="height: 40px;">
									<td>${diseaseHisItem.diseaseName }</td>
									<td>${diseaseHisItem.startDate }</td>
									<td>${diseaseHisItem.endDate }</td>
									<td>
										<a href="javascript:void(0)" onclick="mergeDiseaseHis(${diseaseHisItem.id})"><img src="<c:url value='/nurse/themes/images/phone_editor.png'/>">编辑</a>
										<a href="javascript:void(0)" onclick="delDiseaseHis(this, ${diseaseHisItem.id})"><img src="<c:url value='/nurse/themes/images/phone_del.png'/>">删除</a>
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
