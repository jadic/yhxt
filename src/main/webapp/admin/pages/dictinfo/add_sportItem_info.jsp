<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<script type="text/javascript">
<!--
	$(function(){
		
		if("${param.param1}" == "modify")
		{
			PageMain.funSetWinMaxAttr(360, 160, "修改运动项目", "icon-edit");
		}
		else
		{
			PageMain.funSetWinMaxAttr(360, 160, "新增运动项目", "icon-add");		
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
					<td class="njty_bg" align="right" style="width: 120px;">运动名称：</td>
					<td class="njty_bl">
						<input id="in01" class="easyui-textbox" data-options="prompt:'请输入运动名称'" onblur="$(this).val($.trim($(this).val()))" maxlength="25"/>
						<span style="color:red;">*</span>
					</td>
				</tr>
                <tr>
                  <td class="njty_bg" align="right" style="width: 120px;">每分钟消耗卡路里：</td>
                  <td class="njty_bl">
                    <input id="in02" class="easyui-numberbox" data-options="min:1,max:999999,prompt:'每分钟消耗卡路里'" onblur="$(this).val($.trim($(this).val()))" maxlength="100"/>
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
						<a class="easyui-linkbutton" iconCls="icon-ok" href="javascript:void(0)" id="btn_01" onclick="PageSportItem.funSaveInfo('${param.param1}')">确定</a>
						<a class="easyui-linkbutton" iconCls="icon-cancel" href="javascript:void(0)"  onclick="$('#div_win').window('close')">关闭</a>
					</td>
				</tr>
			</table>
		</div>
	</div>
</div>