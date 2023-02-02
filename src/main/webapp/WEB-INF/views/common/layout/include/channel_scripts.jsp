<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@include file="/WEB-INF/views/common/layout/include/base.jsp" %>
		<!-- Channel Plugin Scripts -->
		<c:choose>
			<c:when test="${!empty userSession}">
				<script>
					window.channelPluginSettings = {
						'plugin_id': 'e5bbb164-563c-434b-a945-0ab47010ca9a',
						'user': {
							'id': '${userSession.usrId}',
							'name': '${userSession.usrNm}',
							'mobileNumber': '${userSession.mobile}',
							'meta': {
								'CUSTOM_VALUE_1': '${userSession.usrTp}'
							}
						}
					};
				</script>
			</c:when>
			<c:otherwise>
				<script>
					window.channelPluginSettings = {
						'plugin_id': 'e5bbb164-563c-434b-a945-0ab47010ca9a'
					};
				</script>
			</c:otherwise>
		</c:choose>
		<script>
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
		<!-- End Channel Plugin -->