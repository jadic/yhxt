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
    <%@ include file="/WEB-INF/patient/common/dwr-include.jsp"%>
    <%@ include file="/WEB-INF/patient/common/mobile-include.jsp"%>
    <%@ include file="/WEB-INF/patient/common/easyui-include.jsp"%>
    <style>
    	input, select,textarea{border:1px solid #ccc; height: 30px; width: 85%; padding-left: 10px;}
    </style>
	<script type="text/JavaScript">
		$(function(){
			ComDwr.loadDevType("deviceType", true, "${query.deviceType}");
			PageOper.funSearch();
			$("#btnsearch").bind("click", function(){
				$(".item_wcl").remove()
				PageOper.page = 1;
				PageOper.sumPage = 1;
				PageOper.funSearch()
			});
		});
		var PageOper = {
			page:1,
			sumPage:1,
			funSearch : function()
			{
				PageMobile.funLoadIng();
				$.ajax({
					url : _ctx_ + "/p/query/deviceJson.do?a="+ Math.random(),
					type : 'post',
					dataType : 'json',
					data : 
					{
						"deviceType" : $("#deviceType").val(),
						"type"		 : $("#type").val(),
						"page"       : PageOper.page						
					},
					error:function(data)
					{
						PageMobile.funLoadHidden();
					},
					success:function(data)
					{
						PageMobile.funLoadHidden();
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
								if(row.userId > 0)
								{
									$('<li class="activeable list-item item_wcl" style="display:-webkit-box; display:-moz-box;">'+
										'<div style="-webkit-box-flex:1; -moz-box-flex:1; -webkit-box-ordinal-group:2;-moz-box-ordinal-group:2;">'+
											'<h2 class="item-title" style="font-size:18px;">'+row.typeName+'【<span style="color: #2998df; font-weight: bold;">已购买</span>】</h2>'+
							                '<p class="item-time">设备编号：'+row.no+'</p>'+
							                '<p class="item-time">设备型号：'+row.model+'</p>'+
							                '<p class="item-time">SIM卡号：'+row.sim+'</p>'+
							                '<p class="item-time">购买时间：'+row.buyTime+'</p>'+
						                '</div>'+
							       ' </li>').insertBefore(".list-more");
								}
								else
								{
									$('<li class="activeable list-item item_wcl" style="display:-webkit-box; display:-moz-box;">'+
											'<div style="-webkit-box-flex:1; -moz-box-flex:1; -webkit-box-ordinal-group:2;-moz-box-ordinal-group:2;">'+
												'<h2 class="item-title" style="font-size:16px;">'+row.typeName+'</h2>'+
								                '<p class="item-time">设备编号：'+row.no+'</p>'+
								                '<p class="item-time">设备型号：'+row.model+'</p>'+
								                '<p class="item-time">SIM卡号：'+row.sim+'</p>'+
							                '</div>'+
							                '<div style="width: 80px; line-height:70px; -webkit-box-sizing:border-box; -moz-box-sizing:border-box; -webkit-box-ordinal-group:2;-moz-box-ordinal-group:2;">'+
							                	'<span style="color: #0ca7a1; font-weight: bold; cursor: pointer; font-size:18px;" onclick="buyinfo(this, '+row.id+')">我要购买</span>'+
							                '</div>'+
								       ' </li>').insertBefore(".list-more");
								}	
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
		};
		
		function buyinfo(obj, id)
		{
			PageMain.funOpenProgress();
			$.ajax({
				url : _ctx_ + "/p/query/buyDevice.do?a="+ Math.random(),
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
						$(obj).parent().html('<span style="color: #2998df;  font-size:18px; font-weight: bold;">已购买</span>');
						$.messager.alert('信息提示', data.msg, 'info');
					}
					else
					{
						$.messager.alert('信息提示', data.msg, 'error');
					}
				}
			});
		}
	</script>
  </head>
<body>
	<header id="header">
  		我的设备
  		<div class="left"><a href="<c:url value='/p/my.do'/>" onclick="PageMobile.funLoadIng();"><span class="corner"></span></a></div>
  	</header>
  	<div id="content">
  		<ul class="list">
  			<li class="activeable list-item"> 
		    	<form id="inputform" name="inputform" action="<c:url value='/p/query/device.do'/>" method="post">
				    <table width="100%" border="0" cellspacing="0" cellpadding="0" style="font-size: 18px;">
				    	<tr>
				    		<td align="right" style="padding-right: 5px; width:100px; height: 35px; color: #aeaeae; font-size: 18px;">
			    				设备类型：
			    			</td>
				    		<td>
				    			<input id="page" name="page" value="${query.page }" type="hidden"/>
				    			<select name="deviceType" id="deviceType">
				                   <option value="-1">请选择</option>
				               </select>
				    		</td>
				    	</tr>
				    	<tr>	
				    		<td align="right" style="padding-right: 5px; width:100px; height: 35px; color: #aeaeae; font-size: 18px;">
			    				购买状态：
			    			</td>
				    		<td>
				    			<select name="type" id="type">
				                   <option value="-1"  value="-1" <c:if test="${query.type == -1 }">selected="selected"</c:if>>请选择</option>
					               <option value="0"   value="-1" <c:if test="${query.type == 0 }">selected="selected"</c:if>>未购买</option>
					               <option value="1"  value="-1" <c:if test="${query.type == 1 }">selected="selected"</c:if>>已购买</option>
				               </select>
				    		</td>
				    	</tr>
				    	<tr>
				    		<td colspan="2" align="center" style="height: 70px;">
					    		<ul>
					    			<li class="btn_reguster" style="margin-top: 10px;"><a href="javascript:void(0)" id="btnsearch">查询</a></li>
					    		</ul>
				    		</td>
				    	</tr>
				    </table>
				</form>    
			</li>
	        <li class="activeable list-more" style="display: none;" onclick="PageOper.funLoadMore()">加载更多</li>
        </ul>
	</div>
   <footer id="footer">
		<footer id="footer">
		<jsp:include page="/WEB-INF/patient/common/footer-include.jsp">
			<jsp:param value="3" name="selected"/>
		</jsp:include>
	</footer>
</body>
</html>
