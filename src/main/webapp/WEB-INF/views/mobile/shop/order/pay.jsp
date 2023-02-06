<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/layout/include/base.jsp" %>
	<script src="http://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
	<div class=wid_1248>
		<div class="section center_content">
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
			<div class="cart_info">
			<c:set var="isFirst" 				value="1" />
			<c:set var="sumPrice" 			value="0" />
			<c:set var="sumDlvyFee" 		value="0" />
			<c:set var="storeId" 			value="0" />
			<c:set var="storeCnt" 			value="0" />
			<c:set var="sumQy" 			value="0" />
			<c:set var="merCnt" 			value="1" />
			
			<c:set var="totQy" 				value="0" />
			<c:set var="totPrice" 			value="0" />
			<c:set var="dlvyPriceT" 		value="0" />
			<c:set var="dlvyPriceH" 		value="0" />
			<c:set var="dlvyFeeT" 			value="0" />
			<c:set var="dlvyFeeH" 			value="0" />
			<c:set var="freeAmt" 			value="0" />
			<c:set var="PRDT_TP" 			value="0" />
			
			<c:set var="DLVY_FEE" 		value="0" />
			<c:set var="FREE_DLVY" 		value="0" />
			<c:set var="FREE_AMT" 		value="0" />
			<c:set var="EXTRA_FEE_TP" 	value="0" />
			<c:set var="T_ZONE1" 			value="0" />
			<c:set var="T_ZONE2" 			value="0" />
			<c:set var="T_ZONE3" 			value="0" />
			
			<c:if test="${fn:length(cartList) lt 1}">
				<table class="cart_list margintop_30">		
					<caption>장바구니</caption>
					<colgroup>
						<col width="*">
						<col width="12%">
						<col width="10%">
						<col width="22%">
					</colgroup>
					<tbody>
						<tr>
							<th>
								<input type="hidden"  id="clickTmp" class="chk"/>
								상품정보
							</th>
							<th>
								가격
							</th>
							<th>
								수량
							</th>
							<th>
								총 금액
							</th>
						</tr>
						<tr>
							<td colspan="4" height="200px;">
								<h1 class="title_Type04">
									장바구니에 상품이 없습니다.
								</h1>
							</td>
						</tr>
					</tbody>
				</table>		 
			</c:if>
			<c:forEach items="${cartList}" var="prdt1" varStatus="status">
				<c:set var="title" 					value="대화상품" />	
				<c:if test="${prdt1.PRDT_TP eq 'S'}">
					<c:set var="title" 				value="업체배송 상품" />	
				</c:if>
				<c:choose>
					<c:when test="${prdt1.STORE_ID eq storeId}"> 
						<c:set var="isFirst" 			value="0" />
					</c:when>
					<c:otherwise>
						<c:set var="isFirst" 			value="1" />
					</c:otherwise>
				</c:choose>		
				
				<c:if test="${isFirst eq '1'}">
					<c:if test="${not status.first}">
						</tbody></table>									
						<c:set var="sumPrice" 			value="${sumPrice + totPrice}" />
						<c:set var="sumDlvyFee" 		value="${sumDlvyFee + dlvyFeeT + dlvyFeeH}" />
						<c:set var="sumQy" 			value="${sumQy + 1}" />
						<table class="cart_list_total">
							<caption>장바구니</caption>
							<colgroup>
								<col width="100%">
							</colgroup>
							<tbody>
								<tr>
									<th style="text-align: right; padding-right: 20px;">
										<input type="hidden" id="totPrice_${storeCnt}" value="${totPrice}"/>	
										<input type="hidden" id="dlvyFeeT_${storeCnt}" value="${dlvyFeeT}"/>	
										<input type="hidden" id="sumPrice_${storeCnt}" value="${totPrice+dlvyFeeT+dlvyFeeH}"/>	
										<input type="hidden" id="dlvyFee_${storeCnt}" value="${DLVY_FEE}"/>	
										<input type="hidden" id="freeDlvy_${storeCnt}" value="${FREE_DLVY}"/>	
										<input type="hidden" id="freeAmt_${storeCnt}" value="${freeAmt}"/>	
										<input type="hidden" id="extraFeeTp_${storeCnt}" value="${EXTRA_FEE_TP}"/>	
										<input type="hidden" id="tZone1_${storeCnt}" value="${T_ZONE1}"/>	
										<input type="hidden" id="tZone2_${storeCnt}" value="${T_ZONE2}"/>	
										<input type="hidden" id="tZone3_${storeCnt}" value="${T_ZONE3}"/>	

										상품가격<label class="price_color"><fmt:formatNumber value="${totPrice}" groupingUsed="true"/></label> 원
										<label class="icon" style="padding: 0 10px;"><img src="${staticRoot}/img/icon_plus.jpg" alt="플러스" /></label>
										배송비<label class="price_color" id="dlvyFeeTxt_${storeCnt}"><fmt:formatNumber value="${dlvyFeeT}" groupingUsed="true"/></label> 원
										<img src="${staticRoot}/img/common/question_14.png" alt="question" onclick="openDivPop('confirmMsg<c:out value="${storeCnt}"/>');">
										<c:if test="${dlvyFeeH ne '0'}"> 
											<label class="icon" style="padding: 0 10px;"><img src="${staticRoot}/img/icon_plus.jpg" alt="플러스" /></label>
											화물 택배비<label class="price_color"><fmt:formatNumber value="${dlvyFeeH}" groupingUsed="true"/></label> 원
										</c:if>
										<br/>
										<label class="icon" style="padding: 0 10px;"><img src="${staticRoot}/img/icon_equals.jpg" alt="합계" /></label>
										결제 예정금액<label class="price_color_red" id="sumPriceTxt_${storeCnt}"><fmt:formatNumber value="${totPrice+dlvyFeeT+dlvyFeeH}" groupingUsed="true"/></label>원
									</th>
								</tr>
							</tbody>
						</table>
						<div class="confirmMsg2 vOff" id="confirmMsg<c:out value="${storeCnt}"/>">
							<div class="confirmMsg_content2">
								<h1 class="gray_title">
									배송비 안내
									<span class="close" onclick="closeDivPop('confirmMsg<c:out value="${storeCnt}"/>');" >
									</span>
								</h1>
								<table class="tbl_Type05" style="margin-top: 5px;">
									<colgroup>
										<col width="50%">
										<col width="50%">
									</colgroup>
									<tr>
										<th>기본배송비</th>
										<td><label class="join_form_check"><fmt:formatNumber value="${DLVY_FEE}" groupingUsed="true"/>원</label></td>
									</tr>
									<tr>
										<th>무료배송</th>
										<td><label class="join_form_check"><fmt:formatNumber value="${FREE_AMT}" groupingUsed="true"/>원 이상</label></td>
									</tr>
									<tr>
										<th colspan="2" style="height: 25px">추가배송비</th>
									</tr>
									<tr>
										<th>도서산간 지역</th>
										<td><label class="join_form_check">
											<c:choose>
												<c:when test="${EXTRA_FEE_TP eq 'Y'}"> 
													<fmt:formatNumber value="${T_ZONE1}" groupingUsed="true"/>
												</c:when>
												<c:otherwise>	
													0
												</c:otherwise>
											</c:choose>
											원</label></td>
									</tr>
									<tr>
										<th>제주지역</th>
										<td><label class="join_form_check">
											<c:choose>
												<c:when test="${EXTRA_FEE_TP eq 'Y'}"> 
													<fmt:formatNumber value="${T_ZONE2}" groupingUsed="true"/>
												</c:when>
												<c:otherwise>	
													0
												</c:otherwise>
											</c:choose>
											원</label></td>
									</tr>
								</table>
							</div>
						</div>	
					</c:if>
					<h1 class="title_con_Type01 margintop_30">
						<c:out value="${title}"/>
					</h1>
					<c:set var="merCnt" 		value="1" />
					<c:set var="totQy" 			value="0" />
					<c:set var="totPrice" 		value="0" />
					<c:set var="dlvyPriceT" 	value="0" />
					<c:set var="dlvyPriceH" 	value="0" />
					<c:set var="dlvyFeeT" 		value="0" />
					<c:set var="dlvyFeeH" 		value="0" />
					<table class="cart_list margintop_10">		
						<caption>장바구니</caption>
						<colgroup>
							<col width="*">
							<col width="20%">
							<col width="10%">
							<col width="22%">
						</colgroup>
						<tbody>
							<tr>
								<th>
									<input type="hidden"  id="cAll_<c:out value="${prdt1.STORE_ID}"/>" class="chk" data-value="<c:out value="${prdt1.STORE_ID}"/>"/>
									상품정보
								</th>
								<th>
									가격
								</th>
								<th>
									수량
								</th>
								<th>
									총 금액
								</th>
							</tr>
					</c:if>
						<c:set var="dlvyFeeTxt" 	value="묶음배송 가능" />	
						<c:set var="dlvyTxt" 		value="택배" />	
						<c:choose>
							<c:when test="${prdt1.DLVY_TP eq 'H'}"> 
								<c:set var="dlvyTxt" 			value="화물택배" />	
							</c:when>
							<c:when test="${prdt1.DLVY_TP eq 'C'}"> 
								<c:set var="dlvyTxt" 			value="착불배송" />	
								<c:set var="C_CNT" 			value="${C_CNT + 1}" />
							</c:when>
							<c:otherwise>
							</c:otherwise>
						</c:choose>	
						<c:if test="${prdt1.DLVY_MEG ne '1'}"> 
							<c:set var="dlvyFeeTxt" 		value="개별배송 상품" />	
						</c:if>
						<c:if test="${prdt1.STORE_ID ne storeId}"> 
							<c:set var="storeCnt" 		value="${storeCnt + 1}" />
						</c:if>
						<c:if test="${status.first}">
							<c:set var="storeId" 		value="${prdt1.STORE_ID}" />
						</c:if>
								<tr>
									<td>
										<input type="hidden" class="cart_item c_<c:out value="${prdt1.STORE_ID}"/>" id="<c:out value="${status.count}"/>" />
										<p class="cart_txt01">
											<c:out value="${prdt1.PRDT_NM}"/>
										</p>
										<p class="cart_txt02">
											[<c:out value="${prdt1.MAKR_NM}"/>] <c:out value="${prdt1.STNDRD}"/>
										</p>
										<p class="cart_txt02">
											<c:choose>
												<c:when test="${prdt1.DLVY_TP eq 'C'}"> 
													<span style="color:#b71c1c"><c:out value="${dlvyTxt}"/> / <c:out value="${dlvyFeeTxt}"/></span>
												</c:when>
												<c:otherwise>
													<c:out value="${dlvyTxt}"/> / <c:out value="${dlvyFeeTxt}"/>
												</c:otherwise>
											</c:choose>
										</p>
									</td>
									
									<td class="cart_price02">
										<c:choose>
											<c:when test="${prdt1.SALE_PRICE eq '0'}">
												<p class="cart_txt01" style="text-align: center;">
													<fmt:formatNumber value="${prdt1.SEL_PRICE}" groupingUsed="true"/> 원
												</p>
											</c:when>
											<c:otherwise>
												<p class="cart_txt01" style="text-align: center; text-decoration: line-through;color:#b71c1c;">
													<span style="color:#000000;">
														<fmt:formatNumber value="${prdt1.SEL_PRICE}" groupingUsed="true"/> 원
													</span>
												</p>
												<p class="cart_txt01" style="text-align:center; color:#b71c1c;">
													<fmt:formatNumber value="${prdt1.SALE_PRICE}" groupingUsed="true"/> 원
												</p>
											</c:otherwise>
										</c:choose>	
									</td>
									<td class="cart_price02">
										<p class="cart_txt01" style="text-align: center;">
											<fmt:formatNumber value="${prdt1.QY}" groupingUsed="true"/>
										</p>
										<input type="hidden" class="cart_count_input"  id="qy<c:out value="${status.count}"/>"  placeholder="1" value="<c:out value="${prdt1.QY}"/>"  data-value="<c:out value="${status.count}"/>"/>
									</td>
									<td>
										<p class="cart_price02">
											<fmt:formatNumber value="${prdt1.TOT_PRICE}" groupingUsed="true"/> 원
										</p>
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
								<c:choose>
									<c:when test="${addrList[0].ZONE_TP eq 0}"> 
										<c:set var="dlvyFeeT" 			value="${dlvyFeeT + prdt1.DLVY_FEE}" />
									</c:when>
									<c:when test="${addrList[0].ZONE_TP eq 1}"> 
										<c:set var="dlvyFeeT" 			value="${dlvyFeeT + prdt1.DLVY_FEE + prdt1.T_ZONE1}" />
									</c:when>
									<c:when test="${addrList[0].ZONE_TP eq 2}"> 
										<c:set var="dlvyFeeT" 			value="${dlvyFeeT + prdt1.DLVY_FEE + prdt1.T_ZONE2}" />
									</c:when>
									<c:otherwise>	
										<c:set var="dlvyFeeT" 			value="${dlvyFeeT + prdt1.DLVY_FEE}" />
									</c:otherwise>
								</c:choose>	
								<c:set var="merCnt" 			value="2" />
							</c:if>
						</c:if>			
						
						<c:set var="DLVY_FEE" 		value="${prdt1.DLVY_FEE}" />
						<c:set var="FREE_DLVY" 		value="${prdt1.FREE_DLVY}" />
						<c:set var="FREE_AMT" 		value="${prdt1.FREE_AMT}" />
						<c:set var="EXTRA_FEE_TP" 	value="${prdt1.EXTRA_FEE_TP}" />
						<c:set var="T_ZONE1" 			value="${prdt1.T_ZONE1}" />
						<c:set var="T_ZONE2" 			value="${prdt1.T_ZONE2}" />
						<c:set var="T_ZONE3" 			value="${prdt1.T_ZONE3}" />
															
						<c:if test="${prdt1.DLVY_TP eq 'H'}"> 
							<c:set var="dlvyPriceH" 			value="${dlvyPriceH + prdt1.TOT_PRICE}" />
							<c:set var="dlvyFeeH" 				value="${dlvyFeeH + prdt1.DLVY_FEE}" />
						</c:if>									
						<c:if test="${(prdt1.FREE_DLVY eq 'Y') and (dlvyPriceT ge prdt1.FREE_AMT)}">
							<c:set var="dlvyFeeT" 					value="0"/>
						</c:if>	
						<c:set var="storeId" 		value="${prdt1.STORE_ID}" />
						<c:set var="freeAmt" 		value="${prdt1.FREE_AMT}" />
						<c:set var="PRDT_TP" 		value="${prdt1.PRDT_TP}" />
					<c:if test="${status.last}">
						</tbody></table>									
						<c:set var="sumPrice" 			value="${sumPrice + totPrice}" />
						<c:set var="sumDlvyFee" 		value="${sumDlvyFee + dlvyFeeT + dlvyFeeH}" />
						<c:set var="sumQy" 			value="${sumQy + 1}" />
						<table class="cart_list_total">
							<caption>장바구니</caption>
							<colgroup>
								<col width="100%">
							</colgroup>
							<tbody>
								<tr>
									<th style="text-align: right; padding-right: 20px;">
										<input type="hidden" id="totPrice_${storeCnt}" value="${totPrice}"/>	
										<input type="hidden" id="dlvyFeeT_${storeCnt}" value="${dlvyFeeT}"/>	
										<input type="hidden" id="sumPrice_${storeCnt}" value="${totPrice+dlvyFeeT+dlvyFeeH}"/>	
										<input type="hidden" id="dlvyFee_${storeCnt}" value="${DLVY_FEE}"/>	
										<input type="hidden" id="freeDlvy_${storeCnt}" value="${FREE_DLVY}"/>	
										<input type="hidden" id="freeAmt_${storeCnt}" value="${freeAmt}"/>	
										<input type="hidden" id="extraFeeTp_${storeCnt}" value="${EXTRA_FEE_TP}"/>	
										<input type="hidden" id="tZone1_${storeCnt}" value="${T_ZONE1}"/>	
										<input type="hidden" id="tZone2_${storeCnt}" value="${T_ZONE2}"/>	
										<input type="hidden" id="tZone3_${storeCnt}" value="${T_ZONE3}"/>	
										
										상품가격<label class="price_color"><fmt:formatNumber value="${totPrice}" groupingUsed="true"/></label> 원
										<label class="icon" style="padding: 0 10px;"><img src="${staticRoot}/img/icon_plus.jpg" alt="플러스" /></label>
										배송비<label class="price_color" id="dlvyFeeTxt_${storeCnt}"><fmt:formatNumber value="${dlvyFeeT}" groupingUsed="true"/></label> 원
										<img src="${staticRoot}/img/common/question_14.png" alt="question" onclick="openDivPop('confirmMsg<c:out value="${storeCnt}"/>');">
										<c:if test="${dlvyFeeH ne '0'}"> 
											<label class="icon" style="padding: 0 10px;"><img src="${staticRoot}/img/icon_plus.jpg" alt="플러스" /></label>
											화물 택배비<label class="price_color"><fmt:formatNumber value="${dlvyFeeH}" groupingUsed="true"/></label> 원
										</c:if>
										<br/>
										<label class="icon" style="padding: 0 10px;"><img src="${staticRoot}/img/icon_equals.jpg" alt="합계" /></label>
										결제 예정금액<label class="price_color_red" id="sumPriceTxt_${storeCnt}"><fmt:formatNumber value="${totPrice+dlvyFeeT+dlvyFeeH}" groupingUsed="true"/></label>원
									</th>
								</tr>
							</tbody>
						</table>
						<div class="confirmMsg2 vOff" id="confirmMsg<c:out value="${storeCnt}"/>">
							<div class="confirmMsg_content2">
								<h1 class="gray_title">
									배송비 안내
									<span class="close" onclick="closeDivPop('confirmMsg<c:out value="${storeCnt}"/>');" >
									</span>
								</h1>
								<table class="tbl_Type05" style="margin-top: 5px;">
									<colgroup>
										<col width="50%">
										<col width="50%">
									</colgroup>
									<tr>
										<th>기본배송비</th>
										<td><label class="join_form_check"><fmt:formatNumber value="${DLVY_FEE}" groupingUsed="true"/>원</label></td>
									</tr>
									<tr>
										<th>무료배송</th>
										<td><label class="join_form_check"><fmt:formatNumber value="${FREE_AMT}" groupingUsed="true"/>원 이상</label></td>
									</tr>
									<tr>
										<th colspan="2" style="height: 25px">추가배송비</th>
									</tr>
									<tr>
										<th>도서산간 지역</th>
										<td><label class="join_form_check">
											<c:choose>
												<c:when test="${EXTRA_FEE_TP eq 'Y'}"> 
													<fmt:formatNumber value="${T_ZONE1}" groupingUsed="true"/>
												</c:when>
												<c:otherwise>	
													0
												</c:otherwise>
											</c:choose>
											원</label></td>
									</tr>
									<tr>
										<th>제주지역</th>
										<td><label class="join_form_check">
											<c:choose>
												<c:when test="${EXTRA_FEE_TP eq 'Y'}"> 
													<fmt:formatNumber value="${T_ZONE2}" groupingUsed="true"/>
												</c:when>
												<c:otherwise>	
													0
												</c:otherwise>
											</c:choose>
											원</label></td>
									</tr>
								</table>
							</div>
						</div>	
					</c:if>
				</c:forEach>

				<h1 class="title_con_Type01 margintop_50">
					주문상품 확인
				</h1>				
				<table class="cart_list_total margintop_20 border_top border_bottom">
					<caption>주문/결제</caption>
					<colgroup>
						<col width="100%">
					</colgroup>
					<tbody>
						<tr>
							<th>
								<input type="hidden" id="storeCnt" value="${storeCnt}"/>
								<input type="hidden" id="sumPrice" value="${sumPrice}"/>
								<input type="hidden" id="sumDlvyFee" value="${sumDlvyFee}"/>
								<input type="hidden" id="sumTot" value="${sumPrice + sumDlvyFee}"/>
								상품가격<label class="price_color" id ="sumPriceTxt">${sumPrice}</label>원
								<label class="icon" style="padding: 0 10px;"><img src="${staticRoot}/img/icon_plus.jpg" alt="플러스" /></label>
								배송비<label class="price_color" id="sumDlvyFeeTxt">${sumDlvyFee}</label>원
							<c:if test="${false}">		
								<label class="icon" style="padding: 0 10px;"><img src="${staticRoot}/img/icon_minus.jpg" alt="마이너스" /></label>
								포인트<label class="price_color">0</label>원
							</c:if>
							<br/>
								<label class="icon" style="padding: 0 10px;"><img src="${staticRoot}/img/icon_equals.jpg" alt="합계" /></label>
								총 결제 예정금액  <label class="price_color_red" id="sumTotTxt">${sumPrice + sumDlvyFee}</label>원
							</th>
						</tr>
