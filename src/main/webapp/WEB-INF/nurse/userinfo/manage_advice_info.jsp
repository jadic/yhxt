<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/nurse/common/taglibs-include.jsp" %>
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
	<%@ include file="/WEB-INF/nurse/common/top-include.jsp"%>
	<%@ include file="/WEB-INF/patient/common/easyui-include.jsp"%>
	
	<link rel="stylesheet" href="<c:url value='/nurse/themes/health_records.css'/>" type="text/css"/>
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
		
		function goMerge(id, name, command)
		{
			window.location.href = "<c:url value='/n/search/mergeAdvice.do'/>?id="+id + "&name="+name + "&command="+command + "&userId="+${query.userId};
		}
		
		
		function funDelete(obj, id)
		{
			$.messager.confirm('确认', "您确认要删除这条记录吗？", function(r)
			{
				if (r)
				{
					/**打开进度条**/
					PageMain.funOpenProgress();
					
					$.ajax({
						url : _ctx_ + "/n/search/delAdvice.do?a="+ Math.random(),
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
								$(obj).parent().parent().remove();
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
	</script>
  </head>
<body style="background: #ffffff; min-height: 600px;">
	<div class="account" >
		<div class="account_title" >
	      <ul>
	        <li class="account_titleGreen">医嘱历史</li>
	        
	        <li class="account_titleGray" style="padding-top: 1px; padding-bottom:0px; height: 47px;">
	        	<ul style=" padding-right:10px;">
	        	      <li class="select_BPhistory" style="width: 140px; height:40px; padding-top: 3px; float: right;">
	        	      	<input type="button" style="cursor: pointer;" class="btn_save" name="begin_date" value="新建医嘱" onclick="goMerge(0, '新增医嘱', 'addAdvice')">
	        	      </li>
	        	</ul>
	        </li>
	      </ul>
	    </div>
	</div>    
  <div class="information_modify">
    <div class="information_modify_main" id="main_div">
    	<div class="search">
    	<form id="inputform" name="inputform" action="<c:url value='/n/search/advice.do'/>?userId=${query.userId}" method="post">
		    <table width="100%" border="0" cellspacing="0" cellpadding="0" style="display: block; font-size: 15px;">
		    	<tr>
		    		<td align="right" style="padding: 5px 5px 5px 0; width:80px; height: 30px; color: #aeaeae; font-size: 13px;">
	    				开始时间：
	    			</td>
		    		<td>
		    			<input class="inputMin_informationModify text-input Wdate"  onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',readOnly:true})" style="width: 140px;" type="text" id="startTime" name="startTime" value="${query.startTime }">
		    		</td>
		    		<td style="width: 30px;"></td>
		    		<td align="right" style="padding: 5px 5px 5px 0; width:80px; height: 30px; color: #aeaeae; font-size: 13px;">
	    				结束时间：
	    			</td>
		    		<td>
		    			<input class="inputMin_informationModify text-input Wdate"  onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',readOnly:true})" style="width: 140px;" type="text" id="endTime" name="endTime" value="${query.endTime }">
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
							<th style="width: 35%;">服务名称</th>
							<th style="width: 15%;">医嘱类型</th>
							<th style="width: 25%;">时间</th>
							<th style="width: 25%;">操作</th>
						</tr>
						
						
						<c:if test="${not empty adviceFlys }">
							<c:forEach items="${adviceFlys }" var="adviceItem" varStatus="item">
								<tr class='<c:if test="${item.index mod 2 == 0 }">abnormal odd</c:if><c:if test="${item.index mod 2 == 1 }">even</c:if>' style="height: 40px;">
									<td><a href="<c:url value='/n/search/showAdvice.do'/>?id=${adviceItem.id}"><div style="width:190px; text-overflow:ellipsis; white-space:nowrap; *white-space:nowrap; overflow:hidden; 
									">${adviceItem.adviceContent }</div></a></td>
									<td>${adviceItem.typeName }</td>
									<td>${adviceItem.adviceTime }</td>
									<td>
										<a href="javascript:void(0)" onclick="goMerge(${adviceItem.id}, '修改医嘱', 'modifyAdvice')"><img src="<c:url value='/patient/themes/images/phone_editor.png'/>">编辑</a>
										<a href="javascript:void(0)" onclick="funDelete(this, ${adviceItem.id})"><img src="<c:url value='/patient/themes/images/phone_del.png'/>">删除</a>
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