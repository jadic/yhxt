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
		.even{
			border-bottom: 1px dashed #ccc; background: #f9f9f9; height:40px; font-size: 12px; line-height: 30px; padding-left: 5px;
		}
		.odd{
			border-bottom: 1px dashed #ccc; border-left: 1px solid #f9f9f9; border-right: 1px solid #f9f9f9; height:40px; padding-left: 5px; font-size: 12px; line-height: 30px;
		}
	</style>
	<script>
		$(function(){
			$("#content img").each(function(){
				if($(this).attr("width") > 650)
				{
					$(this).attr("width", "650");
				}	
			});
		});
	</script>
  </head>
<body style="background: #ffffff;">
	<div class="account">
		<div class="account_title">
	      <ul>
	        <li class="account_titleGreen">我的活动</li>
	        <li class="account_titleGray">当前位置：查看活动详细信息</li>
	      </ul>
	    </div>
	</div>    
	<div class="information_modify">
	    <div class="information_modify_main" id="main_div">
	    	<div class="btn_title_informationModify" style="margin-top: 20px;">
	          <ul>
	            <li class="tLeft">活动详细信息</li>
	            <li class="tRight"><a href="javascript:void(0)" onclick="window.history.back();"><img src="<c:url value='/nurse/themes/images/btn_back.png'/>"></a></li>
	          </ul>
	        </div>
	        
	        <div class="informationModify_main" style="padding-left:0px; padding-right: 0px; width: 670px;">
	        	<table cellpadding="0" border="0" cellspacing="0" style="font-size: 13px; width: 100%;">
		    		<tr>
		    			<td align="left" class="even">
		    				活动名称：${service.name }
		    			</td>
		    		</tr>
		    		<tr>
		    			<td align="left" class="odd">
		    				参与医生：${service.userName }
		    			</td>
		    		</tr>
		    		<tr>
		    			<td align="left" class="even">
		    				活动有限期：${service.sdate } ~ ${service.edate }
		    			</td>
		    		</tr>
		    		<tr>
		    			<td align="left"  id="content" class="odd" style="padding: 5px;">
		    				${service.content }
		    			</td>
		    		</tr>
		    	</table>
	        </div>
	    </div>
	</div>
</body>
</html>
