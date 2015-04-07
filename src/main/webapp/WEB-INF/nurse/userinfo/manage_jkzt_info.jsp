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
			var chart1 = new AnyChart(_chart_, _chart_);
		    chart1.width = "100%";
	        chart1.height = "100%";
	        chart1.setXMLFile("<c:url value='/patient/pages/config1.xml'/>");
		    chart1.write("container1");
			
		    var chart2 = new AnyChart(_chart_, _chart_);
		    chart2.width = "100%";
	        chart2.height = "100%";
	        chart2.setXMLFile("<c:url value='/patient/pages/config2.xml'/>");
		    chart2.write("container2");
		    
		    var chart3 = new AnyChart(_chart_, _chart_);
		    chart3.width = "100%";
	        chart3.height = "100%";
	        chart3.setXMLFile("<c:url value='/patient/pages/config3.xml'/>");
		    chart3.write("container3");
		});
		
		
	</script>
  </head>
<body>
	<div class="index_welcome" style="margin: 0 auto;">
		<div class="index_welcome_main">
			<div class="health_date">
				<ul>
		         <li class="tgreen_healthDate"><span class="tgrey_healthDate">健康</span>状况</li>
		         <li class="bloodPressure_date">
		           <ul>
		             <li class="tblack_date" id="last_bloodpressure">132/92<span class="tblack_datemin">mmHg</span></li>
		             <li class="tgrey_time" id="last_bloodpressure_time">最近一次血压值（2015-03-23 18:53:26）</li>
		           </ul>
		         </li>
		         <li class="bloodPressure_alarm">
		           <ul>
		             <li class="tblack_date" id="last_bloodalert">132/92<span class="tblack_datemin">mmHg</span></li>
		             <li class="tgrey_time" id="last_bloodalert_time">血压异常记录（2015-03-23 18:53:26）</li>
		           </ul>
		         </li>
		         <li class="heartRate_date">
		           <ul>
		             <li class="tblack_date" id="last_heartrate">75<span class="tblack_datemin">bpm</span></li>
		             
		             <li class="tgrey_time" id="last_heartrate_time">最近一次脉率值（2015-03-23 18:53:26）</li>
		             
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
		  	 	<div class="bpDiagnosis_results_trendChart" style="width: 310px;" id="container1"></div> 
       			<div class="bpDiagnosis_results_trendChart"  id="container2" style="padding-left: 10px; width:310px; "></div>
		  	 </div>
		  	 <div class="bpDiagnosis_results"  style="display:block;margin-top:8px">
		  	 	<div class="bpDiagnosis_results_trendChart" style="width: 310px;" id="container3"></div> 
       			<div class="bpDiagnosis_results_trendChart"  id="container4" style="padding-left: 10px; width:310px; "></div>
		  	 </div>
		</div>
	</div>
</body>
</html>
