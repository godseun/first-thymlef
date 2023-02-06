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
			
			<%//각 품목 상세 설명화면 이동%>
			$(".recommend_con_Type01, .recommend_con_Type02").on("click", function(){  
				_BT.actFormSubmit("frm", "post", _BT.SHOP.URL.Search.View+"?pCode="+$(this).data("type")); 
			});
			
			$(".scrollPaging").on("click", function(){  
				if( dupClick1 ) {
					alert("처리중 입니다. 잠시만 기다려주세요.");
					return false;
				}
				var type = $(this).attr("id");
				$("#vTp").val(type);
				if( 
						parseInt($("#count_"+type).val()) <
						(parseInt($("#currentPage_"+type).val()) * parseInt($("#itemSize").val()))
				){
					alert("더이상 불러올 상품 리스트가 없습니다.");
					return false;
				}

				$("#currentPage_"+type).val(parseInt($("#currentPage_"+type).val())+1);
				$("#currentPage").val(parseInt($("#currentPage_"+type).val()));
				dupClick1 = true;
				//로딩이미지 출력
				$(".loading_img").fadeIn();
				$.ajax({
					url    : _BT.SHOP.URL.Search.AjaxList,
					method : "post",
					data   : $("#frm").serialize(),
					success: function(html){
						dupClick1 = false;
						if(html){
							var $moreItems = $(html).filter(".search_detail_prduct_data").children("div");
							var $itemBox = $("#DIV_"+$("#vTp").val());
							$moreItems.on("mouseover", function() {$(this).addClass("mOn");});
							$moreItems.on("mouseout", function() {$(this).removeClass("mOn");});
							$moreItems.on("click", function(){  
								_BT.actFormSubmit("frm", "post", _BT.SHOP.URL.Search.View+"?pCode="+$(this).data("type")); 
							});
							$($moreItems).animate({'top':'0','opacity':'1'}, 300, 'easeOutCubic').appendTo($itemBox);						
							$(".loading_img").fadeOut();
							
							if( parseInt($("#count_"+type).val()) <
									(parseInt($("#currentPage_"+type).val()) * parseInt($("#itemSize").val()))
							) {
								$("#curPage_"+type).text(parseInt($("#count_"+type).val()));
							}else {
								$("#curPage_"+type).text(parseInt($("#currentPage_"+type).val()) * parseInt($("#itemSize").val()));
							}
						} else {
							//$(".loading_img").html("<p>No more posts to show.</p>");
						}
					},
					error: function(){
						dupClick1 = false;
						$(".loading_img").fadeOut();
					}
				});
			});
		});
		function showTab(tabId){
			$(".tab").removeClass("tabOn");
			$(".tab_dtl").addClass("vOff");
			$("#"+tabId).addClass("tabOn");
			$("#dtl_"+tabId).removeClass("vOff");
		}
		function subSearch(type){
			if( dupClick1 ) {
				alert("처리중 입니다. 잠시만 기다려주세요.");
				return false;
			}

			$("#vTp").val(type);
			$("#currentPage").val('1');
			$("#currentPage_J").val('1');
			$("#currentPage_S").val('1');

			$("#sub_sValue").val(_BT.getTrimValue($("#sValue_J").val()));
			$("#sub_pName").val(_BT.getTrimValue($("#pName_J").val()));
			$("#sub_sBrand").val(_BT.getTrimValue($("#sBrand_J").val()));
			$("#sub_sStndrd").val(_BT.getTrimValue($("#sStndrd_J").val()));
			$("#sub_sModel").val(_BT.getTrimValue($("#sModel_J").val()));

			dupClick1 = true;
			//로딩이미지 출력
			$(".loading_img").fadeIn();
			$.ajax({
				url    : _BT.SHOP.URL.Search.AjaxList,
				method : "post",
				data   : $("#frm").serialize(),
				success: function(html){
					dupClick1 = false;
					if(html){
						$(".loading_img").fadeOut();
						var $moreItems = $(html).filter(".search_detail_prduct_data").children("div");
						var count = $(html).filter("data").attr("count");
						if($moreItems.length<1){
							alert("검색결과가 없습니다.\n\n다시 검색 바랍니다.");
							return false;
						}
						$("#DIV_"+$("#vTp").val()).empty();
						var $itemBox = $("#DIV_"+$("#vTp").val());
						$moreItems.on("mouseover", function() {$(this).addClass("mOn");});
						$moreItems.on("mouseout", function() {$(this).removeClass("mOn");});
						$moreItems.on("click", function(){  
							_BT.actFormSubmit("frm", "post", _BT.SHOP.URL.Search.View+"?pCode="+$(this).data("type")); 
						});
						$($moreItems).animate({'top':'0','opacity':'1'}, 300, 'easeOutCubic').appendTo($itemBox);						

						$("#count_"+type).val(count);
						var currentPage = parseInt($("#currentPage_"+type).val());
						var itemSize = parseInt($("#itemSize").val());
						if( count <
								(currentPage * itemSize)
						) {
							$("#curPage_"+type).text(count);
							$("#totCnt_"+type).text(count);
						}else {
							$("#totCnt_"+type).text(count);
							$("#curPage_"+type).text(currentPage * itemSize);
						}
					} else {
						//$(".loading_img").html("<p>No more posts to show.</p>");
					}
				},
				error: function(){
					dupClick1 = false;
					$(".loading_img").fadeOut();
				}
			});
		}
	</script>
	<div class="section" style="min-height:1200px;">
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
			<div style="width: 100%">
				<div class="loading_img" align="center" style="display: none;">
					<img src="${staticRoot}/img/common/loading.gif" />
				</div>			
			</div>
			<c:set var="curPage_txt" value="상품 더보기" />
			<c:set var="curPage_J" value="80" />
			<c:if  test="${result.count lt 80}">
				<c:set var="curPage_J" value="${result.count}" />
				<c:set var="curPage_txt" value="총 상품" />
			</c:if>
			<%//제휴상품 리스트%>
			<div class="recommend_content margintop_20" id="DIV_J">
				<c:forEach items="${result.resultList}" var="prdt1" varStatus="status">
					<div class="mItem recommend_con_Type01 <c:if test="${status.count%4 ne '0'}"> mg_10</c:if>" data-type="<c:out value="${prdt1.PRDT_CD}"/>">
						<div class="recommend_con_img01" align="center" style="overflow: hidden;">
							<a href="#" class="img">
								<img src="${upload}<c:out value="${prdt1.PRDT_IMG}"/>" alt="상품사진" style="width:auto;height:156px;" onerror="this.src='${staticRoot}/img/sample03.jpg'"/> 
							</a>
						</div>
						<div class="recommend_con_txt01">
							<h2 class="title01">
								<span><c:out value="${prdt1.PRDT_NM}"/></span>
							</h2>
							<label class="maker">
								<span><c:out value="${prdt1.MAKR_NM}"/></span>
							</label>
							<span class="price01">
								<span>
									<fmt:formatNumber value="${prdt1.SEL_PRICE}" groupingUsed="true"/>원
								원 ~</span>
							</span>
						</div>
					</div>
				</c:forEach>
			</div>
			<!-- 스크롤 데이터 로드 : 더이상 가져올 데이터가 없을 경우 아래 div 태그 숨김 -->
			<div style="width: 100%">
				<div class="loading_img" align="center" style="display: none;">
					<img src="${staticRoot}/img/common/loading.gif" />
				</div>			
			</div>
			<div class="more_bar margintop_10 marginbottom_10">
				<span class="scrollPaging" id="J">
					<c:out value="${curPage_txt}"/><label class="paddingleft_10">[ </label> <label id="curPage_J"> <c:out value="${curPage_J}"/> </label><label class="paddingleft_5">  /  </label><label id="totCnt_J"><fmt:formatNumber value="${result.count}" groupingUsed="true"/></label><label class="paddingleft_5"> ]</label>
				</span>
			</div>
		</div>
	</div>
