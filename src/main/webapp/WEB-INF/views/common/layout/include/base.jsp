<%@page import="com.daehwa.b2b.common.util.CommonUtil"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);
    response.setHeader("Pragma", "no-store");
    response.setHeader("Cache-Control", "no-cache");
%>
<%@ taglib prefix="c"      		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x"      		uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib prefix="fmt"    	uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn"     		uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" 	uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form"   	uri="http://www.springframework.org/tags/form" %>

	<c:set var="proto"         	value="http://" />
	<c:set var="host"         	value="<%=CommonUtil.serverUrl %>" />
	<c:set var="ctx"          	value="${host}" />
	<c:set var="upload"         	value="${ctx}/upload" />
	<c:set var="staticRoot"   	value="${ctx}/resources" />
	<c:set var="downloadUri"  value="${ctx}/common/download/" />
<% 
	//치환 변수 선언
	 pageContext.setAttribute("cr", "\r"); //Space
	 pageContext.setAttribute("cn", "\n"); //Enter
	 pageContext.setAttribute("crcn", "\r\n"); //Space, Enter
	 pageContext.setAttribute("br", "<br/>"); //br 태그
%>