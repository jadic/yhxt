<%@ include file="/WEB-INF/patient/common/taglibs-include.jsp" %>
<script type="text/javascript">
<!--
	var _ctx_ = "${ctx}";
	var _loginUserType_ = "${loginusertype}";
//-->
</script>   
<script type="text/javascript" src="<c:url value='/dwr/engine.js'/>"></script>
<script type="text/javascript" src="<c:url value='/dwr/util.js'/>"></script>
<script type="text/javascript" src="<c:url value='/dwr/interface/loadDwr.js'/>"></script>
<script type="text/javascript" src="<c:url value='/common/scripts/common.dwr-1.0.js'/>" ></script>

<script type="text/javascript">
<!--
	if (typeof window['DWRUtil'] == 'undefined')    window.DWRUtil = dwr.util;
	dwr.engine._errorHandler= function(message ,ex){
	};
	 dwr.engine.setErrorHandler(function(){});
//-->
</script> 