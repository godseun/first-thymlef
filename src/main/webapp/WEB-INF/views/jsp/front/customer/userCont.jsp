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
			$('#sDt').val(_BT.dateAdd($.datepicker.formatDate($.datepicker.ATOM, new Date()),-7,'d'));	
			$('#eDt').val($.datepicker.formatDate($.datepicker.ATOM, new Date()));
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
				{'Header': '번호',			'Type': 'Seq', 			'MinWidth': 50,		'SaveName': 'sSeq',		'Align': 'Center',	'Edit':0,	'Save': 0	, 	'ColMerge':0	}
				,{'Header': '지연',			'Type': 'Text',			'MinWidth': 50,		'SaveName': 'sIsOver', 	'Align': 'Center',	'Edit':0,	'Save': 0,	'Hidden':dev, 	'ColMerge':0	}
				,{'Header': '구분',			'Type': 'Status',		'MinWidth': 50,		'SaveName': 'sStatus', 	'Align': 'Center',	'Edit':0,	'Save': 0,	'Hidden':dev, 	'ColMerge':0	}
				,{'Header': '일련번호',		'Type': 'Text', 			'MinWidth': 60, 	'SaveName': 'sArtCd',	'Align': 'Center',	'Edit':0,	'Save': 1	,	'Hidden':dev, 	'ColMerge':0, 	'DefaultValue':'0'	}
				,{'Header': '일련번호',		'Type': 'Combo', 		'MinWidth': 60, 	'SaveName': 'sBbsTp',	'Align': 'Center',	'Edit':0,	'Save': 0	,	'Hidden':dev, 	'ColMerge':0	}
				,{'Header': '구분',			'Type': 'Combo', 		'MinWidth': 80, 	'SaveName': 'sBbsId',	'Align': 'Center',	'Edit':0,	'Save': 1,	'ColMerge':0, 	'ComboText': '${cbBbsTp.cbText}', 'ComboCode': '${cbBbsTp.cbCode}' }  
				,{'Header': '관련정보',		'Type': 'Popup', 		'MinWidth': 80, 	'SaveName': 'sRltCd',	 	'Align': 'Left',		'Edit':1,	'Save': 0	,	'ColMerge':0	}
				,{'Header': '제목',			'Type': 'Text', 			'MinWidth': 150, 	'SaveName': 'sTitle',	 	'Align': 'Left',		'Edit':0,	'Save': 0	,	'ColMerge':0	}
				,{'Header': '내용',			'Type': 'Text', 			'MinWidth': 250, 	'SaveName': 'sCont',	 	'Align': 'Left',		'Edit':0,	'Save': 0	,	'ColMerge':0, 	'MultiLineText': 1}
				,{'Header': '숨김',			'Type': 'CheckBox', 	'MinWidth': 40, 	'SaveName': 'sDcb',		'Align': 'Center',	'Edit':1,	'Save': 1	  						}   
				,{'Header': '회신내용',		'Type': 'Text', 			'MinWidth': 250, 	'SaveName': 'sACont', 	'Align': 'Left',		'UpdateEdit':1,			'InsertEdit':1,	'Save': 1	,	'ColMerge':0, 		'MultiLineText': 1, 	'KeyField':1}
				,{'Header': '회신타입',		'Type': 'Combo',		'MinWidth': 100, 	'SaveName': 'sAtp', 		'Align': 'Center',	'Edit':1,	'Save': 1,	'ColMerge':0,	'ComboText': '등록만|SMS 발송|EMAIL 발송|SMS + EMAIL', 'ComboCode': '0|1|2|3' }
				,{'Header': '작성일',		'Type': 'Date', 			'MinWidth': 80, 	'SaveName': 'sCdt', 		'Align': 'Center',	'Edit':0,	'Save': 0	,	'ColMerge':0	}
				,{'Header': '작성자',		'Type': 'Text', 			'MinWidth': 60, 	'SaveName': 'sWrite',	 	'Align': 'Center',	'Edit':0,	'Save': 1	,	'ColMerge':0	}
				,{'Header': '연락처',		'Type': 'Text', 			'MinWidth': 90, 	'SaveName': 'sPhone', 	'Align': 'Center',	'Edit':0,	'Save': 1	,	'ColMerge':0	}
				,{'Header': '회신일',		'Type': 'Date', 			'MinWidth': 80, 	'SaveName': 'sACdt', 	'Align': 'Center',	'Edit':0,	'Save': 0	,	'ColMerge':0	}
				,{'Header': '회신자',		'Type': 'Text', 			'MinWidth': 80, 	'SaveName': 'sACid',	 	'Align': 'Center',	'Edit':0,	'Save': 0	,	'ColMerge':0	}
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
				var sheet = eval('mySheet' + tar);
				if(1 == tar)
					sheet.DoSearch(_BT.FRONT.URL.Search.SheetContBbsList, $('#sheetFrm').serialize()); 
				break;    
			case 'save':            
				var sheet = eval('mySheet' + tar);
				var opt = {UrlEncode:0, Mode:2, Delim:"#"};
				var SaveStr = sheet.GetSaveString(opt); 
				if('' == SaveStr){
					alert('저장할 내역이 없습니다.'); 
					break;
				}else if('KeyFieldError' == SaveStr){ 
					break;
				}else{
					if(!confirm('회신 내용을 저장하시겠습니까?')) break;
				}
				if(1 == tar){
					var rtnData = sheet.GetSaveData(_BT.FRONT.URL.Customer.SaveContMsg, SaveStr); 
					sheet.LoadSaveData(rtnData);
				}
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
			if (mySheet1.GetCellValue(row, 'sIsOver') == 1) {
				mySheet1.SetRowBackColor(row, "#ffc600"); 
			}
		} 
		function mySheet1_OnSaveEnd(code) {
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
								상품문의
							</h1>
							<h2>
								<label class="dbCnt" data-type="PDT" data-value="0"><c:out value="${dashBoard[0].CNT_PDT}"/> 건</label> 
								<span class="dbCnt" data-type="PDT" data-value="1">지연 <label> <c:out value="${dashBoard[0].CNT_PDT_O}"/> </label>건</span>
							</h2>
						</th>
						<th class="on">
							<h1>
								제휴문의
							</h1>
							<h2>
								<label class="dbCnt" data-type="MOU" data-value="0"><c:out value="${dashBoard[0].CNT_MOU}"/>  건</label> 
								<span class="dbCnt" data-type="MOU" data-value="1">지연 <label> <c:out value="${dashBoard[0].CNT_MOU_O}"/> </label>건</span>
							</h2>
						</th>
						<th class="on">
							<h1>
								회원문의
							</h1>
							<h2>
								<label class="dbCnt" data-type="USR" data-value="0"><c:out value="${dashBoard[0].CNT_USR}"/> 건</label>
								<span class="dbCnt" data-type="USR" data-value="1">지연 <label> <c:out value="${dashBoard[0].CNT_USR_O}"/> </label>건</span>
							</h2>
						</th>
						<th class="on">
							<h1>
								방문자 문의
							</h1>
							<h2>
								<label class="dbCnt" data-type="GST" data-value="0"><c:out value="${dashBoard[0].CNT_GST}"/> 건</label>
								<span class="dbCnt" data-type="GST" data-value="1">지연 <label> <c:out value="${dashBoard[0].CNT_GST_O}"/> </label>건</span>
							</h2>
						</th>
					</tr>
				</tbody>
			</table>
			<p class="alarm_txt marginbottom_20">※ 조회조건 : 최근 1개월 동안 문의 중 미답변 건 / <span class="redCr bTxt" >지연건 - 현재일 기준 미답변 건(D + 2)</span> </p>
			<form id="sheetFrm" name="sheetFrm">
				<table class="join_form">
					<caption>조회</caption>
					<colgroup>
						<col width="10%">
						<col width="*">
					</colgroup>
					<tbody>
						<tr>
							<th>
								조회
							</th>
							<td style="text-align: left;">
								<span class="c13_01_03_txt_01">
									등록일
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
								<span class="return_select2">
									<select id="sBbsId" name="sBbsId" class="">
										<option value="">전체</option>
										<option value="MOU">제휴문의</option>
										<option value="STR">업체문의</option>
										<option value="PDT">상품 게시물</option>
										<option value="GST">방문자 문의</option>
										<option value="USR">회원 문의</option>
										<option value="MNG">관리자 비고</option>
									</select>
								</span>		
								<span class="c13_01_03_txt_01">
									검색어
								</span>
								<input type="text" id="sValue" name="sValue" class="input_style08" placeholder="검색어">	
								<span class="inquiry_btn1 marginleft_7">
									<span data-type="save" data-value="1" class="sButton btn_span fs-13 pink marginleft_5" style="float: right;">저장</span>
									<span data-type="search" data-value="1"  class="sButton btn_span fs-13 blue" style="float: right;">조회</span>
								</span>	
								<span class="c13_01_03_txt_01">
									구분
								</span>
								<span class="return_select5">
									<select id="isNoAns" name="isNoAns" class="">
										<option value="">전체</option>
										<option value="Y">미회신</option>
										<option value="N">회신완료</option>
									</select>
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