<%-- 	 				
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
--%>						
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
									<span class="form_btn_Type_blue" onclick="fnMngAddr();">배송지 선택</span>
<%-- 	 
									<span class="form_btn_Type_gray" onclick="keyIn();">직접 입력</span>
--%>											
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
									<input type="hidden" id="zoneTp" name="zoneTp" value="<c:out value="${addrList[0].ZONE_TP}"/>"/>	
									<input type="hidden" id="zoneCode" name="zoneCode" value="<c:out value="${addrList[0].ZONE_CODE}"/>"/>	
									<input type="text" class="join_form_input03" style="width:70px;" id="zipCode" name="zipCode" readonly="readonly" placeholder="우편번호" value="<c:out value="${addrList[0].ZIP_CODE}"/>"/>	
<%-- 	 
									<span class="join_form_btn01" onclick="fnPostcode();">우편번호검색</span><br/>
--%>											
									<input type="text" class="join_form_input03" id="address" name="address" readonly="readonly" placeholder="주소" value="<c:out value="${addrList[0].ADDRESS}"/>"/>	
									<input type="text" class="join_form_input03 inAddr" style="margin-top: 5px;;" id="dtlAddress" name="dtlAddress"  readonly="readonly" placeholder="상세주소" value="<c:out value="${addrList[0].ADDRESS_DETAIL}"/>"/>	
								</td>
							</tr>
							<tr>
								<th>
									연락처
								</th>
								<td>
									<input type="hidden" id="mobileNo" name="mobileNo" />	
									<input type="text" class="join_form_input01 mobile inAddr" id="mobile1" style="width:55px;" maxlength="4" readonly="readonly" value="${fn:split(addrList[0].TEL_NO_1,'-')[0]}"/>
										<span class="join_form_txt">-</span>
									<input type="text" class="join_form_input01 mobile inAddr" id="mobile2" style="width:60px;" maxlength="4" readonly="readonly" value="${fn:split(addrList[0].TEL_NO_1,'-')[1]}"/>
										<span class="join_form_txt">-</span>
									<input type="text" class="join_form_input01 mobile inAddr" id="mobile3" style="width:60px;" maxlength="4" readonly="readonly" value="${fn:split(addrList[0].TEL_NO_1,'-')[2]}"/>
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
							<tr>
								<th>
									기타요청 사항
								</th>
								<td>
									<input type="checkbox"  id="clickTax" name="clickTax" <c:if test="${userSession.TAXBILL_AT eq 'Y'}">checked="checked"</c:if>/><label for="clickTax"> 세금계산서 발행요청</label>
									<div class="signup_agree" style="line-height: 150%;">
										<p class="alarm_txt">- 주문결제 완료 이후 <span style="color:red;">정보 > 내정보</span> 화면에서 세금계산서 발행에 필요한 내역을 입력해 주세요.<span style="color:red;">[최초 1 회만 입력]</span></p>
										<p class="alarm_txt">- <span style="color:red;">신용카드 결제시</span> 카드 명세표가 세금계산서와 동일한 효력을 가지므로 <span style="color:red;">계산서가 발행이 되지 않습니다</span>.</p>
									</div>
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
									<label class="payment_Type01 payment" id="wcard">신용카드</label>
