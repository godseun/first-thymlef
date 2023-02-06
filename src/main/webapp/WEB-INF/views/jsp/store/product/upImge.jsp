<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/layout/include/base.jsp" %>
	<script type="text/javascript">
		var dupClick1 = false;
		var cnt = 0;
		$(function(){ 
			$('.sResult').on('click', function() {
				$('#files').trigger('click');
			});
			$('#files').on('change', function(e) {
				var imgs = e.target.files;
				if(imgs.length > 20) {
					alert('추가 이미지는 20장 까지 가능 합니다.');
					return false;
				} else {
					cnt = imgs.length;
					$('#sImgSize').val(imgs.length);
					for(var i=0; i<imgs.length; i++){
						var img = imgs[i];
						if(img.constructor !== File || !img.type.match('image.*')){
							alert('이미지 파일만 선택 가능 합니다.');
							return false;
						}
					}
					$('#process').removeClass("vOff");
					canvasMulti(imgs);
				}
			});
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
<%-- 					
				if(t > 1000){
					var r 		= 1
					var nw 	= Math.floor(w / r);
					var nh 	= Math.floor(h / r);
					var nr 	= (r > 1) ? 0.5 : 0.6;
				}else{
 --%>						
					var r 		= 1;
					var nw 	= w;
					var nh 	= h;
					var nr 	= 1;
<%-- 				
				}
 --%>	
				//console.log(w+','+h+','+t+','+r+','+nw+','+nh+','+nr);
			   	can.width  = nw;
			   	can.height  = nh;
				ctx.drawImage(img, 0, 0, nw, nh);
				$('#'+imgDiv).attr('src',can.toDataURL('image/jpeg'));		
				$('#'+data).val(can.toDataURL('image/jpeg'));
				cnt--; 
				if(cnt <= 1){
					$('#process').addClass("vOff");
				}
				
			});
			$('#'+fName).val(name);
		}
		function fnSave(){
			if( dupClick1 ) {
				alert('이미지를 등록중 입니다. 잠시만 기다려주세요.');
				return false;
			}
			if($('#sImgSize').val() < 1){
				alert('저장할 내역이 없습니다.');
				return false;
			}
			if(!confirm('이미지를 등록 하시겠습니까?')){
				return false;
			}
			$( '#sFrm input' ).each(function( i ) {
				$(this).clone().appendTo('#frm');
			});
			$('#process').removeClass("vOff");
			dupClick1 = true;
			_BT.ajaxCallbackSubmit("frm",  _BT.STORE.URL.Product.InsImg, function(data) {
				dupClick1 = false;
				$('#process').addClass("vOff");
				if($(data).size() > 0) {
					if(_BT.isEquals(data.code, "success")) {
						alert('이미지 등록 완료 되었습니다.\n\n물품등록>임시저장내역에서 확인 부탁 드립니다. ');
		                document.location.reload();
					}else{
						alert('이미지 등록 중 오류가 발생 했습니다.\n\n다시 확인 부탁 드립니다. ');
					}
				}else{
					alert('처리 중 오류가 발생 했습니다.\n\n다시 확인 부탁 드립니다. ');
				}
			},
			function(xhr, status, error) {
				alert('시스템 오류가 발생 했습니다.\n\n다시 확인 부탁 드립니다. ');
				$('#process').addClass("vOff");
				dupClick1 = false;
			});	
			
		}
	</script>
	<div class="" style="min-height:700px;">
		<div class="all_bg vOff" id="process" style="text-align: center;padding-top: 200px;"> 
			<img src="${staticRoot}/img/common/process.gif" alt="process" width="300px;" height="300px;"/>
		</div>
		<canvas class="img-can" style="display: none;"></canvas>
		<form id="tmpFrm2" name="tmpFrm2" style="display: none;">
			<input type="file" id="files" accept="image/*" multiple="multiple" style="display: none;"/>
		</form>
		<form id="sFrm" name="sFrm" style="display: none;">
		</form>	
		<form id="frm" name="frm" style="display: none;">
			<input type="hidden" id="sImgSize" name="sImgSize" value="0"/>
		</form>	
		
		<h2 class="title_con_Type01">
			물품 사진 등록 하기						
		</h2>				
		<p class="c13_01_03">제품의 사진 일괄 등록</p>
		<ol class="c13_01_03_ol">
			<li>1. 모바일 화면에서 제품 사진만 먼저 일괄로 등록 하신 후</li>
			<li>2. PC 화면에서 임시저장 내역을 선택하여 상세 정보를 입력하시는 기능 입니다.</li>
		</ol>
		<div class="c13_01_03_box_01">
			<span class="c13_01_02_txt_01">제품의 사진을 등록 후 임시저장 페이지에서 상세 내역을 입력해 주세요.</span>
			<div class="c13_01_02_img_01">
				<a href="#"><img src="${staticRoot}/img/c13_01_02_noimg_02.jpg" alt="사진선택" id="sResult0"  width="185px" height="149px" class="sResult marginleft_10"/></a>
				<a href="#"><img src="${staticRoot}/img/c13_01_02_noimg_02.jpg" alt="사진선택" id="sResult1"  width="185px" height="149px" class="sResult marginleft_10"/></a>
				<a href="#"><img src="${staticRoot}/img/c13_01_02_noimg_02.jpg" alt="사진선택" id="sResult2"  width="185px" height="149px" class="sResult marginleft_10"/></a>
				<a href="#"><img src="${staticRoot}/img/c13_01_02_noimg_02.jpg" alt="사진선택" id="sResult3"  width="185px" height="149px" class="sResult marginleft_10" /></a>
				<a href="#"><img src="${staticRoot}/img/c13_01_02_noimg_02.jpg" alt="사진선택" id="sResult4"  width="185px" height="149px" class="sResult marginleft_10"/></a>
				<a href="#"><img src="${staticRoot}/img/c13_01_02_noimg_02.jpg" alt="사진선택" id="sResult5"  width="185px" height="149px" class="sResult marginleft_10"/></a>
				<a href="#"><img src="${staticRoot}/img/c13_01_02_noimg_02.jpg" alt="사진선택" id="sResult6"  width="185px" height="149px" class="sResult marginleft_10"/></a>
				<a href="#"><img src="${staticRoot}/img/c13_01_02_noimg_02.jpg" alt="사진선택" id="sResult7"  width="185px" height="149px" class="sResult marginleft_10" /></a>
				<a href="#"><img src="${staticRoot}/img/c13_01_02_noimg_02.jpg" alt="사진선택" id="sResult8"  width="185px" height="149px" class="sResult marginleft_10"/></a>
				<a href="#"><img src="${staticRoot}/img/c13_01_02_noimg_02.jpg" alt="사진선택" id="sResult9"  width="185px" height="149px" class="sResult marginleft_10"/></a>
				<a href="#"><img src="${staticRoot}/img/c13_01_02_noimg_02.jpg" alt="사진선택" id="sResult10"  width="185px" height="149px" class="sResult marginleft_10"/></a>
				<a href="#"><img src="${staticRoot}/img/c13_01_02_noimg_02.jpg" alt="사진선택" id="sResult11"  width="185px" height="149px" class="sResult marginleft_10" /></a>
				<a href="#"><img src="${staticRoot}/img/c13_01_02_noimg_02.jpg" alt="사진선택" id="sResult12"  width="185px" height="149px" class="sResult marginleft_10"/></a>
				<a href="#"><img src="${staticRoot}/img/c13_01_02_noimg_02.jpg" alt="사진선택" id="sResult13"  width="185px" height="149px" class="sResult marginleft_10"/></a>
				<a href="#"><img src="${staticRoot}/img/c13_01_02_noimg_02.jpg" alt="사진선택" id="sResult14"  width="185px" height="149px" class="sResult marginleft_10"/></a>
				<a href="#"><img src="${staticRoot}/img/c13_01_02_noimg_02.jpg" alt="사진선택" id="sResult15"  width="185px" height="149px" class="sResult marginleft_10" /></a>
				<a href="#"><img src="${staticRoot}/img/c13_01_02_noimg_02.jpg" alt="사진선택" id="sResult16"  width="185px" height="149px" class="sResult marginleft_10"/></a>
				<a href="#"><img src="${staticRoot}/img/c13_01_02_noimg_02.jpg" alt="사진선택" id="sResult17"  width="185px" height="149px" class="sResult marginleft_10"/></a>
				<a href="#"><img src="${staticRoot}/img/c13_01_02_noimg_02.jpg" alt="사진선택" id="sResult18"  width="185px" height="149px" class="sResult marginleft_10"/></a>
				<a href="#"><img src="${staticRoot}/img/c13_01_02_noimg_02.jpg" alt="사진선택" id="sResult19"  width="185px" height="149px" class="sResult marginleft_10" /></a>
			</div>
			<div class="cart_btn margintop_20 marginbottom_20">
				<span class="btn_06" onclick="fnSave();">
					저 장
				</span>										
			</div>
		</div>
	</div>
