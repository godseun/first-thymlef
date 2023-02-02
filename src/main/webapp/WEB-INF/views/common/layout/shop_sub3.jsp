<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/layout/include/base.jsp" %>
<!DOCTYPE html>
<html>
<head> 
	<jsp:include page="/WEB-INF/views/common/layout/include/meta.jsp"/>
	<title>
		<tiles:insertAttribute name="title" ignore="true" />
	</title>
</head>
<body> 
	<jsp:include page="/WEB-INF/views/common/layout/include/channel_scripts.jsp"/>
	<div class="wrap" style="background-color:${prm.PromoInfo[0].sBgCr}"> 
		<div id="header" style="background-color:#ffffff;">
			<tiles:insertAttribute name="header" />
		</div> 
		<c:choose>
			<c:when test="${pTp eq 'TOOLMAN'}">
				<div class="ad_content01" style="text-align: center;height:auto;max-height:330px;">
					<img src="${staticRoot}/img/ad/ad_toolman.png" alt="광고배너" style="width:100%;height: auto;max-height:330px;"/>
				</div>
			</c:when>
			<c:when test="${pTp eq 'TIMESALE'}">
			</c:when>
			<c:otherwise>
			</c:otherwise>
		</c:choose>
		<div class="wid_1248">
			<div id="section" style="width:auto; ">
				<tiles:insertAttribute name="body" />
			</div>
		</div>
		<div id="footer">
			<tiles:insertAttribute name="footer" />
		</div>
	</div> 
</body>
</html>