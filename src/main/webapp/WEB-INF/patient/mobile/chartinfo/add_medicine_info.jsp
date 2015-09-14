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
		.Wdate{
			height: 28px;
			width:170px;
  			border: 1px solid #aeaeae;
		}
		.search {
		  width: 100%;
		  padding: 3px 0;
		  background: #f7f7f7;
		  float: left;
		  margin-top: 10px;
		   margin-bottom: 10px;
		}
	</style>
	<link rel="stylesheet" href="<c:url value='/patient/themes/health_records.css'/>" type="text/css"/>
	<script type="text/JavaScript">
		$(function(){
			$("a").bind("click", function(){
				PageMobile.funLoadIng();
			});
		});
		function funSaveInfo()
		{
			if (funIsNull("#medicineName", "药品名称") 
				|| funIsNull("#medicineAmount", "用药剂量")
				|| funIsNull("#medicineTime", "用药时间"))
			{
				return false;
			}
			/**打开进度条**/
			PageMain.funOpenProgress();
			$.ajax({
				url : _ctx_ + '/p/query/<c:if test="${query.id  > 0}">modifyMedicine.do</c:if><c:if test="${query.id  == 0}">addMedicine.do</c:if>?a='+ Math.random(),
				type : 'post',
				dataType : 'json',
				data : 
				{
					"id": $("#id").val(),	
					"medicineName": $("#medicineName").val(),	
					"medicineAmount": $("#medicineAmount").val(),	
					"medicineUnit": $("#medicineUnit").val(),	
					"medicineTime": $("#medicineTime").val()
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
							window.history.back();
							//window.location.href = "<c:url value='/p/query/medicine.do'/>";
						});
					}
					else
					{
						$.messager.alert('信息提示', data.msg, 'error');
					}
				}
			});
		}
		function delMedicine(id)
		{
			$.messager.confirm('确认', "您确认要删除这条记录吗？", function(r)
			{
				if (r)
				{
					/**打开进度条**/
					PageMain.funOpenProgress();
					
					$.ajax({
						url : _ctx_ + "/p/query/delMedicine.do?a="+ Math.random(),
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
									window.history.back();
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
<body style="padding: 0px; margin: 0px;">
  	<header id="header">
  		<c:if test="${query.id  > 0}">修改</c:if><c:if test="${query.id  == 0}">新增</c:if>用药记录
  		<div class="left"><a href="<c:url value='/p/query/medicine.do'/>"><span class="corner"></span></a></div>
  		<c:if test="${query.id  > 0}"><div class="right"><a href="javascript:void(0)" onclick="delMedicine(${query.id})"><span class="cornerDel"></span></a></div></c:if>
  	</header>
  	<div id="content">
        	<table cellpadding="0" border="0" cellspacing="0" style="font-size: 18px; width: 100%;">
	    		<tr>
	    			<td align="right" style="padding: 5px 5px 5px 0; width:100px; height: 40px; color: #aeaeae; font-size: 18px;">
	    				药品名称：
	    			</td>
	    			<td align="left">
	    				<input class="inputMin_informationModify text-input" type="text" id="medicineName" style="width: 80%; height:35px; font-size: 18px;" value="${medicine.medicineName }">
	    				<span style="color: red;">*</span>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td align="right" style="padding: 5px 5px 5px 0; width:100px; height: 40px; color: #aeaeae; font-size: 18px;">
	    				用药剂量：
	    			</td>
	    			<td align="left">
	    				<input class="inputMin_informationModify text-input" placeholder ="只能输入数值" type="text" id="medicineAmount"  maxlength="6" style="width: 80%; height:35px;font-size: 18px;" value="${medicine.medicineAmount }">
		               <span style="color: red;">*</span>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td align="right" style="padding: 5px 5px 5px 0; width:100px; height: 40px; color: #aeaeae; font-size: 18px;">
	    				用药单位：
	    			</td>
	    			<td align="left">
	    				<select   class="selectMax_informationModify  text-input" id="medicineUnit" style="width: 80%; font-size: 18px;height:35px;">
			               <option value="克" <c:if test="${medicine.medicineUnit == '克'}">selected="selected"</c:if>>克</option>
			               <option value="片" <c:if test="${medicine.medicineUnit == '片'}">selected="selected"</c:if>>片 </option>
			               <option value="粒" <c:if test="${medicine.medicineUnit == '粒'}">selected="selected"</c:if>>粒 </option>
			               <option value="包" <c:if test="${medicine.medicineUnit == '包'}">selected="selected"</c:if>>包 </option>
			               <option value="毫升" <c:if test="${medicine.medicineUnit == '毫升'}">selected="selected"</c:if>>毫升 </option>
			               <option value="次" <c:if test="${medicine.medicineUnit == '次'}">selected="selected"</c:if>>次 </option>
			               <option value="瓶" <c:if test="${medicine.medicineUnit == '瓶'}">selected="selected"</c:if>>瓶 </option>
			               <option value="其它" <c:if test="${medicine.medicineUnit == '其它'}">selected="selected"</c:if>>其它 </option>
			            </select>   
	    			</td>
	    		</tr>
	    		<tr>
	    			<td align="right" style="padding: 5px 5px 5px 0; width:100px; height: 40px; color: #aeaeae; font-size: 18px;">
	    				用药时间：
	    			</td>
	    			<td align="left">
	    				<c:if test="${empty medicine}">
	    				<input type="hidden" id="id" value="0"/>
	    				</c:if>
	    				<c:if test="${not empty medicine}">
	    				<input type="hidden" id="id" value="${medicine.id}"/>
	    				</c:if>
	    				<input class="inputMin_informationModify text-input" type="date" id="medicineTime" style="width: 80%; height:35px;font-size: 18px;" value="${medicine.medicineTime }">
	    				<span style="color: red;">*</span>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td align="center" colspan="2">
	    				<ul>
	    					<li class="btn_reguster" style="width: 100%"><a onclick="funSaveInfo()" style="cursor: pointer; width: 300px;">确定</a></li>
	    				</ul>
	    			</td>
	    		</tr>
	    	</table>
     </div>
	<footer id="footer">
		<footer id="footer">
		<jsp:include page="/WEB-INF/patient/common/footer-include.jsp">
			<jsp:param value="1" name="selected"/>
		</jsp:include>
	</footer>	
</body>
</html>
