<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<%@ include file="/WEB-INF/views/common/layout/include/base.jsp" %>
	<script type="text/javascript" src="${staticRoot}/sdk/js/kakao.min.js"></script>
	<script type="text/javascript" src="${staticRoot}/js/joinValidate.js"></script>
	<script type="text/javascript">
//		var passId 			= false;
//		var chkId 			= false;
		var passSend		= false;
		var chkAuthNo	= false;
		var mobile2			= false;
		var mobile3			= false;
  		$(function(){
			if(!_BT.isEmpty('${msg}')){
				$('#joinUsrId').val('${joinUsrId}');
				$('#adAgreeYN').val('${adAgreeYN}');
				$('#shaPw').val('${shaPw}');
				$('#email').val('${email}');
				alert('${msg}');
			}else if(
				_BT.isEmpty('${pageParm.adAgreeYN}')||
				_BT.isEmpty('${pageParm.shaPw}')
			) {
				alert('유효하지 않은 접근 입니다.\n\n확인 부탁 드립니다.');
				_BT.moveUrl(_BT.SHOP.URL.Join.bStep1);
			};
			
			$("#authNo").addClass("number");
			_BT.Reg.Number("number");
	    	$("#mobile2").on("keyup", function() {
	    		mobile2		= false;
	    		var value  = $(this).val();
	    		var regExp = /[^0-9]/gi;
	            if(regExp.test(value)) {
	                $(this).val(value.replace(regExp, ""));
	                $(this).focus();
	            }else{
    				if($(this).val().length < 4){
	        			$(this).focus();
    				}else{
    					mobile2 = true;
	        			$("#mobile3").focus();
    				}
    				checkMobile();
	            }
	    	});
	    	$("#mobile3").on("keyup", function() {
	    		mobile3		= false;
	    		var value  = $(this).val();
	    		var regExp = /[^0-9]/gi;
	            if(regExp.test(value)) {
	                $(this).val(value.replace(regExp, ""));
	                $(this).focus();
	            }else{
    				if($(this).val().length == 4){
    					mobile3 = true;
    				}
	            }
    			checkMobile(); 
	    	});
<%-- 	    	
	    	$("#usrId").on("keyup", function() {
	    		passId = false;
	    		var checkIdResult = joinValidate.checkStringId($(this).val());
	    		if( checkIdResult.code != 0 ) {
					$("#btnChkUsrId").removeClass("btnOn");
					$("#ckIdState").addClass("vBlock");
					$("#ckIdState").css("color","#fe0000");		
	    			$("#ckIdState").text(checkIdResult.desc);
	    			return false;
	    		} else {
		    		passId = true;
					$("#btnChkUsrId").addClass("btnOn");
					$("#ckIdState").addClass("vBlock");
					$("#ckIdState").css("color","#3f51b5");	
	    			$("#ckIdState").text("아이디 중복체크버튼을 눌러주세요");
	    			return true;
	    		}
	    	});
--%>
	    	$("#usrNm").on("focusout", function() {
	    		if(!_BT.isEmpty($("#usrNm").val())){
	    			chkNextStep();
	    		}
	    	});
  		});  
		function checkMobile(){
			if( mobile2 && mobile3 ){
				$("#sendSMS").addClass("btnOn");
			}else{
				$("#sendSMS").removeClass("btnOn"); 
			}
			chkNextStep();
		}
		var dupClick1 = false;
		function fnSendSMS() {
			if(_BT.isEmptyById("mobile2",    "휴대폰 번호를 입력해 주세요.")) return false;
			if(_BT.isEmptyById("mobile3",    "휴대폰 번호를 입력해 주세요.")) return false;
			if( dupClick1 ) {
				alert("인증번호 발송중 입니다. 잠시만 기다려주세요.");
				return false;
			}
			if( mobile2 && mobile3 ){ 
				passSend = false;
				var mobileNo = _BT.getJoinData("-", new Array("mobile1","mobile2","mobile3"));
    			$("#authMobileNum").val(mobileNo);
    			$("#mobileNo").val(mobileNo);
    			dupClick1 = true;
				_BT.ajaxCallbackSubmit("ajaxFrm",  _BT.SHOP.URL.Join.sendAuthNo, function(data) {
					dupClick1 = false;
					if($(data).size() > 0) {
						if(_BT.isEquals(data.code, "success")) {
							passSend = true;
							$("#ckSmsState").addClass("vBlock");
							$("#ckSmsState").css("color","#3f51b5");	
							$("#ckSmsState").text("인증번호를 발송했습니다.인증번호는 10분간 유효 합니다.");	
							$("#authSpan").addClass("vBlock");
							alert("인증번호를 발송했습니다.\n\n인증번호는 10분간 유효 합니다.");
						}else if(_BT.isEquals(data.code, "dupMobileNo")) {
							$("#ckSmsState").addClass("vBlock");
							$("#ckSmsState").text("이미 등록된 휴대폰 번호 입니다.확인 부탁 드립니다.");
							$("#ckSmsState").css("color","#fe0000");	
							alert("이미 등록된 휴대폰 번호 입니다.\n\n확인 부탁 드립니다.");
						}else{
							$("#ckSmsState").addClass("vBlock");
							$("#ckSmsState").text("인증번호 발송중 오류가 발생했습니다. 잠시 후 다시 확인 부탁 드립니다.");
							$("#ckSmsState").css("color","#fe0000");	
						}
					}else{
						$("#ckSmsState").addClass("vBlock");
						$("#ckSmsState").text("인증번호 발송중 오류가 발생했습니다. 잠시 후 다시 확인 부탁 드립니다.");
						$("#ckSmsState").css("color","#fe0000");	
					}
				},
				function(xhr, status, error) {
					dupClick1 = false;
					$("#ckSmsState").addClass("vBlock");
					$("#ckSmsState").text("인증번호 발송중 오류가 발생했습니다. 잠시 후 다시 확인 부탁 드립니다.");
					$("#ckSmsState").css("color","#fe0000");	
				});	
			}
		}
		
		var dupClick2 = false;
		function fnChkAuthNo(){
			if($("#authNo").val().length < 6){
				$("#ckAuthNoState").text("인증번호 6자리를 입력해주세요.");	
				return false;
			}
			if( dupClick2 ) {
				alert("인증번호 확인중 입니다. 잠시만 기다려주세요.");
				return false;
			}
			dupClick2 	= true;
			chkAuthNo = false;
			$("#authNum").val($("#authNo").val()); 
				_BT.ajaxCallbackSubmit("ajaxFrm", _BT.SHOP.URL.Join.checkAuthNo, function(data) {
				dupClick2 = false;
				if($(data).size() > 0) {
					if(_BT.isEquals(data.code, "success")) {
						if(data.value == "1") {
							chkAuthNo = true;
						}
					}
				}
			},
			function(xhr, status, error) {
				dupClick2 = false;
			});	
			if(chkAuthNo){
				$("#ckSmsState").text("인증을 완료 하였습니다.");	
				$("#authSpan").removeClass("vBlock");
				$("#smsRcvAgreeSpan").removeClass("vOff");
				$("#sendSMS").addClass("vOff");
				$(".mobile").attr("disabled", "disabled");
				chkNextStep();
			}else{
				$("#ckAuthNoState").text("인증정보가 유효하지 않습니다. 다시 확인 바랍니다.");	
			} 
		}
