<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/layout/include/base.jsp" %>
    <!-- Link Swiper's CSS -->
    <link rel="stylesheet" href="${staticRoot}/sdk/css/swiper.min.css">
<%--     
	<link rel="stylesheet" href="${staticRoot}/sdk/css/timeTo.css" type="text/css" />
	<script type="text/javascript" src="${staticRoot}/sdk/js/jquery.time-to.js"></script>
 --%>	
	<c:set var="st_sale" value="N" />
	<c:set var="sale_term" value="0" />
	<c:set var="sale_end_dt" value="N" />
	<c:set var="minPrice" value="100000000" />
	<c:set var="tarPrice" value="100000000" />
	<c:forEach items="${prdtInfo.pList}" var="prdt1" varStatus="status">
		<c:choose>
			<c:when test="${prdt1.SALE_PRICE eq 0 or empty prdt1.SALE_PRICE}">
				<c:set var="tarPrice" value="${prdt1.SEL_PRICE}" />
			</c:when>
			<c:otherwise>
				<c:set var="st_sale" value="Y" />
				<c:set var="tarPrice" value="${prdt1.SALE_PRICE}" />
				<c:set var="sale_term" value="${prdt1.SALE_TERM}" />
				<c:set var="sale_end_dt" value="${prdt1.SALE_END_DT}" />
			</c:otherwise>
		</c:choose>	
		<c:if test="${minPrice gt tarPrice}">
			<c:set var="minPrice" value="${tarPrice}" />
		</c:if>
	</c:forEach>    
	<style>
	    .swiper-container {
	        width: 100%;
	        height: auto;
	        margin: 20px auto;
	    }
	    .swiper-slide {
	        text-align: center;
	        font-size: 18px;
	        background: #fff;
	        /* Center slide text vertically */
	        display: -webkit-box;
	        display: -ms-flexbox;
	        display: -webkit-flex;
	        display: flex;
	        -webkit-box-pack: center;
	        -ms-flex-pack: center;
	        -webkit-justify-content: center;
	        justify-content: center;
	        -webkit-box-align: center;
	        -ms-flex-align: center;
	        -webkit-align-items: center;
	        align-items: center;
    	}
    </style>  
	<c:set var="prdt_title" 			value="추가구성 상품" />	
	<c:set var="prdt_display" 		value="" />	
	<c:if test="${fn:substring(prdtInfo.pInfo.PRDT_CD,0,3) eq 'ST7'}">
		<c:set var="prdt_title" 		value="구성 상품" />	
		<c:set var="prdt_display" 	value="display:none;" />	
		<c:forEach items="${prdtInfo.sList}" var="prdt1" varStatus="status">
			<c:choose>
				<c:when test="${prdt1.SALE_PRICE eq 0 or empty prdt1.SALE_PRICE}">
					<c:set var="tarPrice" value="${prdt1.SEL_PRICE}" />
				</c:when>
				<c:otherwise>
					<c:set var="st_sale" value="Y" />
					<c:set var="sale_term" value="${prdt1.SALE_TERM}" />
					<c:set var="sale_end_dt" value="${prdt1.SALE_END_DT}" />
					<c:set var="tarPrice" value="${prdt1.SALE_PRICE}" />
				</c:otherwise>
			</c:choose>	
			<c:if test="${minPrice gt tarPrice}">
				<c:set var="minPrice" value="${tarPrice}" />
			</c:if>
		</c:forEach>	
	</c:if>
	<div class="section">
		<form id="tFrm" name="tFrm">
			<input type="hidden" id="mStore" name="mStore"/>
		</form>
		<div class="list_location" style="padding:0 0 19px 0;">
<%-- 		
			<span class="txt02 ctg linkTxt" data-type="1" data-value="<c:out value="${prdtInfo.cInfo.LEV1_CD}"/>"><c:out value="${prdtInfo.cInfo.LEV1_NM}"/></span>
			<span class="arrow"><img src="${staticRoot}/img/bl_01.jpg" alt=">" /></span>
 --%>			
			<span class="txt02 ctg linkTxt" data-type="2" data-value="<c:out value="${prdtInfo.cInfo.LEV2_CD}"/>"><c:out value="${prdtInfo.cInfo.LEV2_NM}"/></span>
			<span class="arrow"><img src="${staticRoot}/img/bl_01.jpg" alt=">" /></span>
			<span class="txt02 ctg linkTxt" data-type="3" data-value="<c:out value="${prdtInfo.cInfo.LEV3_CD}"/>"><c:out value="${prdtInfo.cInfo.LEV3_NM}"/></span>
			<span class="arrow"><img src="${staticRoot}/img/bl_01.jpg" alt=">" /></span>
			<span class="txt02 ctg linkTxt" data-type="4" data-value="<c:out value="${prdtInfo.cInfo.LEV4_CD}"/>"><c:out value="${prdtInfo.cInfo.LEV4_NM}"/></span>
			<span class="arrow"><img src="${staticRoot}/img/bl_01.jpg" alt=">" /></span>
			<span class="last_txt2 ctg linkTxt" data-type="5" data-value="<c:out value="${prdtInfo.cInfo.LEV5_CD}"/>"><c:out value="${prdtInfo.cInfo.LEV5_NM}"/></span>
		</div>
		<div class="prdc_top_wrap">
			<div class="prdc_info_column01 main" style="text-align:center;">
				<c:if test="${fn:indexOf(prdtInfo.pInfo.PRDT_INFO, '툴맨추천') >=0 }">
					<div style="z-index: 100;position: absolute;top:5px;">
						<img src="${staticRoot}/img/common/toolman_pick.png" alt="툴맨추천" />
					</div>
				</c:if>
				<c:choose>
					<c:when test="${st_sale eq 'Y'}">			
						<div style="z-index: 100;position: absolute;right:5px;top:5px;">
							<img src="${staticRoot}/img/common/st_sale.png" alt="st_sale" />
						</div>
					</c:when>
					<c:otherwise>
						<c:if test="${prdtInfo.pInfo.PRDT_TP eq 'J' and prdtInfo.pInfo.ST_CARE_AT eq 'Y' }">				
							<div style="z-index: 100;position: absolute;right:5px;top:5px;">
								<img src="${staticRoot}/img/common/st_care.png" alt="st_care" />
							</div>
						</c:if>
					</c:otherwise>
				</c:choose>	
				<c:if test="${prdtInfo.pInfo.PRDT_TP eq 'J'}">				
					<div class="prdc_img" id="show"style="text-align:center;">
<c:choose>
						<c:when test="${fn:indexOf(prdtInfo.pInfo.PRDT_IMG, '//') >=0 }">
						<img src="<c:out value="${prdtInfo.pInfo.PRDT_IMG}"/>" alt="상품사진" id="show_pic" class="show_pic" onerror="this.src='${staticRoot}/img/sample03.jpg'"/> 
</c:when>
						<c:otherwise>
						<img src="${upload}/600<c:out value="${prdtInfo.pInfo.PRDT_IMG}"/>" alt="상품사진" id="show_pic" class="show_pic" onerror="this.src='${staticRoot}/img/sample03.jpg'"/> 
</c:otherwise>
						</c:choose>
					</div>
				</c:if>			
<%-- 				
				<c:if test="${st_sale eq 'Y'}">			
					<div class="ts_div" style="width:100%;height:55px;background-color:#000000;margin-bottom:15px; display:none; ">
						<div style="display:inline-block;width:100%;padding: 10px 0;text-align: left;">
							<span class="nanumEB" style="margin-left:10px;color:#ffffff;font-size:16px;vertical-align:middle;">
								JUST&nbsp;<c:out value="${sale_term}"/>&nbsp;DAYS
							</span>
							<div id="countdown" style="width:220px;float:right;"></div>
						</div>
					</div>
				</c:if>
 --%>				
				<c:if test="${prdtInfo.pInfo.PRDT_TP eq 'S'}">				
					<div class="prdc_img" id="show"style="text-align:center;">
<c:choose>
						<c:when test="${fn:indexOf(prdtInfo.pInfo.PRDT_IMG, '//') >=0 }">
						<img src="<c:out value="${prdtInfo.pInfo.PRDT_IMG}"/>" alt="상품사진" id="show_pic" class="show_pic" onerror="this.src='${staticRoot}/img/sample03.jpg'"/> 
</c:when>
						<c:otherwise>
						<img src="${upload}<c:out value="${prdtInfo.pInfo.PRDT_IMG}"/>" alt="상품사진" id="show_pic" class="show_pic" onerror="this.src='${staticRoot}/img/sample03.jpg'"/> 
</c:otherwise>
						</c:choose>
					</div>
					<c:if test="${prdtInfo.pInfo.EXTRA_IMG_AT eq 'Y' }">				
						<div class="prdc_img_plus" style="margin-bottom: 30px;">
							<c:set var="extraList" value="${ fn:split(prdtInfo.pInfo.EXTRA_IMG,'|') }"/>
							<span style="width: 18%;">
