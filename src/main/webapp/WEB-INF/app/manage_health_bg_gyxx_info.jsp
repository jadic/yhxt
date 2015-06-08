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
    <title>健康日报</title>
	<style>
		.tableTd{border: solid #000; border-width: 0px 1px 1px 0px; width: 100px; font-size: 14px; line-height: 30px; height: 30px;}
		.selectMax_Level{width:60px; height:25px; border:0px solid #aeaeae; font:13px/26px "微软雅黑"; color:#5a5a5a; }
	</style>
	<link rel="stylesheet" href="<c:url value='/app/jquerymobile/jquery.mobile-1.4.5.min.css'/>">
	<script src="<c:url value='/app/jquerymobile/jquery.min.js'/>"></script>
	<script src="<c:url value='/app/jquerymobile/jquery.mobile-1.4.5.min.js'/>"></script>
	<script type="text/JavaScript">
		$(function(){
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
					reportTime 			: '<c:choose><c:when test="${query.statType == 2}">${query.startTime}_${query.endTime}</c:when><c:otherwise>${query.startTime}</c:otherwise></c:choose>'
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
					}	
				}
			});
		}
		
		function funOpenXXXX()
		{
			window.location.href="<c:url value='/app/healthBg.do?userId=${query.userId}&statType=${query.statType}&startTime=${query.startTime}&endTime=${query.endTime}'/>"
		}
	</script>
  </head>
<body>
<div data-role="page" class="jqm-demos" data-quicklinks="true">
	<div id="list" role="main" class="listDiv"  class="ui-content jqm-content" style="overflow: auto; margin-top: 1px; padding-left: 8px; background: #fff;" >
	        	<table width="99%" border="0" cellspacing="0" cellpadding="0" style="display: block; font-size: 15px;">
	        		<tr>
	        			<td style="width: 80px; font-size: 14px; line-height: 35px; height: 35px;">综合评估：</td>
	        			<td align="left" id="accessment">
	        				
	        			</td>
	        		</tr>
	        		<tr>
	        			<td style="width: 80px; font-size: 14px; line-height: 30px; height: 30px;">健康状况：</td>
	        			<td style="font-size: 14px; line-height: 30px; height: 30px;" align="left" id="jkzk"></td>
	        		</tr>
	        		<tr>
	        			<td style="width: 80px; font-size: 14px; line-height: 30px; height: 30px;">日<span style="padding:0 16px;"></span>期：</td>
	        			<td style="font-size: 14px; line-height: 30px; height: 30px;" align="left">
	        				<c:choose>
	        					<c:when test="${query.statType == 1}">${query.startTime }</c:when>
	        					<c:when test="${query.statType == 2}">${query.startTime }  <span style="padding: 0 3px;">-</span>  ${query.endTime }</c:when>
	        					<c:when test="${query.statType == 3}">${query.startTime }</c:when>
	        				</c:choose>
	        			
	        			
	        			</td>
	        		</tr>
	        		<c:if test="${query.statType == 1 }">
	        		<tr>
	        			<td style="width: 80px; font-size: 14px; line-height: 30px; height: 30px;">最近血糖：</td>
	        			<td style="font-size: 14px; line-height: 22px; height: 30px; padding: 5px 0px;" align="left">
					    	<c:if test="${not empty xtModel }">
					    	${xtModel.b}mmol/L（空腹）<br/>
                			${xtModel.d}mmol/L（饭后）
	        				</c:if>
	        				
					    	<c:if test="${empty xtModel }">
	        					-
	        				</c:if>
	        			</td>
	        		</tr>
	        		<tr>
	        			<td style="width: 80px; font-size: 14px; line-height: 30px; height: 30px;">最近血压：</td>
	        			<td style="font-size: 14px; line-height: 22px; height: 30px; padding: 5px 0px;" align="left">
	        				<c:if test="${not empty xyModel }">
	        				${xyModel.b }mmHg(高压）<br/>
	        				${xyModel.c }mmHg(低压）<br/>
	        				${xyModel.d }次（脉搏）<br/>
	        				</c:if>
	        				<c:if test="${empty xyModel }">
	        					-
	        				</c:if>
	        			</td>
	        		</tr>
	        		<tr>
	        			<td style="width: 80px; font-size: 14px; line-height: 30px; height: 30px;">最近体温：</td>
	        			<td style="font-size: 14px; line-height: 30px; height: 30px;" align="left">
					    	<c:if test="${not empty twmodel }">
					    	${twmodel.b }（℃）
	        				</c:if>
	        				<c:if test="${empty twmodel }">
	        					-
	        				</c:if>
	        			</td>
	        		</tr>
	        		</c:if>
	        	</table>
	        </div>
        </div>
    </div>
</body>
</html>
