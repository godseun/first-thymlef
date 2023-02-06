<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/layout/include/base.jsp" %>
	<script type="text/javascript">
		function fnClose(){ 
			window.close();
		}
		function fnPrint(){
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
			견적 의뢰서
			<span class="close" onclick="fnClose();">
			</span>
		</h1>
		
		<div style="width: 98%;margin: auto;" class="print_content">
			<form id="frm" name="frm"></form>
			<h1 style="text-align: center;color: #3f51b5;font-size: 22px;margin:20px 0;">
				견&nbsp;&nbsp;적&nbsp;&nbsp;의&nbsp;&nbsp;뢰&nbsp;&nbsp;서
			</h1>
			<table class="tbl_Type15 margintop_10">
				<caption>정보입력</caption>
				<colgroup>
					<col width="15%">
					<col width="35%">
					<col width="15%">
					<col width="35%">
				</colgroup>
				<tbody>
					<tr >
						<td colspan="2" style="text-align:center; font-size:15px;">
							<c:out value="${estInfo.CMP_NM}"/>
						</td>
						<td style="text-align: center;">
							견적 의뢰일
						</td>
						<td style="text-align: left; padding-left:10px;">
							<fmt:formatDate pattern = "yyyy년 MM월 dd일"  value = "${estInfo.REQ_DT}" />
						</td>
					</tr>
					<tr>
						<td style="text-align: center;">
							대표이사
						</td>
						<td style="text-align: left; padding-left:10px;" id="t_name">
							<c:out value="${estInfo.RPRSNTV_NM}"/>
						</td>
						<td style="text-align: center;">
							견적 담당자
						</td>
						<td style="text-align: left; padding-left:10px;" id="t_idex">
							<c:out value="${estInfo.CHAR_NM}"/>
						</td>
					</tr>
					<tr>
						<td style="text-align: center;">
							전    화
						</td>
						<td style="text-align: left; padding-left:10px;line-height: 150%;">
							<p>
								(T) <c:out value="${estInfo.TEL_NO}"/>
							</p>
							<p>
								(F) <c:out value="${estInfo.FAX_NO}"/>
							</p>
						</td>
						<td style="text-align: center;">
							연락처
						</td>
						<td style="text-align: left; padding-left:10px;line-height: 150%;">
							<p>
								(M) <c:out value="${estInfo.MOBILE}"/>
							</p>
							<p>
								(E) <c:out value="${estInfo.CHAR_EMAIL}"/>
							</p>
						</td>
					</tr>
					<c:if test="${! empty estInfo.BIZCND}">				
						<tr>	
							<td style="text-align: center;">
								업  태
							</td>
							<td style="text-align: left; padding-left:10px;">
								<c:out value="${estInfo.BIZCND}"/>
							</td>
							<td style="text-align: center;">
								종  목
							</td>
							<td style="text-align: left; padding-left:10px;">
								<c:out value="${estInfo.INDUTY}"/>
							</td>
						</tr>
					</c:if>
					<c:if test="${! empty estInfo.ADRESS}">			
						<tr>
							<td style="text-align: center;">
								주  소
							</td>
							<td colspan="3" style="text-align: left; padding-left:10px;">
								<c:out value="${estInfo.ADRESS}"/>
							</td>
						</tr>
					</c:if>
					<tr>
						<td style="text-align: center;">
						비  고
						</td>
						<td colspan="3" style="text-align: left; padding-left:10px;">
							<c:out value="${estInfo.REQ_RMK}"/>
						</td>
					</tr>
				</tbody>
			</table>
				<h1 class="title_con_Type03 margintop_10">
					견적의뢰 내역
				</h1>
				<c:set var="row" 	value="0" />	
				<table class="tbl_Type12 margintop_10">
					<caption>정보입력</caption>
					<colgroup>
						<col width="5%">
						<col width="25%">
						<col width="*%">
						<col width="10%">
						<col width="10%">
						<col width="10%">
						<col width="10%">
					</colgroup>
					<tbody>
					<tr style="height:25px;">
						<th>
							번호
						</th>
						<th>
							품명
						</th>
						<th>
							규격
						</th>
						<th>
							수량
						</th>
						<th>
							단가
						</th>
						<th>
							합계
						</th>
						<th>
							비고
						</th>
					</tr>
					<c:forEach items="${estPrdt}" var="est" varStatus="status">
						<tr>
							<td style="text-align: center;">
								<c:out value="${status.count}"/>
							</td>
							<td style="text-align: left; padding-left:10px;">
								<p>
									[<c:out value="${est.MAKR_NM}"/>] <c:out value="${est.PRDT_NM}"/>
								</p>
							</td>
							<td style="text-align: left; padding-left:10px;">
								<p>
									<c:out value="${est.STNDRD}"/>
								</p>
							</td>
							<td style="text-align: center;">
								<fmt:formatNumber value="${est.QY * est.OUT_AMT}" groupingUsed="true"/> <c:out value="${est.UNIT}"/>
							</td>
							<td>
								&nbsp;
							</td>
							<td>
								&nbsp;
							</td>
							<td style="text-align: left; padding-left:10px;">
								<c:out value="${est.RMK}"/>
							</td>
						</tr>
					</c:forEach>
					<c:set var="row" 	value="${fn:length(estPrdt)+1}" />	
					<c:choose>
						<c:when test="${fn:length(estPrdt) lt 10}">
							<c:forEach begin="${row}" end="10" varStatus="status">
								<tr>
									<td style="text-align: center;">
										<c:out value="${status.index}"/>
									</td>
									<c:choose>
										<c:when test="${status.first}">
											<td colspan="6" style="text-align:center;">
												- 이 하 여 백 -
											</td>
										</c:when>
										<c:otherwise>	
											<td style="text-align: left;line-height: 200%;"></td>
											<td style="text-align: left;line-height: 200%;"></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
										</c:otherwise>
									</c:choose>
								</tr>
							</c:forEach>
						</c:when>
					</c:choose>
						<tr style="height:40px;">
							<th colspan="3" style="text-align: center;">
								견적금액
							</th>
							<th colspan="3" style="text-align:right;padding-right:10px;">
								원	
							</th>
							<th>
								&nbsp;
							</th>
						</tr>
						<tr style="height:40px;">
							<th colspan="3" style="text-align: center;">
								VAT
							</th>
							<th colspan="3" style="text-align:right;padding-right:10px;">
								원	
							</th>
							<th>
								&nbsp;
							</th>
						</tr>
						<tr style="height:40px;">
							<th colspan="3" style="text-align: center;">
								최종금액
							</th>
							<th colspan="3" style="text-align:right;padding-right:10px;">
								원	
							</th>
							<th style="text-align: center;">
								VAT포함
							</th>
						</tr>
						<tr style="height:40px;">
							<th style="text-align: center;padding: 10px 0;">
								기타
							</th>
							<th colspan="6" style="text-left:right;padding-left:10px;">
							</th>
						</tr>
					</tbody>
				</table>
			</div>
		<div class="btn_group margintop_10">
			<span class="form_btn_Type_green" onclick="fnPrint();">출  력</span>
			<span class="form_btn_Type_blue" onclick="fnClose();">닫  기</span>
		</div>