<%--		
		var dupClick3 = false;
		function fnChkUsrId(){
			if(passId){
				if( dupClick3 ) {
					alert("ID 중복확인 중 입니다. 잠시만 기다려주세요.");
					return false;
				}
				chkId = false;
				dupClick3 = true;
				_BT.ajaxDataSubmit("post", _BT.SHOP.URL.Join.chkUsrId, {
					usrId : $("#usrId").val()
				}, function(data) {
					dupClick3 = false;
					if($(data).size() > 0) {
						if(_BT.isEquals(data.code, "success")) {
							if(_BT.isEquals(data.value, "CODE0")) {
								chkId = true;
								$("#ckIdState").css("color","#3f51b5");	
				    			$("#ckIdState").text("사용할수 있는 아이디 입니다.");
				    			chkNextStep();
				    			
							}else if(_BT.isEquals(data.value, "CODE1")) { 	
				    			$("#ckIdState").text("이미 사용중인 아이디 입니다.");
								$("#ckIdState").css("color","#fe0000");	
						
							}else if(_BT.isEquals(data.value, "CODE2")) { 
								$("#ckIdState").css("color","#fe0000");	
				    			$("#ckIdState").text("사용할수 없는 아이디 입니다.");
							}
						}
					}
				},
				function(xhr, status, error) {
					dupClick3 = false;
					$("#ckIdState").css("color","#fe0000");	
	    			$("#ckIdState").text("아이디 중복확인 바랍니다.");
				});
			}
		}
