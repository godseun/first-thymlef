<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/layout/include/base.jsp" %>
	<script type="text/javascript">
		var dupClick1 = false;
		var dev = 1;
		$(function(){  
			_BT.makeCalendar('sDt', 'yy-mm-dd'); 
			_BT.makeCalendar('eDt', 'yy-mm-dd'); 
			initDate();
			initSheet();
		});
		function initDate(){
			$('#sDt').val($.datepicker.formatDate($.datepicker.ATOM, new Date()));
			$('#eDt').val($.datepicker.formatDate($.datepicker.ATOM, new Date()));
		}
		function initSheet(){
			var initData = {};
			initData.Cfg = {
						        'AutoFitColWidth': 'search|resize|init|colhidden|rowtransaction'
						        ,'UseHeaderSortCancel' : 1
								,'MergeSheet' : 9 
				                ,'DeferredVScroll' : 1
				                ,'Page' : 1500
				                ,'AutoSumCalcMode':1
				                ,'SelectionSummary' : 'NotEmptyCell' 
								};
			initData.HeaderMode = {
			};
			initData.Cols = [
				{'Header': '번호',		'Type': 'Seq', 			'MinWidth': 50,		'SaveName': 'sSeq',			'Align': 'Center',	'Edit':0,	'Save': 0	, 	'ColMerge':0	}
				,{'Header': '구분',		'Type': 'Status',		'MinWidth': 50,		'SaveName': 'sStatus', 		'Align': 'Center',	'Edit':0,	'Save': 0,	'Hidden':dev, 	'ColMerge':0	}
				,{'Header': '주문번호',	'Type': 'Popup',		'MinWidth': 160,	'SaveName': 'sMordrId',		'Align': 'Center',	'Edit':1,	'Save': 0	, 	'ColMerge':1	}
				,{'Header': '주문자',	'Type': 'Text',			'MinWidth': 50,		'SaveName': 'sMordrUsr',	'Align': 'Center',	'Edit':0,	'Save': 0	, 	'ColMerge':1	}
				,{'Header': '주문자',	'Type': 'Text',			'MinWidth': 100,	'SaveName': 'sMusrPhone',	'Align': 'Center',	'Edit':0,	'Save': 0	, 	'ColMerge':1	}
				,{'Header': '주문금액',	'Type': 'AutoSum',		'MinWidth': 70,		'SaveName': 'sMprice', 		'Align': 'Right',		'Edit':0,	'Save': 0,	'Format':'Integer'	}
				,{'Header': '배송비',	'Type': 'AutoSum',		'MinWidth': 50,		'SaveName': 'sMdvFee', 	'Align': 'Right',		'Edit':0,	'Save': 0,	'Format':'Integer'	}
				,{'Header': '총금액',	'Type': 'AutoSum',		'MinWidth': 70,		'SaveName': 'sMsPrice',	 	'Align': 'Right',		'Edit':0,	'Save': 0,	'Format':'Integer'	}
				,{'Header': '품목수',	'Type': 'AutoSum',		'MinWidth': 50,		'SaveName': 'sMcntPrdt',	'Align': 'Right',		'Edit':0,	'Save': 0,	'Format':'Integer'	}
				,{'Header': '상태', 		'Type': 'Combo', 		'MinWidth': 70,		'SaveName': 'sDsttus', 		'Align': 'Center', 	'Edit':0,	'Save': 1,	'ComboText': '${sttus.cbText}', 'ComboCode': '${sttus.cbCode}', 	'ColMerge':0	}
				,{'Header': '비고',		'Type': 'Text',			'MinWidth': 50,		'SaveName': 'sRMK',		 	'Align': 'Left',		'Edit':0,	'Save': 0, 	'Hidden':dev	}  
				,{'Header': '주문일',	'Type': 'Date',			'MinWidth': 65,		'SaveName': 'sMordrDt',	 	'Align': 'Center',	'Edit':0,	'Save': 0,	'Format':'YmdHm'}
				,{'Header': '접수일',	'Type': 'Date',			'MinWidth': 65,		'SaveName': 'sDreceiptDt',	'Align': 'Center',	'Edit':0,	'Save': 0,	'Format':'YmdHm'}
				,{'Header': '배송등록일','Type': 'Date',			'MinWidth': 65,		'SaveName': 'sDdelyDt', 	'Align': 'Center',	'Edit':0,	'Save': 0	,	'Format':'YmdHm'}
				,{'Header': '배송완료일','Type': 'Date',			'MinWidth': 65,		'SaveName': 'sDdelyCompDt', 	'Align': 'Center',	'Edit':0,	'Save': 0,	'Format':'YmdHm'}
				,{'Header': '구매확정일','Type': 'Date',			'MinWidth': 65,		'SaveName': 'sOrderCompDt', 	'Align': 'Center',	'Edit':0,	'Save': 0,	'Format':'YmdHm'}
				,{'Header': '택배사', 	'Type': 'Combo',		'MinWidth': 80, 	'SaveName': 'sDdlvyCmp', 	'Align': 'Center',	'Edit':0,	'Save': 0, 	'ComboText': '|${delyCb.cbText}', 'ComboCode': '|${delyCb.cbCode}' }  
				,{'Header': '송장번호', 	'Type': 'Popup',		'MinWidth': 100, 	'SaveName': 'sDinvoice', 	'Align': 'Left',		'Edit':1,	'Save': 0, 	'ColMerge':0, 	'Format' : '###################' 	}
				,{'Header': '배송구분',	'Type': 'Combo',		'MinWidth': 60,		'SaveName': 'DLVY_TP', 	'Align': 'Center',	'Edit':0,	'Save': 0, 	'ColMerge':0, 	'ComboText': '착불|선불', 'ComboCode': 'C|T' }  
				,{'Header': '품목코드',	'Type': 'Text',			'MinWidth': 80,		'SaveName': 'sDprdtCd', 	'Align': 'Center',	'Edit':1,	'Save': 0, 	'ColMerge':0	}
				,{'Header': '재고정보',	'Type': 'Button',		'MinWidth': 80,		'SaveName': 'STOCK',		'Align': 'Center'	, 	'ColMerge':0, 	'DefaultValue':'재고확인' }
				,{'Header': '품명',		'Type': 'Text',			'MinWidth': 150,	'SaveName': 'sDprdtNm', 	'Align': 'Left',		'Edit':0,	'Save': 0	, 	'ColMerge':0	}
				,{'Header': '규격',		'Type': 'Text',			'MinWidth': 150,	'SaveName': 'sDstndrd', 	'Align': 'Left',		'Edit':0,	'Save': 0	, 	'ColMerge':0	}
				,{'Header': '제조사',	'Type': 'Text',			'MinWidth': 50,		'SaveName': 'sDmakrNm', 	'Align': 'Center',	'Edit':0,	'Save': 0, 	'ColMerge':0	}
				,{'Header': '판매가',	'Type': 'Int',				'MinWidth': 50,		'SaveName': 'sDtotPrice', 	'Align': 'Right',		'Edit':0,	'Save': 0,	'Format':'Integer', 	'ColMerge':0	}
				,{'Header': '수량',		'Type': 'Int',				'MinWidth': 50,		'SaveName': 'sDqy',		 	'Align': 'Right',		'Edit':0,	'Save': 0,	'Format':'Integer', 	'ColMerge':0	}
				,{'Header': '합계',		'Type': 'Int',				'MinWidth': 50,		'SaveName': 'sDsumPrice', 	'Align': 'Right',		'Edit':0,	'Save': 0,	'Format':'Integer', 	'ColMerge':0	}
				,{'Header': '배송지명',	'Type': 'Text',			'MinWidth': 50,		'SaveName': 'sMaddrNm', 	'Align': 'Center',	'Edit':0,	'Save': 0		}
				,{'Header': '받는사람',	'Type': 'Text',			'MinWidth': 50,		'SaveName': 'sMrecvNm', 	'Align': 'Center',	'Edit':0,	'Save': 0		}
				,{'Header': '우편번호',	'Type': 'Text',			'MinWidth': 60,		'SaveName': 'sMZipCode', 	'Align': 'Center',	'Edit':0,	'Save': 0		}
				,{'Header': '주소',		'Type': 'Text',			'MinWidth': 150,	'SaveName': 'sMaddr', 		'Align': 'Left',		'Edit':0,	'Save': 0		}
				,{'Header': '상세주소',	'Type': 'Text',			'MinWidth': 100,	'SaveName': 'sMaddrDtl', 	'Align': 'Left',		'Edit':0,	'Save': 0		}
				,{'Header': '전화번호',	'Type': 'Text',			'MinWidth': 80,		'SaveName': 'sMtel', 			'Align': 'Center',	'Edit':0,	'Save': 0		}
				,{'Header': '배송요구사항',	'Type': 'Text',		'MinWidth': 200,	'SaveName': 'sMrmk', 		'Align': 'Left',		'Edit':0,	'Save': 0		}
				,{'Header': '지연여부', 	'Type': 'Text', 			'MinWidth': 0, 		'SaveName': 'OR_O_2', 		'Align': 'Center',	'Edit':0,	'Save': 0, 	'Hidden':dev	}  
				,{'Header': '결제구분', 	'Type': 'Text', 			'MinWidth': 0, 		'SaveName': 'sPaym',			'Align': 'Center', 	'Edit':0,	'Save': 1,	'Hidden':dev	}  
				,{'Header': '비고내역', 	'Type': 'Int', 			'MinWidth': 0, 		'SaveName': 'sChk', 			'Align': 'Center', 	'Hidden':dev	}  
				,{'Header': '일련번호', 	'Type': 'Text', 			'MinWidth': 0, 		'SaveName': 'sDoId', 			'Align': 'Center', 	'Hidden':dev	}  
				
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
			
			// 사이즈 맞춤
			mySheet1.FitColWidth();
			
			// 써머리 관련
			mySheet1.SetCountPosition(3);
			mySheet1.SetSelectionSummaryInfoElement('');
		}		
		function doAction(sAction) { 
			switch(sAction) {  
				case 'search':            
					mySheet1.DoSearch(_BT.FRONT.URL.Search.SheetOrderAll, $('#frm').serialize()); 
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
			} 
		}
		function mySheet1_OnPopupClick(Row, Col){
			var sSaveName = mySheet1.ColSaveName(0, Col); 
			if(sSaveName == 'sMordrId'){
				var ordrId = mySheet1.GetCellValue(Row,'sMordrId');
				_BT.openPopup( _BT.FRONT.URL.Order.PopRmk+'?ordrId='+ordrId ,'PopRmk', '610', '500', true, true);
			}else if(sSaveName == 'sDinvoice'){
				var invoice = mySheet1.GetCellValue(Row,'sDinvoice');
				if(invoice != ''){
					$('#t_code').val(mySheet1.GetCellValue(Row,'sDdlvyCmp'));
					$('#t_name').val(mySheet1.GetCellText(Row,'sDdlvyCmp'));
					$('#t_invoice').val(invoice);
					$('#t_item').val(mySheet1.GetCellValue(Row,'sDprdtNm'));
					$('#t_idex').val(mySheet1.GetCellValue(Row,'sMordrId'));
					_BT.openPopup( '','fnMngAddr', '610', '700', true, true);
					$('#popFrm').attr('method', 'POST').attr('target', 'fnMngAddr').attr('action', _BT.SHOP.URL.Order.PopTrace).submit();				
				}else{
					alert('배송정보 등록 전 입니다.');
					return false;
				}
			}
		}	
		function mySheet1_OnRowSearchEnd (row) { 
			if(mySheet1.GetCellValue(row, 'sChk') > 0){
				mySheet1.SetCellFontColor(row, 'sMordrId', '#FF0000');
				mySheet1.SetCellFontBold(row, 'sMordrId', 1);
			}
			if(mySheet1.GetCellValue(row, 'sRMK') == 'HL'){
				mySheet1.SetRowBackColor(row, "#ffc600"); 
			}
		} 
		function mySheet1_OnDblClick(Row, Col, Value, CellX, CellY, CellW, CellH) { 
			if (Row == 0) return; //헤더행일때는 폼에 반영 안함.
			var sSaveName = mySheet1.ColSaveName(0, Col); 
			if(sSaveName == 'sMusrPhone'){
				var mobile = mySheet1.GetCellValue(Row,'sMusrPhone');
				_BT.openPopup( _BT.FRONT.URL.Common.PopSms+'?mobile='+mobile,'PopSms', '800', '810', true, true);
			}
		}

		function mySheet1_OnButtonClick(Row, Col) {
			var sSaveName = mySheet1.ColSaveName(0, Col); 
			if(sSaveName == 'STOCK'){
				var code = mySheet1.GetCellValue( Row, 'sDprdtCd' );
				var supply = 'CR';
				if(code.substring(0,3) == 'ST2')
					supply = 'KB';
				else if(code.substring(0,3) == 'ST3')
					supply = 'DS';
				
				$('#CODE').val(code);
				$('#SUPPLY').val(supply);
				$('#NAME').val(mySheet1.GetCellValue( Row, 'sDprdtNm' ));
				$('#STNDRD').val(mySheet1.GetCellValue( Row, 'sDstndrd' ));
				$('#MAKER').val(mySheet1.GetCellValue( Row, 'sDmakrNm' ));
				_BT.openPopup( '','stockPop', '1270', '800', true, true);
				$('#stockFrm').attr('method', 'POST').attr('target', 'stockPop').attr('action', _BT.FRONT.URL.Common.PopPwS).submit();	
			} 
		} 
	</script>
	<div class="main_content06" style="padding-top: 0px; min-height: 800px; margin-bottom: 20px;">
		<form id="stockFrm" name="stockFrm" style="display: none;">
			<input type="hidden" id="CODE" name="CODE" value=""/>
			<input type="hidden" id="NAME" name="NAME" value=""/>
			<input type="hidden" id="STNDRD" name="STNDRD" value=""/>
			<input type="hidden" id="MAKER" name="MAKER" value=""/>
			<input type="hidden" id="SUPPLY" name="SUPPLY" value=""/>
		</form>
		<form id="popFrm" name="popFrm">
			<input id="t_code" name="t_code" type="hidden" />
			<input id="t_name" name="t_name" type="hidden" />
			<input id="t_invoice" name="t_invoice" type="hidden" />
			<input id="t_item" name="t_item" type="hidden" />
			<input id="t_idex" name="t_idex" type="hidden" />
		</form>
		<table class="layout_tbl" >
			<caption>대쉬보드</caption>
			<colgroup>
				<col width="33%">
				<col width="33%">
				<col width="33%">
			</colgroup>
			<tbody>
				<tr>
					<th>
						<table class="store_tbl">
							<caption>대쉬보드</caption>
							<colgroup>
								<col width="*%">
								<col width="*%">
								<col width="*%">
							</colgroup>
							<tbody>
								<tr>
									<th colspan="3">
										<h1>
											주문 / 배송 현황
										</h1>
										<span>
											최근 일주일 기준
										</span>
									</th>
								</tr>
								<tr>
									<td style="text-align: left;"> 
										총 주문
									</td>
									<td>  
										<span class="a1"><c:out value="${dashBoard.T_OR}"/> 건</span>
									</td>
									<td> 
										<span class="a1"><c:out value="${dashBoard.T_OR_ITEM}"/> 품목</span>
									</td>
								</tr>
								<tr>
									<td style="text-align: left;"> 
										미확인 주문
									</td>
									<td>  
										<span class="a1"><c:out value="${dashBoard.OR_1}"/> 건</span>
									</td>
									<td> 
										<span class="a2">지연 <c:out value="${dashBoard.OR_O_1}"/> 건</span>
									</td>
								</tr>
								<tr>
									<td style="text-align: left;"> 
										송장등록 대기
									</td>
									<td>  
										<span class="a1"><c:out value="${dashBoard.OR_2}"/> 건</span>
									</td>
									<td> 
										<span class="a2">지연 <c:out value="${dashBoard.OR_O_2}"/> 건</span>
									</td>
								</tr>
								<tr>
									<td style="text-align: left;"> 
										배송중
									</td>
									<td>  
										<span class="a1"><c:out value="${dashBoard.OR_3}"/> 건</span>
									</td> 
									<td> 
										<span class="a2">상태체크 <c:out value="${dashBoard.OR_C_3}"/> 건</span>
									</td>
								</tr>
								<tr>
									<td style="text-align: left;"> 
										배송중
									</td>
									<td>  
										<span class="a1">송장번호 없음</span>
									</td> 
									<td>  
										<span class="a1"><c:out value="${dashBoard.OR_O_3}"/> 건</span>
									</td> 
								</tr>
								<tr>
									<td style="text-align: left;"> 
										배송완료
									</td>
									<td>  
										<span class="a1"><c:out value="${dashBoard.OR_4}"/> 건</span>
									</td> 
									<td> 
										<span class="a1">구매확정 <c:out value="${dashBoard.OR_O_4}"/> 건</span>
									</td>
								</tr>
								<tr style="height: 100%;">
									<td colspan="3"> 
										  &nbsp;
									</td> 
								</tr>
							</tbody>
						</table>
					</th>
					<th>
						<table class="store_tbl">
							<caption>대쉬보드</caption>
							<colgroup>
								<col width="*%">
								<col width="*%">
								<col width="*%">
							</colgroup>
							<tbody>
							<tbody>
								<tr>
									<th colspan="3">
										<h1>
											판매,구매  취소 / 반품 현황
										</h1>
										<span>
											최근 일주일 기준
										</span>
									</th>
								</tr>
								<tr>
									<td style="text-align: left;"> 
										구매취소
									</td>
									<td colspan="2">  
										<span class="a1">0 건</span>
									</td> 
								</tr>
								<tr>
									<td style="text-align: left;"> 
										판매취소
									</td>
									<td>  
										<span class="a2">요청 <c:out value="${dashBoard.OR_71}"/> 건</span>
									</td>
									<td> 
										<span class="a1">완료 <c:out value="${dashBoard.OR_7}"/> 건</span>
									</td>
								</tr>
								<tr>
									<td style="text-align: left;"> 
										반품
									</td>
									<td>  
										<span class="a2">요청 <c:out value="${dashBoard.OR_51}"/> 건</span>
									</td>
									<td> 
										<span class="a1">완료 <c:out value="${dashBoard.OR_5}"/> 건</span>
									</td>
								</tr>
								<tr>
									<td style="text-align: left;"> 
										반품배송
									</td>
									<td>  
										<span class="a2">배송 미등록 <c:out value="${dashBoard.OR_52}"/> 건</span>
									</td>
									<td> 
										<span class="a2">배송완료 <c:out value="${dashBoard.OR_C_52}"/> 건</span>
									</td>
								</tr>
								<tr style="height: 100%;">
									<td colspan="3"> 
										  &nbsp;
									</td> 
								</tr>
							</tbody>
						</table>
					</th>
					<th>
						<table class="store_tbl">
							<caption>정보입력</caption>
							<colgroup>
								<col width="*%">
								<col width="*%">
								<col width="*%">
							</colgroup>
							<tbody>
							<tbody>
								<tr>
									<th colspan="3">
										<h1>
											에스크로 현황
										</h1>
										<span>
											최근 일주일 기준
										</span>
									</th>
								</tr>
								<tr>
									<td style="text-align: left;"> 
										에스크로 배송
									</td>
									<td colspan="2">  
										<span class="a1"><c:out value="${dashBoard.E_3}"/> 건</span>
									</td>
								</tr>
								<tr>
									<td style="text-align: left;"> 
										배송중
									</td>
									<td colspan="2">  
										<span class="a2">배송정보 미전송 <c:out value="${dashBoard.E_O_3}"/> 건</span>
									</td> 
								</tr>
								<tr>
									<td style="text-align: left;"> 
										배송완료
									</td>
									<td>  
										<span class="a1"><c:out value="${dashBoard.E_S_4 + dashBoard.E_C_5 + dashBoard.E_C_9}"/> 건</span>
									</td>
									<td>  
										<span class="a2">구매거절 확인 <c:out value="${dashBoard.E_C_5}"/> 건</span>
									</td> 
								</tr>
								<tr>
									<td style="text-align: left;"> 
										구매확정
									</td>
									<td colspan="2">  
										<span class="a1"> <c:out value="${dashBoard.E_C_9}"/> 건</span>
									</td> 
								</tr>
							</tbody>
						</table>
					</th>
				</tr>
			</tbody>
		</table>	
		<form id="frm" name="frm">
			<input type="hidden" id="jobTp" name="jobTp" value="orderMng"/>	
			<div class="margintop_20" style=" padding-left: 10px;">
				<table class="tbl_Type09" style="width: 99%;">
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
										<option value="1">주문완료</option>
										<option value="2">배송준비중</option> 
										<option value="3">배송중</option> 
										<option value="4">배송완료</option> 
										<option value="51">반품신청</option> 
										<option value="52">반품승인</option> 
										<option value="53">반품배송중</option> 
										<option value="5">반품완료</option> 
										<option value="71">판매취소요청</option> 
										<option value="7">판매취소</option> 
										<option value="8">주문취소</option> 
										<option value="9">구매확정</option> 
									</select>
								</span>		
								<input class="input_style20 marginleft_5" style="width:200px;" type="text" id="mValue" name="mValue" placeholder="통합검색"/>							
								<span class="inquiry_btn marginleft_7">
									<span onclick="doAction('search');" class="sButton btn_span fs-13 blue" style="float: right;">조회</span>
								</span>
							</td>
						</tr>
					</tbody>
				</table>	
			</div>
		</form>			
		<div class="col-sm-5 col-md-5 marginleft_10 margintop_20" style="height:510px;width:98%;">
		    <div id="ib-container1"></div>
		</div>
	</div>
	
