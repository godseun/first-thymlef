<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/layout/include/base.jsp" %>
<style type='text/css'> 
@-ms-viewport { width: device-width; } 
@-o-viewport { width: device-width; } 
@viewport { width: device-width; } 
</style> 
	<script type="text/javascript">
		$(function(){
			$('.sImg').width($(document).width()+'px');
			<%//각 프로모션 상품 상세검색 화면이동%>
			$('.bnImg').on('click', function(){  
				var type = $(this).data('type');
				var value = $(this).data('value');
				$('#pCode').val(value);
				_BT.actFormSubmit('frm', 'post', _BT.SHOP.URL.Helpdesk.PromoDtl); 
			});		
			<%//대화의 발견 상세 페이지 이동%>
			$('.recommend_con_Type04').on('click', function(){ 
				var value = $(this).data('value');
				var type = $(this).data('type');
				if(value == ''){
					$('#pCode').val(type);
					_BT.actFormSubmit('frm', 'post',_BT.SHOP.URL.Helpdesk.CtgPromoDtl); 
				}else{
					_BT.actFormSubmit('frm', 'post', _BT.SHOP.URL.Search.View+'?pCode='+value); 
				}
			});
			<%//각 품목 상세 설명화면 이동%>
			$(".mItem").on("click", function(){  
				_BT.actFormSubmit("frm", "post", _BT.SHOP.URL.Search.View+"?pCode="+$(this).data("type")); 
			});
		});
	</script>
	<div class="container wid_999 bg_gray" style="padding-top: 0px;">
		<div class="cycle-slideshow" data-cycle-fx="scrollHorz" data-cycle-slides="> a" data-cycle-pager=".rolling_pager" style="width:100%;">
			<c:forEach items="${banners}" var="mBn" varStatus="status">
				<c:if test="${mBn.bTp eq 'MSB'}">
					<a href="javascript:;" class="bnImg" data-type="${mBn.bTp}" data-value="${mBn.pId}" data-value2="${mBn.sRelNo}">
						<img src="${upload}<c:out value="${mBn.bImg}"/>" class="sImg" alt="메인비쥬얼" style="width:100%;height:auto;"/>
					</a>
				</c:if>
			</c:forEach>				
		</div>
		<div class="rolling_pager" style="margin-top: -30px; text-align: right;"></div>
		<ul class="m_main_icon" style="margin-bottom:5px;">
			<li>
				<a href="javascript:;" onclick="_BT.moveUrl(_BT.SHOP.URL.Menus.A1);"> 
					<img src="${staticRoot}/m/img/main_menu_icon02.jpg" alt="메뉴아이콘2" />
						<p>침구</p>
				</a>
			</li>
			<li>
				<a href="javascript:;" onclick="_BT.moveUrl(_BT.SHOP.URL.Menus.A2);">
					<img src="${staticRoot}/m/img/main_menu_icon03.jpg" alt="메뉴아이콘3" />
						<p>커버</p>
				</a>
			</li>
			<li>
				<a href="javascript:;" onclick="_BT.moveUrl(_BT.SHOP.URL.Menus.A3);">
					<img src="${staticRoot}/m/img/main_menu_icon04.jpg" alt="메뉴아이콘4" />
						<p>패드</p>
				</a>
			</li>
			<li>
				<a href="javascript:;" onclick="_BT.moveUrl(_BT.SHOP.URL.Menus.A4);">
					<img src="${staticRoot}/m/img/main_menu_icon06.jpg" alt="메뉴아이콘6" />
						<p>베개솜</p>
				</a>
			</li>
			<li>
				<a href="javascript:;" onclick="_BT.moveUrl(_BT.SHOP.URL.Menus.c22);" >
					<img src="${staticRoot}/m/img/main_menu_icon05.jpg" alt="메뉴아이콘5" />
						<p>토퍼</p>
				</a>
			</li>
			<li>
				<a href="javascript:;" onclick="_BT.moveUrl(_BT.SHOP.URL.Menus.c25);" >
					<img src="${staticRoot}/m/img/main_menu_icon07.jpg" alt="메뉴아이콘7" />
						<p>스프레드</p>
				</a>
			</li>
			<li>
				<a href="javascript:;" onclick="_BT.moveUrl(_BT.SHOP.URL.Menus.c27);">
					<img src="${staticRoot}/m/img/main_menu_icon01.jpg" alt="메뉴아이콘1" />
						<p>극세사</p>
				</a>
			</li>
			<li>
				<a href="javascript:;" onclick="_BT.moveUrl(_BT.SHOP.URL.Menus.A5);">
					<img src="${staticRoot}/m/img/main_menu_icon08.jpg" alt="메뉴아이콘8" />
						<p>모음</p>
				</a>
			</li>
			
			<li>
				<a href="javascript:;" onclick="_BT.moveUrl(_BT.SHOP.URL.Helpdesk.Promo);">
					<img src="${staticRoot}/m/img/main_menu_icon10.jpg" alt="메뉴아이콘10" />
						<p>추천</p>
				</a>
			</li>
		</ul>

		<!-- width 639px start-->
		<ul class="m_main_icon_639" style="margin-bottom:5px;">
			<li>
				<a href="javascript:;" onclick="_BT.moveUrl(_BT.SHOP.URL.Menus.c11);">
					<img src="${staticRoot}/m/img/main_menu_icon02.jpg" alt="메뉴아이콘2" />
						<p>작업</p>
				</a>
			</li>
			<li>
				<a href="javascript:;" onclick="_BT.moveUrl(_BT.SHOP.URL.Menus.c12);">
					<img src="${staticRoot}/m/img/main_menu_icon03.jpg" alt="메뉴아이콘3" />
						<p>전동</p>
				</a>
			</li>
			<li>
				<a href="javascript:;" onclick="_BT.moveUrl(_BT.SHOP.URL.Menus.c13);">
					<img src="${staticRoot}/m/img/main_menu_icon04.jpg" alt="메뉴아이콘4" />
						<p>에어/유압/엔진</p>
				</a>
			</li>
			<li>
				<a href="javascript:;" onclick="_BT.moveUrl(_BT.SHOP.URL.Menus.c15);">
					<img src="${staticRoot}/m/img/main_menu_icon06.jpg" alt="메뉴아이콘6" />
						<p>운반/하역/포장</p>
				</a>
			</li>
			<li>
				<a href="javascript:;" onclick="_BT.moveUrl(_BT.SHOP.URL.Menus.c14);"> 
					<img src="${staticRoot}/m/img/main_menu_icon05.jpg" alt="메뉴아이콘5" />
						<p>산업안전/용접</p>
				</a>
			</li>
			<li>
				<a href="javascript:;" onclick="_BT.moveUrl(_BT.SHOP.URL.Menus.c16);" >
					<img src="${staticRoot}/m/img/main_menu_icon07.jpg" alt="메뉴아이콘7" />
						<p>전기/제어/측정</p>
				</a>
			</li>
			<li>
				<a href="javascript:;" onclick="_BT.moveUrl(_BT.SHOP.URL.Menus.c10);">
					<img src="${staticRoot}/m/img/main_menu_icon01.jpg" alt="메뉴아이콘1" />
						<p>절삭</p>
				</a>
			</li>
			<li>
				<a href="javascript:;" onclick="_BT.moveUrl(_BT.SHOP.URL.Menus.c17);">
					<img src="${staticRoot}/m/img/main_menu_icon08.jpg" alt="메뉴아이콘8" />
						<p>화학/윤활/배관</p>
				</a>
			</li>
			<li>
				<a href="javascript:;" onclick="_BT.moveUrl(_BT.SHOP.URL.Menus.c18);">
					<img src="${staticRoot}/m/img/main_menu_icon09.jpg" alt="메뉴아이콘9" />
						<p>사무/생활/가전</p>
				</a>
			</li>
			<li>
				<a href="javascript:;" onclick="_BT.moveUrl(_BT.SHOP.URL.Helpdesk.Promo);">
					<img src="${staticRoot}/m/img/main_menu_icon10.jpg" alt="메뉴아이콘10" />
						<p>추천</p>
				</a>
			</li>
		</ul>
		<!-- width 639px end-->
