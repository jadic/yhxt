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
	<%@ include file="/WEB-INF/nurse/common/easyui-include.jsp"%>
	<script type="text/JavaScript">
		$(function(){
			$("#helathMenuNav li").bind("click", function(){
				$("#helathMenuNav li").removeClass("indexMenu_secondary_activation");
				$(this).addClass("indexMenu_secondary_activation");
			});
		});
	
		function reinitIframe() 
		{
			var iframe = document.getElementById("mainFrame");
			try {
				var bHeight = iframe.contentWindow.document.body.scrollHeight;
				var dHeight = iframe.contentWindow.document.documentElement.scrollHeight;
				var height = Math.min(bHeight, dHeight);
				iframe.height = height;
			} catch (ex) {
			}
		}
		window.setInterval("reinitIframe();", 500);

		var userList = [];
		function funSearchUserInfo(paramFlag)
		{
			/**打开进度条**/
			$.ajax({
				url : _ctx_ + "/n/search/userlist.do?a="+ Math.random(),
				type : 'post',
				dataType : 'json',
				data : 
				{
					"name": $("#search_name").val()						
				},
				error:function(data)
				{
				},
				success:function(data)
				{
					userList = data.rows;
					/**数据处理**/
					if(data.success)
					{
						var tmp = "";
						for(var nItem=0; nItem<data.total; nItem++)
						{
							tmp += '<li onclick="cilckUser('+nItem+')">'+
				         		'<span class="task_wj">'+data.rows[nItem].cnt+'</span>'+
				         		'<p class="task_Name" title="'+data.rows[nItem].name +'">'+data.rows[nItem].name +'</p>'+
				         		'<span class="task_Time">'+data.rows[nItem].stime+'</span>'+
				         	'</li>';
						}	
						$("#userList").html(tmp);
						if(paramFlag == 0)
						{
							funOperInfo(0);
						}	
					}
					$("#memberNum").html(data.total);
				}
			});
		}
		
		function funOperInfo(item)
		{
			var user = userList[item];
			$("#membername").html(user.name);
			$("#membername").attr("title", user.name);
			$("#sex").html("性别：" + user.genderStr);
			if(user.birthdate != null && user.birthdate != "" && typeof(user.birthdate) != "undefined")
			{
				var myDate = new Date();
				var myNow = myDate.getFullYear();
				var ageFlys = user.birthdate.split("-");
				var age = myNow-ageFlys[0]
				$("#age").html("年龄："+age+"岁");
			}
			else
			{
				$("#age").html("年龄：- 岁");
			}	
			$("#credentials_id").html(user.credentialNo);
			$("#cell_phone").html(user.cellphone);
			$("#phone").html(user.homePhone);
			$("#address").html(user.homeAddress);
			$("#baseId").attr("href", "<c:url value='/n/search/usermain.do'/>?userId="+user.userId);
		}
		function cilckUser(item)
		{
			funOperInfo(item);
			var user = userList[item];
			$("#mainFrame").attr("src", "<c:url value='/n/search/usermain.do'/>?userId="+user.userId);
		}
		
		$(function(){
			funSearchUserInfo(0);
		});
		
		function funSendInfo()
		{
			/**打开进度条**/
			$.ajax({
				url : _ctx_ + "/n/search/sendMsg.do?a="+ Math.random(),
				type : 'post',
				dataType : 'json',
				data : 
				{
					"receiverId": $("#userId").val(),
					"status"	: 0,	
					"msg"		: $("#content").val()						
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
								'<span style="float: right; padding-right: 5px;">'+$("#content").val()+'</span>'+
							'</div>').appendTo("#sendmsg");
						$("#content").val("");
					}
					else
					{
						alert(data.msg);
					}	
				}
			});
		}
		
		function openSendSMS()
		{
			PageMain.funCreateWinInfoNew("#div_win", "<c:url value='/nurse/pages/send_alluser_msg_info.jsp'/>", {});
		}
	</script>
  </head>
