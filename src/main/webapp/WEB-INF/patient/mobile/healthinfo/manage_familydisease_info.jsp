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
	<script type="text/JavaScript">
	$(function(){
		$('.text-input').attr("disabled", "disabled");
	});
	
	function edit_baseinfo(obj)
	{
		if($(obj).attr("tag") == "false")
		{
			$(obj).parent().parent().parent().next().find(".text-input").attr("disabled", false);
			$(obj).children().attr("src", "<c:url value='/patient/themes/images/btn_preserve.png'/>");
			$(obj).attr("tag", "true");
		}
		else
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
						$(obj).parent().parent().parent().next().find(".text-input").attr("disabled", "disabled");
						$(obj).children().attr("src", "<c:url value='/patient/themes/images/btn_editor.png'/>");
						$(obj).attr("tag", "false");
						$.messager.alert('信息提示', data.msg, 'info');
					}
					else
					{
						$.messager.alert('信息提示', data.msg, 'error');
					}
				}
			});
		}	
	}
	</script>
  </head>
<body style="background: #ededed;">
  <div class="btn_title_informationModify">
          <ul>
            <li class="tLeft">家族遗传史</li>
            <li class="tRight"><a href="javascript:void(0)" onclick="edit_baseinfo(this)" tag="false"><img src="<c:url value='/patient/themes/images/btn_editor.png'/>"></a></li>
          </ul>
        </div>
        <div class="informationModify_main2">
        	<table cellpadding="0" border="0" cellspacing="0" style="font-size: 13px; width: 100%;">
	    		<tr>
	    			<td align="right" style="padding: 5px 5px 5px 0; width:70px; height: 30px; color: #aeaeae; font-size: 13px;">
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
	    			<td align="right" style="padding: 5px 5px 5px 0; width:70px; height: 30px; color: #aeaeae; font-size: 13px;">
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
	    			<td align="right" style="padding: 5px 5px 5px 0; width:70px; height: 30px; color: #aeaeae; font-size: 13px;">
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
	    			<td align="right" style="padding: 5px 5px 5px 0; width:70px; height: 30px; color: #aeaeae; font-size: 13px;">
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
	    			<td align="right" style="padding: 5px 5px 5px 0; width:70px; height: 30px; color: #aeaeae; font-size: 13px;">
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
	    	</table>
	    </div>	
</body>
</html>
