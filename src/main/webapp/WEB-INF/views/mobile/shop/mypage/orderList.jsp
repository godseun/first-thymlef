<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/layout/include/base.jsp" %>
	<script type="text/javascript">
		var dupClick1 = false;
		var param;
		$(function(){  
			$('.orDtl').on('click', function() {
				$('#oId').val($(this).data('value'));
				_BT.actFormSubmit('dFrm', 'POST', _BT.SHOP.URL.Order.OrderDtl); 
			});
			$('.now').on('click', function() {
				if( dupClick1 ) {
					alert("처리중 입니다. 잠시만 기다려주세요.");
					return false;
				}
				if(!confirm("상품을 구매확정 하시겠습니까?")) {
					return false;
				}
				var tar = $(this).data('type');
				$('#oSeq').val(tar);
				dupClick1 = true; 
				_BT.ajaxCallbackSubmit('oFrm',  _BT.SHOP.URL.Order.Decision, 
				function(data) {
					dupClick1 = false;
					if($(data).size() > 0) { 
						if(_BT.isEquals(data.code, 'success')){
							$('#sttu_'+tar).text('구매확정');
							$('#now_'+tar).remove();
							alert(data.msg);
							return false;
						}else{
							alert("처리결과"+data.msg);	
							return false;
						}
					}
				},
				function(xhr, status, error) {
					dupClick1 = false; 
					alert("처리중 오류가 발생했습니다.\n\n다시 확인 부탁 드립니다.");
					return false;
				});	
			});
			$('.now2').on('click', function() {
/* 				
				var txt = "에스크로 구매건은 주문번호당\n\n"
							+"한번의 [구매확정] 또는 [구매거절] 로\n\n"
							+"전체 주문건이 처리 됩니다.\n\n"
							+"주문건중 부분반품 하실 물건이 있으신 경우\n\n"
							+"[구매거절] 하시기 전에 고객만족 센타로 \n\n"
							+"먼저 연락 주시면 빠르게 처리가 가능 합니다.\n\n"
							+"구매확정 하시겠습니까?";
				if(!confirm(txt)) {
					return false;
				}
				$('#oId').val($(this).data('value'));
				_BT.openPopup( '','escrowCfn', '610', '700', true, true);
				$('#dFrm').attr('method', 'POST').attr('target', 'escrowCfn').attr('action', _BT.SHOP.URL.Order.PopEscrow).submit();
 */		
 				alert('현재 모바일에서는 에스크로 구매확인기능이 제공되지 않습니다.\n\n번거로우시더라도 PC화면에서 확인 부탁 드립니다.\n\n감사합니다.');
				
			});
			$('.rtn,.can').on('click', function() {
				_BT.moveUrl(_BT.SHOP.URL.Order.Return);
			});
			$('.cart_order_btn').on('click', function() {
/* 				
				param = {
						't_code':$(this).data('code')
						,'t_name':$(this).data('value')
						,'t_invoice':$(this).data('type')
						,'t_item':$(this).data('item')
						,'t_idex':$(this).data('idex')	
					}
 */	
				$('#t_code').val($(this).data('code'));
				$('#t_name').val($(this).data('value'));
				$('#t_invoice').val($(this).data('type'));
				$('#t_item').val($(this).data('item'));
				$('#t_idex').val($(this).data('idex')	);
				_BT.openPopup( '','fnMngAddr', '610', '700', true, true);
				$('#popFrm').attr('method', 'POST').attr('target', 'fnMngAddr').attr('action', _BT.SHOP.URL.Order.PopTrace).submit();
			});

			//오늘 날짜 
			$('.b1').click(function(){
				$('#sDt').val($.datepicker.formatDate($.datepicker.ATOM, new Date()));	
				$('.click_btn02').removeClass('bOn');
	    		$(this).addClass('bOn');
	    		$('#bId').val('b1');
			});
			//1주일 전 날짜 
			$('.b2').click(function(){
				$('#sDt').val(_BT.dateAdd($.datepicker.formatDate($.datepicker.ATOM, new Date()),-7,'d'));	
				$('#eDt').val($.datepicker.formatDate($.datepicker.ATOM, new Date()));
				$('.click_btn02').removeClass('bOn');
	    		$(this).addClass('bOn');
	    		$('#bId').val('b2');
			});
			//1개월 전 날짜 
			$('.b3').click(function(){
				$('#sDt').val(_BT.dateAdd($.datepicker.formatDate($.datepicker.ATOM, new Date()),-1,'m'));	
				$('#eDt').val($.datepicker.formatDate($.datepicker.ATOM, new Date()));
				$('.click_btn02').removeClass('bOn');
	    		$(this).addClass('bOn');
	    		$('#bId').val('b3');
			});
			//6개월 전 날짜 
			$('.b4').click(function(){
				$('#sDt').val(_BT.dateAdd($.datepicker.formatDate($.datepicker.ATOM, new Date()),-6,'m'));	
				$('#eDt').val($.datepicker.formatDate($.datepicker.ATOM, new Date()));
				$('.click_btn02').removeClass('bOn');
	    		$(this).addClass('bOn');
	    		$('#bId').val('b4');
			});

			_BT.makeCalendar('sDt', 'yy-mm-dd'); 
			_BT.makeCalendar('eDt', 'yy-mm-dd'); 
			
			$('#sttus').val('${pageParm.sttus}');
			
			if('${pageParm.bId}' == ''){
				$('.b2').addClass('bOn');
			}else{
				$('.${pageParm.bId}').addClass('bOn');
			}
			
			if('${pageParm.sDt}' == ''){
				$('#sDt').val(_BT.dateAdd($.datepicker.formatDate($.datepicker.ATOM, new Date()),-7,'d'));	
			}else{
				$('#sDt').val('${pageParm.sDt}');	
			}
			if('${pageParm.eDt}' == ''){
				$('#eDt').val($.datepicker.formatDate($.datepicker.ATOM, new Date()));
			}else{
				$('#eDt').val('${pageParm.eDt}');	
			}
		});
		function getParam(){
			return param;
		}
		function fnSearch(){
			_BT.actFormSubmit("oFrm", "POST", _BT.SHOP.URL.Order.OrderList); 
		}
	</script>
	<div class="section">
	 	<div class="tab_bar">
			<ul class="tab_list">
				<li class="tab_item">
					<a href="javascript:;" class="tab_link" onclick="_BT.moveUrl(_BT.SHOP.URL.Order.OrderList);">
						<span id="tab1" class="tab<c:if test="${lnb.sId eq 1}"> tabOn</c:if>">구매내역</span>
					</a>
				</li>
				<li class="tab_item">
					<a href="javascript:;" class="tab_link" onclick="_BT.moveUrl(_BT.SHOP.URL.Order.OrderChgList);">
						<span id="tab3" class="tab<c:if test="${lnb.sId eq 2}"> tabOn</c:if>">반품/취소 현황</span>
					</a>
				</li>
			</ul>
		</div>
		<div class="c11_06_01" style="margin-top: 10px;">
			<form id="popFrm" name="popFrm">
				<input id="t_code" name="t_code" type="hidden" />
				<input id="t_name" name="t_name" type="hidden" />
				<input id="t_invoice" name="t_invoice" type="hidden" />
				<input id="t_item" name="t_item" type="hidden" />
				<input id="t_idex" name="t_idex" type="hidden" />
			</form>
			<form id="dFrm" name="dFrm">
				<input id="prc" name="prc" type="hidden" value="dtl"/>
				<input id="oId" name="ordrId" type="hidden" />
			</form>
			<form id="oFrm" name="oFrm">
				<input id="bId" name="bId" type="hidden" />
				<input id="oSeq" name="oSeq" type="hidden" />
			<table class="tbl_Type02">
				<caption>기간조회</caption>
				<colgroup>
					<col width="15%">
					<col width="%">
				</colgroup>
				<tbody>
					<tr>
						<th rowspan="2">
							검색설정
						</th>
						<td style="padding:5px 0 0 5px;">
							<span class="click_btn02 b1">오늘</span>
							<span class="click_btn02 b2">1주일</span>
							<span class="click_btn02 b3">1개월</span>
							<span class="click_btn02 b4">6개월</span><br/>
							<span class="inquiry" style="width: 40%; display: inline-block;">
								<input type="text" class="input_style06" id="sDt" name="sDt" value="" readonly="readonly" style="width:100%"/>
							</span>
							<span class="tbl_txt" style="width: 10%; display: inline-block;color:black;">
								~
							</span>
							<span class="inquiry" style="width: 40%; display: inline-block;">
								<input type="text" class="input_style06" id="eDt" name="eDt" value="" readonly="readonly" style="width:100%"/>
							</span>
						</td>
					</tr>
					<tr>
						<td style="padding:5px 0 0 5px;">
							<span style="width: 47%; display: inline-block;">
								<input class="input_style21" id="ordrId" name="ordrId" type="text" placeholder="주문번호" style="width: 100%">
							</span>
							<span style="width: 47%; display: inline-block; padding-left: 5px;">
								<input class="input_style21 marginleft_10" id="prdrNm" name="prdrNm" type="text" placeholder="상품명" style="width: 100%">
							</span><br/>
							<span class="return_select2" style="width: 47%; display: inline-block;">
								<select id="sttus" name="sttus" class="" style="margin: 5px;width: 100%">
									<option value="">전체</option>
									<option value="0">입금대기중</option>
									<option value="1">주문완료</option>
									<option value="2">배송준비중</option>
									<option value="3">배송중</option>
									<option value="4">배송완료</option>
									<option value="9">구매확정</option>
								</select>
							</span>
							<span class="inquiry_btn1" onclick="fnSearch();" style="right:15px;">
								<label class="click_btn03">조회하기</label>
							</span>
						</td>
					</tr>
				</tbody>
			</table>
			</form>
			<table class="cart_list margintop_20">
				<caption>장바구니</caption>
				<colgroup>
					<col width="20%">
					<col width="20%">
					<col width="*%">
					<col width="20%">
				</colgroup>
				<tbody>
					<tr>
						<th>
							주문일자
						</th>
						<th colspan="2">
							상품정보
						</th>
						<th>
							주문확인<c:out value="${rCnt}"/>
						</th>
					</tr>
					<c:if test="${fn:length(ordrList) le 0}">
						<tr>
							<td colspan="6" height="100px;"><h1 class="title_Type04">구매내역이 없습니다.</h1></td>
						</tr>
					</c:if>	
					<c:set var="isFirst" 			value="1" />
					<c:set var="orCnt" 			value="1" />
					<c:set var="ordrId" 			value="ORDR_ID" />
					<c:forEach items="${ordrList}" var="ordr" varStatus="status">
						<c:choose>
							<c:when test="${ordr.ORDR_ID ne ordrId}">
								<c:set var="ordrId" 			value="${ordr.ORDR_ID}" />
								<c:set var="isFirst" 			value="1" />
								<c:forEach items="${ordrList}" var="ordr2" varStatus="status2" begin="${status.count}">
									<c:if test="${ordr.ORDR_ID eq ordr2.ORDR_ID}">
										<c:set var="orCnt" 			value="${orCnt + 1}" />	
									</c:if>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<c:set var="orCnt" 			value="1" />
								<c:set var="isFirst" 			value="0" />
							</c:otherwise>
						</c:choose>						
						<tr>
							<c:if test="${isFirst eq '1'}">
								<td rowspan="${orCnt}">
									<p class="cart_txt06 orDtl hMouse" data-value="<c:out value="${ordr.ORDR_ID}"/>">
										 <fmt:formatDate value="${ordr.CREATE_DT}"  pattern="yyyy-MM-dd"/>
									</p>
								</td>
							</c:if>	
							<td class="cart_txt01">
