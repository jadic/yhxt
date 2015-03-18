<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<script type="text/javascript">
<!--
	$(function(){
		
		if("${param.param1}" == "modify")
		{
			PageMain.funSetWinMaxAttr(600, 420, "修改医生", "icon-edit");
		}
		else
		{
			PageMain.funSetWinMaxAttr(600, 420, "新增医生", "icon-add");		
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

		$("#in03").combobox({
		  	valueField: 'id',
			textField: 'text',
			data: [{
				text: '用户平台',
				id: 1
			},{
			  	text: '医护平台',
			  	id: 2
			},{
			  	text: '运营管理',
			  	id: 3
			}],
			value : 1,
			onChange : function(newValue, oldValue) {
				var selVal = $(this).combobox("getValue");
				var disabled = selVal != 1;
			  	$("#in04").prop('disabled', disabled);
			  	if (disabled) {
			  		$("#l01").css({color:'#C0C0C0'});
    			  	$("#in05").combobox('disable');
			  	} else {
			  	    $("#l01").css({color:'#000000'});
    			  	$("#in05").combobox('enable');
			  	}
			}
		});

		$("#in05").combobox({
		  	valueField: 'userId',
			textField: 'name',
			url : _ctx_ + "/a/user/queryParents.do?a="+ Math.random()
		});
		
		
	});

//-->
</script>
<div id="div_win" class="easyui-window" title="角色管理"  closed="false" maximizable="false" minimizable="false" collapsible="false"  style="background: #fafafa;">
	<div class="easyui-layout" fit="true">
		<div region="center" border="false" align="left" style="background:#fff; padding: 1px;">
            <table border="0" cellspacing="0" cellpadding="0" bordercolordark="999999" bordercolorlight="cbe6a1" class="njty_table">
            <tr>
              <td class="njty_bg" align="right" style="width: 80px;">医生姓名：</td>
              <td class="njty_bl">
                <input id="in01" class="easyui-textbox" data-options="prompt:'请输入用户账号'" style="width: 95%" onblur="$(this).val($.trim($(this).val()))" maxlength="20"/>
                <span style="color:red;">*</span>
              </td>
              <td rowspan="3" class="njty_bl" style="width: 120px; padding: 1px;">
                <img id="in02" src="" style="width: 120px; height: 120px;">
              </td>
            </tr>
            <tr>
              <td class="njty_bg" align="right" style="width: 80px;">性<span style="padding: 0 12px;"></span>别：</td>
              <td class="njty_bl" >
                <select id="in08" class="easyui-combobox" style="width:100px;">
                  <option value="1">男</option>
                  <option value="2">女</option>
                </select>                
              </td>
            </tr>
            <tr>
              <td class="njty_bg" align="right">用户照片：</td>
              <td class="njty_bl">
                <input id="in06" type="file" class="njty_input" style="width: 80%;" onblur="$(this).val($.trim($(this).val()))"/>
                <a class="easyui-linkbutton" href="javascript:void(0)" onclick="PageUser.funUploadFileInfo()">上传</a>
                <span style="padding-left: 20px; color: red;" id="showtitle"></span>
              </td>
            </tr>
            <tr>
              <td class="njty_bg" align="right" style="width: 80px;">所属医院：</td>
              <td class="njty_bl" colspan="2">
                <input id="in09" style="width: 95%" class="Wdate njty_input"  onclick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/>
              </td>
            </tr>
            <tr>
              <td class="njty_bg" align="right" style="width: 80px;">所在科室：</td>
              <td class="njty_bl" colspan="2">
                <input id="in10" class="easyui-numberbox" data-options="prompt:'请输入用户手机号'" style="width: 95%" onblur="$(this).val($.trim($(this).val()))" maxlength="11"/>
              </td>
            </tr>
            <tr>
              <td class="njty_bg" align="right" style="width: 80px;">临床职称：</td>
              <td class="njty_bl" colspan="2">
                <input id="in11" class="easyui-numberbox" data-options="prompt:'请输入用户身高，单位:公斤'" style="width: 95%" onblur="$(this).val($.trim($(this).val()))" maxlength="50"/>
              </td>
            </tr>
            <tr>
              <td class="njty_bg" align="right" style="width: 80px;">教学职称：</td>
              <td class="njty_bl" colspan="2">
                <input id="in12" class="easyui-numberbox" data-options="prompt:'请输入用户体重，单位:厘米'" style="width: 95%" onblur="$(this).val($.trim($(this).val()))" maxlength="50"/>
              </td>
            </tr>
            <tr>
              <td class="njty_bg" align="right" style="width: 80px;">学<span style="padding: 0 12px;"></span>历：</td>
              <td class="njty_bl" colspan="2">
                <input id="in13" class="easyui-textbox" data-options="prompt:'请输入用户家庭住址'" style="width: 95%" onblur="$(this).val($.trim($(this).val()))" maxlength="50"/>
              </td>
            </tr>
            <tr>
              <td class="njty_bg" align="right" style="width: 80px;">擅长疾病：</td>
              <td class="njty_bl" colspan="2">
                <input id="in14" class="easyui-textbox" data-options="prompt:'请输入用户固定电话'" style="width: 95%" onblur="$(this).val($.trim($(this).val()))" maxlength="20"/>
              </td>
            </tr>
          </table>      
		</div>
		<div region="south" style="height: 35px; overflow: hidden;" border="false">
			<table border="0" cellspacing="0" cellpadding="0" bordercolordark="999999" bordercolorlight="cbe6a1" class="njty_table">
				<tr>
					<td class="njty_bg" align="center" style="width:100%; background: #cccccc;" valign="middle">
						<input type="hidden" id="in00" value="0">
                        <input type="hidden" id="in17" value="0">
						<a class="easyui-linkbutton" iconCls="icon-ok" href="javascript:void(0)" id="btn_01" onclick="PageUser.funSaveInfo('${param.param1}')">确定</a>
						<a class="easyui-linkbutton" iconCls="icon-cancel" href="javascript:void(0)"  onclick="$('#div_win').window('close')">关闭</a>
					</td>
				</tr>
			</table>
		</div>
	</div>
</div>