<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/patient/common/taglibs-include.jsp" %>
<div data-name="首页" data-index="0" data-type="custom" class="footer-tab-custom <c:if test="${param.selected == 0 }">selected</c:if>">
	<span class="icon <c:if test="${param.selected == 0 }">selected</c:if>"></span><span class="text">首页</span>
</div>
<div data-name="搜索" data-index="1" data-type="search" class="footer-tab-search <c:if test="${param.selected == 1 }">selected</c:if>">
	<span class="icon <c:if test="${param.selected == 1 }">selected</c:if>"></span><span class="text">查询</span>
</div>
<div data-name="驿站" data-index="2" data-type="search" class="footer-tab-search <c:if test="${param.selected == 2 }">selected</c:if>">
	<span class="icon <c:if test="${param.selected == 2 }">selected</c:if>"></span><span class="text">驿站</span>
</div>
<div data-name="我的" data-index="3" data-type="mine" class="footer-tab-mine <c:if test="${param.selected == 3 }">selected</c:if>">
	<span class="icon <c:if test="${param.selected == 3 }">selected</c:if>"></span><span class="text">我的</span>
</div>