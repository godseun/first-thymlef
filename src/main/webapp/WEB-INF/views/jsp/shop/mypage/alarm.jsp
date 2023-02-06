<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/layout/include/base.jsp" %>
	<style>
		.dropRmk{display: inline-block;width:200px; float:left; text-align:left;margin:5px 0;}
	</style>
	<div class="section" style="min-height:1000px;">
		<h1 class="title_Type03">
			알림설정
			<div class="sub_location">
				<div class="list_location01">
					<span class="txt01">마이페이지</span>
					<span class="arrow"><img src="${staticRoot}/img/bl_01.jpg" alt=">" /></span>
					<span class="last_txt">알림설정</span>
				</div>
			</div>
		</h1>
		<h1 class="title_con_Type01 margintop_30">
			알림설정						
		</h1>	
		<form id="aFrm" name="aFrm">					
			<table class="tbl_Type01 margintop_30">
				<caption>알림설정 정보입력</caption>
				<colgroup>
					<col width="15%">
					<col width="65%">
					<col width="20%">
				</colgroup>
				<tbody>
					<tr>
						<th>구분</th>
						<th>내 용</th>
						<th>선택</th>
					</tr>
					
					<tr>
						<td class ="place">이메일 수신여부</td>
						<td style="text-align: left;">
							이메일 수신동의 하시면 대화 메일을 통해 인기/프로모션 상품, 각종 이벤트/기획전 등의 정보를 우선적으로 받아보실 수 있습니다.<br/><br/> 
							회원 정보관련 / 주문배송관련등의 메일은 수신동의와 상관없이 모든 회원에게 발송됩니다.
						</td>
						<td>
							<input id="click01" name="EMAIL_AD" value="Y" class="join_checkbox" type="radio" <c:if test="${alarmInfo.EMAIL_AD eq 'Y'}">checked="checked"</c:if>><label class="join_form_check" for="click01">수신동의</label>
							<input id="click02" name="EMAIL_AD" value="N" class="join_checkbox" type="radio" <c:if test="${alarmInfo.EMAIL_AD eq 'N'}">checked="checked"</c:if>><label class="join_form_check" for="click02">수신안함</label>
						</td>
					</tr>
					<tr>
						<td class ="place" rowspan="2">SMS 수신 여부</td>
						<td style="text-align: left;">거래정보(결제/반송/반품/교환/환불 등)와 관련된 SMS 수신을 받으시겠습니까?</td>
						<td>
							<input id="click03" name="SMS_NOT" value="Y" class="join_checkbox" type="radio" <c:if test="${alarmInfo.SMS_NOT eq 'Y'}">checked="checked"</c:if>><label class="join_form_check" for="click03">수신동의</label>
							<input id="click04" name="SMS_NOT" value="N" class="join_checkbox" type="radio" <c:if test="${alarmInfo.SMS_NOT eq 'N'}">checked="checked"</c:if>><label class="join_form_check" for="click04">수신안함</label>
						</td>
					</tr>
					<tr>
						<td style="text-align: left;">쇼핑이벤트와 혜택에 대한 소식 안내를 SMS로 받으시겠습니까?</td>
						<td>
							<input id="click05" name="SMS_AD" value="Y" class="join_checkbox" type="radio" <c:if test="${alarmInfo.SMS_AD eq 'Y'}">checked="checked"</c:if>><label class="join_form_check" for="click05">수신동의</label>
							<input id="click06" name="SMS_AD" value="N" class="join_checkbox" type="radio" <c:if test="${alarmInfo.SMS_AD eq 'N'}">checked="checked"</c:if>><label class="join_form_check" for="click06">수신안함</label>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
		
		
