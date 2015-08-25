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
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">  
	<meta name="viewport" content="width=device-width,height=device-height,initial-scale=1.0,maximum-scale=1.0,user-scalable=no">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0"> 
    <%@ include file="/WEB-INF/patient/common/mobile-include.jsp"%>
    <%@ include file="/WEB-INF/patient/common/easyui-include.jsp"%>
    <style>
    	input, select,textarea{border:1px solid #ccc; height: 35px; width: 85%; padding-left: 10px;}
    	#content table td{height: 45px;}
    </style>
	<script type="text/JavaScript">
	function edit_baseinfo()
	{
		PageMain.funOpenProgress();
		$.ajax({
			url : _ctx_ + "/p/query/modifyFamilyDisease.do?a="+ Math.random(),
			type : 'post',
			dataType : 'json',
			data : 
			{
				"isHeartDisease" 	: $("#isHeartDisease").val(),
				"isHypertension" 	: $("#isHypertension").val(),
				"isHyperlipemia" 	: $("#isHyperlipemia").val(),
				"isDiabetesMellitus": $("#isDiabetesMellitus").val(),
				"isCoronaryDisease" : $("#isCoronaryDisease").val()
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
					$.messager.confirm('确认', data.msg, function(r)
					{
						window.location.href = "<c:url value='/p/my.do'/>";
					});
				}
				else
				{
					$.messager.alert('信息提示', data.msg, 'error');
				}
			}
		});
	}
	</script>
  </head>
<body>
	<header id="header">
  		家族遗传史
  		<div class="left"><a href="javascript:void(0)" onclick="window.history.back()"><span class="corner"></span></a></div>
  	</header>
  	<div id="content" style="padding: 14px;">
        	<table cellpadding="0" border="0" cellspacing="0" style="font-size: 16px; width: 100%;">
	    		<tr>
	    			<td align="right" style="padding: 5px 5px 5px 0; width:70px; height: 30px; color: #aeaeae; font-size: 16px;">
	    				心脏病：
	    			</td>
	    			<td align="left">
	    				<select class="selectMax_informationModify  text-input validate[required]" id="isHeartDisease" name="isHeartDisease">
			               <option value="-1"></option>
			               <option value="1"  <c:if test="${genetic.isHeartDisease == 1}">selected="selected"</c:if>>无</option>
			               <option value="2"  <c:if test="${genetic.isHeartDisease == 2}">selected="selected"</c:if>>有</option>
		               </select>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td align="right" style="padding: 5px 5px 5px 0; width:70px; height: 30px; color: #aeaeae; font-size: 16px;">
	    				高血压：
	    			</td>
	    			<td align="left">
	    				<select class="selectMax_informationModify  text-input validate[required]" id="isHypertension" name="isHypertension">
			               <option value="-1"></option>
			               <option value="1"  <c:if test="${genetic.isHypertension == 1}">selected="selected"</c:if>>无</option>
			               <option value="2"  <c:if test="${genetic.isHypertension == 2}">selected="selected"</c:if>>有</option>
		               </select>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td align="right" style="padding: 5px 5px 5px 0; width:70px; height: 30px; color: #aeaeae; font-size: 16px;">
	    				高血脂：
	    			</td>
	    			<td align="left">
	    				<select class="selectMax_informationModify  text-input validate[required]" id="isHyperlipemia" name="isHyperlipemia">
			               <option value="-1"></option>
			               <option value="1"  <c:if test="${genetic.isHyperlipemia == 1}">selected="selected"</c:if>>无</option>
			               <option value="2"  <c:if test="${genetic.isHyperlipemia == 2}">selected="selected"</c:if>>有</option>
		               </select>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td align="right" style="padding: 5px 5px 5px 0; width:70px; height: 30px; color: #aeaeae; font-size: 16px;">
	    				糖尿病：
	    			</td>
	    			<td align="left">
	    				<select class="selectMax_informationModify  text-input validate[required]" id="isDiabetesMellitus" name="isDiabetesMellitus">
			               <option value="-1"></option>
			               <option value="1"  <c:if test="${genetic.isDiabetesMellitus == 1}">selected="selected"</c:if>>无</option>
			               <option value="2"  <c:if test="${genetic.isDiabetesMellitus == 2}">selected="selected"</c:if>>有</option>
		               </select>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td align="right" style="padding: 5px 5px 5px 0; width:70px; height: 30px; color: #aeaeae; font-size: 16px;">
	    				冠心病：
	    			</td>
	    			<td align="left">
	    				<select class="selectMax_informationModify  text-input validate[required]" id="isCoronaryDisease" name="isCoronaryDisease">
			               <option value="-1"></option>
			               <option value="1"  <c:if test="${genetic.isCoronaryDisease == 1}">selected="selected"</c:if>>无</option>
			               <option value="2"  <c:if test="${genetic.isCoronaryDisease == 2}">selected="selected"</c:if>>有</option>
		               </select>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td align="center" colspan="2">
	    				<ul>
	    					<li class="btn_reguster"><a onclick="edit_baseinfo(this)" tag="false" style="cursor: pointer;">确定</a></li>
	    				</ul>
	    			</td>
	    		</tr>
	    	</table>
	</div>
	<footer id="footer">
		<footer id="footer">
		<jsp:include page="/WEB-INF/patient/common/footer-include.jsp">
			<jsp:param value="3" name="selected"/>
		</jsp:include>
	</footer>		
</body>
</html>
