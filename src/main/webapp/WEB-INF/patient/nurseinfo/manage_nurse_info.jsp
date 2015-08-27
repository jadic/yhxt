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
		.window {
		  background-color: #0ca7a1;
		  background: -webkit-linear-gradient(top,#0ca7a1 0,#60e3de 20%);
		  background: -moz-linear-gradient(top,#0ca7a1 0,#60e3de 20%);
		  background: -o-linear-gradient(top,#0ca7a1 0,#60e3de 20%);
		  background: linear-gradient(to bottom,#0ca7a1,#60e3de 20%);
		  background-repeat: repeat-x;
		  filter: progid:DXImageTransform.Microsoft.gradient(startColorstr=#0ca7a1,endColorstr=#60e3de,GradientType=0);
		}
	</style>
	<script type="text/JavaScript">
		$(function(){
			<c:if test="${query.type == 0}">
			$('.text-input').attr("disabled", "disabled");
			</c:if>
			
		});
		function queryStart()
		{
			$("#inputform").submit();
		}
		
		function goRequest(id, name)
		{
			window.location.href = "<c:url value='/p/query/goNurseRequest.do'/>?id="+id + "&name="+name;
		}
		
		function funNurseDetail(id)
		{
			window.location.href = "<c:url value='/p/query/nursedetail.do'/>?id="+id;
		}
		
		function funSendMsg()
		{
			PageMain.funCreateWinInfoNew("#div_win", "<c:url value='/patient/pages/send_msg_info.jsp'/>", {userId: "${nurse.userId }"});
		}
		
		var mObj = null;
		function funDpInfo(obj)
		{
			mObj = obj;
			if(parseInt($(obj).attr("tag")) > 0)
			{
				$.messager.alert('信息提示', "您当月已无点评机会", 'info');
			}	
			else
			{
				PageMain.funCreateWinInfoNew("#div_win", "<c:url value='/patient/pages/dp_nurse_info.jsp'/>", {userId: "${nurse.userId }"});
			}
		}
		
		function funSaveDpInfo()
		{
			$.messager.confirm('确认', "您每月只有一次点评机会哟，您确定要进行点评吗", function(r)
			{
				if (r)
				{
					$.ajax({
						url : _ctx_ + "/p/query/addScore.do?a="+ Math.random(),
						type : 'post',
						dataType : 'json',
						data : 
						{
							"score1"	: $("#scoreid").val(),
							"nurserId" 	: $("#nurserId").val()						
						},
						error:function(data)
						{
						},
						success:function(data)
						{
							if(data.success)
							{
								$(mObj).attr("tag", 1);
							}	
							$.messager.alert('信息提示', data.msg, 'info');
							$('#div_win').window('close');
						}
					});
				}
			});
		}
		
		function funSendInfo()
		{
			if($("#content1").val() == "")
			{
				alert("发送内容不能为空！");
				return false;
			}	
			/**打开进度条**/
			$.ajax({
				url : _ctx_ + "/p/query/sendMsg.do?a="+ Math.random(),
				type : 'post',
				dataType : 'json',
				data : 
				{
					"receiverId": $("#userId").val(),
					"status"	: 0,	
					"msg"		: $("#content1").val()						
				},
				error:function(data)
				{
				},
				success:function(data)
				{
					if(data.success)
					{
						$('<div style="float: right; width: 100%; text-align: right; line-height: 30px;">'+
								'<img src="<c:url value='/common/themes/icons/24.png'/>" style="float: right; padding-right: 20px; margin-top: 5px;"/>'+
								'<span style="float: right; padding-right: 5px;">'+$("#content1").val()+'</span>'+
							'</div>').appendTo("#sendmsg");
						$("#content1").val("");
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
<body <c:if test="${query.type == 1}">style="background: #ededed;"</c:if>>
	<div class="account" style="background: #ffffff;">
		<div class="account_title" style="background: #ffffff;">
	      <ul>
	        <li class="account_titleGreen">我的医护人</li>
	        <li class="account_titleGray" style="padding-top: 8px; height: 35px;">
	        	<c:if test="${query.type == 0}">
	        	<ul>
	        		<li class="select_BPhistory" style="width: 120px; padding-top: 0px; float: right;"><a href="javascript:void(0)" onclick="funSendMsg()"><img src="<c:url value='/patient/themes/images/btn_msg.png'/>"></a></li>
	        	</ul>
	        	</c:if>
	        	<c:if test="${query.type == 1}">当前位置：申请审核中</c:if>
	        	<c:if test="${query.type == 2}">当前位置：申请医护人员</c:if>
	        </li>
	      </ul>
	    </div>
	</div>    
  <div class="information_modify">
  <c:if test="${query.type == 0}">
  	<div class="information_modify_main" id="main_div">
  		<div style="float: left; width: 100%; height: 20px;"></div>
    	<div class="btn_title_informationModify">
          <ul>
            <li class="tLeft">基本信息</li>
            <li class="tRight"><a href="javascript:void(0)" tag="${dpCnt}" onclick="funDpInfo(this)"><img src="<c:url value='/patient/themes/images/btn_dp.png'/>"></a></li>
          </ul>
        </div>
        <div class="informationModify_main">
        	<table cellpadding="0" border="0" cellspacing="0" style="font-size: 13px; width: 100%;">
	    		<tr>
	    			<td align="right" style="padding: 5px 5px 5px 0; width:70px; height: 30px; color: #aeaeae; font-size: 13px;">
	    				真实姓名：
	    			</td>
	    			<td align="left">
	    				<input class="inputMin_informationModify text-input " type="text" id="name" name="name" value="${nurse.name }" maxlength="16">
	    				
	    			</td>
	    			<td rowspan="5">
	    				<table>
	    					<tr>
	    						<td>
	    							<c:if test="${empty nurse.photo }">
	    							<img style="width:120px; height: 160px;" id="header_photo" src="<c:url value='/patient/themes/images/default_head.gif'/>">
	    							</c:if>
	    							<c:if test="${not empty nurse.photo }">
	    							<img style="width:120px; height: 160px;" id="header_photo" src="<c:url value='/'/>${nurse.photo}">
	    							</c:if>
	    						</td>
	    					</tr>
	    					<tr>	
		    						<td class="thead_informationModify">
		    							<img src="<c:url value='/patient/themes/images/star_s${ nurse.score}.png'/>">
		    						</td>
		    					</tr>
		    					<tr>
		    						<td>
		    							签约人数：${ nurse.cnt}
		    						</td>
		    					</tr>
	    				</table>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td align="right" style="padding: 5px 5px 5px 0; width:70px; height: 30px; color: #aeaeae; font-size: 13px;">
	    				性<span style="padding: 0 13px;"></span>别：
	    			</td>
	    			<td align="left">
	    				<select class="selectMax_informationModify  text-input validate[required]" id="gender" name="gender">
		                   <option value="-1">请选择</option>
			               <option value="1" <c:if test="${nurse.gender == 1}">selected="selected"</c:if>>男</option>
			               <option value="2" <c:if test="${nurse.gender == 2}">selected="selected"</c:if>>女</option>
		               </select>
		               
	    			</td>
	    		</tr>
	    		<tr>
	    			<td align="right" style="padding: 5px 5px 5px 0; width:70px; height: 30px; color: #aeaeae; font-size: 13px;">
	    				出生日期：
	    			</td>
	    			<td align="left">
	    				<input class="inputMin_informationModify text-input Wdate"  onclick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})" type="text" id="birthdate" name="birthdate" maxlength="16" value="${nurse.birthdate }">
	    				
	    			</td>
	    		</tr>
	    		<tr>
	    			<td align="right" style="padding: 5px 5px 5px 0; width:70px; height: 30px; color: #aeaeae; font-size: 13px;">
	    				手机号码：
	    			</td>
	    			<td align="left">
	    				<input class="inputMin_informationModify text-input " type="text" id="cellphone" name="cellphone" maxlength="11" value="${nurse.cellphone }">
	    				
	    			</td>
	    		</tr>
	    		<tr>
	    			<td align="right" style="padding: 5px 5px 5px 0; width:70px; height: 30px; color: #aeaeae; font-size: 13px;">
	    				电子邮箱：
	    			</td>
	    			<td align="left">
	    				<input class="inputMin_informationModify text-input " type="text" id="email" name="email" maxlength="40" value="${nurse.email }">
	    				
	    			</td>
	    		</tr>
	    	</table>
        </div>
         <div class="btn_title_informationModify">
          <ul>
            <li class="tLeft">工作情况</li>
            <li class="tRight"></li>
          </ul>
        </div>
        <div class="informationModify_main">
        	<table cellpadding="0" border="0" cellspacing="0" style="font-size: 13px; width: 100%;">
	    		<tr>
	    			<td align="right" style="padding: 5px 5px 5px 0; width:70px; height: 30px; color: #aeaeae; font-size: 13px;">
	    				工作成就：
	    			</td>
	    			<td align="left" colspan="3">
	    				<textarea class="inputMax_informationModify text-input" style="height: 120px;" id="achievement" name="achievement">${userModel.achievement }</textarea>
	    			</td>
	    		</tr>	
	    	</table>
	    </div>	
  </c:if>
  	<c:if test="${query.type == 1}">
  		<div class="information_modify_main" id="main_div" style="height: 300px; line-height: 300px; font-size: 20px;">
  			<div style="height: 20px; width:100%; background: #ffffff; "></div>
  			
  				正在审核中，请耐心等候。。。
  		</div>
  	</c:if>
  	<c:if test="${query.type == 2}">
    <div class="information_modify_main" id="main_div">
    	<div class="search">
    	<form id="inputform" name="inputform" action="<c:url value='/p/query/mynuser.do'/>" method="post">
		    <table width="100%" border="0" cellspacing="0" cellpadding="0" style="display: block; font-size: 15px;">
		    	<tr>
		    		<td align="right" style="padding: 5px 5px 5px 0; width:100px; height: 30px; color: #aeaeae; font-size: 13px;">
	    				医护人员姓名：
	    			</td>
		    		<td>
		    			<input class="inputMin_informationModify text-input " type="text" id="name" name="name" value="${query.name }">
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
							<th style="width: 20%;">姓名</th>
							<th style="width: 16%;">性别</th>
							<th style="width: 16%;">手机号码</th>
							<th style="width: 16%;">签约人数</th>
							<th style="width: 16%;">星级</th>
							<th style="width: 16%;">操作</th>
						</tr>
						<c:if test="${not empty nurseFlys }">
							<c:forEach items="${nurseFlys }" var="nurseItem" varStatus="item">
								<tr class='<c:if test="${item.index mod 2 == 0 }">abnormal odd</c:if><c:if test="${item.index mod 2 == 1 }">even</c:if>' style="height: 40px;">
									<td><a href="javascript:void(0)" onclick="funNurseDetail(${nurseItem.userId})">${nurseItem.name }</a></td>
									<td>${nurseItem.genderStr }</td>
									<td>${nurseItem.cellphone }</td>
									<td>${nurseItem.cnt }</td>
									<td><img src="<c:url value='/patient/themes/images/star_s${ nurseItem.score}.png'/>"></td>
									<td>
										<a href="javascript:void(0)" onclick="goRequest(${nurseItem.userId}, '${nurseItem.name}')"><img src="<c:url value='/patient/themes/images/phone_editor.png'/>">申请签约</a>
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
    </c:if>
    
</div>
   
</body>
</html>
