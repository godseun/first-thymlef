<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/layout/include/base.jsp" %>
	<script type="text/javascript">
		$(function(){
			<%//각 프로모션 상품 상세검색 화면이동%>
			$('.bnImg').on('click', function(){  
				var type = $(this).data('type');
				var value = $(this).data('value');
				$('#pCode').val(value);
				_BT.actFormSubmit('frm', 'post', _BT.SHOP.URL.Helpdesk.PromoDtl); 
			});			
			<%//대화의 발견 상세 페이지 이동%>
			$('.recommend_con_Type04').on('click', function(){ 
				var value = $(this).data('value');
				var type = $(this).data('type');
				if(value == ''){
					$('#pCode').val(type);
					_BT.actFormSubmit('frm', 'post',_BT.SHOP.URL.Helpdesk.CtgPromoDtl); 
				}else{
					_BT.actFormSubmit('frm', 'post', _BT.SHOP.URL.Search.View+'?pCode='+value); 
				}
			});
		});
	</script>
	<div class="container wid_999 bg_gray" style="padding-top: 0px;">
		<div class="cycle-slideshow" data-cycle-fx="scrollHorz" data-cycle-slides="> a" data-cycle-pager=".rolling_pager">
			<c:forEach items="${banners}" var="mBn" varStatus="status">
				<c:if test="${mBn.bTp eq 'MPB'}">
					<a href="javascript:;" class="bnImg" data-type="${mBn.bTp}" data-value="${mBn.pId}">
						<img src="${upload}<c:out value="${mBn.bImg}"/>" alt="메인비쥬얼" style="width:100%"/>
					</a>
				</c:if>
			</c:forEach>				
		</div>
		<div class="rolling_pager" style="margin-top: -30px; text-align: right;"></div>
		<ul class="m_main_icon">
			<li>
				<a href="javascript:;">
					<img src="${staticRoot}/m/img/main_menu_icon02.jpg" alt="메뉴아이콘2" />
						<p>작업</p>
				</a>
			</li>
			<li>
				<a href="javascript:;">
					<img src="${staticRoot}/m/img/main_menu_icon03.jpg" alt="메뉴아이콘3" />
						<p>전동</p>
				</a>
			</li>
			<li>
				<a href="javascript:;">
					<img src="${staticRoot}/m/img/main_menu_icon04.jpg" alt="메뉴아이콘4" />
						<p>에어/유압/엔진</p>
				</a>
			</li>
			<li>
				<a href="javascript:;">
					<img src="${staticRoot}/m/img/main_menu_icon06.jpg" alt="메뉴아이콘6" />
						<p>운반/하역/포장</p>
				</a>
			</li>
			<li>
				<a href="javascript:;">
					<img src="${staticRoot}/m/img/main_menu_icon05.jpg" alt="메뉴아이콘5" />
						<p>산업안전/용접</p>
				</a>
			</li>
			<li>
				<a href="javascript:;">
					<img src="${staticRoot}/m/img/main_menu_icon07.jpg" alt="메뉴아이콘7" />
						<p>전기/제어/측정</p>
				</a>
			</li>
			<li>
				<a href="javascript:;">
					<img src="${staticRoot}/m/img/main_menu_icon01.jpg" alt="메뉴아이콘1" />
						<p>절삭</p>
				</a>
			</li>
			<li>
				<a href="javascript:;">
					<img src="${staticRoot}/m/img/main_menu_icon08.jpg" alt="메뉴아이콘8" />
						<p>화학/윤활/배관</p>
				</a>
			</li>
			<li>
				<a href="javascript:;">
					<img src="${staticRoot}/m/img/main_menu_icon09.jpg" alt="메뉴아이콘9" />
						<p>사무/생활/가전</p>
				</a>
			</li>
			<li>
				<a href="javascript:;">
					<img src="${staticRoot}/m/img/main_menu_icon10.jpg" alt="메뉴아이콘10" />
						<p>추천</p>
				</a>
			</li>
		</ul>

		<!-- width 639px start-->
		<ul class="m_main_icon_639">
			<li>
				<a href="javascript:;">
					<img src="${staticRoot}/m/img/main_menu_icon02.jpg" alt="메뉴아이콘2" />
						<p>작업</p>
				</a>
			</li>
			<li>
				<a href="javascript:;">
					<img src="${staticRoot}/m/img/main_menu_icon03.jpg" alt="메뉴아이콘3" />
						<p>전동</p>
				</a>
			</li>
			<li>
				<a href="javascript:;">
					<img src="${staticRoot}/m/img/main_menu_icon04.jpg" alt="메뉴아이콘4" />
						<p>에어/유압/엔진</p>
				</a>
			</li>
			<li>
				<a href="javascript:;">
					<img src="${staticRoot}/m/img/main_menu_icon06.jpg" alt="메뉴아이콘6" />
						<p>운반/하역/포장</p>
				</a>
			</li>
			<li>
				<a href="javascript:;">
					<img src="${staticRoot}/m/img/main_menu_icon05.jpg" alt="메뉴아이콘5" />
						<p>산업안전/용접</p>
				</a>
			</li>
			<li>
				<a href="javascript:;">
					<img src="${staticRoot}/m/img/main_menu_icon07.jpg" alt="메뉴아이콘7" />
						<p>전기/제어/측정</p>
				</a>
			</li>
			<li>
				<a href="javascript:;">
					<img src="${staticRoot}/m/img/main_menu_icon01.jpg" alt="메뉴아이콘1" />
						<p>절삭</p>
				</a>
			</li>
			<li>
				<a href="javascript:;">
					<img src="${staticRoot}/m/img/main_menu_icon08.jpg" alt="메뉴아이콘8" />
						<p>화학/윤활/배관</p>
				</a>
			</li>
			<li>
				<a href="javascript:;">
					<img src="${staticRoot}/m/img/main_menu_icon09.jpg" alt="메뉴아이콘9" />
						<p>사무/생활/가전</p>
				</a>
			</li>
			<li>
				<a href="javascript:;">
					<img src="${staticRoot}/m/img/main_menu_icon10.jpg" alt="메뉴아이콘10" />
						<p>추천</p>
				</a>
			</li>
		</ul>
		<!-- width 639px end-->
		
		<c:set var="isFirst" value="Y" />
		<ul class="m_recommend_list">
			<c:forEach items="${banners}" var="STF" varStatus="status">
				<c:if test="${STF.bTp eq 'STF'}">
					<c:if test="${isFirst eq 'Y'}">
						<div class="recommend_con_Type04" data-type="<c:out value="${STF.bId}"/>" data-value="<c:out value="${STF.pPrdtCd}"/>" id ="se_${status.count}"style="width: 98%; background-image:url('${upload}${STF.bImg}'); background-size: 100% 100%;">
							<div class="recommend_con_txt03">
								<span class="title2" id="on_se_${status.count}">
									<c:out value="${STF.bTit}"/> &gt;
								</span>
							</div>
						</div>
						<c:set var="isFirst" value="N" />
					</c:if>
					<div class="recommend_con_Type04 <c:if test="${status.count % 2 eq 0}">marginright_10</c:if>" data-type="<c:out value="${STF.bId}"/>" data-value="<c:out value="${STF.pPrdtCd}"/>" id ="se_${status.count}"style="background-image:url('${upload}${STF.bImg}'); background-size: 100% 100%;">
						<div class="recommend_con_txt03">
							<span class="title2" id="on_se_${status.count}">
								<c:out value="${STF.bTit}"/> &gt;asas
							</span>
						</div>
					</div>
				</c:if>
			</c:forEach>
		</ul>
