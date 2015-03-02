
Date.prototype.pattern=function(fmt) 
{
    var o = {
    "M+" : this.getMonth()+1, //月份
    "d+" : this.getDate(), //日
    "h+" : this.getHours()%12 == 0 ? 12 : this.getHours()%12, //小时
    "H+" : this.getHours(), //小时
    "m+" : this.getMinutes(), //分
    "s+" : this.getSeconds(), //秒
    "q+" : Math.floor((this.getMonth()+3)/3), //季度
    "S" : this.getMilliseconds() //毫秒
    };
    var week = {
    "0" : "\u65e5",
    "1" : "\u4e00",
    "2" : "\u4e8c",
    "3" : "\u4e09",
    "4" : "\u56db",
    "5" : "\u4e94",
    "6" : "\u516d"
    };
    if(/(y+)/.test(fmt)){
        fmt=fmt.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length));
    }
    if(/(E+)/.test(fmt)){
        fmt=fmt.replace(RegExp.$1, ((RegExp.$1.length>1) ? (RegExp.$1.length>2 ? "\u661f\u671f" : "\u5468") : "")+week[this.getDay()+""]);
    }
    for(var k in o){
        if(new RegExp("("+ k +")").test(fmt)){
            fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length)));
        }
    }
    return fmt;
}

function DateAdd(interval,number,date)
{
      switch(interval)
      {
          case   "y"   :   {
                  date.setFullYear(date.getFullYear()+number);
                  return   date;
                  break;
          }
          case   "q"   :   {
                  date.setMonth(date.getMonth()+number*3);
                  return   date;
                  break;
          }
          case   "m"   :   {
                  date.setMonth(date.getMonth()+number);
                  return   date;
                  break;
          }
          case   "w"   :   {
                  date.setDate(date.getDate()+number*7);
                  return   date;
                  break;
          }
          case   "d"   :   {
                  date.setDate(date.getDate()+number);
                  return   date;
                  break;
          }
          case   "h"   :   {
                  date.setHours(date.getHours()+number);
                  return   date;
                  break;
          }
          case   "M"   :   {
                  date.setMinutes(date.getMinutes()+number);
                  return   date;
                  break;
          }
          case   "s"   :   {
                  date.setSeconds(date.getSeconds()+number);
                  return   date;
                  break;
          }
          default   :   {
                  date.setDate(d.getDate()+number);
                  return   date;
                  break;
          }
      }
 }
 

/**
 *将秒转换为 hh:mm:ss
 *
*/
function Time2hhmmss(seconds){
   var hh;
   var mm;
   var ss;
   //传入的时间为空或小于0
   if(seconds==null||seconds<0){
       return;
   }
   //得到小时
   hh=parseInt(seconds/3600);
   seconds=parseInt(seconds)-hh*3600;
   if(parseInt(hh)<10){
          hh="0"+hh;
   }
   //得到分
   mm=seconds/60|0;
   //得到秒
   ss=parseInt(seconds)-mm*60;
   if(parseInt(mm)<10){
         mm="0"+mm;    
   }
   if(ss<10){
       ss="0"+ss;      
   }
   return hh+":"+mm+":"+ss;
   
}