<c:choose>
						<c:when test="${fn:indexOf(prdtInfo.pInfo.PRDT_IMG, '//') >=0 }">
						<img data-type="${0}" class="extImg" src="<c:out value="${prdtInfo.pInfo.PRDT_IMG}"/>" alt="상세이미지" onerror="this.src='${staticRoot}/img/common/no_catag.jpg'" style="width:100%; height: auto; max-height: 80px;" /> 
</c:when>
						<c:otherwise>
								<img data-type="${0}" class="extImg" src="${upload}<c:out value="${prdtInfo.pInfo.PRDT_IMG}"/>" alt="상세이미지" onerror="this.src='${staticRoot}/img/common/no_catag.jpg'" style="width:100%; height: auto; max-height: 80px;" /> 
</c:otherwise>
						</c:choose>
							</span>
							<c:forEach items="${extraList}" var="img" varStatus="status">
								<span style="width: 18%;">
									<img data-type="${status.count}" class="extImg" src="${upload}<c:out value="${img}"/>" alt="상세이미지" onerror="this.src='${staticRoot}/img/common/no_catag.jpg'" style="width: 100%; height: auto; max-height: 80px;" /> 
								</span>
							</c:forEach>
						</div>
					</c:if>					
				</c:if>		
				<c:if test="${prdtInfo.pInfo.PRDT_TP eq 'J' and prdtInfo.pInfo.ST_CARE_AT eq 'Y' }">			
					<div class="signup_agree">
						<p class="alarm_txt">
							※ <span class="redCr bTxt" >대화케어</span>상품으로 대화에서 <span class="redCr bTxt" >평생 A/S 보증</span>을 약속 합니다.
							<a href="javascript:;" onclick="goStCare();"><span class="redCr bTxt" >[자세히 보기]</span></a>
						</p>
					</div>
				</c:if>
				<c:if test="${prdtInfo.pInfo.PRDT_TP eq 'J' and prdtInfo.pInfo.MNF_AT eq 'Y' }">			
					<div class="signup_agree">
						<p class="alarm_txt">
							※ <span class="redCr bTxt" >주문/제작</span>상품으로 주문 후 제작 및 <span class="redCr bTxt" >배송까지 3~7일</span>이 소요됩니다.<br/>
						</p>
						<p class="alarm_txt" style="padding-left: 22px;">
							주문/제작 품의 경우 교환및 반품이 불가 합니다.
						</p>
					</div>
				</c:if>
			</div>
			<div class="prdc_info_column02">
				<div class="wid_1248" id="zoom">
<c:choose>
						<c:when test="${fn:indexOf(prdtInfo.pInfo.PRDT_IMG, '//') >=0 }">
						<img id="zoom_pic" src="<c:out value="${prdtInfo.pInfo.PRDT_IMG}"/>"/>
</c:when>
						<c:otherwise>
				<img id="zoom_pic" src="${upload}<c:out value="${prdtInfo.pInfo.PRDT_IMG}"/>"/>
</c:otherwise>
						</c:choose>
				</div>
				<div class="prdc_title_con">
					<h2 class="prdc_title02">
						<c:out value="${prdtInfo.pInfo.PRDT_NM}"/>
					</h2>
				</div>
				<div class="prdc_explain_con">
					<ul>
						<li style="font-size: 15px; font-weight: 500;">
							대화 코드 : <span style="color:#b71c1c"><c:out value="${prdtInfo.pInfo.PRDT_CD}"/></span> 
						</li>
						<c:if test="${prdtInfo.pInfo.PRDT_TP eq 'S'}">
							<li>
								판매 상점 : ( <c:out value="${prdtInfo.pInfo.S_NM}"/> )
								<span class="show_seller">
									<label class="payment_Type01 goDetail" data-value="${prdtInfo.pInfo.STORE_ID}">업체상품 더보기</label>
								</span>
							</li>
						</c:if>
						<li>
							브랜드 : <c:out value="${prdtInfo.pInfo.MAKR_NM}"/>
						</li>
						<c:if test="${!empty prdtInfo.pInfo.ORG_CMP_CD}">
							<li>
								원산지  : <c:out value="${prdtInfo.pInfo.ORG_CMP_NM}"/> 
							</li>
						</c:if>
						<c:if test="${! empty prdtInfo.pInfo.EXT_INFO_TIT_1}">
							<li>
								<c:out value="${prdtInfo.pInfo.EXT_INFO_TIT_1}"/>  : 
								<c:out value="${prdtInfo.pInfo.EXT_INFO_VAL_1}"/>
							</li>
						</c:if>
						<c:if test="${! empty prdtInfo.pInfo.EXT_INFO_TIT_2}">
							<li>
								<c:out value="${prdtInfo.pInfo.EXT_INFO_TIT_2}"/> : 
								<c:out value="${prdtInfo.pInfo.EXT_INFO_VAL_2}"/>
							</li>
						</c:if>
						<c:if test="${! empty prdtInfo.pInfo.EXT_INFO_TIT_3}">
							<li>
								<c:out value="${prdtInfo.pInfo.EXT_INFO_TIT_3}"/> : 
								<c:out value="${prdtInfo.pInfo.EXT_INFO_VAL_3}"/>
							</li>
						</c:if>
						<c:if test="${! empty prdtInfo.pInfo.EXT_INFO_TIT_4}">
							<li>
								<c:out value="${prdtInfo.pInfo.EXT_INFO_TIT_4}"/> : 
								<c:out value="${prdtInfo.pInfo.EXT_INFO_VAL_4}"/>
							</li>
						</c:if>
						<c:if test="${! empty prdtInfo.pInfo.EXT_INFO_TIT_5}">
							<li>
								<c:out value="${prdtInfo.pInfo.EXT_INFO_TIT_5}"/> : 
								<c:out value="${prdtInfo.pInfo.EXT_INFO_VAL_5}"/>
							</li>
						</c:if>
						<c:if test="${! empty prdtInfo.pInfo.EXT_INFO_TIT_6}">
							<li>
								<c:out value="${prdtInfo.pInfo.EXT_INFO_TIT_6}"/> : 
								<c:out value="${prdtInfo.pInfo.EXT_INFO_VAL_6}"/>
							</li>
						</c:if>
						<c:set var="dlvyFeeTxt" 	value="묶음배송 가능" />	
						<c:set var="dlvyTxt" 		value="택배" />	
						<c:set var="dlvyTpTxt" 	value="대화배송" />	
						<c:if test="${prdtInfo.pInfo.PRDT_TP eq 'S'}"> 
							<c:set var="dlvyTpTxt" 			value="업체배송" />	
						</c:if>
						<c:choose>
							<c:when test="${prdtInfo.pInfo.DLVY_TP eq 'H'}"> 
								<c:set var="dlvyTxt" 			value="화물택배" />	
							</c:when>
							<c:when test="${prdtInfo.pInfo.DLVY_TP eq 'C'}"> 
								<c:set var="dlvyTxt" 			value="착불배송" />	
							</c:when>
							<c:otherwise>
							</c:otherwise>
						</c:choose>	
						<c:if test="${prdtInfo.pInfo.DLVY_MEG ne '1'}"> 
							<c:set var="dlvyFeeTxt" 		value="개별배송 상품" />	
						</c:if>
						<li>
							<c:choose>
								<c:when test="${prdtInfo.pInfo.DLVY_TP eq 'C'}"> 
									<p>
										${dlvyTxt}  
										<c:if test="${prdtInfo.pInfo.FREE_DLVY eq 'Y'}"> 
											<span style="color:#b71c1c"> [착불로 배송되는 제품입니다]</span>
										</c:if>
									</p>
								</c:when>
								<c:otherwise>
									<p>
										${dlvyTpTxt} [ ${dlvyTxt} / <fmt:formatNumber value="${prdtInfo.pInfo.DLVY_FEE}" groupingUsed="true"/>원 ]  
									</p>
									<p style="margin-top: 10px;">
										${dlvyFeeTxt}
										<c:if test="${prdtInfo.pInfo.FREE_DLVY eq 'Y'}"> 
											<span style="color:#b71c1c"> [<fmt:formatNumber value="${prdtInfo.pInfo.FREE_AMT}" groupingUsed="true"/>원 이상 무료배송]</span>
										</c:if>
									</p>
									<p style="margin-top: 10px;">
										<c:if test="${prdtInfo.pInfo.EXTRA_FEE_TP eq '1'}"> 
											도서산간지역 배송비 추가 
										</c:if>
									</p>
								</c:otherwise>
							</c:choose>	
						</li>
						<c:if test="${! empty prdtInfo.pInfo.PRDT_DTL_INFO}">
							<li>
								※ <c:out value="${prdtInfo.pInfo.PRDT_DTL_INFO}"/>
							</li>
						</c:if>
						<li style="height: 1px;padding:0;"></li>
					</ul>
				</div>
				<div class="prdc_total_con">
					<span class="total">
						상품가격
					</span>
					<span class="total_price_red nanumEB">
						<fmt:formatNumber value="${minPrice}" groupingUsed="true"/>
						<c:choose>
							<c:when test="${fn:length(prdtInfo.pList) gt 1 or (fn:length(prdtInfo.pList) eq 0 and fn:length(prdtInfo.sList) gt 1)}">
							 	원~
							</c:when>
							<c:otherwise>
								원
							</c:otherwise>
						</c:choose>	
					</span>
				</div>
				<div class="icon_btn_Group2 margintop_40">
					<a class="btn_sub_01" href="javascript:;" onclick="addFav();">
						찜하기
					</a>
