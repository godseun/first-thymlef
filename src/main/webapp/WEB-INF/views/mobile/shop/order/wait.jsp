<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/layout/include/base.jsp" %>
	<div class=wid_1248>
		<div class="section center_content">
			<div class="join_content_tab">
				<a href="javascript:;">
					장바구니
				</a>
				<a href="javascript:;">
					주문/결제
				</a>
				<a href="javascript:;" class="on">
					결제확인중
				</a>
			</div>
			<div class="order_complete">
				<img src="${staticRoot}/img/img_complete.jpg" alt="주문완료" />
				<p class="blue_txt margintop_30">
					이용해주셔서 감사합니다.
				</p>
				<p class="gray_txt margintop_20">
					결제내역을 수신 중 입니다.(수신 완료 후 구매내역을 확인 하실 수 있습니다.)
				</p>
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
							  'price': '${prdt1.SUM_PRICE}',
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