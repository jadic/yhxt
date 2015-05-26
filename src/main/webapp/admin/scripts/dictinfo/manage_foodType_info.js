var PageFoodType = {
  mSelDataGrid : null,
  init : function() {
    this.showGrid();
  },

  showGrid : function() {
    $("#div_grid")
        .datagrid(
            {
              fit : true,
              nowrap : true,
              stripe : true,
              url : _ctx_ + "/a/foodType/query.do",
              pageNumber : 1,
              queryParams : {
                "name" : $("#out01").val()
              },
              columns : [ [ {
                field : 'id',
                title : '食品类型编号',
                width : 200,
                align : 'center',
                hidden : "true"
              }, {
                field : 'name',
                title : '食品类型名称',
                width : 200,
                align : 'center'
              } ] ],
              onClickRow : function(index, rec) {

              },
              toolbar : [
                  {
                    text : '新增',
                    iconCls : 'icon-add',
                    handler : function() {
                      PageMain.funCreateWinInfo("#div_win",
                          "dictinfo/add_foodType_info", {
                            param1 : "add"
                          });
                    }
                  },
                  '-',
                  {
                    text : '修改',
                    iconCls : 'icon-edit',
                    handler : function() {
                      PageFoodType.mSelDataGrid = PageMain
                          .funSelectEd("#div_grid");
                      if (PageFoodType.mSelDataGrid != null) {
                        PageMain.funCreateWinInfo("#div_win",
                            "dictinfo/add_foodType_info", {
                              param1 : "modify"
                            });
                        PageFoodType.funSetDataGrid(PageFoodType.mSelDataGrid);
                      }
                    }
                  }, '-', {
                    text : '删除',
                    iconCls : 'icon-cancel',
                    handler : function() {
                      PageFoodType.funDelInfo();
                    }
                  } ],
              pagination : true,
              singleSelect : true,
              rownumbers : true
            });
  },
  funSetDataGrid : function(record) {
    $("#in00").val(record.id);
    $("#in01").val(record.name);
    console.dir(record.icon);
    if (record.icon != null && record.icon != '') {
      $("#in02").attr("src", _ctx_+record.icon);
      $("#in04").val(record.icon);
    }
  },
  funSearchInfo : function() {
    $("#div_grid").datagrid({
      url : _ctx_ + "/a/foodType/query.do",
      pageNumber : 1,
      queryParams : {
        "name" : $("#out01").val()
      }
    });
  },
  funSaveInfo : function(_param) {

    if (funIsNull("#in01", "食品类型")) {
      return false;
    }

    /** 打开进度条* */
    PageMain.funOpenProgress();
    $.ajax({
      url : _ctx_ + "/a/foodType/" + _param + ".do?a=" + Math.random(),
      type : 'post',
      dataType : 'json',
      data : {
        "id" : $("#in00").val(),
        "name" : $("#in01").val(),
        "icon" : $("#in04").val()
      },
      error : function(data) {
        /** 关闭进度条* */
        PageMain.funCloseProgress();
        $.messager.alert('信息提示', '操作失败：提交超时或此方法不存在！', 'error');
      },
      success : function(data) {

        /** 关闭进度条* */
        PageMain.funCloseProgress();

        /** 数据处理* */
        if (data.success) {
          $("#out01").val($("#in01").val());
          $('#div_win').window('close');
          PageFoodType.funSearchInfo();
          $.messager.alert('信息提示', data.msg, 'info');
        } else {
          $.messager.alert('信息提示', data.msg, 'error');
        }
      }
    });
  },
  funDelInfo : function() {
    PageFoodType.mSelDataGrid = PageMain.funSelectEd("#div_grid");
    if (PageFoodType.mSelDataGrid != null) {
      $.messager.confirm('确认',
          "您确认要删除选中的：【<span style='color:red; font:bold;'>"
              + PageFoodType.mSelDataGrid.name + "</span>】这条记录吗？", function(r) {
            if (r) {
              /** 打开进度条* */
              PageMain.funOpenProgress();

              $.ajax({
                url : _ctx_ + "/a/foodType/del.do?a=" + Math.random(),
                type : 'post',
                dataType : 'json',
                data : {
                  "id" : PageFoodType.mSelDataGrid.id
                },
                error : function(data) {
                  /** 关闭进度条* */
                  PageMain.funCloseProgress();
                  $.messager.alert('信息提示', '操作失败：提交超时或此方法不存在！', 'error');
                },
                success : function(data) {
                  /** 关闭进度条* */
                  PageMain.funCloseProgress();

                  /** 数据处理* */
                  if (data.success) {
                    $('#div_grid').datagrid(
                        'deleteRow',
                        $('#div_grid').datagrid('getRowIndex',
                            PageFoodType.mSelDataGrid));
                    $.messager.alert('信息提示', data.msg, 'info');
                  } else {
                    $.messager.alert('信息提示', data.msg, 'error');
                  }
                }
              });
            }
          });
    }
  },
  funUploadFileInfo : function() {
    try {
      console.dir("before get upload");
      var uploadFile = dwr.util.getValue("in03");
      console.dir("after get upload");
      var filenames = uploadFile.value.split("\\");
      if (filenames.length <= 1) {
        filenames = uploadFile.value.split("/");
      }
      var filename = filenames[filenames.length - 1].toLowerCase();
      var fileType = filename.substring(filename.indexOf("."));
      if (fileType == ".jpg" || fileType == ".bmp" || fileType == ".png"
          || fileType == ".gif") {
        loadDwr.uploadFileInfo(uploadFile, filename, {
          "callback" : function(data) {
            console.dir("data:" + data);
            if (data == 1 || data == "1") {
              $.messager.alert("提示", "图片上传失败", "error");
//              $("#showtitle").val("图片上传在功！");
            } else {
//              $("#showtitle").val("图片上传在功！");
              $("#in04").val(data);
              $("#in02").attr("src", _ctx_ + data);
            }
          }
        });
      } else {
        $.messager.alert("提示", "上传的照片类型应当为jpg/bmp/png/gif！", "error");
      }
    } catch (e) {
    }
  }

};

$(function() {
  PageFoodType.init();
  PageMain.funCloseProgressInfo();
});