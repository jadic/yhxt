<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/patient/common/taglibs-include.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
  	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0;">  
    <title>自已人健康服务中心</title>
    <link rel="stylesheet" href="<c:url value='/patient/themes/register_style.css'/>" type="text/css"/>
    <script type="text/javascript" src="<c:url value='/common/scripts/jquery-1.8.0.min.js'/>" ></script>
 	<script type="text/javascript" src="<c:url value='/patient/scripts/mobile.js'/>" ></script>
 	<script>
 		var reg = /^1\d{10}$/;  //定义正则表达式
 		$(function(){
 			<c:if test="${not empty errorinfo}">
 			alert("${errorinfo}")
 			</c:if>
 			
 			var tmp = 60;
 			var mTim = null;
 			$("#loginbtn").bind("click", function(){
				PageMobile.funLoadIng();
			});
 			$("#retset").bind("click", function(){
 				$("input[type=text],input[type=password]").val('');
 			});
 			
 			$("#smsrand").bind("click", function(){
 				
 				if(reg.test($("#userName").val()) == false)
 				{
 					alert("11位手机号码不正确")
 					return false;
 				}	
 				var me = this;
 				$.ajax({
 				      url : "<c:url value='/p/query/getSmsVal.do'/>",
 				      type : 'post',
 				      dataType : 'json',
 				      data :{"cellphone":$("#userName").val()},
 				      error:function(data)
 				      {
 				    	 
 				      },
 				      success:function(data)
 				      {
 				        if(data.success)
 				        {
 				        	if($(me).text() == "获取验证码" || $(me).text() == "重新获取验证码")
 			 				{
 			 					tmp = 60
 			 					if(mTim != null)
 			 					{
 			 						window.clearInterval(mTim);
 			 						mTim = null;
 			 					}	
 			 					mTim = window.setInterval(function(){
 			 						if(tmp == 0)
 			 						{
 			 							$("#smsrand").text("重新获取验证码");
 			 							window.clearInterval(mTim);
 			 	 						mTim = null;
 			 							return;
 			 						}
 			 						else
 			 						{
 			 							$("#smsrand").text("剩" + tmp + "秒");
 			 							tmp -= 1;
 			 						}	
 			 					}, 1000);
 			 				}	
 				        }
 				        else
 				        {
 				        	alert("短信发送失败！");
 				        }	
 				      }
 				});
 			});
 		});
 		
 		function funSubmitInfo()
 		{
 			if($("#userName").val() == "帐号")
 			{
 				alert("注册手机号！");
 				return false;
 			}	
 			else if(reg.test($("#userName").val()) == false)
			{
				alert("11位手机号码不正确")
				return false;
			}	
 			else if($("#vcode").val() == "")
 			{
 				alert("短信验证码！");
 				return false;
 			}
 			else if($("#userPwd").val() == "")
 			{
 				alert("登录密码不能为空！");
 				return false;
 			}
 			PageMobile.funLoadIng()
 			return true;
 		}
 	</script>
  </head>
  <body class="radial">
	<div class="new_wrapper">
	   <form action="<c:url value='/p/query/goReg.do'/>" method="post" onsubmit="return funSubmitInfo()" name="inputform" id="inputform">
				<div class="new_register">
	    		<input type="hidden" id="otype" value=""/>
	    		<input type="text" placeholder="手机号码" id="userName" name="userName" class="border_btm r_email top" maxlength="11"/>
	    		<span class="err_email dn"><em>!</em>填写手机号码</span>
	    		<input type="password" placeholder="登录密码" class="r_psw btm" name="userPwd" id="userPwd" maxlength="16" />
	    		<span class="err_psw dn"><em>!</em>6~16位密码</span>
	    		<i class="eye"></i>
	    	</div>

	    	<div id="vcodeWrap"  >
                <input type="text" id="vcode" name="rand" tabindex="3" placeholder="短信验证码" />
                <a href="javascript:void(0)" class="btn_green_border" id="smsrand">获取验证码</a>
            </div>
            
	    	<input type="submit" class="btn_green" id="register" value="注册" />
	    </form>
	    <div class="register_text">已有帐号？</div>
	    <a id="loginbtn" href="<c:url value='/p/mobile.do'/>" class="btn_green_border">登录</a>
	</div>
  </body>
</html>