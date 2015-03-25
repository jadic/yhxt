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
    <title>自已人健康服务中心 </title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0"> 
	<%@ include file="/WEB-INF/nurse/common/top-include.jsp"%>
	<%@ include file="/WEB-INF/patient/common/easyui-include.jsp"%>
	<script type="text/javascript" src="<c:url value="/common/xheditor/xheditor-1.1.9-zh-cn.min.js"/>"></script>
	<link rel="stylesheet" href="<c:url value='/nurse/themes/health_records.css'/>" type="text/css"/>
	<style type="text/css">
		td{word-break:break-all;}
		.index_table table#faceTable tr th{
			line-height: normal;
		}
	</style>
	<script type="text/JavaScript">
		$(function(){
			PageMain.funInitXheditor("#content");
			$('#doctor').combobox({
	    	    valueField:'doctorId',
	    	    textField:'doctorName',
	    	    multiple:true,
	    	    multiline:true,
	    	    url:_ctx_ + "/n/search/queryDoctor.do"
	    	});
			
			<c:if test="${not empty service }">
			window.setTimeout(function(){
				$.ajax({
			          url : _ctx_ + "/n/search/serviceDoctor.do?a="+ Math.random(),
			          type : 'post',
			          dataType : 'json',
			          data :{
			            "serviceId" : "${service.id }"
			          },
			          success:function(data)
			          {
						$('#doctor').combobox('setValues', data);
			          }
			      });
			}, 200);
			
			</c:if>
		});
		function funSaveInfo()
		{
			var doctorIds = $("#doctor").combobox("getValues").toString();
			
			/**打开进度条**/
			PageMain.funOpenProgress();
			$.ajax({
				url : _ctx_ + '/n/search/${query.name}.do?a='+ Math.random(),
				type : 'post',
				dataType : 'json',
				data : 
				{
					"id"	: $("#id").val(),
					"name"	: $("#name").val(),
					"sdate"	: $("#sdate").val(),
					"edate"	: $("#edate").val(),
					"icon"	: $("#icon").val(),
					"memo"	: $("#memo").val(),
					"doctorIds"	: doctorIds,
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
								window.location.href = "<c:url value='/n/search/service.do'/>";
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
		

		function funUploadFileInfo()
		{
			try
			{
				var uploadFile = dwr.util.getValue("file"); 
			    var filenames = uploadFile.value.split("\\"); 
			    if(filenames.length <= 1)
			    {
			    	filenames = uploadFile.value.split("/"); 
			    }	
			    var filename = filenames[filenames.length-1].toLowerCase(); 
			    var fileType = filename.substring(filename.indexOf("."));
			    if(fileType == ".jpg" || fileType == ".bmp" || fileType == ".png" || fileType == ".gif")
			    {
				    loadDwr.uploadFileInfo(uploadFile, filename, {"callback":function(data){
				    	if(data == 1 || data == "1")
				    	{
				    		$.messager.alert("提示", "图片上传失败", "error");
				    		$("#showtitle").val("图片上传在功！");
				    	}
				    	else
				    	{
				    		$("#showtitle").val("图片上传在功！");
				    		$("#icon").val(data);
				    		$("#header_photo").attr("src", _ctx_+data);
				    	}	
					}});  
			    }
			    else
			    {
			    	$.messager.alert("提示", "上传的照片类型应当为jpg/bmp/png/gif！", "error");
			    }
			}catch(e)
			{
			}
		}
	</script>	
  </head>
<body style="background: #ffffff;">
	<div class="account">
		<div class="account_title">
	      <ul>
	        <li class="account_titleGreen">我的服务</li>
	        <li class="account_titleGray">当前位置：<c:if test="${query.id == 0}">增加服务信息</c:if><c:if test="${query.id > 0}">修改服务信息</c:if></li>
	      </ul>
	    </div>
	</div>    
	<div class="information_modify">
	    <div class="information_modify_main" id="main_div">
	    	<div class="btn_title_informationModify" style="margin-top: 20px;">
	          <ul>
	            <li class="tLeft">服务信息</li>
	            <li class="tRight"><a href="javascript:void(0)" onclick="window.history.back();"><img src="<c:url value='/nurse/themes/images/btn_back.png'/>"></a></li>
	          </ul>
	        </div>
	        
	        <div class="informationModify_main">
	        	<table cellpadding="0" border="0" cellspacing="0" style="font-size: 13px; width: 100%;">
		    		<tr>
		    			<td align="right" style="padding: 0px 5px 5px 0px; width:70px; height: 30px; color: #aeaeae; font-size: 13px;">
		    				服务名称：
		    			</td>
		    			<td align="left">
		    				<input class="inputMin_informationModify text-input" type="text" value="${service.name }" id="name" maxlength="16" style="width: 400px;">
		    			</td>
		    			<td rowspan="5" align="center">
		    				<table>
		    					<tr>
		    						<td align="center">
		    							<c:if test="${empty service.icon }">
		    							<img style="width:120px; height: 140px;" id="header_photo" src="<c:url value='/nurse/themes/images/default_head.gif'/>">
		    							</c:if>
		    							<c:if test="${not empty service.icon }">
		    							<img style="width:120px; height: 140px;" id="header_photo" src="<c:url value='/'/>${service.icon}">
		    							</c:if>
		    						</td>
		    					</tr>
		    					<tr>	
		    						<td class="thead_informationModify" align="center">
		    							<input type="hidden" id="icon" value="${service.icon}"/>
		    							<span style="padding-left: 20px; color: red;" id="showtitle"></span>
		    						</td>
		    					</tr>
		    				</table>
		    			</td>
		    		</tr>
		    		<tr>
		    			<td align="right" style="padding: 0px 5px 5px 0px; width:70px; height: 30px; color: #aeaeae; font-size: 13px;">
		    				参与医生：
		    			</td>
		    			<td align="left">
		    				<select id="doctor" style="width:410px;height:60px">
                      		</select>
		    			</td>
		    		</tr>
		    		<tr>
		    			<td align="right" style="padding: 0px 5px 5px 0px; width:70px; height: 30px; color: #aeaeae; font-size: 13px;">
		    				开始日期：
		    			</td>
		    			<td align="left">
		    				<input class="inputMin_informationModify text-input Wdate" value="${service.sdate }" id="sdate" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})" type="text" value="${nurseRequest.userName }" maxlength="16" style="width: 400px;">
		    			</td>
		    		</tr>
		    		<tr>
		    			<td align="right" style="padding: 0px 5px 5px 0px; width:70px; height: 30px; color: #aeaeae; font-size: 13px;">
		    				结束日期：
		    			</td>
		    			<td align="left">
		    				<input class="inputMin_informationModify text-input Wdate" value="${service.edate }" id="edate" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})" type="text" value="${nurseRequest.userName }" maxlength="16" style="width: 400px;">
		    			</td>
		    		</tr>
		    		<tr>
		    			<td align="right" style="padding: 0px 5px 5px 0px; width:70px; height: 30px; color: #aeaeae; font-size: 13px;">
		    				备<span style="padding: 0 13px;"></span>注：
		    			</td>
		    			<td align="left">
		    				<input type="hidden" id="id" value="<c:if test="${empty service }">0</c:if>${service.id }"/>
		    				<input class="inputMin_informationModify text-input" type="text"  value="${service.memo }" id="memo" maxlength="16" style="width: 400px;">
		    			</td>
		    		</tr>
		    		<tr>
		    			<td align="right" style="padding: 0px 5px 5px 0px; width:70px; height: 30px; color: #aeaeae; font-size: 13px;">
		    				图<span style="padding: 0 13px;"></span>标：
		    			</td>
		    			<td align="left" colspan="2">
		    				<input id="file" type="file" class="inputMin_informationModify text-input" style="width: 400px;" onblur="$(this).val($.trim($(this).val()))"/>
							<a class="easyui-linkbutton" href="javascript:void(0)" onclick="funUploadFileInfo()">上传</a>
		    			</td>
		    		</tr>
		    		<tr>
		    			<td align="right" style="padding: 5px 5px 5px 0; width:70px; height: 30px; color: #aeaeae; font-size: 13px;">
		    				服务内容：
		    			</td>
		    			<td align="left" colspan="2">
		    				<textarea id="content" style="width:  550px; height: 500px;"  class="inputMax_informationModify text-input">${service.content }</textarea>
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
