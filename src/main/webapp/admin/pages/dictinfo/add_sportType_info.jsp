<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<script type="text/javascript">
<!--
	$(function(){
		
		if("${param.param1}" == "modify")
		{
			PageMain.funSetWinMaxAttr(450, 140, "修改运动类型", "icon-edit");
		}
		else
		{
			PageMain.funSetWinMaxAttr(450, 140, "新增运动类型", "icon-add");		
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
<div id="div_win" class="easyui-window"  closed="false" maximizable="false" minimizable="false" collapsible="false"  style="background: #fafafa;">
	<div class="easyui-layout" fit="true">
		<div region="center" border="false" align="left" style="background:#fff; padding: 1px;">
	  		<table border="0" cellspacing="0" cellpadding="0" bordercolordark="999999" bordercolorlight="cbe6a1" class="njty_table">
				<tr>
					<td class="njty_bg" align="right" style="width: 100px;">运动类型名称：</td>
					<td class="njty_bl">
						<input id="in01" class="njty_input" onblur="$(this).val($.trim($(this).val()))" maxlength="25"/>
						<span style="color:red;">*</span>
					</td>
                    <td rowspan="2" class="njty_bl" style="width: 50px; padding: 1px;" align="center">
                      <img id="in02" src="" style="width: 48px; height: 48px;">
                    </td>          
				</tr>
				<tr>
					<td class="njty_bg" align="right" style="width: 100px;">运动类型图标：</td>
					<td class="njty_bl">
						<input id="in03" type="file" class="njty_input" style="width: 78%;"/>
						<a class="easyui-linkbutton" href="javascript:void(0)" onclick="PageSportType.funUploadFileInfo()">上传</a>
					</td>
				</tr>
			</table>
		</div>
		<div region="south" style="height: 35px; overflow: hidden;" border="false">
			<table border="0" cellspacing="0" cellpadding="0" bordercolordark="999999" bordercolorlight="cbe6a1" class="njty_table">
				<tr>
					<td class="njty_bg" align="center" style="width:100%; background: #cccccc;" valign="middle">
						<input type="hidden" id="in00" value="0">
                        <input type="hidden" id="in04" value="">
						<a class="easyui-linkbutton" iconCls="icon-ok" href="javascript:void(0)" id="btn_01" onclick="PageSportType.funSaveInfo('${param.param1}')">确定</a>
						<a class="easyui-linkbutton" iconCls="icon-cancel" href="javascript:void(0)"  onclick="$('#div_win').window('close')">关闭</a>
					</td>
				</tr>
			</table>
		</div>
	</div>
</div>