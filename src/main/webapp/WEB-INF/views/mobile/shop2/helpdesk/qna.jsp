<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/layout/include/base.jsp" %>
	<script type="text/javascript">
		var dupClick1 = false;
		var dupClick2 = '${empty userSession}';
		$(function(){  
			$( ':input' ).on('focus', function() {
	    		$(this).addClass('mOn');
	    	});
			$( ':input' ).on('focusout', function() {
	    		$(this).removeClass('mOn');
	    	}); 
			$('#bbsTp').on("change", function() {
				$('#title').val($("#bbsTp option:selected").text()); 
	    	}); 
		});
		function fnInsQna(){
			if( dupClick1 ) {
				alert('문의내용을 등록하는 중입니다.\n\n잠시만 기다려주세요.');
				return false;
			}
			if(_BT.isEmptyById('bbsTp',    '문의종류를 선택해 주세요.')) return false;
			if(dupClick2 == 'true' && _BT.isEmptyById('bbsNm',  	'문의자 성함을 입력해 주세요.')) return false;
			if(dupClick2 == 'true' && _BT.isEmptyById('bbsPhone',	'연락받으실 연락처를 입력해 주세요.')) return false;
			if(_BT.isEmptyById('bbsCon',  '문의 내용을 입력해 주세요.')) return false;
			
			if(!confirm('문의내용을 등록 하시겠습니까?')) return false;
			_BT.convValuel('bbsCon');
			dupClick1 = true;
			_BT.ajaxCallbackSubmit('frm',  _BT.SHOP.URL.Helpdesk.WriteQNA, function(data) {
				dupClick1 = false;
				if($(data).size() > 0) {
					if(_BT.isEquals(data.code, 'success')) {
						alert('문의내용을 등록 완료 했습니다.\n\n업무일 기준 24시간 안에 회신예정 입니다.');	
						_BT.reset();
					}else{
						alert('문의내용 등록 내역이 없습니다. 잠시 후 다시 확인 부탁 드립니다.');
					}
				}else{
					alert('문의내용 등록중 오류가 발생 했습니다. 잠시 후 다시 확인 부탁 드립니다.');
				}
			},
			function(xhr, status, error) {
				dupClick1 = false;
				alert('처리중 오류가 발생했습니다. 잠시 후 다시 확인 부탁 드립니다.');
			});	
		}
	</script>
	<div class="section">
		<h1 class="title_Type03">
			1:1문의
			<div class="sub_location">
				<div class="list_location01">
					<span class="txt01">고객만족 센터</span>
					<span class="arrow"><img src="${staticRoot}/img/bl_01.jpg" alt=">" /></span>
					<span class="last_txt">1:1문의</span>
				</div>
			</div>
		</h1>
		<form id="frm" name="frm">
			<input type="hidden" id="title" name="title"/>	
			<div class="question_box_01">					
				<div class="return_select3">
					<select id="bbsTp" name="bbsTp" class="" style="text-indent:10px;">
						<option value="" style="text-indent:10px;">문의종류를 선택해 주세요.</option>
						<c:forEach items="${cbBbsTp}" var="bbsTp" varStatus="status">
							<option value="${bbsTp.cbCode}">${bbsTp.cbText}</option>
						</c:forEach>
					</select>
				</div>
<!-- 
				<div class="return_select4">
					<select id="" class="" name=""><option value="문의 분류">문의 분류</option></select>
					<select id="" class="marginleft_10" name=""><option value="문의 분류">문의 분류</option></select>
				</div>
-->
				<c:if test="${empty userSession}">
					<div class="return_select3 margintop_5">
						<input type="text" id="bbsNm" name="bbsNm" placeholder="성함" />
					</div>
					<div class="return_select3 margintop_5">
						<input type="text" id="bbsPhone" name="bbsPhone" placeholder="연락 받으실 연락처(이메일 or 전화번호)" />
					</div>
				</c:if>
				<textarea id="bbsCon" name="bbsCon" placeholder="문의 내용을 입력해 주세요."></textarea>
				<div class="cart_btn2 margintop_10">
					<a href="javascript:;" class="btn_1" onclick="fnInsQna();">문의 등록하기</a>
				</div>					
			</div>
		</form>
		<div class="question_sbox_01">
			<span class="question_sbox_01_txt">
				<img src="${staticRoot}/img/question_img01.jpg" alt="tel">XXXX-XXXX
			</span>
		</div>
		<div class="question_sbox_02">
			상담시간 : 평일 오전 9시 ~ 오후 6시<br>점심시간 : 오후 12시 ~ 오후 1시<span class="question_sbox_02_stxt">* 토,일요일 및 공휴일 휴무</span>
		</div>
	</div>
