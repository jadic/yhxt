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
		
		function queryStart()
		{
			$("#inputform").submit();
		}
		
		function buyinfo(obj, id)
		{
			PageMain.funOpenProgress();
			$.ajax({
				url : _ctx_ + "/p/query/buyService.do?a="+ Math.random(),
				type : 'post',
				dataType : 'json',
				data : 
				{
					"id": id
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
						$(obj).parent().html('<span style="color: #2998df; font-weight: bold;">已购买</span>');
						$.messager.alert('信息提示', data.msg, 'info');
					}
					else
					{
						$.messager.alert('信息提示', data.msg, 'error');
					}
				}
			});
		}
		
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
					PageFx.Chart3.setXMLFile("<c:url value='/patient/pages/config3.xml'/>");
					PageFx.Chart3.write("container3");
					
					PageFx.funSearch(0, "/p/query/statBlood.do");
					PageFx.funSearch(1, "/p/query/statEar.do");
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
						}
					});
				},
				showBloodChart : function(data)
				{
					var myParamObj = {
						mLabelFormat: '{%YValue}{numDecimals:2}',
						mYtitle		: '升缩压/舒张压(mmHg)',
						mChartType  : 'Spline', 
						mFormateTip : '{%YValue}{numDecimals:2}',
						mFormateXTip: '{%Value}{numDecimals:2}',
						mViewData 	: ''
					};
					var mViewData1 = '<series name="空腹">';
					var mViewData2 = '<series name="饭后">';
					if(data.total > 0)
					{
						for(var nItem=0; nItem<data.total; nItem++)
						{
							mViewData1 += '<point name="'+data.rows[nItem].stime+'" y="'+(parseFloat(data.rows[nItem].value)/10).toFixed(2)+'"/>';
							mViewData2 += '<point name="'+data.rows[nItem].stime+'" y="'+(parseFloat(data.rows[nItem].type)/10).toFixed(2)+'"/>';
						}	
					}
					mViewData1 += '</series>';
					mViewData2 += '</series>';
					myParamObj.mViewData = mViewData1 + mViewData2;
					try{
					PageFx.funChart(PageFx.Chart1, "container1", "/patient/pages/chart2", myParamObj);
					}catch(e){}
				},
				showEarChart : function(data)
				{
					var myParamObj = {
						mLabelFormat: '{%YValue}{numDecimals:2}',
						mYtitle		: '体温(°C)',
						mChartType  : 'Spline', 
						mFormateTip : '{%YValue}{numDecimals:2}',
						mFormateXTip: '{%Value}{numDecimals:2}',
						
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
					PageFx.funChart(PageFx.Chart2, "container2", "/patient/pages/chart3", myParamObj);
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
			<div class="health_date">
				<ul>
		         <li class="tgreen_healthDate"><span class="tgrey_healthDate">健康</span>状况</li>
		         <li class="bloodPressure_date">
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
		         <li class="bloodPressure_alarm">
		           <ul>
		             <li class="tblack_date" id="last_bloodalert">132/92<span class="tblack_datemin">mmHg</span></li>
		             <li class="tgrey_time" id="last_bloodalert_time">血压异常记录（2015-03-23 18:53:26）</li>
		           </ul>
		         </li>
		       </ul>
	       </div>
	       
	       
	       <div class="bpDiagnosis_results" id="doctorAdvice" style="display:block;margin-top:8px">
	       		<div style="text-align: left;width:100%;color:#0ca7a1;font:18px/30px '微软雅黑'; font-weight: bolder;">最新医嘱</div>
	       		<div class="bpDiagnosis_results_text" style="font-size: 12px;width: 100%;">
					<ul id="advice">
						<li class="tgreen_results" style="font-size: 16px; padding-left:20px">测压目标：</li>
						<li class="tblack_results" style="font-size: 13px; padding-left:30px" id="goal">暂无</li>
						
						<li class="tgreen_results" style="font-size: 16px; padding-left:20px">测压方案：</li>
						<li class="tblack_results" style="font-size: 13px; padding-left:30px" id="plan">暂无</li>
						
						<li class="tgreen_results" style="font-size: 16px; padding-left:20px">用药推荐：</li>
						<li class="tblack_results" style="font-size: 13px; padding-left:30px" id="medicine">暂无</li>
						
						<li class="tgreen_results" style="font-size: 16px; padding-left:20px">保健建议：</li>
	         			<li class="tblack_results" style="font-size: 13px; padding-left:30px" id="suggestion">暂无</li>
					</ul>
				</div>
		  	</div>
		  	
		  	
		  	 <div class="bpDiagnosis_results"  style="display:block;margin-top:8px">
		  	 	<div class="bpDiagnosis_results_trendChart" style="width: 630px;" id="container1"></div> 
		  	 </div>
		  	 <div class="bpDiagnosis_results"  style="display:block;margin-top:8px">
		  	 	<div class="bpDiagnosis_results_trendChart" style="width: 630px;" id="container2"></div> 
		  	 </div>
		  	 <div class="bpDiagnosis_results"  style="display:block;margin-top:8px">
		  	 	<div class="bpDiagnosis_results_trendChart" style="width: 630px;" id="container3"></div> 
		  	 </div>
		</div>
	</div>
</body>
</html>
