<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/layout/include/base.jsp" %>
	 <style>
			.qnb{position:absolute;top:-1111px;left:-15px;display:none;}
			.s_price{z-index: 999;position:relative;}
			.s_price img{vertical-align: top;display:block;}
			.s_price span{display:block;}
			.s_price .bn_toolman{width:110px;/*height:191px;*/}
			.s_price .bn_toolman a{position:fixed;bottom:-240px;transition:bottom .4s cubic-bezier(0.895, -0.600, 0.125, 1.650);}
			.s_price .bn_toolman.show a{bottom:-5px;}
	</style>
 	<script>
		var D1 = 1;
 		var D2 = 1;
 		var D3 = 1;
 		var D4 = 1;
 		var D5 = 1;
 		var D6 = 1;
 		
		$(function(){ 
			$('.pro_list01, .pro_list02, .item_list_border, .item_list_content01, .recommend_con_Type02').addClass('mItem');
			
			$('.mItem').on('mouseover', function() {
	            $(this).addClass('mOn');
			});
			$('.mItem').on('mouseout', function() {
	            $(this).removeClass('mOn');
			});
			$('.recommend_content1').on('mouseover', function() {
	            $('.' + $(this).data('type') +'_nav').show();
			});			
			$('.recommend_content1').on('mouseout', function() {
	            $('.' + $(this).data('type') +'_nav').hide();
			});			
			$('.recommend_con_Type03_1, .recommend_con_Type03').on('mouseover', function() {
	            $(this).addClass('mOn');
	            $('#off_' + $(this).attr('id')).hide();
	            $('#on_' + $(this).attr('id')).show();
			});			
			$('.recommend_con_Type03_1, .recommend_con_Type03').on('mouseout', function() {
	            $(this).removeClass('mOn');
	            $('#off_' + $(this).attr('id')).show();
	            $('#on_' + $(this).attr('id')).hide();
			});			
			<%//각 품목 상세 설명화면 이동%>
			$('.NOW, .main_pro01, .main_pro02_space01, .item_list_content, .item_list_content01, .item_list_content02, .recommend_con_Type02').on('click', function(){ 
				_BT.actFormSubmit('frm', 'post', _BT.SHOP.URL.Search.View+'?pCode='+$(this).data('type')); 
			});
			<%//카테고리별 상세검색 화면 이동%>
			$('.item_title').on('click', function(){  
				$('#cCode').val($(this).data('type'));
				_BT.actFormSubmit('frm', 'GET', _BT.SHOP.URL.Search.CtgList); 
			});			
			<%//각 프로모션 상품 상세검색 화면이동%>
			$('.bnImg').on('click', function(){  
				var type = $(this).data('type');
				var value = $(this).data('value');
				if(type == 'MCB'){
					$('#pCode').val(value);
					_BT.actFormSubmit('frm', 'post',_BT.SHOP.URL.Helpdesk.CtgPromoDtl); 
				}else if(type == 'MSB'){
					var value2 = $(this).data('value2');
					if(!_BT.isEmpty(value)){
						$('#pCode').val(value);
						_BT.actFormSubmit('frm', 'post', _BT.SHOP.URL.Helpdesk.PromoDtl); 
					}else if(!_BT.isEmpty(value2)){
						_BT.moveUrl(_BT.SHOP.URL.Helpdesk.Notice+"?bId="+value2);
					}
				}else if(type == 'TMR'){
					_BT.actFormSubmit("tmFrm", "POST",_BT.SHOP.URL.Search.mSearch); 
				}
			});
			<%//대화의 발견 상세 페이지 이동%>
			$('.recommend_con_Type03_1, .recommend_con_Type03').on('click', function(){ 
				var value = $(this).data('value');
				var type = $(this).data('type');
				if(value == ''){
					$('#pCode').val(type);
					_BT.actFormSubmit('frm', 'post',_BT.SHOP.URL.Helpdesk.CtgPromoDtl); 
				}else{
					_BT.actFormSubmit('frm', 'post', _BT.SHOP.URL.Search.View+'?pCode='+value); 
				}
			});			
			$( '.leftDiv' ).on('click', function(){  
				var divBox = $(this).data('type');
				var cur = $('.' + divBox +'.vBlock').data('value');
				$('.' + divBox + '.vBlock').removeClass('vBlock'); 
				$('.' + divBox + '_p').removeClass('on');
				if($('#'+ divBox +'_' + ( eval($(this).data('value')) + cur )).length == 0){
					$('.'+divBox).last().addClass('vBlock'); 
					$('.'+divBox+'_p').last().addClass('on');
				}else{
					$('#'+ divBox +'_' + ( eval($(this).data('value')) + cur ) ).addClass('vBlock');
					$('#'+divBox+'_p'+'_'+( eval($(this).data('value')) + cur )).addClass('on');
				}
			});			
			$( '.rightDiv' ).on('click', function(){
				var divBox = $(this).data('type');
				var cur = $('.' + divBox +'.vBlock').data('value');
				$('.' + divBox +'.vBlock').removeClass('vBlock'); 
				$('.' + divBox + '_p').removeClass('on');
				if($('#'+ divBox +'_' + ( eval($(this).data('value')) + cur )).length == 0){
					$('#'+ divBox +'_1').addClass('vBlock');
					$('#'+divBox+'_p_1').addClass('on');
				}else{
					$('#'+ divBox +'_' + ( eval($(this).data('value')) + cur )).addClass('vBlock');
					$('#'+divBox+'_p'+'_'+( eval($(this).data('value')) + cur )).addClass('on');
				}
			});		
			
			$( '.rightPage' ).on('click', function(){  
				var divBox = $(this).data('type');
				var cur = $('.' + divBox +'.vBlock').data('value');
				$('.' + divBox + '.vBlock').removeClass('vBlock'); 
				$('.' + divBox + '_p').removeClass('on');
				if($('#'+ divBox +'_' + ( eval($(this).data('value')) + cur )).length == 0){
					$('.'+divBox).last().addClass('vBlock'); 
					$('.'+divBox+'_p').last().addClass('on');
				}else{
					$('#'+ divBox +'_' + ( eval($(this).data('value')) + cur ) ).addClass('vBlock');
					$('#'+divBox+'_p'+'_'+( eval($(this).data('value')) + cur )).addClass('on');
				}
			});			
			$( '.leftPage' ).on('click', function(){
				var divBox = $(this).data('type');
				var cur = $('.' + divBox +'.vBlock').data('value');
				$('.' + divBox +'.vBlock').removeClass('vBlock'); 
				$('.' + divBox + '_p').removeClass('on');
				if($('#'+ divBox +'_' + ( eval($(this).data('value')) + cur )).length == 0){
					$('#'+ divBox +'_1').addClass('vBlock');
					$('#'+divBox+'_p_1').addClass('on');
				}else{
					$('#'+ divBox +'_' + ( eval($(this).data('value')) + cur )).addClass('vBlock');
					$('#'+divBox+'_p'+'_'+( eval($(this).data('value')) + cur )).addClass('on');
				}
			});	


			$( '.maxPage' ).on('click', function(){  
				var divBox = $(this).data('type');

				$('.' + divBox + '.vBlock').removeClass('vBlock'); 
				$('.' + divBox + '_p').removeClass('on');
				$('.'+divBox).last().addClass('vBlock'); 
				$('.'+divBox+'_p').last().addClass('on');

			});			
			$( '.firstPage' ).on('click', function(){
				var divBox = $(this).data('type');

				$('.' + divBox +'.vBlock').removeClass('vBlock'); 
				$('.' + divBox + '_p').removeClass('on');
				$('#'+ divBox +'_1').addClass('vBlock');
				$('#'+divBox+'_p_1').addClass('on');
			});	


			$('.pageing2 span label').on('click', function(){
				var cur = this.innerText * 1;
				var divBox = this.closest('.recommend_content1').dataset.type;
				
				$('.' + divBox +'.vBlock').removeClass('vBlock'); 
				$('.' + divBox + '_p').removeClass('on');
				

				document.getElementById(divBox + '_' + cur).classList.add('vBlock');
				document.getElementById(divBox + '_p_' + cur).classList.add('on');


				switch(divBox) {
					case 'D1':
						D1 = cur;
						break;
					case 'D2':
						D2 = cur;
						break;
					case 'D3':
						D3 = cur;
						break;
					case 'D4':
						D4 = cur;
						break;
					case 'D5':
						D5 = cur;
						break;
					case 'D6':
						D6 = cur;
						break;
				}
			});

			checkPopAlram();
		});
		
		function checkPopAlram(){
			_BT.ajaxDataSubmit("post", _BT.SHOP.URL.Helpdesk.PopList, {}, function(data) {
				if($(data).size() > 0) {
					if(_BT.isEquals(data.code, "success")) {
						var d = new Date();
						var ymd = d.getFullYear() + (d.getMonth()<9?'0':'') + (d.getMonth() + 1) + (d.getMonth()<10?'0':'')  + d.getDate();
						var noMr = true;
						var noList = '';
						if(_BT.isEquals(ymd,_BT.Cookie.get('noMr')))  {
							noMr = false;
							noList = _BT.Cookie.get('noMrList'); 
						}
						for(var i=0; i< data.list.length; i++){
							var id = data.list[i].ARTICLE_ID;  
							if(noList.indexOf(id) < 0 ){ 
								var t = 'PopAlarm' + id;
								var x = data.list[i].CONTENT.split('@')[0];
								var y = 83 + parseInt(data.list[i].CONTENT.split('@')[1]);					
								$('#P_ID').val(data.list[i].ARTICLE_ID);			
								$('#P_IMG').val(data.list[i].DETAIL_IMG);				
								$('#P_TITLE').val(data.list[i].TITLE);				
								_BT.openPopup('', t, x, y, 'no', 'no');					
								$('#popupFrm').attr('method', 'POST').attr('target', t).attr('action', _BT.SHOP.URL.Helpdesk.PopMsg).submit();		
							}
						}
					}
				}
			},
			function(xhr, status, error) {
			});
		}		
	</script>
	<div class="wid_no_chg">
		<form id="popupFrm" name="popupFrm">
			<input type="hidden" id="P_ID" name="P_ID" value=""/>
			<input type="hidden" id="P_IMG" name="P_IMG" value=""/>
			<input type="hidden" id="P_TITLE" name="P_TITLE" value=""/>
		</form>
		<form id="tmFrm" name="tmFrm">
			<input type="hidden" name="mValue" value="#툴맨추천"/>
		</form>
		<form id="frm" name="frm">
			<input type="hidden" id="sValue" name="sValue" />
			<input type="hidden" id="pCode" name="pCode" />
			<input type="hidden" id="cCode" name="cCode" />
		</form>
		<c:set var="cnt_mBn" value="0" />
		<c:set var="TS_SDT" value="A"/>
		<c:set var="TS_EDT" value="A"/>
		<div class="main_visual">
			<div class="Type01 cycle-slideshow" data-cycle-fx="scrollHorz" data-cycle-slides="> a" data-cycle-pager=".rolling_pager" style="overflow: hidden;">
				<!-- <a href="javascript:;" class="img01 bnImg" data-type="MSB" data-value="" data-value2="1000138"> -->
				<a href="javascript:;" class="img01 bnImg" data-type="" data-value="" data-value2="1000138">
					<img src="${staticRoot}/img/banner/main_img01.png" alt="메인비쥬얼" />
				</a>
