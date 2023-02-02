<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/layout/include/base.jsp" %>
	<script type="text/javascript">

	</script>
	<div class="sidebar">
		<c:choose>
			<c:when test="${lnb.mId eq '1'}">
				<h2 class="side_title">
					고객센터
				</h2>
				<div class="side_list">
					<ul>
						<li class="list_title">
							<a href="javascript:;" onclick="_BT.moveUrl(_BT.SHOP.URL.Helpdesk.Prologue);" class="title_txt<c:if test="${lnb.pId eq 1}"> on</c:if>">
								대화소개
							</a>
						</li>
						<li class="list_title">
							<a href="javascript:;" onclick="_BT.moveUrl(_BT.SHOP.URL.Helpdesk.Notice);" class="title_txt<c:if test="${lnb.pId eq 2}"> on</c:if>">
								대화소식
							</a>
						</li>
						<li class="list_title">
							<a href="javascript:;" onclick="_BT.moveUrl(_BT.SHOP.URL.Helpdesk.FAQ);" class="title_txt<c:if test="${lnb.pId eq 3}"> on</c:if>">
								자주묻는질문
							</a>
						</li>
						<li class="list_title">
							<a href="javascript:;" onclick="_BT.moveUrl(_BT.SHOP.URL.Helpdesk.QNA);" class="title_txt<c:if test="${lnb.pId eq 4}"> on</c:if>">
								1:1문의
							</a>
						</li>
						<li class="list_title">
							<a href="javascript:;" onclick="_BT.moveUrl(_BT.SHOP.URL.Helpdesk.Promo);" class="title_txt<c:if test="${lnb.pId eq 5}"> on</c:if>">
								프로모션
							</a>
						</li>
						<li class="list_title">
							<a href="javascript:;" onclick="_BT.moveUrl(_BT.SHOP.URL.Helpdesk.Estimate);" class="title_txt<c:if test="${lnb.pId eq 8}"> on</c:if>">
								견적요청
							</a>
						</li>
<%-- 						
						<li class="list_title">
							<a href="javascript:;" onclick="_BT.moveUrl(_BT.SHOP.URL.Helpdesk.Bstory);" class="title_txt<c:if test="${lnb.pId eq 6}"> on</c:if>">
								브랜드 스토리
							</a>
						</li>
						<li class="list_title">
							<a href="javascript:;" onclick="_BT.moveUrl(_BT.SHOP.URL.Helpdesk.Blogger);" class="title_txt<c:if test="${lnb.pId eq 7}"> on</c:if>">
								파워 블로거
							</a>
						</li>
 --%>						
					</ul>
				</div>
			</c:when>
			<c:when test="${lnb.mId eq '2'}">
				<h2 class="side_title">
					마이페이지
				</h2>
				<div class="side_list">
					<ul>
						<li class="list_title">
							<a href="javascript:;" onclick="_BT.moveUrl(_BT.SHOP.URL.Order.cart);" class="title_txt<c:if test="${lnb.pId eq 1}"> on</c:if>">
								장바구니
							</a>
						</li>
						<li class="list_title">
							<a href="javascript:;" onclick="_BT.moveUrl(_BT.SHOP.URL.User.JJIM);" class="title_txt<c:if test="${lnb.pId eq 2}"> on</c:if>">
								관심상품
							</a>
						</li>
						<li class="list_title">
							<a href="javascript:;" onclick="_BT.moveUrl(_BT.SHOP.URL.Order.OrderList);" class="title_txt<c:if test="${lnb.pId eq 3}"> on</c:if>">
								구매내역
							</a>
						</li>
						<li class="list_title">
							<a href="javascript:;" onclick="_BT.moveUrl(_BT.SHOP.URL.User.Info);" class="title_txt<c:if test="${lnb.pId eq 4}"> on</c:if>">
								내정보
							</a>
						</li>
						<li class="list_title">
							<a href="javascript:;" onclick="_BT.moveUrl(_BT.SHOP.URL.User.Alarm);" class="title_txt<c:if test="${lnb.pId eq 5}"> on</c:if>">
								설정
							</a>
						</li>
					</ul>
				</div>
			</c:when>
		</c:choose>	
		<form id="tsFrm" name="tsFrm">
			<input type="hidden" name="mValue" value="#모음전"/>
		</form>
		<div class="ad_left_img02">
			<!-- <a href="javascript:;" onclick="_BT.actFormSubmit('tsFrm', 'POST',_BT.SHOP.URL.Search.mSearch);"> -->
			<a>
				<img src="${staticRoot}/img/ad/ad_left_img03.jpg" alt="광고 이미지3" />
			</a>
		</div>
		<div class="ad_left_img02">
			<img src="${staticRoot}/img/ad/ad_left_img04.jpg" alt="광고 이미지1" />
		</div>
<%-- 		
		<div class="ad_left_img02">
			<a href="javascript:;" onclick="_BT.moveUrl(_BT.SHOP.URL.Search.View+'?pCode=ST30291356')">
				<img src="${staticRoot}/img/ad/ad_left_img04.jpg" alt="광고 이미지1" />
			</a>
		</div>
 --%>		
		<div class="ad_left_img01">
			<!-- <a href="javascript:;" onclick="_BT.moveUrl(_BT.SHOP.URL.Search.View+'?pCode=ST37777777')"> -->
			<a>
				<img src="${staticRoot}/img/ad/ad_left_img05.jpg" alt="광고 이미지1" />
			</a>
		</div>
</div>