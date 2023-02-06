<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/layout/include/base.jsp" %>
	<div class=wid_1248>
		<div class="section center_content">
			<h1 class="title_Type03 margintop_20">
				주문완료
			</h1>
			<div class="join_content_tab">
				<a href="javascript:;">
					장바구니
				</a>
				<a href="javascript:;">
					주문/결제
				</a>
				<a href="javascript:;" class="on">
					주문완료
				</a>
			</div>
			<div class="order_complete">
				<img src="${staticRoot}/img/img_complete.jpg" alt="주문완료" />
				<c:choose>
					<c:when test="${payMethod eq 'VBank'}">
						<p class="blue_txt margintop_30">
							주문이 완료되었습니다.
						</p>
						<p class="gray_txt margintop_20">
							아래 계좌로 입금해 주시면 구매가 완료 됩니다.
						</p>
						 <div style="text-align: center;">
						 	<table class="cart_list margintop_30">		
								<caption>장바구니</caption>
								<colgroup>
									<col width="20%">
									<col width="*">
								</colgroup>
								<tbody>
									<tr>
										<th>
											입금할 금액
										</th>
										<td>
											<p class="cart_price02" style="text-align: left; padding-left: 10px;">
												<fmt:formatNumber value="${TotPrice}" groupingUsed="true"/>원
												<span style="color: #fffff;">(<c:out value="${VACT_Date}"/> 까지)</span>
											</p>
										</td>
									</tr>
									<tr>
										<th>
											입금정보
										</th>
										<td>
											<p class="cart_txt01" style="text-align: left; padding-left: 10px;">
												<c:out value="${vactBankName}"/>, 계좌번호 : <c:out value="${VACT_Num}"/> 
											</p>
										</td>
									</tr>
								</tbody>
							</table>
						 </div>
					</c:when>
					<c:otherwise>
						<p class="blue_txt margintop_30">
							주문이 완료되었습니다.
						</p>
						<p class="gray_txt margintop_20">
							이용해주셔서 감사합니다.
						</p>
					</c:otherwise>
				</c:choose>
				<span class="order_check margintop_30 marginbottom_30" onclick="_BT.moveUrl(_BT.SHOP.URL.Order.OrderList);">
					구매내역 확인하기
				</span>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$(function(){
			snedGAnaly({'type':'endPay'});
		});
		function snedGAnaly(sAction) { 
			switch(sAction.type) {  
				case 'endPay':       
					ga('create', 'UA-97902014-1');
					ga('require', 'ec');    
					<c:forEach items="${ORDR_SM}" var="prdt1" varStatus="status">
						ga('ec:addProduct', {
							  'id': '${prdt1.PRDT_DTL_CD}',
							  'name': '${prdt1.PRDT_NM}',
							  'price': '${prdt1.TOT_PRICE_1}',
							  'brand': '${prdt1.MAKR_NM}',
							  'category': '',
							  'variant': '${prdt1.STNDRD}' ,
							  'position': '${status.count}' ,
							  'quantity': '${prdt1.QY}'
						});
					</c:forEach>
					ga('ec:setAction', 'purchase', {
						  'id' : '${ORDR_SM[0].ORDR_ID}' , 
						  'affiliation': 'selltoolkr',
						  'revenue': '${ORDR_SM[0].TOT_PRICE}' , 
						  'tax': 0 ,
						  'shipping': '${ORDR_SM[0].DEVY_FEE}' 
						});
					ga('send', 'pageview');
				break;
			}
		}
	</script>	
	<script type="text/javascript">
<%-- 	
/* 	
		ga('require', 'ecommerce');
		ga('ecommerce:addTransaction', { 
			'id': '1234', 							// 시스템에서 생성된 주문번호. 필수. 
			'affiliation': 'selltool.kr',	 		// 제휴사이름. 선택사항. 
			'revenue': '30000
			 ', 				// 구매총액. 필수. 
			'shipping': '5000', 					// 배송비. 선택사항. 
			'tax': '0' ,							// 세금. 선택사항.
			'currency': 'KRW'					// 통화. 선택사항.
		});		
		ga('ecommerce:addItem', { 
			'id': '1234', 							//시스템에서 생성된 주문번호. 필수. 
			'name': '남성용 긴팔셔츠 흰색 XL', 	// 제품명. 필수. 
			'sku': 'XXX56789', 				// SKU 또는 제품고유번호. 선택사항. 
			'category': '남성의류', 				// 제품 분류. 
			'price': '30000', 					// 제품 단가. 
			'quantity': '1' 						// 제품 수량.
		});		
		ga('ecommerce:send');
 */	
 --%>				
   </script>