<%-- 		
		<ul class="m_ad_content01">
			<li>
				<div class="box_content">
					<a href="javascript:;" class="img">
						<img src="${staticRoot}/m/img/ad_content01.jpg" alt="광고상품" />
					</a>
					<div class="total_txt">
						<a href="" class="txt_title01">
							프레스툴 최초 / 브러쉬리스 모터
						</a>
						<a href="" class="txt_title02">
							케맥스 ACO203 : 용접대신 충전공구로 배관연결, 5초면 끝!
						</a>
					</div>
				</div>
			</li>
		</ul>
 --%>
		<ul class="m_list_content01">
			<c:forEach items="${prdtList.mob}" var="prdt1" varStatus="status" begin="3" end="12">
			<li>
				<div class="box_content">
					<span class="img">
	<c:choose>
						<c:when test="${fn:indexOf(prdt1.PRDT_IMG, '//') >=0 }">
							<img src="<c:out value="${prdt1.PRDT_IMG}"/>" alt="상품사진" style="width:auto;height:180px;" onerror="this.src='${staticRoot}/img/sample03.jpg'"/>
	</c:when>
						<c:otherwise>
						<img src="${staticRoot}/prduct<c:out value="${prdt1.PRDT_IMG}"/>" alt="상품사진" style="width:auto;height:180px;" onerror="this.src='${staticRoot}/img/sample03.jpg'"/>
