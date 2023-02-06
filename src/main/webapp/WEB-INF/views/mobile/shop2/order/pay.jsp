<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/layout/include/base.jsp" %>
	<script src="http://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
	<script type="text/javascript">
		var dupClick1 = false;
		$(function(){   
			if(!_BT.isEmpty('${msg}')){
				alert('${msg}');
			} 
			$( ":input" ).on("focus", function() {
				if(($( this ).prop( "readonly" ))){
					$(this).addClass("mbOn");
				}else{
					$(this).addClass("mOn");
				} 
			});
			$( ":input" ).on("focusout", function() {
				$(this).removeClass("mbOn");
				$(this).removeClass("mOn");
			});
			$(".payment").on("click", function() {
				$(".payment").removeClass("mOn2");
				$(this).addClass("mOn2");
				$("#payTp").val($(this).attr("id"));
			});
			$("#vDetail").on("click", function() {
				if($('.signup_box').hasClass('vOff')){
					$('.signup_box').removeClass("vOff");
				}else{
					$('.signup_box').addClass("vOff");
				} 
			});
			$("#mileage").on("keyup",function(){ 
				var cnt 	= $(this).val();
				var regExp = /[^0-9]/gi;
				if(regExp.test(cnt)) {
					$(this).val(cnt.replace(regExp, ""));
					$(this).focus();
				}
			});
			$("#mileage").on("focusout",function(){
				$(this).val(_BT.setNumFormat($(this).val()));
			});
			$("#mileage").on("focus",function(){
				var cnt 	= $(this).val();
				var regExp = /[^0-9]/gi;
				$(this).val(cnt.replace(regExp, ""));
			});
			fPrice();
		});
		function fPrice(){
			$("#sumPriceTxt").text(_BT.setNumFormat($('#sumPrice').val()));
			$("#sumDlvyFeeTxt").text(_BT.setNumFormat($('#sumDlvyFee').val()));
			$("#sumTotTxt").text(_BT.setNumFormat($('#sumTot').val()));
		}
		function fnMngAddr(){
			_BT.openPopup( _BT.SHOP.URL.User.popAddr,"fnMngAddr", "610", "700", true, true);
		}
		function fnSetAddr(obj){
			console.log(obj);
			
			for(var i=0; i<obj.length; i++){
				$("#"+obj[i].name).val(obj[i].value);
			}
			$(".inAddr").prop('readonly', true);
		}
		function keyIn(){
			$(".inAddr").prop('readonly', false);
		}
		function fnPostcode(){
			if($( "#addrNm" ).prop("readonly")){
				return false;
			}
		    new daum.Postcode({
		        oncomplete: function(data) {
		        	$('#zoneCode').val( data.postcode.replace('-','') );
		        	$("#zipCode").val(data.zonecode);
		        	$("#sigunguCode").val(data.sigunguCode);
		        	$("#address").val(data.address);
		        	$("#dtlAddress").val("("+data.bname+")");
		        }
		    }).open();
		}
		function fnPay(){
			if( dupClick1 ) {
				alert("처리중 입니다. 잠시만 기다려주세요.");
				return false;
			}
			if(_BT.isEmptyById("payTp",   "결제방법을 선택해 주세요.")) return false;
			if(!_BT.isChecked("click01", 	"개인정보 공유에 동의해 주세요.")) return false;
			if(!confirm("상품을 구매 하시겠습니까?")) {
				return false;
			}
			$("#mobileNo").val(_BT.getJoinData("-", new Array("mobile1","mobile2","mobile3")));
			_BT.actFormSubmit("payFrm", "POST", _BT.SHOP.URL.Order.DoPay); 
		}
	</script>
	
	<div class=wid_1248>
		<div class="section center_content">
			<h1 class="title_Type03 margintop_20">
				주문/결제
			</h1>
			<div class="join_content_tab">
				<a href="javascript:;">
					장바구니
				</a>
				<a href="javascript:;" class="on">
					주문/결제
				</a>
				<a href="javascript:;">
					주문완료
				</a>
			</div>
 
			<div class="cart_info margintop_50">
				<h1 class="title_con_Type01">
					주문상품 확인
				</h1>
			<c:set var="lastRow" 			value="${fn:length(cartList)}" />
			<c:set var="isFirst" 				value="1" />
			<c:set var="sumPrice" 			value="0" />
			<c:set var="sumDlvyFee" 		value="0" />
			<c:set var="storeId" 			value="0" />
			<c:set var="sumQy" 			value="0" />
			<c:set var="merCnt" 			value="1" />
			
			<c:set var="totQy" 				value="0" />
			<c:set var="totPrice" 			value="0" />
			<c:set var="dlvyPriceT" 		value="0" />
			<c:set var="dlvyPriceH" 		value="0" />
			<c:set var="dlvyFeeT" 			value="0" />
			<c:set var="dlvyFeeH" 			value="0" />
	
			<table class="cart_list margintop_10">		
				<caption>장바구니</caption>
				<colgroup>
					<col width="4%">
					<col width="14%">
					<col width="*">
					<col width="12%">
					<col width="12%">
					<col width="12%">
				</colgroup>
				<tbody>
					<tr>
						<th>
						</th>
						<th class="cart_th_01"> </th>
						<th>
							상품정보
						</th>
						<th>
							판매가격
						</th>
						<th>
							수량
						</th>
						<th>
							총 금액
						</th>
					</tr>
	
			<c:forEach items="${cartList}" var="prdt1" varStatus="status">
				<c:set var="title" 			value="대화제휴" />	
				<c:if test="${prdt1.PRDT_TP eq 'S'}">
					<c:set var="title" 				value="업체배송" />	
				</c:if>
				
				<c:choose>
					<c:when test="${prdt1.STORE_ID eq storeId}"> 
						<c:set var="isFirst" 			value="0" />
					</c:when>
					<c:otherwise>
						<c:set var="storeId" 		value="${prdt1.STORE_ID}" />
						<c:set var="isFirst" 			value="1" />
					</c:otherwise>
				</c:choose>	
				
				<c:if test="${isFirst eq '1'}">
					<c:if test="${status.count ne '1'}">
						<c:set var="sumPrice" 			value="${sumPrice + totPrice}" />
						<c:set var="sumDlvyFee" 		value="${sumDlvyFee + dlvyFeeT + dlvyFeeH}" />
						<c:set var="sumQy" 			value="${sumQy + 1}" />
					</c:if>
					<c:set var="merCnt" 		value="1" />
					<c:set var="totQy" 			value="0" />
					<c:set var="totPrice" 		value="0" />
					<c:set var="dlvyPriceT" 	value="0" />
					<c:set var="dlvyPriceH" 	value="0" />
					<c:set var="dlvyFeeT" 		value="0" />
					<c:set var="dlvyFeeH" 		value="0" />
				</c:if>
						<c:set var="dlvyFeeTxt" 	value="묶음배송 가능" />	
						<c:set var="dlvyTxt" 		value="택배" />	
		
						<c:if test="${prdt1.DLVY_TP eq 'H'}"> 
							<c:set var="dlvyTxt" 			value="화물택배" />	
						</c:if>
						<c:if test="${prdt1.DLVY_MEG ne '1'}"> 
							<c:set var="dlvyFeeTxt" 		value="개별배송 상품" />	
						</c:if>
								<tr>
									<td>
									</td>
									<td class="cart_td_01">
										<div class="cart_img">
