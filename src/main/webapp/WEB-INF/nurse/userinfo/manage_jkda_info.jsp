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
	<link rel="stylesheet" href="<c:url value='/nurse/themes/health_records.css'/>" type="text/css"/>
	<script type="text/JavaScript">
		$(function() {
			
			var $div_hrli = $("div.healthRecords_menu_yuan ul li");
			//健康病史页签
			var tab_map = {0:1};
			//健康病史页签加载函数
			//var function_map = {0:"query_memberBaseInfo",1:"queryMemberHabit",2:"queryMemberFamilyDisease",
			//								3:"queryMemberHtComplication",4:"queryMemberIllnessHistory",5:"queryMemberHtSpecial",6:"queryMemberMedicalExaminationList"};
			var iframe_map = {0:"memberHtComplicationIframe", 1:"memberHabitIframe",2:"memberFamilyDiseaseIframe", 3:"memberIllnessHistoryIframe"};
			var page_map = {0:"search/jkdaUserBase.do?userId=${query.userId}",1:"search/memberhabit.do?userId=${query.userId}",2:"search/familydisease.do?userId=${query.userId}",3:"search/diseasehis.do?userId=${query.userId}"};
			$div_hrli.click(function(){	
			   $(this).addClass("selected_healthRecords_yuan").siblings().removeClass("selected_healthRecords_yuan");
			   var index = $div_hrli.index(this);
			   $("div.tab_healthRecords_box > div").eq(index).show().siblings().hide(); 

			   //页签已经加载
				if(index in tab_map){
					   
				}else{
				    //var fn = function_map[index];
				   var frame_sel = iframe_map[index];
				    var page = page_map[index];
				    document.getElementById(frame_sel).src = "<c:url value='/n/'/>"+page;
				    tab_map[index] = 1;
				 }
			});

		});

		
		function sonIframeResize(iframe)
		{
			try
			{
				var bHeight = iframe.contentWindow.document.body.scrollHeight;
				var dHeight = iframe.contentWindow.document.documentElement.scrollHeight;
				var height = Math.min(bHeight, dHeight);
				iframe.height = height;
			}
			catch (ex)
			{

			}
		}
		window.setInterval("sonIframeResize()", 200);
	</script>
  </head>
<body style="background: #ffffff;">
  <div class="health_records">
  <div class="title_informationModify"><span class="tgrey_title_informationModify">健康</span>病历</div>
  <!--tab_healthRecords start-->
  <div class="tab_healthRecords">
	<div class="healthRecords_menu_yuan">
           <ul>
           	 <li title="基本信息" class="selected_healthRecords_yuan"><img src="<c:url value='/nurse/themes/images/basic.png'/>"><span>基本信息</span></li>
             <li title="生活习惯"><img src="<c:url value='/nurse/themes/images/habit.png'/>"><span>生活习惯</span></li>
             <li title="家族遗传史"><img src="<c:url value='/nurse/themes/images/family.png'/>"><span>家族遗传史</span></li>
             <li title="疾病史"><img src="<c:url value='/nurse/themes/images/disease.png'/>"><span>疾病史</span></li>
           </ul>
	 </div>
    <div class="tab_healthRecords_box">
      <div>
      		<iframe id="memberHtComplicationIframe"  name = "memberHtComplicationIframe" src="<c:url value='/n/search/jkdaUserBase.do'/>?userId=${query.userId}"  frameborder="0" width="100%"  scrolling="no"   height="1000px" ></iframe>
      </div>
      <div class="hide_healthRecords">
      		<iframe id="memberHabitIframe"  name = "memberHabitIframe" src=""  frameborder="0" width="100%"  scrolling="no"   height="350px" ></iframe>
      </div>
      
      <div class="hide_healthRecords">
			<iframe id="memberFamilyDiseaseIframe"  name = "memberFamilyDiseaseIframe" src=""  frameborder="0" width="100%"  scrolling="no"   height="350px" ></iframe>
      </div>
      
      <div class="hide_healthRecords">
      		<iframe id="memberIllnessHistoryIframe"  name = "memberIllnessHistoryIframe" src=""  frameborder="0" width="100%"  scrolling="no"  height="600px" ></iframe>
      </div>
  </div>
  <!--tab_healthRecords end-->
</div>

</body>
</html>
