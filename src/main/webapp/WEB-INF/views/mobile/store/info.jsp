<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ include file="/WEB-INF/views/common/layout/include/base.jsp" %>
		<script type="text/javascript" src="${staticRoot}/sdk/sha/sha.js"></script>
		<script>
			$(function () {
				if (_BT.isEquals("Y", _BT.Cookie.get("saveCb"))) {
					$("#saveCb").prop("checked", true);
					$("#email").val(_BT.Cookie.get("email"));
				}
			});

			function fnNextStep() {
				if (_BT.isEmptyById("email", "이메일을 입력해 주세요.")) return false;
				if (_BT.isEmptyById("pw", "비밀번호를 입력해 주세요.")) return false;

				var shaObj = new jsSHA(jQuery("#pw").val(), "ASCII");
				$("#shaPw").val(shaObj.getHash("SHA-256", "HEX"));

				if ($("#saveCb").is(":checked")) {
					_BT.Cookie.set("saveCb", "Y");
					_BT.Cookie.set("email", $("#email").val());
				} else {
					_BT.Cookie.set("saveCb", "N");
				}
				_BT.ajaxCallbackSubmit("frm", _BT.SHOP.URL.Common.doLogin, function (data) {
					if ($(data).size() > 0) {
						if (_BT.isEquals(data.code, "success")) {
							_BT.moveUrl(_BT.STORE.URL.Product.UpLoad);
							return false;
						} else if (_BT.isEquals(data.code, "additional_info")) {
							alert(data.msg);
							_BT.moveUrl(_BT.STORE.URL.CsCenter.Mypage);
							return false;
						} else {
							alert(data.msg);
							return false;
						}
					} else {
						alert("로그인에 실패 하였습니다.\n\n다시 확인 바랍니다.");
						return false;
					}
				},
					function (xhr, status, error) {
						_BT.Console.debug(xhr);
						alert("로그인 중 오류가 발생하였습니다.\n\n다시 확인 바랍니다.");
						return false;
					});
			}	
		</script>
		<div class="wid_1248" style="text-align: center;">
			<h1 class="blue_title" style="margin-top:50px;text-align: center;">
				대화 파트너 센터 로그인
			</h1>
			<div class="store_substance margintop_40">
				<form id="frm" name="frm">
					<input type="hidden" id="shaPw" name="shaPw" value="" />
					<div class="pass_margin">
						<span class="pass_set_btn">
							이메일
						</span>
						<input type="text" class="pass_set_input" id="email" name="email" placeholder="이메일을 입력해 주세요.">
					</div>
				</form>
				<div class="pass_margin" style="margin-top: 30px;">
					<span class="pass_set_btn">
						비밀번호
					</span>
					<input type="password" class="pass_set_input" id="pw" placeholder="비밀번호를 입력해 주세요.">
				</div>
				<div class="pass_margin" style="margin-top: 50px;">
					<input type="checkbox" id="saveCb" class="email_check">
					<label for="saveCb" class="login_click_Type01">이메일 주소저장</label>
				</div>
				<div class="btn_content01 margintop_40 marginbottom_30">
					<span id="btnNext" onclick="fnNextStep();" class="bOn">
						로그인
					</span>
				</div>
			</div>
			<%-- <div align="center" style="width: 100%">
				<img alt="광고배너" src="${upload}/board/20170802/20170802180357" width="100%;" height="auto;">
		</div>
		--%>
		</div>