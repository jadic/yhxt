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
				         		'<p class="task_Name" title="清波卫生99">'+data.rows[nItem].name +'</p>'+
				         		'<span class="task_Time">'+data.rows[nItem].stime+'</span>'+
				         	'</li>';
						}	
						$("#userList").html(tmp);
						if(paramFlag == 0)
						{
							cilckUser(0);
						}	
					}
					$("#memberNum").html(data.total);
				}
			});
		}
		
		function cilckUser(item)
		{
			var user = userList[item];
			$("#membername").html(user.name);
			$("#membername").attr("title", user.name);
			$("#sex").html("性别：" + user.genderStr);
			$("#age").html("年龄："+user.genderStr+"岁");
			$("#credentials_id").html(user.credentialNo);
			$("#cell_phone").html(user.cellphone);
			$("#phone").html(user.homePhone);
			$("#address").html(user.homeAddress);
			$("#mainFrame").attr("src", "<c:url value='/n/search/usermain.do'/>?userId="+user.userId);
			
		}
		
		$(function(){
			funSearchUserInfo(0);
		});
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
          <li id="hMenu0" onclick="activeHelathMenu(0)" class="indexMenu_secondary_activation"><a id="ahome" href="<c:url value='/n/search/usermain.do'/>" target="mainFrame" title="欢迎页">首页</a></li>
          <li id="hMenu3" onclick="activeHelathMenu(3)"><a href="<c:url value='/n/search/baseuser.do'/>" target="mainFrame" title="我的档案">我的档案</a></li>
          <li id="hMenu1" onclick="activeHelathMenu(1)"><a href="<c:url value='/n/search/activity.do'/>" target="mainFrame" title="我的活动">我的活动</a></li>
          <li id="hMenu4" onclick="activeHelathMenu(4)"><a href="<c:url value='/n/search/service.do'/>" target="mainFrame" title="我的服务">我的服务</a></li>
          <li id="hMenu5" onclick="activeHelathMenu(5)"><a href="<c:url value='/n/search/nurseRequest.do'/>" target="mainFrame" title="我的签约">我的签约</a></li>
          <li id="hMenu6" onclick="activeHelathMenu(5)"><a href="<c:url value='/n/search/doctor.do'/>" target="mainFrame" title="账户/套餐">平台医生</a></li>
        </ul> 
      </div>
    </div>
    
	<div class="index_health_middle" style="background: #ededed;">
    <div class="index_health_main">
      <!--index_health_left start-->
      <div class="user_list">
       <div class="user_list_header">
       我的用户（<span id="memberNum" style="color:#ff9600">76</span>&nbsp;个）
         <a title="发送短信" href="javascript:void(0)" onclick="openSendSMS();"><img src="<c:url value='/nurse/themes/images/mail.png'/>"></a>
       </div>
       <div class="bg_search">
         <input type="text" class="search_input" id="search_name" title="请输入用户姓名">
         <a href="javascript:void(0)" onclick="funSearchUserInfo(1);"><img title="搜索用户" src="<c:url value='/nurse/themes/images/search.png'/>"></a>
       </div>
       <div class="task_list" style="height: 500px; overflow-y: hidden; outline: none;" tabindex="5000">
         <ul id="userList">
         	<li id="21051" onclick="cilckUser(1,0)">
         		<span class="task_wj">6</span>
         		<p class="task_Name" title="清波卫生99">清波卫生99 </p>
         		<span class="task_Time">2015-03-08 10:54:53</span>
         	</li><li id="20979" onclick="cilckUser(3,0)" style="background-color: rgb(239, 249, 229);"><span class="task_pt">2</span><p class="task_Name" title="清波卫生27">清波卫生27</p><span class="task_Time">2015-03-01 10:51:43</span></li><li id="20980" onclick="cilckUser(3,1)"><span class="task_pt">2</span><p class="task_Name" title="清波卫生28">清波卫生28</p><span class="task_Time">2015-03-01 10:51:44</span></li><li id="20981" onclick="cilckUser(3,2)"><span class="task_pt">2</span><p class="task_Name" title="清波卫生29">清波卫生29</p><span class="task_Time">2015-03-01 10:51:45</span></li><li id="20983" onclick="cilckUser(3,3)"><span class="task_pt">2</span><p class="task_Name" title="清波卫生31">清波卫生31</p><span class="task_Time">2015-03-01 10:51:47</span></li><li id="20984" onclick="cilckUser(3,4)"><span class="task_pt">2</span><p class="task_Name" title="清波卫生32">清波卫生32</p><span class="task_Time">2015-03-01 10:51:48</span></li><li id="20985" onclick="cilckUser(3,5)"><span class="task_pt">2</span><p class="task_Name" title="清波卫生33">清波卫生33</p><span class="task_Time">2015-03-01 10:51:49</span></li><li id="20986" onclick="cilckUser(3,6)"><span class="task_pt">2</span><p class="task_Name" title="清波卫生34">清波卫生34</p><span class="task_Time">2015-03-01 10:51:50</span></li><li id="20987" onclick="cilckUser(3,7)"><span class="task_pt">2</span><p class="task_Name" title="清波卫生35">清波卫生35</p><span class="task_Time">2015-03-01 10:51:51</span></li><li id="20988" onclick="cilckUser(3,8)"><span class="task_pt">2</span><p class="task_Name" title="清波卫生36">清波卫生36</p><span class="task_Time">2015-03-01 10:51:52</span></li><li id="20989" onclick="cilckUser(3,9)"><span class="task_pt">2</span><p class="task_Name" title="清波卫生37">清波卫生37</p><span class="task_Time">2015-03-01 10:51:53</span></li><li id="20990" onclick="cilckUser(3,10)"><span class="task_pt">2</span><p class="task_Name" title="清波卫生38">清波卫生38</p><span class="task_Time">2015-03-01 10:51:54</span></li><li id="20991" onclick="cilckUser(3,11)"><span class="task_pt">2</span><p class="task_Name" title="清波卫生39">清波卫生39</p><span class="task_Time">2015-03-01 10:51:55</span></li><li id="20992" onclick="cilckUser(3,12)"><span class="task_pt">2</span><p class="task_Name" title="清波卫生40">清波卫生40</p><span class="task_Time">2015-03-01 10:51:56</span></li><li id="20993" onclick="cilckUser(3,13)"><span class="task_pt">2</span><p class="task_Name" title="清波卫生41">清波卫生41</p><span class="task_Time">2015-03-01 10:51:57</span></li><li id="20994" onclick="cilckUser(3,14)"><span class="task_pt">2</span><p class="task_Name" title="清波卫生42">清波卫生42</p><span class="task_Time">2015-03-01 10:51:58</span></li><li id="20995" onclick="cilckUser(3,15)"><span class="task_pt">2</span><p class="task_Name" title="清波卫生43">清波卫生43</p><span class="task_Time">2015-03-01 10:51:59</span></li><li id="20996" onclick="cilckUser(3,16)"><span class="task_pt">2</span><p class="task_Name" title="清波卫生44">清波卫生44</p><span class="task_Time">2015-03-01 10:52:00</span></li><li id="20997" onclick="cilckUser(3,17)"><span class="task_pt">2</span><p class="task_Name" title="清波卫生45">清波卫生45</p><span class="task_Time">2015-03-01 10:52:01</span></li><li id="20998" onclick="cilckUser(3,18)"><span class="task_pt">2</span><p class="task_Name" title="清波卫生46">清波卫生46</p><span class="task_Time">2015-03-01 10:52:02</span></li><li id="20999" onclick="cilckUser(3,19)"><span class="task_pt">2</span><p class="task_Name" title="清波卫生47">清波卫生47</p><span class="task_Time">2015-03-01 10:52:03</span></li><li id="21000" onclick="cilckUser(3,20)"><span class="task_pt">2</span><p class="task_Name" title="清波卫生48">清波卫生48</p><span class="task_Time">2015-03-01 10:52:04</span></li><li id="21001" onclick="cilckUser(3,21)"><span class="task_pt">2</span><p class="task_Name" title="清波卫生49">清波卫生49</p><span class="task_Time">2015-03-01 10:52:05</span></li><li id="21002" onclick="cilckUser(3,22)"><span class="task_pt">2</span><p class="task_Name" title="清波卫生50">清波卫生50</p><span class="task_Time">2015-03-01 10:52:05</span></li><li id="21003" onclick="cilckUser(3,23)"><span class="task_pt">2</span><p class="task_Name" title="清波卫生51">清波卫生51</p><span class="task_Time">2015-03-01 10:52:06</span></li><li id="21004" onclick="cilckUser(3,24)"><span class="task_pt">2</span><p class="task_Name" title="清波卫生52">清波卫生52</p><span class="task_Time">2015-03-01 10:52:07</span></li><li id="21005" onclick="cilckUser(3,25)"><span class="task_pt">2</span><p class="task_Name" title="清波卫生53">清波卫生53</p><span class="task_Time">2015-03-01 10:52:08</span></li><li id="21006" onclick="cilckUser(3,26)"><span class="task_pt">2</span><p class="task_Name" title="清波卫生54">清波卫生54</p><span class="task_Time">2015-03-01 10:52:09</span></li><li id="21007" onclick="cilckUser(3,27)"><span class="task_pt">2</span><p class="task_Name" title="清波卫生55">清波卫生55</p><span class="task_Time">2015-03-01 10:52:10</span></li><li id="21008" onclick="cilckUser(3,28)"><span class="task_pt">2</span><p class="task_Name" title="清波卫生56">清波卫生56</p><span class="task_Time">2015-03-01 10:52:11</span></li><li id="20590" onclick="cilckUser(3,29)"><span class="task_pt">3</span><p class="task_Name" title="chenyong">chenyong</p><span class="task_Time">2015-03-08 10:47:17</span></li><li id="20596" onclick="cilckUser(3,30)"><span class="task_pt">3</span><p class="task_Name" title="qianying">qianying</p><span class="task_Time">2015-03-08 10:47:24</span></li><li id="20982" onclick="cilckUser(3,31)"><span class="task_pt">3</span><p class="task_Name" title="王忠华">王忠华</p><span class="task_Time">2015-03-08 10:53:39</span></li><li id="21009" onclick="cilckUser(3,32)"><span class="task_pt">3</span><p class="task_Name" title="清波卫生57">清波卫生57</p><span class="task_Time">2015-03-08 10:54:08</span></li><li id="21010" onclick="cilckUser(3,33)"><span class="task_pt">3</span><p class="task_Name" title="清波卫生58">清波卫生58</p><span class="task_Time">2015-03-08 10:54:09</span></li><li id="21011" onclick="cilckUser(3,34)"><span class="task_pt">3</span><p class="task_Name" title="清波卫生59">清波卫生59</p><span class="task_Time">2015-03-08 10:54:10</span></li><li id="21012" onclick="cilckUser(3,35)"><span class="task_pt">3</span><p class="task_Name" title="清波卫生60">清波卫生60</p><span class="task_Time">2015-03-08 10:54:11</span></li><li id="21013" onclick="cilckUser(3,36)"><span class="task_pt">3</span><p class="task_Name" title="清波卫生61">清波卫生61</p><span class="task_Time">2015-03-08 10:54:13</span></li><li id="21014" onclick="cilckUser(3,37)"><span class="task_pt">3</span><p class="task_Name" title="清波卫生62">清波卫生62</p><span class="task_Time">2015-03-08 10:54:14</span></li><li id="21015" onclick="cilckUser(3,38)"><span class="task_pt">3</span><p class="task_Name" title="清波卫生63">清波卫生63</p><span class="task_Time">2015-03-08 10:54:15</span></li><li id="21016" onclick="cilckUser(3,39)"><span class="task_pt">3</span><p class="task_Name" title="清波卫生64">清波卫生64</p><span class="task_Time">2015-03-08 10:54:16</span></li><li id="21017" onclick="cilckUser(3,40)"><span class="task_pt">3</span><p class="task_Name" title="清波卫生65">清波卫生65</p><span class="task_Time">2015-03-08 10:54:17</span></li><li id="21018" onclick="cilckUser(3,41)"><span class="task_pt">3</span><p class="task_Name" title="清波卫生66">清波卫生66</p><span class="task_Time">2015-03-08 10:54:18</span></li><li id="21019" onclick="cilckUser(3,42)"><span class="task_pt">3</span><p class="task_Name" title="清波卫生67">清波卫生67</p><span class="task_Time">2015-03-08 10:54:19</span></li><li id="21020" onclick="cilckUser(3,43)"><span class="task_pt">3</span><p class="task_Name" title="清波卫生68">清波卫生68</p><span class="task_Time">2015-03-08 10:54:20</span></li><li id="21021" onclick="cilckUser(3,44)"><span class="task_pt">3</span><p class="task_Name" title="清波卫生69">清波卫生69</p><span class="task_Time">2015-03-08 10:54:21</span></li><li id="21022" onclick="cilckUser(3,45)"><span class="task_pt">3</span><p class="task_Name" title="清波卫生70">清波卫生70</p><span class="task_Time">2015-03-08 10:54:22</span></li><li id="21023" onclick="cilckUser(3,46)"><span class="task_pt">3</span><p class="task_Name" title="清波卫生71">清波卫生71</p><span class="task_Time">2015-03-08 10:54:24</span></li><li id="21024" onclick="cilckUser(3,47)"><span class="task_pt">3</span><p class="task_Name" title="清波卫生72">清波卫生72</p><span class="task_Time">2015-03-08 10:54:24</span></li><li id="21025" onclick="cilckUser(3,48)"><span class="task_pt">3</span><p class="task_Name" title="清波卫生73">清波卫生73</p><span class="task_Time">2015-03-08 10:54:25</span></li><li id="21026" onclick="cilckUser(3,49)"><span class="task_pt">3</span><p class="task_Name" title="清波卫生74">清波卫生74</p><span class="task_Time">2015-03-08 10:54:27</span></li><li id="21027" onclick="cilckUser(3,50)"><span class="task_pt">3</span><p class="task_Name" title="清波卫生75">清波卫生75</p><span class="task_Time">2015-03-08 10:54:28</span></li><li id="21028" onclick="cilckUser(3,51)"><span class="task_pt">3</span><p class="task_Name" title="清波卫生76">清波卫生76</p><span class="task_Time">2015-03-08 10:54:29</span></li><li id="21029" onclick="cilckUser(3,52)"><span class="task_pt">3</span><p class="task_Name" title="清波卫生77">清波卫生77</p><span class="task_Time">2015-03-08 10:54:30</span></li><li id="21030" onclick="cilckUser(3,53)"><span class="task_pt">3</span><p class="task_Name" title="清波卫生78">清波卫生78</p><span class="task_Time">2015-03-08 10:54:31</span></li><li id="21031" onclick="cilckUser(3,54)"><span class="task_pt">3</span><p class="task_Name" title="清波卫生79">清波卫生79</p><span class="task_Time">2015-03-08 10:54:32</span></li><li id="21032" onclick="cilckUser(3,55)"><span class="task_pt">3</span><p class="task_Name" title="清波卫生80">清波卫生80</p><span class="task_Time">2015-03-08 10:54:33</span></li><li id="21033" onclick="cilckUser(3,56)"><span class="task_pt">3</span><p class="task_Name" title="清波卫生81">清波卫生81</p><span class="task_Time">2015-03-08 10:54:34</span></li><li id="21034" onclick="cilckUser(3,57)"><span class="task_pt">3</span><p class="task_Name" title="清波卫生82">清波卫生82</p><span class="task_Time">2015-03-08 10:54:35</span></li><li id="21035" onclick="cilckUser(3,58)"><span class="task_pt">3</span><p class="task_Name" title="清波卫生83">清波卫生83</p><span class="task_Time">2015-03-08 10:54:36</span></li><li id="21036" onclick="cilckUser(3,59)"><span class="task_pt">3</span><p class="task_Name" title="清波卫生84">清波卫生84</p><span class="task_Time">2015-03-08 10:54:37</span></li><li id="21037" onclick="cilckUser(3,60)"><span class="task_pt">3</span><p class="task_Name" title="清波卫生85">清波卫生85</p><span class="task_Time">2015-03-08 10:54:38</span></li><li id="21038" onclick="cilckUser(3,61)"><span class="task_pt">3</span><p class="task_Name" title="清波卫生86">清波卫生86</p><span class="task_Time">2015-03-08 10:54:39</span></li><li id="21039" onclick="cilckUser(3,62)"><span class="task_pt">3</span><p class="task_Name" title="清波卫生87">清波卫生87</p><span class="task_Time">2015-03-08 10:54:40</span></li><li id="21040" onclick="cilckUser(3,63)"><span class="task_pt">3</span><p class="task_Name" title="清波卫生88">清波卫生88</p><span class="task_Time">2015-03-08 10:54:41</span></li><li id="21041" onclick="cilckUser(3,64)"><span class="task_pt">3</span><p class="task_Name" title="清波卫生89">清波卫生89</p><span class="task_Time">2015-03-08 10:54:42</span></li><li id="21042" onclick="cilckUser(3,65)"><span class="task_pt">3</span><p class="task_Name" title="清波卫生90">清波卫生90</p><span class="task_Time">2015-03-08 10:54:43</span></li><li id="21043" onclick="cilckUser(3,66)"><span class="task_pt">3</span><p class="task_Name" title="清波卫生91">清波卫生91</p><span class="task_Time">2015-03-08 10:54:44</span></li><li id="21044" onclick="cilckUser(3,67)"><span class="task_pt">3</span><p class="task_Name" title="清波卫生92">清波卫生92</p><span class="task_Time">2015-03-08 10:54:45</span></li><li id="21045" onclick="cilckUser(3,68)"><span class="task_pt">3</span><p class="task_Name" title="清波卫生93">清波卫生93</p><span class="task_Time">2015-03-08 10:54:46</span></li><li id="21046" onclick="cilckUser(3,69)"><span class="task_pt">3</span><p class="task_Name" title="清波卫生94">清波卫生94</p><span class="task_Time">2015-03-08 10:54:47</span></li><li id="21047" onclick="cilckUser(3,70)"><span class="task_pt">3</span><p class="task_Name" title="清波卫生95">清波卫生95</p><span class="task_Time">2015-03-08 10:54:48</span></li><li id="21048" onclick="cilckUser(3,71)"><span class="task_pt">3</span><p class="task_Name" title="清波卫生96">清波卫生96</p><span class="task_Time">2015-03-08 10:54:50</span></li><li id="21049" onclick="cilckUser(3,72)"><span class="task_pt">3</span><p class="task_Name" title="清波卫生97">清波卫生97</p><span class="task_Time">2015-03-08 10:54:51</span></li><li id="21050" onclick="cilckUser(3,73)"><span class="task_pt">3</span><p class="task_Name" title="清波卫生98">清波卫生98</p><span class="task_Time">2015-03-08 10:54:52</span></li><li id="21052" onclick="cilckUser(3,74)"><span class="task_pt">3</span><p class="task_Name" title="来剑波">来剑波</p><span class="task_Time">2015-03-08 10:54:54</span></li></ul>
       </div>
       <div class="count"></div>
      </div>
      <!--index_health_left end-->
      <!--index_health_right start-->
      <div class="index_health_right">
        <iframe src="<c:url value='/p/query/home.do'/>" scrolling="no" frameborder="0" name="mainFrame" id="mainFrame" onload="reinitIframe();" height="1388"></iframe>
      </div>
      <!--index_health_right end-->
      
      <div class="index_health_left" id="userdetail" style="display: block;">
        <div class="wInformation">
          <ul id="member_detail">
            <li class="wInformation_img"><img id="header_photo" src="<c:url value='/nurse/themes/images/default_head.gif'/>" width="145" height="165"></li>
            <li class="tGreen"><span id="membername" title="清波卫生27">清波卫生27</span><a title="基本信息" href="/doctor/jsp/doctor/userarchives/userarchives.jsp" target="indexFrame"><img src="<c:url value='/nurse/themes/images/phone_editor.png'/>"></a></li>
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