<%--		
		<c:set var="isFirst" value="Y" />
		<ul class="m_recommend_list" style="text-align: center;">
			<c:forEach items="${banners}" var="STF" varStatus="status">
				<c:if test="${STF.bTp eq 'STF'}">
					<c:choose>
						<c:when test="${isFirst eq 'Y'}">
							<div class="recommend_con_Type04" data-type="<c:out value="${STF.pId}"/>" data-value="<c:out value="${STF.pPrdtCd}"/>" id ="se_${status.count}"style="text-align:left;width: 98%; background-image:url('${upload}${STF.bImg}'); background-size: 100% 100%;">
								<div class="recommend_con_txt03">
									<span class="title2" id="on_se_${status.count}">
										<c:out value="${STF.bTit}"/> &gt;
									</span>
								</div>
							</div>
							<c:set var="isFirst" value="N" />
						</c:when>
						<c:otherwise>
							<div class="recommend_con_Type04 <c:if test="${status.count % 2 eq 0}">marginright_10</c:if>" data-type="<c:out value="${STF.pId}"/>" data-value="<c:out value="${STF.pPrdtCd}"/>" id ="se_${status.count}"style="text-align: left;background-image:url('${upload}${STF.bImg}'); background-size: 100% 100%;">
								<div class="recommend_con_txt03">
									<span class="title2" id="on_se_${status.count}">
										<c:out value="${STF.bTit}"/> &gt;
									</span>
								</div>
							</div>
						</c:otherwise>
					</c:choose>		
				</c:if>
			</c:forEach>
		</ul>
 		
		<ul class="m_ad_content01">
			<li>
				<div class="box_content">
					<a href="javascript:;" class="img">
						<img src="${staticRoot}/m/img/ad_content01.jpg" alt="광고상품" />
					</a>
					<div class="total_txt">
						<a href="" class="txt_title01">
							프레스툴 최초 / 브러쉬리스 모터
						</a>
						<a href="" class="txt_title02">
							케맥스 ACO203 : 용접대신 충전공구로 배관연결, 5초면 끝!
						</a>
					</div>
				</div>
			</li>
		</ul>
 --%>
		<c:if test="${fn:length(tsPprdt) ge 1}">
			<div class="item_title2" style="background-color:#ffffff;width:100%;height:50px;vertical-align: middle;display: inline-block;">
				<span style="display: inline-block;width:95px;font-size: 22px;padding-left:10px;padding-top:10px;">
					타임세일
				</span>
				<span style="color: #000000;font-size: 14px;display: inline-block;width: 200px; padding-left:10px;">
					&nbsp;&nbsp;|&nbsp;&nbsp;기간한정 특가상품!!&nbsp;&nbsp;
				</span>
			</div>
 			<%//제휴상품 리스트%>
			<div class="recommend_content" id="DIV_J" style="background-color:#ffffff;">
				<c:set var="CNT" 		value="1" />
				<c:forEach items="${tsPprdt}" var="prdt1" varStatus="status">
					<c:choose>
						<c:when test="${prdt1.sSprice eq 0}">
							<div class="mItem recommend_con_Type02 <c:if test="${CNT%2 ne '0'}"> mg_10</c:if>" data-type="<c:out value="${prdt1.sPcd}"/>" style="width: 47%;height:265px;">
