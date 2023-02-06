<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/layout/include/base.jsp" %>
	<script type="text/javascript">
	function fnClose(){ 
		window.close();
	}
	</script>
	<!-- 팝업창 시작 -->
		<h1 class="blue_title">
			배송정보
			<span class="close" onclick="fnClose();">
			</span>
		</h1>
		<div class="pop_set_content">
			<div class="pop_set_substance">
				<h1 class="title_con_Type03">
					주문정보
				</h1>
				<c:choose>
					<c:when test="${param.t_invoice eq '9' }">
						<c:set var="invoice" 			value="송장번호 확인중" />
					</c:when>
					<c:otherwise>
						<c:set var="invoice" 			value="${pageParm.t_invoice}" />
					</c:otherwise>
				</c:choose>						
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
							<th>
								상품명
							</th>
							<td colspan="3" style="text-align: left; padding-left:10px;" id="t_item">
								<c:out value="${pageParm.t_item}"/>
							</td>
						</tr>
						<tr>
							<th>
								주문번호
							</th>
							<td style="text-align: left; padding-left:10px;" id="t_idex">
								<c:out value="${pageParm.t_idex}"/>
							</td>
							<th>
								배송번호
							</th>
							<td style="text-align: left; padding-left:10px;" id="t_devy">
								<c:out value="${invoice}"/>
							</td>
						</tr>
						<tr>
							<th>
								배송사
							</th>
							<td style="text-align: left; padding-left:10px;" id="t_name">
								<c:out value="${pageParm.t_name}"/>
							</td>
							<th>
								송장번호
							</th>
							<td style="text-align: left;">			
								<label class="signup_txt" id="t_invoice2">
									<c:out value="${invoice}"/>
								</label>
							</td>
						</tr>
					</tbody>
				</table>
				<h1 class="title_con_Type03 margintop_10">
					배송상태
				</h1>
				<table id="traceTable" class="tbl_Type06 margintop_10">
					<caption>정보입력</caption>
					<colgroup>
						<col width="20%">
						<col width="20%">
						<col width="20%">
						<col width="20%">
						<col width="20%">
					</colgroup>
					<tbody>
						<tr>
							<th>상태</th>
							<th>처리일시</th>
							<th>처리점소</th>
							<th>전화번호</th>
							<th>담당자</th>
						</tr>
						<c:choose>
							<c:when test="${param.t_invoice eq '9' }">
								<tr>
									<td colspan="5" height="50px;">송장번호 확인 중 입니다.</td>
								</tr>
							</c:when>
							<c:when test="${fn:length(traceList.trackingDetails) eq 0 }">
								<tr>
									<td colspan="5" height="50px;">수신된 배송정보가 없습니다.</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:set var="len" 			value="${fn:length(traceList.trackingDetails)}" />
								<c:forEach var="i" begin="1" end="${len}" step="1">
									<tr>
										<td><c:out value="${traceList.trackingDetails[len-i].kind}"/></td>
										<td><c:out value="${traceList.trackingDetails[len-i].timeString}"/></td>
										<td><c:out value="${traceList.trackingDetails[len-i].where}"/></td>
										<td><c:out value="${traceList.trackingDetails[len-i].telno2}"/></td>
										<td><c:out value="${traceList.trackingDetails[len-i].manName}"/></td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>							
					</tbody>
				</table>
				<div class="signup_agree margintop_10">
					<label class="signup_txt">본 정보는 스마트택배에서 제공받는 정보입니다. [출처] http://sweettracker.github.io</label> 
				</div>
				<div class="btn_group margintop_10">
					<span class="form_btn_Type_blue" onclick="fnClose();">닫  기</span>
				</div>
			</div>
		</div>

