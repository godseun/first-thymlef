<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@include file="/WEB-INF/views/common/layout/include/base.jsp" %>
		<script type="text/javascript">

			$(function () {
				var d = new Date();
				var printDT = '출력일 : ' + d.getFullYear() + '-' + (d.getMonth() < 11 ? '0' : '') + (d.getMonth() + 1) + '-' + (d.getDate() < 10 ? '0' : '') + d.getDate() + ' '
					+ d.getHours() + ':' + (d.getMinutes() < 10 ? '0' : '') + d.getMinutes() + ':' + (d.getSeconds() < 10 ? '0' : '') + d.getSeconds();
				$('#printDT').text(printDT);
			});
			function fnClose() {
				window.close();
			}
			function fnPrint() {
				const html = document.querySelector('html');
				const printContents = document.querySelector('.print_content').innerHTML;
				const printDiv = document.createElement('DIV');
				printDiv.className = 'print-div'

				html.appendChild(printDiv);
				printDiv.innerHTML = printContents;
				document.body.style.display = 'none';
				window.print();
				document.body.style.display = 'block';
				printDiv.style.display = 'none';
			}
		</script>
		<!-- 팝업창 시작 -->
		<h1 class="blue_title">
			대화견적서
			<span class="close" onclick="fnClose();">
			</span>
		</h1>
		<div style="width: 98%;margin: auto;" class="print_content">
			<div style="width:100%;margin-top:10px;font-size:11px;">
				<span style="width: 50%;" id="printDT">
				</span>
				<span style="width: 50%;float:right;text-align: right;">
					견적서 번호 : ST-EST-
					<c:out value="${estInfo.EST_ID}" />
				</span>
			</div>
			<h1 style="text-align: center;color: #3f51b5;font-size: 22px;margin:20px 0;">
				견&nbsp;&nbsp;적&nbsp;&nbsp;서
			</h1>
			<form id="frm" name="frm">
			</form>
			<table class="tbl_Type15 margintop_10">
				<caption>견적서</caption>
				<colgroup>
					<col width="9%">
					<col width="16%">
					<col width="9%">
					<col width="16%">

					<col width="9%">
					<col width="16%">
					<col width="9%">
					<col width="16%">
				</colgroup>
				<tbody>
					<tr>
						<td colspan="4" style="text-align:center; font-size:15px;width: 50%;">
							<c:out value="${estInfo.CMP_NM}" />&nbsp;&nbsp;귀중
						</td>
						<td colspan="4" style="text-align:center; font-size:15px;width: 50%;line-height:120%;">
							대화공업
							<p style="text-align:center; font-size:12px;width: 100%;">
								대화공업
							</p>
						</td>
					</tr>
					<tr style="height:22px;">
						<td style="text-align: center;">
							견적일자
						</td>
						<td colspan="3" style="text-align: center;">
							<fmt:formatDate pattern="yyyy년 MM월 dd일" value="${estInfo.CONF_DT}" />
						</td>
						<td style="text-align: center;">
							사업자번호
						</td>
						<td colspan="3" style="text-align: center;">
							199-87-00674
						</td>
					</tr>

					<tr style="height:22px;">
						<td style="text-align: center;">
							유효기간
						</td>
						<td style="text-align: left; padding-left:10px;">
							견적 후 7일
						</td>
						<td style="text-align: center;">
							TEL
						</td>
						<td style="text-align: left; padding-left:10px;">
							<c:out value="${estInfo.MOBILE}" />
						</td>
						<td style="text-align: center;">
							업&nbsp;&nbsp;&nbsp;&nbsp;태
						</td>
						<td colspan="3" style="text-align: center;">
							도매 및 소매업, 소매
						</td>
					</tr>
					<tr style="height:22px;">
						<td style="text-align: center;">
							담&nbsp;당&nbsp;자
						</td>
						<td style="text-align: left; padding-left:10px;">
							<c:out value="${estInfo.CHAR_NM}" />&nbsp;&nbsp;귀하
						</td>
						<td style="text-align: center;">
							EMAIL
						</td>
						<td style="text-align: left; padding-left:10px;">
							<c:out value="${estInfo.CHAR_EMAIL}" />
						</td>
						<td style="text-align: center;">
							종&nbsp;&nbsp;&nbsp;&nbsp;목
						</td>
						<td colspan="3" style="text-align: center;">
							상품종합 중개업, 전자상거래
						</td>
					</tr>
					<tr style="height:22px;">
						<td colspan="4" style="text-align: left; padding-left:10px;">
							아래와 같이 견적 합니다.(&nbsp;견적 담당&nbsp;:&nbsp;
							<c:out value="${estInfo.USR_NM}" />&nbsp;)
						</td>
						<td style="text-align: center;">
							전화번호
						</td>
						<td style="text-align: center;">
							1833-8917
						</td>
						<td style="text-align: center;">
							팩&nbsp;&nbsp;&nbsp;&nbsp;스
						</td>
						<td style="text-align: center;">
							051-714-3384
						</td>
					</tr>
				</tbody>
			</table>
			<c:set var="row" value="0" />
			<table class="tbl_Type12 margintop_10">
				<caption>정보입력</caption>
				<colgroup>
					<col width="5%">
					<col width="*">
					<col width="7%">
					<col width="7%">
					<col width="10%">
					<col width="12%">
					<col width="7%">
					<col width="18%">
				</colgroup>
				<tbody>
					<tr style="height:25px;">
						<th>
							번호
						</th>
						<th>
							품명 및 규격
						</th>
						<th>
							판매단위
						</th>
						<th>
							수량
						</th>
						<th>
							단가
						</th>
						<th>
							금액
						</th>
						<th>
							납기
						</th>
						<th>
							비고
						</th>
					</tr>
					<c:forEach items="${estPrdt}" var="est" varStatus="status">
						<tr>
							<td style="text-align: center;">
								<c:out value="${status.count}" />
							</td>
							<td style="text-align: left;padding-left:10px;line-height: 150%;">
								<p>
									[
									<c:out value="${est.MAKR_NM}" />]&nbsp;
									<c:out value="${est.PRDT_NM}" /><br />
									<c:out value="${est.STNDRD}" />&nbsp;(
									<c:out value="${est.PRDT_DTL_CD}" />)
								</p>
							</td>
							<td style="text-align: center;">
								<c:out value="${est.OUT_AMT}" />
								<c:out value="${est.OUT_UNIT}" />
							</td>
							<td style="text-align: center;">
								<fmt:formatNumber value="${est.QY}" groupingUsed="true" />
							</td>
							<td style="text-align:right;padding-right:5px;">
								<fmt:formatNumber value="${est.PRICE_9}" groupingUsed="true" />&nbsp;원
							</td>
							<td style="text-align:right;padding-right:5px;">
								<fmt:formatNumber value="${est.TOT_PRICE_9}" groupingUsed="true" />&nbsp;원
							</td>
							<td style="text-align:right;padding-right:5px;">
								<c:out value="${est.PERIOD}" />일
							</td>
							<td style="text-align: left; padding-left:5px;">
								<c:out value="${est.REC_RMK}" />
							</td>
						</tr>
					</c:forEach>
					<c:if test="${estInfo.D_FEE ne '0'}">
						<tr style="height:25px;">
							<td colspan="2" style="text-align: center;">
								운임
							</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td style="text-align:right;padding-right:10px;">
								<fmt:formatNumber value="${estInfo.D_FEE}" groupingUsed="true" />&nbsp;원
							</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
						</tr>
					</c:if>
					<tr style="height:25px;">
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
					</tr>
					<tr style="height:40px;">
						<th colspan="2" style="text-align: center;">
							견적금액
						</th>
						<th colspan="5" style="text-align: right;padding-right:10px;">
							<fmt:formatNumber value="${estInfo.TOT_P}" groupingUsed="true" />&nbsp;원
						</th>
						<th style="text-align: left; padding-left:10px;">
						</th>
					</tr>
					<tr style="height:40px;">
						<th colspan="2" style="text-align: center;">
							VAT
						</th>
						<th colspan="5" style="text-align: right;padding-right:10px;">
							<fmt:formatNumber value="${estInfo.TAX_P}" groupingUsed="true" />&nbsp;원
						</th>
						<th style="text-align: left; padding-left:10px;">
						</th>
					</tr>

					<c:if test="${estInfo.DISC gt '0'}">
						<tr style="height:40px;">
							<th colspan="2" style="text-align: center;">
								합계금액
							</th>
							<th colspan="5" style="text-align: right;padding-right:10px;">
								<fmt:formatNumber value="${estInfo.SUM_P}" groupingUsed="true" />&nbsp;원
							</th>
							<th style="text-align: center;">
								VAT 포함
							</th>
						</tr>
						<tr style="height:40px;border: 2px solid #b71c1c;">
							<th colspan="2" style="text-align: center;">
								할인
							</th>
							<th colspan="5" style="text-align: right;padding-right:10px;">
								추가&nbsp;&nbsp;
								<fmt:formatNumber value="${estInfo.DISC}" groupingUsed="true" />&nbsp;% DC
							</th>
							<th style="text-align: center;">
								현금결제 기준
							</th>
						</tr>
					</c:if>

					<tr style="height:40px;">
						<th colspan="2" style="text-align: center;">
							최종금액
						</th>
						<th colspan="5" style="text-align: right;padding-right:10px;">
							<fmt:formatNumber value="${estInfo.EST_P}" groupingUsed="true" />&nbsp;원
						</th>
						<th style="text-align: center;">
							VAT 포함
						</th>
					</tr>
					<tr style="height:40px;">
						<td style="text-align: center;">
							[기타]
						</td>
						<td colspan="7" style="text-align: left; padding-left:10px;line-height:150%;">
							1. 100,000원 이상 주문시 배송비 무료입니다.<br />
							2. 수입품의 경우 입고예정일은 수입일정에 따라 변동될 수 있으니 참고바랍니다.<br />
							3. 홈페이지 내 제품 이미지 및 규격 확인 후 주문진행 바랍니다.
							<c:if test="${! empty estInfo.REC_RMK}">
								<br />※
								<c:out value="${estInfo.REC_RMK}" />
							</c:if>
							<br /><br />대화공업
						</td>
					</tr>
					<tr style="height:40px;">
						<td style="text-align: center;">
							[주의]
						</td>
						<td colspan="7" style="text-align: left; padding-left:10px;line-height:150%;">
							1. 견적유효기간내 제조사 사정, 환율변동 등으로 가격 변동이 있을 수 있음.<br />
							2. 견적서와 상이한 수량 또는 제품 주문 시 가격 변동될 수 있음.
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="btn_group margintop_10">
			<span class="form_btn_Type_green" onclick="fnPrint();">출 력</span>
			<span class="form_btn_Type_blue" onclick="fnClose();">닫 기</span>
		</div>