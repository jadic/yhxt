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
    <%@ include file="/WEB-INF/patient/common/mobile-include.jsp"%>
	<style type="text/css">
		td{word-break:break-all;}
		.index_table table#faceTable tr th{
			line-height: normal;
		}
	</style>
	<script type="text/JavaScript">
		$(function(){
			if(PageOper.page < PageOper.sumPage)
			{
				$(".list-more").show();
			}	
		});
	
		var PageOper = {
				page: parseInt("${query.page }"),
				sumPage: parseInt("${query.pageCnt}"),
				funSearch : function()
				{
					$.ajax({
						url : _ctx_ + "/p/query/commentJson.do?a="+ Math.random(),
						type : 'post',
						dataType : 'json',
						data : 
						{
							"id"		 : $("#pid").val(),
							"page"       : PageOper.page						
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
								var tmpPhoto = _ctx_ + "/patient/themes/images/mobile/user_photo.png";
								for(var nItem=0; nItem<data.rows.length; nItem++)
								{
									row = data.rows[nItem];
									tmpPhoto = _ctx_ + "/patient/themes/images/default_head.gif";
									if(row.photo != "" && row.photo != null && row.photo != "null")
									{
										tmpPhoto = _ctx_ + "/" + row.photo;
									}	
									$('<tr>'+
										'<td rowspan="2" style="border: #ccc solid; border-width: 0px 1px 1px 1px;  background: #cbeccf; width: 100px; padding: 5px 0px;" align="center">'+
											'<img style="width:80px; height: 100px;" id="header_photo" src="'+tmpPhoto+'"></img></br>'+
											'<span style="padding-top: 10px; font-size: 14px; color: #3c8cd6; font-weight: bold;">'+row.userName+'</span>'+
										'</td>'+
						        		'<td style="border: #ccc solid; border-width: 0px 0px 1px 0px; height: 35px; padding: 0px 5px">'+row.stime+ '</td>'+
						        		'<td style="width: 30px; border: #ccc solid; border-width: 0px 1px 1px 0px; height: 35px; padding: 0px 5px"><span style="padding: 0px 2px;">'+(nItem + 1 + (PageOper.page - 1) * ${query.rows})+'</span>楼</td>'+
						        	'</tr>'+	
						        	'<tr>'+
					        			'<td style="border: #ccc solid; border-width: 0px 1px 1px 0px; padding: 0px 5px" colspan="2" valign="top">'+
					        					'<div style="width: 100%">'+row.content+'</div>'+
					        			'</td>'+	
						        	'</tr>').insertBefore("#list-more");	
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
		
		function funSaveInfo()
		{
			if($("#content1").val() == "")
			{
				$("#tip").text("评论内容不为空")
				return ;
			}	
			else if($("#content1").val().length > 200)
			{
				$("#tip").text("评论内容在太长")
				return ;
			}	
			$("#inputform2").submit();
		}
	</script>
  </head>
<body>
  	<header id="header">
  		论坛
  		<div class="left"><a href="<c:url value='/p/query/post.do'/>"><span class="corner"></span></a></div>
  	</header>
  	<div id="content" style="padding: 5px 20px;">
	
        <div class="index_table">
        	<div style="height: 20px; width: 100%;">
        		<form id="inputform" name="inputform" action="<c:url value='/p/query/postDetail.do'/>" method="post">
		    		<input id="page" name="page" value="${query.page }" type="hidden"/>
		    		<input id="id" name="id" value="${query.id }" type="hidden"/>
				</form>    
        	</div>
        	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="bPhistory_table" id="faceTable">
        		<tr>
        			<td rowspan="2" style="border: 1px #ccc solid; background: #cbeccf; width: 100px; padding: 5px 0px;" align="center">
        				<c:if test="${not empty post.photo}">
        					<img style="width:80px; height: 100px;" id="header_photo" src="<c:url value='/'/>${post.photo}"></img></br>
        				</c:if>
        				<c:if test="${empty post.photo}">
        				<img style="width:80px; height: 100px;" id="header_photo" src="<c:url value='/patient/themes/images/default_head.gif'/>"></img></br>
        				</c:if>
        				<span style="padding-top: 10px; font-size: 14px; color: #3c8cd6; font-weight: bold;">${post.userName }</span>
        					
        			</td>
        			<td style="border: #ccc solid; border-width: 1px 0px 1px 0px; height: 35px; padding: 0px 5px">
        				${post.stime }
        			</td>
        			<td style="width: 30px; border: #ccc solid; border-width: 1px 1px 1px 0px; height: 35px; padding: 0px 5px">楼主</td>
        		</tr>
        		<tr>
        			<td style="border: #ccc solid; border-width: 0px 1px 1px 0px; padding: 0px 5px" colspan="2" valign="top">
	        				<div style="line-height: 35px; font-weight: bolder; width: 100%; text-align: center; font-size: 16px; color: #000;">${post.title }</div>
        					<div style="width: 100%">
        						${post.content }
        					</div>
        			</td>
        		</tr>
        		
        	<c:if test="${not empty commentFlys }">
				<c:forEach items="${commentFlys }" var="commentItem" varStatus="item">
					<tr>
        			<td rowspan="2" style="border: #ccc solid; border-width: 0px 1px 1px 1px;  background: #cbeccf; width: 100px; padding: 5px 0px;" align="center">
        				<c:if test="${not empty commentItem.photo}">
        					<img style="width:80px; height: 100px;" id="header_photo" src="<c:url value='/'/>${commentItem.photo}"></img></br>
        				</c:if>
        				<c:if test="${empty commentItem.photo}">
        				<img style="width:80px; height: 100px;" id="header_photo" src="<c:url value='/patient/themes/images/default_head.gif'/>"></img></br>
        				</c:if>
        				<span style="padding-top: 10px; font-size: 14px; color: #3c8cd6; font-weight: bold;">${commentItem.userName }</span>
        					
        			</td>
        			<td style="border: #ccc solid; border-width: 0px 0px 1px 0px; height: 35px; padding: 0px 5px">
        				${commentItem.stime }
        			</td>
        			<td style="width: 30px; border: #ccc solid; border-width: 0px 1px 1px 0px; height: 35px; padding: 0px 5px"><span style="padding: 0px 2px;">${item.index + 1 + (query.page - 1) * query.rows }</span>楼</td>
        		</tr>
        		<tr>
        			<td style="border: #ccc solid; border-width: 0px 1px 1px 0px; padding: 0px 5px" colspan="2" valign="top">
        					<div style="width: 100%">
        						${commentItem.content }
        					</div>
        			</td>
        		</tr>
				</c:forEach>
			</c:if>
				<tr id="list-more">
					<td colspan="3">
						<ul class="list">
						 	<li class="activeable list-more" style="display: none;" onclick="PageOper.funLoadMore()">加载更多</li>
       					 </ul>
					</td>
				</tr>
        	</table>
		</div>
		
		
		<form id="inputform2" name="inputform2" action="<c:url value='/p/query/addComment.do'/>" method="post">
		<table border="0" cellspacing="0" cellpadding="0" class="bPhistory_table" id="faceTable" style="width: 100%;">
			<tr>
				<td style="height: 30px;"></td>
			</tr>
			<tr>
				<td style="border: #ccc solid; border-width: 1px 1px 1px 1px; padding: 5px; height: 30px; background: #cbeccf; font-weight: bold; font-size: 16px;">
					我要评论
				</td>
			</tr>
			<tr>
				<td style="border: #ccc solid; border-width: 0px 1px 0px 1px; padding: 5px; height: 180px; ">
					<textarea name="content" id="content1" style="width: 98%; height: 100%;"></textarea>
				</td>
			</tr>
			<tr>
				<td style="border: #ccc solid; border-width: 0px 1px 0px 1px;">
					<div style="color:red; font-size: 12; padding-left: 15px; height: 16px;" id="tip"></div></td>
			</tr>
			<tr>
				<td align="center" style="border: #ccc solid; border-width: 0px 1px 1px 1px; padding: 5px; height: 60px;">
					<ul>
    					<li class="btn_reguster" style="margin-top: 0px;"><a onclick="funSaveInfo()" style="cursor: pointer;">确定</a></li>
    				</ul>
				</td>
			</tr>
			<tr>
				<td style="height: 10px;">
					<input type="hidden" name="pid" id="pid" value="${post.id }"/>
				</td>
			</tr>
		</table>
		</form>
 </div>
   <footer id="footer">
		<footer id="footer">
		<jsp:include page="/WEB-INF/patient/common/footer-include.jsp">
			<jsp:param value="2" name="selected"/>
		</jsp:include>
	</footer>  
</body>
</html>
