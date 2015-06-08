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
	<link rel="stylesheet" href="<c:url value='/patient/themes/index_right.css'/>" type="text/css"/>
	<script type="text/javascript" src="<c:url value='/common/anychart/AnyChart.js'/>" ></script>
  	<script type="text/javascript" src="<c:url value='/common/scripts/highcharts.js'/>"></script>
	<script type="text/javascript">
		var _chart_ = "<c:url value='/common/anychart/AnyChart.swf'/>";
	</script>   

	<style type="text/css">
		td{word-break:break-all;}
		.index_table table#faceTable tr th{
			line-height: normal;
		}
	</style>
	<script type="text/JavaScript">
		$(function(){
		    PageFx.initChart();
		});
		
		var PageFx = {
				Chart1:null,
				Chart2:null,
				Chart3:null,
				stime:DateAdd("d",-15,new Date()).pattern("yyyy-MM-dd 00:00:00"),
				etime:new Date().pattern("yyyy-MM-dd 23:59:59"),
				initChart : function()
				{
					PageFx.Chart1 = new AnyChart(_chart_);
					PageFx.Chart1.wMode = "opaque";
					PageFx.Chart1.width = "100%";
					PageFx.Chart1.height = "100%";
					
					PageFx.Chart2 = new AnyChart(_chart_);
					PageFx.Chart2.wMode = "opaque";
					PageFx.Chart2.width = "100%";
					PageFx.Chart2.height = "100%";
					
					PageFx.Chart3 = new AnyChart(_chart_);
					PageFx.Chart3.wMode = "opaque";
					PageFx.Chart3.width = "100%";
					PageFx.Chart3.height = "100%";
					
					PageFx.funSearchAdvice("/p/query/homeAdvice.do", {adviceType:1});
					PageFx.funSearchAdvice("/p/query/homeAdvice.do", {adviceType:2});
					PageFx.funSearchAdvice("/p/query/homeAdvice.do", {adviceType:3});
					PageFx.funSearchAdvice("/p/query/homeAdvice.do", {adviceType:4});
					
					PageFx.funSearch(0, "/p/query/statBlood.do");
					PageFx.funSearch(1, "/p/query/statEar.do");
					PageFx.funSearch(2, "/p/query/statPressure.do");
					
					PageFx.funSearchAdvice15("/p/query/homeAdvice15.do", {adviceType:1});
					PageFx.funSearchAdvice15("/p/query/homeAdvice15.do", {adviceType:2});
					PageFx.funSearchAdvice15("/p/query/homeAdvice15.do", {adviceType:3});
					PageFx.funSearchAdvice15("/p/query/homeAdvice15.do", {adviceType:4});
					
					
				},
				funSearchAdvice15 : function(paramUrl, paramData)
				{
					$.ajax({
						url : _ctx_ + paramUrl + '?a='+ Math.random(),
						type : 'post',
						dataType : 'json',
						data : paramData,
						error:function(data)
						{
							
						},
						success:function(data)
						{
							if(data.total > 0)
							{
								var tmp = "";
								for(var nItem=0; nItem<data.total; nItem++)
								{
									if(tmp != "")
									{
										tmp +="</br>";
									}	
									tmp += (nItem + 1) + "、" + data.rows[nItem].b;
								}	
								$("#advice15"+paramData.adviceType).html(tmp);
							}	
						}
					});
				},
				funSearchAdvice : function(paramUrl, paramData)
				{
					$.ajax({
						url : _ctx_ + paramUrl + '?a='+ Math.random(),
						type : 'post',
						dataType : 'json',
						data : paramData,
						error:function(data)
						{
							
						},
						success:function(data)
						{
							if(data != null)
							{
								$("#advice"+paramData.adviceType).html(data.b);
							}	
						}
					});
				},
				funSearch : function(paramType, paramUrl)
				{
					$.ajax({
						url : _ctx_ + paramUrl + '?a='+ Math.random(),
						type : 'post',
						dataType : 'json',
						data : 
						{
							"startTime"	: PageFx.stime,
							"endTime"	: PageFx.etime
						},
						error:function(data)
						{
							
						},
						success:function(data)
						{
							if(paramType == 1)
							{
								PageFx.showEarChart(data);
							}		
							else if(paramType == 0)
							{
								PageFx.showBloodChart(data);
							}
							else if(paramType == 2)
							{
								PageFx.showBloodPressureChart(data);
							}	
						}
					});
				},
				showBloodPressureChart : function(data)
				{
					var myParamObj = {
						mTopFlag	: true,
						mTopTitle	: '血压等级分析图',
						mLabelFormat: '{%Name}\n{%SeriesName}: {%YValue}{numDecimals:2}(mmol/L)',
						mYtitle		: '高压/低压/心率(mmHg)',
						mYFlag		: true,
						mChartType  : 'Spline', 
						mFormateYTip: '{%Value}{numDecimals:2}',
						mViewData 	: ''
					};
					var mViewData1 = '<series name="高压值">';
					var mViewData2 = '<series name="低压值">';
					var mViewData3 = '<series name="心率">';
					if(data.total > 0)
					{
						for(var nItem=0; nItem<data.total; nItem++)
						{
							mViewData1 += '<point name="'+data.rows[nItem].a+'" y="'+data.rows[nItem].a1+'"/>';
							mViewData2 += '<point name="'+data.rows[nItem].a+'" y="'+data.rows[nItem].a2+'"/>';
							mViewData3 += '<point name="'+data.rows[nItem].a+'" y="'+data.rows[nItem].a3+'"/>';
						}
						
					}
					mViewData1 += '</series>';
					mViewData2 += '</series>';
					mViewData3 += '</series>';
					myParamObj.mViewData = mViewData1 + mViewData2 + mViewData3;
					try{
					PageFx.funChart(PageFx.Chart3, "container3", "/patient/pages/chart2", myParamObj);
					}catch(e){}
				},
				showBloodChart : function(data)
				{
					$('#container1').highcharts({
				        chart: {
				            type: 'spline'
				        },
				        title: {
				            text: '血糖等级分析图',
				            style:{ "color": "#000000", "fontSize": "12px" }
				        },
				        xAxis: {
				            type: 'datetime',
				            labels: { 
				            	formatter: function() { 
				            	var vDate=new Date(this.value); 
				            	return  vDate.getFullYear()+"-"+(vDate.getMonth()+1)+"-"+vDate.getDate() + " " +vDate.getHours() + ":" + vDate.getMinutes();
				            	},
				            	rotation:-15//日期倾斜角度  vDate.getFullYear()+"-"+
				            	}
				            
				        },
				        yAxis: {
				            title: {
				                text: '空腹/饭后(mmol/L)'
				            },
				            min: 0
				        },
				        tooltip: {
				            formatter: function() {
				                    return '<b>'+ this.series.name +'</b><br/>'+
				                         Highcharts.dateFormat('%Y-%m-%d %H:%M',this.x) +': '+ this.y +' (mmol/L)';
				            }
				        },
				        
				        series: [{
				            name: '空腹',
				            data: function(){
				            	var dataFlys = []
				            	for(var nItem=0; nItem<data.total; nItem++)
								{
									if(data.rows[nItem].takeTime1 != "" && data.rows[nItem].takeTime1 != "null" && data.rows[nItem].takeTime1 != null)
									{
										var tmpFly = data.rows[nItem].takeTime1.split("-").join(":").split(" ").join(":").split(":")
										dataFlys.push([Date.UTC(parseInt(tmpFly[0]),  parseInt(tmpFly[1]) - 1, parseInt(tmpFly[2]), parseInt(tmpFly[3]), parseInt(tmpFly[4])), parseFloat((parseFloat(data.rows[nItem].bloodGlucose1)/10).toFixed(1))])
									}	
								}	
				            	return dataFlys;
				            }()
				        }, {
				            name: '饭后',
				            data: function(){
				            	var dataFlys = []
				            	for(var nItem=0; nItem<data.total; nItem++)
								{
									if(data.rows[nItem].takeTime2 != "" && data.rows[nItem].takeTime2 != "null" && data.rows[nItem].takeTime2 != null)
									{
										var tmpFly = data.rows[nItem].takeTime2.split("-").join(":").split(" ").join(":").split(":")
										dataFlys.push([Date.UTC(parseInt(tmpFly[0]),  parseInt(tmpFly[1]) - 1, parseInt(tmpFly[2]), parseInt(tmpFly[3]), parseInt(tmpFly[4])), parseFloat((parseFloat(data.rows[nItem].bloodGlucose2)/10).toFixed(1))])
									}	
								}	
				            	return dataFlys;
				            }()
				        }]
				    });
				},
				showBloodChart2 : function(data)
				{
					var myParamObj = {
						mTopFlag	: true,
						mTopTitle	: '血糖等级分析图',
						mLabelFormat: '{%Name}\n{%SeriesName}: {%YValue}{numDecimals:2}(mmol/L)',
						mYtitle		: '空腹/饭后(mmol/L)',
						mYFlag		: true,
						mChartType  : 'Spline', 
						mFormateYTip: '{%Value}{numDecimals:2}',
						mViewData 	: ''
					};
					var mViewData1 = '<series name="空腹">';
					var mViewData2 = '<series name="饭后">';
					if(data.total > 0)
					{
						for(var nItem=0; nItem<data.total; nItem++)
						{
							if(data.rows[nItem].takeTime1 != "" && data.rows[nItem].takeTime1 != "null" && data.rows[nItem].takeTime1 != null)
							{
								mViewData1 += '<point name="'+data.rows[nItem].takeTime1+'" y="'+(parseFloat(data.rows[nItem].bloodGlucose1)/10).toFixed(2)+'"/>';
							}	
							if(data.rows[nItem].takeTime2 != "" && data.rows[nItem].takeTime2 != "null" && data.rows[nItem].takeTime2 != null)
							{
								mViewData2 += '<point name="'+data.rows[nItem].takeTime2+'" y="'+(parseFloat(data.rows[nItem].bloodGlucose2)/10).toFixed(2)+'"/>';
							}
						}	
					}
					mViewData1 += '</series>';
					mViewData2 += '</series>';
					myParamObj.mViewData = mViewData1 + mViewData2;
					try{
					PageFx.funChart(PageFx.Chart1, "container4", "/patient/pages/chart2", myParamObj);
					}catch(e){}
				},
				showEarChart : function(data)
				{
					var myParamObj = {
						mTopFlag	: true,
						mTopTitle	: '近期体温分析图',	
						mLabelFormat: '{%Name}\n{%SeriesName}: {%YValue}{numDecimals:1}(°C)',
						mYtitle		: '体温(°C)',
						mYFlag		: true,
						mChartType  : 'Spline', 
						mFormateYTip: '{%Value}{numDecimals:1}',
						
						mViewData 	: ''
					};
					var mViewData = '<series name="体温">';
					if(data.total > 0)
					{
						for(var nItem=0; nItem<data.total; nItem++)
						{
							mViewData += '<point name="'+data.rows[nItem].stime+'" y="'+(parseFloat(data.rows[nItem].value)/10).toFixed(2)+'"/>';
						}	
					}
					mViewData += '</series>'
					myParamObj.mViewData = mViewData;
					try{
					PageFx.funChart(PageFx.Chart2, "container2", "/patient/pages/chart2", myParamObj);
					}catch(e){}
				},
				funChart : function(mObj, paramId, paramUrl, paramObj)
				{
					$.ajax({
						type : "POST",
						url  : _ctx_ + paramUrl +".jsp",
						async : false,
						cache : false,
						success:function(data)
						{
							var viewData = data;
							for (prop in paramObj)
							{
								viewData = viewData.replace(eval("/"+prop+"/g"), paramObj[prop]);
							}
							mObj.setData(viewData);
							mObj.write(paramId);
						}
					});	
				},
			};
	</script>
  </head>
