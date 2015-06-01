<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/patient/common/taglibs-include.jsp" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
    <title>快乐驿站 </title>
    <link rel="stylesheet" href="<c:url value='/app/jquerymobile/jquery.mobile-1.4.5.min.css'/>">
	<script src="<c:url value='/app/jquerymobile/jquery.min.js'/>"></script>
	<script src="<c:url value='/app/jquerymobile/jquery.mobile-1.4.5.min.js'/>"></script>
		<script type="text/javascript">
		$(function(){
			
			$("li a").bind("click", function(){
				$("li a").css("background", "#fff");
				$(this).css("background", "#f7fbc5");
			});
			$("#main1").css("height", $(window).height() - 190);
			$("#main1, #head").bind("click", function(){
				funShow(false);
			})
			
			funLoadInfo();
		})
	
		function funLoadInfo()
		{
			$.ajax({
			      url : "<c:url value='/app/happyHostReply.do'/>?a=" + Math.random(),
			      type : 'post',
			      dataType : 'json',
			      data : {
			    	 postId : "${param.postId}",
			    	 userId : "${param.userId}"
			      },
			      error : function(data) {
			      },
			      success : function(data) 
			      {
			    	  funDealData(data);
			    	  //PageShow.funDealZjShow(data, paramId);
			      }
			  });
		}
		
		
		function funDealData(data)
		{
			$("#laudCnt").html(23)
			if(data.success)
			{
				var postRow = data.rows[0];
				funSetLaud(postRow.laud);
				$("#laudCnt").html(postRow.laudCnt);
				$("#replyCnt").html(postRow.replyCnt);
				$("#stime").html(postRow.stime);
				$("#postTitle").html(postRow.title);
				$("#postCon").html(postRow.content);
				$("#postName").html(postRow.userName);
				$("#postName").html(postRow.userName);
				$("#postImg").attr("src", "<c:url value='/"+postRow.photo+"'/>");
				
				if(data.footer != null && data.footer.length > 0)
				{
					funShowReplyInfo(data.footer, true);
				}	
			}	
			
		}
		
		
		function funShowReplyInfo(rows, flag)
		{
			for(var nItem=0; nItem<rows.length; nItem++)
			{
				var row = rows[nItem];
				var tmp = 
					'<li>' +
						'<table style="width: 100%; padding:0px;" cellspacing="0" cellpadding="0" >' +
							'<tr>' +
								'<td rowspan="3" style="width: 60px;">' +
									'<img src="<c:url value="/'+row.photo+'"/>" style="width: 45px; height: 45px;"></td>' +
								'</td>' +
								'<td align="left">' +
									'<span style="float: left; color: #95b200; font-size: 14px;">'+row.userName+'</span>' +
									'<img src="<c:url value="/app/self/images/diandiandian.png"/>" style="width: 50px; height: 25px; float: right; cursor: pointer;"></td>' +
								'</td>' +
							'</tr>' +
							'<tr>' +
								'<td style="color: #878887; font-size: 12px; line-height: 18px;">'+row.stime+'</td>' +
							'</tr>' +
							'<tr>' +
								'<td style="color: #000000; font-size: 12px; line-height: 18px; white-space:pre-wrap;">'+row.content+'</td>' +
							'</tr>' +
						'</table>' +
					'</li>';
				if(flag)
				{
					$("#bb").append(tmp);	
				}	
				else
				{
					$("#bb").prepend(tmp);	
				}	
			}
			$("#bb").listview('refresh');
		}
		
		function funSetLaud(laud)
		{
			if(laud == -1)
			{
				$("#laudTd").attr("tag", "1");
				$("#laudImg").attr("src", "<c:url value='/app/self/images/topic_good_init.png'/>");
			}	
			else
			{
				$("#laudTd").attr("tag", "-1");
				$("#laudImg").attr("src", "<c:url value='/app/self/images/topic_good.png'/>");
			}
		}
		
		function funLaudInfo()
		{
			$.ajax({
			      url : "<c:url value='/app/addHappyHostLaud.do'/>?a=" + Math.random(),
			      type : 'post',
			      dataType : 'json',
			      data : {
			    	 postId : "${param.postId}",
			    	 userId : "${param.userId}",
			    	 flag	: $("#laudTd").attr("tag")
			      },
			      error : function(data) {
			      },
			      success : function(data) 
			      {
			    	  if(data.success)
			    	  {
			    		  $("#laudCnt").html(parseInt($("#laudCnt").html()) + parseInt($("#laudTd").attr("tag")));
			    		  funSetLaud($("#laudTd").attr("tag"));
			    	  }
			      }
			  });
		}
		
		function funSend()
		{
			$.ajax({
			      url : "<c:url value='/app/addHappyHostReply.do'/>?a=" + Math.random(),
			      type : 'post',
			      dataType : 'json',
			      data : {
			    	 postId : "${param.postId}",
			    	 userId : "${param.userId}",
			    	 content: $("#content").val()
			      },
			      error : function(data) {
			      },
			      success : function(data) 
			      {
			    	  PageLoad.funAlert(data.msg)
			    	  if(data.success)
			    	  {
			    		  $("#content").val("");
			    		  funShow(false);
			    		  if(data.total > 0)
			    		  {
			    		  	funShowReplyInfo(data.rows, false);
			    		  } 
			    	  }
			      }
			  });
		}
		
		function funShow(flag)
		{
			if(flag)
			{
				$("#btnbar").hide();
				$("#sendcon").show();
			}	
			else
			{
				$("#sendcon").hide();
				$("#btnbar").show();
			}	
		}
		
		var PageLoad = {
				funAlert : function(msg)
				{
					$.mobile.loading( "show", {
						textVisible: true,
						theme: "b",
						textonly: false,
						html:msg
					});
					
					window.setTimeout(function(){
						PageLoad.funHide();
					}, 1000);
				},
				funProgress : function(msg)
				{
					$.mobile.loading( "show", {
						text: msg,
						textVisible: true,
						theme: "b",
						textonly: false,
						html:""
					});
				},
				funHide : function()
				{
					$.mobile.loading( "hide" );
				}
			}
	</script>
