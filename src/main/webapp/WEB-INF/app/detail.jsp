<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/patient/common/taglibs-include.jsp"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <style type="text/css">
    body {font: normal 100% Helvetica, Arial, sans-serif;}
    img {max-width: 100%;}
  </style>  
</head>
<body>
  <table width="100%" border="0" cellspacing="0" cellpadding="0" style="display: block; font-size: 15px;">
    <tr>
      <td>${content}</td>
    </tr>
  </table>
</body>
</html>
