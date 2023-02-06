<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/layout/include/base.jsp" %>
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
					{'Header': '번호', 				'Type': 'Seq', 				'MinWidth': 50,		'SaveName': 'sSeq',			'Align': 'Center', 	'Hidden':1}
					,{'Header': '선택',		 		'Type': 'CheckBox', 		'MinWidth': 40,		'SaveName': 'sCheckBox', 	'Align': 'Center', 	'RowSpan': 2,		'DefaultValue':1}   
					,{'Header': '대표이미지', 		'Type': 'Image', 			'MinWidth': 60,		'SaveName': 'sPImg', 		'Align': 'Center', 	'Edit':0, 'Save': 0, 'RowSpan': 2, 	'ImgMinWidth': 100, 'ImgHeight': 60	}
					,{'Header': '추가1', 			'Type': 'Image', 			'MinWidth': 60,		'SaveName': 'sEImg0', 		'Align': 'Center', 	'Edit':0, 'Save': 0, 'RowSpan': 2, 	'ImgMinWidth': 100, 'ImgHeight': 60	}
					,{'Header': '추가2', 			'Type': 'Image', 			'MinWidth': 60,		'SaveName': 'sEImg1', 		'Align': 'Center', 	'Edit':0, 'Save': 0, 'RowSpan': 2, 	'ImgMinWidth': 100, 'ImgHeight': 60	}
					,{'Header': '추가3', 			'Type': 'Image', 			'MinWidth': 60,		'SaveName': 'sEImg2', 		'Align': 'Center', 	'Edit':0, 'Save': 0, 'RowSpan': 2, 	'ImgMinWidth': 100, 'ImgHeight': 60	}
					,{'Header': '추가4', 			'Type': 'Image', 			'MinWidth': 60,		'SaveName': 'sEImg3', 		'Align': 'Center', 	'Edit':0, 'Save': 0, 'RowSpan': 2, 	'ImgMinWidth': 100, 'ImgHeight': 60	}
					,{'Header': '품명', 				'Type': 'Text', 				'MinWidth': 160, 	'SaveName': 'sPrdtNm', 		'Align': 'Left',	 	'Edit':0, 'Save': 0	}  
					,{'Header': '카테고리',	 		'Type': 'Text', 				'MinWidth': 200, 	'SaveName': 'sCteg',			'Align': 'Left', 		'Edit':0, 	'Save': 0}
					,{'Header': '제조사',			'Type': 'Text', 				'MinWidth': 60, 	'SaveName': 'sMakerNm', 	'Align': 'Left', 		'Edit':0, 'Save': 0	}

					,{'Header': '판매가', 			'Type': 'Int', 				'MinWidth': 50,		'SaveName': 'sPrice', 		'Align': 'Right', 		'KeyField':1, 	'Format': '#,###'}
					,{'Header': '재고량', 			'Type': 'Int', 				'MinWidth': 50,		'SaveName': 'sAmt', 			'Align': 'Right', 		'KeyField':1,		'Format': '#,###'}
					,{'Header': '판매수량', 			'Type': 'Int', 				'MinWidth': 50,		'SaveName': 'sScnt', 		'Align': 'Right', 		'Edit':0, 	'Save': 0,	'Format': '#,###'}
				
					,{'Header': '요청일',	 		'Type': 'Date', 				'MinWidth': 80, 	'SaveName': 'sCdt', 			'Align': 'Center', 	'Edit':0, 	'Save': 0 }
					
					,{'Header': '추가1',	 			'Type': 'Text', 				'MinWidth': 60, 	'SaveName': 'sENo0',			'Align': 'Center', 	'Edit':0, 	'Hidden':1}
					,{'Header': '추가2',	 			'Type': 'Text', 				'MinWidth': 60, 	'SaveName': 'sENo1',			'Align': 'Center', 	'Edit':0, 	'Hidden':1}
					,{'Header': '대표이미지',		'Type': 'Text', 				'MinWidth': 80, 	'SaveName': 'sPNo',			'Align': 'Center', 	'Edit':0, 	'Hidden':1}
				],
				[ //두번째 단위 데이터(DataRow) 행
					{'Header': '구분', 				'Type': 'Status', 			'MinWidth': 50,		'SaveName': 'sStatus', 		'Align': 'Center', 	'Hidden':1}
					,{'Header': '선택'	}
					,{'Header': '대표이미지'	}
					,{'Header': '추가1'	}
					,{'Header': '추가2'	}
					,{'Header': '추가3'	}
					,{'Header': '추가4'	}
					,{'Header': '규격', 				'Type': 'Text', 				'MinWidth': 160, 	'SaveName': 'sStndrd', 		'Align': 'Left', 		'Edit':0, 	'Save': 0}
					,{'Header': '추가설명',	 		'Type': 'Text', 				'MinWidth': 200, 	'SaveName': 'sPrdtDtlInfo',	'Align': 'Left', 		'MultiLineText': 1}
					,{'Header': '모델명',			'Type': 'Text', 				'MinWidth': 60, 	'SaveName': 'sModelNm', 	'Align': 'Left'		}
					
					,{'Header': '배송구분', 			'Type': 'Combo', 			'MinWidth': 50,		'SaveName': 'sDlvyTp', 			'Align': 'Center', 	'KeyField':1,		'ComboText': '택배', 	'ComboCode': 'T'	}
					,{'Header': '묶음배송',			'Type': 'Combo', 			'MinWidth': 50,		'SaveName': 'sPkgTp', 		'Align': 'Center', 	'KeyField':1,		'ComboText': '가능|불가', 	'ComboCode': '0|1'	}
					,{'Header': '배송비', 			'Type': 'Int', 				'MinWidth': 50,		'SaveName': 'sDlvyFee', 		'Align': 'Right', 		'KeyField':1,		'Format': '#,###',		 	'DefaultValue':0}   
				
					,{'Header': '등록일',	 		'Type': 'Date', 				'MinWidth': 50, 	'SaveName': 'sConDt', 		'Align': 'Center', 	'Edit':0, 	'Save': 0 }
						
					,{'Header': '추가3',	 			'Type': 'Text', 				'MinWidth': 80, 	'SaveName': 'sENo2',			'Align': 'Center', 	'Edit':0, 	'Hidden':1}
					,{'Header': '추가4',	 			'Type': 'Text', 				'MinWidth': 80, 	'SaveName': 'sENo3',			'Align': 'Center', 	'Edit':0, 	'Hidden':1}
					,{'Header': '대표이미지파일',	'Type': 'Text', 				'MinWidth': 80, 	'SaveName': 'sSName',		'Align': 'Center', 	'Edit':0, 	'Hidden':1}
				]
			];				
			// IBSheet 생성
			createIBSheet2($('#ib-container1')[0], 'mySheet1', '100%', '500px');
			
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
						sheet.DoSearch(_BT.STORE.URL.Search.SheetPrdtList, $('#sheetFrm').serialize()); 
					break; 
			}
		}
	</script>
	<div class="storeSection" style="min-height: 650px;">
		<h2 class="title_con_Type01">
			상품관리				
		</h2>
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
									상태
								</span>
								<span class="return_select5" style="width: 100px;">
									<select class="" id="sSus" name="sSus">
										<option value="">전체</option>
										<option value="1">정상/노출</option>
										<option value="5">일시품절</option>
										<option value="2">단종/미노출</option>
									</select>
								</span>		
								<span class="c13_01_03_txt_01">
									검색어
								</span>
								<input class="input_style08" type="text" placeholder="검색어" id="sValue" name="sValue"/>	
								<span class="c13_01_03_txt_01">
									<input type="checkbox" id="showYn" name="showYn" /><label for="showYn">판매중인 제품만</label>		
								</span>
								<span class="inquiry_btn marginleft_7">
									<span data-type="save" data-value="1" class="sButton btn_span fs-13 pink marginleft_5" style="float: right;">저장</span>
									<span data-type="search" data-value="1"  class="sButton btn_span fs-13 blue marginleft_5" style="float: right;">조회</span>
								</span>
							</td>
						</tr>
					</tbody>
				</table>	
			</div>
		</form>
		<div class="col-sm-5 col-md-5" style="margin-top:10px;height:510px" >
		    <div id="ib-container1"></div>
		</div>
		<div class="signup_agree">
			<p class="alarm_txt">※ 일시품절 상태에서<span class="redCr bTxt" >7일</span>이 경과 하면<span class="redCr bTxt" > 단종</span> 으로 변경되어 노출이 제한 됩니다.
			<p class="alarm_txt">※ <span class="redCr bTxt" >프리서비스계정</span> 이용상점은 <span class="redCr bTxt" >5상품</span>만 쇼핑몰에 화면에 노출 됩니다.
		</div>
	</div>
