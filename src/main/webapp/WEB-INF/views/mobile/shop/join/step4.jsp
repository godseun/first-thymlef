<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/layout/include/base.jsp" %>
    <script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=831efe0093d25c8bd7176e063af0b4ee&libraries=services"></script>
	<script type="text/javascript" src="//dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>
	<script type="text/javascript">
		function moveStep() {
			if(_BT.isEmptyById("shopName",        "샵이름을 입력 해 주세요.")) return false;
			if(_BT.isEmptyById("tel2",            "전화번호를 입력 해 주세요.")) return false;
			if(_BT.isEmptyById("tel3",            "전화번호를 입력 해 주세요.")) return false;
			if(_BT.isEmptyById("address",         "주소를 검색 해 주세요.")) return false;
			if(_BT.isEmptyById("addressDetail",   "상세주소를 입력 해 주세요.")) return false;
			if(_BT.isEmptyById("repArea",         "대표지역을 입력 해 주세요.")) return false;
			if(_BT.isEmptyById("businessDay",     "영업일을 입력 해 주세요.")) return false;
			if(_BT.isEmptyById("businessHours",   "영업시간을 입력 해 주세요.")) return false;
			if(_BT.isEmptyById("regularHoliday",  "정기휴일을 입력 해 주세요.")) return false;
			if(_BT.isEmptyById("introduce",       "샵 설명을 입력 해 주세요.")) return false;
			if(_BT.isEmptyById("artist",          "아티스트를 입력 해 주세요.")) return false;
			if(_BT.isEmptyById("seatingCapacity", "좌석수를 입력 해 주세요.")) return false;
			if(_BT.isEmptyById("service",         "서비스를 입력 해 주세요.")) return false;
			if(_BT.isEmptyById("facilities",      "설치시설을 입력 해 주세요.")) return false;

			var telNo = _BT.getJoinData("-", new Array("tel1","tel2","tel3"));
			
			$("#telNo").val(telNo);
			
			_BT.actFormSubmit("frm", "post", _BT.SHOP.URL.Join.Step4, "등록 하시겠습니까?");
		}
		
		$(function(){
			$("#tel2,#tel3").addClass("number");
			
			_BT.setReadOnly("zipCode");
			_BT.setReadOnly("address");
			
			_BT.Reg.Number("number");
			
			$("#btnDaumPost").on("click", function(){
				 _BT.API.DaumPost.openPostPopup(function(data){
					 if(!_BT.isEmpty(data)) {
						 $("#zipCode").val(data.zonecode);
						 $("#address").val(data.roadAddress);
						 
						 _BT.API.DaumMap.setAddressToPosition(data.roadAddress, "lat", "lng");
					 }
				 });
			});
		});
	</script>
	
	
	
	
	
	
	<div class="contents-info" style="padding-top: 0;">	
		<div class="in-list">
			<h2 class="in-list-title">샵 정보 입력</h2>
			<span class="pull-left" style="margin-top:5px;">가입하신 정보는 개인정보 보호정책에 의해 보호를 받습니다.</span>
			<span class="pull-right" style="margin-top:5px;">
				<ul class="in-list-th">  
					<li class="active">샵 정보 입력</li>
				</ul>
			</span>
		</div>
	  
	
	 
	 
		<form id="frm" name="frm">
			<input type="hidden" id="telNo" name="telNo" />
			<input type="hidden" id="lat"   name="lat" />
			<input type="hidden" id="lng"   name="lng" />
		 
			<table class="tableD-info br-t-10">
			 	<tr>
					<td class="infoD-left" width="100px" rowspan="8">샵 정보</td> 
					<td class="infoD-left4"><span>샵이름</span></td>
			 		<td>
						<div class="inputGroup">
							<div class="s_input3">
								<input type="text" id="shopName" name="shopName" value="<c:out value="${result.SHOP_NAME}"/>" />
							</div>
						</div>
			 		</td>
			 	</tr>
			 	<tr>
					<td class="infoD-left4"><span>전화번호</span></td> 
			 		<td>
						<div class="inputGroup">
							<div class="de-plus">
								<div class="select-group2">
		 							<comm:codeSelect id="tel1" pCodeId="COM008" textKey="CODE_NAME" valueKey="CODE_VALUE"/>
								</div>
								<div class="s_input2">
									<input type="text" id="tel2" maxlength="4" size="4" />
								</div>
								<div class="s_input2">
									<input type="text" id="tel3" maxlength="4" size="4" />
								</div>
							</div>
						</div>
			 		</td>
			 	</tr>
			 	<tr>
					<td class="infoD-left4"><span>주소</span></td> 
			 		<td>
						<div class="inputGroup">
							<div class="s_input3">
								<input type="text" id="zipCode" name="zipCode" style="width:70px;background-color:#ddd;" readonly="readonly"/>
								<input type="text" id="address" name="address" style="width:250px;background-color:#ddd;" readonly="readonly"/>
								<input class="btn-white2" type="button" id="btnDaumPost" value="주소검색" style="width: 140px;" />
								<input type="text" id="addressDetail" name="addressDetail" placeholder="상세주소를 입력해주세요." style="width:500px;" maxlength="50" />
							</div>
						</div> 
			 		</td>	 		
			 	</tr>
			 	<tr>
					<td class="infoD-left4"><span>대표지역</span></td> 
			 		<td>
						<div class="inputGroup">
							<div class="s_input3">
		 						<input type="text" id="repArea" name="repArea" maxlength="50" />
							</div>
						</div>
			 		</td>
			 	</tr>
			 	<tr>
					<td class="infoD-left4"><span>영업일</span></td> 
			 		<td>
						<div class="inputGroup">
							<div class="s_input3">
		 						<input type="text" id="businessDay" name="businessDay" maxlength="50" />
							</div>
						</div>
			 		</td>
			 	</tr>
			 	<tr>
					<td class="infoD-left4"><span>영업시간</span></td> 
			 		<td>
						<div class="inputGroup">
							<div class="s_input3">
		 						<input type="text" id="businessHours" name="businessHours" maxlength="50" />
							</div>
						</div>
			 		</td>
			 	</tr>
			 	<tr>
					<td class="infoD-left4"><span>정기휴일</span></td> 
			 		<td>
						<div class="inputGroup">
							<div class="s_input3">
		 						<input type="text" id="regularHoliday" name="regularHoliday" maxlength="50"  />
							</div>
						</div>
			 		</td>
			 	</tr>
			 	<tr>
					<td class="infoD-left4"><span>샵 설명</span></td> 
			 		<td>
						<div class="textarea-box"> 
							<textarea class="textarea2" id="introduce" name="introduce" rows="3" maxlength="150"></textarea>
						</div>
			 		</td>
			 	</tr>
			 	
				</table>
	
				<table class="tableD-info br-t-10">
				 	<tr>
						<td class="infoD-left" width="100px" rowspan="5">상세 정보</td> 
						<td class="infoD-left4"><span>아티스트</span></td> 
				 		<td>
							<div class="inputGroup">
								<div class="s_input3">
									<input type="text" id="artist" name="artist" maxlength="10"  />
								</div>
							</div>
				 		</td>
				 	</tr>
				 	<tr>
						<td class="infoD-left4"><span>좌석 수</span></td> 
				 		<td>
							<div class="inputGroup">
								<div class="s_input3">
				 					<input type="text" id="seatingCapacity" name="seatingCapacity" maxlength="10" />
								</div>
							</div>
				 		</td>
				 	</tr>
				 	<tr>
						<td class="infoD-left4"><span>서비스</span></td> 
				 		<td>
							<div class="inputGroup">
								<div class="s_input3">
				 					<input type="text" id="service" name="service" maxlength="100"  />
								</div>
							</div>
				 		</td>
				 	</tr>
				 	<tr>
						<td class="infoD-left4"><span>설치 시설</span></td> 
				 		<td>
							<div class="inputGroup">
								<div class="s_input3">
				 					<input type="text" id="facilities" name="facilities" maxlength="100"  />
								</div>
							</div>
				 		</td>
				 	</tr>
				 	<tr>
						<td class="infoD-left4"><span>기타 정보</span></td> 
				 		<td>
							<div class="inputGroup">
								<div class="s_input3">
				 					<input type="text" id="etcInfo" name="etcInfo" maxlength="150" />
								</div>
							</div>
				 		</td>
				 	</tr>
			 	</table>
			 
				<div class="block-100 br-t-10" align="center">
					<a href="javascript:;" class="btn-lg" onclick="moveStep();">승인요청</a>	
				</div> 
		</form>		
	 </div> 