<%-- 
								<img src="${staticRoot}/img/common/end_sale.png" alt="end_sale" style="z-index: 300;position:absolute; height:265px;">
 --%>
								<div class="recommend_con_img01" align="center" style="overflow: hidden;">
									<a href="#" class="img">
										<img src="${upload}<c:out value="${prdt1.sImg}"/>" alt="상품사진" style="width:auto;height:145px; max-width:130px;" onerror="this.src='${staticRoot}/img/sample03.jpg'"/> 
									</a>
								</div>
								<div class="recommend_con_txt01">
									<h2 class="title01" style="text-align: left;">
										<span><c:out value="${prdt1.sNm}"/></span>
									</h2>
									<label class="txt01" style="text-align: left;">
										<span style="height: 22px;overflow:hidden;">
											<c:out value="${prdt1.sSt}"/> &nbsp;
										</span>
									</label>
									<label class="maker" style="text-align: left;">
										<span><c:out value="${prdt1.sMk}"/></span>
									</label>
									<span class="price01" style="text-align: left;text-decoration: line-through;color:#b71c1c;">
										<span style="color:#000000;font-size: 15px;font-weight:normal;">
											<fmt:formatNumber value="${prdt1.sPrice}" groupingUsed="true"/>원
										</span>
									</span>
									<span class="price01" style="bottom:-25px;">
										<span style="font-weight:bold;font-size: 20px;">
											판매완료
