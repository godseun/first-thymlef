<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/layout/include/base.jsp" %>
	<script type="text/javascript">
		var dupClick1 = false;
		$(function(){  
		});
	</script>
	<div class="storeSection" style="min-height:1000px;">
	 	<h1 class="title_Type03">
			주문현황
			<div class="sub_location">
				<div class="list_location01">
					<span class="txt01">고객만족 센터</span>
					<span class="arrow"><img src="${staticRoot}/img/bl_01.jpg" alt=">" /></span>
					<span class="last_txt">대화소개</span>
				</div>
			</div>
		</h1>
		<div class="">
		 

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
									<input type="hidden" id="sigunguCode" name="sigunguCode"/> 
									<input type="text" class="join_form_input01" id="zoneCode" name="zoneCode" readonly="readonly" placeholder="" />
									<span class="join_form_btn01" onclick="fnPostcode();">우편번호검색</span>
									<input type="text" class="input_style04 margintop_5" id="address" name="address" readonly="readonly" placeholder="주소" />
									<input type="text" class="input_style04 margintop_5" id="dtlAddress" name="dtlAddress" placeholder="상세주소"/>
								</td>
							</tr>
						</tbody>
					</table>
					<table class="front_form">
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
									<input type="hidden" id="sigunguCode" name="sigunguCode"/> 
									<input type="text" class="join_form_input01" id="zoneCode" name="zoneCode" readonly="readonly" placeholder="" />
									<span class="join_form_btn01" onclick="fnPostcode();">우편번호검색</span>
									<input type="text" class="input_style04 margintop_5" id="address" name="address" readonly="readonly" placeholder="주소" />
									<input type="text" class="input_style04 margintop_5" id="dtlAddress" name="dtlAddress" placeholder="상세주소"/>
								</td>
							</tr>
						</tbody>
					</table>
					<table class="menu_all_Type01">
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
									<input type="hidden" id="sigunguCode" name="sigunguCode"/> 
									<input type="text" class="join_form_input01" id="zoneCode" name="zoneCode" readonly="readonly" placeholder="" />
									<span class="join_form_btn01" onclick="fnPostcode();">우편번호검색</span>
									<input type="text" class="input_style04 margintop_5" id="address" name="address" readonly="readonly" placeholder="주소" />
									<input type="text" class="input_style04 margintop_5" id="dtlAddress" name="dtlAddress" placeholder="상세주소"/>
								</td>
							</tr>
						</tbody>
					</table>
					<table class="sub_group_tbl">
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
									<input type="hidden" id="sigunguCode" name="sigunguCode"/> 
									<input type="text" class="join_form_input01" id="zoneCode" name="zoneCode" readonly="readonly" placeholder="" />
									<span class="join_form_btn01" onclick="fnPostcode();">우편번호검색</span>
									<input type="text" class="input_style04 margintop_5" id="address" name="address" readonly="readonly" placeholder="주소" />
									<input type="text" class="input_style04 margintop_5" id="dtlAddress" name="dtlAddress" placeholder="상세주소"/>
								</td>
							</tr>
						</tbody>
					</table>
					<table class="sub_group_tbl2">
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
									<input type="hidden" id="sigunguCode" name="sigunguCode"/> 
									<input type="text" class="join_form_input01" id="zoneCode" name="zoneCode" readonly="readonly" placeholder="" />
									<span class="join_form_btn01" onclick="fnPostcode();">우편번호검색</span>
									<input type="text" class="input_style04 margintop_5" id="address" name="address" readonly="readonly" placeholder="주소" />
									<input type="text" class="input_style04 margintop_5" id="dtlAddress" name="dtlAddress" placeholder="상세주소"/>
								</td>
							</tr>
						</tbody>
					</table>
					<table class="signup_table">
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
									<input type="hidden" id="sigunguCode" name="sigunguCode"/> 
									<input type="text" class="join_form_input01" id="zoneCode" name="zoneCode" readonly="readonly" placeholder="" />
									<span class="join_form_btn01" onclick="fnPostcode();">우편번호검색</span>
									<input type="text" class="input_style04 margintop_5" id="address" name="address" readonly="readonly" placeholder="주소" />
									<input type="text" class="input_style04 margintop_5" id="dtlAddress" name="dtlAddress" placeholder="상세주소"/>
								</td>
							</tr>
						</tbody>
					</table>
					<table class="cart_list">
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
									<input type="hidden" id="sigunguCode" name="sigunguCode"/> 
									<input type="text" class="join_form_input01" id="zoneCode" name="zoneCode" readonly="readonly" placeholder="" />
									<span class="join_form_btn01" onclick="fnPostcode();">우편번호검색</span>
									<input type="text" class="input_style04 margintop_5" id="address" name="address" readonly="readonly" placeholder="주소" />
									<input type="text" class="input_style04 margintop_5" id="dtlAddress" name="dtlAddress" placeholder="상세주소"/>
								</td>
							</tr>
						</tbody>
					</table>
					<table class="tbl_Type01">
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
									<input type="hidden" id="sigunguCode" name="sigunguCode"/> 
									<input type="text" class="join_form_input01" id="zoneCode" name="zoneCode" readonly="readonly" placeholder="" />
									<span class="join_form_btn01" onclick="fnPostcode();">우편번호검색</span>
									<input type="text" class="input_style04 margintop_5" id="address" name="address" readonly="readonly" placeholder="주소" />
									<input type="text" class="input_style04 margintop_5" id="dtlAddress" name="dtlAddress" placeholder="상세주소"/>
								</td>
							</tr>
						</tbody>
					</table>
					<table class="tbl_Type06">
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
									<input type="hidden" id="sigunguCode" name="sigunguCode"/> 
									<input type="text" class="join_form_input01" id="zoneCode" name="zoneCode" readonly="readonly" placeholder="" />
									<span class="join_form_btn01" onclick="fnPostcode();">우편번호검색</span>
									<input type="text" class="input_style04 margintop_5" id="address" name="address" readonly="readonly" placeholder="주소" />
									<input type="text" class="input_style04 margintop_5" id="dtlAddress" name="dtlAddress" placeholder="상세주소"/>
								</td>
							</tr>
						</tbody>
					</table>
					<table class="tbl_Type09">
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
									<input type="hidden" id="sigunguCode" name="sigunguCode"/> 
									<input type="text" class="join_form_input01" id="zoneCode" name="zoneCode" readonly="readonly" placeholder="" />
									<span class="join_form_btn01" onclick="fnPostcode();">우편번호검색</span>
									<input type="text" class="input_style04 margintop_5" id="address" name="address" readonly="readonly" placeholder="주소" />
									<input type="text" class="input_style04 margintop_5" id="dtlAddress" name="dtlAddress" placeholder="상세주소"/>
								</td>
							</tr>
						</tbody>
					</table>
					<table class="tbl_Type02">
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
									<input type="hidden" id="sigunguCode" name="sigunguCode"/> 
									<input type="text" class="join_form_input01" id="zoneCode" name="zoneCode" readonly="readonly" placeholder="" />
									<span class="join_form_btn01" onclick="fnPostcode();">우편번호검색</span>
									<input type="text" class="input_style04 margintop_5" id="address" name="address" readonly="readonly" placeholder="주소" />
									<input type="text" class="input_style04 margintop_5" id="dtlAddress" name="dtlAddress" placeholder="상세주소"/>
								</td>
							</tr>
						</tbody>
					</table>
					<table class="tbl_Type05">
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
									<input type="hidden" id="sigunguCode" name="sigunguCode"/> 
									<input type="text" class="join_form_input01" id="zoneCode" name="zoneCode" readonly="readonly" placeholder="" />
									<span class="join_form_btn01" onclick="fnPostcode();">우편번호검색</span>
									<input type="text" class="input_style04 margintop_5" id="address" name="address" readonly="readonly" placeholder="주소" />
									<input type="text" class="input_style04 margintop_5" id="dtlAddress" name="dtlAddress" placeholder="상세주소"/>
								</td>
							</tr>
						</tbody>
					</table>
					<table class="tbl_Type07">
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
									<input type="hidden" id="sigunguCode" name="sigunguCode"/> 
									<input type="text" class="join_form_input01" id="zoneCode" name="zoneCode" readonly="readonly" placeholder="" />
									<span class="join_form_btn01" onclick="fnPostcode();">우편번호검색</span>
									<input type="text" class="input_style04 margintop_5" id="address" name="address" readonly="readonly" placeholder="주소" />
									<input type="text" class="input_style04 margintop_5" id="dtlAddress" name="dtlAddress" placeholder="상세주소"/>
								</td>
							</tr>
						</tbody>
					</table>
					<table class="tbl_Type03">
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
									<input type="hidden" id="sigunguCode" name="sigunguCode"/> 
									<input type="text" class="join_form_input01" id="zoneCode" name="zoneCode" readonly="readonly" placeholder="" />
									<span class="join_form_btn01" onclick="fnPostcode();">우편번호검색</span>
									<input type="text" class="input_style04 margintop_5" id="address" name="address" readonly="readonly" placeholder="주소" />
									<input type="text" class="input_style04 margintop_5" id="dtlAddress" name="dtlAddress" placeholder="상세주소"/>
								</td>
							</tr>
						</tbody>
					</table>
					<table class="tbl_Type04">
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
									<input type="hidden" id="sigunguCode" name="sigunguCode"/> 
									<input type="text" class="join_form_input01" id="zoneCode" name="zoneCode" readonly="readonly" placeholder="" />
									<span class="join_form_btn01" onclick="fnPostcode();">우편번호검색</span>
									<input type="text" class="input_style04 margintop_5" id="address" name="address" readonly="readonly" placeholder="주소" />
									<input type="text" class="input_style04 margintop_5" id="dtlAddress" name="dtlAddress" placeholder="상세주소"/>
								</td>
							</tr>
						</tbody>
					</table>
	</div>

		
		
		
		 