<!-- 		
		<h1 class="title_con_Type01 margintop_70">
			관심 카테고리 알림 설정						
		</h1>						
		<table class="tbl_Type01 margintop_30">
			<caption>관심 카테고리 알림설정</caption>
			<colgroup>
				<col width="18%">
				<col width="18%">
				<col width="18%">
				<col width="18%">
				<col width="18%">
				<col width="10%">
			</colgroup>
			<tbody>
				<tr>
					<th>카테고리1</th>
					<th>카테고리2</th>
					<th>카테고리3</th>
					<th>카테고리4</th>
					<th>카테고리5</th>
					<th>구분</th>
				</tr>
				<tr>
					<td>
						<div class="return_select2">
							<select class="ca" id="ca1" name="ca1" data-value="1">
								<option value="">1단계</option>
							</select>
						</div>
					</td>
					<td>
						<div class="return_select2">
							<select class="ca" id="ca2" name="ca2" data-value="2">
								<option value="">2단계</option>
							</select>
						</div>
					</td><td>
						<div class="return_select2">
							<select class="ca" id="ca3" name="ca3" data-value="3">
								<option value="">3단계</option>
							</select>
						</div>
					</td><td>
						<div class="return_select2">
							<select class="ca" id="ca4" name="ca4" data-value="4">
								<option value="">4단계</option>
							</select>
						</div>
					</td><td>
						<div class="return_select2">
							<select class="ca" id="ca5" name="ca5" data-value="5">
								<option value="">5단계</option>
							</select>
						</div>
					</td>
					<td><span class="join_form_btn02 marginleft_7">삭 제</span></td>						
				</tr>
			</tbody>
		</table>
		<div class="signup_agree">
			<p class="alarm_txt">※ <span class="redCr bTxt" >관심 카테고리</span>를 설정 하시면 해당 카테고리 상품의 <span class="redCr bTxt" >프로모션 / 이벤트 소식, 재고 상품 등록 알림</span>을 가장 빨리 만나 보실 수 있습니다.</p>
		</div>
 -->		
		<div class="cart_btn margintop_30">
			<span  class="btn_06" onclick="fnNext();">
				저 장
			</span>
<!-- 			
			<span  class="btn_02">
				알림설정 추가
			</span>		
 -->						
		</div>		
		
		<h1 class="title_con_Type01 margintop_30">
			회원탈퇴		
		</h1>	
		
		<div class="signup_agree margintop_10">
			<p class="alarm_txt">※ 회원 탈퇴전 다음 사항을 꼭 숙지하시기 바랍니다.</p>
			<p class="alarm_txt margintop_5" >※ 회원 탈퇴 시 회원님께서 보유하셨던 비현금성 포인트와 마일리지, 회원정보, 거래정보 등은 모두 삭제 됩니다.</p>
			<p class="alarm_txt margintop_5" >※ 회원 탈퇴 후 1개월동안 회원의 성명, 아이디(ID), 비밀번호(Password), 이메일(E-mail), 연락처 정보를 보관 하며, 로그기록, 접속아이피(IP)정보는 12개월간 보관합니다.</p>
			<p class="alarm_txt margintop_5" >※ 거래 정보가 있는 경우, 판매 거래 정보관리를 위하여 구매와 관련된 상품정보, 아이디, 거래 내역 등에 대한 기본정보는 탈퇴 후 5년간 보관합니다.</p>
			<p class="alarm_txt margintop_5" >※ 회원 탈퇴 후 재가입 시에는 신규 회원 가입으로 처리되며, 탈퇴 전의 회원정보와 거래정보 및 포인트, 마일리지, 쿠폰 정보등은 복구되지 않습니다.</p>
 			<p class="alarm_txt margintop_10" >※ 서비스 이용 중 불편사항은 언제든지 연락 주시면, 최선을 다해 해결 되도록 노력하겠습니다.</p> 	
		</div>
		<form id="dropFrm" name="dropFrm">			
			<input type="hidden" id="shaPw" name="shaPw" value=""/>		
			<input type="hidden" id="rmkChk" name="rmkChk" value=""/>		
			<table class="tbl_Type01 margintop_30">
				<caption>탈퇴 사유</caption>
				<colgroup>
					<col width="25%">
					<col width="75%">
				</colgroup>
				<tbody>
					<tr>
						<th>대화 서비스 이용 중 불편 사항을 선택해 주세요.(복수 선택가능)</th> 
					</tr>
					<tr>
						<td style="padding-left:100px;">
							<div class="dropRmk">
								<input type="checkbox" id="rmk01" name="rmk01" value="1" class="chk"/><label for="rmk01" class="signup_txt">상품 다양성/가격품질 불만</label>
							</div>
							<div class="dropRmk">
							<input type="checkbox" id="rmk02" name="rmk02" value="2" class="chk"/><label for="rmk02" class="signup_txt">교환/환불/품질불만</label>
							</div>
							<div class="dropRmk">
							<input type="checkbox" id="rmk03" name="rmk03" value="3" class="chk"/><label for="rmk03" class="signup_txt">배송지연</label>
							</div>							
							<div class="dropRmk">
							<input type="checkbox" id="rmk04" name="rmk04" value="4" class="chk"/><label for="rmk04" class="signup_txt">이용빈도 낮음</label>
							</div>
							<div class="dropRmk">
							<input type="checkbox" id="rmk05" name="rmk05" value="5" class="chk"/><label for="rmk05" class="signup_txt">회원특혜/쇼핑혜택 부족</label>
							</div>
							<div class="dropRmk">
							<input type="checkbox" id="rmk06" name="rmk06" value="6" class="chk"/><label for="rmk06" class="signup_txt">A/S 불만</label>
							</div>
							<div class="dropRmk">
							<input type="checkbox" id="rmk07" name="rmk07" value="7" class="chk"/><label for="rmk07" class="signup_txt">쇼핑몰 기능불만</label>
							</div>
							<div class="dropRmk">
							<input type="checkbox" id="rmk08" name="rmk08" value="8" class="chk"/><label for="rmk08" class="signup_txt">기타</label>		
							</div>				
						</td>						
					</tr>
					<tr>
						<th>그 이외에 대화에 남기고 싶으신 의견이 있으시면 기재해 주세요.</th> 
					</tr>					
					<tr>
						<td><input type="text" class="join_form_input05" id="rmk" name="rmk" value="" placeholder="" style="width:80%;"/></td>					
					</tr>							
				</tbody>
			</table>
		</form>