<body>
	<div class="index_health_header">
      <div class="bgTop_index">
        <div class="index_out">
          <ul>
           <li class="index_title">医生业务平台V3.2</li>
           <li class="index_username">欢迎您，清波医生医生</li>
           <li class="index_signout">
               <a href="javascript:void(0)" onclick="logout();" title="安全退出">安全退出</a>
               <form action="/doctor/login/level.action" id="logoutForm" name="logoutForm" method="post">
               </form>
           </li> 
          </ul>
        </div>
      </div>
      <!--indexMenu start-->
      <div class="logo_menu">
        <div class="bg_logo">
          
        </div>
      </div>
    </div>
    
    <div class="indexMenu_secondary">
      <div class="indexMenu_secondary_main">
        <ul id="helathMenuNav">
          <li id="hMenu0" class="indexMenu_secondary_activation"><a id="ahome" href="<c:url value='/n/search/home.do'/>" target="mainFrame" title="首页">首页</a></li>
          <li id="hMenu1"><a href="<c:url value='/n/search/baseuser.do'/>" target="mainFrame" title="我的档案">我的档案</a></li>
          <li id="hMenu2"><a href="<c:url value='/n/search/activity.do'/>" target="mainFrame" title="我的活动">我的活动</a></li>
          <li id="hMenu3"><a href="<c:url value='/n/search/service.do'/>" target="mainFrame" title="我的服务">我的服务</a></li>
          <li id="hMenu4"><a href="<c:url value='/n/search/nurseRequest.do'/>" target="mainFrame" title="我的签约">我的签约</a></li>
          <li id="hMenu5"><a href="<c:url value='/n/search/doctor.do'/>" target="mainFrame" title="平台医生">平台医生</a></li>
        </ul> 
      </div>
    </div>
    
	<div class="index_health_middle" style="background: #ededed;">
    <div class="index_health_main">
      <!--index_health_left start-->
      <div class="user_list">
       <div class="user_list_header">
       我的用户（<span id="memberNum" style="color:#ff9600">0</span>&nbsp;个）
         <a title="发送短信" href="javascript:void(0)" onclick="openSendSMS();"><img src="<c:url value='/nurse/themes/images/mail.png'/>"></a>
       </div>
       <div class="bg_search">
         <input type="text" class="search_input" id="search_name" title="请输入用户姓名">
         <a href="javascript:void(0)" onclick="funSearchUserInfo(1);"><img title="搜索用户" src="<c:url value='/nurse/themes/images/search.png'/>"></a>
       </div>
       <div class="task_list" style="height: 500px; overflow-y: hidden; outline: none;" tabindex="5000">
         <ul id="userList">
         </ul>
       </div>
       <div class="count"></div>
      </div>
      <!--index_health_left end-->
      <!--index_health_right start-->
      <div class="index_health_right">
        <iframe src="<c:url value='/n/search/home.do'/>" scrolling="no" frameborder="0" name="mainFrame" id="mainFrame" onload="reinitIframe();" height="1388"></iframe>
      </div>
      <!--index_health_right end-->
      
      <div class="index_health_left" id="userdetail" style="display: block;">
        <div class="wInformation">
          <ul id="member_detail">
            <li class="wInformation_img"><img id="header_photo" src="<c:url value='/nurse/themes/images/default_head.gif'/>" width="145" height="165"></li>
            <li class="tGreen"><span id="membername" title=""></span><a id="baseId" title="基本信息" target="mainFrame"><img src="<c:url value='/nurse/themes/images/phone_editor.png'/>"></a></li>
            <li class="tGrayMin" id="sex">性别：男</li>
            <li class="tGrayMin" id="age">年龄：岁</li>
            <li class="tGray">身份证号：</li>
            <li class="wtBlack" id="credentials_id"></li>
            <li class="tGray">联系电话：</li>
            <li class="wtBlack" id="cell_phone"></li>
            <li class="tGray">家庭电话：</li>
            <li class="wtBlack" id="phone"></li>
            <li class="tGray">家庭住址：</li>
            <li class="wtBlack" id="address" title=""></li>
            <li><input type="hidden" id="member_unit_id" value="20979"><input type="hidden" id="member_cluster_id" value="1"><input type="hidden" id="member_unit_type" value="2"> </li>
          </ul>
        </div>
      </div>
      
      <div class="xygj_list" style="display: none;">
          <p class="xygj_top" id="bp_alert">血压告警（3&nbsp;条）</p>
          <ul id="bp_alert_list"><li onclick="applyBpAlertTask(1567,21051)"><p><span class="xygj_Name" title="清波卫生99">清波卫生9</span><span class="xygj_value">回复</span></p><span class="xygj_time">2015-03-06 13:57:38</span></li><li onclick="applyBpAlertTask(1568,21051)"><p><span class="xygj_Name" title="清波卫生99">清波卫生9</span><span class="xygj_value">回复</span></p><span class="xygj_time">2015-03-06 14:04:55</span></li><li onclick="applyBpAlertTask(1569,21051)"><p><span class="xygj_Name" title="清波卫生99">清波卫生9</span><span class="xygj_value">回复</span></p><span class="xygj_time">2015-03-06 14:25:30</span></li></ul>
      </div>
      
      
    </div>
    </div>
</body>
</html>
