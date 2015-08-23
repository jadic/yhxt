<%@ include file="/WEB-INF/patient/common/taglibs-include.jsp" %>
<link rel="stylesheet" href="<c:url value='/patient/themes/normalize.css'/>" type="text/css"/>
<link rel="stylesheet" href="<c:url value='/patient/themes/list.css'/>" type="text/css"/>
<link rel="stylesheet" href="<c:url value='/patient/themes/search.css'/>" type="text/css"/>
<script type="text/javascript">
<!--
	var _ctx_ = "${ctx}";
	var _loginUserType_ = "${loginusertype}";
//-->
</script>   
<script type="text/javascript" src="<c:url value='/dwr/engine.js'/>"></script>
<script type="text/javascript" src="<c:url value='/dwr/util.js'/>"></script>
<script type="text/javascript" src="<c:url value='/dwr/interface/loadDwr.js'/>"></script>
<script type="text/javascript" src="<c:url value='/common/scripts/jquery-1.8.0.min.js'/>" ></script>
<script type="text/javascript" src="<c:url value='/common/scripts/My97DatePicker/WdatePicker.js'/>" ></script>
<script type="text/javascript" src="<c:url value='/common/scripts/common.dwr-1.0.js'/>" ></script>
<script type="text/javascript" src="<c:url value='/common/scripts/common.date-1.0.js'/>" ></script>
<script type="text/javascript">
<!--
	if (typeof window['DWRUtil'] == 'undefined')    window.DWRUtil = dwr.util;
	dwr.engine._errorHandler= function(message ,ex){
	};
	 dwr.engine.setErrorHandler(function(){});
//-->
</script> 