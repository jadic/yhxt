<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<script type="text/javascript">
<!--
	$(function(){
		
		if("${param.param1}" == "modify")
		{
			PageMain.funSetWinMaxAttr(460, 180, "修改快乐驿站版块类型", "icon-edit");
		}
		else
		{
			PageMain.funSetWinMaxAttr(460, 180, "新增快乐驿站版块类型", "icon-add");		
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
					<td class="njty_bg" align="right" style="width: 125px;">版块名称：</td>
					<td class="njty_bl">
						<input id="in01" class="njty_input" onblur="$(this).val($.trim($(this).val()))" maxlength="25"/>
						<span style="color:red;">*</span>
					</td>
                    <td rowspan="3" class="njty_bl" style="width: 50px; padding: 1px;" align="center">
                      <img id="in02" src="" style="width: 48px; height: 48px;">
                    </td>          
				</tr>
				<tr>
					<td class="njty_bg" align="right" style="width: 125px;">版块简介：</td>
					<td class="njty_bl">
						<input id="in03" class="njty_input" onblur="$(this).val($.trim($(this).val()))" maxlength="100"/>
						<span style="color:red;">*</span>
					</td>        
				</tr>
				<tr>
					<td class="njty_bg" align="right" style="width: 100px;">版块图标：</td>
					<td class="njty_bl">
						<input id="in04" type="file" class="njty_input" style="width: 82%;"/>
						<a class="easyui-linkbutton" href="javascript:void(0)" onclick="PageCircleModule.funUploadFileInfo()">上传</a>
					</td>
				</tr>
			</table>
		</div>
		<div region="south" style="height: 35px; overflow: hidden;" border="false">
			<table border="0" cellspacing="0" cellpadding="0" bordercolordark="999999" bordercolorlight="cbe6a1" class="njty_table">
				<tr>
					<td class="njty_bg" align="center" style="width:100%; background: #cccccc;" valign="middle">
						<input type="hidden" id="in00" value="0">
                        <input type="hidden" id="in10" value="">
						<a class="easyui-linkbutton" iconCls="icon-ok" href="javascript:void(0)" id="btn_01" onclick="PageCircleModule.funSaveInfo('${param.param1}')">确定</a>
						<a class="easyui-linkbutton" iconCls="icon-cancel" href="javascript:void(0)"  onclick="$('#div_win').window('close')">关闭</a>
					</td>
				</tr>
			</table>
		</div>
	</div>
</div>