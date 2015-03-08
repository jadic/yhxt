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
	<%@ include file="/WEB-INF/patient/common/easyui-include.jsp"%>
	
	<link rel="stylesheet" href="<c:url value='/patient/themes/health_records.css'/>" type="text/css"/>
	<script type="text/JavaScript">
		function deleteRelative(obj, id)
		{
			$.messager.confirm('确认', "您确认要删除这条记录吗？", function(r)
			{
				if (r)
				{
					/**打开进度条**/
					PageMain.funOpenProgress();
					
					$.ajax({
						url : _ctx_ + "/p/query/delRelative.do?a="+ Math.random(),
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
		
		function mergeRelative(id)
		{
			window.location.href = "<c:url value='/p/query/mergerelative.do' />?id=" + id;
		}
	</script>
  </head>
<body>
  <div class="bp_history" style="height:650px">
    <div class="title_BPhistory">
	    <ul>
	      <li class="tgreen_title_BPhistory"><span class="tgrey_title_BPhistory">亲情</span>号码</li>
	      <li class="select_BPhistory"><a href="javascript:void(0)" onclick="mergeRelative(0)"><img src="<c:url value='/patient/themes/images/phone_add.png'/>"></a></li>
	    </ul>
	</div>

		<div class="index_table">
			<table width="100%" border="0" cellspacing="0" cellpadding="0" class="bPhistory_table" id="faceTable">
					<tbody>
						<tr class="even">
							<th>姓名</th>
							<th>亲属关系</th>
							<th>手机号码</th>
							<th>固定电话</th>
							<th>联系地址</th>
							<th style="width: 130px;">操作</th>
						</tr>
					<tr>
						<c:if test="${not empty relativeFlys }">
							<c:forEach items="${relativeFlys }" var="relativeItem" varStatus="item">
								<tr class='<c:if test="${item.index mod 2 == 0 }">abnormal odd</c:if><c:if test="${item.index mod 2 == 1 }">even</c:if>' style="height: 40px;">
									<td>${relativeItem.name }</td>
									<td>${relativeItem.typeName }</td>
									<td>${relativeItem.cellPhone }</td>
									<td>${relativeItem.tel }</td>
									<td>${relativeItem.address }</td>
									<td>
										<a href="javascript:void(0)" onclick="mergeRelative(${relativeItem.id})"><img src="<c:url value='/patient/themes/images/phone_editor.png'/>">编辑</a>
										<a href="javascript:void(0)" onclick="deleteRelative(this, ${relativeItem.id})"><img src="<c:url value='/patient/themes/images/phone_del.png'/>">删除</a>
									</td>
								</tr>
							</c:forEach>
						</c:if>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
   
</body>
</html>
