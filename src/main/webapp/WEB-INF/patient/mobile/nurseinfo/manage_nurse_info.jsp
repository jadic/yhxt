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
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">  
	<meta name="viewport" content="width=device-width,height=device-height,initial-scale=1.0,maximum-scale=1.0,user-scalable=no">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0"> 
	
    <%@ include file="/WEB-INF/patient/common/date-include.jsp"%>
    <%@ include file="/WEB-INF/patient/common/mobile-include.jsp"%>
	<%@ include file="/WEB-INF/patient/common/easyui-include.jsp"%>
	<style>
    	input, select,textarea{border:1px solid #ccc; height: 35px; width: 85%; padding-left: 10px;}
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
			<c:if test="${query.type ==2}">
			PageOper.funSearch()
			$("#btnsearch").bind("click", function(){
				$(".item_wcl").remove()
				PageOper.page = 1;
				PageOper.sumPage = 1;
				PageOper.funSearch()
			});
			</c:if>
		});
		<c:if test="${query.type == 2}">
		var PageOper = {
			page:1,
			sumPage:1,
			funSearch : function()
			{
				$.ajax({
					url : _ctx_ + "/p/query/mynuserJson.do?a="+ Math.random(),
					type : 'post',
					dataType : 'json',
					data : 
					{
						"name": $("#name").val(),						
						"page": PageOper.page						
					},
					error:function(data)
					{
						
					},
					success:function(data)
					{
						if(PageOper.sumPage >= data.sumPage)
						{
							$(".list-more").hide();
						}
						else
						{
							PageOper.sumPage = data.sumPage;
							$(".list-more").show();
						}	
						if(data.success)
						{
							var row = null;
							for(var nItem=0; nItem<data.rows.length; nItem++)
							{
								row = data.rows[nItem];
								$('<li class="activeable list-item item_wcl" style="display:-webkit-box; display:-moz-box;">'+
						                '<div style="-webkit-box-flex:1; -moz-box-flex:1; -webkit-box-ordinal-group:2;-moz-box-ordinal-group:2;">'+
						                '<h2 class="item-title">姓<span style="padding:0 7px;"></span>名：<a href="javascript:void(0)" onclick="funNurseDetail('+row.userId+')">'+row.name+'</a></h2>'+
						                '<p class="item-time">星<span style="padding:0 13px;"></span>级：<img src="'+_ctx_+'/patient/themes/images/star_s'+row.score+'.png"></p>'+
						                '<p class="item-time">性<span style="padding:0 13px;"></span>别：'+row.genderStr+'</p>'+
						                '<p class="item-time">联系电话：'+row.cellphone+'</p>'+
						                '<p class="item-time">签约人数：'+row.cnt+'</p>'+
					                '</div>'+
					                '<div style="width: 70px; line-height:80px; -webkit-box-sizing:border-box; -moz-box-sizing:border-box; -webkit-box-ordinal-group:2;-moz-box-ordinal-group:2;">'+
					                	'<a href="javascript:void(0)" onclick="goRequest('+row.userId+', \''+row.name+'\')"><img src="'+_ctx_+'/patient/themes/images/phone_editor.png">申请签约</a>'+
					                '</div>'+
						       ' </li>').insertBefore(".list-more");
							}	
						}
					}
				});
			},
			funLoadMore: function()
			{
				if(PageOper.page < PageOper.sumPage)
				{
					PageOper.page += 1;
					PageOper.funSearch()
				}
			}
		};
		
		</c:if>
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
			PageMain.funCreateWinInfoNew("#div_win", "<c:url value='/patient/pages/send_msg_info_mobile.jsp'/>", {userId: "${nurse.userId }"});
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
				PageMain.funCreateWinInfoNew("#div_win", "<c:url value='/patient/pages/dp_nurse_info_mobile.jsp'/>", {userId: "${nurse.userId }"});
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
<body>
  	<header id="header">
  		<c:if test="${query.type == 0}">
  		我的医护人
  		<div class="right"><a href="javascript:void(0)" onclick="funSendMsg()"><span class="cornerAdd"></span></a></div>
       	</c:if>
       	<c:if test="${query.type == 1}">申请审核中</c:if>
       	<c:if test="${query.type == 2}">申请医护人员</c:if>
  		<div class="left"><a href="javascript:void(0)" onclick="window.history.back()"><span class="corner"></span></a></div>
  	</header>
  	<div id="content" <c:if test="${query.type == 0}">style="padding: 5px;"</c:if>>
  	
  <c:if test="${query.type == 0}">
        <table cellpadding="0" border="0" cellspacing="0" style="font-size: 18px; height:40PX; width: 100%; background: #F7F7F7;">
  			<tr>
  				<td style="padding-left: 10px;" align="left">基本信息</td>
  				<td align="right" style="padding-right: 10px;"><a href="javascript:void(0)" tag="${dpCnt}" onclick="funDpInfo(this)"><img src="<c:url value='/patient/themes/images/btn_dp.png'/>"></a></td>
  			</tr>
  		</table>
       	<table cellpadding="0" border="0" cellspacing="0" style="font-size: 18px; width: 100%;">
    		<tr>
    			<td align="right" style="padding: 5px 5px 5px 0; width:100px; height: 30px; color: #aeaeae; font-size: 18px;">
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
    							<img style="width:100px; height: 120px;" id="header_photo" src="<c:url value='/patient/themes/images/default_head.gif'/>">
    							</c:if>
    							<c:if test="${not empty nurse.photo }">
    							<img style="width:100px; height: 120px;" id="header_photo" src="<c:url value='/'/>${nurse.photo}">
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
    			<td align="right" style="padding: 5px 5px 5px 0; width:100px; height: 30px; color: #aeaeae; font-size: 18px;">
    				性<span style="padding: 0 18px;"></span>别：
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
    			<td align="right" style="padding: 5px 5px 5px 0; width:100px; height: 30px; color: #aeaeae; font-size: 18px;">
    				出生日期：
    			</td>
    			<td align="left">
    				<input class="inputMin_informationModify text-input Wdate" style="border:1px solid #ccc; height: 35px; width: 85%; padding-left: 10px;"  onclick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})" type="text" id="birthdate" name="birthdate" maxlength="16" value="${nurse.birthdate }">
    				
    			</td>
    		</tr>
    		<tr>
    			<td align="right" style="padding: 5px 5px 5px 0; width:100px; height: 30px; color: #aeaeae; font-size: 18px;">
    				手机号码：
    			</td>
    			<td align="left">
    				<input class="inputMin_informationModify text-input " type="text" id="cellphone" name="cellphone" maxlength="11" value="${nurse.cellphone }">
    				
    			</td>
    		</tr>
    		<tr>
    			<td align="right" style="padding: 5px 5px 5px 0; width:100px; height: 30px; color: #aeaeae; font-size: 18px;">
    				电子邮箱：
    			</td>
    			<td align="left">
    				<input class="inputMin_informationModify text-input " type="text" id="email" name="email" maxlength="40" value="${nurse.email }">
    			</td>
    		</tr>
    		<tr><td style="height: 20px;"></td></tr>
    	</table>
         <table cellpadding="0" border="0" cellspacing="0" style="font-size: 18px; height:40PX; width: 100%; background: #F7F7F7;">
  			<tr>
  				<td style="padding-left: 10px;" align="left">工作成京</td>
  			</tr>
  		</table>
       	<table cellpadding="0" border="0" cellspacing="0" style="font-size: 18px; width: 100%;">
    		<tr>
    			<td align="right" style="padding: 5px 5px 5px 0; width:100px; height: 30px; color: #aeaeae; font-size: 18px;">
    				工作成就：
    			</td>
    			<td align="left" colspan="3">
    				<textarea class="inputMax_informationModify text-input" style="height: 120px;" id="achievement" name="achievement">${userModel.achievement }</textarea>
    			</td>
    		</tr>	
    	</table>
  </c:if>
  	<c:if test="${query.type == 1}">
  		<div class="information_modify_main" id="main_div" style="height: 300px; line-height: 300px; font-size: 20px;">
  			<div style="height: 20px; width:100%; background: #ffffff; "></div>
  			
  				正在审核中，请耐心等候。。。
  		</div>
  	</c:if>
  	<c:if test="${query.type == 2}">
	    
      	<ul class="list">
			<li class="activeable list-item" style="background: #efefef">
				<table border="0" cellspacing="0" cellpadding="0" style="width:100%; font-size: 15px;">
		    	<tr>
		    		<td>
		    			<input class="inputMin_informationModify text-input " placeholder ="医护人员姓名" type="text" id="name" name="name" value="${query.name }">
		    		</td>
		    		<td>
		    		<ul>
		    			<li class="btn_search"><a id="btnsearch" href="javascript:void(0)">查询</a></li>
		    		</ul>
		    		</td>
		    	</tr>
		    </table>
			</li>
	        <li class="activeable list-more" style="display: none;" onclick="PageOper.funLoadMore()">加载更多</li>
        </ul>
    </c:if>
    
</div>
</div>
	<footer id="footer">
		<jsp:include page="/WEB-INF/patient/common/footer-include.jsp">
			<jsp:param value="3" name="selected"/>
		</jsp:include>
	</footer>  
</body>
</html>
