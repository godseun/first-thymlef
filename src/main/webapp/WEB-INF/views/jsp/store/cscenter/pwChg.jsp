<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/layout/include/base.jsp" %>
	<script type="text/javascript" src="${staticRoot}/js/joinValidate.js"></script>
	<script type="text/javascript" src="${staticRoot}/sdk/sha/sha.js"></script>
	<script type="text/javascript">
		var dupClick1 = false;
		var passPw 	= false;
		var passCkPw 	= false;
		$(function(){  
			$('#rePw').on('keyup',function(){
				var chkOldPwResult = safety.isEqualsPw('oldPw','rePw');
				if( chkOldPwResult != 'OK' ) {
					var pw 			= $('#rePw').val();
					if(!_BT.isEmpty(pw)){
						passPw = true;
						chkPwResult = safety.checkGadePw(pw);
						if( chkPwResult == '1' ) {
							$('#pwState2').text('비밀번호 강도: 취약');
							$('#pwState2').css('color','#fe0000');	
							return true;
							
						} else if( chkPwResult == '2' ) {
							$('#pwState2').css('color','#f37021');	
							$('#pwState2').text('비밀번호 강도: 보통');
							return true;
							
						} else {
							$('#pwState2').text('비밀번호 강도: 강함');
							$('#pwState2').css('color','#3f51b5');		
							return true;
						}
					}
				}
			});
			$('#rePw').on('keyup',function(){
				passPw 			= false;
				passCkPw 		= false;
				var chkOldPwResult = safety.isEqualsPw('oldPw','rePw');
				if( chkOldPwResult == 'OK' ) {
					passCkPw = false;
					$('#pwState2').removeClass('vOff');
					$('#pwState2').text('현재비밀번호와 변경하실 비밀번호가 동일 합니다.');
					$('#pwState2').css('color','#fe0000');	
					return false;
				}
				var chkPwResult = safety.isEqualsPw('rePw','ckPw');
				if( chkPwResult != 'OK' ) {
					$('#ckPwState2').removeClass('vOff');
					$('#ckPwState2').text(chkPwResult.desc);
					$('#ckPwState2').css('color','#fe0000');	
				} else {
					passCkPw = true;
					$('#ckPwState2').text('비밀번호가 일치 합니다.');
					$('#ckPwState2').css('color','#3f51b5');	
				}
				var pw 			= $(this).val();
				var chkPwResult = safety.safetyCheck(pw);
				if( chkPwResult != 'OK' ) {
					$('#pwState2').removeClass('vOff');
					$('#pwState2').text(chkPwResult.desc);
					$('#pwState2').css('color','#fe0000');	
					return false;
				}else{				
					passPw = true;
					chkPwResult = safety.checkGadePw(pw);
					if( chkPwResult == '1' ) {
						$('#pwState2').text('비밀번호 강도: 취약');
						$('#pwState2').css('color','#fe0000');	
						return true;
						
					} else if( chkPwResult == '2' ) {
						$('#pwState2').css('color','#f37021');	
						$('#pwState2').text('비밀번호 강도: 보통');
						return true;
						
					} else {
						$('#pwState2').text('비밀번호 강도: 강함');
						$('#pwState2').css('color','#3f51b5');		
						return true;
					}
				}
			});
			$('#ckPw').on('keyup',function(){
				passCkPw 		= false;
				var chkPwResult = safety.isEqualsPw('rePw','ckPw');
				if( chkPwResult != 'OK' ) {
					$('#ckPwState2').removeClass('vOff');
					$('#ckPwState2').text(chkPwResult.desc);
					$('#ckPwState2').css('color','#fe0000');	
				} else {
					passCkPw = true;
					$('#ckPwState2').text('비밀번호가 일치 합니다.');
					$('#ckPwState2').css('color','#3f51b5');	
				}
			}); 		
		});
		function fnNextStep(){
			if( dupClick1 ) {
				alert('비밀번호 재설정 중 입니다.\n\n잠시만 기다려주세요.');
				return false;
			}
			if(_BT.isEmptyById('oldPw',   '비밀번호를 입력해 주세요.')) return false;
			if(_BT.isEmptyById('rePw',		'변경하실 비밀번호를 입력해 주세요.')) return false;
			if(_BT.isEmptyById('ckPw',    '변경하실 비밀번호를 다시한번 입력해 주세요.')) return false;
			if(!passPw){
				alert(_BT.getText('pwState2'));
				return false;
			}	
			if(!passCkPw){
				alert(_BT.getText('ckPwState2'));
				return false;
			}	
			if(!confirm('비밀번호를 재설정 하시겠습니까?')){
				return false;
			}
			
			var shaObj = new jsSHA($('#oldPw').val(), 'ASCII');
			$('#shaPw').val(shaObj.getHash('SHA-256', 'HEX'));
			
			shaObj = new jsSHA($('#rePw').val(), 'ASCII');
			$('#shaRePw').val(shaObj.getHash('SHA-256', 'HEX'));
			
			dupClick1 = true;
			_BT.ajaxCallbackSubmit('pwFrm',  _BT.STORE.URL.Common.SetLoginPw, function(data) {
				dupClick1 = false;
				if($(data).size() > 0) {
					if(_BT.isEquals(data.code, 'success')) {
						alert('비밀번호 변경 완료 하였습니다.');
						return false;
					}else if(_BT.isEquals(data.code, 'nochang')) {
						alert('비밀번호변경 처리를 하지 못 했습니다.\n\n현재 비밀번호를 확인 부탁 드립니다.');
						return false;
					}else{
						alert('비밀번호변경 처리를 하지 못 했습니다.\n\n잠시 후 다시 확인 부탁 드립니다.');
						return false;
					}
				}else{
					alert('비밀번호변경 처리를 하지 못 했습니다.\n\n잠시 후 다시 확인 부탁 드립니다.');
					return false;
				}
			},
			function(xhr, status, error) {
				dupClick1 = false; 
				alert('비밀번호변경 처리중 오류가 발생했습니다.\n\n잠시 후 다시 확인 부탁 드립니다.');
				return false;
			});
		}
	</script>
	<div class="storeSection" style="min-height:600px;">
	 	<div class="tab_bar">
			<ul class="tab_list">
				<li class="tab_item">
					<a href="javascript:;" class="tab_link" onclick="_BT.moveUrl(_BT.STORE.URL.CsCenter.Mypage);">
						<span id="tab1" class="tab<c:if test="${lnb.sId eq 1}"> tabOn</c:if>">나의정보</span>
					</a>
				</li>
				<li class="tab_item">
					<a href="javascript:;" class="tab_link" onclick="_BT.moveUrl(_BT.STORE.URL.CsCenter.PwChg);">
						<span id="tab2" class="tab<c:if test="${lnb.sId eq 2}"> tabOn</c:if>">비밀번호변경
					</a>
				</li>
			</ul>
		</div>
		<h1 class="title_con_Type01 margintop_30">
			로그인 비밀번호 변경						
		</h1>
		<table class="join_form border_bottom">
			<caption>연락처 정보</caption>
			<colgroup>
				<col width="18%">
				<col width="*">
			</colgroup>
			<tbody>		
				<tr>
					<th>현재비밀번호</th>
					<td>
						<input type="password" class="join_form_input03" id="oldPw" name="oldPw" maxlength="50" placeholder="비밀번호를 입력해 주세요."/>
						<span class="pw_check_ment ment vOff" id="pwState1" style="padding:0px;">비밀번호를 입력해 주세요.</span>
					</td>
				</tr>	
				<tr>
					<th>변경비밀번호</th>
					<td>
						<input type="password" class="join_form_input03" id="rePw" name="rePw" maxlength="50" placeholder="영문 + 숫자 포함 6자리 이상"/>
						<span class="pw_check_ment ment vOff" id="pwState2" style="padding:0px;">비밀번호를 입력해 주세요.</span>
					</td>
				</tr>
				<tr>
					<th>변경비밀번호 확인</th>
					<td>
						<input type="password" class="join_form_input03" id="ckPw" name="ckPw" maxlength="50" placeholder="변경할 비밀번호를 다시 입력해 주세요."/>
						<span class="pw_check_ment ment vOff" id="ckPwState2" style="padding:0px;">비밀번호를 다시한번 입력해 주세요.</span>								
					</td>
				</tr>
			</tbody>
		</table>
		<form id="pwFrm" name="pwFrm">
			<input type="hidden" id="shaPw" name="shaPw" />
			<input type="hidden" id="shaRePw" name="shaRePw" />
		</form>
		<div class="btn_content01 margintop_40">
			<span class="bOn" id="btnNext" onclick="fnNextStep();" >
				변경
			</span>
		</div>
	</div>