<!-- 					
					<a class="btn_sub_03" href="#">
						재입고 알림
					</a>
 -->					
				</div>						
			</div>
		</div>
		<h1 class="title_Type03" style="${prdt_display}">
			상품 규격
		</h1>
		<form id="frm" name="frm">
		</form>
		<form id="subFrm" name="subFrm">
			<input type="hidden" id="prdt_cd"  name="prdt_cd" value="<c:out value="${prdtInfo.pInfo.PRDT_CD}"/>"/>
			<div class="sub_option_group" style="${prdt_display}">
				<table class="sub_group_tbl2">
					<caption>상품 규격</caption>
					<colgroup>
						<col width="5%">
<!-- 						
						<col width="12%">
 -->						
						<col width="*">
						<col width="22%">
						<col width="15%">
					</colgroup>
					<tbody>
						<tr>
							<th class="th2">
								<input type="checkbox"  id="clickTmp" class="chk"/>
							</th>
<!-- 							
							<th class="th2"></th>
 -->							
							<th class="th2">규 격[모델번호]</th>
							<th>판매가</th>
							<th>수 량</th>
						</tr>
						<c:set var="soldOut" value="0" />
						<c:forEach items="${prdtInfo.pList}" var="prdt1" varStatus="status">
							<tr> 
								<td>
									<input type="checkbox" id="P_<c:out value="${status.count}_cb"/>" data-type="<c:out value="${prdt1.PRDT_CD}"/>" data-value="<c:out value="${prdt1.PRDT_DTL_CD}"/>" class="chk"/>
								</td>
<%-- 								
								<td style="text-align:center;">
									<a href="javascript:;" class="img">
<c:choose>
						<c:when test="${fn:indexOf(prdt1.PRDT_IMG, '//') >=0 }">
						<img src="<c:out value="${prdt1.PRDT_IMG}"/>" data-type="<c:out value="${prdt1.PRDT_IMG}"/>" data-value="<c:out value="${prdt1.PRDT_CD}"/>" alt="상품사진" style="width:70px;height:70px;" onerror="this.src='${staticRoot}/img/sample03.jpg'"/> 
</c:when>
						<c:otherwise>
										<img src="${upload}<c:out value="${prdt1.PRDT_IMG}"/>" data-type="<c:out value="${prdt1.PRDT_IMG}"/>" data-value="<c:out value="${prdt1.PRDT_CD}"/>" alt="상품사진" style="width:70px;height:70px;" onerror="this.src='${staticRoot}/img/sample03.jpg'"/> 
</c:otherwise>
						</c:choose>
									</a>
								</td>
 --%>								
								<td style="text-align: left;word-break:break-all;padding:0 2px;">
									<c:out value="${prdt1.STNDRD}"/>
									[ <c:out value="${prdt1.MODEL_NM}"/> ]  
								</td>
								<td style="text-align: right;padding-right:10px;line-height:150%;">
									<c:choose>
										<c:when test="${prdt1.SALE_PRICE gt 0}">
											<span style="color:#000000;text-decoration: line-through;">
												<fmt:formatNumber value="${prdt1.SEL_PRICE}" groupingUsed="true"/>원
											</span><br/>
											<span style="color:#b71c1c; font-weight: bolder;">
												<fmt:formatNumber value="${prdt1.SALE_PRICE}" groupingUsed="true"/>원
											</span>
											<input type="hidden" id="P_<c:out value="${status.count}"/>_Price" value="<c:out value="${prdt1.SALE_PRICE}"/>"/>
										</c:when>
										<c:otherwise>
											<span style="color:#b71c1c; font-weight: bolder;">
												<fmt:formatNumber value="${prdt1.SEL_PRICE}" groupingUsed="true"/>원
											</span>
											<input type="hidden" id="P_<c:out value="${status.count}"/>_Price" value="<c:out value="${prdt1.SEL_PRICE}"/>"/>
										</c:otherwise>
									</c:choose><br/>
									(
									<c:choose>
										<c:when test="${prdtInfo.pInfo.PRDT_TP eq 'J'}">
											<c:out value="${prdt1.OUT_AMT}"/><c:out value="${prdt1.OUT_UNIT}"/>		
										</c:when>
										<c:otherwise>
											<fmt:formatNumber value="${prdt1.INVT_AMT}" groupingUsed="true"/>
											<input type="hidden" id="P_<c:out value="${status.count}"/>_Amt" value="<c:out value="${prdt1.INVT_AMT}"/>"/>
										</c:otherwise>
									</c:choose>
									)
								</td>
								<td>
									<input type="hidden" id="P_<c:out value="${status.count}"/>_Code" value="<c:out value="${prdt1.PRDT_DTL_CD}"/>"/>
									<c:choose>
										<c:when test="${prdt1.SOLDOUT_AT eq 'Y' or prdt1.INVT_AMT eq '0'}">
											<c:set var="soldOut" value="1" />
											<span style="color: #b71c1c;">
											일시품절<br/>
											<c:choose>
												<c:when test="${empty prdt1.RE_SALE_DT}">
													[재입고 : 미 확정]	
												</c:when>
												<c:otherwise>
													[재입고 : <c:out value="${prdt1.RE_SALE_DT}"/>]	
												</c:otherwise>
											</c:choose>	
											</span>	
										</c:when>
										<c:otherwise>
											<input type="text" 
													data-name="<c:out value="${prdtInfo.pInfo.PRDT_NM}"/>" 
													data-maker="<c:out value="${prdtInfo.pInfo.MAKR_NM}"/>" 
													data-price="<c:out value="${prdt1.SEL_PRICE}"/>" 
													data-stndrd="<c:out value="${prdt1.STNDRD}"/>" 
													data-type="<c:out value="${status.count}"/>" 
													id="P_<c:out value="${status.count}"/>" 
													name="<c:out value="${prdt1.PRDT_CD}"/>@<c:out value="${prdt1.PRDT_DTL_CD}"/>" 
													class="sub_option_input2 m_c01_01_01_input_01 cartQy" 
													style="text-align: right;"
											/>
										</c:otherwise>
									</c:choose>	
<%-- 								
									<span class="option_close">
										<img src="${staticRoot}/img/icon_close.jpg" alt="닫기" />
									</span>
 --%>								
								</td>
							</tr>
						</c:forEach>
						<tr>
							<td colspan="5" class="sub_option_total_count" style="text-align:right; padding-right:10px;">
								<span class="total_price_red02 nanumEB" style="font-size:14px;"> 0 원</span>
								<label class="join_form_btn" onclick="addCart();" style="max-width: 80px;">장바구니 담기</label>
							</td>								
						</tr>
					</tbody>
				</table>
			</div>
			<c:if test="${fn:length(prdtInfo.sList) > 0}">		
 				<h1 class="title_con_Type02" style="margin-top:50px; margin-bottom: 10px;">
					${prdt_title}
				</h1>
				<div class="sub_option_group">
					<table class="sub_group_tbl2">
						<caption>추가구성 상품규격</caption>
						<colgroup>
							<col width="13%">
							<col width="*">
							<col width="12%">
							<col width="18%">
							<col width="10%">
						</colgroup>
						<tbody>
							<tr>
								<th class="th2"></th>
								<th class="th2">제품정보</th>
								<th class="th2">단위</th>
								<th>판매가</th>
								<th>수 량</th>
							</tr>
							<c:set var="soldOut" value="0" />
							<c:forEach items="${prdtInfo.sList}" var="prdt1" varStatus="status">
								<c:if test="${status.count gt '4'}">
									<c:set var="addClass" 		value="prdtM" />	
								</c:if>
								<tr class="${addClass}"> 
									<td style="text-align:center;">
										<a href="javascript:;" class="img">
<c:choose>
						<c:when test="${fn:indexOf(prdt1.PRDT_IMG, '//') >=0 }">
						<img class="sImg" src="<c:out value="${prdt1.PRDT_IMG}"/>" data-type="<c:out value="${prdt1.PRDT_IMG}"/>" data-value="<c:out value="${prdt1.PRDT_CD}"/>" alt="상품사진" style="width:70px;height:70px;" onerror="this.src='${staticRoot}/img/sample03.jpg'"/> 