--%>			
		function chkNextStep(){
			if(
					!_BT.isEmpty($("#usrNm").val()) &&
					//chkId &&
					chkAuthNo
			){
				$("#btnNext").addClass("on");
			}else{
				$("#btnNext").removeClass("on");
			}
		}
		
		function fnNextStep() {
			if(
					!_BT.isEmpty($("#usrNm").val()) &&
					//chkId &&
					chkAuthNo
			){
				if($("#chSmsRcv").prop("checked")){
					$("#smsRcvAgree").val("Y");
				}else{
					$("#smsRcvAgree").val("N");
				}	
				_BT.actFormSubmit("frm", "POST", _BT.SHOP.URL.Join.bStep4); 
			}
		}
   </script>
	
	<div class="wid_1248">
		<div class="ad_content01 margintop_20">
			<a href="javascript:;">
				<img src="${staticRoot}/img/ad/m_ad_img001.jpg " alt="광고배너">
			</a>
		</div>

		<div class="container">
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
						<a href="javascript:;">
							회원가입
						</a>
						<a href="javascript:;" class="on">
							정보입력
						</a>
					</div>
				</div>
				<form id="ajaxFrm" name="ajaxFrm">
					<input type="hidden" id="authMobileNum" name="authMobileNum" />
					<input type="hidden" id="authNum" name="authNum" />
				</form>
				<form id="frm" name="frm">>
					<input type="hidden" id="joinUsrId" name="joinUsrId" value="<c:out value="${pageParm.joinUsrId}"/>"/>
					<input type="hidden" id="adAgreeYN" name="adAgreeYN" value="<c:out value="${pageParm.adAgreeYN}"/>"/>
					<input type="hidden" id="smsRcvAgree" name="smsRcvAgree" />
					<input type="hidden" id="shaPw" name="shaPw" value="<c:out value="${pageParm.shaPw}"/>"/>
					<input type="hidden" id="email" name="email" value="<c:out value="${pageParm.email}"/>"/>
					<input type="hidden" id="mobileNo" name="mobileNo" />
					<div class="margintop_30">
						<table class="join_form">
							<caption>정보입력</caption>
							<colgroup>
								<col width="20%">
								<col width="80%">
							</colgroup>
							<tbody>
								<tr>
									<th>
										<img class="required"/>휴대폰 번호
									</th>
									<td>
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
										<span class="join_form_btn03 marginleft_5 on" onclick="fnSendSMS();" id="sendSMS">인증</span>
										<span class="vOff" id="smsRcvAgreeSpan">
											<input type="checkbox" id="chSmsRcv" name="chSmsRcv" class="join_checkbox" checked="checked"/><label for="chSmsRcv" class="join_form_check">SMS 수신</label>
										</span> 
										<span class="pass_tell_ment margintop_5 vOff" id="ckSmsState"></span>
										<span class="vOff margintop_5" id = "authSpan">
											<input type="text" name="authNo" id="authNo" class="join_form_input03" placeholder="인증번호 6자리를 입력해주세요." maxlength="6" size="6" />
											<span class="join_form_btn01" onclick="fnChkAuthNo();">인증하기</span>
											<span class="pass_tell_ment margintop_5 vBlock" id="ckAuthNoState"></span>
										</span>
									</td>
								</tr>
<%-- 								
								<tr>
									<th>
										<img class="required"/>아이디
									</th>
									<td>
										<input type="text" name="usrId" id="usrId" class="join_form_input03" placeholder="아이디를 입력해주세요."/>
										<span class="join_form_btn" onclick="fnChkUsrId();" id="btnChkUsrId">중복확인</span>
										<span class="pass_tell_ment margintop_5 vOff" id="ckIdState">아이디를 입력해주세요.</span>
									</td>
								</tr>
--%>							
								<tr>
									<th>
										<img class="required"/>이름
									</th>
									<td>
										<input type="text" name="usrNm" id="usrNm" class="join_form_input03" placeholder="이름을 입력해주세요." value="<c:out value="${pageParm.usrNm}"/>"/>
										<span class="pass_tell_ment margintop_5 vOff" id="ckNmState">이름을 입력해주세요.</span>		
									</td>
								</tr>
								<tr>
									<th>
										프로모션 코드
									</th>
									<td>
										<input type="text" name="prmCd" id="prmCd" class="join_form_input03" />
									</td>
								</tr>
							</tbody>
						</table>
						<div class="btn_content01 margintop_40">
							<a href="javascript:;" id="btnNext" onclick="fnNextStep();" >
								가입완료
							</a>
						</div>
					</div>
				</form>

			</div>
		</div>
	</div >
