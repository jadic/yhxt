<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<script type="text/javascript">
<!--
	$(function(){
		PageMain.funSetWinMaxAttr(600, 475, "用户留言板", "icon-edit");
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
<div id="div_win" class="easyui-window" title="角色管理"  closed="false" maximizable="false" minimizable="false" collapsible="false"  style="background: #fafafa;">
	<div class="easyui-layout" fit="true">
		<div region="center" border="false" align="left" style="background:#fff; padding: 1px;">
            <table style="width: 100%; height: 100%;" border="0" cellpadding="0" cellspacing="0">
    			<tr>
    				<td style="width: 150px; border: solid #ccc; border-width: 1px; display: none;"></td>
    				<td style="border: solid #ccc; border-width: 1px;">
    					<table style="width: 100%; height: 400px;" border="0" cellpadding="0" cellspacing="0">
    						<tr>
    							<td style="border: 0px;">
    								<div style="width: 100%; height: 250px; max-height: 250px; overflow: auto;" id="sendmsg">
    									
    								</div>
    							</td>
    						</tr>
    						<tr>
    							<td style="height: 40px; background: #f7f7f7; padding-left: 10px; border-top: 1px solid #ccc; border-bottom: 1px solid #ccc;" align="left">留言回复</td>
    						</tr>
    						<tr>
    							<td style="height: 100px;">
    								<textarea class="text-input " style="width: 100%; height: 100%;" id="content"></textarea>
    							</td>
    						</tr>
    						<tr>
    							<td style="height: 40px; background: #f7f7f7; padding-right: 20px; border-top: 1px solid #ccc;" align="right">
    								<a href="javascript:void(0)" onclick="funSendInfo();" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-ok'">发送信息</a>
    								<input type="hidden" id="userId" value="${param.userId }"/>
    								<a href="javascript:void(0)" onclick="$('#div_win').window('close');" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-cancel'">关闭留言板</a>
    							</td>
    						</tr>
    					</table>
    				</td>
    			</tr>
    		</table>
		</div>
	</div>
</div>