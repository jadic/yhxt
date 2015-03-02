<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>升级日志</title>
<%@ include file="/WEB-INF/admin/common/top-include.jsp" %>
<script type="text/javascript" src="<c:url value='/admin/scripts/baseinfo/query_online_user_info.js'/>" ></script>
</head>
<body class="easyui-layout" style="margin: 0px; padding: 0px;">
	<div region="center" style="overflow:hidden;"  border="false">
		<table id="div_grid"></table> 
	</div>
</body>
</html>

