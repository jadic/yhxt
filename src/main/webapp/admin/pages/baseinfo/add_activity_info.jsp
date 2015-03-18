<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<script type="text/javascript">
<!--
	$(function(){
		
		if("${param.param1}" == "modify")
		{
			PageMain.funSetWinMaxAttr(1000, 560, "修改活动", "icon-edit");
		}
		else
		{
			PageMain.funSetWinMaxAttr(1000, 560, "新增活动", "icon-add");		
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
					<td class="njty_bg" align="right" style="width: 110px;">活动名称：</td>
					<td class="njty_bl">
						<input id="in01" class="njty_input" style="width: 95%" onblur="$(this).val($.trim($(this).val()))" maxlength="50"/>
						<span style="color:red;">*</span>
					</td>
					<td rowspan="5" class="njty_bl" style="width: 120px; padding: 1px;">
						<img id="in08" src="" style="width: 120px; height: 160px;">
					</td>
				</tr>
				<tr>
					<td class="njty_bg" align="right">开始时间：</td>
					<td class="njty_bl">
						<input id="in02" style="width: 95%" class="Wdate njty_input"  onclick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/>
					</td>
				</tr>
				<tr>
					<td class="njty_bg" align="right">结束时间：</td>
					<td class="njty_bl">
						<input id="in03" style="width: 95%" class="Wdate njty_input"  onclick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/>
					</td>
				</tr>
				<tr>
					<td class="njty_bg" align="right">备<span style="padding: 0 12px;"></span>注：</td>
					<td class="njty_bl">
						<textarea id="in04" class="njty_textarea" style="width: 95%; height:45px;" onblur="$(this).val($.trim($(this).val()))"></textarea>
					</td>
				</tr>
				<tr>
					<td class="njty_bg" align="right">活动图标：</td>
					<td class="njty_bl">
						<input id="in05" type="file" class="njty_input" style="width: 50%;" onblur="$(this).val($.trim($(this).val()))"/>
						<a class="easyui-linkbutton" href="javascript:void(0)" onclick="PageActivity.funUploadFileInfo()">上传</a>
						<span style="padding-left: 20px; color: red;" id="showtitle"></span>
					</td>
				</tr>
				<tr>
					<td class="njty_bg" align="right">内<span style="padding: 0 12px;"></span>容：</td>
					<td class="njty_bl" colspan="2">
						<textarea id="in06" class="njty_textarea" style="width: 95%; height:320px;" onblur="$(this).val($.trim($(this).val()))"></textarea>
					</td>
				</tr>
			</table>
		</div>
		<div region="south" style="height: 35px; overflow: hidden;" border="false">
			<table border="0" cellspacing="0" cellpadding="0" bordercolordark="999999" bordercolorlight="cbe6a1" class="njty_table">
				<tr>
					<td class="njty_bg" align="center" style="width:100%; background: #cccccc;" valign="middle">
						<input type="hidden" id="in00" value="0">
						<input type="hidden" id="in07" value="0">
						<input type="hidden" id="in09" value="0">
						<a class="easyui-linkbutton" iconCls="icon-ok" href="javascript:void(0)" id="btn_01" onclick="PageActivity.funSaveInfo('${param.param1}')">确定</a>
						<a class="easyui-linkbutton" iconCls="icon-cancel" href="javascript:void(0)"  onclick="$('#div_win').window('close')">关闭</a>
					</td>
				</tr>
			</table>
		</div>
	</div>
</div>