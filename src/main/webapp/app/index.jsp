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
		top:68px;
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
			//console.log("下拉刷新...");
			funSearch(1, 10);
		}, 1000);
	}

	/**
	 * 滚动翻页 （自定义实现此方法）
	 * myScroll.refresh();		// 数据加载完成后，调用界面更新方法
	 */
	function pullUpAction () {
		setTimeout(function () {	
			//console.log("上拉加载...");
			$("#pullUp").hide();
			funSearch(currentPage + 1, 10);
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
		
	
	var PageData = null;
	var currentPage = 1;
	var sumPage = 1;
	$(function(){
		$("li a").bind("click", function(){
			$("li a").css("background", "#fff");
			$(this).css("background", "#f7fbc5");
		});
		$("#list").css("height", $(window).height() - 66);
		
		funSearch(1, 10);
	});
	
	function funSearch(page, row)
	{
		
		if(page > sumPage)
		{
			myScroll.refresh();	
			return;
		}	
		$.ajax({
	      url : "<c:url value='/app/happyHost.do'/>?a=" + Math.random(),
	      type : 'post',
	      dataType : 'json',
	      data : {
	        "page" : page,
	        "rows" : row
	      },
	      error : function(data) {
	      },
	      success : function(data) 
	      {
	    	  PageData = data;
	    	  currentPage = page;
	    	  sumPage = parseInt((data.total-1)%row) + 1;
	    	  funDealShow(page);
	      }
	  });
	}
	
	function funBack()
	{
		return 0;	
	}
	
	function funDealShow(page)
	{
		if(PageData != null && PageData.total > 0)
		{
			if(page == 1)
			{
				$("#showlist").html("");
			}	
			for(var nItem=0; nItem<PageData.rows.length; nItem++)
			{
				var row = PageData.rows[nItem];
				var tmp = '<li>' +
							'<a data-ajax="false" href="./next.jsp?id='+row.id+'&name='+row.title+'&userId=${param.userId}"  style="background: #fff;">' +
								'<img src="<c:url value='/app/jquerymobile/img/app_01.png'/>">' +
								'<h2>' +
									'<div style="float: left; font-size: 16px;">'+row.title+'</div>' +
									'<div style="float: right; width: 60px; color: #acc241; font-size: 12px; font-weight: normal;">'+row.cnt+'话题</div>' +
								'</h2>' +
								'<p style="color: #a7a7a7; font-size: 12px;">'+row.content+'</p>' +
							'</a>' +
						'</li>';
				$("#showlist").append(tmp)
			}	
			$('ul').listview('refresh');
		}
		myScroll.refresh();	
	}
	</script>
  </head>
<body style="overflow: hidden;">
	<div data-role="page" class="jqm-demos" data-quicklinks="true"  style="overflow: hidden;">
	<div data-role="header" id="head" style="border-bottom-color: #95b200; border-bottom-width:3px; background: #f6f6f6; height: 64px;">
		<div style="height: 20px; "></div>
		<h1 style="color: #929292; font-size: 16px; font-weight: normal;">圈子</h1>
	</div>
	<div id="list" role="main" class="listDiv"  class="ui-content jqm-content" style="overflow: auto; margin-top: 1px; background: #fff;" >
		<div id="shishi" name="shishi">
			<div id="pullDown"><span class="pullDownIcon"></span><span class="pullDownLabel">下拉刷新...</span></div>
			<ul data-role="listview" id="showlist">
			</ul>
		    <div id="pullUp" style="display: none;"><span class="pullUpIcon"></span><span class="pullUpLabel">上拉加载更多...</span></div>
		</div>    	
	</div>		
</body>
</html>
