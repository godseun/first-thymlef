<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/layout/include/base.jsp" %>
	<script type="text/javascript">
		var dupClick1 = false;
		var dev = 1;
		$(function(){ 
			$( ':input' ).on('focus', function() {
	    		$(this).addClass('mOn');
	    	});
			$( ':input' ).on('focusout', function() {
	    		$(this).removeClass('mOn');
	    	}); 
			$('#msg').on('keyup', function() {
				chk_len();
			});
			$('.join_checkbox').on('change', function() {
				if($(this).val() == 'S'){
					$('#reqTp').val('0');
					$('#mobile').val('${userSession.mobile}');
					$("#recYn").prop("checked",false);
				}else{
					$('#reqTp').val('1');
					$('#mobile').val('');
				}
	    	});
			_BT.Reg.Number("mobile");
		});
		function fnSend(){ 
			if( dupClick1 ) {
				alert('변경 정보를 저장 중 입니다. 잠시만 기다려주세요.');
				return false;
			}
			if(_BT.isEmptyById("cmpNm",    	"상호를 입력해 주세요.")) return false;
			if(_BT.isEmptyById("prsNm",    	"대표자명을 입력해 주세요.")) return false;
			if(_BT.isEmptyById("busiNo1",    	"사업자번호를 입력해 주세요.")) return false;
			if(_BT.isEmptyById("busiNo2",    	"사업자번호를 입력해 주세요.")) return false;
			if(_BT.isEmptyById("busiNo3",    	"사업자번호를 입력해 주세요.")) return false;
			if(_BT.isEmptyById("bizCnd",    	"업태를 입력해 주세요.")) return false;
			if(_BT.isEmptyById("induty",    	"종목을 입력해 주세요.")) return false;
			if(_BT.isEmptyById("address",    	"주소를 입력해 주세요.")) return false;
			if(_BT.isEmptyById("taxEmail",    "이메일을 입력해 주세요.")) return false;
			var busiNo = _BT.getJoinData('-', new Array('busiNo1','busiNo2','busiNo3'));
			if(busiNo.length == 12){
				$('#busiNo').val(busiNo);
			}else{
				alert('사업자번호를 확인해 주세요');
				return false;
			}
   			_BT.ajaxCallbackSubmit("taxFrm",  _BT.FRONT.URL.Customer.SetTaxInfo, function(data) {
				dupClick1 = false;
				if($(data).size() > 0) {
					if(_BT.isEquals(data.code, "success")) {
						passSend = true;
						alert(data.msg);
					}else{
						alert(data.msg);
					}
				}else{
					alert(data.msg);
				}
			},
			function(xhr, status, error) {
				dupClick1 = false;
				alert('서버와 통신 중 오류 발생 하였습니다.');
			});	
		}		
		function fnClose(){
			window.close();
		}
	</script>
	<!-- 팝업창 시작 -->
	<h1 class="blue_title">
		세금계산서 발행정보
		<span class="close" onclick="fnClose();">
		</span>
	</h1> 
		<div class="c13_01_02_box_03" style="width: 100%;height: 470px;padding:10px;">
			<c:choose>
				<c:when test="${! empty taxInfo.CMP_BIZ_NO}">
				<table class="tbl_Type15 margintop_10">
						<caption>계산서 정보</caption>
						<colgroup>
							<col width="20%">
							<col width="80%">
						</colgroup>
						<tbody>
							<tr>
								<td style="padding-right:10px;text-align:right;height:52px;">
									<span class="c13_01_02_txt_01">구매자</span>
								</td>
								<td style="padding-left: 10px;text-align: left;">
									<span class="c13_01_02_txt_01">
										<c:out value="${taxInfo.USR_NM}"/>
										<c:out value="${taxInfo.MOBILE}"/>
									</span>
								</td>
							</tr>
							<tr>
								<td style="padding-right:10px;text-align:right;height:52px;">
									<span class="c13_01_02_txt_01">상호명</span>
								</td>
								<td style="padding-left: 10px;text-align: left;">
									<span class="c13_01_02_txt_01">
										<c:out value="${taxInfo.CMP_NM}"/>
									</span>
								</td>
							</tr>
							<tr>
								<td style="padding-right:10px;text-align:right;height:52px;">
									<span class="c13_01_02_txt_01">대표자</span>
								</td>
								<td style="padding-left: 10px;text-align: left;">
									<span class="c13_01_02_txt_01">
										<c:out value="${taxInfo.RPRSNTV_NM}"/>
									</span>
								</td>
							</tr>
							<tr>
								<td style="padding-right:10px;text-align:right;height:52px;">
									<span class="c13_01_02_txt_01">사업자번호</span>
								</td>
								<td style="padding-left: 10px;text-align: left;">
									<span class="c13_01_02_txt_01">
										<c:out value="${taxInfo.CMP_BIZ_NO}"/>
									</span>
								</td>
							</tr>
							<tr>
								<td style="padding-right:10px;text-align:right;height:52px;">
									<span class="c13_01_02_txt_01">업태</span>
								</td>
								<td style="padding-left: 10px;text-align: left;">
									<span class="c13_01_02_txt_01">
										<c:out value="${taxInfo.BIZCND}"/>
									</span>
								</td>
							</tr>
							<tr>
								<td style="padding-right:10px;text-align:right;height:52px;">
									<span class="c13_01_02_txt_01">종목</span>
								</td>
								<td style="padding-left: 10px;text-align: left;">
									<span class="c13_01_02_txt_01">
										<c:out value="${taxInfo.INDUTY}"/>
									</span>
								</td>
							</tr>
							<tr>
								<td style="padding-right:10px;text-align:right;height:52px;">
									<span class="c13_01_02_txt_01">주소</span>
								</td>
								<td style="padding-left: 10px;text-align: left;">
									<span class="c13_01_02_txt_01">
										<c:out value="${taxInfo.ADDRESS}"/>
									</span>
								</td>
							</tr>
							<tr>
								<td style="padding-right:10px;text-align:right;height:52px;">
									<span class="c13_01_02_txt_01">이메일</span>
								</td>
								<td style="padding-left: 10px;text-align: left;">
									<span class="c13_01_02_txt_01">
										<c:out value="${taxInfo.TAX_EMAIL}"/>
									</span>
								</td>
							</tr>
					</table>		
				</c:when>
				<c:otherwise>		
					<form id="taxFrm" name="taxFrm">
						<span class="c13_01_02_txt_01" style="color:red;">등록된 내역이 없습니다</span>
						<table class="tbl_Type15 margintop_10">
							<caption>계산서 정보</caption>
							<colgroup>
								<col width="20%">
								<col width="80%">
							</colgroup>
							<tbody>
								<tr>
									<td style="padding-right:10px;text-align:right;height:52px;">
										<span class="c13_01_02_txt_01">구매자</span>
									</td>
									<td style="padding-left: 10px;text-align: left;">
										<span class="c13_01_02_txt_01">
											<c:out value="${taxInfo.USR_NM}"/>
											<c:out value="${taxInfo.MOBILE}"/>
										</span>
									</td>
								</tr>
								<tr>
									<td style="padding-right:10px;text-align:right;height:52px;">
										<span class="c13_01_02_txt_01">상호명</span>
									</td>
									<td style="padding-left: 10px;text-align: left;">
										<input type="hidden" name="tUsrId" id="tUsrId" class="input_style13" value="${taxInfo.USR_ID}"/>
										<input type="text" name="cmpNm" id="cmpNm" class="input_style13" />
									</td>
								</tr>
								<tr>
									<td style="padding-right:10px;text-align:right;height:52px;">
										<span class="c13_01_02_txt_01">대표자</span>
									</td>
									<td style="padding-left: 10px;text-align: left;">
										<input type="text" name="prsNm" id="prsNm" class="input_style13" />
									</td>
								</tr>
								<tr>
									<td style="padding-right:10px;text-align:right;height:52px;">
										<span class="c13_01_02_txt_01">사업자번호</span>
									</td>
									<td style="padding-left: 10px;text-align: left;">
										<input type="hidden" id="busiNo" name="busiNo" value=""/>
										<input type="text" class="join_form_input01" id="busiNo1" name="busiNo1" maxlength="3" /><span class="join_form_txt">-</span>
										<input type="text" class="join_form_input01" id="busiNo2" name="busiNo2" maxlength="2" /><span class="join_form_txt">-</span>
										<input type="text" class="join_form_input01" id="busiNo3" name="busiNo3" maxlength="5" />
									</td>
								</tr>
								<tr>
									<td style="padding-right:10px;text-align:right;height:52px;">
										<span class="c13_01_02_txt_01">업태</span>
									</td>
									<td style="padding-left: 10px;text-align: left;">
										<input type="text" name="bizCnd" id="bizCnd" class="input_style13" />
									</td>
								</tr>
								<tr>
									<td style="padding-right:10px;text-align:right;height:52px;">
										<span class="c13_01_02_txt_01">종목</span>
									</td>
									<td style="padding-left: 10px;text-align: left;">
										<input type="text" name="induty" id="induty" class="input_style13" />
									</td>
								</tr>
								<tr>
									<td style="padding-right:10px;text-align:right;height:52px;">
										<span class="c13_01_02_txt_01">주소</span>
									</td>
									<td style="padding-left: 10px;text-align: left;">
										<input type="text" name="address" id="address" class="input_style13" style="width:95%;"/>
									</td>
								</tr>
								<tr>
									<td style="padding-right:10px;text-align:right;height:52px;">
										<span class="c13_01_02_txt_01">이메일</span>
									</td>
									<td style="padding-left: 10px;text-align: left;">
										<input type="text" name="taxEmail" id="taxEmail" class="input_style13" />
									</td>
								</tr>
						</table>	
					</form>
				</c:otherwise>
			</c:choose>	
		</div>
		<div class="btn_group margintop_10 marginbottom_10" style="margin-left:0;">
			<c:if test="${empty taxInfo.CMP_BIZ_NO}">
				<span class="form_btn_Type_blue" onclick="fnSend();">등  록</span>
			</c:if>
			<span class="form_btn_Type_gray" onclick="fnClose();">닫  기</span>
		</div>