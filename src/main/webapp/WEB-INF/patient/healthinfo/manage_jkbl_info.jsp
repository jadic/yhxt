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
	<link rel="stylesheet" href="<c:url value='/patient/themes/health_records.css'/>" type="text/css"/>
	<script type="text/JavaScript">
		$(function() {
			
			var $div_hrli = $("div.healthRecords_menu_yuan ul li");
			//健康病史页签
			var tab_map = {0:1};
			//健康病史页签加载函数
			//var function_map = {0:"query_memberBaseInfo",1:"queryMemberHabit",2:"queryMemberFamilyDisease",
			//								3:"queryMemberHtComplication",4:"queryMemberIllnessHistory",5:"queryMemberHtSpecial",6:"queryMemberMedicalExaminationList"};
			var iframe_map = {0:"memberHabitIframe",1:"memberFamilyDiseaseIframe",
											2:"memberHtComplicationIframe",3:"memberIllnessHistoryIframe",4:"memberHtSpecialIframe",
											5:"memberMedicalExamintaionIframe"};
			var page_map = {0:"query/memberhabit.do",1:"query/familydisease.do",
											2:"memberhtcomplication",3:"diseasehis.do",4:"memberhtspecial",
											5:"medicalexamination"};
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
				    document.getElementById(frame_sel).src = "<c:url value='/p/'/>"+page;
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
<body>
  <div class="health_records">
  <div class="title_informationModify"><span class="tgrey_title_informationModify">健康</span>病历</div>
  <!--tab_healthRecords start-->
  <div class="tab_healthRecords">
	<div class="healthRecords_menu_yuan">
           <ul>
             <li title="生活习惯" class="selected_healthRecords_yuan" ><img src="<c:url value='/patient/themes/images/habit.png'/>"><span>生活习惯</span></li>
             <li title="家族遗传史"><img src="<c:url value='/patient/themes/images/family.png'/>"><span>家族遗传史</span></li>
             <li title="当前并发症" style="display: none;"><img src="<c:url value='/patient/themes/images/cp.png'/>"><span>当前并发症</span></li>
             <li title="疾病史"><img src="<c:url value='/patient/themes/images/disease.png'/>"><span>疾病史</span></li>
             <li title="高血压专项" style="display: none;"><img src="<c:url value='/patient/themes/images/bp.png'/>"><span>高血压专项</span></li>
             <li style="margin-right: -25px" title="健康检查" style="display: none;"><img src="<c:url value='/patient/themes/images/health.png'/>"><span>健康检查</span></li>
             
           </ul>
	 </div>
    <div class="tab_healthRecords_box">
       	
      <div>
      		<iframe id="memberHabitIframe"  name = "memberHabitIframe" src="<c:url value='/p/query/memberhabit.do'/>"  frameborder="0" width="100%"  scrolling="no"   height="350px" ></iframe>
      </div>
      
      <div class="hide_healthRecords">
			<iframe id="memberFamilyDiseaseIframe"  name = "memberFamilyDiseaseIframe" src=""  frameborder="0" width="100%"  scrolling="no"   height="350px" ></iframe>
      </div>
      
      <div class="hide_healthRecords">
      		<iframe id="memberHtComplicationIframe"  name = "memberHtComplicationIframe" src=""  frameborder="0" width="100%"  scrolling="no"   height="600px" ></iframe>
      </div>
      <div class="hide_healthRecords">
      		<iframe id="memberIllnessHistoryIframe"  name = "memberIllnessHistoryIframe" src=""  frameborder="0" width="100%"  scrolling="no"  height="600px" ></iframe>
      </div>
      <div class="hide_healthRecords">
      		<iframe id="memberHtSpecialIframe"  name = "memberHtSpecialIframe" src=""  frameborder="0" width="100%"  scrolling="no"    height="900px" ></iframe>
      </div>
      
      <div class="hide_healthRecords">
 			<iframe id="memberMedicalExamintaionIframe"  name = "memberMedicalExamintaionIframe" src=""  frameborder="0" width="100%"  scrolling="no"   height="650px" ></iframe>
      </div>
  </div>
  <!--tab_healthRecords end-->
</div>

</body>
</html>
