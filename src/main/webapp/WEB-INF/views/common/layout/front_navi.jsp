<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/layout/include/base.jsp" %>
	<script type="text/javascript">
		//미사용
	</script>
	<div class="sidebar">
		<c:choose>
			<c:when test="${lnb.mId eq '1'}">
				<h2 class="side_title">
					주문 관리
				</h2>
				<div class="side_list">
					<ul>
						<li class="list_title">
							<a href="javascript:;" onclick="_BT.moveUrl(_BT.FRONT.URL.Order.DashBoard);" class="title_txt<c:if test="${lnb.pId eq 1}"> on</c:if>">
								현황판
							</a>
						</li>
						<li class="list_title">
							<a href="javascript:;" onclick="_BT.moveUrl(_BT.FRONT.URL.Order.OrderMng);" class="title_txt<c:if test="${lnb.pId eq 2}"> on</c:if>">
								주문 관리
							</a>
						</li>
						<li class="list_title">
							<a href="javascript:;" onclick="_BT.moveUrl(_BT.FRONT.URL.Order.DeliveryMng);" class="title_txt<c:if test="${lnb.pId eq 3}"> on</c:if>">
								배송 관리
							</a>
						</li>
						<li class="list_title">
							<a href="javascript:;" onclick="_BT.moveUrl(_BT.FRONT.URL.Order.ReturnMng);" class="title_txt<c:if test="${lnb.pId eq 4}"> on</c:if>">
								교환/환불 관리
							</a>
						</li>
					</ul>
				</div>
			</c:when>
			<c:when test="${lnb.mId eq '2'}">
				<h2 class="side_title">
					상품 관리
				</h2>
				<div class="side_list">
					<ul>
						<li class="list_title">
							<a href="javascript:;" onclick="_BT.moveUrl(_BT.FRONT.URL.Product.DashBoard);" class="title_txt<c:if test="${lnb.pId eq 1}"> on</c:if>">
								현황판
							</a>
						</li>
						<li class="list_title">
							<a href="javascript:;" onclick="_BT.moveUrl(_BT.FRONT.URL.Product.UploadMng);" class="title_txt<c:if test="${lnb.pId eq 2}"> on</c:if>">
								상품등록 관리
							</a>
						</li>
						<li class="list_title">
							<a href="javascript:;" onclick="_BT.moveUrl(_BT.FRONT.URL.Product.SellerItemMng);" class="title_txt<c:if test="${lnb.pId eq 3}"> on</c:if>">
								재고상품 관리
							</a>
						</li>
						<li class="list_title">
							<a href="javascript:;" onclick="_BT.moveUrl(_BT.FRONT.URL.Product.MouItemMng);" class="title_txt<c:if test="${lnb.pId eq 4}"> on</c:if>">
								제휴상품 관리
							</a>
						</li>
					</ul>
				</div>
			</c:when>
			<c:when test="${lnb.mId eq '3'}">
				<h2 class="side_title">
					고객 관리
				</h2>
				<div class="side_list">
					<ul>
						<li class="list_title">
							<a href="javascript:;" onclick="_BT.moveUrl(_BT.FRONT.URL.Customer.SellerComf);" class="title_txt<c:if test="${lnb.pId eq 0}"> on</c:if>">
								업체 승인
							</a>
						</li>
						<li class="list_title">
							<a href="javascript:;" onclick="_BT.moveUrl(_BT.FRONT.URL.Customer.SellerApprl);" class="title_txt<c:if test="${lnb.pId eq 1}"> on</c:if>">
								업체 관리
							</a>
						</li>
						<li class="list_title">
							<a href="javascript:;" onclick="_BT.moveUrl(_BT.FRONT.URL.Customer.UserMng);" class="title_txt<c:if test="${lnb.pId eq 2}"> on</c:if>">
								사용자 관리
							</a>
						</li>
						<li class="list_title">
							<a href="javascript:;" onclick="_BT.moveUrl(_BT.FRONT.URL.Customer.UserCont);" class="title_txt<c:if test="${lnb.pId eq 3}"> on</c:if>">
								회신 관리
							</a>
						</li>
					</ul>
				</div>
			</c:when>
			<c:when test="${lnb.mId eq '4'}">
				<h2 class="side_title">
					사이트 관리
				</h2>
				<div class="side_list">
					<ul>
						<li class="list_title">
							<a href="javascript:;" onclick="_BT.moveUrl(_BT.FRONT.URL.Site.Board);" class="title_txt<c:if test="${lnb.pId eq 1}"> on</c:if>">
								게시물 관리
							</a>
						</li>
						<li class="list_title">
							<a href="javascript:;" onclick="_BT.moveUrl(_BT.FRONT.URL.Site.MdItem);" class="title_txt<c:if test="${lnb.pId eq 2}"> on</c:if>">
								상품노출 관리
							</a>
						</li>
						<li class="list_title">
							<a href="javascript:;" onclick="_BT.moveUrl(_BT.FRONT.URL.Site.Promo);" class="title_txt<c:if test="${lnb.pId eq 3}"> on</c:if>">
								프로모션 관리
							</a>
						</li>
						<li class="list_title">
							<a href="javascript:;" onclick="_BT.moveUrl(_BT.FRONT.URL.Site.Movie);" class="title_txt<c:if test="${lnb.pId eq 4}"> on</c:if>">
								동영상 관리
							</a>
						</li>
					</ul>
				</div>
			</c:when>
			<c:when test="${lnb.mId eq '5'}">
				<h2 class="side_title">
					설정
				</h2>
				<div class="side_list">
					<ul>
						<li class="list_title">
							<a href="javascript:;" onclick="_BT.moveUrl(_BT.FRONT.URL.Setup.Code);" class="title_txt<c:if test="${lnb.pId eq 1}"> on</c:if>">
								코드 관리
							</a>
						</li>
						<li class="list_title">
							<a href="javascript:;" onclick="_BT.moveUrl(_BT.FRONT.URL.Setup.Categ);" class="title_txt<c:if test="${lnb.pId eq 2}"> on</c:if>">
								카테고리 관리
							</a>
						</li>
						<li class="list_title">
							<a href="javascript:;" onclick="_BT.moveUrl(_BT.FRONT.URL.Setup.Maker);" class="title_txt<c:if test="${lnb.pId eq 3}"> on</c:if>">
								제조사 관리
							</a>
						</li>
					</ul>
				</div>
			</c:when>
		</c:choose>	
<%-- 		
		<div class="ad_left_img01">
			<a href="#">
				<img src="${staticRoot}/img/ad/ad_left_img01.jpg" alt="광고 이미지1" />
			</a>
		</div>
 --%>		
		<div class="ad_left_img02">
			<a href="#">
				<img src="${staticRoot}/img/ad/ad_left_img02.jpg" alt="광고 이미지2" />
			</a>
		</div>
	</div>