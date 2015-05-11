<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/admin/common/taglibs-include.jsp" %>
<script type="text/javascript">
<!--
	$.getScript(_ctx_+"/admin/scripts/query/query_feedback_info.js");
//-->
</script>
<div class="easyui-layout" fit="true" id="div_common">
	<div region="north" style="height:57px;" border="false">
		<table cellpadding="0" cellspacing="0"  border="0" style="font-size:12px;width:100%;">
			<tr>
				<td colspan="5" class="njty_btitle" align="left">用户反馈&nbsp;</td>
			</tr>
			<tr>
				<td class="njty_bg" align="right" style="width: 100px;">开始时间：</td>
			  	<td style="width:180px;" class="njty_bl">
		      		<input id="in01" style="width: 120px;" class="Wdate njty_input"  onclick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/>-
		      		<input id="in02" style="width: 120px;" class="Wdate njty_input"  onclick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/>
		      	</td>
		      	<td class="njty_bl" colspan="2" style="height:28px;">
			  		<a id="search" href="javascript:void(0)" class="easyui-linkbutton" icon="icon-search" onclick="PageSportItem.funSearchInfo()">查询</a>
					<a id="reset" href="javascript:void(0)" class="easyui-linkbutton" icon="icon-undo" onclick="PageMain.funReset()">重置</a>
		      	</td>
		      	<td class="njty_br">&nbsp;</td>
			</tr>
		</table>
	</div>
	
	<div region="center" border="false">
		<div id="div_grid"></div>
	</div>
</div>