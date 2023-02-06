<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/layout/include/base.jsp" %>
	<script type="text/javascript">
		var dupClick1 = false;
		$(function(){
			$( ':input' ).on('focus', function() {
	    		$(this).addClass('mOn');
	    	});
			$( ':input' ).on('focusout', function() {
	    		$(this).removeClass('mOn');
	    	}); 
			_BT.makeCalendar("sSdt", "yy-mm-dd");
			_BT.makeCalendar("sEdt",   "yy-mm-dd");
			initSheet();
			initUpload();
		});
		
		function initSheet(){
			var initData = {};
			initData.Cfg = {
										'ToolTip': 1,
										'DragMode': -1,
										'AutoFitColWidth': 'search|resize|init|colhidden|rowtransaction',
										'MergeSheet': msFixedMerge + msHeaderOnly,
										'DataRowHeight': 33
										};
			initData.HeaderMode = {};
			
			initData.Cols = [
		        [ //첫번째 단위 데이터(DataRow) 행
						{'Header': '번호', 			'Type': 'Seq', 		'MinWidth': 30,		'SaveName': 'sSeq', 			'Align': 'Center', 	'RowSpan': 3	},
						{'Header': '상태', 			'Type': 'Status', 	'MinWidth': 30,		'SaveName': 'sStatus', 		'Align': 'Center' 	},   
						{'Header': '제목', 			'Type': 'Text', 		'MinWidth': 200, 	'SaveName': 'sTitle', 			'Align': 'Left', 		'Edit':1, 	'KeyField':1 },  
						{'Header': '게시시작',		'Type': 'Date', 		'MinWidth': 80, 	'SaveName': 'sSdt', 			'Align': 'Center', 	'Edit':1	},  
						{'Header': '게시종료',		'Type': 'Date', 		'MinWidth': 80, 	'SaveName': 'sEdt', 			'Align': 'Center', 	'Edit':1	}, 
						{'Header': '배너',			'Type': 'Text', 		'MinWidth': 80, 	'SaveName': 'fileIcon', 		'Align': 'Center', 	'Hidden':1, 	'Save': 0 },  
						{'Header': '파일변경',		'Type': 'Text', 		'MinWidth': 0, 		'SaveName': 'fileChg', 		'Align': 'Center', 	'Hidden':1}  
						
					],
			      [ //두번째 단위 데이터(DataRow) 행
						{'Header': '번호'}, 
						{'Header': '구분',			'Type': 'Combo', 	'MinWidth': 50,	 	'SaveName': 'sBbsId',  		'Align': 'Center', 	'Edit':1,	'ComboText': '${cbBbsTp.cbText}', 'ComboCode': '${cbBbsTp.cbCode}' },  
						{'Header': '내용',			'Type': 'Text', 		'MinWidth': 200, 	'SaveName': 'sCont',			'Align': 'Left', 		'Edit':1,  'RowSpan': 2, 'KeyField':1, 'MultiLineText': 1},  
						{'Header': '변동일',	 		'Type': 'Date', 		'MinWidth': 80, 	'SaveName': 'sCdt', 			'Align': 'Center', 	'Edit':0, 	'Save': 0 },  
						{'Header': '처리자',	 		'Type': 'Text', 		'MinWidth': 80, 	'SaveName': 'sCid', 			'Align': 'Center', 	'Edit':0,	'Save': 0 }, 
						{'Header': '배너',			'Type': 'Text', 		'MinWidth': 80, 	'SaveName': 'fileData', 		'Align': 'Center', 	'Hidden':1, 	'Save': 0 } ,  
						{'Header': '프로모션코드'	 }  
			      ],
			      [ //세번째 단위 데이터(DataRow) 행
						{'Header': '번호'		}, 
						{'Header': '타입', 			'Type': 'Combo', 	'MinWidth': 50,	 	'SaveName': 'sBbsTp',		'Align': 'Center', 	'Edit':1, 	'ComboText': '일반|배너노출|FAQ-전체|FAQ-구매|FAQ-판매', 'ComboCode': '0|1|7|8|9' }, 
						{'Header': '내용' 	},
						{'Header': '게시물번호',		'Type': 'Text', 		'MinWidth': 80, 	'SaveName': 'sArtCd', 		'Align': 'Center', 	'Edit':0, 	'DefaultValue':'NEW' },
						{'Header': '연관번호',		'Type': 'Text', 		'MinWidth': 80, 	'SaveName': 'sRelNo', 		'Align': 'Center', 	'Edit':0, 	'DefaultValue':'NEW' }, 
						{'Header': '첨부파일',		'Type': 'Text', 		'MinWidth': 0,	 	'SaveName': 'fileSeq', 		'Align': 'Center', 	'Edit':0, 	'Hidden':1 },
						{'Header': '사용여부', 		'Type': 'Combo', 	'MinWidth': 80,	 	'SaveName': 'sUseYN',		'Align': 'Center', 	'Hidden':1, 	'ComboText': 'Y|N', 'ComboCode': 'Y|N' }  
						
			      ]
			];			
			// IBSheet 생성
			createIBSheet2($('#ib-container1')[0], 'mySheet1', '100%', '300px');
			
			// IBSheet 초기화
			IBS_InitSheet(mySheet1, initData);	
	
			// 편집 가능 여부 설정
			mySheet1.SetEditable(0);

			//마우스오버
			mySheet1.SetMouseHoverMode(2) 
			
			// 사이즈 맞춤
			mySheet1.FitColWidth();
		}
		function initUpload(){
			
			var initConfig = {
				autoUpload: false,
				viewType: 'ibsheet', 
				limitFileCount :1,
				//imitFileCountOnce: 10,
				onIBSheet: function(mySheet) {
				    window['mySheet'] = mySheet;
				    IBSheetLoadPage_Main(mySheet);
				    mySheet.SetColHidden(3, 0);
				    mySheet.SetColHidden(4, 1);
				    mySheet.SetColHidden(6, 1);
				}, 
				onAddFile: function(files) {
				},
			    onBeforeDeleteFile : function(tryDeleteFile) {
			    	alert(tryDeleteFile.name + " 파일을 제거하려고 합니다."); 
			    },
			    onUploadData: function(serverResponeObject, serverResponeText) {
			    	alert("onUploadData");
					console.log(serverObject);
					console.log(serverText);
			    },
			    onDblClick : function(){
					$("#myUpload").IBUpload("download");
			    }
			};
			$('#myUpload').IBUpload(initConfig);
		}
		function doAction(sAction) { 
			switch(sAction) {  
				case 'add':           
					if(mySheet1.GetSelectRow() < 1) break;
				   	$('#myUpload').IBUpload(sAction); 
					break; 
					
				case 'delete':          
					if(mySheet1.GetSelectRow() < 1) break;
				  	$('#myUpload').IBUpload(sAction);
					break; 
					
				case 'search':            
					mySheet1.DoSearch(_BT.FRONT.URL.Search.SheetBbsList, $('#sheetFrm').serialize()); 
					var inputElem = $('#ib-container2').find('input, select, textarea');
					var idx = 0;
					for (idx in inputElem) {
					    inputElem[idx].value = '';
					}
			        $('#myUpload').IBUpload('reset');			
					break; 
					
				case 'insert':       //입력
					var row = mySheet1.DataInsert(-1);
					var inputElem = $('#ib-container2').find('input, select, textarea');
					var idx = 0;
					for (idx in inputElem) {
					    inputElem[idx].value = '';
					}
					$('#sArtCd').val('NEW');
					$('#sRelNo').val('NEW');
			        $('#myUpload').IBUpload('reset');			
					break; 
					
				case 'save':       //저장
			        if ($("#myUpload").IBUpload("isModified")) {
						var row = mySheet1.GetSelectRow();
						mySheet1.SetCellValue(row, 'sStatus',	'U') ;
						mySheet1.SetCellValue(row, 'fileChg',	'Y') ;
			        }else{
						mySheet1.SetCellValue(row, 'fileChg',	'N') ;
			        }  
		            var inputElem = $('#ib-container2').find('input, select, textarea');
	               	var elem = null;
		            var idx = 0;
		            var saveObj = {};
		            for (idx in inputElem) {
		                elem = inputElem[idx];
		                saveObj[elem.id] = elem.value;
		            }
		            mySheet1.SetRowData(mySheet1.GetSelectRow(), saveObj);
					var opt = {UrlEncode:0, Mode:2, Delim:'#'};
					var saveString = GetSaveString({sheet:["mySheet1"]},opt);
					if(saveString.indexOf('sSeq=') == '-1') { // 수정할 내역이 없거나 필수입력 오류시 업로드 처리를 하지 않는다.
						alert('수정내역이 없습니다.\n\n다시 확인 부탁 드립니다.');
						break;   
					}
					var bbs = $('#sBbsId').val();
					if(bbs == 'MSB' || bbs == 'MCB' || bbs == 'PRM'){
						var fileList = $('#myUpload').IBUpload('fileList');
						if(fileList.length != 1){
							alert('메인 프로모션, 메인 카테고리, 프로모션 게시물의 경우\n\n이미지 첨부파일 1개가 필수로 등록 되어야 합니다.');
							break;   
						}						
					}
					$('#myUpload').IBUpload("UploadEncoding","utf-8"); 
					$('#myUpload').IBUpload('uploadServerUrl', _BT.FRONT.URL.Site.SetBoard);
					$('#myUpload').IBUpload('extendParamUpload', saveString); 
					$('#myUpload').IBUpload('upload'); // 서버로 업로드를 실행한다.					
					break;     
			} 
		} 
		function mySheet1_OnDblClick(Row, Col, Value, CellX, CellY, CellW, CellH) { 
			if (Row == 0) return; //헤더행일때는 폼에 반영 안함.
			var obj = mySheet1.GetRowData(Row),
			elem = null;
			for (elem in obj) {
			    if ($('#' + elem)[0]) {
			        $('#' + elem).val(obj[elem]);
			    }
			}
			$('#myUpload').IBUpload('files', obj.fileData,  'fileData');
		} 
 
	</script>
	<div class="main_content06" style="padding-top: 0px; min-height: 800px; margin-bottom: 20px;">
		<div >
			<form id="sheetFrm" name="sheetFrm">
				<table class="tbl_Type02">
					<caption>조회</caption>
					<colgroup>
						<col width="15%">
						<col width="%">
					</colgroup>
					<tbody>
						<tr>
							<th>
								게시물 조회
							</th>
							<td style="text-align: left;">
								<span class="return_select2">
									<select id="bbsId" name="bbsId" class="">
										<option value="">전체</option>
										<option value="MSB">메인 프로모션</option>
										<option value="MPB">모바일 배너</option>
										<option value="MCB">메인 카테고리</option>
										<option value="STF">대화의 발견</option>
										<option value="FAQ">FAQ</option>
										<option value="NTC">NOTICE</option>
										<option value="BRD">브랜드소개</option>
										<option value="BLO">파워블로거</option>
										<option value="PRM">프로모션</option>
										<option value="POP">팝업공지</option>
									</select>
								</span>
								<input type="text" id="artCd" name="artCd"  class="input_style08 marginleft_7" placeholder="게시물번호">							
								<span class="inquiry_btn marginleft_7">
									<span onclick="doAction('save');"  class="sButton btn_span fs-13 pink marginleft_5" style="float: right;">저장</span>
									<span onclick="doAction('insert');" class="sButton btn_span fs-13 green marginleft_5" style="float: right;">추가</span>
									<span onclick="doAction('search');" class="sButton btn_span fs-13 blue" style="float: right;">조회</span>
								</span>
							</td>
						</tr>
					</tbody>
				</table>	
			</form>
		</div>
		<div class="col-sm-5 col-md-5" style="margin-top:10px;" >
		    <div id="ib-container1"></div>
		</div>
		<div class='col-sm-5 col-md-5 margintop_40' id="ib-container2">
			<h1 class="title_con_Type02">
				상세내역			
			</h1>	
			<table class="join_form border_bottom">
				<caption>정보입력</caption>
				<colgroup>
					<col width="8%">
					<col width="17%">
					<col width="8%">
					<col width="17%">
					<col width="8%">
					<col width="17%">
					<col width="8%">
					<col width="17%">
				</colgroup>
				<tbody>
					<tr>
						<th>
							구분
						</th>
						<td align="left">
							<span class="return_select2">
								<select id="sBbsId"  name="sBbsId" class="form-control">
									<option value="MSB">메인 프로모션</option>
									<option value="MPB">모바일 배너</option>
									<option value="MCB">메인 카테고리</option>
									<option value="STF">대화의 발견</option>
									<option value="FAQ">FAQ</option>
									<option value="NTC">NOTICE</option>
									<option value="BRD">브랜드소개</option>
									<option value="BLO">파워블로거</option>
									<option value="PRM">프로모션</option>
									<option value="POP">팝업공지</option>
								</select>
							</span>
						</td>
						<th>
							게시타입
						</th>
						<td align="left">
							<span class="return_select2">
								<select id="sBbsTp"  name="sBbsTp" class="form-control">
									<option value="">미지정</option>
									<option value="1">일반</option>
									<option value="7">FAQ-전체</option>
									<option value="8">FAQ-구매</option>
									<option value="9">FAQ-판매</option>
								</select>
							</span>
						</td>
						<th>
							번호
						</th>
						<td align="left">
							<input type="text" class="join_form_input02" id="sArtCd" name="sArtCd" readonly="readonly"/>
						</td>
						<th>
							연관게시물
						</th>
						<td align="left">
							<input type="text" class="join_form_input02" id="sRelNo" name="sRelNo"/>
						</td>
					</tr>
					<tr>
						<th>
							게시시작
						</th>
						<td align="left">
							<input type="text" class="join_form_input02" id="sSdt" name="sSdt"/>
						</td>
						<th>
							게시종료
						</th>
						<td align="left">
							<input type="text" class="join_form_input02" id="sEdt" name="sEdt"/>
						</td>
						<th>
							사용여부
						</th>
						<td align="left">
							<span class="return_select2">
								<select id="sUseYN"  name="sUseYN" class="form-control">
									<option value="Y">사용</option>
									<option value="N">미사용</option>
								</select>
							</span>							
						</td>
						<th>
							처리일
						</th>
						<td align="left">
							<input type="text" id="sCdt" name="sCdt" class="join_form_input02" readonly="readonly"/>
						</td>
					</tr>
					<tr>
						<th>
							제목
						</th>
						<td colspan="5" align="left">
							<input id="sTitle" name="sTitle" type="text" class="join_form_input05"/>
						</td>
						<th>
							처리자
						</th>
						<td align="left">
							<input type="text" id="sCid" name="sCid" class="join_form_input02" readonly="readonly"/>
						</td>
					</tr>
					<tr>
						<th>
							내용
						</th>
						<td colspan="3" align="left">
							<textarea id="sCont" name="sCont" rows="7" style="width:100%;"></textarea>
						</td>
						<th>
							첨부파일
						</th>
						<td colspan="3" align="left">
		                <div style="width:520px; height: 140px; display: block;" id="myUpload_DIV"> 
								<span onclick="doAction('add');" class="sButton btn_span2 fs-13 blue">추가</span> 
								<span onclick="doAction('delete');" class="sButton btn_span2 fs-13 blue">제거</span>
								<div style="height:80%;">
									<div id="myUpload" style=""></div>
								</div>
		                </div>						
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="frmDiv" style="display: none;">
		</div>
	</div>
