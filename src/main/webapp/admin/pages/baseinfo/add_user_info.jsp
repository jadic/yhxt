<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<script type="text/javascript">
<!--
	$(function(){
		
		if("${param.param1}" == "modify")
		{
			PageMain.funSetWinMaxAttr(600, 268, "修改用户", "icon-edit");
		}
		else
		{
			PageMain.funSetWinMaxAttr(600, 268, "新增用户", "icon-add");		
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
<div id="div_win" class="easyui-window" title="角色管理"  closed="false" maximizable="false" minimizable="false" collapsible="false"  style="background: #fafafa;">
	<div class="easyui-layout" fit="true">
		<div region="center" border="false" align="left" style="background:#fff; padding: 1px;">
	  		<table border="0" cellspacing="0" cellpadding="0" bordercolordark="999999" bordercolorlight="cbe6a1" class="njty_table">
				<tr>
					<td class="njty_bg" align="right">登录帐号：</td>
					<td class="njty_bl">
						<input id="in01" class="njty_input" onblur="$(this).val($.trim($(this).val()))" maxlength="11"/>
						<span style="color:red;">*</span>
					</td>
				</tr>
				<tr>
					<td class="njty_bg" align="right">登录密码：</td>
					<td class="njty_bl">
						<input id="in02" class="njty_input" onblur="$(this).val($.trim($(this).val()))" maxlength="11" type="password"/>
						<span style="color:red;">*</span>
					</td>
				</tr>
				<tr>
					<td class="njty_bg" align="right">用户姓名：</td>
					<td class="njty_bl">
						<input id="in03" class="njty_input" onblur="$(this).val($.trim($(this).val()))" maxlength="11"/>
						<span style="color:red;">*</span>
					</td>
				</tr>
				<tr>
					<td class="njty_bg" align="right">联系电话：</td>
					<td class="njty_bl">
						<input id="in04" class="njty_input" onblur="$(this).val($.trim($(this).val()))" maxlength="11"/>
						<span style="color:red;">*</span>
					</td>
				</tr>
				<tr>
					<td class="njty_bg" align="right">备<span style="padding: 0 12px;"></span>注：</td>
					<td class="njty_bl">
						<textarea id="in05" class="njty_textarea" style="width: 300px; height:70px;" maxlength="100" onblur="$(this).val($.trim($(this).val()))"></textarea>
					</td>
				</tr>
			</table>
		</div>
		<div region="south" style="height: 35px; overflow: hidden;" border="false">
			<table border="0" cellspacing="0" cellpadding="0" bordercolordark="999999" bordercolorlight="cbe6a1" class="njty_table">
				<tr>
					<td class="njty_bg" align="center" style="width:100%; background: #cccccc;" valign="middle">
						<input type="hidden" id="in00" value="0">
						<a class="easyui-linkbutton" iconCls="icon-ok" href="javascript:void(0)" id="btn_01" onclick="PageUser.funSaveInfo('${param.param1}')">确定</a>
						<a class="easyui-linkbutton" iconCls="icon-cancel" href="javascript:void(0)"  onclick="$('#div_win').window('close')">关闭</a>
					</td>
				</tr>
			</table>
		</div>
	</div>
</div>