</c:when>
						<c:otherwise>
											<img class="sImg" src="${upload}<c:out value="${prdt1.PRDT_IMG}"/>" data-type="<c:out value="${prdt1.PRDT_IMG}"/>" data-value="<c:out value="${prdt1.PRDT_CD}"/>" alt="상품사진" style="width:70px;height:70px;" onerror="this.src='${staticRoot}/img/sample03.jpg'"/> 
</c:otherwise>
						</c:choose>
										</a>
									</td>
									<td style="text-align: left; padding-left:10px;line-height: 150%;">
									<c:out value="${prdt1.PRDT_DTL_CD}"/><br/>
										[<c:out value="${prdt1.MAKR_NM}"/>]&nbsp;<c:out value="${prdt1.PRDT_NM}"/><br/>
										<c:out value="${prdt1.STNDRD}"/>&nbsp;
										<c:if test="${! empty prdt1.MODEL_NM}">
											(<c:out value="${prdt1.MODEL_NM}"/>)
										</c:if>
									</td>
									<td>
										<c:out value="${prdt1.OUT_AMT}"/><c:out value="${prdt1.OUT_UNIT}"/>
									</td>
									<td style="text-align: right;padding-right:10px;line-height:150%;">
										<c:choose>
											<c:when test="${prdt1.SALE_PRICE gt 0}">
												<span style="color:#000000;text-decoration: line-through;">
													<fmt:formatNumber value="${prdt1.SEL_PRICE}" groupingUsed="true"/>원
												</span><br/>
												<span style="color:#b71c1c; font-weight: bolder;">
													<fmt:formatNumber value="${prdt1.SALE_PRICE}" groupingUsed="true"/>원
												</span>
												<input type="hidden" id="P2_<c:out value="${status.count}"/>_Price" value="<c:out value="${prdt1.SALE_PRICE}"/>"/>
											</c:when>
											<c:otherwise>
												<span style="color:#b71c1c; font-weight: bolder;">
													<fmt:formatNumber value="${prdt1.SEL_PRICE}" groupingUsed="true"/>원
												</span>
												<input type="hidden" id="P2_<c:out value="${status.count}"/>_Price" value="<c:out value="${prdt1.SEL_PRICE}"/>"/>
											</c:otherwise>
										</c:choose>
									</td>
									<td>
										<input type="hidden" id="P2_<c:out value="${status.count}"/>_Code" value="<c:out value="${prdt1.PRDT_DTL_CD}"/>"/>
										<c:choose>
											<c:when test="${prdt1.SOLDOUT_AT eq 'Y' or prdt1.INVT_AMT eq '0'}">
												<c:set var="soldOut" value="1" />
												<span style="color: #b71c1c;">
												일시품절<br/>
												<c:choose>
													<c:when test="${empty prdt1.RE_SALE_DT}">
														[재입고 : 미 확정]	
													</c:when>
													<c:otherwise>
														[재입고 : <c:out value="${prdt1.RE_SALE_DT}"/>]	
													</c:otherwise>
												</c:choose>
												</span>	
											</c:when>
											<c:otherwise>
												<input type="text" 
														data-name="<c:out value="${prdt1.PRDT_NM}"/>"
														data-maker="<c:out value="${prdt1.MAKR_NM}"/>" 
														data-price="<c:out value="${prdt1.SEL_PRICE}"/>" 
														data-stndrd="<c:out value="${prdt1.STNDRD}"/>" 
														data-type="<c:out value="${status.count}"/>" 
														id="P2_<c:out value="${status.count}"/>" 
														name="<c:out value="${prdt1.PRDT_CD}"/>@<c:out value="${prdt1.PRDT_DTL_CD}"/>" 
														class="sub_option_input3 m_c01_01_01_input_01 cartQy" 
														style="text-align: right;"
												/>
											</c:otherwise>
										</c:choose>	
										<%-- 								
										<span class="option_close">
											<img src="${staticRoot}/img/icon_close.jpg" alt="닫기" />
										</span>
	 --%>								
									</td>
								</tr>
							</c:forEach>
							<tr>
								<td colspan="5" class="sub_option_total_count" style="text-align:right; padding-right:10px;">
									<label id="mView" class="join_form_btn mOn2_1" style="float:left;max-width:100px;">상품 더보기 ▽</label>
									<span class="total_price_red03 nanumEB" style="font-size:14px;"> 0 원</span>
									<label class="join_form_btn" onclick="addCart();" style="max-width: 80px;">장바구니 담기</label>
								</td>		
							</tr>
						</tbody>
					</table>
					<div id="preview" class="" style="display:none;">
						<img id="preImg" src="" id="prev_img" onerror="this.src='${staticRoot}/img/sample03.jpg'" width="400px" height="400px" alt="">
					</div>
				</div>
			</c:if>
		</form>		
		<c:if test="${soldOut eq '1'}">
			<p class="alarm_txt" style="padding-left: 5px; font-size:14px; ">
				※제조사의 사정에 따라 재입고일이 변동될 수 있음을 유의 바랍니다.
			</p>
		</c:if>
		<c:if test="${prdtInfo.pInfo.MOVE_AT eq 'Y'}">
			<c:forEach items="${prdtInfo.mList}" var="mv" varStatus="status">
				<div align="center" class="margintop_20">
					<iframe width="100%" height="auto" src="${mv.sUrl}?rel=0&amp;showinfo=0" frameborder="0" allowfullscreen></iframe>
				</div>
			</c:forEach>
			<c:if test="${fn:length(prdtInfo.mList) > 0}">
				<p class="alarm_txt">
					※ 동영상은 참고용으로 실제제품과 다를 수 있습니다.
				</p>
			</c:if>
		</c:if>
		<c:choose>
			<c:when test="${prdtInfo.pInfo.PRDT_TP eq 'S'}">
			 	<div class="tab_bar margintop_20">
					<ul class="tab_list">
						<li class="tab_item">
							<a href="javascript:;" class="tab_link" onclick="showTab('tab3');" data-type="tab3"><span id="tab3" class="tab">배송정보</span></a>
						</li>
					</ul>
				</div>
			</c:when>
			<c:otherwise>
			 	<div class="tab_bar margintop_20" style="width: 100%;">
					<ul class="tab_list">
						<li class="tab_item" style="width: 100px;">
							<a href="javascript:;" class="tab_link" onclick="showTab('tab1');" data-type="tab1"><span id="tab1" class="tab tabOn" style="width: 100px;">상세정보</span></a>
						</li>
						<li class="tab_item" style="width: 100px;">
							<a href="javascript:;" class="tab_link" onclick="showTab('tab2');" data-type="tab2"><span id="tab2" class="tab"  style="width: 100px;">상품문의</span></a>
						</li>
						<li class="tab_item" style="width: 100px;">
							<a href="javascript:;" class="tab_link" onclick="showTab('tab3');" data-type="tab3"><span id="tab3" class="tab"  style="width: 100px;">배송정보</span></a>
						</li>
					</ul>
				</div>
			</c:otherwise>
		</c:choose>		
		<div class="tab_dtl" id="dtl_tab1" data-type="tab1">
		
		<div class="pop_set_content6 vOff" id="ctl">
			<h1 class="blue_title">
				카탈로그 상품
				<span class="close" onclick="closeDivPop('ctl');"></span>
			</h1>
			<div class="pop_set_substance6" id="ctl_dtl" style="display:inline-block;">
			</div>
		</div>
		
		<c:if test="${prdtInfo.pInfo.EBOOK_IMG_AT eq 'Y'}">
		    <div class="swiper-container">
		        <div class="swiper-wrapper">
		        
					<c:set var="page" 		value="0" />
					<c:set var="chkP" 		value="0" />
					<c:forEach items="${prdtInfo.cList}" var="catlog" varStatus="status">
						<c:if test="${catlog.CUR eq 'O'}">
							<c:set var="chkP" 		value="1" />
							<c:set var="page" 		value="${status.count}" />
						</c:if>
						<c:if test="${chkP eq '1'}">
				            <div class="swiper-slide eBOOK" data-type="eBOOK" data-value='<c:out value="${catlog.FILE_ID}"/>'>
				            	<img src="${upload}<c:out value="${catlog.IMG}"/>" style="width: 100%; height: auto;" data-type='<c:out value="${catlog.FILE_ID}"/>' class="ctaImg" alt="카탈로그 이미지" onerror="this.src='${staticRoot}/img/common/no_catag.jpg'"/> 
				            </div>
						</c:if>
					</c:forEach>	
					<c:forEach items="${prdtInfo.cList}" var="catlog" varStatus="status" end="${page}" >
			            <div class="swiper-slide eBOOK" data-type="eBOOK" data-value='<c:out value="${catlog.FILE_ID}"/>'>
			            	<img src="${upload}<c:out value="${catlog.IMG}"/>" style="width: 100%; height: auto;" data-type='<c:out value="${catlog.FILE_ID}"/>' class="ctaImg" alt="카탈로그 이미지" onerror="this.src='${staticRoot}/img/common/no_catag.jpg'"/> 
			            </div>
					</c:forEach>	
	       		</div>
		        <div class="swiper-button-next"></div>
		        <div class="swiper-button-prev"></div>
			</div>
			</c:if>
			<c:if test="${prdtInfo.pInfo.CTL_IMG_AT eq 'Y'}">
				<c:set var="imgList" value="${ fn:split(prdtInfo.pInfo.CTL_IMG,'|') }"/>
				<div align="center">
					<c:forEach items="${imgList}" var="img" varStatus="status">
						<img src="${upload}<c:out value="${img}"/>" alt="상세이미지" style="width: 100%; height: auto;"  onerror="this.src='${staticRoot}/img/common/no_catag.jpg'"/> 
					</c:forEach>
				</div>
			</c:if>
		</div>
		<div class="tab_dtl margintop_20 vOff" id="dtl_tab2" data-type="tab2">
			<h1 class="title_Type03 margintop_40">
				상품평 / 문의
			</h1>
			<p class="alarm_txt">※ 제품을 보신 소감, 의견, 문의등 다양하게 등록이 가능 합니다.</p>
			<p class="alarm_txt margintop_7">※ 해당 상품 자체와 관계없는 글, 양도, 광고성, 욕설, 비방, 도배 등의 글은 예고 없이 이동, 노출제한, 삭제 등의 조치가 취해질 수 있습니다.</p>
			<p class="alarm_txt margintop_7">※  공개 게시판이므로 전화번호, 메일 주소 등 고객님의 소중한 개인정보는 절대 남기지 말아주세요.</p>
			<p class="alarm_txt margintop_7">※  가격, 판매자, 교환/환불 및 배송 등 해당 상품 자체와 관련 없는 문의는 메신저 문의나, 1:1 문의하기를 이용해주세요.</p>
			
			<div class="notcie_board margintop_30">
				<!--공지사항 제목-->
				<c:forEach items="${prdtInfo.qList}" var="qna" varStatus="status">
					<div class="notcie_board2">
						<div class="notcie_board_tit">
							${fn:replace(qna.CONTENT, cn, br)}
						</div>
						<div class="notcie_board_date"><c:out value="${qna.TITLE}"/> [ <c:out value="${qna.CREATE_DT}"/> ]</div>	
					</div>
					<c:if test="${! empty qna.ANSWER}">
						<div class="notcie_board_con1">
							${fn:replace(qna.ANSWER, cn, br)}
						</div>
					</c:if>
				</c:forEach>
				<c:choose>
					<c:when test="${empty userSession}">
						<div class="question_box_02">		
							<p class="alarm_txt">※ 로그인 후 글 등록이 가능 합니다.</p>
						</div>
					</c:when>
					<c:otherwise>
						<div class="question_box_02">		
							<form id="nFrm" name="nFrm">
								<input type="hidden" id="relateCd" name="relateCd" value="<c:out value="${prdtInfo.pInfo.PRDT_CD}"/>"/>
								<textarea id="bbsCon"  name="bbsCon" rows="5" placeholder="내용을 입력 하세요."></textarea>
							</form>
							<div class="cart_btn2 margintop_10"><a href="javascript:;" onclick="writeQna();" class="btn_1">등록하기</a></div>					
						</div>
					</c:otherwise>
				</c:choose>				
			</div>
		</div>
		<div class="tab_dtl margintop_20 vOff" id="dtl_tab3" data-type="tab3">
			<h1 class="title_Type03 margintop_40">
				배송정보
			</h1>
			<div class="sub_text_group">
				<c:choose>
					<c:when test="${prdtInfo.pInfo.PRDT_NOTICE_TP eq '1'}">
						<c:choose>
							<c:when test="${prdtInfo.pInfo.DLVY_TP eq 'C'}">
								<p class="sub_text01" style="line-height:180%;">
									- 본 상품은 <span style="color:#b71c1c">착불로 배송되는 제품입니다.</span>
								</p>
							</c:when>
							<c:otherwise>
								<p class="sub_text01" style="line-height:180%;">
									고객님이 구매하신 모든 상품은 배송비( <fmt:formatNumber value="${prdtInfo.pInfo.DLVY_FEE}" groupingUsed="true"/>원 )가 부과됩니다.<br/>
									<c:if test="${prdtInfo.pInfo.FREE_DLVY eq 'Y'}"> 
										단, 구매액이 <fmt:formatNumber value="${prdtInfo.pInfo.FREE_AMT}" groupingUsed="true"/>만원 이상인 경우는 무료로 배송이 됩니다. <br/>
									</c:if>
								</p>
							</c:otherwise>
						</c:choose>	
						<ul class="sub_text01 margintop_20" style="line-height:180%;">
							<li>
								- 여러상품을 묶음배송으로 구매할 경우 통합배송 처리로 인해 당일발송이 불가 할 수 있습니다.<br/>
								- 자세한 사항은 고객만족센터에서 확인 가능 합니다.
							</li>
							<li class="margintop_20">
								<c:if test="${prdtInfo.pInfo.EXTRA_FEE_TP eq 'Y'}"> 
									[제주/도서산간지]의 경우에는 아래와 같이 배송비가 추가 됩니다.
								</c:if>
							</li>
							<li>
								<c:if test="${! empty prdtInfo.pInfo.T_ZONE1}"> 
									- 도서산간지역 : <fmt:formatNumber value="${prdtInfo.pInfo.T_ZONE1}" groupingUsed="true"/> 원
								</c:if>
							</li>
							<li>
								<c:if test="${! empty prdtInfo.pInfo.T_ZONE2}"> 
									- 제주지역 : <fmt:formatNumber value="${prdtInfo.pInfo.T_ZONE2}" groupingUsed="true"/> 원
								</c:if>
							</li>
							<li>
							</li>
						</ul>
					</c:when>
					<c:otherwise>
						<p class="sub_text01" style="line-height:180%;">
							고객님이 구매하신 모든 상품은 배송비( <fmt:formatNumber value="${prdtInfo.pInfo.DLVY_FEE}" groupingUsed="true"/>원 )가 부과됩니다.<br/>
							<c:if test="${prdtInfo.pInfo.FREE_DLVY eq 'Y'}"> 
								단, 구매액이 <fmt:formatNumber value="${prdtInfo.pInfo.FREE_AMT}" groupingUsed="true"/>만원 이상인 경우는 무료로 배송이 됩니다. <br/>
							</c:if>
						</p>
						<ul class="sub_text01 margintop_20" style="line-height:180%;">
							<li>
								<c:if test="${prdtInfo.pInfo.EXTRA_FEE_TP eq 'Y'}"> 
									[제주/도서산간지]의 경우에는 아래와 같이 배송비가 추가 됩니다.
								</c:if>
							</li>
							<li>
								<c:if test="${! empty prdtInfo.pInfo.T_ZONE1}"> 
									- 도서산간지역 : <fmt:formatNumber value="${prdtInfo.pInfo.T_ZONE1}" groupingUsed="true"/> 원
								</c:if>
							</li>
							<li>
								<c:if test="${! empty prdtInfo.pInfo.T_ZONE2}"> 
									- 제주지역 : <fmt:formatNumber value="${prdtInfo.pInfo.T_ZONE2}" groupingUsed="true"/> 원
								</c:if>
							</li>
							<li>
							</li>
						</ul>
					</c:otherwise>
				</c:choose>	
			</div>
			<h1 class="title_Type03 margintop_40">
				교환 및 반품 정책
			</h1>
			<div class="sub_text_group">
				<c:choose>
					<c:when test="${prdtInfo.pInfo.PRDT_NOTICE_TP eq '1'}">
						<ul class="sub_text01"  style="line-height:180%;">
							<li>
								- 교환 및 반품은 제품수령 후 7일 이내 언제든지 요청 가능합니다. 
							</li>
							<li>
								- 반품 후 환불은 반품 제품 회수 후 3(영업일)일이내에 카드 승인취소나 온라인 무통장입금등의 방법으로 처리를 해드립니다. 
							</li>
							<li>
								- 제품의 하자가 없이 단순 고객의 변심으로 환불/교환 할 경우 추가 배송비가 발생 할 수 있습니다. 
							</li>
							<li>
								- 주문제작 상품, 포장개봉 상품, 박스훼손 및 구성품 분실의 경우는 고객변심에 의한 반품 및 교환이 불가 합니다.
							</li>
							<li>
								- 구매확정 후 에는 교환 및 반품이 불가 합니다.
							</li>
							<li>
								- 배송완료 후 구매확정을 하지 않은 경우에는 배송이 완료된 일로부터 7일 경과 후, 8일째 자동으로 구매확정 됩니다.
							</li>
						</ul>
						<ul class="sub_text01 margintop_20"  style="line-height:180%;">
							<li>
								- 교환/반품 방법 : 지정 택배사 이용 (CJ대한 통운)
							</li>
							<li>
								- 교환/반품 주소 : ( <c:out value="${prdtInfo.pInfo.RTN_ZIP_CD}"/> ) <c:out value="${prdtInfo.pInfo.RTN_ADRES}"/> <c:out value="${prdtInfo.pInfo.RTN_ADRES_DTL}"/>
							</li>
						</ul>
					</c:when>
					<c:otherwise>
						<ul class="sub_text01"  style="line-height:180%;">
							<li>
								- 교환 및 반품은 제품수령 후 7일 이내 언제든지 요청 가능합니다. 
							</li>
							<li>
								- 반품 후 환불은 반품 제품 회수 후 3(영업일)일이내에 카드 승인취소나 온라인 무통장입금등의 방법으로 처리를 해드립니다. 
							</li>
							<li>
								- 제품의 하자가 없이 단순 고객의 변심으로 환불/교환 할 경우 추가 배송비가 발생 할 수 있습니다. 
							</li>
							<li>
								- 주문제작 상품, 포장개봉 상품, 박스훼손 및 구성품 분실의 경우는 고객변심에 의한 반품 및 교환이 불가 합니다.
							</li>
							<li>
								- 구매확정 후 에는 교환 및 반품이 불가 합니다.
							</li>
							<li>
								- 배송완료 후 구매확정을 하지 않은 경우에는 배송이 완료된 일로부터 7일 경과 후, 8일째 자동으로 구매확정 됩니다.
							</li>
						</ul>
						<ul class="sub_text01 margintop_20"  style="line-height:180%;">
							<li>
								<c:if test="${prdtInfo.pInfo.APPN_RTN_HDRY eq 'Y'}">
									- 교환/반품 방법 : 지정 택배사 이용 (CJ대한 통운)
								</c:if>
							</li>
							<li>
								- 교환/반품 주소 : ( <c:out value="${prdtInfo.pInfo.RTN_ZIP_CD}"/> ) <c:out value="${prdtInfo.pInfo.RTN_ADRES}"/> <c:out value="${prdtInfo.pInfo.RTN_ADRES_DTL}"/>
							</li>
						</ul>
					</c:otherwise>
				</c:choose>				
			</div>
		</div>
		<c:if test="${fn:length(prdtInfo.rList) > 0}">
			<h1 class="title_Type03 margintop_30">
				관련상품
			</h1>
			<div class="recommend_content" data-type="rList">
				<c:set var="divCnt" value="1" />
				<c:set var="isFirst" value="0" />
				<c:set var="sSt" 		value="0" />
				<c:set var="sPrice" 	value="0" />
				<c:set var="cnt" 		value="${fn:length(prdtInfo.rList) div 4}" />
				<c:forEach items="${prdtInfo.rList}" var="prdt1" varStatus="status" end="4">
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
					<div class="rList vBlock" data-type="rList"  data-value="${divCnt}" id ="rList_${divCnt}" style="display: none;">
						<div class="mItem recommend_con_Type02" data-type="<c:out value="${prdt1.PRDT_CD}"/>" style="width: 98%;height: 140px;margin-bottom:10px;">
							<div class="recommend_con_img01" align="center" style="display: inline-block;width:48%;height:130px;overflow: hidden;">
								<a href="javascript:;" class="img">
