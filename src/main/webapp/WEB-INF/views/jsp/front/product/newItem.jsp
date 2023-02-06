<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/layout/include/base.jsp" %>
  	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<link rel="stylesheet" type="text/css" href="${staticRoot}/sdk/css/zoom.css">
	<script type="text/javascript" src="${staticRoot}/sdk/js/zoom.js"></script>  	
	<script type="text/javascript" src="${staticRoot}/js/allCteg.js"></script>
	<script type="text/javascript">
		var dupClick1 = false;
		var row = 0;
		$(function(){ 
			$( ':input' ).on('focus', function() {
	    		$(this).addClass('mOn');
	    	});
			$( ':input' ).on('focusout', function() {
	    		$(this).removeClass('mOn');
	    	}); 
			$('.sButton').click(function() {
				doAction($(this).data('type'), $(this).data('value'));
			});
			$( '.ca' ).on('change', function() {
				var cSel= eval($(this).data('value')+1);
				_BT.CategSearch.clearSelect(cSel);
				_BT.CategSearch.makeSelect(cSel, $(this).val());
	    	});
		    $(".imgInp").change(function(){
		        readURL(this);
		    });		
			initSelect();
		});

		function initSelect(){
			_BT.CategSearch.makeSelect('1');
			for(var sel=2; sel<6; sel++){
				$('#ca'+sel).empty();
				$('#ca'+sel).append('<option value="C9999">미지정</option>');
			}
		}
		
		function fnSetMaker(obj){
			$('#sMakerNm').val(obj.sMkNm);
			$('#sMakerCd').val(obj.sMkCd);
		}
		function readURL(input) {
		     if (input.files && input.files[0]) {
		         var reader = new FileReader();
		         
		         console.log(input);
		         reader.onload = function (e) {
		             $('#s'+input.id).attr('src', e.target.result);
		         }
		         
		         reader.readAsDataURL(input.files[0]);
		     }
		 }		
	</script>
	
	<div class="main_content06" style="padding-top: 0px; min-height: 800px; margin-bottom: 20px;">
		<div class="prdc_top_wrap" style="margin-top: 10px;">
			<div class="prdc_info_column01_1">
				<div class="prdc_img_plus">
					<span>
						<img src="${staticRoot}/img/sample03.jpg" class="sEImg" id="simg1" style="width:90px;;height:87px;" alt="샘플사진" data-action="zoom"/>
					</span>
					<span>
						<img src="${staticRoot}/img/sample03.jpg" class="sEImg" id="simg2" style="width:90px;;height:87px;" alt="샘플사진" data-action="zoom"/>
					</span>
					<span>
						<img src="${staticRoot}/img/sample03.jpg" class="sEImg" id="simg3" style="width:90px;;height:87px;" alt="샘플사진" data-action="zoom"/>
					</span>
				</div>
				
				<div class="prdc_img_plus">
					<input type='file' id="img1" class="imgInp"/>
					<input type='file' id="img2" class="imgInp"/>
					<input type='file' id="img3" class="imgInp"/>
				</div>
			</div>
			
			<div class="prdc_info_column02_2" id="ib-container2">
				<table class="front_form border_bottom">
					<caption>정보입력</caption>
					<colgroup>
						<col width="15%">
						<col width="35">
						<col width="15%">
						<col width="35%">
					</colgroup>
					<tbody>
						<tr>
							<th>
								<img class=""/>제품명
							</th>
							<td align="left" colspan="3">
								<input type="text" id="sPrdtNm" name="sPrdtNm" class="sub_option_input5 mOn4" />
							</td>
						</tr>
						<tr>
							<th>
								<img class=""/>규격
							</th>
							<td align="left" colspan="3">
								<input type="text" id="sStndrd" name="sStndrd" class="sub_option_input5 mOn4" />
							</td>
						</tr>
						<tr>
							<th>
								<img class=""/>제조사
							</th>
							<td align="left" style="vertical-align: middle;line-height:35px;">
								<input type="text" id="sMakerNm" name="sMakerNm" class="sub_option_input3 mOn4" readonly="readonly"/>
								<input type="hidden" id="sMakerCd" name="sMakerCd"/>
								<span data-type="check" data-value="1" class="sButton btn_span fs-13 blue" style="float: right;">지정</span>
							</td>
							<th>
								<img class=""/>모델번호
							</th>
							<td align="left">
								<input type="text" id="sModelNm" name="sModelNm" class="sub_option_input3" />
							</td>
						</tr>
						<tr>
							<th>
								<img class=""/>설명
							</th>
							<td align="left" colspan="3">
								<textarea id="sPrdtDtlInfo" name="sPrdtDtlInfo" rows="3" class="mOn4" style="width:87%;margin-left:5px;"></textarea>
							</td>
						</tr>
						<tr>
							<th>
								<img class=""/>재고량
							</th>
							<td align="left">
								<input type="text" id="sAmt" name="sAmt" class="sub_option_input3" readonly="readonly" style="text-align: right;" />
							</td>
							<th>
								<img class=""/>판매가
							</th>
							<td align="left">
								<input type="text" id="sPrice" name="sPrice" class="sub_option_input3" readonly="readonly" style="text-align: right;" />
							</td>
						</tr>
						<tr>
							<th>
								<img class=""/>배송
							</th>
							<td align="left">
								<select class="sub_option_input8" id="sDlTp"  name="sDlTp" disabled="disabled">
									<option value="T">택배</option>
									<option value="H">화물</option>
								</select>
								
								<label for="sPkgTp" class="signup_txt">합배송</label>
								<select class="sub_option_input8" id="sPkgTp"  name=sPkgTp disabled="disabled">
									<option value="0">가능</option>
									<option value="1">불가</option>
								</select>
							</td>
							<th>
								<img class=""/>배송구분
							</th>
							<td align="left">
								<select class="sub_option_input8" id="sDlFeeTp"  name=sDlFeeTp disabled="disabled">
									<option value="0">무료</option>
									<option value="1">유료</option>
								</select>
								<label for="sDlFee" class="signup_txt">배송비</label>
								<input type="text" id="sDlFee" name="sDlFee" class="sub_option_input7" readonly="readonly" style="text-align: right;" />
							</td>
						</tr>
						<tr>
							<th>
								<img class=""/>1단계
							</th>
							<td align="left">
								<select class="ca" id="ca1" name="ca1" data-value="1" style="margin-left:5px;">
									<option value="C9999">미분류</option>
								</select>
							</td>
							<th>
								<img class=""/>2단계
							</th>
							<td align="left">
								<select class="ca" id="ca2" name="ca2"  data-value="2" style="margin-left:5px;">
									<option value="C9999">미분류</option>
								</select>
							</td>
						</tr>
						<tr>
							<th>
								<img class=""/>3단계
							</th>
							<td align="left">
								<select class="ca" id="ca3" name="ca3" data-value="3" style="margin-left:5px;">
									<option value="C9999">미분류</option>
								</select>
							</td>
							<th>
								<img class=""/>4단계
							</th>
							<td align="left">
								<select class="ca" id="ca4" name="ca4" data-value="4" style="margin-left:5px;">
									<option value="C9999">미분류</option>
								</select>
							</td>
						</tr>
						<tr>
							<th>
								<img class=""/>5단계
							</th>
							<td align="left">
								<select class="ca" id="ca5" name="ca5" data-value="5" style="margin-left:5px;">
									<option value="C9999">미분류</option>
								</select>
							</td>
							<th>
								<img class=""/>
							</th>
							<td align="left">
							</td>
						</tr>
						<tr>
							<th>
								<img class=""/>처리내역
							</th>
							<td align="left" colspan="3">
								<textarea id="sConRMK" name="sConRMK" rows="3" style="width:87%;margin-left:5px;" placeholder="반려 또는 보류시에는 필수로 입력 바랍니다." ></textarea>
							</td>
						</tr>
					</tbody>
				</table> 
			</div>
			<div class="icon_btn_Group2 margintop_40">
				<a class="btn_sub_01" href="javascript:;" onclick="fnSave();">
					저장
				</a>
			</div>
		</div>	 
	</div>