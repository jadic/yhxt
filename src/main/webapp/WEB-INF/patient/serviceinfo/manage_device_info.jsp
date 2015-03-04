<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/patient/common/taglibs-include.jsp" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <base href="<%=basePath%>">
    <title>南京通用电器有限公司 </title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0"> 
	<%@ include file="/WEB-INF/patient/common/top-include.jsp"%>
	<link rel="stylesheet" href="<c:url value='/patient/themes/health_records.css'/>" type="text/css"/>
	<style type="text/css">
		td{word-break:break-all;}
		.index_table table#faceTable tr th{
			line-height: normal;
		}
	</style>
	<script type="text/JavaScript">
		
	</script>
  </head>
<body>
  <div class="information_modify">
    <div class="information_modify_main" id="main_div">
    	<div class="search">
		    <table width="100%" border="0" cellspacing="0" cellpadding="0" style="display: block; font-size: 15px;">
		    	<tr>
		    		<td align="right" style="padding: 5px 5px 5px 0; width:70px; height: 30px; color: #aeaeae; font-size: 13px;">
	    				设备类型：
	    			</td>
		    		<td>
		    			<select class="selectMax_informationModify  text-input validate[required]"  style="width: 140px;">
		                   <option value="">请选择</option>
		               </select>
		    		</td>
		    		<td align="right" style="padding: 5px 5px 5px 30px; width:70px; height: 30px; color: #aeaeae; font-size: 13px;">
	    				购买状态：
	    			</td>
		    		<td>
		    			<select class="selectMax_informationModify  text-input validate[required]"  style="width: 140px;">
		                   <option value="">请选择</option>
			               <option value="0">未购买</option>
			               <option value="1">已购买</option>
		               </select>
		    		</td>
		    		<td>
			    		<ul>
			    			<li class="btn_search"><a href="javascript:void(0)" onclick="queryStart()">查询</a></li>
			    		</ul>
		    		</td>
		    	</tr>
		    </table>
		</div>
        <div class="index_table">
		    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="bPhistory_table" id="faceTable" style="display: block;">
		      <colgroup>
		        <col width="15%">
		        <col width="20%">
		        <col width="25%">
		        <col width="10%">
		        <col width="10%">
		        <col width="18%">
		      </colgroup>
		      <tbody><tr class="even">
		        <th>设备编号</th>
		        <th>设备类型</th>
		        <th>测压时间</th>
		        <th nowrap="nowrap">收缩压/舒张压<br>(mmHg)</th>
		        <th>脉率</th>
		        <th>操作</th>
		      </tr>
		    <tr class="abnormal odd"><td>C20113110602837</td><td>无线网络血压计TE8000Y5</td><td>2015-02-13 18:53:26</td><td>132/92</td><td>75</td><td><a href="javascript:void(0)" onclick="show_bp_remark(0)">备注</a><a href="javascript:void(0)" onclick="del_bp(0)">删除</a></td></tr><tr class="even"><td>C20113110602837</td><td>无线网络血压计TE8000Y5</td><td>2015-02-13 18:52:11</td><td>117/77</td><td>76</td><td><a href="javascript:void(0)" onclick="show_bp_remark(1)">备注</a><a href="javascript:void(0)" onclick="del_bp(1)">删除</a></td></tr><tr class="odd"><td>C20113110602837</td><td>无线网络血压计TE8000Y5</td><td>2015-02-13 18:49:07</td><td>125/83</td><td>75</td><td><a href="javascript:void(0)" onclick="show_bp_remark(2)">备注</a><a href="javascript:void(0)" onclick="del_bp(2)">删除</a></td></tr><tr class="abnormal even"><td>C20113110602837</td><td>无线网络血压计TE8000Y5</td><td>2015-02-13 18:46:47</td><td>140/84</td><td>70</td><td><a href="javascript:void(0)" onclick="show_bp_remark(3)">备注</a><a href="javascript:void(0)" onclick="del_bp(3)">删除</a></td></tr><tr class="odd"><td>C20113110602837</td><td>无线网络血压计TE8000Y5</td><td>2015-02-13 18:45:17</td><td>131/88</td><td>69</td><td><a href="javascript:void(0)" onclick="show_bp_remark(4)">备注</a><a href="javascript:void(0)" onclick="del_bp(4)">删除</a></td></tr><tr class="even"><td>C20113110602837</td><td>无线网络血压计TE8000Y5</td><td>2015-02-13 18:44:05</td><td>138/84</td><td>68</td><td><a href="javascript:void(0)" onclick="show_bp_remark(5)">备注</a><a href="javascript:void(0)" onclick="del_bp(5)">删除</a></td></tr><tr class="abnormal odd"><td>C20113110602837</td><td>无线网络血压计TE8000Y5</td><td>2015-02-13 18:42:50</td><td>142/86</td><td>72</td><td><a href="javascript:void(0)" onclick="show_bp_remark(6)">备注</a><a href="javascript:void(0)" onclick="del_bp(6)">删除</a></td></tr><tr class="even"><td>C20113110602837</td><td>无线网络血压计TE8000Y5</td><td>2015-02-13 18:41:33</td><td>130/79</td><td>70</td><td><a href="javascript:void(0)" onclick="show_bp_remark(7)">备注</a><a href="javascript:void(0)" onclick="del_bp(7)">删除</a></td></tr><tr class="odd"><td>C20113110602837</td><td>无线网络血压计TE8000Y5</td><td>2015-02-13 18:38:37</td><td>106/70</td><td>74</td><td><a href="javascript:void(0)" onclick="show_bp_remark(8)">备注</a><a href="javascript:void(0)" onclick="del_bp(8)">删除</a></td></tr><tr class="even"><td>C20113110602837</td><td>无线网络血压计TE8000Y5</td><td>1970-01-01 00:00:00</td><td>127/64</td><td>82</td><td><a href="javascript:void(0)" onclick="show_bp_remark(9)">备注</a><a href="javascript:void(0)" onclick="del_bp(9)">删除</a></td></tr></tbody></table>
		</div>
		<div class="index_page">
		  <ul>
		    <li class="page_information">共<span id="showcount">10</span>条信息，当前：第<span id="showcurrentnum">1</span>页，共<span id="showpagecount">1</span>页</li>
		    <li class="page_button">
			    <a href="###" class="page-first">首页</a>
			    <a href="###" class="page-perv">上一页</a>
			    <a href="###" class="page-next">下一页</a>
			    <a href="###" class="page-last">末页</a>
		    </li>
		    <li class="page_select">
		    转<select id="gopage" onchange="gotoPage()"><option value="1">1</option></select>页
		    </li>
		  </ul>
		</div>
    </div>
</div>
   
</body>
</html>
