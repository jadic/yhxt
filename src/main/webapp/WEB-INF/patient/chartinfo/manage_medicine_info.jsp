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
	<%@ include file="/WEB-INF/patient/common/easyui-include.jsp"%>
	
	<link rel="stylesheet" href="<c:url value='/patient/themes/health_records.css'/>" type="text/css"/>
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
			
			$("#btnsearch").bind("click", function(){
				$("#inputform").submit();
			});
		});
		
		function delMedicine(obj, id)
		{
			$.messager.confirm('确认', "您确认要删除这条记录吗？", function(r)
			{
				if (r)
				{
					/**打开进度条**/
					PageMain.funOpenProgress();
					
					$.ajax({
						url : _ctx_ + "/p/query/delMedicine.do?a="+ Math.random(),
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
								$.messager.alert('信息提示', data.msg, 'info');
								$(obj).parent().parent().parent().remove();
							}
							else
							{
								$.messager.alert('信息提示', data.msg, 'error');
							}
						}
					});
				}
			});
		}
		
		function goMerge(id, name)
		{
			window.location.href = "<c:url value='/p/query/mergeMedicine.do'/>?id="+id + "&name="+name;
		}
	</script>
  </head>
<body>
<div class="account" style="background: #ffffff;">
	<div class="account_title" style="background: #ffffff;">
      <ul>
        <li class="account_titleGreen">用药管理</li>
        <li class="account_titleGray" style="padding-top: 8px; height: 35px;">
        	<ul>
		      <li class="select_BPhistory" style="width: 120px; padding-top: 0px; float: right;"><a href="javascript:void(0)" onclick="goMerge(0, '新增用药记录')"><img src="<c:url value='/patient/themes/images/phone_add.png'/>"></a></li>
		    </ul>
        </li>
      </ul>
    </div>
</div> 
	
   <div class="information_modify">
  	<div style="float: left; width: 100%; height: 20px;"></div>
    <div class="information_modify_main" id="main_div">
    	<div class="search">
    	<form id="inputform" name="inputform" action="<c:url value='/p/query/medicine.do'/>" method="post">
		    <table width="100%" border="0" cellspacing="0" cellpadding="0" style="display: block; font-size: 15px;">
		    	<tr>
		    		<td align="right" style="padding: 5px 5px 5px 0; width:70px; height: 30px; color: #aeaeae; font-size: 13px;">
	    				时间段：
	    			</td>
		    		<td colspan="2">
		    			<input class="inputMin_informationModify text-input Wdate" style="width: 150px;" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',readOnly:true})" type="text" name="startTime" value="${query.startTime }" maxlength="16">
		    			-
		    			<input class="inputMin_informationModify text-input Wdate" style="width: 150px;" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',readOnly:true})" type="text" name="endTime" value="${query.endTime }"  maxlength="16">
		    		</td>
		    	</tr>
		    	<tr>
		    		<td align="right" style="padding: 5px 5px 5px 0; width:70px; height: 30px; color: #aeaeae; font-size: 13px;">
	    				药品名：
	    			</td>
		    		<td>
		    			<input id="page" name="page" value="${query.page }" type="hidden"/>
		    			<input class="inputMin_informationModify text-input" style="width: 320px;" type="text" id="name" name="name" value="${query.name }">
		    		</td>
		    		<td>
		    		<ul>
		    			<li class="btn_search"><a href="javascript:void(0)" id="btnsearch">查询</a></li>
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
							<th>药品名称</th>
							<th>用药剂量</th>
							<th>用药单位</th>
							<th>用药时间</th>
							<th>操作</th>
						</tr>
					<tr>
						<c:if test="${not empty medicineFlys }">
							<c:forEach items="${medicineFlys }" var="medicineItem" varStatus="item">
								<tr class='<c:if test="${item.index mod 2 == 0 }">abnormal odd</c:if><c:if test="${item.index mod 2 == 1 }">even</c:if>' style="height: 40px;">
									<td>${medicineItem.medicineName }</td>
									<td>${medicineItem.medicineAmount }</td>
									<td>${medicineItem.medicineUnit }</td>
									<td>${medicineItem.medicineTime }</td>
									<td>
										<div style="width:130px;">
										<a href="javascript:void(0)" onclick="goMerge(${medicineItem.id}, '修改用药记录')"><img src="<c:url value='/patient/themes/images/phone_editor.png'/>">编辑</a>
										<a href="javascript:void(0)" onclick="delMedicine(this, ${medicineItem.id})"><img src="<c:url value='/patient/themes/images/phone_del.png'/>">删除</a>
										</div>
									</td>
								</tr>
							</c:forEach>
						</c:if>
					</tr>
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
