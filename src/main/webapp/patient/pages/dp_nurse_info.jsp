<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<script type="text/javascript">
<!--
	$(function(){
		PageMain.funSetWinMaxAttr(500, 145, "月评", "icon-edit");
		$('#div_win').window({
			modal: true,
			title : PageMain.mWinTitle,
			shadow: false,
			top: 100,
			left: PageMain.mWinMaxLeft,
			width: PageMain.mWinMaxWidth,
			height: PageMain.mWinMaxHeight,
			iconCls: PageMain.mWinIconCls,
			closed: false,
			onClose:function()
			{
        		$('#div_win').window('destroy');
        	}
		});
	});

//-->
</script>
<div id="div_win" class="easyui-window" closed="false" maximizable="false" minimizable="false" collapsible="false"  style="background: #fafafa;">
	<div class="easyui-layout" fit="true">
		<div region="center" border="false" align="left" style="background:#fff;">
            <table style="width: 100%; height: 100%;" border="0" cellpadding="0" cellspacing="0">
    			<tr>
    				<tr>
   						<td style="padding-left: 10px; font-size: 14px; height: 60px;" align="left" valign="middle">
   							综合评分：
	   						<select class="selectMax_informationModify  text-input" id="scoreid" style="width: 350px;">
				              <option value="0" >无星级</option>
				               <option value="1" >1星级</option>
				               <option value="2" >2星级</option>
				               <option value="3" >3星级</option>
				               <option value="4" >4星级</option>
				               <option value="5" >5星级</option>
			               </select>
   						</td>
 					</tr>
 					<tr>
 						<td style="height: 40px; background: #f7f7f7; padding-right: 20px;  border-top: 1px solid #ccc; " align="center" valign="middle">
 								<a href="javascript:void(0)" onclick="funSaveDpInfo();" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-ok'">点评</a>
 								<input type="hidden" id="nurserId" value="${param.userId }"/>
 								<a href="javascript:void(0)" onclick="$('#div_win').window('close');" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-cancel'">关闭</a>
 						</td>
 					</tr>
    		</table>
		</div>
	</div>
</div>