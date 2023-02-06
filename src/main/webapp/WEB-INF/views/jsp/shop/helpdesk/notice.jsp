<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/layout/include/base.jsp" %>
	<script type="text/javascript">
		var dupClick1 = false;
		$(function(){  
			$('.notcie_board_tit').on('click', function(){ 
				if(
					$('#cont_'+$(this).data('type')).hasClass('vOff')
					)
					$('#cont_'+$(this).data('type')).removeClass('vOff');
				else
					$('#cont_'+$(this).data('type')).addClass('vOff');
			});	
		});
		function goJoin(type) {
			if('S' == type){
				_BT.moveUrl(_BT.STORE.URL.Join.sStep1);
			}else if('B' == type){ 
				_BT.moveUrl(_BT.SHOP.URL.Join.bStep1);
			}
		}
	</script>
	<div class="section" style="min-height: 1000px;">
		<h1 class="title_Type03">
			대화소식
			<div class="sub_location">
				<div class="list_location01">
					<span class="txt01">고객만족 센터</span>
					<span class="arrow"><img src="${staticRoot}/img/bl_01.jpg" alt=">" /></span>
					<span class="last_txt">대화소식</span>
				</div>
			</div>
		</h1>
		<c:set var="bbsId" 			value="NO" />
		<c:if test='${!empty pageParm}'>
			<c:set var="bbsId" 			value="${pageParm.bId}" />
		</c:if>
		<% pageContext.setAttribute("newLineChar", "\n"); %> 
		<div class="notcie_board">
			<c:forEach items="${bbsList}" var="bbs" varStatus="status">
				<!--공지사항 제목-->
				<div class="notcie_board1">
					<div class="notcie_board_tit" data-type="<c:out value="${bbs.ARTICLE_ID}"/>"><a href="javascript:;">[공지] <c:out value="${bbs.TITLE}"/></a></div>
					<div class="notcie_board_date"><fmt:formatDate pattern = "yyyy-MM-dd" value = "${bbs.CREATE_DT}" /></div>	
					<a href="#" class="notcie_board_arrow_on"> </a>
				</div>					
				<!--공지사항 제목-->
				<!--공지사항 내용들어갈곳-->
				<div class="notcie_board_con <c:if test="${bbs.ARTICLE_ID ne bbsId}">vOff</c:if>" id="cont_<c:out value="${bbs.ARTICLE_ID}"/>">
					<c:if test="${!empty bbs.DETAIL_IMG and bbs.DETAIL_IMG ne ''}">
						<img alt="알림 이미지" src="${upload}${bbs.DETAIL_IMG}" style="max-width: 905px; margin-top:10px;">
					</c:if>
					<c:if test="${bbs.ARTICLE_ID eq '1000140'}">
						<div style="width: 100%; text-align: center;margin-top: 10px;">
							<a href="javascript:;" onclick="goJoin('S');">
								<img src="${staticRoot}/img/common/go_join.png" alt="가입하러가기" />
							</a>
						</div>
					</c:if>
					<c:if test="${bbs.ARTICLE_ID eq '1000141'}">
						<%-- <div style="width: 100%; text-align: center;margin-top: 10px;">
							<a href="javascript:;" onclick="goJoin('B');">
								<img src="${staticRoot}/img/common/go_b_join.png" alt="가입하러가기" />
							</a>
						</div> --%>
					</c:if>
					${fn:replace(bbs.CONTENT, newLineChar, "<br/>")}
				</div>
				<!--공지사항 내용들어갈곳-->
			</c:forEach>		
		</div>
	</div>