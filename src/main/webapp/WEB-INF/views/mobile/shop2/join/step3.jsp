<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/layout/include/base.jsp" %>
	<script type="text/javascript">
		function moveStep() {
			if(!_BT.isChecked("userType1",  "가입구분을 선택 해 주세요.")) return false;
			if(_BT.isEmptyById("represent", "사장님성함을 입력 해 주세요.")) return false;
			if(_BT.isEmptyById("mobile2",   "휴대폰번호를 입력 해 주세요.")) return false;
			if(_BT.isEmptyById("mobile3",   "휴대폰번호를 입력 해 주세요.")) return false;
			if(_BT.isEmptyById("year",      "생년월일(연도)을 선택 해 주세요.")) return false;
			if(_BT.isEmptyById("month",     "생년월일(월)을 선택 해 주세요.")) return false;
			if(_BT.isEmptyById("day",       "생년월일(일)을 선택 해 주세요.")) return false;
			if(_BT.isEmptyById("email1",    "이메일주소를 입력 해 주세요.")) return false;
			
			var email2 = $("#email2").val();
			var direct = $("#direct").val();
			
			if(_BT.isEmpty(email2) && _BT.isEmpty(direct)) {
				alert("이메일주소를 입력 해 주세요.");
				return false;
			} else if(!_BT.isEmpty(email2)) {
				if(_BT.isEmptyById("email2","이메일주소를 입력 해 주세요.")) {
					return false;
				}
			} else if(!_BT.isEmpty(direct)) {
				if(!_BT.Reg.EmailTail("email", "이메일 형식을 올바르게 입력 해 주세요.")) {
					return false;
				}
			}
			
			if(_BT.isEmptyById("businessName", "상호명을 입력 해 주세요.")) return false;
			if(_BT.isEmptyById("corpRegNo",    "사업자 등록번호를 입력 해 주세요")) return false;
			//if(_BT.isEmptyById("file",         "사업자 등록증을 첨부 해 주세요.")) return false;

			var mobileNo = _BT.getJoinData("-", new Array("mobile1","mobile2","mobile3"));
			var birthday = _BT.getJoinData("",  new Array("year","month","day"));
			var email    = _BT.getJoinData("@", new Array("email1","email2","direct"));
			
			$("#mobileNo").val(mobileNo);
			$("#birthday").val(birthday);
			$("#email").val(email);
			
			_BT.actFormSubmit("frm", "post", _BT.SHOP.URL.Join.Step3, "등록 하시겠습니까?");
		}
		
		$(function(){
			$("#mobile2,#mobile3,#corpRegNo").addClass("number");
			
			$("#direct").addClass("email");
			
			$("#email2").on("change",function(){
				if(_BT.isEmptyById("email2")) {
					_BT.setEnable("direct");
				} else {
					$("#direct").val("");
					_BT.setDisable("direct");
				}
			}).trigger("change");
			
			_BT.Reg.Number("number");
			
			_BT.makeCalendarBox("1920","year","month","day");
		});
	</script>
	
	
	
	
	
	<div class="contents-info" style="padding-top: 0;">	
		<div class="in-list">
			<h2 class="in-list-title">정보 입력</h2>
			<span class="pull-left" style="margin-top:5px;">가입하신 정보는 개인정보 보호정책에 의해 보호를 받습니다.</span>
			<span class="pull-right" style="margin-top:5px;">
				<ul class="in-list-th">
					<li><span >01</span> 회원가입 안내</li>
					<li> &rsaquo; </li>
					<li><span >02</span> 약관 동의</li>
					<li> &rsaquo; </li>
					<li class="active"><span >03</span> 정보 입력</li>
				</ul>
			</span>
		</div>
	  
		<form id="frm" name="frm" enctype="multipart/form-data">
			<input type="hidden" id="mobileNo" name="mobileNo" />
			<input type="hidden" id="birthday" name="birthday" />
			<input type="hidden" id="email"    name="email" />
		 
		 
		 
		 
			<table class="tableD-info br-t-10">
			 	<tr>
					<td class="infoD-left" width="100px" rowspan="5">기본정보</td> 
					<td class="infoD-left4"><span>가입 구분</span></td>
					
					<td>
						<div class="inputGroup">
							<div class="select-group2">
								<input type="checkbox" class="form-check" id="userType1" name="userType" value="S" checked="checked"/>
								<label for="userType1">네일 샵</label>
								<input type="checkbox" class="form-check" id="userType2" name="userType" value="D" disabled="disabled"/>
								<label for="userType2">디자이너</label>
							</div>
						</div>
					</td> 
			 	</tr>
			 	<tr>
					<td class="infoD-left4"><span>사장님 성함</span></td>
			 		<td>
						<div class="inputGroup">
							<div class="s_input2">
								<input type="text" id="represent" name="represent" placeholder="사업자등록증에 등록된 본명을 입력해주세요." style="width: 300px;"/>
							</div>
						</div>
			 		</td>	 		
			 	</tr>
			 	<tr>
					<td class="infoD-left4"><span>휴대폰 번호</span></td>
			 		<td>
						<div class="inputGroup">
							<div class="de-plus">
								<div class="select-group2">
			 						<comm:codeSelect id="mobile1" pCodeId="COM003" textKey="CODE_NAME" valueKey="CODE_VALUE"/>			
								</div>
								<div class="s_input2">
									<input type="text" id="mobile2" maxlength="4" size="4" />
								</div>
								<div class="s_input2">
									<input type="text" id="mobile3" maxlength="4" size="4" />
								</div>
								<input type="checkbox" class="form-check" id="smsYn" name="smsYn" value="Y" checked/>
								<label for="smsYn">SMS 수신</label>
							</div>
						</div>
			 		</td>	 		
			 	</tr>
			 	<tr>
					<td class="infoD-left4"><span>생년월일</span></td>
			 		<td>
						<div class="inputGroup">
							<div class="de-plus">
								<div class="select-group2">
						 			<select id="year" class="selectSecond" style="width:80px;">
						 				<option value="">연도</option>
						 			</select>
						 			<select id="month" class="selectSecond" >
						 				<option value="">월</option>
						 			</select>
						 			<select id="day" class="selectSecond" >
						 				<option value="">일</option>
						 			</select>
								</div>
							</div>
						</div>
			 		</td>
			 	</tr>
			 	<tr>
					<td class="infoD-left4"><span>이메일 주소</span></td>
			 		<td>		
						<div class="inputGroup">
							<div class="de-plus">
								<div class="s_input2">
			 						<input type="text" id="email1" />
								</div>
								@&nbsp;&nbsp;
								<div class="s_input2">
			 						<input type="text" id="direct" placeholder="직접입력" style="width:200px;"/>
								</div>
			 						<comm:codeSelect id="email2" pCodeId="COM002" textKey="CODE_VALUE" valueKey="CODE_VALUE" headerText="직접입력" />	
			 					<input type="checkbox" class="form-check" id="emailYn" name="emailYn" value="Y" checked/>
								<label for="emailYn">이메일 수신</label>
								<p class="de-plus-p">서비스 처리결과 및 안내내용이 이메일로 전송 됩니다.</p>
							</div>
						</div>
			 		</td>
			 	</tr>
			</table>
			<table class="tableD-info br-t-10">
				<tr>
					<td class="infoD-left" width="100px" rowspan="3">업소 정보</td> 
					<td class="infoD-left4"><span>상호명</span></td>
			 		<td>
						<div class="inputGroup">
							<div class="s_input3">
								<input type="text" id="businessName" name="businessName" placeholder="사업자등록증에 등록된 업소의 상호명을 입력해주세요." style="width: 400px;" />
							</div>
						</div>
			 		</td>
			 	</tr>
			 	<tr>
					<td class="infoD-left4"><span>사업자 등록번호</span></td>
			 		<td>
						<div class="inputGroup">
							<div class="s_input3">
			 					<input type="text" id="corpRegNo" name="corpRegNo" maxlength="10" placeholder="사업자등록증에 등록된 업소의 사업자 등록번호를 입력해주세요." style="width: 400px;" />
							</div>
						</div>
			 		</td>
			 	</tr>
			 	<tr>
					<td class="infoD-left4"><span>사업자 등록번호 첨부</span></td>
			 		<td>
						<div class="inputGroup"> 
			 				<input type="file" id="file" name="file" style="width:420px;"/> 
						</div>
			 		</td>
			 	</tr>
			</table>
			<p style="font-size:14px;margin-top:10px;margin-left:10px;" >
				회원가입 절차를 완료하신 후, 샵 정보 까지 등록되어야 가입이 승인됩니다. 승인 되기까지는 최대 3일 정도 소요됩니다.
			</p> 
			<p style="font-size:14px;margin-top:5px;margin-left:10px;" >
				회원가입이 완료되면 기재하신 연락처로 알려 드립니다.
			</p>
			<div class="block-100 br-t-10" align="center">
				<a href="javascript:;" class="btn-lg" onclick="moveStep();">가입하기 및 정보입력</a>	
			</div> 
		 </form>
	 </div>
 