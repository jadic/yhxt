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
    	<style type="text/css" media="all">
	
	/*需要修改的jquery mobile样式  */
	.ui-table-columntoggle-btn {display:none;}
	
	#list{
	}
	
	/**
	 *
	 * 下拉样式 Pull down styles
	 *
	 */
	#pullDown, #pullUp {
		background:#fff;
		height:40px;
		line-height:40px;
		padding:35px 10px;
		border-bottom:1px solid #ccc;
		font-weight:bold;
		font-size:14px;
		color:#888;
	}
	#pullDown .pullDownIcon, #pullUp .pullUpIcon  {
		display:block;
		width:40px; height:40px;
		background:url(pull-icon@2x.png) 0 0 no-repeat;
		-webkit-background-size:40px 80px; background-size:40px 80px;
		-webkit-transition-property:-webkit-transform;
		-webkit-transition-duration:250ms;	
	}
	.pullDownIcon, .pullUpIcon  {
		display:block; float: left;
	}
	#pullDown .pullDownIcon {
		-webkit-transform:rotate(0deg) translateZ(0);
	}
	#pullUp .pullUpIcon  {
		-webkit-transform:rotate(-180deg) translateZ(0);
	}
	
	#pullDown.flip .pullDownIcon {
		-webkit-transform:rotate(-180deg) translateZ(0);
	}
	
	#pullUp.flip .pullUpIcon {
		-webkit-transform:rotate(0deg) translateZ(0);
	}
	
	#pullDown.loading .pullDownIcon, #pullUp.loading .pullUpIcon {
		background-position:0 100%;
		-webkit-transform:rotate(0deg) translateZ(0);
		-webkit-transition-duration:0ms;
	
		-webkit-animation-name:loading;
		-webkit-animation-duration:2s;
		-webkit-animation-iteration-count:infinite;
		-webkit-animation-timing-function:linear;
	}
	
	@-webkit-keyframes loading {
		from { -webkit-transform:rotate(0deg) translateZ(0); }
		to { -webkit-transform:rotate(360deg) translateZ(0); }
	}
	#popupMenu {
    min-width: 200px;
    opacity: 0.8;
}
#open-popupMenu {
    position: relative;
    left: 50%;
    width: 6em;
    margin-left: -3em;
    background-color: #ffa0a0;
    border-color: black;
}
	</style>
	<link rel="stylesheet" href="<c:url value='/app/jquerymobile/jquery.mobile-1.4.5.min.css'/>">
	<script src="<c:url value='/app/jquerymobile/jquery.min.js'/>"></script>
	<script src="<c:url value='/app/jquerymobile/iscroll.js'/>"></script>
	<script src="<c:url value='/app/jquerymobile/jquery.mobile-1.4.5.min.js'/>"></script>
	<script type="text/javascript">
		var myScroll,
		pullDownEl, pullDownOffset,
		pullUpEl, pullUpOffset,
		generatedCount = 0;
		var offY= 0;

	function pullDownAction () {
		setTimeout(function () {
			funLoadInfo();
		}, 1000);
	}


	/**
	 * 初始化iScroll控件
	 */
	$(function(){
		pullDownEl = document.getElementById('pullDown');
		pullUpEl = document.getElementById('pullUp');
		pullDownOffset = pullDownEl.offsetHeight;
		pullUpOffset = pullUpEl.offsetHeight;
		
		var id='list';
		var yLen=60;
		var flag = true;
		var mY = 0;
		var hei=document.getElementById(id).maxScrollY;
		myScroll = new iScroll(id, {
			useTransition: false,
			topOffset: pullDownOffset,
			onRefresh: function () {
				if (pullDownEl.className.match('loading')) {
					pullDownEl.className = '';
					pullDownEl.querySelector('.pullDownLabel').innerHTML = '下拉刷新...';
				} else if (pullUpEl.className.match('loading')) {
					pullUpEl.className = '';
					pullUpEl.querySelector('.pullUpLabel').innerHTML = '上拉加载更多...';
				}
			},
			onScrollMove: function () {
				if(flag)
				{
					flag = false;
					mY = this.y;
				}	
				
				offY = this.y - mY;
				if (offY >= yLen && !pullDownEl.className.match('flip')) {
					pullDownEl.className = 'flip';
					pullDownEl.querySelector('.pullDownLabel').innerHTML = '松手开始更新...';
					this.minScrollY = 0;
				}
				
			},
			onScrollEnd: function () {
				flag = true;
				if (pullDownEl.className.match('flip')) {
					pullDownEl.className = 'loading';
					pullDownEl.querySelector('.pullDownLabel').innerHTML = '加载中...';				
					pullDownAction();	// Execute custom function (ajax call?)
				}
			}
		});
		setTimeout(function () { document.getElementById(id).style.left = '0'; }, 800);
	});
		
	
	var PageData = null;
	var currentPage = 1;
	var sumPage = 1;
	
		$(function(){
			$("li a").bind("click", function(){
				$("li a").css("background", "#fff");
				$(this).css("background", "#f7fbc5");
			});
			$("#list").css("height", $(window).height() - 190);
			$("#list, #head").bind("click", function(){
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
			    	  myScroll.refresh();	
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
				JBHtId = postRow.id;
				$("#laudCnt").html(postRow.laudCnt);
				$("#replyCnt").html(postRow.replyCnt);
				$("#stime").html(postRow.stime);
				$("#postTitle").html(postRow.title);
				$("#postCon").html(postRow.content);
				$("#postName").html(postRow.userName);
				$("#postName").html(postRow.userName);
				$("#postImg").attr("src", "<c:url value='/"+postRow.photo+"'/>");
				
				$("#bb").html("");
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
									'<img src="<c:url value="/app/self/images/diandiandian.png"/>" onclick="funpopup(2, '+row.id+')" style="width: 50px; height: 25px; float: right; cursor: pointer;"></td>' +
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
		
		
		var JBOperType = 1;
		var JBOperId = 1;
		var JBHtId = 1;
		function funpopup(type, id)
		{
			JBOperType = type;
			JBOperId = id;
			if(type == 1)
			{
				JBOperId = JBHtId;
			}	
			JBType = 1;
			$("#jb2").css("color","#000");
			$("#jb1").css("color","#95b200");
			$("#popupMenu").popup("open");
		}
		
		function funSaveJbInfo()
		{
			$.ajax({
			      url : "<c:url value='/app/addHappyHostReport.do'/>?a=" + Math.random(),
			      type : 'post',
			      dataType : 'json',
			      data : {
			    	  tableId : JBOperId,
			    	  tableType : JBOperType,
			    	  userId : "${param.userId}",
			    	  reportFlag : JBType
			      },
			      error : function(data) {
			      },
			      success : function(data) 
			      {
			    	  PageLoad.funAlert(data.msg)
			    	  if(data.success)
			    	  {
			    		  $("#popupMenu").popup("close");
			    	  }
			      }
			  });
			
		}
		
		var JBType = 1;
		function funClickJb(type, obj)
		{
			$("#jb1, #jb2").css("color","#000");
			$(obj).css("color","#95b200");
			JBType = type;
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
	
	<div  id="list" role="main"  class="ui-content jqm-content" style="overflow: auto; margin-top: 1px; background: #fff;" >
		<div id="shishi" name="shishi">
			<div id="pullDown"><span class="pullDownIcon"></span><span class="pullDownLabel">下拉刷新...</span></div>
				<ul data-role="listview" id="aa">
				<li>
					<table style="width: 100%;" cellspacing="0" cellpadding="0" >
						<tr>
							<td rowspan="2" style="width: 70px;">
								<img id="postImg" src="<c:url value="/app/self/images/setting_load_pic.png"/>" style="width: 50px; height: 50px;"></td>
							</td>
							<td align="left">
								<span style="float: left; color: #95b200; font-size: 16px;" id="postName"></span>
								<img src="<c:url value="/app/self/images/diandiandian.png"/>" onclick="funpopup(1, 0)"style="width: 50px; height: 25px; float: right; cursor: pointer;"></td>
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
		   <div id="pullUp" style="display: none;"><span class="pullUpIcon"></span><span class="pullUpLabel">上拉加载更多...</span></div>
		   
			<div data-role="popup" id="popupMenu" data-theme="a">
				<div style="background: #95b200;   text-shadow:0 0 0 #fff; line-height: 40px; display:block; font-size: 14px; width: 300px; text-align: center; color:#fff; cursor: pointer; border-bottom: 1px #e5e5e5 solid;">
					举报理由
				</div>
				<div id="jb1" onclick="funClickJb(1, this)" style="background: #fff; line-height: 40px; display:block; font-size: 14px; width: 300px; text-align: center; color:#95b200; cursor: pointer; border-bottom: 1px #e5e5e5 solid;">
					违法等不良信息
				</div>
				<div id="jb2" onclick="funClickJb(2, this)" style="background: #fff; line-height: 40px; font-size: 14px; width: 300px; text-align: center; color: #000; cursor: pointer;  border-bottom: 1px #e5e5e5 solid;">
					垃圾广告等内容
				</div>
				<div style="background: #fff; line-height: 40px; font-size: 14px; width: 300px; text-align: center; color: #000; cursor: pointer;  border-bottom: 1px #e5e5e5 solid;">
					<table  style="width: 100%;" cellspacing="0" cellpadding="0">
						<tr>
							<td style="border-right: 1px #e5e5e5 solid; cursor: pointer;" align="center" onclick="$('#popupMenu').popup('close');">取消</td>
							<td style="cursor: pointer;" align="center" onclick="funSaveJbInfo()">确定</td>
						</tr>
					</table>
				</div>
			</div>
		</div>  	
	</div>	
	
	<div data-role="footer" style="height: 100px; background: #f9f9f9; padding-left: 10px;">
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

