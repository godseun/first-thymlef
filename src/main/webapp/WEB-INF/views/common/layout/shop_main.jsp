<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@include file="/WEB-INF/views/common/layout/include/base.jsp" %>
		<!DOCTYPE html>
		<html>

		<head>
			<jsp:include page="/WEB-INF/views/common/layout/include/meta.jsp" />
			<title>
				<tiles:insertAttribute name="title" ignore="true" />
			</title>
		</head>

		<body>
			<jsp:include page="/WEB-INF/views/common/layout/include/channel_scripts.jsp" />
			<div class="wrap">
				<div id="header">
					<tiles:insertAttribute name="header" />
				</div>
				<div id="section" style="width:auto; ">
					<tiles:insertAttribute name="body" />
				</div>
			</div>
			<div id="footer">
				<tiles:insertAttribute name="footer" />
			</div>
		</body>

		</html>