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
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">  
	<meta name="viewport" content="width=device-width,height=device-height,initial-scale=1.0,maximum-scale=1.0,user-scalable=no">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0"> 
    <%@ include file="/WEB-INF/patient/common/dwr-include.jsp"%>
    <%@ include file="/WEB-INF/patient/common/mobile-include.jsp"%>
	<%@ include file="/WEB-INF/patient/common/easyui-include.jsp"%>
	<style>
    	input, select,textarea{border:1px solid #ccc; height: 30px; width: 80%; padding-left: 10px;}
    	#content table td{height: 35px;}
    </style>
	<script type="text/JavaScript">
		$(function(){
			$('.text-input').attr("disabled", "disabled");
			ComDwr.loadDictInfo("credentialType", true, "${userModel.credentialType}", 1);
			ComDwr.loadDictInfo("nationality", true, "${userModel.nationality}", 2);
			ComDwr.loadDictInfo("marriageStatus", true, "${userModel.marriageStatus}", 3);
			ComDwr.loadDictInfo("householdType", true, "${userModel.householdType}", 4);
			ComDwr.loadDictInfo("education", true, "${userModel.education}", 5);
			ComDwr.loadDictInfo("policticsStatus", true, "${userModel.policticsStatus}", 6);
		});
	</script>	
  </head>
<body >
	<body>
	<header id="header">
  		医护人员详情
  		<div class="left"><a href="javascript:void(0)" onclick="window.history.back()"><span class="corner"></span></a></div>
  	</header>
  	<div id="content" style="padding: 10px 0">
		  		<table cellpadding="0" border="0" cellspacing="0" style="font-size: 13px; height:40PX; width: 100%; background: #F7F7F7;">
		  			<tr>
		  				<td style="padding-left: 10px;" align="left">医护人员基本信息</td>
		  				<td align="right" style="padding-right: 10px;"></td>
		  			</tr>
		  		</table>
	  		
	        	<table cellpadding="0" border="0" cellspacing="0" style="font-size: 13px; width: 100%;">
		    		<tr>
		    			<td align="right" style="padding: 5px 0; width:85px; height: 30px; color: #aeaeae; font-size: 16px;">
		    				真实姓名：
		    			</td>
		    			<td align="left">
		    				<input class="inputMin_informationModify text-input validate[required,funcCall[chinaornumer],minSize[1],maxSize[16]] " type="text" id="name" name="name" value="${userModel.name }" maxlength="16">
		    			</td>
		    			<td rowspan="5">
		    				<table>
		    					<tr>
		    						<td>
		    							<img style="width:120px; height: 160px;" id="header_photo" src="<c:url value='/patient/themes/images/default_head.gif'/>">
		    						</td>
		    					</tr>
		    					<tr>	
		    						<td class="thead_informationModify">
		    							<img src="<c:url value='/patient/themes/images/star_s${ userModel.score}.png'/>">
		    						</td>
		    					</tr>
		    					<tr>
		    						<td>
		    							签约人数：${ userModel.cnt}
		    						</td>
		    					</tr>
		    				</table>
		    			</td>
		    		</tr>
		    		<tr>
		    			<td align="right" style="padding: 5px 0; width:85px; height: 30px; color: #aeaeae; font-size: 16px;">
		    				性<span style="padding: 0 13px;"></span>别：
		    			</td>
		    			<td align="left">
		    				<select class="selectMax_informationModify  text-input validate[required]" id="gender" name="gender">
			                   <option value="-1">请选择</option>
				               <option value="1" <c:if test="${userModel.gender == 1}">selected="selected"</c:if>>男</option>
				               <option value="2" <c:if test="${userModel.gender == 2}">selected="selected"</c:if>>女</option>
			               </select>
		    			</td>
		    		</tr>
		    		<tr>
		    			<td align="right" style="padding: 5px 0; width:85px; height: 30px; color: #aeaeae; font-size: 16px;">
		    				出生日期：
		    			</td>
		    			<td align="left">
		    				<input class="inputMin_informationModify text-input validate[required,funcCall[chinaornumer],minSize[1],maxSize[16]] Wdate"  onclick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})" type="text" id="birthdate" name="birthdate" maxlength="16" value="${userModel.birthdate }">
		    			</td>
		    		</tr>
		    		<tr>
		    			<td align="right" style="padding: 5px 0; width:85px; height: 30px; color: #aeaeae; font-size: 16px;">
		    				手机号码：
		    			</td>
		    			<td align="left">
		    				<input class="inputMin_informationModify text-input validate[required,funcCall[chinaornumer],minSize[1],maxSize[16]] " type="text" id="cellphone" name="cellphone" maxlength="11" value="${userModel.cellphone }">
		    			</td>
		    		</tr>
		    		<tr>
		    			<td align="right" style="padding: 5px 0; width:85px; height: 30px; color: #aeaeae; font-size: 16px;">
		    				电子邮箱：
		    			</td>
		    			<td align="left">
		    				<input class="inputMin_informationModify text-input validate[required,funcCall[chinaornumer],minSize[1],maxSize[16]] " type="text" id="email" name="email" maxlength="40" value="${userModel.email }">
		    			</td>
		    		</tr>
		    	</table>
	        
	        <table cellpadding="0" border="0" cellspacing="0" style="font-size: 13px; height:40PX; width: 100%; background: #F7F7F7;">
	  			<tr>
	  				<td style="padding-left: 10px;" align="left">医护人员详细信息</td>
	  				<td align="right" style="padding-right: 10px;"></td>
	  			</tr>
	  		</table>
	        	<table cellpadding="0" border="0" cellspacing="0" style="font-size: 13px; width: 100%;">
		    		<tr>
		    			<td align="right" style="padding: 5px 0; width:85px; height: 30px; color: #aeaeae; font-size: 16px;">
		    				证件类型：
		    			</td>
		    			<td align="left">
		    				<select class="selectMax_informationModify  text-input validate[required]" id="credentialType" name="credentialType">
			                    <option value="-1">请选择</option>
			               </select>
		    			</td>
			    	</tr>
			    	<tr>		
		    			<td align="right" style="padding: 5px 0; width:85px; height: 30px; color: #aeaeae; font-size: 16px;">
		    				证件号码：
		    			</td>
		    			<td align="left">
		    				<input class="inputMin_informationModify text-input validate[required,funcCall[chinaornumer],minSize[1],maxSize[16]] " type="text" id="credentialNo" name="credentialNo" maxlength="50" value="${userModel.credentialNo }">
		    			</td>
		    		</tr>
		    		<tr>
		    			<td align="right" style="padding: 5px 0; width:85px; height: 30px; color: #aeaeae; font-size: 16px;">
		    				是否军人：
		    			</td>
		    			<td align="left">
		    				<select class="selectMax_informationModify  text-input validate[required]" id="isSoldier" name="isSoldier">
			                    <option value="-1"></option>
				               <option value="0" <c:if test="${userModel.isSoldier == 0}">selected="selected"</c:if>>是</option>
				               <option value="1" <c:if test="${userModel.isSoldier == 1}">selected="selected"</c:if>>否</option>
			               </select>
		    			</td>
		    		</tr>
			    	<tr>	
		    			<td align="right" style="padding: 5px 0; width:85px; height: 30px; color: #aeaeae; font-size: 16px;">
		    				是否残疾：
		    			</td>
		    			<td align="left">
		    				<select class="selectMax_informationModify  text-input validate[required]" id="isDisablity" name="isDisablity">
			                    <option value="-1"></option>
				               <option value="0" <c:if test="${userModel.isDisablity == 0}">selected="selected"</c:if>>是</option>
				               <option value="1" <c:if test="${userModel.isDisablity == 1}">selected="selected"</c:if>>否</option>
			               </select>
		    			</td>
		    		</tr>
		    		<tr>
		    			<td align="right" style="padding: 5px 0; width:85px; height: 30px; color: #aeaeae; font-size: 16px;">
		    				身高(cm)：
		    			</td>
		    			<td align="left">
		    				<input class="inputMin_informationModify text-input validate[required,funcCall[chinaornumer],minSize[1],maxSize[16]] " type="text" id="height" name="height" value="${userModel.height }" maxlength="3">
		    			</td>
		    		</tr>
			    	<tr>	
		    			<td align="right" style="padding: 5px 0; width:85px; height: 30px; color: #aeaeae; font-size: 16px;">
		    				体重(kg)：
		    			</td>
		    			<td align="left">
		    				<input class="inputMin_informationModify text-input validate[required,funcCall[chinaornumer],minSize[1],maxSize[16]] " type="text" id="weight" name="weight" value="${userModel.weight }" maxlength="3">
		    			</td>
		    		</tr>
		    		<tr>
		    			<td align="right" style="padding: 5px 0; width:85px; height: 30px; color: #aeaeae; font-size: 16px;">
		    				民<span style="padding: 0 13px;"></span>族：
		    			</td>
		    			<td align="left">
		    				<select class="selectMax_informationModify  text-input validate[required]" id="nationality" name="nationality">
			                    <option value="-1"></option>
			               </select>
		    			</td>
		    		</tr>
			    	<tr>	
		    			<td align="right" style="padding: 5px 0; width:85px; height: 30px; color: #aeaeae; font-size: 16px;">
		    				籍<span style="padding: 0 16px;"></span>贯：
		    			</td>
		    			<td align="left">
		    				<input class="inputMin_informationModify text-input validate[required,funcCall[chinaornumer],minSize[1],maxSize[16]] " type="text" id="nativePlace" name="nativePlace" value="${userModel.nativePlace }" maxlength="80">
		    			</td>
		    		</tr>
		    		<tr>
		    			<td align="right" style="padding: 5px 0; width:85px; height: 30px; color: #aeaeae; font-size: 16px;">
		    				婚姻状况：
		    			</td>
		    			<td align="left">
		    				<select class="selectMax_informationModify  text-input validate[required]" id="marriageStatus" name="marriageStatus">
			                    <option value="-1">请选择</option>
			               </select>
		    			</td>
		    		</tr>
			    	<tr>	
		    			<td align="right" style="padding: 5px 0; width:85px; height: 30px; color: #aeaeae; font-size: 16px;">
		    				户籍类型：
		    			</td>
		    			<td align="left">
		    				<select class="selectMax_informationModify  text-input validate[required]" id="householdType" name="householdType">
			                    <option value="-1">请选择</option>
			               </select>
		    			</td>
		    		</tr>
		    		<tr>
		    			<td align="right" style="padding: 5px 0; width:85px; height: 30px; color: #aeaeae; font-size: 16px;">
		    				学<span style="padding: 0 13px;"></span>历：
		    			</td>
		    			<td align="left">
		    				<select class="selectMax_informationModify  text-input validate[required]" id="education" name="education">
			                    <option value="-1">请选择</option>
			               </select>
		    			</td>
		    		</tr>
			    	<tr>	
		    			<td align="right" style="padding: 5px 0; width:85px; height: 30px; color: #aeaeae; font-size: 16px;">
		    				政治面貌：
		    			</td>
		    			<td align="left">
		    				<select class="selectMax_informationModify  text-input validate[required]" id="policticsStatus" name="policticsStatus">
			                    <option value="-1">请选择</option>
			               </select>
		    			</td>
		    		</tr>
		    		<tr>
		    			<td align="right" style="padding: 5px 0; width:85px; height: 30px; color: #aeaeae; font-size: 16px;">
		    				家庭电话：
		    			</td>
		    			<td align="left">
		    				<input class="inputMin_informationModify text-input validate[required,funcCall[chinaornumer],minSize[1],maxSize[16]] " type="text" id="homePhone" name="homePhone" value="${userModel.homePhone }" maxlength="15">
		    			</td>
		    		</tr>
		    		<tr>
		    			<td align="right" style="padding: 5px 0; width:85px; height: 30px; color: #aeaeae; font-size: 16px;">
		    				家庭地址：
		    			</td>
		    			<td align="left">
		    				<input class="inputMax_informationModify text-input validate[required,funcCall[chinaornumer],minSize[1],maxSize[16]] " type="text" id="homeAddress" name="homeAddress" value="${userModel.homeAddress }" maxlength="80">
		    			</td>
		    		</tr>
		    	</table>
	</div>
	<footer id="footer">
		<jsp:include page="/WEB-INF/patient/common/footer-include.jsp">
			<jsp:param value="3" name="selected"/>
		</jsp:include>
	</footer>   	   
</body>
</html>
