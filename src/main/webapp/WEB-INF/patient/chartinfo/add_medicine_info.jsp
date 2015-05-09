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
							window.location.href = "<c:url value='/p/query/medicine.do'/>";
						});
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
<body>
<div class="account" style="background: #ffffff;">
	<div class="account_title" style="background: #ffffff;">
      <ul>
        <li class="account_titleGreen">用药记录</li>
        <li class="account_titleGray">
        	当前位置：<a href="javascript:void(0)" onclick="window.history.back();">用药记录</a> 》<c:if test="${query.id  > 0}">修改</c:if><c:if test="${query.id  == 0}">新增</c:if>用药记录
        </li>
      </ul>
    </div>
</div> 
 <div class="information_modify">
 	<div style="float: left; width: 100%; height: 20px;"></div>
    <div class="information_modify_main" id="main_div">
        <div class="informationModify_main">
        	<table cellpadding="0" border="0" cellspacing="0" style="font-size: 13px; width: 100%;">
	    		<tr>
	    			<td align="right" style="padding: 5px 5px 5px 0; width:70px; height: 30px; color: #aeaeae; font-size: 13px;">
	    				药品名称：
	    			</td>
	    			<td align="left">
	    				<input class="inputMin_informationModify text-input" type="text" id="medicineName" style="width: 350px;" value="${medicine.medicineName }">
	    				<span style="color: red;">*</span>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td align="right" style="padding: 5px 5px 5px 0; width:70px; height: 30px; color: #aeaeae; font-size: 13px;">
	    				用药剂量：
	    			</td>
	    			<td align="left">
	    				<input class="inputMin_informationModify text-input" type="text" id="medicineAmount"  maxlength="6" style="width: 350px;" value="${medicine.medicineAmount }">
		               <span style="color: red;">*</span>
		               <span style="color: #f5f5f5; font-size: 12px;">只能输入数值</span>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td align="right" style="padding: 5px 5px 5px 0; width:70px; height: 30px; color: #aeaeae; font-size: 13px;">
	    				用药单位：
	    			</td>
	    			<td align="left">
	    				<select class="selectMax_informationModify  text-input" id="medicineUnit" style="width: 350px;">
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
	    			<td align="right" style="padding: 5px 5px 5px 0; width:70px; height: 30px; color: #aeaeae; font-size: 13px;">
	    				用药时间：
	    			</td>
	    			<td align="left">
	    				<c:if test="${empty medicine}">
	    				<input type="hidden" id="id" value="0"/>
	    				</c:if>
	    				<c:if test="${not empty medicine}">
	    				<input type="hidden" id="id" value="${medicine.id}"/>
	    				</c:if>
	    				<input class="inputMin_informationModify text-input Wdate" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',readOnly:true})" type="text" id="medicineTime" style="width: 350px;" value="${medicine.medicineTime }">
	    				<span style="color: red;">*</span>
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
