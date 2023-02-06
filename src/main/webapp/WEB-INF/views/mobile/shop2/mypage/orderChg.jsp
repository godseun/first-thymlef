<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/layout/include/base.jsp" %>
	<script type="text/javascript">
		var dupClick1 = false;
		$(function(){  
		});
	</script>
	<c:set var="jobTxt" 			value="" />	
	<c:choose>
		<c:when test="${pageParm.procType eq 'ordrcan'}"> 
			<c:set var="jobTxt" 			value="취소" />
		</c:when>
		<c:when test="${pageParm.procType eq 'ordrchg'}"> 
			<c:set var="jobTxt" 			value="교환" />
		</c:when>
		<c:when test="${pageParm.procType eq 'ordrrtn'}"> 
			<c:set var="jobTxt" 			value="반품" />
		</c:when>
	</c:choose>	
	<div class="section" style="min-height:700px;">
		<h1 class="title_Type03">
			<c:out value="${jobTxt}"/>신청
			<div class="sub_location">
				<div class="list_location01">
					<span class="txt01">구매내역</span>
					<span class="arrow"><img src="${staticRoot}/img/bl_01.jpg" alt=">" /></span>
					<span class="last_txt">교환/반품(취소) 신청</span>
				</div>
			</div>
		</h1>
		<div class="">
			<h1 class="title_con_Type01 margintop_30">
				신청 상품
			</h1>
			<table class="cart_list" id="ordr_item_list">
				<caption>장바구니</caption>
				<colgroup>
					<col width="5%">
					<col width="5%">
					<col width="*%">
					<col width="12%">
					<col width="12%">
					<col width="12%">
					<col width="12%">
					<col width="13%">
				</colgroup>
				<tbody>
					<tr>
						<th>
						</th>
						<th>
							선택
						</th>
						<th>
							상품정보
						</th>
						<th class="cart_th_01">
							품목코드
						</th>
						<th class="cart_th_01">
							수량
						</th>
						<th>
							금액
						</th>
						<th class="cart_th_01">
							배송비
						</th>
						<th>
							주문 상태
						</th>
					</tr>
					<c:if test="${fn:length(ordrList) lt 1}">
						<tr>
							<td colspan="8" height="100px;">
								<h1 class="title_Type04">
									조회내역이 없습니다.
								</h1>
							</td>
						</tr>
					</c:if>
					<c:set var="maxSttus" 			value="-1" />
					<c:set var="isFirst" 				value="1" />
					<c:set var="mRow" 				value="1" />
					<c:set var="dFee" 				value="0" />
					<c:set var="STORE_ID" 		value="0" />
					<c:set var="DEVY_TP" 			value="0" />
					<c:forEach items="${ordrList}" var="ordr" varStatus="status">
						<c:if test="${ordr.STTUS gt maxSttus}">
							<c:set var="maxSttus" 			value="${ordr.STTUS}" />
						</c:if>
						<c:choose>
							<c:when test="${ordr.STORE_ID ne STORE_ID}">
								<c:set var="STORE_ID" 		value="${ordr.STORE_ID}" />
								<c:forEach items="${ordrStrMst}" var="ordr2" varStatus="status2">
									<c:if test="${ordr.STORE_ID eq ordr2.STORE_ID}">
										<c:set var="isFirst" 				value="1" />
										<c:set var="DEVY_TP" 			value="${ordr2.DEVY_TP}" />
										<c:set var="mRow" 				value="${ordr2.CNT_PRDT}" />
										<c:set var="dFee" 				value="${ordr2.DEVY_FEE}" />
									</c:if>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<c:set var="isFirst" 				value="0" />
							</c:otherwise>
						</c:choose>		
						<tr>
							<td>
								<p>
									${status.count}
								</p>
							</td>
							<td>
								 <input type="checkbox" class="ordr_item" id="<c:out value="${ordr.O_ID}"/>" data-type="<c:out value="${ordr.O_ID}"/>" data-value="<c:out value="${ordr.STTUS}"/>"/>
							</td>
							<td>
								<p class="cart_txt01">
									<c:out value="${ordr.PRDT_NM}"/>
								</p>
								<p class="cart_txt02">
									[ <c:out value="${ordr.MAKR_NM}"/> ] <c:out value="${ordr.STNDRD}"/>
								</p>
							</td>
							<td class="cart_td_01">
								<c:out value="${ordr.PRDT_DTL_CD}"/>
							</td>
							<td class="cart_td_01">
								<fmt:formatNumber value="${ordr.QY}" groupingUsed="true"/>개
							</td>
							<td>
								<p class="cart_price02">
									<fmt:formatNumber value="${ordr.SUM_PRICE}" groupingUsed="true"/>원
								</p>
							</td>
							<c:if test="${isFirst eq '1'}">
								<td rowspan="${mRow}">
									<p class="cart_txt03"> ${DEVY_TP} </p>
									<c:choose>
										<c:when test="${dFee eq 0}">
											<p class="cart_txt03"> [무료배송] </p>
										</c:when>
										<c:otherwise>
											<p class="cart_txt03"> [<fmt:formatNumber value="${dFee}" groupingUsed="true"/>원] </p>
										</c:otherwise>
									</c:choose>	
								</td>
							</c:if>
							<td> 
								<p data-value="TXT" data-type="<c:out value="${ordr.O_ID}"/>">
								<c:out value="${ordr.STTUS_TXT}"/>
								</p>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class="signup_agree margintop_10">
				<p class="alarm_txt margintop_5">※ 최종 결제 금액이 10만원 미만인 경우 왕복 택비비 또는 편도 택배비가 발생 할 수 있습니다.</p>
			</div>
			<h1 class="title_con_Type01 margintop_30">
				<c:out value="${jobTxt}"/> 신청 사유
			</h1>
			<div class="return_select">
				<select class="" id="selRmk" name="selRmk">
					<option value="">반품사유선택</option>
					<option value="101">상품에 이상 없으나 구매 의사 없어짐</option>
					<option value="110">상품을 잘못 선택함</option>
					<option value="105">상품이 상품상세 정보와 틀림</option>
					<option value="111">배송된 상품의 파손/하자/포장 불량</option>
					<option value="112">상품이 도착하고 있지 않음</option>
					<option value="108">다른 상품이 잘못 배송됨</option>
					<option value="113">기타(구매자 책임사유)</option>
					<option value="116">기타(판매자 책임사유)</option>
				</select>
				<input type="text" class="input_style14 marginleft_10" id ="chrRmk" name="chrRmk" placeholder="상세내용 입력">
			</div>
			<div class="signup_agree margintop_10">
				<p class="alarm_txt">※ <span class="redCr bTxt" >업체배송 상품</span>의 경우 신청사유에 따라 왕복 택비비 또는 편도 택배비가 발생 할 수 있습니다.</p>
			</div>
			<h1 class="title_con_Type01 margintop_30">
				<c:out value="${jobTxt}"/> 방법선택
			</h1>
			<div class="return_select">
				<select class="" id="chrDlvy" name="chrDlvy">
					<option value="D1">반송택배 요청</option>
					<option value="D2">직접반송 예정</option>
				</select>
			</div>
			<c:if test="${ pageParm.paymethod ne 'Card' }">
				<h1 class="title_con_Type01 margintop_30">
					환불 정보 입력
				</h1>
				<div class="return_select2"> 
					<select class="" id="bank" name="bank">
						<option>은행 선택</option>
						<option value="D2">직접발송 예정</option>
					</select>
					<input type="text" class="input_style03 marginleft_10" id ="acntr" name="acntr" placeholder="예금주">
					<input type="text" class="input_style02 marginleft_10" id ="acnut" name="acnut" placeholder="계좌번호">
				</div>
			</c:if>
			<div class="icon_btn_Group margintop_30">
				<a href="#" class="btn_back_02">
					신 청
				</a>
			</div>
		</div>
	</div>
