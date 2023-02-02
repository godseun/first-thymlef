<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@include file="/WEB-INF/views/common/layout/include/base.jsp" %>
		<!DOCTYPE html>
		<html>

		<head>
			<jsp:include page="/WEB-INF/views/common/layout/include/store_meta.jsp" />
			<title>
				<tiles:insertAttribute name="title" ignore="true" />
			</title>
		</head>

		<body>
			<!-- Channel Plugin Scripts -->
			<c:choose>
				<c:when test="${!empty userSession}">
					<script type="text/javascript">
						window.channelPluginSettings = {
							"plugin_id": "22268f5f-470c-467f-8d55-b1573b673b1e",
							"user": {
								"id": "${userSession.usrId}",
								"name": "${userSession.usrNm}",
								"mobileNumber": "${userSession.mobile}",
								"meta": {
									"CUSTOM_VALUE_1": "${userSession.usrTp}"
								}
							}
						};
					</script>
				</c:when>
				<c:otherwise>
					<script type="text/javascript">
						window.channelPluginSettings = {
							"plugin_id": "22268f5f-470c-467f-8d55-b1573b673b1e"
						};
					</script>
				</c:otherwise>
			</c:choose>
			<script type="text/javascript">
				/* (function () {
					var node = document.createElement('div');
					node.id = 'ch-plugin';
					document.body.appendChild(node);
					var async_load = function () {
						var s = document.createElement('script');
						s.type = 'text/javascript';
						s.async = true;
						s.src = '//cdn.channel.io/plugin/ch-plugin-web.js';
						s.charset = 'UTF-8';
						var x = document.getElementsByTagName('script')[0];
						x.parentNode.insertBefore(s, x);
					};
					if (window.attachEvent) {
						window.attachEvent('onload', async_load);
					} else {
						window.addEventListener('load', async_load, false);
					}
				})(); */
			</script>
			<div class="wrap">
				<div id="header">
					<tiles:insertAttribute name="header" />
				</div>
				<div class="wid_1248" style="margin-top: 20px;">
					<div id="nav" style="width:50px;">
						<tiles:insertAttribute name="navi" />
					</div>
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