<%-- 				
				<a href="javascript:;" class="img01 bnImg" data-type="MSB" data-value="" data-value2="1000140">
					<img src="${staticRoot}/img/banner/main_img02.jpg" alt="메인비쥬얼" />
				</a>
 --%>				
				<c:forEach items="${banners}" var="mBn" varStatus="status">
					<c:if test="${mBn.bTp eq 'MSB'}">
						<c:set var="cnt_mBn" value="${cnt_mBn + 1}" />
						<a href="javascript:;" class="img01 bnImg" data-type="${mBn.bTp}" data-value="${mBn.pId}" data-value2="${mBn.sRelNo}">
							<img src="${upload}<c:out value="${mBn.bImg}"/>" alt="메인비쥬얼" />
						</a>
					</c:if>
					<c:if test="${mBn.bTp eq 'TSP'}">
						<fmt:parseDate value="${mBn.sDt}" var="TS_SDT" pattern="yyyyMMddHHmmss"/>
						<fmt:parseDate value="${mBn.eDt}" var="TS_EDT" pattern="yyyyMMddHHmmss"/>
					</c:if>
				</c:forEach>				
				<div class="rolling_pager" style="margin-top: -30px; text-align: right;"></div>
			</div>
			<%-- <div class="Type02">
				<!-- <a href="javascript:;" class="NOW" data-type="ST30291356"> -->
				<a href="javascript:;" class="" data-type="ST30291356">
					<img src="${staticRoot}/img/banner/main_ban_01.jpg?v=1" alt="대화가입 프로모션 배너" />
				</a>
				<img src="${staticRoot}/img/banner/main_ban_03.jpg" alt="무배 안내" style="margin-top: 20px;"/>
			</div> --%>
		</div>
	
		<c:if test="${fn:length(mdPprdt.tsp) ge 1}">
			<div class="item_title2" style="width:100%; height:50px;vertical-align: middle;display: inline-block;">
				<span style="display: inline-block;width:95px;font-size: 22px;padding-left:10px;">
					타임세일
				</span>
				<c:if test="${TS_EDT ne 'A'}">
					<span style="color: #000000;font-size: 14px;display: inline-block;width: 400px; padding-left:10px;">
						&nbsp;&nbsp;|&nbsp;&nbsp;기간한정 특가상품!!&nbsp;&nbsp;
						(&nbsp;<fmt:formatDate value="${TS_SDT}" pattern="yyyy.MM.dd" />&nbsp;~&nbsp;
						<fmt:formatDate value="${TS_EDT}" pattern="yyyy.MM.dd" />&nbsp;)
					</span>
				</c:if>	
			</div>
			<div class="main_content03" style="margin-top:10px;">
