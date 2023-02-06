<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/layout/include/base.jsp" %>
	<script type="text/javascript">
		var dupClick1 = false;
		var dev = 1;
		$(function(){
			_BT.makeCalendar('sDt', 'yy-mm-dd'); 
			_BT.makeCalendar('eDt', 'yy-mm-dd'); 
			initSheet();
			initDate();
			doAction('search');
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
				{'Header': '번호',		'Type': 'Seq', 			'MinWidth': 50,		'SaveName': 'sSeq',				'Align': 'Center',	'Edit':0,	'Save': 0	, 	'ColMerge':0	}
				,{'Header': '주문일',	'Type': 'Date',			'MinWidth': 85,		'SaveName': 'sMordrDt',	 		'Align': 'Center',	'Edit':0,	'Save': 0	,	'Format':'YmdHm'}
				,{'Header': '접수일',	'Type': 'Date',			'MinWidth': 85,		'SaveName': 'sMreceiptDt',	 	'Align': 'Center',	'Edit':0,	'Save': 0	,	'Format':'YmdHm'}
				,{'Header': '배송일',	'Type': 'Date',			'MinWidth': 85,		'SaveName': 'sMdelyDt',	 		'Align': 'Center',	'Edit':0,	'Save': 0	,	'Format':'YmdHm'}
				,{'Header': '주문자',	'Type': 'Text',			'MinWidth': 50,		'SaveName': 'sMordrUsr',		'Align': 'Center',	'Edit':0,	'Save': 0	, 	'ColMerge':1	}
				,{'Header': '주문자',	'Type': 'Text',			'MinWidth': 100,	'SaveName': 'sMusrPhone',		'Align': 'Center',	'Edit':0,	'Save': 0	, 	'ColMerge':1	}
				,{'Header': '주문번호',	'Type': 'Popup',		'MinWidth': 150,	'SaveName': 'sMordrId',			'Align': 'Center',	'Edit':1,	'Save': 0	, 	'ColMerge':1	}
				,{'Header': '품목수',	'Type': 'AutoSum',		'MinWidth': 50,		'SaveName': 'sMcntPrdt',		'Align': 'Right',		'Edit':0,	'Save': 0,	'Format':'Integer'	}
				,{'Header': '주문금액',	'Type': 'Int',				'MinWidth': 50,		'SaveName': 'sMprice', 			'Align': 'Right',		'Edit':0,	'Save': 0,	'Format':'Integer'	}
				,{'Header': '배송비',	'Type': 'Int',				'MinWidth': 50,		'SaveName': 'sMdvFee', 		'Align': 'Right',		'Edit':0,	'Save': 0,	'Format':'Integer'	}
				,{'Header': '총금액',	'Type': 'AutoSum',		'MinWidth': 50,		'SaveName': 'sMsPrice',	 		'Align': 'Right',		'Edit':0,	'Save': 0,	'Format':'Integer'	}
				,{'Header': '결제구분',	'Type': 'Combo',		'MinWidth': 50,		'SaveName': 'sPaym',	 			'Align': 'Center',	'Edit':0,	'Save': 0,	'ComboText': '카드|카드|가상계좌|계좌이체',		'ComboCode': 'Card|VCard|VBank|DirectBank'	, 	'ColMerge':0	}
				,{'Header': '계산서요청',	'Type': 'Popup',		'MinWidth': 50,		'SaveName': 'sTaxBill',			'Align': 'Center',	'Edit':1,	'Save': 0	, 	'ColMerge':0	}
				,{'Header': '배송지구분','Type': 'Combo',		'MinWidth': 50,		'SaveName': 'sZoneTp',	 		'Align': 'Center',	'Edit':0,	'Save': 0,	'ComboText': '일반지역|도서산간|제주지역',		'ComboCode': '0|1|2'	, 	'ColMerge':0	}
				,{'Header': '장바구니복사',	'Type': 'Button',		'MinWidth': 80,		'SaveName': 'CART',				'Align': 'Center'	, 	'ColMerge':0, 	'DefaultValue':'장바구니' }
				,{'Header': 'INI결제번호',	'Type': 'Text',		'MinWidth': 150,	'SaveName': 'sOid',				'Align': 'Left',		'Edit':0,	'Save': 0	, 	'ColMerge':1}  
				,{'Header': 'INI승인번호(TID)',	'Type': 'Text',			'MinWidth': 150,	'SaveName': 'sTid',			'Align': 'Left',		'Edit':0,	'Save': 0	, 	'ColMerge':1,	'Hidden':dev		}
				,{'Header': '주문자ID',	'Type': 'Text',			'MinWidth': 50,	'SaveName': 'sMoUsrId',		'Align': 'Left',		'Edit':0,	'Save': 0	, 	'ColMerge':1,	'Hidden':dev		}
				,{'Header': '비고내역', 	'Type': 'Int', 			'MinWidth': 0, 		'SaveName': 'sChk', 			'Align': 'Center', 	'Edit':0,	'Save': 0,	'Hidden':dev	}   
			];	
			// IBSheet 생성
			createIBSheet2($('#ib-container1')[0], 'mySheet1', '100%', '400px');
			// IBSheet 초기화
			IBS_InitSheet(mySheet1, initData);	

			
			initData.Cols = [
				{'Header': '번호',		'Type': 'Seq', 			'MinWidth': 50,		'SaveName': 'sSeq',			'Align': 'Center',	'Edit':0,	'Save': 0	, 	'ColMerge':0	}
				,{'Header': '구분',		'Type': 'Status',		'MinWidth': 50,		'SaveName': 'sStatus', 		'Align': 'Center',	'Edit':0,	'Save': 0,	'Hidden':dev, 	'ColMerge':0	}
				,{'Header': '주문일',	'Type': 'Date',			'MinWidth': 80,		'SaveName': 'sMordrDt',	 	'Align': 'Center',	'Edit':0,	'Save': 0	,	'Format':'YmdHm'}
				,{'Header': '주문자',	'Type': 'Text',			'MinWidth': 70,		'SaveName': 'sMordrUsr',	'Align': 'Center',	'Edit':0,	'Save': 0	, 	'ColMerge':1	}
				,{'Header': '주문번호',	'Type': 'Text',			'MinWidth': 150,	'SaveName': 'sMordrId',		'Align': 'Center',	'Edit':0,	'Save': 0	, 	'ColMerge':1	}
				,{'Header': '주문금액',	'Type': 'Int',				'MinWidth': 50,		'SaveName': 'sMprice', 		'Align': 'Right',		'Edit':0,	'Save': 0,	'Format':'Integer'	}
				,{'Header': '배송비',	'Type': 'Int',				'MinWidth': 50,		'SaveName': 'sMdvFee', 	'Align': 'Right',		'Edit':0,	'Save': 0,	'Format':'Integer'	}
				,{'Header': '총금액',	'Type': 'Int',				'MinWidth': 50,		'SaveName': 'sMsPrice',	 	'Align': 'Right',		'Edit':0,	'Save': 0,	'Format':'Integer'	}
			
				,{'Header': '품목수',	'Type': 'Int',				'MinWidth': 50,		'SaveName': 'sMcntPrdt',	'Align': 'Right',		'Edit':0,	'Save': 0,	'Format':'Integer'	}
				,{'Header': '상태', 		'Type': 'Combo', 		'MinWidth': 60,		'SaveName': 'sDsttus', 		'Align': 'Center', 	'Edit':0,	'Save': 0,	'ComboText': '${sttus.cbText}', 'ComboCode': '${sttus.cbCode}', 	'ColMerge':0	}
				,{'Header': '선택',		'Type': 'CheckBox', 	'MinWidth': 50, 	'SaveName': 'sCheckBox',	'Align': 'Center',	'Edit':1, 	'Save': 1	, 	'ColMerge':0	}
				,{'Header': '비고',		'Type': 'Text',			'MinWidth': 50,		'SaveName': 'sRMK',		 	'Align': 'Left',		'Edit':0,	'Save': 0, 	'ColMerge':0,	'ToolTip':1,	'Hidden':dev	}  
				,{'Header': '품목코드',	'Type': 'Text',			'MinWidth': 80,		'SaveName': 'sDprdtCd', 	'Align': 'Center',	'Edit':0,	'Save': 0, 	'ColMerge':0	}
				,{'Header': '품명',		'Type': 'Text',			'MinWidth': 150,	'SaveName': 'sDprdtNm', 	'Align': 'Left',		'Edit':0,	'Save': 0	, 	'ColMerge':0	}
				,{'Header': '규격',		'Type': 'Text',			'MinWidth': 150,	'SaveName': 'sDstndrd', 	'Align': 'Left',		'Edit':0,	'Save': 0	, 	'ColMerge':0	}
				,{'Header': '제조사',	'Type': 'Text',			'MinWidth': 50,		'SaveName': 'sDmakrNm', 	'Align': 'Center',	'Edit':0,	'Save': 0, 	'ColMerge':0	}
				,{'Header': '판매가',	'Type': 'Int',				'MinWidth': 50,		'SaveName': 'sDtotPrice', 	'Align': 'Right',		'Edit':0,	'Save': 0,	'Format':'Integer', 	'ColMerge':0	}
				,{'Header': '수량',		'Type': 'Int',				'MinWidth': 50,		'SaveName': 'sDqy',		 	'Align': 'Right',		'Edit':0,	'Save': 0,	'Format':'Integer', 	'ColMerge':0	}
				,{'Header': '합계',		'Type': 'Int',				'MinWidth': 50,		'SaveName': 'sDsumPrice', 	'Align': 'Right',		'Edit':0,	'Save': 0,	'Format':'Integer', 	'ColMerge':0	}
				
				,{'Header': '접수일',	'Type': 'Date',			'MinWidth': 80,		'SaveName': 'sDreceiptDt',	'Align': 'Center',	'Edit':0,	'Save': 0,	'Format':'YmdHm'}
				,{'Header': '배송등록일','Type': 'Date',			'MinWidth': 80,		'SaveName': 'sDdelyDt', 	'Align': 'Center',	'Edit':0,	'Save': 0	,	'Format':'YmdHm'}

				,{'Header': '택배사', 	'Type': 'Combo',		'MinWidth': 80, 	'SaveName': 'sDdlvyCmp', 	'Align': 'Center',	'Edit':1,	'Save': 1, 	'ColMerge':0, 	'ComboText': '|${delyCb.cbText}', 'ComboCode': '|${delyCb.cbCode}' }  
				,{'Header': '송장번호', 	'Type': 'Int',				'MinWidth': 100, 	'SaveName': 'sDinvoice', 	'Align': 'Left',		'Edit':1,	'Save': 1, 	'ColMerge':0,	'Format' : '##############' 	}
				
				,{'Header': '배송지명',	'Type': 'Text',			'MinWidth': 50,		'SaveName': 'sMaddrNm', 	'Align': 'Center',	'Edit':0,	'Save': 0		}
				,{'Header': '받는사람',	'Type': 'Text',			'MinWidth': 50,		'SaveName': 'sMrecvNm', 	'Align': 'Center',	'Edit':0,	'Save': 0		}
				,{'Header': '우편번호',	'Type': 'Text',			'MinWidth': 60,		'SaveName': 'sMZipCode', 	'Align': 'Center',	'Edit':0,	'Save': 0		}
				,{'Header': '주소',		'Type': 'Text',			'MinWidth': 150,	'SaveName': 'sMaddr', 		'Align': 'Left',		'Edit':0,	'Save': 0		}
				,{'Header': '상세주소',	'Type': 'Text',			'MinWidth': 100,	'SaveName': 'sMaddrDtl', 	'Align': 'Left',		'Edit':0,	'Save': 0		}
				,{'Header': '전화번호',	'Type': 'Text',			'MinWidth': 80,		'SaveName': 'sMtel', 			'Align': 'Center',	'Edit':0,	'Save': 0		}
				,{'Header': '배송요구사항',	'Type': 'Text',		'MinWidth': 100,	'SaveName': 'sMrmk', 		'Align': 'Left',		'Edit':0,	'Save': 0		}

				,{'Header': '결제구분', 	'Type': 'Text', 			'MinWidth': 0, 		'SaveName': 'sPaym',			'Align': 'Center', 	'Edit':0,	'Save': 1,	'Hidden':dev	}  
				,{'Header': '일련번호', 	'Type': 'Text', 			'MinWidth': 0, 		'SaveName': 'sDoId', 			'Align': 'Center', 	'Edit':0,	'Save': 1, 	'Hidden':dev	}  
				
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
			//mySheet1.FitColWidth();
			
			// 써머리 관련
			mySheet1.SetCountPosition(3);
			mySheet1.SetSelectionSummaryInfoElement('');
		}

		function doAction(sAction) { 
			switch(sAction) {  
				case 'clear':           
					_BT.reset();
					initDate();
					break;
					
				case 'search':   
					mySheet1.RemoveAll(); 
					mySheet2.RemoveAll();     
					mySheet1.DoSearch(_BT.FRONT.URL.Search.SheetOrderList, $('#frm').serialize()); 
					break; 

				case 'accept':          
					var alerted = false;
					var sRow = mySheet2.FindCheckedRow('sCheckBox').split('|');
					if(sRow == ''){alert('접수하실 주문건을 선택해 주세요.');return false;}
					for(var i=0; i < sRow.length; i++){
						if(mySheet2.GetCellValue(sRow[i], 'sDsttus') != '1'){
							mySheet2.SetCellValue(sRow[i], 'sCheckBox', 0);
							alerted = true;
						}
					}
					if(alerted){alert('상태가 미확인 상태인 주문건만 주문접수 가능 합니다.');return false;}
					var opt = {UrlEncode:0, Mode:2, Delim:'#'};
					var SaveStr = mySheet2.GetSaveString(opt); 
					if('' == SaveStr){
						alert('접수하실 주문건을 선택해 주세요.'); 
						return false;
					}else if('KeyFieldError' == SaveStr){ 
						return false;
					}else{
						if(!confirm('주문 접수 하시겠습니까?')) return false;
						var rtnData = mySheet2.GetSaveData(_BT.FRONT.URL.Order.OrderAccept, SaveStr); 
						mySheet2.LoadSaveData(rtnData);
					}
					break; 
					
				case 'tmpInv':       
				case 'invoice':       
					var alerted = false;
					var sRow = mySheet2.FindCheckedRow('sCheckBox').split('|');
					if(sRow == ''){alert('임시송장을 등록하실 주문건을 선택해 주세요.');return false;}
					if($('#dlvyCmp').val() == ''){alert('임시송장을 등록하실 택배사를 선택해 주세요.');$('#dlvyCmp').focus();return false;}
					for(var i=0; i < sRow.length; i++){
						if(mySheet2.GetCellValue(sRow[i], 'sDsttus') != '2'){
							mySheet2.SetCellValue(sRow[i], 'sCheckBox', 0);
							alerted = true;
						}else{
							mySheet2.SetCellValue(sRow[i], 'sDdlvyCmp', $('#dlvyCmp').val());
							if(sAction == 'tmpInv'){
								mySheet2.SetCellValue(sRow[i], 'sDinvoice', 9);
							}
						}
					}

					if(sAction == 'tmpInv'){
						if(!confirm('주문접수가 완료된 주문건만 송장등록 됩니다.\n\n임시송장등록 하시겠습니까?')) return false;
					}else if(sAction == 'invoice'){
						if(!confirm('주문접수가 완료된 주문건만 송장등록 됩니다.\n\n송장등록 하시겠습니까?')) return false;
					}
					var opt = {UrlEncode:0, Mode:2, Delim:'#'};
					var SaveStr = mySheet2.GetSaveString(opt); 
					if('' == SaveStr){
						alert('송장을 등록하실 주문건을 선택해 주세요.'); 
						return false;
					}else if('KeyFieldError' == SaveStr){ 
						return false;
					}else{
						var rtnData = mySheet2.GetSaveData(_BT.FRONT.URL.Order.OrderInvoice, SaveStr); 
						mySheet2.LoadSaveData(rtnData);
					}
					break;  
				case 'picking':       
					var alerted = false;
					var sRow = mySheet2.FindCheckedRow('sCheckBox').split('|');
					if(sRow == ''){alert('출고지시 하실 주문건을 선택해 주세요.');return false;}
					
					if(sAction == 'tmpInv'){
						if(!confirm('주문접수가 완료된 주문건만 송장등록 됩니다.\n\n임시송장등록 하시겠습니까?')) return false;
					}else if(sAction == 'invoice'){
						if(!confirm('주문접수가 완료된 주문건만 송장등록 됩니다.\n\n송장등록 하시겠습니까?')) return false;
					}
					var opt = {UrlEncode:0, Mode:2, Delim:'#'};
					var SaveStr = mySheet2.GetSaveString(opt); 
					if('' == SaveStr){
						alert('송장을 등록하실 주문건을 선택해 주세요.'); 
						return false;
					}else if('KeyFieldError' == SaveStr){ 
						return false;
					}else{
						var rtnData = mySheet2.GetSaveData(_BT.FRONT.URL.Order.OrderInvoice, SaveStr); 
						mySheet2.LoadSaveData(rtnData);
					}
					break;  
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
			} 
		}

		function mySheet2_OnRowSearchEnd (row) { 
			if (mySheet2.GetCellValue(row, 'OR_O_1') == 1) {
				mySheet2.SetCellFontColor(row, 'sDsttus', '#FF0000');
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
		function mySheet1_OnRowSearchEnd (row) { 
			if(mySheet1.GetCellValue(row, 'sChk') > 0){
				mySheet1.SetCellFontColor(row, 'sMordrId', '#FF0000');
				mySheet1.SetCellFontBold(row, 'sMordrId', 1);
			}
		} 	
		function mySheet1_OnPopupClick(Row, Col){
			var sSaveName = mySheet1.ColSaveName(0, Col); 
			if(sSaveName == 'sMordrId'){
				var ordrId = mySheet1.GetCellValue(Row,'sMordrId');
				_BT.openPopup( _BT.FRONT.URL.Order.PopRmk+'?ordrId='+ordrId ,'PopRmk', '610', '500', true, true);
			}else if(sSaveName == 'sTaxBill'){ 
				if(mySheet1.GetCellValue(Row,'sTaxBill') == '요청'){
					var sMoUsrId = mySheet1.GetCellValue(Row,'sMoUsrId');
					_BT.openPopup( _BT.FRONT.URL.Order.PopTaxInfo+'?usrId='+sMoUsrId ,'PopRmk', '550', '600', true, true);
				}else{
					alert('세금계산서 발행 미요청건 입니다.');
					return false;
				}
			}
		}	
		function mySheet1_OnDblClick(Row, Col, Value, CellX, CellY, CellW, CellH) { 
			if (Row == 0) return; //헤더행일때는 폼에 반영 안함.
			var ordrId = mySheet1.GetCellValue(Row,'sMordrId');
			$('#ordrId').val(ordrId);
			mySheet2.DoSearch(_BT.FRONT.URL.Search.SheetOrderDtlList, $('#orFrm').serialize()); 
		}	

		function mySheet1_OnButtonClick(Row, Col) {
			var sSaveName = mySheet1.ColSaveName(0, Col); 
			if(sSaveName == 'CART'){
				var ordrId = mySheet1.GetCellValue(Row,'sMordrId');
				var sMoUsrId = mySheet1.GetCellValue(Row,'sMoUsrId');
				_BT.openPopup( _BT.FRONT.URL.Order.PopCartCopy+'?sMoUsrId='+sMoUsrId+'&ordrId='+ordrId ,'CART_COPY', '550', '500', true, true);
			} 
		} 		
		
	</script>
	<div class="main_content06" style="padding-top: 0px; min-height: 800px; margin-bottom: 20px;">
		<form id="orFrm" name="orFrm">
			<input type="hidden" id="SaveStr" name="SaveStr"/>	
			<input type="hidden" id="ordrId" name="ordrId"/>	
		</form>
		<table class="dashBoard_tbl" >
			<caption>정보입력</caption>
			<colgroup>
				<col width="25%">
				<col width="25%">
				<col width="25%">
				<col width="25%">
			</colgroup>
			<tbody>
				<tr>
					<th>
						<h1>
							입금대기
						</h1>
						<h2>
							<label class="dbCnt" data-type="OR_0"><c:out value="${dashBoard.OR_0}"/> 건</label>
						</h2>
					</th>
					<th class="on">
						<h1>
							총 주문
						</h1>
						<h2>
							<label class="dbCnt" data-type="OR_1"><c:out value="${dashBoard.T_OR}"/> 건</label> 
							<span class="dbCnt" data-type="OR_O_1"><label><c:out value="${dashBoard.T_OR_ITEM}"/> </label>품목</span>
						</h2>
					</th>
					<th class="on">
						<h1>
							미확인 주문
						</h1>
						<h2>
							<label class="dbCnt" data-type="OR_1"><c:out value="${dashBoard.OR_1}"/> 건</label> 
							<span class="dbCnt" data-type="OR_O_1">지연 <label> <c:out value="${dashBoard.OR_O_1}"/> </label>건</span>
						</h2>
					</th>
					<th class="on">
						<h1>
							송장등록 대기
						</h1>
						<h2>
							<label class="dbCnt" data-type="OR_2"><c:out value="${dashBoard.OR_2}"/>  건</label> 
							<span class="dbCnt" data-type="OR_O_2">지연 <label> <c:out value="${dashBoard.OR_O_2}"/> </label>건</span>
						</h2>
					</th>
				</tr>
			</tbody>
		</table>	
		<div class="signup_agree marginbottom_20">
			<p class="alarm_txt">※ 집계 조건 : 최근 1주일(7일) 동안 / 주문 상품(전체)</p>
		</div>
		<form id="frm" name="frm">
			<input type="hidden" id="jobTp" name="jobTp" value="orderMng"/>	
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
									주문일
								</span>
								<span class="inquiry">
									<input type="text" class="input_style05" id="sDt" name="sDt" readonly="readonly"/>
								</span>
								<span class="tbl_txt">
									~
								</span>
								<span class="inquiry">
									<input type="text" class="input_style05" id="eDt" name="eDt" readonly="readonly"/>
								</span>
								<span class="c13_01_03_txt_01">
									조회상태
								</span>
								<span class="return_select">
									<select class="" id="sSus" name="sSus">
										<option value="">전체 주문</option>
										<option value="0">입금대기</option>
										<option value="1">미확인 주문</option>
										<option value="2">송장등록 대기</option> 
									</select>
								</span>			
								<input class="input_style20 marginleft_5" style="width:200px;" type="text" id="mValue" name="mValue" placeholder="통합검색"/>							
								<span class="inquiry_btn marginleft_7">
									<span onclick="doAction('clear');"  class="sButton btn_span fs-13 pink marginleft_5" style="float: right;">초기화</span>
									<span onclick="doAction('search');" class="sButton btn_span fs-13 blue" style="float: right;">조회</span>
								</span>
							</td>
						</tr>
					</tbody>
				</table>	
			</div>
		</form>		
		<div class="col-sm-5 col-md-5 margintop_5" style="height:410px;width:100%;">
		    <div id="ib-container1"></div>
		</div>
		<h1 class="title_con_Type01 margintop_20" style="margin-right:10px; text-align: left;">
			상세결과
			<span> 
<!-- 			
				<span onclick="doAction('import');" class="sButton btn_span fs-13 blue marginleft_30" style="float: right;">내려받기</span>
 -->			
				<span onclick="doAction('picking');"  class="sButton btn_span fs-13 purple marginleft_10" style="float: right;">출고지시</span>
				<span onclick="doAction('invoice');"  class="sButton btn_span fs-13 blue marginleft_5" style="float: right;">송장등록</span>
				<span onclick="doAction('tmpInv');"  class="sButton btn_span fs-13 pink marginleft_5" style="float: right;">임시송장등록</span>
				<span class="return_select2 marginleft_30" style="float: right;">
					<select id="dlvyCmp" name="dlvyCmp" class="">
						<option value="" selected="selected">택배사 선택</option>
						<c:forEach items="${comboList}" var="cb" varStatus="status">
							<option value="<c:out value="${cb.cbCode}"/>"><c:out value="${cb.cbText}"/></option>
						</c:forEach>
					</select>
				</span>
				<span onclick="doAction('accept');"  class="sButton btn_span fs-13 green" style="float: right;">주문접수</span>
			</span>
		</h1>
		<div class="col-sm-5 col-md-5" style="height:310px;width:100%;">
		    <div id="ib-container2"></div>
		</div>
	</div>
