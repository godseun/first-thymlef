<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/layout/include/base.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="/WEB-INF/views/common/layout/include/meta.jsp"/>
	<title>
		<tiles:insertAttribute name="title" ignore="true" />
	</title>
	<jsp:include page="/WEB-INF/views/common/layout/include/admin_styles.jsp"/>
	<jsp:include page="/WEB-INF/views/common/layout/include/admin_scripts.jsp"/>	
</head>
<body>
	<div id="header">
		<tiles:insertAttribute name="header" />
	</div>
	<div id="nav" style="width:10%;">
		<tiles:insertAttribute name="navi" />
	</div>
	<div id="section" style="width:80%;">
		<tiles:insertAttribute name="body" />
	</div>
	<div id="footer">
		<tiles:insertAttribute name="footer" />
	</div>
</body>
</html>