<%-- 			
				<div class="title_Type01" data-type="MDP" style="height: 100px;">
					<img src="${staticRoot}/img/common/title3.jpg" alt="업체의 발견" />
				</div>
 --%>				
				<div class="main_list01" style="padding-left: 10px;">
					<c:if test="${fn:length(mdPprdt.tsp) gt 5}">
						<div class="leftDiv md_nav" data-type="md"  data-value="-1" style="margin:90px 0 0 -18px;">
							<img src="${staticRoot}/img/common/left.png" alt="left"  />
						</div>
						<div class="rightDiv md_nav" data-type="md"  data-value="+1" style="margin:90px  0 0 1220px;">
							<img src="${staticRoot}/img/common/right.png" alt="right">
					</div>
					</c:if>
					<c:set var="divCnt" value="1" />
					<c:set var="isFirst" value="0" />
					<c:set var="cnt" 		value="${fn:length(mdPprdt.tsp) div 5}" />
					<c:forEach items="${mdPprdt.tsp}" var="prdt1" varStatus="status">
						<c:if test="${status.first}">
							<div class="md vBlock" data-type="md"  data-value="${divCnt}" id ="md_${divCnt}" style="display: none;">
						</c:if>
							<div class="recommend_con_Type02 type02_product mg_10" data-type="<c:out value="${prdt1.sPcd}"/>" style="height:265px">
								<c:if test="${prdt1.sSprice eq '0' or TS_EDT eq 'A'}">
									<img src="${staticRoot}/img/common/end_sale.png" alt="end_sale" style="z-index: 300;position: absolute;"/>
								</c:if>
								<div class="recommend_con_img01" align="center" style="overflow: hidden;">
									<img src="${upload}<c:out value="${prdt1.sImg}"/>" style="width:auto; max-width: 281px;height:281px;"  alt="샘플사진" onerror="this.src='${staticRoot}/img/sample03.jpg'"/> 
								</div>
								<div class="recommend_con_txt01 txt01_product">
									<h2 class="title01">
										<span>
											<c:out value="${prdt1.sNm}"/> 
										</span>
									</h2>
									<h3 class="txt01">
										<span style="height: 22px;overflow:hidden;">
											<c:out value="${prdt1.sSt}"/> &nbsp;
										</span>
									</h3>
									<label class="maker">
										<span>
											<c:out value="${prdt1.sMk}"/>
										</span>
									</label>
									<span class="price01">
										<span style="font-weight:bold;font-size: 20px;">
											<c:choose>
												<c:when test="${prdt1.sSprice eq '0'}">
													판매완료
												</c:when>
												<c:otherwise>
													<fmt:formatNumber value="${prdt1.sSprice}" groupingUsed="true"/>원
												</c:otherwise>
											</c:choose>					
										</span>
									</span>
									<h2 class="title01" style="margin-top:5px;text-decoration: line-through;color:#b71c1c;">
										<span style="text-align:left;color:#000000;font-size: 15px;height:15px;">
											<fmt:formatNumber value="${prdt1.sPrice}" groupingUsed="true"/>원
										</span>
									</h2>
								</div>
							</div>
						<c:if test="${status.last}">
							</div>
						</c:if>
						<c:if test="${status.count % 5 eq '0' and divCnt lt cnt }">
							<c:set var="divCnt" value="${divCnt + 1}" />
							</div>
							<div class="md" data-type="md"  data-value="${divCnt}" id ="md_${divCnt}" style="display: none;">
						</c:if>
					</c:forEach>				
				</div>	
			</div>
		</c:if>
		
		<div class="item_title2" style="width:100%; height:50px;vertical-align: middle;display: inline-block;">
			<span style="display: inline-block;width:auto;font-size: 22px;padding-left:10px;">
				대화의 발견
			</span>
			<span style="color: #000000;font-size: 14px;display: inline-block;width: 400px; padding-left:10px;">
				&nbsp;&nbsp;|&nbsp;&nbsp;대화가 엄선한 요즘뜨는 HOT한 상품!!
			</span>
		</div>
		<div class="main_content01" style="margin-bottom:0px;">
<%-- 			
			<div class="title_Type01" data-type="MDP" style="height:45px;padding-top:0;">
				<img src="${staticRoot}/img/common/title2.jpg" alt="대화의 발견" />
			</div>
 --%>		
			<c:set var="isFirst" value="0" />
			<div class="recommend_content margintop_20 paddingleft_5">
				<c:forEach items="${banners}" var="STF" varStatus="status">
					<c:if test="${STF.bTp eq 'STF'}">
						<c:choose>
							<c:when test="${isFirst eq '0'}">
								<div class="recommend_con_Type03_1 marginright_10" data-type="<c:out value="${STF.pId}"/>" data-value="<c:out value="${STF.pPrdtCd}"/>" id ="se_${status.count}">			
								<div class="recommend_con_img02" align="center" style="width: 471px;overflow: hidden;padding:4px 8px;">
									<img src="${upload}<c:out value="${STF.bImg}"/>" style="width: 471px;height:310px;"  alt="<c:out value="${STF.bTit}"/>" onerror="this.src='${staticRoot}/img/sample03.jpg'"/> 
								</div>
							</c:when>
							<c:otherwise>
								<div class="recommend_con_Type03 <c:if test="${isFirst ne 3 and isFirst ne 8}">marginright_10</c:if>" data-type="<c:out value="${STF.pId}"/>" data-value="<c:out value="${STF.pPrdtCd}"/>" id ="se_${status.count}">
								<div class="recommend_con_img02" align="center" style="width: 238px; overflow: hidden; padding:4px 0; ">
									<img src="${upload}<c:out value="${STF.bImg}"/>" style="width: 230px; height:310px;"  alt="<c:out value="${STF.bTit}"/>" onerror="this.src='${staticRoot}/img/sample03.jpg'"/> 
								</div>
							</c:otherwise>
						</c:choose>		
							<div class="recommend_con_txt02">
								<span class="title" id="off_se_${status.count}">
									 &gt;
								</span>
								<span class="title2" id="on_se_${status.count}" style="display: none;">
									<c:out value="${STF.bTit}"/> &gt;
								</span>
							</div>
						</div>
						<c:set var="isFirst" value="${isFirst + 1}" />
					</c:if>
				</c:forEach>
			</div>
		</div>
		 <div class="qnb">
			<div class="s_price">
				<span class="bn_toolman">
					<a href="javascript:;" class="img01 bnImg" data-type="TMR" data-value="toolman" data-value2="" style="position: fixed;">
						<img src="${staticRoot}/img/common/toolman_click.png" alt="툴맨추천" style="max-width: 160px; height: auto;">
					</a>
				</span>
			</div>
			<script type="text/javascript">	
					$(document).ready(function(){
						setTimeout(function(){$(".qnb .bn_toolman").addClass("show");},1500);
						var leftSlide = {
							stayBanner : function($element, margin) {
								try{
									if($element.offset().top < window.innerHeight){
										$(".qnb .bn_toolman").removeClass("show");
									}else{
										$(".qnb .bn_toolman").addClass("show");
									}
									if($element.offset().top + $element.height()	>= $('#footer').offset().top - 30) {
										$element.css({
											'position': 'absolute',
											'top': $('#footer').offset().top - ($('.s_price').offset().top + $element.height() + margin)
										});
									}
									if($(document).scrollTop() + $(window).height() < $('#footer').offset().top) {
										$element.css({'position': 'fixed', 'top': ''});
									}
								}catch(e){}
							},
							loadBanner : function() {
								leftSlide.stayBanner($(".qnb .bn_toolman a"), 20);
							}
						};
						$(window).on('scroll resize', function(){
							leftSlide.loadBanner();
						});
					});
			</script>
		</div>	 
		<div class="ad_content01">
			<img src="${staticRoot}/img/ad/ad_img001.jpg" alt="광고배너" />
		</div>
		<div class="item_title2" style="width:100%; height:50px;vertical-align: middle;display: flex; justify-content: center;">
			<span style="display: inline-block;width:auto;font-size: 22px;padding-left:10px;">
				카테고리별 기획상품
			</span>
		</div>
		<div class="main_content01" style="margin-bottom:10px;" >
