<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/layout/include/base.jsp" %>
	<script src="http://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
	<script type="text/javascript">
		var dupClick1 = false;
		$(function(){
		}); 
		function fnClose(){
			window.close();
		}
	</script>
	<!-- 팝업창 시작 -->
		<h1 class="blue_title">
			상품정보
			<span class="close" onclick="fnClose();">
			</span>
		</h1>
		<div style="width: 1000px; margin-left: 20px; margin-top: 10px;">
			<div class="prdc_top_wrap" style="width: 1000px;">
				<div class="prdc_info_column01 main">
					<div class="prdc_img" id="show" align="center" style="">
<c:choose>
						<c:when test="${fn:indexOf(prdtInfo[0].PRDT_IMG, '//') >=0 }">
						<img src="<c:out value="${prdtInfo[0].PRDT_IMG}"/>" alt="상품사진" id="show_pic" class="show_pic" onerror="this.src='${staticRoot}/img/sample03.jpg'"/> 
</c:when>
						<c:otherwise>
						<img src="${upload}/600<c:out value="${prdtInfo[0].PRDT_IMG}"/>" alt="상품사진" id="show_pic" class="show_pic" onerror="this.src='${staticRoot}/img/sample03.jpg'"/> 
	</c:otherwise>
						</c:choose>
					</div>
				</div>
				<div class="prdc_info_column02">
					<div class="wid_1248" id="zoom">
<c:choose>
						<c:when test="${fn:indexOf(prdtInfo[0].PRDT_IMG, '//') >=0 }">
							<img src="<c:out value="${prdtInfo[0].PRDT_IMG}"/>"/>
</c:when>
						<c:otherwise>
					<img src="${upload}<c:out value="${prdtInfo[0].PRDT_IMG}"/>"/>
</c:otherwise>
						</c:choose>
					</div>
					<div class="prdc_title_con">
						<h2 class="prdc_title02">
							<c:out value="${prdtInfo[0].PRDT_NM}"/>
						</h2>
					</div>
					<div class="prdc_explain_con">
						<ul>
							<c:if test="${prdtInfo[0].PRDT_TP eq 'S'}">
								<li>
									판매 상점 : ( <c:out value="${prdtInfo[0].S_NM}"/> )
									<span class="show_seller">
										<label class="payment_Type01 goDetail" data-value="${prdtInfo[0].STORE_ID}">업체상품 더보기</label>
									</span>
								</li>
							</c:if>
							<li style="font-size: 15px; font-weight: 500;">
								상품 코드 : <span style="color:#b71c1c"><c:out value="${prdtInfo[0].PRDT_CD}"/></span> 
							</li>
							<li>
								브랜드 : <c:out value="${prdtInfo[0].MAKR_NM}"/>
							</li>
							<c:if test="${!empty prdtInfo[0].ORG_CMP_CD}">
								<li>
									원산지  : <c:out value="${prdtInfo[0].ORG_CMP_NM}"/> 
								</li>
							</c:if>
							<c:if test="${! empty prdtInfo[0].EXT_INFO_TIT_1}">
								<li>
									<c:out value="${prdtInfo[0].EXT_INFO_TIT_1}"/>  : 
									<c:out value="${prdtInfo[0].EXT_INFO_VAL_1}"/>
								</li>
							</c:if>
							<c:if test="${! empty prdtInfo[0].EXT_INFO_TIT_2}">
								<li>
									<c:out value="${prdtInfo[0].EXT_INFO_TIT_2}"/> : 
									<c:out value="${prdtInfo[0].EXT_INFO_VAL_2}"/>
								</li>
							</c:if>
							<c:if test="${! empty prdtInfo[0].EXT_INFO_TIT_3}">
								<li>
									<c:out value="${prdtInfo[0].EXT_INFO_TIT_3}"/> : 
									<c:out value="${prdtInfo[0].EXT_INFO_VAL_3}"/>
								</li>
							</c:if>
							<c:if test="${! empty prdtInfo[0].EXT_INFO_TIT_4}">
								<li>
									<c:out value="${prdtInfo[0].EXT_INFO_TIT_4}"/> : 
									<c:out value="${prdtInfo[0].EXT_INFO_VAL_4}"/>
								</li>
							</c:if>
							<c:if test="${! empty prdtInfo[0].EXT_INFO_TIT_5}">
								<li>
									<c:out value="${prdtInfo[0].EXT_INFO_TIT_5}"/> : 
									<c:out value="${prdtInfo[0].EXT_INFO_VAL_5}"/>
								</li>
							</c:if>
							<c:if test="${! empty prdtInfo[0].EXT_INFO_TIT_6}">
								<li>
									<c:out value="${prdtInfo[0].EXT_INFO_TIT_6}"/> : 
									<c:out value="${prdtInfo[0].EXT_INFO_VAL_6}"/>
								</li>
							</c:if>
							<c:set var="dlvyFeeTxt" 	value="묶음배송 가능" />	
							<c:set var="dlvyTxt" 		value="택배" />	
							<c:set var="dlvyTpTxt" 	value="대화배송" />	
							<c:if test="${prdtInfo[0].STORE_ID ne '40000001'}"> 
								<c:set var="dlvyTpTxt" 			value="업체배송" />	
							</c:if>
							
							<c:if test="${prdtInfo[0].DLVY_TP eq 'H'}"> 
								<c:set var="dlvyTxt" 			value="화물택배" />	
							</c:if>
							<c:if test="${prdtInfo[0].DLVY_MEG ne '1'}"> 
								<c:set var="dlvyFeeTxt" 		value="개별배송 상품" />	
							</c:if>
							
							<li>
								<span style="display: inline-block;width: 50px;" >배송 : </span>
								<span style="display: inline-block;width: 82%;" >
									<p>
										${dlvyTpTxt} [ ${dlvyTxt} / <fmt:formatNumber value="${prdtInfo[0].DLVY_FEE}" groupingUsed="true"/>원 ]  
									</p>
									<p style="margin-top: 10px;">
										${dlvyFeeTxt}
										<c:if test="${prdtInfo[0].FREE_DLVY eq '1'}"> 
											/ <span style="color:#b71c1c"> [<fmt:formatNumber value="${prdtInfo[0].FREE_AMT}" groupingUsed="true"/>원 이상 무료배송]</span>
										</c:if>
									</p>
									<p style="margin-top: 10px;">
										<c:if test="${prdtInfo[0].EXTRA_FEE_TP eq '1'}"> 
											도서산간지역 배송비 추가 
										</c:if>
									</p>
								</span>
							</li>
							<li>
						</ul>
					</div>
				</div>
			</div>
		</div>

