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
	<div class="section" style="min-height:0;margin-bottom: 0px;">
	 	<div class="tab_bar margintop_20 marginbottom_20" style="width: 100%;">
			<ul class="tab_list">
				<li class="tab_item" style="width: 100px;">
					<a href="javascript:;" class="tab_link" onclick="_BT.moveUrl(_BT.SHOP.URL.Helpdesk.Notice);" data-type="tab1"><span id="tab1" class="tab" style="width: 100px;">대화소식</span></a>
				</li>
				<li class="tab_item" style="width: 100px;">
					<a href="javascript:;" class="tab_link" onclick="_BT.moveUrl(_BT.SHOP.URL.Helpdesk.FAQ);" data-type="tab2"><span id="tab2" class="tab"  style="width: 100px;">FAQ</span></a>
				</li>
				<li class="tab_item" style="width: 100px;">
					<a href="javascript:;" class="tab_link" onclick="_BT.moveUrl(_BT.SHOP.URL.Helpdesk.QNA);" data-type="tab3"><span id="tab3" class="tab tabOn"  style="width: 100px;">QNA</span></a>
				</li>
			</ul>
		</div>
		<div class="question_box_01" style="text-align: center;">					
			<form id="frm" name="frm">
				<input type="hidden" id="title" name="title"/>	
				<div class="return_select3">
					<select id="bbsTp" name="bbsTp" class="" style="text-indent:10px;width: 100%;">
						<option value="" style="text-indent:10px;">문의종류를 선택해 주세요.</option>
						<c:forEach items="${cbBbsTp}" var="bbsTp" varStatus="status">
							<option value="${bbsTp.cbCode}">${bbsTp.cbText}</option>
						</c:forEach>
					</select>
				</div>
				<c:if test="${empty userSession}">
					<div class="return_select3 margintop_5">
						<input type="text" id="bbsNm" name="bbsNm" placeholder="성함 또는 상호명" style="width: 100%;"/>
					</div>
					<div class="return_select3 margintop_5">
						<input type="text" id="bbsPhone" name="bbsPhone" placeholder="연락 받으실 연락처(이메일 or 전화번호)" style="width: 100%;"/>
					</div>
				</c:if>
				<textarea id="bbsCon" name="bbsCon" placeholder="문의 내용을 입력해 주세요." style="height:150px;"></textarea>
				<div class="cart_btn2 margintop_10">
					<a href="javascript:;" class="btn_1" onclick="fnInsQna();">문의 등록하기</a>
				</div>					
			</form>
		</div>
		<div class="question_sbox_02">
			상담시간 : 평일 오전 9시 ~ 오후 6시<br>점심시간 : 오후 12시 ~ 오후 1시<span class="question_sbox_02_stxt">* 토,일요일 및 공휴일 휴무</span>
		</div>
		<div class="question_sbox_01">
			<span class="question_sbox_01_txt">
				<img src="${staticRoot}/img/question_img01.jpg" alt="tel"><a href="tel:XXXXXXXX">XXXX-XXXX</a>
			</span>
		</div>
		<c:if test="${fn:length(bbsList) gt 0}">
	 		<h1 class="title_con_Type01" style="margin-top:140px; margin-right:10px; text-align: left;">
				문의내역
			</h1>
			<div class="notcie_board margintop_30" style="min-height: 200px;">
				<!--공지사항 제목-->
				<c:forEach items="${bbsList}" var="qna" varStatus="status">
					<div class="notcie_board2">
						<div class="notcie_board_tit"><a href="javascript:;"><strong>[Q]</strong></a><br/>
							${fn:replace(qna.CONTENT, cn, br)}
						</div>
						<div class="notcie_board_date"><c:out value="${qna.TITLE}"/> [ <c:out value="${qna.CREATE_DT}"/> ]</div>	
					</div>
					<c:if test="${! empty qna.ANSWER}">
						<div class="notcie_board_con1">
							<strong>[A]</strong>
							${fn:replace(qna.ANSWER, cn, br)}
						</div>
					</c:if>
				</c:forEach>
			</div>
		</c:if>
	</div>
