<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/layout/include/base.jsp" %>
	<script type="text/javascript">
		var dupClick1 = false;
		var dev = 1;
		$(function(){
			_BT.makeCalendar('sDt', 'yy-mm-dd'); 
			_BT.makeCalendar('eDt', 'yy-mm-dd'); 
			_BT.makeCalendar('tDt', 'yy-mm-dd'); 
			$('.dbCnt').on('click', function() {
				sAction = $(this).data('type');
				if(sAction == 'OR_1'||sAction == 'OR_O_1'){
					$('#sDt').val(_BT.dateAdd($.datepicker.formatDate($.datepicker.ATOM, new Date()),-7,'d'));	
					$('#sttus').val('1');
					$('#delayStatusD1').prop('checked', false);
					if(sAction == 'OR_O_1')
						$('#delayStatusD1').prop('checked', true);
					doAction('search');
				}else if(sAction == 'OR_2' || sAction == 'OR_O_2'){
					_BT.moveUrl(_BT.STORE.URL.Order.ReceiptMng);
					
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
			$('#tDt').val($.datepicker.formatDate($.datepicker.ATOM, new Date()));
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
				                ,'SelectionSummary': 'NotEmptyCell' 
								};
			initData.HeaderMode = {
			};
			initData.Cols = [
				{'Header': '번호',		'Type': 'Seq', 			'MinWidth': 50,		'SaveName': 'sSeq',				'Align': 'Center',	'Edit':0,	'Save': 0	, 	'ColMerge':0	}
				,{'Header': '구분',		'Type': 'Status',		'MinWidth': 50,		'SaveName': 'sStatus', 			'Align': 'Center',	'Edit':0,	'Save': 0,	'Hidden':dev, 	'ColMerge':0	}
				,{'Header': '주문일',	'Type': 'Date',			'MinWidth': 65,		'SaveName': 'sMordrDt',	 		'Align': 'Center',	'Edit':0,	'Save': 0,	'Format':'YmdHm'}
				,{'Header': '주문자',	'Type': 'Text',			'MinWidth': 70,		'SaveName': 'sMordrUsr',		'Align': 'Center',	'Edit':0,	'Save': 0	, 	'ColMerge':1	}
				,{'Header': '주문번호',	'Type': 'Popup',		'MinWidth': 160,	'SaveName': 'sMordrId',			'Align': 'Center',	'Edit':1,	'Save': 0	, 	'ColMerge':1,	'ToolTip':1	}
				,{'Header': '비고',	 	'Type': 'Text', 			'MinWidth': 20,		'SaveName': 'sChk', 				'Align': 'Center',	'Edit':0,	'Save': 0,	'Hidden':dev	}
				,{'Header': '주문금액',	'Type': 'Int',				'MinWidth': 50,		'SaveName': 'sMprice', 			'Align': 'Right',		'Edit':0,	'Save': 0,	'Format':'Integer'	}
				,{'Header': '배송비',	'Type': 'Int',				'MinWidth': 50,		'SaveName': 'sMdvFee', 		'Align': 'Right',		'Edit':0,	'Save': 0,	'Format':'Integer'	}
				,{'Header': '총금액',	'Type': 'AutoSum',		'MinWidth': 60,		'SaveName': 'sMsPrice',	 		'Align': 'Right',		'Edit':0,	'Save': 0,	'Format':'Integer'	}
				,{'Header': '품목수',	'Type': 'AutoSum',		'MinWidth': 50,		'SaveName': 'sMcntPrdt',		'Align': 'Right',		'Edit':0,	'Save': 0,	'Format':'Integer'	}
				,{'Header': '상태', 		'Type': 'Combo', 		'MinWidth': 60,		'SaveName': 'sDsttus', 			'Align': 'Center', 	'Edit':0,	'Save': 0,	'ComboText': '${sttus.cbText}', 'ComboCode': '${sttus.cbCode}', 	'ColMerge':0	}
				,{'Header': '선택',		'Type': 'CheckBox', 	'MinWidth': 50, 	'SaveName': 'sCheckBox',		'Align': 'Center',	'Edit':1, 	'Save': 0	, 	'ColMerge':0	}
				,{'Header': '배송구분',	'Type': 'Combo',		'MinWidth': 60,		'SaveName': 'DLVY_TP', 	'Align': 'Center',	'Edit':0,	'Save': 0, 	'ColMerge':0, 	'ComboText': '착불|선불', 'ComboCode': 'C|T' }  
				,{'Header': '비고',		'Type': 'Text',			'MinWidth': 100,	'SaveName': 'sRMK',		 		'Align': 'Left',		'Edit':0,	'Save': 0,	'Hidden':dev,			'ColMerge':0	}
				,{'Header': '판매가',	'Type': 'Int',				'MinWidth': 50,		'SaveName': 'sDtotPrice', 		'Align': 'Right',		'Edit':0,	'Save': 0,	'Format':'Integer', 	'ColMerge':0	}
				<c:if test="${userSession.storeId eq '40000001'}">
					,{'Header': '대화매입가','Type': 'Int',			'MinWidth': 50,		'SaveName': 'sDpurPrice', 	'Align': 'Right',		'Edit':0,	'Save': 0,	'Format':'Integer', 	'ColMerge':0	}
					,{'Header': '배송지구분','Type': 'Combo',		'MinWidth': 50,		'SaveName': 'sZoneTp',	 		'Align': 'Center',	'Edit':0,	'Save': 0,	'ComboText': '일반지역|도서산간|제주지역',		'ComboCode': '0|1|2'	, 	'ColMerge':0	}
				</c:if>
				,{'Header': '수량',		'Type': 'Int',				'MinWidth': 50,		'SaveName': 'sDqy',		 		'Align': 'Right',		'Edit':0,	'Save': 0,	'Format':'Integer', 	'ColMerge':0	}
				,{'Header': '합계',		'Type': 'Int',				'MinWidth': 50,		'SaveName': 'sDsumPrice', 		'Align': 'Right',		'Edit':0,	'Save': 0,	'Format':'Integer', 	'ColMerge':0	}
				,{'Header': '품명',		'Type': 'Text',			'MinWidth': 150,	'SaveName': 'sDprdtNm', 		'Align': 'Left',		'Edit':0,	'Save': 0	, 	'ColMerge':0	}
				,{'Header': '규격',		'Type': 'Text',			'MinWidth': 150,	'SaveName': 'sDstndrd', 		'Align': 'Left',		'Edit':0,	'Save': 0	, 	'ColMerge':0	}
				,{'Header': '제조사',	'Type': 'Text',			'MinWidth': 50,		'SaveName': 'sDmakrNm', 		'Align': 'Center',	'Edit':0,	'Save': 0, 	'ColMerge':0	}
				,{'Header': '품목코드',	'Type': 'Text',			'MinWidth': 80,		'SaveName': 'sDprdtCd', 		'Align': 'Center',	'Edit':0,	'Save': 0, 	'ColMerge':0	}
				,{'Header': '지연여부', 	'Type': 'Text', 			'MinWidth': 0, 		'SaveName': 'OR_O_1', 			'Align': 'Center',	'Edit':0,	'Save': 0, 	'Hidden':dev	}  
				,{'Header': '일련번호', 	'Type': 'Text', 			'MinWidth': 0, 		'SaveName': 'sDoId', 				'Align': 'Center', 	'Hidden':dev	}  
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
					mySheet1.DoSearch(_BT.STORE.URL.Search.SheetOrderList, $('#frm').serialize()); 
					break; 
					
				case 'import':     
					var cnt = mySheet1.RowCount();
			        var t = new Date();
			        var yymmdd = t.getFullYear() + '-' + AddZero(t.getMonth() + 1) + '-' + AddZero(t.getDate()); 
			        var printTime = yymmdd + '   ' + AddZero(t.getHours()) + ':' + AddZero(t.getMinutes());
			        var title = '[주문 리스트] ';
			        title += '주문기간 : ' + $('#sDt').val() + ' ~ ' + $('#eDt').val();
			        title += '[ ' + mySheet1.RowCount() + ' ]건, 출력시간 : ' + printTime + '\r\n\r\n';
					var params = {
			            'FileName': '주문리스트_'+yymmdd+'.xlsx',
			            'SheetName': 'Sheet1',
			            'SheetDesign': 1,
			            'Merge': 0,
			            'TitleText': title,
			            'UserMerge': '0,0,2,24',
			            'CheckBoxOnValue': 'Y',
			            'CheckBoxOffValue': 'N'
			        };
					mySheet1.Down2Excel(params);
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
					
				case 'accept':          
					var alerted = false;
					var sRow = mySheet1.FindCheckedRow('sCheckBox').split('|');
					if(sRow == ''){alert('접수하실 주문건을 선택해 주세요.');return false;}
					for(var i=0; i < sRow.length; i++){
						if(mySheet1.GetCellValue(sRow[i], 'sDsttus') != '1'){
							mySheet1.SetCellValue(sRow[i], 'sCheckBox', 0);
							alerted = true;
						}
					}
					if(alerted) alert('상태가 미확인 상태인 주문건만 주문접수 가능 합니다.');
					if(!confirm('주문접수 후에는 판매취소가 불가 합니다.\n\n주문 접수 하시겠습니까?')) return false;

					var opt = {UrlEncode:0, Mode:2, Delim:'#'};
					var SaveStr = mySheet1.GetSaveString(opt); 
					if('' == SaveStr){
						alert('접수하실 주문건을 선택해 주세요.'); 
						return false;
					}else if('KeyFieldError' == SaveStr){ 
						return false;
					}else{
						var rtnData = mySheet1.GetSaveData(_BT.STORE.URL.Order.OrderAccept, SaveStr); 
						mySheet1.LoadSaveData(rtnData);
					}
					break; 

				case 'refusal':     
					var alerted = false;
					var sRow 	= mySheet1.FindCheckedRow('sCheckBox').split('|');
					if(sRow == ''){alert('주문취소 요청 하실 주문건을 선택해 주세요.');return false;}
					var oCnt 	= 0;
					var ordrId 	= '';
					for(var i=0; i < sRow.length; i++){
						if(mySheet1.GetCellValue(sRow[i], 'sMordrId') != ordrId){
							ordrId = mySheet1.GetCellValue(sRow[i], 'sMordrId');
							oCnt++;
						}
						if(mySheet1.GetCellValue(sRow[i], 'sDsttus') != '1'){
							mySheet1.SetCellValue(sRow[i], 'sCheckBox', 0);
							alerted = true;
						}
					}
					if(oCnt > 1){alert('동일한 주문번호에 한해서 주문취소 요청이 가능 합니다.');return false;}
					if(alerted) alert('상태가 미확인 상태인 주문건만 주문취소 요청이 가능 합니다.');
					var opt = {UrlEncode:0, Mode:2, Delim:'#'};
					var SaveStr = mySheet1.GetSaveString(opt); 
					if('' == SaveStr){
						alert('주문취소 요청 하실 주문건을 선택해 주세요.'); 
						return false;
					}else if('KeyFieldError' == SaveStr){ 
						return false;
					}else{
						_BT.openPopup('','PopOrderRefusal', '610', '700', true, true);
						$('#SaveStr').val(SaveStr);
						$('#ordrId').val(ordrId);
						$('#orFrm').attr('method', 'POST').attr('target', 'PopOrderRefusal').attr('action', _BT.STORE.URL.Order.OrderRefusal).submit();
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
			if(mySheet1.GetCellValue(row, 'sDsttus') == 2){
				mySheet1.InitCellProperty(row, 'sCheckBox', {Type:"CheckBox",Edit:0}); 
			}
			if (mySheet1.GetCellValue(row, 'OR_O_1') == 1) {
				mySheet1.SetCellFontColor(row, 'sDsttus', '#FF0000');
			}
			if(mySheet1.GetCellValue(row, 'sChk') != ''){
				mySheet1.SetCellFontColor(row, 'sMordrId', '#FF0000');
				mySheet1.SetCellFontBold(row, 'sMordrId', 1);
				mySheet1.SetToolTipText(row, 'sMordrId', mySheet1.GetCellValue(row, 'sChk') ); 
			}
			if(mySheet1.GetCellValue(row, 'sRMK') == 'HL'){
				mySheet1.SetRowBackColor(row, "#ffc600"); 
			}
		} 
		function mySheet1_OnPopupClick(Row, Col){
			var sSaveName = mySheet1.ColSaveName(0, Col); 
			var ordrId = mySheet1.GetCellValue(Row,'sMordrId');
			if(sSaveName == 'sMordrId'){
				_BT.openPopup( _BT.STORE.URL.Order.PopRmk+'?ordrId='+ordrId ,'PopRmk', '610', '500', true, true);
			}
		}
	</script>
	<div class="storeSection">
	 	<h1 class="title_Type03">
			주문관리
			<div class="sub_location">
				<div class="list_location01">
					<span class="txt01">고객만족 센터</span>
					<span class="arrow"><img src="${staticRoot}/img/bl_01.jpg" alt=">" /></span>
					<span class="last_txt">주문관리</span>
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
					<th class="on">
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
			<p class="alarm_txt">※ 집계 조건 : 최근 1주일(7일) 동안 / 주문 상품(전체)</p>
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
								일&nbsp;&nbsp;&nbsp;&nbsp;주문건 전체 조회
							</span>
						</td>
					</tr>
					<tr>
						<th style="height: 50px;">
							주문일
						</th>
						<td>
							<span class="inquiry">
								<input type="text" class="inquiry join_form_input02 " id="sDt" name="sDt" readonly="readonly"/>
							</span>
							<span>&nbsp;&nbsp;~&nbsp;&nbsp;</span>
							<span class="inquiry">
								<input type="text" class="join_form_input02 inquiry" id="eDt" name="eDt" readonly="readonly"/>
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
									<option value="1" selected="selected">미확인 주문</option>
								</select>
							</span>
							<span class="return_select2">
	                            <label class="spc_check" for="delayStatusD1">
	                            	<input name="delayStatus" id="delayStatusD1" type="checkbox" value="D1">
	                            	<i class="symbol"></i>주문확인 지연
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
				<span onclick="doAction('refusal');" class="sButton btn_span fs-13 green marginleft_5" style="float: right;">판매취소 요청</span>
				<span onclick="doAction('accept');"  class="sButton btn_span fs-13 pink marginleft_20" style="float: right;">주문접수</span>
<!-- 		
				<span onclick="doAction('save');"  class="sButton btn_span fs-13 pink" style="float: right;">비고등록</span>
 -->		
			</span>
		</h1>
		<div class="col-sm-5 col-md-5 marginleft_5" style="height:410px;width:99%;">
		    <div id="ib-container1"></div>
		</div>
		<div class="signup_agree">
			<p class="alarm_txt">※ <span class="redCr " >주문접수</span> 후 에는 <span class="redCr " >판매취소</span> 가 <span class="redCr " >불가</span> 합니다.</p>
		</div>
	</div>
