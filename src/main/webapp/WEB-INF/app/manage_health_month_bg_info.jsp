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
    <title>健康月报</title>
	<style>
		.tableTd{border: solid #000; border-width: 0px 1px 1px 0px; width: 100px; font-size: 14px; line-height: 30px; height: 30px;}
		.selectMax_Level{width:60px; height:25px; border:0px solid #aeaeae; font:13px/26px "微软雅黑"; color:#5a5a5a; }
        .hidden{display: none;}
        .noData{width: 99%; font-size: 18px; padding: 0px 0px 20px 10px; text-align: left; color:#FF0000;}    
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
								var tmp = "span[name='sportLevel"+(nItem + 1)+"']";
								if(nItem == sportLevelFly.length-1)
								{
									tmp = "span[name='sportLevel00']";
								}
								else if (nItem == sportLevelFly.length-2)
								{
									tmp = "span[name='sportLevel0']";
								}
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
								$(tmp).html(tmpVal);
								if(sportLevelFly[nItem] == 3)
								{
									$(tmp).parent().parent().css("background", "#f78668");
								}	
								else if(sportLevelFly[nItem] == 1)
								{
									$(tmp).parent().parent().css("background", "#a0f0e6");
								}	
								else 
								{
									$(tmp).parent().parent().css("background", "#ffffff");
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
	<div id="list" role="main" class="listDiv"  class="ui-content jqm-content" style="overflow: auto; padding-left: 8px; margin-top: 1px; background: #fff;" >
	  

	        	<table width="99%" border="0" cellspacing="0" cellpadding="0" style="font-size: 15px;">
	        		<tr>
	        			<td style="width: 120px; font-size: 14px; line-height: 35px; height: 35px;">综合评估：</td>
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
	        	<div style="width: 99%; font-size: 14px; height: 60px; line-height: 60px; text-align: left;">1.运动</div>
                <c:if test="${empty sportFlys }">
                  <div class="noData">暂时没有可用数据</div>
                </c:if>            
        		<c:if test="${not empty sportFlys }">
    	        	<table border="0" cellspacing="0" cellpadding="0" style="font-size: 15px; border: solid #000; border-width: 1px 0px 0px 1px;">
    	        		<tr>
    	        			<td class="tableTd" align="center">序号</td>
    	        			<td class="tableTd" align="center">运动类型</td>
    	        			<td class="tableTd" align="center">时长(分)</td>
    	        			<td class="tableTd" align="center">卡路里消耗(卡)</td>
    	        			<td class="tableTd" align="center">是否适量</td>
    	        		</tr>
            			<c:forEach items="${sportFlys }" var="sportItem" varStatus="index">
    	        		<tr>
    	        			<td class="tableTd" align="center">${index.count }</td>
    	        			<td class="tableTd" align="center">&nbsp;${sportItem.a }</td>
    	        			<td class="tableTd" align="center">&nbsp;${sportItem.c }</td>
    	        			<td class="tableTd" align="center">&nbsp;${sportItem.d }</td>
    	        			<td class="tableTd" align="center">
    		        			<span class="selectMax_Level" name="sportLevel${index.count }">
    			               	</span>
    		               </td>
    	        		</tr>
            			</c:forEach>
    	        		<tr>
    	        			<td class="tableTd" align="center">合计</td>
    	        			<td class="tableTd" align="center">&nbsp; - </td>
    	        			<td class="tableTd" align="center">&nbsp;${sportObj.a }</td>
    	        			<td class="tableTd" align="center">&nbsp;${sportObj.b }</td>
    	        			<td class="tableTd" align="center">
    	        				<span class="selectMax_Level" name="sportLevel0"></span>
    	        			</td>
    	        		</tr>
    	        		<tr>
    	        			<td class="tableTd" align="center">日均</td>
    	        			<td class="tableTd" align="center">&nbsp;-</td>
    	        			<td class="tableTd" align="center">&nbsp;${sportObj.c }</td>
    	        			<td class="tableTd" align="center">&nbsp;${sportObj.d }</td>
    	        			<td class="tableTd" align="center">
    	        				<span class="selectMax_Level" name="sportLevel00"></span>
    	        			</td>
    	        		</tr>
    	        	</table>
        		</c:if>
	        	<div class="hidden" style="width: 99%; font-size: 14px; height: 60px; line-height: 60px; text-align: left;">综合分析：</div>
	        	<textarea class="hidden" style="width: 99%; height: 150px; border: 1px solid #ccc;" id="sportAdvice" name="sportAdvice"></textarea>
	        	
	        	<div style="width: 99%; font-size: 14px; height: 60px; line-height: 60px; text-align: left;">2.饮食</div>
                <c:if test="${empty foodFlys }">
                  <div class="noData">暂时没有可用数据</div>
                </c:if>             
        		<c:if test="${not empty foodFlys }">
    	        	<table width="99%" border="0" cellspacing="0" cellpadding="0" style="font-size: 15px; border: solid #000; border-width: 1px 0px 0px 1px;">
    	        		<tr>
    	        			<td class="tableTd" align="center">食物类别</td>
    	        			<td class="tableTd" align="center">月总摄入量（g）</td>
    	        			<td class="tableTd" align="center">月总摄入热量（卡）</td>
    	        			<td class="tableTd" align="center">日平均摄入量（g）</td>
    	        			<td class="tableTd" align="center" style="width: 140px;">日平均摄入热量（卡）</td>
    	        		</tr>
            			<c:forEach items="${foodFlys }" var="foodItem" varStatus="index">
    	        		<tr>
    	        			<td class="tableTd" align="center">&nbsp;${foodItem.a}</td>
    	        			<td class="tableTd" align="center">&nbsp;${foodItem.b}</td>
    	        			<td class="tableTd" align="center">&nbsp;${foodItem.c}</td>
    	        			<td class="tableTd" align="center">&nbsp;${foodItem.d}</td>
    	        			<td class="tableTd" align="center">&nbsp;${foodItem.e}</td>
    	        		</tr>
            			</c:forEach>
    	        	</table>
        		</c:if>
	        	<div class="hidden" style="width: 99%; font-size: 14px; height: 60px; line-height: 60px; text-align: left;">综合分析：</div>
	        	<textarea class="hidden" style="width: 99%; height: 150px; border: 1px solid #ccc;" name="dietAdvice" id="dietAdvice"></textarea>
	        	
	        	
	        	<div style="width: 99%; font-size: 14px; height: 60px; line-height: 60px; text-align: left;">3.心理评估</div>
                <c:if test="${empty mentalObj }">
                  <div class="noData">暂时没有可用数据</div>
                </c:if>             
        		<c:if test="${not empty mentalObj }">
    	        	<table border="0" cellspacing="0" cellpadding="0" style=" font-size: 15px; border: solid #000; border-width: 1px 0px 0px 1px;">
    	        		<tr>
    	        			<td class="tableTd" align="center">记录次数</td>
    	        			<td class="tableTd" align="center">烦躁次数</td>
    	        			<td class="tableTd" align="center">开心次数</td>
    	        			<td class="tableTd" align="center">平静次数</td>
    	        			<td class="tableTd" align="center">沮丧次数</td>
    	        		</tr>
  		        		<tr>
  		        			<td class="tableTd" align="center">${mentalObj.a5 }</td>
  		        			<td class="tableTd" align="center">&nbsp;${mentalObj.a1 }</td>
  		        			<td class="tableTd" align="center">&nbsp;${mentalObj.a2 }</td>
  		        			<td class="tableTd" align="center">&nbsp;${mentalObj.a3 }</td>
  		        			<td class="tableTd" align="center">&nbsp;${mentalObj.a4 }</td>
  		        		</tr>
    	        	</table>
        		</c:if>
	        	<div class="hidden" style="width: 99%; font-size: 14px; height: 60px; line-height: 60px; text-align: left;">综合分析：</div>
	        	<textarea class="hidden" style="width: 99%; height: 150px; border: 1px solid #ccc;" id="mentalAdvice" name="mentalAdvice"></textarea>	
	        	
	        	
	        	<div style="width: 99%; font-size: 14px; height: 60px; line-height: 60px; text-align: left;">4.血压</div>
                <c:choose>
            		<c:when test="${not empty pressureFlys && pressureFlys[0].a1 gt 0}">
        	        	<table border="0" cellspacing="0" cellpadding="0" style="font-size: 15px; border: solid #000; border-width: 1px 0px 0px 1px;">
        	        		<tr>
        	        			<td class="tableTd" align="center">测量次数</td>
        	        			<td class="tableTd" align="center">正常次数</td>
        	        			<td class="tableTd" align="center">舒张压高于正常值次数</td>
        	        			<td class="tableTd" align="center">收缩压高于正常值次数</td>
        	        			<td class="tableTd" align="center">舒张压低于正常值次数</td>
        	        			<td class="tableTd" align="center">收缩压低于正常值次数</td>
        	        		</tr>
      	        			<c:forEach items="${pressureFlys }" var="pressureItem" varStatus="index">
      		        		<tr>
      		        			<td class="tableTd" align="center">${pressureItem.a1 }</td>
      		        			<td class="tableTd" align="center">&nbsp;${pressureItem.a2 }</td>
      		        			<td class="tableTd" align="center">&nbsp;${pressureItem.a3 }</td>
      		        			<td class="tableTd" align="center">&nbsp;${pressureItem.a5 }</td>
      		        			<td class="tableTd" align="center">&nbsp;${pressureItem.a4 }</td>
      		        			<td class="tableTd" align="center">&nbsp;${pressureItem.a6 }</td>
      		        		</tr>
      	        			</c:forEach>
        	        	</table>
            		</c:when>
                    <c:otherwise>
                      <div class="noData">暂时没有可用数据</div>
                    </c:otherwise>
                </c:choose>
	        	<div class="hidden" style="width: 99%; font-size: 14px; height: 60px; line-height: 60px; text-align: left;">综合分析：</div>
	        	<textarea class="hidden" style="width: 99%; height: 150px; border: 1px solid #ccc;" id="bloodPressureAdvice" name="bloodPressureAdvice"></textarea>	
	        	
	        	
	        	
	        	
	        	<div style="width: 99%; font-size: 14px; height: 60px; line-height: 60px; text-align: left;">5.心率</div>
                <c:choose>
            		<c:when test="${not empty pulseFlys && pulseFlys[0].a1 gt 0}">
        	        	<table border="0" cellspacing="0" cellpadding="0" style="font-size: 15px; border: solid #000; border-width: 1px 0px 0px 1px;">
        	        		<tr>
        	        			<td class="tableTd" align="center">测量次数</td>
        	        			<td class="tableTd" align="center">正常次数</td>
        	        			<td class="tableTd" align="center">偏高次数</td>
        	        			<td class="tableTd" align="center">偏低次数</td>
        	        		</tr>
      	        			<c:forEach items="${pulseFlys }" var="pulseItem" varStatus="index">
      		        		<tr>
      		        			<td class="tableTd" align="center">${pulseItem.a1 }</td>
      		        			<td class="tableTd" align="center">&nbsp;${pulseItem.a2 }</td>
      		        			<td class="tableTd" align="center">&nbsp;${pulseItem.a3 }</td>
      		        			<td class="tableTd" align="center">&nbsp;${pulseItem.a4 }</td>
      		        		</tr>
      	        			</c:forEach>
        	        	</table>
            		</c:when>
                    <c:otherwise>
                      <div class="noData">暂时没有可用数据</div>
                    </c:otherwise>
                </c:choose>          
	        	<div class="hidden" style="width: 99%; font-size: 14px; height: 60px; line-height: 60px; text-align: left;">综合分析：</div>
	        	<textarea class="hidden" style="width: 99%; height: 150px; border: 1px solid #ccc;" id="heartRateAdvice" name="heartRateAdvice"></textarea>	
	        		
	        		
	        	
	        	<div style="width: 99%; font-size: 14px; height: 60px; line-height: 60px; text-align: left;">6.血糖</div>
                <c:choose>
            		<c:when test="${not empty glucoseFlys && glucoseFlys[0].a1 gt 0}">
        	        	<table border="0" cellspacing="0" cellpadding="0" style="font-size: 15px; border: solid #000; border-width: 1px 0px 0px 1px;">
        	        		<tr>
        	        			<td class="tableTd" align="center">测量次数</td>
        	        			<td class="tableTd" align="center">正常次数</td>
        	        			<td class="tableTd" align="center">偏高次数</td>
        	        			<td class="tableTd" align="center">偏低次数</td>
        	        		</tr>
      	        			<c:forEach items="${glucoseFlys }" var="glucoseItem" varStatus="index">
      		        		<tr>
      		        			<td class="tableTd" align="center">${glucoseItem.a1 + glucoseItem.a2 }</td>
      		        			<td class="tableTd" align="center">&nbsp;${glucoseItem.a1 }</td>
      		        			<td class="tableTd" align="center">&nbsp;${glucoseItem.a2 }</td>
      		        			<td class="tableTd" align="center">&nbsp;${glucoseItem.a3 }</td>
      		        		</tr>
      	        			</c:forEach>
        	        	</table>
            		</c:when>
                    <c:otherwise>
                      <div class="noData">暂时没有可用数据</div>
                    </c:otherwise>
                </c:choose>            
	        	<div class="hidden" style="width: 99%; font-size: 14px; height: 60px; line-height: 60px; text-align: left;">综合分析：</div>
	        	<textarea class="hidden" style="width: 99%; height: 150px; border: 1px solid #ccc;" id="bloodGlucoseAdvice" name="bloodGlucoseAdvice"></textarea>	
	        	
	        	
	        	
	        	
	        	<div style="width: 99%; font-size: 14px; height: 60px; line-height: 60px; text-align: left;">7.体温</div>
                <c:choose>
            		<c:when test="${not empty thermometerFlys && thermometerFlys[0].a1 gt 0}">
        	        	<table border="0" cellspacing="0" cellpadding="0" style="font-size: 15px; border: solid #000; border-width: 1px 0px 0px 1px;">
        	        		<tr>
        	        			<td class="tableTd" align="center">测量次数</td>
        	        			<td class="tableTd" align="center">正常次数</td>
        	        			<td class="tableTd" align="center">异常次数</td>
        	        		</tr>
      	        			<c:forEach items="${thermometerFlys }" var="thermometerItem" varStatus="index">
      		        		<tr>
      		        			<td class="tableTd" align="center">${thermometerItem.a1 }</td>
      		        			<td class="tableTd" align="center">&nbsp;${thermometerItem.a2 }</td>
      		        			<td class="tableTd" align="center">&nbsp;${thermometerItem.a3 }</td>
      		        		</tr>
      	        			</c:forEach>
        	        	</table>
            		</c:when>
                    <c:otherwise>
                      <div class="noData">暂时没有可用数据</div>
                    </c:otherwise>
                </c:choose>            
	        	<div class="hidden" style="width: 99%; font-size: 14px; height: 60px; line-height: 60px; text-align: left;">综合分析：</div>
	        	<textarea class="hidden" style="width: 99%; height: 150px; border: 1px solid #ccc;" id="temperatureAdvice" name="temperatureAdvice"></textarea>			
	        	
	        	
	        	
	        	<div style="width: 99%; font-size: 14px; height: 60px; line-height: 60px; text-align: left;">8.用药记录</div>
                <c:if test="${empty medicineFlys }">
                  <div class="noData">暂时没有可用数据</div>
                </c:if>            
        		<c:if test="${not empty medicineFlys }">
    	        	<table border="0" cellspacing="0" cellpadding="0" style="font-size: 15px; border: solid #000; border-width: 1px 0px 0px 1px;">
    	        		<tr>
    	        			<td class="tableTd" align="center">药品名称</td>
    	        			<td class="tableTd" align="center">用药次数</td>
    	        			<td class="tableTd" align="center">平均每次用药</td>
    	        			<td class="tableTd" align="center">总用药量</td>
    	        		</tr>
  	        			<c:forEach items="${medicineFlys }" var="medicineItem" varStatus="index">
  		        		<tr>
  		        			<td class="tableTd" align="center">${medicineItem.a }</td>
  		        			<td class="tableTd" align="center">&nbsp;${medicineItem.b }</td>
  		        			<td class="tableTd" align="center">&nbsp;${medicineItem.c }(${medicineItem.e })</td>
  		        			<td class="tableTd" align="center">&nbsp;${medicineItem.d }(${medicineItem.e })</td>
  		        		</tr>
  	        			</c:forEach>
    	        	</table>
        		</c:if>
	        	<div style="width: 99%; font-size: 14px; height: 60px; line-height: 60px; text-align: left;">综合分析：</div>
	        	<textarea style="width: 99%; height: 150px; border: 1px solid #ccc;" id="medicationAdvice" name="medicationAdvice"></textarea>
	        </div>
        </div>
    </div>
</body>
</html>
