<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<script type="text/javascript">
<!--
	$(function(){
		PageMain.funSetWinMaxAttr(750, 380, "我要反馈", "icon-edit");
		$('#div_win').window({
			modal: true,
			title : PageMain.mWinTitle,
			shadow: false,
			top: 120,
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
<div id="div_win" class="easyui-window"  closed="false" maximizable="false" minimizable="false" collapsible="false"  style="background: #fafafa;">
	<div class="easyui-layout" fit="true">
		<div region="center" border="false" align="left" style="background:#fff; padding: 1px;">
            <table style="width: 100%; height: 100%;" border="0" cellpadding="0" cellspacing="0">
    			<tr>
    				<td style="border: solid #ccc; border-width: 1px;" valign="top">
    					<table style="width: 100%; height: 100%;" border="0" cellpadding="0" cellspacing="0">
    						<tr>
    							<td style="height: 40px; width:100px; padding-right: 10px; border-right: 1px solid #ccc; border-bottom: 1px solid #ccc;" align="right">反馈类型：</td>
    							<td style="border-bottom: 1px solid #ccc; padding-left: 10px;">
    								<select id="in001" style=" width: 350px;height: 30px;border: 1px solid #aeaeae;font: 13px/26px "微软雅黑";color: #5a5a5a;">
					                    <option value="0">网站建设反馈</option>
					                    <option value="1">服务反馈</option>
					               </select>
    							</td>
    						</tr>
    						<tr>
    							<td style="padding-right: 10px; border-right: 1px solid #ccc;" align="right">反馈内容：</td>
    							<td style="padding-left: 10px;">
    								<textarea class="text-input " style="width: 600px; height:250px; border: 1px solid #aeaeae;" id="in002"></textarea>
    							</td>
    						</tr>
    						<tr>
    							<td colspan="2" style="height: 40px; background: #f7f7f7; padding-right: 20px; border-top: 1px solid #ccc;" align="center">
    								<a href="javascript:void(0)" onclick="funSaveFeedBackInfo();" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-ok'">提交</a>
    								<a href="javascript:void(0)" onclick="$('#div_win').window('close');" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-cancel'">关闭</a>
    							</td>
    						</tr>
    					</table>
    				</td>
    			</tr>
    		</table>
		</div>
	</div>
</div>