</head>
<body style="overflow: hidden; background-color: #fff;">

<div data-role="page" class="jqm-demos" data-quicklinks="true">
	<div data-role="header" id="head" style="border-bottom-color: #95b200; border-bottom-width:1px; background: #f9f9f9;">
		<div style="height: 20px; width: 100%;"></div>
		<table cellspacing="0" cellpadding="0" style="width: 100%; height: 44px;">
			<tr>
				<td style="width: 45px;" align="center">
					<img onclick="window.location.href='./next.jsp?id=${param.id}&name=${param.name}&userId=${param.userId}'" src="<c:url value='/app/self/images/back.png'/>" style="height: 35px; height: 35px; cursor: pointer;">
				</td>
				<td style="color: #929292; font-size: 16px; font-weight: normal; " align="center">话题</td>
				<td style="width: 45px;" align="center">&nbsp;</td>
			</tr>
		</table>
		
	</div>
	
	
	<div id="main1" role="main"  class="ui-content jqm-content" style="overflow: auto; margin-top: 1px; background: #fff;" >
			<ul data-role="listview" id="aa">
				<li>
					<table style="width: 100%;" cellspacing="0" cellpadding="0" >
						<tr>
							<td rowspan="2" style="width: 70px;">
								<img id="postImg" src="<c:url value="/app/self/images/setting_load_pic.png"/>" style="width: 50px; height: 50px;"></td>
							</td>
							<td align="left">
								<span style="float: left; color: #95b200; font-size: 16px;" id="postName"></span>
								<img src="<c:url value="/app/self/images/diandiandian.png"/>" style="width: 50px; height: 25px; float: right; cursor: pointer;"></td>
							</td>
						</tr>
						<tr>
							<td style="color: #878887; font-size: 12px; line-height: 22px;">
								<table style="width: 100%;" cellspacing="0" cellpadding="0">
									<tr>
										<td align="left" id="stime"></td>
										<td style="width: 60px;" align="right" id="replyCnt">0</td>
										<td style="width: 24px;" align="left"><img src="<c:url value='/app/self/images/bbs_reply.png'/>" style="width: 18px; height: 18px;"></td>
									</tr>
								</table>
							</td>
						</tr>	
						<tr>
							<td colspan="2" style="color: #000000; font-size: 14px; line-height: 22px;  white-space:pre-wrap;" id="postTitle"></td>
						</tr>	
						<tr>
							<td colspan="2" style="color: #000000; font-size: 14px; line-height: 22px;  white-space:pre-wrap;" id="postCon"></td>
						</tr>	
					</table>
				</li>
			</ul>
			<div style="height:31px;"></div>
			<ul data-role="listview" id="bb">
				
			</ul>
	</div>	
	
	<div data-role="footer" style="height: 100px; background: #f9f9f9; padding-left: 10px; ">
		<table style="width: 100%; height: 100%;" id="btnbar" cellspacing="0" cellpadding="0">
			<tr>
				<td style="width: 30px;"></td>
				<td align="left" style="width: 120px; cursor: pointer;" valign="middle" onclick="funLaudInfo()" tag="1" id="laudTd">
					<table>
						<tr>
							<td valign="top"><img src="<c:url value='/app/self/images/topic_good_init.png'/>" style="width: 30px; height: 30px;" id="laudImg"></td>
							<td valign="top" style="line-height: 25px;">赞<span id="laudCnt">0</span></td>
						</tr>
					</table>
				</td>
				<td align="center">
				&nbsp;
				</td>
				<td align="right" style="width: 120px; cursor: pointer;" valign="middle" onclick="funShow(true)">
					<table>
						<tr>
							<td valign="top"><img src="<c:url value='/app/self/images/topic_reply.png'/>" style="width: 30px; height: 30px;"></td>
							<td valign="top" style="line-height: 25px;">回复</td>
						</tr>
					</table>
				</td>
				<td style="width: 30px;"></td>
			</tr>
		</table>
		<div id="sendcon" style="padding-top: 15px; display: none;">
			<table style="width: 100%; height: 55px;" id="btnbar">
				<tr>
					<td align="left">
						<input type="text" name="content" id="content" value="">
					</td>
					<td style="width: 50px; padding-left: 5px; padding-right: 5px;">
						<a class="jqm-view-source-link ui-btn ui-corner-all ui-btn-inline ui-mini" href="javascript:void(0)" onclick="funSend()" style="color: #929292;">发送</a>
					</td>
				</tr>
			</table>
		</div>
	</div>	
</div>

</body>
</html>

