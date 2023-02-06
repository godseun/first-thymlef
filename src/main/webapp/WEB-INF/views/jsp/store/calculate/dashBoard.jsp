<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/layout/include/base.jsp" %>
	<script type="text/javascript">
		var dupClick1 = false;
		$(function(){  
		});
	</script>
	<div class="storeSection" style="min-height:600px;">
	 	<h1 class="title_Type03">
			정산 현황
			<div class="sub_location">
				<div class="list_location01">
					<span class="txt01">정산관리</span>
					<span class="arrow"><img src="${staticRoot}/img/bl_01.jpg" alt=">" /></span>
					<span class="last_txt">정산 현황</span>
				</div>
			</div>
		</h1>
		<div style="width: 65%;display: inline-block;">
			<h1 class="con_title04" style="padding: 5px 0;"><span class="boderTxt"><c:out value="${magam[0].STORE_NM}"/></span> 고객님의 <c:out value="${fn:substring(magam[0].TAR_DT,0,4)}"/>년 <c:out value="${fn:substring(magam[0].TAR_DT,4,6)}"/>월</h1>
			<h1 class="con_title04" style="padding: 5px 0;">대화 오픈마켓을 통해 판매 하신</h1>
			<h1 class="con_title04" style="padding: 5px 0;">총 상품판매 금액은 <span class="boderTxt"><fmt:formatNumber value="${magam[0].B + magam[0].C}" groupingUsed="true"/>원</span>  입니다.<span style="font-size:13px;">(택배비 별도)</span></h1>
		</div>
		<div style="width: 35%;display: inline-block;">
			<h1 class="con_title04 boderTxt" style="text-align:center; border-bottom: 1px solid #d8d8d8;">구매 확정 금액<span class="con_title02" style="padding: 0 10px;"><fmt:formatNumber value="${magam[0].PRDT_AMT}" groupingUsed="true"/></span>원</h1>
			<h1 style="font-size:13px; padding: 5px 0;text-align: right;">
				(<c:out value="${magam[0].SYS_DT}"/>일 기준)
			</h1>
		</div>
		<h1 class="title_con_Type01 margintop_50">
			<c:out value="${fn:substring(magam[0].TAR_DT,4,6)}"/>월 정산 요약
			<span style="position:absolute;right:3px;bottom:-15px;color:#000;font-size: 14px;">
				(<c:out value="${magam[0].FIRST_DT}"/> ~ <c:out value="${magam[0].COMP_DT}"/> 구매확정건 기준)
			</span>
		</h1>
		<table class="cart_list" id="ordr_item_list">
			<caption>정산요약</caption>
			<colgroup>
				<col width="20%">
				<col width="5%">
				
				<col width="20%">
				<col width="5%">
				
				<col width="20%">
				<col width="5%">
				
				<col width="25%">
			</colgroup>
			<tbody>
				<tr>
					<th>구매확정 물품금액</th>
					<th>&nbsp;</th>
					<th>수수료(<fmt:formatNumber value="${magam[0].MAGAM_RATE}" groupingUsed="true"/>%)</th>
					<th>&nbsp;</th>
					<th>물류비 정산</th>
					<th>&nbsp;</th>
					<th class="cart_th_01">정산금액</th>
				</tr>
				<tr>
					<td><fmt:formatNumber value="${magam[0].PRDT_AMT}" groupingUsed="true"/></td>
					<td>
						<label class="icon"><img src="${staticRoot}/img/icon_minus.jpg" alt="빼기" /></label>
					</td>
					<td><fmt:formatNumber value="${magam[0].ORDR_FEE}" groupingUsed="true"/></td>
					
					<td>
						<label class="icon"><img src="${staticRoot}/img/icon_plus.jpg" alt="더하기" /></label>
					</td>
					<td><fmt:formatNumber value="${magam[0].DEVY_AMT}" groupingUsed="true"/></td>
					<td>
						<label class="icon"><img src="${staticRoot}/img/icon_equals.jpg" alt="합계" /></label>
					</td>
					<td><label class="price_color_red"><fmt:formatNumber value="${magam[0].TOT_AMT}" groupingUsed="true"/></label></td>
				</tr>
			</tbody>
		</table>
		<h1 class="title_con_Type01 margintop_50">
			계산서 발행 대상 금액
			<span style="position:absolute;right:3px;bottom:-15px;color:#000;font-size: 14px;">
				(<c:out value="${fn:substring(magam[0].TAR_DT,0,4)}"/>년 <c:out value="${fn:substring(magam[0].TAR_DT,4,6)}"/>월 분 : <c:out value="${magam[0].LIMIT_DT}"/>까지 발행 필)
			</span>
		</h1>
		
		<table class="cart_list_total margintop_20 border_top border_bottom">
			<caption>장바구니</caption>
			<colgroup>
				<col width="60%">
				<col width="40%">
			</colgroup>
			<tbody>
				<tr>
					<th style="text-align:center;">
						정산기준 공급가액 <label class="price_color_red" id="sumTotTxt"><fmt:formatNumber value="${magam[0].TAX_AMT}" groupingUsed="true"/></label>원
						<label class="icon"><img src="${staticRoot}/img/icon_plus.jpg" alt="더하기" /></label>
						부가세<label class="price_color" id="sumPriceTxt"><fmt:formatNumber value="${magam[0].TAX_FEE}" groupingUsed="true"/>원</label>
					</th>
					<th class="cart_th_01" style="text-align:left;">
						<label class="icon"><img src="${staticRoot}/img/icon_equals.jpg" alt="합계" /></label>
						발행금액<label class="price_color_red" id="sumTotTxt"><fmt:formatNumber value="${magam[0].TOT_AMT}" groupingUsed="true"/></label>원
					</th>
				</tr>
			</tbody>
		</table>
		<div class="signup_agree margintop_10">
			<p class="alarm_txt margintop_5">※<c:out value="${fn:substring(magam[0].TAR_DT,0,4)}"/>년 <c:out value="${fn:substring(magam[0].TAR_DT,4,6)}"/>월 정산금액 중 <span class="redCr bTxt" ><c:out value="${magam[0].LIMIT_DT}"/>까지</span> 세금계산서 발행 금액분만 11일 입금 예정 입니다.</p>
		</div>
		<h1 class="title_con_Type01 margintop_50">
			<c:out value="${fn:substring(magam[0].TAR_DT,4,6)}"/>월 확정금액 요약 
			<span style="position:absolute;right:3px;bottom:-15px;color:#000;font-size: 14px;">
				(<c:out value="${magam[0].FIRST_DT}"/> ~ <c:out value="${magam[0].LAST_DT}"/> 결제건 기준)
			</span>
		</h1>
		<table class="cart_list" id="ordr_item_list">
			<caption>정산요약</caption>
			<colgroup>
				<col width="15%">
				<col width="5%">
				
				<col width="15%">
				<col width="5%">

				<col width="15%">
				<col width="5%">
				
				<col width="15%">
				<col width="5%">
				
				<col width="20%">
			</colgroup>
			<tbody>
				<tr>
					<th>판매 금액</th>
					<th>&nbsp;</th>
					<th>미확정 이월금액</th>
					<th>&nbsp;</th>
					<th>당월 확정금액</th>
					<th>&nbsp;</th>
					<th>전월 이월금액</th>
					<th>&nbsp;</th>
					<th>구매확정 금액</th>
				</tr>
				<tr>
					<td><fmt:formatNumber value="${magam[0].B + magam[0].C}" groupingUsed="true"/></td>
					<td>
						<label class="icon"><img src="${staticRoot}/img/icon_minus.jpg" alt="빼기" /></label>
					</td>
					<td><fmt:formatNumber value="${magam[0].C}" groupingUsed="true"/></td>
					<td>
						<label class="icon"><img src="${staticRoot}/img/icon_equals.jpg" alt="합계" /></label>
					</td>
					<td><fmt:formatNumber value="${magam[0].B}" groupingUsed="true"/></td>
					<td>
						<label class="icon"><img src="${staticRoot}/img/icon_plus.jpg" alt="더하기" /></label>
					</td>
					<td><fmt:formatNumber value="${magam[0].A}" groupingUsed="true"/></td>
					<td>
						<label class="icon"><img src="${staticRoot}/img/icon_equals.jpg" alt="합계" /></label>
					</td>
					<td><label class="price_color_red"><fmt:formatNumber value="${magam[0].A + magam[0].B}" groupingUsed="true"/></label></td>
				</tr>
			</tbody>
		</table>
		<h1 class="title_con_Type01 margintop_50">
			정산 기초정보
		</h1>
		<table class="cart_list" id="ordr_item_list">
			<caption>정산요약</caption>
			<colgroup>
				<col width="30%">
				<col width="30%">
				<col width="40%">
			</colgroup>
			<tbody>
				<tr>
					<th>은행</th>
					<th>예금주</th>
					<th>계좌번호</th>
				</tr>
				<tr>
					<td>
						<c:out value="${magam[0].BANK}"/>
					</td>
					<td>
						<c:out value="${magam[0].ACNTR}"/>
					</td>
					<td>
						<c:out value="${magam[0].ACNUT_NO}"/>
					</td>
				</tr>
			</tbody>
		</table>
		<div class="signup_agree margintop_10">
			<p class="alarm_txt margintop_5">※판매자 지원 > 설정 화면에서 변경 가능 합니다.</p>
		</div>
	</div>
