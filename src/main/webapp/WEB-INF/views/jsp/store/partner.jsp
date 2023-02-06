<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/layout/include/base.jsp" %>
	<script type="text/javascript">
		var dupClick1 = false;
		$(function(){  
		});
		function fnInsQna(){
			if(!_BT.isChecked('click01','개인정보 수집 및 이용 동의 바랍니다.'))return false;
			if(_BT.isEmptyById('bbsNm',  '업체명을 입력해 주세요.')) return false;
			if(_BT.isEmptyById('bbsPhone',  '연락받으실 연락처를 입력해 주세요.')) return false;
			if(_BT.isEmptyById('bbsCon',  '제휴 내용을 입력해 주세요.')) return false;

			if(!confirm('문의내용을 등록 하시겠습니까?')) return false;
			_BT.convValuel('bbsCon');
			dupClick1 = true;
			_BT.ajaxCallbackSubmit('frm',  _BT.SHOP.URL.Helpdesk.WritePartner, function(data) {
				dupClick1 = false;
				if($(data).size() > 0) {
					if(_BT.isEquals(data.code, 'success')) {
						alert('등록 완료 했습니다.\n\n업무일 기준 48시간 안에 회신예정 입니다.');	
						_BT.reset();
					}else{
						alert('등록 내역이 없습니다. 잠시 후 다시 확인 부탁 드립니다.');
					}
				}else{
					alert('등록중 오류가 발생 했습니다. 잠시 후 다시 확인 부탁 드립니다.');
				}
			},
			function(xhr, status, error) {
				dupClick1 = false;
				alert('처리중 오류가 발생했습니다. 잠시 후 다시 확인 부탁 드립니다.');
			});	
		}
	</script>
	<div class="section2" style="min-height:700px; text-align: center;" >
	 	<div align="center" style="width: 100%" >
			<img alt="광고배너" src="${staticRoot}/img/ad/ad_partner.jpg" width="100%;" height="auto;">
		</div>
		<div class="main_content06" style="text-align: center; margin: auto;">
			<h1 class="con_title01"  style="text-align: center;">
				안녕하세요. 대화 입니다.
			</h1>
			<h2 class="con_txt_Type02 margintop_5" style="text-align: center;">
				대화공업
			</h2>
			<h2 class="con_txt_Type02 margintop_10" style="text-align: center;">
				대화은 조금더 편리한 재고판매 플랫폼을 만드려 합니다. 
			</h2>
			<h2 class="con_txt_Type02 margintop_5" style="text-align: center;">
				대화은 여러 사장님들과 상생 하려 합니다.
			</h2>
			<h2 class="con_txt_Type02 margintop_20" style="text-align: center;">
				입점 및 제휴를 통해 다양한 방식으로 대화을 만나 보세요.
			</h2>
			<h2 class="con_txt_Type02 margintop_5" style="text-align: center;">
				지금 대화과 함께 하세요!
			</h2>
		 	<div align="center" style="width: 100%" >
				<img alt="광고배너" src="${staticRoot}/img/ad/proc_partner.jpg" width="625px;" height="339px;">
			</div>
<!-- 			
			<h1 class="con_title01 margintop_50" style="text-align: center;">
				재고등록 프로세스
			</h1>
			<div class="partner-wrapper">
				<div class="partner-step-wrapper">
					<div class="partner-step-number">01</div>
					<div class="partner-step-title">쇼핑몰<br/>판매자 가입</div>
				</div>
				<div class="partner-step-arrow"></div>
				<div class="partner-step-wrapper">
					<div class="partner-step-number">02</div>
					<div class="partner-step-title">담당자<br/>승인</div>
				</div>
				<div class="partner-step-arrow"></div>
				<div class="partner-step-wrapper">
					<div class="partner-step-number">03</div>
					<div class="partner-step-title">추가정보<br/>입력</div>
				</div>
				<div class="partner-step-arrow"></div>
				<div class="partner-step-wrapper">
					<div class="partner-step-number">04</div>
					<div class="partner-step-title">판매상품<br/>등록</div>
				</div>
			</div>
			<h1 class="con_title01 margintop_50" style="text-align: center;">
				제휴 프로세스
			</h1>
			<div class="partner-wrapper">
				<div class="partner-step-wrapper">
					<div class="partner-step-number">01</div>
					<div class="partner-step-title">제휴문의<br/>접수</div>
				</div>
				<div class="partner-step-arrow"></div>
				<div class="partner-step-wrapper">
					<div class="partner-step-number">02</div>
					<div class="partner-step-title">담당자<br/>검토/회신</div>
				</div>
				<div class="partner-step-arrow"></div>
				<div class="partner-step-wrapper">
					<div class="partner-step-number">03</div>
					<div class="partner-step-title">계약<br/>진행</div>
				</div>
				<div class="partner-step-arrow"></div>
				<div class="partner-step-wrapper">
					<div class="partner-step-number">04</div>
					<div class="partner-step-title">제휴 진행<br/>(초기 설정)</div>
				</div>
			</div>
-->		
			<h1 class="con_title02 margintop_5" style="text-align: center;">
				제휴 문의 및 신청
			</h1>
			<form id="frm" name="frm">
				<div class="question_box_01" style="width: 70%;margin-bottom: 10px;">					
					<div class="return_select3">
						<input type="text" id="bbsNm" name="bbsNm" placeholder="업체명" />
					</div>
					<div class="return_select3 margintop_5">
						<input type="text" id="bbsPhone" name="bbsPhone" placeholder="연락처(전화 또는 이메일)" />
					</div>
					<textarea id="bbsCon" name="bbsCon" placeholder="제휴 내용"></textarea>
					<div class="cart_btn2 margintop_10">
						<a href="javascript:;" class="btn_1" onclick="fnInsQna();">문의 등록하기</a>
					</div>					
					<div style="width:100%;text-align: left; margin-top: 10px;vertical-align: middle;height:24px;line-height:24px;">
						<input type="checkbox" id="click01" class="chk agree"/>
						<label for="click01" class="signup_txt">개인정보 수집 및 이용 동의 (필수)</label>
					</div>
				</div>
			</form>		
				<table class="signup_table margintop_5" style="width: 70%;margin: auto;">
					<caption>개인정보 수집 및 이용 동의</caption>
					<colgroup>
						<col width="10%">
						<col width="20%">
						<col width="25%">
						<col width="*">
					</colgroup>
					<tbody>
						<tr>
							<th>
								구분
							</th>
							<th>
								목적
							</th>
							<th>
								항목
							</th>
							<th>
								보유/이용기간
							</th>
						</tr>
						<tr>
							<td>
								필수
							</td>
							<td>
								서비스 이용 및 상담
							</td>
							<td>
								이름, 이메일, 전화번호 
							</td>
							<td>
								제휴 상담 처리등에 필요한 기간 또는 법령에 따른 보존기간
							</td>
						</tr>
					</tbody>
				</table>	
		</div>
	</div>