<%-- 									
									<label class="payment_Type01 payment" id="bank">실시간 계좌이체</label>
--%>											
 									<label class="payment_Type01 payment" id="vbank">무통장 입금(가상계좌)</label>
								</span>
							</td>
						</tr>
					</tbody>
				</table>
				<div class="signup_agree margintop_10">
					<label for="click01" class="signup_txt" style="font-size: 11px;">
						<input type="checkbox" id="click01" class="chk agree" />
						개인정보 공유에 대한 동의 (필수) - 제공정보는 주문 및 배송처리만을 위해 판매자에게 개인정보가 제공됩니다.
						<span class="signup_txt linkTxt" id="vDetail" style="font-size: 11px;">[상세내용]</span> 
					</label>
				</div>
				<div class="signup_box margintop_30 vOff" style="height: 180px;">
					<p style="font-size: 10px;">
						개인정보 공유 동의<br/>
						사이트 내에서 상품을 구매할 경우, 배송 및 거래 이행을 위해 필요한 최소한의 개인정보를 상품 판매자에게 아래와 같이 공유하고 있습니다.<br/>
						고객님께서는 정보제공에 동의하지 않으실 수 있으며, 동의하지 않으실 경우 상품구매가 제한될 수 있습니다.
					</p> 
						<table class="signup_table margintop_20">
							<caption>개인정보 공유 동의</caption>
							<colgroup>
								<col width="15%">
								<col width="30%">
								<col width="25%">
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
			var zoneTp = 0;
			for(var i=0; i<obj.length; i++){
				if(obj[i].name == 'zoneTp') zoneTp = obj[i].value;
				$("#"+obj[i].name).val(obj[i].value);
			}
			$('#sumDlvyFee').val(0);
			for(var x=1; x<=$('#storeCnt').val(); x++){
				var freeDlvy = $('#freeDlvy_'+x).val();
				var freeAmt = eval($('#freeAmt_'+x).val());
				var totPrice = eval($('#totPrice_'+x).val());
				var extraFeeTp = $('#extraFeeTp_'+x).val();
				var isFree = (freeDlvy == 'Y' && totPrice > freeAmt) ? true : false;
				if(!isFree){
					var dlvyFee = eval($('#dlvyFee_'+x).val());
					var extDlvyFee = 0;
					if('Y' == extraFeeTp){
						if(zoneTp == 0){
							extDlvyFee = 0;
						}else if(zoneTp ==1){
							extDlvyFee = eval($('#tZone1_'+x).val());
						}else if(zoneTp ==2){
							extDlvyFee = eval($('#tZone2_'+x).val());
						}
					}
					var dlvy = (dlvyFee + extDlvyFee);
					$('#sumDlvyFee').val(eval($('#sumDlvyFee').val()) + dlvy);
					
					dlvy = dlvy + '';
					var sum = (totPrice + dlvyFee + extDlvyFee)+'';
					$('#dlvyFeeT_'+x).val(dlvy);
					$('#dlvyFeeTxt_'+x).text(dlvy.replace(/(\d)(?=(\d\d\d)+(?!\d))/g, '$1,')+'');
					$('#sumPriceTxt_'+x).text(sum.replace(/(\d)(?=(\d\d\d)+(?!\d))/g, '$1,')+'');
				}
			}
			var sumDlvyFee = $('#sumDlvyFee').val();
			var sumTot = eval($('#sumPrice').val()) + eval($('#sumDlvyFee').val())+'';
			$('#sumDlvyFeeTxt').text(sumDlvyFee.replace(/(\d)(?=(\d\d\d)+(?!\d))/g, '$1,')+'');
			$('#sumTotTxt').text(sumTot.replace(/(\d)(?=(\d\d\d)+(?!\d))/g, '$1,')+'');
		}
