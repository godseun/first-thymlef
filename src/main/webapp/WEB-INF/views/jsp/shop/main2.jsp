<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ include file="/WEB-INF/views/common/layout/include/base.jsp" %>
		<script>
			$(function () {
				$('.pro_list01, .pro_list02, .item_list_border, .item_list_content01, .recommend_con_Type02').addClass('mItem');

				$('.mItem').on('mouseover', function () {
					$(this).addClass('mOn');
				});
				$('.mItem').on('mouseout', function () {
					$(this).removeClass('mOn');
				});

				$('.recommend_content1').on('mouseover', function () {
					$('.' + $(this).data('type') + '_nav').show();
				});
				$('.recommend_content1').on('mouseout', function () {
					$('.' + $(this).data('type') + '_nav').hide();
				});
			<%//각 품목 상세 설명화면 이동%>
					$('.main_pro01, .main_pro02_space01, .item_list_content, .item_list_content01, .item_list_content02, .recommend_con_Type02').on('click', function () {
						_BT.actFormSubmit('frm', 'post', _BT.SHOP.URL.Search.View + '?pCode=' + $(this).data('type'));
					});
			<%//카테고리별 상세검색 화면 이동%>
					$('.item_title').on('click', function () {
						$('#cCode').val($(this).data('type'));
						_BT.actFormSubmit('frm', 'GET', _BT.SHOP.URL.Search.CtgList);
					});
			<%//각 프로모션 상품 상세검색 화면이동%>
					/* 			
								$('.title_Type01').on('click', function(){  
									$('#sValue').val($(this).data('type')); //확인
									_BT.actFormSubmit('frm', 'GET', _BT.SHOP.URL.Search.PmList); 
								});
					 */
					$('.leftDiv').on('click', function () {
						var divBox = $(this).data('type');
						var cur = $('.' + divBox + '.vBlock').data('value');
						$('.' + divBox + '.vBlock').removeClass('vBlock');
						if ($('#' + divBox + '_' + (eval($(this).data('value')) + cur)).length == 0) {
							$('.' + divBox).last().addClass('vBlock');
						} else {
							$('#' + divBox + '_' + (eval($(this).data('value')) + cur)).addClass('vBlock');
						}
					});
				$('.rightDiv').on('click', function () {
					var divBox = $(this).data('type');
					var cur = $('.' + divBox + '.vBlock').data('value');
					$('.' + divBox + '.vBlock').removeClass('vBlock');
					if ($('#' + divBox + '_' + (eval($(this).data('value')) + cur)).length == 0) {
						$('#' + divBox + '_1').addClass('vBlock');
					} else {
						$('#' + divBox + '_' + (eval($(this).data('value')) + cur)).addClass('vBlock');
					}
				});
			});
		</script>
		<!-- Channel Plugin Scripts -->
		<c:choose>
			<c:when test="${!empty userSession}">
				<script>
					window.channelPluginSettings = {
						"plugin_id": "e5bbb164-563c-434b-a945-0ab47010ca9a",
						"user": {
							"id": "${userSession.usrId}",
							"name": "${userSession.usrNm}",
							"mobileNumber": "${userSession.mobile}",
							"meta": {
								"CUSTOM_VALUE_1": "${userSession.usrTp}"
							}
						}
					};
				</script>
			</c:when>
			<c:otherwise>
				<script>
					window.channelPluginSettings = {
						"plugin_id": "e5bbb164-563c-434b-a945-0ab47010ca9a"
					};
				</script>
			</c:otherwise>
		</c:choose>
		<script>
			/* (function () {
				var node = document.createElement('div');
				node.id = 'ch-plugin';
				document.body.appendChild(node);
				var async_load = function () {
					var s = document.createElement('script');
					s.type = 'text/javascript';
					s.async = true;
					s.src = '//cdn.channel.io/plugin/ch-plugin-web.js';
					s.charset = 'UTF-8';
					var x = document.getElementsByTagName('script')[0];
					x.parentNode.insertBefore(s, x);
				};
				if (window.attachEvent) {
					window.attachEvent('onload', async_load);
				} else {
					window.addEventListener('load', async_load, false);
				}
			})(); */
		</script>
		<!-- End Channel Plugin -->
		<div class="wid_1248">
			<form id="frm" name="frm">
				<input type="hidden" id="sValue" name="sValue" />
				<input type="hidden" id="pCode" name="pCode" />
				<input type="hidden" id="cCode" name="cCode" />
			</form>
			<div class="main_visual">
				<div class="Type01 cycle-slideshow" data-cycle-fx="scrollHorz" data-cycle-slides="> a"
					data-cycle-pager=".rolling_btn" data-cycle-pager-template="">
					<a href="javascript:;" class="img01">
						<img src="${staticRoot}/img/banner/main_img01.jpg" alt="메인비쥬얼" />
					</a>
					<a href="javascript:;" class="img01">
						<img src="${staticRoot}/img/banner/main_img02.jpg" alt="메인비쥬얼" />
					</a>

					<c:forEach items="${banners.mBn}" var="mBn" varStatus="status">
						<a href="javascript:;" class="img01">
							<img src="${upload}<c:out value=" ${mBn.bImg}" />" alt="메인비쥬얼" />
						</a>
					</c:forEach>
				</div>
				<div class="rolling_btn">
					<c:set var="bCnt" value="${(880-(fn:length(banners.mBn)*10)) div (fn:length(banners.mBn) + 2) }" />
					<c:forEach items="${banners.mBn}" var="mBn" varStatus="status">
						<c:if test="${status.count lt 3}">
							<span style="width:${bCnt-(bCnt%1)}px;">
							</span>
						</c:if>
						<span style="width:${bCnt-(bCnt%1)}px;">
						</span>
					</c:forEach>
				</div>
				<div class="Type02">
					<a href="javascript:;">
						<img src="${staticRoot}/img/banner/main_ban_01.jpg" alt="입점안내 배너" />
					</a>
					<a href="javascript:;">
						<img src="${staticRoot}/img/banner/main_ban_02.jpg" alt="회원가입 안내배너" />
					</a>
				</div>
			</div>
			<div class="main_content01">
				<h1 class="title_Type01" data-type="MDP">
					대화의 발견
				</h1>
				<div class="main_product01">
					<c:forEach items="${mdPprdt.md}" var="prdt1" varStatus="status" end="0">
						<div class="main_pro01" data-type="<c:out value=" ${prdt1.sPcd}" />">
						<div class="pro_list01">
							<div class="pro_img_con" align="center" style="overflow: hidden;">
								<img src="${upload}/<c:out value=" ${prdt1.sImg}" />" alt="상품사진" style="width:auto; max-width: 380px;
								height:314px;" onerror="this.src='${staticRoot}/img/sample03.jpg'"/>
							</div>
							<div class="pro_txt_con">
								<h2 class="title01">
									<span>
										<c:out value="${prdt1.sNm}" />
									</span>
								</h2>
								<label class="txt01">
									<span>
										<c:out value="${prdt1.sSt}" />&nbsp;
									</span>
								</label>
								<label class="maker">
									<span>
										<c:out value="${prdt1.sMk}" />
									</span>
								</label>
								<span class="price01">
									<span>
										<fmt:formatNumber value="${prdt1.sPrice}" groupingUsed="true" />원
									</span>
								</span>
							</div>
						</div>
				</div>
				</c:forEach>
				<div class="main_pro02">
					<div class="main_pro02_box01">
						<c:forEach items="${mdPprdt.md}" var="prdt1" varStatus="status" begin="1" end="4">
							<div class="main_pro02_space01" data-type="<c:out value=" ${prdt1.sPcd}" />">
							<div class="pro_list02">
								<div class="pro_img_con01" align="center" style="overflow: hidden;">
									<img src="${upload}<c:out value=" ${prdt1.sImg}" />" alt="상품사진" style="width:auto;height:126px;"
									onerror="this.src='${staticRoot}/img/sample03.jpg'"/>
								</div>
								<div class="pro_txt_con01">
									<h2 class="title01">
										<span>
											<c:out value="${prdt1.sNm}" />
										</span>
									</h2>
									<label class="txt01">
										<span>
											<c:out value="${prdt1.sSt}" />&nbsp;
										</span>
									</label>
									<label class="maker">
										<span>
											<c:out value="${prdt1.sMk}" />
										</span>
									</label>
									<span class="price01">
										<span>
											<fmt:formatNumber value="${prdt1.sPrice}" groupingUsed="true" />원
										</span>
									</span>
								</div>
							</div>
					</div>
					</c:forEach>
				</div>
				<div class="main_pro02_box02">
					<c:forEach items="${mdPprdt.md}" var="prdt1" varStatus="status" begin="5" end="8">
						<div class="main_pro02_space01" data-type="<c:out value=" ${prdt1.sPcd}" />">
						<div class="pro_list02">
							<div class="pro_img_con01" align="center" style="overflow: hidden;">
								<img src="${upload}<c:out value=" ${prdt1.sImg}" />" alt="상품사진" style="width:auto;height:126px;"
								onerror="this.src='${staticRoot}/img/sample03.jpg'"/>
							</div>
							<div class="pro_txt_con01">
								<h2 class="title01">
									<span>
										<c:out value="${prdt1.sNm}" />
									</span>
								</h2>
								<label class="txt01">
									<span>
										<c:out value="${prdt1.sSt}" />&nbsp;
									</span>
								</label>
								<label class="maker">
									<span>
										<c:out value="${prdt1.sMk}" />
									</span>
								</label>
								<span class="price01">
									<span>
										<fmt:formatNumber value="${prdt1.sPrice}" groupingUsed="true" />원
									</span>
								</span>
							</div>
						</div>
				</div>
				</c:forEach>
			</div>
		</div>
		</div>
		</div>
		<div class="ad_content01">
			<img src="${staticRoot}/img/ad/ad_img001.jpg" alt="광고배너" />
		</div>
		<div class="main_content01">
			<h1 class="title_Type01_1" data-type="CAP">
				카테고리별 기획상품
			</h1>



			<div class="main_list02 mBox1">
				<div class="item_title2" data-type="c10">
					<span>
						절 삭
						<label class="">
							바로가기 >
						</label>
					</span>
				</div>
				<div class="item_title3" data-type="c10">
					<div class="Type01 cycle-slideshow" data-cycle-fx="scrollHorz" data-cycle-slides="> a"
						data-cycle-pager=".rolling_ball" data-cycle-pager-template="">
						<a href="javascript:;" class="img01">
							<img alt="" src="${staticRoot}/img/tmp/007.jpg" width="560px;" height="600px;">
						</a>
						<a href="javascript:;" class="img01">
							<img alt="" src="${staticRoot}/img/tmp/007.jpg" width="560px;" height="600px;">
						</a>
						<a href="javascript:;" class="img01">
							<img alt="" src="${staticRoot}/img/tmp/007.jpg" width="560px;" height="600px;">
						</a>
					</div>
					<div class="caption">
						<div class="cycle-slideshow" data-cycle-fx="scrollHorz" data-cycle-slides="> strong" data-cycle-pager=""
							data-cycle-pager-template="">
							<strong class="promotion-title">
								무조건 자른다! 절삭공구
								<span class="promotion-description">공구특선</span>
							</strong>
							<strong class="promotion-title">
								우선 사고보자! 절삭 공구
								<span class="promotion-description">공구특선</span>
							</strong>
							<strong class="promotion-title">
								사고싶다 사고싶다! 절삭공구
								<span class="promotion-description">공구특선</span>
							</strong>
						</div>
					</div>
					<div class="rolling_ball">
						<span>
						</span>
						<span>
						</span>
						<span>
						</span>
					</div>
				</div>
				<div class="recommend_content1 margintop_20 marginleft_20" data-type="c10">
					<div class="leftDiv c10_nav" data-type="c10" data-value="-1" style="display: none;">
						<img src="${staticRoot}/img/common/left.jpg" alt="left" />
					</div>
					<div class="rightDiv c10_nav" data-type="c10" data-value="+1" style="display: none;">
						<img src="${staticRoot}/img/common/right.jpg" alt="right">
					</div>
					<c:set var="divCnt" value="1" />
					<c:set var="isFirst" value="0" />
					<c:set var="cnt" value="${fn:length(mdPprdt.c10) div 4}" />
					<c:forEach items="${mdPprdt.c10}" var="prdt1" varStatus="status">
						<c:if test="${isFirst eq '0'}">
							<div class="c10 vBlock" data-type="c10" data-value="${divCnt}" id="c10_${divCnt}" style="display: none;">
								<c:set var="isFirst" value="${isFirst +1}" />
						</c:if>
						<div class="recommend_con_Type02 mg_10" data-type="<c:out value=" ${prdt1.sPcd}" />">
						<div class="recommend_con_img01" align="center" style="overflow: hidden;">
							<img src="${upload}<c:out value=" ${prdt1.sImg}" />" style="width:auto; max-width: 281px;height:281px;"
							alt="샘플사진" onerror="this.src='${staticRoot}/img/sample03.jpg'"/>
						</div>
						<div class="recommend_con_txt01">
							<h2 class="title01">
								<span>
									<c:out value="${prdt1.sNm}" />
								</span>
							</h2>
							<label class="txt01">
								<span>
									<c:out value="${prdt1.sSt}" />&nbsp;
								</span>
							</label>
							<label class="txt01">
								<span>
									<c:out value="${prdt1.sMk}" />
								</span>
							</label>
							<span class="price01">
								<span>
									<fmt:formatNumber value="${prdt1.sPrice}" groupingUsed="true" />원
								</span>
							</span>
						</div>
				</div>
				<c:if test="${status.count % 4 eq '0' or status.count eq fn:length(mdPprdt.c10)}">
			</div>
			</c:if>
			<c:if test="${status.count % 4 eq '0' and divCnt lt cnt }">
				<c:set var="divCnt" value="${divCnt + 1}" />
				<div class="c10" data-type="c10" data-value="${divCnt}" id="c10_${divCnt}" style="display: none;">
			</c:if>
			</c:forEach>
		</div>
		</div>



		<div class="main_list02 mBox1">
			<div class="item_title2" data-type="c11">
				<span>
					작업<p style="margin-top: 15px; font-weight:bold;">용접/윤활</p>
					<label class="">
						바로가기 >
					</label>
				</span>
			</div>
			<div class="item_title3" data-type="c11">
				<div class="Type01 cycle-slideshow" data-cycle-fx="scrollHorz" data-cycle-slides="> a"
					data-cycle-pager=".rolling_ball" data-cycle-pager-template="">
					<a href="javascript:;" class="img01">
						<img alt="" src="${staticRoot}/img/tmp/007.jpg" width="560px;" height="600px;">
					</a>
					<a href="javascript:;" class="img01">
						<img alt="" src="${staticRoot}/img/tmp/007.jpg" width="560px;" height="600px;">
					</a>
					<a href="javascript:;" class="img01">
						<img alt="" src="${staticRoot}/img/tmp/007.jpg" width="560px;" height="600px;">
					</a>
				</div>
				<div class="caption">
					<div class="cycle-slideshow" data-cycle-fx="scrollHorz" data-cycle-slides="> strong" data-cycle-pager=""
						data-cycle-pager-template="">
						<strong class="promotion-title">
							무조건 자른다! 작업공구
							<span class="promotion-description">공구특선</span>
						</strong>
						<strong class="promotion-title">
							우선 사고보자! 작업공구
							<span class="promotion-description">공구특선</span>
						</strong>
						<strong class="promotion-title">
							사고싶다 사고싶다! 작업공구
							<span class="promotion-description">공구특선</span>
						</strong>
					</div>
				</div>
				<div class="rolling_ball">
					<span>
					</span>
					<span>
					</span>
					<span>
					</span>
				</div>
			</div>
			<div class="recommend_content1 margintop_20 marginleft_20" data-type="c11">
				<div class="leftDiv c11_nav" data-type="c11" data-value="-1" style="display: none;">
					<img src="${staticRoot}/img/common/left.jpg" alt="left" />
				</div>
				<div class="rightDiv c11_nav" data-type="c11" data-value="+1" style="display: none;">
					<img src="${staticRoot}/img/common/right.jpg" alt="right">
				</div>
				<c:set var="divCnt" value="1" />
				<c:set var="isFirst" value="0" />
				<c:set var="cnt" value="${fn:length(mdPprdt.c11) div 4}" />
				<c:forEach items="${mdPprdt.c11}" var="prdt1" varStatus="status">
					<c:if test="${isFirst eq '0'}">
						<div class="c11 vBlock" data-type="c11" data-value="${divCnt}" id="c11_${divCnt}" style="display: none;">
							<c:set var="isFirst" value="${isFirst +1}" />
					</c:if>
					<div class="recommend_con_Type02 mg_10" data-type="<c:out value=" ${prdt1.sPcd}" />">
					<div class="recommend_con_img01" align="center" style="overflow: hidden;">
						<img src="${upload}<c:out value=" ${prdt1.sImg}" />" style="width:auto; max-width: 281px;height:281px;"
						alt="샘플사진" onerror="this.src='${staticRoot}/img/sample03.jpg'"/>
					</div>
					<div class="recommend_con_txt01">
						<h2 class="title01">
							<span>
								<c:out value="${prdt1.sNm}" />
							</span>
						</h2>
						<label class="txt01">
							<span>
								<c:out value="${prdt1.sSt}" />&nbsp;
							</span>
						</label>
						<label class="txt01">
							<span>
								<c:out value="${prdt1.sMk}" />
							</span>
						</label>
						<span class="price01">
							<span>
								<fmt:formatNumber value="${prdt1.sPrice}" groupingUsed="true" />원
							</span>
						</span>
					</div>
			</div>
			<c:if test="${status.count % 4 eq '0' or status.count eq fn:length(mdPprdt.c11)}">
		</div>
		</c:if>
		<c:if test="${status.count % 4 eq '0' and divCnt lt cnt }">
			<c:set var="divCnt" value="${divCnt + 1}" />
			<div class="c11" data-type="c11" data-value="${divCnt}" id="c11_${divCnt}" style="display: none;">
		</c:if>
		</c:forEach>
		</div>
		</div>
		<div class="main_list02 mBox1">
			<div class="item_title2" data-type="c12">
				<span>
					전동<p style="margin-top: 15px; font-weight:bold;">에어/유압</p>
					<label class="">
						바로가기 >
					</label>
				</span>
			</div>
			<div class="item_title3" data-type="c12">
				<div class="Type01 cycle-slideshow" data-cycle-fx="scrollHorz" data-cycle-slides="> a"
					data-cycle-pager=".rolling_ball" data-cycle-pager-template="">
					<a href="javascript:;" class="img01">
						<img alt="" src="${staticRoot}/img/tmp/007.jpg" width="560px;" height="600px;">
					</a>
					<a href="javascript:;" class="img01">
						<img alt="" src="${staticRoot}/img/tmp/007.jpg" width="560px;" height="600px;">
					</a>
					<a href="javascript:;" class="img01">
						<img alt="" src="${staticRoot}/img/tmp/007.jpg" width="560px;" height="600px;">
					</a>
				</div>
				<div class="caption">
					<div class="cycle-slideshow" data-cycle-fx="scrollHorz" data-cycle-slides="> strong" data-cycle-pager=""
						data-cycle-pager-template="">
						<strong class="promotion-title">
							무조건 자른다! 전동 공구
							<span class="promotion-description">공구특선</span>
						</strong>
						<strong class="promotion-title">
							우선 사고보자! 전동 공구
							<span class="promotion-description">공구특선</span>
						</strong>
						<strong class="promotion-title">
							사고싶다 사고싶다! 전동 공구
							<span class="promotion-description">공구특선</span>
						</strong>
					</div>
				</div>
				<div class="rolling_ball">
					<span>
					</span>
					<span>
					</span>
					<span>
					</span>
				</div>
			</div>
			<div class="recommend_content1 margintop_20 marginleft_20" data-type="c12">
				<div class="leftDiv c12_nav" data-type="c12" data-value="-1" style="display: none;">
					<img src="${staticRoot}/img/common/left.jpg" alt="left" />
				</div>
				<div class="rightDiv c12_nav" data-type="c12" data-value="+1" style="display: none;">
					<img src="${staticRoot}/img/common/right.jpg" alt="right">
				</div>
				<c:set var="divCnt" value="1" />
				<c:set var="isFirst" value="0" />
				<c:set var="cnt" value="${fn:length(mdPprdt.c12) div 4}" />
				<c:forEach items="${mdPprdt.c12}" var="prdt1" varStatus="status">
					<c:if test="${isFirst eq '0'}">
						<div class="c12 vBlock" data-type="c12" data-value="${divCnt}" id="c12_${divCnt}" style="display: none;">
							<c:set var="isFirst" value="${isFirst +1}" />
					</c:if>
					<div class="recommend_con_Type02 mg_10" data-type="<c:out value=" ${prdt1.sPcd}" />">
					<div class="recommend_con_img01" align="center" style="overflow: hidden;">
						<img src="${upload}<c:out value=" ${prdt1.sImg}" />" style="width:auto; max-width: 281px;height:281px;"
						alt="샘플사진" onerror="this.src='${staticRoot}/img/sample03.jpg'"/>
					</div>
					<div class="recommend_con_txt01">
						<h2 class="title01">
							<span>
								<c:out value="${prdt1.sNm}" />
							</span>
						</h2>
						<label class="txt01">
							<span>
								<c:out value="${prdt1.sSt}" />&nbsp;
							</span>
						</label>
						<label class="txt01">
							<span>
								<c:out value="${prdt1.sMk}" />
							</span>
						</label>
						<span class="price01">
							<span>
								<fmt:formatNumber value="${prdt1.sPrice}" groupingUsed="true" />원
							</span>
						</span>
					</div>
			</div>
			<c:if test="${status.count % 4 eq '0' or status.count eq fn:length(mdPprdt.c12)}">
		</div>
		</c:if>
		<c:if test="${status.count % 4 eq '0' and divCnt lt cnt }">
			<c:set var="divCnt" value="${divCnt + 1}" />
			<div class="c12" data-type="c12" data-value="${divCnt}" id="c12_${divCnt}" style="display: none;">
		</c:if>
		</c:forEach>
		</div>
		</div>
		<div class="main_list02 mBox1">
			<div class="item_title2" data-type="c13">
				<span>
					측정<p style="margin-top: 15px; font-weight:bold;">화학/실험</p>
					<label class="">
						바로가기 >
					</label>
				</span>
			</div>
			<div class="item_title3" data-type="c13">
				<div class="Type01 cycle-slideshow" data-cycle-fx="scrollHorz" data-cycle-slides="> a"
					data-cycle-pager=".rolling_ball" data-cycle-pager-template="">
					<a href="javascript:;" class="img01">
						<img alt="" src="${staticRoot}/img/tmp/007.jpg" width="560px;" height="600px;">
					</a>
					<a href="javascript:;" class="img01">
						<img alt="" src="${staticRoot}/img/tmp/007.jpg" width="560px;" height="600px;">
					</a>
					<a href="javascript:;" class="img01">
						<img alt="" src="${staticRoot}/img/tmp/007.jpg" width="560px;" height="600px;">
					</a>
				</div>
				<div class="caption">
					<div class="cycle-slideshow" data-cycle-fx="scrollHorz" data-cycle-slides="> strong" data-cycle-pager=""
						data-cycle-pager-template="">
						<strong class="promotion-title">
							무조건 자른다! 전동 공구
							<span class="promotion-description">공구특선</span>
						</strong>
						<strong class="promotion-title">
							우선 사고보자! 전동 공구
							<span class="promotion-description">공구특선</span>
						</strong>
						<strong class="promotion-title">
							사고싶다 사고싶다! 전동 공구
							<span class="promotion-description">공구특선</span>
						</strong>
					</div>
				</div>
				<div class="rolling_ball">
					<span>
					</span>
					<span>
					</span>
					<span>
					</span>
				</div>
			</div>
			<div class="recommend_content1 margintop_20 marginleft_20" data-type="c13">
				<div class="leftDiv c13_nav" data-type="c13" data-value="-1" style="display: none;">
					<img src="${staticRoot}/img/common/left.jpg" alt="left" />
				</div>
				<div class="rightDiv c13_nav" data-type="c13" data-value="+1" style="display: none;">
					<img src="${staticRoot}/img/common/right.jpg" alt="right">
				</div>
				<c:set var="divCnt" value="1" />
				<c:set var="isFirst" value="0" />
				<c:set var="cnt" value="${fn:length(mdPprdt.c13) div 4}" />
				<c:forEach items="${mdPprdt.c13}" var="prdt1" varStatus="status">
					<c:if test="${isFirst eq '0'}">
						<div class="c13 vBlock" data-type="c13" data-value="${divCnt}" id="c13_${divCnt}" style="display: none;">
							<c:set var="isFirst" value="${isFirst +1}" />
					</c:if>
					<div class="recommend_con_Type02 mg_10" data-type="<c:out value=" ${prdt1.sPcd}" />">
					<div class="recommend_con_img01" align="center" style="overflow: hidden;">
						<img src="${upload}<c:out value=" ${prdt1.sImg}" />" style="width:auto; max-width: 281px;height:281px;"
						alt="샘플사진" onerror="this.src='${staticRoot}/img/sample03.jpg'"/>
					</div>
					<div class="recommend_con_txt01">
						<h2 class="title01">
							<span>
								<c:out value="${prdt1.sNm}" />
							</span>
						</h2>
						<label class="txt01">
							<span>
								<c:out value="${prdt1.sSt}" />&nbsp;
							</span>
						</label>
						<label class="txt01">
							<span>
								<c:out value="${prdt1.sMk}" />
							</span>
						</label>
						<span class="price01">
							<span>
								<fmt:formatNumber value="${prdt1.sPrice}" groupingUsed="true" />원
							</span>
						</span>
					</div>
			</div>
			<c:if test="${status.count % 4 eq '0' or status.count eq fn:length(mdPprdt.c13)}">
		</div>
		</c:if>
		<c:if test="${status.count % 4 eq '0' and divCnt lt cnt }">
			<c:set var="divCnt" value="${divCnt + 1}" />
			<div class="c13" data-type="c13" data-value="${divCnt}" id="c13_${divCnt}" style="display: none;">
		</c:if>
		</c:forEach>
		</div>
		</div>
		<div class="main_list02 mBox1">
			<div class="item_title2" data-type="c14">
				<span>
					산업안전
					<label class="">
						바로가기 >
					</label>
				</span>
			</div>
			<div class="item_title3" data-type="c14">
				<div class="Type01 cycle-slideshow" data-cycle-fx="scrollHorz" data-cycle-slides="> a"
					data-cycle-pager=".rolling_ball" data-cycle-pager-template="">
					<a href="javascript:;" class="img01">
						<img alt="" src="${staticRoot}/img/tmp/007.jpg" width="560px;" height="600px;">
					</a>
					<a href="javascript:;" class="img01">
						<img alt="" src="${staticRoot}/img/tmp/007.jpg" width="560px;" height="600px;">
					</a>
					<a href="javascript:;" class="img01">
						<img alt="" src="${staticRoot}/img/tmp/007.jpg" width="560px;" height="600px;">
					</a>
				</div>
				<div class="caption">
					<div class="cycle-slideshow" data-cycle-fx="scrollHorz" data-cycle-slides="> strong" data-cycle-pager=""
						data-cycle-pager-template="">
						<strong class="promotion-title">
							무조건 자른다! 전동 공구
							<span class="promotion-description">공구특선</span>
						</strong>
						<strong class="promotion-title">
							우선 사고보자! 전동 공구
							<span class="promotion-description">공구특선</span>
						</strong>
						<strong class="promotion-title">
							사고싶다 사고싶다! 전동 공구
							<span class="promotion-description">공구특선</span>
						</strong>
					</div>
				</div>
				<div class="rolling_ball">
					<span>
					</span>
					<span>
					</span>
					<span>
					</span>
				</div>
			</div>
			<div class="recommend_content1 margintop_20 marginleft_20" data-type="c14">
				<div class="leftDiv c14_nav" data-type="c14" data-value="-1" style="display: none;">
					<img src="${staticRoot}/img/common/left.jpg" alt="left" />
				</div>
				<div class="rightDiv c14_nav" data-type="c14" data-value="+1" style="display: none;">
					<img src="${staticRoot}/img/common/right.jpg" alt="right">
				</div>
				<c:set var="divCnt" value="1" />
				<c:set var="isFirst" value="0" />
				<c:set var="cnt" value="${fn:length(mdPprdt.c14) div 4}" />
				<c:forEach items="${mdPprdt.c14}" var="prdt1" varStatus="status">
					<c:if test="${isFirst eq '0'}">
						<div class="c14 vBlock" data-type="c14" data-value="${divCnt}" id="c14_${divCnt}" style="display: none;">
							<c:set var="isFirst" value="${isFirst +1}" />
					</c:if>
					<div class="recommend_con_Type02 mg_10" data-type="<c:out value=" ${prdt1.sPcd}" />">
					<div class="recommend_con_img01" align="center" style="overflow: hidden;">
						<img src="${upload}<c:out value=" ${prdt1.sImg}" />" style="width:auto; max-width: 281px;height:281px;"
						alt="샘플사진" onerror="this.src='${staticRoot}/img/sample03.jpg'"/>
					</div>
					<div class="recommend_con_txt01">
						<h2 class="title01">
							<span>
								<c:out value="${prdt1.sNm}" />
							</span>
						</h2>
						<label class="txt01">
							<span>
								<c:out value="${prdt1.sSt}" />&nbsp;
							</span>
						</label>
						<label class="txt01">
							<span>
								<c:out value="${prdt1.sMk}" />
							</span>
						</label>
						<span class="price01">
							<span>
								<fmt:formatNumber value="${prdt1.sPrice}" groupingUsed="true" />원
							</span>
						</span>
					</div>
			</div>
			<c:if test="${status.count % 4 eq '0' or status.count eq fn:length(mdPprdt.c14)}">
		</div>
		</c:if>
		<c:if test="${status.count % 4 eq '0' and divCnt lt cnt }">
			<c:set var="divCnt" value="${divCnt + 1}" />
			<div class="c14" data-type="c14" data-value="${divCnt}" id="c14_${divCnt}" style="display: none;">
		</c:if>
		</c:forEach>
		</div>
		</div>
		<div class="main_list02 mBox1">
			<div class="item_title2" data-type="c15">
				<span>
					운반<p style="margin-top: 15px; font-weight:bold;">하역/포장</p>
					<label class="">
						바로가기 >
					</label>
				</span>
			</div>
			<div class="item_title3" data-type="c15">
				<div class="Type01 cycle-slideshow" data-cycle-fx="scrollHorz" data-cycle-slides="> a"
					data-cycle-pager=".rolling_ball" data-cycle-pager-template="">
					<a href="javascript:;" class="img01">
						<img alt="" src="${staticRoot}/img/tmp/007.jpg" width="560px;" height="600px;">
					</a>
					<a href="javascript:;" class="img01">
						<img alt="" src="${staticRoot}/img/tmp/007.jpg" width="560px;" height="600px;">
					</a>
					<a href="javascript:;" class="img01">
						<img alt="" src="${staticRoot}/img/tmp/007.jpg" width="560px;" height="600px;">
					</a>
				</div>
				<div class="caption">
					<div class="cycle-slideshow" data-cycle-fx="scrollHorz" data-cycle-slides="> strong" data-cycle-pager=""
						data-cycle-pager-template="">
						<strong class="promotion-title">
							무조건 자른다! 전동 공구
							<span class="promotion-description">공구특선</span>
						</strong>
						<strong class="promotion-title">
							우선 사고보자! 전동 공구
							<span class="promotion-description">공구특선</span>
						</strong>
						<strong class="promotion-title">
							사고싶다 사고싶다! 전동 공구
							<span class="promotion-description">공구특선</span>
						</strong>
					</div>
				</div>
				<div class="rolling_ball">
					<span>
					</span>
					<span>
					</span>
					<span>
					</span>
				</div>
			</div>
			<div class="recommend_content1 margintop_20 marginleft_20" data-type="c15">
				<div class="leftDiv c15_nav" data-type="c15" data-value="-1" style="display: none;">
					<img src="${staticRoot}/img/common/left.jpg" alt="left" />
				</div>
				<div class="rightDiv c15_nav" data-type="c15" data-value="+1" style="display: none;">
					<img src="${staticRoot}/img/common/right.jpg" alt="right">
				</div>
				<c:set var="divCnt" value="1" />
				<c:set var="isFirst" value="0" />
				<c:set var="cnt" value="${fn:length(mdPprdt.c15) div 4}" />
				<c:forEach items="${mdPprdt.c15}" var="prdt1" varStatus="status">
					<c:if test="${isFirst eq '0'}">
						<div class="c15 vBlock" data-type="c15" data-value="${divCnt}" id="c15_${divCnt}" style="display: none;">
							<c:set var="isFirst" value="${isFirst +1}" />
					</c:if>
					<div class="recommend_con_Type02 mg_10" data-type="<c:out value=" ${prdt1.sPcd}" />">
					<div class="recommend_con_img01" align="center" style="overflow: hidden;">
						<img src="${upload}<c:out value=" ${prdt1.sImg}" />" style="width:auto; max-width: 281px;height:281px;"
						alt="샘플사진" onerror="this.src='${staticRoot}/img/sample03.jpg'"/>
					</div>
					<div class="recommend_con_txt01">
						<h2 class="title01">
							<span>
								<c:out value="${prdt1.sNm}" />
							</span>
						</h2>
						<label class="txt01">
							<span>
								<c:out value="${prdt1.sSt}" />&nbsp;
							</span>
						</label>
						<label class="txt01">
							<span>
								<c:out value="${prdt1.sMk}" />
							</span>
						</label>
						<span class="price01">
							<span>
								<fmt:formatNumber value="${prdt1.sPrice}" groupingUsed="true" />원
							</span>
						</span>
					</div>
			</div>
			<c:if test="${status.count % 4 eq '0' or status.count eq fn:length(mdPprdt.c15)}">
		</div>
		</c:if>
		<c:if test="${status.count % 4 eq '0' and divCnt lt cnt }">
			<c:set var="divCnt" value="${divCnt + 1}" />
			<div class="c15" data-type="c15" data-value="${divCnt}" id="c15_${divCnt}" style="display: none;">
		</c:if>
		</c:forEach>
		</div>
		</div>
		<div class="main_list02 mBox1">
			<div class="item_title2" data-type="c16">
				<span>
					전기/제어
					<label class="">
						바로가기 >
					</label>
				</span>
			</div>
			<div class="item_title3" data-type="c16">
				<div class="Type01 cycle-slideshow" data-cycle-fx="scrollHorz" data-cycle-slides="> a"
					data-cycle-pager=".rolling_ball" data-cycle-pager-template="">
					<a href="javascript:;" class="img01">
						<img alt="" src="${staticRoot}/img/tmp/007.jpg" width="560px;" height="600px;">
					</a>
					<a href="javascript:;" class="img01">
						<img alt="" src="${staticRoot}/img/tmp/007.jpg" width="560px;" height="600px;">
					</a>
					<a href="javascript:;" class="img01">
						<img alt="" src="${staticRoot}/img/tmp/007.jpg" width="560px;" height="600px;">
					</a>
				</div>
				<div class="caption">
					<div class="cycle-slideshow" data-cycle-fx="scrollHorz" data-cycle-slides="> strong" data-cycle-pager=""
						data-cycle-pager-template="">
						<strong class="promotion-title">
							무조건 자른다! 전동 공구
							<span class="promotion-description">공구특선</span>
						</strong>
						<strong class="promotion-title">
							우선 사고보자! 전동 공구
							<span class="promotion-description">공구특선</span>
						</strong>
						<strong class="promotion-title">
							사고싶다 사고싶다! 전동 공구
							<span class="promotion-description">공구특선</span>
						</strong>
					</div>
				</div>
				<div class="rolling_ball">
					<span>
					</span>
					<span>
					</span>
					<span>
					</span>
				</div>
			</div>
			<div class="recommend_content1 margintop_20 marginleft_20" data-type="c16">
				<div class="leftDiv c16_nav" data-type="c16" data-value="-1" style="display: none;">
					<img src="${staticRoot}/img/common/left.jpg" alt="left" />
				</div>
				<div class="rightDiv c16_nav" data-type="c16" data-value="+1" style="display: none;">
					<img src="${staticRoot}/img/common/right.jpg" alt="right">
				</div>
				<c:set var="divCnt" value="1" />
				<c:set var="isFirst" value="0" />
				<c:set var="cnt" value="${fn:length(mdPprdt.c16) div 4}" />
				<c:forEach items="${mdPprdt.c16}" var="prdt1" varStatus="status">
					<c:if test="${isFirst eq '0'}">
						<div class="c16 vBlock" data-type="c16" data-value="${divCnt}" id="c16_${divCnt}" style="display: none;">
							<c:set var="isFirst" value="${isFirst +1}" />
					</c:if>
					<div class="recommend_con_Type02 mg_10" data-type="<c:out value=" ${prdt1.sPcd}" />">
					<div class="recommend_con_img01" align="center" style="overflow: hidden;">
						<img src="${upload}<c:out value=" ${prdt1.sImg}" />" style="width:auto; max-width: 281px;height:281px;"
						alt="샘플사진" onerror="this.src='${staticRoot}/img/sample03.jpg'"/>
					</div>
					<div class="recommend_con_txt01">
						<h2 class="title01">
							<span>
								<c:out value="${prdt1.sNm}" />
							</span>
						</h2>
						<label class="txt01">
							<span>
								<c:out value="${prdt1.sSt}" />&nbsp;
							</span>
						</label>
						<label class="txt01">
							<span>
								<c:out value="${prdt1.sMk}" />
							</span>
						</label>
						<span class="price01">
							<span>
								<fmt:formatNumber value="${prdt1.sPrice}" groupingUsed="true" />원
							</span>
						</span>
					</div>
			</div>
			<c:if test="${status.count % 4 eq '0' or status.count eq fn:length(mdPprdt.c16)}">
		</div>
		</c:if>
		<c:if test="${status.count % 4 eq '0' and divCnt lt cnt }">
			<c:set var="divCnt" value="${divCnt + 1}" />
			<div class="c16" data-type="c16" data-value="${divCnt}" id="c16_${divCnt}" style="display: none;">
		</c:if>
		</c:forEach>
		</div>
		</div>
		<div class="main_list02 mBox1">
			<div class="item_title2" data-type="c17">
				<span>
					기계/배관
					<label class="">
						바로가기 >
					</label>
				</span>
			</div>
			<div class="item_title3" data-type="c17">
				<div class="Type01 cycle-slideshow" data-cycle-fx="scrollHorz" data-cycle-slides="> a"
					data-cycle-pager=".rolling_ball" data-cycle-pager-template="">
					<a href="javascript:;" class="img01">
						<img alt="" src="${staticRoot}/img/tmp/007.jpg" width="560px;" height="600px;">
					</a>
					<a href="javascript:;" class="img01">
						<img alt="" src="${staticRoot}/img/tmp/007.jpg" width="560px;" height="600px;">
					</a>
					<a href="javascript:;" class="img01">
						<img alt="" src="${staticRoot}/img/tmp/007.jpg" width="560px;" height="600px;">
					</a>
				</div>
				<div class="caption">
					<div class="cycle-slideshow" data-cycle-fx="scrollHorz" data-cycle-slides="> strong" data-cycle-pager=""
						data-cycle-pager-template="">
						<strong class="promotion-title">
							무조건 자른다! 전동 공구
							<span class="promotion-description">공구특선</span>
						</strong>
						<strong class="promotion-title">
							우선 사고보자! 전동 공구
							<span class="promotion-description">공구특선</span>
						</strong>
						<strong class="promotion-title">
							사고싶다 사고싶다! 전동 공구
							<span class="promotion-description">공구특선</span>
						</strong>
					</div>
				</div>
				<div class="rolling_ball">
					<span>
					</span>
					<span>
					</span>
					<span>
					</span>
				</div>
			</div>
			<div class="recommend_content1 margintop_20 marginleft_20" data-type="c17">
				<div class="leftDiv c17_nav" data-type="c17" data-value="-1" style="display: none;">
					<img src="${staticRoot}/img/common/left.jpg" alt="left" />
				</div>
				<div class="rightDiv c17_nav" data-type="c17" data-value="+1" style="display: none;">
					<img src="${staticRoot}/img/common/right.jpg" alt="right">
				</div>
				<c:set var="divCnt" value="1" />
				<c:set var="isFirst" value="0" />
				<c:set var="cnt" value="${fn:length(mdPprdt.c17) div 4}" />
				<c:forEach items="${mdPprdt.c17}" var="prdt1" varStatus="status">
					<c:if test="${isFirst eq '0'}">
						<div class="c17 vBlock" data-type="c17" data-value="${divCnt}" id="c17_${divCnt}" style="display: none;">
							<c:set var="isFirst" value="${isFirst +1}" />
					</c:if>
					<div class="recommend_con_Type02 mg_10" data-type="<c:out value=" ${prdt1.sPcd}" />">
					<div class="recommend_con_img01" align="center" style="overflow: hidden;">
						<img src="${upload}<c:out value=" ${prdt1.sImg}" />" style="width:auto; max-width: 281px;height:281px;"
						alt="샘플사진" onerror="this.src='${staticRoot}/img/sample03.jpg'"/>
					</div>
					<div class="recommend_con_txt01">
						<h2 class="title01">
							<span>
								<c:out value="${prdt1.sNm}" />
							</span>
						</h2>
						<label class="txt01">
							<span>
								<c:out value="${prdt1.sSt}" />&nbsp;
							</span>
						</label>
						<label class="txt01">
							<span>
								<c:out value="${prdt1.sMk}" />
							</span>
						</label>
						<span class="price01">
							<span>
								<fmt:formatNumber value="${prdt1.sPrice}" groupingUsed="true" />원
							</span>
						</span>
					</div>
			</div>
			<c:if test="${status.count % 4 eq '0' or status.count eq fn:length(mdPprdt.c17)}">
		</div>
		</c:if>
		<c:if test="${status.count % 4 eq '0' and divCnt lt cnt }">
			<c:set var="divCnt" value="${divCnt + 1}" />
			<div class="c17" data-type="c17" data-value="${divCnt}" id="c17_${divCnt}" style="display: none;">
		</c:if>
		</c:forEach>
		</div>
		</div>
		<div class="main_list02 mBox1">
			<div class="item_title2" data-type="c18">
				<span>
					사무<p style="margin-top: 15px; font-weight:bold;">생활/가전</p>
					<label class="">
						바로가기 >
					</label>
				</span>
			</div>
			<div class="item_title3" data-type="c18">
				<div class="Type01 cycle-slideshow" data-cycle-fx="scrollHorz" data-cycle-slides="> a"
					data-cycle-pager=".rolling_ball" data-cycle-pager-template="">
					<a href="javascript:;" class="img01">
						<img alt="" src="${staticRoot}/img/tmp/007.jpg" width="560px;" height="600px;">
					</a>
					<a href="javascript:;" class="img01">
						<img alt="" src="${staticRoot}/img/tmp/007.jpg" width="560px;" height="600px;">
					</a>
					<a href="javascript:;" class="img01">
						<img alt="" src="${staticRoot}/img/tmp/007.jpg" width="560px;" height="600px;">
					</a>
				</div>
				<div class="caption">
					<div class="cycle-slideshow" data-cycle-fx="scrollHorz" data-cycle-slides="> strong" data-cycle-pager=""
						data-cycle-pager-template="">
						<strong class="promotion-title">
							무조건 자른다! 전동 공구
							<span class="promotion-description">공구특선</span>
						</strong>
						<strong class="promotion-title">
							우선 사고보자! 전동 공구
							<span class="promotion-description">공구특선</span>
						</strong>
						<strong class="promotion-title">
							사고싶다 사고싶다! 전동 공구
							<span class="promotion-description">공구특선</span>
						</strong>
					</div>
				</div>
				<div class="rolling_ball">
					<span>
					</span>
					<span>
					</span>
					<span>
					</span>
				</div>
			</div>
			<div class="recommend_content1 margintop_20 marginleft_20" data-type="c18">
				<div class="leftDiv c18_nav" data-type="c18" data-value="-1" style="display: none;">
					<img src="${staticRoot}/img/common/left.jpg" alt="left" />
				</div>
				<div class="rightDiv c18_nav" data-type="c18" data-value="+1" style="display: none;">
					<img src="${staticRoot}/img/common/right.jpg" alt="right">
				</div>
				<c:set var="divCnt" value="1" />
				<c:set var="isFirst" value="0" />
				<c:set var="cnt" value="${fn:length(mdPprdt.c18) div 4}" />
				<c:forEach items="${mdPprdt.c18}" var="prdt1" varStatus="status">
					<c:if test="${isFirst eq '0'}">
						<div class="c18 vBlock" data-type="c18" data-value="${divCnt}" id="c18_${divCnt}" style="display: none;">
							<c:set var="isFirst" value="${isFirst +1}" />
					</c:if>
					<div class="recommend_con_Type02 mg_10" data-type="<c:out value=" ${prdt1.sPcd}" />">
					<div class="recommend_con_img01" align="center" style="overflow: hidden;">
						<img src="${upload}<c:out value=" ${prdt1.sImg}" />" style="width:auto; max-width: 281px;height:281px;"
						alt="샘플사진" onerror="this.src='${staticRoot}/img/sample03.jpg'"/>
					</div>
					<div class="recommend_con_txt01">
						<h2 class="title01">
							<span>
								<c:out value="${prdt1.sNm}" />
							</span>
						</h2>
						<label class="txt01">
							<span>
								<c:out value="${prdt1.sSt}" />&nbsp;
							</span>
						</label>
						<label class="txt01">
							<span>
								<c:out value="${prdt1.sMk}" />
							</span>
						</label>
						<span class="price01">
							<span>
								<fmt:formatNumber value="${prdt1.sPrice}" groupingUsed="true" />원
							</span>
						</span>
					</div>
			</div>
			<c:if test="${status.count % 4 eq '0' or status.count eq fn:length(mdPprdt.c18)}">
		</div>
		</c:if>
		<c:if test="${status.count % 4 eq '0' and divCnt lt cnt }">
			<c:set var="divCnt" value="${divCnt + 1}" />
			<div class="c18" data-type="c18" data-value="${divCnt}" id="c18_${divCnt}" style="display: none;">
		</c:if>
		</c:forEach>
		</div>
		</div>
		<%-- <div class="ad_content02">
			<div class="ad_list_Type01">
				<div class="ad_con_Type">
					<div class="ad_img_con01">
						<a href="javascript:;">
							<img src="${staticRoot}/img/ad/ad_img02.jpg" alt="광고배너" />
						</a>
					</div>
					<div class="ad_img_txt01">
						<h4>
							<a href="javascript:;">
								<span>100% 무상교환 18V 임팩 이벤트</span>
							</a>
						</h4>
					</div>
				</div>
			</div>
			<div class="ad_list_Type02">
				<div class="ad_con_Type">
					<div class="ad_img_con01">
						<a href="javascript:;">
							<img src="${staticRoot}/img/ad/ad_img03.jpg" alt="광고배너" />
						</a>
					</div>
					<div class="ad_img_txt01">
						<h4>
							<a href="javascript:;">
								<span>홈페이지 리뉴얼 오픈기념 이벤트!</span>
							</a>
						</h4>
					</div>
				</div>
			</div>
			</div>
			<div class="main_content03">
				<h1 class="title_Type01" data-type="HIP">
					인기상품
				</h1>
				<div class="main_list01">
					<c:forEach items="${prdtList.hit}" var="prdt1" varStatus="status" end="5">
						<div class="<c:choose><c:when test=" ${status.count eq 1}">item_list_content01</c:when>
							<c:otherwise>item_list_content02</c:otherwise>
							</c:choose>" data-type="
							<c:out value="${prdt1.PRDT_CD}" />">
							<div class="<c:if test=" ${status.count ne 1}">item_list_border</c:if>">
								<div class="item_img_con" align="center" style="overflow: hidden;">
									<c:choose>
										<c:when test="${fn:indexOf(prdt1.PRDT_IMG, '//') >=0 }">
											<img src="<c:out value=" ${prdt1.PRDT_IMG}" />" alt="상품사진" style="width:auto;height:146px;"
											onerror="this.src='${staticRoot}/img/sample03.jpg'"/>
										</c:when>
										<c:otherwise>
											<img src="${staticRoot}/prduct<c:out value=" ${prdt1.PRDT_IMG}" />" alt="상품사진"
											style="width:auto;height:146px;" onerror="this.src='${staticRoot}/img/sample03.jpg'"/>
										</c:otherwise>
									</c:choose>
								</div>
								<div class="pro_txt_con01">
									<h2 class="title01">
										<span>
											<c:out value="${prdt1.PRDT_NM}" />
										</span>
									</h2>
									<label class="txt01">
										<span>
											<c:out value="${prdt1.STNDRD}" />&nbsp;
										</span>
									</label>
									<label class="maker">
										<span>
											<c:out value="${prdt1.MAKR_NM}" />
										</span>
									</label>
									<span class="price01">
										<span>
											<c:out value="${prdt1.F_SEL_PRICE}" />원
										</span>
									</span>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
			--%>


			<div class="main_content04">
				<div class="wid_1248">
					<h1 class="con_title01">
						대한민국 대표 공구쇼핑몰,<span><img src="${staticRoot}/img/logo_01.png" alt="" /></span>
					</h1>
					<p class="con_txt_Type01">
						가지고 있는 장점을 극대화하고 전략적인 기술 및 협력사 등과 제휴를 통한<br />
						단점을 보완시키는 겸손한 자세로 성공의 결과를 이끌어 내기 위하여 노력하겠습니다.
					</p>
					<div class="info_content01">
						<div class="info_con01">
							<p>
								<img src="${staticRoot}/img/main_txt_img04.png" alt="검증된 제품" />
							</p>
							<p class="txt01">
								검증된 제품
							</p>
							<p class="txt02">
								대화에 등록된 모든 품목은 사업자의<br />실재고품으로 기존 개인간 거래시 발생할 수<br />있는 문제들을 원천적으로 차단하였습니다.
							</p>
						</div>
						<div class="info_con01">
							<p>
								<img src="${staticRoot}/img/main_txt_img05.png" alt="편의성" />
							</p>
							<p class="txt01">
								편의성
							</p>
							<p class="txt02">
								전국의 공구매장에 보유중인 다양한<br />품목들을 대화안에서 한번에<br />만나보실 수 있습니다.
							</p>
						</div>
						<div class="info_con01">
							<p>
								<img src="${staticRoot}/img/main_txt_img06.png" alt="다양성" />
							</p>
							<p class="txt01">
								다양성
							</p>
							<p class="txt02">
								국내 유통되고 있는 일반품목 외에<br />합리적인 롱테일 상품을<br />지속적으로 소개합니다.
							</p>
						</div>
						<div class="info_con01">
							<p>
								<img src="${staticRoot}/img/main_txt_img07.png" alt="접근성" />
							</p>
							<p class="txt01">
								접근성
							</p>
							<p class="txt02">
								국내외 유통되는 13만 가지 공구<br />품목들을 카테고리별로 세분화하여<br />편리하게 찾을 수 있습니다.
							</p>
						</div>

					</div>
				</div>
			</div>