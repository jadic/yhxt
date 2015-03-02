<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>升级日志</title>
<%@ include file="/WEB-INF/admin/common/taglibs-include.jsp" %>
<style>
<!--
	.table{
		border: 1px solid #cbe6a1;
		border-collapse: collapse;
		text-align:left;
	}
	.td{
		font-size: 12px;
		border: 1px solid #ABC5E5;
		text-align:left;
	}	
	.td2{
		width:80px;
		height:25px;
		font-size: 12px;
		text-align:left;
		border: 1px solid #cbe6a1;
		background-color:#f9fff5
	}
	.td3{
		height:25px;
		text-align:left;
		font-size: 12px;
		border: 1px solid #cbe6a1;
	}
	.bf{
		text-align:left;
		border:1px solid  #99bbe8;
	}
	.bg_head{
		text-align:left;
		color:#15428b;
		background:url(<c:url value='/admin/themes/self/images/btn_line.gif'/>);  
		background-repeat:repeat-x;
	}
	.bg_body{
		text-align:left;
		color:#15428b;
		background:url(<c:url value='/admin/themes/self/images/btn_line.gif'/>);  
		background-repeat:repeat-x;
	}
-->
</style>
<link rel="stylesheet" href="<c:url value='/admin/themes/self/style.css'/>" type="text/css"/>
<script type="text/javascript" src="<c:url value='/admin/scripts/jquery.gesoft-1.1.js'/>" ></script>
<script type="text/javascript" src="<c:url value='/common/scripts/jquery-1.8.0.min.js'/>" ></script>
<script type="text/javascript">
	$(function(){
		PageMain.funCloseParentProgressInfo();
		$('img').bind('click', function(){
			if(eval($(this).attr('id')) > 0){
				var mTr = "#tr_" + $(this).attr('id');
				if($(this).attr('tag') == "false"){
					$(this).attr({'tag':'true',
						'src':'<c:url value="/admin/themes/self/images/btn_sub.gif"/>'
					});
					$(mTr).css('display','');
				}else{
					$(this).attr({'tag':'false',
						'src':'<c:url value="/admin/themes/self/images/btn_add.gif"/>'
					});
					$(mTr).css('display','none');
				}
			} 
		});
	});
</script>
</head>
<body>
	<div class="easyui-layout" fit="true" id="div_common">
		<div region="north" style="height:28px; padding:0px 0px; overflow: hidden;" border="false">
			<table cellpadding="0" cellspacing="0"  border="0" style="font-size:12px;width:100%; height: 28px;">
				<tr>
					<td colspan="5" class="njty_btitle" align="left">&nbsp;系统更新日志</td>
				</tr>
			</table>
		</div>
		<div region="center" align="center" style="overflow:hidden;padding:1px 0 0 0;"  border="false">
			<div style="height:100%; width:100%;overflow-x:hidden;overflow-y:auto">
				<table style="width:100%;border-collapse: collapse;border: 1px solid #ABC5E5;">
	
					
					<tr style="height:25px;">
						<td class="td bg_head" style="height:25px;"><img id="1" tag="false" align="absmiddle" style="cursor:pointer;" src="<c:url value='/admin/themes/self/images/btn_add.gif'/>"/>更新日期：2015-01-31&nbsp;｜&nbsp;初步搭建系统</td>
					</tr>
					<tr id="tr_1" style="width:100%;height:100%;display:none;">
						<td class="td" style="padding:5px;">
							<table class="table" style="width:100%;">
								<tr>
									<td class="td2">更新时间</td>
									<td class="td3" style="width:100px;">2015-01-31</td>
									<td class="td2">更新原因</td>
									<td class="td3" style="width:400px;">初步搭建系统。</td>
									<td class="td2">更新人</td>
									<td class="td3" style="width:100px;">wcl</td>
								</tr>
								<tr>
									<td class="td2">更新内容</td>
									<td class="td3" colspan="5">
										1、初步完成系统的搭建，完善相关的日志记录，以备后面出现问题、事故好进行查询。<br/>
										2、记录用户登录日志。<br/>
										3、记录用户功能操作日志。<br/>
										4、把log4j的日志记录到数据库中。<br/>
									</td>
								</tr>
							</table>
						</td>
					</tr>
					
					
				</table>
			</div>
		</div>
	</div>
</body>
</html>