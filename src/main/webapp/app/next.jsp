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
		position:absolute;
		top:108px;
		bottom:1px;
		width:100%;
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
		padding:5px 10px;
		border-bottom:1px solid #ccc;
		font-weight:bold;
		font-size:14px;
		color:#888;
	}
	#pullDown .pullDownIcon, #pullUp .pullUpIcon  {
		display:block; float:left;
		width:40px; height:40px;
		background:url(pull-icon@2x.png) 0 0 no-repeat;
		-webkit-background-size:40px 80px; background-size:40px 80px;
		-webkit-transition-property:-webkit-transform;
		-webkit-transition-duration:250ms;	
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

	/**
	 * 下拉刷新 （自定义实现此方法）
	 * myScroll.refresh();		// 数据加载完成后，调用界面更新方法
	 */
	function pullDownAction () {
		setTimeout(function () {
			console.log("下拉刷新...");
			if(isLeft)
			{
				PageShow.funSearch("<c:url value='/app/happyHostPost.do'/>", {
			    	"happyHostId" : "${param.id}",  
			        "page" : 1,
			        "rows" : 10
			      }, "#aa");
			}
			else
			{
				PageShow.funSearch("<c:url value='/app/happyHostZrPost.do'/>", {
			    	"happyHostId" : "${param.id}",  
			        "page" : 1,
			        "rows" : 10
			      }, "#bb");
			}	
		}, 1000);
	}

	/**
	 * 滚动翻页 （自定义实现此方法）
	 * myScroll.refresh();		// 数据加载完成后，调用界面更新方法
	 */
	function pullUpAction () {
		setTimeout(function () {	
			console.log("上拉加载...");
			$("#pullUp").hide();
			if(isLeft)
			{
				PageShow.funSearch("<c:url value='/app/happyHostPost.do'/>", {
			    	"happyHostId" : "${param.id}",  
			        "page" : leftPage + 1,
			        "rows" : 10
			      }, "#aa");
			}
			else
			{
				PageShow.funSearch("<c:url value='/app/happyHostZrPost.do'/>", {
			    	"happyHostId" : "${param.id}",  
			        "page" : rightPage + 1,
			        "rows" : 10
			      }, "#bb");
			}	
		}, 1000);	//
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
				else if ( offY < (0-yLen) && !pullUpEl.className.match('flip')) {
					pullUpEl.className = 'flip';
					pullUpEl.querySelector('.pullUpLabel').innerHTML = '松手开始更新...';
					this.maxScrollY = this.maxScrollY;
				}else if(offY < 0)
				{
					$("#pullUp").show();
				}	
			},
			onScrollEnd: function () {
				flag = true;
				if (pullDownEl.className.match('flip')) {
					pullDownEl.className = 'loading';
					pullDownEl.querySelector('.pullDownLabel').innerHTML = '加载中...';				
					pullDownAction();	// Execute custom function (ajax call?)
				}
				 else if (pullUpEl.className.match('flip')) {
					pullUpEl.className = 'loading';
					pullUpEl.querySelector('.pullUpLabel').innerHTML = '加载中...';	
					pullUpAction();	// Execute custom function (ajax call?)
				}
				
			}
		});
		
		setTimeout(function () { document.getElementById(id).style.left = '0'; }, 800);
	});

		var PageZjData = null;
		var isLeft = true;
		var leftPage = 1;
		var leftSumPage = 1;
		var rightPage = 1;
		var rightSumPage = 1;
		$(function(){
			//$("#aa, #bb").css("width", $("#cc").width())
			$("li a").bind("click", function(){
				$("li a").css("background", "#fff");
				$(this).css("background", "#f7fbc5");
			});
			$("#list").css("height", $(window).height() - 120);
			$("body").on("swipeleft",function(){
				$("#shishi").css("height", $("#aa").css("height"))
				$("#aa").animate({"left":-$("#aa").width() - 5}, function(){
					$("#show1").css({"border-bottom":"3px solid #e7e7e7", "color":"#000"});
					$("#show2").css({"border-bottom":"3px solid #95b200", "color":"#95b200"});
				});
				$("#bb").animate({"left":0});
				isLeft = false;
				myScroll.refresh();
			});
			$("body").on("swiperight",function(){
				$("#shishi").css("height", $("#aa").css("height"))
				$("#aa").animate({"left":0}, function(){
					$("#show2").css({"border-bottom":"3px solid #e7e7e7", "color":"#000"});
					$("#show1").css({"border-bottom":"3px solid #95b200", "color":"#95b200"});
				});
				$("#bb").animate({"left":$("#aa").width() + 5});
				isLeft = true;
				myScroll.refresh();
			});
			
			PageShow.funSearch("<c:url value='/app/happyHostPost.do'/>", {
		    	"happyHostId" : "${param.id}",  
		        "page" : 1,
		        "rows" : 10
		      }, "#aa");
			
			PageShow.funSearch("<c:url value='/app/happyHostZrPost.do'/>", {
		    	"happyHostId" : "${param.id}",  
		        "page" : 1,
		        "rows" : 10
		      }, "#bb");
			PageShow.funSwipeDiv();
		})
		
		
		var PageShow = 
		{
			funSearch : function(paramUrl, paramObj, paramId)
			{
				if(paramId == "#aa" && paramId.page > leftSumPage)
				{
					myScroll.refresh();	
					return;
				}	
				else if(paramId == "#bb" && paramId.page > rightSumPage)
				{
					myScroll.refresh();	
					return;
				}	
				
				$.ajax({
				      url : paramUrl + "?a=" + Math.random(),
				      type : 'post',
				      dataType : 'json',
				      data : paramObj,
				      error : function(data) {
				      },
				      success : function(data) 
				      {
				    	  if(paramId == "#aa")
				    	  {
				    		  leftPage = paramObj.page;
				    		  leftSumPage = parseInt((data.total-1)/paramObj.row) + 1;
				    	  }	 
				    	  else if (paramId == "#bb") {
				    		  rightPage = paramObj.page;
				    		  rightSumPage = parseInt((data.total-1)%paramObj.row) + 1;
						  }
				    	  PageShow.funDealZjShow(data, paramId, paramObj.page);
				    	  myScroll.refresh();	
				      }
				  });
			},
			funDealZjShow : function(data, paramId, page)
			{
				if(data != null && data.total > 0)
				{
					if(page == 1)
			    	{
						$(paramId).html("");
			    	}
						
					for(var nItem=0; nItem<data.rows.length; nItem++)
					{
						var row = data.rows[nItem];
						var tmp = '<li>' +
									'<a data-ajax="false" href="./detail.jsp?id=${param.id}&name=${param.name}&userId=${param.userId}&postId='+row.id+'"  style="background: #fff; height: 55px; padding: 5px;">' +
										'<div style="font-size: 14px; font-weight: normal; padding-left: 25px; line-height: 20px; height: 20px; padding-bottom: 4px;">'+row.title+'</div>' +
										'<table cellspacing="0" cellpadding="0" style="width: 100%; font-size: 12px; font-weight: normal; height: 24px;">' +
											'<tr>' +
												'<td style="width: 25px;"><img src="<c:url value="/'+row.photo+'"/>" style="width: 20px; height: 20px;"></td>' +
												'<td style="color: #95b200; width:40%; padding-left:5px;">'+row.userName+'</td>' +
												'<td style="color: #878887;  width:40%;">'+row.stime+'</td>' +
												'<td style="color: #878887;  min-width:30px;" align="right">'+row.laudCnt+'</td>' +
												'<td style="color: #878887;  width: 20px;" align="left"><img src="<c:url value='/app/self/images/bbs_good.png'/>" style="width: 16px; height: 16px;"></td>' +
												'<td style="color: #878887;  min-width:30px;" align="right">'+row.replyCnt+'</td>' +
												'<td style="color: #878887;  min-width: 50px;" align="left"><img src="<c:url value='/app/self/images/bbs_reply.png'/>" style="width: 16px; height: 16px;"></td>' +
											'</tr>' +
										'</table>' +
									'</a>' +
								'</li>';
						$(paramId).append(tmp)

					}	
					$(paramId).listview('refresh');
				}	
				
				PageShow.funSwipeDiv();
			},
			funSwipeDiv : function()
			{
				try
				{
					if(isLeft)
					{
						$("#aa").css({"left":0, "position":"relative", "top":1});
						$("#bb").css({"left":$("#aa").width(), "position":"relative", "top":1-$("#aa").height()});
					}
					myScroll.refresh();
				}
				catch(e)
				{
					alert(e);
				}
			}
		}
	</script>
