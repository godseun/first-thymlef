<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/layout/include/base.jsp" %>
	<script type="text/javascript" src="${staticRoot}/sdk/sha/sha.js"></script>
	<script type="text/javascript">
		var dupClick1 = false;
		$(function(){  
			_BT.Reg.Number('prductQy');
			$('.chk').on('change', function() {
	    		if( $(this).prop('checked')){
	    			$('.est_item').prop('checked',true);
	    		}else{
	    			$('.est_item').prop('checked', false) ;
	    		}
	    	});
			$('.prductQy').on('change', function() {
				var cnt 	= $(this).val();
	            if(_BT.isEquals(cnt, "0")) {
 					$(this).val('');
 					$(this).focus();
	            	_BT.showMsg('confirmMsg','수량에 0이상의 숫자를 입력해 주세요.', false, function(){_BT.hiddenMsg('confirmMsg');});
					return false;
 				}
	            var id = $(this).data('value');
				var amt = cnt * $('#outAmt'+id).val();
				var amtTxt = amt + '';
				$('#total_amt'+id).text(amtTxt.replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,"));
	    	});
		});
		function confInfo(){
			if(dupClick1) {
            	_BT.showMsg('confirmMsg','처리중 입니다.<br/>잠시만 기다려주세요.', false, function(){_BT.hiddenMsg('confirmMsg');});
				return false;
			}
			if(_BT.isEmptyById("cmpNm")) {	
				_BT.showMsg('confirmMsg','업체명을 입력해 주세요.', false, function(){
            		$('#cmpNm').focus();
            		_BT.hiddenMsg('confirmMsg');
            	});
				return false;
			}
			if(_BT.isEmptyById("usrNm")) {	
				_BT.showMsg('confirmMsg','견적 담당자명을 입력해 주세요.', false, function(){
            		$('#usrNm').focus();
            		_BT.hiddenMsg('confirmMsg');
            	});
				return false;
			}
        	_BT.showMsg('confirmMsg','견적 기초정보를 저장 하시겠습니까?', true, function(){saveInfo();});
			return false;
		}
		function saveInfo(){
			dupClick1 = true;
			_BT.ajaxCallbackSubmit('infoFrm',  _BT.SHOP.URL.Helpdesk.EstimateMst, function(data) {
				dupClick1 = false;
				if($(data).size() > 0) {
					if(_BT.isEquals(data.code, 'success')) {
						$('#estId').val(data.estId);
		            	_BT.showMsg('confirmMsg','처리 완료 하였습니다.', false, function(){_BT.actFormSubmit("infoFrm", "POST", _BT.SHOP.URL.Helpdesk.EstimateDtl);});
						return false;
					}else{
		            	_BT.showMsg('confirmMsg','요청하신 내역을 처리 하지 못 했습니다.<br/>잠시 후 다시 확인 부탁 드립니다.', false, function(){_BT.hiddenMsg('confirmMsg');});
						return false;
					}
				}else{
	            	_BT.showMsg('confirmMsg','요청하신 내역을 처리 하지 못 했습니다.<br/>잠시 후 다시 확인 부탁 드립니다.', false, function(){_BT.hiddenMsg('confirmMsg');});
					return false;
				}
			},
			function(xhr, status, error) {
				dupClick1 = false; 
            	_BT.showMsg('confirmMsg','요청하신 내역을 처리 중 오류가 발생했습니다.<br/>잠시 후 다시 확인 부탁 드립니다.', false, function(){_BT.hiddenMsg('confirmMsg');});
				return false;
			});
		}
		
		function prdtIns(){
			if(dupClick1) {
            	_BT.showMsg('confirmMsg','처리중 입니다.<br/>잠시만 기다려주세요.', false, function(){_BT.hiddenMsg('confirmMsg');});
				return false;
			}
			if(_BT.isEmptyById("estId")) {
            	_BT.showMsg('confirmMsg','견적 기초정보가 없습니다.<br/>확인 부탁드립니다.', false, function(){_BT.hiddenMsg('confirmMsg');});
				return false;
			}
			dupClick1 = true;
			_BT.ajaxCallbackSubmit('infoFrm',  _BT.SHOP.URL.Helpdesk.SetEstId, function(data) {
				dupClick1 = false;
				if($(data).size() > 0) {
					if(_BT.isEquals(data.code, 'success')) {
						_BT.showMsg(
								'confirmMsg',
								'<span style="color:red;">[견적담기]</span> 버튼이 활성화 되었습니다.<br/>제품 검색 후 <span style="color:red;">[견적담기]</span> 버튼을 눌러주새요.',
								false, 
								function(){_BT.moveUrl(_BT.SHOP.URL.Common.Main);});
						return false;
					}else{
						_BT.showMsg('confirmMsg','요청하신 내역을 처리 하지 못 했습니다.<br/>잠시 후 다시 확인 부탁 드립니다.', false, function(){_BT.hiddenMsg('confirmMsg');});
						return false;
					}
				}else{
					_BT.showMsg('confirmMsg','요청하신 내역을 처리 하지 못 했습니다.<br/>잠시 후 다시 확인 부탁 드립니다.', false, function(){_BT.hiddenMsg('confirmMsg');});
					return false;
				}
			},
			function(xhr, status, error) {
				dupClick1 = false; 
				_BT.showMsg('confirmMsg','요청하신 내역을 처리 중 오류가 발생했습니다.<br/>잠시 후 다시 확인 부탁 드립니다.', false, function(){_BT.hiddenMsg('confirmMsg');});
				return false;
			});
		}

		function confPrdtDel(){
			if(dupClick1) {
            	_BT.showMsg('confirmMsg','처리중 입니다.<br/>잠시만 기다려주세요.', false, function(){_BT.hiddenMsg('confirmMsg');});
				return false;
			}
			var cnt = 0;
			$('#frm').empty();
			$('#frm').append($('<input/>', {
			    type: 'hidden',
			    id: 'procType',
			    name: 'procType',
			    value : 'delChk'
			}));
			$( ".est_item" ).each(function( i ) {
				if(_BT.isChecked($(this).attr("id"))){
					var r = $(this).attr("id");
					$('#frm').append($('<input/>', {
					    type: 'hidden',
					    id: 'prductDtlCode'+cnt,
					    name: 'prductDtlCode'+cnt,
					    value : $('#prductDtlCode'+r).val()
					}));
					cnt++;
				}
			});
			$('#frm').append($('<input/>', {
			    type: 'hidden',
			    id: 'cnt',
			    name: 'cnt',
			    value : cnt
			}));
			if(_BT.isEquals(cnt,0)){
            	_BT.showMsg('confirmMsg','선택하신 상품이 없습니다.', false, function(){_BT.hiddenMsg('confirmMsg');});
				return false;
			}else{
	        	_BT.showMsg('confirmMsg','해당 상품을 견적함에서 삭제 하시겠습니까?', true, function(){prdtDel();});
				return false;
			}
		}
	    function prdtDel(){
			dupClick1 = true; 
			_BT.ajaxCallbackSubmit("frm",  _BT.SHOP.URL.Helpdesk.DelEstIdPrdt, 
			function(data) {
				dupClick1 = false;
				if($(data).size() > 0) { 
					if(_BT.isEquals(data.code, "success")){
		            	_BT.showMsg('confirmMsg','삭제 완료 하였습니다.', false, function(){_BT.actFormSubmit("infoFrm", "POST", _BT.SHOP.URL.Helpdesk.EstimateDtl);});
						return false;
					}else{
						_BT.showMsg('confirmMsg','요청하신 내역을 처리 하지 못 했습니다.<br/>잠시 후 다시 확인 부탁 드립니다.', false, function(){_BT.hiddenMsg('confirmMsg');});
						return false;
					}
				}else{
					_BT.showMsg('confirmMsg','요청하신 내역을 처리 하지 못 했습니다.<br/>잠시 후 다시 확인 부탁 드립니다.', false, function(){_BT.hiddenMsg('confirmMsg');});
					return false;
				}
			},
			function(xhr, status, error) {
				dupClick1 = false; 
				_BT.showMsg('confirmMsg','요청하신 내역을 처리 중 오류가 발생했습니다.<br/>잠시 후 다시 확인 부탁 드립니다.', false, function(){_BT.hiddenMsg('confirmMsg');});
				return false;
			});	
	    }

		function confReqEst(){
			if(dupClick1) {
            	_BT.showMsg('confirmMsg','처리중 입니다.<br/>잠시만 기다려주세요.', false, function(){_BT.hiddenMsg('confirmMsg');});
				return false;
			}
        	_BT.showMsg('confirmMsg','견적 요청 하시겠습니까?', true, function(){reqEst();});
			return false;
		}

		function reqEst(){ 
			dupClick1 = true; 
			_BT.ajaxCallbackSubmit("prdtFrm",  _BT.SHOP.URL.Helpdesk.ReqEst, 
			function(data) {
				dupClick1 = false;
				if($(data).size() > 0) { 
					if(_BT.isEquals(data.code, "success")){
		            	_BT.showMsg('confirmMsg','견적요청 완료 하였습니다.<br/>업무일 기준 24시간 안에 회신예정 입니다.', false, function(){_BT.moveUrl(_BT.SHOP.URL.Helpdesk.Estimate);});
						return false;
					}else{
						_BT.showMsg('confirmMsg','요청하신 내역을 처리 하지 못 했습니다.<br/>잠시 후 다시 확인 부탁 드립니다.', false, function(){_BT.hiddenMsg('confirmMsg');});
						return false;
					}
				}else{
					_BT.showMsg('confirmMsg','요청하신 내역을 처리 하지 못 했습니다.<br/>잠시 후 다시 확인 부탁 드립니다.', false, function(){_BT.hiddenMsg('confirmMsg');});
					return false;
				}
			},
			function(xhr, status, error) {
				dupClick1 = false; 
				_BT.showMsg('confirmMsg','요청하신 내역을 처리 중 오류가 발생했습니다.<br/>잠시 후 다시 확인 부탁 드립니다.', false, function(){_BT.hiddenMsg('confirmMsg');});
				return false;
			});	
	    }

		function confCanEst(){
			if(dupClick1) {
            	_BT.showMsg('confirmMsg','처리중 입니다.<br/>잠시만 기다려주세요.', false, function(){_BT.hiddenMsg('confirmMsg');});
				return false;
			}
        	_BT.showMsg('confirmMsg','견적 취소 하시겠습니까?', true, function(){canEst();});
			return false;
		}
		
	    function canEst(){
			dupClick1 = true; 
			_BT.ajaxCallbackSubmit("infoFrm",  _BT.SHOP.URL.Helpdesk.CanEst, 
			function(data) {
				dupClick1 = false;
				if($(data).size() > 0) { 
					if(_BT.isEquals(data.code, "success")){
		            	_BT.showMsg('confirmMsg','견적취소 완료 하였습니다.', false, function(){_BT.moveUrl(_BT.SHOP.URL.Helpdesk.Estimate);});
						return false;
					}else{
						_BT.showMsg('confirmMsg','요청하신 내역을 처리 하지 못 했습니다.<br/>잠시 후 다시 확인 부탁 드립니다.', false, function(){_BT.hiddenMsg('confirmMsg');});
						return false;
					}
				}else{
					_BT.showMsg('confirmMsg','요청하신 내역을 처리 하지 못 했습니다.<br/>잠시 후 다시 확인 부탁 드립니다.', false, function(){_BT.hiddenMsg('confirmMsg');});
					return false;
				}
			},
			function(xhr, status, error) {
				dupClick1 = false; 
				_BT.showMsg('confirmMsg','요청하신 내역을 처리 중 오류가 발생했습니다.<br/>잠시 후 다시 확인 부탁 드립니다.', false, function(){_BT.hiddenMsg('confirmMsg');});
				return false;
			});
	    }
	</script>
	<div class="section" style="min-height: 1000px;">
		<h1 class="title_Type03">
			견적요청서 상세
			<div class="sub_location">
				<div class="list_location01">
					<span class="txt01">고객만족 센터</span>
					<span class="arrow"><img src="${staticRoot}/img/bl_01.jpg" alt=">" /></span>
					<span class="last_txt">견적요청서</span>
				</div>
			</div>
		</h1>
		<div class="notcie_board">					
			<div class="faq_txt_01">
				견적요청서 작성
			</div>
			<h1 class="title_con_Type01 margintop_30" style="margin-bottom:10px;">
				필수 정보			
			</h1>
			<c:set var="READ_ONLY" 	value="" />	
			<c:if test="${estInfo.STTUS eq '8'}">
				<c:set var="READ_ONLY" 	value="readonly='readonly'" />	
			</c:if>
			<form id="frm" name="frm">
			</form>
			<form id="infoFrm" name="infoFrm">
				<input type="hidden" id="estId" name="estId" value="<c:out value="${estInfo.EST_ID}"/>" />
				<table class="tbl_Type03">
					<caption>사업자정보</caption>
					<colgroup>
						<col width="18%">
						<col width="32%">
						<col width="18%">
						<col width="32%">
					</colgroup>
					<tbody>			
						<tr>
							<th style="text-align: right; padding-right :20px;">
								<img class="required"/><span style="color: red;">(필수)</span> 업체명
							</th>
							<td>
								<input type="text" class="join_form_input03" id="cmpNm" name="cmpNm" placeholder="업체명을 입력해 주세요." value="<c:out value="${estInfo.CMP_NM}"/>"  ${READ_ONLY}/>
							</td>
							<th style="text-align: right; padding-right :20px;">
								<img class="required"/><span style="color: red;">(필수)</span> 견적 담당자
							</th>
							<td>
								<input type="text" class="join_form_input03" id="usrNm" name="usrNm" maxlength="25" placeholder="견적 담당자명을 입력해 주세요." value="<c:out value="${estInfo.CHAR_NM}"/>" ${READ_ONLY}/>
							</td>
						</tr>
						<tr>
							<th style="text-align: right; padding-right :20px;">
								연락처
							</th>
							<td>
								<c:out value="${estimateInfo.usrMo}"/>
							</td>
							<th style="text-align: right; padding-right :20px;">
								견적 요청일
							</th>
							<td>
								<c:set var = "now" value = "<%= new java.util.Date()%>" />
								<fmt:formatDate pattern = "yyyy-MM-dd"  value = "${now}" />
							</td>
						</tr>
					</tbody>
				</table>		
				<h1 class="title_con_Type01 margintop_40" style="margin-bottom:10px;">
					추가 정보			
				</h1>
				<table class="tbl_Type03">
					<caption>사업자정보</caption>
					<colgroup>
						<col width="18%">
						<col width="32%">
						<col width="18%">
						<col width="32%">
					</colgroup>
					<tbody>			
						<tr>
							<th style="text-align: right; padding-right :20px;">대표자명</th>
							<td>
								<input type="text" class="join_form_input03" id="prsNm" name="prsNm" maxlength="25" placeholder="대표자 성함을 입력해 주세요." value="<c:out value="${estInfo.RPRSNTV_NM}"/>" ${READ_ONLY}/>
							</td>
							<th style="text-align: right; padding-right :20px;">
								이메일
							</th>
							<td>
								<input type="text" class="join_form_input03" id="email" name="email" maxlength="30" placeholder="담당자 이메일" value="<c:out value="${estInfo.CHAR_EMAIL}"/>" ${READ_ONLY}/>
							</td>
						</tr>
						<tr>
							<th style="text-align: right; padding-right :20px;">
								업태
							</th>
							<td>
								<input type="text" class="join_form_input03" id="telNum" name="bizcnd" maxlength="50" placeholder="업태를 입력해 주세요." value="<c:out value="${estInfo.BIZCND}"/>" ${READ_ONLY}/>
							</td>
							<th style="text-align: right; padding-right :20px;">
								종목
							</th>
							<td>
								<input type="text" class="join_form_input03" id="faxNum" name="induty" maxlength="50" placeholder="종목을 입력해 주세요." value="<c:out value="${estInfo.INDUTY}"/>" ${READ_ONLY}/>
							</td>
						</tr>
						<tr>
							<th style="text-align: right; padding-right :20px;">
								전화번호
							</th>
							<td>
								<input type="text" class="join_form_input03" id="telNum" name="telNum" maxlength="15" placeholder="전화번호를 입력해 주세요." value="<c:out value="${estInfo.TEL_NO}"/>" ${READ_ONLY}/>
							</td>
							<th style="text-align: right; padding-right :20px;">
								팩스번호
							</th>
							<td>
								<input type="text" class="join_form_input03" id="faxNum" name="faxNum" maxlength="15" placeholder="팩스번호를 입력해 주세요." value="<c:out value="${estInfo.FAX_NO}"/>" ${READ_ONLY}/>
							</td>
						</tr>
						<tr>
							<th style="text-align: right; padding-right :20px;">주소</th>
							<td colspan="3">
								<input type="text" class="join_form_input03" id="address" name="address" maxlength="100" style="width:100%;" placeholder="주소를 입력해 주세요." value="<c:out value="${estInfo.ADRESS}"/>" ${READ_ONLY}/>
							</td>
						</tr>
						<tr>
							<th style="text-align: right; padding-right :20px;">비고/추가사항</th>
							<td colspan="3">
								<input type="text" class="join_form_input03" id="reqRmk" name="reqRmk" maxlength="100" style="width:100%;" placeholder="비고 / 추가사항을 입력해 주세요." value="<c:out value="${estInfo.REQ_RMK}"/>" ${READ_ONLY}/>
							</td>
						</tr>
					</tbody>
				</table>					
			</form>
			<div class="signup_agree">
				<p class="alarm_txt">※ 추가정보를 입력 하시면 [견적 의뢰서], [견적서] 출력시 해당 내용이 표시 됩니다.</p>
			</div>
			<div class="cart_btn margintop_20 marginbottom_10">
				<c:if test="${estInfo.STTUS ne '8' or empty estInfo.STTUS}">
					<span class="btn_01" onclick="confInfo();">
						저장
					</span>
				</c:if>
			</div>
			<h1 class="title_con_Type01 margintop_30">
				견적요청 상품정보						
			</h1>
			<form id="prdtFrm" name="prdtFrm">
				<input type="hidden" id="estIdP" name="estId" value="<c:out value="${estInfo.EST_ID}"/>"/>
				<table class="cart_list margintop_10">		
					<caption>견적함</caption>
					<colgroup>
						<col width="8%">
						<col width="14%">
						<col width="25%">
						<col width="10%">
						<col width="8%">
						<col width="12%">
						<col width="*">
					</colgroup>
					<tbody>
						<tr>
							<th>
								<input type="checkbox"  id="clickTmp" class="chk"/>
							</th>
							<th class="cart_th_01"> </th>
							<th>
								상품정보
							</th>
							<th>
								판매가격(단위)
							</th>
							<th>
								수량
							</th>
							<th>
								총수량
							</th>
							<th>
								비고
							</th>
						</tr>
						<c:choose>
							<c:when test="${fn:length(estPrdt) lt 1}">
								<tr>
									<td colspan="7" height="200px;">
										<h1 class="title_Type04">
											견적서에 상품이 없습니다.
										</h1>
									</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach items="${estPrdt}" var="est" varStatus="status">
									<tr>
										<td>
											<input type="hidden" id="prductDtlCode<c:out value="${status.count}"/>" name="prductDtlCode" value="${est.PRDT_DTL_CD}"/>	
											<input type="hidden" id="outAmt<c:out value="${status.count}"/>" name="outAmt" value="${est.OUT_AMT}"/>	
											<input type="checkbox" class="est_item c_<c:out value="${est.PRDT_DTL_CD}"/>" id="<c:out value="${status.count}"/>" />
										</td>
										<td class="cart_th_01"> 
											<div class="cart_img">
											<c:choose>
											<c:when test="${fn:indexOf(est.PRDT_IMG, '//') >=0 }">
											<img src="<c:out value="${est.PRDT_IMG}"/>" alt="상품사진" class="cart_pic" onerror="this.src='${staticRoot}/img/sample03.jpg'"/> 
											</c:when>
											<c:otherwise>
												<img src="${upload}<c:out value="${est.PRDT_IMG}"/>" alt="상품사진" class="cart_pic" onerror="this.src='${staticRoot}/img/sample03.jpg'"/> 
											</c:otherwise>
											</c:choose>
											</div>
										</td>
										<td style="text-align: left;line-height: 200%;">
										<p>
											[<c:out value="${est.MAKR_NM}"/>] <c:out value="${est.PRDT_NM}"/>
										</p>
										<p>
											<c:out value="${est.STNDRD}"/>
										</p>
										</td>
										<td>
											<fmt:formatNumber value="${est.PRICE}" groupingUsed="true"/>원<br/>
											(<c:out value="${est.OUT_AMT}"/>&nbsp;<c:out value="${est.OUT_UNIT}"/>)
										</td>
										<td>
											<input type="text" class="join_form_input03 prductQy" id="prductQy<c:out value="${status.count}"/>" name="prductQy" data-value="<c:out value="${status.count}"/>" style="width: 50px;text-align: right" value="<c:out value="${est.QY}"/>" ${READ_ONLY}/>
										</td>
										<td>
											<span id="total_amt<c:out value="${status.count}"/>">
												<fmt:formatNumber value="${est.OUT_AMT * est.QY}" groupingUsed="true"/>
											</span>
											<c:out value="${est.UNIT}"/>
										</td>
										<td>
											<textarea id="prductRmk<c:out value="${status.count}"/>" name="prductRmk" style="width: 98%;" rows="4" placeholder="비고 내용을 입력해 주세요." ${READ_ONLY}><c:out value="${est.RMK}"/></textarea>
										</td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>	
					</tbody>
				</table>	
			</form>
			<c:if test="${estInfo.STTUS eq '7'}">
				<h1 class="title_con_Type01 margintop_30">
					진행보류 사유 : <c:out value="${estInfo.REC_RMK}"/>	
				</h1>
			</c:if>
			<div class="cart_btn margintop_20 marginbottom_10">
				<c:choose>
					<c:when test="${estInfo.STTUS lt '1'}">
						<span class="btn_11" onclick="prdtIns();">
							상품선택 하기
						</span>
						<span class="btn_03" onclick="confPrdtDel();">
							선택상품 삭제
						</span>
						<span class="btn_02" onclick="confReqEst();">
							견적요청
						</span>
					</c:when>
					<c:when test="${estInfo.STTUS eq '1' or estInfo.STTUS eq '2' or estInfo.STTUS eq '7'}">
						<span class="btn_03" onclick="confCanEst();">
							견적취소
						</span>
					</c:when>
				</c:choose>
			</div>	
		</div>	
	</div>
	<div class="confirmMsg vOff" id="confirmMsg">
		<div class="all_bg"> </div>
		<div class="confirmMsg_content" style="width: 350px;height:200px;">
			<h1 class="blue_title">
				견적요청서 작성
				<span class="close" onclick="_BT.hiddenMsg('confirmMsg');" >
				</span>
			</h1>
			<div class="confirmMsg_substance">
				<h1 class="confirm_title1" id="confirmMsg_msg" style="line-height: 150%;">
					견적요청서 작성중 입니다.
				</h1>
				<div class="margintop_20">
					<span class="confirm_btn1 vOff" id="confirmMsg_btn1">
						예
					</span>
					<span class="confirm_btn2 vOff" id="confirmMsg_btn2">
						아니오
					</span>
					<span class="confirm_btn1 vOff" id="confirmMsg_btn3">
						확인
					</span>
				</div>
			</div>
		</div>
	</div> 