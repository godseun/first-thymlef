<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<%@ include file="/WEB-INF/views/common/layout/include/base.jsp" %>
	<script type="text/javascript" src="${staticRoot}/js/joinValidate.js"></script>
	<script type="text/javascript" src="${staticRoot}/sdk/sha/sha.js"></script>
	<script type="text/javascript">
		var dupClick1 = false;
		var passPw 	= false;
		var passCkPw 	= false;
		$(function(){
			if( '<c:out value="${pageParm.chk}"/>' == 'noUri' ){
				alert('초기화 정보가 유효하지 않습니다. 처음부터 다시 진행해주시기 바랍니다.');
				_BT.moveUrl(_BT.SHOP.URL.Common.Main);
			}
			$("#rePw").on("keyup",function(){
				passPw 			= false;
				passCkPw 		= false;
				var chkPwResult = safety.isEqualsPw("rePw","ckPw");
				if( chkPwResult != 'OK' ) {
					$("#ckPwState2").removeClass("vOff");
					$("#ckPwState2").text(chkPwResult.desc);
					$("#ckPwState2").css("color","#fe0000");	
				} else {
					passCkPw = true;
					$("#ckPwState2").text("비밀번호가 일치 합니다.");
					$("#ckPwState2").css("color","#3f51b5");	
				}
				var pw 			= $(this).val();
				var chkPwResult = safety.safetyCheck(pw);
				if( chkPwResult != 'OK' ) {
					$("#pwState2").removeClass("vOff");
					$("#pwState2").text(chkPwResult.desc);
					$("#pwState2").css("color","#fe0000");	
					return false;
				}else{				
					passPw = true;
					chkPwResult = safety.checkGadePw(pw);
					if( chkPwResult == '1' ) {
						$("#pwState2").text("비밀번호 강도: 취약");
						$("#pwState2").css("color","#fe0000");	
						return true;
						
					} else if( chkPwResult == '2' ) {
						$("#pwState2").css("color","#f37021");	
						$("#pwState2").text("비밀번호 강도: 보통");
						return true;
						
					} else {
						$("#pwState2").text("비밀번호 강도: 강함");
						$("#pwState2").css("color","#3f51b5");		
						return true;
					}
				}
			});
			$("#ckPw").on("keyup",function(){
				passCkPw 		= false;
				var chkPwResult = safety.isEqualsPw("rePw","ckPw");
				if( chkPwResult != 'OK' ) {
					$("#ckPwState2").removeClass("vOff");
					$("#ckPwState2").text(chkPwResult.desc);
					$("#ckPwState2").css("color","#fe0000");	
				} else {
					passCkPw = true;
					$("#ckPwState2").text("비밀번호가 일치 합니다.");
					$("#ckPwState2").css("color","#3f51b5");	
				}
			}); 		
		});
		function fnNextStep(){
			if( dupClick1 ) {
				alert("비밀번호 재설정 중 입니다.\n\n잠시만 기다려주세요.");
				return false;
			}
			if(!passPw){
				alert(_BT.getText("pwState2"));
				return false;
			}	
			if(!passCkPw){
				alert(_BT.getText("ckPwState2"));
				return false;
			}	
			if(!confirm('비밀번호를 재설정 하시겠습니까?')){
				return false;
			}
			var shaObj = new jsSHA($("#rePw").val(), "ASCII");
			$("#shaRePw").val(shaObj.getHash("SHA-256", "HEX"));
			dupClick1 = true;
			_BT.ajaxCallbackSubmit("frm",  _BT.SHOP.URL.Common.SetLoginPw2, function(data) {
				dupClick1 = false;
				if($(data).size() > 0) {
					if(_BT.isEquals(data.code, "success")) {
						alert("패스워드 변경 완료 하였습니다.\n\n로그인 후 이용 부탁 드립니다.");
						_BT.moveUrl(_BT.SHOP.URL.Common.goLogin);
					}else{
						alert("패스워드변경 처리를 하지 못 했습니다.\n\n잠시 후 다시 확인 부탁 드립니다.");
						return false;
					}
				}else{
					alert("패스워드변경 처리를 하지 못 했습니다.\n\n잠시 후 다시 확인 부탁 드립니다.");
					return false;
				}
			},
			function(xhr, status, error) {
				dupClick1 = false; 
				alert("패스워드변경 처리중 오류가 발생했습니다.\n\n잠시 후 다시 확인 부탁 드립니다.");
				return false;
			});
		}
   </script>
	<div class="wid_1248">
		<div class="ad_content01 margintop_20">
			<img src="${staticRoot}/img/ad/m_ad_img001.jpg " alt="광고배너">
		</div>
		<div class="container">
			<div class="section center_content">
				<div class="login_content01">
					<div class="login_con_Type01">
						<div class="login_input">
							<form id="frm" name="frm">
								<input type="hidden" id="shaRePw" name="shaRePw" value=""/>
								<input type="hidden" id="id" name="id" value="<c:out value="${pageParm.id}"/>"/>
								<input type="hidden" id="ck" name="ck" value="<c:out value="${pageParm.ck}"/>"/>
								<label for="rePw" class="login_input_txt">비밀번호</label>
								<input class="login_input_Type m_c10_01_input_01" type="password" id="rePw" name="rePw" placeholder="영문+숫자 조합 6자리 이상">						
								<span class="pw_check_ment ment vOff" id="pwState2" style="padding-left:60px;">비밀번호를 입력해 주세요.</span>
							</form>
							<label for="pw" class="login_input_txt">확인</label>
							<input class="login_input_Type m_c10_01_input_01" type="password" id="ckPw" name="ckPw" placeholder="새로운 비밀번호를 한번더 입력해 주세요.">
							<span class="pw_check_ment ment vOff" id="ckPwState2" style="padding-left:60px;">비밀번호를 다시한번 입력해 주세요.</span>							
						</div>
						<div class="btn_content01 margintop_20">
							<span id="btnNext" onclick="fnNextStep();" >
								다음
							</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>