</head>
<body style="overflow: hidden; background-color: #fff;">

<div data-role="page" id="pageone" class="jqm-demos" data-add-back-btn="true">
	<div data-role="header" id="head" style="border-bottom-width:0px; background: #f6f6f6; height: 64px;">
		<div style="height: 20px; width: 100%;"></div>
		<table cellspacing="0" cellpadding="0" style="width: 100%; height: 44px;">
			<tr>
				<td style="width: 45px;" align="center"><img  onclick="window.location.href='<c:url value='/app/index.jsp'/>?userId=${param.userId}'" data-ajax="false" src="<c:url value='/app/self/images/back.png'/>" style="height: 35px; height: 35px;  cursor: pointer;"></td>
				<td style="color: #929292; font-size: 16px; font-weight: normal; " align="center">${param.name }</td>
				<td style="width: 45px;" align="center"><img onclick="window.location.href='<c:url value='/app/add.jsp'/>?id=${param.id}&name=${param.name}&userId=${param.userId}'" data-ajax="false" src="<c:url value='/app/self/images/subject_publish_n.png'/>" style="height: 35px; height: 35px; cursor: pointer;"></td>
			</tr>
		</table>
	</div>
	<div style="position: relative; width:100%;  background: #f6f6f6;">
		<div id="show1" style="width:50%; background: #f6f6f6; border-bottom:3px solid #95b200; line-height:40px; float: left; text-align: center; font-size: 14px; font-weight: normal; color: #95b200; ">最新</div>
		<div id="show2" style="width:50%; background: #f6f6f6; border-bottom:3px solid #e7e7e7; line-height:40px; float: left; text-align: center; font-size: 14px; font-weight: normal;">最热</div>
	</div>
	<div id="list" role="main" class="listDiv"  class="ui-content jqm-content" style="overflow: auto; background: #fff;" >
		
		<div id="shishi" name="shishi"  class="listDiv"  >
			<div id="pullDown"><span class="pullDownIcon"></span><span class="pullDownLabel">下拉刷新...</span></div>
					<ul data-role="listview" id="aa">
				
					</ul>
					<ul id="bb" data-role="listview">
						
					</ul>	
		    <div id="pullUp" style="display: none;"><span class="pullUpIcon"></span><span class="pullUpLabel">上拉加载更多...</span></div>
		</div>    	
	</div>		
</div>
</body>
</html>
