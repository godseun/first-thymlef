<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/layout/include/base.jsp" %>
	<script type="text/javascript">
		var dupClick1 = false;
		$(function(){  
			$('.prmBar').click(function() {
				var id = $(this).attr('id');
				_BT.moveUrl(_BT.SHOP.URL.Helpdesk.PromoDtl+"?pCode="+id);
			});
		});
	</script>
	<div class="section">
		<div class="notcie_board">
			<c:forEach items="${prmList}" var="prm" varStatus="status">
				<div class="notcie_board0 prmBar" id="<c:out value="${prm.PROMO_ID}"/>" style="width:48%; margin: 2px 2px; padding: 2px 2px;text-align: center;">
					<a href="javascript:;">
						<img alt="광고배너" src="${upload}/<c:out value="${prm.DETAIL_IMG}"/>" style="width:100%;height:auto;">
					</a>
				</div>
			</c:forEach>
		</div>
	</div>
