<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/layout/include/base.jsp" %>
	<script type="text/javascript">
		var dupClick1 = false;
		var dev = 0;
		$(function(){
			initSheet();
			initDate();
			doAction('search');
		});
		function initDate(){
			var d = new Date();
			var yy = d.getFullYear();
			var mm = '';
			if(d.getMonth() == 0){
				yy -= 1;
				mm = '01';
			}else{
				if(d.getMonth() <  10)
					mm = '0'+(d.getMonth());
				else
					mm = (d.getMonth());
			}
			$('#yy').val(yy);
			$('#mm').val(mm);
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
				{'Header': '주문일',			'Type': 'Date',			'MinWidth': 80,			'SaveName': 'ORDR_DT',	 			'Align': 'Center',	'Edit':0,	'Save': 0	,	'Format':'Ymd'	}
				,{'Header': '구매확정일',	'Type': 'Date',			'MinWidth': 80,			'SaveName': 'ORDT_COMP_DT',	'Align': 'Center',	'Edit':0,	'Save': 0	,	'Format':'Ymd'	}
				,{'Header': '취소일',		'Type': 'Date',			'MinWidth': 80,			'SaveName': 'CANCEL_DT',			'Align': 'Center',	'Edit':0,	'Save': 0	,	'Format':'Ymd'	}
				,{'Header': '주문상태',		'Type': 'Combo',		'MinWidth': 70,			'SaveName': 'STTUS_TXT',			'Align': 'Center',	'Edit':0,	'Save': 0,	'ComboText': '정상주문|전체취소|부분취소',		'ComboCode': 'ORDR|ACAN|PCAN'	, 	'ColMerge':0	}
				,{'Header': '주문번호',		'Type': 'Text',			'MinWidth': 150,		'SaveName': 'ORDR_ID',				'Align': 'Center',	'Edit':0,	'Save': 0	, 	'ColMerge':1	}
				,{'Header': '주문번호',		'Type': 'Text',			'MinWidth': 200,		'SaveName': 'OID',					'Align': 'Center',	'Edit':0,	'Save': 0,	'Hidden':dev	}  
				,{'Header': '사용구분',		'Type': 'Text',			'MinWidth': 50,			'SaveName': 'USE_YN',				'Align': 'Center',	'Edit':0,	'Save': 0,	'Hidden':dev	}  
				,{'Header': '주문자',		'Type': 'Text',			'MinWidth': 80,			'SaveName': 'ORDR_USR',			'Align': 'Center',	'Edit':0,	'Save': 0	, 	'ColMerge':1	}
				,{'Header': '결제구분',		'Type': 'Combo',		'MinWidth': 70,			'SaveName': 'PAYMETHOD',			'Align': 'Center',	'Edit':0,	'Save': 0,	'ComboText': '카드|카드|가상계좌|계좌이체',		'ComboCode': 'Card|VCard|VBank|DirectBank'	, 	'ColMerge':0	}
				,{'Header': '결제금액',		'Type': 'AutoSum',		'MinWidth': 70,			'SaveName': 'TOTPRICE', 			'Align': 'Right',		'Edit':0,	'Save': 0,	'Format':'Integer'	}
				,{'Header': '취소금액',		'Type': 'AutoSum',		'MinWidth': 70,			'SaveName': 'REFPRICE', 			'Align': 'Right',		'Edit':0,	'Save': 0,	'Format':'Integer'	}
			];		
			
			// IBSheet 생성
			createIBSheet2($('#ib-container1')[0], 'mySheet1', '100%', '500px');
			// IBSheet 초기화
			IBS_InitSheet(mySheet1, initData);	

			//mySheet1.ShowGroupRow('', '{%s} <font color="gray">({%c}건)</font>'); 
			
			// 편집 가능 여부 설정
			mySheet1.SetEditable(1);

			//건수 정보 표시
			mySheet1.SetCountPosition(4);
			
			//마우스오버
			mySheet1.SetMouseHoverMode(2) 
 		
			mySheet1.ShowSubSum([{
			     "StdCol": "ORDR_DT",
			     "SumCols": "9|10",
			     "AvgCols": "",
			     "ShowCumulate": 0,
			     "CaptionCol": 0
			}]);
 	
	
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
					mySheet1.RemoveAll(); 
					break;
					
				case 'search': 
					$('#mon').val('' + $("#yy option:selected").val() + $("#mm option:selected").val());
					mySheet1.DoSearch(_BT.FRONT.URL.Search.SheetMagamMng, $('#frm').serialize()); 
					break; 
					
				case 'subsum-hide': 
					mySheet1.HideSubSum();
					break; 
					
				case 'subsum-set': 
					mySheet1.ShowSubSum([{
					     "StdCol": "ORDR_DT",
					     "SumCols": "9|10",
					     "AvgCols": "",
					     "ShowCumulate": 0,
					     "CaptionCol": 0
			        }]);
					var SaveJson = mySheet1.GetSaveJson({AllSave:1});
					console.log(SaveJson);
					mySheet1.LoadSearchData(SaveJson);
					break; 
				case 'save': 
					if( dupClick1 ) {
						alert("처리중 입니다. 잠시만 기다려주세요.");
						return false;
					}
					if(!confirm('마감기초 데이터를 생성 하시겠습니까?')) return false;
					dupClick1 = true; 
					_BT.ajaxCallbackSubmit('frm',  _BT.FRONT.URL.Calculate.InsMagamData, function(data) {
						dupClick1 = false;
						if($(data).size() > 0) { 
							if(_BT.isEquals(data.code, 'success')){
								alert(data.msg);	
								return false;
							}else{
								alert(data.msg);	
								return false;
							}
						}
					},
					function(xhr, status, error) {
						dupClick1 = false; 
						alert('처리중 오류가 발생했습니다.\n\n다시 확인 부탁 드립니다.');
					});	
					break; 
			} 
		}
        function AddZero(str) {
            if ((str + '').length == 1) {
                return '0' + str;
            }
            return str;
        }
		function mySheet2_OnSaveEnd(code, msg) {
			if(code == 1){         
				alert(msg);
				doAction('search');
			} else {         
				alert('처리중 오류가 발생했습니다.\n\n다시 확인 부탁 드립니다.');     
			} 
		} 
		function mySheet1_OnPopupClick(Row, Col){
			var sSaveName = mySheet1.ColSaveName(0, Col); 
			var ordrId = mySheet1.GetCellValue(Row,'sMordrId');
			if(sSaveName == 'sMordrId'){
				_BT.openPopup( _BT.FRONT.URL.Order.PopRmk+'?ordrId='+ordrId ,'PopRmk', '610', '500', true, true);
			}
		}
		function mySheet1_OnDblClick(Row, Col, Value, CellX, CellY, CellW, CellH) { 
			if (Row == 0) return; //헤더행일때는 폼에 반영 안함.
			var ordrId = mySheet1.GetCellValue(Row,'sMordrId');
			$('#ordrId').val(ordrId);
			mySheet2.DoSearch(_BT.FRONT.URL.Search.SheetRtnOrderDtl, $('#frm').serialize()); 
		}		
		function mySheet2_OnPopupClick(Row,Col){
			var invoice = mySheet2.GetCellValue(Row,'sDinvoice');
			if(invoice != ''){
				$('#t_code').val(mySheet2.GetCellValue(Row,'sDdlvyCmp'));
				$('#t_name').val(mySheet2.GetCellText(Row,'sDdlvyCmp'));
				$('#t_invoice').val(invoice);
				$('#t_item').val(mySheet2.GetCellValue(Row,'sDprdtNm'));
				$('#t_idex').val(mySheet2.GetCellValue(Row,'sMordrId'));
				_BT.openPopup( '','fnMngAddr', '610', '700', true, true);
				$('#popFrm').attr('method', 'POST').attr('target', 'fnMngAddr').attr('action', _BT.SHOP.URL.Order.PopTrace).submit();				
			}else{
				alert('배송정보 등록 전 입니다.');
				return false;
			}
		}
		function mySheet1_OnRowSearchEnd (row) { 
			if(mySheet1.GetCellValue(row, 'sDsttus') == 2){
				mySheet1.InitCellProperty(row, 'sCheckBox', {Type:"CheckBox",Edit:0}); 
			}
			if (mySheet1.GetCellValue(row, 'OR_O_1') == 1) {
				mySheet1.SetCellFontColor(row, 'sDsttus', '#FF0000');
			}
			if(mySheet1.GetCellValue(row, 'sChk') > 0){
				mySheet1.SetCellFontColor(row, 'sMordrId', '#FF0000');
				mySheet1.SetCellFontBold(row, 'sMordrId', 1);
			}
		} 
		function mySheet2_OnRowSearchEnd (row) { 
			if(
					mySheet2.GetCellValue(row, 'sDsttus') == 7
				||mySheet2.GetCellValue(row, 'sDsttus') == 8
				||mySheet2.GetCellValue(row, 'sDsttus') == 9
			){
				mySheet2.InitCellProperty(row, 'sCheckBox', {Type:"CheckBox",Edit:0}); 
			}
		} 
		
		function mySheet2_OnChange(Row, Col, Value, OldValue, RaiseFlag){ 
			var sSaveName = mySheet2.ColSaveName(0, Col); 
			var price = 0; 
			var dlvy = 0; 
			var m_dlvy = 0; 
			var chk = 0; 
			if(sSaveName == 'sCheckBox'){
				var cnt = mySheet2.RowCount();
				for(var i = 1; i <= cnt; i++){
					var chk = mySheet2.GetCellValue(i,'sCheckBox');
					if(chk == 1){
						chk++;
						price += mySheet2.GetCellValue(i,'sDsumPrice');
					}
				}
				var sMdvFee = mySheet2.GetCellValue(1,'sMdvFee');
				var sMcntPrdt = mySheet2.GetCellValue(1,'sMcntPrdt');
				if(sMdvFee > 0 && chk == sMcntPrdt){
					dlvy = sMdvFee;
				}
				$('#ck_p').val( price ); 
				$('#ck_d').val( dlvy ); 
				$('#mi_d').val( m_dlvy ); 
				$('#ck_s').val( price + dlvy ); 
			}
		} 
	</script>
	<div class="main_content06" style="padding-top: 0px; min-height: 800px; margin-bottom: 20px;">
		<form id="popFrm" name="popFrm">
			<input id="t_code" name="t_code" type="hidden" />
			<input id="t_name" name="t_name" type="hidden" />
			<input id="t_invoice" name="t_invoice" type="hidden" />
			<input id="t_item" name="t_item" type="hidden" />
			<input id="t_idex" name="t_idex" type="hidden" />
		</form>
		<form id="frm" name="frm">
			<input type="hidden" id="SaveStr" name="SaveStr"/>	
			<input type="hidden" id="jobTp" name="jobTp" value="returnMng"/>	
			<input type="hidden" id="mon" name="mon"/>	
		</form>		
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
								마감대상
							</span>
							<span class="return_select6">
								<select class="" id="yy" name="yy" style="width: 70px;">
									<option value="2017">2017년</option>
									<option value="2018">2018년</option>
									<option value="2019">2019년</option>
									<option value="2020">2020년</option>
									<option value="2021">2021년</option>
									<option value="2022">2022년</option>
									<option value="2023">2023년</option>
								</select>
								<select class="" id="mm" name="mm" style="width: 50px;">
									<option value="01">01월</option>
									<option value="02">02월</option>
									<option value="03">03월</option>
									<option value="04">04월</option>
									<option value="05">05월</option>
									<option value="06">06월</option>
									<option value="07">07월</option>
									<option value="08">08월</option>
									<option value="09">09월</option>
									<option value="10">10월</option> 
									<option value="11">11월</option> 
									<option value="12">12월</option> 
								</select>
							</span>										
							<span class="inquiry_btn marginleft_7">
								<span onclick="doAction('save');"  class="sButton btn_span fs-13 pink marginleft_5" style="float: right;">마감기초 생성</span>
								<span onclick="doAction('subsum-hide');"  class="sButton btn_span fs-13 green marginleft_5" style="float: right;">소계제거</span>
								<span onclick="doAction('search');" class="sButton btn_span fs-13 blue" style="float: right;">조회</span>
							</span>
						</td>
					</tr>
				</tbody>
			</table>	
		</div>
		<div class="col-sm-5 col-md-5 margintop_5" style="height:510px;width:100%;">
		    <div id="ib-container1"></div>
		</div>
	</div>
