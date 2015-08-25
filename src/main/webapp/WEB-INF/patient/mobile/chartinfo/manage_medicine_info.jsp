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
		.item_wcl{}
	</style>
	<link rel="stylesheet" href="<c:url value='/patient/themes/health_records.css'/>" type="text/css"/>
	<script type="text/JavaScript">
		$(function(){
			$("#btnsearch").bind("click", function(){
				$(".item_wcl").remove()
				PageOper.page = 1;
				PageOper.sumPage = 0;
				PageOper.funSearch()
			});
		});
		
		var PageOper = {
			page:1,
			sumPage:1,
			funSearch : function()
			{
				$.ajax({
					url : _ctx_ + "/p/query/medicineJson.do?a="+ Math.random(),
					type : 'post',
					dataType : 'json',
					data : 
					{
						"startTime": $("#startTime").val(),						
						"endTime": $("#endTime").val(),						
						"name": $("#name").val(),						
						"page": PageOper.page						
					},
					error:function(data)
					{
						
					},
					success:function(data)
					{
						if(PageOper.sumPage >= data.sumPage)
						{
							$(".list-more").hide();
						}
						else
						{
							PageOper.sumPage = data.sumPage;
							$(".list-more").show();
						}	
						if(data.success)
						{
							var row = null;
							for(var nItem=0; nItem<data.rows.length; nItem++)
							{
								row = data.rows[nItem];
								$('<li class="activeable list-item item_wcl" style="display:-webkit-box; display:-moz-box;"  onclick="goMerge('+row.id+', \'修改用药记录\')">'+
						                '<div style="-webkit-box-flex:1; -moz-box-flex:1; -webkit-box-ordinal-group:2;-moz-box-ordinal-group:2;">'+
						                '<h2 class="item-title">'+row.medicineName+'</h2>'+
						                '<p class="item-info">'+
						                    '<span class="item-pos">'+row.medicineAmount+'('+row.medicineUnit+')</span>'+
						                '</p>'+
						                '<p class="item-time">'+row.medicineTime+'</p>'+
					                '</div>'+
					                '<div style="width: 20px; -webkit-box-sizing:border-box; -moz-box-sizing:border-box; -webkit-box-ordinal-group:2;-moz-box-ordinal-group:2;">'+
					                	'<div class="item-next" style="margin-top:25px;"></div>'+
					                '</div>'+
						       ' </li>').insertBefore(".list-more");
							}	
						}
					}
				});
			},
			funLoadMore: function()
			{
				if(PageOper.page < PageOper.sumPage)
				{
					PageOper.page += 1;
					PageOper.funSearch()
				}
			}
		}
		
		function goMerge(id, name)
		{
			window.location.href = "<c:url value='/p/query/mergeMedicine.do'/>?id="+id + "&name="+name;
		}
	</script>
  </head>
<body style="padding: 0px; margin: 0px;">
  	<header id="header">
  		用药管理
  		<div class="left"><a href="javascript:void(0)" onclick="window.history.back()"><span class="corner"></span></a></div>
  		<div class="right"><a href="javascript:void(0)" onclick="goMerge(0, '新增用药记录')"><span class="cornerAdd"></span></a></div>
  	</header>
  	<div id="content">
	    <div class="search">
	    	<form id="inputform" name="inputform" action="<c:url value='/p/query/medicine.do'/>" method="post">
			    <table border="0" cellspacing="0" cellpadding="0" style="width:100%; font-size: 15px;">
			    	<tr>
			    		<td align="center" style="width:80px; height: 32px; color: #aeaeae; font-size: 13px;">
		    				开始时间：
		    			</td>
			    		<td>
			    			<input class="inputMin_informationModify text-input Wdate"  onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',readOnly:true})" type="text" id="startTime"  maxlength="16">
			    		</td>
			    	</tr>
			    	<tr>	
			    		<td align="center" style="width:80px; height: 32px; color: #aeaeae; font-size: 13px;">
		    				结束时间：
		    			</td>
			    		<td>
			    			<input class="inputMin_informationModify text-input Wdate"  onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',readOnly:true})" type="text" id="endTime"  maxlength="16">
			    		</td>
			    	</tr>
			    	<tr>
			    		<td align="center" style="width:80px; height: 32px; color: #aeaeae; font-size: 13px;">
		    				药品名称：
		    			</td>
			    		<td>
			    			<input class="inputMin_informationModify text-input" type="text" id="name" name="name" value="${query.name }">
			    		</td>
			    	</tr>
			    	</tr>	
			    		<td colspan="2" align="center" style="height: 50px;">
				    		<ul>
				    			<li class="btn_search" style="float: none;"><a href="javascript:void(0)" id="btnsearch">查询</a></li>
				    		</ul>
			    		</td>
			    	</tr>
			    </table>
			</form>    
		</div>
		<ul class="list">
			<li class="activeable list-item" style="background: #efefef"></li>
	        <li class="activeable list-more" style="display: none;" onclick="PageOper.funLoadMore()">加载更多</li>
        </ul>
	</div>
	
	<footer id="footer">
		<footer id="footer">
		<jsp:include page="/WEB-INF/patient/common/footer-include.jsp">
			<jsp:param value="1" name="selected"/>
		</jsp:include>
	</footer>	
  </body>   
</body>
</html>
