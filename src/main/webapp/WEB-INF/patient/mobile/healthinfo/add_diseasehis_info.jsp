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
		function funSaveInfo()
		{
			
			if (funIsNull("#diseaseName", "疾病名称") 
				|| funIsNull("#startDate", "开始时间")
				|| funIsNull("#endDate", "结束时间")
				|| funMaxLen("#descInHospital", "住院情况")
				|| funMaxLen("#descObserve", "转归情况")
				|| funMaxLen("#memo", "备注"))
			{
				return false;
			}
			/**打开进度条**/
			PageMain.funOpenProgress();
			$.ajax({
				url : _ctx_ + '/p/query/<c:if test="${query.id  > 0}">modifyDiseaseHis.do</c:if><c:if test="${query.id  == 0}">addDiseaseHis.do</c:if>?a='+ Math.random(),
				type : 'post',
				dataType : 'json',
				data : 
				{
					<c:if test="${query.id  > 0}">
					"id": $("#id").val(),
					</c:if>
					"diseaseName": $("#diseaseName").val(),	
					"startDate": $("#startDate").val(),	
					"endDate": $("#endDate").val(),	
					"descInHospital": $("#descInHospital").val(),	
					"descObserve": $("#descObserve").val(),	
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
						alert("操作成功！");
						window.location.href = "<c:url value='/p/query/diseasehis.do'/>";
					}
					else
					{
						$.messager.alert('信息提示', data.msg, 'error');
					}
				}
			});
		}
		
		function modifyRelative(id)
		{
			alert(id)
		}
	</script>
  </head>
<body style="background: #ededed;">
 <div class="information_modify" style="margin: 0px;">
    <div class="information_modify_main" id="main_div">
    	<div class="btn_title_informationModify">
          <ul>
            <li class="tLeft"><c:if test="${query.id  > 0}">修改</c:if><c:if test="${query.id  == 0}">增加</c:if>疾病史</li>
            <li class="tRight"><a href="javascript:void(0)" onclick="window.history.back();"><img src="<c:url value='/patient/themes/images/btn_back.png'/>"></a></li>
          </ul>
        </div>
        <div class="informationModify_main">
        	<table cellpadding="0" border="0" cellspacing="0" style="font-size: 13px; width: 100%;">
	    		<tr>
	    			<td align="right" style="padding: 5px 5px 5px 0; width:100px; max-width:100px; height: 30px; color: #aeaeae; font-size: 13px;">
	    				<div>疾病称名：</div>
	    			</td>
	    			<td align="left">
	    				<input class="inputMin_informationModify text-input" type="text" id="diseaseName" name="diseaseName" maxlength="50" style="width: 350px;" value="${diseaseHis.diseaseName }">
	    				<span style="color: red;">*</span>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td align="right" style="padding: 5px 5px 5px 0; width:100px; height: 30px; color: #aeaeae; font-size: 13px;">
	    				开始日期：
	    			</td>
	    			<td align="left">
		               <input class="inputMin_informationModify text-input Wdate"  onclick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})" type="text" id="startDate" name="startDate" maxlength="16" style="width: 350px;" value="${diseaseHis.startDate }">
	    			   <span style="color: red;">*</span>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td align="right" style="padding: 5px 5px 5px 0; width:70px; height: 30px; color: #aeaeae; font-size: 13px;">
	    				结束日期：
	    			</td>
	    			<td align="left">
	    				<input class="inputMin_informationModify text-input Wdate"  onclick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})" type="text" id="endDate" name="endDate" maxlength="16" style="width: 350px;" value="${diseaseHis.endDate }">
	    				<span style="color: red;">*</span>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td align="right" style="padding: 5px 5px 5px 0; width:70px; height: 70px; color: #aeaeae; font-size: 13px;">
	    				住院情况：
	    			</td>
	    			<td align="left">
	    				<textarea class="inputMin_informationModify text-input" style="width: 500px; height: 60px;" id="descInHospital" name="descInHospital" maxlength="250">${diseaseHis.descInHospital }</textarea>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td align="right" style="padding: 5px 5px 5px 0; width:80px; height: 70px; color: #aeaeae; font-size: 13px;">
	    				转院情况：
	    			</td>
	    			<td align="left">
	    				<textarea class="inputMin_informationModify text-input" style="width: 500px; height: 60px;" id="descObserve" name="descObserve" maxlength="250">${diseaseHis.descObserve }</textarea>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td align="right" style="padding: 5px 5px 5px 0; width:70px; height: 30px; color: #aeaeae; font-size: 13px;">
	    				备<span style="padding: 0 13px;"></span>注：
	    			</td>
	    			<td align="left">
	    				<input type="hidden" id="id" name="id" value="${diseaseHis.id}"/>
	    				<textarea class="inputMin_informationModify text-input" style="width: 500px; height: 60px;" id="memo" name="memo" maxlength="250">${diseaseHis.memo }</textarea>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td align="center" colspan="2">
	    				<ul>
	    					<li class="btn_reguster"><a onclick="funSaveInfo()" style="cursor: pointer;">确定</a></li>
	    				</ul>
	    			</td>
	    		</tr>
	    	</table>
        </div>
       </div>
     </div>
</body>
</html>
