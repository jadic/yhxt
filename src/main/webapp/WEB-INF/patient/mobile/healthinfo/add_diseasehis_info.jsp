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
	<%@ include file="/WEB-INF/patient/common/date-include.jsp"%>
    <%@ include file="/WEB-INF/patient/common/mobile-include.jsp"%>
    <%@ include file="/WEB-INF/patient/common/easyui-include.jsp"%>
    <style>
    	input, select,textarea{border:1px solid #ccc; height: 35px; width: 85%; padding-left: 10px;}
    	#content table td{height: 45px;}
    </style>
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
						$.messager.confirm('确认', data.msg, function(r)
						{
							window.location.href = "<c:url value='/p/query/diseasehis.do'/>";
						});
					}
					else
					{
						$.messager.alert('信息提示', data.msg, 'error');
					}
				}
			});
		}
		
		function delDiseaseHis(id)
		{
			$.messager.confirm('确认', "您确认要删除这条记录吗？", function(r)
			{
				if (r)
				{
					/**打开进度条**/
					PageMain.funOpenProgress();
					
					$.ajax({
						url : _ctx_ + "/p/query/delDiseaseHis.do?a="+ Math.random(),
						type : 'post',
						dataType : 'json',
						data : 
						{
							"id": id						
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
									window.location.href = "<c:url value='/p/query/diseasehis.do'/>";
								});
							}
							else
							{
								$.messager.alert('信息提示', data.msg, 'error');
							}
						}
					});
				}
			});
		}
	</script>
  </head>
<body>
	<header id="header">
  		<c:if test="${query.id  > 0}">修改</c:if><c:if test="${query.id  == 0}">增加</c:if>疾病史
  		<div class="left"><a href="javascript:void(0)" onclick="PageMobile.funLoadIng();window.history.back()"><span class="corner"></span></a></div>
  		<c:if test="${query.id  > 0}"><div class="right"><a href="javascript:void(0)" onclick="delDiseaseHis(${diseaseHis.id})"><span class="cornerDel"></span></a></div></c:if>
  	</header>
  	<div id="content" style="padding: 14px;">
        	<table cellpadding="0" border="0" cellspacing="0" style="font-size: 18px; width: 100%;">
	    		<tr>
	    			<td align="center">
	    				<input type="text" placeholder="疾病称名" id="diseaseName" name="diseaseName" maxlength="50"  value="${diseaseHis.diseaseName }">
	    				<span style="color: red;">*</span>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td align="center">
		               <input class="inputMin_informationModify text-input" style="height: 35px;"  placeholder="开始日期"  type="date" id="startDate" name="startDate" maxlength="16"  value="${diseaseHis.startDate }">
	    			   <span style="color: red;">*</span>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td align="center">
	    				<input class="inputMin_informationModify text-input" style="height: 35px;" placeholder="结束日期"  type="date" id="endDate" name="endDate" maxlength="16"  value="${diseaseHis.endDate }">
	    				<span style="color: red;">*</span>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td align="center" style="padding-top: 10px;">
	    				<textarea style="height: 60px;"  placeholder="住院情况" id="descInHospital" name="descInHospital" maxlength="250">${diseaseHis.descInHospital }</textarea>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td align="center" style="padding-top: 10px;">
	    				<textarea style="height: 60px;" placeholder="转院情况" id="descObserve" name="descObserve" maxlength="250">${diseaseHis.descObserve }</textarea>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td align="center" style="padding-top: 10px;">
	    				<input type="hidden" id="id" name="id" value="${diseaseHis.id}"/>
	    				<textarea style="height: 60px;" placeholder="备注" id="memo" name="memo" maxlength="250">${diseaseHis.memo }</textarea>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td align="center">
	    				<ul>
	    					<li class="btn_reguster"><a onclick="funSaveInfo()" style="cursor: pointer;">确定</a></li>
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
