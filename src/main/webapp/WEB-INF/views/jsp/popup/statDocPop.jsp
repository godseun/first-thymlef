<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@include file="/WEB-INF/views/common/layout/include/base.jsp" %>
		<script type="text/javascript">
			$(function () {
				var d = new Date();
				var printD = '' + d.getFullYear() + '-' + (d.getMonth() + 1 < 10 ? '0' : '') + (d.getMonth() + 1) + '-' + (d.getDate() < 10 ? '0' : '') + d.getDate();
				var printD2 = '' + d.getFullYear() + '년 ' + (d.getMonth() + 1 < 10 ? '0' : '') + (d.getMonth() + 1) + '월 ' + (d.getDate() < 10 ? '0' : '') + d.getDate() + '일';
				var printT = '' + d.getHours() + ':' + (d.getMinutes() < 10 ? '0' : '') + d.getMinutes() + ':' + (d.getSeconds() < 10 ? '0' : '') + d.getSeconds();
				$('#printDT').text('출력일 : ' + printD + ' ' + printT);
				$('#devyD').text(printD2);
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
			출고품목 리스트
			<span class="close" onclick="fnClose();">
			</span>
		</h1>
		<div style="width: 98%;margin: auto;" class="print_content">
			<div style="width:100%;margin-top:10px;font-size:11px;">
				<span style="width: 50%;">
					주문 번호 :
					<c:out value="${info[0].sMordrId}" />
				</span>
				<span style="width: 50%;float:right;text-align: right;" id="printDT"></span>
			</div>
			<h1 style="text-align: center;color: #3f51b5;font-size: 22px;margin:20px 0;">
				출&nbsp;&nbsp;고&nbsp;&nbsp;품&nbsp;&nbsp;목&nbsp;&nbsp;리&nbsp;&nbsp;스&nbsp;&nbsp;트
			</h1>
			<form id="frm" name="frm">
			</form>
			<table class="tbl_Type15 margintop_10">
				<caption>출고품목 리스트</caption>
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
							<c:out value="${info[0].sMrecvNm}" />&nbsp;&nbsp;귀중
						</td>
						<td colspan="4" style="text-align:center; font-size:15px;width: 50%;">
							<img src="${staticRoot}/img/logo.png" alt="로고" />
						</td>
					</tr>
					<tr style="height:22px;">
						<td style="text-align: center;">
							주문일자
						</td>
						<td colspan="3" style="text-align: center;">
							<fmt:formatDate pattern="yyyy년 MM월 dd일" value="${info[0].sMordrDt}" />
						</td>
						<td colspan="4" rowspan="2" style="text-align:center; font-size:15px;width: 50%;line-height:120%;">
							주식회사 대화
							<p style="text-align:center; font-size:12px;width: 100%;">
								No.1 산업용품 오픈마켓, 대화
							</p>
						</td>
					</tr>
					<tr style="height:22px;">
						<td style="text-align: center;">
							배송일자
						</td>
						<td colspan="3" style="text-align: center;">
							<c:choose>
								<c:when test="${! empty info[0].sDdelyDt}">
									<fmt:formatDate pattern="yyyy년 MM월 dd일" value="${info[0].sDdelyDt}" />
									<span id="devyD" style="display: none;"></span>
								</c:when>
								<c:otherwise>
									<span id="devyD"></span>
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
					<tr style="height:22px;">
						<td style="text-align: center;">
							배송지
						</td>
						<td colspan="3" style="text-align: left; padding-left:10px; line-height:120%;">
							<c:out value="${info[0].sMrecvNm}" />&nbsp;:&nbsp;
							<c:out value="${info[0].sOtel}" />
							<br />
							(
							<c:out value="${info[0].sMZipCode}" />)
							<c:out value="${info[0].sMaddr}" />
							<c:out value="${info[0].sMaddrDtl}" />
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
					<col width="10%">
					<col width="*">
					<col width="10%">
					<col width="10%">
					<!-- 					
					<col width="10%">
 -->
					<col width="10%">
					<col width="10%">
				</colgroup>
				<tbody>
					<tr style="height:25px;">
						<th>
							번호
						</th>
						<th>
							품목코드
						</th>
						<th>
							품목정보
						</th>
						<th>
							출고단위
						</th>
						<th>
							구매수량
						</th>
						<!-- 					
					<th>
						합계금액
					</th>
 -->
						<th>
							배송구분
						</th>
						<th>
							비고
						</th>
					</tr>
					<c:forEach items="${info}" var="odr" varStatus="status">
						<tr>
							<td style="text-align: center;">
								<c:out value="${status.count}" />
							</td>
							<td style="text-align: center;">
								<c:out value="${odr.sDprdtCd}" />
							</td>
							<td style="text-align: left;padding-left:10px;line-height: 150%;">
								<p>
									[
									<c:out value="${odr.sDmakrNm}" />]&nbsp;
									<c:out value="${odr.sDprdtNm}" />&nbsp;/&nbsp;
									<c:out value="${odr.sDstndrd}" />
								</p>
							</td>
							<td style="text-align:right; padding-right:5px;">
								<fmt:formatNumber value="${odr.OUT_AMT}" groupingUsed="true" />
								<c:out value="${odr.OUT_UNIT}" />
							</td>
							<%-- <td style="text-align:right;padding-right:5px;">
								<fmt:formatNumber value="${odr.sDtotPrice}" groupingUsed="true" />&nbsp;원
								</td>
								--%>
								<td style="text-align:right; padding-right:5px;">
									<fmt:formatNumber value="${odr.sDqy}" groupingUsed="true" />
								</td>
								<%-- <td style="text-align:right;padding-right:5px;">
									<fmt:formatNumber value="${odr.sDsumPrice}" groupingUsed="true" />&nbsp;원
									</td>
									--%>
									<td style="text-align: center;">
										<c:if test="${odr.DLVY_TP eq 'C'}">
											별도배송
										</c:if>
									</td>
									<td style="text-align: center;">
										&nbsp;
									</td>
						</tr>
					</c:forEach>
					<%-- <c:if test="${info[0].sMdvFee ne '0'}">
						<tr style="height:25px;">
							<td colspan="2" style="text-align: center;">
								배송비
							</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td style="text-align:right;padding-right:5px;">
								<fmt:formatNumber value="${info[0].sMdvFee}" groupingUsed="true" />&nbsp;원
							</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
						</tr>
						</c:if>
						--%>
						<tr style="height:25px;">
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
						</tr>
						<%-- <tr style="height:40px;">
							<th colspan="2" style="text-align: center;">
								결제 금액
							</th>
							<th colspan="3" style="text-align: right;padding-right:10px;">
								<fmt:formatNumber value="${info[0].sMsPrice}" groupingUsed="true" />&nbsp;원
							</th>
							<th colspan="2" style="text-align: center;">
								VAT 포함
							</th>
							</tr>
							--%>
							<tr style="height:40px;">
								<td style="text-align: center;">
									[안내]
								</td>
								<td colspan="6" style="text-align: left; padding-left:10px;line-height:150%;">
									1. 교환 및 반품은 제품수령 후 7일 이내 언제든지 요청 가능합니다.<br />
									2. 교환/반품 주소 : ( 51336 ) 경남 창원시 마산합포구 합포로 232 물류 사무소 (대화 반품 담당자 앞)<br />
									3. 반품 후 환불은 반품 제품 회수 후 3(영업일)일이내에 카드 승인취소나 온라인 무통장입금등의 방법으로 처리를 해드립니다.<br />
									4. 배송완료 후 구매확정을 하지 않은 경우에는 배송이 완료된 일로부터 7일 경과 후, 8일째 자동으로 구매확정 됩니다.
								</td>
							</tr>
							<tr style="height:40px;">
								<td style="text-align: center;">
									[주의]
								</td>
								<td colspan="6" style="text-align: left; padding-left:10px;line-height:150%;">
									1. 제품의 하자가 없이 단순 고객의 변심으로 환불/교환 할 경우 추가 배송비가 발생 할 수 있습니다.<br />
									2. 주문제작 상품, 포장개봉 상품, 박스훼손 및 구성품 분실의 경우는 고객변심에 의한 반품이 불가 합니다.<br />
									3. 구매확정후 에는 교환 및 반품이 불가 합니다.
								</td>
							</tr>
				</tbody>
			</table>
			<p style="text-align: center;margin-top:10px;">항상 저희 대화을 이용해 주셔서 감사합니다. [No.1 산업용품 오픈마켓 대화]</p>
		</div>
		<div class="btn_group margintop_10">
			<span class="form_btn_Type_green" onclick="fnPrint();">출 력</span>
			<span class="form_btn_Type_blue" onclick="fnClose();">닫 기</span>
		</div>