<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/layout/include/base.jsp" %>
	<script type="text/javascript">
		function fnClose(){ 
			window.close();
		}
		function fnPrint(){
			const html = document.querySelector('html');
			const printContents = document.querySelector('.pop_set_content').innerHTML;
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
		<div class="pop_set_content">
			<div class="pop_set_substance">
				<form id="frm" name="frm">
				</form>
				<h1 class="title_Type03" style="text-align: center;">
					견  적  서
				</h1>
				<table class="tbl_Type09 margintop_10">
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
							<th>
								견적 의뢰일
							</th>
							<td style="text-align: left; padding-left:10px;" id="t_devy">
								<fmt:formatDate pattern = "yyyy-MM-dd"  value = "${estInfo.REQ_DT}" />
							</td>
						</tr>
						<tr>
							<th>
								대표이사
							</th>
							<td style="text-align: left; padding-left:10px;" id="t_name">
								<c:out value="${pageParm.t_name}"/>
							</td>
							<th>
								견적 담당자
							</th>
							<td style="text-align: left; padding-left:10px;" id="t_idex">
								<c:out value="${estInfo.CHAR_NM}"/>
							</td>
						</tr>
						<tr>
							<th>
								전    화
							</th>
							<td style="text-align: left; padding-left:10px;line-height: 150%;">
								<p>
									(T) <c:out value="${estInfo.TEL_NO}"/>
								</p>
								<p>
									(F) <c:out value="${estInfo.FAX_NO}"/>
								</p>
							</td>
							<th>
								연락처
							</th>
							<td style="text-align: left; padding-left:10px;line-height: 150%;">
								<p>
									(M) <c:out value="${estInfo.MOBILE}"/>
								</p>
								<p>
									(E) <c:out value="${estInfo.CHAR_EMAIL}"/>
								</p>
							</td>
						</tr>
						<tr>
							<th>
								비  고
							</th>
							<td colspan="3" style="text-align: left; padding-left:10px;line-height: 150%;">
								<c:out value="${estInfo.REQ_RMK}"/>
							</td>
						</tr>
					</tbody>
				</table>
				
				
				
				<table class="tbl_Type02 margintop_10">
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
							<th>
								견적 의뢰일
							</th>
							<td style="text-align: left; padding-left:10px;" id="t_devy">
								<fmt:formatDate pattern = "yyyy-MM-dd"  value = "${estInfo.REQ_DT}" />
							</td>
						</tr>
						<tr>
							<th>
								대표이사
							</th>
							<td style="text-align: left; padding-left:10px;" id="t_name">
								<c:out value="${pageParm.t_name}"/>
							</td>
							<th>
								견적 담당자
							</th>
							<td style="text-align: left; padding-left:10px;" id="t_idex">
								<c:out value="${estInfo.CHAR_NM}"/>
							</td>
						</tr>
						<tr>
							<th>
								전    화
							</th>
							<td style="text-align: left; padding-left:10px;line-height: 150%;">
								<p>
									(T) <c:out value="${estInfo.TEL_NO}"/>
								</p>
								<p>
									(F) <c:out value="${estInfo.FAX_NO}"/>
								</p>
							</td>
							<th>
								연락처
							</th>
							<td style="text-align: left; padding-left:10px;line-height: 150%;">
								<p>
									(M) <c:out value="${estInfo.MOBILE}"/>
								</p>
								<p>
									(E) <c:out value="${estInfo.CHAR_EMAIL}"/>
								</p>
							</td>
						</tr>
						<tr>
							<th>
								비  고
							</th>
							<td colspan="3" style="text-align: left; padding-left:10px;line-height: 150%;">
								<c:out value="${estInfo.REQ_RMK}"/>
							</td>
						</tr>
					</tbody>
				</table>
				
				
				
				
				
				
				<table class="tbl_Type05 margintop_10">
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
							<th>
								견적 의뢰일
							</th>
							<td style="text-align: left; padding-left:10px;" id="t_devy">
								<fmt:formatDate pattern = "yyyy-MM-dd"  value = "${estInfo.REQ_DT}" />
							</td>
						</tr>
						<tr>
							<th>
								대표이사
							</th>
							<td style="text-align: left; padding-left:10px;" id="t_name">
								<c:out value="${pageParm.t_name}"/>
							</td>
							<th>
								견적 담당자
							</th>
							<td style="text-align: left; padding-left:10px;" id="t_idex">
								<c:out value="${estInfo.CHAR_NM}"/>
							</td>
						</tr>
						<tr>
							<th>
								전    화
							</th>
							<td style="text-align: left; padding-left:10px;line-height: 150%;">
								<p>
									(T) <c:out value="${estInfo.TEL_NO}"/>
								</p>
								<p>
									(F) <c:out value="${estInfo.FAX_NO}"/>
								</p>
							</td>
							<th>
								연락처
							</th>
							<td style="text-align: left; padding-left:10px;line-height: 150%;">
								<p>
									(M) <c:out value="${estInfo.MOBILE}"/>
								</p>
								<p>
									(E) <c:out value="${estInfo.CHAR_EMAIL}"/>
								</p>
							</td>
						</tr>
						<tr>
							<th>
								비  고
							</th>
							<td colspan="3" style="text-align: left; padding-left:10px;line-height: 150%;">
								<c:out value="${estInfo.REQ_RMK}"/>
							</td>
						</tr>
					</tbody>
				</table>
				
				
				
				
				
				
				
				
				
				
				<table class="tbl_Type07 margintop_10">
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
							<th>
								견적 의뢰일
							</th>
							<td style="text-align: left; padding-left:10px;" id="t_devy">
								<fmt:formatDate pattern = "yyyy-MM-dd"  value = "${estInfo.REQ_DT}" />
							</td>
						</tr>
						<tr>
							<th>
								대표이사
							</th>
							<td style="text-align: left; padding-left:10px;" id="t_name">
								<c:out value="${pageParm.t_name}"/>
							</td>
							<th>
								견적 담당자
							</th>
							<td style="text-align: left; padding-left:10px;" id="t_idex">
								<c:out value="${estInfo.CHAR_NM}"/>
							</td>
						</tr>
						<tr>
							<th>
								전    화
							</th>
							<td style="text-align: left; padding-left:10px;line-height: 150%;">
								<p>
									(T) <c:out value="${estInfo.TEL_NO}"/>
								</p>
								<p>
									(F) <c:out value="${estInfo.FAX_NO}"/>
								</p>
							</td>
							<th>
								연락처
							</th>
							<td style="text-align: left; padding-left:10px;line-height: 150%;">
								<p>
									(M) <c:out value="${estInfo.MOBILE}"/>
								</p>
								<p>
									(E) <c:out value="${estInfo.CHAR_EMAIL}"/>
								</p>
							</td>
						</tr>
						<tr>
							<th>
								비  고
							</th>
							<td colspan="3" style="text-align: left; padding-left:10px;line-height: 150%;">
								<c:out value="${estInfo.REQ_RMK}"/>
							</td>
						</tr>
					</tbody>
				</table>
				
				
				
				
				
				
				
				
				
				
				
				<table class="tbl_Type03 margintop_10">
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
							<th>
								견적 의뢰일
							</th>
							<td style="text-align: left; padding-left:10px;" id="t_devy">
								<fmt:formatDate pattern = "yyyy-MM-dd"  value = "${estInfo.REQ_DT}" />
							</td>
						</tr>
						<tr>
							<th>
								대표이사
							</th>
							<td style="text-align: left; padding-left:10px;" id="t_name">
								<c:out value="${pageParm.t_name}"/>
							</td>
							<th>
								견적 담당자
							</th>
							<td style="text-align: left; padding-left:10px;" id="t_idex">
								<c:out value="${estInfo.CHAR_NM}"/>
							</td>
						</tr>
						<tr>
							<th>
								전    화
							</th>
							<td style="text-align: left; padding-left:10px;line-height: 150%;">
								<p>
									(T) <c:out value="${estInfo.TEL_NO}"/>
								</p>
								<p>
									(F) <c:out value="${estInfo.FAX_NO}"/>
								</p>
							</td>
							<th>
								연락처
							</th>
							<td style="text-align: left; padding-left:10px;line-height: 150%;">
								<p>
									(M) <c:out value="${estInfo.MOBILE}"/>
								</p>
								<p>
									(E) <c:out value="${estInfo.CHAR_EMAIL}"/>
								</p>
							</td>
						</tr>
						<tr>
							<th>
								비  고
							</th>
							<td colspan="3" style="text-align: left; padding-left:10px;line-height: 150%;">
								<c:out value="${estInfo.REQ_RMK}"/>
							</td>
						</tr>
					</tbody>
				</table>
				
				
				
				
				
				<table class="tbl_Type04 margintop_10">
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
							<th>
								견적 의뢰일
							</th>
							<td style="text-align: left; padding-left:10px;" id="t_devy">
								<fmt:formatDate pattern = "yyyy-MM-dd"  value = "${estInfo.REQ_DT}" />
							</td>
						</tr>
						<tr>
							<th>
								대표이사
							</th>
							<td style="text-align: left; padding-left:10px;" id="t_name">
								<c:out value="${pageParm.t_name}"/>
							</td>
							<th>
								견적 담당자
							</th>
							<td style="text-align: left; padding-left:10px;" id="t_idex">
								<c:out value="${estInfo.CHAR_NM}"/>
							</td>
						</tr>
						<tr>
							<th>
								전    화
							</th>
							<td style="text-align: left; padding-left:10px;line-height: 150%;">
								<p>
									(T) <c:out value="${estInfo.TEL_NO}"/>
								</p>
								<p>
									(F) <c:out value="${estInfo.FAX_NO}"/>
								</p>
							</td>
							<th>
								연락처
							</th>
							<td style="text-align: left; padding-left:10px;line-height: 150%;">
								<p>
									(M) <c:out value="${estInfo.MOBILE}"/>
								</p>
								<p>
									(E) <c:out value="${estInfo.CHAR_EMAIL}"/>
								</p>
							</td>
						</tr>
						<tr>
							<th>
								비  고
							</th>
							<td colspan="3" style="text-align: left; padding-left:10px;line-height: 150%;">
								<c:out value="${estInfo.REQ_RMK}"/>
							</td>
						</tr>
					</tbody>
				</table>
				
				
				
				<table class="tbl_Type01 margintop_10">
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
							<th>
								견적 의뢰일
							</th>
							<td style="text-align: left; padding-left:10px;" id="t_devy">
								<fmt:formatDate pattern = "yyyy-MM-dd"  value = "${estInfo.REQ_DT}" />
							</td>
						</tr>
						<tr>
							<th>
								대표이사
							</th>
							<td style="text-align: left; padding-left:10px;" id="t_name">
								<c:out value="${pageParm.t_name}"/>
							</td>
							<th>
								견적 담당자
							</th>
							<td style="text-align: left; padding-left:10px;" id="t_idex">
								<c:out value="${estInfo.CHAR_NM}"/>
							</td>
						</tr>
						<tr>
							<th>
								전    화
							</th>
							<td style="text-align: left; padding-left:10px;line-height: 150%;">
								<p>
									(T) <c:out value="${estInfo.TEL_NO}"/>
								</p>
								<p>
									(F) <c:out value="${estInfo.FAX_NO}"/>
								</p>
							</td>
							<th>
								연락처
							</th>
							<td style="text-align: left; padding-left:10px;line-height: 150%;">
								<p>
									(M) <c:out value="${estInfo.MOBILE}"/>
								</p>
								<p>
									(E) <c:out value="${estInfo.CHAR_EMAIL}"/>
								</p>
							</td>
						</tr>
						<tr>
							<th>
								비  고
							</th>
							<td colspan="3" style="text-align: left; padding-left:10px;line-height: 150%;">
								<c:out value="${estInfo.REQ_RMK}"/>
							</td>
						</tr>
					</tbody>
				</table>
				
				
				<table class="tbl_Type06 margintop_10">
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
							<th>
								견적 의뢰일
							</th>
							<td style="text-align: left; padding-left:10px;" id="t_devy">
								<fmt:formatDate pattern = "yyyy-MM-dd"  value = "${estInfo.REQ_DT}" />
							</td>
						</tr>
						<tr>
							<th>
								대표이사
							</th>
							<td style="text-align: left; padding-left:10px;" id="t_name">
								<c:out value="${pageParm.t_name}"/>
							</td>
							<th>
								견적 담당자
							</th>
							<td style="text-align: left; padding-left:10px;" id="t_idex">
								<c:out value="${estInfo.CHAR_NM}"/>
							</td>
						</tr>
						<tr>
							<th>
								전    화
							</th>
							<td style="text-align: left; padding-left:10px;line-height: 150%;">
								<p>
									(T) <c:out value="${estInfo.TEL_NO}"/>
								</p>
								<p>
									(F) <c:out value="${estInfo.FAX_NO}"/>
								</p>
							</td>
							<th>
								연락처
							</th>
							<td style="text-align: left; padding-left:10px;line-height: 150%;">
								<p>
									(M) <c:out value="${estInfo.MOBILE}"/>
								</p>
								<p>
									(E) <c:out value="${estInfo.CHAR_EMAIL}"/>
								</p>
							</td>
						</tr>
						<tr>
							<th>
								비  고
							</th>
							<td colspan="3" style="text-align: left; padding-left:10px;line-height: 150%;">
								<c:out value="${estInfo.REQ_RMK}"/>
							</td>
						</tr>
					</tbody>
				</table>
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				<h1 class="title_con_Type03 margintop_10">
					견적의뢰 내역
				</h1>
				<c:set var="row" 	value="0" />	
				<table id="traceTable" class="tbl_Type06 margintop_10">
					<caption>정보입력</caption>
					<colgroup>
						<col width="10%">
						<col width="28%">
						<col width="28%">
						<col width="14%">
						<col width="20%">
					</colgroup>
					<tbody>
					<tr>
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
							비고
						</th>
					</tr>
					<c:forEach items="${estPrdt}" var="est" varStatus="status">
						<tr>
							<td>
								<c:out value="${status.count}"/>
							</td>
							<td style="text-align: left;line-height: 200%;">
								<p>
									[<c:out value="${est.MAKR_NM}"/>] <c:out value="${est.PRDT_NM}"/>
								</p>
							</td>
							<td style="text-align: left;line-height: 200%;">
								<p>
									<c:out value="${est.STNDRD}"/>
								</p>
							</td>
							<td>
								<c:out value="${est.QY}"/> <c:out value="${est.UNIT}"/>
							</td>
							<td>
								<c:out value="${est.RMK}"/>
							</td>
						</tr>
					</c:forEach>
					<c:set var="row" 	value="${fn:length(estPrdt)+1}" />	
					<c:choose>
						<c:when test="${fn:length(estPrdt) lt 10}">
							<c:forEach begin="${row}" end="10" varStatus="status">
								<tr>
									<td>
										<c:out value="${status.index}"/>
									</td>
														
									<c:choose>
										<c:when test="${status.first}">
											<td colspan="4" style="text-align:center;">
												- 이 하 여 백 -
											</td>
										</c:when>
										<c:otherwise>	
											<td style="text-align: left;line-height: 200%;">
											</td>
											<td style="text-align: left;line-height: 200%;">
											</td>
											<td>
											</td>
											<td> 
											</td>
										</c:otherwise>
									</c:choose>
								</tr>
							</c:forEach>
						</c:when>
					</c:choose>
					
					</tbody>
				</table>
			</div>
		</div>
		<div class="btn_group margintop_10">
			<span class="form_btn_Type_green" onclick="fnPrint();">출  력</span>
			<span class="form_btn_Type_blue" onclick="fnClose();">닫  기</span>
		</div>

