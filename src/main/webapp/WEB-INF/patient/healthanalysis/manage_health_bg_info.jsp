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
	<link rel="stylesheet" href="<c:url value='/patient/themes/health_records.css'/>" type="text/css"/>
	<style>
		.tableTd{border: solid #000; border-width: 0px 1px 1px 0px; width: 120px; font-size: 14px; line-height: 30px; height: 30px;}
		.input_informationModify{width:150px; height:25px; border:1px solid #aeaeae; padding-left:10px; font:13px/26px "微软雅黑"; color:#5a5a5a; }
		.selectMax_informationModify{width:150px; height:25px; border:1px solid #aeaeae; font:13px/26px "微软雅黑"; color:#5a5a5a; }
		.selectMax_Level{width:60px; height:25px; border:0px solid #aeaeae; font:13px/26px "微软雅黑"; color:#5a5a5a; }
	</style>
	
	<script type="text/JavaScript">
		$(function(){
			$(".selectMax_Level, textarea").attr("disabled", "disabled");
			
			$(".selectMax_Level").bind("change", function(){
				
				if($(this).val() == 3)
				{
					$(this).parent().parent().css("background", "#f78668");
				}	
				else if($(this).val() == 1)
				{
					$(this).parent().parent().css("background", "#a0f0e6");
				}	
				else 
				{
					$(this).parent().parent().css("background", "#ffffff");
				}	
			});
			
			$("#statType").bind("change", function(){
				window.location.href = "<c:url value='/p/query/goHealthBg.do?userId=${query.userId}'/>&statType="+$(this).val();
			});
			
			$("#btnsearch").bind("click", function(){
				if($("#startTime").val() == "")
				{
					alert("时间不能为空")
				}	
				else
				{
					$("#inputform").submit();
				}
			});
			funLoadHealthRepeatInfo();
		});
		
		function funAccessment(type)
		{
			if(type == 1)
			{
				$("#jkzk").html("健康");
				$("#accessment").html("90-100");
			}
			else if(type == 2)
			{
				$("#jkzk").html("良好");
				$("#accessment").html("80-90");
			}	
			else if(type == 3)
			{
				$("#jkzk").html("一般");
				$("#accessment").html("70-80");
			}
			else if(type == 4)
			{
				$("#jkzk").html("欠佳");
				$("#accessment").html("70以下");
			}
			else
			{
				$("#jkzk").html(" ");
				$("#accessment").html(" ");
			}	
		}
		
		
		
		function funLoadHealthRepeatInfo()
		{
			$.ajax({
				url : "<c:url value='/p/query/healthReport.do?userId=${query.userId}'/>",
				type : 'post',
				dataType : 'json',
				data : 
				{
					reportFlag 			: "${query.statType}",
					reportTime 			: "${query.startTime}"
				},
				error:function(data)
				{
					PageMain.funCloseProgress();
				},
				success:function(data)
				{
					if(data != null)
					{
						$("#accessment").val(data.accessment);
						funAccessment(data.accessment);
						
						var sportLevel = data.sportLevel;
						if(sportLevel != null && sportLevel != "")
						{
							var sportLevelFly = sportLevel.split(",");
							for(var nItem=0; nItem<sportLevelFly.length; nItem++)
							{
					            var tmpVal = "-";
					            if(sportLevelFly[nItem] == 1)
					            {
					            	tmpVal = "较少";
					            }	
					            else if(sportLevelFly[nItem] == 2)
					            {
					            	tmpVal = "适中";
					            }
					            else if(sportLevelFly[nItem] == 3)
					            {
					            	tmpVal = "过量";
					            }
								$("span[name='sportLevel"+(nItem + 1)+"']").html(tmpVal);
								if(sportLevelFly[nItem] == 3)
								{
									$("span[name='sportLevel"+(nItem + 1)+"']").parent().parent().css("background", "#f78668");
								}	
								else if(sportLevelFly[nItem] == 1)
								{
									$("span[name='sportLevel"+(nItem + 1)+"']").parent().parent().css("background", "#a0f0e6");
								}	
								else 
								{
									$("span[name='sportLevel"+(nItem + 1)+"']").parent().parent().css("background", "#ffffff");
								}	
							}
						}	
							
						
						var dietLevel = data.dietLevel;
						if(dietLevel != null && dietLevel != "")
						{
							var dietLevelFly = dietLevel.split(",");
							for(var nItem=0; nItem<dietLevelFly.length; nItem++)
							{
								var tmp = "span[name='dietLevel"+(nItem + 1)+"']";
								if(nItem == dietLevelFly.length-1)
								{
									tmp = "span[name='dietLevel0']";
								}	
								 var tmpVal = "-";
					            if(dietLevelFly[nItem] == 1)
					            {
					            	tmpVal = "较少";
					            }	
					            else if(dietLevelFly[nItem] == 2)
					            {
					            	tmpVal = "适中";
					            }
					            else if(dietLevelFly[nItem] == 3)
					            {
					            	tmpVal = "过量";
					            }
						            
								$(tmp).html(tmpVal);
								if(dietLevelFly[nItem] == 3)
								{
									$(tmp).parent().parent().css("background", "#f78668");
								}	
								else if(dietLevelFly[nItem] == 1)
								{
									$(tmp).parent().parent().css("background", "#a0f0e6");
								}	
								else 
								{
									$(tmp).parent().parent().css("background", "#ffffff");
								}	
							}
						}	
							
						
						$("#sportAdvice").val(data.sportAdvice);
						$("#dietAdvice").val(data.dietAdvice);
						$("#mentalAdvice").val(data.mentalAdvice);
						$("#bloodPressureAdvice").val(data.bloodPressureAdvice);
						$("#bloodGlucoseAdvice").val(data.bloodGlucoseAdvice);
						$("#heartRateAdvice").val(data.heartRateAdvice);
						$("#temperatureAdvice").val(data.temperatureAdvice);
						$("#medicationAdvice").val(data.medicationAdvice);
					}	
				}
			});
		}
	</script>
  </head>
<body>
<div class="account" style="background: #ffffff;">
	<div class="account_title" style="background: #ffffff;">
      <ul>
        <li class="account_titleGreen">健康报告</li>
        <li class="account_titleGray">
        	当前位置：日报告
        </li>
      </ul>
    </div>
</div> 
  <div class="information_modify">
	    <div class="information_modify_main">
	    	<div class="search">
		    	<form id="inputform" name="inputform" action="<c:url value='/p/query/healthBg.do'/>" method="post">
				    <table width="100%" border="0" cellspacing="0" cellpadding="0" style="display: block; font-size: 15px;">
				    	<tr>
				    		<td style="padding: 5px 0px 5px 0px; height: 30px; color: #aeaeae; font-size: 13px;" align="left">
				    			报告类型：
				    			<select class="selectMax_informationModify" id="statType" name="statType">
					               <option value="1" selected="selected">日报</option>
					               <option value="2">周报</option>
					               <option value="3">月报</option>
				               </select>
				    		</td>
				    		<td>
				    		</td>
				    	</tr>
				    	<tr>
				    		<td style="padding: 5px 0px 5px 0px; height: 30px; color: #aeaeae; font-size: 13px;" align="left">
				    			报告时间：
				    			<input class="input_informationModify Wdate"  onclick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})" type="text" id="startTime" name="startTime" value="${query.startTime }">
				    		</td>
				    		<td>
					    		<ul>
					    			<input type="hidden" name="userId" id="userId" value="${query.userId }"></input>
					    			<li class="btn_search"><a href="javascript:void(0)" id="btnsearch">查询</a></li>
					    		</ul>
				    		</td>
				    	</tr>
				    </table>
				</form>    
			</div>
	        <div class="index_table" style="border:0px solid #ccc; padding-top: 20px; padding-bottom: 20px;">
	        	<div style="width: 99%; font-size: 24px; text-align: center; font-weight: bold; height: 60px; line-height: 60px;">日健康报告</div>
	        	<table width="99%" border="0" cellspacing="0" cellpadding="0" style="display: block; font-size: 15px;">
	        		<tr>
	        			<td style="width: 120px; font-size: 14px; line-height: 35px; height: 35px;">综合评估：</td>
	        			<td align="left" id="accessment">
	        				
	        			</td>
	        		</tr>
	        		<tr>
	        			<td style="width: 120px; font-size: 14px; line-height: 30px; height: 30px;">健康状况：</td>
	        			<td style="width: 120px; font-size: 14px; line-height: 30px; height: 30px;" align="left" id="jkzk"></td>
	        		</tr>
	        		<tr>
	        			<td style="width: 120px; font-size: 14px; line-height: 30px; height: 30px;">日<span style="padding:0 16px;"></span>期：</td>
	        			<td style="width: 120px; font-size: 14px; line-height: 30px; height: 30px;" align="left">${query.startTime }</td>
	        		</tr>
	        	</table>
	        	
	        	<div style="width: 99%; font-size: 18px; padding: 40px 0px 15px 0px; text-align: left;">一.基本信息</div>
	        	<table width="99%" border="0" cellspacing="0" cellpadding="0" style="display: block; font-size: 15px;">
	        		<tr>
	        			<td style="width: 120px; font-size: 14px; line-height: 30px; height: 30px;">姓名：${healthUser.name }</td>
	        			<td style="width: 120px; font-size: 14px; line-height: 30px; height: 30px;">性别：${healthUser.genderStr}</td>
	        			<td style="width: 120px; font-size: 14px; line-height: 30px; height: 30px;">年龄：${healthUser.birthdate}</td>
	        			<td style="width: 120px; font-size: 14px; line-height: 30px; height: 30px;">身高：${healthUser.height}</td>
	        			<td style="width: 120px; font-size: 14px; line-height: 30px; height: 30px;">体重：${healthUser.weight}</td>
	        			<td style="width: 120px; font-size: 14px; line-height: 30px; height: 30px;">BMI：${healthUser.bmi}</td>
	        		</tr>
	        	</table>
	        	
	        	<div style="width: 99%; font-size: 18px; padding: 40px 0px 15px 0px; text-align: left;">二.数据记录</div>
	        	<div style="width: 99%; font-size: 14px; height: 60px; line-height: 60px; text-align: left;">1.运动（过量标红，少量标绿）</div>
	        	<table width="99%" border="0" cellspacing="0" cellpadding="0" style="display: block; font-size: 15px; border: solid #000; border-width: 1px 0px 0px 1px;">
	        		<tr>
	        			<td class="tableTd" align="center" style="width: 60px;">序号</td>
	        			<td class="tableTd" align="center">运动类型</td>
	        			<td class="tableTd" align="center">时间</td>
	        			<td class="tableTd" align="center">时长(分)</td>
	        			<td class="tableTd" align="center">卡路里消耗(卡)</td>
	        			<td class="tableTd" align="center">是否适量</td>
	        		</tr>
	        		<c:if test="${not empty sportFlys }">
	        			<c:forEach items="${sportFlys }" var="sportItem" varStatus="index">
		        		<tr>
		        			<td class="tableTd" align="center" style="width: 60px;">${index.count }</td>
		        			<td class="tableTd" align="center">&nbsp;${sportItem.a }</td>
		        			<td class="tableTd" align="center" style="width: 180px;">&nbsp;${sportItem.b }</td>
		        			<td class="tableTd" align="center">&nbsp;${sportItem.c }</td>
		        			<td class="tableTd" align="center">&nbsp;${sportItem.d }</td>
		        			<td class="tableTd" align="center">
			        			<span name="sportLevel${index.count }">
				                 
				               </span>
			               </td>
		        		</tr>
	        			</c:forEach>
	        		</c:if>
	        		<c:if test="${empty sportFlys }">
		        		<tr>
		        			<td class="tableTd" align="center">1</td>
		        			<td class="tableTd" align="center">&nbsp;</td>
		        			<td class="tableTd" align="center">&nbsp;</td>
		        			<td class="tableTd" align="center">&nbsp;</td>
		        			<td class="tableTd" align="center">&nbsp;</td>
		        			<td class="tableTd" align="center">&nbsp;</td>
		        		</tr>
	        		</c:if>
	        	</table>
	        	<div style="width: 99%; font-size: 14px; height: 60px; line-height: 60px; text-align: left;">综合分析：</div>
	        	<textarea style="width: 99%; height: 150px; border: 1px solid #ccc;" id="sportAdvice" name="sportAdvice"></textarea>
	        	
	        	<div style="width: 99%; font-size: 14px; height: 60px; line-height: 60px; text-align: left;">2.饮食（过量标红，少量标）</div>
	        	<table width="99%" border="0" cellspacing="0" cellpadding="0" style="display: block; font-size: 15px; border: solid #000; border-width: 1px 0px 0px 1px;">
	        		<tr>
	        			<td class="tableTd" align="center">餐别</td>
	        			<td class="tableTd" align="center">时间</td>
	        			<td class="tableTd" align="center">谷薯类(g)</td>
	        			<td class="tableTd" align="center">动物型肉食(g)</td>
	        			<td class="tableTd" align="center">豆类及其制品(g)</td>
	        			<td class="tableTd" align="center">蔬菜水果类(g)</td>
	        			<td class="tableTd" align="center">油脂类(g)</td>
	        			<td class="tableTd" align="center">其它(g)</td>
	        			<td class="tableTd" align="center">摄入热量(卡)</td>
	        			<td class="tableTd" align="center">是否适量</td>
	        		</tr>
	        		<c:if test="${not empty foodFlys }">
	        			<c:forEach items="${foodFlys }" var="foodItem" varStatus="index">
		        		<tr>
		        			<td class="tableTd" align="center">
		        				<c:choose>
		        					<c:when test="${foodItem.a == 1 }">早餐</c:when>
		        					<c:when test="${foodItem.a == 2 }">中餐</c:when>
		        					<c:when test="${foodItem.a == 3 }">晚餐</c:when>
		        					<c:when test="${foodItem.a == 4 }">早加餐</c:when>
		        					<c:when test="${foodItem.a == 5 }">中加餐</c:when>
		        					<c:when test="${foodItem.a == 6 }">晚加餐</c:when>
		        				</c:choose>
		        			</td>
		        			<td class="tableTd" align="center">&nbsp;${foodItem.b}</td>
		        			<td class="tableTd" align="center">&nbsp;${foodItem.d}</td>
		        			<td class="tableTd" align="center">&nbsp;${foodItem.e}</td>
		        			<td class="tableTd" align="center">&nbsp;${foodItem.f}</td>
		        			<td class="tableTd" align="center">&nbsp;${foodItem.g}</td>
		        			<td class="tableTd" align="center">&nbsp;${foodItem.h}</td>
		        			<td class="tableTd" align="center">&nbsp;${foodItem.i}</td>
		        			<td class="tableTd" align="center">&nbsp;${foodItem.c}</td>
		        			<td class="tableTd" align="center">
		        				<span class="selectMax_Level" name="dietLevel${index.count }">
				                  
				               </span>
		        			</td>
		        		</tr>
	        			</c:forEach>
	        		</c:if>
	        		<c:if test="${empty foodFlys }">
	        		<tr>
	        			<td class="tableTd" align="center">早餐</td>
	        			<td class="tableTd" align="center">&nbsp;</td>
	        			<td class="tableTd" align="center">&nbsp;</td>
	        			<td class="tableTd" align="center">&nbsp;</td>
	        			<td class="tableTd" align="center">&nbsp;</td>
	        			<td class="tableTd" align="center">&nbsp;</td>
	        			<td class="tableTd" align="center">&nbsp;</td>
	        			<td class="tableTd" align="center">&nbsp;</td>
	        			<td class="tableTd" align="center">&nbsp;</td>
	        			<td class="tableTd" align="center">&nbsp;</td>
	        			
	        		</tr>
	        		<tr>
	        			<td class="tableTd" align="center">中餐</td>
	        			<td class="tableTd" align="center">&nbsp;</td>
	        			<td class="tableTd" align="center">&nbsp;</td>
	        			<td class="tableTd" align="center">&nbsp;</td>
	        			<td class="tableTd" align="center">&nbsp;</td>
	        			<td class="tableTd" align="center">&nbsp;</td>
	        			<td class="tableTd" align="center">&nbsp;</td>
	        			<td class="tableTd" align="center">&nbsp;</td>
	        			<td class="tableTd" align="center">&nbsp;</td>
	        			<td class="tableTd" align="center">&nbsp;</td>
	        		</tr>
	        		<tr>
	        			<td class="tableTd" align="center">晚餐</td>
	        			<td class="tableTd" align="center">&nbsp;</td>
	        			<td class="tableTd" align="center">&nbsp;</td>
	        			<td class="tableTd" align="center">&nbsp;</td>
	        			<td class="tableTd" align="center">&nbsp;</td>
	        			<td class="tableTd" align="center">&nbsp;</td>
	        			<td class="tableTd" align="center">&nbsp;</td>
	        			<td class="tableTd" align="center">&nbsp;</td>
	        			<td class="tableTd" align="center">&nbsp;</td>
	        			<td class="tableTd" align="center">&nbsp;</td>
	        		</tr>
	        		</c:if>
	        		<tr>
	        			<td class="tableTd" align="center">合计</td>
	        			<td class="tableTd" align="center">&nbsp;${foodModel.b }</td>
	        			<td class="tableTd" align="center">&nbsp;${foodModel.d }</td>
	        			<td class="tableTd" align="center">&nbsp;${foodModel.e }</td>
	        			<td class="tableTd" align="center">&nbsp;${foodModel.f }</td>
	        			<td class="tableTd" align="center">&nbsp;${foodModel.g }</td>
	        			<td class="tableTd" align="center">&nbsp;${foodModel.h }</td>
	        			<td class="tableTd" align="center">&nbsp;${foodModel.i }</td>
	        			<td class="tableTd" align="center">&nbsp;${foodModel.c }</td>
	        			<td class="tableTd" align="center">
	        				<span class="selectMax_Level" name="dietLevel0">
			               </span>
				        </td>
	        		</tr>
	        	</table>
	        	<div style="width: 99%; font-size: 14px; height: 60px; line-height: 60px; text-align: left;">综合分析：</div>
	        	<textarea style="width: 99%; height: 150px; border: 1px solid #ccc;" name="dietAdvice" id="dietAdvice"></textarea>
	        	
	        	
	        	<div style="width: 99%; font-size: 14px; height: 60px; line-height: 60px; text-align: left;">3.心理评估</div>
	        	<table border="0" cellspacing="0" cellpadding="0" style=" font-size: 15px; border: solid #000; border-width: 1px 0px 0px 1px;">
	        		<tr>
	        			<td class="tableTd" align="center">序号</td>
	        			<td class="tableTd" align="center" style="width: 180px;">测量时间</td>
	        			<td class="tableTd" align="center">心理状态</td>
	        		</tr>
	        		<c:if test="${not empty mentalFlys }">
	        			<c:forEach items="${mentalFlys }" var="mentalItem" varStatus="index">
		        		<tr>
		        			<td class="tableTd" align="center">${index.count }</td>
		        			<td class="tableTd" align="center">&nbsp;${mentalItem.b }</td>
		        			<td class="tableTd" align="center">&nbsp;
		        				<c:choose>
		        					<c:when test="${mentalItem.a == 1}">开心</c:when>
		        					<c:when test="${mentalItem.a == 2}">平静</c:when>
		        					<c:when test="${mentalItem.a == 3}">沮丧</c:when>
		        					<c:when test="${mentalItem.a == 4}">烦躁</c:when>
		        				</c:choose>
		        			</td>
		        		</tr>
	        			</c:forEach>
	        		</c:if>
	        		<c:if test="${empty mentalFlys }">
		        		<tr>
		        			<td class="tableTd" align="center">1</td>
		        			<td class="tableTd" align="center">&nbsp;</td>
		        			<td class="tableTd" align="center">&nbsp;</td>
		        		</tr>
	        		</c:if>
	        	</table>
	        	<div style="width: 99%; font-size: 14px; height: 60px; line-height: 60px; text-align: left;">综合分析：</div>
	        	<textarea style="width: 99%; height: 150px; border: 1px solid #ccc;" id="mentalAdvice" name="mentalAdvice"></textarea>	
	        	
	        	
	        	<div style="width: 99%; font-size: 14px; height: 60px; line-height: 60px; text-align: left;">4.血压（高于正常值标红，低于正常值标绿）</div>
	        	<table border="0" cellspacing="0" cellpadding="0" style="font-size: 15px; border: solid #000; border-width: 1px 0px 0px 1px;">
	        		<tr>
	        			<td class="tableTd" align="center">序号</td>
	        			<td class="tableTd" align="center" style="width: 180px;">测量时间</td>
	        			<td class="tableTd" align="center">收缩压(mm/Hg)</td>
	        			<td class="tableTd" align="center">舒张压(mm/Hg)</td>
	        		</tr>
	        		<c:if test="${not empty pressureFlys }">
	        			<c:forEach items="${pressureFlys }" var="pressureItem" varStatus="index">
		        		<tr>
		        			<td class="tableTd" align="center">${index.count }</td>
		        			<td class="tableTd" align="center" style="width: 180px;">&nbsp;${pressureItem.a }</td>
		        			<td class="tableTd" align="center">&nbsp;${pressureItem.c }</td>
		        			<td class="tableTd" align="center">&nbsp;${pressureItem.b }</td>
		        		</tr>
	        			</c:forEach>
	        		</c:if>
	        		<c:if test="${empty pressureFlys }">
		        		<tr>
		        			<td class="tableTd" align="center">1</td>
		        			<td class="tableTd" align="center">&nbsp;</td>
		        			<td class="tableTd" align="center">&nbsp;</td>
		        			<td class="tableTd" align="center">&nbsp;</td>
		        		</tr>
	        		</c:if>
	        	</table>
	        	<div style="width: 99%; font-size: 14px; height: 60px; line-height: 60px; text-align: left;">综合分析：</div>
	        	<textarea style="width: 99%; height: 150px; border: 1px solid #ccc;" id="bloodPressureAdvice" name="bloodPressureAdvice"></textarea>	
	        	
	        	
	        	
	        	
	        	<div style="width: 99%; font-size: 14px; height: 60px; line-height: 60px; text-align: left;">5.心率（高于正常值标红，低于正常值标绿）</div>
	        	<table border="0" cellspacing="0" cellpadding="0" style="font-size: 15px; border: solid #000; border-width: 1px 0px 0px 1px;">
	        		<tr>
	        			<td class="tableTd" align="center">序号</td>
	        			<td class="tableTd" align="center">测量时间</td>
	        			<td class="tableTd" align="center">心率(bmp)</td>
	        		</tr>
	        		<c:if test="${not empty pulseFlys }">
	        			<c:forEach items="${pulseFlys }" var="pulseItem" varStatus="index">
		        		<tr>
		        			<td class="tableTd" align="center">${index.count }</td>
		        			<td class="tableTd" align="center" style="width: 180px;">&nbsp;${pulseItem.a }</td>
		        			<td class="tableTd" align="center">&nbsp;${pulseItem.b }</td>
		        		</tr>
	        			</c:forEach>
	        		</c:if>
	        		<c:if test="${empty pulseFlys }">
		        		<tr>
		        			<td class="tableTd" align="center">1</td>
		        			<td class="tableTd" align="center">&nbsp;</td>
		        			<td class="tableTd" align="center">&nbsp;</td>
		        		</tr>
	        		</c:if>
	        	</table>
	        	<div style="width: 99%; font-size: 14px; height: 60px; line-height: 60px; text-align: left;">综合分析：</div>
	        	<textarea style="width: 99%; height: 150px; border: 1px solid #ccc;" id="heartRateAdvice" name="heartRateAdvice"></textarea>	
	        		
	        		
	        	
	        	<div style="width: 99%; font-size: 14px; height: 60px; line-height: 60px; text-align: left;">6.血糖（高于正常值标红，低于正常值标绿）</div>
	        	<table border="0" cellspacing="0" cellpadding="0" style="font-size: 15px; border: solid #000; border-width: 1px 0px 0px 1px;">
	        		<tr>
	        			<td class="tableTd" align="center">序号</td>
	        			<td class="tableTd" align="center">测量时间</td>
	        			<td class="tableTd" align="center">血糖含量(mmol/L)</td>
	        		</tr>
	        		<c:if test="${not empty glucoseFlys }">
	        			<c:forEach items="${glucoseFlys }" var="glucoseItem" varStatus="index">
		        		<tr>
		        			<td class="tableTd" align="center">${index.count }</td>
		        			<td class="tableTd" align="center" style="width: 180px;">&nbsp;${glucoseItem.a }</td>
		        			<td class="tableTd" align="center">&nbsp;${glucoseItem.b }</td>
		        		</tr>
	        			</c:forEach>
	        		</c:if>
	        		<c:if test="${empty glucoseFlys }">
		        		<tr>
		        			<td class="tableTd" align="center">1</td>
		        			<td class="tableTd" align="center">&nbsp;</td>
		        			<td class="tableTd" align="center">&nbsp;</td>
		        		</tr>
	        		</c:if>
	        	</table>
	        	<div style="width: 99%; font-size: 14px; height: 60px; line-height: 60px; text-align: left;">综合分析：</div>
	        	<textarea style="width: 99%; height: 150px; border: 1px solid #ccc;" id="bloodGlucoseAdvice" name="bloodGlucoseAdvice"></textarea>	
	        	
	        	
	        	
	        	
	        	<div style="width: 99%; font-size: 14px; height: 60px; line-height: 60px; text-align: left;">7.体温（异常数据标红色）</div>
	        	<table border="0" cellspacing="0" cellpadding="0" style="font-size: 15px; border: solid #000; border-width: 1px 0px 0px 1px;">
	        		<tr>
	        			<td class="tableTd" align="center">序号</td>
	        			<td class="tableTd" align="center">测量时间</td>
	        			<td class="tableTd" align="center">体温（℃）</td>
	        		</tr>
	        		<c:if test="${not empty thermometerFlys }">
	        			<c:forEach items="${thermometerFlys }" var="thermometerItem" varStatus="index">
		        		<tr>
		        			<td class="tableTd" align="center">${index.count }</td>
		        			<td class="tableTd" align="center" style="width: 180px;">&nbsp;${thermometerItem.a }</td>
		        			<td class="tableTd" align="center">&nbsp;${thermometerItem.b }</td>
		        		</tr>
	        			</c:forEach>
	        		</c:if>
	        		<c:if test="${empty thermometerFlys }">
		        		<tr>
		        			<td class="tableTd" align="center">1</td>
		        			<td class="tableTd" align="center">&nbsp;</td>
		        			<td class="tableTd" align="center">&nbsp;</td>
		        		</tr>
	        		</c:if>
	        	</table>
	        	<div style="width: 99%; font-size: 14px; height: 60px; line-height: 60px; text-align: left;">综合分析：</div>
	        	<textarea style="width: 99%; height: 150px; border: 1px solid #ccc;" id="temperatureAdvice" name="temperatureAdvice"></textarea>			
	        	
	        	
	        	
	        	<div style="width: 99%; font-size: 14px; height: 60px; line-height: 60px; text-align: left;">8.用药记录</div>
	        	<table border="0" cellspacing="0" cellpadding="0" style="font-size: 15px; border: solid #000; border-width: 1px 0px 0px 1px;">
	        		<tr>
	        			<td class="tableTd" align="center">药品名称</td>
	        			<td class="tableTd" align="center">用药时间</td>
	        			<td class="tableTd" align="center">用药剂量</td>
	        		</tr>
	        		<tr>
	        			<td class="tableTd" align="center">1</td>
	        			<td class="tableTd" align="center">&nbsp;</td>
	        			<td class="tableTd" align="center">&nbsp;</td>
	        		</tr>
	        	</table>
	        	<div style="width: 99%; font-size: 14px; height: 60px; line-height: 60px; text-align: left;">综合分析：</div>
	        	<textarea style="width: 99%; height: 150px; border: 1px solid #ccc;" id="medicationAdvice" name="medicationAdvice"></textarea>
	        </div>
        </div>
    </div>
</body>
</html>