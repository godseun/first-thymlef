<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/layout/include/base.jsp" %>
	<script type="text/javascript">
		var dupClick1 = false;
		$(function(){  
		});
	</script>
	<div class="section2" style="min-height:700px; text-align: center;" >
	 	<div align="center" style="width: 100%" >
			<img alt="광고배너" src="${staticRoot}/img/ad/ad_partner.jpg" width="900px;" height="auto;">
		</div>
		<div class="main_content06" style="text-align: center; margin: auto;">
			<h1 class="con_title02"  style="text-align: center;">
				대화 소개
			</h1>
			<h2 class="con_txt_Type02 margintop_10" style="text-align: center;">
			대화은 아직 배고 픕니다.
			</h2>
			<h2 class="con_txt_Type02 margintop_5" style="text-align: center;">
				그래서 대한민국 공구 시장을 먹을려고 합니다.
			</h2>
			<h2 class="con_txt_Type02 margintop_5" style="text-align: center;">
				No.1 산업용품 오픈마켓이 되는 날까지 아디오스~
			</h2>
			<h1 class="con_title01 margintop_50" style="text-align: center;">
				입점 프로세스
			</h1>
			<h1 class="con_txt_Type01 margintop_10" style="text-align: center;">
				쇼핑몰 입점 진행 > 담당자 검토 후 승인 > 추가정보 입력 > 입점 진행 (상품 등록)
			</h1>
			<h1 class="con_title01 margintop_30" style="text-align: center;">
				제휴 프로세스
			</h1>
			<h1 class="con_txt_Type01 margintop_10" style="text-align: center;">
				제휴 문의 접수 > 검토후 담당자 회신 > 계약 > 제휴 진행 (상품 초기 설정)
			</h1>
			<h1 class="con_title02 margintop_5" style="text-align: center;">
				제휴 문의 및 신청
			</h1>
			<form id="frm" name="frm">
				<div class="question_box_01">					
					<div class="return_select3">
						<input type="text" id="bbsNm" name="bbsNm" placeholder="업체명" />
					</div>
					<div class="return_select3 margintop_5">
						<input type="text" id="bbsPhone" name="bbsPhone" placeholder="연락처" />
					</div>
					<textarea id="bbsCon" name="bbsCon" placeholder="제휴 내용"></textarea>
					<div class="cart_btn2 margintop_10">
						<a href="javascript:;" class="btn_1" onclick="fnInsQna();">문의 등록하기</a>
					</div>					
				</div>
			</form>		
			<div style="width:90%; float:left;">
				<input type="checkbox" id="click01" class="chk agree"/>
				<label for="click01" class="signup_txt">개인정보 수집 및 이용 동의 (필수)</label>
			</div>
				<table class="signup_table margintop_5" style="width: 70%;margin: auto;">
					<caption>개인정보 수집 및 이용 동의</caption>
					<colgroup>
						<col width="10%">
						<col width="25%">
						<col width="25%">
						<col width="40%">
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