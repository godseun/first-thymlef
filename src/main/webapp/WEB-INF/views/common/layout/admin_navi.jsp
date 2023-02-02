<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/layout/include/base.jsp" %>
		<div><a href="/admin/main">MAIN</a></div>
		<div><a href="http://www.nailduck.com/admin/login" target="_BLANK">LANDING</a></div>
		<div><a href="/shop/login" target="_BLANK">SHOP</a></div>
		<c:if test="${userSession.loginAdminId eq 'admin'}">
			<div><a href="/admin/user/list">ADMIN_USER</a></div>
			<div><a href="/admin/code/list">CODE</a></div>
			<div><a href="/admin/role/list">ROLE</a></div>
			<div><a href="/admin/log/list">LOG</a></div>
		</c:if>
		<div><a href="/admin/board/list">BOARD</a></div>
		<div><a href="/admin/frontUser/list">FRONT_USER</a></div>
		<div><a href="/admin/newsfeed/list">NEWSFEED</a></div>
		<div><a href="/admin/magazine/list">MAGAZINE</a></div>