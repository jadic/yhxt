<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<script type="text/javascript">
<!--
	$(function(){
		
		if("${param.param1}" == "modify")
		{
			PageMain.funSetWinMaxAttr(600, 450, "修改医生", "icon-edit");
		}
		else
		{
			PageMain.funSetWinMaxAttr(600, 450, "新增医生", "icon-add");		
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

		$("#in05").combobox({
		  	valueField: 'id',
			textField: 'name',
			url : _ctx_ + "/a/doctor/queryHospitals.do?a="+ Math.random()
		});

		$("#in06").combobox({
		  	valueField: 'id',
			textField: 'name',
			url : _ctx_ + "/a/doctor/queryHospitalDepts.do?a="+ Math.random()
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
                <input id="in01" class="easyui-textbox" data-options="prompt:'请输入医生姓名'" style="width: 95%" onblur="$(this).val($.trim($(this).val()))" maxlength="20"/>
                <span style="color:red;">*</span>
              </td>
              <td rowspan="5" class="njty_bl" style="width: 125px; padding: 1px;">
                <img id="in02" src="" style="width: 125px; height: 125px;">
              </td>
            </tr>
            <tr>
              <td class="njty_bg" align="right">医生照片：</td>
              <td class="njty_bl">
                <input id="in03" type="file" class="njty_input" style="width: 80%;" onblur="$(this).val($.trim($(this).val()))"/>
                <a class="easyui-linkbutton" href="javascript:void(0)" onclick="PageDoctor.funUploadFileInfo()">上传</a>
                <span style="padding-left: 20px; color: red;" id="showtitle"></span>
              </td>
            </tr>
            <tr>
              <td class="njty_bg" align="right" style="width: 80px;">性<span style="padding: 0 12px;"></span>别：</td>
              <td class="njty_bl" >
                <select id="in04" class="easyui-combobox" style="width:100px;">
                  <option value="1">男</option>
                  <option value="2">女</option>
                </select>                
              </td>
            </tr>
            <tr>
              <td class="njty_bg" align="right" style="width: 80px;">所属医院：</td>
              <td class="njty_bl" >
                <select id="in05" class="easyui-combobox" style="width:200px;">
                </select>  
              </td>
            </tr>
            <tr>
              <td class="njty_bg" align="right" style="width: 80px;">所在科室：</td>
              <td class="njty_bl" >
                <select id="in06" class="easyui-combobox" style="width:200px;">
                </select>  
              </td>
            </tr>
            <tr>
              <td class="njty_bg" align="right" style="width: 80px;">临床职称：</td>
              <td class="njty_bl" colspan="2">
                <select id="in07" class="easyui-combobox" style="width:200px;">
                  <option value="主任医师">主任医师</option>
                  <option value="副主任医师">副主任医师</option>
                  <option value="主治医师">主治医师</option>
                </select>  
              </td>
            </tr>
            <tr>
              <td class="njty_bg" align="right" style="width: 80px;">教学职称：</td>
              <td class="njty_bl" colspan="2">
                <select id="in08" class="easyui-combobox" style="width:200px;">
                  <option value="教授">教授</option>
                  <option value="副教授">副教授</option>
                  <option value="讲师">讲师</option>
                </select>  
              </td>
            </tr>
            <tr>
              <td class="njty_bg" align="right" style="width: 80px;">学<span style="padding: 0 12px;"></span>历：</td>
              <td class="njty_bl" colspan="2">
                <select id="in09" class="easyui-combobox" style="width:200px;">
                  <option value="1">小学</option>
                  <option value="2">初中</option>
                  <option value="3">高中</option>
                  <option value="4">中专</option>
                  <option value="5">大专</option>
                  <option value="6">本科</option>
                  <option value="7">硕士</option>
                  <option value="8">博士</option>
                  <option value="9">其它</option>
                </select>                  
              </td>
            </tr>
            <tr>
              <td class="njty_bg" align="right" style="width: 80px;">擅长疾病：</td>
              <td class="njty_bl" colspan="2">
                <input id="in10" class="easyui-textbox" data-options="prompt:'请输入医生擅长疾病'" style="width: 95%" onblur="$(this).val($.trim($(this).val()))" maxlength="20"/>
              </td>
            </tr>
            <tr>
              <td class="njty_bg" align="right" style="width: 80px;">简要介绍：</td>
              <td class="njty_bl" colspan="2">
                <input id="in11" class="easyui-textbox" data-options="prompt:'请输入医生简要介绍',multiline:true" style="width: 95%; height: 80px;" onblur="$(this).val($.trim($(this).val()))" maxlength="500"/>
              </td>
            </tr>
          </table>      
		</div>
		<div region="south" style="height: 35px; overflow: hidden;" border="false">
			<table border="0" cellspacing="0" cellpadding="0" bordercolordark="999999" bordercolorlight="cbe6a1" class="njty_table">
				<tr>
					<td class="njty_bg" align="center" style="width:100%; background: #cccccc;" valign="middle">
						<input type="hidden" id="in00" value="0">
                        <input type="hidden" id="in17" value="">
						<a class="easyui-linkbutton" iconCls="icon-ok" href="javascript:void(0)" id="btn_01" onclick="PageDoctor.funSaveInfo('${param.param1}')">确定</a>
						<a class="easyui-linkbutton" iconCls="icon-cancel" href="javascript:void(0)"  onclick="$('#div_win').window('close')">关闭</a>
					</td>
				</tr>
			</table>
		</div>
	</div>
</div>