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
	<script type="text/JavaScript">
		
	</script>
  </head>
<body>
  <div class="bp_history" style="height:650px">
    <div class="title_BPhistory">
	    <ul>
	      <li class="tgreen_title_BPhistory"><span class="tgrey_title_BPhistory">亲情</span>号码</li>
	      <li class="select_BPhistory"><a href="javascript:void(0)" onclick="add_familyPhone()"><img src="<c:url value='/patient/themes/images/phone_add.png'/>"></a></li>
	    </ul>
	</div>

		<div class="index_table">
			<table width="100%" border="0" cellspacing="0" cellpadding="0"
				class="bPhistory_table" id="familyPhoneTable">
				<colgroup>
					<col width="10%">
						<col width="15%">
							<col width="25%">
								<col width="25%">
									<col width="25%">
				</colgroup>
				<tbody>
					<tr>
						<th>序号</th>
						<th>姓名</th>
						<th>手机号码</th>
						<th>亲属关系</th>
						<th>操作</th>
					</tr>
					<tr>
						<td>1</td>
						<td>郑烨</td>
						<td>13867439623</td>
						<td>其他</td>
						<td>
							<a href="javascript:void(0)" onclick="edit_familyPhone(1)"><img src="<c:url value='/patient/themes/images/phone_editor.png'/>">编辑</a>
							<a href="javascript:void(0)" onclick="delete_familyPhone(1)"><img src="<c:url value='/patient/themes/images/phone_del.png'/>">删除</a>
						</td>
					</tr>
					<tr>
						<td>2</td>
						<td>尹红梅</td>
						<td>13588193759</td>
						<td>其他</td>
						<td>
							<a href="javascript:void(0)" onclick="edit_familyPhone(1)"><img src="<c:url value='/patient/themes/images/phone_editor.png'/>">编辑</a>
							<a href="javascript:void(0)" onclick="delete_familyPhone(1)"><img src="<c:url value='/patient/themes/images/phone_del.png'/>">删除</a>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
   
</body>
</html>
