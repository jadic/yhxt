<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<script type="text/javascript">
<!--
	$(function(){
		
		if("${param.param1}" == "modify")
		{
			PageMain.funSetWinMaxAttr(600, 550, "修改资讯", "icon-edit");
		}
		else
		{
			PageMain.funSetWinMaxAttr(600, 550, "新增资讯", "icon-add");		
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
					<td class="njty_bg" align="right" style="width: 80px;">资讯名称：</td>
					<td class="njty_bl">
						<input id="in01" class="njty_input" style="width: 96%" onblur="$(this).val($.trim($(this).val()))" maxlength="50"/>
						<span style="color:red;">*</span>
					</td>
					<td rowspan="2" class="njty_bl" style="width: 100px; padding: 1px;">
						<img id="in02" src="" style="width: 120px; height: 120px;">
					</td>
				</tr>
				<tr>
					<td class="njty_bg" align="right">资讯图标：</td>
					<td class="njty_bl">
						<input id="in03" type="file" class="njty_input" style="width: 82%;"/>
						<a class="easyui-linkbutton" href="javascript:void(0)" onclick="PageNews.funUploadFileInfo()">上传</a>
						<span style="padding-left: 20px; color: red;" id="showtitle"></span>
					</td>
				</tr>
				<tr>
					<td class="njty_bg" align="right">内<span style="padding: 0 12px;"></span>容：</td>
					<td class="njty_bl" colspan="2">
						<textarea id="in04" class="njty_textarea" style="width: 100%; height:330px;" onblur="$(this).val($.trim($(this).val()))"></textarea>
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
						<a class="easyui-linkbutton" iconCls="icon-ok" href="javascript:void(0)" id="btn_01" onclick="PageNews.funSaveInfo('${param.param1}')">确定</a>
						<a class="easyui-linkbutton" iconCls="icon-cancel" href="javascript:void(0)"  onclick="$('#div_win').window('close')">关闭</a>
					</td>
				</tr>
			</table>
		</div>
	</div>
</div>