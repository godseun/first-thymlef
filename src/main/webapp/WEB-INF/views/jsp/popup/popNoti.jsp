<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/layout/include/base.jsp" %>
	<script type="text/javascript">
		var dupClick1 = false;
		var dev = 1;
		$(function(){ 
			$( ':input' ).on('focus', function() {
	    		$(this).addClass('mOn');
	    	});
			$( ':input' ).on('focusout', function() {
	    		$(this).removeClass('mOn');
	    	}); 
			$('#msg').on('keyup', function() {
				chk_len();
			});
			$('.join_checkbox').on('change', function() {
				if($(this).val() == 'S'){
					$('#reqTp').val('0');
					$('#mobile').val('${userSession.mobile}');
					$("#recYn").prop("checked",false);
				}else{
					$('#reqTp').val('1');
					$('#mobile').val('');
				}
	    	});
			_BT.Reg.Number("mobile");
		});
		function fnSend(){ 
			if(_BT.isEmptyById("mobile",	   "휴대폰 번호를 입력해 주세요.")) return false;
			if(_BT.isEmptyById("rmk",   	   "메세지를 입력해 주세요.")) return false;
			if( dupClick1 ) {
				alert($('.title').text()+" 발송중 입니다. 잠시만 기다려주세요.");
				return false;
			}
   			_BT.ajaxCallbackSubmit("crmFrm",  _BT.FRONT.URL.Customer.SetNoti, function(data) {
				dupClick1 = false;
				if($(data).size() > 0) {
					if(_BT.isEquals(data.code, "success")) {
						passSend = true;
						alert(data.msg);
					}else{
						alert(data.msg);
					}
				}else{
					alert(data.msg);
				}
			},
			function(xhr, status, error) {
				dupClick1 = false;
				alert('서버와 통신 중 오류 발생 하였습니다.');
			});	
		}		
		function fnClose(){
			window.close();
		}
	</script>
	<!-- 팝업창 시작 -->
	<h1 class="blue_title">
		회신예약 등록
		<span class="close" onclick="fnClose();">
		</span>
	</h1> 
	<form id="crmFrm" name="crmFrm">
		<div class="c13_01_02_box_03" style="width: 100%;height: 320px;padding:10px;">
			<div style="text-align: left;margin-top:10px;">
				<span class="c13_01_02_txt_01" style="margin-right:10px;">구분</span>
				<span class="return_select6">
					<select id="jobTp" name="jobTp" class="">
						<option value="0">재입고알림</option>
						<option value="1">배송알림</option>
						<option value="9">기타알림</option>
					</select>
				</span>
			</div>
			<div style="text-align: left;margin-top: 10px;">
				<span class="c13_01_02_txt_01" style="margin-right:10px;">전화번호</span>
				<input type="text" name="mobile" id="mobile" class="input_style13 mobile" maxlength="13" size="13" value="${pageParm.mobile}" placeholder="010-XXXX-XXXX"/>
			</div>
			<div style="text-align: left;margin-top: 10px;">
				<span class="c13_01_02_txt_01" style="margin-right:10px;">연관코드</span>
				<input type="text" name="relateCd" id="relateCd" class="input_style13" placeholder="규격코드 OR 주문번호 등"/>
			</div>
			<div class="c13_01_02_txtbox_01" style="height:160px;">
				<textarea id="rmk" name="rmk" placeholder="관리내역을 입력해 주세요. [재입고알림은]일시품절 해지시 등록된 번호로 자동 알림 예정입니다." rows="6" style="width: 100%;height: 150px;" ></textarea>
			</div>
		</div>
	</form>
	<div class="btn_group margintop_10 marginbottom_10" style="margin-left:0;">
		<span class="form_btn_Type_blue" onclick="fnSend();">등  록</span>
		<span class="form_btn_Type_gray" onclick="fnClose();">닫  기</span>
	</div>