<%-- 											
											<fmt:formatNumber value="${prdt1.sSprice}" groupingUsed="true"/>원
 --%>										
										</span>
									</span>
								</div>
							</div>
						</c:when>
						<c:otherwise>
							<div class="mItem recommend_con_Type02 <c:if test="${CNT%2 ne '0'}"> mg_10</c:if>" data-type="<c:out value="${prdt1.sPcd}"/>" style="width: 47%;height:265px">
								<div class="recommend_con_img01" align="center" style="overflow: hidden;">
									<a href="#" class="img">
										<img src="${upload}<c:out value="${prdt1.sImg}"/>" alt="상품사진" style="width:auto;height:145px; max-width:130px;" onerror="this.src='${staticRoot}/img/sample03.jpg'"/> 
									</a>
								</div>
								<div class="recommend_con_txt01">
									<h2 class="title01" style="text-align: left;">
										<span><c:out value="${prdt1.sNm}"/></span>
									</h2>
									<label class="txt01" style="text-align: left;">
										<span style="height: 22px;overflow:hidden;">
											<c:out value="${prdt1.sSt}"/> &nbsp;
										</span>
									</label>
									<label class="maker" style="text-align: left;">
										<span><c:out value="${prdt1.sMk}"/></span>
									</label>
									<span class="price01" style="text-align: left;text-decoration: line-through;color:#b71c1c;">
										<span style="color:#000000;font-size: 15px;font-weight:normal;">
											<fmt:formatNumber value="${prdt1.sPrice}" groupingUsed="true"/>원
										</span>
									</span>
									<span class="price01" style="bottom:-25px;">
										<span style="font-weight:bold;font-size: 20px;">
											<fmt:formatNumber value="${prdt1.sSprice}" groupingUsed="true"/>원
										</span>
									</span>
								</div>
							</div>
						</c:otherwise>
					</c:choose>	
					<c:set var="CNT" 			value="${CNT + 1}" />
				</c:forEach>
			</div>
		</c:if>
		<div class="ad_content01" style="text-align: center; padding-top: 10px;background-color:#ffffff; ">
			<a href="javascript:;">
				<img src="${staticRoot}/img/ad/ad_toolman.png" alt="광고배너" style="width: 100%;height: auto;"/>
			</a>
		</div>
		<ul class="m_list_content01" style="background-color: white;padding-top:5px;">
 			<%//제휴상품 리스트%>
			<c:set var="sSt" 		value="0" />
			<c:set var="sPrice" 	value="0" />
			<div class="recommend_content margintop_30" id="DIV_J">
				<c:set var="MAKR_NM" 	value="0" />
				<c:set var="CNT" 		value="1" />
				<c:forEach items="${mPprdt}" var="prdt1" varStatus="status">
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
					<div class="mItem recommend_con_Type02 <c:if test="${CNT%2 ne '0'}"> mg_10</c:if>" data-type="<c:out value="${prdt1.PRDT_CD}"/>" style="width: 47%;">
						<c:if test="${pTp eq 'TOOLMAN'}">
							<div style="z-index: 100;position: absolute;padding-top: 5px;">
								<img src="${staticRoot}/img/common/best_buy.png" alt="툴맨추천" style="width:80px;; height: auto;"/>
							</div>
						</c:if>
						<div class="recommend_con_img01" align="center" style="overflow: hidden;">
							<a href="#" class="img">
