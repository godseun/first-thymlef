<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/layout/include/base.jsp" %>
	<script type="text/javascript">
		var dupClick1 = false;
		$(function(){  
			$('.recommend_con_Type02').addClass('mItem');
			
			$('.mItem').on('mouseover', function() {
	            $(this).addClass('mOn');
			});
			
			$('.mItem').on('mouseout', function() {
	            $(this).removeClass('mOn');
			});
			
			<%//각 품목 상세 설명화면 이동%>
			$('.recommend_con_Type02').on('click', function(){ 
				_BT.actFormSubmit('frm', 'post', _BT.SHOP.URL.Search.View+'?pCode='+$(this).data('type')); 
			});			
		});
	</script>
	<div style="margin-bottom:20px;">
		<c:choose>
			<c:when test="${!empty prm.PromoInfo[0].sImg and prm.PromoInfo[0].sImg ne ''}">
				<img alt="광고배너" src="${upload}${prm.PromoInfo[0].sImg}" width="100%;" height="auto;">
			</c:when>
			<c:otherwise>
				<div class="ad_content01 margintop_20">
					<img src="${staticRoot}/img/ad/ad_img001.jpg" alt="광고배너" />
				</div>
			</c:otherwise>
		</c:choose>
		<div align="center">
			<c:if test="${!empty prm.PromoInfo[0].sUrl and prm.PromoInfo[0].sUrl ne ''}">
				<iframe width="${prm.PromoInfo[0].sWidth}" height="${prm.PromoInfo[0].sHeight}" src="${prm.PromoInfo[0].sUrl}?rel=0&amp;controls=0&amp;showinfo=0" frameborder="0" allowfullscreen></iframe>
			</c:if>
		</div>
		<h1 class="title_Type01" data-type="HIP">
			<c:out value="${prm.PromoInfo[0].sTitle}"/>
		</h1>
		<form id="frm" name="frm">
			<input type="hidden" id="sValue" name="sValue" />
			<input type="hidden" id="pCode" name="pCode" />
			<input type="hidden" id="cCode" name="cCode" />
		</form>
		<div class="recommend_content margintop_10" id="DIV_S">
			<c:forEach items="${prm.PromoPrdt}" var="prdt2" varStatus="status2">
				<div class="mItem recommend_con_Type02 <c:if test="${status2.count%5 ne '0'}"> mg_10</c:if>" data-type="<c:out value="${prdt2.PRDT_CD}"/>">
					<div class="recommend_con_img01" align="center" style="overflow: hidden;">
						<a href="#" class="img">
							<c:choose>
							<c:when test="${fn:indexOf(prdt2.PRDT_IMG, '//') >=0 }">
							<img src="<c:out value="${prdt2.PRDT_IMG}"/>" alt="상품사진" style="width:auto;height:156px;max-width:215px;" onerror="this.src='${staticRoot}/img/sample03.jpg'"/> 
							</c:when>
							<c:otherwise>
							<img src="${upload}<c:out value="${prdt2.PRDT_IMG}"/>" alt="상품사진" style="width:auto;height:156px;max-width:215px;" onerror="this.src='${staticRoot}/img/sample03.jpg'"/> 
						</c:otherwise>
						</c:choose>
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
		</div>
	
	</div>
