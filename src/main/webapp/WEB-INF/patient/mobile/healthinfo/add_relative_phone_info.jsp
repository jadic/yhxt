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
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">  
	<meta name="viewport" content="width=device-width,height=device-height,initial-scale=1.0,maximum-scale=1.0,user-scalable=no">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0"> 
    <%@ include file="/WEB-INF/patient/common/mobile-include.jsp"%>
    <%@ include file="/WEB-INF/patient/common/easyui-include.jsp"%>
    <style>
    	input, select{border:1px solid #ccc; height: 35px; width: 85%; padding-left: 10px;}
    	#content table td{height: 45px;}
    </style>
	<script type="text/JavaScript">
	function deleteRelative(id)
	{
		$.messager.confirm('确认', "您确认要删除这条记录吗？", function(r)
		{
			if (r)
			{
				/**打开进度条**/
				PageMain.funOpenProgress();
				
				$.ajax({
					url : _ctx_ + "/p/query/delRelative.do?a="+ Math.random(),
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
							$.messager.confirm('确认', data.msg, function(r)
							{
								window.location.href = "<c:url value='/p/query/relative.do'/>";
							});
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
	
		function funSaveInfo()
		{
			if (funIsNull("#name", "姓名") 
				|| funIsSelect("#type", "亲属关系"))
			{
				return false;
			}
			/**打开进度条**/
			PageMain.funOpenProgress();
			$.ajax({
				url : _ctx_ + '/p/query/<c:if test="${query.id  > 0}">modifyrelative.do</c:if><c:if test="${query.id  == 0}">addrelative.do</c:if>?a='+ Math.random(),
				type : 'post',
				dataType : 'json',
				data : 
				{
					<c:if test="${query.id  > 0}">
					"id": $("#id").val(),	
					</c:if>
					"name": $("#name").val(),	
					"type": $("#type").val(),	
					"cellPhone": $("#cellPhone").val(),	
					"tel": $("#tel").val(),	
					"address": $("#address").val()
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
						$.messager.confirm('确认', data.msg, function(r)
						{
							window.location.href = "<c:url value='/p/query/relative.do'/>";
						});
					}
					else
					{
						$.messager.alert('信息提示', data.msg, 'error');
					}
				}
			});
		}
		
		function modifyRelative(id)
		{
			alert(id)
		}
	</script>
  </head>
	<header id="header">
  		<c:if test="${query.id  > 0}">修改</c:if><c:if test="${query.id  == 0}">新增</c:if>亲情号码
  		<div class="left"><a href="<c:url value='/p/query/relative.do'/>" onclick="PageMobile.funLoadIng();"><span class="corner"></span></a></div>
  		<c:if test="${query.id  > 0}"><div class="right"><a href="javascript:void(0)" onclick="deleteRelative(${relative.id})"><span class="cornerDel"></span></a></div></c:if>
  	</header>
  	<div id="content">
        	<table cellpadding="0" border="0" cellspacing="0" style="font-size: 13px; width: 100%;">
	    		<tr>
	    			<td align="right" style="padding: 5px 5px 5px 0; width:100px; height: 30px; color: #aeaeae; font-size: 18px;">
	    				姓<span style="padding: 0 16px;"></span>名：
	    			</td>
	    			<td align="left">
	    				<input  type="text" id="name" name="name" maxlength="16" style="font-size: 18px;"  value="${relative.name }">
	    				<span style="color: red;">*</span>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td align="right" style="padding: 5px 5px 5px 0; width:100px; height: 30px; color: #aeaeae; font-size: 18px;">
	    				亲属关系：
	    			</td>
	    			<td align="left">
	    				<select class="selectMax_informationModify  text-input validate[required]" id="type" name="type"  style="font-size: 18px;">
		                   <option value="-1" <c:if test="${relative.type == -1}">selected="selected"</c:if>>请选择</option>
			               <option value="0" <c:if test="${relative.type == 0}">selected="selected"</c:if>>家庭成员</option>
			               <option value="1" <c:if test="${relative.type == 1}">selected="selected"</c:if>>亲戚 </option>
			               <option value="2" <c:if test="${relative.type == 2}">selected="selected"</c:if>>朋友 </option>
			               <option value="3" <c:if test="${relative.type == 3}">selected="selected"</c:if>>同事 </option>
			               <option value="4" <c:if test="${relative.type == 4}">selected="selected"</c:if>>其他 </option>
		               </select>
		               <span style="color: red;">*</span>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td align="right" style="padding: 5px 5px 5px 0; width:100px; height: 30px; color: #aeaeae; font-size: 18px;">
	    				手机号码：
	    			</td>
	    			<td align="left">
	    				<input  type="text" id="cellPhone" name="cellPhone" maxlength="16"  style="font-size: 18px;" value="${relative.cellPhone }">
	    			</td>
	    		</tr>
	    		<tr>
	    			<td align="right" style="padding: 5px 5px 5px 0; width:100px; height: 30px; color: #aeaeae; font-size: 18px;">
	    				固定电话：
	    			</td>
	    			<td align="left">
	    				<input  type="text" id="tel" name="tel" maxlength="16" style="font-size: 18px;" value="${relative.tel }">
	    			</td>
	    		</tr>
	    		<tr>
	    			<td align="right" style="padding: 5px 5px 5px 0; width:100px; height: 30px; color: #aeaeae; font-size: 18px;">
	    				联系地址：
	    			</td>
	    			<td align="left">
	    				<input type="hidden" id="id" name="id" value="${relative.id}"/>
	    				<input  type="text" id="address" name="address" maxlength="150"  style="font-size: 18px;" value="${relative.address}">
	    			</td>
	    		</tr>
	    		<tr>
	    			<td align="center" colspan="2">
	    				<ul>
	    					<li class="btn_reguster"><a onclick="funSaveInfo()" style="cursor: pointer;">确定</a></li>
	    				</ul>
	    			</td>
	    		</tr>
	    	</table>
	 </div>
	<footer id="footer">
		<footer id="footer">
		<jsp:include page="/WEB-INF/patient/common/footer-include.jsp">
			<jsp:param value="3" name="selected"/>
		</jsp:include>
	</footer>	
</body>
</html>
