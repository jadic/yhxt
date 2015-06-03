<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/app/taglibs-include.jsp" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
    <title>健康日报</title>
	<style>
		.tableTd{border: solid #000; border-width: 0px 1px 1px 0px; width: 100px; font-size: 14px; line-height: 30px; height: 30px;}
		.selectMax_Level{width:60px; height:25px; border:0px solid #aeaeae; font:13px/26px "微软雅黑"; color:#5a5a5a; }
	</style>
	<link rel="stylesheet" href="<c:url value='/app/jquerymobile/jquery.mobile-1.4.5.min.css'/>">
	<script src="<c:url value='/app/jquerymobile/jquery.min.js'/>"></script>
	<script src="<c:url value='/app/jquerymobile/jquery.mobile-1.4.5.min.js'/>"></script>
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
			funLoadHealthRepeatInfo();
			
			$("#list").css("height", $(window).height() - 80);
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
				url : "<c:url value='/app/healthReport.do?userId=${query.userId}'/>",
				type : 'post',
				dataType : 'json',
				data : 
				{
					reportFlag 			: "${query.statType}",
					reportTime 			: "${query.startTime}"
				},
				error:function(data)
				{
					
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
<div data-role="page" class="jqm-demos" data-quicklinks="true">
	<div data-role="header" id="head" style="border-bottom-color: #95b200; border-bottom-width:3px; background: #f6f6f6; height: 64px;">
		<div style="height: 20px; "></div>
		<h1 style="color: #929292; font-size: 16px; font-weight: normal;">日健康报告</h1>
	</div>
	<div id="list" role="main" class="listDiv"  class="ui-content jqm-content" style="overflow: auto; margin-top: 1px; background: #fff;" >
	        	<table width="99%" border="0" cellspacing="0" cellpadding="0" style="display: block; font-size: 15px;">
	        		<tr>
	        			<td style="width: 80px; font-size: 14px; line-height: 35px; height: 35px;">综合评估：</td>
	        			<td align="left" id="accessment">
	        				
	        			</td>
	        		</tr>
	        		<tr>
	        			<td style="width: 80px; font-size: 14px; line-height: 30px; height: 30px;">健康状况：</td>
	        			<td style="font-size: 14px; line-height: 30px; height: 30px;" align="left" id="jkzk"></td>
	        		</tr>
	        		<tr>
	        			<td style="width: 80px; font-size: 14px; line-height: 30px; height: 30px;">日<span style="padding:0 16px;"></span>期：</td>
	        			<td style="font-size: 14px; line-height: 30px; height: 30px;" align="left">${query.startTime }</td>
	        		</tr>
	        		<tr>
	        			<td style="width: 80px; font-size: 14px; line-height: 30px; height: 30px;">最近血糖：</td>
	        			<td style="font-size: 14px; line-height: 30px; height: 30px;" align="left">
					    	<c:if test="${not empty xtModel }">
					    	<span style="color:red; font-weight: bold;">${xtModel.a }</span> 时检测的 
					    	<span style="color:red; font-weight: bold;"><c:choose><c:when test="${xtModel.a1 == 0 }">空腹</c:when><c:otherwise>饭后</c:otherwise> </c:choose>血糖</span> 为【<span style="color:red; font-weight: bold;">${xyModel.b }(mmol/L)</span>】
	        				</c:if>
	        				
					    	<c:if test="${empty xtModel }">
	        					-
	        				</c:if>
	        			</td>
	        		</tr>
	        		<tr>
	        			<td style="width: 80px; font-size: 14px; line-height: 30px; height: 30px;">最近血压：</td>
	        			<td style="font-size: 14px; line-height: 30px; height: 30px;" align="left">
	        				<c:if test="${not empty xyModel }">
					    	<span style="color:red; font-weight: bold;">${xyModel.a }</span> 时检测的 
					    	<span style="color:red; font-weight: bold;">血压</span> 为【<span style="color:red; font-weight: bold;">${xyModel.c } ~ ${xyModel.b }(mm/Hg)</span>】
	        				</c:if>
	        				<c:if test="${empty xyModel }">
	        					-
	        				</c:if>
	        			</td>
	        		</tr>
	        		<tr>
	        			<td style="width: 80px; font-size: 14px; line-height: 30px; height: 30px;">最近体温：</td>
	        			<td style="font-size: 14px; line-height: 30px; height: 30px;" align="left">
					    	<c:if test="${not empty twmodel }">
					    	<span style="color:red; font-weight: bold;">${twmodel.a }</span> 时检测的 <span style="color:red; font-weight: bold;">体温</span> 为【<span style="color:red; font-weight: bold;">${twmodel.b }（℃）</span>】
	        				</c:if>
	        				<c:if test="${empty twmodel }">
	        					-
	        				</c:if>
	        			</td>
	        		</tr>
	        	</table>
	        	
	        	<div style="width: 99%; font-size: 18px; padding: 40px 0px 15px 0px; text-align: left;">一.基本信息</div>
	        	<table width="99%" border="0" cellspacing="0" cellpadding="0" style="font-size: 15px;">
	        		<tr>
	        			<td style="width: 120px; font-size: 14px; line-height: 30px; height: 30px;">姓名：${healthUser.name }</td>
	        			<td style="width: 120px; font-size: 14px; line-height: 30px; height: 30px;">性别：${healthUser.genderStr}</td>
	        			<td style="width: 120px; font-size: 14px; line-height: 30px; height: 30px;">年龄：${healthUser.birthdate}</td>
	        		</tr>
	        		<tr>	
	        			<td style="width: 120px; font-size: 14px; line-height: 30px; height: 30px;">身高：${healthUser.height}</td>
	        			<td style="width: 120px; font-size: 14px; line-height: 30px; height: 30px;">体重：${healthUser.weight}</td>
	        			<td style="width: 120px; font-size: 14px; line-height: 30px; height: 30px;">BMI：${healthUser.bmi}</td>
	        		</tr>
	        	</table>
	        	
	        	<div style="width: 99%; font-size: 18px; padding: 40px 0px 15px 0px; text-align: left;">二.数据记录</div>
	        	<div style="width: 99%; font-size: 14px; height: 60px; line-height: 60px; text-align: left;">1.运动（过量标红，少量标绿）</div>
	        	<table width="99%" border="0" cellspacing="0" cellpadding="0" style="font-size: 15px; border: solid #000; border-width: 1px 0px 0px 1px;">
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
	        	<table width="99%" border="0" cellspacing="0" cellpadding="0" style="font-size: 15px; border: solid #000; border-width: 1px 0px 0px 1px;">
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
	        	<table width="99%" border="0" cellspacing="0" cellpadding="0" style=" font-size: 15px; border: solid #000; border-width: 1px 0px 0px 1px;">
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
	        	<table width="99%"  border="0" cellspacing="0" cellpadding="0" style="font-size: 15px; border: solid #000; border-width: 1px 0px 0px 1px;">
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
		        			<td class="tableTd" align="center">&nbsp;
		        				<c:choose>
		        					<c:when test="${ pressureItem.c < 60}"><span style="color:#0be2c7;">${pressureItem.c }</span></c:when>
		        					<c:when test="${ pressureItem.c > 85}"><span style="color:#c94314;">${pressureItem.c }</span></c:when>
		        					<c:otherwise>${pressureItem.c }</c:otherwise>
		        				</c:choose>
		        			</td>
		        			<td class="tableTd" align="center">&nbsp;
		        				<c:choose>
		        					<c:when test="${ pressureItem.b < 90}"><span style="color:#0be2c7;">${pressureItem.b }</span></c:when>
		        					<c:when test="${ pressureItem.b > 130}"><span style="color:#c94314;">${pressureItem.b }</span></c:when>
		        					<c:otherwise>${pressureItem.b }</c:otherwise>
		        				</c:choose>
		        			</td>
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
	        	<table width="99%"  border="0" cellspacing="0" cellpadding="0" style="font-size: 15px; border: solid #000; border-width: 1px 0px 0px 1px;">
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
		        			<td class="tableTd" align="center">&nbsp;
		        				<c:choose>
		        					<c:when test="${ pulseItem.b < 60}"><span style="color:#0be2c7;">${pulseItem.b }</span></c:when>
		        					<c:when test="${ pulseItem.b > 100}"><span style="color:#c94314;">${pulseItem.b }</span></c:when>
		        					<c:otherwise>${pulseItem.b }</c:otherwise>
		        				</c:choose>
		        			</td>
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
	        	<table width="99%"  border="0" cellspacing="0" cellpadding="0" style="font-size: 15px; border: solid #000; border-width: 1px 0px 0px 1px;">
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
		        			<td class="tableTd" align="center">&nbsp;
			        			<c:if test="${glucoseItem.a1 ==0 }">
			        				<c:choose>
			        					<c:when test="${ glucoseItem.b < 3.6}"><span style="color:#0be2c7;">${glucoseItem.b }</span></c:when>
			        					<c:when test="${ glucoseItem.b > 6.1}"><span style="color:#c94314;">${glucoseItem.b }</span></c:when>
			        					<c:otherwise>${glucoseItem.b }</c:otherwise>
			        				</c:choose>
			        			</c:if>
			        			<c:if test="${glucoseItem.a1 ==1 }">
			        				<c:choose>
			        					<c:when test="${ glucoseItem.b < 3.6}"><span style="color:#0be2c7;">${glucoseItem.b }</span></c:when>
			        					<c:when test="${ glucoseItem.b > 7.7}"><span style="color:#c94314;">${glucoseItem.b }</span></c:when>
			        					<c:otherwise>${glucoseItem.b }</c:otherwise>
			        				</c:choose>
			        			</c:if>
		        			</td>
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
	        	<table width="99%"  border="0" cellspacing="0" cellpadding="0" style="font-size: 15px; border: solid #000; border-width: 1px 0px 0px 1px;">
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
		        			<td class="tableTd" align="center">&nbsp;
		        				<c:choose>
		        					<c:when test="${ thermometerItem.b<'36'}"><span style="color:#0be2c7;">${thermometerItem.b }</span></c:when>
		        					<c:when test="${ thermometerItem.b>'37.2'}"><span style="color:#c94314;">${thermometerItem.b }</span></c:when>
		        					<c:otherwise>${thermometerItem.b }</c:otherwise>
		        				</c:choose>
		        			</td>
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
	        	<table width="99%"  border="0" cellspacing="0" cellpadding="0" style="font-size: 15px; border: solid #000; border-width: 1px 0px 0px 1px;">
	        		<tr>
	        			<td class="tableTd" align="center">药品名称</td>
	        			<td class="tableTd" align="center">用药时间</td>
	        			<td class="tableTd" align="center">用药剂量</td>
	        		</tr>
	        		<c:if test="${not empty medicineFlys }">
	        			<c:forEach items="${medicineFlys }" var="medicineItem" varStatus="index">
		        		<tr>
		        			<td class="tableTd" align="center">&nbsp;${medicineItem.a }</td>
		        			<td class="tableTd" align="center" style="width: 180px;">&nbsp;${medicineItem.b }</td>
		        			<td class="tableTd" align="center">&nbsp;${medicineItem.c }(${medicineItem.d })</td>
		        		</tr>
	        			</c:forEach>
	        		</c:if>
	        		<c:if test="${empty medicineFlys }">
		        		<tr>
		        			<td class="tableTd" align="center">&nbsp;</td>
		        			<td class="tableTd" align="center">&nbsp;</td>
		        			<td class="tableTd" align="center">&nbsp;</td>
		        		</tr>
	        		</c:if>
	        	</table>
	        	<div style="width: 99%; font-size: 14px; height: 60px; line-height: 60px; text-align: left;">综合分析：</div>
	        	<textarea style="width: 99%; height: 150px; border: 1px solid #ccc;" id="medicationAdvice" name="medicationAdvice"></textarea>
	        </div>
        </div>
    </div>
</body>
</html>
