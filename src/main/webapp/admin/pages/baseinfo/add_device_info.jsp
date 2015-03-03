<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<script type="text/javascript">
<!--
	$(function(){
		
		if("${param.param1}" == "modify")
		{
			PageMain.funSetWinMaxAttr(500, 200, "修改设备", "icon-edit");
		}
		else
		{
			PageMain.funSetWinMaxAttr(500, 200, "新增设备", "icon-add");		
		}
		
		$('#div_win').window({
			modal: true,
			title : PageMain.mWinTitle,
			shadow: false,
			top: PageMain.mWinMaxTop,
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
		<div region="center" border="false" align="left" style="background:#fff; padding: 1px;">
	  		<table border="0" cellspacing="0" cellpadding="0" bordercolordark="999999" bordercolorlight="cbe6a1" class="njty_table">
				<tr>
					<td class="njty_bg" align="right">设备类型：</td>
					<td class="njty_bl">
						<select id="in01" class="njty_select" style="height: 22px; width: 85%;"></select>
						<span style="color:red;">*</span>
					</td>
				</tr>
				<tr>
					<td class="njty_bg" align="right">设备编号：</td>
					<td class="njty_bl">
						<input id="in02" class="njty_input" style="width: 85%;" onblur="$(this).val($.trim($(this).val()))" maxlength="30" type="text"/>
						<span style="color:red;">*</span>
					</td>
				</tr>
				<tr>
					<td class="njty_bg" align="right">设备型号：</td>
					<td class="njty_bl">
						<input id="in03" class="njty_input" style="width: 85%;" onblur="$(this).val($.trim($(this).val()))" maxlength="30"/>
						<span style="color:red;">*</span>
					</td>
				</tr>
				<tr>
					<td class="njty_bg" align="right">SIM卡号：</td>
					<td class="njty_bl">
						<input id="in04" class="njty_input" style="width: 85%;" onblur="$(this).val($.trim($(this).val()))" maxlength="11"/>
						<span style="color:red;">*</span>
					</td>
				</tr>
			</table>
		</div>
		<div region="south" style="height: 35px; overflow: hidden;" border="false">
			<table border="0" cellspacing="0" cellpadding="0" bordercolordark="999999" bordercolorlight="cbe6a1" class="njty_table">
				<tr>
					<td class="njty_bg" align="center" style="width:100%; background: #cccccc;" valign="middle">
						<input type="hidden" id="in00" value="0">
						<a class="easyui-linkbutton" iconCls="icon-ok" href="javascript:void(0)" id="btn_01" onclick="PageDevice.funSaveInfo('${param.param1}')">确定</a>
						<a class="easyui-linkbutton" iconCls="icon-cancel" href="javascript:void(0)"  onclick="$('#div_win').window('close')">关闭</a>
					</td>
				</tr>
			</table>
		</div>
	</div>
</div>