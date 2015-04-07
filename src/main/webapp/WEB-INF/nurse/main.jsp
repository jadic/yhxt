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
    <title>自已人健康服务中心</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0"> 
	<%@ include file="/WEB-INF/nurse/common/top-include.jsp"%>
	<%@ include file="/WEB-INF/nurse/common/easyui-include.jsp"%>
	<script type="text/JavaScript">
		$(function(){
			reinitIframe();
			$("#helathMenuNav li, #helathMenuNav2 li").bind("click", function(){
				$("#helathMenuNav li, #helathMenuNav2 li").removeClass("indexMenu_secondary_activation");
				$(this).addClass("indexMenu_secondary_activation");
				if($(this).attr("id") == "hMenu0")
				{
					$(".tree-group-li").show();
					$(".tree-item-label").attr("id", "");
					$(".tree-group-label").removeClass("tree-group-label-cur");
				}	
				else
				{
					$(".tree-group-li").hide();
					$("li[name='"+$(this).attr("id")+"']").show();
					$("li[name='"+$(this).attr("id")+"']").find(".tree-item-label").each(function(){
						$(this).click();
						$(this).find("a").each(function(){
							$("#mainFrame").attr("src", $(this).attr("href"));
						});
						return false;
					})
				}	
			});
			
			$(".tree-group-label").bind("click", function(){
				$(".tree-group-label").removeClass("tree-group-label-cur");
				$(this).addClass("tree-group-label-cur");
				var obj = this;
				$(this).children(".tree-item-arrow").each(function(){
					if($(this).hasClass("tree-item-arrow-hx"))
					{
						$(this).removeClass("tree-item-arrow-hx");
						$(obj).next().show();
					}	
					else
					{
						$(this).addClass("tree-item-arrow-hx");
						$(obj).next().hide();
					}	
				});
			});
			
			$(".tree-item-label").bind("click", function(){
				$(".tree-group-label").removeClass("tree-group-label-cur");
				$(".tree-item-label").attr("id", "");
				$(this).attr("id", "tree-item-label-cur");
				$(this).parent().parent().prev().addClass("tree-group-label-cur");
			});
		});
	
		function reinitIframe() 
		{
			var iframe = document.getElementById("mainFrame");
			try {
				var bHeight = iframe.contentWindow.document.body.scrollHeight;
				var dHeight = iframe.contentWindow.document.documentElement.scrollHeight;
				var height = Math.min(bHeight, dHeight);
				height = Math.max($(window).height() - $("#top-table").height(), height);
				iframe.height = height;
				$(".main-left").css("height", height);
			} catch (ex) {
			}
			
			//$("#center-table").attr("height", $(window).height() - $("#top-table").height());
			//$("#mainFrame").attr("height", $(window).height() - $("#top-table").height());
			//$(".main-left").css("height", $(window).height() - $("#top-table").height()-10);
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
					else
					{
						$("#userList").html("");
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
			if(user.photo != null && user.photo != "" && typeof(user.photo) != "undefined")
			{
				$("#header_photo").attr("src", "<c:url value='/'/>" + user.photo);
			}	
			else
			{
				$("#header_photo").attr("src", "<c:url value='/nurse/themes/images/btn_editor.png'/>");
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
		
		function funSendInfoList()
		{
			var treeNodes = $('#userTree').tree("getChecked");
			var userFlys = [];
			for(var i=0;i<treeNodes.length;i++)
			{
				if(treeNodes[i].id != 0)
				{
					userFlys.push(treeNodes[i].id);
				}
			}
			
			if(userFlys.length > 0)
			{
				/**打开进度条**/
				$.ajax({
					url : _ctx_ + "/n/search/sendMsgList.do?a="+ Math.random(),
					type : 'post',
					dataType : 'json',
					data : 
					{
						"receiverIds": userFlys.join(","),
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
							$.messager.alert("提示", data.msg, "info");
						}
					}
				});
			}	
			else 
			{
				$.messager.alert("提示", "请先选择留言用户", "info");
			}
		}
		function openSendSMS()
		{
			PageMain.funCreateWinInfoNew("#div_win", "<c:url value='/nurse/pages/send_alluser_msg_info.jsp'/>", {});
		}
	</script>
  </head>
<body style="padding: 0px; margin: 0px; min-width: 1000px;">
	<table cellpadding="0" cellspacing="0" style="width: 100%; min-width:904px; overflow: hidden;" border="0" id="top-table">
		<tr>
			<td style="height: 70px; max-height: 70px; width:452px; min-width:452px; background: url('<c:url value='/nurse/themes/images/top-left.png'/>')  repeat-y;">&nbsp;</td>
			<td style="height: 70px; max-height: 70px; background: #aaa0a1;">&nbsp;</td>
			<td style="height: 70px; max-height: 70px; width:452px; min-width:452px; background: url('<c:url value='/nurse/themes/images/top-right.png'/>')  repeat-y;">&nbsp;</td>
		</tr>
		<tr>
			<td style="height: 40px; max-height: 40px;" colspan="3">
				<table cellpadding="0" cellspacing="0" border="0" style="height:40px; width: 100%;">
					<tr>
						<td style="width:226px; min-width:226px; background: url('<c:url value='/nurse/themes/images/menu-left.png'/>')  no-repeat;">&nbsp;</td>
						<td style=" background: url('<c:url value='/nurse/themes/images/menu-center.png'/>');">&nbsp;</td>
						<td style="width:226px; min-width:226px; background: url('<c:url value='/nurse/themes/images/menu-right.png'/>')  no-repeat;">&nbsp;</td>
					</tr>
				</table>
			
			</td>
		</tr>
	</table>	
	<table cellpadding="0" cellspacing="0" style="width: 100%;" border="0" id="center-table">
		<tr>
			<td style="width:200px;" valign="top">
				<div class="main-left">
				<ul class="left-tree">
					<li name="hMenu1" class="tree-group-li">
						<div id="health-tree-group" class="tree-group-label">
							<span class="tree-item-text">我的档案</span>
							<span class="tree-item-arrow"></span>
						</div>
						<ul class="">
							<li id="tree-gjcx-li">
								<div class="tree-item-label">
									<span class="tree-item-text" title="我的档案">
										<a style="display:block;text-decoration:none; color:#000; " href="<c:url value='/n/search/baseuser.do'/>" target="mainFrame">我的档案</a>
									</span>
								</div>
							</li>
						</ul>
					</li>
					<li name="hMenu2" class="tree-group-li">
						<div id="health-tree-group" class="tree-group-label">
							<span class="tree-item-text">我的活动</span>
							<span class="tree-item-arrow"></span>
						</div>
						<ul class="">
							<li id="tree-gjcx-li">
								<div class="tree-item-label">
									<span class="tree-item-text" title="我的活动">
										<a style="display:block;text-decoration:none; color:#000; " href="<c:url value='/n/search/activity.do'/>" target="mainFrame">我的活动</a>
									</span>
								</div>
							</li>
						</ul>
					</li>
					<li name="hMenu3" class="tree-group-li">
						<div id="health-tree-group" class="tree-group-label">
							<span class="tree-item-text">我的服务</span>
							<span class="tree-item-arrow"></span>
						</div>
						<ul class="">
							<li id="tree-gjcx-li">
								<div class="tree-item-label">
									<span class="tree-item-text" title="我的服务">
										<a style="display:block;text-decoration:none; color:#000; " href="<c:url value='/n/search/service.do'/>" target="mainFrame">我的服务</a>
									</span>
								</div>
							</li>
						</ul>
					</li>
					<li name="hMenu4" class="tree-group-li">
						<div id="health-tree-group" class="tree-group-label">
							<span class="tree-item-text">我的签约</span>
							<span class="tree-item-arrow"></span>
						</div>
						<ul class="">
							<li id="tree-gjcx-li">
								<div class="tree-item-label">
									<span class="tree-item-text" title="我的签约">
										<a style="display:block;text-decoration:none; color:#000; " href="<c:url value='/n/search/nurseRequest.do'/>" target="mainFrame">我的签约</a>
									</span>
								</div>
							</li>
						</ul>
					</li>
					<li name="hMenu5" class="tree-group-li">
						<div id="health-tree-group" class="tree-group-label">
							<span class="tree-item-text">平台医生</span>
							<span class="tree-item-arrow"></span>
						</div>
						<ul class="">
							<li id="tree-gjcx-li">
								<div class="tree-item-label">
									<span class="tree-item-text" title="平台医生">
										<a style="display:block;text-decoration:none; color:#000; " href="<c:url value='/n/search/doctor.do'/>" target="mainFrame">平台医生</a>
									</span>
								</div>
							</li>
						</ul>
					</li>
				</ul>
			</div>
			</td>
			<td valign="top" align="left">
				<iframe src="<c:url value='/n/search/home.do'/>" align="top" border="0" width="100%" scrolling="no" height="200" frameborder="0" name="mainFrame" id="mainFrame" onload="reinitIframe();"></iframe>
			</td>
			<td style="width: 240px; background: #f6f6f6; border-left: 1px solid #ccc;" valign="top" align="center">
				<div style="width: 230px; height: 10px;"></div>
				<div class="user_list">
			       <div class="user_list_header">
			       我的用户（<span id="memberNum" style="color:#ff9600">0</span>&nbsp;个）<a href="javascript:void(0)" onclick="openSendSMS();" style="display: block;"><img src="<c:url value='/nurse/themes/images/mail.png'/>"/></a>
			       </div>
			       <div class="bg_search">
			         <input type="text" class="search_input" id="search_name" title="请输入用户姓名">
			         <a href="javascript:void(0)" onclick="funSearchUserInfo(1);"><img title="搜索用户" src="<c:url value='/nurse/themes/images/search.png'/>"></a>
			       </div>
			       <div class="task_list" style="overflow-y: hidden; outline: none;" tabindex="5000">
			         <ul id="userList">
			         </ul>
			       </div>
			      </div>
			</td>
		</tr>
	</table>
	<div style="height:70px; width:100%; position: absolute; top: 0px; left:30px; background: url('<c:url value='/nurse/themes/images/logo.png'/>') left no-repeat;">
  	</div>
  	<div style="height:30px; width:100%; position: absolute; top: 40px; right: 20px;">
  		<span style="float: right;"><a href="<c:url value='/n/search/logout.do'/>" style="color: #fff; text-decoration: none; display: block; font-size: 12px;">退出</a></span>
  	</div>
	
	<div style="height:30px; width:100%; position: absolute; top: 76px; left: 0px;">
		<div class="indexMenu_secondary_main" style="margin: 0 0 0 40px;">
		<ul id="helathMenuNav">
          <li id="hMenu0" class="indexMenu_secondary_activation"><a href="<c:url value='/n/search/home.do'/>" target="mainFrame" title="首页">首页</a></li>
          <li id="hMenu1"><a href="javascript:void(0)" target="mainFrame" title="我的档案">我的档案</a></li>
          <li id="hMenu2"><a href="javascript:void(0)" target="mainFrame" title="我的活动">我的活动</a></li>
          <li id="hMenu3"><a href="javascript:void(0)" target="mainFrame" title="我的服务">我的服务</a></li>
          <li id="hMenu4"><a href="javascript:void(0)" target="mainFrame" title="我的签约">我的签约</a></li>
          <li id="hMenu5"><a href="javascript:void(0)" target="mainFrame" title="平台医生">平台医生</a></li>
        </ul> 
       </div>
	</div>
</body>
</html>
