<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/layout/include/base.jsp" %>
	<script type="text/javascript" src="${staticRoot}/sdk/sha/sha.js"></script>
	<script type="text/javascript">
		var dupClick1 = false;
		$(function(){  
			_BT.Reg.Number("mobile");
		});
		function fnNextStep() {
			if(_BT.isEmptyById("mobile2",    "휴대폰 번호를 입력해 주세요.")) return false;
			if(_BT.isEmptyById("mobile3",    "휴대폰 번호를 입력해 주세요.")) return false;
			if(_BT.isEmptyById("pw",  		   "비밀번호를 입력해 주세요.")) return false;

			var mobileNo = _BT.getJoinData("-", new Array("mobile1","mobile2","mobile3"));
			$("#mobileNo").val(mobileNo);
			
			//password SHA256 encryption
			var shaObj = new jsSHA($("#pw").val(), "ASCII");
			$("#shaPw").val(shaObj.getHash("SHA-256", "HEX"));
			_BT.actFormSubmit("frm", "POST", _BT.SHOP.URL.Helpdesk.EstimateLg); 
		}
	</script>
	<div class="section" style="min-height: 1000px;">
		<div class="notcie_board">					
			<div class="faq_txt_01">
				대화 견적시스템 로그인
			</div>
			<div class="faq_box_01" style="text-align: center;">
				<div class="estimate_sbox_01" style="margin-left: 140px;">
					요청정보 입력
					<span class="faq_arrow"><img src="${staticRoot}/img/c12_03_faqarrow_01.jpg" alt=""></span>
				</div>
				<div class="estimate_sbox_02">
					상품 선택
					<span class="faq_arrow"><img src="${staticRoot}/img/c12_03_faqarrow_01.jpg" alt=""></span>
				</div>
				<div class="estimate_sbox_03">
					견적서 출력
				</div>
			</div>
			<div class="faq_txt_01" style="padding-top:10px; font-size:18px; text-align: left;">
				<p style=" line-height: 300%;text-align: center;">
					1.가장 빠른 견적 - 기초정보 입력 후 상품 선택만 하면 견적요청 완료.
				</p>
				<p style=" line-height: 300%;text-align: center;">
					2.가장 편한 견적 - 상품선택만 하면 품명 규격 자동 입력.
				</p>
				<p style=" line-height: 300%;text-align: center;">
					3.관리가 편함 - 견적요청 히스토리 관리에 최적화.
				</p>
			</div>
			<div class="faq_txt_02" style="margin-top: 40px;">
				※ 비회원도 견적 요청이 가능 합니다.
			</div>
			<div class="faq_txt_02" style="margin-top: 10px;">
				※ SMS로 견적관련 진행 상황을 안내 드립니다.
			</div>
			<div class="login_input" style="text-align:left; margin-top:40px;margin-left: 280px;">
				<form id="frm" name="frm">
					<input type="hidden" id="shaPw" name="shaPw" value=""/>
					<input type="hidden" id="mobileNo" name="mobileNo" />
				</form>
				<label for="mobile1" class="login_input_txt" style="width: 100px; text-align: right; padding:0 5px; vertical-align: middle;">휴대폰 번호</label>
				<select name="mobile1" id="mobile1" class="join_form_select02 mobile">
					<option value="010">010</option>
					<option value="011">011</option>
					<option value="016">016</option>
					<option value="017">017</option>
					<option value="018">018</option>
					<option value="019">019</option>
				</select>
				<span class="join_form_txt">-</span>
				<input type="text" name="mobile2" id="mobile2" class="join_form_input01 mobile" maxlength="4" size="4" />
				<span class="join_form_txt">-</span>
				<input type="text" name="mobile3" id="mobile3" class="join_form_input01 mobile" maxlength="4" size="4" />
				<span class="email_check_ment vOff" id="emailState">휴대폰 번호를 입력해 주세요.</span>
				<br/><br/>
				<label for="pw" class="login_input_txt" style="width: 100px; text-align: right; padding:0 5px; vertical-align: middle;">비밀번호</label>
				<input class="login_input_Type m_c10_01_input_01" type="password" id="pw"  placeholder="비밀번호를 입력해 주세요.">
				<span class="pw_check_ment vOff" id="pwState">비밀번호를 입력해 주세요.</span>
			</div>
			<div class="btn_content01 margintop_20">
				<span id="btnNext" onclick="fnNextStep();" class="btnOn">
					확인
				</span>
			</div>	
		</div>
	</div>