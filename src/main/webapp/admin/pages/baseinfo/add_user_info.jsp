<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<script type="text/javascript">
<!--
	$(function(){
		
		if("${param.param1}" == "modify")
		{
			PageMain.funSetWinMaxAttr(600, 440, "修改用户", "icon-edit");
		}
		else
		{
			PageMain.funSetWinMaxAttr(600, 440, "新增用户", "icon-add");		
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
              <td class="njty_bg" align="right" style="width: 80px;">用户账号：</td>
              <td class="njty_bl">
                <input id="in01" class="njty_input" style="width: 95%" onblur="$(this).val($.trim($(this).val()))" maxlength="50"/>
                <span style="color:red;">*</span>
              </td>
              <td rowspan="4" class="njty_bl" style="width: 120px; padding: 1px;">
                <img id="in08" src="" style="width: 120px; height: 120px;">
              </td>
            </tr>
            <tr>
              <td class="njty_bg" align="right">账号类型：</td>
              <td class="njty_bl">
                <input id="in02" style="width: 95%" class="Wdate njty_input"  onclick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/>
              </td>
            </tr>
            <tr>
              <td class="njty_bg" align="right">关联账号：</td>
              <td class="njty_bl">
                <input id="in03" style="width: 95%" class="Wdate njty_input"  onclick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/>
              </td>
            </tr>
            <tr>
              <td class="njty_bg" align="right">用户照片：</td>
              <td class="njty_bl">
                <input id="in05" type="file" class="njty_input" style="width: 80%;" onblur="$(this).val($.trim($(this).val()))"/>
                <a class="easyui-linkbutton" href="javascript:void(0)" onclick="PageService.funUploadFileInfo()">上传</a>
                <span style="padding-left: 20px; color: red;" id="showtitle"></span>
              </td>
            </tr>
            <tr>
              <td class="njty_bg" align="right" style="width: 80px;">真实姓名：</td>
              <td class="njty_bl" colspan="2">
                <input id="in01" class="njty_input" style="width: 95%" onblur="$(this).val($.trim($(this).val()))" maxlength="50"/>
                <span style="color:red;">*</span>
              </td>
            </tr>
            <tr>
              <td class="njty_bg" align="right" style="width: 80px;">性<span style="padding: 0 12px;"></span>别：</td>
              <td class="njty_bl" colspan="2">
                <input id="in01" class="njty_input" style="width: 95%" onblur="$(this).val($.trim($(this).val()))" maxlength="50"/>
                <span style="color:red;">*</span>
              </td>
            </tr>
            <tr>
              <td class="njty_bg" align="right" style="width: 80px;">出生日期：</td>
              <td class="njty_bl" colspan="2">
                <input id="in01" class="njty_input" style="width: 95%" onblur="$(this).val($.trim($(this).val()))" maxlength="50"/>
                <span style="color:red;">*</span>
              </td>
            </tr>
            <tr>
              <td class="njty_bg" align="right" style="width: 80px;">手机号码：</td>
              <td class="njty_bl" colspan="2">
                <input id="in01" class="njty_input" style="width: 95%" onblur="$(this).val($.trim($(this).val()))" maxlength="50"/>
                <span style="color:red;">*</span>
              </td>
            </tr>
            <tr>
              <td class="njty_bg" align="right" style="width: 80px;">身<span style="padding: 0 12px;"></span>高：</td>
              <td class="njty_bl" colspan="2">
                <input id="in01" class="njty_input" style="width: 95%" onblur="$(this).val($.trim($(this).val()))" maxlength="50"/>
                <span style="color:red;">*</span>
              </td>
            </tr>
            <tr>
              <td class="njty_bg" align="right" style="width: 80px;">体<span style="padding: 0 12px;"></span>重：</td>
              <td class="njty_bl" colspan="2">
                <input id="in01" class="njty_input" style="width: 95%" onblur="$(this).val($.trim($(this).val()))" maxlength="50"/>
                <span style="color:red;">*</span>
              </td>
            </tr>
            <tr>
              <td class="njty_bg" align="right" style="width: 80px;">家庭住址：</td>
              <td class="njty_bl" colspan="2">
                <input id="in01" class="njty_input" style="width: 95%" onblur="$(this).val($.trim($(this).val()))" maxlength="50"/>
                <span style="color:red;">*</span>
              </td>
            </tr>
            <tr>
              <td class="njty_bg" align="right" style="width: 80px;">固定电话：</td>
              <td class="njty_bl" colspan="2">
                <input id="in01" class="njty_input" style="width: 95%" onblur="$(this).val($.trim($(this).val()))" maxlength="50"/>
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
						<a class="easyui-linkbutton" iconCls="icon-ok" href="javascript:void(0)" id="btn_01" onclick="PageUser.funSaveInfo('${param.param1}')">确定</a>
						<a class="easyui-linkbutton" iconCls="icon-cancel" href="javascript:void(0)"  onclick="$('#div_win').window('close')">关闭</a>
					</td>
				</tr>
			</table>
		</div>
	</div>
</div>