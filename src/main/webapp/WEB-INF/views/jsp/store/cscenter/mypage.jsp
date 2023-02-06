<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/layout/include/base.jsp" %>
	<script src="http://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
	<script>
	    function fnPostcode() {
		    new daum.Postcode({
		        oncomplete: function(data) {
		        	$('#rtnZipCd').val(data.zonecode);
		        	$('#rtnAdres').val(data.address);
		        	$('#rtnAdresDtl').val('('+data.bname+')');
		        }
		    }).open();
	    }
	</script>
	<script type="text/javascript">
		var dupClick1 = false;
		$(function(){  
		});
		function fnNextStep(){
			if( dupClick1 ) {
				alert('저장 중 입니다.\n\n잠시만 기다려주세요.');
				return false;
			}

			if(_BT.isEmptyById('dlvyFee',   	'기본 배송비를 입력해 주세요.')) return false;
			if(_BT.isEmptyById('rtnFee',		'구매자 귀책 [환불] 배송비를 입력해 주세요.')) return false;
			if(_BT.isEmptyById('echgFee',		'구매자 귀책 [교환] 배송비를 입력해 주세요.')) return false;
			if(_BT.isEmptyById('rtnZipCd',		'반품 배송 주소지를 입력해 주세요.')) return false;
			if(_BT.isEmptyById('rtnAdresDtl',	'반품 배송 주소지를 입력해 주세요.')) return false;
			if(_BT.isEmptyById('acntr',			'예금주를 입력해 주세요.')) return false;
			if(_BT.isEmptyById('acnutNo',		'계좌번호를 입력해 주세요.')) return false;
			if(_BT.isEmptyById('texEmail',		'세금계산서 수신이메일을 입력해 주세요.')) return false;
			
			if(!confirm('정보를 변경 하시겠습니까?')){
				return false;
			}
			var mobileNo = _BT.getJoinData("-", new Array("mobile1","mobile2","mobile3"));
			$("#mobile").val(mobileNo);
			dupClick1 = true;
			_BT.ajaxCallbackSubmit('infoFrm',  _BT.STORE.URL.CsCenter.SetStoreInfo, function(data) {
				dupClick1 = false;
				if($(data).size() > 0) {
					if(_BT.isEquals(data.code, 'success')) {
						alert('정보변경 완료 하였습니다.\n\n변경된 새로 로그인시 반영 됩니다.');
						return false;
					}else{
						alert('정보변경변경 처리를 하지 못 했습니다.\n\n잠시 후 다시 확인 부탁 드립니다.');
						return false;
					}
				}else{
					alert('정보변경 처리를 하지 못 했습니다.\n\n잠시 후 다시 확인 부탁 드립니다.');
					return false;
				}
			},
			function(xhr, status, error) {
				dupClick1 = false; 
				alert('정보변경 처리 중 오류가 발생했습니다.\n\n잠시 후 다시 확인 부탁 드립니다.');
				return false;
			});
		}
	</script>
	<div class="storeSection">
	 	<div class="tab_bar">
			<ul class="tab_list">
				<li class="tab_item">
					<a href="javascript:;" class="tab_link" onclick="_BT.moveUrl(_BT.STORE.URL.CsCenter.Mypage);">
						<span id="tab1" class="tab<c:if test="${lnb.sId eq 1}"> tabOn</c:if>">나의정보</span>
					</a>
				</li>
				<li class="tab_item">
					<a href="javascript:;" class="tab_link" onclick="_BT.moveUrl(_BT.STORE.URL.CsCenter.PwChg);">
						<span id="tab2" class="tab<c:if test="${lnb.sId eq 2}"> tabOn</c:if>">비밀번호변경</span>
					</a>
				</li>
			</ul>
		</div>
		<h1 class="title_con_Type01 margintop_30">
			사업자정보						
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
					<th style="text-align: right; padding-right :20px;">사업자 등록번호</th>
					<td>
						<c:out value="${storeInfo.CMP_BIZ_NO}"/>
					</td>
					<th style="text-align: right; padding-right :20px;">상점아이디</th>
					<td>
						<c:out value="${storeInfo.STORE_ID}"/>
					</td>
				</tr>
				<tr>
					<th style="text-align: right; padding-right :20px;">상호명</th>
					<td>
						<c:out value="${storeInfo.CMP_NM}"/>
					</td>
					<th style="text-align: right; padding-right :20px;">대표자명</th>
					<td>
						<c:out value="${storeInfo.RPRSNTV_NM}"/>
					</td>
				</tr>
				<tr>
					<th style="text-align: right; padding-right :20px;">업태</th>
					<td>
						<c:out value="${storeInfo.BIZCND}"/>
					</td>
					<th style="text-align: right; padding-right :20px;">업종</th>
					<td>
						<c:out value="${storeInfo.INDUTY}"/>
					</td>
				</tr>
				<tr>
					<th style="text-align: right; padding-right :20px;">전화번호</th>
					<td>
						<c:out value="${storeInfo.TEL_NO}"/>
					</td>
					<th style="text-align: right; padding-right :20px;">팩스번호</th>
					<td>
						<c:out value="${storeInfo.FAX_NO}"/>
					</td>
				</tr>
				<tr>
					<th style="text-align: right; padding-right :20px;">주소</th>
					<td colspan="3">
						( <c:out value="${storeInfo.ZIP_CD}"/> ) <c:out value="${storeInfo.ADRES}"/> <c:out value="${storeInfo.ADRES_DTL}"/>
					</td>
				</tr>
				<tr>
					<th style="text-align: right; padding-right :20px;">이메일</th>
					<td colspan="3">
						<c:out value="${userSession.email}"/>
					</td>
				</tr>	 
			</tbody>
		</table>
		<form id="infoFrm" name="infoFrm">
			<input type="hidden" id="mobile" name="mobile" />
			<div class="signup_agree margintop_10">
				<p class="alarm_txt">※사업자 정보 변경은 게시판에서 해당 정보 기입 후 변경요청 가능 합니다. <span class="redCr bTxt" ></span></p>
			</div>
			<h1 class="title_con_Type01 margintop_30">
				연락처 정보						
			</h1>
			<table class="tbl_Type03">
				<caption>연락처 정보</caption>
				<colgroup>
					<col width="18%">
					<col width="32%">
					<col width="18%">
					<col width="32%">
				</colgroup>
				<tbody>		
					<tr>
						<th style="text-align: right; padding-right :20px;">재고몰 상점명</th>
						<td>
							<input type="text" class="join_form_input07" id="prsNm" name="prsNm" maxlength="25" value="<c:out value="${storeInfo.STORE_NM}"/>"/>
						</td>
						<th style="text-align: right; padding-right :20px;">담당부서</th>
						<td>
							<input type="text" class="join_form_input07" id="prsNm" name="prsNm" maxlength="25" value="<c:out value="${storeInfo.CHARGER_DEPT}"/>"/>
						</td>
					</tr>
					<tr>
						<th style="text-align: right; padding-right :20px;">노출명</th>
						<td colspan="3">
							<input id="click01" name="showTp" value="C" <c:if test="${storeInfo.SHOW_TP eq 'C'}"> checked="checked"</c:if> class="join_checkbox" type="radio"><label class="join_form_check" for="click01">상호명</label>
							<input id="click02" name="showTp" value="S" <c:if test="${storeInfo.SHOW_TP eq 'S'}"> checked="checked"</c:if> class="join_checkbox" type="radio"><label class="join_form_check" for="click02">재고몰 상점명</label>
							<span class="redCr" style="margin-left: 20px;">※  선택하신 명칭으로 쇼핑몰에 노출 됩니다.<span class="redCr bTxt" ></span></span>
						</td>
					</tr>
					<tr>
						<th style="text-align: right; padding-right :20px;">담당자</th>
						<td>
							<input type="text" class="join_form_input07" id="usrNm" name="usrNm" maxlength="25" value="<c:out value="${storeInfo.CHARGER_NM}"/>"/>
						</td>
						<th style="text-align: right; padding-right :20px;">연락처</th>
						<td>
							<c:set var="mobile1" 		value="${fn:split(storeInfo.CHARGER_TEL_NO,'-')[0]}" />
							<select name="mobile1" id="mobile1" class="join_form_select06 mobile">
								<option value="010" <c:if test="${mobile1 eq '010'}">selected="selected"</c:if>>010</option>
								<option value="011" <c:if test="${mobile1 eq '011'}">selected="selected"</c:if>>011</option>
								<option value="016" <c:if test="${mobile1 eq '016'}">selected="selected"</c:if>>016</option>
								<option value="017" <c:if test="${mobile1 eq '017'}">selected="selected"</c:if>>017</option>
								<option value="018" <c:if test="${mobile1 eq '018'}">selected="selected"</c:if>>018</option>
								<option value="019" <c:if test="${mobile1 eq '019'}">selected="selected"</c:if>>019</option>
							</select>
							<span class="join_form_txt">-</span>
							<input type="text" name="mobile2" id="mobile2" class="join_form_input06 mobile" maxlength="4" size="4" value="<c:out value="${fn:split(storeInfo.CHARGER_TEL_NO,'-')[1]}"/>" />
							<span class="join_form_txt">-</span>
							<input type="text" name="mobile3" id="mobile3" class="join_form_input06 mobile" maxlength="4" size="4" value="<c:out value="${fn:split(storeInfo.CHARGER_TEL_NO,'-')[2]}"/>" />
						</td>
					</tr>
				</tbody>
			</table>
			<h1 class="title_con_Type01 margintop_30">
				배송정보						
			</h1>
			<table class="join_form">
				<caption>연락처 정보</caption>
				<colgroup>
					<col width="18%">
					<col width="32%">
					<col width="18%">
					<col width="32%">
				</colgroup>
				<tbody>
					<tr>
						<th>기본 배송비</th>
						<td> 
							<input type="text" class="join_form_input01" id="dlvyFee" name="dlvyFee" value="<c:out value="${storeInfo.DLVY_FEE}"/>" placeholder="예)3000"/>원
						</td>
						<th>무료배송 정보</th>
						<td> 
							<select name="freeDlvy" id="freeDlvy" class="join_form_select06 mobile">
								<option value="Y" <c:if test="${storeInfo.FREE_DLVY eq 'Y'}">selected="selected"</c:if>>가능</option>
								<option value="N" <c:if test="${storeInfo.FREE_DLVY eq 'N'}">selected="selected"</c:if>>불가</option>
							</select>
							<span class="redCr" style="margin-left:20px;">무료배송 금액</span>
							<input type="text" class="join_form_input01" id="freeAmt" name="freeAmt" value="<c:out value="${storeInfo.FREE_AMT}"/>" placeholder="예)50000"/>원
							<span class="redCr" style="margin-left:5px;">이상</span>
						</td>
					</tr>
					<tr>
						<th>구매자 귀책 환불 배송비</th>
						<td> 
							<input type="text" class="join_form_input01" id="rtnFee" name="rtnFee" value="<c:out value="${storeInfo.RTN_FEE}"/>" placeholder="예)3000"/>원
						</td>
						<th>구매자 귀책 교환 배송비</th>
						<td> 
							<input type="text" class="join_form_input01" id="echgFee" name="echgFee" value="<c:out value="${storeInfo.ECHG_FEE}"/>" placeholder="예)6000"/>원
						</td>
					</tr>
					<tr>
						<th>도서산간지역 추가배송비</th>
						<td colspan="3"> 
							<select name="extraFeeTp" id="extraFeeTp" class="join_form_select06 mobile">
								<option value="Y" <c:if test="${storeInfo.EXTRA_FEE_TP eq 'Y'}">selected="selected"</c:if>>부과</option>
								<option value="N" <c:if test="${storeInfo.EXTRA_FEE_TP eq 'N'}">selected="selected"</c:if>>미부과</option>
							</select>
							<span class="redCr" style="margin-left:20px;">택배</span>
							<span style="margin-left:15px;">도서산간</span>
							<input type="text" class="join_form_input01" id="T_ZONE1" name="T_ZONE1" value="<c:out value="${storeInfo.T_ZONE1}"/>" placeholder="예)6000"/>원
							<span style="margin-left:15px;">제주지역</span>
							<input type="text" class="join_form_input01" id="T_ZONE2" name="T_ZONE2" value="<c:out value="${storeInfo.T_ZONE2}"/>" placeholder="예)6000"/>원
