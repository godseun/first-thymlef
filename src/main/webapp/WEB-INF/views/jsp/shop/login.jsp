<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<%@ include file="/WEB-INF/views/common/layout/include/base.jsp" %>
	<script type="text/javascript" src="${staticRoot}/sdk/js/naverLogin_implicit-1.0.3.js"></script> 
	<script type="text/javascript" src="${staticRoot}/sdk/js/kakao.min.js"></script>
	<script type="text/javascript" src="${staticRoot}/js/joinValidate.js"></script>
	<script type="text/javascript" src="${staticRoot}/sdk/sha/sha.js"></script>
	<script type="text/javascript">
		var dupClick1 = false;
		var passPw 	= false;
		var passCkPw 	= false;
		Kakao.init('bcafed32037d1d5edfe56077ba50421d');
		$(function(){
			if(_BT.isEquals("Y",_BT.Cookie.get("saveCb"))) {
				$("#saveCb").prop("checked",true);
				$("#email").val(_BT.Cookie.get("email"));
			}			
			_BT.Reg.Number("mobile");
			$( ":input" ).on("focus", function() {
	    		$(this).addClass("mOn");
	    	});
			$( ":input" ).on("focusout", function() {
	    		$(this).removeClass("mOn");
	    	});
			_BT.setOnEnter("pw","btnNext");	
			$("#email").on("keyup",function(){
				if(_BT.isEmpty($("#email").val())){
					$("#emailState").removeClass("vOff");
					$("#emailState").css("color","#fe0000");	
					$("#emailState").text("이메일을 입력해 주세요.");
				}else{
					$("#emailState").addClass("vOff");
					chkNext();
				}
			});
			$("#pw").on("keyup",function(){
				if(_BT.isEmpty($("#pw").val())) {
					$("#pwState").removeClass("vOff");
					$("#pwState").css("color","#fe0000");	
					$("#pwState").text("비밀번호를 입력해 주세요.");
				}else{
					$("#pwState").addClass("vOff");
					chkNext();
				}
			});
			
			$(".kakao").on("click", function() {
				Kakao.Auth.login({
					success: function(authObj) {
						Kakao.API.request({
							url: '/v1/user/me',
							success: function(res) {
								if(_BT.isEmpty(res.id,    						"카카오톡 서비스로 부터 계정정보를 가져오지 못했습니다.\n\n다시 확인 부탁 드립니다.")) return false;
								if(_BT.isEmpty(res.kaccount_email,			"카카오톡 서비스로 부터 계정정보를 가져오지 못했습니다.\n\n다시 확인 부탁 드립니다.")) return false;
								var chkEmail = checkEmail(res.kaccount_email);
								if(!_BT.isEquals(chkEmail, "1")) {
									alert("카카오톡 계정으로 등록된 정보가 없습니다.\n 회원가입 후 다시 진행 부탁 드립니다.");
									return false;
								}
								$("#joinUsrId").val(res.id);
								$("#email").val(res.kaccount_email);
								var shaObj = new jsSHA(res.id+res.kaccount_email, "ASCII");
								$("#shaPw").val(shaObj.getHash("SHA-256", "HEX"));
								_BT.ajaxCallbackSubmit("frm", _BT.SHOP.URL.Common.doSNSLogin, function(data) { 
									if($(data).size() > 0) {
										if(_BT.isEquals(data.code, "success")) {
												_BT.moveUrl(_BT.SHOP.URL.Common.Main);
												return false;
										}else if(_BT.isEquals(data.code, "additional_info")) {
											alert(data.msg);
											//_BT.moveUrl(_BT.SHOP.URL.Feed.List);
											return false;
										}else{
											alert(data.msg);
											return false;
										}
									}else{
										alert("로그인에 실패 하였습니다.\n\n다시 확인 바랍니다.");
										return false;
									}
								},
								function(xhr, status, error) {
									_BT.Console.debug(xhr);
									alert("로그인 중 오류가 발생하였습니다.\n\n다시 확인 바랍니다.");
									return false;
								});
							},
							fail: function(error) {
								alert("카카오톡 서비스로 부터 프로필정보 조회에 실패 했습니다.\n\n다시 확인 부탁 드립니다.");
								console.log(error);
							}
						});
					},
					fail: function(err) {
						alert("카카오톡 서비스로 부터 로그인이 실패 했습니다.\n\n다시 확인 부탁 드립니다.");
					} 
				});
			});
			
			$(".naver").on("click", function() {
				$("#naver_id_login_anchor").trigger("click");
			});
			$("#sms_btn").on("click", function() {
				if( dupClick1 ) {
					alert("인증번호 발송중 입니다.\n\n잠시만 기다려주세요.");
					return false;
				}
				if(_BT.isEmptyById("mobile2",    "휴대폰 번호를 입력해 주세요.")) return false;
				if(_BT.isEmptyById("mobile3",    "휴대폰 번호를 입력해 주세요.")) return false;
				var mobileNo = _BT.getJoinData("-", new Array("mobile1","mobile2","mobile3"));
    			$("#authMobileNum").val(mobileNo);
    			dupClick1 = true;
				_BT.ajaxCallbackSubmit("smsFrm",  _BT.SHOP.URL.Common.LoginAuthNo, function(data) {
					dupClick1 = false;
					if($(data).size() > 0) {
						if(_BT.isEquals(data.code, "success")) {
							passSend = true;
							$(".pass_tell_ment").css("color","#3f51b5");	
							$(".pass_tell_ment").html("인증번호를 발송했습니다.인증번호는 10분간 유효 합니다.<span class='time'>유효시간 (10:00)</span>");	
							$(".pass_tell_ment").addClass("vBlock");
							$(".aadInfo").addClass("vBlock");
							$(".emailDiv").addClass("vOff");
							_BT.setDisable("mobile1");
							_BT.setDisable("mobile2");
							_BT.setDisable("mobile3");
							alert("인증번호를 발송했습니다.\n\n인증번호는 10분간 유효 합니다.");
						}else if(_BT.isEquals(data.code, "noMobileNo")) {
							$(".pass_tell_ment").css("color","#fe0000");	
							$(".pass_tell_ment").text("휴대폰 번호로 등록된 정보가 없습니다.");
							$(".pass_tell_ment").addClass("vBlock");
							alert("휴대폰 번호로 등록된 정보가 없습니다.\n\n확인 부탁 드립니다.");
						}else{
							$(".pass_tell_ment").css("color","#fe0000");	
							$(".pass_tell_ment").text("인증번호 발송중 오류가 발생했습니다. 잠시 후 다시 확인 부탁 드립니다.");
							$(".pass_tell_ment").addClass("vBlock");
						}
					}else{
						$(".pass_tell_ment").css("color","#fe0000");	
						$(".pass_tell_ment").text("인증번호 발송중 오류가 발생했습니다. 잠시 후 다시 확인 부탁 드립니다.");
						$(".pass_tell_ment").addClass("vBlock");
					}
				},
				function(xhr, status, error) {
					dupClick1 = false;
					$(".pass_tell_ment").css("color","#fe0000");	
					$(".pass_tell_ment").text("인증번호 발송중 오류가 발생했습니다. 잠시 후 다시 확인 부탁 드립니다.");
					$(".pass_tell_ment").addClass("vBlock");
				});
			});
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
			$("#email_btn").on("click", function() {
				if( dupClick1 ) {
					alert("패스워드 초기화 이메일을 발송중 입니다.\n\n잠시만 기다려주세요.");
					return false;
				}
				var email 	= $('#reEmail').val();
				if( joinValidate.checkEmail(email).code == "0"){
					if(!confirm('패스워드 초기화 이메일을 발송 하시겠습니까?')){
						return false;
					}
					dupClick1 = true;
					_BT.ajaxDataSubmit("post", _BT.SHOP.URL.Common.SetLoginEmail, {authEmailAddr : email}, function(data) {
						dupClick1 = false;
						if($(data).size() > 0) {
							if(_BT.isEquals(data.code, "success")) {
								alert("패스워드 초기화 이메일을 발송했습니다.\n\n설정 메일은 1시간 동안 유효 합니다.");
								return false;
							}else if(_BT.isEquals(data.code, "noEmail")) {
								alert("이메일 주소로 등록된 정보가 없습니다.\n\n확인 부탁 드립니다.");
								return false;
							}else{
								alert("패스워드 초기화 이메일 발송중 오류가 발생했습니다. 잠시 후 다시 확인 부탁 드립니다.");
								return false;
							}
						}
					},
					function(xhr, status, error) {
						dupClick1 = false;
						alert("패스워드 초기화 이메일 발송중 오류가 발생했습니다. 잠시 후 다시 확인 부탁 드립니다.");
						return false;
					});	
				} else {
					alert('이메일 주소가 유효하지 않습니다.');
					return false;
				}
			});
		});	 
		function Naver_Auth(obj){
			if(_BT.isEmpty(obj.id,    		"네이버 서비스로 부터 계정정보를 가져오지 못했습니다.\n\n다시 확인 부탁 드립니다.")) return false;
			if(_BT.isEmpty(obj.email,		"네이버 서비스로 부터 계정정보를 가져오지 못했습니다.\n\n다시 확인 부탁 드립니다.")) return false;
			var chkEmail = checkEmail(obj.email);
			if(!_BT.isEquals(chkEmail, "1")) {
				alert("네이버 계정으로 등록된 정보가 없습니다.\n 회원가입 후 다시 진행 부탁 드립니다.");
				return false;
			}
			$("#joinUsrId").val(obj.id);
			$("#email").val(obj.email);
			var shaObj = new jsSHA(obj.id+obj.email, "ASCII");
			$("#shaPw").val(shaObj.getHash("SHA-256", "HEX"));
			_BT.ajaxCallbackSubmit("frm", _BT.SHOP.URL.Common.doSNSLogin, function(data) {
				if($(data).size() > 0) {
					if(_BT.isEquals(data.code, "success")) {
							_BT.moveUrl(_BT.SHOP.URL.Common.Main);
							return false;
					}else if(_BT.isEquals(data.code, "additional_info")) {
						alert(data.msg);
						//_BT.moveUrl(_BT.SHOP.URL.Feed.List);
						return false;
					}else{
						alert(data.msg);
						return false;
					}
				}else{
					alert("로그인에 실패 하였습니다.\n\n다시 확인 바랍니다.");
					return false;
				}
			},
			function(xhr, status, error) {
				_BT.Console.debug(xhr);
				alert("로그인 중 오류가 발생하였습니다.\n\n다시 확인 바랍니다.");
				return false;
			});
		}		
		function checkEmail(emailAddr){
			var chkEmail = "9";
			_BT.ajaxDataSubmit("post", _BT.SHOP.URL.Join.checkEmail, {email : emailAddr}, function(data) {
				if($(data).size() > 0) {
					if(_BT.isEquals(data.code, "success")) {
						if(data.value == "0") {
							chkEmail = "0";
						} else {
							chkEmail = "1";
						}
					}
				}
			},
			function(xhr, status, error) {
				_BT.Console.debug(xhr);
			});	
			return chkEmail;
		}
		function chkNext (){
			if(
					!_BT.isEmpty($("#email").val()) &&
					!_BT.isEmpty($("#pw").val())
					)
			{
				$("#btnNext").addClass("bOn");
			}else{
				$("#btnNext").removeClass("bOn");
			}
		}
		
		function openDivPop(id){
			var inputElem = $('#password_set').find('input, hidden');
			var idx = 0;
			for (idx in inputElem) {
			    inputElem[idx].value = '';
			}
			$(".ment").removeClass("vBlock");
			$(".aadInfo").removeClass("vBlock");
			$(".emailDiv").removeClass("vOff");
			_BT.setEnable("mobile1");
			_BT.setEnable("mobile2");
			_BT.setEnable("mobile3");
			$("#"+id).removeClass("vOff"); 
		}
		function closeDivPop(id){
			$("#"+id).addClass("vOff"); 
		}
		
		function fnNextStep(){
			if(_BT.isEmptyById("email",    "이메일을 입력해 주세요.")) return false;
			if(_BT.isEmptyById("pw",    "비밀번호를 입력해 주세요.")) return false;
			
			var shaObj = new jsSHA(jQuery("#pw").val(), "ASCII");
			$("#shaPw").val(shaObj.getHash("SHA-256", "HEX"));

			if($("#saveCb").is(":checked")) {
				_BT.Cookie.set("saveCb", "Y");
				_BT.Cookie.set("email", $("#email").val());
			}else{
				_BT.Cookie.set("saveCb", "N");
			}  
			_BT.ajaxCallbackSubmit("frm", _BT.SHOP.URL.Common.doLogin, function(data) { 
				if($(data).size() > 0) {
					if(_BT.isEquals(data.code, "success")) {
						_BT.moveUrl(_BT.SHOP.URL.Common.Main);
						return false;
					}else if(_BT.isEquals(data.code, "additional_info")) {
						alert(data.msg);
						_BT.moveUrl(_BT.STORE.URL.CsCenter.Mypage);
						return false;
					}else{
						alert(data.msg);
						return false;
					}
				}else{
					alert("로그인에 실패 하였습니다.\n\n다시 확인 바랍니다.");
					return false;
				}
			},
			function(xhr, status, error) {
				_BT.Console.debug(xhr);
				alert("로그인 중 오류가 발생하였습니다.\n\n다시 확인 바랍니다.");
				return false;
			});	
		}
		function fnNextStep2(){
			if( dupClick1 ) {
				alert("비밀번호 재설정 중 입니다.\n\n잠시만 기다려주세요.");
				return false;
			}
			if(_BT.isEmptyById("authNum",    "인증번호를 입력해 주세요.")) return false;
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
			_BT.ajaxCallbackSubmit("smsFrm",  _BT.SHOP.URL.Common.SetLoginPw, function(data) {
				dupClick1 = false;
				if($(data).size() > 0) {
					if(_BT.isEquals(data.code, "success")) {
						alert("패스워드 변경 완료 하였습니다.\n\n로그인 후 이용 부탁 드립니다.");
						closeDivPop('password_set');
					}else if(_BT.isEquals(data.code, "noAuthSMS")) {
						alert("인증번호가 유효하지 않습니다.\n\n확인 부탁 드립니다.");
						return false;
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
			<img src="${staticRoot}/img/ad/ad_img001.jpg " alt="광고배너">
		</div>
		<div class="container">
			<div class="section center_content">
				<div class="login_content01">
					<div class="login_con_Type01">
						<!-- 지호2 -->
						<!-- <div class="login_sns_content01">
							<span class="naver">
								네이버 계정으로 로그인
							</span>
							<div id="naver_id_login" style="display: none;"></div>
							<span class="kakao">
								카카오톡으로 로그인
							</span>
						</div>
						<div class="or_txt">
							또는
						</div> -->
						<div class="login_input">
							<form id="frm" name="frm">
								<input type="hidden" id="joinUsrId" name="joinUsrId" value=""/>
								<input type="hidden" id="shaPw" name="shaPw" value=""/>
								<label for="email" class="login_input_txt">이메일</label><input class="login_input_Type m_c10_01_input_01" type="text" id="email" name="email" placeholder="이메일을 입력해 주세요.">								
								<span class="email_check_ment vOff" id="emailState">이메일을 입력해 주세요.</span>
							</form>
							<label for="pw" class="login_input_txt">비밀번호</label><input class="login_input_Type m_c10_01_input_01" type="password" id="pw"  placeholder="비밀번호를 입력해 주세요.">
							<span class="pw_check_ment vOff" id="pwState">비밀번호를 입력해 주세요.</span>
							<label for="" class="login_input_txt"></label>
							<div class="login_click">
								<input type="checkbox"  id="saveCb" class="email_check"><label for="saveCb" class="login_click_Type01">이메일 주소저장</label>
<!-- 								
								<input id="save01" type="checkbox" class="email_check mg_Type"><label for="save01" class="login_click_Type01">자동 로그인</label>
 -->								
							</div>
						</div>
						<div class="btn_content01 margintop_20">
							<span id="btnJoin" onclick="_BT.moveUrl(_BT.SHOP.URL.Join.bStep1);" style="width: 150px;">
								회원가입
							</span>
							<span id="btnNext" onclick="fnNextStep();" style="width: 150px; margin-left:10px;">
								다음
							</span>
						</div>
						<div class="password_ment">
							<a href="javascript:;" onclick="openDivPop('password_set');" >
								비밀번호를 잊어버리셨나요?
							</a>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
	<div class="password_set vOff" id="password_set">
		<div class="all_bg"> </div>
		<div class="password_set_content">
			<h1 class="blue_title">
				비밀번호 재설정
				<span class="close" onclick="closeDivPop('password_set');" >
				</span>
			</h1>
				<div class="password_set_substance emailDiv">
					<h5 class="pass_title">
						이메일로 비밀번호 재설정
					</h5>
					<div class="pass_margin">
						<input type="text" id="reEmail" name="reEmail" class="pass_set_input" placeholder="이메일을 입력해 주세요."/>
						<span class="pass_set_btn" id="email_btn">
							이메일 전송
						</span>
					</div>
					<p class="pass_or">
						또는
					</p>
				</div>
				<div class="password_set_substance mobile">
					<h5 class="pass_title">
						전화번호로 비밀번호 재설정
					</h5>
					<div class="pass_margin">
						<select name="mobile1" id="mobile1" class="pass_set_input01 mobile">
							<option value="010">010</option>
							<option value="011">011</option>
							<option value="016">016</option>
							<option value="017">017</option>
							<option value="018">018</option>
							<option value="019">019</option>
						</select>
						<span class="pass_set_input01_txt">-</span>
						<input type="text" name="mobile2" id="mobile2" class="pass_set_input01 mobile" maxlength="4"/><span class="pass_set_input01_txt">-</span>
						<input type="text" name="mobile3" id="mobile3" class="pass_set_input01 mobile" maxlength="4"/>
						<span class="pass_set_btn" id="sms_btn">
							인증번호 요청
						</span>
					</div>
					<p class="pass_tell_ment ment vOff" >
						등록되어 있지 않은 전화번호 입니다. <span class="time">유효시간 (3:00)</span>
					</p>
					<div class="pass_margin aadInfo vOff">
						<form id="smsFrm" name="smsFrm">
							<input type="hidden" id="authMobileNum" name="authMobileNum" />
							<input type="hidden" id="shaRePw" name="shaRePw" value=""/>
							<input type="text" id="authNum" name="authNum" class="pass_set_input02 mobile" maxlength="6" placeholder="6자리 인증번호를 입력해 주세요."/>
						</form>
					</div>
					<div class="pass_margin aadInfo vOff">
						<input type="password" id="rePw" name="rePw" class="pass_set_input02" maxlength="50" placeholder="새로운 비밀번호를 입력해 주세요(영문+숫자 조합 6자리 이상)"/>
						<span class="pw_check_ment ment vOff" id="pwState2" style="padding:0px;">비밀번호를 입력해 주세요.</span>
					</div>
					<div class="pass_margin aadInfo vOff">
						<input type="password" id="ckPw" name="ckPw" class="pass_set_input02" maxlength="50" placeholder="새로운 비밀번호를 한번더 입력해 주세요."/>
						<span class="pw_check_ment ment vOff" id="ckPwState2" style="padding:0px;">비밀번호를 다시한번 입력해 주세요.</span>								
					</div>
					<div class="pass_btn_setup pass_margin aadInfo vOff">
						<a href="javascript:;" onclick="fnNextStep2();">
							비밀번호 재설정
						</a>
					</div>
				</div>
		</div>
	</div>
	<script type="text/javascript">
<%--	
		DEV_LOC
		var naver_id_login = new naver_id_login("zP9eKhWKNAvSHJEtN9Pb", "${ctx}/shop/join/naver_oauth");
--%>	
		var naver_id_login = new naver_id_login("zP9eKhWKNAvSHJEtN9Pb", "<c:out value="${host}" />/shop/join/naver_oauth");
		var state = naver_id_login.getUniqState();
		naver_id_login.setButton("green", 6,40);
	  	naver_id_login.setDomain(".selltool.kr");
		naver_id_login.setState(state);
		naver_id_login.setPopup();
		naver_id_login.init_naver_id_login();
	</script>