<%-- 	 
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
--%>			
		function fnPay(){
			if( dupClick1 ) {
				alert("처리중 입니다. 잠시만 기다려주세요.");
				return false;
			}
			if(_BT.isEmptyById("zipCode", "배송지정보를 입력해 주세요.")) return false;
			if(_BT.isEmptyById("payTp",   "결제방법을 선택해 주세요.")) return false;
			if(!_BT.isChecked("click01", 	"개인정보 공유에 동의해 주세요.")) return false;
			if(!confirm("상품을 구매 하시겠습니까?")) {
				return false;
			}
			$("#mobileNo").val(_BT.getJoinData("-", new Array("mobile1","mobile2","mobile3")));
			snedGAnaly({'type':'doPay'});
			_BT.actFormSubmit("payFrm", "POST", _BT.SHOP.URL.Order.DoMpay); 
		}
		function openDivPop(id){
			$('#'+id).removeClass('vOff'); 
		}
		function closeDivPop(id){
			$('#'+id).addClass('vOff');
		}
	</script>
	<script type="text/javascript">
		function snedGAnaly(sAction) { 
			switch(sAction.type) {  
				case 'doPay':       
					ga('create', 'UA-97902014-1');
					ga('require', 'ec');    
					<c:forEach items="${cartList}" var="prdt1" varStatus="status">
						ga('ec:addProduct', {
							  'id': '${prdt1.PRDT_DTL_CD}',
							  'name': '${prdt1.PRDT_NM}',
							  'price': '${prdt1.SEL_PRICE}',
							  'brand': '${prdt1.MAKR_NM}',
							  'category': '${prdt1.CATEG_NM}',
							  'variant': '${prdt1.STNDRD}' ,
							  'position': '${status.count}' ,
							  'quantity': '${prdt1.QY}'
						});
					</c:forEach>
					ga('ec:setAction', 'checkout');
					ga('send', 'pageview');
				break;
			}
		}
	</script>	