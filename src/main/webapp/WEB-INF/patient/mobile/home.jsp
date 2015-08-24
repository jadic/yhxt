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
	<%@ include file="/WEB-INF/patient/common/mobile-include.jsp"%>
	<link rel="stylesheet" href="<c:url value='/patient/themes/index_right.css'/>" type="text/css"/>
	<%@ include file="/WEB-INF/patient/common/easyui-include.jsp"%>
	<script type="text/javascript" src="<c:url value='/common/anychart/AnyChart.js'/>" ></script>
  	<script type="text/javascript" src="<c:url value='/common/scripts/highcharts.js'/>"></script>
	<script type="text/javascript">
		var _chart_ = "<c:url value='/common/anychart/AnyChart.swf'/>";
	</script>  
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
	<header id="header">首页</header>
	<div id="content">
		<div class="index_welcome_header" style="width: 100%; margin-bottom: 10px;">
	      <div class="notice">
	        <ul>
	          <li class="tgreen_notice">健康通告</li>
	          <li class="tgrey_notice">Announcement</li>
	        </ul>
	      </div>
	    </div>
	
		<ul class="list">
        <li class="activeable list-item" data-positionid="157429" data-companyid="17751">
            <img src="<c:url value='/patient/themes/images/bpAlarm.png'/>" class="item-logo">
            <div class="item-desc">
            	<div style="float: left;">
            		<div style="font: 13px/18px '微软雅黑'; line-height:32px;  color: #aeaeae;">
	                   最近一次空腹血糖值
	                </div>
	                <div class="item-time" style="line-height: 30px;">${homeBase.a }</div>
            	</div>
            	<div style="float: right; line-height: 60px;">
                    <span style="font: 30px/30px Georgia;   height: 32px;  color: #5a5a5a;">${homeBase.b }</span>
                	<span style="font-size: 14px;">mmol/L</span>
               	</div>
            </div>
        </li>
    
        <li class="activeable list-item" data-positionid="435359" data-companyid="17751">
            <img src="<c:url value='/patient/themes/images/bpAlarm.png'/>" class="item-logo">
            <div class="item-desc">
            	<div style="float: left;">
            		<div style="font: 13px/18px '微软雅黑'; line-height:32px;  color: #aeaeae;">
	                  最近一次饭后血糖值
	                </div>
	                <div class="item-time" style="line-height: 30px;">${homeBase.c }</div>
            	</div>
            	<div style="float: right; line-height: 60px;">
                    <span style="font: 30px/30px Georgia;   height: 32px;  color: #5a5a5a;">${homeBase.d }</span>
                	<span style="font-size: 14px;">mmol/L</span>
               	</div>
            </div>
        </li>
    
        <li class="activeable list-item" data-positionid="163357" data-companyid="4128">
            <img src="<c:url value='/patient/themes/images/heart.png'/>" class="item-logo">
            <div class="item-desc">
            	<div style="float: left;">
            		<div style="font: 13px/18px '微软雅黑'; line-height:32px;  color: #aeaeae;">
	                  最近一次体温值
	                </div>
	                <div class="item-time" style="line-height: 30px;">${homeBase.e }</div>
            	</div>
            	<div style="float: right; line-height: 60px;">
                    <span style="font: 30px/30px Georgia;   height: 32px;  color: #5a5a5a;">${homeBase.f }</span>
                	<span style="font-size: 14px;">°C</span>
               	</div>
            </div>
        </li>
    
        <li class="activeable list-item" data-positionid="210492" data-companyid="4128">
            <img src="<c:url value='/patient/themes/images/blood_pressure.png'/>" class="item-logo">
            <div class="item-desc">
            	<div style="float: left;">
            		<div style="font: 13px/18px '微软雅黑'; line-height:32px;  color: #aeaeae;">
	                  最近一次血压记录
	                </div>
	                <div class="item-time" style="line-height: 30px;">${homeBase.g }</div>
            	</div>
            	<div style="float: right; line-height: 60px;">
                    <span style="font: 30px/30px Georgia;  height: 32px;  color: #5a5a5a;">${homeBase.h }</span>
                	<span style="font-size: 14px;">mmHg</span>
               	</div>
            </div>
        </li>
    
        <li class="activeable list-item" data-positionid="547772" data-companyid="3112">
             <div class="bpDiagnosis_results" id="doctorAdvice" style="display:block; margin-top:8px; width: 100%; padding: 0px;">
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
        </li>
    
        <li class="activeable list-item" data-positionid="553338" data-companyid="3112">
            <div class="bpDiagnosis_results"  style="display:block; margin-top:8px; width: 100%; padding: 0px;">
		  	 	<div class="bpDiagnosis_results_trendChart" style="width: 100%;" id="container1"></div> 
		  	 </div>
		  	 <div class="bpDiagnosis_results"  style="display:block;margin-top:8px; width: 100%; padding: 0px;">
		  	 	<div class="bpDiagnosis_results_trendChart" style="width: 100%;" id="container3"></div> 
		  	 </div>
		  	 <div class="bpDiagnosis_results"  style="display:block;margin-top:8px; width: 100%; padding: 0px;">
		  	 	<div class="bpDiagnosis_results_trendChart" style="width: 100%;" id="container2"></div> 
		  	 </div>
        </li>
    
        <li class="activeable list-item" data-positionid="1018793" data-companyid="78540">
           <div class="bpDiagnosis_results" id="doctorAdvice" style="display:block;margin-top:8px; width: 100%; padding: 0px;">
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
        </li>
        </ul>
	</div>
	<footer id="footer">
		<footer id="footer">
		<jsp:include page="/WEB-INF/patient/common/footer-include.jsp">
			<jsp:param value="0" name="selected"/>
		</jsp:include>
	</footer>
	</footer>
</body>
</html>
