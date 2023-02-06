<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/layout/include/base.jsp" %>
	<div class="main_content06" style="padding-top: 0px; min-height: 800px; margin-bottom: 20px;">
		<div >
			<form id="sheetFrm" name="sheetFrm">
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
								<span class="c13_01_03_txt_01" style="margin-left: 5px;">
									아이디
								</span>
								<input type="text" id="sUsrId" name="sUsrId" class="input_style08" placeholder="아이디">					
								<span class="c13_01_03_txt_01">
									이름
								</span>
								<input type="text" id="sUsrNm" name="sUsrNm" class="input_style08" placeholder="이름">			
								<span class="c13_01_03_txt_01">
									검색어
								</span>
								<input type="text" id="sUsrNm" name="sValue" class="input_style08" placeholder="검색어">	
								<span class="c13_01_03_txt_01">
									구분
								</span>
								<span class="return_select5">
									<select id="sUsrTp" name="sUsrTp" class="">
										<option value="">전체</option>
										<option value="S">판매자</option>
										<option value="B">구매자</option>
										<option value="A">관리자</option>
									</select>
								</span>		
								<span class="c13_01_03_txt_01">
									상태
								</span>
								<span class="return_select2">
									<select id="sUsrLv" name="sUsrLv" class="">
										<option value="">전체</option>
										<option value="0">미승인사용자</option>
										<option value="1">정상사용자</option>
										<option value="5">비밀번호변경대상</option>
										<option value="6">비밀번호오류초과</option>
										<option value="7">관리대상</option>
										<option value="8">블랙리스트</option>
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
			</form>
		</div>
		<div class='col-sm-5 col-md-5' style='padding-top:2px;'>
		    <div id='ib-container1'></div>
		</div>
		<div class="margintop_40">
			<h1 class="title_con_Type02">
				장바구니			
			</h1>		
		</div>
		<div class='col-sm-5 col-md-5' style='padding-top:2px; padding-bottom: 20px;'>
		    <div id='ib-container3'></div>
		</div>
		<div class="margintop_40">
			<h1 class="title_con_Type02">
				관리내역			
				<span data-type="save" data-value="2" class="sButton btn_span fs-13 pink marginleft_5" style="float: right;">저장</span>
				<span data-type="insert" data-value="2" class="sButton btn_span fs-13 blue marginleft_5" style="float: right;">추가</span>
				<span data-type="search" data-value="2"  class="sButton btn_span fs-13 blue" style="float: right;">초기화</span>
			</h1>		
		</div>
		<div class='col-sm-5 col-md-5' style='padding-top:2px; padding-bottom: 20px;'>
		    <div id='ib-container2'></div>
		</div>
		<div class="margintop_40">
			<h1 class="title_con_Type02">
				장바구니 삭제내역			
				<span data-type="search" data-value="4"  class="sButton btn_span fs-13 blue" style="float: right;">조회</span>
			</h1>		
		</div>
		<div class='col-sm-5 col-md-5' style='padding-top:2px; padding-bottom: 20px;'>
		    <div id='ib-container4'></div>
		</div>		
		<div id="frmDiv" style="display: none;">
			<form id="sheetFrm2" name="sheetFrm2" style="display: none;">
				<input type="hidden" id="sCid" name="sCid">
			</form>
			<form id="stockFrm" name="stockFrm" style="display: none;">
				<input type="hidden" id="CODE" name="CODE" value=""/>
				<input type="hidden" id="NAME" name="NAME" value=""/>
				<input type="hidden" id="STNDRD" name="STNDRD" value=""/>
				<input type="hidden" id="MAKER" name="MAKER" value=""/>
				<input type="hidden" id="SUPPLY" n ame="SUPPLY" value=""/>
			</form>
		</div>		
	</div>
	
	<script type="text/javascript">
		var dupClick1 = false;
		var dev = 1;
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
			initSheet();
		});
		function initSheet(){
			var initData = {};
			initData.Cfg = {
									'SearchMode': 2,
									'Page': 10,
									'FrozenCol': 0,
									'UseHeaderActionMenu': false,
									'MouseHoverMode': 0,
									'SelectionRowsMode': 1,
									'AutoFitColWidth': 'resize',
									'MergeSheet': msHeaderOnly  
									};
			initData.HeaderMode = {};
			
			initData.Cols = [
					{'Header': '아이디|아이디', 		'Type': 'Text', 		'MinWidth': 60, 	'SaveName': 'sUsrId', 	'Align': 'Center',	'Edit':0,	'Save': 1},  
					{'Header': '이름|이름', 				'Type': 'Text', 		'MinWidth': 70, 	'SaveName': 'sUsrNm', 	'Align': 'Center',	'Edit':0},  
					{'Header': '이메일|이메일', 		'Type': 'Text', 		'MinWidth': 120, 	'SaveName': 'sEmail', 	'Align': 'Center',	'Edit':0},  
					{'Header': '휴대전화|휴대전화', 	'Type': 'Text', 		'MinWidth': 90, 	'SaveName': 'sMobile', 	'Align': 'Center',	'Edit':0},  
					{'Header': '경로|경로', 				'Type': 'Text', 		'MinWidth': 50, 	'SaveName': 'sJroute', 	'Align': 'Center',	'Edit':0},  
					{'Header': '구분|구분', 				'Type': 'Combo',	'MinWidth': 50, 	'SaveName': 'sUsrTp', 	'Align': 'Center',	'ComboText': '구매자|협력사|관리자', 'ComboCode': 'B|S|A' ,	'Edit':0},   
					{'Header': '상태|상태', 				'Type': 'Combo',	'MinWidth': 50, 	'SaveName': 'sUsrLv', 	'Align': 'Center',	'ComboText': '${cbUsrTp.cbText}', 'ComboCode': '${cbUsrTp.cbCode}',	'Save': 1},    
					{'Header': '수신동의|SMS알림', 	'Type': 'Text', 		'MinWidth': 50, 	'SaveName': 'sSmsNoti',	'Align': 'Center',	'Edit':0},  
					{'Header': '수신동의|SMS광고', 	'Type': 'Text', 		'MinWidth': 50, 	'SaveName': 'sSmsAd', 	'Align': 'Center',	'Edit':0},   
					{'Header': '수신동의|EMAIL광고', 'Type': 'Text', 		'MinWidth': 50, 	'SaveName': 'sEmailAd', 	'Align': 'Center',	'Edit':0},   
					{'Header': 'PW오류|PW오류', 	'Type': 'Text', 		'MinWidth': 50, 	'SaveName': 'sPwdErr', 	'Align': 'Center',	'Edit':0},   
					{'Header': 'PW변경|PW변경', 	'Type': 'Date', 		'MinWidth': 70, 	'SaveName': 'sPwLmod', 'Align': 'Center',	'Edit':0},   
					{'Header': '로그인|로그인', 		'Type': 'Date', 		'MinWidth': 70, 	'SaveName': 'sLlogin', 	'Align': 'Center',	'Edit':0},   
					{'Header': '변경일|변경일', 		'Type': 'Date', 		'MinWidth': 70, 	'SaveName': 'sCdt', 		'Align': 'Center',	'Edit':0},   
					{'Header': '변경자|변경자',			'Type': 'Text', 		'MinWidth': 70, 	'SaveName': 'sCid', 		'Align': 'Center',	'Edit':0},
					{'Header': '상태|상태', 				'Type': 'Status', 	'MinWidth': 0, 		'SaveName': 'sStatus', 	'Align': 'Center', 	'Hidden':1 }    
			];			
			
			// IBSheet 생성
			var container = $('#ib-container1')[0];
			createIBSheet2(container, 'mySheet1', '100%', '250px');

			// IBSheet 초기화
			IBS_InitSheet(mySheet1, initData);	
			
			initData.Cols = [
				{'Header': '번호',			'Type': 'Seq', 			'MinWidth': 50,		'SaveName': 'sSeq',		'Align': 'Center',	'Edit':0,	'Save': 0	, 	'ColMerge':0	}
				,{'Header': '구분',			'Type': 'Status',		'MinWidth': 50,		'SaveName': 'sStatus', 	'Align': 'Center',	'Edit':0,	'Save': 0,	'Hidden':dev, 	'ColMerge':0	}
				,{'Header': '일련번호',		'Type': 'Text', 			'MinWidth': 60, 	'SaveName': 'sArtCd',	'Align': 'Center',	'Edit':0,	'Save': 1	,	'Hidden':dev, 	'ColMerge':0, 	'DefaultValue':'0'	}
				,{'Header': '구분',			'Type': 'Combo', 		'MinWidth': 60, 	'SaveName': 'sBbsId',	'Align': 'Center',	'Edit':0,	'Save': 1,	'ColMerge':0, 	'DefaultValue':'MNG',	'ComboText': '문의|관리', 'ComboCode': 'STR|MNG' }
				,{'Header': '일련번호',		'Type': 'Combo', 		'MinWidth': 60, 	'SaveName': 'sBbsTp',	'Align': 'Center',	'Edit':0,	'Save': 0	,	'Hidden':dev, 	'ColMerge':0	}
				,{'Header': '제목',			'Type': 'Text', 			'MinWidth': 150, 	'SaveName': 'sTitle',	 	'Align': 'Left',		'Edit':0,	'Save': 1	,	'ColMerge':0	}
				,{'Header': '내용',			'Type': 'Text', 			'MinWidth': 250, 	'SaveName': 'sCont',	 	'Align': 'Left',		'Edit':0,	'Save': 0	,	'ColMerge':0, 	'MultiLineText': 1}
				,{'Header': '회신내용',		'Type': 'Text', 			'MinWidth': 250, 	'SaveName': 'sACont', 	'Align': 'Left',		'UpdateEdit':1,			'InsertEdit':1,	'Save': 1	,	'ColMerge':0, 		'MultiLineText': 1, 	'KeyField':1}
				,{'Header': '회신타입',		'Type': 'Combo',		'MinWidth': 100, 	'SaveName': 'sAtp', 		'Align': 'Center',	'Edit':1,	'Save': 1,	'ColMerge':0,	'ComboText': '등록만|SMS 발송|EMAIL 발송|SMS + EMAIL', 'ComboCode': '0|1|2|3' }
				,{'Header': '작성일',		'Type': 'Date', 			'MinWidth': 80, 	'SaveName': 'sCdt', 		'Align': 'Center',	'Edit':0,	'Save': 0	,	'ColMerge':0	}
				,{'Header': '작성자',		'Type': 'Text', 			'MinWidth': 80, 	'SaveName': 'sWrite',	 	'Align': 'Center',	'Edit':0,	'Save': 1	,	'ColMerge':0	}
				,{'Header': '연락처',		'Type': 'Text', 			'MinWidth': 90, 	'SaveName': 'sPhone', 	'Align': 'Center',	'Edit':0,	'Save': 0	,	'ColMerge':0	}
				,{'Header': '회신일',		'Type': 'Date', 			'MinWidth': 80, 	'SaveName': 'sACdt', 	'Align': 'Center',	'Edit':0,	'Save': 0	,	'ColMerge':0	}
				,{'Header': '회신자',		'Type': 'Text', 			'MinWidth': 80, 	'SaveName': 'sACid',	 	'Align': 'Center',	'Edit':0,	'Save': 0	,	'ColMerge':0	}
				];			
			
			var container2 = $('#ib-container2')[0];
			createIBSheet2(container2, 'mySheet2', '100%', '250px');
			
			// IBSheet 초기화
			IBS_InitSheet(mySheet2, initData);	
			
			initData.Cols = [
				{'Header': '번호',			'Type': 'Seq', 			'MinWidth': 50,		'SaveName': 'sSeq',				'Align': 'Center',	'Edit':0,	'Save': 0	, 	'ColMerge':0	}
				,{'Header': '구분',			'Type': 'Status',		'MinWidth': 50,		'SaveName': 'sStatus', 			'Align': 'Center',	'Edit':0,	'Save': 0,	'Hidden':dev, 	'ColMerge':0	}
				,{'Header': '코드',			'Type': 'Text',			'MinWidth': 80,		'SaveName': 'sDprdtCd', 		'Align': 'Center',	'Edit':1,	'Save': 0, 	'ColMerge':0	}
				,{'Header': '카탈로그',		'Type': 'Button',		'MinWidth': 50,		'SaveName': 'eIMGNo',			'Align': 'Center'		}
				,{'Header': '품목정보',		'Type': 'Button',		'MinWidth': 50,		'SaveName': 'PRDT_INFO',		'Align': 'Center'	, 	'DefaultValue':'제품정보' }
				,{'Header': '재고정보',		'Type': 'Button',		'MinWidth': 50,		'SaveName': 'STOCK',			'Align': 'Center'	, 	'ColMerge':0, 	'DefaultValue':'재고확인' }
				,{'Header': '품명',			'Type': 'Text',			'MinWidth': 150,	'SaveName': 'sDprdtNm', 		'Align': 'Left',		'Edit':0,	'Save': 0	, 	'ColMerge':0	}
				,{'Header': '규격',			'Type': 'Text',			'MinWidth': 150,	'SaveName': 'sDstndrd', 		'Align': 'Left',		'Edit':0,	'Save': 0	, 	'ColMerge':0	}
				,{'Header': '제조사',		'Type': 'Text',			'MinWidth': 50,		'SaveName': 'sDmakrNm', 		'Align': 'Center',	'Edit':0,	'Save': 0, 	'ColMerge':0	}
				,{'Header': '판매가',		'Type': 'Int',				'MinWidth': 50,		'SaveName': 'sDtotPrice', 		'Align': 'Right',		'Edit':0,	'Save': 0,	'Format':'Integer', 	'ColMerge':0	}
				,{'Header': '수량',			'Type': 'Int',				'MinWidth': 50,		'SaveName': 'sDqy',		 		'Align': 'Right',		'Edit':0,	'Save': 0,	'Format':'Integer', 	'ColMerge':0	}
				,{'Header': '합계',			'Type': 'Int',				'MinWidth': 50,		'SaveName': 'sDsumPrice', 		'Align': 'Right',		'Edit':0,	'Save': 0,	'Format':'Integer', 	'ColMerge':0	}
				,{'Header': '등록일',		'Type': 'Date', 			'MinWidth': 80, 	'SaveName': 'sCdt', 				'Align': 'Center',	'Edit':0,	'Save': 0	,	'ColMerge':0	}
				,{'Header': '품목코드',		'Type': 'Text',			'MinWidth': 50,		'SaveName': 'sPcd',	 			'Align': 'Center',	'Edit':0,	'Save': 0,	'Hidden':dev, 	'ColMerge':0	}
				];
			var container3 = $('#ib-container3')[0];
			createIBSheet2(container3, 'mySheet3', '100%', '250px');
			
			// IBSheet 초기화
			IBS_InitSheet(mySheet3, initData);	
			
			initData.Cols.push({'Header': '삭제일',		'Type': 'Date', 			'MinWidth': 80, 	'SaveName': 'sDdt', 				'Align': 'Center',	'Edit':0,	'Save': 0	,	'ColMerge':0	});
			 
			var container4 = $('#ib-container4')[0];
			createIBSheet2(container4, 'mySheet4', '100%', '250px');
			
			// IBSheet 초기화
			IBS_InitSheet(mySheet4, initData);	
			
			// 편집 가능 여부 설정
			mySheet1.SetEditable(true);
			mySheet2.SetEditable(true);
			mySheet3.SetEditable(true);
			mySheet4.SetEditable(true);
			
			// 사이즈 맞춤
			mySheet1.FitColWidth();
			mySheet2.FitColWidth();
			mySheet3.FitColWidth();
			mySheet4.FitColWidth();
		}
		function doAction(sAction, tar) { 
			switch(sAction) {     
				case 'search':          
					var sheet = eval('mySheet' + tar);
					if(1 == tar){
						$('#sCid').val('');  
						sheet.DoSearch(_BT.FRONT.URL.Search.SheetUserList, $('#sheetFrm').serialize()); 
						
					}else if(2 == tar){
						sheet.DoSearch(_BT.FRONT.URL.Search.SheetUserBbs, $('#sheetFrm2').serialize()); 
					
					}else if(3 == tar){
						sheet.DoSearch(_BT.FRONT.URL.Search.SheetUserCart, $('#sheetFrm2').serialize()); 
					
					}else if(4 == tar){
						sheet.DoSearch(_BT.FRONT.URL.Search.SheetUserDCart, $('#sheetFrm2').serialize()); 
					}
					break; 
				case 'insert':       //입력
					var sheet = eval('mySheet' + tar);
					var Row = sheet.DataInsert();
					if(2 == tar) {
						sheet.SetCellValue(Row, 'sCd',$('#sCd').val()) ;
					}
					break;     
				case 'save':       //저장
					var sheet = eval('mySheet' + tar);
					var opt = {UrlEncode:0, Mode:2, Delim:"#"};
					var SaveStr = sheet.GetSaveString(opt); 
					if('' == SaveStr){
						alert('저장할 내역이 없습니다.'); 
						break;
					}else if('KeyFieldError' == SaveStr){ 
						break;
					}else{
						if(!confirm('변경 내역을 저장하시겠습니까?')) break;
					}
					if(1 == tar){
						var rtnData = sheet.GetSaveData(_BT.FRONT.URL.Customer.SaveSheetUser, SaveStr); 
						sheet.LoadSaveData(rtnData);
					} else if(2 == tar) {
						var rtnData = sheet.GetSaveData(_BT.FRONT.URL.Customer.SaveSheetCont, SaveStr+ "&"+$('#sheetFrm2').serialize()); 
						sheet.LoadSaveData(rtnData);
					}
					break;     
			} 
		} 		

		function mySheet1_OnDblClick(Row, Col, Value, CellX, CellY, CellW, CellH) { 
			if(Row == 0) return false;
			var sUsrId = mySheet1.GetCellValue( Row, 'sUsrId' );
			$('#sCid').val(sUsrId); 
			doAction('search', 2);
			doAction('search', 3);
		 } 
		
		function mySheet3_OnButtonClick(Row, Col) {
			var sSaveName = mySheet3.ColSaveName(0, Col); 
			if(sSaveName == 'STOCK'){
				var code = mySheet3.GetCellValue( Row, 'sDprdtCd' );
				var supply = 'CR';
				if(code.substring(0,3) == 'ST2')
					supply = 'KB';
				else if(code.substring(0,3) == 'ST3')
					supply = 'DS';
				
				$('#CODE').val(code);
				$('#SUPPLY').val(supply);
				$('#NAME').val(mySheet3.GetCellValue( Row, 'sDprdtNm' ));
				$('#STNDRD').val(mySheet3.GetCellValue( Row, 'sDstndrd' ));
				$('#MAKER').val(mySheet3.GetCellValue( Row, 'sDmakrNm' ));
				_BT.openPopup( '','stockPop', '1270', '800', true, true);
				$('#stockFrm').attr('method', 'POST').attr('target', 'stockPop').attr('action', _BT.FRONT.URL.Common.PopPwS).submit();	
				
			} else if(sSaveName == 'eIMGNo'){
				var EBOOK = mySheet3.GetCellValue( Row, 'eIMGNo' );
				_BT.openPopup( _BT.FRONT.URL.Search.ImgPop+'?imgTp=CA&code='+EBOOK,'ImgPop', '750', '1100', true, true);
		
			}else if(sSaveName == 'PRDT_INFO'){
				var PRDT_CD = mySheet3.GetCellValue( Row, 'sPcd' );
				_BT.openPopup( _BT.SHOP.URL.Search.View+'?pCode='+PRDT_CD,'PRDT_CD', '1400', '800', 'yes', 'yes');
				
			}
		} 		
		
		function mySheet4_OnButtonClick(Row, Col) {
			var sSaveName = mySheet4.ColSaveName(0, Col); 
			if(sSaveName == 'STOCK'){
				var code = mySheet4.GetCellValue( Row, 'sDprdtCd' );
				var supply = 'CR';
				if(code.substring(0,3) == 'ST2')
					supply = 'KB';
				else if(code.substring(0,3) == 'ST3')
					supply = 'DS';
				
				$('#CODE').val(code);
				$('#SUPPLY').val(supply);
				$('#NAME').val(mySheet4.GetCellValue( Row, 'sDprdtNm' ));
				$('#STNDRD').val(mySheet4.GetCellValue( Row, 'sDstndrd' ));
				$('#MAKER').val(mySheet4.GetCellValue( Row, 'sDmakrNm' ));
				_BT.openPopup( '','stockPop', '1270', '800', true, true);
				$('#stockFrm').attr('method', 'POST').attr('target', 'stockPop').attr('action', _BT.FRONT.URL.Common.PopPwS).submit();	
				
			} else if(sSaveName == 'eIMGNo'){
				var EBOOK = mySheet4.GetCellValue( Row, 'eIMGNo' );
				_BT.openPopup( _BT.FRONT.URL.Search.ImgPop+'?imgTp=CA&code='+EBOOK,'ImgPop', '750', '1100', true, true);
		
			}else if(sSaveName == 'PRDT_INFO'){
				var PRDT_CD = mySheet4.GetCellValue( Row, 'sPcd' );
				_BT.openPopup( _BT.SHOP.URL.Search.View+'?pCode='+PRDT_CD,'PRDT_CD', '1400', '800', 'yes', 'yes');
				
			}
		} 		
		
		function mySheet1_OnSaveEnd(code) {
			if(code == 1){         
				alert("저장완료 하였습니다.");  
				doAction('search', 2);
			} else {         
				alert("저장에 실패하였습니다.");     
			} 
		} 
	</script>
