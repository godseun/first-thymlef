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
			initSheet();
			initSelect();
			initCalendar();
		});
		function initSheet(){
			var initData = {};
			initData.Cfg = {
									'ToolTip': 1,
									'DragMode': -1,
									'AutoFitColWidth': 'search|resize|init|colhidden|rowtransaction',
									'MergeSheet': msFixedMerge + msHeaderOnly 
								};
			initData.HeaderMode = {};
			
			initData.Cols = [
[ //첫번째 단위 데이터(DataRow) 행
					{'Header': '번호', 				'Type': 'Seq', 				'MinWidth': 50,		'SaveName': 'sSeq',			'Align': 'Center' }
					,{'Header': '대표이미지', 		'Type': 'Image', 			'MinWidth': 100,	'SaveName': 'sPImg', 		'Align': 'Center', 	'Edit':0, 'Save': 0, 'RowSpan': 3, 	'ImgMinWidth': 100, 'ImgHeight': 60	}
					,{'Header': '품명', 				'Type': 'Text', 				'MinWidth': 120, 	'SaveName': 'sPrdtNm', 		'Align': 'Left',		'ColSpan':2 	}
					,{'Header': '품명'	}
					,{'Header': '카테고리',			'Type': 'Text', 				'MinWidth': 200, 	'SaveName': 'sCtegNm',		'Align': 'Left'	}
					,{'Header': '재고량', 			'Type': 'Text', 				'MinWidth': 50,		'SaveName': 'sAmt', 			'Align': 'Right', 		'Edit':0, 'Save': 0 }
					,{'Header': '판매가', 			'Type': 'Text', 				'MinWidth': 50,		'SaveName': 'sPrice', 		'Align': 'Right', 		'Edit':0, 'Save': 0 }
					,{'Header': '요청일',	 		'Type': 'Date', 				'MinWidth': 80, 	'SaveName': 'sCdt', 			'Align': 'Center', 	'Edit':0, 'Save': 0 }
					,{'Header': '요청자',	 		'Type': 'Text', 				'MinWidth': 80, 	'SaveName': 'sCid', 			'Align': 'Center', 	'Edit':0, 'Save': 0 }
					,{'Header': '품목코드',	 		'Type': 'Text', 				'MinWidth': 80, 	'SaveName': 'sPrdtCd', 		'Align': 'Center', 	'Edit':0}
					,{'Header': '승인여부',	 		'Type': 'Text', 				'MinWidth': 50, 	'SaveName': 'sConYN', 		'Align': 'Center', 	'Edit':0, 'Save': 0 }
					,{'Header': '등록사코드',		'Type': 'Text', 				'MinWidth': 80, 	'SaveName': 'sSId', 			'Align': 'Center', 	'Edit':0}
					,{'Header': '1카테고리',	 		'Type': 'Text', 				'MinWidth': 80, 	'SaveName': 'ca1',			'Align': 'Center', 	'Edit':0, 	'Hidden':1}
					,{'Header': '2카테고리',	 		'Type': 'Text', 				'MinWidth': 80, 	'SaveName': 'ca2',			'Align': 'Center', 	'Edit':0, 	'Hidden':1}
					 
],
[ //두번째 단위 데이터(DataRow) 행
					{'Header': '구분', 				'Type': 'Status', 			'MinWidth': 50,		'SaveName': 'sStatus', 		'Align': 'Center' }
					,{'Header': '대표이미지'	}
					,{'Header': '규격', 				'Type': 'Text', 				'MinWidth': 120, 	'SaveName': 'sStndrd', 		'Align': 'Left',	'ColSpan':2 }
					,{'Header': '규격'		}
					,{'Header': '추가설명',	 		'Type': 'Text', 				'MinWidth': 200, 	'SaveName': 'sPrdtDtlInfo',	'Align': 'Left', 		'MultiLineText': 1}
					,{'Header': '배송', 				'Type': 'Combo', 			'MinWidth': 50,		'SaveName': 'sDlTp', 			'Align': 'Center', 	'Edit':0, 'Save': 0,		'ComboText': '택배|화물', 'ComboCode': 'T|H'	}
					,{'Header': '합배송', 			'Type': 'Combo', 			'MinWidth': 50,		'SaveName': 'sPkgTp', 		'Align': 'Center', 	'Edit':0, 'Save': 0,		'ComboText': '가능|불가', 'ComboCode': '0|1'	}
					,{'Header': '처리일',	 		'Type': 'Date', 				'MinWidth': 80, 	'SaveName': 'sUdt', 			'Align': 'Center', 	'Edit':0, 'Save': 0 }
					,{'Header': '처리자',	 		'Type': 'Text', 				'MinWidth': 80, 	'SaveName': 'sUid', 			'Align': 'Center', 	'Edit':0, 'Save': 0 }
					,{'Header': '추가이미지',		'Type': 'Text', 				'MinWidth': 80, 	'SaveName': 'sEImg',			'Align': 'Center', 	'Edit':0}
					,{'Header': '승인일',	 		'Type': 'Text', 				'MinWidth': 50, 	'SaveName': 'sConDt', 		'Align': 'Center', 	'Edit':0, 'Save': 0 }
					,{'Header': '제조사코드',		'Type': 'Text', 				'MinWidth': 80, 	'SaveName': 'sMakerCd',	'Align': 'Center', 	'Edit':0}
					,{'Header': '3카테고리',	 		'Type': 'Text', 				'MinWidth': 80, 	'SaveName': 'ca3',			'Align': 'Center', 	'Edit':0, 	'Hidden':1}
					,{'Header': '', 	'Hidden':1}
],
[ //세번째 단위 데이터(DataRow) 행
					{'Header': '상태', 				'Type': 'Combo', 			'MinWidth': 50,	 	'SaveName': 'sSttus',		'Align': 'Center', 	'Edit':1, 	'ComboText': '요청|보류|승인|반려|재요청', 'ComboCode': '1|2|3|4|5'}
					,{'Header': '대표이미지'			}
					,{'Header': '제조사',			'Type': 'Text', 				'Width': 60, 		'SaveName': 'sMakerNm', 	'Align': 'Left'	}
					,{'Header': '모델명',			'Type': 'Text', 				'Width': 60, 		'SaveName': 'sModelNm', 	'Align': 'Left'	}
					,{'Header': '담당자설명',		'Type': 'Text', 				'MinWidth': 200, 	'SaveName': 'sPdrtInfo', 	'Align': 'Left'	}
					,{'Header': '배송비구분', 		'Type': 'Combo', 			'MinWidth': 50,		'SaveName': 'sDlFeeTp', 	'Align': 'Center', 	'Edit':0, 'Save': 0, 	'ComboText': '무료|유료', 'ComboCode': '0|1'	}
					,{'Header': '배송비', 			'Type': 'Text', 				'MinWidth': 50,		'SaveName': 'sDlFee', 		'Align': 'Right', 		'Edit':0, 'Save': 0	}
					,{'Header': '비고',	 			'Type': 'Text', 				'MinWidth': 80, 	'SaveName': 'sConRMK', 	'Align': 'Left', 		'ColSpan':2 }
					,{'Header': '비고'}
					,{'Header': '5카테고리',	 		'Type': 'Text', 				'MinWidth': 80, 	'SaveName': 'ca5',		'Align': 'Center', 	'Edit':0}
					,{'Header': '승인자',	 		'Type': 'Text', 				'MinWidth': 50, 	'SaveName': 'sConId', 		'Align': 'Center', 	'Edit':0, 'Save': 0 }
					,{'Header': '등록사명',	 		'Type': 'Text', 				'MinWidth': 50, 	'SaveName': 'sSNm', 			'Align': 'Center', 	'Edit':0, 'Save': 0 }
					,{'Header': '4카테고리',	 		'Type': 'Text', 				'MinWidth': 80, 	'SaveName': 'ca4',		'Align': 'Center', 	'Edit':0, 	'Hidden':1}
					,{'Header': '', 	'Hidden':1}
]
];			
			// IBSheet 생성
			createIBSheet2($('#ib-container1')[0], 'mySheet1', '100%', '300px');
			
			// IBSheet 초기화
			IBS_InitSheet(mySheet1, initData);	

			// 편집 가능 여부 설정
			mySheet1.SetEditable(true);
			
			// 사이즈 맞춤
			mySheet1.FitColWidth();
		}	
		
		function doAction(sAction, tar) { 
			switch(sAction) {     
				case 'search':            
					var sheet = eval('mySheet' + tar);
					if(1 == tar)
						sheet.DoSearch(_BT.FRONT.URL.Search.SheetUpPrdtList, $('#sheetFrm').serialize()); 
					break; 
				case 'save':       //저장
					if($('#ca5').val() == 'C9999'){
						alert('카테고리를 지정해 주세요.');
						return false;
					}
					if($('#sMakerCd').val() == ''){
						alert('제조사를 지정해 주세요.');
						return false;
					}
					var sheet = eval('mySheet' + tar);
		            var inputElem = $('#ib-container2').find('input, select, textarea');
	               	var elem = null;
		            var saveObj = {};
		            for (idx in inputElem) {
		                elem = inputElem[idx];
		                saveObj[elem.id] = elem.value;
		            }
		            sheet.SetRowData(mySheet1.GetSelectRow(), saveObj);
					var opt = {UrlEncode:0, Mode:2, Delim:'#'};
					var SaveStr = sheet.GetSaveString(opt); 
					if('' == SaveStr){
						alert('저장할 내역이 없습니다.'); 
						break;
					}else if('KeyFieldError' == SaveStr){ 
						break;
					}else{
						if(!confirm('변경 내역을 저장하시겠습니까?')) break;
					}
					var rtnData = sheet.GetSaveData(_BT.FRONT.URL.Product.SaveSheetPrdt, SaveStr); 
					sheet.LoadSaveData(rtnData);
					break;     
					
				case 'check':
					_BT.openPopup( _BT.FRONT.URL.Product.PopMaker,'popMaker', '610', '500', true, true);
					break; 
			} 
		} 

		function initSelect(){
			_BT.CategSearch.makeSelect('1');
			for(var sel=2; sel<6; sel++){
				$('#ca'+sel).empty();
				$('#ca'+sel).append('<option value="C9999">미지정</option>');
			}
		}

		function initCalendar(){
			_BT.setReadOnly("sDt"); 
			_BT.setReadOnly("eDt"); 
			_BT.makeCalendar("sDt", "yy-mm-dd"); 
			_BT.makeCalendar("eDt", "yy-mm-dd"); 
			$('#sDt').val(_BT.dateAdd($.datepicker.formatDate($.datepicker.ATOM, new Date()),-7,"d"));
			$('#eDt').val($.datepicker.formatDate($.datepicker.ATOM, new Date()));	
		}
		
		function mySheet1_OnDblClick(Row, Col, Value, CellX, CellY, CellW, CellH) { 
			$('.sEImg').attr('src','${staticRoot}/img/sample03.jpg');
			if (Row == 0) return; //헤더행일때는 폼에 반영 안함.
			row = Row;
			var obj = mySheet1.GetRowData(Row),
			elem = null;
			for (elem in obj) {
		    	if(elem == 'sPImg'){
			        $('#show_pic').attr('src',obj[elem]);
		    	}else if(elem == 'sEImg'){
		    		if(!_BT.isEmpty(obj['sEImg'])){
			    	    var sEImg = obj[elem].split('|');
						for(var i=0; i<sEImg.length;i++){
							$('#sEImg' + i).attr('src',sEImg[i]);
						}	    		
		    		}
		    	}else if ($('#' + elem)[0]) {
					$('#' + elem).val(obj[elem]);
			    }
			}
			initSelect();
		}
		function fnSave(){
			doAction('save', '1');
		}
		
		function fnNextRow(){
			mySheet1_OnDblClick((row+3),'','','','','','');
		}
		function fnSetMaker(obj){
			$('#sMakerNm').val(obj.sMkNm);
			$('#sMakerCd').val(obj.sMkCd);
		}
		function mySheet1_OnSaveEnd(code) {
			if(code == 1){         
				alert("저장완료 하였습니다.");  
                document.location.reload();
			} else {         
				alert("저장에 실패하였습니다.");     
			} 
		} 
	</script>
	
	<div class="main_content06" style="padding-top: 0px; min-height: 800px; margin-bottom: 20px;">
		<form id="sheetFrm" name="sheetFrm">
			<div >
				<table class="tbl_Type09">
					<caption>조회</caption>
					<colgroup>
						<col width="10%">
						<col width="%">
					</colgroup>
					<tbody>
						<tr>
							<th>
								조회
							</th>
							<td style="text-align: left;">
								<span class="c13_01_03_txt_01">
									등록일
								</span>
								<span class="inquiry">
									<input type="text" class="input_style05" id="sDt" name="sDt"/>
								</span>
								<span class="tbl_txt">
									~
								</span>
								<span class="inquiry">
									<input type="text" class="input_style05" id="eDt" name="eDt"/>
								</span>
								<span class="c13_01_03_txt_01">
									등록자
								</span>
								<input class="input_style08" type="text" placeholder="등록자 아이디" id="sNm" name="sNm"/>			
								<span class="c13_01_03_txt_01">
									검색어
								</span>
								<input class="input_style08" type="text" placeholder="품명 또는 검색어" id="sValue" name="sValue"/>						
								<span class="c13_01_03_txt_01">
									상태
								</span>
								<span class="return_select5">
									<select class="" id="sSus" name="sSus">
										<option value="">전체</option>
										<option value="1">요청</option>
										<option value="5">재요청</option>
										<option value="2">보류</option>
										<option value="3">승인</option>
										<option value="4">반려</option>
									</select>
								</span>		
								<span class="inquiry_btn marginleft_7">
									<span data-type="save" data-value="1" class="sButton btn_span fs-13 pink marginleft_5" style="float: right;">저장</span>
									<span data-type="search" data-value="1"  class="sButton btn_span fs-13 blue" style="float: right;">조회</span>
								</span>
							</td>
						</tr>
					</tbody>
				</table>	
			</div>
		</form>
		
		<div class="col-sm-5 col-md-5" style="margin-top:10px;" >
		    <div id="ib-container1"></div>
		</div>
		
		<div class="prdc_top_wrap" style="margin-top: 10px;">
			<div class="prdc_info_column01_1">
				<div class="prdc_img1" id="show" align="center" style="padding:10px;">
					<img src="${staticRoot}/img/sample03.jpg" alt="상품사진" id="show_pic" style="width:360px;height:288px;" onerror="this.src='${staticRoot}/img/sample03.jpg'" data-action="zoom"/> 
				</div>
				<div class="prdc_img_plus">
					<span>
						<img src="${staticRoot}/img/sample03.jpg" class="sEImg" id="sEImg0" style="width:90px;;height:87px;" alt="샘플사진" data-action="zoom"/>
					</span>
					<span>
						<img src="${staticRoot}/img/sample03.jpg" class="sEImg" id="sEImg1" style="width:90px;;height:87px;" alt="샘플사진" data-action="zoom"/>
					</span>
					<span>
						<img src="${staticRoot}/img/sample03.jpg" class="sEImg" id="sEImg2" style="width:90px;;height:87px;" alt="샘플사진" data-action="zoom"/>
					</span>
					<span class="mr_0">
						<img src="${staticRoot}/img/sample03.jpg" class="sEImg" id="sEImg3" style="width:90px;;height:87px;" alt="샘플사진" data-action="zoom"/>
					</span>
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
								<img class=""/>등록자
							</th>
							<td align="left">
								<input type="text" id="sSNm" name="sSNm" class="sub_option_input3" readonly="readonly" />
							</td>
							<th>
								<img class=""/>등록일
							</th>
							<td align="left">
								<input type="text" id="sCdt" name="sCdt" class="sub_option_input3"  readonly="readonly" />
							</td>
						</tr>
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
				<div style="padding-top:10px;">
					<span class="total_sel">
						<span class="total">
							처리결과
						</span>
						<select class="prdc_option" id="sSttus" name="sSttus">
							<option value="2">보류</option>
							<option value="3">승인</option>
							<option value="4">반려</option>
						</select>
					</span>
				</div>
			</div>
			<div class="icon_btn_Group2 margintop_40">
				<a class="btn_sub_01" href="javascript:;" onclick="fnSave();">
					저장
				</a>
<!-- 				
				<a class="btn_sub_03" href="javascript:;" onclick="fnNextRow();">
					다음
				</a>
 -->				
			</div>
		</div>	 
	</div>