<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/layout/include/base.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="/WEB-INF/views/common/layout/include/meta.jsp"/>
	<title>
		<tiles:insertAttribute name="title" ignore="true" />
	</title>
	<jsp:include page="/WEB-INF/views/common/layout/include/front_styles.jsp"/>
	<jsp:include page="/WEB-INF/views/common/layout/include/front_scripts.jsp"/>		
</head>
<body>
	<tiles:insertAttribute name="body" />
</body>
</html>