<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/layout/include/base.jsp" %>
<script type="text/javascript" src="${staticRoot}/js/allCteg.js"></script>
	<script type="text/javascript">
		var dupClick1 = false;
		$(function(){
		});
		
		function initSheet(){
			
		}

	</script>
	<div class="main_content06" style="padding-top: 0px; min-height: 800px; margin-bottom: 20px;">
		<div >
			<form id="sheetFrm" name="sheetFrm">
				<table class="tbl_Type02">
					<caption>조회</caption>
					<colgroup>
						<col width="15%">
						<col width="%">
					</colgroup>
					<tbody>
						<tr>
							<th>
								동영상 조회
							</th>
							<td style="text-align: left;">
								<span class="return_select2">
									<select id="bbsId"  name="bbsId" class="form-control">
										<option value="">전체</option>
										<option value="PRM">제품상세</option>
										<option value="MSB">프로모션</option>
									</select>
								</span>
								<span class="inquiry_btn marginleft_7">
									<span onclick="doAction('save');"  class="sButton btn_span fs-13 pink marginleft_5" style="float: right;">저장</span>
									<span onclick="doAction('search');" class="sButton btn_span fs-13 blue" style="float: right;">조회</span>
								</span>								
							</td>
						</tr>
					</tbody>
				</table>	
			</form>
		</div>
		<div class='margintop_20'>
			<h1 class="title_con_Type02">
				링크 동영상			
			</h1>	
			<table class="tbl_Type03">
				<caption>정보입력</caption>
				<colgroup>
					<col width="15%">
					<col width="20%">
					<col width="*">
					<col width="20%">
				</colgroup>
				<tbody>
					<tr>
						<th>
							<span>
								게시물번호
							</span>
						</th>
						<th>
							<span>
								링크위치
							</span>
						</th>
						<th>
							<span>
								동영상정보
							</span>
						</th>
						<th>
							<span>
								동영상정보
							</span>
						</th>
					</tr>
					<c:forEach items="${mList}" var="m" varStatus="status">
						<tr>
							<td>
								<span>
									<c:out value="${m.sArtCd}"/>
								</span>
							</td>
							<td>
								<span>
									<c:out value="${m.sTitle}"/>
								</span>
							</td>
							<td>
								<iframe src="${m.sUrl}?&autoplay=1&rel=0&amp&controls=0&amp&showinfo=0" frameborder="0" allowfullscreen></iframe>
							</td>
							<td>
								<span>
									${m.sWidth} X ${m.sHeight}
									<c:out value="${m.sUrl}"/>
								</span>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
