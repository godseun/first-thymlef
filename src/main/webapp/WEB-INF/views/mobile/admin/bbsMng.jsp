<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<%@ include file="/WEB-INF/views/common/layout/include/base.jsp" %>
	<script type="text/javascript" src="${staticRoot}/sdk/sha/sha.js"></script>
	<script type="text/javascript">
		var dupClick1 = false;
		$(function(){
			
			
		});	 
		function doAction(sAction,tar) { 
			switch(sAction) {  
				case 'ans':           
				case 'hid':           
					if(_BT.isEmptyById('bbsCon'+tar,    '내용을 입력해 주세요.')) return false;
					$('#frm').empty();
					$('#frm').append($('<input/>', {
					    type: 'hidden',
					    id: 'procType',
					    name: 'procType',
					    value : sAction
					}));
					$('#frm').append($('<input/>', {
					    type: 'hidden',
					    id: 'artId',
					    name: 'artId',
					    value : $('#artId'+tar).val()
					}));
					$('#frm').append($('<input/>', {
					    type: 'hidden',
					    id: 'bbsCon',
					    name: 'bbsCon',
					    value : $('#bbsCon'+tar).val()
					}));
					dupClick1 = true; 
					_BT.ajaxCallbackSubmit('frm',  _BT.ADMIN.URL.Common.AddAns, function(data) {
						dupClick1 = false;
						if($(data).size() > 0) { 
							if(_BT.isEquals(data.code, 'success')){
								$('#b_'+tar).hide();
								$('#bbsCon'+tar).attr('readonly','readonly') ;
								alert('내용을 등록 완료 했습니다');	
								return false;
							}else{
								alert(data.msg);	
								return false;
							}
						}
					},
					function(xhr, status, error) {
						dupClick1 = false; 
						$('#ckSmsState').text('처리중 오류가 발생했습니다.\n\n다시 확인 부탁 드립니다.');
						$('#ckSmsState').css('color','#fe0000');	
					});	
					break; 
			}
		}
   </script>
	<div class="wid_1248">
		<div class="notcie_board margintop_30">
			<!--공지사항 제목-->
			<form id="frm" name="frm">
			</form>
			<table class="cart_list">
				<caption>관심상품</caption>
				<colgroup>
					<col width="20%">
					<col width="*">
					<col width="*">
				</colgroup>
				<tbody>
					<tr>
						<th>사진</th>
						<th>문의</th>
						<th>답글</th>
					</tr>
					<c:forEach items="${bbsList}" var="qna" varStatus="status">
						<c:choose>
							<c:when test="${empty qna.ANSWER}">
								<tr>
									<td>
									  <c:choose>
						<c:when test="${fn:indexOf(qna.PRDT_IMG, '//') >=0 }">
						<img src="<c:out value="${qna.PRDT_IMG}"/>" alt="상품사진" class="cart_pic" onerror="this.src='${staticRoot}/img/sample03.jpg'"/> 

		</c:when>
						<c:otherwise>				
						<img src="${upload}<c:out value="${qna.PRDT_IMG}"/>" alt="상품사진" class="cart_pic" onerror="this.src='${staticRoot}/img/sample03.jpg'"/> 
			</c:otherwise>
						</c:choose>		
									</td>
									<td style="text-align: left;">
										${qna.PRDT_NM}[ ${qna.MAKR_NM} ] - ${qna.ORG_PRDT_CD} 
										<div class="notcie_board_date" style="margin: 10px 0 0 0;">
											<c:out value="${qna.TITLE}"/><br/>
											[ <c:out value="${qna.CREATE_DT}"/> ]
										</div>	
										<p style="margin-top: 10px;">
											문의 : ${fn:replace(qna.CONTENT, cn, br)}
										</p>
									</td>
									<td style="text-align: left;">
										<input type="hidden" id="artId${status.count}" name="artId${status.count}" value="<c:out value="${qna.ARTICLE_ID}"/>"/>
										<textarea style="width: 100%;" id="bbsCon${status.count}"  name="bbsCon${status.count}" rows="5" placeholder="내용을 입력 하세요."></textarea>
										<div id="b_${status.count}" style="width: 100%;text-align: right; margin-top: 5px;">
											<span onclick="doAction('ans','${status.count}');"  class="sButton btn_span2 fs-13 blue">등록</span> 
											<span onclick="doAction('hid','${status.count}');" class="sButton btn_span2 fs-13 pink">숨김</span>
										</div>
									</td>
								</tr>					
							</c:when>
							<c:otherwise>
								<tr>
									<td>
<c:choose>
						<c:when test="${fn:indexOf(qna.PRDT_IMG, '//') >=0 }">
						<img src="<c:out value="${qna.PRDT_IMG}"/>" alt="상품사진" class="cart_pic" onerror="this.src='${staticRoot}/img/sample03.jpg'"/> 
</c:when>
						<c:otherwise>
										<img src="${upload}<c:out value="${qna.PRDT_IMG}"/>" alt="상품사진" class="cart_pic" onerror="this.src='${staticRoot}/img/sample03.jpg'"/> 
	</c:otherwise>
						</c:choose>
									</td>
									<td style="text-align: left;">
										${qna.PRDT_NM}[ ${qna.MAKR_NM} ] - ${qna.ORG_PRDT_CD} 
										<div class="notcie_board_date" style="margin: 10px 0 0 0;">
											<c:out value="${qna.TITLE}"/><br/>
											[ <c:out value="${qna.CREATE_DT}"/> ]
										</div>	
										<p style="margin-top: 10px;">
											문의 : ${fn:replace(qna.CONTENT, cn, br)}
										</p>
									</td>
									<td style="text-align: left;">
										<div class="notcie_board_date" style="margin: 10px 0 0 0;">
											<c:out value="${qna.ANSWER_ID}"/><br/>
											[ <c:out value="${qna.ANSWER_DT}"/> ]
										</div>	
										<p style="margin-top: 10px;">
											<c:if test="${qna.USE_YN eq 'N' }"><span style="color:red;">숨김 : </span></c:if>
											<c:if test="${qna.USE_YN eq 'Y' }"><span style="color:black;">답변 : </span></c:if>
											${fn:replace(qna.ANSWER, cn, br)}
										</p>
									</td>
								</tr>
							</c:otherwise>
						</c:choose>	
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>