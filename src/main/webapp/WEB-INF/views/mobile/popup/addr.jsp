<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/layout/include/base.jsp" %>
	<script src="http://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
	<script>
	    function fnPostcode() {
		    new daum.Postcode({
		        oncomplete: function(data) {
		        	$('#zoneCode').val( data.postcode.replace('-','') );
		        	$("#zipCode").val(data.zonecode);
		        	$("#sigunguCode").val(data.sigunguCode);
		        	$("#address").val(data.address);
		        	$("#dtlAddress").val("("+data.bname+")");
		        }
		    }).open();
	    }
	</script>
	<script type="text/javascript">
		var dupClick1 = false;
		$(function(){
			_BT.Reg.Number("mobile");
		}); 
		function fnSave(){
			if( dupClick1 ) {
				alert("처리중 입니다. 잠시만 기다려주세요.");
				return false;
			}
			if(_BT.isEmptyById("addrNm",    "배송지명을 입력해 주세요.")) return false;
			if(_BT.isEmptyById("receiver",    "받으시는분을 입력해 주세요.")) return false;
			if(_BT.isEmptyById("mobile1",    "받으시는분 연락처를 입력해 주세요.")) return false;
			if(_BT.isEmptyById("mobile2",    "받으시는분 연락처를 입력해 주세요.")) return false;
			if(_BT.isEmptyById("mobile3",    "받으시는분 연락처를 입력해 주세요.")) return false;
			if(_BT.isEmptyById("zipCode",    "주소를 입력해 주세요.")) return false;
			var mobileNo = _BT.getJoinData("-", new Array("mobile1","mobile2","mobile3"));
 			$("#mobileNo").val(mobileNo);

			if(!confirm("배송지정보를 저장 하시겠습니까?")) {
				return false;
			}
 			
			dupClick1 = true; 
			_BT.ajaxCallbackSubmit("frm",  _BT.SHOP.URL.User.addAddr, 
				function(data) {
					dupClick1 = false;
					if($(data).size() > 0) { 
						if(_BT.isEquals(data.code, "success")){
							_BT.moveUrl(_BT.SHOP.URL.User.popAddr);
							return false;
						}else{
							alert(data.msg);	
							return false;
						}
					}
				},
				function(xhr, status, error) {
					dupClick1 = false; 
					alert("처리중 오류가 발생했습니다.\n\n다시 확인 부탁 드립니다.");
					return false;
				});	
		}
		function setAddr(idx){
			$("#seq").val($("#addrId"+idx).val());
			$("#mobileNo").val($("#mobileNo"+idx).val());
			$("#addrNm").val($("#addrNm"+idx).val());
			$("#receiver").val($("#receiver"+idx).val());
			
			$("#sigunguCode").val($("#sigunguCode"+idx).val());
			$("#zoneCode").val($("#zoneCode"+idx).val());
			$("#zipCode").val($("#zipCode"+idx).val());
			$("#address").val($("#address"+idx).val());
			$("#dtlAddress").val($("#dtlAddress"+idx).val());

			var baseAddr = $("#baseAddr"+idx).val()
			if(baseAddr == "Y"){
				$("#baseAddr").prop("checked",true);
			}else{
				$("#baseAddr").prop("checked",false);
			}
			_BT.setSplitData($("#mobileNo"+idx).val(), "-", new Array("mobile1","mobile2","mobile3"));
		}
		function fnDelete(){
			if( dupClick1 ) {
				alert("처리중 입니다. 잠시만 기다려주세요.");
				return false;
			}
			var cnt = 0;
			$('#subFrm').empty();
			$('#subFrm').append($('<input/>', {
			    type: 'hidden',
			    id: 'procType',
			    name: 'procType',
			    value : 'delChk'
			}));
			$( ".addr_list" ).each(function( i ) {
				if(_BT.isChecked($(this).attr("id"))){
					var r = $(this).attr("id");
					$('#subFrm').append($('<input/>', {
					    type: 'hidden',
					    id: 'addrId'+cnt,
					    name: 'addrId'+cnt,
					    value : $('#addrId'+r).val()
					}));
					cnt++;
				}
			});
			$('#subFrm').append($('<input/>', {
			    type: 'hidden',
			    id: 'cnt',
			    name: 'cnt',
			    value : cnt
			}));
			if(_BT.isEquals(cnt,0)){
				alert("선택하신 내역이 없습니다.");
				return false;
			}
			if(!confirm("선택하신 배송지 정보를 삭제 하시겠습니까?")) {
				return false;
			}
			dupClick1 = true; 
			_BT.ajaxCallbackSubmit("subFrm",  _BT.SHOP.URL.User.delAddr, 
			function(data) {
				dupClick1 = false;
				if($(data).size() > 0) { 
					if(_BT.isEquals(data.code, "success")){
						_BT.moveUrl(_BT.SHOP.URL.User.popAddr);
						return false;
					}else{
						alert(data.msg);	
						return false;
					}
				}
			},
			function(xhr, status, error) {
				dupClick1 = false; 
				alert("처리중 오류가 발생했습니다.\n\n다시 확인 부탁 드립니다.");
				return false;
			});	
		}
		function fnChoice(){
			var cnt	= 0;
			var idx 	= 0;
			$( ".addr_list" ).each(function( i ) {
				if(_BT.isChecked($(this).attr("id"))){
					idx = $(this).attr("id");
					cnt++;
				}
			});
			if(cnt < 1){
				alert("선택하신 내역이 없습니다.");
				return false;
			}else 	if(cnt > 1){
				alert("상품을 배송받을실 주소지를 1곳만 선택 하시기 바랍니다.");
				return false;
			}
			$("#seq").val($("#addrId"+idx).val());
			$("#mobileNo").val($("#mobileNo"+idx).val());
			$("#addrNm").val($("#addrNm"+idx).val());
			$("#receiver").val($("#receiver"+idx).val());
			
			$("#zoneCode").val($("#zoneCode"+idx).val());
			$("#zipCode").val($("#zipCode"+idx).val());
			$("#address").val($("#address"+idx).val());
			$("#dtlAddress").val($("#dtlAddress"+idx).val());
			$("#zoneTp").val($("#zoneTp"+idx).val());
			
			_BT.setSplitData($("#mobileNo"+idx).val(), "-", new Array("mobile1","mobile2","mobile3"));
			var obj = $("#frm").serializeArray();
			opener.parent.fnSetAddr(obj);
			fnClose();
		}
		function fnClear(){
			$('#seq').val('');
			_BT.reset();
		}
		function fnClose(){
			window.close();
		}
	</script>
	<!-- 팝업창 시작 -->
		<h1 class="blue_title">
			나의 배송지 관리
			<span class="close" onclick="fnClose();">
			</span>
		</h1>
		<div class="pop_set_content">
			<div class="pop_set_substance">
				<form id="subFrm" name="subFrm">
				</form>
				<form id="frm" name="frm">
					<input type="hidden" id="mobileNo" name="mobileNo" />
					<input type="hidden" id="seq" name="seq" />
					<table class="join_form">
						<caption>정보입력</caption>
						<colgroup>
							<col width="20%">
							<col width="80%">
						</colgroup>
						<tbody>
							<tr>
								<th>
									배송지명
								</th>
								<td>
									<input type="text" class="input_style03" id="addrNm" name="addrNm" maxlength="20" placeholder="배송지명"/>
									<input type="checkbox" class="join_checkbox" id="baseAddr" name="baseAddr"><label class="join_form_check" for="baseAddr">기본 배송지로 설정</label>
								</td>
							</tr>
							<tr>
								<th>
									받으시는 분
								</th>
								<td>
									<input type="text" class="input_style05" id="receiver" name="receiver" maxlength="20" placeholder="받으시는 분"/>
								</td>
							</tr>
							<tr>
								<th>
									연락처
								</th>
								<td>
									<input type="text" class="join_form_input01 mobile" id="mobile1" name="mobile1" maxlength="4"/><span class="join_form_txt">-</span>
									<input type="text" class="join_form_input01 mobile" id="mobile2" name="mobile2" maxlength="4"/><span class="join_form_txt">-</span>
									<input type="text" class="join_form_input01 mobile" id="mobile3" name="mobile3" maxlength="4"/>
								</td>
							</tr>
							<tr>
								<th>
									주소
								</th>
								<td>
									<input type="hidden" id="zoneTp" name="zoneTp"/> 
									<input type="hidden" id="zoneCode" name="zoneCode"/> 
									<input type="text" class="join_form_input01" id="zipCode" name="zipCode" readonly="readonly" placeholder="" />
									<span class="join_form_btn01" onclick="fnPostcode();">우편번호검색</span>
									<input type="text" class="input_style04 margintop_5" id="address" name="address" readonly="readonly" placeholder="주소" />
									<input type="text" class="input_style04 margintop_5" id="dtlAddress" name="dtlAddress" placeholder="상세주소"/>
								</td>
							</tr>
						</tbody>
					</table>
				</form>
				<div class="btn_group margintop_10">
					<span class="form_btn_Type_blue" onclick="fnSave();">저 장</span>
					<span class="form_btn_Type_gray" onclick="fnClear();">초기화</span>
				</div>
				<table class="tbl_Type06 margintop_30">
					<caption>정보입력</caption>
					<colgroup>
						<col width="8%">
						<col width="22%">
						<col width="30%">
						<col width="40%">
					</colgroup>
					<tbody>
						<tr>
							<th rowspan="2">선택</th>
							<th>배송지</th>
							<th>받는사람</th>
							<th>연락처</th>
						</tr>
						<tr>
							<th>우편번호</th>
							<th colspan="2">주소</th>
						</tr>
						<c:forEach items="${addrList}" var="addr1" varStatus="status"> 
							<input type="hidden" id="addrId${status.count}" value="<c:out value="${addr1.ADDR_ID}"/>"/>	
							<input type="hidden" id="baseAddr${status.count}" value="<c:out value="${addr1.BASE_ADDR_YN}"/>"/>	
							<input type="hidden" id="addrNm${status.count}" value="<c:out value="${addr1.ADDR_NM}"/>"/>	
							<input type="hidden" id="receiver${status.count}" value="<c:out value="${addr1.RECV_NM}"/>"/>	
							<input type="hidden" id="mobileNo${status.count}" value="<c:out value="${addr1.TEL_NO_1}"/>"/>	
							<input type="hidden" id="zoneCode${status.count}" value="<c:out value="${addr1.ZONE_CODE}"/>"/>	
							<input type="hidden" id="zipCode${status.count}" value="<c:out value="${addr1.ZIP_CODE}"/>"/>	
							<input type="hidden" id="address${status.count}" value="<c:out value="${addr1.ADDRESS}"/>"/>	
							<input type="hidden" id="dtlAddress${status.count}" value="<c:out value="${addr1.ADDRESS_DETAIL}"/>"/>	
							<input type="hidden" id="zoneTp${status.count}" value="<c:out value="${addr1.ZONE_TP}"/>"/>	
							<tr>
								<td rowspan="2">
									<input type="checkbox" class="addr_list" id="<c:out value="${status.count}"/>" />
								</td>
								<td class="place">
									<span class="linkTxt"onclick="setAddr(<c:out value="${status.count}"/>);"><c:out value="${addr1.ADDR_NM}"/></span>
								</td>
								<td>
									<c:out value="${addr1.RECV_NM}"/>
								</td>
								<td>
									<c:out value="${addr1.TEL_NO_1}"/>
								</td>
							</tr>
							<tr>
								<td>
									<c:out value="${addr1.ZIP_CODE}"/>
								</td>
								<td colspan="2" style="text-align: left;">
									<c:out value="${addr1.ADDRESS}"/> <c:out value="${addr1.ADDRESS_DETAIL}"/>
								</td>
							</tr>
 						</c:forEach>
					</tbody>
				</table>

				<div class="btn_group margintop_10">
					<span class="form_btn_Type_blue" onclick="fnChoice();">선 택</span>
					<span class="form_btn_Type_gray" onclick="fnDelete();">삭 제</span>
				</div>
			</div>
		</div>

