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
	<script type="text/JavaScript">
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

	</script>
  </head>
<body>
	<div class="index_health_header">
      <div class="bgTop_index">
        <div class="index_out">
          <ul>
           <li class="index_wechat"><a href="/jsp/health/index/wechat.jsp" title="995120健康服务中心官方微信" target="_blank">官方微信</a></li>
           <li class="index_bolg"><a href="http://weibo.com/5137507355/profile" title="995120健康服务中心官方微博" target="_blank">官方微博</a></li>
           <li class="index_service_phone" title="400电话">400-0785-120</li>
           <li class="index_username">欢迎您，qbws1</li>
           <li class="index_signout">
               <a href="javascript:void(0)" onclick="logout();" title="安全退出">安全退出</a>
               <form action="/h/level.helowin" id="logoutForm" name="logoutForm" method="post">
               </form>
           </li> 
          </ul>
        </div>
      </div>
      <!--indexMenu start-->
      <div class="logo_menu">
        <div class="bg_logo">
          <div class="index_menu">
            <ul id="topMenuNav">
              <li id="topMenu0"></li>
              <li id="topMenu1" onclick="activeTopMenu(1)" class="activation"><a href="/h/d.helowin?code=rbU0keyV8uUf5zjISU3COnmt6BbqNwRApd6uWYU7Db8qqG0pKMB1RX5kOcVAmjLC&amp;iv=b3ylodwl5ncxn5l3" title="健康中心">健康中心</a></li>
              <li id="topMenu2"><a href="/h/d.helowin?code=BXW5iT7m5kPJ4k+m92PMRzGQyCrjVFpuEftlH67GeCAGY1e/txXWPEPRm435vCTK&amp;iv=b3ylodwl5ncxn5l3" title="APP下载、Android、iOS" target="_blank">应用下载</a></li>
              <li id="topMenu3"><a href="/h/d.helowin?code=jyPuT6KYh9SAETaATafvRwrV5cNO8uXAzUg+MW3s96Ha8Jvs8zwEVyOVJfmehs4b&amp;iv=b3ylodwl5ncxn5l3" title="新手上路" target="_blank">新手上路</a></li>
            </ul>
          </div>
        </div>
      </div>
    </div>
    
    <div class="indexMenu_secondary">
      <div class="indexMenu_secondary_main">
        <ul id="helathMenuNav">
          <li id="hMenu0" onclick="activeHelathMenu(0)" class="indexMenu_secondary_activation"><a href="/jsp/health/welcome/welcome.jsp" target="mainFrame" title="欢迎页">首页</a></li>
          <li id="hMenu1" onclick="activeHelathMenu(1)"><a href="<c:url value='/p/healthanalysis.do'/>" target="mainFrame" title="健康分析">健康分析</a></li>
          
          <li id="hMenu3" onclick="activeHelathMenu(3)"><a href="<c:url value='/p/health.do'/>" target="mainFrame" title="健康档案">健康档案</a></li>
          <li id="hMenu4" onclick="activeHelathMenu(4)"><a href="<c:url value='/p/servicedevice.do'/>" target="mainFrame" title="我的设备">我的设备</a></li>
          <li id="hMenu5" onclick="activeHelathMenu(5)"><a href="/jsp/health/account/account.jsp" target="mainFrame" title="账户/套餐">我的医护人</a></li>
          <li id="hMenu6" onclick="activeHelathMenu(6)"><a href="/jsp/health/doctor_report/reportlist.jsp" target="mainFrame" title="月报">医生报告</a></li>
        </ul> 
      </div>
    </div>
    
	<div class="index_health_middle" style="background: #ededed;">
    <div class="index_health_main">
      <!--index_health_left start-->
      <div class="index_health_left">
        <div class="wInformation">
          <ul>
            <li class="wInformation_img"><a href="/jsp/health/healthrecord/healthrecords.jsp" target="mainFrame" title="健康档案"><img width="80" height="90" id="memberHeadImg" src="/images/health/default_head.gif?t=1425055216216"></a></li>
            <li class="tGrayMax">您好！</li>
            <li class="tGreen"><a class="title_info" href="/jsp/health/healthrecord/healthrecords.jsp" target="mainFrame" title="尹红梅" id="left_memberName">尹红梅</a></li>
            <li class="tGrayMin" style="font-size:8px;">最近2015-02-28 00:14:35</li>
            <li class="wMedical"><a onclick="goToHealthRecord(this)" style="cursor: pointer;" target="mainFrame" title="健康档案">健康档案</a></li>
            <li class="wHome"><a onclick="goToAccount(this)" style="cursor: pointer;" target="mainFrame" title="账户/套餐">账户/套餐</a></li>
            <li class="wBalance">我的余额：<span class="wMoney" id="memberBalanceArea">0</span>
            	<a title="充值" class="title_info" style="margin-left:20px;" onclick="goToRecharge(this)" target="mainFrame">立即充值</a></li>
            <li class="tGray wBalance" id="familyMember">我的家庭成员：
            	
             	
             </li>
            <li class="tGray" id="device">我的设备：
            	<ul id="deviceListUL">
            	    
					<li class="wtBlack">TE8000Y5(无线网络血压计)</li>
					
					<li class="wtaGreen"><a onclick="goToEquipment(this)" target="mainFrame" title="增加设备">增加设备</a></li>
            	</ul>
            </li>
            <li class="tGray" id="hos_doc">我的医院医生：<ul id="hosDocListUL"><li class="wtBlack">郑烨(zhengye)</li><li class="wtaGreen"></li></ul></li>
            <li class="tGray" id="package">我的套餐：<ul id="packageListUL"><li class="wtBlack">医生主动发起短信(剩余：359706天)</li><li class="wtBlack">医生健康月报总结(剩余：359706天)</li><li class="wtBlack">医生血压分析(剩余：359706天)</li><li class="wtBlack">高血压预判套餐(剩余：359706天)</li><li class="wtBlack">试用套餐(剩余：276天)</li><li class="wtaGreen"><a onclick="goToAccountMeal(this)" target="mainFrame" title="增加套餐">增加套餐</a></li></ul></li>
          </ul>
        </div>  
      </div>
      <!--index_health_left end-->
      <!--index_health_right start-->
      <div class="index_health_right">
        <iframe src="/jsp/health/welcome/welcome.jsp" scrolling="no" frameborder="0" name="mainFrame" id="mainFrame" onload="reinitIframe();" height="1388"></iframe>
      </div>
      <!--index_health_right end-->
    </div>
    </div>
</body>
</html>
