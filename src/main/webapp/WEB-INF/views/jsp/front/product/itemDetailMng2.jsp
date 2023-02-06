<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/layout/include/base.jsp" %>
	<script type="text/javascript" src="${staticRoot}/js/allCteg.js"></script>
	<script type="text/javascript">
		var dupClick1 = false;
		var isDev = 1;
		$(function(){ 
			$( '.ca' ).on('change', function() {
				var cSel= eval($(this).data('value')+1);
				_BT.CategSearch.clearSelect(cSel);
				_BT.CategSearch.makeSelect(cSel, $(this).val());
	    	});
			$( ":input" ).on("focus", function() {
	    		$(this).addClass("mOn");
	    	});
	
			$( ":input" ).on("focusout", function() {
	    		$(this).removeClass("mOn");
	    	}); 
			$('.sButton').click(function() {
				doAction($(this).data('type'), $(this).data('value'));
			});
			initSheet();
			initSelect();
			initUpload();
		});
		
		function initSheet(){
			var initData = {};
			initData.Cfg = {
			        'AutoFitColWidth': 'search|resize|init|colhidden|rowtransaction'
			        ,'UseHeaderSortCancel' : 1
					,'MergeSheet': 4 
					};
			initData.HeaderMode = {};
			initData.Cols = [
				{'Header': '구분', 			'Type': 'Seq', 			'MinWidth': 0,		'SaveName': 'sSeq', 				'Align': 'Center', 	'Hidden':isDev 	}, 
				{'Header': '상태', 			'Type': 'Status', 		'MinWidth': 0,		'SaveName': 'sStatus', 			'Align': 'Center', 	'Hidden':isDev 	}, 
				{'Header': '선택',			'Type': 'CheckBox', 	'MinWidth': 40, 	'SaveName': 'sCheckBox',		'Align': 'Center',	'Edit':1	  	},   
				{'Header': '품목코드',		'Type': 'Text', 			'MinWidth': 60,	 	'SaveName': 'PRDT_CD', 		'Align': 'Center', 	'Edit':0		},   
				{'Header': '규격코드',		'Type': 'Text', 			'MinWidth': 60,	 	'SaveName': 'PRDT_DTL_CD', 	'Align': 'Center', 	'Edit':0		},   
				{'Header': '품명',			'Type': 'Text', 			'MinWidth': 100, 	'SaveName': 'PRDT_NM',			'Align': 'Left', 		'Edit':1 		},  
				{'Header': '규격',			'Type': 'Text', 			'MinWidth': 100, 	'SaveName': 'STNDRD',			'Align': 'Left', 		'Edit':1  		},  
				{'Header': '공급사',			'Type': 'Text', 			'MinWidth': 0,	 	'SaveName': 'STORE_ID', 		'Align': 'Center', 	'Hidden':isDev 	},   
				{'Header': '공급사',			'Type': 'Text', 			'MinWidth': 60, 	'SaveName': 'STORE_NM',		'Align': 'Center',	'Edit':1 		},  
				{'Header': '제조사',			'Type': 'Text', 			'MinWidth': 0,	 	'SaveName': 'MAKR_CD', 		'Align': 'Center', 	'Hidden':isDev 	},   
				{'Header': '제조사',			'Type': 'Text', 			'MinWidth': 60, 	'SaveName': 'MAKR_NM',		'Align': 'Left',		'Edit':1 		},  
				{'Header': '모델명',			'Type': 'Text', 			'MinWidth': 60, 	'SaveName': 'MODEL_NM',		'Align': 'Left',		'Edit':1 		},  
				{'Header': '판매가',			'Type': 'Int',				'MinWidth': 50,		'SaveName': 'SEL_PRICE',	 	'Align': 'Right',		'Edit':1,		'Format':'Integer'	},
				{'Header': '구매가',			'Type': 'Int',				'MinWidth': 50,		'SaveName': 'PUR_PRICE',	 	'Align': 'Right',		'Edit':1,		'Format':'Integer'	},
				{'Header': '원코드',			'Type': 'Text', 			'MinWidth': 60, 	'SaveName': 'ORG_PRDT_CD',	'Align': 'Center',	'Edit':1 		},  
				{'Header': '상품코드',		'Type': 'Text', 			'MinWidth': 60, 	'SaveName': 'BARCODE',			'Align': 'Center',	'Edit':1 		},   
				{'Header': '관리사',			'Type': 'Text', 			'MinWidth': 40, 	'SaveName': 'PUR_SUPPLY',		'Align': 'Center',	'Edit':1 		},  
				{'Header': '원공급사',		'Type': 'Text', 			'MinWidth': 40, 	'SaveName': 'ORG_CMP_CD',	'Align': 'Center',	'Edit':1 		},  
				{'Header': '재고량',			'Type': 'Int', 			'MinWidth': 60, 	'SaveName': 'INVT_AMT',		'Align': 'Right',		'Edit':1,		'Format':'Integer'	},
				{'Header': '판매량',			'Type': 'Int', 			'MinWidth': 60, 	'SaveName': 'SEL_CNT',			'Align': 'Right',		'Edit':0,		'Format':'Integer'	},
				
				
				{'Header': '파일명',			'Type': 'Text', 			'MinWidth': 0, 		'SaveName': 'CTL_IMG',			'Align': 'Center', 	'Hidden':isDev 	}, 
				{'Header': '파일변경',		'Type': 'Text', 			'MinWidth': 0, 		'SaveName': 'fileChg', 			'Align': 'Center', 	'Hidden':isDev 	}, 
				
				
				
				{'Header': '카테고리',		'Type': 'Text', 				'MinWidth': 40,	 	'SaveName': 'sCnm', 			'Align': 'Center', 	'Edit':0		},   
				{'Header': '제조사',			'Type': 'Text', 				'MinWidth': 40, 	'SaveName': 'sMk',			'Align': 'Center', 	'Edit':0 		} 
			];			
			
			// IBSheet 생성
			var container = $('#ib-container1')[0];
			createIBSheet2(container, 'mySheet1', '100%', '300px');
			
			// IBSheet 초기화
			IBS_InitSheet(mySheet1, initData);	
			
			initData.Cols = [
				{'Header': '구분', 			'Type': 'Seq', 			'MinWidth': 0,		'SaveName': 'sSeq', 				'Align': 'Center', 	'Hidden':isDev 	}, 
				{'Header': '상태', 			'Type': 'Status', 		'MinWidth': 0,		'SaveName': 'sStatus', 			'Align': 'Center', 	'Hidden':isDev 	}, 
				{'Header': '키값', 			'Type': 'Text', 			'MinWidth': 0,		'SaveName': 'sPrmId', 			'Align': 'Center', 	'Hidden':isDev, 'DefaultValue':'NEW' }, 
				{'Header': '타입', 			'Type': 'Text', 			'MinWidth': 0,		'SaveName': 'sBbsId', 			'Align': 'Center', 	'Hidden':isDev, 'DefaultValue':'PMV' }, 
				{'Header': '삭제',			'Type': 'DelCheck', 	'MinWidth': 40, 	'SaveName': 'sDelChBox',		'Align': 'Center',	'Edit':1	  	},   
				{'Header': '품목코드',		'Type': 'Text', 			'MinWidth': 60,	 	'SaveName': 'sPrdtCd', 			'Align': 'Center', 	'Edit':0		},   
				{'Header': '가로',			'Type': 'Int',				'MinWidth': 50,		'SaveName': 'sWidth',	 		'Align': 'Right',		'Edit':1,		'Format':'Integer', 	'DefaultValue':853 },
				{'Header': '세로',			'Type': 'Int',				'MinWidth': 50,		'SaveName': 'sHeight',	 		'Align': 'Right',		'Edit':1,		'Format':'Integer', 	'DefaultValue':480 },
				{'Header': '위치',			'Type': 'Int',				'MinWidth': 50,		'SaveName': 'sArtCd',		 	'Align': 'Right',		'Edit':1,		'Format':'Integer'	},
				{'Header': '주소',			'Type': 'Text', 			'MinWidth': 300, 	'SaveName': 'sUrl',				'Align': 'Left', 		'Edit':1 		}  
			];			
			
			// IBSheet 생성
			var container = $('#ib-container2')[0];
			createIBSheet2(container, 'mySheet2', '100%', '150px');
			
			// IBSheet 초기화
			IBS_InitSheet(mySheet2, initData);				
			
			// 편집 가능 여부 설정
			mySheet1.SetEditable(1);
			mySheet2.SetEditable(1);
			
			//건수 정보 표시
			mySheet1.SetCountPosition(4);
			
			//필터기능 추가
			mySheet1.ShowFilterRow();
			
			// 사이즈 맞춤
			mySheet1.FitColWidth();
			mySheet2.FitColWidth();
		}		
		function initUpload(){
			
			var initConfig = {
				autoUpload: false,
				viewType: 'ibsheet', 
				limitFileCount :20,
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
		function initSelect(){
			_BT.CategSearch.makeSelect('1');
			for(var sel=2; sel<6; sel++){
				$('#ca'+sel).empty();
				$('#ca'+sel).append('<option value="C9999">'+sel+'단계</option>');
			}
		}

		function doAction(sAction, tar) { 
			switch(sAction) {  
				case 'add':           
					if($('#sPrdtCd').val() == '') break;
				   	$('#myUpload').IBUpload(sAction); 
					break; 
					
				case 'delete':          
					if($('#sPrdtCd').val() == '') break;
				  	$('#myUpload').IBUpload(sAction);
					break; 
				case 'search':       
//			        $('#myUpload').IBUpload('reset');			   
					if(1 == tar){
						var sheet = eval('mySheet' + tar);
						if(
							($('#ca3').val() == '' || $('#ca3').val() == 'C9999')
							&& $('#mValue').val() ==''
						){
							alert('3단계 이상 카테고리 선택 또는 검색어는 필수 사항 입니다.');
							break; 
						}
						sheet.DoSearch(_BT.FRONT.URL.Search.SheetPrdDtltList2, $('#sheetFrm2').serialize()); 
					}else if(2 == tar){
						var sheet = eval('mySheet' + tar);
						sheet.DoSearch(_BT.FRONT.URL.Search.SheeMovieList, $('#sheetFrm').serialize()); 
					}
					break;
				case 'insert':       //입력
					if($('#sPrdtCd').val() == '') break;
					var row = mySheet2.DataInsert(-1);
					mySheet2.SetCellValue(row, 'sPrdtCd', $('#sPrdtCd').val()) ;
					break;
				case 'save':       //저장
					if(2 == tar) {
						var sheet = eval('mySheet' + tar);
						var opt = {UrlEncode:0, Mode:2, Delim:"#"};
						var SaveStr = sheet.GetSaveString(opt); 
						if('' == SaveStr){
							alert('저장할 내역이 없습니다.'); 
							break;
						}else if('KeyFieldError' == SaveStr){ 
							break;
						}else{
							if(!confirm('변경 내역을 저장하시겠습니까?')) break;
						}
						var rtnData = sheet.GetSaveData(_BT.FRONT.URL.Product.SaveSheetMovie, SaveStr); 
						sheet.LoadSaveData(rtnData);		
						break;  
					}else if(3 == tar){
				        if ($("#myUpload").IBUpload("isModified")) {
							var row = mySheet1.GetSelectRow();
							mySheet1.SetCellValue(row, 'sStatus',	'U') ;
							mySheet1.SetCellValue(row, 'fileChg',	'Y') ;
				        }else{
							alert("상세 이미지 변경 내역이 없습니다.\n\n확인 부탁 드립니다.");
							break;  
				        }  
						var opt = {UrlEncode:0, Mode:2, Delim:'#'};
						var saveString = GetSaveString({sheet:["mySheet1"]},opt);
						$('#myUpload').IBUpload("UploadEncoding","utf-8"); 
						$('#myUpload').IBUpload('uploadServerUrl', _BT.FRONT.URL.Product.SaveImgDtl);
						$('#myUpload').IBUpload('extendParamUpload', saveString); 
						$('#myUpload').IBUpload('upload'); // 서버로 업로드를 실행한다.					
						break;  
					}
					break;  
			}
		}
		function mySheet1_OnDblClick(Row, Col, Value, CellX, CellY, CellW, CellH) { 
			if (Row == 0) return; //헤더행일때는 폼에 반영 안함.

			var sCd = mySheet1.GetCellValue( Row, 'PRDT_CD' );
			var CTL_IMG = mySheet1.GetCellValue( Row, 'CTL_IMG' );
			$('#sPrdtCd').val(sCd);
			doAction('search', '2');
			
			$('#myUpload').IBUpload('files', CTL_IMG,  'fileData');
/* 			
	        $('#myUpload').IBUpload('reset');		
			var obj = mySheet1.GetRowData(Row),elem = null;
 */		
		} 
		function mySheet2_OnSaveEnd(code) {
			if(code == 1){         
				alert("저장에 성공하였습니다.");
			} else {         
				alert("저장에 실패하였습니다.");     
			} 
		} 
	</script>
	<div class="main_content06" style="padding-top: 0px; min-height: 850px; margin-bottom: 20px;">
		<div>
			<form id="sheetFrm" name="sheetFrm">
				<input type="hidden" id="sBbsId" name="sBbsId" value="PMV"/>			
				<input type="hidden" id="sPrdtCd" name="sPrdtCd"/>			
			</form>
			<form id="sheetFrm2" name="sheetFrm2">
				<input type="hidden" id="PRDT_TP" name="PRDT_TP" value="J"/>			
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
								<input class="input_style20 marginleft_5" type="text" id="mStoreId" name="mStoreId" placeholder="공급사" />							
								<span class="inquiry_btn marginleft_7">
									<span data-type="save" data-value="1" class="sButton btn_span fs-13 pink marginleft_5" style="float: right;">저장</span>
									<span data-type="search" data-value="1"  class="sButton btn_span fs-13 blue" style="float: right;">조회</span>
								</span>
								<div class="margintop_5">
									<span class="return_select6">
										<select class="" id="sPrdtTp" name="sPrdtTp">
											<option value="1">정상</option>
											<option value="5">일시품절</option>
											<option value="2">단종</option>
											<option value="3">삭제</option>
										</select>
									</span>
									<span class="return_select6 marginleft_5">
										<select class="ca" id="ca1" name="ca1" data-value="1">
											<option value="C9999">1단계</option>
										</select>
									</span>
									<span class="return_select6 marginleft_5">
										<select class="ca" id="ca2" name="ca2"  data-value="2">
											<option value="C9999">2단계</option>
										</select>
									</span>
									<span class="return_select6 marginleft_5">
										<select class="ca" id="ca3" name="ca3" data-value="3">
											<option value="C9999">3단계</option>
										</select>
									</span>
									<span class="return_select6 marginleft_5">
										<select class="ca" id="ca4" name="ca4" data-value="4">
											<option value="C9999">4단계</option>
										</select>
									</span>
									<span class="return_select6 marginleft_5">
										<select class="ca" id="ca5" name="ca5" data-value="5">
											<option value="C9999">5단계</option>
										</select>
									</span>		
									<span class="inquiry_btn3 marginleft_7">
	<!-- 							
									<span data-type="save" data-value="1" class="sButton btn_span fs-13 green" style="float: right;width:100px;"> 신규입력 </span>
	 -->							
									</span>
								</div>
							</td>
						</tr>
					</tbody>
				</table>	
			</form>
		</div>
		<div class='col-sm-5 col-md-5' style='padding-top:5px;'>
		    <div id='ib-container1'></div>
		</div>
		<h1 class="title_con_Type02 margintop_10">
			동영상 정보			
			<span data-type="save" data-value="2"  class="sButton btn_span fs-13 pink marginleft_5" style="float: right;">저장</span>
			<span data-type="insert" data-value="2"  class="sButton btn_span fs-13 green marginleft_5" style="float: right;">추가</span>
		</h1>	
		<div class='col-sm-5 col-md-5' style='width: 100%; height: 160px; display: block;padding-top:5px;'>
		    <div id='ib-container2'></div>
		</div>
		<h1 class="title_con_Type02 margintop_20">
			상세 사진 정보
			<span data-type="save" data-value="3"  class="sButton btn_span fs-13 pink marginleft_5" style="float: right;">저장</span>
			<span data-type="delete" data-value="3" class="sButton btn_span fs-13 blue marginleft_5" style="float: right;">제거</span>
			<span data-type="add" data-value="3" class="sButton btn_span fs-13 blue" style="float: right;">추가</span> 
		</h1>	
		<div style="width: 100%; height: 200px; display: block;" id="myUpload_DIV">
		    <div id="myUpload" style="height:100%;"></div>
		</div>
	</div>
