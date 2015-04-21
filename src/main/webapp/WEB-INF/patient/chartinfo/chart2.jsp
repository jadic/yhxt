<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/patient/common/taglibs-include.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
  	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />  
    <title>自已人健康服务中心</title>
    <%@ include file="/WEB-INF/patient/common/top-include.jsp"%>
	<script type="text/javascript" src="<c:url value='/common/anychart/AnyChart.js'/>" ></script>
	<style>
		.Wdate{
			height: 28px;
			width:170px;
  			border: 1px solid #aeaeae;
		}
	</style>
	<script type="text/javascript">
		var _chart_ = "<c:url value='/common/anychart/AnyChart.swf'/>";
		$(function(){
			$("#stime").val(DateAdd("d",-7,new Date()).pattern("yyyy-MM-dd"));
			$("#etime").val(new Date().pattern("yyyy-MM-dd"));
			$(".account_titleGray").css("width", $(".account_title").width()-130);
			/*
			var chart1 = new AnyChart(_chart_, _chart_);
		    chart1.width = "100%";
	        chart1.height = $(window).height()-$(".search").height()-110;
	        chart1.setXMLFile("<c:url value='/patient/pages/chart2.xml'/>");
		    chart1.write("container1");
		    */
			PageFx.initChart();
			PageFx.funSearch();
		});
		
		var PageFx = {
			Chart1:null,	
			initChart : function()
			{
				PageFx.Chart1 = new AnyChart(_chart_);
				PageFx.Chart1.wMode = "opaque";
				PageFx.Chart1.width = "100%";
				PageFx.Chart1.height = $(window).height()-$(".search").height()-110;
			},
			funSearch : function()
			{
				$.ajax({
					url : _ctx_ + '/p/query/statBlood.do?a='+ Math.random(),
					type : 'post',
					dataType : 'json',
					data : 
					{
						"startTime"	: $("#stime").val() + " 00:00:00",
						"endTime"	: $("#etime").val() + " 23:59:59"
					},
					error:function(data)
					{
						
					},
					success:function(data)
					{
						PageFx.showChart(data);
					}
				});
			},
			showChart : function(data)
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
  <body style="padding: 0px; margin: 0px; overflow: hidden;">
  	<div class="account" style="background: #ffffff; width: 100%; margin: 0px 5px 0px 5px">
		<div class="account_title" style="background: #ffffff; width: 100%;">
	      <ul>
	        <li class="account_titleGreen">血糖信息</li>
	        <li class="account_titleGray" style="padding-top: 8px; height: 35px;"></li>
	      </ul>
	    </div>
	</div>   
  	<div class="search" style="width: 100%; padding: 10px 20px; margin-bottom: 10px;">
    	<form id="inputform" name="inputform" action="<c:url value='/p/query/device.do'/>" method="post">
		    <table width="100%" border="0" cellspacing="0" cellpadding="0" style="display: block; font-size: 15px;">
		    	<tr>
		    		<td align="right" style="padding: 5px 5px 5px 0; width:70px; height: 30px; color: #aeaeae; font-size: 13px;">
	    				开始时间：
	    			</td>
		    		<td>
		    			<input class="inputMin_informationModify text-input Wdate"  onclick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})" type="text" id="stime"  maxlength="16">
		    		</td>
		    		<td align="right" style="padding: 5px 5px 5px 30px; width:70px; height: 30px; color: #aeaeae; font-size: 13px;">
	    				结束时间：
	    			</td>
		    		<td>
		    			<input class="inputMin_informationModify text-input Wdate"  onclick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})" type="text" id="etime"  maxlength="16">
		    		</td>
		    		<td>
			    		<ul>
			    			<li class="btn_search"><a href="javascript:void(0)" id="btnsearch" onclick="PageFx.funSearch()">查询</a></li>
			    		</ul>
		    		</td>
		    	</tr>
		    </table>
		</form>    
		</div>
	
	<table id="table_footer" cellpadding="0" cellspacing="0" style="width: 100%; overflow: hidden; background: #f7f7f7;" border="0" >
		<tr>
			<td style="padding: 10px;">
				<div id="container1" ></div>
			</td>
		</tr>
	</table>
  </body>
</html>