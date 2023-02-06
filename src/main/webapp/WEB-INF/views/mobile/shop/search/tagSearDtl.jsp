<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/layout/include/base.jsp" %>
	<script type="text/javascript">
		var dupClick1 = false;
		$(function(){ 
			$(".mItem").on("mouseover", function() {
	            $(this).addClass("mOn");
			});
			$(".mItem").on("mouseout", function() {
	            $(this).removeClass("mOn");
			});
			$(".input_style12, .input_style13").on("focus", function() {
				$(this).addClass("mOn");
			});
			$(".input_style12, .input_style13").on("focusout", function() {
				$(this).removeClass("mOn");
			});
			
			$("#tab1").addClass("tabOn");
			$("#dtl_tab1").removeClass("vOff");
			
			$(".recommend_con_Type01, .recommend_con_Type02").on("click", function(){  
				if($(this).data("type") != ''){
					_BT.actFormSubmit("frm", "post", _BT.SHOP.URL.Search.View+"?pCode="+$(this).data("type")); 
				}
			});
		});
	</script>
 	<div style="min-height:600px;">
		<div class="tab_dtl" id="dtl_tab1" data-type="tab1">
			<form id="frm" name="frm">
				<input type="hidden" id="vTp" name="vTp" value="" />			
				<input type="hidden" id="cTp" name="cTp" value="<c:out value="${query.cTp}"/>" />			
				<input type="hidden" id="cCode" name="cCode" value="<c:out value="${query.cCode}"/>" />			
				<input type="hidden" id="pCode" name="pCode" value="<c:out value="${query.pCode}"/>" />			
				<input type="hidden" id="count_J" name="count_J" value="<c:out value="${result.count}"/>" />			
				<input type="hidden" id="count_S" name="count_S" value="<c:out value="${result.count2}"/>" />			
				<input type="hidden" id="itemSize" name=itemSize value="<c:out value="${query.paging.itemSize}"/>" />			
				<input type="hidden" id="currentPage" name="currentPage" value="1" />
				<input type="hidden" id="currentPage_J" name="currentPage_J" value="1" />
				<input type="hidden" id="currentPage_S" name="currentPage_S" value="1" />
				<input type="hidden" id="sub_sValue" name="sub_sValue" value="<c:out value="${query.sub_sValue}"/>" />			
				<input type="hidden" id="sub_pName" name="sub_pName" value="<c:out value="${query.sub_pName}"/>" />			
				<input type="hidden" id="sub_sBrand"	 name="sub_sBrand" value="<c:out value="${query.sub_sBrand}"/>" />			
				<input type="hidden" id="sub_sStndrd" name="sub_sStndrd" value="<c:out value="${query.sub_sStndrd}"/>" />			
				<input type="hidden" id="sub_sModel"	 name="sub_sModel" value="<c:out value="${query.sub_sModel}"/>" />	
				<input type="hidden" id="mValue" name="mValue" value="<c:out value="${query.mValue}"/>"/>
				<input type="hidden" id="mName" name="mName" value="<c:out value="${query.mName}"/>"/>
				<input type="hidden" id="mBrand" name="mBrand" value="<c:out value="${query.mBrand}"/>"/>
				<input type="hidden" id="mStndrd" name="mStndrd" value="<c:out value="${query.mStndrd}"/>"/>
				<input type="hidden" id="mModel" name="mModel" value="<c:out value="${query.mModel}"/>"/>
				<input type="hidden" id="mCode"	 name="mCode" value="<c:out value="${query.mCode}"/>"/>
				<input type="hidden" id="mStore"	 name="mStore" value="<c:out value="${query.mStore}"/>"/>
				<input type="hidden" id="cBrand" name="cBrand" value="<c:out value="${query.cBrand}"/>"/>		
			</form>		 
			<h1 class="prdc_title02" style="margin-top: 30px;">
				<c:choose>
					<c:when test="${pTp eq 'TOOLMAN'}">
						#<c:out value="${query.mValue}"/> BEST PRODUCT
					</c:when>
					<c:when test="${pTp eq 'TIMESALE'}">
						#<c:out value="${query.mValue}"/> BEST PRICE
					</c:when>
					<c:otherwise>
						#<c:out value="${query.mValue}"/>
					</c:otherwise>
				</c:choose>				
			</h1>
			<%//제휴상품 리스트%>
			<c:set var="sSt" 		value="0" />
			<c:set var="sPrice" 	value="0" />
			<div class="recommend_content margintop_30" id="DIV_J">
				<c:choose>
					<c:when test="${pTp eq 'TIMESALE'}">
						<c:set var="LEV1_CD" 	value="0" />
						<c:set var="LEV3_CD" 	value="0" />
						<c:set var="LEV4_CD" 	value="0" />
						<c:set var="LEV5_CD" 	value="0" />
						<c:set var="MAKR_NM" 	value="0" />
						<c:set var="CNT" 		value="1" />
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
							<div class="mItem recommend_con_Type02  mg_10" data-type="<c:out value="${prdt1.PRDT_CD}"/>" style="height:265px">
								<div class="recommend_con_img01" align="center" style="overflow: hidden;">
									<a href="#" class="img">