<c:choose>
						<c:when test="${fn:indexOf(prdt1.PRDT_IMG, '//') >=0 }">
							<img src="<c:out value="${prdt1.PRDT_IMG}"/>" alt="상품사진" class="cart_pic" onerror="this.src='${staticRoot}/img/sample03.jpg'"/>
</c:when>
						<c:otherwise>
											<img src="${upload}<c:out value="${prdt1.PRDT_IMG}"/>" alt="상품사진" class="cart_pic" onerror="this.src='${staticRoot}/img/sample03.jpg'"/>
	</c:otherwise>
						</c:choose>										
										</div>
									</td>
									<td>
										<p class="cart_txt01">
											<c:out value="${prdt1.PRDT_NM}"/> <fmt:formatNumber value="${dlvyFeeT}" groupingUsed="true"/>
										</p>
										<p class="cart_txt02">
											[<c:out value="${prdt1.MAKR_NM}"/>] <c:out value="${prdt1.STNDRD}"/>
										</p>
										<p class="cart_txt02">
											<c:out value="${dlvyTxt}"/> / <c:out value="${dlvyFeeTxt}"/>
										</p>
									</td>
									
									<td class="cart_price02">
										<p class="cart_txt01" style="text-align: center;">
											<fmt:formatNumber value="${prdt1.SEL_PRICE}" groupingUsed="true"/>원
										</p>
									</td>
									<td>
										<p class="cart_txt01" style="text-align: center;">
											<c:out value="${prdt1.QY}"/>
										</p>
									</td>
									<td>
										<p class="cart_price02">
											<fmt:formatNumber value="${prdt1.TOT_PRICE}" groupingUsed="true"/>원
										</p>
									</td>
									<td>
										<input type="hidden" id="rNum" value="<c:out value="${status.count}"/>"/>	
										<input type="hidden" id="storeCode<c:out value="${status.count}"/>" value="${prdt1.STORE_ID}"/>	
										<input type="hidden" id="prductCode<c:out value="${status.count}"/>" value="${prdt1.PRDT_CD}"/>	
										<input type="hidden" id="prductDtlCode<c:out value="${status.count}"/>" value="${prdt1.PRDT_DTL_CD}"/>	
										<input type="hidden" id="price<c:out value="${status.count}"/>" value="${prdt1.TOT_PRICE}"/>	
										<input type="hidden" id="dlvyFee<c:out value="${status.count}"/>" value="${dlvyFee}"/>	
										<input type="hidden" id="dlvyTp<c:out value="${status.count}"/>" value="${prdt1.DLVY_TP}"/>	
										<input type="hidden" id="dlvyFeeTp<c:out value="${status.count}"/>" value="${prdt1.DLVY_FEE_TP}"/>	
										<input type="hidden" id="invtAmt<c:out value="${status.count}"/>" value="${prdt1.INVT_AMT}"/>	
									</td>
								</tr>
					
						<c:set var="totPrice" 		value="${totPrice + prdt1.TOT_PRICE}" />
						<c:set var="totQy" 			value="${totQy + prdt1.QY}" />
						
						<c:if test="${prdt1.DLVY_TP eq 'T'}"> 
							<c:set var="dlvyPriceT" 			value="${dlvyPriceT + prdt1.TOT_PRICE}" />
							<c:if test="${merCnt eq '1' }">
								<c:set var="dlvyFeeT" 			value="${dlvyFeeT + prdt1.DLVY_FEE}" />
								<c:set var="merCnt" 			value="2" />
							</c:if>
						</c:if>									
						<c:if test="${prdt1.DLVY_TP eq 'H'}"> 
							<c:set var="dlvyPriceH" 			value="${dlvyPriceH + prdt1.TOT_PRICE}" />
							<c:set var="dlvyFeeH" 				value="${dlvyFeeH + prdt1.DLVY_FEE}" />
						</c:if>									
						<c:if test="${(prdt1.FREE_DLVY eq 'Y') and (dlvyPriceT ge prdt1.FREE_AMT)}">
							<c:set var="dlvyFeeT" 					value="0"/>
						</c:if>	
						
					<c:if test="${lastRow eq status.count}">
						<c:set var="sumPrice" 			value="${sumPrice + totPrice}" />
						<c:set var="sumDlvyFee" 		value="${sumDlvyFee + dlvyFeeT + dlvyFeeH}" />
						<c:set var="sumQy" 			value="${sumQy + 1}" />
					</c:if>
			</c:forEach>
				</tbody>
			</table>				
				<table class="cart_list_total">
					<caption>주문/결제</caption>
					<colgroup>
						<col width="100%">
					</colgroup>
					<tbody>
						<tr>
							<th>
								<input type="hidden" id="sumPrice" value="${sumPrice}"/>
								<input type="hidden" id="sumDlvyFee" value="${sumDlvyFee}"/>
								<input type="hidden" id="sumTot" value="${sumPrice + sumDlvyFee}"/>
								상품가격<label class="price_color" id ="sumPriceTxt">${sumPrice}</label>원
								<label class="icon"><img src="${staticRoot}/img/icon_plus.jpg" alt="플러스" /></label>
								배송비<label class="price_color" id="sumDlvyFeeTxt">${sumDlvyFee}</label>원
							<c:if test="${false}">		
								<label class="icon"><img src="${staticRoot}/img/icon_minus.jpg" alt="마이너스" /></label>
								포인트<label class="price_color">0</label>원
							</c:if>			
								<label class="icon"><img src="${staticRoot}/img/icon_equals.jpg" alt="합계" /></label>
								총결제금액  <label class="price_color_red" id="sumTotTxt">${sumPrice + sumDlvyFee}</label>원
							</th>
						</tr>
						
	<!-- 					
						<tr>
							<td class="c11_02_td">
								<span class="cart_total_txt">
									현재 포인트
								</span>
								<span class="cart_total_txt01">
									:
								</span>
								<span class="cart_total_txt02">
									총<label class="">999,999</label>원
								</span>
								<span class="cart_input">
									<input class="input_style01" type="text" id="mileage" name="mileage">
									<label class="join_form_btn">
										적용
									</label>
								</span>
								<span class="cart_point">
									사용포인트<label class="">2,360</label>원
								</span>
							</td>
						</tr>
	 -->					
						
					</tbody>
				</table>
				<h1 class="title_con_Type01 margintop_50">
					배송지 정보
				</h1>
				
				<form id="payFrm" name="payFrm">
					<input type="hidden" id="payTp" name="payTp" />
					<input type="hidden" id="cnt" name="cnt" value="${fn:length(cartList)}" />
					<c:forEach items="${cartList}" var="prdt1" varStatus="status">
						<input type="hidden" id="prductDtlCode<c:out value="${status.index}"/>" name="prductDtlCode<c:out value="${status.index}"/>" value="${prdt1.PRDT_DTL_CD}"/>	
					</c:forEach>	
					<table class="join_form">
						<caption>정보입력</caption>
						<colgroup>
							<col width="20%">
							<col width="80%">
						</colgroup>
						<tbody>
							<tr>
								<th>
									배송지명
								</th>
								<td>
									<input type="text" class="join_form_input03 c11_02_input_01 inAddr" readonly="readonly" id="addrNm" name="addrNm" maxlength="20" placeholder="배송지명" value="<c:out value="${addrList[0].ADDR_NM}"/>"/>	
									<span class="form_btn_Type_blue" onclick="fnMngAddr();">배송지 관리</span>
									<span class="form_btn_Type_gray" onclick="keyIn();">직접 입력</span>
								</td>
							</tr>
							<tr>
								<th>
									받으시는 분
								</th>
								<td>
									<input type="text" class="join_form_input03 inAddr" readonly="readonly" id="receiver" name="receiver" maxlength="20" placeholder="받으시는 분" value="<c:out value="${addrList[0].RECV_NM}"/>"/>	
								</td>
							</tr>
							<tr>
								<th>
									주소
								</th>
								<td>
									<input type="hidden" id="sigunguCode" name="sigunguCode" value="<c:out value="${addrList[0].SIGUNGU_CD}"/>"/>	
									<input type="hidden" id="zoneCode" name="zoneCode" value="<c:out value="${addrList[0].ZONE_CODE}"/>"/>	
									<input type="text" class="join_form_input01" id="zipCode" name="zipCode" readonly="readonly" value="<c:out value="${addrList[0].ZIP_CODE}"/>"/>	
									<span class="join_form_btn01" onclick="fnPostcode();">우편번호검색</span><br/>
									<input type="text" class="join_form_input03 margintop_5" id="address" name="address" readonly="readonly" placeholder="주소" value="<c:out value="${addrList[0].ADDRESS}"/>"/>	
									<input type="text" class="join_form_input03 margintop_5 inAddr" id="dtlAddress" name="dtlAddress"  readonly="readonly" placeholder="상세주소" value="<c:out value="${addrList[0].ADDRESS_DETAIL}"/>"/>	
								</td>
							</tr>
							<tr>
								<th>
									연락처
								</th>
								<td>
									<input type="hidden" id="mobileNo" name="mobileNo" />	
									<input type="text" class="join_form_input01 mobile inAddr" id="mobile1" maxlength="4" readonly="readonly" value="${fn:split(addrList[0].TEL_NO_1,'-')[0]}"/>
										<span class="join_form_txt">-</span>
									<input type="text" class="join_form_input01 mobile inAddr" id="mobile2" maxlength="4" readonly="readonly" value="${fn:split(addrList[0].TEL_NO_1,'-')[1]}"/>
										<span class="join_form_txt">-</span>
									<input type="text" class="join_form_input01 mobile inAddr" id="mobile3" maxlength="4" readonly="readonly" value="${fn:split(addrList[0].TEL_NO_1,'-')[2]}"/>
								</td>
							</tr>
							<tr>
								<th>
									배송요구사항
								</th>
								<td>
									<input type="text" id="rmk" name ="rmk" class="input_style04" />
								</td>
							</tr>
						</tbody>
					</table>
				</form>
				<table class="cart_list_total">
					<caption>결제 정보</caption>
					<colgroup>
						<col width="100%">
					</colgroup>
					<tbody>
						<tr>
							<td>
								<span class="cart_total_txt">
									결제 정보
								</span>
								<span class="payment_choice">
									<label class="payment_Type01 payment" id="Card">신용카드</label>
									<label class="payment_Type01 payment" id="DirectBank">실시간 계좌이체</label>
									<label class="payment_Type01 payment" id="Vbank">무통장 입금(가상계좌)</label>
								</span>
							</td>
						</tr>
					</tbody>
				</table>
				<div class="signup_agree margintop_10">
					<input type="checkbox" id="click01" class="chk agree" /><label for="click01" class="signup_txt">개인정보 공유에 대한 동의 (필수) - 제공정보는 주문 및 배송처리만을 위해 판매자에게 개인정보가 제공됩니다.</label><label class="signup_txt linkTxt" id="vDetail">[상세내용]</label> 
				</div>
				<div class="signup_box margintop_30 vOff" style="height: 180px;">
					<p>
						개인정보 공유 동의<br/>
						사이트 내에서 상품을 구매할 경우, 배송 및 거래 이행을 위해 필요한 최소한의 개인정보를 상품 판매자에게 아래와 같이 공유하고 있습니다.<br/>
						고객님께서는 정보제공에 동의하지 않으실 수 있으며, 동의하지 않으실 경우 상품구매가 제한될 수 있습니다. 
						<table class="signup_table margintop_20">
							<caption>개인정보 공유 동의</caption>
							<colgroup>
								<col width="10%">
								<col width="30%">
								<col width="30%">
								<col width="30%">
							</colgroup>
							<tbody>
								<tr>
									<th>
										제공받는자
									</th>
									<th>
										목적
									</th>
									<th>
										항목
									</th>
									<th>
										보유/이용기간
									</th>
								</tr>
								<c:set var="STORE_NM" 			value="STORE_NM" />
								<c:forEach items="${cartList}" 	var="prdt1" varStatus="status">
									<c:if test="${prdt1.STORE_NM ne STORE_NM}"> 
										<c:set var="STORE_NM" 			value="${prdt1.STORE_NM}" />
										<tr>
											<td>
												${STORE_NM}
											</td>
											<td>
												구매에 따른 배송업무 진행
											</td>
											<td>
												이름, 전화번호, 주소
											</td>
											<td>
												개인정보 수집 및 이용목적 달성시까지 보관
											</td>
										</tr>
									</c:if>	
								</c:forEach>
							</tbody>
						</table>
				</div>
				<div class="cart_btn margintop_20 marginbottom_10">
					<span class="btn_04" onclick="fnPay();">
						결제하기
					</span>
				</div>
			</div>
		</div>
	</div>