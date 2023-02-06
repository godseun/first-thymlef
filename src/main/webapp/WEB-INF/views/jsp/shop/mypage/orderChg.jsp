<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/layout/include/base.jsp" %>
	<c:set var="devy_done" 	value="no" />	
	<c:set var="jobTxt" 			value="" />	
	<c:choose>
		<c:when test="${pageParm.procType eq 'ordrcan'}"> 
			<c:set var="jobTxt" 			value="취소" />
		</c:when>
		<c:when test="${pageParm.procType eq 'ordrchg'}"> 
			<c:set var="jobTxt" 			value="교환" />
			<c:set var="devy_done" 	value="yes" />	
		</c:when>
		<c:when test="${pageParm.procType eq 'ordrrtn'}"> 
			<c:set var="jobTxt" 			value="반품" />
			<c:set var="devy_done" 	value="yes" />	
		</c:when>
	</c:choose>	
	<script type="text/javascript">
		var dupClick1 = false;
		$(function(){  
			$("#selRmk").on("change", function() {
				var val = eval($("#selRmk option:selected").val());
				var R_TOT_PRICE= eval($('#R_TOT_PRICE').val());
				var R_REF_FEE 	= eval($('#R_REF_FEE').val());
				var A_TOT_PRICE= eval($('#A_TOT_PRICE').val());
				var S_FREE_AMT	= eval($('#S_FREE_AMT').val());
				var S_DEVY_FEE 	= eval($('#S_DEVY_FEE').val());
				var S_TOTPRICE 	= eval($('#S_TOTPRICE').val());
				var S_RTN_FEE 	= eval($('#S_RTN_FEE').val());
				var S_ZONE_TP 	= $('#S_ZONE_TP').val();
				var S_EXTRA_FEE_TP 	= $('#S_EXTRA_FEE_TP').val();
				var S_EXT_ZONE	= 0;
				var minusAmt		= 0;
				var amtTxt 		= '';	
				var amtTxt2 		= '';	
				if(val > 200){
					if(S_EXTRA_FEE_TP == 'Y'){
						if(S_ZONE_TP == 1)
							S_EXT_ZONE = eval($('#S_T_ZONE1').val());
						else if(S_ZONE_TP == 2)
							S_EXT_ZONE = eval($('#S_T_ZONE2').val());
					}
					if(S_FREE_AMT > A_TOT_PRICE){
						minusAmt = (S_RTN_FEE + S_EXT_ZONE);				
					}
					$('.refFee').addClass("vOff");
					$('.sumFee').removeClass("vOff");
					$('.calFee').removeClass("vOff");
					amtTxt2 = minusAmt + "";
					$("#calDlvyFeeTxt").text(amtTxt2.replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,"));
					amtTxt = (R_TOT_PRICE - minusAmt) + "";
					$("#sumTotTxt").text(amtTxt.replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,"));
				}else{
					$('.refFee').removeClass("vOff");
					$('.sumFee').addClass("vOff");
					$('.calFee').addClass("vOff");
					
					amtTxt = (S_TOTPRICE+R_REF_FEE)+"";
					$("#sumTotTxt").text(amtTxt.replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,"));
					
					amtTxt2 = R_REF_FEE + "";
					$("#refFeeTxt").text(amtTxt2.replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,"));
				}	
				if(eval(amtTxt) < 0){
					$('.btn_back_02').addClass("vOff");
					alert('추가 배송비가 환불 금액 보다 많습니다..\n\n다시 확인 부탁 드립니다.');
				}else{
					$('.btn_back_02').removeClass("vOff");
				}
	    	});
		});
		function fnNextStep(){
			if( dupClick1 ) {
				alert("요청하신 내역 처리 중 입니다. 잠시만 기다려주세요.");
				return false;
			}
			if(_BT.isEmptyById('selRmk',    '<c:out value="${jobTxt}"/>사유를 선택해 주세요.')) return false;
			<c:if test="${ pageParm.paymethod eq 'VBank' and ordrMst.TOTPRICE gt 0}">
				if(_BT.isEmptyById('refundbankcode',	'환불 받으실 은행을 선택해 주세요.')) return false;
				if(_BT.isEmptyById('refundacctname',	'환불 받으실 계좌의 예금주를 입력해 주세요.')) return false;
				if(_BT.isEmptyById('refundacctnum',	'환불 받으실 계좌 번호를 입력해 주세요.')) return false;
			</c:if>
			if(_BT.isEmpty($('#chrRmk').val()))
				$('#chrRmk').val($("#selRmk option:selected").text());
			
			if(!confirm('예정금액을 확인 하신뒤 상품을 <c:out value="${jobTxt}"/> 하시겠습니까?')){
				return false;
			}
			dupClick1 = true; 
			_BT.ajaxCallbackSubmit('frm',  _BT.SHOP.URL.Order.DoOrderChg, 
			function(data) {
				dupClick1 = false;
				if($(data).size() > 0) { 
					if(_BT.isEquals(data.code, 'success')){
						alert(data.msg);
						_BT.moveUrl(_BT.SHOP.URL.Order.OrderChgList);
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
	</script>
	<div class="section" style="min-height:1000px;">
		<h1 class="title_Type03">
			<c:out value="${jobTxt}"/>신청
			<div class="sub_location">
				<div class="list_location01">
					<span class="txt01">구매내역</span>
					<span class="arrow"><img src="${staticRoot}/img/bl_01.jpg" alt=">" /></span>
					<span class="last_txt"><c:out value="${jobTxt}"/> 신청</span>
				</div>
			</div>
		</h1>
		<form id="frm" name="frm">
			<input type="hidden" id="procType" name="procType" value="<c:out value="${pageParm.procType}"/>">
			<input type="hidden" id="ordrId" name="ordrId" value="<c:out value="${pageParm.ordrId}"/>">
			<input type="hidden" id="oId" name="oId" value="<c:out value="${pageParm.oId}"/>">
			<input type="hidden" id="cnt" name="cnt" value="<c:out value="${pageParm.cnt}"/>">
			<div class="">
				<h1 class="title_con_Type01 margintop_30">
					<c:out value="${jobTxt}"/>신청 상품
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
								대화코드
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
						<c:set var="isFirst" 				value="1" />
						<c:set var="mRow" 				value="0" />
						<c:set var="color" 		 		value="" />
						<c:set var="t_reAmt" 			value="0" />
						<c:set var="exDlvyFee" 		value="0" />
						<c:set var="cnt" 					value="0" />
						<c:set var="store_id" 			value="0" />
						<c:set var="reDlvyFee" 		value="0" />
						<c:set var="T_STORE_ID" 		value="0" />
						<c:set var="T_DEVY_FEE" 		value="0" />
						<c:set var="O_DEVY_TP" 			value="0" />

						<c:set var="S_DLVY_FEE" 			value="0" />
						<c:set var="S_FREE_AMT" 		value="0" />
						<c:set var="S_T_ZONE1" 			value="0" />
						<c:set var="S_T_ZONE2" 			value="0" />
						<c:set var="S_RTN_FEE" 			value="0" />
						<c:set var="S_ECHG_FEE" 			value="0" />
						<c:set var="S_CNT_PRDT" 		value="0" />
						<c:set var="S_SUM_PRICE" 		value="0" />
						<c:set var="S_DEVY_FEE" 			value="0" />
						<c:set var="S_TOT_PRICE"	 	value="0" />
						<c:set var="S_FREE_DLVY"		value="N" />
						<c:set var="S_EXTRA_FEE_TP"	value="Y" />
						
						<c:set var="S_APPN_RTN_HDRY"	value="N" />
						<c:set var="S_RTN_HDRY"			value="" />
						<c:set var="S_RTN_ZIP_CD"		value="" />
						<c:set var="S_RTN_ADRES"		value="" />
						<c:set var="S_RTN_ADRES_DTL"	value="" />
						<c:forEach items="${ordrList}" var="ordr" varStatus="status">
							<c:if test="${ordr.CHK ne '0' and store_id eq '0'}"> 
								<c:set var="store_id" 			value="${ordr.STORE_ID}" />
							</c:if>
						</c:forEach>
						<c:forEach items="${ordrList}" var="ordr" varStatus="status">
							<c:set var="color" 		 		value="style='color:#000000'" />
							<c:choose>
								<c:when test="${ordr.STORE_ID ne T_STORE_ID}">
									<c:set var="T_STORE_ID" 		value="${ordr.STORE_ID}" />
									<c:forEach items="${ordrStrMst}" var="ordr2" varStatus="status2">
										<c:if test="${ordr.STORE_ID eq ordr2.STORE_ID}">
											<c:set var="isFirst" 					value="1" />
											<c:set var="mRow" 					value="${ordr2.CNT_PRDT}" />
											<c:set var="T_DEVY_FEE" 		value="${ordr2.DEVY_FEE}" />
											<c:set var="O_DEVY_TP" 			value="${ordr2.DEVY_TP}" />
											
											<c:if test="${store_id eq ordr2.STORE_ID}"> 
												<c:set var="S_DLVY_FEE" 			value="${ordr2.DLVY_FEE}" />
												<c:set var="S_FREE_AMT" 		value="${ordr2.FREE_AMT}" />
												<c:set var="S_T_ZONE1" 			value="${ordr2.T_ZONE1}" />
												<c:set var="S_T_ZONE2" 			value="${ordr2.T_ZONE2}" />
												<c:set var="S_RTN_FEE" 			value="${ordr2.RTN_FEE}" />
												<c:set var="S_ECHG_FEE" 			value="${ordr2.ECHG_FEE}" />
												<c:set var="S_CNT_PRDT" 		value="${ordr2.CNT_PRDT}" />
												<c:set var="S_SUM_PRICE" 		value="${ordr2.SUM_PRICE}" />
												<c:set var="S_DEVY_FEE" 			value="${ordr2.DEVY_FEE}" />
												<c:set var="S_TOT_PRICE"	 	value="${ordr2.TOT_PRICE}" />
												<c:set var="S_FREE_DLVY"		value="${ordr2.FREE_DLVY}" />
												<c:set var="S_EXTRA_FEE_TP"	value="${ordr2.EXTRA_FEE_TP}" />
												
												<c:set var="S_APPN_RTN_HDRY"	value="${ordr2.APPN_RTN_HDRY}" />
												<c:set var="S_RTN_HDRY"			value="${ordr2.RTN_HDRY}" />
												<c:set var="S_RTN_ZIP_CD"		value="${ordr2.RTN_ZIP_CD }" />
												<c:set var="S_RTN_ADRES"		value="${ordr2.RTN_ADRES }" />
												<c:set var="S_RTN_ADRES_DTL"	value="${ordr2.RTN_ADRES_DTL }" />
											</c:if>
										</c:if>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<c:set var="isFirst" 					value="0" />
								</c:otherwise>
							</c:choose>
							<c:if test="${ordr.CHK ne '0'}"> 
								<c:set var="cnt" 					value="${mRow}" />
								<c:set var="t_reAmt" 			value="${t_reAmt + ordr.SUM_PRICE}" />
								<c:set var="color" 		 		value="style='color:#b71c1c'" />		
							</c:if>
							<tr>
								<td>
									<p ${color}>
										${status.count}
									</p>
								</td>
								<td>
									<c:if test="${ordr.CHK ne '0'}"> 	
										<p ${color}>	
											<c:out value="${jobTxt}"/>
										</p>
										<input type="checkbox" style="display: none;" checked="checked"  disabled="disabled" class="ordr_item" id="<c:out value="${ordr.O_ID}"/>" data-type="<c:out value="${ordr.O_ID}"/>" data-value="<c:out value="${ordr.STTUS}"/>"/>
									</c:if>
								</td>
								<td>
									<p class="cart_txt01" ${color}>
										<c:out value="${ordr.PRDT_NM}"/>
									</p>
									<p class="cart_txt02" ${color}>
										[ <c:out value="${ordr.MAKR_NM}"/> ] <c:out value="${ordr.STNDRD}"/>
									</p>
								</td>
								<td class="cart_td_01" ${color}>
									<c:out value="${ordr.PRDT_DTL_CD}"/>
								</td>
								<td class="cart_td_01" ${color}>
									<fmt:formatNumber value="${ordr.QY}" groupingUsed="true"/>개
								</td>
								<td>
									<p class="cart_price02" ${color}>
										<fmt:formatNumber value="${ordr.SUM_PRICE}" groupingUsed="true"/>원
									</p>
								</td>
								<c:if test="${isFirst eq '1'}">
									<td rowspan="${mRow}">
										<p class="cart_txt03">${O_DEVY_TP}</p>
										<c:choose>
											<c:when test="${T_DEVY_FEE eq 0}">
												<p class="cart_txt03"> [무료배송] </p>
											</c:when>
											<c:otherwise>
												<p class="cart_txt03"> [<fmt:formatNumber value="${T_DEVY_FEE}" groupingUsed="true"/>원] </p>
											</c:otherwise>
										</c:choose>	
									</td>
								</c:if>
								<td> 
									<p data-value="TXT" data-type="<c:out value="${ordr.O_ID}"/>" ${color}>
									<c:out value="${ordr.STTUS_TXT}"/>
									</p>
								</td>
							</tr>
						</c:forEach>
						<c:set var="exDlvyFee" 		value="0" />
						<c:set var="A_TOT_PRICE" 	value="${S_TOT_PRICE - t_reAmt}" />
						<c:if test="${S_DEVY_FEE eq 0 }">
							<c:choose>
								<c:when test="${S_FREE_DLVY eq 'Y'}">
									<c:if test="${S_FREE_AMT gt A_TOT_PRICE}">
										<c:set var="exDlvyFee" 		value="${S_DLVY_FEE}" />
										<c:if test="${S_EXTRA_FEE_TP eq 'Y'}">
											<c:choose>
												<c:when test="${ordrMst.ZONE_TP eq '1'}">
													<c:set var="exDlvyFee" 		value="${exDlvyFee + S_T_ZONE1}" />
												</c:when>
												<c:when test="${ordrMst.ZONE_TP eq '2'}">
													<c:set var="exDlvyFee" 		value="${exDlvyFee + S_T_ZONE2}" />
												</c:when> 
											</c:choose>	
										</c:if>
									</c:if>
								</c:when>
								<c:otherwise>	
									<c:set var="exDlvyFee" 		value="${S_DLVY_FEE}" />
									<c:if test="${S_EXTRA_FEE_TP eq 'Y'}">
										<c:choose>
											<c:when test="${ordrMst.ZONE_TP eq '1'}">
												<c:set var="exDlvyFee" 		value="${exDlvyFee + S_T_ZONE1}" />
											</c:when>
											<c:when test="${ordrMst.ZONE_TP eq '2'}">
												<c:set var="exDlvyFee" 		value="${exDlvyFee + S_T_ZONE2}" />
											</c:when> 
										</c:choose>	
									</c:if>
								</c:otherwise>
							</c:choose>		
						</c:if>
						<c:set var="refFee" 			value="0" />
						<c:set var="reDlvyFee" 	value="0" />
						<c:if test="${pageParm.cnt eq S_CNT_PRDT}">
							<c:set var="refFee" 		value="${S_DEVY_FEE}" />
							<c:if test="${pageParm.procType eq 'ordrcan'}">
								<c:set var="reDlvyFee" 		value="${S_DEVY_FEE}" />
								<c:set var="exDlvyFee" 		value="0" />
							</c:if>				
						</c:if>				
					</tbody>
				</table>
				<table class="cart_list_total margintop_20 border_top border_bottom">
					<caption>결제 금액</caption>
					<colgroup>
						<col width="15%">
						<col width="85%">
					</colgroup>
					<tbody>
						<tr>
							<c:choose>
								<c:when test="${ordrMst.TOTPRICE eq 0}">
									<th style="text-align: center;" colspan="2">
										결제 금액<label class="price_color">입금대기 중</label>
									</th>
								</c:when>
								<c:otherwise>
									<th style="text-align: right;">
										결제 금액<label class="price_color_red" id="payTotTxt"><fmt:formatNumber value="${ordrMst.TOTPRICE}" groupingUsed="true"/></label>원
									</th>
									<th>
										선택 상품가격<label class="price_color" id="sumPriceTxt"><fmt:formatNumber value="${t_reAmt}" groupingUsed="true"/>원</label>
										<c:if test="${exDlvyFee gt 0 }">
											<span class="sumFee">
												<label class="icon"><img src="${staticRoot}/img/icon_minus.jpg" alt="빼기" /></label>
												추가 배송비<label class="price_color" id="sumDlvyFeeTxt"><fmt:formatNumber value="${exDlvyFee}" groupingUsed="true"/></label>원
											</span>	
										</c:if>
										<span class="calFee vOff">
											<label class="icon"><img src="${staticRoot}/img/icon_minus.jpg" alt="빼기" /></label>
											귀책 <c:out value="${jobTxt}"/>비<label class="price_color" id="calDlvyFeeTxt"></label>원
										</span>
										<span class="refFee vOff">
											<label class="icon"><img src="${staticRoot}/img/icon_plus.jpg" alt="더하기" /></label>
											 환불배송비<label class="price_color" id="refFeeTxt"></label>원
										</span>
										<c:if test="${reDlvyFee gt 0 }">
											<label class="icon"><img src="${staticRoot}/img/icon_plus.jpg" alt="더하기" /></label>
											 배송비<label class="price_color" id="refDlvyFeeTxt"><fmt:formatNumber value="${reDlvyFee}" groupingUsed="true"/></label>원
										</c:if>
										<label class="icon"><img src="${staticRoot}/img/icon_equals.jpg" alt="합계" /></label>
										<c:out value="${jobTxt}"/> 예정금액<label class="price_color_red" id="sumTotTxt"><fmt:formatNumber value="${t_reAmt - exDlvyFee + reDlvyFee}" groupingUsed="true"/></label>원
										<input type="hidden" id="S_EXTRA_FEE_TP" 	value="<c:out value="${S_EXTRA_FEE_TP}"/>">
										<input type="hidden" id="A_TOT_PRICE" 	value="<c:out value="${A_TOT_PRICE}"/>">
										<input type="hidden" id="R_TOT_PRICE" 	value="<c:out value="${t_reAmt - exDlvyFee + reDlvyFee}"/>">
										<input type="hidden" id="R_REF_FEE" 	value="<c:out value="${refFee}"/>">
									</th>
								</c:otherwise>
							</c:choose>	
						</tr>
					</tbody>
				</table>
				<div class="signup_agree margintop_10">
					<p class="alarm_txt margintop_5">※ 부분<c:out value="${jobTxt}"/>의 경우 해당 업체의 <span class="redCr bTxt" ><c:out value="${jobTxt}"/> 후</span> 결제잔액이 <span class="redCr bTxt" ><fmt:formatNumber value="${ordrStrMst[0].FREE_AMT}" groupingUsed="true"/></span>원 미만인 경우 추가 택배비가 발생 할 수 있습니다.</p>
					<c:if test="${ pageParm.paymethod ne 'Card' and ordrMst.TOTPRICE gt 0}">
						<p class="alarm_txt margintop_5">※ 신청 후 실제 입금까지 업무일 기준 최대 2일이 소요됩니다.</p>
					</c:if>
				</div>
				<c:choose>
					<c:when test="${(t_reAmt - exDlvyFee + reDlvyFee) gt 0}">
						<h1 class="title_con_Type01 margintop_30">
							<c:out value="${jobTxt}"/> 신청 사유
						</h1>
						<div class="return_select">
							<select class="" id="selRmk" name="selRmk">
								<option value=""><c:out value="${jobTxt}"/>사유선택</option>
								<option value="201">구매 의사 없어짐</option>
								<option value="202">상품을 잘못 선택함</option>
								<c:if test="${devy_done eq 'yes'}">
									<option value="101">상품이 상품상세 정보와 틀림</option>
									<option value="102">배송된 상품의 파손/하자/포장 불량</option>
									<option value="103">상품이 도착하고 있지 않음</option>
									<option value="104">다른 상품이 잘못 배송됨</option>
									<option value="209">기타(구매자 책임사유)</option>
									<option value="109">기타(판매자 책임사유)</option>
								</c:if>
								<c:if test="${devy_done eq 'no'}">
									<option value="300">기타</option>
								</c:if>
							</select>
							<input type="text" class="input_style14 marginleft_10" id ="chrRmk" name="chrRmk" placeholder="상세내용 입력">
						</div>
						<c:if test="${devy_done eq 'yes'}">
							<div class="signup_agree margintop_10">
								<p class="alarm_txt">※ <span class="redCr bTxt" >신청사유</span>에 따라 왕복 택비비 또는 편도 택배비가 발생 할 수 있습니다.</p>
							</div>
							<h1 class="title_con_Type01 margintop_30">
								<c:out value="${jobTxt}"/> 방법선택
							</h1>
							<div class="return_select">
								<select class="" id="chrDlvy" name="chrDlvy">
									<option value="1">반송택배 요청</option>
									<option value="2">직접반송 예정</option>
								</select>
							</div>
							<div class="signup_agree margintop_10">
								<input type="hidden" id="S_T_ZONE1" 	value="<c:out value="${S_T_ZONE1}"/>">
								<input type="hidden" id="S_T_ZONE2" 	value="<c:out value="${S_T_ZONE2}"/>">
								<input type="hidden" id="S_DLVY_FEE" 	value="<c:out value="${S_DLVY_FEE}"/>">
								<input type="hidden" id="S_DEVY_FEE" 	value="<c:out value="${S_DEVY_FEE}"/>">
								<input type="hidden" id="S_FREE_AMT" 	value="<c:out value="${S_FREE_AMT}"/>">
								<input type="hidden" id="S_RTN_FEE"		value="<c:out value="${S_RTN_FEE}"/>">
								<input type="hidden" id="S_ECHG_FEE"	value="<c:out value="${S_ECHG_FEE}"/>">
								<input type="hidden" id="S_TOTPRICE" 	value="<c:out value="${t_reAmt}"/>">
								<input type="hidden" id="S_ZONE_TP" 		value="<c:out value="${ordrMst.ZONE_TP}"/>">
								<c:if test="${S_APPN_RTN_HDRY eq 'Y'}">
									<p class="alarm_txt margintop_5">※ 판매자 지정반품택배 : <span class="redCr bTxt" ><c:out value="${S_RTN_HDRY}"/></span>  - 임의 택배사로 발송시 수신거부 될 수 있습니다.</p>
								</c:if>
								<p class="alarm_txt margintop_5">※ 반송 주소 : ( <c:out value="${S_RTN_ZIP_CD}"/> ) <c:out value="${S_RTN_ADRES}"/> <c:out value="${S_RTN_ADRES_DTL}"/></p>
							</div>
						</c:if>
						<c:if test="${ pageParm.paymethod eq 'VBank' and ordrMst.TOTPRICE gt 0}">
							<h1 class="title_con_Type01 margintop_30">
								환불 정보 입력
							</h1>
							<div class="return_select2"> 
								<select class="" id="refundbankcode" name="refundbankcode">
									<option value="">은행 선택</option>
									<option value="04">국민은행</option>
									<option value="03">기업은행</option>
									<option value="88">신한은행</option>
									<option value="20">우리은행</option>
									<option value="05">외환은행</option>
									<option value="81">하나은행</option>
									<option value="05">하나은행 (구 외환)</option>
									<option value="11">농협</option>
									<option value="17">수협</option>
									<option value="38">강원은행</option>
									<option value="39">경남은행</option>
									<option value="34">광주은행</option>
									<option value="31">대구은행</option>
									<option value="32">부산은행</option>
									<option value="37">전북은행</option>
									<option value="35">제주은행</option>
									<option value="23">SC제일은행</option>
								</select>
								<input type="text" class="input_style03 marginleft_10" id ="refundacctname" name="refundacctname" placeholder="예금주">
								<input type="text" class="input_style02 marginleft_10" id ="refundacctnum" name="refundacctnum" placeholder="계좌번호">
							</div>
						</c:if>
						<c:if test="${fn:length(ordrList) ge 1 }">
							<div class="icon_btn_Group margintop_30">
								<a href="javascript:;" class="btn_back_02" onclick="fnNextStep();">
									신 청
								</a>
							</div>
						</c:if>	
					</c:when>
					<c:otherwise>
						<div class="signup_agree margintop_10">
							<p class="alarm_txt margintop_5">※ <span class="redCr bTxt" >예정금액</span>이 <span class="redCr bTxt" >0원</span> 보다 작기 때문에 취소 신청을 하실 수 없습니다.</p>
						</div>
					</c:otherwise>
				</c:choose>	
			</div>
		</form>
	</div>
