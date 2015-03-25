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
	</style>
  </head>
<body style="background: #ffffff;">
	<div class="account">
		<div class="account_title">
	      <ul>
	        <li class="account_titleGreen">平台医生</li>
	        <li class="account_titleGray">当前位置：医生详细信息</li>
	      </ul>
	    </div>
	</div>    
	<div class="information_modify">
	    <div class="information_modify_main" id="main_div">
	    	<div class="btn_title_informationModify" style="margin-top: 20px;">
	          <ul>
	            <li class="tLeft">【<span style="color:red; font-weight: bold;">${doctor.doctorName }</span>】的基本信息</li>
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
		    				<input disabled="disabled" class="inputMin_informationModify text-input" type="text" value="${doctor.doctorName}">
		    			</td>
		    			<td rowspan="5">
		    				<table>
		    					<tr>
		    						<td>
		    							<img style="width:120px; height: 160px;" src="<c:url value='/nurse/themes/images/default_head.gif'/>">
		    						</td>
		    					</tr>
		    				</table>
		    			</td>
		    		</tr>
		    		<tr>
		    			<td align="right" style="padding: 5px 5px 5px 0; width:70px; height: 30px; color: #aeaeae; font-size: 13px;">
		    				性<span style="padding: 0 13px;"></span>别：
		    			</td>
		    			<td align="left">
		    				<select disabled="disabled" class="selectMax_informationModify  text-input">
			                   <option value="-1">请选择</option>
				               <option value="1" <c:if test="${doctor.doctorGender == 1}">selected="selected"</c:if>>男</option>
				               <option value="2" <c:if test="${doctor.doctorGender == 2}">selected="selected"</c:if>>女</option>
			               </select>
		    			</td>
		    		</tr>
		    		
					<tr>
		    			<td align="right" style="padding: 5px 5px 5px 0; width:70px; height: 30px; color: #aeaeae; font-size: 13px;">
		    				职<span style="padding: 0 13px;"></span>称：
		    			</td>
		    			<td align="left">
		    				<input disabled="disabled" class="inputMin_informationModify text-input" type="text" value="${doctor.doctorTitle}">
		    			</td>
		    		</tr>
		    		<tr>
		    			<td align="right" style="padding: 5px 5px 5px 0; width:70px; height: 30px; color: #aeaeae; font-size: 13px;">
		    				学<span style="padding: 0 13px;"></span>历：
		    			</td>
		    			<td align="left">
		    				<input disabled="disabled" class="inputMin_informationModify text-input" type="text" value="${doctor.doctorEducationName}">
		    			</td>
		    		</tr>
		    		<tr>
		    			<td align="right" style="padding: 5px 5px 5px 0; width:70px; height: 30px; color: #aeaeae; font-size: 13px;">
		    				所属科室：
		    			</td>
		    			<td align="left">
		    				<input disabled="disabled" class="inputMin_informationModify text-input" type="text" value="${doctor.deptName}">
		    			</td>
		    		</tr>
		    		<tr>
		    			<td align="right" style="padding: 5px 5px 5px 0; width:70px; height: 30px; color: #aeaeae; font-size: 13px;">
		    				就职医院：
		    			</td>
		    			<td align="left">
		    				<input disabled="disabled" class="inputMin_informationModify text-input" type="text" value="${doctor.hospitalName}">
		    			</td>
		    		</tr>
		    		<tr>
		    			<td align="right" style="padding: 5px 5px 5px 0; width:70px; height: 30px; color: #aeaeae; font-size: 13px;">
		    				医院地址：
		    			</td>
		    			<td align="left" colspan="2">
		    				<input disabled="disabled" class="inputMin_informationModify text-input" type="text" value="${doctor.hospitalAddr }" style="width: 550px;">
		    			</td>
		    		</tr>
		    		<tr>
		    			<td align="right" style="padding: 5px 5px 5px 0; width:70px; height: 140px; color: #aeaeae; font-size: 13px;">
		    				擅长疾病：
		    			</td>
		    			<td align="left" colspan="2">
		    				<textarea disabled="disabled" class="inputMin_informationModify text-input" style="width: 550px; height: 135px;">${doctor.doctorSkill }</textarea>
		    			</td>
		    		</tr>
		    		<tr>
		    			<td align="right" style="padding: 5px 5px 5px 0; width:70px; height: 140px; color: #aeaeae; font-size: 13px;">
		    				详细介绍：
		    			</td>
		    			<td align="left" colspan="2">
		    				<textarea disabled="disabled" class="inputMin_informationModify text-input" style="width: 550px; height: 135px;">${doctor.doctorEducationName }</textarea>
		    			</td>
		    		</tr>
		    	</table>
		    </div>	
	    </div>
	</div>
   
</body>
</html>
