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
    <title>南京通用电器有限公司 </title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0"> 
	<%@ include file="/WEB-INF/patient/common/top-include.jsp"%>
	<%@ include file="/WEB-INF/patient/common/easyui-include.jsp"%>
	
	<link rel="stylesheet" href="<c:url value='/patient/themes/health_records.css'/>" type="text/css"/>
	<style type="text/css">
		td{word-break:break-all;}
		.index_table table#faceTable tr th{
			line-height: normal;
		}
	</style>
	<script type="text/JavaScript">
	
		$(function(){
			$(".page-first").bind("click", function(){
				if($("#gopage").val() > 1)
				{
					$("#page").val("1");
					$("#inputform").submit();
				}	
			});
			
			
			$(".page-perv").bind("click", function(){
				if($("#gopage").val() > 1)
				{
					$("#page").val($("#gopage").val() - 1);
					$("#inputform").submit();
				}	
			});
			
			$(".page-next").bind("click", function(){
				if($("#gopage").val() < "${query.pageCnt}")
				{
					$("#page").val(parseInt($("#gopage").val()) + 1);
					$("#inputform").submit();
				}	
			});
			
			
			$(".page-last").bind("click", function(){
				if($("#gopage").val() < "${query.pageCnt}")
				{
					$("#page").val("${query.pageCnt}");
					$("#inputform").submit();
				}	
			});
			
			$("#gopage").bind("change", function(){
				$("#page").val($(this).val());
				$("#inputform").submit();
			});
			
			ComDwr.loadDevType("deviceType", true, "${query.deviceType}");
		});
		
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
	</script>
  </head>
<body>
  <div class="information_modify">
    <div class="information_modify_main" id="main_div">
    	<div class="search">
    	<form id="inputform" name="inputform" action="<c:url value='/p/query/device.do'/>" method="post">
		    <table width="100%" border="0" cellspacing="0" cellpadding="0" style="display: block; font-size: 15px;">
		    	<tr>
		    		<td align="right" style="padding: 5px 5px 5px 0; width:70px; height: 30px; color: #aeaeae; font-size: 13px;">
	    				设备类型：
	    			</td>
		    		<td>
		    			<input id="page" name="page" value="${query.page }" type="hidden"/>
		    			<select class="selectMax_informationModify  text-input validate[required]"  style="width: 140px;" name="deviceType" id="deviceType">
		                   <option value="-1">请选择</option>
		               </select>
		    		</td>
		    		<td align="right" style="padding: 5px 5px 5px 30px; width:70px; height: 30px; color: #aeaeae; font-size: 13px;">
	    				购买状态：
	    			</td>
		    		<td>
		    			<select class="selectMax_informationModify  text-input validate[required]"  style="width: 140px;" name="type">
		                   <option value="-1"  value="-1" <c:if test="${query.type == -1 }">selected="selected"</c:if>>请选择</option>
			               <option value="0"   value="-1" <c:if test="${query.type == 0 }">selected="selected"</c:if>>未购买</option>
			               <option value="1"  value="-1" <c:if test="${query.type == 1 }">selected="selected"</c:if>>已购买</option>
		               </select>
		    		</td>
		    		<td>
			    		<ul>
			    			<li class="btn_search"><a href="javascript:void(0)" onclick="queryStart()">查询</a></li>
			    		</ul>
		    		</td>
		    	</tr>
		    </table>
		</form>    
		</div>
        <div class="index_table">
		    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="bPhistory_table" id="faceTable">
		      <tbody>
		      	<tr class="even">
					<th style="width: 18%;">设备类型</th>
					<th style="width: 18%;">设备编号</th>
					<th style="width: 17%;">设备型号</th>
					<th style="width: 17%;">SIM卡号</th>
					<th style="width: 21%;">购买时间</th>
					<th style="width: 9%;">操作</th>
		      	</tr>
		      	<c:if test="${not empty deviceFlys }">
							<c:forEach items="${deviceFlys }" var="deviceItem" varStatus="item">
								<tr class='<c:if test="${item.index mod 2 == 0 }">abnormal odd</c:if><c:if test="${item.index mod 2 == 1 }">even</c:if>' style="height: 40px;">
									<td>${deviceItem.typeName }</td>
									<td>${deviceItem.no }</td>
									<td>${deviceItem.model }</td>
									<td>${deviceItem.sim }</td>
									<td>${deviceItem.buyTime }</td>
									<td>
										<c:if test="${ deviceItem.userId == 0 }">
											<span style="color: #0ca7a1; font-weight: bold; cursor: pointer;" onclick="buyinfo(this, '${deviceItem.id}')">购买</span>
										</c:if>
										<c:if test="${ deviceItem.userId != 0 }">
											<span style="color: #2998df; font-weight: bold;">已购买</span>
										</c:if>
									</td>
								</tr>
							</c:forEach>
						</c:if>
		      </tbody>
		     </table>	
		</div>
		<div class="index_page">
		  <ul>
		    <li class="page_information">共<span id="showcount">${query.total }</span>条信息，当前：第<span id="showcurrentnum">${query.page }</span>页，共<span id="showpagecount">${query.pageCnt }</span>页</li>
		    <li class="page_button">
			    <a href="javascript:void(0)" class="page-first">首页</a>
			    <a href="javascript:void(0)" class="page-perv">上一页</a>
			    <a href="javascript:void(0)" class="page-next">下一页</a>
			    <a href="javascript:void(0)" class="page-last">末页</a>
		    </li>
		    <li class="page_select">
		    转<select id="gopage">
		    	<c:forEach  var="temp"   begin="1"   step="1"   end="${ query.pageCnt}"> 
					<option <c:if test="${query.page==temp }">selected="selected"</c:if> value="<c:out  value="${temp}"/>"><c:out  value="${temp}"/></option>
				</c:forEach> 
		    </select>页
		    </li>
		  </ul>
		</div>
    </div>
</div>
   
</body>
</html>
