<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@include file="/WEB-INF/views/common/layout/include/base.jsp" %>
		<!DOCTYPE html>
		<html>

		<head>
			<jsp:include page="/WEB-INF/views/common/layout/include/front_mata.jsp" />
			<title>
				<tiles:insertAttribute name="title" ignore="true" />
			</title>
		</head>

		<body>
			<tiles:insertAttribute name="body" />
			<h1 class="gray_title" style="font-size: 15px;">
				Copyright 2017 <span style="color:#3f51b5; font-weight: 700;">DAEHWA</span> Corp. ALL RIGHT RESERVED.
			</h1>
		</body>

		</html>