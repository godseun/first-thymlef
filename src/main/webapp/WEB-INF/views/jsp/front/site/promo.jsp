<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/layout/include/base.jsp" %>
<script type="text/javascript" src="${staticRoot}/js/allCteg.js"></script>
	<script type="text/javascript">
		var dupClick1 = false;
		$(function(){
			$( ':input' ).on('focus', function() {
	    		$(this).addClass('mOn');
	    	});
			$( ':input' ).on('focusout', function() {
	    		$(this).removeClass('mOn');
	    	}); 
			$( '.ca' ).on('change', function() {
				var cSel= eval($(this).data('value')+1);
				_BT.CategSearch.clearSelect(cSel);
				_BT.CategSearch.makeSelect(cSel, $(this).val());
	    	}); 
			$('.sButton').click(function() {
				doAction($(this).data('type'), $(this).data('value'));
			});
			initSheet();
			initUpload();
			initSelect();
			//_BT.makeCalendar("sSdt", "yy-mm-dd");
			//_BT.makeCalendar("sEdt",   "yy-mm-dd");
		});
		
		function initSheet(){
			var initData = {};
			initData.Cfg = {
								'AutoFitColWidth': 'search|resize|init|colhidden|rowtransaction'
								};
			initData.HeaderMode = {};
			
			initData.Cols = [
						{'Header': '번호', 			'Type': 'Seq', 		'MinWidth': 30,		'SaveName': 'sSeq', 			'Align': 'Center', 	'Hidden':1	},
						{'Header': '상태', 			'Type': 'Status', 	'MinWidth': 40,		'SaveName': 'sStatus', 		'Align': 'Center', 	'Edit':0 	},   
						{'Header': '구분', 			'Type': 'Combo', 	'MinWidth': 70,	 	'SaveName': 'sBbsId',		'Align': 'Center', 	'Edit':0, 	'ComboText': '프로모션|카테고리 배너|프로모션 배너|대화의 발견', 'ComboCode': 'PRM|MCB|MSB|STF' },  
						{'Header': '게시시작',		'Type': 'Date', 		'MinWidth': 70, 	'SaveName': 'sSdt', 			'Align': 'Center', 	'Edit':0	},
						{'Header': '게시종료',		'Type': 'Date', 		'MinWidth': 70, 	'SaveName': 'sEdt', 			'Align': 'Center', 	'Edit':0	}, 
						{'Header': '타입', 			'Type': 'Combo', 	'MinWidth': 50,	 	'SaveName': 'sPrmTp',		'Align': 'Center', 	'Edit':0, 	'ComboText': '미지정|개별 상품|프로모션 상품', 'ComboCode': '|1|2' },  
						{'Header': '제목', 		 	'Type': 'Text', 		'MinWidth': 140, 	'SaveName': 'sTitle', 			'Align': 'Left', 		'Edit':0 	},  
						{'Header': '배경색상',	 	'Type': 'Text', 		'MinWidth': 40, 	'SaveName': 'sBgCr', 			'Align': 'Center', 	'Edit':0	}, 
						{'Header': '카테고리', 		'Type': 'Combo', 	'MinWidth': 100,	'SaveName': 'caPm',			'Align': 'Center', 	'Edit':0, 	'ComboText': '미지정|${categCb.cbText}', 'ComboCode': '|${categCb.cbCode}' },  
						{'Header': '품목코드',		'Type': 'Text', 		'MinWidth': 80, 	'SaveName': 'sPrdtCd',		'Align': 'Center', 	'Edit':0	}, 
						{'Header': '동영상주소',		'Type': 'Text', 		'MinWidth': 100, 	'SaveName': 'sUrl', 			'Align': 'Center', 	'Edit':0	}, 
						{'Header': '가로',	 		'Type': 'Text', 		'MinWidth': 40, 	'SaveName': 'sWidth', 		'Align': 'Center', 	'Edit':0	}, 
						{'Header': '세로',	 		'Type': 'Text', 		'MinWidth': 40, 	'SaveName': 'sHeight', 		'Align': 'Center', 	'Edit':0	}, 
						{'Header': '처리일',	 		'Type': 'Date', 		'MinWidth': 60, 	'SaveName': 'sCdt', 			'Align': 'Center', 	'Edit':0	},  
						{'Header': '처리자',	 		'Type': 'Text', 		'MinWidth': 60, 	'SaveName': 'sCid', 			'Align': 'Center', 	'Edit':0	},
						{'Header': '사용여부',	 	'Type': 'Text', 		'MinWidth': 60, 	'SaveName': 'sUseYN', 		'Align': 'Center', 	'Edit':0, 	'Hidden':1	},
						{'Header': '첨부파일', 		'Type': 'Text', 		'MinWidth': 0, 		'SaveName': 'sImg', 			'Align': 'Center', 	'Edit':0, 	'Hidden':1	},
						{'Header': '게시물코드', 	'Type': 'Text', 		'MinWidth': 0, 		'SaveName': 'sArtCd',		'Align': 'Center', 	'Edit':0, 	'Hidden':0	},
						{'Header': '파일seq', 		'Type': 'Text', 		'MinWidth': 0, 		'SaveName': 'fileSeq',		'Align': 'Center', 	'Edit':0, 	'Hidden':1	},
						{'Header': '파일변경', 		'Type': 'Text', 		'MinWidth': 0, 		'SaveName': 'fileChg',		'Align': 'Center', 	'Edit':0, 	'Hidden':1	},
						{'Header': '코드', 			'Type': 'Text', 		'MinWidth': 0, 		'SaveName': 'sPrmId', 		'Align': 'Center', 	'Edit':0, 	'Hidden':1, 	'DefaultValue':'NEW' }
						
						];			
			// IBSheet 생성
			createIBSheet2($('#ib-container1')[0], 'mySheet1', '100%', '200px');
			
			// IBSheet 초기화
			IBS_InitSheet(mySheet1, initData);	
	
			initData.Cols = [
				{'Header': '구분', 			'Type': 'Seq', 				'MinWidth': 0,		'SaveName': 'sSeq', 			'Align': 'Center', 	'Hidden':1 	}, 
				{'Header': '상태', 			'Type': 'Status', 			'MinWidth': 0,		'SaveName': 'sStatus', 		'Align': 'Center', 	'Hidden':1 	}, 
				{'Header': '카테고리',		'Type': 'Text', 				'MinWidth': 0,	 	'SaveName': 'sCcd', 			'Align': 'Center', 	'Hidden':1 	},   
				{'Header': '선택',			'Type': 'CheckBox', 		'MinWidth': 40, 	'SaveName': 'sCheckBox',	'Align': 'Center',	'Edit':1	  	},   
				{'Header': '품목코드',		'Type': 'Text', 				'MinWidth': 60,	 	'SaveName': 'sPcd', 			'Align': 'Center', 	'Edit':0		},   
				{'Header': '규격코드',		'Type': 'Text', 				'MinWidth': 60,	 	'SaveName': 'sScd', 			'Align': 'Center', 	'Edit':0		},   
				{'Header': '카테고리',		'Type': 'Text', 				'MinWidth': 40,	 	'SaveName': 'sCnm', 			'Align': 'Center', 	'Edit':0		},   
				{'Header': '품명',			'Type': 'Text', 				'MinWidth': 130, 	'SaveName': 'sNm',			'Align': 'Left', 		'Edit':0 		},  
				{'Header': '규격',			'Type': 'Text', 				'MinWidth': 130, 	'SaveName': 'sSt',				'Align': 'Left', 		'Edit':0 		},  
				{'Header': '제조사',			'Type': 'Text', 				'MinWidth': 40, 	'SaveName': 'sMk',			'Align': 'Center', 	'Edit':0 		}  
			];					
			// IBSheet 생성
			createIBSheet2($('#ib-container3')[0], 'mySheet3', '100%', '500px');
			// IBSheet 초기화
			IBS_InitSheet(mySheet3, initData);	
			
			initData.Cols = [
				{'Header': '구분', 			'Type': 'Seq', 				'MinWidth': 0,		'SaveName': 'sSeq', 			'Align': 'Center', 	'Hidden':1 	}, 
				{'Header': '상태', 			'Type': 'Status', 			'MinWidth': 0,		'SaveName': 'sStatus', 		'Align': 'Center', 	'Hidden':1 	}, 
				{'Header': '프로모션',		'Type': 'Text', 				'MinWidth': 0,	 	'SaveName': 'sPrmId',		'Align': 'Center', 	'Hidden':1 	},   
				{'Header': '게시물',			'Type': 'Text', 				'MinWidth': 0,	 	'SaveName': 'sArtCd',		'Align': 'Center', 	'Hidden':1 	},   
				{'Header': '카테고리',		'Type': 'Text', 				'MinWidth': 0,	 	'SaveName': 'sCcd', 			'Align': 'Center', 	'Hidden':1 	},   
				{'Header': '삭제',			'Type': 'DelCheck', 		'MinWidth': 40, 	'SaveName': 'sDcb',			'Align': 'Center',	'Edit':1	  	},   
				{'Header': '품목코드',		'Type': 'Text', 				'MinWidth': 60,	 	'SaveName': 'sPcd', 			'Align': 'Center', 	'Edit':0		},   
				{'Header': '규격코드',		'Type': 'Text', 				'MinWidth': 60,	 	'SaveName': 'sScd', 			'Align': 'Center', 	'Edit':0		},   
				{'Header': '카테고리',		'Type': 'Text', 				'MinWidth': 40,	 	'SaveName': 'sCnm', 			'Align': 'Center', 	'Edit':0, 'Save': 0	},   
				{'Header': '품명',			'Type': 'Text', 				'MinWidth': 130, 	'SaveName': 'sNm',			'Align': 'Left', 		'Edit':0, 'Save': 0	},  
				{'Header': '규격',			'Type': 'Text', 				'MinWidth': 130, 	'SaveName': 'sSt',				'Align': 'Left', 		'Edit':0, 'Save': 0	},  
				{'Header': '제조사',			'Type': 'Text', 				'MinWidth': 40, 	'SaveName': 'sMk',			'Align': 'Center', 	'Edit':0, 'Save': 0	}  
			];					
			// IBSheet 생성
			createIBSheet2($('#ib-container4')[0], 'mySheet4', '100%', '500px');
			// IBSheet 초기화
			IBS_InitSheet(mySheet4, initData);	
			
			
			// 편집 가능 여부 설정
			mySheet1.SetEditable(0);
			mySheet3.SetEditable(1);
			mySheet4.SetEditable(1);
			
			// 사이즈 맞춤
			mySheet1.FitColWidth();
			mySheet3.FitColWidth();
			mySheet4.FitColWidth();

			//건수 정보 표시
			mySheet3.SetCountPosition(4);
			mySheet4.SetCountPosition(4);
			//페이지 네비게이션 버튼 표시
			mySheet3.SetPagingPosition(1);
			mySheet4.SetPagingPosition(1);
			
		}

		function initUpload(){
			
			var initConfig = {
				autoUpload: false,
				viewType: 'ibsheet', 
				//limitFileCount :1,
				//imitFileCountOnce: 10,
				onIBSheet: function(mySheet) {
				    window['mySheet'] = mySheet;
				    IBSheetLoadPage_Main(mySheet);
				    mySheet.SetColHidden(3, 0);
				    mySheet.SetColHidden(4, 1);
				    mySheet.SetColHidden(6, 1);
				}, 
				onAddFile: function(files) {
					console.log(files);
				},
			    onBeforeDeleteFile : function(tryDeleteFile) {
			    	console.log("삭제 시도");
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
		
		function initSelect(){
			_BT.CategSearch.makeSelect('1');
			_BT.CategSearch.makeSelect('Pm');
		}
		function doAction(sAction, tar) { 
			switch(sAction) {  
				case 'search':       
			        $('#myUpload').IBUpload('reset');			   
					if(3 == tar){
						var sheet = eval('mySheet' + tar);
						if(
							($('#ca3').val() == '' || $('#ca3').val() == 'C9999')
							&& $('#mValue').val() ==''
						){
							alert('3단계 이상 카테고리 선택 또는 검색어는 필수 사항 입니다.');
							break; 
						}
						sheet.DoSearch(_BT.FRONT.URL.Search.SheetPrdtList, $('#sheetFrm2').serialize()); 
					}else if(1 == tar){
						var sheet = eval('mySheet' + tar);
						sheet.DoSearch(_BT.FRONT.URL.Search.SheetPromoList, $('#sheetFrm').serialize()); 
					}
					break; 
					
				case 'save':   
					if(3 == tar){
						var sheet = eval('mySheet' + tar);
						var opt = {UrlEncode:0, Mode:1};
						var SaveStr = sheet.GetSaveJson(opt); 
						if(SaveStr.data.length <1){
							alert('선택 내역이 없습니다.\n\n다시 확인 부탁 드립니다.');
							break;   
						}						
						mySheet4.LoadSearchData(SaveStr,{Sync:1,Append:1});
					}else if(4 == tar){
						var sheet = eval('mySheet' + tar);
						var opt = {UrlEncode:0, Mode:2, Delim:"#"};
						//var SaveStr = sheet.GetSaveJson(opt); 
						var SaveStr = sheet.GetSaveString(opt); 
						if('' == SaveStr){
							alert('저장할 내역이 없습니다.'); 
							break;
						}else if('KeyFieldError' == SaveStr){ 
							alert('오류가 있습니다.잠시후 확인 바랍니다.'); 
							break;
						}else{
							if(!confirm('변경 내역을 저장하시겠습니까?')) break;
						}			
						var rtnData = sheet.GetSaveData(_BT.FRONT.URL.Site.SetPromoPrdt, SaveStr + "&"+$('#sheetFrm3').serialize()); 
						sheet.LoadSaveData(rtnData);
					}else if(1 == tar){
				        if ($("#myUpload").IBUpload("isModified")) {
							var row = mySheet1.GetSelectRow();
							mySheet1.SetCellValue(row, 'sStatus','U') ;
							mySheet1.SetCellValue(row, 'fileChg',	'Y') ;
				        }else{
							mySheet1.SetCellValue(row, 'fileChg',	'N') ;
				        }  
						if(_BT.isEmptyById('sPrmTp',		'프로모션 타입을 선택해 주세요.')) return false;
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
						if (saveString == '' && saveString == 'KeyFieldError') { // 수정할 내역이 없거나 필수입력 오류시 업로드 처리를 하지 않는다.
							alert('입력하신 내역에 오류가 있습니다.\n\n다시 확인 부탁 드립니다.');
							break;   
						}
						$('#myUpload').IBUpload("UploadEncoding","utf-8"); 
						$('#myUpload').IBUpload('uploadServerUrl', _BT.FRONT.URL.Site.SetPromo);
						$('#myUpload').IBUpload('extendParamUpload', saveString); 
						$('#myUpload').IBUpload('upload'); // 서버로 업로드를 실행한다.	
					}          
					break;  
					
				case 'add':           
					if(_BT.isEmptyById("sPrmId",    "선택 내역이 없습니다.")) break; 
					$('#myUpload').IBUpload(sAction); 
					break; 
					
				case	 'delete':            
					if(_BT.isEmptyById("sPrmId",    "선택 내역이 없습니다.")) break; 
				  	$('#myUpload').IBUpload(sAction);
					break;
			} 
		}
		function mySheet1_OnDblClick(Row, Col, Value, CellX, CellY, CellW, CellH) { 
			if (Row == 0) return; //헤더행일때는 폼에 반영 안함.
	        $('#myUpload').IBUpload('reset');		
			var obj = mySheet1.GetRowData(Row),
			elem = null;
			for (elem in obj) {
			    if ($('#' + elem)[0]) {
			        $('#' + elem).val(obj[elem]);
			    }
			}
			if(obj.sBbsId == 'MCB'){
				$('.typeA').removeClass('vBlock'); 
				$('.typeB').addClass('vBlock'); 
				$('.typeC').removeClass('vBlock'); 
			} else if(obj.sBbsId == 'PRM'){
				$('.typeA').addClass('vBlock'); 
				$('.typeB').removeClass('vBlock'); 
				$('.typeC').removeClass('vBlock'); 
			} else if(obj.sBbsId == 'STF'){
				$('.typeA').removeClass('vBlock'); 
				$('.typeB').removeClass('vBlock'); 
				$('.typeC').addClass('vBlock'); 
			}
			$('#mPrmId').val(obj.sPrmId);
			$('#mAartCd').val(obj.sArtCd);
			$('#myUpload').IBUpload('files', obj.sImg,  'fileData');
			mySheet4.DoSearch(_BT.FRONT.URL.Search.SheetPromoPrdtList, $('#sheetFrm3').serialize()); 
		} 
		function mySheet4_OnSaveEnd(code) {
			if(code == 1){         
				alert("저장에 성공하였습니다.");
			} else {         
				alert("저장에 실패하였습니다.");     
			} 
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
								프로모션 조회
							</th>
							<td style="text-align: left;">
								<span class="return_select2">
									<select id="bbsId"  name="bbsId" class="form-control">
										<option value="">전체</option>
										<option value="PRM">프로모션</option>
										<option value="MCB">카테고리배너</option>
										<option value="STF">대화의 발견</option>
									</select>
								</span>
								<input type="text" id="artCd" name="artCd"  class="input_style08 marginleft_7" placeholder="게시물 번호">							
								<span class="inquiry_btn marginleft_7">
									<span data-type="save" data-value="1" class="sButton btn_span fs-13 pink marginleft_5" style="float: right;">저장</span>
									<span data-type="search" data-value="1" class="sButton btn_span fs-13 blue" style="float: right;">조회</span>
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
		<div class='col-sm-5 col-md-5 margintop_20' id="ib-container2">
			<h1 class="title_con_Type02">
				프로모션 내역			
			</h1>	
			<table class="join_form">
				<caption>정보입력</caption>
				<colgroup>
					<col width="10%">
					<col width="20%">
					<col width="10%">
					<col width="20%">
					<col width="10%">
					<col width="*">
				</colgroup>
				<tbody>
					<tr>
						<th>
							프로모션 코드
						</th>
						<td align="left"> 
							<input type="text" class="input_style04" id="sPrmId" name="sPrmId"  readonly="readonly"/>
						</td>
						<th>
							프로모션 명칭
						</th>
						<td align="left">
							<input type="text" class="input_style04" id="sTitle" name="sTitle" />
						</td>
						<th>
							타입
						</th>
						<td align="left">
							<span class="return_select2">
								<select id="sPrmTp"  name="sPrmTp" class="form-control">
									<option value="">프로모션 구분</option>
									<option value="1">개별상품</option>
									<option value="2">프로모션상품</option>
								</select>
							</span>
						</td>
					</tr>
				</tbody>
			</table>
			<div class="typeA" style="display: none;">
				<table class="join_form border_bottom">
					<caption>정보입력</caption>
					<colgroup>
						<col width="10%">
						<col width="22%">
						<col width="10%">
						<col width="*">
					</colgroup>
					<tbody>
						<tr>
							<th>
								동영상 주소
							</th>
							<td align="left" colspan="3">
								<input type="text" class="input_style04" id="sUrl" name="sUrl"/>
							</td>
						</tr>
						<tr>
							<th>
								가로 X세로
							</th>
							<td align="left">
								<input type="text" class="join_form_input01" id="sWidth" name="sWidth"/> 
								<span>X</span> 
								<input type="text" class="join_form_input01" id="sHeight" name="sHeight"/>
							</td>
							<th>
								배경색상
							</th>
							<td align="left">
								<input type="text" class="join_form_input02" id="sBgCr" name="sBgCr"/>
							</td>
						</tr>
						<tr>
							<th>
								상세이미지
							</th>
							<td colspan="3" align="left">
				                <div style="width:650px; height: 140px; display: block;" id="myUpload_DIV"> 
										<span onclick="doAction('add','1');" class="btn_span2 fs-13 blue">추가</span> 
										<span onclick="doAction('delete','1');" class="btn_span2 fs-13 blue">제거</span>
										<div style="height:80%;">
											<div id="myUpload" style=""></div>
										</div>
				                </div>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="typeB" style="display: none;">
				<table class="join_form border_bottom">
					<caption>정보입력</caption>
					<colgroup>
						<col width="10%">
						<col width="*">
					</colgroup>
					<tbody>
						<tr>
							<th>
								카테고리
							</th>
							<td align="left">
								<span class="return_select2">
									<select id="caPm"  name="caPm" class="form-control">
									</select>
								</span>
							</td>
						</tr>
					</tbody>
				</table>			
			</div>
			<div class="typeC" style="display: none;">
				<table class="join_form border_bottom">
					<caption>정보입력</caption>
					<colgroup>
						<col width="10%">
						<col width="*">
					</colgroup>
					<tbody>
						<tr>
							<th>
								상품코드
							</th>
							<td align="left"> 
								<input type="text" class="input_style04" id="sPrdtCd" name="sPrdtCd"/>
							</td>
						</tr>
					</tbody>
				</table>			
			</div>
		</div>		
		<div class="margintop_40">
			<form id="sheetFrm3" name="sheetFrm3">
				<input type="hidden" id="mAartCd" name="mAartCd"/>			
				<input type="hidden" id="mPrmId" name="mPrmId"/>			
			</form>
			<form id="sheetFrm2" name="sheetFrm2">
				<input type="hidden" id="cTp" name="cTp"/>			
				<input type="hidden" id="cCode" name="cCode"/>			
				<table class="tbl_Type02">
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
								<input class="input_style20" type="text" id="mValue" name="mValue" placeholder="검색어" />							
								<input class="input_style20 marginleft_5" type="text" id="mName" name="mName" placeholder="품명" />							
								<input class="input_style20 marginleft_5" type="text" id="mBrand" name="mBrand" placeholder="브랜드" />							
								<input class="input_style20 marginleft_5" type="text" id="mStndrd" name="mStndrd" placeholder="규격" />							
								<input class="input_style20 marginleft_5" type="text" id="mModel" name="mModel" placeholder="모델명" />							
								<input class="input_style20 marginleft_5" type="text" id="mCode" name="mCode" placeholder="코드번호" />							
								<span class="inquiry_btn marginleft_7">
									<span data-type="search" data-value="3"  class="sButton btn_span fs-13 blue" style="float: right;">조회</span>
								</span>
								<div class="margintop_5">
									<span class="return_select6">
										<select id="PRDT_TP" name="PRDT_TP">
											<option value="J">제휴</option>
											<option value="S">재고</option>
										</select>
									</span>
									<span class="return_select6 marginleft_5">
										<select class="ca" id="ca1" name="ca1" data-value="1">
											<option value="">1단계</option>
										</select>
									</span>
									<span class="return_select6 marginleft_5">
										<select class="ca" id="ca2" name="ca2"  data-value="2">
											<option value="">2단계</option>
										</select>
									</span>
									<span class="return_select6 marginleft_5">
										<select class="ca" id="ca3" name="ca3" data-value="3">
											<option value="">3단계</option>
										</select>
									</span>
									<span class="return_select6 marginleft_5">
										<select class="ca" id="ca4" name="ca4" data-value="4">
											<option value="">4단계</option>
										</select>
									</span>
									<span class="return_select6 marginleft_5">
										<select class="ca" id="ca5" name="ca5" data-value="5">
											<option value="">5단계</option>
										</select>
									</span>
								</div>
							</td>
						</tr>
					</tbody>
				</table>	
			</form>
		</div>
		
		<div style="display: table-cell;width: 624px; padding-left: 5px;">
			<div class="margintop_10">
				<h1 class="title_con_Type02">
					검색제품
					<span data-type="save" data-value="3" class="sButton btn_span fs-13 green" style="float: right;">선택</span>
				</h1>		
			</div>
			<div class="col-sm-5 col-md-5" style="margin-top:10px;">
			    <div id="ib-container3"></div>
			</div>		
		</div>
		<div style="display: table-cell;width: 624px; padding-left: 5px;">
			<div class="margintop_10">
				<h1 class="title_con_Type02">
					프로모션
					<span data-type="save" data-value="4"  class="sButton btn_span fs-13 pink marginleft_5" style="float: right;">저장</span>
					<span data-type="search" data-value="4"  class="sButton btn_span fs-13 blue" style="float: right;">조회</span>
				</h1>		
			</div>
			<div class="col-sm-5 col-md-5" style="margin-top:10px;">
			    <div id="ib-container4"></div>
			</div>		
		</div>
	</div>
