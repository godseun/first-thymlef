<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/layout/include/base.jsp" %>
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
			_BT.makeCalendar('sDt', 'yy-mm-dd'); 
			_BT.makeCalendar('eDt', 'yy-mm-dd'); 
			initDate();
			initSheet();
			//doAction('search');
		});
		
		function initDate(){
			$('#sDt').val(_BT.dateAdd($.datepicker.formatDate($.datepicker.ATOM, new Date()),-7,'d'));	
			$('#eDt').val($.datepicker.formatDate($.datepicker.ATOM, new Date()));
		}
		
		function initSheet(){
			var initData = {};
			initData.Cfg = {
						        'AutoFitColWidth': 'search|resize|init|colhidden|rowtransaction'
						        ,'UseHeaderSortCancel' : 1
								,'MergeSheet': 9 
				                ,'DeferredVScroll': 1
				                ,'Page' : 300
				                ,'AutoSumCalcMode':1
				                ,'SelectionSummary': 'EmptyCell'
								};
			initData.HeaderMode = {
			};
			initData.Cols = [
				{'Header': '번호|번호',				'Type': 'Seq', 		'MinWidth': 50,		'SaveName': 'sSeq',				'Align': 'Center',	'Edit':0,	'Save': 0	, 	'ColMerge':0,	'Hidden':dev	}  
				,{'Header': '구분|구분',				'Type': 'Status',	'MinWidth': 50,		'SaveName': 'sStatus', 			'Align': 'Center',	'Edit':0,	'Save': 1	, 	'ColMerge':0,	'Hidden':dev	}  
				,{'Header': '견적|선택',				'Type': 'CheckBox','MinWidth': 50, 	'SaveName': 'sCheckBox',		'Align': 'Center',	'Edit':1, 	'Save': 1	, 	'ColMerge':0	}
				,{'Header': '견적|상태',				'Type': 'Combo',	'MinWidth': 60,		'SaveName': 'STTUS',			'Align': 'Center',	'Edit':0,	'Save': 0,	'ComboText': '임시저장|견적요청|견적접수|진행보류|요청취소|회신완료',		'ComboCode': '0|1|2|7|8|9'	, 	'ColMerge':0	}
				,{'Header': '견적|견적번호',		'Type': 'Popup',	'MinWidth': 80,		'SaveName': 'EST_ID',			'Align': 'Center',	'Edit':1,	'Save': 1	, 	'ColMerge':1	}
				
				,{'Header': '의뢰정보|요청일',		'Type': 'Date',		'MinWidth': 65,		'SaveName': 'REQ_DT',			'Align': 'Center',	'Edit':0,	'Save': 0	, 	'ColMerge':1,	'Format':'YmdHm'}
				,{'Header': '의뢰정보|의뢰자',		'Type': 'Text',		'MinWidth': 60,		'SaveName': 'CHAR_NM',		'Align': 'Center',	'Edit':0,	'Save': 0	, 	'ColMerge':1	}
				,{'Header': '의뢰정보|연락처',		'Type': 'Text',		'MinWidth': 100,	'SaveName': 'MOBILE',			'Align': 'Center',	'Edit':0,	'Save': 0	, 	'ColMerge':1	}
				,{'Header': '의뢰정보|이메일',		'Type': 'Text',		'MinWidth': 100,	'SaveName': 'CHAR_EMAIL',	'Align': 'Center',	'Edit':0,	'Save': 0	, 	'ColMerge':1	}
				,{'Header': '의뢰정보|비고',		'Type': 'Text',		'MinWidth': 200,	'SaveName': 'REQ_RMK',			'Align': 'Left',		'Edit':0,	'Save': 0	, 	'ColMerge':1	}

				,{'Header': '견적정보|품목수',		'Type': 'AutoSum',	'MinWidth': 60,		'SaveName': 'CNT',				'Align': 'Right',		'Edit':0,	'Save': 0	, 	'ColMerge':1,	'Format':'Integer'	}
				,{'Header': '견적정보|합계금액',	'Type': 'AutoSum',	'MinWidth': 80,		'SaveName': 'SUM_P',			'Align': 'Right',		'Edit':0,	'Save': 1	, 	'ColMerge':1,	'Format':'Integer'	}
				,{'Header': '견적정보|배송비',		'Type': 'Int',			'MinWidth': 60,		'SaveName': 'D_FEE',				'Align': 'Right',		'Edit':1,	'Save': 1	, 	'ColMerge':1,	'Format':'Integer'	}
				,{'Header': '견적정보|할인율',		'Type': 'Float',		'MinWidth': 60,		'SaveName': 'DISC',				'Align': 'Right',		'Edit':1,	'Save': 1	, 	'ColMerge':1,	'Format':'#,##0.0\\%'}
				,{'Header': '견적정보|견적금액',	'Type': 'AutoSum',	'MinWidth': 80,		'SaveName': 'EST_P',				'Align': 'Right',		'Edit':0,	'Save': 1	, 	'ColMerge':1,	'Format':'Integer',	 'CalcLogic':'((|SUM_P|+|D_FEE|)*(1-(|DISC|/100)))-(((|SUM_P|+|D_FEE|)*(1-(|DISC|/100)))%10000)'}
				
				,{'Header': '업체정보|상호명',		'Type': 'Text',		'MinWidth': 100,	'SaveName': 'CMP_NM',			'Align': 'Center',	'Edit':0,	'Save': 0	, 	'ColMerge':1	}
				,{'Header': '업체정보|대표자명',	'Type': 'Text',		'MinWidth': 80,		'SaveName': 'RPRSNTV_NM',	'Align': 'Center',	'Edit':0,	'Save': 0	, 	'ColMerge':1	}
				,{'Header': '업체정보|전화번호',	'Type': 'Text',		'MinWidth': 100,	'SaveName': 'TEL_NO',			'Align': 'Center',	'Edit':0,	'Save': 0	, 	'ColMerge':1	}
				,{'Header': '업체정보|팩스번호',	'Type': 'Text',		'MinWidth': 100,	'SaveName': 'FAX_NO',			'Align': 'Center',	'Edit':0,	'Save': 0	, 	'ColMerge':1	}
				,{'Header': '업체정보|주소',		'Type': 'Text',		'MinWidth': 200,	'SaveName': 'ADRESS',			'Align': 'Left',		'Edit':0,	'Save': 0	, 	'ColMerge':1	}
				
				,{'Header': '담당자정보|접수일',	'Type': 'Date',		'MinWidth': 60,		'SaveName': 'REC_DT',			'Align': 'Center',	'Edit':0,	'Save': 0	, 	'ColMerge':1,	'Format':'YmdHm'}
				,{'Header': '담당자정보|접수자',	'Type': 'Text',		'MinWidth': 70,		'SaveName': 'REC_ID',			'Align': 'Center',	'Edit':0,	'Save': 0	, 	'ColMerge':1	}
				,{'Header': '담당자정보|회신일',	'Type': 'Date',		'MinWidth': 60,		'SaveName': 'CONF_DT',			'Align': 'Center',	'Edit':0,	'Save': 0	, 	'ColMerge':1,	'Format':'YmdHm'}
				,{'Header': '담당자정보|회신자',	'Type': 'Text',		'MinWidth': 70,		'SaveName': 'CONF_ID',			'Align': 'Center',	'Edit':0,	'Save': 0	, 	'ColMerge':1	}
				,{'Header': '담당자정보|비고',		'Type': 'Text',		'MinWidth': 200,	'SaveName': 'REC_RMK',			'Align': 'Left',		'Edit':1,	'Save': 1	, 	'ColMerge':1	}
			];	
			// IBSheet 생성
			createIBSheet2($('#ib-container1')[0], 'mySheet1', '100%', '400px');
			// IBSheet 초기화
			IBS_InitSheet(mySheet1, initData);	

			
			initData.Cols = [
				{'Header': '구분|번호',				'Type': 'Seq', 		'MinWidth': 50,		'SaveName': 'sSeq',				'Align': 'Center',	'Edit':0,	'Save': 0	, 	'ColMerge':0,	'Hidden':dev	}  
				,{'Header': '구분|구분',				'Type': 'Status',	'MinWidth': 50,		'SaveName': 'sStatus', 			'Align': 'Center',	'Edit':0,	'Save': 1	, 	'ColMerge':0,	'Hidden':dev	}  
				,{'Header': '구분|견적번호',		'Type': 'Text',		'MinWidth': 80,		'SaveName': 'EST_ID',			'Align': 'Center',	'Edit':0,	'Save': 1	, 	'ColMerge':0,	'Hidden':dev	}  

				,{'Header': '요청정보|폼목코드',	'Type': 'Text',		'MinWidth': 50,		'SaveName': 'PRDT_CD', 		'Align': 'Left',		'Edit':0,	'Save': 0	, 	'ColMerge':0,	'Hidden':dev	} 
				,{'Header': '요청정보|대화코드',	'Type': 'Text',		'MinWidth': 80, 	'SaveName': 'PRDT_DTL_CD',	'Align': 'Center',	'Edit':0,	'Save': 1	, 	'ColMerge':1	}
				,{'Header': '요청정보|품명',		'Type': 'Text',		'MinWidth': 100,	'SaveName': 'PRDT_NM',			'Align': 'Left',		'Edit':0,	'Save': 0	, 	'ColMerge':1	}
				,{'Header': '요청정보|규격',		'Type': 'Text',		'MinWidth': 150,	'SaveName': 'STNDRD',			'Align': 'Left',		'Edit':0,	'Save': 0	, 	'ColMerge':1	}
				,{'Header': '요청정보|제조사',		'Type': 'Text',		'MinWidth': 60,		'SaveName': 'MAKR_NM',		'Align': 'Left',		'Edit':0,	'Save': 0	, 	'ColMerge':1	}
				,{'Header': '요청정보|비고',		'Type': 'Text',		'MinWidth': 150,	'SaveName': 'RMK',				'Align': 'Left',		'Edit':0,	'Save': 0	, 	'ColMerge':1	}

				,{'Header': '단가정보|판매단위',	'Type': 'Text',		'Width': 30,			'SaveName': 'OUT_AMT',		'Align': 'Right',		'Edit':0,	'Save': 0	, 	'ColMerge':1	}
				,{'Header': '단가정보|판매단위',	'Type': 'Text',		'Width': 30,			'SaveName': 'OUT_UNIT',		'Align': 'Left',		'Edit':0,	'Save': 0	, 	'ColMerge':1	}
				,{'Header': '단가정보|수량',		'Type': 'Int',			'MinWidth': 50,		'SaveName': 'QY',					'Align': 'Center',	'Edit':0,	'Save': 0	, 	'ColMerge':1,	'Format':'Integer'	}
				,{'Header': '단가정보|총수량',		'Type': 'Text',		'Width': 40,			'SaveName': 'TOT_QY',			'Align': 'Right',		'Edit':0,	'Save': 0	, 	'ColMerge':1,	'CalcLogic':'|OUT_AMT|*|QY|'}
				,{'Header': '단가정보|총수량',		'Type': 'Text',		'Width': 40,			'SaveName': 'UNIT',				'Align': 'Left',		'Edit':0,	'Save': 0	, 	'ColMerge':1	}
				,{'Header': '단가정보|견적가',		'Type': 'Int',			'MinWidth': 70,		'SaveName': 'PRICE',				'Align': 'Right',		'Edit':0,	'Save': 0	, 	'ColMerge':1,	'Format':'#,###\\원'}
				,{'Header': '단가정보|합계금액',	'Type': 'AutoSum',	'MinWidth': 80,		'SaveName': 'TOT_PRICE',		'Align': 'Right',		'Edit':0,	'Save': 0	, 	'ColMerge':1,	'CalcLogic':'|QY|*|PRICE|', 	'Format':'#,###\\원'}
				
				,{'Header': '회신정보|납기',		'Type': 'Int',			'MinWidth': 50,		'SaveName': 'PERIOD',			'Align': 'Right',		'Edit':1,	'Save': 1	, 	'ColMerge':1,	'Format':'#,###\\일'}
				,{'Header': '회신정보|비고',		'Type': 'Text',		'MinWidth': 200,	'SaveName': 'REC_RMK',			'Align': 'Left',		'Edit':1,	'Save': 1	, 	'ColMerge':1	}
			];		
			
			// IBSheet 생성
			createIBSheet2($('#ib-container2')[0], 'mySheet2', '100%', '300px');
			// IBSheet 초기화
			IBS_InitSheet(mySheet2, initData);	
			//mySheet1.ShowGroupRow('', '{%s} <font color="gray">({%c}건)</font>');
	
			// 편집 가능 여부 설정
			mySheet1.SetEditable(1);
			mySheet2.SetEditable(1);

			//건수 정보 표시
			mySheet1.SetCountPosition(4);
			mySheet2.SetCountPosition(4);
			
			//마우스오버
			mySheet1.SetMouseHoverMode(2) 
			mySheet2.SetMouseHoverMode(2) 
			
			// 사이즈 맞춤
			mySheet1.FitColWidth();
			
			// 써머리 관련
			mySheet2.SetCountPosition(3);
			mySheet2.SetSelectionSummaryInfoElement('');
		}

		function doAction(sAction, tar) { 
			switch(sAction) {  
				case 'search':   
					mySheet1.RemoveAll(); 
					mySheet2.RemoveAll();     
					mySheet1.DoSearch(_BT.FRONT.URL.Search.SheetEstMstList, $('#sheetFrm').serialize()); 
					break; 
					
				case 'receipt':   
					var sRow = mySheet1.FindCheckedRow('sCheckBox').split('|');
					if(sRow == ''){alert('접수 하실 견적을 선택해 주세요.');return false;}
					if(!confirm('견적요청 상태의 견적건만 접수 됩니다.\n\n견적접수 하시겠습니까?')) return false;
					var opt = {UrlEncode:0, Mode:2, Delim:'#'};
					var SaveStr = mySheet1.GetSaveString(opt); 
					if('' == SaveStr){
						alert('접수 하실 견적을 선택해 주세요.'); 
						return false;
					}else if('KeyFieldError' == SaveStr){ 
						return false;
					}else{
						var rtnData = mySheet1.GetSaveData(_BT.FRONT.URL.Customer.ReceiptEst, SaveStr); 
						mySheet1.LoadSaveData(rtnData);
					}
					break;
					
				case 'deny':   
					var alerted = false;
					var sRow = mySheet1.FindCheckedRow('sCheckBox').split('|');
					if(sRow == ''){alert('보류 하실 견적을 선택해 주세요.');return false;}

					for(var i=0; i < sRow.length; i++){
						if(mySheet1.GetCellValue(sRow[i], 'REC_RMK') == ''){
							alerted = true;
						}
					}
					if(alerted){
						alert('보류사유를 담당비고에 입력 바랍니다.');
						return false;
					}else{
						if(!confirm('견적보류 하시겠습니까?')) return false;
					}
					var opt = {UrlEncode:0, Mode:2, Delim:'#'};
					var SaveStr = mySheet1.GetSaveString(opt); 
					if('' == SaveStr){
						alert('견적보류 하실 견적을 선택해 주세요.'); 
						return false;
					}else if('KeyFieldError' == SaveStr){ 
						return false;
					}else{
						var rtnData = mySheet1.GetSaveData(_BT.FRONT.URL.Customer.DenyEst, SaveStr); 
						mySheet1.LoadSaveData(rtnData);
					}
					break;
					
				case 'save':   
					if(1 == tar) {
						var sRow = mySheet1.FindCheckedRow('sCheckBox').split('|');
						if(sRow == ''){alert('저장 하실 견적을 선택해 주세요.');return false;}
						if(!confirm('변경내역을 저장 하시겠습니까?')) return false;
						var opt = {UrlEncode:0, Mode:2, Delim:'#'};
						var SaveStr = mySheet1.GetSaveString(opt); 
						if('' == SaveStr){
							alert('저장 하실 견적을 선택해 주세요.'); 
							return false;
						}else if('KeyFieldError' == SaveStr){ 
							return false;
						}else{
							var rtnData = mySheet1.GetSaveData(_BT.FRONT.URL.Customer.SaveEstMst, SaveStr); 
							mySheet1.LoadSaveData(rtnData);
						}
					}else if(2 == tar) {
						var opt = {UrlEncode:0, Mode:2, Delim:'#'};
						var SaveStr = mySheet2.GetSaveString(opt); 
						if('' == SaveStr){
							alert('저장할 내역이 없습니다.'); 
							return false;
						}else if('KeyFieldError' == SaveStr){ 
							return false;
						}else{
							if(!confirm('저장 하시겠습니까?')) break;
							var rtnData = mySheet2.GetSaveData(_BT.FRONT.URL.Customer.SaveEstPrdt, SaveStr); 
							mySheet2.LoadSaveData(rtnData);
						}
					}
					break;
					
				case 'reply':  
					var sRow = mySheet1.FindCheckedRow('sCheckBox').split('|');
					if(sRow == ''){alert('회신할 견적을 선택해 주세요.');return false;}
					var opt = {UrlEncode:0, Mode:2, Delim:'#'};
					var SaveStr = mySheet1.GetSaveString(opt); 
					if('' == SaveStr){
						alert('회신할 내역이 없습니다.'); 
						return false;
					}else if('KeyFieldError' == SaveStr){ 
						return false;
					}else{
						if(!confirm('접수상태의 견적만 회신 가능 합니다.\n\n회신후 변경이 불가 합니다.\n\n해당 견적을 회신 하시겠습니까?')) break;
						var rtnData = mySheet1.GetSaveData(_BT.FRONT.URL.Customer.ReplyEst, SaveStr); 
						mySheet1.LoadSaveData(rtnData);
					}
					break;
			} 
		}
		function mySheet1_OnRowSearchEnd (row) { 
			if(mySheet1.GetCellValue(row, 'STTUS') == 8){
				mySheet1.InitCellProperty(row, 'sCheckBox', {Type:"CheckBox",Edit:0}); 
			}
		} 
		function mySheet1_OnDblClick(Row, Col, Value, CellX, CellY, CellW, CellH) { 
			if (Row == 0) return; //헤더행일때는 폼에 반영 안함.
			if(mySheet1.GetCellValue(Row,'STTUS') == '2')
				$('#saveBtn').removeClass('vOff');
			else
				$('#saveBtn').addClass('vOff');
			var EST_ID = mySheet1.GetCellValue(Row,'EST_ID');
			$('#EST_ID').val(EST_ID);
			mySheet2.DoSearch(_BT.FRONT.URL.Search.SheetEstPrdtList, $('#frm').serialize()); 
		}	
		function mySheet1_OnSaveEnd(code) {
			if(code == 1){         
				alert('처리완료 하였습니다.');
				doAction('search');
			} else {         
				alert('처리중 오류가 발생했습니다.\n\n다시 확인 부탁 드립니다.');     
			} 
		} 
		function mySheet2_OnSaveEnd(code) {
			if(code == 1){         
				alert('처리완료 하였습니다.');
				doAction('search');
			} else {         
				alert('처리중 오류가 발생했습니다.\n\n다시 확인 부탁 드립니다.');     
			} 
		} 
	</script>
	<div class="main_content06" style="padding-top: 0px; min-height: 800px; margin-bottom: 20px;">
		<div >
			<form id="frm" name="frm">
				<input type="hidden" id="EST_ID" name="EST_ID"/>	
			</form>
			<form id="sheetFrm" name="sheetFrm">
				<table class="join_form">
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
									요청일
								</span>
								<span class="inquiry">
									<input type="text" class="inquiry join_form_input02 " id="sDt" name="sDt"/>
								</span>
								<span>&nbsp;&nbsp;~&nbsp;&nbsp;</span>
								<span class="inquiry">
									<input type="text" class="join_form_input02 inquiry" id="eDt" name="eDt"/>
								</span>
								<span class="c13_01_03_txt_01">
									진행상태
								</span>
								<span class="return_select2">
									<select id="sSttus" name="sSttus" class="">
										<option value="">전체</option>
										<option value="0">임시저장</option>
										<option value="1">견적요청</option>
										<option value="2">담당자접수</option>
										<option value="7">견적진행보류</option>
										<option value="8">견적요청취소</option>
										<option value="9">견적서회신</option>
									</select>
								</span>		
								<span class="c13_01_03_txt_01">
									검색어
								</span>
								<input type="text" id="sUsrNm" name="sValue" class="input_style08" placeholder="검색어">	
								<span class="inquiry_btn1 marginleft_5">
									<span data-type="search" data-value="1"  class="sButton btn_span fs-13 blue" style="float: right;">조회</span>
								</span>	
							</td>
						</tr>
					</tbody>
				</table>	
			</form>
		</div>
		<h1 class="title_con_Type01 margintop_20" style="margin-right:10px; text-align: left;">
			견적정보
			<span> 
				<span data-type="reply" data-value="1"  class="sButton btn_span fs-13 pink marginleft_5" style="float: right;">3.회신</span>
				<span data-type="receipt" data-value="1"  class="sButton btn_span fs-13 pink marginleft_5" style="float: right;">1.접수</span>
				<span data-type="deny" data-value="1"  class="sButton btn_span fs-13 green marginleft_5" style="float: right;">보류</span>
				<span data-type="save" data-value="1"  class="sButton btn_span fs-13 blue marginleft_5" style="float: right;">저장</span>
			</span>
		</h1>
		<div class='col-sm-5 col-md-5' style='padding-top:2px;'>
		    <div id='ib-container1'></div>
		</div>
		<h1 class="title_con_Type01 margintop_20" style="margin-right:10px; text-align: left;">
			상세결과
			<span> 
				<span id="saveBtn" data-type="save" data-value="2"  class="sButton btn_span fs-13 pink vOff" style="float: right;">2.저장</span>
			</span>
		</h1>
		<div class="col-sm-5 col-md-5" style="height:310px;width:100%;">
		    <div id="ib-container2"></div>
		</div>
	</div>
