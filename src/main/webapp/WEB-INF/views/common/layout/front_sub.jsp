<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/layout/include/base.jsp" %>
<!DOCTYPE html>
<html>
<head> 
	<jsp:include page="/WEB-INF/views/common/layout/include/front_mata.jsp"/>
	<title>
		<tiles:insertAttribute name="title" ignore="true" />
	</title>
</head>
<body> 
	<div class="wrap"> 
		<div id="header">
			<tiles:insertAttribute name="header" />
		</div> 
		<div class="wid_1248" style="margin-top: 20px; min-height:700px;">
			<c:choose>
				<c:when test="${lnb.mId eq '1'}">
				 	<div class="tab_bar">
						<ul class="tab_list">
							<li class="tab_item">
								<a href="javascript:;" class="tab_link" onclick="_BT.moveUrl(_BT.FRONT.URL.Order.DashBoard);">
									<span id="tab1" class="tab<c:if test="${lnb.pId eq 1}"> tabOn</c:if>">현황판</span>
								</a>
							</li>
							<li class="tab_item">
								<a href="javascript:;" class="tab_link" onclick="_BT.moveUrl(_BT.FRONT.URL.Order.OrderMng);">
									<span id="tab2" class="tab<c:if test="${lnb.pId eq 2}"> tabOn</c:if>">주문 관리</span>
								</a>
							</li>
							<li class="tab_item">
								<a href="javascript:;" class="tab_link" onclick="_BT.moveUrl(_BT.FRONT.URL.Order.DeliveryMng);">
									<span id="tab3" class="tab<c:if test="${lnb.pId eq 3}"> tabOn</c:if>">배송 관리</span>
								</a>
							</li>
							<li class="tab_item">
								<a href="javascript:;" class="tab_link" onclick="_BT.moveUrl(_BT.FRONT.URL.Order.CancelMng);">
									<span id="tab6" class="tab<c:if test="${lnb.pId eq 6}"> tabOn</c:if>">판매취소</span>
								</a>
							</li>
							<li class="tab_item">
								<a href="javascript:;" class="tab_link" onclick="_BT.moveUrl(_BT.FRONT.URL.Order.ReturnMng);">
									<span id="tab4" class="tab<c:if test="${lnb.pId eq 4}"> tabOn</c:if>">반품 관리</span>
								</a>
							</li>
							<li class="tab_item">
								<a href="javascript:;" class="tab_link" onclick="_BT.moveUrl(_BT.FRONT.URL.Order.EscrowMng);">
									<span id="tab5" class="tab<c:if test="${lnb.pId eq 5}"> tabOn</c:if>">에스크로 관리</span>
								</a>
							</li>
						</ul>
					</div>
				</c:when>
				<c:when test="${lnb.mId eq '2'}">
				 	<div class="tab_bar">
						<ul class="tab_list">
<%-- 						
							<li class="tab_item">
								<a href="javascript:;" class="tab_link" onclick="_BT.moveUrl(_BT.FRONT.URL.Product.DashBoard);">
									<span id="tab1" class="tab<c:if test="${lnb.pId eq 1}"> tabOn</c:if>">현황판</span>
								</a>
							</li>
 --%>							
							<li class="tab_item">
								<a href="javascript:;" class="tab_link" onclick="_BT.moveUrl(_BT.FRONT.URL.Product.ItemMng);">
									<span id="tab5" class="tab<c:if test="${lnb.pId eq 5}"> tabOn</c:if>">상품 기초정보</span>
								</a>
							</li>
							<li class="tab_item">
								<a href="javascript:;" class="tab_link" onclick="_BT.moveUrl(_BT.FRONT.URL.Product.ItemDetailMng);">
									<span id="tab4" class="tab<c:if test="${lnb.pId eq 4}"> tabOn</c:if>">상품 추가정보</span>
								</a>
							</li>
							<li class="tab_item">
								<a href="javascript:;" class="tab_link" onclick="_BT.moveUrl(_BT.FRONT.URL.Product.ItemPkgMng);">
									<span id="tab7" class="tab<c:if test="${lnb.pId eq 7}"> tabOn</c:if>">옵션상품 관리</span>
								</a>
							</li>
							<li class="tab_item">
								<a href="javascript:;" class="tab_link" onclick="_BT.moveUrl(_BT.FRONT.URL.Product.ItemSetMng);">
									<span id="tab9" class="tab<c:if test="${lnb.pId eq 9}"> tabOn</c:if>">모음상품 관리</span>
								</a>
							</li>
							<li class="tab_item">
								<a href="javascript:;" class="tab_link" onclick="_BT.moveUrl(_BT.FRONT.URL.Product.ItemPrmMng);">
									<span id="tab8" class="tab<c:if test="${lnb.pId eq 8}"> tabOn</c:if>">타임세일 관리</span>
								</a>
							</li>
							<li class="tab_item">
								<a href="javascript:;" class="tab_link" onclick="_BT.moveUrl(_BT.FRONT.URL.Product.ItemStoMng);">
									<span id="tab6" class="tab<c:if test="${lnb.pId eq 6}"> tabOn</c:if>">상품재고 관리</span>
								</a>
							</li>
							<li class="tab_item" style="display:none;">
								<a href="javascript:;" class="tab_link" onclick="_BT.moveUrl(_BT.FRONT.URL.Product.NewItem);">
									<span id="tab10" class="tab<c:if test="${lnb.pId eq 10}"> tabOn</c:if>">신규상품 등록</span>
								</a>
							</li>
							<li class="tab_item">
								<a href="javascript:;" class="tab_link" onclick="_BT.moveUrl(_BT.FRONT.URL.Product.UploadMng);">
									<span id="tab2" class="tab<c:if test="${lnb.pId eq 2}"> tabOn</c:if>">상품등록 관리</span>
								</a>
							</li>
