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
			$("#center-table").attr("height", $(window).height() - $("#top-table").height());
			$("#mainFrame").attr("height", $(window).height() - $("#top-table").height());
			$(".main-left").css("height", $(window).height() - $("#top-table").height()-10);
		}
		
		function funFeedBack()
		{
			PageMain.funCreateWinInfoNew("#div_win", "<c:url value='/patient/pages/feedback.jsp'/>", {});
		}
		
		function funSaveFeedBackInfo()
		{
			/**打开进度条**/
			$.ajax({
				url : _ctx_ + "/p/query/addFeedBack.do?a="+ Math.random(),
				type : 'post',
				dataType : 'json',
				data : 
				{
					"content": $("#in002").val(),
					"type": $("#in001").val()	
				},
				error:function(data)
				{
				},
				success:function(data)
				{
					alert(data.msg);
					if(data.success)
					{
						$('#div_win').window('close');
					}
				}
			});
		}
		
		//
		window.setInterval("reinitIframe();", 500);
	</script>
  </head>
<body style="padding: 0px; margin: 0px; min-width: 1000px;">
	<table cellpadding="0" cellspacing="0" style="width: 100%; min-width:904px; overflow: hidden;" border="0" id="top-table">
		<tr>
			<td style="height: 70px; max-height: 70px; width:452px; min-width:452px; background: #2aa495;">&nbsp;</td>
			<td style="height: 70px; max-height: 70px; background: #2aa495;">&nbsp;</td>
			<td style="height: 70px; max-height: 70px; width:452px; min-width:452px; background:#2aa495;">&nbsp;</td>
		</tr>
		<tr>
			<td style="height: 40px; max-height: 40px;" colspan="3">
				<table cellpadding="0" cellspacing="0" border="0" style="height:40px; width: 100%;">
					<tr>
						<td style="width:226px; min-width:226px; background: #16bab1;">&nbsp;</td>
						<td style=" background: #16bab1;">&nbsp;</td>
						<td style="width:226px; min-width:226px; background: #16bab1;">&nbsp;</td>
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
					<li name="hMenu0" class="tree-group-li">
						<div id="health-tree-group" class="tree-group-label">
							<span class="tree-item-text">健康监护</span>
							<span class="tree-item-arrow"></span>
						</div>
						
						<ul class="">
							<li id="tree-xtjc-li">
								<div class="tree-item-label">
									<span class="tree-item-text" title="血糖信息">
										<a style="display:block;text-decoration:none; color:#000; " href="<c:url value='/p/chart2.do'/>" target="mainFrame">血糖信息</a>
									</span>
								</div>	
							</li>
							<li id="tree-xtjc-li">
								<div class="tree-item-label">
									<span class="tree-item-text" title="血圧信息">
										<a style="display:block;text-decoration:none; color:#000; " href="<c:url value='/p/chart4.do'/>" target="mainFrame">血圧信息</a>
									</span>
								</div>	
							</li>
							<li id="tree-xtjc-li">
								<div class="tree-item-label">
									<span class="tree-item-text" title="体温信息">
										<a style="display:block;text-decoration:none; color:#000; " href="<c:url value='/p/chart3.do'/>" target="mainFrame">体温信息</a>
									</span>
								</div>	
							</li>
							<li id="tree-xtjc-li">
								<div class="tree-item-label">
									<span class="tree-item-text" title="用药管理">
										<a style="display:block;text-decoration:none; color:#000; " href="<c:url value='/p/query/medicine.do'/>" target="mainFrame">用药管理</a>
									</span>
								</div>	
							</li>
						</ul>
					</li>
				
					
					<li name="hMenu2" class="tree-group-li">
						<div id="safe-tree-group" class="tree-group-label">
							<span class="tree-item-text">健康档案</span>
							<span class="tree-item-arrow"></span>
						</div>
						<ul class="">
							<li id="tree-wzcx-li">
								<div class="tree-item-label">
									<span class="tree-item-text" title="基本信息">
										<a style="display:block;text-decoration:none; color:#000; " href="<c:url value='/p/query/userbase.do'/>" target="mainFrame">基本信息</a>
									</span>
								</div>
							</li>
							
							<li id="tree-gjcx-li">
								<div class="tree-item-label">
									<span class="tree-item-text" title="健康病历">
										<a style="display:block;text-decoration:none; color:#000; " href="<c:url value='/p/jkbl.do'/>" target="mainFrame">健康病历</a>
									</span>
								</div>
							</li>
							
							<li id="tree-gjcx-li">
								<div class="tree-item-label">
									<span class="tree-item-text" title="亲情号码">
										<a style="display:block;text-decoration:none; color:#000; " href="<c:url value='/p/query/relative.do'/>" target="mainFrame">亲情号码</a>
									</span>
								</div>
							</li>
							
							<li id="tree-gjcx-li">
								<div class="tree-item-label">
									<span class="tree-item-text" title="密码修改">
										<a style="display:block;text-decoration:none; color:#000; " href="<c:url value='/p/modifypwd.do'/>" target="mainFrame">密码修改</a>
									</span>
								</div>
							</li>
						</ul>
					</li>
					
					<li name="hMenu1" class="tree-group-li">
						<div id="m-health-tree-group" class="tree-group-label">
							<span class="tree-item-text">健康分析</span>
							<span class="tree-item-arrow"></span>
						</div>
						<ul class="">
							<li id="tree-jjhj-li">
								<div class="tree-item-label">
									<span class="tree-item-text" title="健康报告">
										<a style="display:block;text-decoration:none; color:#000;" href="<c:url value='/p/query/healthBg.do'/>" target="mainFrame">健康报告</a>
									</span>
								</div>
							</li>
							
							<li id="tree-jjhj-li">
								<div class="tree-item-label">
									<span class="tree-item-text" title="用药建议">
										<a style="display:block;text-decoration:none; color:#000;" href="<c:url value='/p/query/advice.do?adviceType=1'/>" target="mainFrame">用药建议</a>
									</span>
								</div>
							</li>
							
							<li id="tree-jjhj-li">
								<div class="tree-item-label">
									<span class="tree-item-text" title="饮食建议">
										<a style="display:block;text-decoration:none; color:#000; " href="<c:url value='/p/query/advice.do?adviceType=2'/>" target="mainFrame">饮食建议</a>
									</span>
								</div>
							</li>
							
							<li id="tree-jjhj-li">
								<div class="tree-item-label">
									<span class="tree-item-text" title="运动建议">
										<a style="display:block;text-decoration:none; color:#000; " href="<c:url value='/p/query/advice.do?adviceType=3'/>" target="mainFrame">运动建议</a>
									</span>
								</div>
							</li>
							
							<li id="tree-jjhj-li">
								<div class="tree-item-label">
									<span class="tree-item-text" title="就诊建议">
										<a style="display:block;text-decoration:none; color:#000; " href="<c:url value='/p/query/advice.do?adviceType=4'/>" target="mainFrame">就诊建议</a>
									</span>
								</div>
							</li>
							
						</ul>
					</li>
					
						<li name="hMenu3" class="tree-group-li">
							<div id="app-tree-group" class="tree-group-label">
								<span class="tree-item-text">服务和设备</span>
								<span class="tree-item-arrow"></span>
							</div>
							<ul>
								<li id="tree-gjcx-li">
									<div class="tree-item-label">
										<span class="tree-item-text" title="我的活动">
											<a style="display:block;text-decoration:none; color:#000; " href="<c:url value='/p/query/activity.do'/>" target="mainFrame">我的活动</a>
										</span>
									</div>
								</li>
								<li id="tree-gjcx-li">
									<div class="tree-item-label">
										<span class="tree-item-text" title="我的服务">
											<a style="display:block;text-decoration:none; color:#000; " href="<c:url value='/p/query/service.do'/>?type=1" target="mainFrame">我的服务</a>
										</span>
									</div>
								</li>
								<li id="tree-gjcx-li">
									<div class="tree-item-label">
										<span class="tree-item-text" title="第三方服务">
											<a style="display:block;text-decoration:none; color:#000; " href="<c:url value='/p/query/service.do'/>?type=3" target="mainFrame">第三方服务</a>
										</span>
									</div>
								</li>
								<li id="tree-gjcx-li">
									<div class="tree-item-label">
										<span class="tree-item-text" title="我的设备">
											<a style="display:block;text-decoration:none; color:#000; " href="<c:url value='/p/query/device.do'/>?deviceType=-1&type=-1" target="mainFrame">我的设备</a>
										</span>
									</div>
								</li>	
							</ul>
						</li>
					
					
					<li name="hMenu4" class="tree-group-li">
						<div id="sync-tree-group" class="tree-group-label">
							<span class="tree-item-text">我的医护人</span>
							<span class="tree-item-arrow"></span>
						</div>
						
						<ul>
							<li id="tree-gjcx-li">
								<div class="tree-item-label">
									<span class="tree-item-text" title="我的医护人">
										<a style="display:block;text-decoration:none; color:#000; " href="<c:url value='/p/query/mynuser.do'/>" target="mainFrame">我的医护人</a>
									</span>
								</div>
							</li>		
						</ul>
					</li>
					
					
					<li name="hMenu5" class="tree-group-li">
						<div id="sync-tree-group" class="tree-group-label">
							<span class="tree-item-text">快乐驿站</span>
							<span class="tree-item-arrow"></span>
						</div>
						
						<ul>
							<li id="tree-gjcx-li">
								<div class="tree-item-label">
									<span class="tree-item-text" title="快乐驿站">
										<a style="display:block;text-decoration:none; color:#000; " href="<c:url value='/p/query/post.do'/>" target="mainFrame">快乐驿站</a>
									</span>
								</div>
							</li>		
						</ul>
					</li>
				</ul>
			</div>
			</td>
			<td valign="top" align="left">
				<iframe src="<c:url value='/p/query/home.do'/>" align="top" border="0" width="100%" scrolling="auto" frameborder="0" name="mainFrame" id="mainFrame" onload="reinitIframe();"></iframe>
			</td>
		</tr>
	</table>
	<div style="height:70px; width:100%; position: absolute; top: 0px; left:30px; background: url('<c:url value='/patient/themes/images/logo.png'/>') left no-repeat;">
  	</div>
  	<div style="height:30px; width:100%; position: absolute; top: 40px; right: 20px;">
  		<span style="float: right; padding: 0 5px;"><a href="javascript:funFeedBack()" style="color: #fff; text-decoration: none; display: block; font-size: 12px;">反馈</a></span>
  		<div style="float: right; width: 1px; height:12px; background:#fff;"></div>
  		<span style="float: right; padding: 0 5px;"><a href="<c:url value='/p/query/logout.do'/>" style="color: #fff; text-decoration: none; display: block; font-size: 12px;">退出</a></span>
  	</div>
  	
  	<div style="height:30px; width:100%; position: absolute; top: 76px; left: 0px;">
		<div class="indexMenu_secondary_main" style="margin: 0 0 0 40px;">
		<ul id="helathMenuNav">
          <li id="hMenu0" class="indexMenu_secondary_activation"><a href="<c:url value='/p/query/home.do'/>" target="mainFrame" title="首页">首页</a></li>
		  <li id="hMenu2"><a href="javascript:void(0)" title="健康档案">健康档案</a></li>
		  <li id="hMenu1"><a href="javascript:void(0)" title="健康分析">健康分析</a></li>
          <li id="hMenu3"><a href="javascript:void(0)" target="mainFrame" title="服务和设备">服务和设备</a></li>
          <li id="hMenu4"><a href="javascript:void(0)" target="mainFrame" title="我的医护人">我的医护人</a></li>
          <li id="hMenu5"><a href="javascript:void(0)" target="mainFrame" title="快乐驿站">快乐驿站</a></li>
        </ul> 
       </div>
	</div>
</body>
</html>
