<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/layout/include/base.jsp" %>
	<script type="text/javascript" src="${staticRoot}/sdk/js/magnifier.js"></script>  	
	<script type="text/javascript">
		var dupClick1 	= false; 
		var width		= 0;
		var height		= 0;
		<c:if test="${fn:length(prdtInfo.cList) > 0}"> 
			var cList	= [];
			var cur 		= 0;
			var cd 		= 0;
			<c:forEach items="${prdtInfo.cList}" var="catlog" varStatus="status">
				var obj = {};
				obj.code = '<c:out value="${catlog.FILE_ID}"/>';
				obj.addr = '<c:out value="${catlog.IMG}"/>';
				cList['${status.index}'] = obj;
				<c:if test="${catlog.CUR eq 'O'}">
					cur = '${status.index}';
					cd	 = obj.code;
				</c:if>
			</c:forEach>	
		</c:if>		
		
		$(function(){
			var imgObj		= new Image();
<c:choose>
						<c:when test="${fn:indexOf(prdtInfo.pInfo.PRDT_IMG, '//') >=0 }">
	imgObj.src		= "<c:out value="${prdtInfo.pInfo.PRDT_IMG}"/>";
</c:when>
						<c:otherwise>
			imgObj.src		= "${upload}<c:out value="${prdtInfo.pInfo.PRDT_IMG}"/>";
	</c:otherwise>
						</c:choose>
			width				=	imgObj.width;
			height			= imgObj.height;
			if('${prdtInfo.pInfo.PRDT_TP}'=='S'){
				$("#show").simpleZoom({
					zoomBox : "#zoom",
					markSize : [100, 100],
					zoomSize : [400, 508],
					zoomImg : [width,height]
				});
			}
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
			$('.recommend_content').on('mouseover', function() {
	            $('.' + $(this).data('type') +'_nav').show();
			});
			$('.recommend_content').on('mouseout', function() {
	            $('.' + $(this).data('type') +'_nav').hide();
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
			$('.ctg').on('mouseover', function() {
	            $(this).addClass('redCr');
			});
			$('.ctg').on('mouseout', function() {
	            $(this).removeClass('redCr');
			});
			$('.ctg').on('click', function() {
	    		_BT.actFormSubmit('cFrm', 'POST', '<c:out value="${host}"/>/shop/search/cTeg?cTp='+$(this).data("type")+'&cCode='+$(this).data("value")); 
	    	});
	    	$('.goDetail').on('click', function() {
				$("#mStore").val($(this).data('value'));
				_BT.actFormSubmit("tFrm", "POST",_BT.SHOP.URL.Search.mSearch); 
	    	});
			$('.eBOOK').on('mouseover', function() {
	            $('.' + $(this).data('type') +'_nav').show();
			});
			$('.eBOOK').on('mouseout', function() {
	            $('.' + $(this).data('type') +'_nav').hide();
			});
			$('#ctaImg').on('click', function() {
				if( dupClick1 ) {
					alert("처리중 입니다. 잠시만 기다려주세요.");
					return false;
				}
	    		dupClick1 = true;
				_BT.ajaxDataSubmit("post", _BT.SHOP.URL.Search.AjaxEbookPrdtList, {'eBookNo' : cd}, function(data) {
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
								    div.style.width= "260px";
								    div.className = 'dtl mItem hMouse';
								    div.onmouseover = function (e) { 
							            $(this).addClass("mOn");
	                              	};
								    div.onmouseout = function (e) { 
		                	            $(this).removeClass("mOn");
	                              	};
								    div.onmouseout = function (e) { 
		                	            $(this).removeClass("mOn");
	                              	};
								    div.onclick = function (e) { 
		                				_BT.actFormSubmit('frm', 'post', _BT.SHOP.URL.Search.View+'?pCode='+$(this).attr('id')); 
	                              	};
<c:choose>
						<c:when test="${fn:indexOf(data.ebookPrdt[i].PRDT_IMG, '//') >=0 }">
	div.innerHTML = '<img src="'+data.ebookPrdt[i].PRDT_IMG+'" alt="상품사진" style="width:256px; height:auto;" onerror="this.src=${staticRoot}/img/sample03.jpg"/>'
								    					+ '<p class="alarm_txt" style="padding:5px 3px;font-size:13px;font-weight:bold;">'
								    					+ data.ebookPrdt[i].PRDT_NM + '</p>'
								    					+ '<p class="alarm_txt" style="padding:5px 3px;width:256px; overflow:hidden;">'
								    					+ '<label style="color:#3f51b5;font-weight:bold;padding-right:5px;">' + data.ebookPrdt[i].ORG_CD + '</label>' 
								    					+ data.ebookPrdt[i].STNDRD
								    					+ '</p>';
</c:when>
						<c:otherwise>
								    div.innerHTML = '<img src="${upload}'+data.ebookPrdt[i].PRDT_IMG+'" alt="상품사진" style="width:256px; height:auto;" onerror="this.src=${staticRoot}/img/sample03.jpg"/>'
								    					+ '<p class="alarm_txt" style="padding:5px 3px;font-size:13px;font-weight:bold;">'
								    					+ data.ebookPrdt[i].PRDT_NM + '</p>'
								    					+ '<p class="alarm_txt" style="padding:5px 3px;width:256px; overflow:hidden;">'
								    					+ '<label style="color:#3f51b5;font-weight:bold;padding-right:5px;">' + data.ebookPrdt[i].ORG_CD + '</label>' 
								    					+ data.ebookPrdt[i].STNDRD
								    					+ '</p>';
	</c:otherwise>
						</c:choose>
								    $('#ctl_dtl').append(div);
									cnt++;
								}else{
									var inHtml = $('#'+data.ebookPrdt[i].PRDT_CD)[0].innerHTML ;
									inHtml += '<p class="alarm_txt" style="padding:5px 3px; width:256px; overflow:hidden;">' 
									+ '<label style="color:#3f51b5;font-weight:bold;padding-right:5px;">' + data.ebookPrdt[i].ORG_CD + '</label>' 
									+ data.ebookPrdt[i].STNDRD + "</p>";
									$('#'+data.ebookPrdt[i].PRDT_CD)[0].innerHTML = inHtml;
								}
							}							
						} else {
						}
					}
				},
				function(xhr, status, error) {
					dupClick1 = false;
					_BT.Console.debug(xhr);
				});	
	    	});
			$( '.eBOOK_nav' ).on('click', function(){  
				var tmp =  eval( cur + ($(this).data('value')));
				var ca = cList [tmp]; 
				if(!_BT.isEmpty(ca)){
					cur = tmp;
					cd = ca.code;
					$('#ctaImg').attr('src', '${upload}'+ca.addr);
				}
			});
			$( '.rList_leftDiv' ).on('click', function(){  
				var divBox = $(this).data('type');
				var cur = $('.' + divBox +'.vBlock').data('value');
				$('.' + divBox + '.vBlock').removeClass('vBlock'); 
				if($('#'+ divBox +'_' + ( eval($(this).data('value')) + cur )).length == 0){
					$('.'+divBox).last().addClass('vBlock'); 
				}else{
					$('#'+ divBox +'_' + ( eval($(this).data('value')) + cur ) ).addClass('vBlock');
				}
			});
			
			$( '.rList_rightDiv' ).on('click', function(){
				var divBox = $(this).data('type');
				var cur = $('.' + divBox +'.vBlock').data('value');
				$('.' + divBox +'.vBlock').removeClass('vBlock'); 
				if($('#'+ divBox +'_' + ( eval($(this).data('value')) + cur )).length == 0){
					$('#'+ divBox +'_1').addClass('vBlock');
				}else{
					$('#'+ divBox +'_' + ( eval($(this).data('value')) + cur )).addClass('vBlock');
				}
			});
			$(".sub_option_input2").on("keyup",function(){ 
				var cnt 	= $(this).val();
	    		var regExp = /[^0-9]/gi;
	            if(regExp.test(cnt)) {
	                $(this).val(cnt.replace(regExp, ""));
	                $(this).focus();
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
					$(".total_price_red, .total_price_red01").text(amt+" 원");
					$( ".sub_option_input2" ).each(function( i ) {
						if(!_BT.isEmpty($(this).val()) && $(this).val() > 0){
							amt += ( $(this).val() *  $('#'+$(this).attr('id')+'_Price').val());
						}
					});
					var amtTxt = amt+"";
					$(".total_price_red, .total_price_red01").text(amtTxt.replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,")+" 원");
					if(amt > 0){
						$(".join_form_btn").addClass("mOn2");
					}else{
						$(".join_form_btn").removeClass("mOn2");
					}
 				}
			});
		});
		function openDetail(id){
			if ( $("#"+id).is( ":hidden" ) ) {
				$("#"+id).slideDown("slow" );
			} else {
				$("#"+id).hide();
			}
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
					var prductInfoJson = new Array();
					var params =  $('#subFrm').serializeArray()
					var p_id 	= $('#prdt_cd').attr('id');
					var p_val 	= $('#prdt_cd').val();
					$('#frm').empty();
					$('#frm').append($('<input/>', {
					    type: 'hidden',
					    id: p_id,
					    name: p_id,
					    value : p_val
					}));
					var cnt = 0;
					for(var i=0; i<params.length; i++){
						if(params[i].value > 0){
							$('#frm').append($('<input/>', {
							    type: 'hidden',
							    id: 'p_cd'+cnt,
							    name: 'p_cd'+cnt,
							    value : params[i].name
							}));
							$('#frm').append($('<input/>', {
							    type: 'hidden',
							    id: 'p_qy'+cnt,
							    name: 'p_qy'+cnt,
							    value : params[i].value
							}));
							cnt ++;
						}	
					}
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
					if(!confirm('관심상품으로 등록시\n\n프로모션 정보, 재입고 알림 등 다양한 안내를 받으실 수 있습니다.\n\n관심상품 등록 하시겠습니까?')){return false;}
					dupClick1 = true; 
					_BT.ajaxDataSubmit('post',  _BT.SHOP.URL.User.AddFav, {
						sPrdtCd :  '<c:out value="${prdtInfo.pInfo.PRDT_CD}"/>'
					}, function(data) {
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
					return false;
				}		
				function addFav(){
					alert('관심상품으로 등록하기 위해서는 로그인이 필요 합니다.');
					return false;
				}		
			</script>   
		</c:otherwise>
	</c:choose>
	<div class="section">
		<div class="list_location">
			<span class="txt01 ctg linkTxt" data-type="1" data-value="<c:out value="${prdtInfo.cInfo.LEV1_CD}"/>"><c:out value="${prdtInfo.cInfo.LEV1_NM}"/></span>
			<span class="arrow"><img src="${staticRoot}/img/bl_01.jpg" alt=">" /></span>
			<span class="txt01 ctg linkTxt" data-type="2" data-value="<c:out value="${prdtInfo.cInfo.LEV2_CD}"/>"><c:out value="${prdtInfo.cInfo.LEV2_NM}"/></span>
			<span class="arrow"><img src="${staticRoot}/img/bl_01.jpg" alt=">" /></span>
			<span class="txt01 ctg linkTxt" data-type="3" data-value="<c:out value="${prdtInfo.cInfo.LEV3_CD}"/>"><c:out value="${prdtInfo.cInfo.LEV3_NM}"/></span>
			<span class="arrow"><img src="${staticRoot}/img/bl_01.jpg" alt=">" /></span>
			<span class="txt01 ctg linkTxt" data-type="4" data-value="<c:out value="${prdtInfo.cInfo.LEV4_CD}"/>"><c:out value="${prdtInfo.cInfo.LEV4_NM}"/></span>
			<span class="arrow"><img src="${staticRoot}/img/bl_01.jpg" alt=">" /></span>
			<span class="last_txt ctg linkTxt" data-type="5" data-value="<c:out value="${prdtInfo.cInfo.LEV5_CD}"/>"><c:out value="${prdtInfo.cInfo.LEV5_NM}"/></span>
		</div>
		<form id="tFrm" name="tFrm">
			<input type="hidden" id="mStore" name="mStore"/>
		</form>
		<form id="cFrm" name="cFrm">
		</form>
		<div class="prdc_top_wrap">
			<div class="prdc_info_column01 main" style="text-align:center;">
				<c:if test="${prdtInfo.pInfo.PRDT_TP eq 'J' and prdtInfo.pInfo.ST_CARE_AT eq 'Y' }">				
					<div style="z-index: 100;position: absolute;left: 20px;">
						<img src="${staticRoot}/img/common/st_care.png" alt="st_care" />
					</div>
				</c:if>
				<c:if test="${prdtInfo.pInfo.PRDT_TP eq 'J'}">				
					<div class="prdc_img" id="show"style="text-align:center;">
<c:choose>
						<c:when test="${fn:indexOf(prdtInfo.pInf.PRDT_IMG, '//') >=0 }">
						<img src="<c:out value="${prdtInfo.pInfo.PRDT_IMG}"/>" alt="상품사진" id="show_pic" class="show_pic" onerror="this.src='${staticRoot}/img/sample03.jpg'"/> 
</c:when>
						<c:otherwise>
						<img src="${upload}/600<c:out value="${prdtInfo.pInfo.PRDT_IMG}"/>" alt="상품사진" id="show_pic" class="show_pic" onerror="this.src='${staticRoot}/img/sample03.jpg'"/> 
						</c:when>
						<c:otherwise>
					</div>
				</c:if>				
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
						<div class="prdc_img_plus" style="margin-bottom: 30px;margin-left: -15px;">
							<c:set var="extraList" value="${ fn:split(prdtInfo.pInfo.EXTRA_IMG,'|') }"/>
							<span>
<c:choose>
						<c:when test="${fn:indexOf(prdtInfo.pInfo.PRDT_IMG, '//') >=0 }">
						<img data-type="${0}" class="extImg" src="<c:out value="${prdtInfo.pInfo.PRDT_IMG}"/>" alt="상세이미지" onerror="this.src='${staticRoot}/img/common/no_catag.jpg'" style="width: 90px; height: 90px;" /> 
</c:when>
						<c:otherwise>
								<img data-type="${0}" class="extImg" src="${upload}<c:out value="${prdtInfo.pInfo.PRDT_IMG}"/>" alt="상세이미지" onerror="this.src='${staticRoot}/img/common/no_catag.jpg'" style="width: 90px; height: 90px;" /> 
</c:otherwise>
						</c:choose>				
							</span>
							<c:forEach items="${extraList}" var="img" varStatus="status">
								<span>
									<img data-type="${status.count}" class="extImg" src="${upload}<c:out value="${img}"/>" alt="상세이미지" onerror="this.src='${staticRoot}/img/common/no_catag.jpg'" style="width: 90px; height: 90px;" /> 
								</span>
							</c:forEach>
						</div>
					</c:if>					
				</c:if>		
				<c:if test="${prdtInfo.pInfo.PRDT_TP eq 'J' and prdtInfo.pInfo.ST_CARE_AT eq 'Y' }">			
					<div class="signup_agree">
						<p class="alarm_txt">
							※ <span class="redCr bTxt" >대화케어</span>상품으로 대화에서 <span class="redCr bTxt" >평생 A/S 보증</span>을 약속 합니다.
							<a href="javascript:;" onclick="goStCare();">[자세히 보기]</a>
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
						<img src="<c:out value="${prdtInfo.pInfo.PRDT_IMG}"/>"/>
</c:when>
						<c:otherwise>
				<img src="${upload}<c:out value="${prdtInfo.pInfo.PRDT_IMG}"/>"/>
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
						<c:if test="${prdtInfo.pInfo.PRDT_TP eq 'S'}">
							<li>
								판매 상점 : ( <c:out value="${prdtInfo.pInfo.S_NM}"/> )
								<span class="show_seller">
									<label class="payment_Type01 goDetail" data-value="${prdtInfo.pInfo.STORE_ID}">업체상품 더보기</label>
								</span>
							</li>
						</c:if>
						<li style="font-size: 15px; font-weight: 500;">
							대화 코드 : <span style="color:#b71c1c"><c:out value="${prdtInfo.pInfo.PRDT_CD}"/></span> 
						</li>
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
						<c:if test="${prdtInfo.pInfo.STORE_ID ne '40000001'}"> 
							<c:set var="dlvyTpTxt" 			value="업체배송" />	
						</c:if>
						
						<c:if test="${prdtInfo.pInfo.DLVY_TP eq 'H'}"> 
							<c:set var="dlvyTxt" 			value="화물택배" />	
						</c:if>
						<c:if test="${prdtInfo.pInfo.DLVY_MEG ne '1'}"> 
							<c:set var="dlvyFeeTxt" 		value="개별배송 상품" />	
						</c:if>
						
						<li>
							<span style="display: inline-block;width: 50px;" >배송 : </span>
							<span style="display: inline-block;width: 82%;" >
								<p>
									${dlvyTpTxt} [ ${dlvyTxt} / <fmt:formatNumber value="${prdtInfo.pInfo.DLVY_FEE}" groupingUsed="true"/>원 ]  
								</p>
								<p style="margin-top: 10px;">
									${dlvyFeeTxt}
									<c:if test="${prdtInfo.pInfo.FREE_DLVY eq '1'}"> 
										/ <span style="color:#b71c1c"> [<fmt:formatNumber value="${prdtInfo.pInfo.FREE_AMT}" groupingUsed="true"/>원 이상 무료배송]</span>
									</c:if>
								</p>
								<p style="margin-top: 10px;">
									<c:if test="${prdtInfo.pInfo.EXTRA_FEE_TP eq '1'}"> 
										도서산간지역 배송비 추가 
									</c:if>
								</p>
							</span>
						</li>
						<li>
					</ul>
				</div>
				<div class="prdc_total_con">
					<span class="total">
						선택 상품금액
					</span>
					<span class="total_price_red nanumEB"> 원</span>
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
		<h1 class="title_Type03">
			상품 규격
		</h1>
		<form id="frm" name="frm">
			<input type="hidden" id="prdt_cd" name="prdt_cd" value="<c:out value="${prdtInfo.pInfo.PRDT_CD}"/>"/>
			<input type="hidden" id="prdt_list" name="prdt_list" value=""/>
		</form>
		<form id="subFrm" name="subFrm">
			<div class="sub_option_group">
				<table class="sub_group_tbl2">
					<caption>상품 규격</caption>
					<colgroup>
						<col width="*">
						<col width="25%">
						<col width="15%">
						<col width="15%">
						<col width="15%">
					</colgroup>
					<tbody>
						<tr>
							<th class="th2">규 격</th>
							<th class="th2">모델번호</th>
							<th class="th2">제조사</th>
							<th>판매가</th>
							<th>수 량</th>
						</tr>
						<c:forEach items="${prdtInfo.pList}" var="prdt1" varStatus="status">
							<tr> 
								<td align="left"><c:out value="${prdt1.STNDRD}"/></td>
								<td align="left"><c:out value="${prdt1.MODEL_NM}"/></td>
								<td><c:out value="${prdtInfo.pInfo.MAKR_NM}"/></td>
								<td align="right">
									<span style="color:#b71c1c; font-weight: bolder;">
										<fmt:formatNumber value="${prdt1.SEL_PRICE}" groupingUsed="true"/>원
									</span>
								</td>
								<td>
									<input type="hidden" id="P_<c:out value="${status.count}"/>_Price" value="<c:out value="${prdt1.SEL_PRICE}"/>"/>
									<input type="hidden" id="P_<c:out value="${status.count}"/>_Code" value="<c:out value="${prdt1.PRDT_DTL_CD}"/>"/>
									<input type="text" id="P_<c:out value="${status.count}"/>" name="<c:out value="${prdt1.PRDT_DTL_CD}"/>" class="sub_option_input2 m_c01_01_01_input_01" style="text-align: right;"/>
								</td>
							</tr>
						</c:forEach>
						<tr>
							<td class="sub_option_total">
								총 합계
							</td>
							<td colspan="5" class="sub_option_total_count" style="text-align:right; padding-right:10px;">
								<span class="total_price_red01 nanumEB">0 원</span>
								<label class="join_form_btn" onclick="addCart();">장바구니 담기</label>
							</td>								
						</tr>
					</tbody>
				</table>
			</div>
		</form>
		
		<c:if test="${prdtInfo.pInfo.MOVE_AT eq 'Y'}">
			<c:forEach items="${prdtInfo.mList}" var="mv" varStatus="status">
				<div align="center" class="margintop_20">
					<iframe width="100%" height="auto" src="${mv.sUrl}?rel=0&amp;showinfo=0" frameborder="0" allowfullscreen></iframe>
				</div>
			</c:forEach>
		</c:if>
		
	 	<div class="tab_bar margintop_20">
			<ul class="tab_list">
				<li class="tab_item">
					<a href="javascript:;" class="tab_link" onclick="showTab('tab1');" data-type="tab1"><span id="tab1" class="tab tabOn">상세정보</span></a>
				</li>
				<li class="tab_item">
					<a href="javascript:;" class="tab_link" onclick="showTab('tab2');" data-type="tab2"><span id="tab2" class="tab">상품문의</span></a>
				</li>
				<li class="tab_item">
					<a href="javascript:;" class="tab_link" onclick="showTab('tab3');" data-type="tab2"><span id="tab3" class="tab">배송정보</span></a>
				</li>
			</ul>
		</div>
				
		<div class="pop_set_content5 vOff" id="ctl">
			<h1 class="blue_title">
				카탈로그 상품
				<span class="close" onclick="closeDivPop('ctl');"></span>
			</h1>
			<div class="pop_set_substance5" id="ctl_dtl">
			</div>
		</div>
		
		<div class="tab_dtl" id="dtl_tab1" data-type="tab1">
			<c:if test="${prdtInfo.pInfo.EBOOK_IMG_AT eq 'Y'}">
				<div class="margintop_20 eBOOK"  align="center" width="100%" data-type="eBOOK">
<%-- 					
					<div class="leftDiv eBOOK_nav" data-type="eBOOK"  data-value="-1" style="display: none; margin: 640px 0 0 0;">
						<img src="${staticRoot}/img/common/left2.png" alt="left"  />
					</div>
					<div class="rightDiv eBOOK_nav" data-type="eBOOK"  data-value="+1" style="display: none; margin: 640px 0 0 920px;">
						<img src="${staticRoot}/img/common/right2.png" alt="right">
					</div>
					<img src="${upload}<c:out value="${prdtInfo.pInfo.EBOOK_IMG_NO}"/>" style="width: 100%; height: auto;" id="ctaImg" class="hMouse" alt="카탈로그 이미지" onclick="openDivPop('ctl');"  onerror="this.src='${staticRoot}/img/common/no_catag.jpg'"/> 
 --%>					
					<img src="${upload}<c:out value="${prdtInfo.pInfo.EBOOK_IMG_NO}"/>" style="width: 100%; height: auto;" id="ctaImg" alt="카탈로그 이미지" onerror="this.src='${staticRoot}/img/common/no_catag.jpg'"/> 
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
				<p class="sub_text01">
					고객님이 구매하신 모든 상품은 배송비( 3,000원)가 부과됩니다. (도서산간지역 제외)<br/>
					단, 구매액이 10만원 이상인 경우는 1박스에 한해 무료로 배송이 되며, 1박스 이상부터는 착불로 배송이 됩니다. <br/>
					아래의 경우에는 화물로 배송되며 배송비가 추가 될수 있습니다.<br/><br/>
				</p>
				<ul class="sub_text01 margintop_30">
					<li>
						[화물 배송 상품]
					</li>
					<li>
						- 중량이 25kg 이상인상품
					</li>
					<li>
						- 길이가 긴 상품
					</li>
					<li>
						- 기계류 등은 주로 화물로 배송이 되며, 대량으로 구매시는 배송문의를 고객센타로 하시기 바랍니다. 
					</li>
				</ul>
			</div>

			<h1 class="title_Type03 margintop_40">
				교환 및 반품 정책
			</h1>
			<div class="sub_text_group">
				<ul class="sub_text01">
					<li>
						- 교환은 제품수령 후 7일 이내의 상품에 한하여 제품에 이상이 있거나 고객님의 마음에 들지 않을 경우 언제든지 가능합니다. 
					</li>
					<li>
						- 환불은 제품 수령 후 3일 이내에 카드승인취소나 온라인 무통장입금등의 환불처리를 해드립니다. 
					</li>
					<li>
						- 제품의 하자가 없이 단순 고객의 변심으로 환불/교환할 경우 추가 배송비는 구매자 부담입니다. 
					</li>
					<li>
						- 제품의 포장을 개봉하여 재판매가 불가능한 경우 교환/환불이 불가능합니다.
					</li>
				</ul>
				<p class="sub_text01 margintop_30">
					교환/반품 주소(일부상품제외) : 대구광역시 중구 남산동 2114-16 한진택배 중구영업소내 대봉대리점 대화 
				</p>
			</div>
		</div>

		<c:if test="${fn:length(prdtInfo.rList) > 0}">
			<h1 class="title_Type03 margintop_30">
				관련상품
			</h1>
			<div class="recommend_content" data-type="rList">
				<div class="leftDiv rList_nav rList_leftDiv" data-type="rList"  data-value="-1" style="display: none;margin: 85px 0 0 -18px;">
					<img src="${staticRoot}/img/common/left.png" alt="left"  />
				</div>
				<div class="rightDiv rList_nav rList_rightDiv" data-type="rList"  data-value="+1" style="display: none;margin: 85px 0 0 970px;">
					<img src="${staticRoot}/img/common/right.png" alt="right">
				</div>
				<c:set var="divCnt" value="1" />
				<c:set var="isFirst" value="0" />
				<c:set var="cnt" 		value="${fn:length(prdtInfo.rList) div 4}" />
				<c:forEach items="${prdtInfo.rList}" var="prdt1" varStatus="status">
					<c:if test="${status.first}">
						<div class="rList vBlock" data-type="rList"  data-value="${divCnt}" id ="rList_${divCnt}" style="display: none;">
					</c:if>
						<div class="mItem recommend_con_Type01  <c:if test="${status.count%4 ne '0'}"> mg_10</c:if>" data-type="<c:out value="${prdt1.PRDT_CD}"/>">
							<div class="recommend_con_img01" align="center" style="overflow: hidden;">
								<a href="javascript:;" class="img">
<c:choose>
						<c:when test="${fn:indexOf(prdt1.PRDT_IMG, '//') >=0 }">
							<img src="<c:out value="${prdt1.PRDT_IMG}"/>" alt="상품사진" style="width:195px;height:156px;" onerror="this.src='${staticRoot}/img/sample03.jpg'"/> 
</c:when>
						<c:otherwise>
									<img src="${upload}<c:out value="${prdt1.PRDT_IMG}"/>" alt="상품사진" style="width:195px;height:156px;" onerror="this.src='${staticRoot}/img/sample03.jpg'"/> 
</c:otherwise>
						</c:choose>
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
										<fmt:formatNumber value="${prdt1.SEL_PRICE}" groupingUsed="true"/>원 ~
									</span>
								</span>
							</div>
						</div>
					<c:if test="${status.last}">
						</div>
					</c:if>
					<c:if test="${status.count % 4 eq '0' and divCnt lt cnt and !status.last}">
						<c:set var="divCnt" value="${divCnt + 1}" />
						</div>
						<div class="rList" data-type="rList"  data-value="${divCnt}" id ="rList_${divCnt}" style="display: none;">
					</c:if>
				</c:forEach>
			</div>
		</c:if>
	</div>
		
		<div class="quick_menu">
			<div class="quick_Type">
<%-- 				
					<p class="title_Type">
						TODAY
					</p>
					<div class="quick_img">
						<a href="#">
							<img src="${staticRoot}/img/quick_img01.jpg" alt="이미지" />
						</a>
						<a href="#">
							<img src="${staticRoot}/img/quick_img01.jpg" alt="이미지" />
						</a>
						<a href="#">
							<img src="${staticRoot}/img/quick_img01.jpg" alt="이미지" />
						</a>
					</div>
--%>					
				<div class="quick_arrow_Type">
<!-- 
					<span class="left_arrow01"></span>
 -->
					<span class="top_Type01" id="goTop" style="width:39px;">
						<img src="${staticRoot}/img/common/up.png" alt="탑 이미지" />
					</span>
					<span class="top_Type01" id="goBottom" style="width:39px;">
						<img src="${staticRoot}/img/common/down.png" alt="다운 이미지" style="margin-top: 10px;"/>
					</span>
<!-- 					
					<span class="right_arrow01"></span>
 -->				
				</div>
				<div class="quick_kakao">
<%-- 				
					<a href="javascript:;">
						<img src="${staticRoot}/img/quick_kakao.jpg" alt="카카오톡" />
					</a>
 --%>					
				</div>
			</div>
		</div>
		<div class="confirmMsg vOff" id="confirmMsg">
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