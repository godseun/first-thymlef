<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/layout/include/base.jsp" %>
	<div class="main_content06" style="padding-top: 0px; min-height: 850px; margin-bottom: 20px;">
		<div>
			<form id="sheetFrm" name="sheetFrm">
				<input type="hidden" id="sBbsId" name="sBbsId" value="PMV"/>			
				<input type="hidden" id="recomId" name="recomId" value="ad"/>
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
								<input class="input_style20 marginleft_5" type="text" id="mPrdtCd" name="mPrdtCd" placeholder="품목코드" />								
								<span class="inquiry_btn" style="right: 10px;">
									<span data-type="search" data-value="1"  class="sButton btn_span fs-13 blue" style="float: right;">조회</span>
								</span>
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
			1. 동영상 정보			
			<span data-type="save" data-value="2"  class="sButton btn_span fs-13 pink marginleft_5" style="float: right;">저장</span>
			<span data-type="insert" data-value="2"  class="sButton btn_span fs-13 green marginleft_5" style="float: right;">추가</span>
		</h1>	
		<div class='col-sm-5 col-md-5' style='width: 100%; height: 160px; display: block;padding-top:5px;'>
		    <div id='ib-container2'></div>
		</div>
		
		<h1 class="title_con_Type02 margintop_30">
			2. 상세 이미지 정보
			<span data-type="save" data-value="3"  class="sButton btn_span fs-13 pink marginleft_5" style="float: right;">저장</span>
			<span data-type="delete" data-value="3" class="sButton btn_span fs-13 blue marginleft_5" style="float: right;">제거</span>
			<span data-type="add" data-value="3" class="sButton btn_span fs-13 blue" style="float: right;">추가</span> 
		</h1>	
		<div style="width: 100%; height: 200px;" id="myUpload_DIV">
		    <div id="myUpload" style="height:100%;"></div>
		</div>
		
		<h1 class="title_con_Type02 margintop_50">
			3. 추천상품 조회<span style="color: red;"> (모음 상품 전용)</span>
		</h1>
		<div class="margintop_20">
			<form id="sheetFrm4" name="sheetFrm4">
				<input type="hidden" name="PRDT_TP" value="J"/>			
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
								<input type="text" id="pValue" name="mValue" placeholder="검색어" class="input_style20" />							
								<input type="text" id="pName" name="mName" placeholder="품명" class="input_style20 marginleft_5" />							
								<input type="text" id="pBrand" name="mBrand" placeholder="브랜드" class="input_style20 marginleft_5" />					
								<input type="text" id="pPrdtCd" name="mPrdtCd" placeholder="품목코드" class="input_style20 marginleft_5" />								
								<span class="inquiry_btn" style="right: 10px;">
									<span data-type="add" data-value="4"  class="sButton btn_span fs-13 pink marginleft_5" style="float: right;">선택</span>
									<span data-type="search" data-value="4"  class="sButton btn_span fs-13 blue" style="float: right;">조회</span>
								</span>
							</td>
						</tr>
					</tbody>
				</table>	
			</form>
		</div>
		
		<div class='col-sm-5 col-md-5' style='padding-top:5px;'>
		    <div id='ib-container4'></div>
		</div>
		<h1 class="title_con_Type02 margintop_30">
			4. 추천상품 선택<span style="color: red;"> (모음 상품 전용 : 4개만 등록가능)</span>
			<span data-type="save" data-value="5"  class="sButton btn_span fs-13 pink" style="float: right;">저장</span>
		</h1>	
		<div class='col-sm-5 col-md-5' style='width: 100%; height:160px; display: block;padding-top:5px;'>
		    <div id='ib-container5'></div>
		</div>
	</div>

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
			initUpload();
		});
		
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
			initData.HeaderMode = {};
			initData.Cols = [
				{'Header': '구분', 			'Type': 'Seq', 			'MinWidth': 0,		'SaveName': 'sSeq', 					'Align': 'Center', 	'Hidden':isDev 	} 
				,{'Header': '상태', 			'Type': 'Status', 		'MinWidth': 0,		'SaveName': 'sStatus', 				'Align': 'Center', 	'Hidden':isDev 	}
				,{'Header': '이미지',		'Type': 'Text', 			'MinWidth': 0,	 	'SaveName': 'PRDT_IMG', 			'Align': 'Center', 	'Hidden':isDev 	}   
				,{'Header': '제조사',		'Type': 'Text', 			'MinWidth': 0,	 	'SaveName': 'MAKR_CD', 			'Align': 'Center', 	'Hidden':isDev 	}   
				,{'Header': '파일명',		'Type': 'Text', 			'MinWidth': 0, 		'SaveName': 'CTL_IMG',				'Align': 'Center', 	'Hidden':isDev 	} 
				,{'Header': '파일변경',		'Type': 'Text', 			'MinWidth': 0, 		'SaveName': 'fileChg', 				'Align': 'Center', 	'Hidden':isDev 	} 
				,{'Header': '품목코드',		'Type': 'Text', 			'MinWidth': 60,	 	'SaveName': 'PRDT_CD', 			'Align': 'Center', 	'Edit':0		}   
				,{'Header': '품명',			'Type': 'Text', 			'MinWidth': 100, 	'SaveName': 'PRDT_NM',				'Align': 'Left', 		'Edit':0 		}
				,{'Header': '제조사',		'Type': 'Text', 			'MinWidth': 60, 	'SaveName': 'MAKR_NM',			'Align': 'Left',		'Edit':0 		}  
				,{'Header': '카테고리',		'Type': 'Text', 			'MinWidth': 60,	 	'SaveName': 'sCnm', 					'Align': 'Center', 	'Edit':0		}   
				,{'Header': '품목정보',		'Type': 'Button',		'MinWidth': 30,		'SaveName': 'Button1',				'Align': 'Center'	, 	'DefaultValue':'상페이동' }
				,{'Header': '제품이미지',	'Type': 'Button',		'MinWidth': 30,	 	'SaveName': 'Button2',				'Align': 'Center',	'DefaultValue':'대표' }
				,{'Header': '상세이미지',	'Type': 'Button',		'MinWidth': 30,	 	'SaveName': 'CTL_IMG_AT',		'Align': 'Center'		}   
				,{'Header': '카탈로그',		'Type': 'Button',		'MinWidth': 30,		'SaveName': 'EBOOK_IMG_NO',	'Align': 'Center'		}
			];			
			
			// IBSheet 생성
			var container = $('#ib-container1')[0];
			createIBSheet2(container, 'mySheet1', '100%', '250px');
			
			// IBSheet 초기화
			IBS_InitSheet(mySheet1, initData);	

			initData.Cols = [
				{'Header': '구분', 			'Type': 'Seq', 			'MinWidth': 0,		'SaveName': 'sSeq', 					'Align': 'Center', 	'Hidden':isDev 	} 
				,{'Header': '상태', 			'Type': 'Status', 		'MinWidth': 0,		'SaveName': 'sStatus', 				'Align': 'Center', 	'Hidden':isDev 	}
				,{'Header': '이미지',		'Type': 'Text', 			'MinWidth': 0,	 	'SaveName': 'PRDT_IMG', 			'Align': 'Center', 	'Hidden':isDev 	}   
				,{'Header': '제조사',		'Type': 'Text', 			'MinWidth': 0,	 	'SaveName': 'MAKR_CD', 			'Align': 'Center', 	'Hidden':isDev 	}   
				,{'Header': '파일명',		'Type': 'Text', 			'MinWidth': 0, 		'SaveName': 'CTL_IMG',				'Align': 'Center', 	'Hidden':isDev 	} 
				,{'Header': '파일변경',		'Type': 'Text', 			'MinWidth': 0, 		'SaveName': 'fileChg', 				'Align': 'Center', 	'Hidden':isDev 	} 
				,{'Header': '선택',			'Type': 'CheckBox', 	'MinWidth': 40, 	'SaveName': 'sCheckBox',			'Align': 'Center',	'Edit':1	  	} 
				,{'Header': '품목코드',		'Type': 'Text', 			'MinWidth': 60,	 	'SaveName': 'PRDT_CD', 			'Align': 'Center', 	'Edit':0		}   
				,{'Header': '품명',			'Type': 'Text', 			'MinWidth': 100, 	'SaveName': 'PRDT_NM',				'Align': 'Left', 		'Edit':0 		}
				,{'Header': '제조사',		'Type': 'Text', 			'MinWidth': 60, 	'SaveName': 'MAKR_NM',			'Align': 'Left',		'Edit':0 		}  
				,{'Header': '카테고리',		'Type': 'Text', 			'MinWidth': 60,	 	'SaveName': 'sCnm', 					'Align': 'Center', 	'Edit':0		}   
				,{'Header': '품목정보',		'Type': 'Button',		'MinWidth': 30,		'SaveName': 'Button1',				'Align': 'Center'	, 	'DefaultValue':'상페이동' }
				,{'Header': '제품이미지',	'Type': 'Button',		'MinWidth': 30,	 	'SaveName': 'Button2',				'Align': 'Center',	'DefaultValue':'대표' }
				,{'Header': '상세이미지',	'Type': 'Button',		'MinWidth': 30,	 	'SaveName': 'CTL_IMG_AT',		'Align': 'Center'		}   
				,{'Header': '카탈로그',		'Type': 'Button',		'MinWidth': 30,		'SaveName': 'EBOOK_IMG_NO',	'Align': 'Center'		}
			];		
  
			// IBSheet 생성
			var container = $('#ib-container4')[0];
			createIBSheet2(container, 'mySheet4', '100%', '250px');
			
			// IBSheet 초기화
			IBS_InitSheet(mySheet4, initData);	
			
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
			
			initData.Cols = [
				{'Header': '구분', 			'Type': 'Seq', 			'MinWidth': 0,		'SaveName': 'sSeq', 					'Align': 'Center', 	'Hidden':isDev 	} 
				,{'Header': '상태', 			'Type': 'Status', 		'MinWidth': 0,		'SaveName': 'sStatus', 				'Align': 'Center', 	'Hidden':isDev 	}
				,{'Header': '삭제',			'Type': 'DelCheck', 	'MinWidth': 40, 	'SaveName': 'sDcb',					'Align': 'Center',	'Edit':1	  	}   
				,{'Header': '품목코드',		'Type': 'Text', 			'MinWidth': 60,	 	'SaveName': 'PRDT_CD', 			'Align': 'Center', 	'Edit':0		}   
				,{'Header': '품명',			'Type': 'Text', 			'MinWidth': 100, 	'SaveName': 'PRDT_NM',				'Align': 'Left', 		'Edit':0 		}
				,{'Header': '제조사',		'Type': 'Text', 			'MinWidth': 60, 	'SaveName': 'MAKR_NM',			'Align': 'Left',		'Edit':0 		}  
				,{'Header': '카테고리',		'Type': 'Text', 			'MinWidth': 60,	 	'SaveName': 'sCnm', 					'Align': 'Left',	 	'Edit':0		}   
			];			
			
			// IBSheet 생성
			var container = $('#ib-container5')[0];
			createIBSheet2(container, 'mySheet5', '100%', '150px');
			
			// IBSheet 초기화
			IBS_InitSheet(mySheet5, initData);		
			
			// 편집 가능 여부 설정
			mySheet1.SetEditable(1);
			mySheet2.SetEditable(1);
			mySheet4.SetEditable(1);
			mySheet5.SetEditable(1);

			//마우스오버
			mySheet1.SetMouseHoverMode(2) 
			mySheet4.SetMouseHoverMode(2) 
			mySheet5.SetMouseHoverMode(2) 
			
			//건수 정보 표시
			mySheet1.SetCountPosition(4);
			mySheet4.SetCountPosition(4);
			mySheet5.SetCountPosition(4);
			
			// 사이즈 맞춤
			mySheet1.FitColWidth();
			mySheet2.FitColWidth();
			mySheet4.FitColWidth();
			mySheet5.FitColWidth();
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

		function doAction(sAction, tar) { 
			switch(sAction) {  
				case 'search':
//			        $('#myUpload').IBUpload('reset');			   
					if(1 == tar){
						if(
								$('#mValue').val() ==''
							&&	 $('#mName').val() ==''
							&&	 $('#mBrand').val() ==''
							&&	 $('#mPrdtCd').val() ==''
						){
							alert('검색어는 필수 사항 입니다.');
							break; 
						}
						mySheet1.DoSearch(_BT.FRONT.URL.Search.SheetPrdDtltList3, $('#sheetFrm2').serialize()); 
						
					}else if(2 == tar){
						mySheet2.DoSearch(_BT.FRONT.URL.Search.SheeMovieList, $('#sheetFrm').serialize()); 
					
					}else if(4 == tar){
						if(
								$('#pValue').val() ==''
							&&	 $('#pName').val() ==''
							&&	 $('#pBrand').val() ==''
							&&	 $('#pPrdtCd').val() ==''
						){
							alert('검색어는 필수 사항 입니다.');
							break; 
						}
						mySheet4.DoSearch(_BT.FRONT.URL.Search.SheetPrdDtltList3, $('#sheetFrm4').serialize()); 
						
					}else if(5 == tar){
						mySheet5.DoSearch(_BT.FRONT.URL.Search.SheeAdPrdtList, $('#sheetFrm').serialize()); 
					}
					break;
				
				case 'add':  
					if(3 == tar){
						if($('#sPrdtCd').val() == '') break;
						$('#myUpload').IBUpload(sAction); 
						
					}else if(4 == tar){
						var opt = {UrlEncode:0, Mode:1};
						var SaveStr = mySheet4.GetSaveJson(opt); 
						if(SaveStr.data.length <1){
							alert('선택 내역이 없습니다.\n\n다시 확인 부탁 드립니다.');
							break;   
						}						
						mySheet5.LoadSearchData(SaveStr,{Sync:1,Append:1});
					}
					break; 

				case 'insert':
					if($('#sPrdtCd').val() == '') break;
					var row = mySheet2.DataInsert(-1);
					mySheet2.SetCellValue(row, 'sPrdtCd', $('#sPrdtCd').val()) ;
					break;
					
				case 'delete':
					if($('#sPrdtCd').val() == '') break;
				  	$('#myUpload').IBUpload(sAction);
					break; 
					
					
				case 'save':       //저장
					if(2 == tar) {
						var opt = {UrlEncode:0, Mode:2, Delim:"#"};
						var SaveStr = mySheet2.GetSaveString(opt); 
						if('' == SaveStr){
							alert('저장할 내역이 없습니다.'); 
							break;
						}else if('KeyFieldError' == SaveStr){ 
							break;
						}else{
							if(!confirm('변경 내역을 저장하시겠습니까?')) break;
						}
						var rtnData = mySheet2.GetSaveData(_BT.FRONT.URL.Product.SaveSheetMovie, SaveStr); 
						mySheet2.LoadSaveData(rtnData);		
						
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

					}else if(5 == tar){
						if(	'' == $('#sPrdtCd').val()){
							alert('추천상품을 등록할 대표상품을 선택해 주세요.');
							break; 
						}
						if(!confirm('변경 내역을 저장하시겠습니까?')) break;
						var opt = {UrlEncode:0, Mode:2, Delim:"#"};
						var SaveStr = mySheet5.GetSaveString(opt); 
						var rtnData = mySheet5.GetSaveData(_BT.FRONT.URL.Site.SetAdPrdt, SaveStr + "&"+$('#sheetFrm').serialize()); 
						mySheet5.LoadSaveData(rtnData);
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
			doAction('search', '5');
			
			$('#myUpload').IBUpload('files', CTL_IMG,  'fileData');
/* 			
	        $('#myUpload').IBUpload('reset');		
			var obj = mySheet1.GetRowData(Row),elem = null;
 */		
		} 
		function mySheet1_OnButtonClick(Row, Col) {
			var sSaveName = mySheet1.ColSaveName(0, Col); 
			if(sSaveName == 'EBOOK_IMG_NO'){
				var EBOOK = mySheet1.GetCellValue( Row, 'EBOOK_IMG_NO' );
				_BT.openPopup( _BT.FRONT.URL.Search.ImgPop+'?imgTp=CA&code='+EBOOK,'ImgPop', '750', '1100', true, true);
		
			}else if(sSaveName == 'CTL_IMG_AT'){
				var CTL_IMG = mySheet1.GetCellValue( Row, 'CTL_IMG' );
				var obj = jQuery.parseJSON(CTL_IMG);
				var date = obj[0].date.substring(0,8);
				var url = $(location).attr('protocol') + '//' + $(location).attr('host') + '/upload/board/' + date + '/' + obj[0].url;
				
				_BT.openPopup(url, 'ImgPop', '900', '900', true, true);
				
			}else if(sSaveName == 'Button2'){
				var PRDT_IMG = mySheet1.GetCellValue( Row, 'PRDT_IMG' );
				var url = $(location).attr('protocol') + '//' + $(location).attr('host') + '/upload/600/' + PRDT_IMG;
				
				_BT.openPopup(url, 'ImgPop', '600', '600', true, true);
			}else if(sSaveName == 'Button1'){
				var PRDT_CD = mySheet1.GetCellValue( Row, 'PRDT_CD' );
				_BT.openPopup( _BT.SHOP.URL.Search.View+'?pCode='+PRDT_CD,'PRDT_CD', '1400', '800', 'yes', 'yes');
			}
		} 		
		
		
		function mySheet2_OnSaveEnd(code) {
			if(code == 1){         
				alert("저장에 성공하였습니다.");
			} else {         
				alert("저장에 실패하였습니다.");     
			} 
		} 
		
		function mySheet5_OnSaveEnd(code) {
			if(code == 1){         
				alert("저장에 성공하였습니다.");
			} else {         
				alert("저장에 실패하였습니다.");     
			} 
		} 
	</script>