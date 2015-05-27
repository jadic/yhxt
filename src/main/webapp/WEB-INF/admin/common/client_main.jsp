<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
  	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />  
    <title>自己人健康服务中心--运营管理</title>
 	<%@ include file="/WEB-INF/admin/common/top-include.jsp" %>
 	<link rel="stylesheet" href="<c:url value='/admin/themes/self/blue/main.css'/>" type="text/css"/>
 	<script type="text/javascript" src="<c:url value='/admin/scripts/common/client_main.js'/>" ></script>
 	<style>
 		.njty_real_data_body2{position: absolute; z-index: 200; width: 100%; text-align:center; padding:0px 0 0 0; height: 1px; background-color: rgb(220, 226, 241); opacity: 0.95; filter: alpha(opacity=95); border:0px; bottom:0px;}
 	</style>
 	<script type="text/javascript" src="<c:url value="/common/xheditor/xheditor-1.1.9-zh-cn.min.js"/>"></script>
  </head>
  <body class="easyui-layout">
  	<div region="north" class="njty_main_head_top" style="height: 111px; border: 0px;" >
  		<div style="height: 80px; border: 1px solid #ccc;" class="njty_main_logo">
  		
	  		<div style="float: right;  height:78px; width: 50px;"></div>
	  		<div style="float: right;  height:78px;">
				<div class="njty_menu" id="440000">
					<img src="<c:url value='/admin/themes/self/images/top-9.png'/>"/>
					<div>信息查询</div>
					<div id="mm440000" style="width:145px; display: none;">
						<div data-options="iconCls:'icon-26'" onclick="PageMain.funAddPanel('/a/querySport.do','信息查询>> 运动记录');  $('#440000').click()">运动记录</div>
						<div class="menu-sep"></div>
						<div data-options="iconCls:'icon-26'" onclick="PageMain.funAddPanel('/a/queryDiet.do','信息查询>> 饮食记录');  $('#440000').click()">饮食记录</div>
						<div class="menu-sep"></div>
						<div data-options="iconCls:'icon-26'" onclick="PageMain.funAddPanel('/a/queryMentalStatus.do','信息查询>> 心理状态记录');  $('#440000').click()">心理状态记录</div>
						<div class="menu-sep"></div>
						<div data-options="iconCls:'icon-26'" onclick="PageMain.funAddPanel('/a/queryFeedback.do','信息查询>> 用户反馈');  $('#440000').click()">用户反馈</div>
					</div>
				</div>
        
				<div class="njty_menu" id="430000">
					<img src="<c:url value='/admin/themes/self/images/top-7.png'/>"/>
					<div>基础数据</div>
					<div id="mm430000" style="width:145px; display: none;">
						<div data-options="iconCls:'icon-26'" onclick="PageMain.funAddPanel('/a/service.do','基础数据>> 服务管理');  $('#430000').click()">服务管理</div>
						<div class="menu-sep"></div>
						<div data-options="iconCls:'icon-26'" onclick="PageMain.funAddPanel('/a/activity.do','基础数据>> 活动管理');  $('#430000').click()">活动管理</div>
						<div class="menu-sep"></div>
						<div data-options="iconCls:'icon-26'" onclick="PageMain.funAddPanel('/a/news.do','基础数据>> 资讯管理');  $('#430000').click()">资讯管理</div>
						<div class="menu-sep"></div>
						<div data-options="iconCls:'icon-26'" onclick="PageMain.funAddPanel('/a/doctor.do','基础数据>> 医生管理');  $('#430000').click()">医生管理</div>
						<div class="menu-sep"></div>
						<div data-options="iconCls:'icon-26'" onclick="PageMain.funAddPanel('/a/device.do','基础数据>> 用户反馈');  $('#430000').click()">设备管理</div>
					</div>
				</div>
        
				<div class="njty_menu" id="420000">
					<img src="<c:url value='/admin/themes/self/images/top-5.png'/>"/>
					<div>字典管理</div>
					<div id="mm420000" style="width:145px; display: none;">
						<div data-options="iconCls:'icon-26'" onclick="PageMain.funAddPanel('/a/devtype.do','字典管理>> 设备类型管理');  $('#420000').click()">设备类型管理</div>
						<div class="menu-sep"></div>
						<div data-options="iconCls:'icon-26'" onclick="PageMain.funAddPanel('/a/hospital.do','字典管理>> 医院信息管理');  $('#420000').click()">医院信息管理</div>
						<div class="menu-sep"></div>
						<div data-options="iconCls:'icon-26'" onclick="PageMain.funAddPanel('/a/hospitalDept.do','字典管理>> 医院科室管理');  $('#420000').click()">医院科室管理</div>
						<div class="menu-sep"></div>
						<div data-options="iconCls:'icon-26'" onclick="PageMain.funAddPanel('/a/foodType.do','字典管理>> 食品类型管理');  $('#420000').click()">食品类型管理</div>
						<div class="menu-sep"></div>
						<div data-options="iconCls:'icon-26'" onclick="PageMain.funAddPanel('/a/foodItem.do','字典管理>> 食品管理');  $('#420000').click()">食品项目管理</div>
						<div class="menu-sep"></div>
						<div data-options="iconCls:'icon-26'" onclick="PageMain.funAddPanel('/a/sportType.do','字典管理>> 运动类型管理');  $('#420000').click()">运动类型管理</div>
						<div class="menu-sep"></div>
						<div data-options="iconCls:'icon-26'" onclick="PageMain.funAddPanel('/a/sportItem.do','字典管理>> 运动项目管理');  $('#420000').click()"> 运动项目管理</div>
					</div>
				</div>
				
				<div class="njty_menu" id="410000">
					<img src="<c:url value='/admin/themes/self/images/top-8.png'/>"/>
					<div>系统管理</div>
					<div id="mm410000" style="width:145px; display: none;">
						<div data-options="iconCls:'icon-26'" onclick="PageMain.funAddPanel('/a/user.do','系统管理>> 用户管理');  $('#410000').click()">用户管理</div>
						<div class="menu-sep"></div>
						<div data-options="iconCls:'icon-26'" onclick="PageMain.funLogout();  $('#410000').click()">安全退出</div>
					</div>
				</div>
	  		</div>
  		</div>
  		<div class="njty_bottom_tip_content">
 			<div class="njty_bottom_tip_content_left">
	 			<div class="njty_bottom_tip_content_left_01"></div>
	 			<div class="njty_bottom_tip_content_left_02">当前位置：<span id="mainTip">首页</span></div>
	 			<div class="njty_bottom_tip_content_left_03"></div>
  			</div>
  			<div class="njty_bottom_tip_content_right">
  				<div class="njty_bottom_tip_content_right_01"></div>
  				<div class="njty_main_head_12" onclick="PageMain.funLogout();">退出</div>
  			</div>
  		</div>
  		<div class="njty_bottom_content">
  			<div class="njty_bottom_content_left"></div>
  			<div class="njty_bottom_content_right"></div>
  		</div>
	</div>
	
	<!-- 主体 -->
	<div region="center" border="false">
		<div id="div_center" class="easyui-panel" fit="true" style="padding: 1px;">
		</div>
	</div>
	
	<!-- 左边 -->
	<div region="west"  border="false" class="njty_main_middle_left" style="width: 7px;">
	</div>
	
	<!-- 右边 -->
	<div region="east"  border="false" class="njty_main_middle_right" style="width: 7px;">
	</div>
	
	<!-- 下部 -->
	<div region="south" border="false" class="njty_main_bottom">
		<div>
			<div class="njty_main_bottom_left"></div>
			<div style="font-size: 11px; -webkit-text-size-adjust: none; line-height: 25px; float: left; cursor: pointer;" onclick="PageMain.funAddPanelUrl('/a/online.do','在线人数列表');PageMain.funOnLineCnt();">共<span style="color: #0066cc; font-weight: bold; padding: 0 4px;" id="oCnt">1</span>人在线</div>
			<div class="njty_main_bottom_right"></div>
			<div style="font-size: 11px; -webkit-text-size-adjust: none; line-height: 25px; float: right; cursor: pointer;" onclick="PageMain.funAddPanelUrl('/a/updatelog.do','软件版本信息');">V1版（2015-01-31）</div>
		</div>
		<div style="margin:0 150px 0 100px; position: relative; text-align: center; border: 0px solid #ff0000; line-height: 20px;">&#169;&nbsp;<span style="font-size:10px; -webkit-text-size-adjust: none;"></span></div>
	</div>
 </body>
</html>