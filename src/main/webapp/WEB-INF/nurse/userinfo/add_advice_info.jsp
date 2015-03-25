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
	<%@ include file="/WEB-INF/patient/common/easyui-include.jsp"%>
	<script type="text/javascript" src="<c:url value="/common/xheditor/xheditor-1.1.9-zh-cn.min.js"/>"></script>
	<link rel="stylesheet" href="<c:url value='/nurse/themes/health_records.css'/>" type="text/css"/>
	<style type="text/css">
		td{word-break:break-all;}
		.index_table table#faceTable tr th{
			line-height: normal;
		}
	</style>
	<script type="text/JavaScript">
		$(function(){
			PageMain.funInitXheditor("#adviceContent");
			ComDwr.loadAdviceTypeInfo("typeId", true, "${advice.typeId}");
		});
		function funSaveInfo()
		{
			
			/**打开进度条**/
			PageMain.funOpenProgress();
			$.ajax({
				url : _ctx_ + '/n/search/${query.command}.do?a='+ Math.random(),
				type : 'post',
				dataType : 'json',
				data : 
				{
					"id"			: $("#id").val(),
					"userId"		: $("#userId").val(),
					"typeId"		: $("#typeId").val(),
					"adviceTime"	: $("#adviceTime").val(),
					"adviceContent"	: $("#adviceContent").val()
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
						$.messager.confirm('确认', "操作成功，你要返回查询列表吗？", function(r)
						{
							if (r)
							{
								window.location.href = "<c:url value='/n/search/advice.do'/>?userId="+${query.userId};
							}
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
<body style="background: #ffffff;">
	<div class="account">
		<div class="account_title">
	      <ul>
	        <li class="account_titleGreen">医嘱内容</li>
	        <li class="account_titleGray">当前位置：<a href="javascript:void(0)" onclick="window.history.back();">医嘱</a> > ${query.name }</li>
	      </ul>
	    </div>
	</div>    
	<div class="information_modify">
	    <div class="information_modify_main" id="main_div">
	        <div class="informationModify_main">
	        	<table cellpadding="0" border="0" cellspacing="0" style="font-size: 13px; width: 100%;">
		    		<tr>
		    			<td align="right" style="padding: 0px 5px 5px 0px; width:70px; height: 30px; color: #aeaeae; font-size: 13px;">
		    				医嘱类型：
		    			</td>
		    			<td align="left">
		    				<select class="selectMax_informationModify  text-input" id="typeId" name="typeId" style="width: 410px;">
			                   <option value="-1">请选择</option>
			               </select>
		    			</td>
		    		</tr>
		    		<tr>
		    			<td align="right" style="padding: 0px 5px 5px 0px; width:70px; height: 30px; color: #aeaeae; font-size: 13px;">
		    				医嘱时间：
		    			</td>
		    			<td align="left">
		    				<input type="hidden" id="userId" name="userId" value="${query.userId }"/>
		    				<input type="hidden" id="id" name="id" value='<c:if test="${empty advice}">0</c:if>${advice.id }'/>
		    				<input class="inputMin_informationModify text-input Wdate" value="${advice.adviceTime }" id="adviceTime" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',readOnly:true})" type="text" value="${nurseRequest.adviceTime }" maxlength="16" style="width: 400px;">
		    			</td>
		    		</tr>
		    		<tr>
		    			<td align="right" style="padding: 5px 5px 5px 0; width:70px; height: 30px; color: #aeaeae; font-size: 13px;">
		    				医嘱内容：
		    			</td>
		    			<td align="left" colspan="2">
		    				<textarea id="adviceContent" style="width:  550px; height: 400px;"  class="inputMax_informationModify text-input">${advice.adviceContent }</textarea>
		    			</td>
		    		</tr>
		    		<tr>
		    			<td align="center" colspan="3">
		    				<ul>
		    					<li class="btn_reguster"><a onclick="funSaveInfo()" style="cursor: pointer;">保存</a></li>
		    				</ul>
		    			</td>
		    		</tr>
		    	</table>
	        </div>
	    </div>
	</div>
</body>
</html>
