<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/layout/include/base.jsp" %>
	<script type="text/javascript">
		var dupClick1 = false;
		$(function(){  
			$( ":input" ).on("focus", function() {
	    		$(this).addClass("mOn");
	    	});
			$( ":input" ).on("focusout", function() {
	    		$(this).removeClass("mOn");
	    	});
			$('#mDiv').on('click', function() {
				$('#file').trigger('click');
			});
			$('#sDiv').on('click', function() {
				$('#files').trigger('click');
			});
			$('#file').on('change', function(e) {
				var img = e.target.files[0];
				var name = e.target.files[0].name;
				if(img.constructor !== File || !img.type.match('image.*')){
					alert('이미지 파일만 선택 가능 합니다.');
					return false;
				}else{
					canvas(img, name,'result', 'mData', 'mFileName', true, '50');
				}
			});
			$('#files').on('change', function(e) {
				var imgs = e.target.files;
				if(imgs.length > 4) {
					alert('추가 이미지는 4장 까지 가능 합니다.');
					return false;
				} else {
					$('#sImgSize').val(imgs.length);
					for(var i=0; i<imgs.length; i++){
						var img = imgs[i];
						if(img.constructor !== File || !img.type.match('image.*')){
							alert('이미지 파일만 선택 가능 합니다.');
							return false;
						}
					}
					canvasMulti(imgs);
				}
			});
			_BT.Reg.Number("number");
		});
		function canvasMulti(imgObjs){
			$('#sFrm').empty();
			$('.sResult').attr('src', '${staticRoot}/img/c13_01_02_noimg_02.jpg');
			for(var i=0; i < imgObjs.length; i++){
				var img 		= imgObjs[i];
				var name 	= imgObjs[i].name;
				$('<input></input>').attr({type:'hidden', id:'sData'+i, name:'sData'+i, value:''}).appendTo($('#sFrm'));
				$('<input></input>').attr({type:'hidden', id:'sFileName'+i, name:'sFileName'+i, value:''}).appendTo($('#sFrm'));
				var last = (i == (imgObjs.length-1)) ? true : false;
				canvas(img, name, 'sResult'+i, 'sData'+i, 'sFileName'+i, last, '100');
			}
		}
		function canvas(imgObj, name, imgDiv, data, fName, next, nStep){
			var can 	= $('.img-can')[0];
		   	var ctx 	= can.getContext('2d');
			var img 	= new Image();
			img.src  = URL.createObjectURL(imgObj);
			$(img).on('load', function(){
				var w	= img.width;
				var h		= img.height;
				var t  	= (w > h) ? w : h;
				if(t > 1000){
					var r 		= Math.round((t + 1000) / 1000);
					var nw 	= Math.floor(w / r);
					var nh 	= Math.floor(h / r);
					var nr 	= (r > 1) ? 0.5 : 0.6;
				}else{
					var r 		= 1;
					var nw 	= w;
					var nh 	= h;
					var nr 	= 0.5;
				}	
				//console.log(w+','+h+','+t+','+r+','+nw+','+nh+','+nr);
			   	can.width  = nw;
			   	can.height  = nh;
				ctx.drawImage(img, 0, 0, nw, nh);
				$('#'+imgDiv).attr('src',can.toDataURL('image/jpeg', nr));		
				$('#'+data).val(can.toDataURL('image/jpeg', nr));
			});
			$('#'+fName).val(name);
			if(next){
				fnNextStep(nStep);
			}
		}
		function fnNextStep(prc){
			if(_BT.isEquals(prc, '60') && _BT.isEmptyById('prdtNm', '제품명을 입력해주세요.')) return false;	
			if(_BT.isEquals(prc, '70') && _BT.isEmptyById('stndrd', '제품규격을 입력해주세요.')) return false;	
			if(_BT.isEquals(prc, '70') && _BT.isEmptyById('makrNm', '제조사를 입력해주세요.')) return false;	
			if(_BT.isEquals(prc, '70') && _BT.isEmptyById('amt', '재고량을 입력해주세요.')) return false;	
			if(_BT.isEquals(prc, '70') && _BT.isEmptyById('price', '판매가격을 입력해주세요.')) return false;	
			if(_BT.isEquals(prc, '80') && _BT.isEmptyById('dtlInfo', '추가설명을 입력해주세요.')) return false;	
			if(_BT.isEquals(prc, '90') && !_BT.isChecked('freeYn') && _BT.isEmptyById('del_fee', '배송비를 입력해주세요.'))return false;	
			if(_BT.isEquals(prc, '100')){
				//fnSave();
			}
			$('.d'+prc).slideDown('slow');
			$('.p'+prc).removeClass('bar_off');
			$('#proc').html(prc);
		}
		function fnSave(){
			if( dupClick1 ) {
				alert('상품 정보를 등록중 입니다. 잠시만 기다려주세요.');
				return false;
			}
			if(!confirm('상품 정보를 등록 하시겠습니까?')){
				return false;
			}
			
			if($('#pkg_tp').prop('checked')){
				$('#del_pkg_tp').val('0');
			}else{
				$('#del_pkg_tp').val('1');
			}
			if($('#freeYn').prop('checked')){
				$('#del_fee_tp').val('0');
				$('#del_fee').val('0');
			}else{
				$('#del_fee_tp').val('1');
			}
			
			$('#frm').empty();
 		
			$( '#tmpFrm input' ).each(function( i ) {
				$(this).clone().appendTo('#frm');
			});
			$( '#tmpFrm textarea' ).each(function( i ) {
				$(this).clone().appendTo('#frm');
			});
			$( '#mFrm input' ).each(function( i ) {
				$(this).clone().appendTo('#frm');
			});
			$( '#sFrm input' ).each(function( i ) {
				$(this).clone().appendTo('#frm');
			});
			
			dupClick1 = true;
			_BT.ajaxCallbackSubmit("frm",  _BT.STORE.URL.Product.InsPrdt, function(data) {
				dupClick1 = false;
				if($(data).size() > 0) {
					if(_BT.isEquals(data.code, "success")) {
						alert('등록 완료 되었습니다.\n\n업무일 기준 3일안에 처리 예정 입니다. ');
		                document.location.reload();
					}else{
						alert('상품 등록 중 오류가 발생 했습니다.\n\n다시 확인 부탁 드립니다. ');
					}
				}else{
					alert('처리 중 오류가 발생 했습니다.\n\n다시 확인 부탁 드립니다. ');
				}
			},
			function(xhr, status, error) {
				alert('시스템 오류가 발생 했습니다.\n\n다시 확인 부탁 드립니다. ');
				dupClick1 = false;
			});	
		}
	</script>
		<div class="" >
			<canvas class="img-can" style="display: none;"></canvas>
			<form id="tmpFrm2" name="tmpFrm2" style="display: none;">
				<input type="file" id="file" accept="image/*" style="display: none;"/>
				<input type="file" id="files" accept="image/*" multiple="multiple" style="display: none;"/>
			</form>

			<form id="mFrm" name="mFrm" style="display: none;">
				<input type="hidden" id="mFileName"  name="mFileName" />
				<input type="hidden" id="mData" name="mData" />
			</form>	
			<form id="sFrm" name="sFrm" style="display: none;">
			</form>	
			
			<form id="frm" name="frm" style="display: none;">
				<input type="hidden" id="tmp" name="tmp" value="0"/>
			</form>	
			
			<div class="c13_01_02_box_01 hMouse">
				<span class="c13_01_02_txt_01">등록하실 제품의 대표사진을 선택해 주세요.</span>
				<div class="c13_01_02_box_m_01 margintop_20 marginbottom_20" id="mDiv">
					<img src="${staticRoot}/img/c13_01_02_noimg_01.jpg" id="result" alt="사진선택" width="340px;" height="286px;"/>
				</div>
			</div>

			<div class="c13_01_02_arrow_01">
				<img src="${staticRoot}/img/c13_01_02_arrow.jpg" alt="다음" />
			</div>
			
			<form id="tmpFrm" name="tmpFrm">
				<input type="hidden" id="sImgSize" name="sImgSize" value="0"/>
				<input type="hidden" id="del_pkg_tp" name="del_pkg_tp" value="0"/>
				<input type="hidden" id="del_fee_tp" name="del_fee_tp" value="0"/>
				<div class="c13_01_02_box_08 d50" style="display: none;">
					<span class="c13_01_02_txt_01">등록하실 제품의  제품명을 입력해 주세요.</span>
					<div class="return_select3 marginbottom_10 margintop_10">
						<input class="input_style07 paddingleft_10" placeholder="제품명을 입력해주세요." id="prdtNm" name="prdtNm" type="text"/>
						<label class="click_btn04 marginleft_15" onclick="fnNextStep('60');">다음</label>
					</div>
				</div>
	
				<div class="c13_01_02_arrow_01 d50" style="display: none;">
					<img src="${staticRoot}/img/c13_01_02_arrow.jpg" alt="다음" />
				</div>
	
				<div class="c13_01_02_box_02 d60"  style="display: none;">
					<span class="c13_01_02_txt_01">등록하실 제품의 상세 정보를 입력해 주세요.</span>
	
					<div class="margintop_20">
						<span class="c13_01_02_txt_02" style="margin-right:34px;">규 격</span>
						<span><input class="input_style07 paddingleft_10" placeholder="제품규격을 입력해주세요." id="stndrd" name="stndrd" type="text"></span>
					</div>
					<div class="margintop_5">
						<span class="c13_01_02_txt_02" style="margin-right:10px;">모델번호</span>
						<span><input class="input_style07 paddingleft_10" placeholder="모델번호를 입력해주세요." id="modelNm" name="modelNm" type="text"></span>
					</div>
					<div class="margintop_5">
						<span class="c13_01_02_txt_02" style="margin-right:26px;">제조사</span>
						<span><input class="input_style07 paddingleft_10" placeholder="제조사를 입력해주세요." id="makrNm" name="makrNm" type="text"></span>
					</div>
					<div class="margintop_5">
						<span class="c13_01_02_txt_02" style="margin-right:26px;">재고량</span>
						<span><input class="input_style07 number paddingleft_10" placeholder="재고량을 입력해주세요." id="amt" name="amt" type="text"></span>
					</div>
					<div class="margintop_5 marginbottom_20">
						<span class="c13_01_02_txt_02" style="margin-right:12px;">판매가격</span>
						<span><input class="input_style07 number paddingleft_10" placeholder="판매가격을 입력해주세요." id="price" name="price" type="text"></span>
					</div>
					<label class="click_btn05" onclick="fnNextStep('70');">다음</label>
				</div>
	
	
				<div class="c13_01_02_arrow_01 d60"  style="display: none;">
					<img src="${staticRoot}/img/c13_01_02_arrow.jpg" alt="다음" />
				</div>
	
				<div class="c13_01_02_box_03 d70"  style="display: none;">
					<span class="c13_01_02_txt_01">등록하실 제품의 추가설명을 입력해 주세요.</span>
					<div class="c13_01_02_txtbox_01"><textarea id="dtlInfo" name="dtlInfo" placeholder="등록하실 제품의 추가설명을 입력해 주세요."></textarea></div>
					<label class="click_btn05" onclick="fnNextStep('80');">다음</label>
				</div>
	
				<div class="c13_01_02_arrow_01 d70"  style="display: none;">
					<img src="${staticRoot}/img/c13_01_02_arrow.jpg" alt="다음" />
				</div>
	
				<div class="c13_01_02_box_04 d80"  style="display: none;">
					<span class="c13_01_02_txt_01">배송방법을 선택해 주세요.</span>
					<div class="c13_01_02_check_01" style="text-align: left; margin-left: 94px;">
						<input id="click01" name="del_tp" value="T" class="join_checkbox" type="radio" checked="checked"><label class="join_form_check" for="click01">택배</label>
						<input id="click02" name="del_tp" value="H" class="join_checkbox" type="radio"><label class="join_form_check" for="click02">화물택배</label>
						<input id="del_fee" name="del_fee" class="input_style02 number paddingleft_10 marginleft_20" placeholder="배송비를 입력해주세요." type="text">
					</div>					
					<div class="c13_01_02_check_02" style="text-align: left; margin-left: 100px;">
						<input id="pkg_tp" name="pkg_tp" value="1" type="checkbox" class="chk" style="margin-bottom: 12px;"/>
						<label for="pkg_tp" class="signup_txt">묶음배송(합배송)가능</label>
						
						<input id="freeYn" name="freeYn" value="1" checked="checked" type="checkbox" class="chk" style="margin-bottom: 12px; margin-left: 10px;"/>
						<label for="freeYn" class="signup_txt">무료배송</label>
					
					</div>					
					<label class="click_btn05" onclick="fnNextStep('90');">다음</label>
				</div>
			</form>	
			<div class="c13_01_02_arrow_01 d80"  style="display: none;">
				<img src="${staticRoot}/img/c13_01_02_arrow.jpg" alt="다음" />
			</div>

			<div class="c13_01_02_box_05 d90 hMouse" style="display: none;">
				<span class="c13_01_02_txt_01">추가로 올리실 사진을 촬영해 주세요. ( 최대4장 )</span>
				<div class="c13_01_02_img_01" id="sDiv">
					<img src="${staticRoot}/img/c13_01_02_noimg_02.jpg" id="sResult0" width="185px" height="149px" alt="사진선택" class="sResult"/>
					<img src="${staticRoot}/img/c13_01_02_noimg_02.jpg" id="sResult1" width="185px" height="149px" alt="사진선택" class="sResult marginleft_10"/>
					<img src="${staticRoot}/img/c13_01_02_noimg_02.jpg" id="sResult2" width="185px" height="149px" alt="사진선택" class="sResult"/>
					<img src="${staticRoot}/img/c13_01_02_noimg_02.jpg" id="sResult3" width="185px" height="149px" alt="사진선택" class="sResult marginleft_10" />
				</div>			
				<label class="click_btn05 margintop_10" onclick="fnSave();">저장</label>
			</div>

			<!-- 하단 완료게이지-->
			<div class="c13_01_02_box_06">
				<span class="c13_01_02_txt_03" id ="proc">0</span><span class="c13_01_02_txt_03">% 완료</span>
				<span class="c13_01_02_bar_on bar_off p50"></span>
				<span class="c13_01_02_bar_on bar_off p50"></span>
				<span class="c13_01_02_bar_on bar_off p50"></span>
				<span class="c13_01_02_bar_on bar_off p50"></span>
				<span class="c13_01_02_bar_on bar_off p50"></span>
				<span class="c13_01_02_bar_on bar_off p60"></span>
				<span class="c13_01_02_bar_on bar_off p70"></span>
				<span class="c13_01_02_bar_on bar_off p80"></span>
				<span class="c13_01_02_bar_on bar_off p90"></span>
				<span class="c13_01_02_bar_on bar_off p100"></span>
			</div>
			<!-- 하단 완료게이지-->
		</div>