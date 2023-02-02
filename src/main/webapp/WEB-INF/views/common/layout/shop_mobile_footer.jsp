<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@include file="/WEB-INF/views/common/layout/include/base.jsp" %>

		<div class="info_con01" style="background-color:#eeeeee;margin-top: 0px;height: 230px; width:100%;">
			<p class="con_txt_Type01" style="margin-bottom: 10px;">
			<div style="padding: 5px 5px;">상호명 : (주) 대화 | 대표이사 : 이승형 </div>
			<div style="padding: 5px 5px;">사업자등록번호 : 504-86-15839 | 고객만족센터 : <a href="tel:18338917">1833-8917</a> </div>
			<div style="padding: 5px 5px;">통신판매신고번호 : 2017-부산강서-00104 | 팩스 : 051-714-3384</div>
			<div style="padding: 5px 5px;">부산광역시 강서구 유통단지1로 50, 220동 201호 (대저2동)</div>
			<div style="padding: 5px 5px;">개인정보관리책임자 : 황정훈 | 문의메일 : help@daehwa.kr</div>
			<div style="text-align:center; padding: 10px 0px;">Copyright 2017 DAEHWA Corp. ALL RIGHT RESERVED</div>
			</p>
		</div>
		<div class="m_menu_slide">
			<a href="javascript:;" onclick="_BT.moveUrl(_BT.SHOP.URL.Common.Main);" class="slide_01" alt="홈">HOME</a>
			<a href="javascript:;" onclick="_BT.moveUrl(_BT.SHOP.URL.Helpdesk.Notice);" class="slide_02" alt="고객센터">고객센터</a>
			<c:choose>
				<c:when test="${empty userSession}">
					<a href="javascript:;" onclick="alert('로그인이 필요 합니다.');" class="slide_03" alt="장바구니">장바구니</a>
				</c:when>
				<c:otherwise>
					<c:choose>
						<c:when test="${userSession.usrTp eq 'S'}">
							<a href="javascript:;" onclick="_BT.moveUrl(_BT.STORE.URL.Common.Main);" class="slide_06"
								alt="상점관리">상점관리</a>
						</c:when>
						<c:otherwise>
							<a href="javascript:;" onclick="_BT.moveUrl(_BT.SHOP.URL.Order.cart);" class="slide_03"
								alt="장바구니">장바구니</a>
						</c:otherwise>
					</c:choose>
				</c:otherwise>
			</c:choose>
			<a href="javascript:;" onclick="_BT.moveUrl(_BT.SHOP.URL.Menus.allList);" class="slide_05" alt="메뉴">전체보기</a>.
		</div>