<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/layout/include/base.jsp" %>
	<script type="text/javascript">
		var dupClick1 		= false;
		var passSend		= true;
		var chkAuthNo	= false;
		var oldMobileNo	= '';
		var mob	 = true;
		$(function(){  
			_BT.Reg.Number('mobile');
			oldMobileNo 	= $('#oldMobileNo').val();
			$('.mobile').on('change', function(){
				var mobileNo		= _BT.getJoinData('-', new Array('mobile1','mobile2','mobile3'));
				if(mobileNo != oldMobileNo){
					mob	 = false;
					$('#sendSMS').addClass('btnOn');
				}
			});
			$('#clickTax').on('change', function(){
				if($("#clickTax").prop("checked")){
					$('#tax_info_box').removeClass("vOff");
				}else{
					$('#tax_info_box').addClass("vOff");
				} 
			});
		});
		function fnSendSMS() {
			if(_BT.isEmptyById('mobile2',    '휴대폰 번호를 입력해 주세요.')) return false;
			if(_BT.isEmptyById('mobile3',    '휴대폰 번호를 입력해 주세요.')) return false;
			var mobileNo		= _BT.getJoinData('-', new Array('mobile1','mobile2','mobile3'));
			if( oldMobileNo ==  mobileNo) {
				alert('변경내역이 없습니다.');
				return false;
			}
			if( dupClick1 ) {
				alert('인증번호 발송중 입니다. 잠시만 기다려주세요.');
				return false;
			}
			passSend = false;
			chkAuthNo = false;
   			$('#authMobileNum').val(mobileNo);
   			$('#mobileNo').val(mobileNo);
   			dupClick1 = true;
			_BT.ajaxCallbackSubmit('ajaxFrm',  _BT.SHOP.URL.Join.sendAuthNo, function(data) {
				dupClick1 = false;
				if($(data).size() > 0) {
					if(_BT.isEquals(data.code, 'success')) {
						passSend = true;
						$('#ckSmsState').addClass('vBlock');
						$('#ckSmsState').css('color','#3f51b5');	
						$('#ckSmsState').text('인증번호를 발송했습니다.인증번호는 10분간 유효 합니다.');	
						$('#authSpan').addClass('vBlock');
						alert('인증번호를 발송했습니다.\n\n인증번호는 10분간 유효 합니다.');
					}else if(_BT.isEquals(data.code, 'dupMobileNo')) {
						$('#ckSmsState').addClass('vBlock');
						$('#ckSmsState').text('이미 등록된 휴대폰 번호 입니다.확인 부탁 드립니다.');
						$('#ckSmsState').css('color','#fe0000');	
						alert('이미 등록된 휴대폰 번호 입니다.\n\n확인 부탁 드립니다.');
					}else{
						$('#ckSmsState').addClass('vBlock');
						$('#ckSmsState').text('인증번호 발송중 오류가 발생했습니다. 잠시 후 다시 확인 부탁 드립니다.');
						$('#ckSmsState').css('color','#fe0000');	
					}
				}else{
					$('#ckSmsState').addClass('vBlock');
					$('#ckSmsState').text('인증번호 발송중 오류가 발생했습니다. 잠시 후 다시 확인 부탁 드립니다.');
					$('#ckSmsState').css('color','#fe0000');	
				}
			},
			function(xhr, status, error) {
				dupClick1 = false;
				$('#ckSmsState').addClass('vBlock');
				$('#ckSmsState').text('인증번호 발송중 오류가 발생했습니다. 잠시 후 다시 확인 부탁 드립니다.');
				$('#ckSmsState').css('color','#fe0000');	
			});	
		}
		function fnChkAuthNo(){
			if($('#authNo').val().length < 6){
				$('#ckAuthNoState').text('인증번호 6자리를 입력해주세요.');	
				return false;
			}
			if( dupClick1 ) {
				alert('인증번호 확인중 입니다. 잠시만 기다려주세요.');
				return false;
			}
			dupClick1 	= true;
			chkAuthNo = false;
			$('#authNum').val($('#authNo').val()); 
				_BT.ajaxCallbackSubmit('ajaxFrm', _BT.SHOP.URL.Join.checkAuthNo, function(data) {
				dupClick1 = false;
				if($(data).size() > 0) {
					if(_BT.isEquals(data.code, 'success')) {
						if(data.value == '1') {
							chkAuthNo = true;
						}
					}
				}
			},
			function(xhr, status, error) {
				dupClick1 = false;
			});	
			if(chkAuthNo){
				$('#ckSmsState').text('인증을 완료 하였습니다.');	
				$('#authSpan').removeClass('vBlock');
				$('#smsRcvAgreeSpan').removeClass('vOff');
				$('#sendSMS').addClass('vOff');
				$('.mobile').attr('disabled', 'disabled');
			}else{
				$('#ckAuthNoState').text('인증정보가 유효하지 않습니다. 다시 확인 바랍니다.');	
			}
		}
		function fnNextStep(){
			if( dupClick1 ) {
				alert('변경 정보를 저장 중 입니다. 잠시만 기다려주세요.');
				return false;
			}
			if($("#clickTax").prop("checked")){
				if(_BT.isEmptyById("cmpNm",    	"상호를 입력해 주세요.")) return false;
				if(_BT.isEmptyById("prsNm",    	"대표자명을 입력해 주세요.")) return false;
				if(_BT.isEmptyById("busiNo1",    	"사업자번호를 입력해 주세요.")) return false;
				if(_BT.isEmptyById("busiNo2",    	"사업자번호를 입력해 주세요.")) return false;
				if(_BT.isEmptyById("busiNo3",    	"사업자번호를 입력해 주세요.")) return false;
				if(_BT.isEmptyById("bizCnd",    	"업태를 입력해 주세요.")) return false;
				if(_BT.isEmptyById("induty",    	"종목을 입력해 주세요.")) return false;
				if(_BT.isEmptyById("address",    	"주소를 입력해 주세요.")) return false;
				if(_BT.isEmptyById("taxEmail",    "이메일을 입력해 주세요.")) return false;
				var busiNo = _BT.getJoinData('-', new Array('busiNo1','busiNo2','busiNo3'));
				if(busiNo.length == 12){
					$('#busiNo').val(busiNo);
				}else{
					alert('사업자번호를 확인해 주세요');
					return false;
				}
			}
			if(!confirm('내역을 저장 하시겠습니까?')){return false;}
			dupClick1 	= true;
			if(chkAuthNo)
				$('#mobileNo').val(_BT.getJoinData('-', new Array('mobile1','mobile2','mobile3')));
			else
				$('#mobileNo').val($('#oldMobileNo').val());
				
			_BT.ajaxCallbackSubmit('infoFrm', _BT.SHOP.URL.User.ChgInfo, function(data) {
				dupClick1 = false;
				if($(data).size() > 0) {
					if(_BT.isEquals(data.code, 'success')) {
						alert(data.msg);
						_BT.moveUrl(_BT.SHOP.URL.User.Info);
						return false;
					}else{
						alert(data.msg);
						return false;
					}
				}
			},
			function(xhr, status, error) {
				dupClick1 = false;
			});	
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
		
		function fnMngAddr(){
			_BT.openPopup( _BT.SHOP.URL.User.popAddr2,"fnMngAddr", "610", "700", true, true);
		}
		function refresh(){
			_BT.moveUrl(_BT.SHOP.URL.User.Info);
		}
	</script>
	<div class="section">
	 	<div class="tab_bar margintop_20" style="width: 100%;">
			<ul class="tab_list">
				<li class="tab_item" style="width: 100px;">
					<a href="javascript:;" class="tab_link" onclick="_BT.moveUrl(_BT.SHOP.URL.User.Info);" data-type="tab1"><span id="tab1" class="tab tabOn" style="width: 100px;">내정보</span></a>
				</li>
				<li class="tab_item" style="width: 100px;">
					<a href="javascript:;" class="tab_link" onclick="_BT.moveUrl(_BT.SHOP.URL.User.JJIM);" data-type="tab2"><span id="tab2" class="tab"  style="width: 100px;">관심상품</span></a>
				</li>
				<li class="tab_item" style="width: 100px;">
					<a href="javascript:;" class="tab_link" onclick="_BT.moveUrl(_BT.SHOP.URL.Order.OrderList);" data-type="tab3"><span id="tab3" class="tab"  style="width: 100px;">구매내역</span></a>
				</li>
			</ul>
		</div>
		<h1 class="title_con_Type01 margintop_30">
			기본정보						
		</h1>
		<form id="ajaxFrm" name="ajaxFrm">
			<input type="hidden" id="authMobileNum" name="authMobileNum" />
			<input type="hidden" id="authNum" name="authNum" />
		</form>
		<form id="infoFrm" name="infoFrm">
			<table class="join_form">
				<caption>정보입력</caption>
				<colgroup>
					<col width="20%">
					<col width="80%">
				</colgroup>
				<tbody>							
					<tr>
						<th>이메일</th>
						<td style="height: 32px;">
							<c:out value="${userInfo.EMAIL}"/>
						</td>
					</tr>
					<tr>
						<th>휴대폰</th>
						<td style="height: 32px;">
							<input type="hidden" id="oldMobileNo" name="oldMobileNo" value="<c:out value="${userInfo.MOBILE}"/>"/>
							<select name="mobile1" id="mobile1" class="join_form_select02 mobile" style="width: 28%;max-width:60px;">
								<option value="010" <c:if test="${fn:split(userInfo.MOBILE,'-')[0] eq '010'}">selected="selected"</c:if>>010</option>
								<option value="011" <c:if test="${fn:split(userInfo.MOBILE,'-')[0] eq '011'}">selected="selected"</c:if>>011</option>
								<option value="016" <c:if test="${fn:split(userInfo.MOBILE,'-')[0] eq '016'}">selected="selected"</c:if>>016</option>
								<option value="017" <c:if test="${fn:split(userInfo.MOBILE,'-')[0] eq '017'}">selected="selected"</c:if>>017</option>
								<option value="018" <c:if test="${fn:split(userInfo.MOBILE,'-')[0] eq '018'}">selected="selected"</c:if>>018</option>
								<option value="019" <c:if test="${fn:split(userInfo.MOBILE,'-')[0] eq '019'}">selected="selected"</c:if>>019</option>
							</select>
							<span class="join_form_txt">-</span>
							<input type="text" class="join_form_input01 mobile inAddr" id="mobile2" maxlength="4" value="${fn:split(userInfo.MOBILE,'-')[1]}" style="width: 28%;max-width:50px;">
							<span class="join_form_txt">-</span>
							<input type="text" class="join_form_input01 mobile inAddr" id="mobile3" maxlength="4" value="${fn:split(userInfo.MOBILE,'-')[2]}" style="width: 28%;max-width:50px;">
							<span class="join_form_btn03 marginleft_5" onclick="fnSendSMS();" id="sendSMS">인증</span>
							<span class="pass_tell_ment margintop_5 vOff" id="ckSmsState"></span>
							<span class="vOff margintop_5" id = "authSpan">
								<input type="text" name="authNo" id="authNo" class="join_form_input03" placeholder="인증번호를 입력해주세요." maxlength="6" size="6" />
								<span class="join_form_btn01" onclick="fnChkAuthNo();">인증하기</span>
								<span class="pass_tell_ment margintop_5 vBlock" id="ckAuthNoState"></span>
							</span>
						</td>
					</tr>
					<tr>
						<th>이름</th>
						<td style="height: 32px;">
							<input type="hidden" id="mobileNo" name="mobileNo" value=""/>
							<input type="hidden" id="oldUsrNm" name="oldUsrNm" value="<c:out value="${userInfo.USR_NM}"/>"/>
							<input type="text" class="join_form_input01" id="usrNm" name="usrNm" value="<c:out value="${userInfo.USR_NM}"/>" style="width: 80%;"/>
						</td>
					</tr>
					<tr>
						<th>가입일</th>
						<td style="height: 32px;">
							<fmt:formatDate type = "date" value = "${userInfo.JOIN_DT}" />
						</td>
					</tr>
					<tr>
						<th>세금계산서 자동발급</th>
						<td style="height: 32px;">
							<input type="checkbox"  id="clickTax" name="clickTax" <c:if test="${userInfo.AUTO_TAXBILL eq 'Y'}">checked="checked"</c:if>/><label for="clickTax"> 세금계산서 자동 발급요청</label>
							<div class="signup_agree" style="line-height: 150%;">
								<p class="alarm_txt">- 주문완료 후 자동으로 계산서 발행 요청됩니다. 세금계산서 발행에 필요한 내역을 입력해 주세요.</p>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
			<div id="tax_info_box" class='<c:if test="${userInfo.AUTO_TAXBILL eq 'N'}">vOff</c:if>'>
				<h1 class="title_con_Type01 margintop_40">
					세금계산서 정보						
				</h1>
				<table class="join_form">
					<caption>정보입력</caption>
					<colgroup>
						<col width="20%">
						<col width="80%">
					</colgroup>
					<tbody>							
						<tr>
							<th>상호(법인명)</th>
							<td col style="height: 32px;">
								<input type="text" class="join_form_input01" id="cmpNm" name="cmpNm" value="<c:out value="${userInfo.CMP_NM}"/>" placeholder="상호를 입력해 주세요" style="width: 80%;"/>
							</td>
						</tr>
						<tr>
							<th>대표자</th>
							<td style="height: 32px;">
								<input type="text" class="join_form_input01" id="prsNm" name="prsNm" value="<c:out value="${userInfo.RPRSNTV_NM}"/>" placeholder="대표자명을 입력해 주세요" style="width: 80%;"/>
							</td>
						</tr>
						<tr>
							<th>사업자 번호</th>
							<td style="height: 32px;">
								<input type="hidden" id="busiNo" name="busiNo" value=""/>
								<input type="text" class="join_form_input01" id="busiNo1" name="busiNo1" maxlength="3" placeholder="3자리 숫자" value="${fn:split(userInfo.CMP_BIZ_NO,'-')[0]}" style="width: 30%;max-width:50px;"><span class="join_form_txt">-</span>
								<input type="text" class="join_form_input01" id="busiNo2" name="busiNo2" maxlength="2" placeholder="2자리 숫자" value="${fn:split(userInfo.CMP_BIZ_NO,'-')[1]}" style="width: 20%;max-width:50px;"><span class="join_form_txt">-</span>
								<input type="text" class="join_form_input01" id="busiNo3" name="busiNo3" maxlength="5" placeholder="5자리 숫자" value="${fn:split(userInfo.CMP_BIZ_NO,'-')[2]}" style="width: 50%;max-width:80px;">
							</td>
						</tr>				
						<tr>
							<th>업태</th>
							<td style="height: 32px;">
								<input type="text" class="join_form_input01" id="bizCnd" name="bizCnd" value="<c:out value="${userInfo.BIZCND}"/>" placeholder="업태를 입력해 주세요" style="width: 80%;"/>
							</td>
						</tr>
						<tr>
							<th>종목</th>
							<td style="height: 32px;">
								<input type="text" class="join_form_input01" id="induty" name="induty" value="<c:out value="${userInfo.INDUTY}"/>" placeholder="종목을 입력해 주세요" style="width: 80%;"/>
							</td>
						</tr>
						<tr>
							<th>주소</th>
							<td style="height: 32px;">
								<input type="text" class="join_form_input01" id="address" name="address" value="<c:out value="${userInfo.ADDRESS}"/>" placeholder="주소를 입력해 주세요" style="width: 80%;"/>
							</td>
						</tr>
						<tr>
							<th>이메일</th>
							<td style="height: 32px;">
								<input type="text" class="join_form_input01" id="taxEmail" name="taxEmail" value="<c:out value="${userInfo.TAX_EMAIL}"/>" placeholder="이메일을 입력해 주세요" style="width: 80%;"/>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</form>
		<div class="cart_btn margintop_50">
			<span class="btn_01" onclick="fnNextStep();">
				저 장
			</span>
		</div>
		<h1 class="title_con_Type01 margintop_50">
			배송정보						
		</h1>
			<table class="tbl_Type01 margintop_30">
				<caption>정보입력</caption>
				<colgroup>
					<col width="10%">
					<col width="10%">
					<col width="10%">
					<col width="15%">
					<col width="%">
				</colgroup>
				<tbody>
					<tr>
						<th>구분</th>
						<th>배송지명</th>
						<th>받는사람</th>
						<th>연락처</th>
						<th>주 소</th>
					</tr>
					<c:if test="${fn:length(addrList) le 0}">
						<tr>
							<td colspan="5" height="100px;"><h1 class="title_Type04">배송지 정보가 없습니다.</h1></td>
						</tr>
					</c:if>	
					<c:forEach items="${addrList}" var="addr1" varStatus="status"> 
						<tr>
							<td><c:if test="${addr1.BASE_ADDR_YN eq 'Y'}">대표</c:if></td>
							<td><c:out value="${addr1.ADDR_NM}"/></td>
							<td><c:out value="${addr1.RECV_NM}"/></td>
							<td><c:out value="${addr1.TEL_NO_1}"/></td>
							<td style="text-align: left;">(<c:out value="${addr1.ZIP_CODE}"/>) <c:out value="${addr1.ADDRESS}"/> <c:out value="${addr1.ADDRESS_DETAIL}"/></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class="cart_btn margintop_50">
				<span class="btn_02" onclick="fnMngAddr();">
					배송지 관리
				</span>
			</div>
			<form id="ajaxFrm" name="ajaxFrm">
				<input type="hidden" id="authMobileNum" name="authMobileNum" />
				<input type="hidden" id="authNum" name="authNum" />
			</form>
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
							<td class ="place" rowspan="2">SMS 수신여부</td>
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
			<div class="cart_btn margintop_30">
				<span  class="btn_06" onclick="fnNext();">
					저 장
				</span>
			</div>		
		</div>
