var PageDoctor = 
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
			url: _ctx_ + "/a/doctor/query.do",
			pageNumber: 1,
			queryParams:
			{
				"doctorName":$("#out01").val()
			},
			columns:[[
				{field:'doctorName',			    title:'医生姓名',		width:80,	align:'left'},
				{field:'doctorGender',			  title:'性别',		  width:50,	align:'left',formatter: function(value,row,index){
                  if (value == 1){
                    return '男';
                  } else if (value ==2) {
                    return '女'
                  }else {
                      return '未知';
                  }
                }},
				{field:'hospitalName',			  title:'工作医院',		width:150,	align:'left'},
				{field:'deptName',			      title:'所在科室',		width:110,	align:'left'},
				{field:'doctorTitle',			    title:'临床职称',		width:100,	align:'left'},
				{field:'doctorTeachingTitle',	title:'教学职称',		width:100,	align:'left'},
				{field:'doctorEducationName', title:'学历',		  width:60,	align:'left'},
				{field:'doctorSkill',         title:'擅长疾病',		width:150,	align:'left'}
			]],
			onClickRow: function(index, rec) {
				
			},
			toolbar:[{
				text:'新增',
				iconCls:'icon-add',
				handler:function(){
					PageMain.funCreateWinInfo("#div_win", "baseinfo/add_doctor_info", {param1: "add"});
				}
			},'-',{
				text:'修改',
				iconCls:'icon-edit',
				handler:function(){
					PageDoctor.mSelDataGrid = PageMain.funSelectEd("#div_grid");
					if(PageDoctor.mSelDataGrid != null)
					{
						PageMain.funCreateWinInfo("#div_win", "baseinfo/add_doctor_info", {param1:"modify"});
						PageDoctor.funSetDataGrid(PageDoctor.mSelDataGrid);
					}
				}
			},'-',{
				text:'删除',
				iconCls:'icon-cancel',
				handler:function()
				{
					PageDoctor.funDelInfo();
				}
			}],
			pagination:true,
			singleSelect:true,
			rownumbers: true
		});
	},
	funSetDataGrid : function(record)
	{
		$("#in00").val(record.doctorId);
		$("#in01").textbox("setValue", record.doctorName);
		$("#in02").attr("src", _ctx_ + record.doctorPhoto);
		$("#in04").combobox("setValue", record.doctorGender);
		$("#in05").combobox("setValue", record.doctorHospitalId);
		$("#in06").textbox("setValue", record.doctorDeptId);
		$("#in07").combobox("setValue", record.doctorTitle);
		$("#in08").combobox("setValue", record.doctorTeachingTitle);
		$("#in09").combobox("setValue", record.doctorEducation);
		$("#in10").textbox("setValue", record.doctorSkill);
		$("#in11").textbox("setValue", record.doctorDetailDescription);
		
		$("#17").val(record.photo);
	},
	funSearchInfo : function()
	{
		$("#div_grid").datagrid({
			url: _ctx_ + "/a/doctor/query.do",
			pageNumber: 1,
			queryParams:
			{
				"doctorName":$("#out01").val()
			}
		});
	},
	funSaveInfo : function(_param)
	{

		if (funIsNull("#in01", "医生姓名"))
		{
			return false;
		}
		
		var hospitalId = $("#in05").combobox("getValue");
		if (hospitalId == '') {
		  hospitalId = 0;
		}
		var deptId = $("#in06").combobox("getValue");
		if (deptId == '') {
		  deptId = 0;
		}
		var educationId = $("#in09").combobox("getValue");
		if (educationId == '') {
		  educationId = 0;
		}
		
		/**打开进度条**/
		PageMain.funOpenProgress();
		$.ajax({
			url : _ctx_ + "/a/doctor/"+_param+".do?a="+ Math.random(),
			type : 'post',
			dataType : 'json',
			data : 
			{
				"doctorId": $("#in00").val(),	
				"doctorName": $("#in01").val(),
				"doctorGender": $("#in04").combobox("getValue"),
				"doctorHospitalId": hospitalId,
				"doctorDeptId": deptId,
				"doctorTitle": $("#in07").combobox("getValue"),
				"doctorTeachingTitle": $("#in08").combobox("getValue"),
				"doctorEducation": educationId,
				"doctorSkill": $("#in10").val(),
				"doctorDetailDescription": $("#in11").val(),
				"doctorPhoto" : $("#in17").val()
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
					PageDoctor.funSearchInfo();
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
		PageDoctor.mSelDataGrid = PageMain.funSelectEd("#div_grid");
		if(PageDoctor.mSelDataGrid != null)
		{
			$.messager.confirm('确认', "您确认要删除选中的：【<span style='color:red; font:bold;'>"+PageDoctor.mSelDataGrid.doctorName+"</span>】这条记录吗？", function(r)
			{
				if (r)
				{
					/**打开进度条**/
					PageMain.funOpenProgress();
					
					$.ajax({
						url : _ctx_ + "/a/doctor/del.do?a="+ Math.random(),
						type : 'post',
						dataType : 'json',
						data : 
						{
							"doctorId": PageDoctor.mSelDataGrid.doctorId						
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
								$('#div_grid').datagrid('deleteRow', $('#div_grid').datagrid('getRowIndex', PageDoctor.mSelDataGrid));
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
	PageDoctor.init();
	PageMain.funCloseProgressInfo();
});
