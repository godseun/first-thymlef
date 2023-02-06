<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<%@ include file="/WEB-INF/views/common/layout/include/base.jsp" %>
	<script type="text/javascript" src="${staticRoot}/sdk/js/naverLogin_implicit-1.0.3.js"></script> 
	<script type="text/javascript" src="${staticRoot}/sdk/js/kakao.min.js"></script>
	<script type="text/javascript" src="${staticRoot}/js/joinValidate.js"></script>
	<script type="text/javascript" src="${staticRoot}/sdk/sha/sha.js"></script>
	<script type="text/javascript">
		var passEmail 	= false;
		var passPw 	= false;
		var passCkPw 	= false;
		Kakao.init('bcafed32037d1d5edfe56077ba50421d');
		$(function(){
			if(_BT.isEmpty('${pageParm.adAgreeYN}','유효하지 않은 접근 입니다.\n\n확인 부탁 드립니다.')) {
				_BT.moveUrl(_BT.SHOP.URL.Join.bStep1);
			}
			$( ":input" ).on("focus", function() {
	    		$(this).addClass("mOn");
	    	});
			$( ":input" ).on("focusout", function() {
	    		$(this).removeClass("mOn");
	    	});
			_BT.setOnEnter('ckPw','btnNext');
			$("#email").on("focusout",function(){
				passEmail	= false;
				var email 	= $(this).val();
				var chkEmailResult = joinValidate.checkEmail(email);
				$("#emailState").removeClass("vOff");
				$("#emailState").text(chkEmailResult.desc);
				if( chkEmailResult.code == "0"){
					var chkEmail = checkEmail(email);
					if(_BT.isEquals(chkEmail, "9")) {
						$("#emailState").css("color","#fe0000");	
						$("#emailState").text("이메일을 다시 입력하세요.");
					}else if(_BT.isEquals(chkEmail, "0")) {
						$("#emailState").css("color","#3f51b5");	
						$("#emailState").text(chkEmailResult.desc);
						passEmail = true;
					}else if(_BT.isEquals(chkEmail, "1")) {
						$("#emailState").css("color","#fe0000");	
						$("#emailState").text("이미 등록된 이메일 입니다.");
					}
				} else {
					$("#emailState").css("color","#fe0000");					
				}
				chkNext();
			});
			
			$("#pw").on("keyup",function(){
				passPw 	= false;
				var pw 	= $(this).val();
				var chkPwResult = safety.safetyCheck(pw);
				if( chkPwResult != 'OK' ) {
					$("#pwState").removeClass("vOff");
					$("#pwState").text(chkPwResult.desc);
					$("#pwState").css("color","#fe0000");	
					return false;
				}else{				
					passPw = true;
					chkPwResult = safety.checkGadePw(pw);
					if( chkPwResult == '1' ) {
						$("#pwState").text("비밀번호 강도: 취약");
						$("#pwState").css("color","#fe0000");	
						return true;
						
					} else if( chkPwResult == '2' ) {
						$("#pwState").css("color","#f37021");	
						$("#pwState").text("비밀번호 강도: 보통");
						return true;
						
					} else {
						$("#pwState").text("비밀번호 강도: 강함");
						$("#pwState").css("color","#3f51b5");		
						return true;
					}
				}
				chkNext();
			});
			$("#ckPw").on("keyup",function(){
				passCkPw 		= false;
				var ckPw 		= $(this).val();
				var chkPwResult = safety.isEqualsPw("pw","ckPw");
				if( chkPwResult != 'OK' ) {
					$("#ckPwState").removeClass("vOff");
					$("#ckPwState").text(chkPwResult.desc);
					$("#ckPwState").css("color","#fe0000");	
				} else {
					passCkPw = true;
					$("#ckPwState").text("비밀번호가 일치 합니다.");
					$("#ckPwState").css("color","#3f51b5");	
				}
				chkNext();
			}); 
			$(".kakao").on("click", function() {
				Kakao.Auth.login({
					success: function(authObj) {
						Kakao.API.request({
							url: '/v1/user/me',
							success: function(res) {
								if(_BT.isEmpty(res.id,    						"카카오톡 서비스로 부터 계정정보를 가져오지 못했습니다.\n 다시 확인 부탁 드립니다.")) return false;
								if(_BT.isEmpty(res.kaccount_email,	"카카오톡 서비스로 부터 계정정보를 가져오지 못했습니다.\n 다시 확인 부탁 드립니다.")) return false;
								var chkEmail = checkEmail(res.kaccount_email);
								if(_BT.isEquals(chkEmail, "1")) {
									alert("카카오톡 계정의 " + res.kaccount_email + "는 이미 등록된 이메일 입니다.");
									return false;
								}
								$("#joinUsrId").val(res.id);
								$("#email").val(res.kaccount_email);
								$("#usrNm").val(res.properties.nickname);
								var shaObj = new jsSHA(res.id+res.kaccount_email, "ASCII");
								$("#shaPw").val(shaObj.getHash("SHA-256", "HEX"));
								_BT.actFormSubmit("frm", "POST", _BT.SHOP.URL.Join.bStep3); 
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
		});
		function Naver_Auth(obj){
			console.log(obj);
			if(_BT.isEmpty(obj.id,    		"네이버 서비스로 부터 계정정보를 가져오지 못했습니다.\n 다시 확인 부탁 드립니다.")) return false;
			if(_BT.isEmpty(obj.email,	"네이버 서비스로 부터 계정정보를 가져오지 못했습니다.\n 다시 확인 부탁 드립니다.")) return false;
			var chkEmail = checkEmail(obj.email);
			if(_BT.isEquals(chkEmail, "1")) {
				alert("네이버 계정의 " + obj.email + "는 이미 등록된 이메일 입니다.");
				return false;
			}
			$("#joinUsrId").val(obj.id);
			$("#email").val(obj.email);
			$("#usrNm").val(obj.name);
			var shaObj = new jsSHA(obj.id+obj.email, "ASCII");
			$("#shaPw").val(shaObj.getHash("SHA-256", "HEX"));
			_BT.actFormSubmit("frm", "POST", _BT.SHOP.URL.Join.bStep3); 
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
			if(passEmail && passPw && passCkPw){
				$("#btnNext").addClass("bOn");
			}else{
				$("#btnNext").removeClass("bOn");
			}
		}
		function fnNextStep() {
			if(!passEmail){
				alert(_BT.getText("emailState"));
				return false;
			}
			if(!passPw){
				alert(_BT.getText("pwState"));
				return false;
			}	
			if(!passCkPw){
				alert(_BT.getText("ckPwState"));
				return false;
			}	
			//login password SHA256 encryption
			var shaObj = new jsSHA($("#pw").val(), "ASCII");
			$("#shaPw").val(shaObj.getHash("SHA-256", "HEX"));
			_BT.actFormSubmit("frm", "POST", _BT.SHOP.URL.Join.bStep3); 
		}
   </script>
	<div class="wid_1248">
		<div class="ad_content01 margintop_20">
			<img src="${staticRoot}/img/ad/m_ad_img001.jpg " alt="광고배너">
		</div>
		<div class="container" style="min-height:650px;">
			<div class="section center_content">
<%-- 			
				<h1 class="title_Type03">
					회원 가입
					<div class="sub_location">
						<div class="list_location01">
							<a href="javascript:;" onclick="_BT.moveUrl(_BT.SHOP.URL.Common.Main);" class="home">HOME</a>
							<span class="arrow"><img src="${staticRoot}/img/bl_01.jpg" alt="" /></span>
							<span class="txt01">회원</span>
							<span class="arrow"><img src="${staticRoot}/img/bl_01.jpg" alt="" /></span>
							<span class="last_txt">회원 가입</span>
						</div>
					</div>
				</h1>
 --%>
				<div class="provision_content">
					<div class="join_content_tab">
						<a href="javascript:;">
							약관동의
						</a>
						<a href="javascript:;" class="on">
							회원가입
						</a>
						<a href="javascript:;">
							정보입력
						</a>
					</div>
				</div>
				<div class="login_content01">
					<div class="login_con_Type01">
						<div class="login_sns_content01">
						 	<span class="naver">
								네이버 계정으로 이용하기
							</span>
							<div id="naver_id_login" style="display: none;"></div>
							<span class="kakao">
								카카오톡으로 이용하기
							</span>
						</div>
						<div class="or_txt">
							또는
						</div>
						<div class="login_input">
							<form id="frm" name="frm">
								<input type="hidden" id="joinUsrId" name="joinUsrId" />
								<input type="hidden" id="adAgreeYN" name="adAgreeYN" value="<c:out value="${pageParm.adAgreeYN}"/>"/>
								<input type="hidden" id="shaPw" name="shaPw" value=""/>
								<input type="hidden" id="usrNm" name="usrNm" value=""/>
								<label for="email" class="join_input_txt">이메일</label><input class="join_input_Type email" type="text" id="email" name="email" placeholder="이메일을 입력해 주세요.">
								<span class="email_check_ment vOff" id="emailState">이메일을 입력해 주세요.</span>
							</form>
							
							<label for="input_click02" class="join_input_txt">비밀번호</label><input class="join_input_Type" maxlength="50" type="password" id="pw" name="pw" placeholder="영문+숫자 조합 6자리 이상">
							<span class="pw_check_ment vOff" id="pwState">비밀번호를 입력해 주세요.</span>
						
							<label for="input_click03" class="join_input_txt">비밀번호 확인</label><input class="join_input_Type" maxlength="50" type="password" id="ckPw" name="ckPw" placeholder="비밀번호를 다시한번 입력해 주세요.">
							<span class="pw_check_ment vOff" id="ckPwState">비밀번호를 다시한번 입력해 주세요.</span>								
						</div>
						<div class="btn_content01 margintop_40">
							<span id="btnNext" onclick="fnNextStep();" >
								다음
							</span>
						</div>
					</div>
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