<%-- 							
							<li class="tab_item">
								<a href="javascript:;" class="tab_link" onclick="_BT.moveUrl(_BT.FRONT.URL.Product.ItemBatch);">
									<span id="tab6" class="tab<c:if test="${lnb.pId eq 6}"> tabOn</c:if>">일괄 수정</span>
								</a>
							</li>
							<li class="tab_item">
								<a href="javascript:;" class="tab_link" onclick="_BT.moveUrl(_BT.FRONT.URL.Product.UploadMng);">
									<span id="tab2" class="tab<c:if test="${lnb.pId eq 2}"> tabOn</c:if>">상품등록 관리</span>
								</a>
							</li>
							<li class="tab_item">
								<a href="javascript:;" class="tab_link" onclick="_BT.moveUrl(_BT.FRONT.URL.Product.SellerItemMng);">
									<span id="tab3" class="tab<c:if test="${lnb.pId eq 3}"> tabOn</c:if>">재고상품 관리</span>
								</a>
							</li>
 --%>							
						</ul>
					</div>
				</c:when>
				<c:when test="${lnb.mId eq '3'}">
				 	<div class="tab_bar">
						<ul class="tab_list">
<%-- 						
							<li class="tab_item">
								<a href="javascript:;" class="tab_link" onclick="_BT.moveUrl(_BT.FRONT.URL.Customer.SellerComf);">
									<span id="tab0" class="tab<c:if test="${lnb.pId eq 0}"> tabOn</c:if>">업체 승인</span>
								</a>
							</li>
							<li class="tab_item">
								<a href="javascript:;" class="tab_link" onclick="_BT.moveUrl(_BT.FRONT.URL.Customer.SellerApprl);">
									<span id="tab1" class="tab<c:if test="${lnb.pId eq 1}"> tabOn</c:if>">업체 관리</span>
								</a>
							</li>
 --%>							
							<li class="tab_item">
								<a href="javascript:;" class="tab_link" onclick="_BT.moveUrl(_BT.FRONT.URL.Customer.DashBoard);">
									<span id="tab5" class="tab<c:if test="${lnb.pId eq 5}"> tabOn</c:if>">현황판</span>
								</a>
							</li>
 							<li class="tab_item">
								<a href="javascript:;" class="tab_link" onclick="_BT.moveUrl(_BT.FRONT.URL.Customer.UserMng);">
									<span id="tab2" class="tab<c:if test="${lnb.pId eq 2}"> tabOn</c:if>">사용자 관리</span>
								</a>
							</li>
							<li class="tab_item">
								<a href="javascript:;" class="tab_link" onclick="_BT.moveUrl(_BT.FRONT.URL.Customer.UserCont);">
									<span id="tab3" class="tab<c:if test="${lnb.pId eq 3}"> tabOn</c:if>">회신 관리</span>
								</a>
							</li>
							<li class="tab_item">
								<a href="javascript:;" class="tab_link" onclick="_BT.moveUrl(_BT.FRONT.URL.Customer.SmsMng);">
									<span id="tab4" class="tab<c:if test="${lnb.pId eq 4}"> tabOn</c:if>">발송 관리</span>
								</a>
							</li>
							<li class="tab_item">
								<a href="javascript:;" class="tab_link" onclick="_BT.moveUrl(_BT.FRONT.URL.Customer.EstimateMng);">
									<span id="tab6" class="tab<c:if test="${lnb.pId eq 6}"> tabOn</c:if>">견적 관리</span>
								</a>
							</li>
						</ul>
					</div>
				</c:when>
				<c:when test="${lnb.mId eq '4'}">
				 	<div class="tab_bar">
						<ul class="tab_list">
							<li class="tab_item">
								<a href="javascript:;" class="tab_link" onclick="_BT.moveUrl(_BT.FRONT.URL.Site.Board);">
									<span id="tab1" class="tab<c:if test="${lnb.pId eq 1}"> tabOn</c:if>">게시물 관리</span>
								</a>
							</li>
							<li class="tab_item">
								<a href="javascript:;" class="tab_link" onclick="_BT.moveUrl(_BT.FRONT.URL.Site.Promo);">
									<span id="tab3" class="tab<c:if test="${lnb.pId eq 3}"> tabOn</c:if>">프로모션 관리</span>
								</a>
							</li>
							<li class="tab_item">
								<a href="javascript:;" class="tab_link" onclick="_BT.moveUrl(_BT.FRONT.URL.Site.MdItem);">
									<span id="tab2" class="tab<c:if test="${lnb.pId eq 2}"> tabOn</c:if>">상품노출 관리</span>
								</a>
							</li>
							<li class="tab_item">
								<a href="javascript:;" class="tab_link" onclick="_BT.moveUrl(_BT.FRONT.URL.Site.Movie);">
									<span id="tab4" class="tab<c:if test="${lnb.pId eq 4}"> tabOn</c:if>">동영상 관리</span>
								</a>
							</li>
						</ul>
					</div>
				</c:when>
				<c:when test="${lnb.mId eq '5'}">
				 	<div class="tab_bar">
						<ul class="tab_list">
							<li class="tab_item">
								<a href="javascript:;" class="tab_link" onclick="_BT.moveUrl(_BT.FRONT.URL.Setup.Code);">
									<span id="tab1" class="tab<c:if test="${lnb.pId eq 1}"> tabOn</c:if>">코드 관리</span>
								</a>
							</li>
							<li class="tab_item">
								<a href="javascript:;" class="tab_link" onclick="_BT.moveUrl(_BT.FRONT.URL.Setup.Categ);">
									<span id="tab2" class="tab<c:if test="${lnb.pId eq 2}"> tabOn</c:if>">카테고리 관리</span>
								</a>
							</li>
							<li class="tab_item">
								<a href="javascript:;" class="tab_link" onclick="_BT.moveUrl(_BT.FRONT.URL.Setup.Maker);">
									<span id="tab3" class="tab<c:if test="${lnb.pId eq 3}"> tabOn</c:if>">제조사 관리</span>
								</a>
							</li>
							<li class="tab_item">
								<a href="javascript:;" class="tab_link" onclick="_BT.moveUrl(_BT.FRONT.URL.Setup.AdminMng);">
									<span id="tab4" class="tab<c:if test="${lnb.pId eq 4}"> tabOn</c:if>">관리자 권한</span>
								</a>
							</li>
						</ul>
					</div>
				</c:when>
				<c:when test="${lnb.mId eq '6'}">
				 	<div class="tab_bar">
						<ul class="tab_list">
							<li class="tab_item">
								<a href="javascript:;" class="tab_link" onclick="_BT.moveUrl(_BT.FRONT.URL.Calculate.DashBoard);">
									<span id="tab1" class="tab<c:if test="${lnb.pId eq 1}"> tabOn</c:if>">일 마감</span>
								</a>
							</li>
							<li class="tab_item">
								<a href="javascript:;" class="tab_link" onclick="_BT.moveUrl(_BT.FRONT.URL.Calculate.MagamMng2);">
									<span id="tab7" class="tab<c:if test="${lnb.pId eq 7}"> tabOn</c:if>">매출기초</span>
								</a>
							</li>
							<li class="tab_item">
								<a href="javascript:;" class="tab_link" onclick="_BT.moveUrl(_BT.FRONT.URL.Calculate.SalesMng);">
									<span id="tab2" class="tab<c:if test="${lnb.pId eq 2}"> tabOn</c:if>">매출정산</span>
								</a>
							</li>
							<li class="tab_item">
								<a href="javascript:;" class="tab_link" onclick="_BT.moveUrl(_BT.FRONT.URL.Calculate.MagamMng);">
									<span id="tab6" class="tab<c:if test="${lnb.pId eq 6}"> tabOn</c:if>">매입기초</span>
								</a>
							</li>
							<li class="tab_item">
								<a href="javascript:;" class="tab_link" onclick="_BT.moveUrl(_BT.FRONT.URL.Calculate.PurchaseMng);">
									<span id="tab3" class="tab<c:if test="${lnb.pId eq 3}"> tabOn</c:if>">매입마감</span>
								</a>
							</li>
							<li class="tab_item">
								<a href="javascript:;" class="tab_link" onclick="_BT.moveUrl(_BT.FRONT.URL.Calculate.JungSanMng);">
									<span id="tab4" class="tab<c:if test="${lnb.pId eq 4}"> tabOn</c:if>">매입정산</span>
								</a>
							</li>
							<li class="tab_item">
								<a href="javascript:;" class="tab_link" onclick="_BT.moveUrl(_BT.FRONT.URL.Calculate.JungSanChk);">
									<span id="tab5" class="tab<c:if test="${lnb.pId eq 5}"> tabOn</c:if>">마감확정</span>
								</a>
							</li>
						</ul>
					</div>
				</c:when>
			</c:choose>	
			<div id="section" style="width:auto; margin-top:10px;">
				<tiles:insertAttribute name="body" />
			</div> 
		</div>
		<div id="footer">
			<tiles:insertAttribute name="footer" />
		</div>
	</div> 
</body>
</html>