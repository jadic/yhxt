<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/patient/common/taglibs-include.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
  	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />  
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
		.Wdate{
			height: 28px;
			width:170px;
  			border: 1px solid #aeaeae;
		}
		.search {
		  width: 100%;
		  padding: 3px 0;
		  background: #f7f7f7;
		  float: left;
		  margin-top: 10px;
		   margin-bottom: 10px;
		}
	</style>
	<script type="text/javascript" src="<c:url value='/common/scripts/highcharts.js'/>"></script>
	
	<script type="text/javascript">
		$(function(){
			$("#stime").val(DateAdd("h",-7,new Date()).pattern("yyyy-MM-dd HH:mm:ss"));
			$("#etime").val(new Date().pattern("yyyy-MM-dd HH:mm:ss"));
			$(".account_titleGray").css("width", $(".account_title").width()-130);
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
				PageMobile.funLoadIng();
				$.ajax({
					url : _ctx_ + '/p/query/statEar.do?a='+ Math.random(),
					type : 'post',
					dataType : 'json',
					data : 
					{
						"startTime"	: $("#stime").val(),
						"endTime"	: $("#etime").val()
					},
					error:function(data)
					{
						PageMobile.funLoadHidden();
					},
					success:function(data)
					{
						PageMobile.funLoadHidden();
						PageFx.showChart(data);
					}
				});
			},
			showChart : function(data)
			{
				$('#container').css("height", $(window).height()-$(".search").height());
				$('#container').highcharts({
			        title: {
			        	text: '体温等级分析图',
			            style:{ "color": "#000000", "fontSize": "12px" }
			        },
			        subtitle: {
			            text: '',
			            x: -20
			        },
			        xAxis: {
			        	categories: function() { 
			            		var dataFlys = []
				            	for(var nItem=0; nItem<data.total; nItem++)
								{
				            		dataFlys.push(data.rows[nItem].stime)
								}	
				            	return dataFlys;
			            	}(),
			        },
			        yAxis: {
			            title: {
			                text: '体温(°C)'
			            },
			            plotLines: [{
			                value: 0,
			                width: 1,
			                color: '#808080'
			            }]
			        },
			        tooltip: {
			            valueSuffix: '°C'
			        },
			        series: [{
			        	name: '体温',
			            data: function(){
			            	var dataFlys = []
			            	for(var nItem=0; nItem<data.total; nItem++)
							{
			            		dataFlys.push(parseFloat((parseFloat(data.rows[nItem].value)/10).toFixed(2)))
							}	
			            	return dataFlys;
			            }()
			        }]
			    });
			},
			showChart2 : function(data)
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
				PageFx.funChart(PageFx.Chart1, "container", "/patient/pages/chart3", myParamObj);
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
 <body style="padding: 0px; margin: 0px">
  	<header id="header">
  		体温信息
  		<div class="left"><a href="javascript:void(0)" onclick="PageMobile.funLoadIng();window.history.back()"><span class="corner"></span></a></div>
  	</header>
  	<div id="content">
	  	<div class="search" style="width: 100%;">
    		<form id="inputform" name="inputform" action="<c:url value='/p/query/device.do'/>" method="post">
			     <table border="0" cellspacing="0" cellpadding="0" style="width:100%; font-size: 15px;">
			    	<tr>
			    		<td align="center" style="width:100px; height: 40px; color: #aeaeae; font-size: 18px;">
		    				开始时间：
		    			</td>
			    		<td>
			    			<input class="inputMin_informationModify text-input"  style="height: 35px; font-size: 18px; width: 80%;" type="date" id="stime"  maxlength="16">
			    		</td>
			    	</tr>
			    	</tr>	
			    		<td align="center" style="width:100px; height: 40px; color: #aeaeae; font-size: 18px;">
		    				结束时间：
		    			</td>
			    		<td>
			    			<input class="inputMin_informationModify text-input"  style="height: 35px; font-size: 18px; width: 80%;" type="date" id="etime"  maxlength="16">
			    		</td>
			    	</tr>
			    	</tr>	
			    		<td colspan="2" align="center" style="height: 50px;">
				    		<ul>
				    			<li class="btn_search" style="float: none;"><a href="javascript:void(0)" id="btnsearch" onclick="PageFx.funSearch()">查询</a></li>
			    		</ul>
			    		</td>
			    	</tr>
			    </table>
			</form>    
		</div>
	
	<table id="table_footer" cellpadding="0" cellspacing="0" style="width: 100%; overflow: hidden; background: #f7f7f7;" border="0" >
		<tr>
			<td style="padding: 10px;">
				<div id="container" ></div>
			</td>
		</tr>
	</table>
	</div>
	
	<footer id="footer">
		<footer id="footer">
		<jsp:include page="/WEB-INF/patient/common/footer-include.jsp">
			<jsp:param value="1" name="selected"/>
		</jsp:include>
	</footer>
  </body>
</html>