<body>
	<div class="index_welcome">
		<div class="index_welcome_header">
	      <div class="notice">
	        <ul>
	          <li class="tgreen_notice">健康通告</li>
	          <li class="tgrey_notice">Announcement</li>
	        </ul>
	      </div>
	      <div class="health_tip">
	        <ul>
	          <li class="tgreen_notice"></li>
	          <li class="tgrey_notice"></li>
	        </ul>
	      </div>
	    </div>
		
		
		<div class="index_welcome_main">
			<div class="health_date" style="height: 230px;">
				<ul>
		         <li class="tgreen_healthDate"><span class="tgrey_healthDate">健康</span>状况</li>
		         <li class="bloodPressure_alarm">
		           <ul>
		             <li class="tblack_date" id="last_bloodpressure">${homeBase.b }<span class="tblack_datemin">mmol/L</span></li>
		             <li class="tgrey_time" id="last_bloodpressure_time">最近一次空腹血糖值（${homeBase.a }）</li>
		           </ul>
		         </li>
		         <li class="bloodPressure_alarm">
		           <ul>
		             <li class="tblack_date" id="last_bloodalert">${homeBase.d }<span class="tblack_datemin">mmol/L</span></li>
		             <li class="tgrey_time" id="last_bloodalert_time">最近一次饭后血糖值（${homeBase.c }）</li>
		           </ul>
		         </li>
		         <li class="heartRate_date">
		           <ul>
		             <li class="tblack_date" id="last_heartrate">${homeBase.f }<span class="tblack_datemin">°C</span></li>
		             
		             <li class="tgrey_time" id="last_heartrate_time">最近一次体温值（${homeBase.e }）</li>
		             
		           </ul>
		         </li>
		         <li class="bloodPressure_date">
		           <ul>
		             <li class="tblack_date" id="last_bloodalert">${homeBase.h}<span class="tblack_datemin">mmHg</span></li>
		             <li class="tgrey_time" id="last_bloodalert_time">最近一次血压记录（${homeBase.g}）</li>
		           </ul>
		         </li>
		       </ul>
	       </div>
	       
	       
	       <div class="bpDiagnosis_results" id="doctorAdvice" style="display:block;margin-top:8px">
	       		<div style="text-align: left;width:100%;color:#0ca7a1;font:18px/30px '微软雅黑'; font-weight: bolder;">最新医嘱</div>
	       		<div class="bpDiagnosis_results_text" style="font-size: 12px;width: 100%;">
					<ul id="advice">
						<li class="tgreen_results" style="font-size: 16px; padding-left:20px">用药建议：</li>
						<li class="tblack_results" style="font-size: 13px; padding-left:30px" id="advice1">暂无</li>
						
						<li class="tgreen_results" style="font-size: 16px; padding-left:20px">饮食建议：</li>
						<li class="tblack_results" style="font-size: 13px; padding-left:30px" id="advice2">暂无</li>
						
						<li class="tgreen_results" style="font-size: 16px; padding-left:20px">运动建议：</li>
						<li class="tblack_results" style="font-size: 13px; padding-left:30px" id="advice3">暂无</li>
						
						<li class="tgreen_results" style="font-size: 16px; padding-left:20px">就诊建议：</li>
	         			<li class="tblack_results" style="font-size: 13px; padding-left:30px" id="advice4">暂无</li>
					</ul>
				</div>
		  	</div>
		  	
		  	
		  	 <div class="bpDiagnosis_results"  style="display:block;margin-top:8px">
		  	 	<div class="bpDiagnosis_results_trendChart" style="width: 630px;" id="container1"></div> 
		  	 </div>
		  	 <div class="bpDiagnosis_results"  style="display:block;margin-top:8px">
		  	 	<div class="bpDiagnosis_results_trendChart" style="width: 630px;" id="container3"></div> 
		  	 </div>
		  	 <div class="bpDiagnosis_results"  style="display:block;margin-top:8px">
		  	 	<div class="bpDiagnosis_results_trendChart" style="width: 630px;" id="container2"></div> 
		  	 </div>
		  	 
		  	 
		  	  <div class="bpDiagnosis_results" id="doctorAdvice" style="display:block;margin-top:8px">
	       		<div style="text-align: left;width:100%;color:#0ca7a1;font:18px/30px '微软雅黑'; font-weight: bolder;">最近15天的医嘱</div>
	       		<div class="bpDiagnosis_results_text" style="font-size: 12px;width: 100%;">
					<ul id="advice">
						<li class="tgreen_results" style="font-size: 16px; padding-left:20px">用药建议：</li>
						<li class="tblack_results" style="font-size: 13px; padding-left:30px" id="advice151">暂无</li>
						
						<li class="tgreen_results" style="font-size: 16px; padding-left:20px">饮食建议：</li>
						<li class="tblack_results" style="font-size: 13px; padding-left:30px" id="advice152">暂无</li>
						
						<li class="tgreen_results" style="font-size: 16px; padding-left:20px">运动建议：</li>
						<li class="tblack_results" style="font-size: 13px; padding-left:30px" id="advice153">暂无</li>
						
						<li class="tgreen_results" style="font-size: 16px; padding-left:20px">就诊建议：</li>
	         			<li class="tblack_results" style="font-size: 13px; padding-left:30px" id="advice154">暂无</li>
					</ul>
				</div>
		  	</div>
		</div>
	</div>
</body>
</html>
