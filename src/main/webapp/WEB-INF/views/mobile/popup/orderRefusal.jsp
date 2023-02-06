<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/layout/include/base.jsp" %>
	<script type="text/javascript">
		var dupClick1 = false;
		$(function(){
			$('#canReson').on('change',function(){
				if($('#canReson option:selected').val() == '0'){
					$('#canRmk').val('');
				}else{
					$('#canRmk').val($('#canReson option:selected').text());
				}
			});
		}); 
		function fnCancel(){
			if( dupClick1 ) {
				alert('처리중 입니다. 잠시만 기다려주세요.');
				return false;
			}
			if(!confirm('해당 상품의 주문취소를 요청 하시겠습니까?')) {
				return false;
			}
			dupClick1 = true; 
			_BT.ajaxCallbackSubmit('orFrm', _BT.STORE.URL.Order.EndRefusal , 
			function(data) {
				dupClick1 = false;
				if($(data).size() > 0) { 
					if(_BT.isEquals(data.code, 'success')){
						alert(data.msg);	
						opener.parent.doAction('search');
						fnClose();
						return false;
					}else{
						alert(data.msg);	
						return false;
					}
				}
			},
			function(xhr, status, error) {
				dupClick1 = false; 
				alert('처리중 오류가 발생했습니다.\n\n다시 확인 부탁 드립니다.');
				return false;
			});
		}
		function fnClose(){
			window.close();
		}
	</script>
	<!-- 팝업창 시작 -->
		<h1 class="blue_title">
			주문취소요청
			<span class="close" onclick="fnClose();">
			</span>
		</h1>
		<div class="pop_set_content">
			<div class="pop_set_substance">
				<h1 class="title_con_Type03">
					주문정보
				</h1>
				<c:set var="CAN_CNT" 				value="0" />
				<c:set var="CAN_PRICE" 			value="0" />
				<c:forEach items="${prdList}" var="prdt1" varStatus="status">
					<c:if test="${prdt1.CHK ne '0'}">
						<c:set var="CAN_CNT" 				value="${CAN_CNT + 1}" />
						<c:set var="CAN_PRICE" 			value="${CAN_PRICE + prdt1.SUM_PRICE}" />
					</c:if>
				</c:forEach>
				
				<table class="tbl_Type06 margintop_10">
					<caption>정보입력</caption>
					<colgroup>
						<col width="18%">
						<col width="32%">
						<col width="18%">
						<col width="32%">
					</colgroup>
					<tbody>
						<tr >
							<th>
								주문번호
							</th>
							<td colspan="3" style="text-align: left; padding-left:10px;">
								<c:out value="${prdList[1].ORDR_ID}"/>
							</td>
						</tr>
						<tr>
							<th>
								주문 품목수
							</th>
							<td style="text-align: left; padding-left:10px;">
									<fmt:formatNumber value="${prdList[1].M_QY}" groupingUsed="true"/>
							</td>
							<th>
								결제금액
							</th>
							<td style="text-align: left;">			
								<label class="signup_txt">
									<fmt:formatNumber value="${prdList[1].M_SUM_PRICE}" groupingUsed="true"/>원
								</label>
							</td>
						</tr>
						<tr>
							<th>
								취소 품목수
							</th>
							<td style="text-align: left; padding-left:10px;">
									<fmt:formatNumber value="${CAN_CNT}" groupingUsed="true"/>
							</td>
							<th>
								취소금액
							</th>
							<td style="text-align: left;">			
								<label class="signup_txt">
									<fmt:formatNumber value="${CAN_PRICE}" groupingUsed="true"/>원
								</label>
							</td>
						</tr>
						<tr >
							<th>
								취소후 금액
							</th>
							<td colspan="3" style="text-align: left; padding-left:10px;">
								상품가격 : <fmt:formatNumber value="${prdList[1].M_TOT_PRICE - CAN_PRICE}" groupingUsed="true"/>원	
									<label class="icon"><img src="${staticRoot}/img/icon_plus.jpg" alt="플러스" /></label>
								배송비 : <fmt:formatNumber value="${prdList[1].M_DEVY_FEE}" groupingUsed="true"/>원
								<label class="icon"><img src="${staticRoot}/img/icon_equals.jpg" alt="합계" /></label>
								<label class="cart_price02">
									<fmt:formatNumber value="${prdList[1].M_SUM_PRICE - CAN_PRICE}" groupingUsed="true"/>원
								</label>
							</td>
						</tr>
					</tbody>
				</table>
				<h1 class="title_con_Type03 margintop_10">
					상품정보
				</h1>
				<table class="tbl_Type06 margintop_10">
					<caption>정보입력</caption>
					<colgroup>
						<col width="10%">
						<col width="15%">
						<col width="20%">
						<col width="25%">
						<col width="30%">
					</colgroup>
					<tbody>
						<tr >
							<th>
								확인
							</th>
							<th>
								수량
							</th>
							<th>
								코드
							</th>
							<th>
								품명
							</th>
							<th>
								규격
							</th>
						</tr>
						<c:forEach items="${prdList}" var="prdt1" varStatus="status">
							<tr>
								<td>
									<c:if test="${prdt1.CHK ne '0'}">
										<label class="cart_price02">
											취소
										</label>
									</c:if>									
								</td>
								<td>
									<fmt:formatNumber value="${prdt1.QY}" groupingUsed="true"/>
								</td>
								<td>
									<c:out value="${prdt1.PRDT_DTL_CD}"/>
								</td>
								<td style="text-align: left; padding-left:10px;">
									<c:out value="${prdt1.PRDT_NM}"/>
								</td>
								<td style="text-align: left; padding-left:10px;">
									<c:out value="${prdt1.STNDRD}"/>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<h1 class="title_con_Type03 margintop_10">
					취소사유
				</h1>
				<form id="orFrm" name="orFrm">
					<input type="hidden" id="SaveStr" name="SaveStr" value="<c:out value="${pageParm.SaveStr}"/>"/>	
					<input type="hidden" id="ordrId" name="ordrId" value="<c:out value="${pageParm.ordrId}"/>"/>	
					<table id="traceTable" class="tbl_Type06 margintop_10">
						<caption>정보입력</caption>
						<colgroup>
							<col width="15%">
							<col width="*">
						</colgroup>
						<tbody>
							<tr>
								<th>취소사유</th>
								<td style="text-align: left; padding-left:10px;" valign="middle">
									<span class="return_select5">
										<select id="canReson" name="canReson" class="">
											<option value="0">직접입력</option>
											<option value="1">재고 없음</option>
											<option value="2">단종</option>
											<option value="3">단가 변동</option>
										</select>
									</span>
									<input type="text" class="input_style04" style="padding: 5px 0;" id="canRmk" name="canRmk" placeholder="판매취소 사유 입력"/>
								</td>
							</tr>
						</tbody>
					</table>
				</form>
				<div class="btn_group margintop_20">
					<span class="form_btn_Type_green" onclick="fnCancel();">취소 요청</span>
					<span class="form_btn_Type_blue" onclick="fnClose();">닫  기</span>
				</div>
				<div class="signup_agree margintop_30">
					<p class="alarm_txt margintop_10">※  주문취소 완료 후 주문금액이 무료배송 금액 미만으로 변경되어 <span class="redCr bTxt" >배송비가 발생</span>할 경우</p>
					<p class="alarm_txt margintop_5 marginleft_15">해당 배송비는 <span class="redCr bTxt" >판매자께서  부담</span> 하셔야 합니다.</p>
					<p class="alarm_txt margintop_10">※  구매자의 선택에 따라 해당 <span class="redCr bTxt" >주문번호</span>의 <span class="redCr bTxt" >전체 품목</span>이 <span class="redCr bTxt" >취소</span> 될 수 있습니다</p>
				</div>
			</div> 
		</div>

