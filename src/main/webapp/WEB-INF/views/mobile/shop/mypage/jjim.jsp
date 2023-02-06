<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/layout/include/base.jsp" %>
	<script type="text/javascript">
		var dupClick1 = false;
		$(function(){  
			$('#clickTmp').on('change', function() {
	    		var id = $(this).data('value');
	    		if( $(this).prop('checked')){
	    			$('.chk').prop('checked',true);
	    		}else{
	    			$('.chk').prop('checked', false) ;
	    		}
	    	});
		});
	    function mForm(prc,row){
			$('#frm').empty();
			$('#frm').append($('<input/>', {
			    type: 'hidden',
			    id: 'procType',
			    name: 'procType',
			    value : prc
			}));
			$('#frm').append($('<input/>', {
			    type: 'hidden',
			    id: 'cnt',
			    name: 'cnt',
			    value : '1'
			}));
			$('#frm').append($('<input/>', {
			    type: 'hidden',
			    id: 'p_cd0',
			    name: 'p_cd0',
			    value : $('#p_'+row+'_cb').data('type')
			}));
			$('#frm').append($('<input/>', {
			    type: 'hidden',
			    id: 'p_dtl_cd0',
			    name: 'p_dtl_cd0',
			    value : $('#p_'+row+'_cb').data('value')
			}));
			$('#frm').append($('<input/>', {
			    type: 'hidden',
			    id: 'p_qy0',
			    name: 'p_qy0',
			    value : 1
			}));
	    }
		function openDivPop(id){
			$('#'+id).removeClass('vOff'); 
		}
		function closeDivPop(id){
			$('#'+id).addClass('vOff');
		}
	    function addCart(row){
			mForm('addCart',row);
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
	    function delFav(row){
			mForm('delFav',row);
			dupClick1 = true; 
			_BT.ajaxCallbackSubmit('frm',  _BT.SHOP.URL.User.DelFav, function(data) {
				dupClick1 = false;
				if($(data).size() > 0) { 
					if(_BT.isEquals(data.code, 'success')){
						alert(data.msg);	
						_BT.moveUrl(_BT.SHOP.URL.User.JJIM);
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
		function doAction(sAction) { 
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
			    value : 'addCart'
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
						$('#frm').append($('<input/>', {
						    type: 'hidden',
						    id: 'p_qy'+cnt,
						    name: 'p_qy'+cnt,
						    value : 1
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
			switch(sAction) {  
				case 'addChkCart': 
					if(!confirm('선택하신 상품을 장바구니에 담으시겠습니까?')){return false;}
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
					break; 
				

				case 'delChkFav': 	
					if(!confirm('선택하신 상품을 삭제하시겠습니까?')){return false;}
					dupClick1 = true; 
					_BT.ajaxCallbackSubmit('frm',  _BT.SHOP.URL.User.DelFav, function(data) {
						dupClick1 = false;
						if($(data).size() > 0) { 
							if(_BT.isEquals(data.code, 'success')){
								alert(data.msg);	
								_BT.moveUrl(_BT.SHOP.URL.User.JJIM);
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
					break; 
	    	}
	    }
	</script>
	<div class="section">
	 	<div class="tab_bar margintop_20 marginbottom_20" style="width: 100%;">
			<ul class="tab_list">
				<li class="tab_item" style="width: 100px;">
					<a href="javascript:;" class="tab_link" onclick="_BT.moveUrl(_BT.SHOP.URL.User.Info);" data-type="tab1"><span id="tab1" class="tab" style="width: 100px;">내정보</span></a>
				</li>
				<li class="tab_item" style="width: 100px;">
					<a href="javascript:;" class="tab_link" onclick="_BT.moveUrl(_BT.SHOP.URL.User.JJIM);" data-type="tab2"><span id="tab2" class="tab tabOn"  style="width: 100px;">관심상품</span></a>
				</li>
				<li class="tab_item" style="width: 100px;">
					<a href="javascript:;" class="tab_link" onclick="_BT.moveUrl(_BT.SHOP.URL.Order.OrderList);" data-type="tab3"><span id="tab3" class="tab"  style="width: 100px;">구매내역</span></a>
				</li>
			</ul>
		</div>
		<form id="frm" name="frm">
		</form>
		<div class="cart_info">
			<table class="cart_list">
				<caption>관심상품</caption>
				<colgroup>
					<col width="5%">
					<col width="14%">
					<col width="*">
					<col width="15%">
					<col width="15%">
				</colgroup>
				<tbody>
					<tr>
						<th>
							<input type="checkbox"  id="clickTmp" class="chk"/>
						</th>
						<th>
						</th>
						<th>
							상품정보
						</th>
						<th>
							금액
						</th>
						<th>
							주문
						</th>
					</tr>
					
					<c:if test="${fn:length(jjimList) lt 1}">
						<tr>
							<td colspan="5" height="200px;">
								<h1 class="title_Type04">
									관심 상품이 없습니다.
								</h1>
							</td>
						</tr>
					</c:if>
					
					<c:forEach items="${jjimList}" var="prdt1" varStatus="status">
						<c:set var="title" 			value="대화상품" />	
						<c:if test="${prdt1.PRDT_TP eq 'S'}">
							<c:set var="title" 				value="업체배송 상품" />	
						</c:if>
						<c:set var="dlvyFeeTxt" 	value="묶음배송 가능" />	
						<c:set var="dlvyTxt" 		value="택배" />	
		
						<c:if test="${prdt1.DLVY_TP eq 'H'}"> 
							<c:set var="dlvyTxt" 			value="화물택배" />	
						</c:if>
						<c:if test="${prdt1.DLVY_MEG ne '1'}"> 
							<c:set var="dlvyFeeTxt" 		value="개별배송 상품" />	
						</c:if>
						<tr>
							<td>
								<input type="checkbox" id="p_<c:out value="${status.count}_cb"/>" data-type="<c:out value="${prdt1.PRDT_CD}"/>" data-value="<c:out value="${prdt1.PRDT_CD}"/>@<c:out value="${prdt1.PRDT_DTL_CD}"/>" class="chk"/>
							</td>
							<td class="cart_txt01">
								<div class="cart_img2">
									<c:choose>
						<c:when test="${fn:indexOf(prdt1.PRDT_IMG, '//') >=0 }">
						<img src="<c:out value="${prdt1.PRDT_IMG}"/>" alt="상품사진" class="cart_pic" onerror="this.src='${staticRoot}/img/sample03.jpg'"/> 
</c:when>
						<c:otherwise>
									<img src="${upload}<c:out value="${prdt1.PRDT_IMG}"/>" alt="상품사진" class="cart_pic" onerror="this.src='${staticRoot}/img/sample03.jpg'"/> 
</c:otherwise>
						</c:choose>
								</div>
							</td>
							<td>
								<p class="cart_txt01">
									<c:out value="${prdt1.PRDT_NM}"/>
								</p>
								<p class="cart_txt02">
									[<c:out value="${prdt1.MAKR_NM}"/>] <c:out value="${prdt1.STNDRD}"/>
								</p>
								<p class="cart_txt02">
									<c:out value="${title}"/> / <c:out value="${dlvyTxt}"/> / <c:out value="${dlvyFeeTxt}"/>
								</p>
							</td>
							<td>
								<p class="cart_price02">
									<fmt:formatNumber value="${prdt1.SEL_PRICE}" groupingUsed="true"/>원
								</p>
							</td>
							<td>
								<span class="cart_order_btn" onclick="addCart('<c:out value="${status.count}"/>');">
									장바구니
								</span>
								<span class="del_btn" onclick="delFav('<c:out value="${status.count}"/>');">
									삭제하기
								</span>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class="cart_btn margintop_30">
				<span class="btn_02" onclick="doAction('addChkCart');">
					선택상품 담기
				</span>
				<span class="btn_03" onclick="doAction('delChkFav');">
					선택상품 삭제
				</span>
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