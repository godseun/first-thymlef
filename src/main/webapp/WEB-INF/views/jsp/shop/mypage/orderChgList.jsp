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
			$('.receipt_btn2').on('click', function() {
				if($(this).data('type') == 'Card'){
					_BT.openPopup('http://iniweb.inicis.com/app/publication/apReceipt.jsp?noTid=' + $(this).data('value') + '&noMethod=1', 'fnMngAddr', '430', '760', true, true);
				}else{
					_BT.openPopup('http://iniweb.inicis.com/DefaultWebApp/mall/cr/cm/Cash_mCmReceipt.jsp?noTid=' + $(this).data('value') + '&clpaymethod=22', 'fnMngAddr', '430', '760', true, true);
				}
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
			$('.rtn,.can').on('click', function() {
				_BT.moveUrl(_BT.SHOP.URL.Order.Return);
			});
			$('.cart_order_btn').on('click', function() {
				param = {
					't_code':$(this).data('code')
					,'t_name':$(this).data('value')
					,'t_invoice':$(this).data('type')
					,'t_item':$(this).data('item')
					,'t_idex':$(this).data('idex')	
				}
				_BT.openPopup( _BT.SHOP.URL.Order.PopTrace,'fnMngAddr', '610', '700', true, true);
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
			_BT.actFormSubmit("oFrm", "POST", _BT.SHOP.URL.Order.OrderChgList); 
		}
	</script>
	<div class="section" style="min-height:1000px;">
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
						<td style="padding:6px 0 0 30px;">
							<span class="click_btn02 b1">오늘</span>
							<span class="click_btn02 marginleft_7 b2">1주일</span>
							<span class="click_btn02 marginleft_7 b3">1개월</span>
							<span class="click_btn02 marginleft_7 b4">6개월</span>
							<span class="inquiry marginleft_30">
								<input type="text" class="input_style06" id="sDt" name="sDt" value="" readonly="readonly"/>
							</span>
							<span class="tbl_txt">
								~
							</span>
							<span class="inquiry">
								<input type="text" class="input_style06" id="eDt" name="eDt" value="" readonly="readonly"/>
							</span>
						</td>
					</tr>
					<tr>
						<td>
							<span>
								<input class="input_style21" id="ordrId" name="ordrId" type="text" placeholder="주문번호">
							</span>
							<span>
								<input class="input_style21 marginleft_10" id="prdrNm" name="prdrNm" type="text" placeholder="상품명">
							</span>
							<span class="return_select2 marginleft_10">
								<select id="sttus" name="sttus" class="">
									<option value="">전체</option>
									<option value="8">주문취소</option>
									<option value="5">반품완료</option>
									<option value="6">교환완료</option>
									<option value="7">판매취소</option>
									<option value="51">반품신청</option>
									<option value="52">반품확인</option>
									<option value="53">반품배송중</option>
									<option value="61">교환신청</option>
									<option value="62">교환확인</option>
									<option value="63">교환배송중</option>
								</select>
							</span>
							<span class="inquiry_btn1" onclick="fnSearch();">
								<label class="click_btn03">조회하기</label>
							</span>
						</td>
					</tr>
				</tbody>
			</table>
<%--
			<div class="order_management1">
				<select name="rNum" id="rNum" class="">
					<option value="10">최근주문내역 (10건)</option>
					<option value="20">최근주문내역 (20건)</option>
					<option value="50">최근주문내역 (50건)</option>
					<option value="100">최근주문내역 (100건)</option>
				</select>
			</div>
 --%>
			</form>
			<table class="cart_list margintop_20">
				<caption>장바구니</caption>
				<colgroup>
					<col width="20%">
					<col width="12%">
					<col width="*%">
					<col width="14%">
					<col width="12%">
					<col width="13%">
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
							금액(수량)
						</th>
						<th>
							주문상태
						</th>
						<th>
							확인
						</th>
					</tr>
					<c:if test="${fn:length(ordrList) le 0}">
						<tr>
							<td colspan="6" height="100px;"><h1 class="title_Type04">내역이 없습니다.</h1></td>
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
									<p>
										 <fmt:formatDate value="${ordr.CREATE_DT}"  pattern="yyyy-MM-dd"/>
									</p>
									<p class="cart_txt06" data-value="<c:out value="${ordr.ORDR_ID}"/>">
										(<c:out value="${ordr.ORDR_ID}"/>)
									</p>
								</td>
							</c:if>	
							<td>
								<div class="cart_img" style="vertical-align: middle;">
						<c:choose>
						<c:when test="${fn:indexOf(ordr.PRDT_IMG, '//') >=0 }">
						<img src="${ordr.PRDT_IMG}" alt="샘플사진" class="cart_pic" onerror="this.src='${staticRoot}/img/sample03.jpg'"/> 
						</c:when>
						<c:otherwise>
									<img src="${upload}${ordr.PRDT_IMG}" alt="샘플사진" class="cart_pic" onerror="this.src='${staticRoot}/img/sample03.jpg'"/> 
						</c:otherwise>
						</c:choose>
								</div>
							</td>
							<td>
								<p class="cart_txt01">
									<c:out value="${ordr.PRDT_NM}"/>
								</p>
								<p class="cart_txt02">
									<c:out value="${ordr.STNDRD}"/>
								</p>
								<p class="cart_txt02">
									<c:out value="${ordr.MAKR_NM}"/>
								</p>
							</td>
							<td>
								<p class="cart_price02">
									<fmt:formatNumber value="${ordr.SUM_PRICE}" groupingUsed="true"/>원
								</p>
								<p style="margin-top: 5px;">
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
							</td>
							<td>
								<p class=cart_txt04>
									<c:choose>
										<c:when test="${ordr.PAYMETHOD eq 'Card'}">
											카드결제
										</c:when>
										<c:otherwise>
											가상계좌
										</c:otherwise>
									</c:choose>		
								</p>
								<span class="receipt_btn2" data-value="${ordr.TID}" data-type="${ordr.PAYMETHOD}">
									결제 영수증
								</span>
<%-- 							
								<c:if test="${ordr.STTUS ge '3' }">	
									<span class="cart_order_btn" data-item="<c:out value="${ordr.PRDT_NM}"/>" data-idex="<c:out value="${ordr.ORDR_ID}"/>" data-type="<c:out value="${ordr.INVOICE}"/>" data-code="<c:out value="${ordr.DELY_CMP}"/>" data-value="<c:out value="${ordr.DELY_CMP_NM}"/>">
										배송조회
									</span>
								</c:if>
 --%>								
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