<!-- 		
		<table class="tbl_Type01">
			<caption>탈퇴 사유</caption>
			<colgroup>
				<col width="25%">
				<col width="75%">
			</colgroup>
			<tbody>
				<tr>
					<th>비밀번호를 입력해주세요</th> 
					<td style="text-align:left; padding-left:20px;"><input class="login_input_Type m_c10_01_input_01" type="password" id="pw"  placeholder="비밀번호를 입력해 주세요."></td>	
				</tr>						
			</tbody>
		</table>	
 -->			
		<div class="cart_btn margintop_30">
			<span  class="btn_06" onclick="fnDropOut();">
				탈퇴
			</span>
		</div>
	</div>
	
	<script type="text/javascript" src="${staticRoot}/js/allCteg.js"></script>
	<script type="text/javascript">
		var dupClick1 = false;
		$(function(){  
			$( '.ca' ).on('change', function() {
				var cSel= eval($(this).data('value')+1);
				_BT.CategSearch.clearSelect(cSel);
				_BT.CategSearch.makeSelect(cSel, $(this).val());
	    	}); 
			initSelect();
		});
		function initSelect(){
			_BT.CategSearch.makeSelect('1');
		}
		function fnNext(){
			if( dupClick1 ) {
				alert("처리중 입니다. 잠시만 기다려주세요.");
				return false;
			}
			if(!confirm("알림 정보를 저장 하시겠습니까?")) {
				return false;
			}
			dupClick1 = true; 
			_BT.ajaxCallbackSubmit("aFrm",  _BT.SHOP.URL.User.SetAlarm, 
			function(data) {
				dupClick1 = false;
				if($(data).size() > 0) { 
					if(_BT.isEquals(data.code, "success")){
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
				alert("처리중 오류가 발생했습니다.\n\n다시 확인 부탁 드립니다.");
				return false;
			});	
		}
		function fnDropOut(){
			if( dupClick1 ) {
				alert("처리중 입니다. 잠시만 기다려주세요.");
				return false;
			}
			var rmkChk ="";

			$( ".chk" ).each(function( i ) {
				if(_BT.isChecked($(this).attr("id"))){
					rmkChk +=  $(this).val() +","; 
				}
			});
			$('#rmkChk').val(rmkChk);
			if(!confirm("회원탈퇴 후 복구가 불가 합니다.\n\n회원 탈퇴 하시겠습니까?")) {
				return false;
			}
			dupClick1 = true; 
			_BT.ajaxCallbackSubmit("dropFrm",  _BT.SHOP.URL.User.DropOut, 
			function(data) {
				dupClick1 = false;
				if($(data).size() > 0) { 
					if(_BT.isEquals(data.code, "success")){
						alert(data.msg);
						_BT.moveUrl(_BT.SHOP.URL.Common.Logout);
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
	</script>