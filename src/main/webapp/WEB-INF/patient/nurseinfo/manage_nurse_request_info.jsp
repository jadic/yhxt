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
	<style type="text/css">
		td{word-break:break-all;}
		.index_table table#faceTable tr th{
			line-height: normal;
		}
	</style>
	<script type="text/JavaScript">
		function funSaveInfo()
		{
			PageMain.funOpenProgress();
			$.ajax({
				url : _ctx_ + "/p/query/nurserequest.do?a="+ Math.random(),
				type : 'post',
				dataType : 'json',
				data : 
				{
					"nurseId": "${query.id}",
					"statis": 0,
					"memo": $("#memo").val()
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
						alert("申请成功，请耐心等待！");
						window.location.href = "<c:url value='/p/query/mynuser.do'/>";
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
<body style="background: #ededed;">
	<div class="account" style="background: #ffffff;">
		<div class="account_title" style="background: #ffffff;">
	      <ul>
	        <li class="account_titleGreen">我的医护人</li>
	        <li class="account_titleGray">当前位置：申请医护人员</li>
	      </ul>
	    </div>
	</div>    
  <div class="information_modify">
  	<div class="information_modify_main" id="main_div">
  		<div class="btn_title_informationModify" style="margin-top: 20px;">
          <ul>
            <li class="tLeft">签约申请</li>
            <li class="tRight"><a href="javascript:void(0)" onclick="window.history.back();"><img src="<c:url value='/patient/themes/images/btn_back.png'/>"></a></li>
          </ul>
        </div>
    	<div class="informationModify_main" style="margin-top: 20px;">
        	<table cellpadding="0" border="0" cellspacing="0" style="font-size: 13px; width: 100%;">
	    		<tr>
	    			<td align="right" style="padding: 5px 5px 5px 0; width:100px; height: 30px; color: #aeaeae; font-size: 13px;">
	    				医护人姓名：
	    			</td>
	    			<td align="left">
	    				<input class="inputMin_informationModify text-input validate[required,funcCall[chinaornumer],minSize[1],maxSize[16]] " type="text" id="name" name="name" maxlength="50" style="width: 350px;" value="${query.name }">
	    				<span style="color: red;">*</span>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td align="right" style="padding: 5px 5px 5px 0; width:70px; height: 30px; color: #aeaeae; font-size: 13px;">
	    				备<span style="padding: 0 13px;"></span>注：
	    			</td>
	    			<td align="left">
	    				<input type="hidden" id="id" name="id" value="${diseaseHis.id}"/>
	    				<textarea class="inputMin_informationModify text-input" style="width: 500px; height: 80px;" id="memo" name="memo" maxlength="250"></textarea>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td align="center" colspan="2">
	    				<ul>
	    					<li class="btn_reguster"><a onclick="funSaveInfo()" style="cursor: pointer;">我要申请</a></li>
	    				</ul>
	    			</td>
	    		</tr>
	    	</table>
        </div>
        </div>
  </div>
   
</body>
</html>
