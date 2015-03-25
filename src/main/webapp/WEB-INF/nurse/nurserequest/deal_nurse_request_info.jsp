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
	
	<link rel="stylesheet" href="<c:url value='/nurse/themes/health_records.css'/>" type="text/css"/>
	<style type="text/css">
		td{word-break:break-all;}
		.index_table table#faceTable tr th{
			line-height: normal;
		}
	</style>
	<script type="text/JavaScript">
		function funSaveInfo()
		{
			
			/**打开进度条**/
			PageMain.funOpenProgress();
			$.ajax({
				url : _ctx_ + '/n/search/dealRequest.do?a='+ Math.random(),
				type : 'post',
				dataType : 'json',
				data : 
				{
					"id"	: $("#id").val(),
					"userId": $("#userId").val(),
					"status": $("#status").val()
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
						alert("操作成功！");
						window.location.href = "<c:url value='/n/search/nurseRequest.do'/>";
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
	        <li class="account_titleGreen">我的签约</li>
	        <li class="account_titleGray">当前位置：申请处理</li>
	      </ul>
	    </div>
	</div>    
	<div class="information_modify">
	    <div class="information_modify_main" id="main_div">
	    	<div class="btn_title_informationModify" style="margin-top: 20px;">
	          <ul>
	            <li class="tLeft">申请信息</li>
	            <li class="tRight"><a href="javascript:void(0)" onclick="window.history.back();"><img src="<c:url value='/nurse/themes/images/btn_back.png'/>"></a></li>
	          </ul>
	        </div>
	        
	        <div class="informationModify_main">
	        	<table cellpadding="0" border="0" cellspacing="0" style="font-size: 13px; width: 100%;">
		    		<tr>
		    			<td align="right" style="padding: 5px 5px 5px 0; width:70px; height: 30px; color: #aeaeae; font-size: 13px;">
		    				姓<span style="padding: 0 13px;"></span>名：
		    			</td>
		    			<td align="left">
		    				<input disabled="disabled" class="inputMin_informationModify text-input validate[required,funcCall[chinaornumer],minSize[1],maxSize[16]] " type="text" value="${nurseRequest.userName }" maxlength="16">
		    			</td>
		    			<td rowspan="5">
		    				
		    			</td>
		    		</tr>
		    		<tr>
		    			<td align="right" style="padding: 5px 5px 5px 0; width:70px; height: 30px; color: #aeaeae; font-size: 13px;">
		    				性<span style="padding: 0 13px;"></span>别：
		    			</td>
		    			<td align="left">
		    				<select disabled="disabled" class="selectMax_informationModify  text-input validate[required]" id="gender" name="gender">
			                   <option value="-1">请选择</option>
				               <option value="1" <c:if test="${nurseRequest.gender == 1}">selected="selected"</c:if>>男</option>
				               <option value="2" <c:if test="${nurseRequest.gender == 2}">selected="selected"</c:if>>女</option>
			               </select>
		    			</td>
		    		</tr>
		    		<tr>
		    			<td align="right" style="padding: 5px 5px 5px 0; width:70px; height: 30px; color: #aeaeae; font-size: 13px;">
		    				手机号码：
		    			</td>
		    			<td align="left">
		    				<input disabled="disabled" class="inputMin_informationModify text-input validate[required,funcCall[chinaornumer],minSize[1],maxSize[16]] " type="text" id="cellphone" name="cellphone" maxlength="11" value="${nurseRequest.cellphone }">
		    			</td>
		    		</tr>
		    		<tr>
		    			<td align="right" style="padding: 5px 5px 5px 0; width:70px; height: 30px; color: #aeaeae; font-size: 13px;">
		    				请求时间：
		    			</td>
		    			<td align="left">
		    				<input disabled="disabled" class="inputMin_informationModify text-input validate[required,funcCall[chinaornumer],minSize[1],maxSize[16]] " type="text" id="email" name="email" maxlength="40" value="${nurseRequest.requestTime }">
		    			</td>
		    		</tr>
		    		<tr>
		    			<td align="right" style="padding: 5px 5px 5px 0; width:70px; height: 30px; color: #aeaeae; font-size: 13px;">
		    				备<span style="padding: 0 13px;"></span>注：
		    			</td>
		    			<td align="left" colspan="3">
		    				<input disabled="disabled" class="inputMax_informationModify text-input validate[required,funcCall[chinaornumer],minSize[1],maxSize[16]] " type="text" id="homeAddress" name="homeAddress" value="${nurseRequest.memo }" maxlength="80">
		    			</td>
		    		</tr>
		    	</table>
	        </div>
	        
	        <div class="btn_title_informationModify">
	          <ul>
	            <li class="tLeft">申请处理</li>
	          </ul>
	        </div>
	        <div class="informationModify_main">
	        	<table cellpadding="0" border="0" cellspacing="0" style="font-size: 13px; width: 100%;">
		    		
		    		<tr>
		    			<td align="right" style="padding: 5px 5px 5px 0; width:70px; height: 30px; color: #aeaeae; font-size: 13px;">
		    				处理状态：
		    			</td>
		    			<td align="left">
		    				<select class="selectMax_informationModify  text-input validate[required]" id="status" name="status" style="width: 500px;">
				               <option value="1">同意</option>
				               <option value="2">拒绝</option>
			               </select>
			               <input id="id" name="id" value="${nurseRequest.id }" type="hidden"/>
			                <input id="userId" name="userId" value="${nurseRequest.userId }" type="hidden"/>
		    			</td>
		    		</tr>
		    		<tr>
		    			<td align="center" colspan="2">
		    				<ul>
		    					<li class="btn_reguster"><a onclick="funSaveInfo()" style="cursor: pointer;">审核</a></li>
		    				</ul>
		    			</td>
		    		</tr>
		    	</table>
		    </div>	
	    </div>
	</div>
   
</body>
</html>
