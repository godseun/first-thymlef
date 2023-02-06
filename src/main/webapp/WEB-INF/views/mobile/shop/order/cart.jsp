<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/layout/include/base.jsp" %>
	<script type="text/javascript">
		var dupClick1 = false;
		$(function(){        
				if('${msg}' != ''){
					alert('${msg}');
				}
				_BT.Reg.Number('cart_count_input');
				$('.chk').on('change', function() {
		    		var id = $(this).data('value');
		    		if( $(this).prop('checked')){
		    			$('.c_'+id).prop('checked',true);
		    		}else{
		    			$('.c_'+id).prop('checked', false) ;
		    		}
		    	});
		    	$('.cart_count_input').on('change', function() {
		    		var id = $(this).data('value');
					$( '#b_' + id ).addClass('bOn');
		    	});
		    	$('.goDetail').on('click', function() {
					$("#mStore").val($(this).data('value'));
					_BT.actFormSubmit("tFrm", "POST",_BT.SHOP.URL.Search.mSearch); 
		    	});
		    	$('.click_btn07').on('click', function() {
		    		var id = $(this).data('value');
		    		var qy = $('#qy'+id).val();
		    		var storeCode = $('#storeCode'+id).val();
		    		var prductCode = $('#prductCode'+id).val();
		    		var prductDtlCode = $('#prductDtlCode'+id).val();
		    		var invtAmt = $('#invtAmt'+id).val();
		    		if(qy == null || qy=='' || eval(qy) == '' || eval(qy) < 1){
						alert("수량을 정확히 입력해 주세요.");
						$('#qy'+id).focus();
						return false;
		    		}
		    		if( eval(qy) > eval(invtAmt) ){
		    			alert('장바구니 수량이 재고수량보다 큽니다\n\n해당 제품의 재고수량은 ' +invtAmt+ '개 입니다.');
						return false;
		    		}	
					if( dupClick1 ) {
						alert("처리중 입니다. 잠시만 기다려주세요.");
						return false;
					}
					if(!confirm("해당 상품을 수량을 변경 하시겠습니까?")) {
						return false;
					}

					dupClick1 = true; 
					_BT.ajaxDataSubmit("post", _BT.SHOP.URL.Order.SetCart, 
												{storeCode : storeCode,
												prdt_cd : prductCode,
												p_cd0 : prductDtlCode,
												p_qy0 : qy,
												cnt : 1	}, 
						function(data) {
						dupClick1 = false;
						if($(data).size() > 0) { 
							if(_BT.isEquals(data.code, "success")){
								alert(data.msg);
				                document.location.reload();
							}else{
								alert(data.msg);	
								return false;
							}
						}
					},
					function(xhr, status, error) {
						dupClick1 = false; 
						$("#ckSmsState").text("처리중 오류가 발생했습니다.\n\n다시 확인 부탁 드립니다.");
						$("#ckSmsState").css("color","#fe0000");	
					});	
		    	});
	    });
	    function mForm(prc,row){
			$('#frm').empty();
			$('#frm').append($('<input/>', {
			    type: 'hidden',
			    id: 'procType',
			    name: 'procType',
			    value : prc
			}));
			$('#frm').append($('<input/>', {
			    type: 'hidden',
			    id: 'cnt',
			    name: 'cnt',
			    value : '1'
			}));
			$('#frm').append($('<input/>', {
			    type: 'hidden',
			    id: 'prductDtlCode0',
			    name: 'prductDtlCode0',
			    value : $('#prductDtlCode'+row).val()
			}));
	    }
	    function delCart(row){
			if( dupClick1 ) {
				alert("처리중 입니다. 잠시만 기다려주세요.");
				return false;
			}
			if(!confirm("해당 상품을 장바구니에서 삭제 하시겠습니까?")) {
				return false;
			}
			dupClick1 = true; 
			mForm('delRow',row);
			_BT.ajaxCallbackSubmit("frm",  _BT.SHOP.URL.Order.delCart, 
			function(data) {
				dupClick1 = false;
				if($(data).size() > 0) { 
					if(_BT.isEquals(data.code, "success")){
						_BT.moveUrl(_BT.SHOP.URL.Order.cart);
						return false;
					}else{
						alert(data.msg);	
						return false;
					}
				}
			},
			function(xhr, status, error) {
				dupClick1 = false; 
				alert("처리중 오류가 발생했습니다.\n\n다시 확인 부탁 드립니다.");
				return false;
			});	
	    }
	    function delCartChk(){
			if( dupClick1 ) {
				alert("처리중 입니다. 잠시만 기다려주세요.");
				return false;
			}
			var cnt = 0;
			$('#frm').empty();
			$('#frm').append($('<input/>', {
			    type: 'hidden',
			    id: 'procType',
			    name: 'procType',
			    value : 'delChk'
			}));
			$( ".cart_item" ).each(function( i ) {
				if(_BT.isChecked($(this).attr("id"))){
					var r = $(this).attr("id");
					$('#frm').append($('<input/>', {
					    type: 'hidden',
					    id: 'prductDtlCode'+cnt,
					    name: 'prductDtlCode'+cnt,
					    value : $('#prductDtlCode'+r).val()
					}));
					cnt++;
				}
			});
			$('#frm').append($('<input/>', {
			    type: 'hidden',
			    id: 'cnt',
			    name: 'cnt',
			    value : cnt
			}));
			if(_BT.isEquals(cnt,0)){
				alert("선택하신 상품이 없습니다.");
				return false;
			}
			if(!confirm("해당 상품을 장바구니에서 삭제 하시겠습니까?")) {
				return false;
			}
			dupClick1 = true; 
			_BT.ajaxCallbackSubmit("frm",  _BT.SHOP.URL.Order.delCart, 
			function(data) {
				dupClick1 = false;
				if($(data).size() > 0) { 
					if(_BT.isEquals(data.code, "success")){
						_BT.moveUrl(_BT.SHOP.URL.Order.cart);
						return false;
					}else{
						alert(data.msg);	
						return false;
					}
				}
			},
			function(xhr, status, error) {
				dupClick1 = false; 
				alert("처리중 오류가 발생했습니다.\n\n다시 확인 부탁 드립니다.");
				return false;
			});	
	    }
	    function buyNow(row){
			mForm('buyNow',row);
			_BT.actFormSubmit("frm", "POST",_BT.SHOP.URL.Order.goPay); 
	    }
	    function buyAll(){
	    	var cnt = 0;
			$('#frm').empty();
			$('#frm').append($('<input/>', {
			    type: 'hidden',
			    id: 'procType',
			    name: 'procType',
			    value : 'buyChk'
			}));
			$( ".cart_item" ).each(function( i ) {
				var r = $(this).attr("id");
				$('#frm').append($('<input/>', {
				    type: 'hidden',
				    id: 'prductDtlCode'+cnt,
				    name: 'prductDtlCode'+cnt,
				    value : $('#prductDtlCode'+r).val()
				}));
				cnt++;
			});
			$('#frm').append($('<input/>', {
			    type: 'hidden',
			    id: 'cnt',
			    name: 'cnt',
			    value : cnt
			}));
			if(cnt < 1){
				alert("장바구니에 상품이 없습니다.");
				return false;
			}
			_BT.actFormSubmit("frm", "POST",_BT.SHOP.URL.Order.goPay); 
	    }
	    function buyChk(){
	    	var cnt = 0;
			$('#frm').empty();
			$('#frm').append($('<input/>', {
			    type: 'hidden',
			    id: 'procType',
			    name: 'procType',
			    value : 'buyChk'
			}));
			$( ".cart_item" ).each(function( i ) {
				if(_BT.isChecked($(this).attr("id"))){
					var r = $(this).attr("id");
					$('#frm').append($('<input/>', {
					    type: 'hidden',
					    id: 'prductDtlCode'+cnt,
					    name: 'prductDtlCode'+cnt,
					    value : $('#prductDtlCode'+r).val()
					}));
					cnt++;
				}
			});
			$('#frm').append($('<input/>', {
			    type: 'hidden',
			    id: 'cnt',
			    name: 'cnt',
			    value : cnt
			}));
			if(_BT.isEquals(cnt,0)){
				alert("선택하신 상품이 없습니다.");
				return false;
			}
			_BT.actFormSubmit("frm", "POST",_BT.SHOP.URL.Order.goPay); 
	    }
	</script>
	<div class=wid_1248>
		<div class="section center_content">
			<div class="join_content_tab">
				<a href="javascript:;" class="on">
					장바구니
				</a>
				<a href="javascript:;">
					주문/결제
				</a>
				<a href="javascript:;">
					주문완료
				</a>
			</div>
			<form id="tFrm" name="tFrm">
				<input type="hidden" id="mStore" name="mStore"/>
			</form>
			<form id="frm" name="frm">
				<input type="hidden" id="procType" name="procType"/>
			</form>
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
			<c:set var="freeAmt" 			value="0" />
			<c:set var="PRDT_TP" 			value="0" />
			<c:set var="C_CNT" 			value="0" />
			<c:if test="${fn:length(cartList) lt 1}">
				<table class="cart_list margintop_10">		
					<caption>장바구니</caption>
					<colgroup>
						<col width="8%">
						<col width="*%">
						<col width="10%">
						<col width="22%">
						<col width="20%">
					</colgroup>
					<tbody>
						<tr>
							<th>
								<input type="checkbox"  id="clickTmp" class="chk"/>
							</th>
							<th>
								상품정보
							</th>
							<th>
								수량
							</th>
							<th>
								가격<br/>총 금액
							</th>
							<th>
								주문
							</th>
						</tr>
						<tr>
							<td colspan="5" height="200px;">
								<h1 class="title_Type04">
									장바구니에 상품이 없습니다.
								</h1>
							</td>
						</tr>
					</tbody>
				</table>		 
			</c:if>
			<c:set var = "c12" value = "N"/>
			<c:forEach items="${cartList}" var="prdt1" varStatus="status">
				<c:if test = "${c12 eq 'N' and fn:contains(prdt1.CATEG_CD, 'c12')}">
					<c:set var = "c12" value = "Y"/>
				</c:if>
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
				<c:if test="${status.first}">
					<c:set var="storeId" 		value="${prdt1.STORE_ID}" />
				</c:if>
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
									<th style="text-align: right; padding:7px 20px 0 0;">
										<c:if test="${freeAmt ge 10000}">
											배송비 <label class=""><fmt:formatNumber value="${dlvyFeeT}" groupingUsed="true"/> 원</label>
											/<label class="price_color"><fmt:formatNumber value="${freeAmt}" groupingUsed="true"/></label> 원 이상 무료배송 
										</c:if>
										<c:if test="${PRDT_TP eq 'S'}">	
											<span class="show_seller">
												<label class="payment_Type01 goDetail" data-value="${storeId}">업체상품 더보기</label>
											</span>
										</c:if>
									</th>
								</tr>
								<tr>
									<th style="text-align: right; padding-right: 20px;">
										상품가격<label class="price_color"><fmt:formatNumber value="${totPrice}" groupingUsed="true"/></label> 원
										<label class="icon" style="padding: 0 10px;"><img src="${staticRoot}/img/icon_plus.jpg" alt="플러스" /></label>
										배송비<label class="price_color"><fmt:formatNumber value="${dlvyFeeT}" groupingUsed="true"/></label> 원
										<c:if test="${dlvyFeeH ne '0'}"> 
											<label class="icon" style="padding: 0 10px;"><img src="${staticRoot}/img/icon_plus.jpg" alt="플러스" /></label>
											화물 택배비<label class="price_color"><fmt:formatNumber value="${dlvyFeeH}" groupingUsed="true"/></label> 원
										</c:if><br/>
										<label class="icon" style="padding: 0 10px;"><img src="${staticRoot}/img/icon_equals.jpg" alt="합계" /></label>
										결제 예정금액<label class="price_color_red"><fmt:formatNumber value="${totPrice+dlvyFeeT+dlvyFeeH}" groupingUsed="true"/></label>원
									</th>
								</tr>
							</tbody>
						</table>
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
							<col width="8%">
							<col width="*%">
							<col width="10%">
							<col width="22%">
							<col width="20%">
						</colgroup>
						<tbody>
							<tr>
								<th>
									<input type="checkbox"  id="cAll_<c:out value="${prdt1.STORE_ID}"/>" class="chk" checked="checked" data-value="<c:out value="${prdt1.STORE_ID}"/>"/>
								</th>
								<th>
									상품정보
								</th>
								<th>
									수량
								</th>
								<th>
									가격<br/>총 금액
								</th>
								<th>
									주문
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
								<tr>
									<td>
										<c:if test="${prdt1.SOLDOUT_AT ne 'Y' and prdt1.INVT_AMT ne '0'}">
											<input type="checkbox" class="cart_item c_<c:out value="${prdt1.STORE_ID}"/>" id="<c:out value="${status.count}"/>" checked="checked"/>
										</c:if>
									</td>
									<td>
										<p class="cart_txt01">
											[<c:out value="${prdt1.PRDT_DTL_CD}"/>] <c:out value="${prdt1.PRDT_NM}"/>
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
									<c:choose>
										<c:when test="${prdt1.SOLDOUT_AT eq 'Y' or prdt1.INVT_AMT eq '0'}">
											<td class="cart_price02" style="font-size: 13px;">
												<p class="cart_txt01" style="text-align: center;">
													일시품절
												</p>
											</td>
										</c:when>
										<c:otherwise>
											<td class="count_box">
												<input type="text" class="cart_count_input" style="text-align:right;" id="qy<c:out value="${status.count}"/>"  placeholder="1" value="<c:out value="${prdt1.QY}"/>"  data-value="<c:out value="${status.count}"/>"/>
												<br/><span class="click_btn07" id="b_<c:out value="${status.count}"/>" data-value="<c:out value="${status.count}"/>">변경</span>								
											</td>
										</c:otherwise>
									</c:choose>		
									<td>
										<c:choose>
											<c:when test="${prdt1.SOLDOUT_AT eq 'Y' or prdt1.INVT_AMT eq '0'}">
												<p class="cart_txt01">
													<c:choose>
														<c:when test="${empty prdt1.RE_SALE_DT}">
															[재입고 : 미 확정]	
														</c:when>
														<c:otherwise>
															[재입고 : <c:out value="${prdt1.RE_SALE_DT}"/>]	
														</c:otherwise>
													</c:choose>	
												</p>
											</c:when>
											<c:otherwise>
											<c:choose>
												<c:when test="${prdt1.SALE_PRICE eq '0'}">
													<p class="cart_txt01" style="text-align:right; padding-right:5px;">
														<fmt:formatNumber value="${prdt1.SEL_PRICE}" groupingUsed="true"/> 원
													</p>
												</c:when>
												<c:otherwise>
													<p class="cart_txt01" style="text-align:right; padding-right:5px;text-decoration: line-through;color:#b71c1c;">
														<span style="color:#000000;">
															<fmt:formatNumber value="${prdt1.SEL_PRICE}" groupingUsed="true"/> 원
														</span>
													</p>
													<p class="cart_txt01" style="text-align:right; padding-right:5px;color:#b71c1c;">
														<fmt:formatNumber value="${prdt1.SALE_PRICE}" groupingUsed="true"/> 원
													</p>
												</c:otherwise>
											</c:choose>		
												<p class="cart_price02"  style="text-align:right; padding-right:5px;font-size: 13px;">
													<fmt:formatNumber value="${prdt1.TOT_PRICE}" groupingUsed="true"/> 원
												</p>
											</c:otherwise>
										</c:choose>	
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
										<c:if test="${prdt1.SOLDOUT_AT ne 'Y' and prdt1.INVT_AMT ne '0'}">
											<span class="now_btn" onclick="buyNow('<c:out value="${status.count}"/>');">
												바로구매
											</span>
										</c:if>
										<span class="del_btn" onclick="delCart('<c:out value="${status.count}"/>');">
											삭제하기
										</span>
									</td>
								</tr>
								<c:if test="${prdt1.SOLDOUT_AT ne 'Y' and prdt1.INVT_AMT ne '0'}">
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
									<td style="text-align: right; padding:7px 20px 0 0; border:0;">
										<c:if test="${freeAmt ge 10000}">
											배송비 <label class=""><fmt:formatNumber value="${dlvyFeeT}" groupingUsed="true"/> 원</label>
											/<label class="price_color"><fmt:formatNumber value="${freeAmt}" groupingUsed="true"/></label> 원 이상 무료배송 
											<c:if test="${C_CNT ge 1}">				
												<span style="color:#b71c1c">[ 착불배송 상품 제외 ]</span>
											</c:if>
										</c:if>
										<c:if test="${PRDT_TP eq 'S'}">	
											<span class="show_seller">
												<label class="payment_Type01 goDetail" data-value="${storeId}">업체상품 더보기</label>
											</span>
										</c:if>
									</td>
								</tr>
								<tr>
									<td style="text-align: right; padding-right: 20px; border:0;">
										상품가격<label class="price_color"><fmt:formatNumber value="${totPrice}" groupingUsed="true"/></label> 원
										<label class="icon" style="padding: 0 10px;"><img src="${staticRoot}/img/icon_plus.jpg" alt="플러스" /></label>
										배송비<label class="price_color"><fmt:formatNumber value="${dlvyFeeT}" groupingUsed="true"/></label> 원
										<c:if test="${dlvyFeeH ne '0'}"> 
											<label class="icon" style="padding: 0 10px;"><img src="${staticRoot}/img/icon_plus.jpg" alt="플러스" /></label>
											화물 택배비<label class="price_color"><fmt:formatNumber value="${dlvyFeeH}" groupingUsed="true"/></label> 원
										</c:if><br/>
										<label class="icon" style="padding: 0 10px;"><img src="${staticRoot}/img/icon_equals.jpg" alt="합계" /></label>
										결제 예정금액<label class="price_color_red"><fmt:formatNumber value="${totPrice+dlvyFeeT+dlvyFeeH}" groupingUsed="true"/></label>원
									</td>
								</tr>
							</tbody>
						</table>
					</c:if>
				</c:forEach>
			<table class="cart_list_total margintop_20 border_top border_bottom">
				<caption>장바구니</caption>
				<colgroup>
					<col width="100%">
				</colgroup>
				<tbody>
					<tr>
						<td style="text-align: right; padding-right: 20px;">
							<input type="hidden" id="sumPrice" value="${sumPrice}"/>
							<input type="hidden" id="sumDlvyFee" value="${sumDlvyFee}"/>
							<input type="hidden" id="sumTot" value="${sumPrice + sumDlvyFee}"/>
							상품가격<label class="price_color" id="sumPriceTxt"><fmt:formatNumber value="${sumPrice}" groupingUsed="true"/></label>원
							<label class="icon" style="padding: 0 10px;"><img src="${staticRoot}/img/icon_plus.jpg" alt="플러스" /></label>
							배송비<label class="price_color" id="sumDlvyFeeTxt"><fmt:formatNumber value="${sumDlvyFee}" groupingUsed="true"/></label>원
							<br/>
							<label class="icon" style="padding: 0 10px;"><img src="${staticRoot}/img/icon_equals.jpg" alt="합계" /></label>
							결제 예정금액<label class="price_color_red" id="sumTotTxt"><fmt:formatNumber value="${sumPrice + sumDlvyFee}" groupingUsed="true"/></label>원
						</td>
					</tr>
				</tbody>
			</table>
			<c:if test="${fn:length(cartList) ge 2 or c12 eq 'Y'}">	
				<table class="cart_list_total margintop_20 border_top border_bottom">
					<caption>안내</caption>
					<colgroup>
						<col width="100%">
					</colgroup>
					<tbody>
						<tr>
							<td style="line-height:200%;text-align: left;">
								<c:if test="${fn:length(cartList) ge 2}">	
									<P class="cart_txt01">※ 여러상품을 묶음배송으로 구매할 경우 통합배송 처리로 인해 당일발송이 불가 할 수 있습니다.</P>
								</c:if>
								<c:if test="${c12 eq 'Y'}">	
									<P class="cart_txt01">※ 전자상거래법에 의거하여 <span style="color:#b71c1c;">제품가치가 훼손(포장의 개봉)</span>또는 제품에 전원공급이 된 후에는 <span style="color:#b71c1c;">고객변심에 의한 반품 및 교환이 불가</span> 합니다.</P>
								</c:if>
							</td>
						</tr>
					</tbody>
				</table>
			</c:if>
			<div class="cart_btn margintop_10">
				<span class="btn_01" onclick="buyAll();">
					전체주문
				</span>
			</div>
			<div class="cart_btn margintop_10">
				<span class="btn_02" onclick="buyChk();">
					선택상품 주문
				</span>
			</div>
			<div class="cart_btn margintop_10 marginbottom_10">
				<span class="btn_03" onclick="delCartChk();">
					선택상품 삭제
				</span>
			</div>
		</div>
	</div>
