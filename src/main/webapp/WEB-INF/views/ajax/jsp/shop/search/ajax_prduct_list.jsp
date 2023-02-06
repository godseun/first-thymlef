<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/layout/include/base.jsp" %>
	<!-- 검색 상세 -->
	
	<c:choose>
		<c:when test="${query.vTp eq 'J'}">
			<c:set var="sSt" 		value="0" />
			<c:set var="sPrice" 	value="0" />
			<data count="${result.count}" endRow="${query.searchViewPaging.endRow}" />
			<article class="search_detail_prduct_data">
				<c:forEach items="${result.resultList}" var="prdt1" varStatus="status">
					<c:choose>
						<c:when test="${prdt1.DTL_CNT gt 1}">
							<c:set var="sSt" 		value="${prdt1.DTL_CNT}개 상품" />
							<c:set var="sPrice" 	value="원 ~" />
						</c:when>
						<c:otherwise>
							<c:set var="sSt" 		value="${prdt1.STNDRD}" />
							<c:set var="sPrice" 	value="원" />
						</c:otherwise>
					</c:choose>	
					<div class="mItem recommend_con_Type02 <c:if test="${status.count%4 ne '0'}"> mg_10</c:if>" data-type="<c:out value="${prdt1.PRDT_CD}"/>">
						<div class="recommend_con_img01" align="center" style="overflow: hidden;">
							<a href="#" class="img">
								<img src="${upload}<c:out value="${prdt1.PRDT_IMG}"/>" alt="상품사진" style="width:auto;height:156px;" onerror="this.src='${staticRoot}/img/sample03.jpg'"/> 
							</a>
						</div>
						<div class="recommend_con_txt01">
							<h2 class="title01">
								<span><c:out value="${prdt1.PRDT_NM}"/></span>
							</h2>
							<label class="txt01">
								<span style="height: 22px;overflow:hidden;">
									<c:out value="${sSt}"/>&nbsp;
								</span>
							</label>
							<label class="maker">
								<span><c:out value="${prdt1.MAKR_NM}"/></span>
							</label>
							<span class="price01">
								<span>
									<c:choose>
										<c:when test="${prdt1.SALE_PRICE eq 0 or empty prdt1.SALE_PRICE}">
											<fmt:formatNumber value="${prdt1.SEL_PRICE}" groupingUsed="true"/>
										</c:when>
										<c:otherwise>
											<fmt:formatNumber value="${prdt1.SALE_PRICE}" groupingUsed="true"/>
										</c:otherwise>
									</c:choose>	
									${sPrice}
								</span>
							</span>
						</div>
					</div>
				</c:forEach>
			</article>
		</c:when>
		<c:otherwise>
			<data count="${result.count}" endRow="${query.searchViewPaging.endRow}" />
			<article class="search_detail_prduct_data">
				<c:forEach items="${result.resultList}" var="prdt2" varStatus="status">
					<div class="mItem recommend_con_Type02 <c:if test="${status.count%4 ne '0'}"> mg_10</c:if>" data-type="<c:out value="${prdt2.PRDT_CD}"/>">
						<div class="recommend_con_img01" align="center" style="overflow: hidden;">
							<a href="#" class="img">
								<img src="${upload}<c:out value="${prdt2.PRDT_IMG}"/>" alt="상품사진" style="width:auto;height:156px;" onerror="this.src='${staticRoot}/img/sample03.jpg'"/> 
							</a>
						</div>
						<div class="recommend_con_txt01">
							<h2 class="title01">
								<span><c:out value="${prdt2.PRDT_NM}"/></span>
							</h2>
							<label class="txt01">
								<span style="height: 22px;overflow:hidden;">
									<c:out value="${prdt2.STNDRD}"/>&nbsp;
								</span>
							</label>
							<label class="maker">
								<span><c:out value="${prdt2.MAKR_NM}"/></span>
							</label>
							<span class="price01">
								<span>
									<fmt:formatNumber value="${prdt2.SEL_PRICE}" groupingUsed="true"/>원
								</span>
							</span>
						</div>
					</div>
				</c:forEach>
			</article>
		</c:otherwise>
	</c:choose>
	