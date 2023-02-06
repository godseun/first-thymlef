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
			//initSelect();
			//initCalendar();
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
					,{'Header': '품명', 				'Type': 'Text', 				'MinWidth': 160, 	'SaveName': 'sPrdtNm', 		'Align': 'Left', 		'KeyField':1 }  
					,{'Header': '제조사',			'Type': 'Text', 				'MinWidth': 60, 	'SaveName': 'sMakerNm', 	'Align': 'Left', 		'KeyField':1 	}
					,{'Header': '재고량', 			'Type': 'Int', 				'MinWidth': 50,		'SaveName': 'sAmt', 			'Align': 'Right', 		'KeyField':1,		'Format': '#,###'}
					,{'Header': '배송구분', 			'Type': 'Combo', 			'MinWidth': 50,		'SaveName': 'sDlTp', 			'Align': 'Center', 	'KeyField':1,		'ComboText': '택배|화물', 	'ComboCode': 'T|H'}
					,{'Header': '묶음배송',			'Type': 'Combo', 			'MinWidth': 50,		'SaveName': 'sPkgTp', 		'Align': 'Center', 	'KeyField':1,		'ComboText': '가능|불가', 	'ComboCode': '0|1'	}
					,{'Header': '배송비', 			'Type': 'Int', 				'MinWidth': 50,		'SaveName': 'sDlFee', 		'Align': 'Right', 		'KeyField':1,		'Format': '#,###',		 	'DefaultValue':0}   
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
					,{'Header': '규격', 				'Type': 'Text', 				'MinWidth': 160, 	'SaveName': 'sStndrd', 		'Align': 'Left', 		'KeyField':1 	}
					,{'Header': '모델명',			'Type': 'Text', 				'MinWidth': 60, 	'SaveName': 'sModelNm', 	'Align': 'Left'		}
					,{'Header': '판매가', 			'Type': 'Int', 				'MinWidth': 50,		'SaveName': 'sPrice', 		'Align': 'Right', 		'KeyField':1, 	'Format': '#,###'}
					,{'Header': '추가설명',	 		'Type': 'Text', 				'MinWidth': 200, 	'SaveName': 'sPrdtDtlInfo',	'Align': 'Left', 		'ColSpan':3, 	'MultiLineText': 1}
					,{'Header': '추가설명'	}
					,{'Header': '추가설명'	}
					,{'Header': '추가3',	 			'Type': 'Text', 				'MinWidth': 80, 	'SaveName': 'sENo2',			'Align': 'Center', 	'Edit':0, 	'Hidden':1}
					,{'Header': '추가4',	 			'Type': 'Text', 				'MinWidth': 80, 	'SaveName': 'sENo3',			'Align': 'Center', 	'Edit':0, 	'Hidden':1}
					,{'Header': '대표이미지파일',	'Type': 'Text', 				'MinWidth': 80, 	'SaveName': 'sSName',		'Align': 'Center', 	'Edit':0, 	'Hidden':1}
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
		
		
	</script>
	<div class="section" style="min-height:700px;">
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
								<span class="return_select5">
									<select class="" id="sSus" name="sSus">
										<option value="">전체</option>
										<option value="1">정상</option>
										<option value="5">일시품절</option>
										<option value="2">단종</option>
									</select>
								</span>		
								<span class="c13_01_03_txt_01">
									검색어
								</span>
								<input class="input_style08" type="text" placeholder="검색어" id="sValue" name="sValue"/>						
								<span class="inquiry_btn marginleft_7">
									<span data-type="save" data-value="1" class="sButton btn_span fs-13 pink marginleft_5" style="float: right;">저장</span>
									<span data-type="search" data-value="1"  class="sButton btn_span fs-13 blue marginleft_5" style="float: right;">조회</span>
<!-- 									
									<span data-type="Export" data-value="1"  class="sButton btn_span fs-13 green" style="float: right;">추가</span>
 -->									
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
		
		
			
			
			
	</div>
