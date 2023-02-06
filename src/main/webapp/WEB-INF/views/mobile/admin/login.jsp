<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<%@ include file="/WEB-INF/views/common/layout/include/base.jsp" %>
	<script type="text/javascript" src="${staticRoot}/sdk/sha/sha.js"></script>
	<script type="text/javascript">
		var dupClick1 = false;
		$(function(){
			if(_BT.isEquals("Y",_BT.Cookie.get("saveCb"))) {
				$("#saveCb").prop("checked",true);
				$("#email").val(_BT.Cookie.get("email"));
			}			
			if(_BT.isEquals("Y",_BT.Cookie.get("autoLogin"))) {
				$("#autoLogin").prop("checked",true);
				$("#pw").val(_BT.Cookie.get("pw"));
				fnNextStep();
			}			
			$( ":input" ).on("focus", function() {
	    		$(this).addClass("mOn");
	    	});
			$( ":input" ).on("focusout", function() {
	    		$(this).removeClass("mOn");
	    	});
		});	 
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
			if($("#autoLogin").is(":checked")) {
				_BT.Cookie.set("autoLogin", "Y");
				_BT.Cookie.set("pw", $("#pw").val());
			}else{
				_BT.Cookie.set("autoLogin", "N");
			}  
			_BT.ajaxCallbackSubmit("frm", _BT.SHOP.URL.Common.doLogin, function(data) { 
				if($(data).size() > 0) {
					if(_BT.isEquals(data.code, "error")) {
						alert(data.msg);
						return false;
					}else{
						_BT.moveUrl(_BT.ADMIN.URL.Common.BbsMng);
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
   </script>
	<div class="wid_1248">
		<div class="container" style="min-height: 400px;">
			<div class="section center_content" style="min-height: 400px;">
				<div class="login_content01">
					<div class="login_con_Type01">
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
								<input type="checkbox" id="saveCb" class="email_check"><label for="saveCb" class="login_click_Type01">이메일 주소저장</label>
								<input type="checkbox" id="autoLogin" class="email_check mg_Type"><label for="autoLogin" class="login_click_Type01">자동 로그인</label>
							</div>
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