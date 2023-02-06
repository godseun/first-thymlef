<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/layout/include/base.jsp" %>
	<script type="text/javascript">
		var dupClick1 = false;
		var dev = 1;
		var rowNum = 0;
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
			_BT.Reg.Number("number");
			$('.dbCnt').on('click', function() {
				$('#sDt').val(_BT.dateAdd($.datepicker.formatDate($.datepicker.ATOM, new Date()),-31,'d'));	
				$('#eDt').val($.datepicker.formatDate($.datepicker.ATOM, new Date()));
				$('#sBbsId').val( $(this).data('type') );
				$('#isNoAns').val( 'Y' );
				doAction('search', '1') 
			});
			initSheet();
			initDate();
		});
		function initDate(){
			var d = new Date();
			$('#sDt, #eDt').val($.datepicker.formatDate($.datepicker.ATOM, d));
			if(d.getMonth() + 1 < 10)
				$('#mon').val('0'+(d.getMonth() + 1));
			else
				$('#mon').val(d.getMonth() + 1);
			
			$('#year').val(d.getFullYear());
		}
		function initSheet(){
			var initData = {};
			initData.Cfg = {
						   		    'AutoFitColWidth': 'search|resize|init|colhidden|rowtransaction'
							        ,'UseHeaderSortCancel' : 1
									,'MouseHoverMode': 0
									,'MergeSheet': msHeaderOnly  
									};
			initData.HeaderMode = {};
			
			initData.Cols = [
				{'Header': '구분',		'Type': 'Status',		'MinWidth': 50,		'SaveName': 'sStatus', 		'Align': 'Center',	'Edit':0,	'Save': 0,	'Hidden':dev	}
				,{'Header': '번호',		'Type': 'Seq', 			'MinWidth': 50,		'SaveName': 'sSeq',			'Align': 'Center',	'Edit':0,	'Save': 1		}
				,{'Header': '일련번호',	'Type': 'Text',			'MinWidth': 50,		'SaveName': 'NUM', 			'Align': 'Center',	'Edit':0,	'Save': 0,	'Hidden':dev	}
				,{'Header': '전송구분',	'Type': 'Text',			'MinWidth': 50,		'SaveName': 'MSGTP',		'Align': 'Center',	'Edit':0,	'Save': 1		}
				,{'Header': '전송일',	'Type': 'Date',			'MinWidth': 80,		'SaveName': 'SDTTM',		'Align': 'Center',	'Edit':0,	'Save': 0	,	'Format':'YmdHms'		}
				,{'Header': '번호',		'Type': 'Text',			'MinWidth': 80,		'SaveName': 'MOBILE', 		'Align': 'Center',	'Edit':0,	'Save': 0		}
				,{'Header': '전송결과',	'Type': 'Combo', 		'MinWidth': 50, 	'SaveName': 'RCD',			'Align': 'Center',	'Edit':0,	'Save': 0,	'ComboText': '${sttus.cbText}', 'ComboCode': '${sttus.cbCode}'	}
				,{'Header': '내용',		'Type': 'Text', 			'MinWidth': 300, 	'SaveName': 'MSG',	 		'Align': 'Left',		'Edit':0,	'Save': 0	,	'MultiLineText': 1,	'ToolTip':1	}
				];			
			
			var container1 = $('#ib-container1')[0];
			createIBSheet2(container1, 'mySheet1', '100%', '550px');
			
			// IBSheet 초기화
			IBS_InitSheet(mySheet1, initData);	

			mySheet1.ShowGroupRow('', '{%s} <font color="gray">({%c}건)</font>'); 
			
			//건수 정보 표시
			mySheet1.SetCountPosition(4);

			//마우스오버
			mySheet1.SetMouseHoverMode(2) 
			
			// 편집 가능 여부 설정
			mySheet1.SetEditable(true);
			
			// 사이즈 맞춤
			mySheet1.FitColWidth();
		}	
		function doAction(sAction, tar) { 
			switch(sAction) {     
			case 'search':            
				mySheet1.DoSearch(_BT.FRONT.URL.Search.SheetSmsList, $('#sheetFrm').serialize()); 
				break;    
			} 
		} 		
		function mySheet1_OnPopupClick(Row,Col){
			var prdtCd = mySheet1.GetCellValue(Row,Col);
			if(prdtCd != ''){
				$('#pCode').val(prdtCd);			
				_BT.openPopup('','PopPrdtInfo', '1010', '550', true, true);
				$('#tmpFrm').attr('method', 'POST').attr('target', 'PopPrdtInfo').attr('action', _BT.FRONT.URL.Search.PopPrdtInfo).submit();
			}
		}
		function mySheet1_OnRowSearchEnd (row) { 
			if (
					mySheet1.GetCellValue(row, 'RCD') != '06'
				&&	mySheet1.GetCellValue(row, 'RCD') != '1000'
			) {
				mySheet1.SetRowBackColor(row, "#ffc600"); 
			}
		} 
		function mySheet1_OnDblClick(Row, Col, Value, CellX, CellY, CellW, CellH) { 
			if (Row == 0) return; //헤더행일때는 폼에 반영 안함.
			rowNum = Row;
			var mobile = mySheet1.GetCellValue(Row,'MOBILE');
			_BT.openPopup( _BT.FRONT.URL.Common.PopSms+'?openTp=1&mobile='+mobile,'PopSms', '800', '810', true, true);
		}
		function getMsg(){
			var msg = mySheet1.GetCellValue(rowNum,'MSG');
			var newMsg  = msg.replace('[대화 고객만족센타 입니다]','').replace('[대화]','');
			return newMsg
		}
		
	</script>
	<div class="main_content06" style="padding-top: 0px; min-height: 800px; margin-bottom: 20px;">
		<div >
			<form id="sheetFrm" name="sheetFrm">
				<input type="hidden" id="year" name="year"/>
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
								<span class="c13_01_03_txt_01" style="margin-left: 5px;">
									발송일
								</span>
								<span class="return_select5">
									<select id="mon" name="mon" class="">
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
								<span class="inquiry">
									<input type="text" class="inquiry join_form_input02 " id="sDt" name="sDt"/>
								</span>
								<span>&nbsp;&nbsp;~&nbsp;&nbsp;</span>
								<span class="inquiry">
									<input type="text" class="join_form_input02 inquiry" id="eDt" name="eDt"/>
								</span>
								<span class="c13_01_03_txt_01">
									구분
								</span>
								<span class="return_select5">
									<select id="msgTp" name="msgTp" class="">
										<option value="">전체</option>
										<option value="SMS">SMS</option>
										<option value="LMS">LMS</option>
									</select>
								</span>		
								<span class="c13_01_03_txt_01">
									전송
								</span>
								<span class="return_select5">
									<select id="sendTp" name="sendTp" class="">
										<option value="">전체</option>
										<option value="Y">성공</option>
										<option value="N">실패</option>
									</select>
								</span>	
								<span class="c13_01_03_txt_01">
									연락처
								</span>
								<input type="text" id="mobile" name="mobile" class="input_style08 number" placeholder="휴대폰 번호">	
								<span class="inquiry_btn1 marginleft_5">
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
		<form id="tmpFrm" name="tmpFrm">
			<input type="hidden" id="pCode" name="pCode">
			<input type="hidden" id="PRDT_TP" name="PRDT_TP" value="J">
		</form>
	</div>
