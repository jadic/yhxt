var PageUser = 
{
	mSelDataGrid : null,	
	init : function()
	{
		this.showGrid();
	},
	
	showGrid : function()
	{
		$("#div_grid").datagrid({
			fit:true,
			nowrap: true,
			stripe:true,
			url: _ctx_ + "/a/user/query.do",
			pageNumber: 1,
			queryParams:
			{
				"userName":$("#out01").val()
			},
			columns:[[
				{field:'userName',			title:'登录帐号',		width:140,	align:'left'},
				{field:'name',			title:'用户名称',		width:140,	align:'left'},
				{field:'cellphone',			title:'联系电话',		width:140,	align:'left'},
				{field:'sysId',			title:'所属平台',		    width:200,	align:'left',formatter: function(value,row,index){
	                if (value == 1){
	                  return '用户平台';
	                } else if (value == 2){
	                  return '医护平台';
	                } else if (value == 3) {
	                  return '运营管理';
    				}else {
    	                    return '其他[' + value + ']';
    	                }
    	            }},
				{field:'isChild',			title:'子女账号',		    width:200,	align:'left',formatter: function(value,row,index){
                    if (value == 1){
                      return '是';
                    }else {
                        return '否';
                    }
                  }},				
				{field:'parentName',			title:'关联老人',		    width:200,	align:'left'}				
			]],
			onClickRow: function(index, rec) {
				
			},
			toolbar:[{
				text:'新增',
				iconCls:'icon-add',
				handler:function(){
					PageMain.funCreateWinInfo("#div_win", "baseinfo/add_user_info", {param1: "add"});
				}
			},'-',{
				text:'修改',
				iconCls:'icon-edit',
				handler:function(){
					PageUser.mSelDataGrid = PageMain.funSelectEd("#div_grid");
					if(PageUser.mSelDataGrid != null)
					{
						PageMain.funCreateWinInfo("#div_win", "baseinfo/add_user_info", {param1:"modify"});
						PageUser.funSetDataGrid(PageUser.mSelDataGrid);
					}
				}
			},'-',{
				text:'删除',
				iconCls:'icon-cancel',
				handler:function()
				{
					PageUser.funDelInfo();
				}
			},'-',{
        text:'重置密码',
        iconCls:'icon-edit',
        handler:function(){
          PageUser.mSelDataGrid = PageMain.funSelectEd("#div_grid");
          if(PageUser.mSelDataGrid != null)
          {
            PageUser.funResetUserPassword(PageUser.mSelDataGrid);
          }
        }
      }],
			pagination:true,
			singleSelect:true,
			rownumbers: true
		});
	},
	funSetDataGrid : function(record)
	{
		$("#in00").val(record.userId);
		$("#in01").textbox("setValue", record.userName);
		$("#in01").textbox("disable");
		$("#in02").attr("src", _ctx_ + record.photo);
		$("#in03").combobox("setValue", record.sysId);
		$("#in04").prop("checked", record.isChild == 1);
		if (record.parentId > 0) {
		  $("#in05").combobox("setValue", record.parentId);
		}
		 
		$("#in07").textbox("setValue", record.name);
		$("#in08").combobox("setValue", record.gender);
		$("#in09").val(record.birthdate);
		$("#in10").textbox("setValue", record.cellphone);
		$("#in11").textbox("setValue", record.height);
		$("#in12").textbox("setValue", record.weight);
		$("#in13").textbox("setValue", record.homePhone);
		$("#in14").textbox("setValue", record.homeAddress);
		
		$("#17").val(record.photo);
	},
	funResetUserPassword : function(record) {
	  /**打开进度条**/
    PageMain.funOpenProgress();
    $.ajax({
      url : _ctx_ + "/a/user/resetPassword.do?a="+ Math.random(),
      type : 'post',
      dataType : 'json',
      data :{"userId":record.userId},
      error:function(data)
      {
        /**关闭进度条**/
        PageMain.funCloseProgress();
        $.messager.alert('信息提示', '操作失败：提交超时或此方法不存在！', 'error');
      },
      success:function(data)
      {
        
        /**关闭进度条**/
        PageMain.funCloseProgress();
        
        /**数据处理**/
        if(data.success)
        {
          $.messager.alert('信息提示', data.msg, 'info');
        }
        else
        {
          $.messager.alert('信息提示', data.msg, 'error');
        }
      }
    })
	},
	funSearchInfo : function()
	{
		$("#div_grid").datagrid({
			url: _ctx_ + "/a/user/query.do",
			pageNumber: 1,
			queryParams:
			{
				"userName":$("#out01").val()
			}
		});
	},
	funSaveInfo : function(_param)
	{

		if (funIsNull("#in01", "登录帐号"))
		{
			return false;
		}
		
		var sysId = $("#in03").combobox("getValue");
		var isChild = 0;
		var parentId = 0;
		if (sysId == 1) {
		  var isChecked = $("#in04").prop("checked");
		  if (isChecked) {
		    isChild = 1;
		    if ($("#in05").combobox("getValue") != "") {
		      parentId = $("#in05").combobox("getValue");
		    }
		  }
		} else {
		  isChild = 0;
		  parentId = 0;
		}
		var height = $("#in11").val();
		var weight = $("#in12").val();
		var birthday = $("#in09").val();
		if (height == "") {
		  height = 0;
		}
		if (weight == "") {
		  weight = 0;
		}
		if (birthday == "") {
		  birthday = "1899-12-31";
		}
		/**打开进度条**/
		PageMain.funOpenProgress();
		$.ajax({
			url : _ctx_ + "/a/user/"+_param+".do?a="+ Math.random(),
			type : 'post',
			dataType : 'json',
			data : 
			{
				"userId": $("#in00").val(),	
				"userName": $("#in01").val(),
				"sysId": sysId,
				"isChild": isChild,
				"parentId": parentId,
				"name": $("#in07").val(),
				"gender": $("#in08").combobox("getValue"),
				"birthdate": birthday,
				"cellphone": $("#in10").val(),
				"height": height,
				"weight": weight,
				"homePhone": $("#in13").val(),
				"homeAddress":$("#in14").val(),
				"photo" : $("#in17").val()
			},
			error:function(data)
			{
				/**关闭进度条**/
				PageMain.funCloseProgress();
				$.messager.alert('信息提示', '操作失败：提交超时或此方法不存在！', 'error');
			},
			success:function(data)
			{
				
				/**关闭进度条**/
				PageMain.funCloseProgress();
				
				/**数据处理**/
				if(data.success)
				{
					$("#out01").val($("#in01").val());
					$('#div_win').window('close');
					PageUser.funSearchInfo();
					$.messager.alert('信息提示', data.msg, 'info');
				}
				else
				{
					$.messager.alert('信息提示', data.msg, 'error');
				}
			}
		});
	},
	funUploadFileInfo : function()
    {
        try
        {
            var uploadFile = dwr.util.getValue("in06"); 
            var filenames = uploadFile.value.split("\\"); 
            if(filenames.length <= 1)
            {
                filenames = uploadFile.value.split("/"); 
            }   
            var filename = filenames[filenames.length-1].toLowerCase(); 
            var fileType = filename.substring(filename.indexOf("."));
            if(fileType == ".jpg" || fileType == ".bmp" || fileType == ".png" || fileType == ".gif")
            {
                loadDwr.uploadFileInfo(uploadFile, filename, {"callback":function(data){
                    if(data == 1 || data == "1")
                    {
                        $.messager.alert("提示", "图片上传失败", "error");
                        $("#showtitle").val("图片上传在功！");
                    }
                    else
                    {
                        $("#showtitle").val("图片上传在功！");
                        $("#in17").val(data);
                        $("#in02").attr("src", _ctx_+data);
                    }   
                }});  
            }
            else
            {
                $.messager.alert("提示", "上传的照片类型应当为jpg/bmp/png/gif！", "error");
            }
        }catch(e)
        {
        }
    },
	funDelInfo : function()
	{
		PageUser.mSelDataGrid = PageMain.funSelectEd("#div_grid");
		if(PageUser.mSelDataGrid != null)
		{
			$.messager.confirm('确认', "您确认要删除选中的：【<span style='color:red; font:bold;'>"+PageUser.mSelDataGrid.userName+"</span>】这条记录吗？", function(r)
			{
				if (r)
				{
					/**打开进度条**/
					PageMain.funOpenProgress();
					
					$.ajax({
						url : _ctx_ + "/a/user/del.do?a="+ Math.random(),
						type : 'post',
						dataType : 'json',
						data : 
						{
							"userId": PageUser.mSelDataGrid.userId						
						},
						error:function(data)
						{
							/**关闭进度条**/
							PageMain.funCloseProgress();
							$.messager.alert('信息提示', '操作失败：提交超时或此方法不存在！', 'error');
						},
						success:function(data)
						{
							/**关闭进度条**/
							PageMain.funCloseProgress();
							
							/**数据处理**/
							if(data.success)
							{
								$('#div_grid').datagrid('deleteRow', $('#div_grid').datagrid('getRowIndex', PageUser.mSelDataGrid));
								$.messager.alert('信息提示', data.msg, 'info');
							}
							else
							{
								$.messager.alert('信息提示', data.msg, 'error');
							}
						}
					});
				}
			});
		}
	
	}
		
};

$(function()
{
	PageUser.init();
	PageMain.funCloseProgressInfo();
});