<c:choose>
						<c:when test="${fn:indexOf(ordr.PRDT_IMG, '//') >=0 }">
						<img src="<c:out value="${ordr.PRDT_IMG}"/>" alt="상품사진" class="cart_pic" onerror="this.src='${staticRoot}/img/sample03.jpg'"/> 
</c:when>
						<c:otherwise>
									<img src="${upload}<c:out value="${ordr.PRDT_IMG}"/>" alt="상품사진" class="cart_pic" onerror="this.src='${staticRoot}/img/sample03.jpg'"/> 
</c:otherwise>
						</c:choose>
							</td>
							<td style="padding-left:5px;">
								<p class="cart_txt01">
									[<c:out value="${ordr.MAKR_NM}"/>] <c:out value="${ordr.PRDT_NM}"/>
								</p>
								<p class="cart_txt02">
									<c:out value="${ordr.STNDRD}"/>
								</p>
								<p class="cart_txt02" style="text-align: left;">
									<span class="cart_price02" style="font-size: 14px;" >
										<fmt:formatNumber value="${ordr.SUM_PRICE}" groupingUsed="true"/>원 
									</span>
									(<fmt:formatNumber value="${ordr.QY}" groupingUsed="true"/>개)
								</p>
							</td>
							<td>
								<p class="cart_txt04" id="sttu_<c:out value="${ordr.O_ID}"/>">
									<c:out value="${ordr.STTUS_TXT}"/>
								</p>
								<c:if test="${ordr.STTUS eq '0' }">
									<p class=cart_txt05>
										(<fmt:formatDate value="${ordr.LIMIT_DT}"  pattern="MM-dd"/> 까지)
									</p>
								</c:if>
								<c:if test="${ordr.STTUS ge '3' }">	
									<span class="cart_order_btn" data-item="<c:out value="${ordr.PRDT_NM}"/>" data-idex="<c:out value="${ordr.ORDR_ID}"/>" data-type="<c:out value="${ordr.INVOICE}"/>" data-code="<c:out value="${ordr.DELY_CMP}"/>" data-value="<c:out value="${ordr.DELY_CMP_NM}"/>">
										배송조회
									</span>
								</c:if>
								<c:if test="${ordr.STTUS eq '4' }">	
									<c:choose>
										<c:when test="${ordr.PAYMETHOD eq 'Card'}">
											<span class="now_btn now" id="now_<c:out value="${ordr.O_ID}"/>" data-value="<c:out value="${ordr.ORDR_ID}"/>" data-type="<c:out value="${ordr.O_ID}"/>">
												구매확정
											</span>
										</c:when>
										<c:otherwise>
											<c:if test="${ordr.SEND_RESULT eq '1' }">	
												<span class="now_btn now2" id="now_<c:out value="${ordr.O_ID}"/>" data-value="<c:out value="${ordr.ORDR_ID}"/>" data-type="<c:out value="${ordr.O_ID}"/>">
													구매확인
												</span>
											</c:if>
										</c:otherwise>
									</c:choose>		
								</c:if>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="signup_agree margintop_10">
			<p class="alarm_txt">※ 구매확정 후에는 구매자 변심의 사유로 환불 및 교환이 불가 합니다.</p>
			<p class="alarm_txt margintop_5" >※ 배송완료 후 구매확정을 하지 않은 경우에는 배송이 완료된 일로부터 7일 경과 후, 8일째 자동으로 구매확정 됩니다.</p> 
		</div>
	</div>
