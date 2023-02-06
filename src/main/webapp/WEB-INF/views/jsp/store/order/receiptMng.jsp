<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/layout/include/base.jsp" %>
	<script type="text/javascript">
		var dupClick1 = false;
		var dev = 1;
		$(function(){  
			_BT.makeCalendar('sDt', 'yy-mm-dd'); 
			_BT.makeCalendar('eDt', 'yy-mm-dd'); 
			$('.dbCnt').on('click', function() {
				sAction = $(this).data('type');
				if(sAction == 'OR_1'||sAction == 'OR_O_1'){
					_BT.moveUrl(_BT.STORE.URL.Order.OrderMng);
				}else if(sAction == 'OR_2' || sAction == 'OR_O_2'){
					$('#sDt').val(_BT.dateAdd($.datepicker.formatDate($.datepicker.ATOM, new Date()),-7,'d'));	
					$('#sttus').val('2');
					$('#delayStatusD2').prop('checked', false);
					if(sAction == 'OR_O_2')
						$('#delayStatusD2').prop('checked', true);
					doAction('search');
					
				}else if(sAction == 'OR_3' || sAction == 'OR_4'){
					_BT.moveUrl(_BT.STORE.URL.Order.DeliveryMng);		
					
				}else if(sAction == 'OR_5'){
					_BT.moveUrl(_BT.STORE.URL.Order.ReturnMng);
					
				}
			});
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
								,'MergeSheet': 4 
				                ,'DeferredVScroll': 1
				                ,'Page' : 300
				                ,'AutoSumCalcMode':1
				                ,'SelectionSummary': 'NotEmptyCell' 
								};
			initData.HeaderMode = {
			};
			initData.Cols = [
				{'Header': '번호',		'Type': 'Seq', 			'MinWidth': 50,		'SaveName': 'sSeq',			'Align': 'Center',	'Edit':0,	'Save': 0	, 	'ColMerge':0	}
				,{'Header': '구분',		'Type': 'Status',		'MinWidth': 50,		'SaveName': 'sStatus', 		'Align': 'Center',	'Edit':0,	'Save': 0,	'Hidden':dev, 	'ColMerge':0	}
				,{'Header': '주문일',	'Type': 'Date',			'MinWidth': 70,		'SaveName': 'sMordrDt',	 	'Align': 'Center',	'Edit':0,	'Save': 0	,	'Format':'YmdHm'}
				,{'Header': '주문자',	'Type': 'Text',			'MinWidth': 70,		'SaveName': 'sMordrUsr',	'Align': 'Center',	'Edit':0,	'Save': 0	, 	'ColMerge':1	} 
				,{'Header': '출력',		'Type': 'Button',		'MinWidth': 80,		'SaveName': 'sDoc',			'Align': 'Center'	, 	'ColMerge':1, 	'DefaultValue':'송장' }
				
				,{'Header': '주문번호',	'Type': 'Popup',		'MinWidth': 160,	'SaveName': 'sMordrId',		'Align': 'Center',	'Edit':1,	'Save': 0	, 	'ColMerge':1,	'ToolTip':1	}
				,{'Header': '주문금액',	'Type': 'Int',				'MinWidth': 50,		'SaveName': 'sMprice', 		'Align': 'Right',		'Edit':0,	'Save': 0,	'Format':'Integer'	}
				,{'Header': '배송비',	'Type': 'Int',				'MinWidth': 50,		'SaveName': 'sMdvFee', 	'Align': 'Right',		'Edit':0,	'Save': 0,	'Format':'Integer'	}
				,{'Header': '총금액',	'Type': 'AutoSum',		'MinWidth': 60,		'SaveName': 'sMsPrice',	 	'Align': 'Right',		'Edit':0,	'Save': 0,	'Format':'Integer'	}
			
				,{'Header': '품목수',	'Type': 'AutoSum',		'MinWidth': 50,		'SaveName': 'sMcntPrdt',	'Align': 'Right',		'Edit':0,	'Save': 0,	'Format':'Integer'	}
				,{'Header': '상태', 		'Type': 'Combo', 		'MinWidth': 60,		'SaveName': 'sDsttus', 		'Align': 'Center', 	'Edit':0,	'Save': 0,	'ComboText': '미확인|주문접수|배송중|배송완료|취소요청',		'ComboCode': '1|2|3|4|71'	, 	'ColMerge':0	}
				,{'Header': '선택',		'Type': 'CheckBox', 	'MinWidth': 50, 	'SaveName': 'sCheckBox',	'Align': 'Center',	'Edit':1, 	'Save': 1	, 	'ColMerge':0	}
				,{'Header': '비고',		'Type': 'Text',			'MinWidth': 100,	'SaveName': 'sRMK',		 	'Align': 'Left',		'Edit':1,	'Save': 1, 	'Hidden':dev	}  
				,{'Header': '품목코드',	'Type': 'Text',			'MinWidth': 80,		'SaveName': 'sDprdtCd', 	'Align': 'Center',	'Edit':0,	'Save': 0, 	'ColMerge':0	}
				,{'Header': '배송구분',	'Type': 'Combo',		'MinWidth': 60,		'SaveName': 'DLVY_TP', 	'Align': 'Center',	'Edit':0,	'Save': 0, 	'ColMerge':0, 	'ComboText': '착불|선불', 'ComboCode': 'C|T' }  
				,{'Header': '품명',		'Type': 'Text',			'MinWidth': 150,	'SaveName': 'sDprdtNm', 	'Align': 'Left',		'Edit':0,	'Save': 0	, 	'ColMerge':0	}
				,{'Header': '규격',		'Type': 'Text',			'MinWidth': 150,	'SaveName': 'sDstndrd', 	'Align': 'Left',		'Edit':0,	'Save': 0	, 	'ColMerge':0	}
				,{'Header': '제조사',	'Type': 'Text',			'MinWidth': 50,		'SaveName': 'sDmakrNm', 	'Align': 'Center',	'Edit':0,	'Save': 0, 	'ColMerge':0	}
				,{'Header': '판매가',	'Type': 'Int',				'MinWidth': 50,		'SaveName': 'sDtotPrice', 	'Align': 'Right',		'Edit':0,	'Save': 0,	'Format':'Integer', 	'ColMerge':0	}
				,{'Header': '수량',		'Type': 'Int',				'MinWidth': 50,		'SaveName': 'sDqy',		 	'Align': 'Right',		'Edit':0,	'Save': 0,	'Format':'Integer', 	'ColMerge':0	}
				,{'Header': '합계',		'Type': 'Int',				'MinWidth': 50,		'SaveName': 'sDsumPrice', 	'Align': 'Right',		'Edit':0,	'Save': 0,	'Format':'Integer', 	'ColMerge':0	}
				
				,{'Header': '접수일',	'Type': 'Date',			'MinWidth': 70,		'SaveName': 'sDreceiptDt',	'Align': 'Center',	'Edit':0,	'Save': 0,	'Format':'YmdHm'}
				,{'Header': '배송등록일','Type': 'Date',			'MinWidth': 70,		'SaveName': 'sDdelyDt', 	'Align': 'Center',	'Edit':0,	'Save': 0	,	'Format':'YmdHm'}

				,{'Header': '택배사', 	'Type': 'Combo',		'MinWidth': 80, 	'SaveName': 'sDdlvyCmp', 	'Align': 'Center',	'Edit':1,	'Save': 1, 	'ColMerge':0, 	'KeyField':1,	 	'ComboText': '|${delyCb.cbText}', 'ComboCode': '|${delyCb.cbCode}' }  
				,{'Header': '송장번호', 	'Type': 'Int',				'MinWidth': 100, 	'SaveName': 'sDinvoice', 	'Align': 'Left',		'Edit':1,	'Save': 1, 	'ColMerge':0,	'KeyField':1,  	'Format' : '##############' 	}
				
				,{'Header': '배송지명',	'Type': 'Text',			'MinWidth': 50,		'SaveName': 'sMaddrNm', 	'Align': 'Center',	'Edit':0,	'Save': 0		}
				,{'Header': '받는사람',	'Type': 'Text',			'MinWidth': 50,		'SaveName': 'sMrecvNm', 	'Align': 'Center',	'Edit':0,	'Save': 0		}
				,{'Header': '우편번호',	'Type': 'Text',			'MinWidth': 60,		'SaveName': 'sMZipCode', 	'Align': 'Center',	'Edit':0,	'Save': 0		}
				,{'Header': '주소',		'Type': 'Text',			'MinWidth': 150,	'SaveName': 'sMaddr', 		'Align': 'Left',		'Edit':0,	'Save': 0		}
				,{'Header': '상세주소',	'Type': 'Text',			'MinWidth': 100,	'SaveName': 'sMaddrDtl', 	'Align': 'Left',		'Edit':0,	'Save': 0		}
				,{'Header': '전화번호',	'Type': 'Text',			'MinWidth': 80,		'SaveName': 'sMtel', 			'Align': 'Center',	'Edit':0,	'Save': 0		}
				,{'Header': '배송요구사항',	'Type': 'Text',		'MinWidth': 100,	'SaveName': 'sMrmk', 		'Align': 'Left',		'Edit':0,	'Save': 0		}

				,{'Header': '지연여부', 	'Type': 'Text', 			'MinWidth': 0, 		'SaveName': 'OR_O_2', 		'Align': 'Center',	'Edit':0,	'Save': 0, 	'Hidden':dev	}  
				,{'Header': '결제구분', 	'Type': 'Text', 			'MinWidth': 0, 		'SaveName': 'sPaym',			'Align': 'Center', 	'Edit':0,	'Save': 1,	'Hidden':dev	}  
				,{'Header': '비고내역', 	'Type': 'Text', 			'MinWidth': 0, 		'SaveName': 'sChk', 			'Align': 'Center', 	'Hidden':dev	}  
				,{'Header': '일련번호', 	'Type': 'Text', 			'MinWidth': 0, 		'SaveName': 'sDoId', 			'Align': 'Center', 	'Edit':0,	'Save': 1, 	'Hidden':dev	}  
				
			];	
			// IBSheet 생성
			createIBSheet2($('#ib-container1')[0], 'mySheet1', '100%', '400px');
			
			// IBSheet 초기화
			IBS_InitSheet(mySheet1, initData);	
			//mySheet1.ShowGroupRow('', '{%s} <font color="gray">({%c}건)</font>');
	
			// 편집 가능 여부 설정
			mySheet1.SetEditable(1);

			//건수 정보 표시
			mySheet1.SetCountPosition(4);
			
			//마우스오버
			mySheet1.SetMouseHoverMode(2) 
			
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
					mySheet1.RemoveAll(); 
					break;
					
				case 'search':            
					mySheet1.DoSearch(_BT.STORE.URL.Search.SheetReceiptList, $('#frm').serialize()); 
					break; 
					
				case 'import':     
					var cnt = mySheet1.RowCount();
			        var t = new Date();
			        var yymmdd = t.getFullYear() + '-' + AddZero(t.getMonth() + 1) + '-' + AddZero(t.getDate()); 
			        var printTime = yymmdd + '   ' + AddZero(t.getHours()) + ':' + AddZero(t.getMinutes());
			        var title = '[배송 리스트] 주문기간 : ' + $('#sDt').val() + ' ~ ' + $('#eDt').val();
			        title += '[ ' + mySheet1.RowCount() + ' ]건, 출력시간 : ' + printTime + '\r\n\r\n\r\n';
			        title += '※※※양식 변경 금지※※※택배사는 따로 선택 하지 마세요.\r\n';
					var params = {
			            'FileName': '송장리스트_'+yymmdd+'.xlsx',
			            'SheetName': 'Sheet1',
			            'SheetDesign': 1,
			            'Merge': 0,
			            'TitleText': title,
			            'UserMerge': '0,0,2,30 3,0,1,30',
			            'CheckBoxOnValue': 'Y',
			            'CheckBoxOffValue': 'N',
			            'NumberTypeToText ': 1 
			        };
					mySheet1.Down2Excel(params);
					break; 		
					
				case 'export':          
			        var params = {
			            "Mode": "HeaderMatch",
			            "StartRow": "6",
			            "FileExt": "xls|xlsx|xltx"
			        };
			        mySheet1.LoadExcel(params);
					break; 		

				case 'save':          
					var sRow = mySheet1.FindCheckedRow('sCheckBox').split('|');
					if(sRow == ''){alert('비고등록 하실 주문건을 선택해 주세요.');return false;}
					if(!confirm('비고내용을 등록 하시겠습니까?')) return false;
					
					for(var i=0; i < sRow.length; i++){
						mySheet1.SetCellValue(sRow[i], 'sDdlvyCmp', 14);
						mySheet1.SetCellValue(sRow[i], 'sDinvoice', 1);
					}
					var opt = {UrlEncode:0, Mode:2, Delim:'#'};
					var SaveStr = mySheet1.GetSaveString(opt); 
					if('' == SaveStr){
						alert('비고등록 하실 주문건을 선택해 주세요.'); 
						return false;
					}else if('KeyFieldError' == SaveStr){ 
						return false;
					}else{
						var rtnData = mySheet1.GetSaveData(_BT.STORE.URL.Order.OrderRmkSave, SaveStr); 
						mySheet1.LoadSaveData(rtnData);
					}
					break; 
					
				case 'tmpInv':          
					var alerted = false;
					var sRow = mySheet1.FindCheckedRow('sCheckBox').split('|');
					if(sRow == ''){alert('임시송장을 등록하실 주문건을 선택해 주세요.');return false;}
					if($('#dlvyCmp').val() == ''){alert('임시송장을 등록하실 택배사를 선택해 주세요.');$('#dlvyCmp').focus();return false;}
					
					for(var i=0; i < sRow.length; i++){
						if(mySheet1.GetCellValue(sRow[i], 'sDsttus') != '2'){
							mySheet1.SetCellValue(sRow[i], 'sCheckBox', 0);
							alerted = true;
						}else if(mySheet1.GetCellValue(sRow[i], 'sMrecvNm') == '-----'){
							mySheet1.SetCellValue(sRow[i], 'sCheckBox', 0);
							alerted = true;
						}else{
							mySheet1.SetCellValue(sRow[i], 'sDdlvyCmp', $('#dlvyCmp').val());
							mySheet1.SetCellValue(sRow[i], 'sDinvoice', 9);
						}
					}
					
					if(!confirm('주문접수가 완료된 주문건만 송장등록 됩니다.\n\n송장에 대한 정보변경은 진행관리자를 통해서만 가능 합니다.\n\n임시송장등록 하시겠습니까?')) return false;
					var opt = {UrlEncode:0, Mode:2, Delim:'#'};
					var SaveStr = mySheet1.GetSaveString(opt); 
					if('' == SaveStr){
						alert('임시송장을 등록하실 주문건을 선택해 주세요.'); 
						return false;
					}else if('KeyFieldError' == SaveStr){ 
						return false;
					}else{
						var rtnData = mySheet1.GetSaveData(_BT.STORE.URL.Order.OrderInvoice, SaveStr); 
						mySheet1.LoadSaveData(rtnData);
					}
					break;  
					
				case 'invoice':          
					var alerted = false;
					var sRow = mySheet1.FindCheckedRow('sCheckBox').split('|');
					if(sRow == ''){alert('송장을 등록하실 주문건을 선택해 주세요.');return false;}
					if($('#dlvyCmp').val() == ''){alert('송장을 등록하실 택배사를 선택해 주세요.');$('#dlvyCmp').focus();return false;}
					
					for(var i=0; i < sRow.length; i++){
						if(mySheet1.GetCellValue(sRow[i], 'sDsttus') != '2'){
							mySheet1.SetCellValue(sRow[i], 'sCheckBox', 0);
							alerted = true;
						}else if(mySheet1.GetCellValue(sRow[i], 'sMrecvNm') == '-----'){
							mySheet1.SetCellValue(sRow[i], 'sCheckBox', 0);
							alerted = true;
						}else{
							mySheet1.SetCellValue(sRow[i], 'sDdlvyCmp', $('#dlvyCmp').val());
						}
					}
					if(!confirm('주문접수가 완료된 주문건만 송장등록 됩니다.\n\n송장등록 하시겠습니까?')) return false;
					var opt = {UrlEncode:0, Mode:2, Delim:'#'};
					var SaveStr = mySheet1.GetSaveString(opt); 
					if('' == SaveStr){
						alert('송장을 등록하실 주문건을 선택해 주세요.'); 
						return false;
					}else if('KeyFieldError' == SaveStr){ 
						return false;
					}else{
						var rtnData = mySheet1.GetSaveData(_BT.STORE.URL.Order.OrderInvoice, SaveStr); 
						mySheet1.LoadSaveData(rtnData);
					}
					break;  
			} 
		}

        function AddZero(str) {
            if ((str + '').length == 1) {
                return '0' + str;
            }
            return str;
        }
		function mySheet1_OnSaveEnd(code) {
			if(code == 1){         
				alert('처리완료 하였습니다.');
				doAction('search');
			} else {         
				alert('처리중 오류가 발생했습니다.\n\n다시 확인 부탁 드립니다.');     
			} 
		} 
		function mySheet1_OnRowSearchEnd (row) { 
			mySheet1.SetToolTipText(row, 'sMordrId', mySheet1.GetCellValue(row, 'sChk') ); 
			if(mySheet1.GetCellValue(row, 'sDsttus') != 2){
				mySheet1.InitCellProperty(row, 'sCheckBox', {Type:"CheckBox",Edit:0}); 
			}
			if (mySheet1.GetCellValue(row, 'OR_O_2') == 1) {
				mySheet1.SetCellFontColor(row, 'sDsttus', '#FF0000');
			}
			if(mySheet1.GetCellValue(row, 'sChk') != ''){
				mySheet1.SetCellFontColor(row, 'sMordrId', '#FF0000');
				mySheet1.SetCellFontBold(row, 'sMordrId', 1);
			}
		} 
		function mySheet1_OnPopupClick(Row, Col){
			if (Row == 0) return; //헤더행일때는 폼에 반영 안함.
			var sSaveName = mySheet1.ColSaveName(0, Col); 
			var ordrId = mySheet1.GetCellValue(Row,'sMordrId');
			if(sSaveName == 'sMordrId'){
				_BT.openPopup( _BT.STORE.URL.Order.PopRmk+'?ordrId='+ordrId ,'PopRmk', '610', '500', true, true);
			}
		}

		function mySheet1_OnButtonClick(Row, Col) {
			if (Row == 0) return; //헤더행일때는 폼에 반영 안함.
			var sSaveName = mySheet1.ColSaveName(0, Col); 
			var ordrId = mySheet1.GetCellValue(Row,'sMordrId');
			if(sSaveName == 'sDoc'){
				_BT.openPopup( _BT.STORE.URL.Order.PopStatDoc+'?sOrdrId='+ordrId ,'StatDoc', '700', '850', true, true);
			}
		} 		

	</script>
	<div class="storeSection">
	 	<h1 class="title_Type03">
			배송관리
			<div class="sub_location">
				<div class="list_location01">
					<span class="txt01">고객만족 센터</span>
					<span class="arrow"><img src="${staticRoot}/img/bl_01.jpg" alt=">" /></span>
					<span class="last_txt">배송관리</span>
				</div>
			</div>
		</h1>
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
							미확인 주문
						</h1>
						<h2>
							<label class="dbCnt" data-type="OR_1"><c:out value="${dashBoard.ordrCnt.OR_1}"/> 건</label> 
							<span class="dbCnt" data-type="OR_O_1">지연 <label> <c:out value="${dashBoard.ordrCnt.OR_O_1}"/> </label>건</span>
						</h2>
					</th>
					<th class="on">
						<h1>
							송장등록 대기
						</h1>
						<h2>
							<label class="dbCnt" data-type="OR_2"><c:out value="${dashBoard.ordrCnt.OR_2}"/>  건</label> 
							<span class="dbCnt" data-type="OR_O_2">지연 <label> <c:out value="${dashBoard.ordrCnt.OR_O_2}"/> </label>건</span>
						</h2>
					</th>
					<th>
						<h1>
							배송중
						</h1>
						<h2>
							<label class="dbCnt" data-type="OR_3"><c:out value="${dashBoard.ordrCnt.OR_3}"/> 건</label>
							<span class="dbCnt" data-type="OR_4">완료 <label><c:out value="${dashBoard.ordrCnt.OR_4}"/></label>건</span>
						</h2>
					</th>
					<th>
						<h1>
							취소 / 환불
						</h1>
						<h2>
							<label class="dbCnt" data-type="OR_5"><c:out value="${dashBoard.ordrCnt.OR_5}"/> 건</label>
						</h2>
					</th>
				</tr>
			</tbody>
		</table>	
		<div class="signup_agree">
			<p class="alarm_txt">※ 조회조건 : 최근 1주일(7일) 동안 / 주문 상품(전체)</p>
		</div>
		<h1 class="title_con_Type01 marginleft_5 margintop_50">
			조회 및 처리
		</h1>
		<form id="frm" name="frm">
			<table class="join_form marginleft_5 margintop_5" style="width:99%;">
				<caption>정보입력</caption>
				<colgroup>
					<col width="20%">
					<col width="80%">
				</colgroup>
				<tbody>
					<tr>
						<th style="height: 50px;">
							기간조회
						</th>
						<td>
							<span class="inquiry">
								<input type="text" class="inquiry join_form_input02 " id="sDt" name="sDt"/>
							</span>
							<span>&nbsp;&nbsp;~&nbsp;&nbsp;</span>
							<span class="inquiry">
								<input type="text" class="join_form_input02 inquiry" id="eDt" name="eDt"/>
							</span>
						</td>
					</tr>
					<tr>
						<th style="height: 50px;">
							주문상태
						</th>
						<td>
							<span class="return_select2">
								<select id="sttus" name="sttus" class="">
									<option value="2" selected="selected">송장등록 대기</option>
								</select>
							</span>
							<span class="return_select2">
	                            <label class="spc_check" for="delayStatusD2">
	                            	<input name="delayStatus" id="delayStatusD2" type="checkbox" value="D2">
	                            	<i class="symbol"></i>송장등록 지연
	                            </label>
							</span>
						</td>
					</tr>
					<tr>
						<th style="height: 50px;">
							상세검색
						</th>
						<td>
							<input type="text" class="input_style04 margintop_5" id="sValue" name="sValue" placeholder="검색어"/>
						</td>
					</tr>
				</tbody>
			</table>	
		</form>
		<div class="margintop_10" style="padding-right:10px;text-align: right;">
			<span onclick="doAction('clear');"class="join_form_btn03">초기화</span> 
			<span onclick="doAction('search');" class="join_form_btn02 marginleft_5">검&nbsp;&nbsp;색</span>	
		</div>
		<h1 class="title_con_Type01 marginleft_5 margintop_30" style="margin-right:10px;">
			검색결과
			<span> 
				<span onclick="doAction('import');" class="sButton btn_span fs-13 blue marginleft_5" style="float: right;">송장양식 내려받기</span>
				<span onclick="doAction('export');" class="sButton btn_span fs-13 green marginleft_20" style="float: right;">송장 업로드</span>
				<span onclick="doAction('tmpInv');"  class="sButton btn_span fs-13 pink marginleft_5" style="float: right;">임시송장등록</span>
				<span onclick="doAction('invoice');"  class="sButton btn_span fs-13 pink marginleft_5" style="float: right;">송장등록</span>
				<span class="return_select2 marginleft_20" style="float: right;">
					<select id="dlvyCmp" name="dlvyCmp" class="">
						<option value="" selected="selected">택배사 선택</option>
						<c:forEach items="${comboList}" var="cb" varStatus="status">
							<option value="<c:out value="${cb.cbCode}"/>"><c:out value="${cb.cbText}"/></option>
						</c:forEach>
					</select>
				</span>
<!-- 				
				<span onclick="doAction('save');"  class="sButton btn_span fs-13 pink" style="float: right;">비고등록</span>
 -->				
		</span>
		</h1>
		<div class="col-sm-5 col-md-5 marginleft_5" style="height:410px;width:99%;">
		    <div id="ib-container1"></div>
		</div>
		<div class="signup_agree">
			<p class="alarm_txt">※ 주문번호의 <span class="redCr">모든 상품</span>에 대해 <span class="redCr">접수완료</span>상태일때 송장 등록이 가능 합니다.</p>
			<p class="alarm_txt margintop_5">※<span class="redCr">임시송장등록</span>기능은 송장번호 없이 발송처리 진행 하는 기능으로 해당 송장에 대한 변경은 진행관리자를 통해서만 가능 합니다.</p>
			<p class="alarm_txt margintop_5">※ <span class="redCr" >접수완료</span> 주문에 대해 주문 취소가 필요한 경우 진행관리자를 통해서만 취소 가능 합니다.</p>
		</div>
	</div>
