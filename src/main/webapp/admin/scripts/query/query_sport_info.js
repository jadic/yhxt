var PageSport = {
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
    $("#in01").datebox("setValue", PageSport.getCurrDateStr());
    
    $("#in02").datebox({
      editable : false,
      formmatter : function(date) {
        var y = date.getFullYear();
        var m = date.getMonth()+1;
        var d = date.getDate();
        return y+'-'+(m<10?('0'+m):m)+'-'+(d<10?('0'+d):d);
      }
    });    
    $("#in02").datebox("setValue", PageSport.getCurrDateStr());

    this.showGrid();
  },

  showGrid : function() {
    $("#div_grid").datagrid({
      fit : true,
      nowrap : true,
      stripe : true,
      url : _ctx_ + "/a/query/querySportRecord.do",
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
        title : '运动项目',
        width : 100,
        align : 'center'
      }, {
        field : 'd',
        title : '运动时长',
        width : 100,
        align : 'center'
      }, {
        field : 'e',
        title : '消耗卡路里',
        width : 100,
        align : 'center'
      }, {
        field : 'f',
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
      url : _ctx_ + "/a/query/querySportRecord.do",
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
  PageSport.init();
  PageMain.funCloseProgressInfo();
});