<c:choose>
						<c:when test="${fn:indexOf(prdt1.PRDT_IMG, '//') >=0 }">
						<img src="<c:out value="${prdt1.PRDT_IMG}"/>" alt="상품사진" style="width:100%;height:128px;" onerror="this.src='${staticRoot}/img/sample03.jpg'"/> 
</c:when>
						<c:otherwise>
									<img src="${upload}<c:out value="${prdt1.PRDT_IMG}"/>" alt="상품사진" style="width:100%;height:128px;" onerror="this.src='${staticRoot}/img/sample03.jpg'"/> 
</c:otherwise>
						</c:choose>
								</a>
							</div>
							<div class="recommend_con_txt01" style="display: inline-block;width:48%;height:130px;position:static;">
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
								<label class="maker" style="text-align: left;">
									<span style="color:#b71c1c;">
										<fmt:formatNumber value="${prdt1.SEL_PRICE}" groupingUsed="true"/>${sPrice}
									</span>
								</label>
								<label class="txt01" style="text-align: left;">
									<span style="height: 22px;overflow:hidden;">
										&nbsp;
									</span>
								</label>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</c:if>
	</div>
	<div class="confirmMsg vOff" id="confirmMsg" style="left: 80px;">
			<div class="all_bg"> </div>
			<div class="confirmMsg_content" style="width: 350px;height:200px;">
				<h1 class="blue_title">
					장바구니 담기
					<span class="close" onclick="closeDivPop('confirmMsg');" >
					</span>
				</h1>
				<div class="confirmMsg_substance">
					<h1 class="confirm_title1">
						상품이 장바구니에 담겼습니다.
					</h1>
					<h5 class="confirm_title2 margintop_10">
						바로 확인 하시겠습니까?
					</h5>
					<div class="margintop_20">
						<span class="confirm_btn1" onclick="_BT.moveUrl(_BT.SHOP.URL.Order.cart);">
							예
						</span>
						<span class="confirm_btn2" onclick="closeDivPop('confirmMsg');">
							아니오
						</span>
					</div>
				</div>
			</div>
		</div>		
		<script type="text/javascript" src="${staticRoot}/sdk/js/swiper.min.js"></script>  	
		<script type="text/javascript">
			var dupClick1 	= false; 
			var setCount 	= false; 
			var width		= 0;
			var height		= 0;
			$(function(){
		        $("#goTop").on("click",function(){ 
		            $('body,html').animate({
		                scrollTop: 0
		            }, 100);
		            return false;
		        });
		        $("#goBottom").on("click",function(){ 
		            $('body,html').animate({
		                scrollTop: $(document).height()
		            }, 100);
		            return false;
		        });
				$('#clickTmp').on('change', function() {
		    		var id = $(this).data('value');
		    		if( $(this).prop('checked')){
		    			$('.chk').prop('checked',true);
		    		}else{
		    			$('.chk').prop('checked', false) ;
		    		}
		    	});
				$(".mItem").on("mouseover", function() {
		            $(this).addClass("mOn");
				});
				$(".mItem").on("mouseout", function() {
		            $(this).removeClass("mOn");
				});
				$(".mItem").on("click", function(){  
					_BT.actFormSubmit("frm", "post", _BT.SHOP.URL.Search.View+"?pCode="+$(this).data("type")); 
				});
		        $(".sImg").on("click",function(){ 
					_BT.actFormSubmit("frm", "post", _BT.SHOP.URL.Search.View+"?pCode="+$(this).data("value")); 
		        });
				$('.ctg').on('click', function() {
		    		_BT.actFormSubmit('cFrm', 'POST', '<c:out value="${host}"/>/shop/search/cTeg?cTp='+$(this).data("type")+'&cCode='+$(this).data("value")); 
		    	});
		    	$('.goDetail').on('click', function() {
					$('#mStore').val( $(this).data('value') );
					_BT.actFormSubmit("tFrm", "POST",_BT.SHOP.URL.Search.mSearch); 
		    	});
				$('.extImg').on('click', function() {
					$('#show_pic').attr('src', $(this).attr('src'));
				});
				$('.prdtM').addClass('vOff');
		        $('#mView').on('click',function(){ 
					 if($('.prdtM').hasClass('vOff')){
						$('.prdtM').removeClass('vOff');
						$('#mView').text('리스트 접기 △')
						$('#mView').removeClass('mOn2_1');
						$('#mView').addClass('mOn2');
					 } else{
					 	$('.prdtM').addClass('vOff');
						$('#mView').text('상품 더보기 ▽')
						$('#mView').addClass('mOn2_1');
						$('#mView').removeClass('mOn2');
					 }
		        });
				$(".sub_option_input2").on("keyup",function(){ 
					var cnt 	= $(this).val();
					var amt = eval($('#P_'+$(this).data("type")+'_Amt').val());
	 				var type = '${prdtInfo.pInfo.PRDT_TP}';
		    		var regExp = /[^0-9]/gi;
		            if(regExp.test(cnt)) {
		                $(this).val(cnt.replace(regExp, ""));
		                $(this).focus();
		           	}
					var chk 	= eval($(this).val());	            
		            if(type == 'S' && chk > amt){
	 					alert("수량이 재고량보다 큽니다.");
	 					$(this).val('');
	 					$(this).focus();
						return false;
		            }
		            if(_BT.isEquals(cnt, "0")) {
	 					alert("수량에 0이상의 숫자를 입력해 주세요.");
	 					$(this).val('');
	 					$(this).focus();
						return false;
	 				}
					var amt = 0;
					$(".total_price_red, .total_price_red02").text(amt+" 원");
					$( ".sub_option_input2" ).each(function( i ) {
						if(!_BT.isEmpty($(this).val()) && $(this).val() > 0){
							amt += ( $(this).val() *  $('#'+$(this).attr('id')+'_Price').val());
						}
					});
					var amtTxt = amt+"";
					$(".total_price_red, .total_price_red02").text(amtTxt.replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,")+" 원");
					if(amt > 0){
						$(".join_form_btn").addClass("mOn2");
					}else{
						$(".join_form_btn").removeClass("mOn2");
					}
		            
				});
				$(".sub_option_input2").on("focusout",function(){
					var cnt 	= $(this).val();
					if(_BT.isEquals(cnt, "0")) {
	 					alert("수량에 0이상의 숫자를 입력해 주세요.");
	 					$(this).val('');
	 					$(this).focus();
	 				}else{	
						var amt = 0;
						$(".total_price_red, .total_price_red02").text(amt+" 원");
						$( ".sub_option_input2" ).each(function( i ) {
							if(!_BT.isEmpty($(this).val()) && $(this).val() > 0){
								amt += ( $(this).val() *  $('#'+$(this).attr('id')+'_Price').val());
							}
						});
						var amtTxt = amt+"";
						$(".total_price_red, .total_price_red02").text(amtTxt.replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,")+" 원");
						if(amt > 0){
							$(".join_form_btn").addClass("mOn2");
						}else{
							$(".join_form_btn").removeClass("mOn2");
						}
	 				}
				});
				$('.ctaImg').on('click', function() {
					if( dupClick1 ) {
						alert("처리중 입니다. 잠시만 기다려주세요.");
						return false;
					}
		    		dupClick1 = true;
					_BT.ajaxDataSubmit("post", _BT.SHOP.URL.Search.AjaxEbookPrdtList, {'eBookNo' : $(this).data("type")}, function(data) {
						dupClick1 = false;
						if($(data).size() > 0) {
							if(_BT.isEquals(data.code, "success")) {
								$('#ctl_dtl').empty();
								var prdt_Cd = '';
								var cnt = 0;
								for(var i=0; i<data.ebookPrdt.length; i++){
									if(prdt_Cd != data.ebookPrdt[i].PRDT_CD){
										prdt_Cd = data.ebookPrdt[i].PRDT_CD;			
									    var div = document.createElement('div');
									    div.id = data.ebookPrdt[i].PRDT_CD;
									    div.style.width= "130px";
									    div.style.display= "inline-block";
									    
									    div.className = 'dtl mItem hMouse';
									    div.onclick = function (e) { 
			                				_BT.actFormSubmit('frm', 'post', _BT.SHOP.URL.Search.View+'?pCode='+$(this).attr('id'));
		                              	};
<c:choose>
						<c:when test="${fn:indexOf(data.ebookPrdt[i].PRDT_IMG, '//') >=0 }">
	div.innerHTML = 
									    	 '<img src="'+data.ebookPrdt[i].PRDT_IMG+'" alt="상품사진" style="width:120px; height:120px;" onerror="this.src=${staticRoot}/img/sample03.jpg"/>'
									    					+ '<p class="alarm_txt" style="padding:5px 3px;font-size:13px;font-weight:bold;width:120px; overflow:hidden;">'
									    					+ data.ebookPrdt[i].PRDT_NM + '</p>'
									    					+ '<p class="alarm_txt" style="padding:5px 3px;width:120px; overflow:hidden;">'
									    					/* + '<label style="color:#3f51b5;font-weight:bold;padding-right:5px;">' + data.ebookPrdt[i].ORG_CD + '</label>'  */
									    					+ data.ebookPrdt[i].STNDRD
									    					+ '</p>'
	 								    					
									    					;
</c:when>
						<c:otherwise>
									    div.innerHTML = 
									    	 '<img src="${upload}/600'+data.ebookPrdt[i].PRDT_IMG+'" alt="상품사진" style="width:120px; height:120px;" onerror="this.src=${staticRoot}/img/sample03.jpg"/>'
									    					+ '<p class="alarm_txt" style="padding:5px 3px;font-size:13px;font-weight:bold;width:120px; overflow:hidden;">'
									    					+ data.ebookPrdt[i].PRDT_NM + '</p>'
									    					+ '<p class="alarm_txt" style="padding:5px 3px;width:120px; overflow:hidden;">'
									    					/* + '<label style="color:#3f51b5;font-weight:bold;padding-right:5px;">' + data.ebookPrdt[i].ORG_CD + '</label>'  */
									    					+ data.ebookPrdt[i].STNDRD
									    					+ '</p>'
	 								    					
									    					;
														
	</c:otherwise>
						</c:choose>								    					
									    $('#ctl_dtl').append(div);
										cnt++;
									}else{
	 									
	//									var inHtml = $('#'+data.ebookPrdt[i].PRDT_CD)[0].innerHTML ;
	//									inHtml += '<p class="alarm_txt" style="padding:5px 3px; width:256px; overflow:hidden;">' 
										/* + '<label style="color:#3f51b5;font-weight:bold;padding-right:5px;">' + data.ebookPrdt[i].ORG_CD + '</label>'  */
	//									+ data.ebookPrdt[i].STNDRD + "</p>";
	//									$('#'+data.ebookPrdt[i].PRDT_CD)[0].innerHTML = inHtml;
						
									}
								}			
								openDivPop('ctl');
							} else {
							}
						}
					},
					function(xhr, status, error) {
						dupClick1 = false;
						_BT.Console.debug(xhr);
					});	
		    	});			
				$(".sub_option_input3").on("keyup",function(){ 
					var cnt 	= $(this).val();
					var amt = eval($('#P2_'+$(this).data("type")+'_Amt').val());
	 				var type = '${prdtInfo.pInfo.PRDT_TP}';
		    		var regExp = /[^0-9]/gi;
		            if(regExp.test(cnt)) {
		                $(this).val(cnt.replace(regExp, ""));
		                $(this).focus();
		           	}
					var chk 	= eval($(this).val());	            
		            if(type == 'S' && chk > amt){
	 					alert("수량이 재고량보다 큽니다.");
	 					$(this).val('');
	 					$(this).focus();
						return false;
		            }
		            if(_BT.isEquals(cnt, "0")) {
	 					alert("수량에 0이상의 숫자를 입력해 주세요.");
	 					$(this).val('');
	 					$(this).focus();
						return false;
	 				}
					var amt = 0;
					$(".total_price_red03").text(amt+" 원");
					$( ".sub_option_input3" ).each(function( i ) {
						if(!_BT.isEmpty($(this).val()) && $(this).val() > 0){
							amt += ( $(this).val() *  $('#'+$(this).attr('id')+'_Price').val());
						}
					});
					var amtTxt = amt+"";
					$(".total_price_red03").text(amtTxt.replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,")+" 원");
					if(amt > 0){
						$(".join_form_btn").addClass("mOn2");
					}else{
						$(".join_form_btn").removeClass("mOn2");
					}
		            
				});
				$(".sub_option_input3").on("focusout",function(){
					var cnt 	= $(this).val();
					if(_BT.isEquals(cnt, "0")) {
	 					alert("수량에 0이상의 숫자를 입력해 주세요.");
	 					$(this).val('');
	 					$(this).focus();
	 				}else{	
						var amt = 0;
						$(".total_price_red03").text(amt+" 원");
						$( ".sub_option_input3" ).each(function( i ) {
							if(!_BT.isEmpty($(this).val()) && $(this).val() > 0){
								amt += ( $(this).val() *  $('#'+$(this).attr('id')+'_Price').val());
							}
						});
						var amtTxt = amt+"";
						$(".total_price_red03").text(amtTxt.replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,")+" 원");
						if(amt > 0){
							$(".join_form_btn").addClass("mOn2");
						}else{
							$(".join_form_btn").removeClass("mOn2");
						}
	 				}
				});
	<%--     
	/* 			
				var eDt = "${sale_end_dt}";
				if("N" != eDt){
					var YYYY = eDt.substring( 0, 4 );
					var tmp = eDt.substring( 4, 6 );
					var DD = eDt.substring( 6, 8 );
					var HH = eDt.substring( 8, 10 );
					var MM = (eval(tmp) < 11 ? '0' : '') + eval(tmp - 1) ; 
					$('#countdown').timeTo({
					    timeTo: new Date(YYYY, MM, DD, HH, '00'),
					    theme: "black",
					    displayCaptions: true,
					    fontSize: 25,
					    captionSize: 12
					}); 	        	
				}
				<c:choose>
					<c:when test="${prdtInfo.pInfo.PRDT_TP eq 'S'}">
						showTab('tab3');
					</c:when>
					<c:otherwise>
						showTab('tab1');
					</c:otherwise>
				</c:choose>		
	 */			
	--%>	
				setViewCnt();
				snedGAnaly({'type':'view'});
			});
			function setViewCnt(){
				if(setCount) return false;
				_BT.ajaxDataSubmit("post", _BT.SHOP.URL.Search.SetViewCnt, {
					prdtCd : '<c:out value="${prdtInfo.pInfo.PRDT_CD}"/>'
				},
				function(data) {
					setCount = true;
				},
				function(xhr, status, error) {
					setCount = false; 
				});	
			}
			function openDetail(id){
				if ( $("#"+id).is( ":hidden" ) ) {
					$("#"+id).slideDown("slow" );
				} else {
					$("#"+id).hide();
				}
			}
			function goStCare(){
				_BT.moveUrl(_BT.SHOP.URL.Helpdesk.Notice+"?bId=1000141");
			}
			function showTab(tabId){
				if(tabId == 'tab2' || tabId == 'tab3') $('#ctl').addClass('vOff');
				
				$(".tab").removeClass("tabOn");
				$(".tab_dtl").addClass("vOff");
				$("#"+tabId).addClass("tabOn");
				$("#dtl_"+tabId).removeClass("vOff");
			}
			function openDivPop(id){
				$('#'+id).removeClass('vOff'); 
			}
			function closeDivPop(id){
				$('#'+id).addClass('vOff');
			}
	   </script>
		<c:choose>
			<c:when test="${! empty userSession}">
				<script type="text/javascript">
					function addCart(){
						if( dupClick1 ) {
							alert("처리중 입니다. 잠시만 기다려주세요.");
							return false;
						}
						var p_id 		= $('#prdt_cd').attr('id');
						var p_val 		= $('#prdt_cd').val();
						var cnt 			= 0;
						var product = new Array(); 
						$('#frm').empty();
						$('.cartQy').each(function( i ) {
							if($(this).val()>0){
								$('#frm').append($('<input/>', {
								    type: 'hidden',
								    id: 'p_dtl_cd'+cnt,
								    name: 'p_dtl_cd'+cnt,
								    value : $(this).attr('name')
								}));
								$('#frm').append($('<input/>', {
								    type: 'hidden',
								    id: 'p_qy'+cnt,
								    name: 'p_qy'+cnt,
								    value : $(this).val()
								}));
								product[i] = new Array(); 
								product[i][0] =  $(this).data('name');
								product[i][1] =  $(this).data('maker');
								product[i][2] =  $(this).attr('name').split('@')[1];
								product[i][3] =  $(this).data('stndrd');
								product[i][4] =  $(this).data('price');
								product[i][5] =  $(this).val();
								cnt ++;
							}
						});
/* 						
						for(var i=0; i<params.length; i++){
							if(params[i].value > 0){
								$('#frm').append($('<input/>', {
								    type: 'hidden',
								    id: 'p_cd'+cnt,
								    name: 'p_cd'+cnt,
								    value : p_val
								}));
								$('#frm').append($('<input/>', {
								    type: 'hidden',
								    id: 'p_dtl_cd'+cnt,
								    name: 'p_dtl_cd'+cnt,
								    value : params[i].name
								}));
								$('#frm').append($('<input/>', {
								    type: 'hidden',
								    id: 'p_qy'+cnt,
								    name: 'p_qy'+cnt,
								    value : params[i].value
								}));
								product.set( i , {
									'code' : params[i].name
									,'stndrd' : $('#P_'+ i +'_Stndrd').val()
									,'qy' : params[i].value
									,'price' : $('#P_'+ i +'_Price').val()
								});
								cnt ++;
							}	
						}
 */						
						$('#frm').append($('<input/>', {
						    type: 'hidden',
						    id: 'cnt',
						    name: 'cnt',
						    value : cnt
						}));
						if(cnt == 0){
							alert('선택한 상품이 없습니다.\n\n장바구니에 담을 상품의 수량을 입력해 주세요.');
							return false;
						}
						dupClick1 = true; 
						_BT.ajaxCallbackSubmit('frm',  _BT.SHOP.URL.Order.addCart, function(data) {
							dupClick1 = false;
							if($(data).size() > 0) { 
								if(_BT.isEquals(data.code, 'success')){
									openDivPop('confirmMsg');
									snedGAnaly({
										'type':'cart',
										'product' : product  	
									});
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
					}		
					function writeQna(){
						if( dupClick1 ) {
							alert('처리중 입니다. 잠시만 기다려주세요.');
							return false;
						}
						if(_BT.isEmptyById('bbsCon',    '내용을 입력해 주세요.')) return false;
						dupClick1 = true; 
						_BT.ajaxCallbackSubmit('nFrm',  _BT.SHOP.URL.Helpdesk.PrdtQ, function(data) {
							dupClick1 = false;
							if($(data).size() > 0) { 
								if(_BT.isEquals(data.code, 'success')){
									alert('내용을 등록 완료 했습니다.\n\n담당자 확인 후 회신 드리겠습니다.');	
									$('#bbsCon').val('');
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
					}	
					function addFav(){
						if( dupClick1 ) {
							alert('처리중 입니다. 잠시만 기다려주세요.');
							return false;
						}
						var cnt = 0;
						$('#frm').empty();
						$('#frm').append($('<input/>', {
						    type: 'hidden',
						    id: 'procType',
						    name: 'procType',
						    value : 'addFav'
						}));
						$( ".chk" ).each(function( i ) {
							if($(this).attr("id") != 'clickTmp'){
								if(_BT.isChecked($(this).attr("id"))){
									var r = $(this).attr("id");
									$('#frm').append($('<input/>', {
									    type: 'hidden',
									    id: 'p_cd'+cnt,
									    name: 'p_cd'+cnt,
									    value : $(this).data("type")
									}));
									$('#frm').append($('<input/>', {
									    type: 'hidden',
									    id: 'p_dtl_cd'+cnt,
									    name: 'p_dtl_cd'+cnt,
									    value : $(this).data("value")
									}));
									cnt++;
								}
							}
						});
						$('#frm').append($('<input/>', {
						    type: 'hidden',
						    id: 'cnt',
						    name: 'cnt',
						    value : cnt
						}));
						if(_BT.isEquals(cnt,0)){
							alert("선택하신 상품이 없습니다.");
							return false;
						}
						if(!confirm('관심상품으로 등록시\n\n프로모션 정보, 재입고 알림 등 다양한 안내를 받으실 수 있습니다.\n\n관심상품 등록 하시겠습니까?')){return false;}
						dupClick1 = true; 
						_BT.ajaxCallbackSubmit('frm',  _BT.SHOP.URL.User.AddFav, function(data) {
							dupClick1 = false;
							if($(data).size() > 0) { 
								if(_BT.isEquals(data.code, 'success')){
									alert('내용을 등록 완료 했습니다.\n\n정보 > 찜한상품 화면에서 확인 가능 합니다.');	
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
					}	
				</script>   
			</c:when>
			<c:otherwise>
				<script type="text/javascript">
					function addCart(){
						alert('구매하시기 위해서는 로그인이 필요 합니다.');
						_BT.moveUrl(_BT.SHOP.URL.Common.goLogin);
						return false;
					}		
					function addFav(){
						alert('관심상품으로 등록하기 위해서는 로그인이 필요 합니다.');
						_BT.moveUrl(_BT.SHOP.URL.Common.goLogin);
						return false;
					}		
				</script>   
			</c:otherwise>
		</c:choose>
		<script type="text/javascript">
			function snedGAnaly(sAction) { 
				switch(sAction.type) {  
					case 'view':       
						ga('create', 'UA-97902014-1');
						ga('require', 'ec');    
						ga('ec:addProduct', {
							  'id': '${prdtInfo.pInfo.PRDT_CD}',
							  'name': '${prdtInfo.pInfo.PRDT_NM}',
							  'price': '${minPrice}',
							  'brand': '${prdtInfo.pInfo.MAKR_NM}',
							  'category': '${prdtInfo.cInfo.LEV5_NM}',
							  'position': 0
						});
						ga('ec:setAction', 'detail');
						ga('send', 'pageview');
					break;
					case 'cart':
						console.log(sAction);
						ga('create', 'UA-97902014-1');
						ga('require', 'ec');
						for(var i = 0; i < sAction.product.length; i++){
							ga('ec:addProduct', {
								  'id': sAction.product[i][2] ,
								  'name': sAction.product[i][0] ,
								  'price': sAction.product[i][4] ,
								  'brand': sAction.product[i][1] ,
								  'category': '${prdtInfo.cInfo.LEV5_NM}' ,
								  'variant': sAction.product[i][3] ,
								  'position': i,
								  'quantity': sAction.product[i][5]
							});
						}
						ga('ec:setAction', 'add');
						ga('send', 'event', 'detail view', 'click', 'addToCart');
					break;
				}
			}
		</script>
	    <script>
		    var swiper = new Swiper('.swiper-container', {
		        pagination: '.swiper-pagination',
		        nextButton: '.swiper-button-next',
		        prevButton: '.swiper-button-prev',
		        slidesPerView: 1,
		        centeredSlides: true,
		        paginationClickable: true,
		        spaceBetween: 30,
		        loop: true
		    });
	    </script>	