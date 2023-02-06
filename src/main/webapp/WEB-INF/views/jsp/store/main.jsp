<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/layout/include/base.jsp" %>
 	<script>
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
										미확인 주문건
									</td>
									<td>  
										<span class="a1"><c:out value="${dashBoard.ordrCnt.OR_1}"/> 건</span>
									</td>
									<td> 
										<span class="a2">지연 <c:out value="${dashBoard.ordrCnt.OR_O_1}"/> 건</span>
									</td>
								</tr>
								<tr>
									<td style="text-align: left;"> 
										송장등록 대기
									</td>
									<td>  
										<span class="a1"><c:out value="${dashBoard.ordrCnt.OR_2}"/>  건</span>
									</td>
									<td> 
										<span class="a2">지연 <c:out value="${dashBoard.ordrCnt.OR_O_2}"/> 건</span>
									</td>
								</tr>
								<tr>
									<td style="text-align: left;"> 
										배송중
									</td>
									<td colspan="2">  
										<span class="a1"><c:out value="${dashBoard.ordrCnt.OR_3}"/> 건</span>
									</td> 
								</tr>
								<tr>
									<td style="text-align: left;"> 
										배송완료
									</td>
									<td colspan="2">  
										<span class="a1"><c:out value="${dashBoard.ordrCnt.OR_4}"/> 건</span>
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
											환불 / 교환 현황
										</h1>
										<span>
											최근 일주일 기준
										</span>
									</th>
								</tr>
								<tr>
									<td style="text-align: left;"> 
										취소요청
									</td>
									<td colspan="2">  
										<span class="a1">0 건</span>
									</td> 
								</tr>
								<tr>
									<td style="text-align: left;"> 
										환불요청
									</td>
									<td colspan="2">  
										<span class="a1">0 건</span>
									</td> 
								</tr>
								<tr>
									<td style="text-align: left;"> 
										교환요청
									</td>
									<td>  
										<span class="a1">0 건</span>
									</td>
									<td> 
										<span class="a2">지연 0건</span>
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
											상품등록 현황
										</h1>
										<span>
											최근 일주일 기준
										</span>
									</th>
								</tr>
								<tr>
									<td style="text-align: left;"> 
										등록 요청
									</td>
									<td colspan="2">  
										<span class="a1"><c:out value="${dashBoard.ordrCnt.UP}"/> 건</span>
									</td> 
								</tr>
								<tr>
									<td style="text-align: left;"> 
										승인 건수
									</td>
									<td colspan="2">  
										<span class="a1"><c:out value="${dashBoard.ordrCnt.CON_1}"/> 건</span>
									</td> 
								</tr>
								<tr>
									<td style="text-align: left;"> 
										반려 건수
									</td>
									<td colspan="2">  
										<span class="a1"><c:out value="${dashBoard.ordrCnt.REJ_1}"/> 건</span>
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