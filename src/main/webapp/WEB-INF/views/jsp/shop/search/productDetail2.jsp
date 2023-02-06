<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/layout/include/base.jsp" %>
	<script type="text/javascript" src="${staticRoot}/sdk/js/magnifier.js"></script>  	
	<script type="text/javascript">
		var width		= 0;
		var height		= 0;
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
   </script>
	<c:choose>
		<c:when test="${! empty userSession}">
			<script type="text/javascript">
				var dupClick1 	= false; 
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
					_BT.ajaxCallbackSubmit("frm",  _BT.SHOP.URL.Order.addCart, function(data) {
						dupClick1 = false;
						if($(data).size() > 0) { 
							if(_BT.isEquals(data.code, "success")){
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
						$("#ckSmsState").text("처리중 오류가 발생했습니다.\n\n다시 확인 부탁 드립니다.");
						$("#ckSmsState").css("color","#fe0000");	
					});	
				}		
				function openDivPop(id){
					$("#"+id).removeClass("vOff"); 
				}
				function closeDivPop(id){
					$("#"+id).addClass("vOff");
				}
			</script>   
		
		</c:when>
		<c:otherwise>
			<script type="text/javascript">
				function addCart(){
					alert("구매하시기 위해서는 로그인이 필요 합니다.");
					return false;
				}		
			</script>   
		</c:otherwise>
	</c:choose>
	<div class="section">
				<div class="list_location">
					<a href="javascript:;" onclick="_BT.moveUrl(_BT.SHOP.URL.Common.Main);" class="home">HOME</a>
					<span class="arrow"><img src="${staticRoot}/img/bl_01.jpg" alt=">" /></span>
					<span class="txt01"><c:out value="${prdtInfo.cInfo.LEV1_NM}"/></span>
					<span class="arrow"><img src="${staticRoot}/img/bl_01.jpg" alt=">" /></span>
					<span class="txt01"><c:out value="${prdtInfo.cInfo.LEV2_NM}"/></span>
					<span class="arrow"><img src="${staticRoot}/img/bl_01.jpg" alt=">" /></span>
					<span class="txt01"><c:out value="${prdtInfo.cInfo.LEV3_NM}"/></span>
					<span class="arrow"><img src="${staticRoot}/img/bl_01.jpg" alt=">" /></span>
					<span class="last_txt"><c:out value="${prdtInfo.cInfo.LEV4_NM}"/></span>
				</div>
				<div class="prdc_top_wrap">
					<div class="prdc_info_column01 main">
						<div class="prdc_img" id="show" align="center" style="">
						<c:choose>
						<c:when test="${fn:indexOf(prdtInfo.pInfo.PRDT_IMG, '//') >=0 }">
						<img src="<c:out value="${prdtInfo.pInfo.PRDT_IMG}"/>" alt="상품사진" id="show_pic" class="show_pic" onerror="this.src='${staticRoot}/img/sample03.jpg'"/> 
						</c:when>
						<c:otherwise>
							<img src="${upload}<c:out value="${prdtInfo.pInfo.PRDT_IMG}"/>" alt="상품사진" id="show_pic" class="show_pic" onerror="this.src='${staticRoot}/img/sample03.jpg'"/> 
						</c:otherwise>
						</c:choose>
						</div>
<%-- 						
						<div class="prdc_img_plus">
							<span>
								<img src="${staticRoot}/img/sample07.jpg" alt="샘플사진" />
							</span>
							<span>
								<img src="${staticRoot}/img/sample08.jpg" alt="샘플사진" />
							</span>
							<span>
								<img src="${staticRoot}/img/sample09.jpg" alt="샘플사진" />
							</span>
							<span class="mr_0">
								<img src="${staticRoot}/img/sample10.jpg" alt="샘플사진" />
							</span>
						</div>
--%>			
						
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
							<c:if test="${prdtInfo.pInfo.PRDT_TP eq 'S'}">
								<p class="prdc_title01">
									판매자 ID : (<c:out value="${prdtInfo.pInfo.STORE_ID}"/>)
								</p>
							</c:if>
							<h2 class="prdc_title02">
								<c:out value="${prdtInfo.pInfo.PRDT_NM}"/>
							</h2>
						</div>
						<div class="prdc_explain_con">
							<ul>
								<li>
									브랜드 : <c:out value="${prdtInfo.pInfo.MAKR_NM}"/>
								</li>
								<li>
									규격  : <c:out value="${prdtInfo.pInfo.M_STNDRD}"/> 
								</li>
								<c:if test="${! empty prdtInfo.pInfo.EXT_INFO_TIT_1}">
									<li>
										<c:out value="${prdtInfo.pInfo.EXT_INFO_TIT_1}"/> : 
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
<!-- 									

								<li class="line_c01_01_01">
									상세정보 : <c:out value="${prdtInfo.pInfo.PRDT_INFO}"/>
										중, 저량물 밴딩 포장에 이상적<br/>
										균일한 표면처리로 결속력 장기 지속<br/>
										가장 경제적인 플라스틱 결속재<br/>
								</li>

						
 							
								<li>
									옵션 :
									<select id="" class="prdc_option" name="">
									<option value="옵션 001">옵션 001</option>
									</select>
								</li>
								
-->			
								<li>
									배송비 : 
									<fmt:formatNumber value="${prdtInfo.pInfo.DLVY_FEE}" groupingUsed="true"/>원 <span style="color:#b71c1c "> [100,000원 이상 무료배송]</span>
								</li>
								

			
							</ul>
						</div>
						
<%-- 						
						
						<div class="prdc_option_con">
							<ul>
								<li>
									<p class="option_mini">
										품번 : B105779  /  모델명 : gk-10-0<br/>규격 : 10.0mm / 전장 : 130mm / 낱장 : 95mm
									</p>
									<p class="option_count">
										<input class="cart_count_input" placeholder="1EA" type="text">
										<span class="count_order">
											<label for="">
											<img src="${staticRoot}/img/count_up.jpg" alt="">
											</label>
											<label for="">
											<img src="${staticRoot}/img/count_down.jpg" alt="">
											</label>
										</span>
										<span class="option_close">
											<img src="${staticRoot}/img/icon_close.jpg" alt="엑스버튼" />
										</span>
										<span class="red_price01">
											20,620원
										</span>
									</p>
								</li>
								<li>
									<p class="option_mini">
										품번 : B105779  /  모델명 : gk-10-0<br/>규격 : 10.0mm / 전장 : 130mm / 낱장 : 95mm
									</p>
									<p class="option_count">
										<input class="cart_count_input" placeholder="1EA" type="text">
										<span class="count_order">
											<label for="">
											<img src="${staticRoot}/img/count_up.jpg" alt="">
											</label>
											<label for="">
											<img src="${staticRoot}/img/count_down.jpg" alt="">
											</label>
										</span>
										<span class="option_close">
											<img src="${staticRoot}/img/icon_close.jpg" alt="엑스버튼" />
										</span>
										<span class="red_price01">
											20,620원
										</span>
									</p>
								</li>
							</ul>
						</div>
						
--%>					
						
						<div class="prdc_total_con">
							<span class="total">
								총합계금액
							</span>
							<span class="total_price_red nanumEB">0 원</span>
						</div>

				<div class="icon_btn_Group2 margintop_40">
					<a class="btn_sub_01" href="javascript:;">
						찜하기
					</a>
					
<!-- 					
					<a class="btn_sub_02" href="javascript:;">
						장바구니
					</a>
					<a class="btn_sub_03" href="javascript:;">
						구매하기
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
							<col width="25%">
							<col width="25%">
							<col width="15%">
							<col width="10%">
							<col width="10%">
							<col width="15%">
						</colgroup>
						<tbody>
							<tr>
								<th class="th2">규 격</th>
								<th class="th2">모델번호</th>
								<th class="th2">제조사</th>
								<th>재 고</th>
								<th>판매가</th>
								<th>수 량</th>
							</tr>
							<c:forEach items="${prdtInfo.pList}" var="prdt1" varStatus="status">
								<tr> 
									<td align="left"><c:out value="${prdt1.STNDRD}"/></td>
									<td align="left"><c:out value="${prdt1.MODEL_NM}"/></td>
									<td><c:out value="${prdt1.MODEL_NM}"/></td>
									<td align="right"><c:out value="${prdt1.INVT_AMT}"/>개</td>
									<td align="right">
										<fmt:formatNumber value="${prdt1.SEL_PRICE}" groupingUsed="true"/>원
									</td>
									<td>
										<input type="hidden" id="P_<c:out value="${status.count}"/>_Price" value="<c:out value="${prdt1.SEL_PRICE}"/>"/>
										<input type="hidden" id="P_<c:out value="${status.count}"/>_Code" value="<c:out value="${prdt1.PRDT_DTL_CD}"/>"/>
										<input type="text" id="P_<c:out value="${status.count}"/>" name="<c:out value="${prdt1.PRDT_DTL_CD}"/>" class="sub_option_input2 m_c01_01_01_input_01" style="text-align: right;"/>
										<span class="option_close">
											<img src="${staticRoot}/img/icon_close.jpg" alt="닫기" />
										</span>
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
				<!-- <div class="icon_btn_Group_right margintop_5">
					<a class="btn_sub_01" href="javascript:;">
						장바구니 담기
					</a>
				</div> -->

					<div class="margintop_20"  align="center" width="100%" >
						<img src="${staticRoot}/img/3b761.jpg"/> 
					</div>

				<div class="more_bar margintop_40">
					<span onclick="openDetail('goods-contents');">
						<img src="${staticRoot}/img/icon_detail_eye.jpg" alt="상품 상세 설명보기"> 상품 상세 설명보기
					</span>
				</div>

				<div id="goods-contents" align="center" style="display: none;">
					<img width="100%" height="800" alt="" src="http://cdna.funshop.co.kr/products/0000047724/camp_01.jpg?01492754575"/>
					<img width="100%" height="800" alt="" src="http://cdna.funshop.co.kr/products/0000047724/camp_02.jpg?01492754575"/>
					<img width="100%" height="800" alt="" src="http://cdna.funshop.co.kr/products/0000047724/camp_03.jpg?01492754575"/>
					<img width="100%" height="800" alt="" src="http://cdna.funshop.co.kr/products/0000047724/camp_04.jpg?01492754575"/>
					<img width="100%" height="800" alt="" src="http://cdna.funshop.co.kr/products/0000047724/camp_05.jpg?01492754575"/>
					<img width="100%" height="339" alt="" src="http://cdna.funshop.co.kr/products/0000047724/camp_06.jpg?01492754575"/>
					<img width="100%" height="1261" alt="" src="http://cdna.funshop.co.kr/products/0000047724/camp_07.jpg?01492754575"/>
					<img width="100%" height="800" alt="" src="http://cdna.funshop.co.kr/products/0000047724/camp_08.jpg?01492754575"/>
					<img width="100%" height="800" alt="" src="http://cdna.funshop.co.kr/products/0000047724/camp_09.jpg?01492754575"/>
					<img width="100%" height="800" alt="" src="http://cdna.funshop.co.kr/products/0000047724/camp_10.jpg?01492754575"/>
					<img width="100%" height="800" alt="" src="http://cdna.funshop.co.kr/products/0000047724/camp_11.jpg?01492754575"/>
					<img width="100%" height="800" alt="" src="http://cdna.funshop.co.kr/products/0000047724/camp_12.jpg?01492754575"/>
					<img width="100%" height="800" alt="" src="http://cdna.funshop.co.kr/products/0000047724/camp_13.jpg?01492754575"/>
					<img width="100%" height="459" alt="" src="http://cdna.funshop.co.kr/products/0000047724/camp_14.jpg?01492754575"/>
					<img width="100%" height="1141" alt="" src="http://cdna.funshop.co.kr/products/0000047724/camp_15.jpg?01492754575"/>
					<img width="100%" height="800" alt="" src="http://cdna.funshop.co.kr/products/0000047724/camp_16.jpg?01492754575"/>
					<img width="100%" height="800" alt="" src="http://cdna.funshop.co.kr/products/0000047724/camp_17.jpg?01492754575"/>
					<img width="100%" height="800" alt="" src="http://cdna.funshop.co.kr/products/0000047724/camp_18.jpg?01492754575"/>
					<img width="100%" height="800" alt="" src="http://cdna.funshop.co.kr/products/0000047724/camp_19.jpg?01492754575"/>
					<img width="100%" height="431" alt="" src="http://cdna.funshop.co.kr/products/0000047724/camp_20.jpg?01492754575"/>
					<img width="100%" height="1169" alt="" src="http://cdna.funshop.co.kr/products/0000047724/camp_21.jpg?01492754575"/>
					<img width="100%" height="800" alt="" src="http://cdna.funshop.co.kr/products/0000047724/camp_22.jpg?01492754575"/>
					<img width="100%" height="800" alt="" src="http://cdna.funshop.co.kr/products/0000047724/camp_23.jpg?01492754575"/>
					<img width="100%" height="579" alt="" src="http://cdna.funshop.co.kr/products/0000047724/camp_24.jpg?01492754575"/>
					<img width="100%" height="1021" alt="" src="http://cdna.funshop.co.kr/products/0000047724/camp_25.jpg?01492754575"/>
					<img width="100%" height="800" alt="" src="http://cdna.funshop.co.kr/products/0000047724/camp_26.jpg?01492754575"/>
					<img width="100%" height="683" alt="" src="http://cdna.funshop.co.kr/products/0000047724/camp_27.jpg?01492754575"/>
					<img width="100%" height="117" alt="" src="http://cdna.funshop.co.kr/products/0000047724/camp_28.jpg?01492754575"/>
					<img width="100%" height="800" alt="" src="http://cdna.funshop.co.kr/products/0000047724/camp_29.jpg?01492754575"/>
					<img width="100%" height="800" alt="" src="http://cdna.funshop.co.kr/products/0000047724/camp_30.jpg?01492754575"/>
					<img width="100%" height="772" alt="" src="http://cdna.funshop.co.kr/products/0000047724/camp_31.jpg?01492754575"/>
			</div>


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

				<h1 class="title_Type03 margintop_30">
					관련상품
					<span class="more_btn">
						<a href="javascript:;"> 
						더보기
						</a>
					</span>
				</h1>
				<div class="recommend_content">
					<div class="recommend_con_Type02 mg_10">
						<div class="recommend_con_img01">
							<a href="javascript:;" class="img">
								<img src="${staticRoot}/img/sample04.jpg" alt="샘플사진" />
							</a>
						</div>
						<div class="recommend_con_txt01">
							<h2 class="title01">
								<a class="" href="javascript:;"> 다목적 드릴비트세트 </a>
							</h2>
							<label class="txt01">
								<a class="" href="javascript:;"> STEL101 400W </a>
							</label>
							<label class="txt01">
								<a class="" href="javascript:;"> [보쉬] </a>
							</label>
							<span class="price01">
								<a href=""> 125,000원 </a>
							</span>
						</div>
					</div>
					<div class="recommend_con_Type02 mg_10">
						<div class="recommend_con_img01">
							<a href="javascript:;" class="img">
								<img src="${staticRoot}/img/sample04.jpg" alt="샘플사진" />
							</a>
						</div>
						<div class="recommend_con_txt01">
							<h2 class="title01">
								<a class="" href="javascript:;"> 다목적 드릴비트세트 </a>
							</h2>
							<label class="txt01">
								<a class="" href="javascript:;"> STEL101 400W </a>
							</label>
							<label class="txt01">
								<a class="" href="javascript:;"> [보쉬] </a>
							</label>
							<span class="price01">
								<a href=""> 125,000원 </a>
							</span>
						</div>
					</div>
					<div class="recommend_con_Type02 mg_10">
						<div class="recommend_con_img01">
							<a href="javascript:;" class="img">
								<img src="${staticRoot}/img/sample04.jpg" alt="샘플사진" />
							</a>
						</div>
						<div class="recommend_con_txt01">
							<h2 class="title01">
								<a class="" href="javascript:;"> 다목적 드릴비트세트 </a>
							</h2>
							<label class="txt01">
								<a class="" href="javascript:;"> STEL101 400W </a>
							</label>
							<label class="txt01">
								<a class="" href="javascript:;"> [보쉬] </a>
							</label>
							<span class="price01">
								<a href=""> 125,000원 </a>
							</span>
						</div>
					</div>
					<div class="recommend_con_Type02">
						<div class="recommend_con_img01">
							<a href="javascript:;" class="img">
								<img src="${staticRoot}/img/sample04.jpg" alt="샘플사진" />
							</a>
						</div>
						<div class="recommend_con_txt01">
							<h2 class="title01">
								<a class="" href="javascript:;"> 다목적 드릴비트세트 </a>
							</h2>
							<label class="txt01">
								<a class="" href="javascript:;"> STEL101 400W </a>
							</label>
							<label class="txt01">
								<a class="" href="javascript:;"> [보쉬] </a>
							</label>
							<span class="price01">
								<a href=""> 125,000원 </a>
							</span>
						</div>
					</div>
				</div>
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
						<span class="left_arrow01"></span>
						<span class="top_Type01" id="goTop">
							<img src="${staticRoot}/img/arrow_top01.jpg" alt="탑 이미지" />TOP
						</span>
						<span class="right_arrow01">
							
						</span>
					</div>
					<div class="quick_kakao">
						<a href="javascript:;">
							<img src="${staticRoot}/img/quick_kakao.jpg" alt="카카오톡" />
						</a>
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
					
					