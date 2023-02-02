<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/layout/include/base.jsp" %>
	<script type="text/javascript">
	</script>
	<div class="storeSidebar">
		<c:choose>
			<c:when test="${lnb.mId eq '1'}">
				<h2 class="side_title">
					상품관리
				</h2>
				<div class="side_list">
					<ul>
						<li class="storeList_title">
							<a href="javascript:;" onclick="_BT.moveUrl(_BT.STORE.URL.Product.PrdtMng);" class="title_txt<c:if test="${lnb.pId eq 1}"> on</c:if>">
								상품관리
							</a>
						</li>
					</ul>
				</div>
			</c:when>
			<c:when test="${lnb.mId eq '2'}">
				<h2 class="side_title">
					주문관리
				</h2>
				<div class="side_list">
					<ul>
<%-- 					
						<li class="storeList_title">
							<a href="javascript:;" onclick="_BT.moveUrl(_BT.STORE.URL.Order.DashBoard);" class="title_txt<c:if test="${lnb.pId eq 1}"> on</c:if>">
								주문현황
							</a>
						</li>
 --%>						
						<li class="storeList_title">
							<a href="javascript:;" onclick="_BT.moveUrl(_BT.STORE.URL.Order.OrderMng);" class="title_txt<c:if test="${lnb.pId eq 2}"> on</c:if>">
								주문관리
							</a>
						</li>
					</ul>
				</div>
			</c:when>
			<c:when test="${lnb.mId eq '3'}">
				<h2 class="side_title">
					배송관리
				</h2>
				<div class="side_list">
					<ul>
						<li class="list_title">
							<a href="javascript:;" onclick="_BT.moveUrl(_BT.STORE.URL.Order.ReceiptMng);" class="title_txt<c:if test="${lnb.pId eq 2}"> on</c:if>">
								배송관리
							</a>
						</li>
						<li class="list_title">
							<a href="javascript:;" onclick="_BT.moveUrl(_BT.STORE.URL.Order.ReturnMng);" class="title_txt<c:if test="${lnb.pId eq 3}"> on</c:if>">
								취소/환불 관리
							</a>
						</li>
					</ul>
				</div>
			</c:when>
			<c:when test="${lnb.mId eq '4'}">
				<h2 class="side_title">
					정산관리
				</h2>
				<div class="side_list">
					<ul>
						<li class="list_title">
							<a href="javascript:;" onclick="_BT.moveUrl(_BT.STORE.URL.Calculate.DashBoard);" class="title_txt<c:if test="${lnb.pId eq 1}"> on</c:if>">
								정산현황
							</a>
						</li>
						<li class="list_title">
							<a href="javascript:;" onclick="_BT.moveUrl(_BT.STORE.URL.Calculate.CalMng);" class="title_txt<c:if test="${lnb.pId eq 2}"> on</c:if>">
								정산관리
							</a>
						</li>
					</ul>
				</div>
			</c:when>
			<c:when test="${lnb.mId eq '5'}">
				<h2 class="side_title">
					판매자 지원
				</h2>
				<div class="side_list">
					<ul>
						<li class="list_title">
							<a href="javascript:;" onclick="_BT.moveUrl(_BT.STORE.URL.CsCenter.Mypage);" class="title_txt<c:if test="${lnb.pId eq 1}"> on</c:if>">
								설정
							</a>
						</li>
						<li class="list_title">
							<a href="javascript:;" onclick="_BT.moveUrl(_BT.STORE.URL.CsCenter.Board);" class="title_txt<c:if test="${lnb.pId eq 2}"> on</c:if>">
								게시판
							</a>
						</li>
						<li class="list_title">
							<a href="javascript:;" onclick="_BT.moveUrl(_BT.STORE.URL.CsCenter.Guide);" class="title_txt<c:if test="${lnb.pId eq 3}"> on</c:if>">
								가이드
							</a>
						</li>
						<li class="list_title">
							<a href="javascript:;" onclick="_BT.moveUrl(_BT.STORE.URL.CsCenter.Notice);" class="title_txt<c:if test="${lnb.pId eq 4}"> on</c:if>">
								알림
							</a>
						</li>
					</ul>
				</div>
			</c:when>
		</c:choose>	
	</div>