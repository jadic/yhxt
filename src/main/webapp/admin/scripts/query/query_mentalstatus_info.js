var PageMentalStatus = {
  mSelDataGrid : null,
  init : function() {
    $("#in01").datebox({
      editable : false,//日期不可输入，只能通过鼠标选择
      formmatter : function(date) {
        var y = date.getFullYear();
        var m = date.getMonth()+1;
        var d = date.getDate();
        return y+'-'+(m<10?('0'+m):m)+'-'+(d<10?('0'+d):d);
      }
    });
    $("#in01").datebox("setValue", PageMentalStatus.getCurrDateStr());
    
    $("#in02").datebox({
      editable : false,
      formmatter : function(date) {
        var y = date.getFullYear();
        var m = date.getMonth()+1;
        var d = date.getDate();
        return y+'-'+(m<10?('0'+m):m)+'-'+(d<10?('0'+d):d);
      }
    });    
    $("#in02").datebox("setValue", PageMentalStatus.getCurrDateStr());

    this.showGrid();
  },

  showGrid : function() {
    $("#div_grid").datagrid({
      fit : true,
      nowrap : true,
      stripe : true,
      url : _ctx_ + "/a/query/queryMentalStatusRecord.do",
      pageNumber : 1,
      queryParams : {
        "startTime" : $("#in01").datebox("getValue") + ' 00:00:00',
        "endTime" : $("#in02").datebox("getValue") + ' 23:59:59'
      },
      columns : [ [ {
        field : 'a',
        title : '编号',
        width : 200,
        align : 'center',
        hidden : "true"
      }, {
        field : 'b',
        title : '用户',
        width : 100,
        align : 'center'
      }, {
        field : 'c',
        title : '心理状态',
        width : 100,
        align : 'center',
        formatter: function(value,row,index){
          if (value == 1){
            return '开心';
          } else if (value == 2){
            return '平静';
          } else if (value == 3) {
            return '沮丧';
          } else if (value == 3) {
            return '烦躁';
          }else {
            return '其他[' + value + ']';
          }
        }
      }, {
        field : 'd',
        title : '记录时间',
        width : 150,
        align : 'center'
      } ] ],
      pagination : true,
      singleSelect : true,
      rownumbers : true
    });
  },
  funSearchInfo : function() {
    var stime = $("#in01").datebox("getValue") + ' 00:00:00';
    var etime = $("#in02").datebox("getValue") + ' 23:59:59';
    if (stime > etime) {
      $.messager.alert('信息提示', '开始时间不能大于结束时间','error');
      return;
    }
    $("#div_grid").datagrid({
      url : _ctx_ + "/a/query/queryMentalStatusRecord.do",
      pageNumber : 1,
      queryParams : {
        "startTime" : stime,
        "endTime" : etime
      }
    });
  },
  getCurrDateStr : function() {
    var currDate = new Date();
    var strDate = currDate.getFullYear() + "-" + (currDate.getMonth() + 1) + "-" + currDate.getDate();
    return strDate;
  }  
};

$(function() {
  PageMentalStatus.init();
  PageMain.funCloseProgressInfo();
});