<%-- 							
							<span class="redCr bTxt" style="margin-left:20px;">화물택배</span>
							<span style="margin-left:15px;">도서산간</span>
							<input type="text" class="join_form_input01" id="H_ZONE1" name="H_ZONE1" value="<c:out value="${storeInfo.H_ZONE1}"/>"/>
							<span style="margin-left:15px;">제주지역</span>
							<input type="text" class="join_form_input01" id="H_ZONE2" name="H_ZONE2" value="<c:out value="${storeInfo.H_ZONE2}"/>"/>
 --%>				
						</td>				
					</tr>
					<tr>
						<th>반품지정택배 이용여부</th>
						<td>
							<select name="appnRtnHdry" id="appnRtnHdry" class="join_form_select06 mobile" style="width:80px; ">
								<option value="N" <c:if test="${storeInfo.APPN_RTN_HDRY eq 'N'}">selected="selected"</c:if>>미지정</option>
								<option value="Y" <c:if test="${storeInfo.APPN_RTN_HDRY eq 'Y'}">selected="selected"</c:if>>지정</option>
							</select>
							<span class="redCr" style="margin-left: 10px;">※  계약 택배사 있을시, '지정' 선택.<span class="redCr bTxt" ></span></span>
						</td>
						<th>반품지정 택배사</th>
						<td>
							<select name="hdry" id="hdry" class="join_form_select05 mobile">
								<c:forEach items="${dlvyList}" var="dlvy" varStatus="status1">
									<option value="<c:out value="${dlvy.cbCode}"/>" <c:if test="${storeInfo.HDRY eq dlvy.cbCode}">selected="selected"</c:if>><c:out value="${dlvy.cbText}"/></option>
								</c:forEach>
							</select>
						</td>
					</tr>
					<tr>
						<th>반품 배송 주소지</th>
						<td colspan="3">
							<c:choose>
								<c:when test="${! empty storeInfo.RTN_ZIP_CD}">
									<input type="text" class="join_form_input01" id="rtnZipCd" name="rtnZipCd" readonly="readonly" value="<c:out value="${storeInfo.RTN_ZIP_CD}"/>" />
									<span class="join_form_btn01" onclick="fnPostcode();">우편번호검색</span>
									<input type="text" class="join_form_input03 marginleft_10" id="rtnAdres" name="rtnAdres" readonly="readonly" value="<c:out value="${storeInfo.RTN_ADRES}"/>" />
									<input type="text" class="join_form_input03 marginleft_10" id="rtnAdresDtl" name="rtnAdresDtl" value="<c:out value="${storeInfo.RTN_ADRES_DTL}"/>"/>
								</c:when>
								<c:otherwise>
									<input type="text" class="join_form_input01" id="rtnZipCd" name="rtnZipCd" readonly="readonly" value="<c:out value="${storeInfo.ZIP_CD}"/>" />
									<span class="join_form_btn01" onclick="fnPostcode();">우편번호검색</span>
									<input type="text" class="join_form_input03 marginleft_10" id="rtnAdres" name="rtnAdres" readonly="readonly" value="<c:out value="${storeInfo.ADRES}"/>" />
									<input type="text" class="join_form_input03 marginleft_10" id="rtnAdresDtl" name="rtnAdresDtl" value="<c:out value="${storeInfo.ADRES_DTL}"/>"/>
								</c:otherwise>
							</c:choose>						
						</td>
					</tr>
				</tbody>
			</table>
			<h1 class="title_con_Type01 margintop_30">
				정산정보						
			</h1>
			<table class="join_form">
				<caption>정산정보</caption>
				<colgroup>
					<col width="18%">
					<col width="32%">
					<col width="18%">
					<col width="32%">
				</colgroup>
				<tbody>			
					<tr>
						<th>은행명</th>
						<td>
							<select name="bank" id="bank" class="join_form_select05">
								<c:forEach items="${bankList}" var="bank" varStatus="status1">
									<option value="<c:out value="${bank.cbCode}"/>" <c:if test="${storeInfo.BANK eq bank.cbCode}">selected="selected"</c:if>><c:out value="${bank.cbText}"/></option>
								</c:forEach>
							</select>
						</td>
						<th>예금주</th>
						<td>
							<input type="text" class="join_form_input07" id="acntr" name="acntr" maxlength="25" value="<c:out value="${storeInfo.ACNTR}"/>" />
						</td>
					</tr>
					<tr>
						<th>계좌번호</th>
						<td colspan="3">
							<input type="text" class="join_form_input07" id="acnutNo" name="acnutNo" maxlength="25" value="<c:out value="${storeInfo.ACNUT_NO}"/>" />
						</td>
					</tr>
					<tr>
						<th>세금계산서 수신이메일</th>
						<td colspan="3">
							<input type="text" class="join_form_input07" id="texEmail" name="texEmail" value="<c:out value="${storeInfo.TEX_EMAIL}"/>" />
						</td>
					</tr>
				</tbody>
			</table>
		</form>
		<div class="btn_content01 margintop_40">
			<span class="bOn" id="btnNext" onclick="fnNextStep();" >
				저장
			</span>
		</div>
	</div>
