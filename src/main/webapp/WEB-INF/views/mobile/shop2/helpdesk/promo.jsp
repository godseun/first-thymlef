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
		<h1 class="title_Type03">
			프로모션
			<div class="sub_location">
				<div class="list_location01">
					<span class="txt01">고객만족 센터</span>
					<span class="arrow"><img src="${staticRoot}/img/bl_01.jpg" alt=">" /></span>
					<span class="last_txt">프로모션</span>
				</div>
			</div>
		</h1>
		<div class="notcie_board">
			<c:forEach items="${prmList}" var="prm" varStatus="status">
				<div class="notcie_board0 prmBar" id="<c:out value="${prm.ARTICLE_ID}"/>" style="margin: 5px 2px;text-align: center;">
					<a href="javascript:;">
						<img alt="광고배너" src="${upload}/<c:out value="${prm.DETAIL_IMG}"/>" width="467px;" height="150px;">
					</a>
				</div>
			</c:forEach>
		</div>
	</div>