</c:otherwise>
						</c:choose>
					</span>
					<div class="total_txt">
						<span class="txt_title01">
							<c:out value="${prdt1.PRDT_NM}"/>
						</span>
						<span class="txt_title02">
							[<c:out value="${prdt1.MAKR_NM}"/>] <c:out value="${prdt1.STNDRD}"/>
						</span>
						<span class="price">
							<fmt:formatNumber value="${prdt1.SEL_PRICE}" groupingUsed="true"/>원
						</span>
					</div>
				</div>
			</li>
			</c:forEach>
		</ul>

		<div class="m_main_content04">
			<h1 class="con_title01">
				대한민국 대표 공구쇼핑몰,<span class="block_img_480"><img src="${staticRoot}/img/logo_01.png" alt="" /></span>
			</h1>
			<p class="con_txt_Type01">
				가지고 있는 장점을 극대화하고 전략적인 기술 및 협력사 등과 <span class="block_txt_639">제휴를 통한<br/>
				단점을 보완시키는 겸손한 자세로 성공의 결과를</span> 이끌어 내기 위하여 노력하겠습니다.
			</p>
			<div class="info_content01">
				<div class="info_con01">
					<p>
						<img src="${staticRoot}/img/main_txt_img04.png" alt="검증된 제품" />
					</p>
					<p class="txt01">
						검증된 제품
					</p>
					<p class="txt02">
						대화에 등록된 모든 품목은 사업자의<br/>실재고품으로 기존 개인간 거래시 발생할 수<br/>있는 문제들을 원천적으로 차단하였습니다.
					</p>
				</div>
				<div class="info_con01">
					<p>
						<img src="${staticRoot}/img/main_txt_img05.png" alt="편의성" />
					</p>
					<p class="txt01">
						편의성
					</p>
					<p class="txt02">
						전국의 공구매장에 보유중인 다양한<br/>품목들을 대화안에서 한번에<br/>만나보실 수 있습니다.
					</p>
				</div>
				<div class="info_con01">
					<p>
						<img src="${staticRoot}/img/main_txt_img06.png" alt="다양성" />
					</p>
					<p class="txt01">
						다양성
					</p>
					<p class="txt03">
						국내 유통되고 있는 일반품목 외에<br/>합리적인 롱테일 상품을<br/>지속적으로 소개합니다.
					</p>
				</div>
				<div class="info_con01">
					<p>
						<img src="${staticRoot}/img/main_txt_img07.png" alt="접근성" />
					</p>
					<p class="txt01">
						접근성
					</p>
					<p class="txt03">
						국내외 유통되는 13만 가지 공구<br/>품목들을 카테고리별로 세분화하여<br/>편리하게 찾을 수 있습니다.
					</p>
				</div>
				<p class="txt01">
					상호명 : (주)대화   |   사업자등록번호 : 504-86-15839<br />통신판매신고번호 : 2014-대구북구-0451<br />본사 : 대구광역시 북구 검단로 83<br />전화 : <a href="tel:16880945">1688-0945</a>   |   팩스 : 053-753-0907<br />대표 : 신상우   |   개인정보관리책임자 : 최정훈<br />문의메일 : info@toolket.com<br />Copyright 2016 TOOLKET Corp.<br />ALL RIGHT RESERVED
				</p>
			</div>

			<div class="info_content01 show_639">
				<div class="cycle-slideshow" data-cycle-fx="scrollHorz" data-cycle-slides="> div" data-cycle-pager="">
					<div class="info_con01">
						<p>
							<img src="${staticRoot}/img/main_txt_img04.png" alt="검증된 제품" />
						</p>
						<p class="txt01">
							검증된 제품
						</p>
						<p class="txt02">
							대화에 등록된 모든 품목은 사업자의<br/>실재고품으로 기존 개인간 거래시 발생할 수<br/>있는 문제들을 원천적으로 차단하였습니다.
						</p>
					</div>
					<div class="info_con01" style="display:none;">
						<p>
							<img src="${staticRoot}/img/main_txt_img05.png" alt="편의성" />
						</p>
						<p class="txt01">
							편의성
						</p>
						<p class="txt02">
							전국의 공구매장에 보유중인 다양한<br/>품목들을 대화안에서 한번에<br/>만나보실 수 있습니다.
						</p>
					</div>
					<div class="info_con01" style="display:none;">
						<p>
							<img src="${staticRoot}/img/main_txt_img06.png" alt="다양성" />
						</p>
						<p class="txt01">
							다양성
						</p>
						<p class="txt03">
							국내 유통되고 있는 일반품목 외에<br/>합리적인 롱테일 상품을<br/>지속적으로 소개합니다.
						</p>
					</div>

					<div class="info_con01" style="display:none;">
						<p>
							<img src="${staticRoot}/img/main_txt_img07.png" alt="접근성" />
						</p>
						<p class="txt01">
							접근성
						</p>
						<p class="txt03">
							국내외 유통되는 13만 가지 공구<br/>품목들을 카테고리별로 세분화하여<br/>편리하게 찾을 수 있습니다.
						</p>
					</div>
				</div>
<!-- 				
				<div class="rolling_pager">
				</div>
 -->				
			</div>
		</div>
	</div>
	<form id="frm" name="frm">
		<input type="hidden" id="sValue" name="sValue" />
		<input type="hidden" id="pCode" name="pCode" />
		<input type="hidden" id="cCode" name="cCode" />
	</form>