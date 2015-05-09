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
	<%@ include file="/WEB-INF/nurse/common/top-include.jsp"%>
	<%@ include file="/WEB-INF/nurse/common/easyui-include.jsp"%>
	<link rel="stylesheet" href="<c:url value='/nurse/themes/health_records.css'/>" type="text/css"/>
	<style>
		.tableTd{border: solid #000; border-width: 0px 1px 1px 0px; width: 120px; font-size: 14px; line-height: 30px; height: 30px;}
		.input_informationModify{width:150px; height:25px; border:1px solid #aeaeae; padding-left:10px; font:13px/26px "微软雅黑"; color:#5a5a5a; }
		.selectMax_informationModify{width:150px; height:25px; border:1px solid #aeaeae; font:13px/26px "微软雅黑"; color:#5a5a5a; }
		.selectMax_Level{width:60px; height:25px; border:1px solid #aeaeae; font:13px/26px "微软雅黑"; color:#5a5a5a; }
	</style>
	
	<script type="text/JavaScript">
		var mGolbalType = 0;
	
		$(function(){
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
				window.location.href = "<c:url value='/n/search/goHealthBg.do?userId=${query.userId}'/>&statType="+$(this).val();
			});
			
			
			$("#accessment").bind("change", function(){
				funAccessment($(this).val());
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
			}
			else if(type == 2)
			{
				$("#jkzk").html("良好");
			}	
			else if(type == 3)
			{
				$("#jkzk").html("一般");
			}
			else if(type == 4)
			{
				$("#jkzk").html("欠佳");
			}
			else
			{
				$("#jkzk").html(" ");
			}	
		}
		
		
		
		function funClickTime(type)
		{
			mGolbalType = type;
		}
		
		function funSaveInfo()
		{
			var sportLevelFly = [];
			$("select[name^='sportLevel']").each(function(){
				sportLevelFly.push($(this).val());
			});
			
			var dietLevelFly = [];
			$("select[name^='dietLevel']").each(function(){
				dietLevelFly.push($(this).val());
			});
			
			var reportTime = $("#startTime").val();
			
			$.ajax({
				url : "<c:url value='/n/search/dealHealthReport.do?userId=${query.userId}'/>",
				type : 'post',
				dataType : 'json',
				data : 
				{
					reportFlag 			: $("#statType").val(),
					accessment 			: $("#accessment").val(),
					reportTime 			: $("#startTime").val() + "_" + $("#endTime").val(),
					sportLevel 			: sportLevelFly.join(","),
					sportAdvice 		: $("#sportAdvice").val(),
					dietLevel 			: dietLevelFly.join(","),
					dietAdvice 			: $("#dietAdvice").val(),
					mentalAdvice 		: $("#mentalAdvice").val(),
					bloodPressureAdvice : $("#bloodPressureAdvice").val(),
					bloodGlucoseAdvice 	: $("#bloodGlucoseAdvice").val(),
					heartRateAdvice 	: $("#heartRateAdvice").val(),
					temperatureAdvice 	: $("#temperatureAdvice").val(),
					medicationAdvice 	: $("#medicationAdvice").val()
				},
				error:function(data)
				{
					PageMain.funCloseProgress();
				},
				success:function(data)
				{
					if(data.success)
					{
						$.messager.alert('信息提示', data.msg, 'info');
					}
					else
					{
						$.messager.alert('信息提示', data.msg, 'error');
					}
				}
			});
			
		}
		
		function funLoadHealthRepeatInfo()
		{
			$.ajax({
				url : "<c:url value='/n/search/healthReport.do?userId=${query.userId}'/>",
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
								var tmp = "select[name='sportLevel"+(nItem + 1)+"']";
								if(nItem == sportLevelFly.length-1)
								{
									tmp = "select[name='sportLevel00']";
								}
								else if (nItem == sportLevelFly.length-2)
								{
									tmp = "select[name='sportLevel0']";
								}
								
								$(tmp).val(sportLevelFly[nItem]);
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
								var tmp = "select[name='dietLevel"+(nItem + 1)+"']";
								if(nItem == dietLevelFly.length-1)
								{
									tmp = "select[name='dietLevel0']";
								}	
								$(tmp).val(dietLevelFly[nItem]);
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
  <div class="information_modify">
	    <div class="information_modify_main">
	    	<div class="search">
		    	<form id="inputform" name="inputform" action="<c:url value='/n/search/healthBg.do'/>" method="post">
				    <table width="100%" border="0" cellspacing="0" cellpadding="0" style="display: block; font-size: 15px;">
				    	<tr>
				    		<td style="padding: 5px 0px 5px 0px; height: 30px; color: #aeaeae; font-size: 13px;" align="left">
				    			报告类型：
				    			<select class="selectMax_informationModify" id="statType" name="statType">
					               <option value="1">日报</option>
					               <option value="2" selected="selected">周报</option>
					               <option value="3">月报</option>
				               </select>
				    		</td>
				    		<td>
				    		</td>
				    	</tr>
				    	<tr>
				    		<td style="padding: 5px 0px 5px 0px; height: 30px; color: #aeaeae; font-size: 13px;" align="left">
				    			报告时间：
				    			<input class="input_informationModify Wdate" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true}); funClickTime(0);" type="text" id="startTime" name="startTime" value="${query.startTime }">
				    			<span id="split">
				    			-
				    			</span>
				    			<input class="input_informationModify Wdate" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true}); funClickTime(1);" type="text" id="endTime" name="endTime" value="${query.endTime }">
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
	        	<div style="width: 99%; font-size: 24px; text-align: center; font-weight: bold; height: 60px; line-height: 60px;">周健康报告</div>
	        	<table width="99%" border="0" cellspacing="0" cellpadding="0" style="display: block; font-size: 15px;">
	        		<tr>
	        			<td style="width: 120px; font-size: 14px; line-height: 35px; height: 35px;">综合评估：</td>
	        			<td align="left">
	        				<select class="selectMax_informationModify" id="accessment" name="accessment">
			                   <option value="-1">请选择</option>
				               <option value="1">90-100</option>
				               <option value="2">80-90</option>
				               <option value="3">70-80</option>
				               <option value="4">70以下</option>
			               </select>
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
	        			<td style="width: 120px; font-size: 14px; line-height: 30px; height: 30px;">身高：${healthUser.height}</td>
	        			<td style="width: 120px; font-size: 14px; line-height: 30px; height: 30px;">体重：${healthUser.weight}</td>
	        			<td style="width: 120px; font-size: 14px; line-height: 30px; height: 30px;">BMI：${healthUser.bmi}</td>
	        		</tr>
	        	</table>
	        	
	        	<div style="width: 99%; font-size: 18px; padding: 40px 0px 15px 0px; text-align: left;">二.数据记录</div>
	        	<div style="width: 99%; font-size: 14px; height: 60px; line-height: 60px; text-align: left;">1.运动</div>
	        	<table border="0" cellspacing="0" cellpadding="0" style="font-size: 15px; border: solid #000; border-width: 1px 0px 0px 1px;">
	        		<tr>
	        			<td class="tableTd" align="center">序号</td>
	        			<td class="tableTd" align="center">运动类型</td>
	        			<td class="tableTd" align="center">时长(分)</td>
	        			<td class="tableTd" align="center">卡路里消耗(卡)</td>
	        			<td class="tableTd" align="center">是否适量</td>
	        		</tr>
	        		<c:if test="${not empty sportFlys }">
	        			<c:forEach items="${sportFlys }" var="sportItem" varStatus="index">
		        		<tr>
		        			<td class="tableTd" align="center">${index.count }</td>
		        			<td class="tableTd" align="center">&nbsp;${sportItem.a }</td>
		        			<td class="tableTd" align="center">&nbsp;${sportItem.c }</td>
		        			<td class="tableTd" align="center">&nbsp;${sportItem.d }</td>
		        			<td class="tableTd" align="center">
			        			<select class="selectMax_Level" name="sportLevel${index.count }">
				                   <option value="-1">请选择</option>
					               <option value="1">较少</option>
					               <option value="2">适中</option>
					               <option value="3">过量</option>
				               </select>
			               </td>
		        		</tr>
	        			</c:forEach>
	        		</c:if>
	        		<tr>
	        			<td class="tableTd" align="center">合计</td>
	        			<td class="tableTd" align="center">&nbsp; - </td>
	        			<td class="tableTd" align="center">&nbsp;${sportObj.a }</td>
	        			<td class="tableTd" align="center">&nbsp;${sportObj.b }</td>
	        			<td class="tableTd" align="center">&nbsp;
	        				<select class="selectMax_Level" name="sportLevel0">
				                   <option value="-1">请选择</option>
					               <option value="1">较少</option>
					               <option value="2">适中</option>
					               <option value="3">过量</option>
				               </select>
	        			</td>
	        		</tr>
	        		<tr>
	        			<td class="tableTd" align="center">日均</td>
	        			<td class="tableTd" align="center">&nbsp;-</td>
	        			<td class="tableTd" align="center">&nbsp;${sportObj.c }</td>
	        			<td class="tableTd" align="center">&nbsp;${sportObj.d }</td>
	        			<td class="tableTd" align="center">&nbsp;
	        				<select class="selectMax_Level" name="sportLevel00">
				                   <option value="-1">请选择</option>
					               <option value="1">较少</option>
					               <option value="2">适中</option>
					               <option value="3">过量</option>
				               </select>
	        			</td>
	        		</tr>
	        	</table>
	        	<div style="width: 99%; font-size: 14px; height: 60px; line-height: 60px; text-align: left;">综合分析：</div>
	        	<textarea style="width: 99%; height: 150px; border: 1px solid #ccc;" id="sportAdvice" name="sportAdvice"></textarea>
	        	
	        	<div style="width: 99%; font-size: 14px; height: 60px; line-height: 60px; text-align: left;">2.饮食</div>
	        	<table width="99%" border="0" cellspacing="0" cellpadding="0" style="font-size: 15px; border: solid #000; border-width: 1px 0px 0px 1px;">
	        		<tr>
	        			<td class="tableTd" align="center">食物类别</td>
	        			<td class="tableTd" align="center">月总摄入量（g）</td>
	        			<td class="tableTd" align="center">月总摄入热量（卡）</td>
	        			<td class="tableTd" align="center">日平均摄入量（g）</td>
	        			<td class="tableTd" align="center" style="width: 140px;">日平均摄入热量（卡）</td>
	        		</tr>
	        		<c:if test="${not empty foodFlys }">
	        			<c:forEach items="${foodFlys }" var="foodItem" varStatus="index">
		        		<tr>
		        			<td class="tableTd" align="center">&nbsp;${foodItem.a}</td>
		        			<td class="tableTd" align="center">&nbsp;${foodItem.b}</td>
		        			<td class="tableTd" align="center">&nbsp;${foodItem.c}</td>
		        			<td class="tableTd" align="center">&nbsp;${foodItem.d}</td>
		        			<td class="tableTd" align="center">&nbsp;${foodItem.e}</td>
		        		</tr>
	        			</c:forEach>
	        		</c:if>
	        		<c:if test="${empty foodFlys }">
	        		<tr>
	        			<td class="tableTd" align="center">&nbsp;</td>
	        			<td class="tableTd" align="center">&nbsp;</td>
	        			<td class="tableTd" align="center">&nbsp;</td>
	        			<td class="tableTd" align="center">&nbsp;</td>
	        			<td class="tableTd" align="center">&nbsp;</td>
	        		</tr>
	        		</c:if>
	        	</table>
	        	<div style="width: 99%; font-size: 14px; height: 60px; line-height: 60px; text-align: left;">综合分析：</div>
	        	<textarea style="width: 99%; height: 150px; border: 1px solid #ccc;" name="dietAdvice" id="dietAdvice"></textarea>
	        	
	        	
	        	<div style="width: 99%; font-size: 14px; height: 60px; line-height: 60px; text-align: left;">3.心理评估</div>
	        	<table border="0" cellspacing="0" cellpadding="0" style=" font-size: 15px; border: solid #000; border-width: 1px 0px 0px 1px;">
	        		<tr>
	        			<td class="tableTd" align="center">记录次数</td>
	        			<td class="tableTd" align="center">烦躁次数</td>
	        			<td class="tableTd" align="center">开心次数</td>
	        			<td class="tableTd" align="center">平静次数</td>
	        			<td class="tableTd" align="center">沮丧次数</td>
	        		</tr>
	        		<c:if test="${not empty mentalObj }">
		        		<tr>
		        			<td class="tableTd" align="center">${mentalObj.a5 }</td>
		        			<td class="tableTd" align="center">&nbsp;${mentalObj.a1 }</td>
		        			<td class="tableTd" align="center">&nbsp;${mentalObj.a2 }</td>
		        			<td class="tableTd" align="center">&nbsp;${mentalObj.a3 }</td>
		        			<td class="tableTd" align="center">&nbsp;${mentalObj.a4 }</td>
		        		</tr>
	        		</c:if>
	        		<c:if test="${empty mentalObj }">
		        		<tr>
		        			<td class="tableTd" align="center">&nbsp;</td>
		        			<td class="tableTd" align="center">&nbsp;</td>
		        			<td class="tableTd" align="center">&nbsp;</td>
		        			<td class="tableTd" align="center">&nbsp;</td>
		        			<td class="tableTd" align="center">&nbsp;</td>
		        		</tr>
	        		</c:if>
	        	</table>
	        	<div style="width: 99%; font-size: 14px; height: 60px; line-height: 60px; text-align: left;">综合分析：</div>
	        	<textarea style="width: 99%; height: 150px; border: 1px solid #ccc;" id="mentalAdvice" name="mentalAdvice"></textarea>	
	        	
	        	
	        	<div style="width: 99%; font-size: 14px; height: 60px; line-height: 60px; text-align: left;">4.血压</div>
	        	<table border="0" cellspacing="0" cellpadding="0" style="font-size: 15px; border: solid #000; border-width: 1px 0px 0px 1px;">
	        		<tr>
	        			<td class="tableTd" align="center">测量次数</td>
	        			<td class="tableTd" align="center">正常次数</td>
	        			<td class="tableTd" align="center">舒张压高于正常值次数</td>
	        			<td class="tableTd" align="center">收缩压高于正常值次数</td>
	        			<td class="tableTd" align="center">舒张压低于正常值次数</td>
	        			<td class="tableTd" align="center">收缩压低于正常值次数</td>
	        		</tr>
	        		<c:if test="${not empty pressureFlys }">
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
	        		</c:if>
	        		<c:if test="${empty pressureFlys }">
		        		<tr>
		        			<td class="tableTd" align="center">&nbsp;</td>
		        			<td class="tableTd" align="center">&nbsp;</td>
		        			<td class="tableTd" align="center">&nbsp;</td>
		        			<td class="tableTd" align="center">&nbsp;</td>
		        			<td class="tableTd" align="center">&nbsp;</td>
		        			<td class="tableTd" align="center">&nbsp;</td>
		        		</tr>
	        		</c:if>
	        	</table>
	        	<div style="width: 99%; font-size: 14px; height: 60px; line-height: 60px; text-align: left;">综合分析：</div>
	        	<textarea style="width: 99%; height: 150px; border: 1px solid #ccc;" id="bloodPressureAdvice" name="bloodPressureAdvice"></textarea>	
	        	
	        	
	        	
	        	
	        	<div style="width: 99%; font-size: 14px; height: 60px; line-height: 60px; text-align: left;">5.心率</div>
	        	<table border="0" cellspacing="0" cellpadding="0" style="font-size: 15px; border: solid #000; border-width: 1px 0px 0px 1px;">
	        		<tr>
	        			<td class="tableTd" align="center">测量次数</td>
	        			<td class="tableTd" align="center">正常次数</td>
	        			<td class="tableTd" align="center">偏高次数</td>
	        			<td class="tableTd" align="center">偏低次数</td>
	        		</tr>
	        		<c:if test="${not empty pulseFlys }">
	        			<c:forEach items="${pulseFlys }" var="pulseItem" varStatus="index">
		        		<tr>
		        			<td class="tableTd" align="center">${pulseItem.a1 }</td>
		        			<td class="tableTd" align="center">&nbsp;${pulseItem.a2 }</td>
		        			<td class="tableTd" align="center">&nbsp;${pulseItem.a3 }</td>
		        			<td class="tableTd" align="center">&nbsp;${pulseItem.a4 }</td>
		        		</tr>
	        			</c:forEach>
	        		</c:if>
	        		<c:if test="${empty pulseFlys }">
		        		<tr>
		        			<td class="tableTd" align="center">&nbsp;</td>
		        			<td class="tableTd" align="center">&nbsp;</td>
		        			<td class="tableTd" align="center">&nbsp;</td>
		        			<td class="tableTd" align="center">&nbsp;</td>
		        		</tr>
	        		</c:if>
	        	</table>
	        	<div style="width: 99%; font-size: 14px; height: 60px; line-height: 60px; text-align: left;">综合分析：</div>
	        	<textarea style="width: 99%; height: 150px; border: 1px solid #ccc;" id="heartRateAdvice" name="heartRateAdvice"></textarea>	
	        		
	        		
	        	
	        	<div style="width: 99%; font-size: 14px; height: 60px; line-height: 60px; text-align: left;">6.血糖</div>
	        	<table border="0" cellspacing="0" cellpadding="0" style="font-size: 15px; border: solid #000; border-width: 1px 0px 0px 1px;">
	        		<tr>
	        			<td class="tableTd" align="center">测量次数</td>
	        			<td class="tableTd" align="center">正常次数</td>
	        			<td class="tableTd" align="center">偏高次数</td>
	        			<td class="tableTd" align="center">偏低次数</td>
	        		</tr>
	        		<c:if test="${not empty glucoseFlys }">
	        			<c:forEach items="${glucoseFlys }" var="glucoseItem" varStatus="index">
		        		<tr>
		        			<td class="tableTd" align="center">${glucoseItem.a1 + glucoseItem.a2 }</td>
		        			<td class="tableTd" align="center">&nbsp;${glucoseItem.a1 }</td>
		        			<td class="tableTd" align="center">&nbsp;${glucoseItem.a2 }</td>
		        			<td class="tableTd" align="center">&nbsp;${glucoseItem.a3 }</td>
		        		</tr>
	        			</c:forEach>
	        		</c:if>
	        		<c:if test="${empty glucoseFlys }">
		        		<tr>
		        			<td class="tableTd" align="center">&nbsp;</td>
		        			<td class="tableTd" align="center">&nbsp;</td>
		        			<td class="tableTd" align="center">&nbsp;</td>
		        			<td class="tableTd" align="center">&nbsp;</td>
		        		</tr>
	        		</c:if>
	        	</table>
	        	<div style="width: 99%; font-size: 14px; height: 60px; line-height: 60px; text-align: left;">综合分析：</div>
	        	<textarea style="width: 99%; height: 150px; border: 1px solid #ccc;" id="bloodGlucoseAdvice" name="bloodGlucoseAdvice"></textarea>	
	        	
	        	
	        	
	        	
	        	<div style="width: 99%; font-size: 14px; height: 60px; line-height: 60px; text-align: left;">7.体温</div>
	        	<table border="0" cellspacing="0" cellpadding="0" style="font-size: 15px; border: solid #000; border-width: 1px 0px 0px 1px;">
	        		<tr>
	        			<td class="tableTd" align="center">测量次数</td>
	        			<td class="tableTd" align="center">正常次数</td>
	        			<td class="tableTd" align="center">异常次数</td>
	        		</tr>
	        		<c:if test="${not empty thermometerFlys }">
	        			<c:forEach items="${thermometerFlys }" var="thermometerItem" varStatus="index">
		        		<tr>
		        			<td class="tableTd" align="center">${thermometerItem.a1 }</td>
		        			<td class="tableTd" align="center">&nbsp;${thermometerItem.a2 }</td>
		        			<td class="tableTd" align="center">&nbsp;${thermometerItem.a3 }</td>
		        		</tr>
	        			</c:forEach>
	        		</c:if>
	        		<c:if test="${empty thermometerFlys }">
		        		<tr>
		        			<td class="tableTd" align="center">&nbsp;</td>
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
	        			<td class="tableTd" align="center">用药次数</td>
	        			<td class="tableTd" align="center">平均每次用药</td>
	        			<td class="tableTd" align="center">总用药量</td>
	        		</tr>
	        		<c:if test="${not empty medicineFlys }">
	        			<c:forEach items="${medicineFlys }" var="medicineItem" varStatus="index">
		        		<tr>
		        			<td class="tableTd" align="center">${medicineItem.a }</td>
		        			<td class="tableTd" align="center">&nbsp;${medicineItem.b }</td>
		        			<td class="tableTd" align="center">&nbsp;${medicineItem.c }(${medicineItem.e })</td>
		        			<td class="tableTd" align="center">&nbsp;${medicineItem.d }(${medicineItem.e })</td>
		        		</tr>
	        			</c:forEach>
	        		</c:if>
	        		<c:if test="${empty medicineFlys }">
		        		<tr>
		        			<td class="tableTd" align="center">&nbsp;</td>
		        			<td class="tableTd" align="center">&nbsp;</td>
		        			<td class="tableTd" align="center">&nbsp;</td>
		        			<td class="tableTd" align="center">&nbsp;</td>
		        		</tr>
	        		</c:if>
	        	</table>
	        	<div style="width: 99%; font-size: 14px; height: 60px; line-height: 60px; text-align: left;">综合分析：</div>
	        	<textarea style="width: 99%; height: 150px; border: 1px solid #ccc;" id="medicationAdvice" name="medicationAdvice"></textarea>
	        	
	        	<table width="99%" border="0" cellspacing="0" cellpadding="0" style="font-size: 15px;">
	        		<tr>
	        			<td align="center" style="height: 70px; padding: 20px 0px;">
			        		<ul>
		    					<li class="btn_reguster"><a onclick="funSaveInfo()" style="cursor: pointer;">保存</a></li>
		    				</ul>
	        			</td>
	        		</tr>
	        	</table>		
	        </div>
        </div>
    </div>
</body>
</html>
