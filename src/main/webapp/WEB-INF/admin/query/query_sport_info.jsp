<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/admin/common/taglibs-include.jsp" %>
<script type="text/javascript">
<!--
	$.getScript(_ctx_+"/admin/scripts/query/query_sport_info.js");
//-->
</script>
<div class="easyui-layout" fit="true" id="div_common">
	<div region="north" style="height:57px;" border="false">
		<table cellpadding="0" cellspacing="0"  border="0" style="font-size:12px;width:100%;">
			<tr>
				<td colspan="5" class="njty_btitle" align="left">运动记录&nbsp;</td>
			</tr>
			<tr>
				<td class="njty_bg" align="right" style="width: 80px;">记录时间：</td>
			  	<td style="width:230px;" class="njty_bl">
		      		<input id="in01" type="text" style="width: 100px;"> -
		      		<input id="in02" type="text" style="width: 100px;"/>
		      	</td>
		      	<td class="njty_bl" colspan="2" style="height:28px;">
			  		<a id="search" href="javascript:void(0)" class="easyui-linkbutton" icon="icon-search" onclick="PageSport.funSearchInfo()">查询</a>
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