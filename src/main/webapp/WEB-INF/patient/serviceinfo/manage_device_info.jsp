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
	<link rel="stylesheet" href="<c:url value='/patient/themes/health_records.css'/>" type="text/css"/>
	<style type="text/css">
		td{word-break:break-all;}
		.index_table table#faceTable tr th{
			line-height: normal;
		}
	</style>
	<script type="text/JavaScript">
		function queryStart()
		{
			$("#inputform").submit();
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
		    			<select class="selectMax_informationModify  text-input validate[required]"  style="width: 140px;" name="deviceType">
		                   <option value="-1">请选择</option>
		               </select>
		    		</td>
		    		<td align="right" style="padding: 5px 5px 5px 30px; width:70px; height: 30px; color: #aeaeae; font-size: 13px;">
	    				购买状态：
	    			</td>
		    		<td>
		    			<select class="selectMax_informationModify  text-input validate[required]"  style="width: 140px;" name="type">
		                   <option value="-1">请选择</option>
			               <option value="0">未购买</option>
			               <option value="1">已购买</option>
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
					<th style="width: 18%;">设备型号</th>
					<th style="width: 18%;">SIM卡号</th>
					<th style="width: 18%;">购买时间</th>
					<th style="width: 10%;">操作</th>
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
											<span style="color: #0ca7a1; font-weight: bold; cursor: pointer;">购买</span>
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
		    <li class="page_information">共<span id="showcount">10</span>条信息，当前：第<span id="showcurrentnum">1</span>页，共<span id="showpagecount">1</span>页</li>
		    <li class="page_button">
			    <a href="###" class="page-first">首页</a>
			    <a href="###" class="page-perv">上一页</a>
			    <a href="###" class="page-next">下一页</a>
			    <a href="###" class="page-last">末页</a>
		    </li>
		    <li class="page_select">
		    转<select id="gopage" onchange="gotoPage()"><option value="1">1</option></select>页
		    </li>
		  </ul>
		</div>
    </div>
</div>
   
</body>
</html>
