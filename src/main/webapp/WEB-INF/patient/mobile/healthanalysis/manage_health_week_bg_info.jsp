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
	<%@ include file="/WEB-INF/patient/common/date-include.jsp"%>
    <%@ include file="/WEB-INF/patient/common/mobile-include.jsp"%>
    <link rel="stylesheet" href="<c:url value='/patient/themes/index_tab.css'/>" type="text/css"/>
    <style>
		.tableTd{border: solid #000; border-width: 0px 1px 1px 0px; width: 120px; font-size: 14px; line-height: 30px; height: 30px;}
		.input_informationModify{width:150px; height:25px; border:1px solid #aeaeae; padding-left:10px; font:13px/26px "微软雅黑"; color:#5a5a5a; }
		.selectMax_informationModify{width:150px; height:25px; border:1px solid #aeaeae; font:13px/26px "微软雅黑"; color:#5a5a5a; }
		.selectMax_Level{width:60px; height:25px; border:0px solid #aeaeae; font:13px/26px "微软雅黑"; color:#5a5a5a; }
        .hidden{display: none;}
        .noData{width: 99%; font-size: 18px; padding: 0px 0px 20px 10px; text-align: left; color:#FF0000;}
		.Wdate{
			height: 28px;
			width:170px;
  			border: 1px solid #aeaeae;
		}
		.search {
		  width: 100%;
		  padding: 3px 0px;
		  background: #f7f7f7;
		  float: left;
		  margin-top: 10px;
		   margin-bottom: 10px;
		}
	</style>
	
	<script type="text/JavaScript">
		var mGolbalType = 0;
	
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
			
			
			window.setInterval(function(){
				if(mGolbalType == 0)
				{
					if($("#startTime").val() != "")
					{
						var dataFlys = $("#startTime").val().split("-");
						var mStartTime = new Date(dataFlys[0], dataFlys[1] -1, dataFlys[2], 0, 0, 0); 
						if(mStartTime.getDay() >=1)
						{
							$("#startTime").val(DateAdd("d", 1-mStartTime.getDay(), mStartTime).pattern("yyyy-MM-dd"));
							$("#endTime").val(DateAdd("d", 7 - mStartTime.getDay(), mStartTime).pattern("yyyy-MM-dd"));
						}
						else if (mStartTime.getDay() == 0) 
						{
							$("#startTime").val(DateAdd("d", mStartTime.getDay() - 6, mStartTime).pattern("yyyy-MM-dd"));
							$("#endTime").val(DateAdd("d", mStartTime.getDay(), mStartTime).pattern("yyyy-MM-dd"));
						}
					}	
				}
				else if(mGolbalType == 1)
				{
					if($("#endTime").val() != "")
					{
						var dataFlys = $("#endTime").val().split("-");
						var mEndTime = new Date(dataFlys[0], dataFlys[1] -1, dataFlys[2], 0, 0, 0); 
						if(mEndTime.getDay() >=1)
						{
							$("#startTime").val(DateAdd("d", 1-mEndTime.getDay(), mEndTime).pattern("yyyy-MM-dd"));
							$("#endTime").val(DateAdd("d", 7 - mEndTime.getDay(), mEndTime).pattern("yyyy-MM-dd"));
						}
						else if (mEndTime.getDay() == 0) 
						{
							$("#startTime").val(DateAdd("d", mEndTime.getDay() - 6, mEndTime).pattern("yyyy-MM-dd"));
						}
					}	
				}	
			}, 200);
			$("#btnsearch").bind("click", function(){
				if($("#startTime").val() == "")
				{
					alert("起始时间不能为空")
				}	
				else if($("#endTime").val() == "")
				{
					alert("结束时间不能为空")
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
		
		
		
		function funClickTime(type)
		{
			mGolbalType = type;
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
					reportTime 			: $("#startTime").val() + "_" + $("#endTime").val()
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
<body style="padding: 0px; margin: 0px;">
  	<header id="header">健康周报
  		<div class="left"><a href="<c:url value='/p/search.do'/>"><span class="corner"></span></a></div>
  	</header>
  	<div id="content">
	    	<div class="search">
		    	<form id="inputform" name="inputform" action="<c:url value='/p/query/healthBg.do'/>" method="post">
				    <table width="100%" border="0" cellspacing="0" cellpadding="0" style="display: block; font-size: 15px;">
				    	<tr>
				    		<td style="padding: 5px 0px 5px 5px; height: 30px; width:90px; color: #aeaeae; font-size: 18px;" align="right" >
				    			报告类型：
				    		</td>
				    		<td style="padding: 5px 0px 5px 5px; align="left" >
				    			<select class="selectMax_informationModify" style="width:180px; height: 35px;  font-size: 18px;" id="statType" name="statType">
					               <option value="1">日报</option>
					               <option value="2" selected="selected">周报</option>
					               <option value="3">月报</option>
				               </select>
				    		</td>
				    	</tr>
				    	<tr>
				    		<td style="padding: 5px 0px 5px 5px; height: 30px; width:90px; color: #aeaeae; font-size: 18px;" align="right" rowspan="2">
				    			时间段：
				    		</td>
				    		<td style="padding: 5px 0px 5px 5px; height: 30px; color: #aeaeae; font-size: 13px;" align="left">
				    			<input class="input_informationModify"  style="width: 180px; height: 35px; font-size: 18px;" onclick="funClickTime(0);" type="date" id="startTime" name="startTime" value="${query.startTime }">
				    		</td>
				    	</tr>
				    	<tr>
				    		<td style="padding: 5px 0px 5px 5px; height: 30px; color: #aeaeae; font-size: 18px;" align="left">
				    			<input class="input_informationModify" style="width: 180px;  height: 35px; font-size: 18px;" onclick="funClickTime(1);" type="date" id="endTime" name="endTime" value="${query.endTime }">
				    		</td>
				    	</tr>
				    	<tr>	
				    		<td align="center" style="height: 25px;" colspan="2">
					    			<input type="hidden" name="userId" id="userId" value="${query.userId }"></input>
					    		
					    		<ul>
					    			<li class="btn_search" style="float: none;"><a href="javascript:void(0)" id="btnsearch">查询</a></li>
					    		</ul>
				    		</td>
				    	</tr>
				    </table>
				</form>    
			</div>
		<ul class="list">
			<li class="activeable list-item">	
	        	<table width="99%" border="0" cellspacing="0" cellpadding="0" style="display: block; font-size: 15px;">
	        		<tr>
	        			<td style="width: 120px; font-size: 14px; line-height: 35px; height: 35px;">综合评估：</td>
	        			<td align="left" id="accessment">
	        				
	        			</td>
	        		</tr>
	        		<tr>
	        			<td style="width: 120px; font-size: 14px; line-height: 30px; height: 30px;">健康状况：</td>
	        			<td style="width: 320px; font-size: 14px; line-height: 30px; height: 30px;" align="left" id="jkzk"></td>
	        		</tr>
	        		<tr>
	        			<td style="width: 120px; font-size: 14px; line-height: 30px; height: 30px;">日<span style="padding:0 16px;"></span>期：</td>
	        			<td style="width: 320px; font-size: 14px; line-height: 30px; height: 30px;" align="left">${query.startTime }  <span style="padding: 0 3px;">-</span>  ${query.endTime }</td>
	        		</tr>
	        	</table>
	        	
	        	<div style="width: 99%; font-size: 18px; padding: 40px 0px 15px 0px; text-align: left;">一.基本信息</div>
	        	<table width="99%" border="0" cellspacing="0" cellpadding="0" style="display: block; font-size: 15px;">
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
    	        				<span class="selectMax_Level" name="sportLevel0">
    				               </span>
    	        			</td>
    	        		</tr>
    	        		<tr>
    	        			<td class="tableTd" align="center">日均</td>
    	        			<td class="tableTd" align="center">&nbsp;-</td>
    	        			<td class="tableTd" align="center">&nbsp;${sportObj.c }</td>
    	        			<td class="tableTd" align="center">&nbsp;${sportObj.d }</td>
    	        			<td class="tableTd" align="center">
    	        				<span class="selectMax_Level" name="sportLevel00">
    				             </span>
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
    	        			<td class="tableTd" align="center">测试总分平均值</td>
    	        			<td class="tableTd" align="center">阳性项目平均数</td>
    	        		</tr>
  		        		<tr>
  		        			<td class="tableTd" align="center">${mentalObj.a }</td>
  		        			<td class="tableTd" align="center">${mentalObj.b }</td>
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
	        </li>
	     </ul>   
    </div>
	
	<footer id="footer">
		<footer id="footer">
		<jsp:include page="/WEB-INF/patient/common/footer-include.jsp">
			<jsp:param value="1" name="selected"/>
		</jsp:include>
	</footer>	   
</body>
</html>
