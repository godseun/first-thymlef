<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/layout/include/base.jsp" %>
	<script type="text/javascript">
		var dupClick1 = false;
		var dev = 1;
		var param;
		$(function(){  
			_BT.makeCalendar('sDt', 'yy-mm-dd'); 
			_BT.makeCalendar('eDt', 'yy-mm-dd'); 
			_BT.makeCalendar('tDt', 'yy-mm-dd'); 
			$('.dbCnt').on('click', function() {
				sAction = $(this).data('type');
				if(sAction == 'OR_1'||sAction == 'OR_O_1'){
					_BT.moveUrl(_BT.STORE.URL.Order.OrderMng);
					
				}else if(sAction == 'OR_2' || sAction == 'OR_O_2'){
					_BT.moveUrl(_BT.STORE.URL.Order.ReceiptMng);
					
				}else if(sAction == 'OR_3' || sAction == 'OR_4'){
					if(sAction == 'OR_3'){
						$('#sttus').val('3');
					}else if(sAction == 'OR_4'){
						$('#sttus').val('4');
					}
					doAction('search');
					
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
			$('#tDt').val($.datepicker.formatDate($.datepicker.ATOM, new Date()));
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
				,{'Header': '주문일',	'Type': 'Date',			'MinWidth': 70,		'SaveName': 'sMordrDt',	 	'Align': 'Center',	'Edit':0,	'Save': 0,	'Format':'YmdHm'}
				,{'Header': '주문번호',	'Type': 'Popup',		'MinWidth': 160,	'SaveName': 'sMordrId',		'Align': 'Center',	'Edit':1,	'Save': 0	, 	'ColMerge':1,		'ToolTip':1	}
				,{'Header': '주문금액',	'Type': 'Int',				'MinWidth': 50,		'SaveName': 'sMprice', 		'Align': 'Right',		'Edit':0,	'Save': 0,	'Format':'Integer'	}
				,{'Header': '배송비',	'Type': 'Int',				'MinWidth': 50,		'SaveName': 'sMdvFee', 	'Align': 'Right',		'Edit':0,	'Save': 0,	'Format':'Integer'	}
				,{'Header': '총금액',	'Type': 'AutoSum',		'MinWidth': 60,		'SaveName': 'sMsPrice',	 	'Align': 'Right',		'Edit':0,	'Save': 0,	'Format':'Integer'	}
			
				,{'Header': '품목수',	'Type': 'AutoSum',		'MinWidth': 50,		'SaveName': 'sMcntPrdt',	'Align': 'Right',		'Edit':0,	'Save': 0,	'Format':'Integer'	}
				,{'Header': '선택',		'Type': 'CheckBox', 	'MinWidth': 50, 	'SaveName': 'sCheckBox',	'Align': 'Center',	'Edit':1, 	'Save': 1	, 	'ColMerge':0	}
				,{'Header': '비고',		'Type': 'Text',			'MinWidth': 100,	'SaveName': 'sRMK',		 	'Align': 'Left',		'Edit':0,	'Save': 0, 	'Hidden':dev	}  
				,{'Header': '상태', 		'Type': 'Combo', 		'MinWidth': 60,		'SaveName': 'sDsttus', 		'Align': 'Center', 	'Edit':0,	'Save': 0,	'ComboText': '${sttus.cbText}', 'ComboCode': '${sttus.cbCode}', 	'ColMerge':0	}
				,{'Header': '접수일',	'Type': 'Date',			'MinWidth': 70,		'SaveName': 'sDreceiptDt',	'Align': 'Center',	'Edit':0,	'Save': 0,	'Format':'YmdHm'}
				,{'Header': '배송등록일','Type': 'Date',			'MinWidth': 70,		'SaveName': 'sDdelyDt', 	'Align': 'Center',	'Edit':0,	'Save': 0	,	'Format':'YmdHm'}
				,{'Header': '택배사', 	'Type': 'Combo',		'MinWidth': 80, 	'SaveName': 'sDdlvyCmp', 	'Align': 'Center',	'Edit':0,	'Save': 0, 	'ComboText': '|${delyCb.cbText}', 'ComboCode': '|${delyCb.cbCode}' }  
				,{'Header': '송장번호', 	'Type': 'Popup',		'MinWidth': 100, 	'SaveName': 'sDinvoice', 	'Align': 'Left',		'Edit':1,	'Save': 0, 	'ColMerge':0, 	'Format' : '###################' 	}
				,{'Header': '배송완료일','Type': 'Date',			'MinWidth': 70,		'SaveName': 'sDdelyCompDt', 	'Align': 'Center',	'Edit':0,	'Save': 0,	'Format':'YmdHm'}
				,{'Header': '구매확정일','Type': 'Date',			'MinWidth': 70,		'SaveName': 'sOrderCompDt', 	'Align': 'Center',	'Edit':0,	'Save': 0,	'Format':'YmdHm'}
				
				,{'Header': '품목코드',	'Type': 'Text',			'MinWidth': 80,		'SaveName': 'sDprdtCd', 	'Align': 'Center',	'Edit':0,	'Save': 0, 	'ColMerge':0	}
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
				,{'Header': '배송요구사항',	'Type': 'Text',		'MinWidth': 100,	'SaveName': 'sMrmk', 		'Align': 'Left',		'Edit':0,	'Save': 0		}
				,{'Header': '지연여부', 	'Type': 'Text', 			'MinWidth': 0, 		'SaveName': 'OR_O_2', 		'Align': 'Center',	'Edit':0,	'Save': 0, 	'Hidden':dev	}  
				,{'Header': '결제구분', 	'Type': 'Text', 			'MinWidth': 0, 		'SaveName': 'sPaym',			'Align': 'Center', 	'Edit':0,	'Save': 1,	'Hidden':dev	}  
				,{'Header': '비고내역', 	'Type': 'Text', 			'MinWidth': 0, 		'SaveName': 'sChk', 			'Align': 'Center', 	'Hidden':dev	}  
				,{'Header': '일련번호', 	'Type': 'Text', 			'MinWidth': 0, 		'SaveName': 'sDoId', 			'Align': 'Center', 	'Hidden':dev	}  
				
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
					mySheet1.DoSearch(_BT.STORE.URL.Search.SheetDlvyList, $('#frm').serialize()); 
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
			if(mySheet1.GetCellValue(row, 'sDsttus') != 3){
				mySheet1.InitCellProperty(row, 'sCheckBox', {Type:"CheckBox",Edit:0}); 
			}
			if (mySheet1.GetCellValue(row, 'OR_O_2') == 1) {
				mySheet1.SetCellFontColor(row, 'sDsttus', '#FF0000');
			}
			if(mySheet1.GetCellValue(row, 'sChk') != ''){
				mySheet1.SetCellFontColor(row, 'sMordrId', '#FF0000');
				mySheet1.SetCellFontBold(row, 'sMordrId', 1);
				mySheet1.SetToolTipText(row, 'sMordrId', mySheet1.GetCellValue(row, 'sChk') ); 
			}
		} 
		function mySheet1_OnPopupClick(Row,Col){
			var sSaveName = mySheet1.ColSaveName(0, Col); 
			if(sSaveName == 'sMordrId'){
				var ordrId = mySheet1.GetCellValue(Row,'sMordrId');
				_BT.openPopup( _BT.STORE.URL.Order.PopRmk+'?ordrId='+ordrId ,'PopRmk', '610', '500', true, true);
			}else if(sSaveName == 'sDinvoice'){
				var invoice = mySheet1.GetCellValue(Row,Col);
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
		function getParam(){
			return param;
		}
	</script>
	<div class="storeSection">
	 	<h1 class="title_Type03">
			배송진행관리
			<div class="sub_location">
				<div class="list_location01">
					<span class="txt01">고객만족 센터</span>
					<span class="arrow"><img src="${staticRoot}/img/bl_01.jpg" alt=">" /></span>
					<span class="last_txt">배송진행관리</span>
				</div>
			</div>
		</h1>
		<form id="popFrm" name="popFrm">
			<input id="t_code" name="t_code" type="hidden" />
			<input id="t_name" name="t_name" type="hidden" />
			<input id="t_invoice" name="t_invoice" type="hidden" />
			<input id="t_item" name="t_item" type="hidden" />
			<input id="t_idex" name="t_idex" type="hidden" />
		</form>
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
					<th>
						<h1>
							송장등록 대기
						</h1>
						<h2>
							<label class="dbCnt" data-type="OR_2"><c:out value="${dashBoard.ordrCnt.OR_2}"/>  건</label> 
							<span class="dbCnt" data-type="OR_O_2">지연 <label> <c:out value="${dashBoard.ordrCnt.OR_O_2}"/> </label>건</span>
						</h2>
					</th>
					<th class="OR_3 on">
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
							<input name="allSsttus" id="allSsttus" type="checkbox" value="A">
						</th>
						<td>
							<span class="inquiry">
								<input type="text" class="inquiry join_form_input02 " id="tDt" name="tDt" readonly="readonly"/>
							</span>
							<span class="c13_01_03_txt_01" style="margin-left:0px;">
								일&nbsp;&nbsp;&nbsp;&nbsp;배송처리건 전체 조회
							</span>
						</td>
					</tr>
					<tr>
						<th style="height: 50px;">
							주문일
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
									<option value="">전체</option>
									<option value="3" selected="selected">배송중</option>
									<option value="4">배송완료</option>
								</select>
							</span>
							<span class="return_select2">
	                            <label class="spc_check" for="delayStatusD2">
	                            	<input name="delayStatus" id="delayStatusD2" type="checkbox" value="9">
	                            	<i class="symbol"></i>구매확정건
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
				<span onclick="doAction('import');" class="sButton btn_span fs-13 blue marginleft_5" style="float: right;">내려받기</span>
				<span onclick="doAction('check');"  class="sButton btn_span fs-13 pink marginleft_20" style="float: right;">배송상태 확인요청</span>
			</span>
		</h1>
		<div class="col-sm-5 col-md-5 marginleft_5" style="height:410px;width:99%;">
		    <div id="ib-container1"></div>
		</div>
		<div class="signup_agree">
			<p class="alarm_txt">※ 해당 송장번호의 상세내역과 리스트상의 배송상태가 다를 경우 <span class="redCr bTxt">배송상태 확인요청</span>을 진행 하시기 바랍니다.</p>
			<p class="alarm_txt">  예) 송장의 상세 상태는 <span class="redCr bTxt">배송완료</span> 상태이나 리스트상에서는 <span class="redCr bTxt">배송중</span>일 경우.</p>
		</div>
	</div>
