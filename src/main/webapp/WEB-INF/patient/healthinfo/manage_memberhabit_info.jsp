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
		$(function(){
			$('.text-input').attr("disabled", "disabled");
		});
		
		function edit_baseinfo(obj)
		{
			if($(obj).attr("tag") == "false")
			{
				$(obj).parent().parent().parent().next().find(".text-input").attr("disabled", false);
				$(obj).children().attr("src", "<c:url value='/patient/themes/images/btn_preserve.png'/>");
				$(obj).attr("tag", "true");
			}
			else
			{
				PageMain.funOpenProgress();
				$.ajax({
					url : _ctx_ + "/p/query/modifyHabbit.do?a="+ Math.random(),
					type : 'post',
					dataType : 'json',
					data : 
					{
						"workType" 			: $("#workType").val(),
						"workPressure" 		: $("#workPressure").val(),
						"bloodType" 		: $("#bloodType").val(),
						"weight" 			: $("#weight").val(),
						"waist" 			: $("#waist").val(),
						"smokeType" 		: $("#smokeType").val(),
						"smokeFrequency" 	: $("#smokeFrequency").val(),
						"drinkFrequency" 	: $("#drinkFrequency").val(),
						"drinkType" 		: $("#drinkType").val(),
						"exerciseFrequency" : $("#exerciseFrequency").val(),
						"exerciseDuration" 	: $("#exerciseDuration").val(),
						"sleepDuration" 	: $("#sleepDuration").val()
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
							$(obj).parent().parent().parent().next().find(".text-input").attr("disabled", "disabled");
							$(obj).children().attr("src", "<c:url value='/patient/themes/images/btn_editor.png'/>");
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
<body style="background: #ededed;">
  <div class="btn_title_informationModify">
          <ul>
            <li class="tLeft">基本信息</li>
            <li class="tRight"><a href="javascript:void(0)" onclick="edit_baseinfo(this)" tag="false"><img src="<c:url value='/patient/themes/images/btn_editor.png'/>"></a></li>
          </ul>
        </div>
        <div class="informationModify_main">
        	<table cellpadding="0" border="0" cellspacing="0" style="font-size: 13px; width: 100%;">
	    		<tr>
	    			<td align="right" style="padding: 5px 5px 5px 0; width:70px; height: 30px; color: #aeaeae; font-size: 13px;">
	    				工作类型：
	    			</td>
	    			<td align="left">
	    				<select class="selectMax_informationModify  text-input validate[required]" id="workType" name="workType">
	    					<option value="-1"></option>
	    					<option value="1" <c:if test="${habbit.workType == 1}">selected="selected"</c:if>>脑力</option>
	    					<option value="2" <c:if test="${habbit.workType == 2}">selected="selected"</c:if>>体力</option>
	    					<option value="3" <c:if test="${habbit.workType == 3}">selected="selected"</c:if>>脑力 + 体力</option>
		               	</select>
	    			</td>
	    			<td align="right" style="padding: 5px 5px 5px 0; width:85px; height: 30px; color: #aeaeae; font-size: 13px;">
	    				工作压力：
	    			</td>
	    			<td align="left">
	    				<select class="selectMax_informationModify  text-input validate[required]" id="workPressure" name="workPressure">
	    					<option value="-1"></option>
	    					<option value="1" <c:if test="${habbit.workPressure == 1}">selected="selected"</c:if>>高</option>
	    					<option value="2" <c:if test="${habbit.workPressure == 2}">selected="selected"</c:if>>中</option>
	    					<option value="3" <c:if test="${habbit.workPressure == 3}">selected="selected"</c:if>>低</option>
		               	</select>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td align="right" style="padding: 5px 5px 5px 0; width:70px; height: 30px; color: #aeaeae; font-size: 13px;">
	    				血<span style="padding: 0 13px;"></span>型：
	    			</td>
	    			<td align="left">
	    				<select class="selectMax_informationModify  text-input validate[required]" id="bloodType" name="bloodType">
	    					<option value="-1"></option>
	    					<option value="1" <c:if test="${habbit.bloodType == 1}">selected="selected"</c:if>>A</option>
	    					<option value="2" <c:if test="${habbit.bloodType == 2}">selected="selected"</c:if>>B</option>
	    					<option value="3" <c:if test="${habbit.bloodType == 3}">selected="selected"</c:if>>AB</option>
	    					<option value="4" <c:if test="${habbit.bloodType == 4}">selected="selected"</c:if>>O</option>
		               	</select>
	    			</td>
	    			<td align="right" style="padding: 5px 5px 5px 0; width:85px; height: 30px; color: #aeaeae; font-size: 13px;">
	    				体<span style="padding: 0 13px;"></span>重：
	    			</td>
	    			<td align="left">
	    				<select class="selectMax_informationModify  text-input validate[required]" id="weight" name="weight">
	    					<option value="-1"></option>
	    					<option value="1" <c:if test="${habbit.weight == 1}">selected="selected"</c:if>>超重</option>
	    					<option value="2" <c:if test="${habbit.weight == 2}">selected="selected"</c:if>>不超重</option>
		               	</select>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td align="right" style="padding: 5px 5px 5px 0; width:70px; height: 30px; color: #aeaeae; font-size: 13px;">
	    				腰<span style="padding: 0 13px;"></span>围：
	    			</td>
	    			<td align="left">
	    				<select class="selectMax_informationModify  text-input validate[required]" id="waist" name="waist">
	    					<option value="-1"></option>
	    					<option value="1" <c:if test="${habbit.waist == 1}">selected="selected"</c:if>>正常</option>
	    					<option value="2" <c:if test="${habbit.waist == 2}">selected="selected"</c:if>>不正常</option>
		               	</select>
	    			</td>
	    			<td align="right" style="padding: 5px 5px 5px 0; width:85px; height: 30px; color: #aeaeae; font-size: 13px;">
	    				睡眠时长：
	    			</td>
	    			<td align="left">
	    				<select class="selectMax_informationModify  text-input validate[required]" id="sleepDuration" name="sleepDuration">
	    					<option value="-1"></option>
	    					<option value="1" <c:if test="${habbit.sleepDuration == 1}">selected="selected"</c:if>>1-2小时</option>
	    					<option value="2" <c:if test="${habbit.sleepDuration == 2}">selected="selected"</c:if>>2-3小时</option>
	    					<option value="3" <c:if test="${habbit.sleepDuration == 3}">selected="selected"</c:if>>3-4小时 </option>
	    					<option value="4" <c:if test="${habbit.sleepDuration == 4}">selected="selected"</c:if>>4-5小时 </option>
	    					<option value="5" <c:if test="${habbit.sleepDuration == 5}">selected="selected"</c:if>>5-6小时</option>
	    					<option value="6" <c:if test="${habbit.sleepDuration == 6}">selected="selected"</c:if>>6-7小时</option>
	    					<option value="7" <c:if test="${habbit.sleepDuration == 7}">selected="selected"</c:if>>7-8小时</option>
	    					<option value="7" <c:if test="${habbit.sleepDuration == 7}">selected="selected"</c:if>>8小时以上</option>
		               	</select>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td align="right" style="padding: 5px 5px 5px 0; width:70px; height: 30px; color: #aeaeae; font-size: 13px;">
	    				吸烟年限：
	    			</td>
	    			<td align="left">
	    				<select class="selectMax_informationModify  text-input validate[required]" id="smokeType" name="smokeType">
	    					<option value="-1"></option>
	    					<option value="1" <c:if test="${habbit.waist == 1}">selected="selected"</c:if>>不吸烟</option>
	    					<option value="2" <c:if test="${habbit.waist == 2}">selected="selected"</c:if>>1-3年</option>
	    					<option value="3" <c:if test="${habbit.waist == 3}">selected="selected"</c:if>>3-5年</option>
	    					<option value="4" <c:if test="${habbit.waist == 4}">selected="selected"</c:if>>5-10年</option>
	    					<option value="5" <c:if test="${habbit.waist == 5}">selected="selected"</c:if>>10年以上</option>
		               	</select>
	    			</td>
	    			<td align="right" style="padding: 5px 5px 5px 0; width:85px; height: 30px; color: #aeaeae; font-size: 13px;">
	    				吸烟频次：
	    			</td>
	    			<td align="left">
	    				<select class="selectMax_informationModify  text-input validate[required]" id="smokeFrequency" name="smokeFrequency">
	    					<option value="-1"></option>
	    					<option value="1" <c:if test="${habbit.smokeFrequency == 1}">selected="selected"</c:if>>1-5根/天</option>
	    					<option value="2" <c:if test="${habbit.smokeFrequency == 2}">selected="selected"</c:if>>5-10根/天</option>
	    					<option value="3" <c:if test="${habbit.smokeFrequency == 3}">selected="selected"</c:if>>10-20根/天</option>
	    					<option value="4" <c:if test="${habbit.smokeFrequency == 4}">selected="selected"</c:if>>20根以上/天</option>
		               	</select>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td align="right" style="padding: 5px 5px 5px 0; width:70px; height: 30px; color: #aeaeae; font-size: 13px;">
	    				饮酒类型：
	    			</td>
	    			<td align="left">
	    				<select class="selectMax_informationModify  text-input validate[required]" id="drinkType" name="drinkType">
	    					<option value="-1"></option>
	    					<option value="1" <c:if test="${habbit.drinkType == 1}">selected="selected"</c:if>>白酒</option>
	    					<option value="2" <c:if test="${habbit.drinkType == 2}">selected="selected"</c:if>>红酒</option>
	    					<option value="3" <c:if test="${habbit.drinkType == 3}">selected="selected"</c:if>>黄酒</option>
	    					<option value="4" <c:if test="${habbit.drinkType == 4}">selected="selected"</c:if>>啤酒</option>
		               	</select>
	    			</td>
	    			<td align="right" style="padding: 5px 5px 5px 0; width:85px; height: 30px; color: #aeaeae; font-size: 13px;">
	    				饮酒频次：
	    			</td>
	    			<td align="left">
	    				<select class="selectMax_informationModify  text-input validate[required]" id="drinkFrequency" name="drinkFrequency">
	    					<option value="-1"></option>
	    					<option value="1" <c:if test="${habbit.drinkFrequency == 1}">selected="selected"</c:if>>不饮酒</option>
	    					<option value="2" <c:if test="${habbit.drinkFrequency == 2}">selected="selected"</c:if>>1-50ml/天</option>
	    					<option value="3" <c:if test="${habbit.drinkFrequency == 3}">selected="selected"</c:if>>50-100ml/天 </option>
	    					<option value="4" <c:if test="${habbit.drinkFrequency == 4}">selected="selected"</c:if>>100-300ml/天 </option>
	    					<option value="5" <c:if test="${habbit.drinkFrequency == 5}">selected="selected"</c:if>>300ml以上/天</option>
		               	</select>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td align="right" style="padding: 5px 5px 5px 0; width:70px; height: 30px; color: #aeaeae; font-size: 13px;">
	    				运动时长：
	    			</td>
	    			<td align="left">
	    				<select class="selectMax_informationModify  text-input validate[required]" id="exerciseDuration" name="exerciseDuration">
	    					<option value="-1"></option>
	    					<option value="1" <c:if test="${habbit.exerciseDuration == 1}">selected="selected"</c:if>>15分钟以下</option>
	    					<option value="2" <c:if test="${habbit.exerciseDuration == 2}">selected="selected"</c:if>>15-30分钟</option>
	    					<option value="3" <c:if test="${habbit.exerciseDuration == 3}">selected="selected"</c:if>>30-45分钟</option>
	    					<option value="4" <c:if test="${habbit.exerciseDuration == 4}">selected="selected"</c:if>>45-60分钟</option>
	    					<option value="5" <c:if test="${habbit.exerciseDuration == 5}">selected="selected"</c:if>>60-90分钟</option>
	    					<option value="6" <c:if test="${habbit.exerciseDuration == 6}">selected="selected"</c:if>>90分钟以上</option>
		               	</select>
	    			</td>
	    			<td align="right" style="padding: 5px 5px 5px 0; width:85px; height: 30px; color: #aeaeae; font-size: 13px;">
	    				运动频次：
	    			</td>
	    			<td align="left">
	    				<select class="selectMax_informationModify  text-input validate[required]" id="exerciseFrequency" name="exerciseFrequency">
	    					<option value="-1"></option>
	    					<option value="1" <c:if test="${habbit.exerciseFrequency == 1}">selected="selected"</c:if>>不运动</option>
	    					<option value="2" <c:if test="${habbit.exerciseFrequency == 2}">selected="selected"</c:if>>1天/周</option>
	    					<option value="3" <c:if test="${habbit.exerciseFrequency == 3}">selected="selected"</c:if>>2天/周</option>
	    					<option value="4" <c:if test="${habbit.exerciseFrequency == 4}">selected="selected"</c:if>>3天/周</option>
	    					<option value="5" <c:if test="${habbit.exerciseFrequency == 5}">selected="selected"</c:if>>4天/周</option>
	    					<option value="6" <c:if test="${habbit.exerciseFrequency == 6}">selected="selected"</c:if>>5天/周</option>
	    					<option value="7" <c:if test="${habbit.exerciseFrequency == 7}">selected="selected"</c:if>>6天/周</option>
		               	</select>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td align="left" colspan="4">
	    			</td>
	    		</tr>
	    	</table>
	    </div>	
   
</body>
</html>
