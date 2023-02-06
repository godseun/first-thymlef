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
					$("#confYn").prop("checked",false);
				}else{
					$('#reqTp').val('1');
					$('#mobile').val('');
				}
	    	});
			_BT.Reg.Number("mobile");
			_BT.setGroupCheck("confYn", "chk");
		});
		function fnSend(){ 
			if(_BT.isEmptyById("mobile",	   "휴대폰 번호를 입력해 주세요.")) return false;
			if(_BT.isEmptyById("rmk",   	   "메세지를 입력해 주세요.")) return false;
			if( dupClick1 ) {
				alert($('.title').text()+" 등록중 입니다. 잠시만 기다려주세요.");
				return false;
			}
   			_BT.ajaxCallbackSubmit("crmFrm",  _BT.FRONT.URL.Customer.ReqCRM, function(data) {
				dupClick1 = false;
				if($(data).size() > 0) {
					if(_BT.isEquals(data.code, "success")) {
						passSend = true;
						alert(data.msg);
						if( 
							  	 !$('#recYn').prop('checked')
							&& !$('#confYn').prop('checked')
						){
							var jMsg = '[' + $("#reqTp option:selected").text() + '] '
									       +$('#mobile').val() + '@@'
									       +$('#rmk').val().replace(/\n/g,'@@');
							opener.parent.notiMsg(jMsg);
						}
						opener.parent.doAction('search', '1');
						fnClose();
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
		CRM / SR 등록 
		<span class="close" onclick="fnClose();">
		</span>
	</h1> 
	<form id="crmFrm" name="crmFrm">
		<div class="c13_01_02_box_03" style="width: 100%;height: 320px;padding:10px;">
			<div style="text-align: left;margin-top:10px;">
				<span class="c13_01_02_txt_01" style="margin-right:10px;">업무구분</span>
				<input id="click01" name="jobTp" value="C" class="join_checkbox" type="radio" checked="checked"><label class="join_form_check" for="click01">CRM</label>
				<input id="click02" name="jobTp" value="S" class="join_checkbox" type="radio"><label class="join_form_check" for="click02">SR</label>
			</div>
			<div style="text-align: left;margin-top: 10px;">
				<span class="c13_01_02_txt_01" style="margin-right:10px;">요청구분</span>
				<span class="return_select6">
					<select id="reqTp" name="reqTp" class="">
						<option value="1">재고문의</option>
						<option value="2">상품문의</option>
						<option value="3">주문관리</option>
						<option value="4">배송관리</option>
						<option value="5">기타문의</option>
						<option value="0">SR요청</option>
					</select>
				</span>
				<input id="recYn" name="recYn" value="1" type="checkbox" class="chk" style="margin-left:20px;"/>
				<label for="recYn" class="signup_txt">접수</label>
				<input id="confYn" name="confYn" value="1" type="checkbox" class="chk" style="margin-left:10px;"/>
				<label for="confYn" class="signup_txt">완료</label>
			</div>
			<div style="text-align: left;margin-top: 10px;">
				<span class="c13_01_02_txt_01" style="margin-right:10px;">전화번호</span>
				<input type="text" name="mobile" id="mobile" class="input_style13 mobile" maxlength="13" size="13" value="${pageParm.mobile}" placeholder="010-XXXX-XXXX"/>
			</div>
			<div class="c13_01_02_txtbox_01" style="height:160px;">
				<textarea id="rmk" name="rmk" placeholder="요청 내역을 입력해 주세요." rows="6" style="width: 100%;height: 150px;" ></textarea>
			</div>
		</div>
	</form>
	<div class="btn_group margintop_10 marginbottom_10" style="margin-left:0;">
		<span class="form_btn_Type_blue" onclick="fnSend();">등  록</span>
		<span class="form_btn_Type_gray" onclick="fnClose();">닫  기</span>
	</div>