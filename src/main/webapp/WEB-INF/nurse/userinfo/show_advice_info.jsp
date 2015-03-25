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
	<link rel="stylesheet" href="<c:url value='/nurse/themes/health_records.css'/>" type="text/css"/>
	<style type="text/css">
		td{word-break:break-all;}
		.index_table table#faceTable tr th{
			line-height: normal;
		}
	</style>
  </head>
<body style="background: #ffffff;">
	<div class="account">
		<div class="account_title">
	      <ul>
	        <li class="account_titleGreen">医嘱内容</li>
	        <li class="account_titleGray">当前位置：<a href="javascript:void(0)" onclick="window.history.back();">医嘱</a> > 医嘱详情</li>
	      </ul>
	    </div>
	</div>    
	<div class="information_modify">
	    <div class="information_modify_main" id="main_div">
	        <div class="informationModify_main">
	        	<table cellpadding="0" border="0" cellspacing="0" style="font-size: 13px; width: 100%; min-height: 500px;">
		    		<tr>
		    			<td align="right" style="padding: 0px 5px 5px 0px; width:70px; height: 30px; color: #aeaeae; font-size: 13px;">
		    				医嘱类型：
		    			</td>
		    			<td align="left">
		    				${advice.typeName }
		    			</td>
		    		</tr>
		    		<tr>
		    			<td align="right" style="padding: 0px 5px 5px 0px; width:70px; height: 30px; color: #aeaeae; font-size: 13px;">
		    				医嘱时间：
		    			</td>
		    			<td align="left">
		    				${advice.adviceTime }
		    			</td>
		    		</tr>
		    		<tr>
		    			<td align="right" style="padding: 5px 5px 5px 0; width:70px; height: 30px; color: #aeaeae; font-size: 13px;">
		    				医嘱内容：
		    			</td>
		    			<td align="left" colspan="2">
		    				${advice.adviceContent }
		    			</td>
		    		</tr>
		    		<tr><td></td></tr>
		    	</table>
	        </div>
	    </div>
	</div>
</body>
</html>
