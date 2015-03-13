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
    <title>南京通用电器有限公司 </title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0"> 
	<%@ include file="/WEB-INF/nurse/common/top-include.jsp"%>
	<%@ include file="/WEB-INF/nurse/common/easyui-include.jsp"%>
	
	<link rel="stylesheet" href="<c:url value='/nurse/themes/health_records.css'/>" type="text/css"/>
	<script type="text/JavaScript">
		$(function(){
			$('.text-input').attr("disabled", "disabled");
			
			ComDwr.loadDictInfo("credentialType", true, "${userModel.credentialType}", 1);
			ComDwr.loadDictInfo("nationality", true, "${userModel.nationality}", 2);
			ComDwr.loadDictInfo("marriageStatus", true, "${userModel.marriageStatus}", 3);
			ComDwr.loadDictInfo("householdType", true, "${userModel.householdType}", 4);
			ComDwr.loadDictInfo("education", true, "${userModel.education}", 5);
			ComDwr.loadDictInfo("policticsStatus", true, "${userModel.policticsStatus}", 6);
			ComDwr.loadDictInfo("workingAge", true, "${userModel.workingAge}", 7);
			ComDwr.loadDictInfo("salary", true, "${userModel.salary}", 8);
		});
		function edit_baseinfo(obj, type)
		{
			if($(obj).attr("tag") == "false")
			{
				$(obj).parent().parent().parent().next().find(".text-input").attr("disabled", false);
				$(obj).children().attr("src", "<c:url value='/nurse/themes/images/btn_preserve.png'/>");
				$(obj).attr("tag", "true");
			}
			else
			{
				var paramUrl = _ctx_ + "/n/search/modifyUser.do?a="+ Math.random();
				var paramData = {};
				if(type == 1)
				{
					if (funIsNull("#name", "姓名") 
							|| funIsSelect("#gender", "性别")
							|| funIsNull("#birthdate", "出生日期") 
							|| funIsNull("#cellphone", "手机号码") 
							|| funIsNull("#email", "电子邮箱") )
					{
						return false;
					}
					
					paramUrl = _ctx_ + "/n/search/modifyUser.do?a="+ Math.random();
					paramData = {
						"name" : $("#name").val(),	
						"gender" : $("#gender").val(),
						"birthdate" : $("#birthdate").val(),
						"cellphone" : $("#cellphone").val(),
						"email" : $("#email").val(),
						"photo" : $("#photo").val()
					};
				}
				else if(type == 2)
				{
					paramUrl = _ctx_ + "/n/search/modifyUserDetail.do?a="+ Math.random();
					paramData = {
						"credentialType" 	: $("#credentialType").val(),	
						"credentialNo" 		: $("#credentialNo").val(),
						"isSoldier" 		: $("#isSoldier").val(),
						"isDisablity" 		: $("#isDisablity").val(),
						"height" 			: $("#height").val(),
						"weight" 			: $("#weight").val(),
						"nationality" 		: $("#nationality").val(),
						"nativePlace" 		: $("#nativePlace").val(),
						"marriageStatus" 	: $("#marriageStatus").val(),
						"householdType" 	: $("#householdType").val(),
						"education" 		: $("#education").val(),
						"policticsStatus" 	: $("#policticsStatus").val(),
						"homeAddress" 		: $("#homeAddress").val(),
						"homePhone" 		: $("#homePhone").val()
					};
				}
				else if(type == 3)
				{
					paramUrl = _ctx_ + "/n/search/modifyUserWork.do?a="+ Math.random();
					paramData = {
						"workingAge" : $("#workingAge").val(),	
						"salary" : $("#salary").val(),
						"companyName" : $("#companyName").val(),
						"companyAddress" : $("#companyAddress").val()
					};
				}	
				
				
				PageMain.funOpenProgress();
				$.ajax({
					url : paramUrl,
					type : 'post',
					dataType : 'json',
					data : paramData,
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
							$(obj).children().attr("src", "<c:url value='/nurse/themes/images/btn_editor.png'/>");
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
<body>
  <div class="information_modify">
    <div class="title_informationModify"><span class="tgrey_title_informationModify">基本</span>信息</div>
    <div class="information_modify_main" id="main_div">
    	<div class="btn_title_informationModify">
          <ul>
            <li class="tLeft">基本信息</li>
            <li class="tRight"><a href="javascript:void(0)" onclick="edit_baseinfo(this, 1)" tag="false"><img src="<c:url value='/nurse/themes/images/btn_editor.png'/>"></a></li>
          </ul>
        </div>
        <div class="informationModify_main">
        	<table cellpadding="0" border="0" cellspacing="0" style="font-size: 13px; width: 100%;">
	    		<tr>
	    			<td align="right" style="padding: 5px 5px 5px 0; width:70px; height: 30px; color: #aeaeae; font-size: 13px;">
	    				真实姓名：
	    			</td>
	    			<td align="left">
	    				<input class="inputMin_informationModify text-input validate[required,funcCall[chinaornumer],minSize[1],maxSize[16]] " type="text" id="name" name="name" value="${userModel.name }" maxlength="16">
	    				<span style="color: red;">*</span>
	    			</td>
	    			<td rowspan="5">
	    				<table>
	    					<tr>
	    						<td>
	    							<img style="width:120px; height: 160px;" id="header_photo" src="<c:url value='/nurse/themes/images/default_head.gif'/>">
	    						</td>
	    					</tr>
	    					<tr>	
	    						<td class="thead_informationModify">
	    							<a href="javascript:void(0)" style="font-size: 14px;">修改图像</a>
	    						</td>
	    					</tr>
	    				</table>
	    				<input id="photo" name="photo" type="hidden"/>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td align="right" style="padding: 5px 5px 5px 0; width:70px; height: 30px; color: #aeaeae; font-size: 13px;">
	    				性<span style="padding: 0 13px;"></span>别：
	    			</td>
	    			<td align="left">
	    				<select class="selectMax_informationModify  text-input validate[required]" id="gender" name="gender">
		                   <option value="-1">请选择</option>
			               <option value="1" <c:if test="${userModel.gender == 1}">selected="selected"</c:if>>男</option>
			               <option value="2" <c:if test="${userModel.gender == 2}">selected="selected"</c:if>>女</option>
		               </select>
		               <span style="color: red;">*</span>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td align="right" style="padding: 5px 5px 5px 0; width:70px; height: 30px; color: #aeaeae; font-size: 13px;">
	    				出生日期：
	    			</td>
	    			<td align="left">
	    				<input class="inputMin_informationModify text-input validate[required,funcCall[chinaornumer],minSize[1],maxSize[16]] Wdate"  onclick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})" type="text" id="birthdate" name="birthdate" maxlength="16" value="${userModel.birthdate }">
	    				<span style="color: red;">*</span>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td align="right" style="padding: 5px 5px 5px 0; width:70px; height: 30px; color: #aeaeae; font-size: 13px;">
	    				手机号码：
	    			</td>
	    			<td align="left">
	    				<input class="inputMin_informationModify text-input validate[required,funcCall[chinaornumer],minSize[1],maxSize[16]] " type="text" id="cellphone" name="cellphone" maxlength="11" value="${userModel.cellphone }">
	    				<span style="color: red;">*</span>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td align="right" style="padding: 5px 5px 5px 0; width:70px; height: 30px; color: #aeaeae; font-size: 13px;">
	    				电子邮箱：
	    			</td>
	    			<td align="left">
	    				<input class="inputMin_informationModify text-input validate[required,funcCall[chinaornumer],minSize[1],maxSize[16]] " type="text" id="email" name="email" maxlength="40" value="${userModel.email }">
	    				<span style="color: red;">*</span>
	    			</td>
	    		</tr>
	    	</table>
        </div>
        
        
        <div class="btn_title_informationModify">
          <ul>
            <li class="tLeft">详细信息</li>
            <li class="tRight"><a href="javascript:void(0)" onclick="edit_baseinfo(this, 2)" tag="false"><img src="<c:url value='/nurse/themes/images/btn_editor.png'/>"></a></li>
          </ul>
        </div>
        <div class="informationModify_main">
        	<table cellpadding="0" border="0" cellspacing="0" style="font-size: 13px; width: 100%;">
	    		<tr>
	    			<td align="right" style="padding: 5px 5px 5px 0; width:70px; height: 30px; color: #aeaeae; font-size: 13px;">
	    				证件类型：
	    			</td>
	    			<td align="left">
	    				<select class="selectMax_informationModify  text-input validate[required]" id="credentialType" name="credentialType">
		                    <option value="-1">请选择</option>
		               </select>
	    			</td>
	    			<td align="right" style="padding: 5px 5px 5px 0; width:85px; height: 30px; color: #aeaeae; font-size: 13px;">
	    				证件号码：
	    			</td>
	    			<td align="left">
	    				<input class="inputMin_informationModify text-input validate[required,funcCall[chinaornumer],minSize[1],maxSize[16]] " type="text" id="credentialNo" name="credentialNo" maxlength="50" value="${userModel.credentialNo }">
	    			</td>
	    		</tr>
	    		<tr>
	    			<td align="right" style="padding: 5px 5px 5px 0; width:70px; height: 30px; color: #aeaeae; font-size: 13px;">
	    				是否军人：
	    			</td>
	    			<td align="left">
	    				<select class="selectMax_informationModify  text-input validate[required]" id="isSoldier" name="isSoldier">
		                    <option value="-1">请选择</option>
			               <option value="0" <c:if test="${userModel.isSoldier == 0}">selected="selected"</c:if>>是</option>
			               <option value="1" <c:if test="${userModel.isSoldier == 1}">selected="selected"</c:if>>否</option>
		               </select>
	    			</td>
	    			<td align="right" style="padding: 5px 5px 5px 0; width:85px; height: 30px; color: #aeaeae; font-size: 13px;">
	    				是否残疾：
	    			</td>
	    			<td align="left">
	    				<select class="selectMax_informationModify  text-input validate[required]" id="isDisablity" name="isDisablity">
		                    <option value="-1">请选择</option>
			               <option value="0" <c:if test="${userModel.isDisablity == 0}">selected="selected"</c:if>>是</option>
			               <option value="1" <c:if test="${userModel.isDisablity == 1}">selected="selected"</c:if>>否</option>
		               </select>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td align="right" style="padding: 5px 5px 5px 0; width:70px; height: 30px; color: #aeaeae; font-size: 13px;">
	    				身高(cm)：
	    			</td>
	    			<td align="left">
	    				<input class="inputMin_informationModify text-input validate[required,funcCall[chinaornumer],minSize[1],maxSize[16]] " type="text" id="height" name="height" value="${userModel.height }" maxlength="3">
	    			</td>
	    			<td align="right" style="padding: 5px 5px 5px 0; width:85px; height: 30px; color: #aeaeae; font-size: 13px;">
	    				体重(kg)：
	    			</td>
	    			<td align="left">
	    				<input class="inputMin_informationModify text-input validate[required,funcCall[chinaornumer],minSize[1],maxSize[16]] " type="text" id="weight" name="weight" value="${userModel.weight }" maxlength="3">
	    			</td>
	    		</tr>
	    		<tr>
	    			<td align="right" style="padding: 5px 5px 5px 0; width:70px; height: 30px; color: #aeaeae; font-size: 13px;">
	    				民<span style="padding: 0 13px;"></span>族：
	    			</td>
	    			<td align="left">
	    				<select class="selectMax_informationModify  text-input validate[required]" id="nationality" name="nationality">
		                    <option value="-1">请选择</option>
		               </select>
	    			</td>
	    			<td align="right" style="padding: 5px 5px 5px 0; width:85px; height: 30px; color: #aeaeae; font-size: 13px;">
	    				籍<span style="padding: 0 13px;"></span>贯：
	    			</td>
	    			<td align="left">
	    				<input class="inputMin_informationModify text-input validate[required,funcCall[chinaornumer],minSize[1],maxSize[16]] " type="text" id="nativePlace" name="nativePlace" value="${userModel.nativePlace }" maxlength="80">
	    			</td>
	    		</tr>
	    		<tr>
	    			<td align="right" style="padding: 5px 5px 5px 0; width:70px; height: 30px; color: #aeaeae; font-size: 13px;">
	    				婚姻状况：
	    			</td>
	    			<td align="left">
	    				<select class="selectMax_informationModify  text-input validate[required]" id="marriageStatus" name="marriageStatus">
		                    <option value="-1">请选择</option>
		               </select>
	    			</td>
	    			<td align="right" style="padding: 5px 5px 5px 0; width:85px; height: 30px; color: #aeaeae; font-size: 13px;">
	    				户籍类型：
	    			</td>
	    			<td align="left">
	    				<select class="selectMax_informationModify  text-input validate[required]" id="householdType" name="householdType">
		                    <option value="-1">请选择</option>
		               </select>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td align="right" style="padding: 5px 5px 5px 0; width:70px; height: 30px; color: #aeaeae; font-size: 13px;">
	    				学<span style="padding: 0 13px;"></span>历：
	    			</td>
	    			<td align="left">
	    				<select class="selectMax_informationModify  text-input validate[required]" id="education" name="education">
		                    <option value="-1">请选择</option>
		               </select>
	    			</td>
	    			<td align="right" style="padding: 5px 5px 5px 0; width:85px; height: 30px; color: #aeaeae; font-size: 13px;">
	    				政治面貌：
	    			</td>
	    			<td align="left">
	    				<select class="selectMax_informationModify  text-input validate[required]" id="policticsStatus" name="policticsStatus">
		                    <option value="-1">请选择</option>
		               </select>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td align="right" style="padding: 5px 5px 5px 0; width:70px; height: 30px; color: #aeaeae; font-size: 13px;">
	    				家庭电话：
	    			</td>
	    			<td align="left" colspan="3">
	    				<input class="inputMin_informationModify text-input validate[required,funcCall[chinaornumer],minSize[1],maxSize[16]] " type="text" id="homePhone" name="homePhone" value="${userModel.homePhone }" maxlength="15">
	    			</td>
	    		</tr>
	    		<tr>
	    			<td align="right" style="padding: 5px 5px 5px 0; width:70px; height: 30px; color: #aeaeae; font-size: 13px;">
	    				家庭地址：
	    			</td>
	    			<td align="left" colspan="3">
	    				<input class="inputMax_informationModify text-input validate[required,funcCall[chinaornumer],minSize[1],maxSize[16]] " type="text" id="homeAddress" name="homeAddress" value="${userModel.homeAddress }" maxlength="80">
	    			</td>
	    		</tr>
	    	</table>
	    </div>	
	    
	    <div class="btn_title_informationModify">
          <ul>
            <li class="tLeft">工作信息</li>
            <li class="tRight"><a href="javascript:void(0)" onclick="edit_baseinfo(this, 3)" tag="false"><img src="<c:url value='/nurse/themes/images/btn_editor.png'/>"></a></li>
          </ul>
        </div>
        <div class="informationModify_main">
        	<table cellpadding="0" border="0" cellspacing="0" style="font-size: 13px; width: 100%;">
	    		<tr>
	    			<td align="right" style="padding: 5px 5px 5px 0; width:70px; height: 30px; color: #aeaeae; font-size: 13px;">
	    				工作年限：
	    			</td>
	    			<td align="left">
	    				<select class="selectMax_informationModify  text-input validate[required]" id="workingAge" name="workingAge">
		                    <option value="-1">请选择</option>
		               </select>
	    			</td>
	    			<td align="right" style="padding: 5px 5px 5px 0; width:85px; height: 30px; color: #aeaeae; font-size: 13px;">
	    				薪<span style="padding: 0 13px;"></span>酬：
	    			</td>
	    			<td align="left">
	    				<select class="selectMax_informationModify  text-input validate[required]" id="salary" name="salary">
		                    <option value="-1">请选择</option>
		               </select>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td align="right" style="padding: 5px 5px 5px 0; width:70px; height: 30px; color: #aeaeae; font-size: 13px;">
	    				公司名称：
	    			</td>
	    			<td align="left" colspan="3">
	    				<input class="inputMax_informationModify text-input validate[required,funcCall[chinaornumer],minSize[1],maxSize[16]] " type="text" id="companyName" name="companyName" value="${userModel.companyName }" maxlength="16">
	    			</td>
	    		</tr>
	    		<tr>
	    			<td align="right" style="padding: 5px 5px 5px 0; width:70px; height: 30px; color: #aeaeae; font-size: 13px;">
	    				公司地址：
	    			</td>
	    			<td align="left" colspan="3">
	    				<input class="inputMax_informationModify text-input validate[required,funcCall[chinaornumer],minSize[1],maxSize[16]] " type="text" id="companyAddress" name="companyAddress" value="${userModel.companyAddress }" maxlength="16">
	    			</td>
	    		</tr>	
	    	</table>
	    </div>	
    </div>
</div>
   
</body>
</html>