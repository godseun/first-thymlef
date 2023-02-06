<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/layout/include/base.jsp" %>
	<script type="text/javascript">
		var dupClick1 = false;
		$(function(){  
		});
	</script>
	<div class="main_content06" style="padding-top: 0px; min-height: 800px; margin-bottom: 20px;">
		<table class="layout_tbl" >
			<caption>대쉬보드</caption>
			<colgroup>
				<col width="33%">
				<col width="33%">
				<col width="33%">
			</colgroup>
			<tbody>
				<tr>
					<th>
						<table class="store_tbl">
							<caption>대쉬보드</caption>
							<colgroup>
								<col width="*%">
								<col width="*%">
								<col width="*%">
							</colgroup>
							<tbody>
								<tr>
									<th colspan="3">
										<h1>
											주문 / 배송 현황
										</h1>
										<span>
											최근 일주일 기준
										</span>
									</th>
								</tr>
								<tr>
									<td style="text-align: left;"> 
										총 주문
									</td>
									<td>  
										<span class="a1"><c:out value="${dashBoard.T_OR}"/> 건</span>
									</td>
									<td> 
										<span class="a1"><c:out value="${dashBoard.T_OR_ITEM}"/> 품목</span>
									</td>
								</tr>
								<tr>
									<td style="text-align: left;"> 
										미확인 주문
									</td>
									<td>  
										<span class="a1"><c:out value="${dashBoard.OR_1}"/> 건</span>
									</td>
									<td> 
										<span class="a2">지연 <c:out value="${dashBoard.OR_O_1}"/> 건</span>
									</td>
								</tr>
								<tr>
									<td style="text-align: left;"> 
										송장등록 대기
									</td>
									<td>  
										<span class="a1"><c:out value="${dashBoard.OR_2}"/> 건</span>
									</td>
									<td> 
										<span class="a2">지연 <c:out value="${dashBoard.OR_O_2}"/> 건</span>
									</td>
								</tr>
								<tr>
									<td style="text-align: left;"> 
										배송중
									</td>
									<td>  
										<span class="a1"><c:out value="${dashBoard.OR_3}"/> 건</span>
									</td> 
									<td> 
										<span class="a2">상태체크 <c:out value="${dashBoard.OR_C_3}"/> 건</span>
									</td>
								</tr>
								<tr>
									<td style="text-align: left;"> 
										배송중
									</td>
									<td>  
										<span class="a1">송장번호 없음</span>
									</td> 
									<td>  
										<span class="a1"><c:out value="${dashBoard.OR_O_3}"/> 건</span>
									</td> 
								</tr>
								<tr>
									<td style="text-align: left;"> 
										배송완료
									</td>
									<td>  
										<span class="a1"><c:out value="${dashBoard.OR_4}"/> 건</span>
									</td> 
									<td> 
										<span class="a1">구매확정 <c:out value="${dashBoard.OR_O_4}"/> 건</span>
									</td>
								</tr>
								<tr style="height: 100%;">
									<td colspan="3"> 
										  &nbsp;
									</td> 
								</tr>
							</tbody>
						</table>
					</th>
					<th>
						<table class="store_tbl">
							<caption>대쉬보드</caption>
							<colgroup>
								<col width="*%">
								<col width="*%">
								<col width="*%">
							</colgroup>
							<tbody>
							<tbody>
								<tr>
									<th colspan="3">
										<h1>
											판매,구매  취소 / 반품 현황
										</h1>
										<span>
											최근 일주일 기준
										</span>
									</th>
								</tr>
								<tr>
									<td style="text-align: left;"> 
										구매취소
									</td>
									<td colspan="2">  
										<span class="a1">0 건</span>
									</td> 
								</tr>
								<tr>
									<td style="text-align: left;"> 
										판매취소
									</td>
									<td>  
										<span class="a1">요청 <c:out value="${dashBoard.OR_2}"/> 건</span>
									</td>
									<td> 
										<span class="a2">완료 <c:out value="${dashBoard.OR_O_2}"/> 건</span>
									</td>
								</tr>
								<tr>
									<td style="text-align: left;"> 
										반품
									</td>
									<td>  
										<span class="a1">요청 <c:out value="${dashBoard.OR_2}"/> 건</span>
									</td>
									<td> 
										<span class="a2">완료 <c:out value="${dashBoard.OR_O_2}"/> 건</span>
									</td>
								</tr>
								<tr>
									<td style="text-align: left;"> 
										반품배송
									</td>
									<td>  
										<span class="a1">배송중 <c:out value="${dashBoard.OR_2}"/> 건</span>
									</td>
									<td> 
										<span class="a2">배송완료 <c:out value="${dashBoard.OR_O_2}"/> 건</span>
									</td>
								</tr>
								<tr style="height: 100%;">
									<td colspan="3"> 
										  &nbsp;
									</td> 
								</tr>
							</tbody>
						</table>
					</th>
					<th>
						<table class="store_tbl">
							<caption>정보입력</caption>
							<colgroup>
								<col width="*%">
								<col width="*%">
								<col width="*%">
							</colgroup>
							<tbody>
							<tbody>
								<tr>
									<th colspan="3">
										<h1>
											상품 현황
										</h1>
										<span>
											전체상품 기준
										</span>
									</th>
								</tr>
								<tr>
									<td style="text-align: left;"> 
										단가변경요청
									</td>
									<td colspan="2">  
										<span class="a1"><c:out value="${dashBoard.OR_2}"/> 건</span>
									</td> 
								</tr>
								<tr>
									<td style="text-align: left;"> 
										일시품절
									</td>
									<td>  
										<span class="a1"><c:out value="${dashBoard.OR_2}"/> 건</span>
									</td>
									<td> 
										<span class="a2">재입고 미정 <c:out value="${dashBoard.OR_O_2}"/> 건</span>
									</td>
								</tr>
								<tr>
									<td style="text-align: left;"> 
										상세정보 등록
									</td>
									<td colspan="2">  
										<span class="a1"><c:out value="${dashBoard.REJ_1}"/> 건</span>
									</td> 
								</tr>
								<tr>
									<td style="text-align: left;"> 
										동영상 등록
									</td>
									<td colspan="2">  
										<span class="a1"><c:out value="${dashBoard.REJ_1}"/> 건</span>
									</td> 
								</tr>
								<tr style="height: 100%;">
									<td colspan="3"> 
										  &nbsp;
									</td> 
								</tr>
							</tbody>
						</table>
					</th>
				</tr>
			</tbody>
		</table>	
	</div>
