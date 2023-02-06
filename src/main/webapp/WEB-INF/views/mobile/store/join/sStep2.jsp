<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<%@ include file="/WEB-INF/views/common/layout/include/base.jsp" %>
	<script type="text/javascript" src="${staticRoot}/js/joinValidate.js"></script>
	<script type="text/javascript" src="${staticRoot}/sdk/sha/sha.js"></script>
	<script type='text/javascript'>
		var passEmail		= false;
		var passPw 		= false;
		var passCkPw 		= false;
		var chkAuthNo	= false;
		$(function(){
			if('${msg}' != ''){
				alert('${msg}');
			}else if(
					_BT.isEmpty('${pageParm.adAgreeYN}','유효하지 않은 접근 입니다.\n\다시 확인 부탁 드립니다.')||
					_BT.isEmpty('${pageParm.busiNo}','유효하지 않은 접근 입니다.\n\n다시 확인 부탁 드립니다.')||
					_BT.isEmpty('${pageParm.cmpNm}','유효하지 않은 접근 입니다.\n\n다시 확인 부탁 드립니다.')
			) {
				_BT.moveUrl(_BT.STORE.URL.Join.sStep1);
			};
			$( ':input' ).on('focus', function() {
				if(($( this ).prop( 'readonly' ))){
		    		$(this).addClass('mbOn');
				}else{
		    		$(this).addClass('mOn');
				} 
	    	});
			$( ':input' ).on('focusout', function() {
		    	$(this).removeClass('mbOn');
	    		$(this).removeClass('mOn');
	    	});
			$("#sEmail").on("focusout",function(){
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
			});
			$('#mDiv').on('click', function() {
				$('#file').trigger('click');
			});
			$('#file').on('change', function(e) {
				var img = e.target.files[0];
				var name = e.target.files[0].name;
				if(img.constructor !== File || !img.type.match('image.*')){
					alert('이미지 파일만 선택 가능 합니다.');
					return false;
				}else{
					canvas(img, name,'result', 'mData', 'mFileName', true, '50');
				}
			});
			$('#pw').on('keyup',function(){
				passPw 	= false;
				var pw 	= $(this).val();
				var chkPwResult = safety.safetyCheck(pw);
				if( chkPwResult != 'OK' ) {
					$('#pwState').removeClass('vOff');
					$('#pwState').text(chkPwResult.desc);
					$('#pwState').css('color','#fe0000');	
					return false;
				}else{				
					passPw = true;
					chkPwResult = safety.checkGadePw(pw);
					if( chkPwResult == '1' ) {
						$('#pwState').text('비밀번호 강도: 취약');
						$('#pwState').css('color','#fe0000');	
						return true;
						
					} else if( chkPwResult == '2' ) {
						$('#pwState').css('color','#f37021');	
						$('#pwState').text('비밀번호 강도: 보통');
						return true;
						
					} else {
						$('#pwState').text('비밀번호 강도: 강함');
						$('#pwState').css('color','#3f51b5');		
						return true;
					}
				}
			});
			$('#ckPw').on('keyup',function(){
				passCkPw 		= false;
				var ckPw 		= $(this).val();
				var chkPwResult = safety.isEqualsPw('pw','ckPw');
				if( chkPwResult != 'OK' ) {
					$('#ckPwState').removeClass('vOff');
					$('#ckPwState').text(chkPwResult.desc);
					$('#ckPwState').css('color','#fe0000');	
				} else {
					passCkPw = true;
					$('#ckPwState').text('비밀번호가 일치 합니다.');
					$('#ckPwState').css('color','#3f51b5');	
				}
			}); 
			_BT.Reg.Number('number');
		});

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
		function canvas(imgObj, name, imgDiv, data, fName, next, nStep){
			var can 	= $('.img-can')[0];
		   	var ctx 	= can.getContext('2d');
			var img 	= new Image();
			img.src  = URL.createObjectURL(imgObj);
			$(img).on('load', function(){
				var w	= img.width;
				var h		= img.height;
				var t  	= (w > h) ? w : h;
				if(t > 1000){
					var r 		= Math.round((t + 1000) / 1000);
					var nw 	= Math.floor(w / r);
					var nh 	= Math.floor(h / r);
					var nr 	= (r > 1) ? 0.5 : 0.6;
				}else{
					var r 		= 1;
					var nw 	= w;
					var nh 	= h;
					var nr 	= 0.5;
				}
				//console.log(w+','+h+','+t+','+r+','+nw+','+nh+','+nr);
			   	can.width  = nw;
			   	can.height  = nh;
				ctx.drawImage(img, 0, 0, nw, nh);
				$('#'+imgDiv).attr('src',can.toDataURL('image/jpeg', nr));		
				$('#'+data).val(can.toDataURL('image/jpeg', nr));
			});
			$('#'+fName).val(name);
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

			
		function fnSave(){
			if( dupClick1 ) {
				alert('정보를 등록중 입니다. 잠시만 기다려주세요.');
				return false;
			}		
			//if(_BT.isEmptyById('mData',    	'사업자 등록등을 첨부해 주세요.')) return false;
			//if(!passEmail){alert('이메일주소를 확인해 주세요.');return false;}
			if(!chkAuthNo){alert('휴대폰번호 인증을해 주세요.');return false;}
			
			if(_BT.isEmptyById('sUsrNm',    	'이름을을 입력해 주세요.')) return false;
			if(!passPw){alert('비밀번호를 확인해 주세요.');return false;}
			if(!passCkPw){alert('확인용 비밀번호를 확인해 주세요.');return false;}
			
			$('#email').val($('#sEmail').val());
			$('#usrNm').val($('#sUsrNm').val());
				
			var shaObj = new jsSHA(jQuery('#pw').val(), 'ASCII');
			$('#shaPw').val(shaObj.getHash('SHA-256', 'HEX'));
			if(_BT.isChecked('click01'))
				$('#smsRcvAgree').val('Y');
			else 
				$('#smsRcvAgree').val('N');
	
			$('#joinFrm').empty();
			$( '#tFrm input' ).each(function( i ) {
				$(this).clone().appendTo('#joinFrm');
			});
			$( '#mFrm input' ).each(function( i ) {
				$(this).clone().appendTo('#joinFrm');
			});
			
			dupClick1 = true;
			_BT.ajaxCallbackSubmit("joinFrm", _BT.STORE.URL.Join.sStep3, function(data) {
				dupClick1 = false;
				if($(data).size() > 0) {
					if(_BT.isEquals(data.code, "success")) {
						_BT.moveUrl(_BT.STORE.URL.Join.wait);
					}else{
						alert('등록 중 오류가 발생 했습니다.\n\n다시 확인 부탁 드립니다. ');
					}
				}else{
					alert('처리 중 오류가 발생 했습니다.\n\n다시 확인 부탁 드립니다. ');
				}
			},
			function(xhr, status, error) {
				alert('시스템 오류가 발생 했습니다.\n\n다시 확인 부탁 드립니다. ');
				dupClick1 = false;
			});			
		}
	</script>
	
	<div class="wid_1248">
		<div class="ad_content01 margintop_20">
			<a href="javascript:;">
				<img src="${staticRoot}/img/ad/ad_img002.jpg " alt="광고배너">
			</a>
		</div>
		<div class="container">
			<div class="section center_content">
				<div class="provision_content">
					<div class="join_content_tab01">
						<a href="javascript:;">
							약관동의
						</a>
						<a href="javascript:;" class="on">
							정보입력
						</a>
					</div>
				</div>
				<canvas class="img-can" style="display: none;"></canvas>
				<div class="c13_01_02_box_01 hMouse" style="width: 100% ">
					<span class="c13_01_02_txt_01">사업자등록증을 업로드 해주세요.</span>
					<div class="c13_01_02_box_m_01 margintop_20 marginbottom_20" id="mDiv">
						<img src="${staticRoot}/img/c13_01_02_noimg_01.jpg" id="result" alt="사진선택" width="340px;" height="286px;"/>
					</div>
				</div>
				<div class="c10_03_06 margintop_30">
					<h1 class="title_con_Type01 margintop_30">
						가입 정보
					</h1>
					<form id="ajaxFrm" name="ajaxFrm">
						<input type="hidden" id="authMobileNum" name="authMobileNum" />
						<input type="hidden" id="authNum" name="authNum" />
					</form>
					<form id="tmpFrm2" name="tmpFrm2" style="display: none;">
						<input type="file" id="file" accept="image/*" style="display: none;"/>
						<input type="file" id="files" accept="image/*" multiple="multiple" style="display: none;"/>
					</form>		
					<form id="mFrm" name="mFrm" style="display: none;">
						<input type="hidden" id="mFileName"  name="mFileName" />
						<input type="hidden" id="mData" name="mData" />
					</form>				
					<form id="tFrm" name="tFrm">
						<input type="hidden" id="adAgreeYN" name="adAgreeYN" value="<c:out value="${pageParm.adAgreeYN}"/>"/>
						<input type="hidden" id="cmpNm" name="cmpNm" value="<c:out value="${pageParm.cmpNm}"/>"/>
						<input type="hidden" id="busiNo" name="busiNo" value="<c:out value="${pageParm.busiNo}"/>"/>
						<input type="hidden" id="shaPw" name="shaPw" value=""/>
						<input type="hidden" id="email" name="email" value=""/>
						<input type="hidden" id="usrNm" name="usrNm" value=""/>
						<input type="hidden" id="mobileNo" name="mobileNo" />
						<input type="hidden" id="smsRcvAgree" name="smsRcvAgree" />
					</form>
					<form id="joinFrm" name="joinFrm">
					</form>
					<table class="join_form">
						<caption>정보입력</caption>
						<colgroup>
							<col width="20%">
							<col width="80%">
						</colgroup>
						<tbody>
						<tr>
							<th>
								<img class="required"/>이메일
							</th>
							<td>
								<input class="join_form_input03 email" type="text" id="sEmail" name="sEmail" placeholder="이메일을 입력해 주세요.">
								<span class="pass_tell_ment margintop_5 vBlock" id="emailState">이메일을 입력해 주세요.</span>
							</td>
						</tr>
				
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

								<input type="text" name="mobile2" id="mobile2" class="join_form_input01 mobile number" maxlength="4" size="4" />
								<span class="join_form_txt">-</span>
								
								<input type="text" name="mobile3" id="mobile3" class="join_form_input01 mobile number" maxlength="4" size="4" />
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
						<tr>
							<th>
								<img class="required"/>이름
							</th>
							<td>
								<input type="text" name="sUsrNm" id="sUsrNm" class="join_form_input03" placeholder="이름을 입력해주세요." value="<c:out value="${pageParm.usrNm}"/>"/>
								<span class="pass_tell_ment margintop_5 vOff" id="ckNmState">이름을 입력해주세요.</span>		
							</td>
						</tr>
						<tr>
							<th>
								<img class="required"/>비밀번호
							</th>
							<td>
								<input type="password" class="join_form_input03" maxlength="50" id="pw" placeholder="비밀번호를 입력해 주세요." /><br>
								<span class="email_check_ment2 margintop_5 vOff" id="pwState">비밀번호를 입력해 주세요.</span>
							</td>
						</tr>
						<tr>
							<th>
								<img class="required"/>비밀번호 확인
							</th>
							<td>
								<input type="password" class="join_form_input03" maxlength="50" id="ckPw" placeholder="비밀번호를 다시한번 입력해 주세요." /><br>
								<span class="email_check_ment2 margintop_5 vOff" id="ckPwState">비밀번호를 다시한번 입력해 주세요.</span>								
							</td>
						</tr>
						</tbody>
					</table>
					<div class="btn_content01 margintop_40">
						<span class="bOn" id="btnNext" onclick="fnSave();" >
							가입요청완료
						</span>
					</div>
				</div>
			</div>
		</div>
	</div >
