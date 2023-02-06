<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<%@ include file="/WEB-INF/views/common/layout/include/base.jsp" %>
	<script type="text/javascript" src="${staticRoot}/js/joinValidate.js"></script>
	<script type="text/javascript" src="${staticRoot}/sdk/sha/sha.js"></script>
	<script src="http://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
	<script>
	    function fnPostcode() {
		    new daum.Postcode({
		        oncomplete: function(data) {
		        	$("#zoneCode").val(data.zonecode);
		        	$("#sigunguCode").val(data.sigunguCode);
		        	$("#address").val(data.address);
		        	$("#dtlAddress").val("("+data.bname+")");
		        }
		    }).open();
	    }
	</script>
	<script type="text/javascript">
		var passEmail	= false;
		//var passId	 	= false;
		var passPw 	= false;
		var passCkPw 	= false;
		$(function(){
			if('${msg}' != ''){
				alert('${msg}');
			}else if(
					_BT.isEmpty('${pageParm.adAgreeYN}','유효하지 않은 접근 입니다.\n\다시 확인 부탁 드립니다.')||
					_BT.isEmpty('${pageParm.busiNo}','유효하지 않은 접근 입니다.\n\n다시 확인 부탁 드립니다.')||
					_BT.isEmpty('${pageParm.cmpNm}','유효하지 않은 접근 입니다.\n\n다시 확인 부탁 드립니다.')
			) {
				_BT.moveUrl(_BT.SHOP.URL.Join.sStep1);
			};
			$( ":input" ).on("focus", function() {
				if(($( this ).prop( "readonly" ))){
		    		$(this).addClass("mbOn");
				}else{
		    		$(this).addClass("mOn");
				} 
	    	});

			$( ":input" ).on("focusout", function() {
		    	$(this).removeClass("mbOn");
	    		$(this).removeClass("mOn");
	    	});

			$("#telNum, #faxNum, #mobile2, #mobile3").addClass("number");
			_BT.Reg.Number("number");
			
			$("#sEmail").on("change", function(){
				if($(this).val() == "keyin"){
					$("#emailAddr").val('');
					$("#emailAddr").prop('readonly', false);
					
				}else if($(this).val() == "xxx"){
					$("#emailAddr").val('');
					$("#emailAddr").prop('readonly', true);
					
				}else{
					$("#emailAddr").val($(this).val());
					$("#emailAddr").prop('readonly', true);
					
				}	
				chkEmail();
			});
			$("#tmpEmail").on("change", function(){
				if($(this).val() == "keyin"){
					$("#tmpEmailAddr").val('');
					$("#tmpEmailAddr").prop('readonly', false);
					
				}else if($(this).val() == "xxx"){
					$("#tmpEmailAddr").val('');
					$("#tmpEmailAddr").prop('readonly', true);
					
				}else{
					$("#tmpEmailAddr").val($(this).val());
					$("#tmpEmailAddr").prop('readonly', true);
				}	
			});
			
			$("#emailId").on("change", function(){  
				chkEmail();
			});
			
			$("#emailAddr").on("change", function(){  
				chkEmail();
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
			}); 
/* 			
	    	$("#tmpUsrId").on("keyup", function() {
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
	    	
 */			$('#uploadFile').change(function(){
					var currentFile = $(this).val().toLowerCase();
					var fileExt     = currentFile.split(".")[currentFile.split(".").length-1];
					var allowExt    = "jpg,jpeg,png,gif,pdf";
					if(allowExt.indexOf(fileExt) == -1) {
						alert(allowExt + " 파일만 업로드 가능합니다.");
						//_BT.FileUtil.resetAjaxUpload(id, previewId);
						return false;
					}
					//$('span.fileview').text($('#uploadFile').val());
				});
		});
		function chkEmail(){
			passEmail	= false;
			if(
					!_BT.isEmpty($("#emailId").val()) &&
					!_BT.isEmpty($("#emailAddr").val())
			){
				var chkEmailAddr = _BT.getJoinData("@", new Array("emailId","emailAddr"));
				var chkEmailResult = joinValidate.checkEmail(chkEmailAddr);
				$("#emailState").removeClass("vOff");
				$("#emailState").text(chkEmailResult.desc);
				if( chkEmailResult.code == "0"){
					var chkEmail = "9";
					_BT.ajaxDataSubmit("post", _BT.SHOP.URL.Join.checkEmail, {email : chkEmailAddr},
					function(data) {
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
			}else{
				$("#emailState").css("color","#fe0000");	
				$("#emailState").text("이메일을 입력해 주세요.");
			}
		}
		var dupClick1 = false;
		function fnChkUsrId(){
			if(passId){
				if( dupClick1 ) {
					alert("ID 중복확인 중 입니다. 잠시만 기다려주세요.");
					return false;
				}
				chkId = false;
				dupClick1 = true;
				_BT.ajaxDataSubmit("post", _BT.SHOP.URL.Join.chkUsrId, {
					usrId : $("#tmpUsrId").val()
				}, function(data) {
					dupClick1 = false;
					if($(data).size() > 0) {
						if(_BT.isEquals(data.code, "success")) {
							if(_BT.isEquals(data.value, "CODE0")) {
								chkId = true;
								$("#ckIdState").css("color","#3f51b5");	
				    			$("#ckIdState").text("사용할수 있는 아이디 입니다."); 
				    			
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
					dupClick1 = false;
					$("#ckIdState").css("color","#fe0000");	
	    			$("#ckIdState").text("아이디 중복확인 바랍니다.");
				});
			}
		}
		function fnNextStep() {
			if(_BT.isEmptyById("prsNm",    	"대표자 성함을 입력해 주세요.")) return false;
			if(_BT.isEmptyById("bizCnd",    	"업태를 입력해 주세요.")) return false;
			if(_BT.isEmptyById("induty",    	"업종을 입력해 주세요.")) return false;
			if(_BT.isEmptyById("telNum",    	"전화번호를 입력해 주세요.")) return false;
			if(_BT.isEmptyById("faxNum",    	"팩스번호를 입력해 주세요.")) return false;
			if(_BT.isEmptyById("address",    	"주소를 입력해 주세요.")) return false;
			if(_BT.isEmptyById("dtlAddress", "상세주소를 입력해 주세요.")) return false;
			if(_BT.isEmptyById("file",    		"사업자 등록증을 첨부해 주세요.")) return false;
			if(_BT.isEmptyById("storeNm",    "상점명을 입력해 주세요.")) return false;
			if(_BT.isEmptyById("usrNm",    	"담당자명을 입력해 주세요.")) return false;

			//if(!chkId){alert("아이디 중복 확인해 주세요.");return false;}
			if(!passEmail){alert("이메일주소를 확인해 주세요.");return false;}
			if(!passPw){alert("비밀번호를 확인해 주세요.");return false;}
			if(!passCkPw){alert("확인용 비밀번호를 확인해 주세요.");return false;}

			var mobileNo = _BT.getJoinData("-", new Array("mobile1","mobile2","mobile3"));
 			if(mobileNo.length < 12){ 
 				alert("담당자 연락처를 입력해 주세요.");return false;
 			}else{
 				$("#mobileNo").val(mobileNo);
 			}
			
			var shaObj = new jsSHA(jQuery("#pw").val(), "ASCII");
			$("#shaPw").val(shaObj.getHash("SHA-256", "HEX"));
			if(_BT.isChecked("click01"))
				$("#smsRcvAgree").val("Y");
			else 
				$("#smsRcvAgree").val("N");
			//$("#usrId").val($("#tmpUsrId").val());
			$("#email").val(_BT.getJoinData("@", new Array("emailId","emailAddr")));
			//$("#etaxEmail").val(_BT.getJoinData("@", new Array("tmpEmailId","tmpEmailAddr")));
			_BT.actFormSubmit("frm", "post", _BT.SHOP.URL.Join.sStep3, "등록 하시겠습니까?");
		}
	</script>
	
	<div class="wid_1248">
		<div class="ad_content01 margintop_20">
			<img src="${staticRoot}/img/ad/m_ad_img001.jpg " alt="광고배너">
		</div>
		<div class="container">
			<div class="section center_content">
				<h1 class="title_Type03">
					판매자 입점 신청
					<div class="sub_location">
						<div class="list_location01">
							<a href="javascript:;" onclick="_BT.moveUrl(_BT.SHOP.URL.Common.Main);" class="home">HOME</a>
							<span class="arrow"><img src="${staticRoot}/img/bl_01.jpg" alt="" /></span>
							<span class="txt01">회원</span>
							<span class="arrow"><img src="${staticRoot}/img/bl_01.jpg" alt="" /></span>
							<span class="last_txt">판매자 입점 신청</span>
						</div>
					</div>
				</h1>
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
				<div class="c10_03_06 margintop_30">
					<h1 class="title_con_Type01 margintop_30">
						가입 정보
					</h1>
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
									<input type="text" class="join_form_input02" id="emailId" name="emailId"/><span class="join_form_txt">@</span><input type="text" class="join_form_input02" id="emailAddr" name="emailAddr" readonly="readonly"/>
									<select name="sEmail" id="sEmail" class="join_form_select01">
										<option value="xxx">선택하세요</option>
										<option value="naver.com">naver.com</option>
										<option value="hanmail.net">hanmail.net</option>
										<option value="gmail.com">gmail.com</option>
										<option value="keyin">직접입력</option>
									</select><br>
									<span class="email_check_ment2 vOff" id="emailState">이메일을 입력해 주세요.</span>
								</td>
							</tr>
<!-- 						
							<tr>
								<th>
									<img class="required"/>아이디
								</th>
								<td>
									<input type="text" class="join_form_input03" maxlength="20" id="tmpUsrId" placeholder="아이디를 입력해주세요."/>
									<span class="join_form_btn"  id="btnChkUsrId" onclick="fnChkUsrId();">중복확인</span><br>
									<span class="email_check_ment2 margintop_5 vOff" id="ckIdState">아이디를 입력해주세요.</span>
								</td>
							</tr>
	 -->						
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
					<form id="frm" name="frm">
						<input type="hidden" id="adAgreeYN" name="adAgreeYN" value="<c:out value="${pageParm.adAgreeYN}"/>"/>
						<input type="hidden" id="busiNo" name="busiNo" value="<c:out value="${pageParm.busiNo}"/>"/>
						<input type="hidden" id="shaPw" name="shaPw" value=""/>
						<input type="hidden" id="email" name="email" value=""/>
						<input type="hidden" id="etaxEmail" name="etaxEmail" value=""/>
						<input type="hidden" id="mobileNo" name="mobileNo" />
						<input type="hidden" id="smsRcvAgree" name="smsRcvAgree" />
<!-- 
						<input type="hidden" id="usrId" name="usrId" />
 -->						
 						<h1 class="title_con_Type01 margintop_60">
							회사 정보
						</h1>
						<table class="join_form">
							<caption>정보입력</caption>
							<colgroup>
								<col width="20%">
								<col width="30%">
								<col width="20%">
								<col width="30%">
							</colgroup>
							<tbody>
								<tr>
									<th>
										<img class="required"/>사업자 등록번호
									</th>
									<td colspan="3">
										<input type="text" class="join_form_input01" id="busiNo1" name="busiNo1" value="<c:out value="${pageParm.busiNo1}"/>" readonly="readonly"/><span class="join_form_txt">-</span>
										<input type="text" class="join_form_input01" id="busiNo2" name="busiNo2" value="<c:out value="${pageParm.busiNo2}"/>" readonly="readonly"/><span class="join_form_txt">-</span>
										<input type="text" class="join_form_input01" id="busiNo3" name="busiNo3" value="<c:out value="${pageParm.busiNo3}"/>" readonly="readonly"/>								
									</td>
								</tr>
								<tr>
									<th>
										<img class="required"/>상호명
									</th>
									<td>
										<input type="text" class="join_form_input03" id="cmpNm" name="cmpNm" value="<c:out value="${pageParm.cmpNm}"/>" readonly="readonly" />
									</td>
									<th>
										<img class="required"/>대표자명
									</th>
									<td>
										<input type="text" class="join_form_input03" id="prsNm" name="prsNm" maxlength="25" placeholder="대표자 성함을 입력해 주세요." />
									</td>
								</tr>
								<tr>
									<th>
										<img class="required"/>업태
									</th>
									<td>
										<input type="text" class="join_form_input03" id="bizCnd" name="bizCnd" maxlength="50" placeholder="업태를 입력해 주세요." />
									</td>
									<th>
										<img class="required"/>업종
									</th>
									<td>
										<input type="text" class="join_form_input03" id="induty" name="induty" maxlength="50" placeholder="업종을 입력해 주세요." />
									</td>
								</tr>
								<tr>
									<th>
										<img class="required"/>전화번호
									</th>
									<td>
										<input type="text" class="join_form_input03" id="telNum" name="telNum" maxlength="15" placeholder="전화번호를 입력해 주세요." />
									</td>
									<th>
										팩스번호
									</th>
									<td>
										<input type="text" class="join_form_input03" id="faxNum" name="faxNum" maxlength="15" placeholder="팩스번호를 입력해 주세요." />
									</td>
								</tr>
								<tr>
									<th>
										<img class="required"/>주소
									</th>
									<td colspan="3">
										<input type="hidden" id="sigunguCode" name="sigunguCode"/> 
										<input type="text" class="join_form_input01" id="zoneCode" name="zoneCode" readonly="readonly" placeholder="우편번호" />
										<span class="join_form_btn01" onclick="fnPostcode();">우편번호검색</span>
										<input type="text" class="join_form_input03 marginleft_10" id="address" name="address" readonly="readonly" placeholder="주소" />
										<input type="text" class="join_form_input03 marginleft_10" id="dtlAddress" name="dtlAddress" placeholder="상세주소"/>
									</td>
								</tr>
								<tr>
									<th>
										<img class="required"/>사업자 등록증
									</th>
									<td data-id="file_info" colspan="3">
										<div>
											<span class="fileview"></span>
			 									<input type="file" id="file" name="file" style="width:420px;"/> 
										</div>
									</td>
								</tr>
							</tbody>
						</table>
						<h1 class="title_con_Type01 margintop_60">
							등록 정보
						</h1>
						<table class="join_form">
							<caption>정보입력</caption>
							<colgroup>
								<col width="20%">
								<col width="80%">
							</colgroup>
							<tbody>
								<tr>
									<th>
										<img class="required"/>상점명
									</th>
									<td>
										<input type="text" class="join_form_input03" id="storeNm" name="storeNm" maxlength="25" placeholder="상점명을 입력해 주세요." />
									</td>
								</tr>
								<tr>
									<th>
										<img class="required"/>담당자명
									</th>
									<td>
										<input type="text" class="join_form_input03" id="usrNm" name="usrNm" maxlength="25" placeholder="담당자명을 입력해 주세요." />
									</td>
								</tr>
								<tr>
									<th>
										담당부서명
									</th>
									<td>
										<input type="text" class="join_form_input03" id="deptNm" name="deptNm" maxlength="25" placeholder="담당 부서명을 입력해 주세요." />
									</td>
								</tr>
								<tr>
									<th>
										<img class="required"/>연락처
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

										<input type="checkbox" name="click01" id="click01" class="join_checkbox" checked="checked"/><label for="click01" class="join_form_check">SMS 수신</label>
									</td>
								</tr>
							</tbody>
						</table>
					</form>
					<div class="btn_content01 margintop_40">
						<span class="bOn" id="btnNext" onclick="fnNextStep();" >
							가입요청완료
						</span>
					</div>
				</div>
			</div>
		</div>
	</div >