<%-- 		
			<div class="title_Type01" data-type="CAP" style="height: 100px;">
				<img src="${staticRoot}/img/common/title4.jpg" alt="카테고리별 기획상품" />
			</div>
 --%>			
			<div class="main_list02 mBox1">
				<div class="item_title2" data-type="D1">
					<span>
						직결나사 
					</span>
				</div>
				<c:set var="cnt_cBn" value="0" />
				<div class="item_title3" data-type="D1">
					<div class="Type01 cycle-slideshow" data-cycle-fx="scrollHorz" data-cycle-slides="> a" data-cycle-pager=".rolling_ball_D1" data-cycle-pager-template="">
						<c:forEach items="${banners}" var="cBn" varStatus="status">
							<c:if test="${cBn.pCd == 'D1'}">
								<c:set var="cnt_cBn" value="${cnt_cBn + 1}" />
								<a href="javascript:;" class="img01 bnImg" data-type="${cBn.bTp}" data-value="${cBn.pId}">
									<img src="${upload}<c:out value="${cBn.bImg}"/>" width="320px;" height="600px;">
								</a>
							</c:if>
						</c:forEach>							
					</div>
 					<div class="caption">
 						<div class="cycle-slideshow" data-cycle-fx="scrollHorz" data-cycle-slides="> strong" data-cycle-pager=".rolling_ball_D1" data-cycle-pager-template="">
							<c:forEach items="${banners}" var="cBn" varStatus="status">
								<c:if test="${cBn.pCd == 'D1'}">
									<strong class="promotion-title">
										<c:out value="${cBn.bTit}"/>
										<span class="promotion-description"><c:out value="${cBn.bCon}"/></span>
									</strong>	
								</c:if>
							</c:forEach>	
	 					</div>
					</div>
					<div class="rolling_ball_D1 rolling_ball">
						<c:forEach begin="1" end="${cnt_cBn}" varStatus="status">
							<span></span>
						</c:forEach>
					</div>
				</div>
				<div class="recommend_content1 margintop_20 marginleft_20" data-type="D1">
					<%-- <div class="leftDiv D1_nav" data-type="D1"  data-value="-1" style="display: none;">
						<img src="${staticRoot}/img/common/left.png" alt="left"  />
					</div>
					<div class="rightDiv D1_nav" data-type="D1"  data-value="+1" style="display: none;">
						<img src="${staticRoot}/img/common/right.png" alt="right">
					</div> --%>
					<c:set var="divCnt" value="1" />
					<c:set var="isFirst" value="0" />
					<c:set var="cnt2" 		value="${fn:length(mdPprdt.D1) div 4}" />
					<%-- <c:set var="cnt" 		value="${fn:length(mdPprdt.D1) div 4}" /> --%>
					<fmt:parseNumber value="${cnt2}" integerOnly="true" var="cnt"/>
                    <c:set var="cnt" value="${(cnt2 % 1 > 0 ? 1 : 0) + cnt}"/>
					<c:set var="sSt" 		value="0" />
					<c:set var="sPrice" 	value="0" />
					<c:forEach items="${mdPprdt.D1}" var="prdt1" varStatus="status">
						<c:choose>
							<c:when test="${prdt1.sScd gt 1}">
								<c:set var="sSt" 		value="${prdt1.sScd}개 상품" />
								<c:set var="sPrice" 	value="원 ~" />
							</c:when>
							<c:otherwise>
								<c:set var="sSt" 		value="${prdt1.sSt}" />
								<c:set var="sPrice" 	value="원" />
							</c:otherwise>
						</c:choose>	
						<c:if test="${status.first}">
							<div class="D1 vBlock" data-type="D1"  data-value="${divCnt}" id ="D1_${divCnt}" style="display: none;">
						</c:if>
							<div class="recommend_con_Type02 type02_product mg_10" data-type="${prdt1.sPcd}">
								<div class="recommend_con_img01" align="center" style="overflow: hidden;">
								<c:choose>
								<c:when test="${fn:indexOf(prdt1.sImg, '//') >=0 }">
								<img src="<c:out value="${prdt1.sImg}"/>" style="width:auto; max-width: 281px;height:281px;"  alt="샘플사진" onerror="this.src='${staticRoot}/img/sample03.jpg'"/>
								</c:when>
						           <c:otherwise>  
									<img src="${upload}<c:out value="${prdt1.sImg}"/>" style="width:auto; max-width: 281px;height:281px;"  alt="샘플사진" onerror="this.src='${staticRoot}/img/sample03.jpg'"/>
									</c:otherwise>
						</c:choose> 
								</div>
								<div class="recommend_con_txt01 txt01_product">
									<h2 class="title01" style="">
										<span>
											<c:out value="${prdt1.sNm}"/> 
										</span>
									</h2>
									<h3 class="txt01" style="">
										<span style="height: 22px;overflow:hidden;">
											<c:out value="${sSt}"/>&nbsp;
										</span>
									</h3>
									<label class="maker">
										<span>
											<c:out value="${prdt1.sMk}"/>
										</span>
									</label>
									<span class="price01">
										<span>
											<fmt:formatNumber value="${prdt1.sPrice}" groupingUsed="true"/>${sPrice}
										</span>
									</span>
								</div>
							</div>
						<c:if test="${status.last}">
							</div>
						</c:if>
						<c:if test="${status.count % 4 eq '0' and divCnt lt cnt }">
							<c:set var="divCnt" value="${divCnt + 1}" />
							</div>
							<div class="D1" data-type="D1"  data-value="${divCnt}" id ="D1_${divCnt}" style="display: none;">
						</c:if>
					</c:forEach>
					<div class="pageing2">
						<span>
							<c:if test="${cnt > 0 and status.count ne 1}">
								<img src="${staticRoot}/img/common/ltlt.png" class="firstPage" data-type="D1">
								<img src="${staticRoot}/img/common/lt.png" class="leftPage" data-type="D1">
							</c:if>
							
							<c:forEach begin="1" end="${cnt}" varStatus="status">
								<label class="D1_p <c:if test="${status.first}"> on</c:if>" data-value="${status.count}" id="D1_p_${status.count}"> ${status.count}</label>
							</c:forEach>
							
							<c:if test="${cnt > 0 and status.count ne 1}">
								<img src="${staticRoot}/img/common/rt.png" class="rightPage" data-type="D1">
								<img src="${staticRoot}/img/common/rtrt.png" class="maxPage" data-type="D1">
							</c:if>

						</span>
					</div>
				</div>
			</div><!-- <div class="main_list02 mBox1"> -->
			
			<div class="main_list02 mBox1">
				<div class="item_title2" data-type="D2">
					<span>
						고내식성<br>직결나사
					</span>
				</div>
				<c:set var="cnt_cBn" value="0" />
				<div class="item_title3" data-type="D2">
					<div class="Type01 cycle-slideshow" data-cycle-fx="scrollHorz" data-cycle-slides="> a" data-cycle-pager=".rolling_ball_D2" data-cycle-pager-template="">
						<c:forEach items="${banners}" var="cBn" varStatus="status">
							<c:if test="${cBn.pCd == 'D2'}">
								<c:set var="cnt_cBn" value="${cnt_cBn + 1}" />
								<a href="javascript:;" class="img01 bnImg" data-type="${cBn.bTp}" data-value="${cBn.pId}">
									<img src="${upload}<c:out value="${cBn.bImg}"/>" width="320px;" height="600px;">
								</a>
							</c:if>
						</c:forEach>							
					</div>
 					<div class="caption">
 						<div class="cycle-slideshow" data-cycle-fx="scrollHorz" data-cycle-slides="> strong" data-cycle-pager=".rolling_ball_D2" data-cycle-pager-template="">
							<c:forEach items="${banners}" var="cBn" varStatus="status">
								<c:if test="${cBn.pCd == 'D2'}">
									<strong class="promotion-title">
										<c:out value="${cBn.bTit}"/>
										<span class="promotion-description"><c:out value="${cBn.bCon}"/></span>
									</strong>	
								</c:if>
							</c:forEach>	
	 					</div>
					</div>
					<div class="rolling_ball_D2 rolling_ball">
						<c:forEach begin="1" end="${cnt_cBn}" varStatus="status">
							<span></span>
						</c:forEach>
					</div>
				</div>
				<div class="recommend_content1 margintop_20 marginleft_20" data-type="${prdt1.sPcd}">
					<!-- <div class="leftDiv D2_nav" data-type="D2"  data-value="-1" style="display: none;">
						<img src="${staticRoot}/img/common/left.png" alt="left"  />
					</div>
					<div class="rightDiv D2_nav" data-type="D2"  data-value="+1" style="display: none;">
						<img src="${staticRoot}/img/common/right.png" alt="right">
					</div>  -->
					<c:set var="divCnt" value="1" />
					<c:set var="isFirst" value="0" />
					<!-- <c:set var="cnt" 		value="${fn:length(mdPprdt.D2) div 4}" /> -->
					<c:set var="cnt2" 		value="${fn:length(mdPprdt.D2) div 4}" />
					<fmt:parseNumber value="${cnt2}" integerOnly="true" var="cnt"/>
					<c:set var="cnt" value="${(cnt2 % 1 > 0 ? 1 : 0) + cnt}"/>
					<c:set var="sSt" 		value="0" />
					<c:set var="sPrice" 	value="0" />
					<c:forEach items="${mdPprdt.D2}" var="prdt1" varStatus="status">
						<c:choose>
							<c:when test="${prdt1.sScd gt 1}">
								<c:set var="sSt" 		value="${prdt1.sScd}개 상품" />
								<c:set var="sPrice" 	value="원 ~" />
							</c:when>
							<c:otherwise>
								<c:set var="sSt" 		value="${prdt1.sSt}" />
								<c:set var="sPrice" 	value="원" />
							</c:otherwise>
						</c:choose>	
						<c:if test="${status.first}">
							<div class="D2 vBlock" data-type="D2"  data-value="${divCnt}" id ="D2_${divCnt}" style="display: none;">
						</c:if>
							<div class="recommend_con_Type02 type02_product mg_10" data-type="${prdt1.sPcd}">
								<div class="recommend_con_img01" align="center" style="overflow: hidden;">
								<c:choose>
								<c:when test="${fn:indexOf(prdt1.sImg, '//') >=0 }">
								<img src="<c:out value="${prdt1.sImg}"/>" style="width:auto; max-width: 281px;height:281px;"  alt="샘플사진" onerror="this.src='${staticRoot}/img/sample03.jpg'"/> 
								</c:when>
						        <c:otherwise>
									<img src="${upload}<c:out value="${prdt1.sImg}"/>" style="width:auto; max-width: 281px;height:281px;"  alt="샘플사진" onerror="this.src='${staticRoot}/img/sample03.jpg'"/>
									</c:otherwise>
						</c:choose> 
								</div>
								<div class="recommend_con_txt01 txt01_product">
									<h2 class="title01" style="">
										<span>
											<c:out value="${prdt1.sNm}"/> 
										</span>
									</h2>
									<h3 class="txt01" style="">
										<span style="height: 22px;overflow:hidden;">
											<c:out value="${sSt}"/>&nbsp;
										</span>
									</h3>
									<label class="maker">
										<span>
											<c:out value="${prdt1.sMk}"/>
										</span>
									</label>
									<span class="price01">
										<span>
											<fmt:formatNumber value="${prdt1.sPrice}" groupingUsed="true"/>${sPrice}
										</span>
									</span>
								</div>
							</div>
						<c:if test="${status.last}">
							</div>
						</c:if>
						<c:if test="${status.count % 4 eq '0' and divCnt lt cnt }">
							<c:set var="divCnt" value="${divCnt + 1}" />
							</div>
							<div class="D2" data-type="D2"  data-value="${divCnt}" id ="D2_${divCnt}" style="display: none;">
						</c:if>
					</c:forEach>
					<div class="pageing2">
						<span>
							<c:if test="${cnt > 0 and status.count ne 1}">
								<img src="${staticRoot}/img/common/ltlt.png" class="firstPage" data-type="D2">
								<img src="${staticRoot}/img/common/lt.png" class="leftPage" data-type="D2">
							</c:if>
							<c:forEach begin="1" end="${cnt}" varStatus="status">
								<label class="D2_p <c:if test="${status.first}"> on</c:if>" data-value="${status.count}" id="D2_p_${status.count}"> ${status.count}</label>
							</c:forEach>
							<!-- 마지막페이지 확인필요 -->
							<c:if test="${cnt > 0 and status.count ne 1}">
								<img src="${staticRoot}/img/common/rt.png" class="rightPage" data-type="D2">
								<img src="${staticRoot}/img/common/rtrt.png" class="maxPage" data-type="D2">
							</c:if>

						</span>
					</div>
				</div>
			</div><!-- <div class="main_list02 mBox1"> -->
			
			<div class="main_list02 mBox1">
				<div class="item_title2" data-type="D3">
					<span>
						스텐나사</p> 
					</span>
				</div>
				<c:set var="cnt_cBn" value="0" />
				<div class="item_title3" data-type="D3">
					<div class="Type01 cycle-slideshow" data-cycle-fx="scrollHorz" data-cycle-slides="> a" data-cycle-pager=".rolling_ball_D3" data-cycle-pager-template="">
						<c:forEach items="${banners}" var="cBn" varStatus="status">
							<c:if test="${cBn.pCd == 'D3'}">
								<c:set var="cnt_cBn" value="${cnt_cBn + 1}" />
								<a href="javascript:;" class="img01 bnImg" data-type="${cBn.bTp}" data-value="${cBn.pId}">
									<img src="${upload}<c:out value="${cBn.bImg}"/>" width="320px;" height="600px;">
								</a>
							</c:if>
						</c:forEach>							
					</div>
 					<div class="caption">
 						<div class="cycle-slideshow" data-cycle-fx="scrollHorz" data-cycle-slides="> strong" data-cycle-pager=".rolling_ball_D3" data-cycle-pager-template="">
							<c:forEach items="${banners}" var="cBn" varStatus="status">
								<c:if test="${cBn.pCd == 'D3'}">
									<strong class="promotion-title">
										<c:out value="${cBn.bTit}"/>
										<span class="promotion-description"><c:out value="${cBn.bCon}"/></span>
									</strong>	
								</c:if>
							</c:forEach>	
	 					</div>
					</div>
					<div class="rolling_ball_D3 rolling_ball">
						<c:forEach begin="1" end="${cnt_cBn}" varStatus="status">
							<span></span>
						</c:forEach>
					</div>
				</div>
				<div class="recommend_content1 margintop_20 marginleft_20" data-type="${prdt1.sPcd}">
					<!-- <div class="leftDiv D3_nav" data-type="D3"  data-value="-1" style="display: none;">
						<img src="${staticRoot}/img/common/left.png" alt="left"  />
					</div>
					<div class="rightDiv D3_nav" data-type="D3"  data-value="+1" style="display: none;">
						<img src="${staticRoot}/img/common/right.png" alt="right">
					</div> -->
					<c:set var="divCnt" value="1" />
					<c:set var="isFirst" value="0" />
					<!-- <c:set var="cnt" 		value="${fn:length(mdPprdt.D3) div 6}" /> -->
					<c:set var="cnt2" 		value="${fn:length(mdPprdt.D3) div 4}" />
					<fmt:parseNumber value="${cnt2}" integerOnly="true" var="cnt"/>
					<c:set var="cnt" value="${(cnt2 % 1 > 0 ? 1 : 0) + cnt}"/>
					<c:set var="sSt" 		value="0" />
					<c:set var="sPrice" 	value="0" />
					<c:forEach items="${mdPprdt.D3}" var="prdt1" varStatus="status">
						<c:choose>
							<c:when test="${prdt1.sScd gt 1}">
								<c:set var="sSt" 		value="${prdt1.sScd}개 상품" />
								<c:set var="sPrice" 	value="원 ~" />
							</c:when>
							<c:otherwise>
								<c:set var="sSt" 		value="${prdt1.sSt}" />
								<c:set var="sPrice" 	value="원" />
							</c:otherwise>
						</c:choose>	
						<c:if test="${status.first}">
							<div class="D3 vBlock" data-type="D3"  data-value="${divCnt}" id ="D3_${divCnt}" style="display: none;">
						</c:if>
							<div class="recommend_con_Type02 type02_product mg_10" data-type="${prdt1.sPcd}">
								<div class="recommend_con_img01" align="center" style="overflow: hidden;">
								<c:choose>
						<c:when test="${fn:indexOf(prdt1.sImg, '//') >=0 }">
						<img src="<c:out value="${prdt1.sImg}"/>" style="width:auto; max-width: 281px;height:281px;"  alt="샘플사진" onerror="this.src='${staticRoot}/img/sample03.jpg'"/>
						</c:when>
						<c:otherwise>
									<img src="${upload}<c:out value="${prdt1.sImg}"/>" style="width:auto; max-width: 281px;height:281px;"  alt="샘플사진" onerror="this.src='${staticRoot}/img/sample03.jpg'"/>
									</c:otherwise>
						</c:choose> 
								</div>
								<div class="recommend_con_txt01 txt01_product">
									<h2 class="title01" style="">
										<span>
											<c:out value="${prdt1.sNm}"/> 
										</span>
									</h2>
									<h3 class="txt01" style="">
										<span style="height: 22px;overflow:hidden;">
											<c:out value="${sSt}"/>&nbsp;
										</span>
									</h3>
									<label class="maker">
										<span>
											<c:out value="${prdt1.sMk}"/>
										</span>
									</label>
									<span class="price01">
										<span>
											<fmt:formatNumber value="${prdt1.sPrice}" groupingUsed="true"/>${sPrice}
										</span>
									</span>
								</div>
							</div>
						<c:if test="${status.last}">
							</div>
						</c:if>
						<c:if test="${status.count % 4 eq '0' and divCnt lt cnt }">
							<c:set var="divCnt" value="${divCnt + 1}" />
							</div>
							<div class="D3" data-type="D3"  data-value="${divCnt}" id ="D3_${divCnt}" style="display: none;">
						</c:if>
					</c:forEach>
					<div class="pageing2">
						<span>
							<c:if test="${cnt > 0 and status.count ne 1}">
								<img src="${staticRoot}/img/common/ltlt.png" class="firstPage" data-type="D3">
								<img src="${staticRoot}/img/common/lt.png" class="leftPage" data-type="D3">
							</c:if>
							<c:forEach begin="1" end="${cnt}" varStatus="status">
								<label class="D3_p <c:if test="${status.first}"> on</c:if>" data-value="${status.count}" id="D3_p_${status.count}"> ${status.count}</label>
							</c:forEach>

							<c:if test="${cnt > 0 and status.count ne 1}">
								<img src="${staticRoot}/img/common/rt.png" class="rightPage" data-type="D3">
								<img src="${staticRoot}/img/common/rtrt.png" class="maxPage" data-type="D3">
							</c:if>
						</span>
					</div>
				</div>
			</div><!-- <div class="main_list02 mBox1"> -->
			<div class="main_list02 mBox1">
				<div class="item_title2" data-type="D4">
					<span>
						TYPE17®</p> 
					</span>
				</div>
				<c:set var="cnt_cBn" value="0" />
				<div class="item_title3" data-type="D4">
					<div class="Type01 cycle-slideshow" data-cycle-fx="scrollHorz" data-cycle-slides="> a" data-cycle-pager=".rolling_ball_D4" data-cycle-pager-template="">
						<c:forEach items="${banners}" var="cBn" varStatus="status">
							<c:if test="${cBn.pCd == 'D4'}">
								<c:set var="cnt_cBn" value="${cnt_cBn + 1}" />
								<a href="javascript:;" class="img01 bnImg" data-type="${cBn.bTp}" data-value="${cBn.pId}">
									<img src="${upload}<c:out value="${cBn.bImg}"/>" width="320px;" height="600px;">
								</a>
							</c:if>
						</c:forEach>							
					</div>
 					<div class="caption">
 						<div class="cycle-slideshow" data-cycle-fx="scrollHorz" data-cycle-slides="> strong" data-cycle-pager=".rolling_ball_D4" data-cycle-pager-template="">
							<c:forEach items="${banners}" var="cBn" varStatus="status">
								<c:if test="${cBn.pCd == 'D4'}">
									<strong class="promotion-title">
										<c:out value="${cBn.bTit}"/>
										<span class="promotion-description"><c:out value="${cBn.bCon}"/></span>
									</strong>	
								</c:if>
							</c:forEach>	
	 					</div>
					</div>
					<div class="rolling_ball_D4 rolling_ball">
						<c:forEach begin="1" end="${cnt_cBn}" varStatus="status">
							<span></span>
						</c:forEach>
					</div>
				</div>
				<div class="recommend_content1 margintop_20 marginleft_20" data-type="D4">
					<!-- <div class="leftDiv D4_nav" data-type="D4"  data-value="-1" style="display: none;">
						<img src="${staticRoot}/img/common/left.png" alt="left"  />
					</div>
					<div class="rightDiv D4_nav" data-type="D4"  data-value="+1" style="display: none;">
						<img src="${staticRoot}/img/common/right.png" alt="right">
					</div> -->
					<c:set var="divCnt" value="1" />
					<c:set var="isFirst" value="0" />
					<!-- <c:set var="cnt" 		value="${fn:length(mdPprdt.D4) div 6}" /> -->
					<c:set var="cnt2" 		value="${fn:length(mdPprdt.D4) div 4}" />
					<fmt:parseNumber value="${cnt2}" integerOnly="true" var="cnt"/>
					<c:set var="cnt" value="${(cnt2 % 1 > 0 ? 1 : 0) + cnt}"/>
					<c:set var="sSt" 		value="0" />
					<c:set var="sPrice" 	value="0" />
					<c:forEach items="${mdPprdt.D4}" var="prdt1" varStatus="status">
						<c:choose>
							<c:when test="${prdt1.sScd gt 1}">
								<c:set var="sSt" 		value="${prdt1.sScd}개 상품" />
								<c:set var="sPrice" 	value="원 ~" />
							</c:when>
							<c:otherwise>
								<c:set var="sSt" 		value="${prdt1.sSt}" />
								<c:set var="sPrice" 	value="원" />
							</c:otherwise>
						</c:choose>	
						<c:if test="${status.first}">
							<div class="D4 vBlock" data-type="D4"  data-value="${divCnt}" id ="D4_${divCnt}" style="display: none;">
						</c:if>
							<div class="recommend_con_Type02 type02_product mg_10" data-type="${prdt1.sPcd}">
								<div class="recommend_con_img01" align="center" style="overflow: hidden;">
								<c:choose>
						<c:when test="${fn:indexOf(prdt1.sImg, '//') >=0 }">
						<img src="<c:out value="${prdt1.sImg}"/>" style="width:auto; max-width: 281px;height:281px;"  alt="샘플사진" onerror="this.src='${staticRoot}/img/sample03.jpg'"/>
						</c:when>
						<c:otherwise>
									<img src="${upload}<c:out value="${prdt1.sImg}"/>" style="width:auto; max-width: 281px;height:281px;"  alt="샘플사진" onerror="this.src='${staticRoot}/img/sample03.jpg'"/>
									</c:otherwise>
						</c:choose> 
								</div>
								<div class="recommend_con_txt01 txt01_product">
									<h2 class="title01" style="">
										<span>
											<c:out value="${prdt1.sNm}"/> 
										</span>
									</h2>
									<h3 class="txt01" style="">
										<span style="height: 22px;overflow:hidden;">
											<c:out value="${sSt}"/>&nbsp;
										</span>
									</h3>
									<label class="maker">
										<span>
											<c:out value="${prdt1.sMk}"/>
										</span>
									</label>
									<span class="price01">
										<span>
											<fmt:formatNumber value="${prdt1.sPrice}" groupingUsed="true"/>${sPrice}
										</span>
									</span>
								</div>
							</div>
						<c:if test="${status.last}">
							</div>
						</c:if>
						<c:if test="${status.count % 4 eq '0' and divCnt lt cnt }">
							<c:set var="divCnt" value="${divCnt + 1}" />
							</div>
							<div class="D4" data-type="D4"  data-value="${divCnt}" id ="D4_${divCnt}" style="display: none;">
						</c:if>
					</c:forEach>
					<div class="pageing2">
						<span>
							<c:if test="${cnt > 0 and status.count ne 1}">
								<img src="${staticRoot}/img/common/ltlt.png" class="firstPage" data-type="D4">
								<img src="${staticRoot}/img/common/lt.png" class="leftPage" data-type="D4">
							</c:if>
							<c:forEach begin="1" end="${cnt}" varStatus="status">
								<label class="D4_p <c:if test="${status.first}"> on</c:if>" data-value="${status.count}" id="D4_p_${status.count}"> ${status.count}</label>
							</c:forEach>

							<c:if test="${cnt > 0 and status.count ne 1}">
								<img src="${staticRoot}/img/common/rt.png" class="rightPage" data-type="D4">
								<img src="${staticRoot}/img/common/rtrt.png" class="maxPage" data-type="D4">
							</c:if>
						</span>
					</div>
				</div>
			</div><!-- <div class="main_list02 mBox1"> -->

			<div class="main_list02 mBox1">
				<div class="item_title2" data-type="D5">
					<span>
						블라인드<br> 리벳</p> 
					</span>
				</div>
				<c:set var="cnt_cBn" value="0" />
				<div class="item_title3" data-type="D5">
					<div class="Type01 cycle-slideshow" data-cycle-fx="scrollHorz" data-cycle-slides="> a" data-cycle-pager=".rolling_ball_D5" data-cycle-pager-template="">
						<c:forEach items="${banners}" var="cBn" varStatus="status">
							<c:if test="${cBn.pCd eq 'D5'}">
								<c:set var="cnt_cBn" value="${cnt_cBn + 1}" />
								<a href="javascript:;" class="img01 bnImg" data-type="${cBn.bTp}" data-value="${cBn.pId}">
									<img src="${upload}<c:out value="${cBn.bImg}"/>" width="320px;" height="600px;">
								</a>
							</c:if>
						</c:forEach>							
					</div>
 					<div class="caption">
 						<div class="cycle-slideshow" data-cycle-fx="scrollHorz" data-cycle-slides="> strong" data-cycle-pager=".rolling_ball_D5" data-cycle-pager-template="">
							<c:forEach items="${banners}" var="cBn" varStatus="status">
								<c:if test="${cBn.pCd eq 'D5'}">
									<strong class="promotion-title">
										<c:out value="${cBn.bTit}"/>
										<span class="promotion-description"><c:out value="${cBn.bCon}"/></span>
									</strong>	
								</c:if>
							</c:forEach>	
	 					</div>
					</div>
					<div class="rolling_ball_D5 rolling_ball">
						<c:forEach begin="1" end="${cnt_cBn}" varStatus="status">
							<span></span>
						</c:forEach>
					</div>
				</div>
				<div class="recommend_content1 margintop_20 marginleft_20" data-type="D5">
					<!-- <div class="leftDiv D5_nav" data-type="D5"  data-value="-1" style="display: none;">
						<img src="${staticRoot}/img/common/left.png" alt="left"  />
					</div>
					<div class="rightDiv D5_nav" data-type="D5"  data-value="+1" style="display: none;">
						<img src="${staticRoot}/img/common/right.png" alt="right">
					</div> -->
					<c:set var="divCnt" value="1" />
					<c:set var="isFirst" value="0" />
					<!-- <c:set var="cnt" 		value="${fn:length(mdPprdt.D5) div 6}" /> -->
					<c:set var="cnt2" 		value="${fn:length(mdPprdt.D5) div 4}" />
					<fmt:parseNumber value="${cnt2}" integerOnly="true" var="cnt"/>
					<c:set var="cnt" value="${(cnt2 % 1 > 0 ? 1 : 0) + cnt}"/>
					<c:set var="sSt" 		value="0" />
					<c:set var="sPrice" 	value="0" />
					<c:forEach items="${mdPprdt.D5}" var="prdt1" varStatus="status">
						<c:choose>
							<c:when test="${prdt1.sScd gt 1}">
								<c:set var="sSt" 		value="${prdt1.sScd}개 상품" />
								<c:set var="sPrice" 	value="원 ~" />
							</c:when>
							<c:otherwise>
								<c:set var="sSt" 		value="${prdt1.sSt}" />
								<c:set var="sPrice" 	value="원" />
							</c:otherwise>
						</c:choose>	
						<c:if test="${status.first}">
							<div class="D5 vBlock" data-type="D5"  data-value="${divCnt}" id ="D5_${divCnt}" style="display: none;">
						</c:if>
							<div class="recommend_con_Type02 type02_product mg_10" data-type="${prdt1.sPcd}">
								<div class="recommend_con_img01" align="center" style="overflow: hidden;">
								<c:choose>
						<c:when test="${fn:indexOf(prdt1.sImg, '//') >=0 }">
							<img src="<c:out value="${prdt1.sImg}"/>" style="width:auto; max-width: 281px;height:281px;"  alt="샘플사진" onerror="this.src='${staticRoot}/img/sample03.jpg'"/>
						</c:when>
						<c:otherwise>
									<img src="${upload}<c:out value="${prdt1.sImg}"/>" style="width:auto; max-width: 281px;height:281px;"  alt="샘플사진" onerror="this.src='${staticRoot}/img/sample03.jpg'"/>
									</c:otherwise>
						</c:choose> 
								</div>
								<div class="recommend_con_txt01 txt01_product">
									<h2 class="title01" style="">
										<span>
											<c:out value="${prdt1.sNm}"/> 
										</span>
									</h2>
									<h3 class="txt01" style="">
										<span style="height: 22px;overflow:hidden;">
											<c:out value="${sSt}"/>&nbsp;
										</span>
									</h3>
									<label class="maker">
										<span>
											<c:out value="${prdt1.sMk}"/>
										</span>
									</label>
									<span class="price01">
										<span>
											<fmt:formatNumber value="${prdt1.sPrice}" groupingUsed="true"/>${sPrice}
										</span>
									</span>
								</div>
							</div>
						<c:if test="${status.last}">
							</div>
						</c:if>
						<c:if test="${status.count % 4 eq '0' and divCnt lt cnt }">
							<c:set var="divCnt" value="${divCnt + 1}" />
							</div>
							<div class="D5" data-type="D5"  data-value="${divCnt}" id ="D5_${divCnt}" style="display: none;">
						</c:if>
					</c:forEach>
					<div class="pageing2">
						<span>
							<c:if test="${cnt > 0 and status.count ne 1}">
								<img src="${staticRoot}/img/common/ltlt.png" class="firstPage" data-type="D5">
								<img src="${staticRoot}/img/common/lt.png" class="leftPage" data-type="D5">
							</c:if>
							<c:forEach begin="1" end="${cnt}" varStatus="status">
								<label class="D5_p <c:if test="${status.first}"> on</c:if>" data-value="${status.count}" id="D5_p_${status.count}"> ${status.count}</label>
							</c:forEach>

							<c:if test="${cnt > 0 and status.count ne 1}">
								<img src="${staticRoot}/img/common/rt.png" class="rightPage" data-type="D5">
								<img src="${staticRoot}/img/common/rtrt.png" class="maxPage" data-type="D5">
							</c:if>
						</span>
					</div>
				</div>
			</div><!-- <div class="main_list02 mBox1"> -->
		
			<div class="main_list02 mBox1">
				<div class="item_title2" data-type="D6">
					<span>
						태핑나사 등 
					</span>
				</div>
				<c:set var="cnt_cBn" value="0" />
				<div class="item_title3" data-type="D6">
					<div class="Type01 cycle-slideshow" data-cycle-fx="scrollHorz" data-cycle-slides="> a" data-cycle-pager=".rolling_ball_D6" data-cycle-pager-template="">
						<c:forEach items="${banners}" var="cBn" varStatus="status">
							<c:if test="${cBn.pCd eq 'D6'}">
								<c:set var="cnt_cBn" value="${cnt_cBn + 1}" />
								<a href="javascript:;" class="img01 bnImg" data-type="${cBn.bTp}" data-value="${cBn.pId}">
									<img src="${upload}<c:out value="${cBn.bImg}"/>" width="320px;" height="600px;">
								</a>
							</c:if>
						</c:forEach>							
					</div>
 					<div class="caption">
 						<div class="cycle-slideshow" data-cycle-fx="scrollHorz" data-cycle-slides="> strong" data-cycle-pager=".rolling_ball_D6" data-cycle-pager-template="">
							<c:forEach items="${banners}" var="cBn" varStatus="status">
								<c:if test="${cBn.pCd eq 'D6'}">
									<strong class="promotion-title">
										<c:out value="${cBn.bTit}"/>
										<span class="promotion-description"><c:out value="${cBn.bCon}"/></span>
									</strong>	
								</c:if>
							</c:forEach>	
	 					</div>
					</div>
					<div class="rolling_ball_D6 rolling_ball">
						<c:forEach begin="1" end="${cnt_cBn}" varStatus="status">
							<span></span>
						</c:forEach>
					</div>
				</div>
				<div class="recommend_content1 margintop_20 marginleft_20" data-type="D6">
					<!-- <div class="leftDiv D6_nav" data-type="D6"  data-value="-1" style="display: none;">
						<img src="${staticRoot}/img/common/left.png" alt="left"  />
					</div>
					<div class="rightDiv D6_nav" data-type="D6"  data-value="+1" style="display: none;">
						<img src="${staticRoot}/img/common/right.png" alt="right">
					</div> -->
					<c:set var="divCnt" value="1" />
					<c:set var="isFirst" value="0" />
					<!-- <c:set var="cnt" 		value="${fn:length(mdPprdt.D6) div 6}" /> -->
					<c:set var="cnt2" 		value="${fn:length(mdPprdt.D6) div 4}" />
					<fmt:parseNumber value="${cnt2}" integerOnly="true" var="cnt"/>
					<c:set var="cnt" value="${(cnt2 % 1 > 0 ? 1 : 0) + cnt}"/>
					<c:set var="sSt" 		value="0" />
					<c:set var="sPrice" 	value="0" />
					<c:forEach items="${mdPprdt.D6}" var="prdt1" varStatus="status">
						<c:choose>
							<c:when test="${prdt1.sScd gt 1}">
								<c:set var="sSt" 		value="${prdt1.sScd}개 상품" />
								<c:set var="sPrice" 	value="원 ~" />
							</c:when>
							<c:otherwise>
								<c:set var="sSt" 		value="${prdt1.sSt}" />
								<c:set var="sPrice" 	value="원" />
							</c:otherwise>
						</c:choose>	
						<c:if test="${status.first}">
							<div class="D6 vBlock" data-type="D6"  data-value="${divCnt}" id ="D6_${divCnt}" style="display: none;">
						</c:if>
							<div class="recommend_con_Type02 type02_product mg_10" data-type="${prdt1.sPcd}">
								<div class="recommend_con_img01" align="center" style="overflow: hidden;">
								<c:choose>
						<c:when test="${fn:indexOf(prdt1.sImg, '//') >=0 }">
						<img src="<c:out value="${prdt1.sImg}"/>" style="width:auto; max-width: 281px;height:281px;"  alt="샘플사진" onerror="this.src='${staticRoot}/img/sample03.jpg'"/>
						</c:when>
						<c:otherwise>
									<img src="${upload}<c:out value="${prdt1.sImg}"/>" style="width:auto; max-width: 281px;height:281px;"  alt="샘플사진" onerror="this.src='${staticRoot}/img/sample03.jpg'"/>
									</c:otherwise>
						</c:choose> 
								</div>
								<div class="recommend_con_txt01 txt01_product">
									<h2 class="title01" style="">
										<span>
											<c:out value="${prdt1.sNm}"/> 
										</span>
									</h2>
									<h3 class="txt01" style="">
										<span style="height: 22px;overflow:hidden;">
											<c:out value="${sSt}"/>&nbsp;
										</span>
									</h3>
									<label class="maker">
										<span>
											<c:out value="${prdt1.sMk}"/>
										</span>
									</label>
									<span class="price01">
										<span>
											<fmt:formatNumber value="${prdt1.sPrice}" groupingUsed="true"/>${sPrice}
										</span>
									</span>
								</div>
							</div>
						<c:if test="${status.last}">
							</div>
						</c:if>
						<c:if test="${status.count % 4 eq '0' and divCnt lt cnt }">
							<c:set var="divCnt" value="${divCnt + 1}" />
							</div>
							<div class="D6" data-type="D6"  data-value="${divCnt}" id ="D6_${divCnt}" style="display: none;">
						</c:if>
					</c:forEach>
					<div class="pageing2">
						<span>
							<c:if test="${cnt > 0 and status.count ne 1}">
								<img src="${staticRoot}/img/common/ltlt.png" class="firstPage" data-type="D6">
								<img src="${staticRoot}/img/common/lt.png" class="leftPage" data-type="D6">
							</c:if>
							<c:forEach begin="1" end="${cnt}" varStatus="status">
								<label class="D6_p <c:if test="${status.first}"> on</c:if>" data-value="${status.count}" id="D6_p_${status.count}"> ${status.count}</label>
							</c:forEach>

							<c:if test="${cnt > 0 and status.count ne 1}">
								<img src="${staticRoot}/img/common/rt.png" class="rightPage" data-type="D6">
								<img src="${staticRoot}/img/common/rtrt.png" class="maxPage" data-type="D6">
							</c:if>
						</span>
					</div>
				</div>
			</div><!-- <div class="main_list02 mBox1"> -->


		
		<%-- 		
			<div class="ad_content02">
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
 		--%>		
		<%-- 	
			<div class="main_content04">
				<div class="wid_1248">
					<h1 class="con_title01">
						대한민국 대표 공구쇼핑몰,<span><img src="${staticRoot}/img/logo_01.png" alt="" /></span>
					</h1>
					<p class="con_txt_Type01">
						가지고 있는 장점을 극대화하고 전략적인 기술 및 협력사 등과 제휴를 통한<br/>
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
								대화에 등록된 모든 품목은 사업자의<br/>실재고품으로 기존 개인간 거래시 발생할 수<br/>있는 문제들을 원천적으로 차단하였습니다.
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
								전국의 공구매장에 보유중인 다양한<br/>품목들을 대화안에서 한번에<br/>만나보실 수 있습니다.
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
								국내 유통되고 있는 일반품목 외에<br/>합리적인 롱테일 상품을<br/>지속적으로 소개합니다.
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
								국내외 유통되는 13만 가지 공구<br/>품목들을 카테고리별로 세분화하여<br/>편리하게 찾을 수 있습니다.
							</p>
						</div>
					</div>
				</div>
			</div>	
		 --%>
			