<c:choose>
						<c:when test="${fn:indexOf(prdt1.PRDT_IMG, '//') >=0 }">
						<img src="<c:out value="${prdt1.PRDT_IMG}"/>" alt="상품사진" style="width:auto;height:145px; max-width:130px;" onerror="this.src='${staticRoot}/img/sample03.jpg'"/> 
</c:when>
						<c:otherwise>
								<img src="${upload}<c:out value="${prdt1.PRDT_IMG}"/>" alt="상품사진" style="width:auto;height:145px; max-width:130px;" onerror="this.src='${staticRoot}/img/sample03.jpg'"/> 
								</c:otherwise>
						</c:choose>

							</a>
						</div>
						<div class="recommend_con_txt01">
							<h2 class="title01" style="text-align: left;">
								<span><c:out value="${prdt1.PRDT_NM}"/></span>
							</h2>
							<label class="txt01" style="text-align: left;">
								<span style="height: 22px;overflow:hidden;">
									<c:out value="${sSt}"/>&nbsp;
								</span>
							</label>
							<label class="maker" style="text-align: left;">
								<span><c:out value="${prdt1.MAKR_NM}"/></span>
							</label>
							<span class="price01" style="text-align: left;">
								<span>
									<fmt:formatNumber value="${prdt1.SEL_PRICE}" groupingUsed="true"/>${sPrice}
								</span>
							</span>
						</div>
					</div>
					<c:set var="CNT" 			value="${CNT + 1}" />
				</c:forEach>
				<div class="recommend_con_Type02 <c:if test="${CNT % 5 ne '0'}"> mg_10</c:if>" data-type="">
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
<%--  
			<c:forEach items="${prdtList.mob}" var="prdt1" varStatus="status" begin="3" end="12">
			<li>
				<div class="box_content">
					<span class="img">
<c:choose>
						<c:when test="${fn:indexOf(prdt1.PRDT_IMG, '//') >=0 }">
						<img src="<c:out value="${prdt1.PRDT_IMG}"/>" alt="상품사진" style="width:auto;height:180px;" onerror="this.src='${staticRoot}/img/sample03.jpg'"/>
</c:when>
						<c:otherwise>
						<img src="${staticRoot}/prduct<c:out value="${prdt1.PRDT_IMG}"/>" alt="상품사진" style="width:auto;height:180px;" onerror="this.src='${staticRoot}/img/sample03.jpg'"/>
</c:otherwise>
						</c:choose>
					</span>
					<div class="total_txt">
						<span class="txt_title01">
							<c:out value="${prdt1.PRDT_NM}"/>
						</span>
						<span class="txt_title02">
							[<c:out value="${prdt1.MAKR_NM}"/>] <c:out value="${prdt1.STNDRD}"/>
						</span>
						<span class="price">
							<fmt:formatNumber value="${prdt1.SEL_PRICE}" groupingUsed="true"/>원
						</span>
					</div>
				</div>
			</li>
			</c:forEach>
 --%>		
		</ul>
	</div>
	<form id="frm" name="frm">
		<input type="hidden" id="sValue" name="sValue" />
		<input type="hidden" id="pCode" name="pCode" />
		<input type="hidden" id="cCode" name="cCode" />
	</form>