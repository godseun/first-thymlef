<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/layout/include/base.jsp" %>
	<script src="http://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
	<script type="text/javascript">
	var dupClick1 = false;
	$(function(){  
		$( ':input' ).on('focus', function() {
			if(($( this ).prop( 'readonly' ))){
				$(this).addClass('mbOn');
			}else{
				$(this).addClass('mOn');
			} 
		});
		$( ':input' ).on('focusout', function() {
			$(this).removeClass('mbOn');
			$(this).removeClass('mOn');
		});
		$('.receipt_btn').on('click', function() {
			if($(this).data('type') == 'Card'){
				_BT.openPopup('http://iniweb.inicis.com/app/publication/apReceipt.jsp?noTid=' + $(this).data('value') + '&noMethod=1', 'fnMngAddr', '430', '760', true, true);
			}else{
				_BT.openPopup('http://iniweb.inicis.com/DefaultWebApp/mall/cr/cm/Cash_mCmReceipt.jsp?noTid=' + $(this).data('value') + '&clpaymethod=22', 'fnMngAddr', '430', '760', true, true);
			}
		});
		$('.btn_back_01').on('click', function() {
			history.go(-1);	
		});
		 
		$('.save').on('click', function() {
			if( dupClick1 ) {
				alert('처리중 입니다. 잠시만 기다려주세요.');
				return false;
			}
			if(_BT.isEmptyById('receiver',   '받으시는분을 입력해 주세요.')) return false;
			if(_BT.isEmptyById('mobile1',    '받으시는분 연락처를 입력해 주세요.')) return false;
			if(_BT.isEmptyById('mobile2',    '받으시는분 연락처를 입력해 주세요.')) return false;
			if(_BT.isEmptyById('mobile3',    '받으시는분 연락처를 입력해 주세요.')) return false;
			if(_BT.isEmptyById('zipCode',	  '주소를 입력해 주세요.')) return false;
			if(!confirm('배송지 정보를 변경 하시겠습니까?')){
				return false;
			}
			$('#mobileNo').val(_BT.getJoinData('-', new Array('mobile1','mobile2','mobile3')));
			dupClick1 = true; 
			_BT.ajaxCallbackSubmit('dvyFrm',  _BT.SHOP.URL.Order.ChgAddr, 
			function(data) {
				dupClick1 = false;
				if($(data).size() > 0) { 
					if(_BT.isEquals(data.code, 'success')){
						alert(data.msg);
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
		});
		
		
		//_BT.openPopup( _BT.SHOP.URL.Order.PopTrace,'fnMngAddr', '610', '700', true, true);
		/* 			
		$('.receipt_btn').on('click', function() {
			_BT.moveUrl(_BT.SHOP.URL.User.Return);
		});
		 */
	});
	
	function fnMngAddr(){
		_BT.openPopup( _BT.SHOP.URL.User.popAddr,'fnMngAddr', '610', '700', true, true);
	}
	function fnSetAddr(obj){
		var oZoneTxt = '일반';
		var nZoneTxt = '일반';
		var oZoneTp = $('#zoneTp').val();
		var nZoneTp = 0;
		for(var i=0; i<obj.length; i++){
			if(obj[i].name == 'zoneTp'){
				nZoneTp = obj[i].value;
				break;
			} 
		}
		if(oZoneTp == 1) oZoneTxt = '도서산간';
		if(oZoneTp == 2) oZoneTxt = '제주';
		if(nZoneTp == 1) nZoneTxt = '도서산간';
		if(nZoneTp == 2) nZoneTxt = '제주';
		if(oZoneTp !=  nZoneTp){
    		alert('배송비의 변동이 발생하여 ' +oZoneTxt+'지역에서 '+nZoneTxt+'지역으로 변경이 불가합니다.');
    		return false;
		}else{
			for(var i=0; i<obj.length; i++){
				$('#'+obj[i].name).val(obj[i].value);
			}
		}
	}
	function fnPostcode(){
		if($( '#addrNm' ).prop('readonly')){
			return false;
		}
	    new daum.Postcode({
	        oncomplete: function(data) {
	        	if(data.zoneCode == '63050'){
	        		alert('제주도는 도서산간지 추가배송비가 발생하여 주소지 변경이 불가합니다.');
	        		return false;
	        	}
	        	$('#zoneCode').val(data.postcode.replace('-',''));
	        	$('#zipCode').val(data.zonecode);
	        	$('#sigunguCode').val(data.sigunguCode);
	        	$('#address').val(data.address);
	        	$('#dtlAddress').val('('+data.bname+')');
	        }
	    }).open();
	}		
	function doAction(sAction) { 
		if( dupClick1 ) {
			alert('처리중 입니다. 잠시만 기다려주세요.');
			return false;
		}
		switch(sAction) {  
			case 'can':
			case 'chg':   
			case 'rtn':       
				var jobTxt = '취소';
				if(sAction == 'chg') jobTxt = '교환';
				else if(sAction == 'rtn') jobTxt = '반품';
				$('p[data-value="TXT"]').each(function( i ) { 
					$(this).removeClass('cart_price02'); 
				});
				if( $('.ordr_item:checked').length < 1){
					alert('선택하신 상품이 없습니다.');
					return false;
				}
				var sttu = $('#maxSttus').val();
				var chk = 0;
				var cnt = 0;
				$('#ordrFrm').empty();
				var oId = '';
				if(sAction == 'can'){
					if(sttu == 0){
						if($('.ordr_item').length > $('.ordr_item:checked').length){
							alert('입금대기중인 상태에서는 전체 취소만 가능 합니다.');
			    			$('.ordr_item').prop('checked',true);
						}
					}else if(sttu > 1){
						alert('배송준비가 시작된 상품이 있는 경우 취소가 불가 합니다.\n\n고객만족센터로 문의 바랍니다.');
						return false;
						
					}
					var sCnt = 0;
					var store = '';
					$('.ordr_item:checked').each(function( i ) {
						if( $(this).data('value') > 1 ){
							chk++;
							$('p[data-type="'+$(this).data('type')+'"]').addClass('cart_price02'); 
						}else{
							if(store != $(this).data('value2')){
								sCnt++;
								store = $(this).data('value2');
							} 
							oId += $(this).data('type') + '@'; 
							cnt++;
						}
					});
					if(sttu > 0 && sCnt > 1){
						alert('취소,반품,교환 신청은 배송업체별로 신청 하셔야 합니다.\n\n확인 바랍니다.');
						$(".ordr_item").prop('checked', false) ;
						return false;
					}
				}else{
					$('.ordr_item:checked').each(function( i ) {
						if( $(this).data('value') >= 2
							&& $(this).data('value') <= 4
						){
							oId += $(this).data('type') + '@'; 
							cnt++;
						}else{
							chk++;
							$(this).prop('checked', false) ;
							$('p[data-type="'+$(this).data('type')+'"]').addClass('cart_price02');
						}
					});
					if(chk > 0){
						alert('배송이 시작된 상품만 '+jobTxt+'이 가능 합니다.\n\n주문상태 확인 바랍니다.');
						return false;
					}
				}
				$('#ordrFrm').append($('<input/>', {
				    type: 'hidden',
				    id: 'cnt',
				    name: 'cnt',
				    value : cnt
				}));
				$('#ordrFrm').append($('<input/>', {
				    type: 'hidden',
				    id: 'procType',
				    name: 'procType',
				    value : 'ordr'+sAction
				}));
				$('#ordrFrm').append($('<input/>', {
				    type: 'hidden',
				    id: 'paymethod',
				    name: 'paymethod',
				    value : $('#PAY').val()
				}));
				$('#ordrFrm').append($('<input/>', {
				    type: 'hidden',
				    id: 'oId',
				    name: 'oId',
				    value : oId
				}));
				$('#ordrFrm').append($('<input/>', {
				    type: 'hidden',
				    id: 'ordrId',
				    name: 'ordrId',
				    value : $('#ORDR_ID').val()
				}));
				_BT.actFormSubmit("ordrFrm", "POST", _BT.SHOP.URL.Order.OrderChg); 
				break; 
			case 'delete':            
			   $('#myUpload').IBUpload(sAction);
				break; 
		} 
	} 
	</script>
	<div class="section">
		<div class="">
			<h1 class="title_con_Type01 margintop_30">
				결제 정보
				<span class="receipt_btn" data-value="${ordrMst.TID}" data-type="${ordrMst.PAYMETHOD}">
					결제 영수증
				</span>
				<input type="hidden" id="PAY" value="<c:out value="${ordrMst.PAYMETHOD}"/>">
				<input type="hidden" id="ORDR_ID" value="<c:out value="${ordrMst.ORDR_ID}"/>">
			</h1>
			<table class="tbl_Type03">
				<caption>결제 정보</caption>
				<colgroup>
					<col width="15%">
					<col width="20%">
					<col width="%">
				</colgroup>
				<tbody>
					<tr>
						<th>
							주문금액
						</th>
						<td class="textcenter bdr_type">
							<label class="price_color" style="padding-left:0px;">
								<c:choose>
									<c:when test="${ordrMst.USE_YN eq 'Y'}">
										<fmt:formatNumber value="${ordrMst.SUM_PRICE}" groupingUsed="true"/>원
									</c:when>
									<c:otherwise>
										0원
									</c:otherwise>
								</c:choose>
							</label>
						</td>
						<td style="padding: 5px 5px;">
							<c:choose>
								<c:when test="${ordrMst.USE_YN eq 'Y'}">
									 상품가격<label class="price_color" style="padding-left: 10px;"><fmt:formatNumber value="${ordrMst.TOT_PRICE}" groupingUsed="true"/></label>원
									<label class="icon" style="display: inline-block; padding: 0 5px;">
										<img src="${staticRoot}/img/icon_plus.jpg" alt="플러스">
									</label>
									배송비<label class="price_color" style="padding-left: 10px;"><fmt:formatNumber value="${ordrMst.DEVY_FEE}" groupingUsed="true"/></label>원
								</c:when>
								<c:otherwise>
									 상품가격<label class="price_color" style="padding-left: 10px;">0</label>원
									<label class="icon" style="display: inline-block; padding: 0 5px;">
										<img src="${staticRoot}/img/icon_plus.jpg" alt="플러스">
									</label>
									배송비<label class="price_color" style="padding-left: 10px;">0</label>원
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
					<tr>
						<th>
							결제 금액
						</th>
						<td class="textcenter bdr_type">
							<p class="cart_price02">
								<c:choose>
									<c:when test="${ordrMst.USE_YN eq 'Y'}">
										<fmt:formatNumber value="${ordrMst.TOTPRICE}" groupingUsed="true"/>원
									</c:when>
									<c:otherwise>
										0원
									</c:otherwise>
								</c:choose>							
							</p>
						</td>
						<td style="padding: 5px 5px;">
							<c:if test="${ordrMst.USE_YN eq 'Y'}">
								<c:choose>
									<c:when test="${ordrMst.PAYMETHOD eq 'Card'}">
										<c:out value="${ordrMst.CARD_NM}"/>(<c:out value="${ordrMst.CARD_NUM}"/>)
										<label class="space_Type">
										</label>
										<label class="fz_11">
											<c:out value="${ordrMst.APPL_DT}"/>
										</label>
									</c:when>
									<c:when test="${ordrMst.PAYMETHOD eq 'DirectBank'}">
										<c:out value="${ordrMst.ACCT_BANK_NM}"/>
										<label class="space_Type">
										</label>
										<p class="fz_11 margintop_10" >
											입금일시 : <label style="color:#3f51b5;"><c:out value="${ordrMst.APPL_DT}"/></label>
										</p>
									</c:when>
									<c:otherwise>
										<c:out value="${ordrMst.VBANK_NM}"/> ( 계좌번호 : <c:out value="${ordrMst.VACT_NUM}"/> )
										<label class="space_Type">
										 
										</label>
										<p class="fz_11 margintop_10" >
											<c:choose>
												<c:when test="${! empty ordrMst.TRANS_DT}">
													입금일시 : <label style="color:#3f51b5;"><c:out value="${ordrMst.TRANS_DT}"/></label>
												</c:when>
												<c:otherwise>
													입금기한 : <label style="color:#3f51b5;"><c:out value="${ordrMst.LIMIT_DT}"/></label>
												</c:otherwise>
											</c:choose>
										</p>
									</c:otherwise>
								</c:choose>
							</c:if>
						</td>
					</tr>
				</tbody>
			</table>
			<h1 class="title_con_Type01 margintop_50">
				주문상품 정보
				<c:if test="${ordrMst.USE_YN eq 'Y'}">
					<span onclick="doAction('rtn');"  class="sButton btn_span fs-13 pink marginleft_5" style="float: right;">반품</span>
					<span onclick="doAction('can');" class="sButton btn_span fs-13 blue" style="float: right;">취소</span>
				</c:if>
			</h1>
			<form id="ordrFrm" name="ordrFrm">
			</form>
			<table class="cart_list" id="ordr_item_list">
				<caption>장바구니</caption>
				<colgroup>
					<col width="4%">
					<col width="4%">
					<col width="*%">
					<col width="12%">
					<col width="12%">
					<col width="12%">
					<col width="13%">
				</colgroup>
				<tbody>
					<tr>
						<th colspan="2">
							선택
						</th>
						<th>
							상품정보
						</th>
						<th>
							수량
						</th>
						<th>
							금액
						</th>
						<th>
							배송
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
					<c:set var="dlvyFeeTxt" 		value="묶음배송" />	
					<c:if test="${ordr.STTUS ne '5' and ordr.STTUS ne '7' and ordr.STTUS ne '8'}">
						<c:if test="${ordr.STTUS gt maxSttus}">
							<c:set var="maxSttus" 			value="${ordr.STTUS}" />
						</c:if>
						<c:if test="${ordr.DLVY_MEG ne '1'}"> 
							<c:set var="dlvyFeeTxt" 		value="개별배송" />	
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
								<c:if test="${ordr.STTUS le '4' }">	
									 <input type="checkbox" class="ordr_item" id="<c:out value="${ordr.O_ID}"/>" data-type="<c:out value="${ordr.O_ID}"/>" data-value="<c:out value="${ordr.STTUS}"/>" data-value2="<c:out value="${ordr.STORE_ID}"/>"/>
								</c:if>
							</td>
							<td>
								<p class="cart_txt01">
									<c:out value="${ordr.PRDT_NM}"/>
								</p>
								<p class="cart_txt02">
									[ <c:out value="${ordr.MAKR_NM}"/> ] <c:out value="${ordr.STNDRD}"/>
								</p>
							</td>
							<td class="cart_txt03">
								<fmt:formatNumber value="${ordr.QY}" groupingUsed="true"/>개
							</td>
							<td>
								<p class="cart_price02">
									<fmt:formatNumber value="${ordr.SUM_PRICE}" groupingUsed="true"/>원
								</p>
							</td>
							<td>
								<c:choose>
									<c:when test="${ordr.DLVY_TP eq 'T'}">
										<p class="cart_txt03"> ${DEVY_TP} </p>
										<c:choose>
											<c:when test="${dFee eq 0}">
												<p class="cart_txt03"> [무료배송] </p>
											</c:when>
											<c:otherwise>
												<p class="cart_txt03"> [<fmt:formatNumber value="${dFee}" groupingUsed="true"/>원] </p>
											</c:otherwise>
										</c:choose>
									</c:when>
									<c:when test="${ordr.DLVY_TP eq 'C'}">
										<p class="cart_txt03"><span style="color:#b71c1c">착불배송</span></p> 
										<p class="cart_txt03"><span style="color:#b71c1c">[<c:out value="${dlvyFeeTxt}"/>]</span></p>
									</c:when>
								</c:choose>	
							</td> 				
							<c:if test="${false}">			
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
							</c:if>
							<td> 
								<p data-value="TXT" data-type="<c:out value="${ordr.O_ID}"/>">
								<c:out value="${ordr.STTUS_TXT}"/>
								</p>
							</td>
						</tr>
					</c:if>
					</c:forEach>
				</tbody>
			</table>
			<input type="hidden" id="maxSttus" value="${maxSttus}">
			<form id="dvyFrm" name="dvyFrm">
				<c:choose>
					<c:when test="${maxSttus eq '-1'}">
						<h1 class="title_con_Type01 margintop_50">
							배송지 정보
						</h1>
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
									<td rowspan ="5" height="200px;" align="center">
										<h1 class="title_Type04">
											조회내역이 없습니다.
										</h1>
									</td>
								</tr>
								<tr>
									<th>
										받으시는 분
									</th>
								</tr>
								<tr>
									<th>
										주소
									</th>
								</tr>
								<tr>
									<th>
										연락처
									</th>
								</tr>
								<tr>
									<th>
										배송요구사항
									</th>
								</tr>
							</tbody>
						</table>
					</c:when>
					<c:when test="${maxSttus lt '2'}">
						<h1 class="title_con_Type01 margintop_50">
							배송지 정보
							<span class="sButton btn_span fs-13 blue save" style="float: right;" data-value="<c:out value="${ordrMst.ORDR_ID}"/>">저장</span>
						</h1>
						<input type="hidden" id="ordrId" name="ordrId" value="<c:out value="${ordrMst.ORDR_ID}"/>"/>	
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
										<input type="text" class="join_form_input03 c11_02_input_01 inAddr" readonly="readonly" id="addrNm" name="addrNm" maxlength="20" placeholder="배송지명" value="<c:out value="${ordrMst.ADDR_NM}"/>"/>	
										<span class="form_btn_Type_blue" onclick="fnMngAddr();">배송지 선택</span>
									</td>
								</tr>
								<tr>
									<th>
										받으시는 분
									</th>
									<td>
										<input type="text" class="join_form_input03 inAddr" readonly="readonly" id="receiver" name="receiver" maxlength="20" placeholder="받으시는 분" value="<c:out value="${ordrMst.RECV_NM}"/>"/>	
									</td>
								</tr>
								<tr>
									<th>
										주소
									</th>
									<td>
										<input type="hidden" id="zoneTp" name="zoneTp" value="<c:out value="${ordrMst.ZONE_TP}"/>"/>	
										<input type="hidden" id="zoneCode" name="zoneCode" value="<c:out value="${ordrMst.ZONE_CODE}"/>"/> 
										<input type="text" class="join_form_input01" style="width:70px;" id="zipCode" name="zipCode" readonly="readonly" value="<c:out value="${ordrMst.ZIP_CODE}"/>"/>	
										<input type="text" class="join_form_input03" id="address" name="address" readonly="readonly" placeholder="주소" value="<c:out value="${ordrMst.ADDRESS}"/>"/>	
										<input type="text" class="join_form_input03 5 inAddr" style="margin-top: 5px;;" id="dtlAddress" name="dtlAddress"  placeholder="상세주소" value="<c:out value="${ordrMst.ADDRESS_DETAIL}"/>"/>	
									</td>
								</tr>
								<tr>
									<th>
										연락처
									</th>
									<td>
										<input type="hidden" id="mobileNo" name="mobileNo" />	
										<input type="text" class="join_form_input01 mobile inAddr" id="mobile1" style="width:55px;" maxlength="4" value="${fn:split(ordrMst.TEL_NO,'-')[0]}"/>
											<span class="join_form_txt">-</span>
										<input type="text" class="join_form_input01 mobile inAddr" id="mobile2" style="width:60px;" maxlength="4" value="${fn:split(ordrMst.TEL_NO,'-')[1]}"/>
											<span class="join_form_txt">-</span>
										<input type="text" class="join_form_input01 mobile inAddr" id="mobile3" style="width:60px;" maxlength="4" value="${fn:split(ordrMst.TEL_NO,'-')[2]}"/>
									</td>
								</tr>
								<tr>
									<th>
										배송요구사항
									</th>
									<td>
										<input type="text" id="rmk" name ="rmk" class="input_style04" value="<c:out value="${ordrMst.RMK}"/>"/>
									</td>
								</tr>
							</tbody>
						</table>
					</c:when>
					<c:otherwise>		
						<h1 class="title_con_Type01 margintop_50">
							배송지 정보
						</h1>
						<table class="tbl_Type03">
							<caption>배송지 정보</caption>
							<colgroup>
								<col width="15%">
								<col width="%">
							</colgroup>
							<tbody>
								<tr>
									<th>
										받으시는 분
									</th>
									<td >
										<c:out value="${ordrMst.RECV_NM}"/> 
									</td>
								</tr>
								<tr>
									<th>
										연락처
									</th>
									<td >
										<c:out value="${ordrMst.TEL_NO}"/> 
									</td>
								</tr>
								<tr>
									<th>
										배송지
									</th>
									<td >
										(<c:out value="${ordrMst.ZIP_CODE}"/>) <c:out value="${ordrMst.ADDRESS}"/> <c:out value="${ordrMst.ADDRESS_DETAIL}"/>
									</td>
								</tr>
								<tr>
									<th>
										배송요청사항
									</th>
									<td >
										<c:out value="${ordrMst.RMK}"/>
									</td>
								</tr>
							</tbody>
						</table>	
						<div class="signup_agree margintop_10">
							<p class="alarm_txt">※ <span class="redCr bTxt" >배송 준비중 / 배송중</span> 인 상품이 있을경우 배송지 정보 변경이 불가 합니다.</p>
						</div>
					</c:otherwise>
				</c:choose>	
			</form>	
			<div class="icon_btn_Group margintop_30">
				<a class="btn_back_01 hMouse">
					이전화면
				</a>
			</div>
		</div>
	</div>
