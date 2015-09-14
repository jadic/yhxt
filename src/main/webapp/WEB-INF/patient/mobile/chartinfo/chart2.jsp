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
			PageFx.funSearch();
		});
		
		var PageFx = {
			funSearch : function()
			{
				$.ajax({
					url : _ctx_ + '/p/query/statBlood.do?a='+ Math.random(),
					type : 'post',
					dataType : 'json',
					data : 
					{
						"startTime"	: ($("#stime").val()==''?'':$("#stime").val() + " 00:00:00"),
						"endTime"	: ($("#etime").val()==''?'':$("#etime").val() + " 23:59:59")
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
				$('#container1').css("height", $(window).height()-$(".search").height()-130);
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
			}
		};
		
	</script>   
  </head>
  <body style="padding: 0px; margin: 0px">
  	<header id="header">
  		血糖信息
  		<div class="left"><a href="javascript:void(0)" onclick="window.history.back()"><span class="corner"></span></a></div>
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
			    			<input class="inputMin_informationModify text-input"  style="height: 35px; font-size: 18px;" type="date" id="stime"  maxlength="16">
			    		</td>
			    	</tr>
			    	</tr>	
			    		<td align="center" style="width:100px; height: 40px; color: #aeaeae; font-size: 18px;">
		    				结束时间：
		    			</td>
			    		<td>
			    			<input class="inputMin_informationModify text-input"  style="height: 35px; font-size: 18px;" type="date" id="etime"  maxlength="16">
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
					<div id="container1" ></div>
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