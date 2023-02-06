<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/layout/include/base.jsp" %>
	<script type="text/javascript">
		var dupClick1 = false;
		$(function(){  
			$('#7').removeClass('vOff');
			
			$('.notcie_board1').click(function() {
				if(
				$('#'+$(this).data('type')+'_'+$(this).data('value')).hasClass('vOff')
				)
					$('#'+$(this).data('type')+'_'+$(this).data('value')).removeClass('vOff');
				else
					$('#'+$(this).data('type')+'_'+$(this).data('value')).addClass('vOff');
			});
			$('.mBar').click(function() {
				$(".mBar").each(function(i){  				
					$(this).removeClass('on');
				});
				$(".mDiv").each(function(i){  				
					$(this).addClass('vOff');
				});
				$(this).addClass('on');
				$('#' + $(this).data('type')).removeClass('vOff');
			});
		});
	</script>
	<div class="section" style="min-height: 1000px;">
		<h1 class="title_Type03">
			자주묻는질문
			<div class="sub_location">
				<div class="list_location01">
					<span class="txt01">고객만족 센터</span>
					<span class="arrow"><img src="${staticRoot}/img/bl_01.jpg" alt=">" /></span>
					<span class="last_txt">자주묻는질문</span>
				</div>
			</div>
		</h1>
		<div class="notcie_board">					
			<div class="faq_txt_01">
				대화맨에게 물어 보세요.
			</div>
			<div class="faq_box_01" style="text-align: center;">
				<div class="faq_sbox_01" style="margin-left: 140px;">
					FAQ 검색
					<span class="faq_arrow"><img src="${staticRoot}/img/c12_03_faqarrow_01.jpg" alt=""></span>
				</div>
				<div class="faq_sbox_02">
					1 : 1 문의
					<span class="faq_arrow"><img src="${staticRoot}/img/c12_03_faqarrow_01.jpg" alt=""></span>
				</div>
				<div class="faq_sbox_04">
					전화문의
				</div>
			</div>
			<div class="faq_txt_02">
				궁금한 사항을 자주묻는 질문에서 먼저 찾아보신 후 1:1문의, 전화문의를 이용해 주세요.
			</div>
			<c:set var="cnt_7" value="0" />
			<c:set var="cnt_8" value="0" />
			<c:set var="cnt_9" value="0" />
			<c:set var="tot_7" value="0" />
			<c:set var="tot_8" value="0" />
			<c:set var="tot_9" value="0" />
			<!--분류탭-->
			<div class="join_content_tab margintop_40 marginbottom_25">
				<c:forEach items="${bbsCnt}" var="cnt" varStatus="status">
					<c:choose>
						<c:when test="${cnt.BBS_TP eq '7'}">
							<c:set var="tot_7" value="${cnt.BBS_CNT}" />
							<a href="javascript:;" class="mBar on" id="m_7" data-type="${cnt.BBS_TP}">
								일반
							</a>
						</c:when>
						<c:when test="${cnt.BBS_TP eq '8'}">
							<c:set var="tot_8" value="${cnt.BBS_CNT}" />
							<a href="javascript:;" class="mBar" id="m_8" data-type="${cnt.BBS_TP}">
								구매하기
							</a>
						</c:when>
						<c:when test="${cnt.BBS_TP eq '9'}">
							<c:set var="tot_9" value="${cnt.BBS_CNT}" />
							<a href="javascript:;" class="mBar" id="m_9" data-type="${cnt.BBS_TP}">
								판매하기
							</a>
						</c:when>
					</c:choose>
				</c:forEach>
			</div>
			<!--분류탭-->
			<c:forEach items="${bbsList}" var="bbs" varStatus="status">
				<c:choose>
					<c:when test="${bbs.BBS_TP eq '7'}">
						<c:set var="cnt_7" value="${cnt_7 + 1}" />
						<c:if test="${cnt_7 eq 1}"> 
							<div id="${bbs.BBS_TP}" class="mDiv vOff">
						</c:if>
						<div class="notcie_board1" data-type="${bbs.BBS_TP}" data-value="${cnt_7}" >
							<div class="notcie_board_tit margintop_10">
								<a href="javascript:;"><strong>[Q]</strong><c:out value="${bbs.TITLE}"/></a>
							</div>						
						</div>					
						<div class="notcie_board_con vOff" data-type="${bbs.BBS_TP}" data-value2="${cnt_7}" id="${bbs.BBS_TP}_${cnt_7}">
							<strong>[A]</strong>
							${fn:replace(bbs.CONTENT, cn, br)}
						</div>
						<c:if test="${cnt_7 eq tot_7}"> 
							</div>
						</c:if>
					</c:when>
				</c:choose>
			</c:forEach>
			<c:forEach items="${bbsList}" var="bbs" varStatus="status">
				<c:choose>
					<c:when test="${bbs.BBS_TP eq '8'}">
						<c:set var="cnt_8" value="${cnt_8 + 1}" />
						<c:if test="${cnt_8 eq 1}"> 
							<div id="${bbs.BBS_TP}" class="mDiv vOff">
						</c:if>
						<div class="notcie_board1" data-type="${bbs.BBS_TP}" data-value="${cnt_8}" >
							<div class="notcie_board_tit margintop_10">
								<a href="javascript:;"><strong>[Q]</strong><c:out value="${bbs.TITLE}"/></a>
							</div>						
						</div>					
						<div class="notcie_board_con vOff" data-type="${bbs.BBS_TP}" data-value2="${cnt_8}" id="${bbs.BBS_TP}_${cnt_8}">
							<strong>[A]</strong>
							${fn:replace(bbs.CONTENT, cn, br)}
						</div>
						<c:if test="${cnt_8 eq tot_8}"> 
							</div>
						</c:if>
					</c:when>
				</c:choose>
			</c:forEach>
			<c:forEach items="${bbsList}" var="bbs" varStatus="status">
				<c:choose>
					<c:when test="${bbs.BBS_TP eq '9'}">
						<c:set var="cnt_9" value="${cnt_9 + 1}" />
						<c:if test="${cnt_9 eq 1}"> 
							<div id="${bbs.BBS_TP}" class="mDiv vOff">
						</c:if>
						<div class="notcie_board1" data-type="${bbs.BBS_TP}" data-value="${cnt_9}" >
							<div class="notcie_board_tit margintop_10">
								<a href="javascript:;"><strong>[Q]</strong><c:out value="${bbs.TITLE}"/></a>
							</div>						
						</div>					
						<div class="notcie_board_con vOff" data-type="${bbs.BBS_TP}" data-value2="${cnt_9}" id="${bbs.BBS_TP}_${cnt_9}">
							<strong>[A]</strong>
							${fn:replace(bbs.CONTENT, cn, br)}
						</div>
						<c:if test="${cnt_9 eq tot_9}"> 
							</div>
						</c:if>
					</c:when>
				</c:choose>
			</c:forEach>			
		</div>
	</div>