<c:choose>
						<c:when test="${fn:indexOf(prdt1.PRDT_IMG, '//') >=0 }">
						<img src="<c:out value="${prdt1.PRDT_IMG}"/>" alt="상품사진" style="width:auto;height:156px;" onerror="this.src='${staticRoot}/img/sample03.jpg'"/> 
</c:when>
						<c:otherwise>
										<img src="${upload}<c:out value="${prdt1.PRDT_IMG}"/>" alt="상품사진" style="width:auto;height:156px;" onerror="this.src='${staticRoot}/img/sample03.jpg'"/> 
</c:otherwise>
						</c:choose>

									</a>
								</div>
								<div class="recommend_con_txt01" style="text-align: left;">
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
										<span style="font-weight:bold;font-size: 20px;">
											<c:choose>
												<c:when test="${prdt1.SALE_PRICE eq '0'}">
													판매완료
												</c:when>
												<c:otherwise>
													<fmt:formatNumber value="${prdt1.SALE_PRICE}" groupingUsed="true"/>원
												</c:otherwise>
											</c:choose>	
										</span>
									</span>
									<h2 class="title01" style="margin-top:5px;text-decoration: line-through;color:#b71c1c;">
										<span style="text-align:left;color:#000000;font-size: 15px;height:15px;">
											<fmt:formatNumber value="${prdt1.SEL_PRICE}" groupingUsed="true"/>원
										</span>
									</h2>
								</div>
							</div>
							<c:set var="CNT" 			value="${CNT + 1}" />
						</c:forEach>
					</c:when>
					<c:otherwise> 
						<c:set var="LEV1_CD" 	value="0" />
						<c:set var="LEV3_CD" 	value="0" />
						<c:set var="LEV4_CD" 	value="0" />
						<c:set var="LEV5_CD" 	value="0" />
						<c:set var="MAKR_NM" 	value="0" />
						<c:set var="CNT" 		value="1" />
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
							<c:if test="${LEV1_CD ne  prdt1.LEV1_CD}">
								<c:set var="LEV1_CD" 	value="${prdt1.LEV1_CD}" />
								<h1 class="title_Type03 margintop_30" style="text-align: left;">
									<c:out value="${prdt1.LEV1_NM}"/>
								</h1>
							<c:set var="CNT" 			value="${1}" />
							</c:if>
							<div class="mItem recommend_con_Type02 mg_10" data-type="<c:out value="${prdt1.PRDT_CD}"/>">
								<c:if test="${pTp eq 'TOOLMAN'}">
									<div style="z-index: 100;position: absolute;padding-top: 5px;">
										<img src="${staticRoot}/img/common/best_buy.png" alt="툴맨추천" style="width:80px;; height: auto;"/>
									</div>
								</c:if>
								<div class="recommend_con_img01" align="center" style="overflow: hidden;">
									<a href="#" class="img">
<c:choose>
						<c:when test="${fn:indexOf(prdt1.PRDT_IMG, '//') >=0 }">
							<img src="<c:out value="${prdt1.PRDT_IMG}"/>" alt="상품사진" style="width:auto;height:156px;" onerror="this.src='${staticRoot}/img/sample03.jpg'"/> 
</c:when>
						<c:otherwise>
										<img src="${upload}<c:out value="${prdt1.PRDT_IMG}"/>" alt="상품사진" style="width:auto;height:156px;" onerror="this.src='${staticRoot}/img/sample03.jpg'"/> 
</c:otherwise>
						</c:choose>
									</a>
								</div>
								<div class="recommend_con_txt01" style="text-align: left;">
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
											<fmt:formatNumber value="${prdt1.SEL_PRICE}" groupingUsed="true"/>${sPrice}
										</span>
									</span>
								</div>
							</div>
							<c:set var="CNT" 			value="${CNT + 1}" />
						</c:forEach>
					</c:otherwise>
				</c:choose>			
				<br/>
				<div class="mItem recommend_con_Type02  mg_10" data-type="">
					<div class="recommend_con_img01" align="center" style="overflow: hidden;">
						<a href="#" class="img">
							<img src="${staticRoot}/img/common/newp.png" alt="상품사진" style="width:auto;height:156px;" onerror="this.src='${staticRoot}/img/sample03.jpg'"/> 
						</a>
					</div>
					<div class="recommend_con_txt01">
						<h2 class="title01">
							<span>&nbsp;</span>
						</h2>
						<label class="maker">
							<span>다음상품 준비중...</span>
						</label>
						<label class="txt01">
							<span style="height: 22px;overflow:hidden;">
								&nbsp;
							</span>
						</label>
						<span class="price01">
							<span>
								&nbsp;
							</span>
						</span>
					</div>
				</div>				
			</div>
		</div>
	</div>
