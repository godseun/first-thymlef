<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/layout/include/base.jsp" %>
	<script type="text/javascript">
		var dupClick1 = false;
		$(function(){  
			_BT.Reg.Number("mobile");
	        $(".goDtl").on("click",function(){ 
	        	$('#estId').val($(this).data('value'));
				//_BT.actFormSubmit("infoFrm", "POST", _BT.SHOP.URL.Helpdesk.EstimateDtl); 
				$('#infoFrm').attr('method', 'POST').attr('target', '_self').attr('action', _BT.SHOP.URL.Helpdesk.EstimateDtl).submit();
	        });
		});
		function newIns(){
			//_BT.actFormSubmit("frm", "POST", ); 
			$('#frm').attr('method', 'POST').attr('target', '_self').attr('action', _BT.SHOP.URL.Helpdesk.EstimateIns).submit();
		}
		function showEstDoc(sttus,estId){
			if(sttus == '0' || sttus == '8'){
            	_BT.showMsg('confirmMsg','견적요청 후 견적의뢰서 출력이 가능 합니다.', false, function(){_BT.hiddenMsg('confirmMsg');});
				return false;
			}else{
				$('#estId').val(estId);
				_BT.openPopup('','EstDoc', '600', '820', true, true);
				$('#infoFrm').attr('method', 'POST').attr('target', 'EstDoc').attr('action', _BT.SHOP.URL.Helpdesk.EstReqDocPop).submit();			
			}
		}
		function showEstDoc2(sttus,estId){
			if(sttus != '9'){
            	_BT.showMsg('confirmMsg','견적서 회신 후 출력이 가능 합니다.', false, function(){_BT.hiddenMsg('confirmMsg');});
				return false;
			}else{
				$('#estId').val(estId);
				_BT.openPopup('','EstDoc', '700', '850', true, true);
				$('#infoFrm').attr('method', 'POST').attr('target', 'EstDoc').attr('action', _BT.SHOP.URL.Helpdesk.EstDocPop).submit();			
			}
		}
	</script>
	<div class="section" style="min-height: 1000px;">
		<h1 class="title_Type03">
			견적 시스템
			<div class="sub_location">
				<div class="list_location01">
					<span class="txt01">고객만족 센터</span>
					<span class="arrow"><img src="${staticRoot}/img/bl_01.jpg" alt=">" /></span>
					<span class="last_txt">견적 시스템</span>
				</div>
			</div>
		</h1>
		<h1 class="title_con_Type01 margintop_20" style="margin-right:10px; text-align: left;">
			견적 리스트
		</h1>
		<form id="infoFrm" name="infoFrm">
			<input type="hidden" id="estId" name="estId" />
		</form>
		<form id="frm" name="frm">
			<table class="cart_list margintop_10">		
				<caption>견적함</caption>
				<colgroup>
					<col width="8%">
					<col width="15%">
					<col width="*">
					<col width="12%">
					<col width="8%">
					<col width="15%">
				</colgroup>
				<tbody>
					<tr>
						<th>
							<input type="checkbox"  id="clickTmp" class="chk"/>
						</th>
						<th>
							견적번호
						</th>
						<th>
							품목
						</th>
						<th>
							견적요청일
						</th>
						<th>
							진행상태
						</th>
						<th>
							양식출력
						</th>
					</tr>
					<c:choose>
						<c:when test="${fn:length(estList) lt 1}">
							<tr>
								<td colspan="6" height="200px;">
									<h1 class="title_Type04">
										견적함이 비어있습니다.
									</h1>
								</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach items="${estList}" var="est" varStatus="status">
								<tr>
									<td>
										<input type="checkbox" class="cart_item c_<c:out value="${est.EST_ID}"/>" id="<c:out value="${status.count}"/>" />
									</td>
									<td>
										<a href="javascript:;" class="goDtl" data-value="<c:out value="${est.EST_ID}"/>">
											ST-EST-<c:out value="${est.EST_ID}"/>
										</a>
									</td>
									<td>
										<c:out value="${est.PRDT_NM}"/><c:out value="${est.CNT}"/>
									</td>
									<td>
										<fmt:formatDate pattern = "yyyy-MM-dd"  value = "${est.REQ_DT}" />
									</td>
									<td>
										<c:out value="${est.STTUS_TXT}"/>
									</td>
									<td>
										<span onclick="showEstDoc2('<c:out value="${est.STTUS}"/>','<c:out value="${est.EST_ID}"/>')" class="sButton btn_span fs-13 pink marginleft_5" style="float: right; margin-bottom: 0px;">견적서</span>
										<span onclick="showEstDoc('<c:out value="${est.STTUS}"/>','<c:out value="${est.EST_ID}"/>')" class="sButton btn_span fs-13 blue" style="float: right; margin-bottom: 0px;">견적의뢰서</span>
									</td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>	
				</tbody>
			</table>		
		</form> 
		<div class="cart_btn margintop_20 marginbottom_10">
			<span class="btn_01" onclick="newIns();">
				신규작성
			</span>
			<span class="btn_02" onclick="buyChk();">
				선택견적 삭제
			</span>
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