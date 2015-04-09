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
	<style type="text/css">
		td{word-break:break-all;}
		.index_table table#faceTable tr th{
			line-height: normal;
		}
	</style>
	<script type="text/JavaScript">
		function funSaveInfo()
		{
			if($("#title").val() == "")
			{
				alert("标题不能为空！");
				return false;
			}
			if($("#content").val() == "")
			{
				alert("内容不能为空！");
				return false;
			}
			
			/**打开进度条**/
			PageMain.funOpenProgress();
			$.ajax({
				url : _ctx_ + '/p/query/addPost.do?a='+ Math.random(),
				type : 'post',
				dataType : 'json',
				data : 
				{
					"title"	: $("#title").val(),
					"content": $("#content").val()
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
						$.messager.confirm('确认', "操作成功，你要返回查询列表吗？", function(r)
						{
							if (r)
							{
								window.location.href = "<c:url value='/p/query/post.do'/>";
							}
						});
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
<body style="background: #ffffff;">
	<div class="account">
		<div class="account_title">
	      <ul>
	        <li class="account_titleGreen">快乐驿站</li>
	        <li class="account_titleGray">当前位置：我要发帖</li>
	      </ul>
	    </div>
	</div> 
	 <div class="information_modify">
	  	<div style="float: left; width: 100%; height: 20px;"></div>
	    <div class="information_modify_main" id="main_div">
	    	<div class="btn_title_informationModify">
	          <ul>
	            <li class="tLeft">帖子信息</li>
	            <li class="tRight"><a href="javascript:void(0)" onclick="window.history.back();"><img src="<c:url value='/nurse/themes/images/btn_back.png'/>"></a></li>
	          </ul>
	        </div>
	        
	         <div class="informationModify_main">
	        	<table cellpadding="0" border="0" cellspacing="0" style="font-size: 13px; width: 100%;">
		    		<tr>
		    			<td align="right" style="padding: 0px 5px 5px 0px; width:70px; height: 30px; color: #aeaeae; font-size: 13px;">
		    				帖子标题：
		    			</td>
		    			<td align="left" colspan="2">
		    				<input class="inputMin_informationModify text-input" type="text" id="title" style="width: 400px;">
		    			</td>
		    		</tr>
		    		<tr>
		    			<td align="right" style="padding: 5px 5px 5px 0; width:70px; height: 30px; color: #aeaeae; font-size: 13px;">
		    				帖子内容：
		    			</td>
		    			<td align="left" colspan="2">
		    				<textarea id="content" style="width:  550px; height: 250px;"  class="inputMax_informationModify text-input">${activity.content }</textarea>
		    			</td>
		    		</tr>
		    		<tr>
		    			<td align="center" colspan="3">
		    				<ul>
		    					<li class="btn_reguster"><a onclick="funSaveInfo()" style="cursor: pointer;">保存</a></li>
		    				</ul>
		    			</td>
		    		</tr>
		    	</table>
	        </div>
		</div>
	</div>   
</body>
</html>
