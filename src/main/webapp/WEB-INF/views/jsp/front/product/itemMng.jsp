<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/layout/include/base.jsp" %>
	<script type="text/javascript" src="${staticRoot}/js/allCteg.js"></script>
	<script type="text/javascript">
		var dupClick1 = false;
		var isDev = 0;
		var row = 0;
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
		});
		
		function initSheet(){
			var initData = {};
			initData.Cfg = {
			        'AutoFitColWidth': 'search|resize|init|colhidden|rowtransaction'
			        ,'UseHeaderSortCancel' : 1
					,'MergeSheet': msHeaderOnly 
					};
			initData.HeaderMode = {};
			initData.Cols = [
					{'Header': '구분', 			'Type': 'Seq', 			'MinWidth': 40,		'SaveName': 'sSeq', 					'Align': 'Center',	'Save': 1		} 
					,{'Header': '상태', 			'Type': 'Status', 		'MinWidth': 40,		'SaveName': 'sStatus', 				'Align': 'Center',	'Save': 1		} 
					,{'Header': '선택',			'Type': 'CheckBox', 	'MinWidth': 40, 	'SaveName': 'sCheckBox',			'Align': 'Center',	'Save': 1,	'Edit':1		}
					,{'Header': '공급사',		'Type': 'Combo', 		'MinWidth': 80, 	'SaveName': 'STORE_ID',			'Align': 'Center',	'Save': 1,	'Edit':1,	 	'ComboText': '삼영툴스', 'ComboCode': '40000001', 		'KeyField':1}
					,{'Header': '품목코드',		'Type': 'Text', 			'MinWidth': 100,	'SaveName': 'PRDT_CD', 			'Align': 'Center',	'Save': 1, 	'Edit':1, 		'KeyField':1}
					,{'Header': '품명',			'Type': 'Text', 			'MinWidth': 150, 	'SaveName': 'PRDT_NM',				'Align': 'Left',		'Save': 1, 	'Edit':1, 		'KeyField':1}
					,{'Header': '추천 품명',		'Type': 'Text', 			'MinWidth': 100, 	'SaveName': 'PRDT_ETC_NM',		'Align': 'Left',		'Save': 1, 	'Edit':1		}
					,{'Header': '제조사',		'Type': 'Popup', 		'MinWidth': 80, 	'SaveName': 'MAKR_NM',			'Align': 'Center',	'Save': 1,	'Edit':1, 		'KeyField':1}
					,{'Header': '코드',			'Type': 'Text', 			'MinWidth': 60, 	'SaveName': 'MAKR_CD',				'Align': 'Center',	'Save': 1,	'Edit':1, 		'KeyField':1}
					,{'Header': '카테고리',		'Type': 'Popup', 		'MinWidth': 350, 	'SaveName': 'CATEG_NM',			'Align': 'Left',		'Save': 0,	'Edit':1		}
					,{'Header': '코드',			'Type': 'Text', 			'MinWidth': 80, 	'SaveName': 'CATEG_CD',			'Align': 'Center',	'Save': 1,	'Edit':1, 		'KeyField':1}
					,{'Header': '원산지',		'Type': 'Combo', 		'MinWidth': 60, 	'SaveName': 'ORG_PLCE',			'Align': 'Center',	'Save': 1,	'Edit':1,	 	'ComboText': '미지정|${orgPlce.cbText}', 'ComboCode': '|${orgPlce.cbCode}' } 
					,{'Header': '원코드',		'Type': 'Text', 			'MinWidth': 60, 	'SaveName': 'ORG_PRDT_CD',		'Align': 'Center',	'Save': 1,	'Edit':1 		}
					,{'Header': '대화케어',		'Type': 'Combo', 		'MinWidth': 60, 	'SaveName': 'ST_CARE_AT',		'Align': 'Center',	'Save': 1,	'Edit':1,	 	'ComboText': 'N|Y', 'ComboCode': 'N|Y' }
					,{'Header': '주문품',		'Type': 'Combo', 		'MinWidth': 60, 	'SaveName': 'MNF_AT',				'Align': 'Center',	'Save': 1,	'Edit':1,	 	'ComboText': 'N|Y', 'ComboCode': 'N|Y' } 
/* 		
					,{'Header': '전체단종',		'Type': 'Combo', 		'MinWidth': 60, 	'SaveName': 'USE_YN',				'Align': 'Center',	'Save': 1,	'Edit':1,	 	'ComboText': 'N|Y', 'ComboCode': 'Y|N' } 
 */					
					,{'Header': '광고여부',		'Type': 'Combo', 		'MinWidth': 60, 	'SaveName': 'AD_YN',				'Align': 'Center',	'Save': 1,	'Edit':1,	 	'ComboText': 'Y|N', 'ComboCode': 'Y|N' } 
				
					,{'Header': '배송비',		'Type': 'Text',		 	'MinWidth': 60, 	'SaveName': 'DLVY_FEE',			'Align': 'Right',		'Save': 1,		'Edit':1,		'Format':'Integer', 		'KeyField':1}
					,{'Header': '#태그',			'Type': 'Text',	 		'MinWidth': 250, 	'SaveName': 'PRDT_INFO',			'Align': 'Left',		'Save': 1,		'Edit':1		} 
					,{'Header': '상품이미지',	'Type': 'Text',	 		'MinWidth': 150, 	'SaveName': 'PRDT_IMG',			'Align': 'Left',		'Save': 1,		'Edit':1, 		'KeyField':1,		'DefaultValue':'/product/'}

					,{'Header': '카탈로그',		'Type': 'Combo', 		'MinWidth': 60, 	'SaveName': 'EBOOK_IMG_AT',		'Align': 'Center',	'Save': 1,	'Edit':1,	 	'ComboText': 'N|Y', 'ComboCode': 'N|Y' } 
					,{'Header': '카탈로그',		'Type': 'Text',		 	'MinWidth': 60, 	'SaveName': 'EBOOK_IMG_NO',	'Align': 'Left',		'Save': 1,	'Edit':1		}
					,{'Header': '상세이미지',	'Type': 'Combo', 		'MinWidth': 60, 	'SaveName': 'CTL_IMG_AT',		'Align': 'Center',	'Save': 1,	'Edit':1,	 	'ComboText': 'N|Y', 'ComboCode': 'N|Y' } 
					,{'Header': '상세이미지',	'Type': 'Text',		 	'MinWidth': 60, 	'SaveName': 'CTL_IMG_NO',		'Align': 'Left',		'Save': 1,	'Edit':1		} 
					,{'Header': 'MD',			'Type': 'Combo',		'MinWidth': 60, 	'SaveName': 'PRDT_MD',				'Align': 'Left',		'Save': 1,	'Edit':1,		'ComboText': '이승형', 'ComboCode': '40000001' } 

					,{'Header': '추가필드1',		'Type': 'Text', 			'MinWidth': 80,	 	'SaveName': 'EXT_INFO_TIT_1', 		'Align': 'Left', 	'Edit':1,		'Save': 1		}   
					,{'Header': '추가정보1',		'Type': 'Text', 			'MinWidth': 80,	 	'SaveName': 'EXT_INFO_VAL_1', 		'Align': 'Left', 	'Edit':1,		'Save': 1		}   
					,{'Header': '추가필드2',		'Type': 'Text', 			'MinWidth': 80,	 	'SaveName': 'EXT_INFO_TIT_2', 		'Align': 'Left', 	'Edit':1,		'Save': 1		}   
					,{'Header': '추가정보2',		'Type': 'Text', 			'MinWidth': 80,	 	'SaveName': 'EXT_INFO_VAL_2', 		'Align': 'Left', 	'Edit':1,		'Save': 1		}   
					,{'Header': '추가필드3',		'Type': 'Text', 			'MinWidth': 80,	 	'SaveName': 'EXT_INFO_TIT_3', 		'Align': 'Left', 	'Edit':1,		'Save': 1		}   
					,{'Header': '추가정보3',		'Type': 'Text', 			'MinWidth': 80,	 	'SaveName': 'EXT_INFO_VAL_3', 		'Align': 'Left', 	'Edit':1,		'Save': 1		}   
					,{'Header': '추가필드4',		'Type': 'Text', 			'MinWidth': 80,	 	'SaveName': 'EXT_INFO_TIT_4', 		'Align': 'Left', 	'Edit':1,		'Save': 1		}   
					,{'Header': '추가정보4',		'Type': 'Text', 			'MinWidth': 80,	 	'SaveName': 'EXT_INFO_VAL_4', 		'Align': 'Left', 	'Edit':1,		'Save': 1		}   
					,{'Header': '추가필드5',		'Type': 'Text', 			'MinWidth': 80,	 	'SaveName': 'EXT_INFO_TIT_5', 		'Align': 'Left', 	'Edit':1,		'Save': 1		}   
					,{'Header': '추가정보5',		'Type': 'Text', 			'MinWidth': 80,	 	'SaveName': 'EXT_INFO_VAL_5', 		'Align': 'Left', 	'Edit':1,		'Save': 1		}   
					,{'Header': '추가필드6',		'Type': 'Text', 			'MinWidth': 80,	 	'SaveName': 'EXT_INFO_TIT_6', 		'Align': 'Left', 	'Edit':1,		'Save': 1		}   
					,{'Header': '추가정보6',		'Type': 'Text', 			'MinWidth': 80,	 	'SaveName': 'EXT_INFO_VAL_6', 		'Align': 'Left', 	'Edit':1,		'Save': 1		}   
					,{'Header': '조회수',		'Type': 'Int', 			'MinWidth': 60, 	'SaveName': 'VIEW_CNT',				'Align': 'Right',	'Edit':0,		'Save': 0,	'Format':'Integer'	}
					,{'Header': '판매수',		'Type': 'Int', 			'MinWidth': 60, 	'SaveName': 'SEL_CNT',					'Align': 'Right',	'Edit':0,		'Save': 0,	'Format':'Integer'	}
					,{'Header': '사용여부',		'Type': 'Combo', 		'MinWidth': 60, 	'SaveName': 'USE_YN',					'Align': 'Center','Edit':1,	 	'Save': 1,	'ComboText': 'Y|N', 'ComboCode': 'Y|N' } 
			];			
			
			// IBSheet 생성
			createIBSheet2($('#ib-container1')[0], 'mySheet1', '100%', '400px');
			
			// IBSheet 초기화
			IBS_InitSheet(mySheet1, initData);	
			
			initData.Cols = [
				{'Header': '구분', 			'Type': 'Seq', 			'MinWidth': 40,		'SaveName': 'sSeq', 				'Align': 'Center',		'Save': 1		} 
				,{'Header': '상태', 			'Type': 'Status', 		'MinWidth': 40,		'SaveName': 'sStatus', 			'Align': 'Center',		'Save': 1		} 
				,{'Header': '선택',			'Type': 'CheckBox', 	'MinWidth': 40, 	'SaveName': 'sCheckBox',		'Align': 'Center',		'Save': 1,		'Edit':1		}
				,{'Header': '공급사',		'Type': 'Combo', 		'MinWidth': 80, 	'SaveName': 'STORE_ID',		'Align': 'Center',		'Save': 1,		'Edit':1,	 	'ComboText': '삼영툴스', 'ComboCode': '40000001', 		'KeyField':1}
				,{'Header': '대표코드',		'Type': 'Text', 			'MinWidth': 100,	'SaveName': 'PRDT_CD', 		'Align': 'Center',		'Save': 1, 		'Edit':1, 		'KeyField':1}
				,{'Header': '품명',			'Type': 'Text', 			'MinWidth': 150, 	'SaveName': 'PRDT_NM',			'Align': 'Left',			'Save': 0, 		'Edit':0		}
				,{'Header': '규격코드',		'Type': 'Text', 			'MinWidth': 100,	'SaveName': 'PRDT_DTL_CD',	'Align': 'Center',		'Save': 1, 		'Edit':1, 		'KeyField':1}
				,{'Header': '규격',			'Type': 'Text', 			'MinWidth': 200,	'SaveName': 'STNDRD',			'Align': 'Left',			'Save': 1, 		'Edit':1, 		'KeyField':1}
				,{'Header': '모델명',		'Type': 'Text', 			'MinWidth': 200,	'SaveName': 'MODEL_NM',		'Align': 'Left',			'Save': 1, 		'Edit':1		}	
				,{'Header': '상품이미지',	'Type': 'Text',	 		'MinWidth': 150, 	'SaveName': 'PRDT_IMG',		'Align': 'Left',			'Save': 1,		'Edit':1, 		'KeyField':1,		'DefaultValue':'/product/'}

				,{'Header': '판매가',		'Type': 'Int', 			'MinWidth': 80,		'SaveName': 'SEL_PRICE',		'Align': 'Right',		'Save': 1, 	'Edit':1,		'Format':'Integer', 		'KeyField':1}
				,{'Header': '매입가',		'Type': 'Int', 			'MinWidth': 80,		'SaveName': 'PUR_PRICE',		'Align': 'Right',		'Save': 1, 	'Edit':1,		'Format':'Integer', 		'KeyField':1}
				,{'Header': '출고량',		'Type': 'Int', 			'MinWidth': 80,		'SaveName': 'OUT_AMT',		'Align': 'Right',		'Save': 1, 	'Edit':1,		'Format':'Integer', 		'KeyField':1,		'DefaultValue':1}
				,{'Header': '출고단위',		'Type': 'Combo',		'MinWidth': 60,		'SaveName': 'OUT_UNIT',		'Align': 'Center',	'Save': 1, 	'Edit':1,	 	'ComboText': '미지정|${unit.cbText}', 'ComboCode': '|${unit.cbCode}' }

				,{'Header': '재고량',		'Type': 'Int', 			'MinWidth': 80,		'SaveName': 'INVT_AMT',		'Align': 'Right',		'Save': 1, 	'Edit':1,		'Format':'Integer',		'DefaultValue':9999}   
				,{'Header': '원품목코드',	'Type': 'Text', 			'MinWidth': 100,	'SaveName': 'ORG_PRDT_CD',	'Align': 'Center',	'Save': 1, 	'Edit':1		}	
				,{'Header': '원공급사',		'Type': 'Combo',		'MinWidth': 60,		'SaveName': 'ORG_CMP_CD',	'Align': 'Center',	'Save': 1, 	'Edit':1,	 	'ComboText': '크레텍|케이비원|동신', 'ComboCode': 'CR|KB|DS'	}
				
				,{'Header': '단종여부',		'Type': 'Combo', 		'MinWidth': 60, 	'SaveName': 'USE_YN',			'Align': 'Center',	'Save': 1,	'Edit':1,	 	'ComboText': 'N|Y', 'ComboCode': 'Y|N' } 
				,{'Header': '품절여부',		'Type': 'Combo', 		'MinWidth': 60, 	'SaveName': 'SOLDOUT_AT',	'Align': 'Center',	'Save': 1,	'Edit':1,	 	'ComboText': 'N|Y', 'ComboCode': 'N|Y' } 
				,{'Header': '재입고일',		'Type': 'Text', 			'MinWidth': 100, 	'SaveName': 'RE_SALE_DT',	'Align': 'Center',	'Save': 1,	'Edit':1,	 	'Format':'####-##-##'		} 
				];			
			
			// IBSheet 생성
			var container = $('#ib-container2')[0];
			createIBSheet2(container, 'mySheet2', '100%', '400px');
			
			// IBSheet 초기화
			IBS_InitSheet(mySheet2, initData);				
			
			// 편집 가능 여부 설정
			mySheet1.SetEditable(1);
			mySheet2.SetEditable(1);
			
			//건수 정보 표시
			mySheet1.SetCountPosition(4);
			mySheet2.SetCountPosition(4);

			//마우스오버
			mySheet1.SetMouseHoverMode(2) 
			mySheet2.SetMouseHoverMode(2) 
			
			//필터기능 추가
			mySheet1.ShowFilterRow();
			mySheet2.ShowFilterRow();
			
			// 사이즈 맞춤
			mySheet1.FitColWidth();
			mySheet2.FitColWidth();
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
				case 'detail':          
					 if($('.detail').hasClass('vOff')){
						$('.detail').removeClass('vOff');
					 } else{
					 	$('.detail').addClass('vOff');
					 }
					break; 
					
				case 'insert':       //입력
					if(1 == tar){
						var row = mySheet1.DataInsert(-1);
					}else if(2 == tar){
						var row = mySheet2.DataInsert(-1);
					}
					break;
					
				case 'search':       
					if(1 == tar){
						if(
							('' == $('#sPrdtTp').val() || '1' == $('#sPrdtTp').val())
							&& ($('#ca2').val() == '' || $('#ca2').val() == 'C9999')
							&& $('#mValue').val() ==''
							&& $('#mName').val() ==''
							&& $('#mBrand').val() ==''
							&& $('#mStndrd').val() ==''
							&& $('#mModel').val() ==''
						){
							alert('전체상품 또는 정상상품 검색시\n\n2단계이하 카테고리 지정 또는\n\n검색어는 필수 사항 입니다.');
							break; 
						}
						$('#sPrdtCd').val('');
						mySheet1.DoSearch(_BT.FRONT.URL.Search.SheetPrdtInfoMst, $('#sheetFrm2').serialize()); 
						mySheet2.DoSearch(_BT.FRONT.URL.Search.SheetPrdtInfoDtl, $('#sheetFrm2').serialize()); 
					}else if(2 == tar){
						mySheet2.DoSearch(_BT.FRONT.URL.Search.SheetPrdtInfoDtl, $('#sheetFrm2').serialize()); 
					}
					break;
					
				case 'save':       //저장
					if(1 == tar) {
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
						var rtnData = sheet.GetSaveData(_BT.FRONT.URL.Product.SavePrdtInfoMst, SaveStr); 
						sheet.LoadSaveData(rtnData);		
					
					}else if(2 == tar){
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
						var rtnData = sheet.GetSaveData(_BT.FRONT.URL.Product.SavePrdtInfoDtl, SaveStr); 
						sheet.LoadSaveData(rtnData);		
					}
					break;  				
					
				case 'soldOut':           
					if(1 == tar){
					}else if(2 == tar){
						var sRow = mySheet2.FindCheckedRow('sCheckBox').split('|');
						if(sRow == ''){alert('일시품절 상태로 변경하실 품목을 선택해 주세요.');return false;}
						var opt = {UrlEncode:0, Mode:2, Delim:'#'};
						var SaveStr = mySheet2.GetSaveString(opt); 
						if('' == SaveStr){
							alert('일시품절 상태로 변경하실 품목을 선택해 주세요.'); 
							return false;
						}else if('KeyFieldError' == SaveStr){ 
							return false;
						}else{
							if(!confirm('일시품절 상태로 변경 하시겠습니까?')) return false;
							var rtnData = mySheet2.GetSaveData(_BT.FRONT.URL.Product.SetSoldOut, SaveStr); 
							mySheet2.LoadSaveData(rtnData);
						}
					}
					break; 
					
				case 'noSale':           
					if(1 == tar){
					}else if(2 == tar){
						var sRow = mySheet2.FindCheckedRow('sCheckBox').split('|');
						if(sRow == ''){alert('단종 상태로 변경하실 품목을 선택해 주세요.');return false;}
						var opt = {UrlEncode:0, Mode:2, Delim:'#'};
						var SaveStr = mySheet2.GetSaveString(opt); 
						if('' == SaveStr){
							alert('단종 상태로 변경하실 품목을 선택해 주세요.'); 
							return false;
						}else if('KeyFieldError' == SaveStr){ 
							return false;
						}else{
							if(!confirm('단종 상태로 변경 하시겠습니까?')) return false;
							var rtnData = mySheet2.GetSaveData(_BT.FRONT.URL.Product.SetNoSale, SaveStr); 
							mySheet2.LoadSaveData(rtnData);
						}
					}
					break; 
					
				case 'onSale':           
					if(1 == tar){
					}else if(2 == tar){
						var sRow = mySheet2.FindCheckedRow('sCheckBox').split('|');
						if(sRow == ''){alert('판매가능 상태로 변경하실 품목을 선택해 주세요.');return false;}
						var opt = {UrlEncode:0, Mode:2, Delim:'#'};
						var SaveStr = mySheet2.GetSaveString(opt); 
						if('' == SaveStr){
							alert('판매가능 상태로 변경하실 품목을 선택해 주세요.'); 
							return false;
						}else if('KeyFieldError' == SaveStr){ 
							return false;
						}else{
							if(!confirm('판매가능 상태로 변경 하시겠습니까?')) return false;
							var rtnData = mySheet2.GetSaveData(_BT.FRONT.URL.Product.SetOnSale, SaveStr); 
							mySheet2.LoadSaveData(rtnData);
						}
					}
					break; 
			}
		}
		
		function mySheet1_OnPopupClick(Row, Col){
			var sSaveName = mySheet1.ColSaveName(0, Col); 
			row = Row;			
			if( sSaveName == 'MAKR_NM'){
				_BT.openPopup( _BT.FRONT.URL.Product.PopMaker,'popMaker', '610', '500', true, true);
			}else if( sSaveName == 'CATEG_NM'){
				_BT.openPopup( _BT.FRONT.URL.Product.PopCateg,'popCateg', '400', '250', true, true);
			}
		}	
		
		function mySheet1_OnDblClick(Row, Col, Value, CellX, CellY, CellW, CellH) { 
			if (Row == 0) return; //헤더행일때는 폼에 반영 안함.
			$('#sPrdtCd').val(mySheet1.GetCellValue( Row, 'PRDT_CD' ));
			doAction('search', '2');
		} 

		function fnSetCateg(obj){
			mySheet1.SetCellValue(row, 'CATEG_NM', obj.text) ;
			mySheet1.SetCellValue(row, 'CATEG_CD', obj.code) ;
		}

		function fnSetMaker(obj){
			mySheet1.SetCellValue(row, 'MAKR_NM', obj.sMkNm) ;
			mySheet1.SetCellValue(row, 'MAKR_CD', obj.sMkCd) ;
		}
		function mySheet1_OnSaveEnd(code) {
			if(code == 1){         
				alert("요청하신 내역 처리에 성공하였습니다.");
			} else {         
				alert("요청하신 내역 처리에 실패하였습니다.");     
			} 
		} 
		function mySheet2_OnSaveEnd(code) {
			if(code == 1){         
				alert("요청하신 내역 처리에 성공하였습니다.");
			} else {         
				alert("요청하신 내역 처리에 실패하였습니다.");     
			} 
		} 
	</script>
	<div class="main_content06" style="padding-top: 0px; min-height: 850px; margin-bottom: 20px;">
		<div>
			<form id="sheetFrm2" name="sheetFrm2">
				<input type="hidden" id="PRDT_TP" name="PRDT_TP" value="J"/>			
				<input type="hidden" id="sPrdtCd" name="sPrdtCd"/>			
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
<%-- 													
								<input class="input_style20 marginleft_5" type="text" id="mStoreId" name="mStoreId" placeholder="공급사" />							
 --%>
 								<span class="return_select6 marginleft_5">
									<select class="" id="sPrdtTp" name="sPrdtTp">
										<option value="">전체</option>
										<option value="1" selected="selected">정상</option>
										<option value="5">일시품절</option>
										<option value="2">단종</option>
									</select>
								</span>
								<span class="inquiry_btn marginleft_10">
									<span data-type="detail" data-value="1" class="sButton btn_span fs-13 blue marginleft_5" style="float: right;">상세검색</span>
									<span data-type="search" data-value="1"  class="sButton btn_span fs-13 pink" style="float: right;">조회</span>
								</span>
								<div class="margintop_5">
									<span class="return_select6">
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
									<span class="return_select6 marginleft_5">
										<select class="" id="ctlImgYn" name="ctlImgYn">
											<option value="">상세이미지 유무</option>
											<option value="Y">상세이미지 있음</option>
											<option value="N">상세이미지 없음</option>
										</select>
									</span>
								</div>
								<div class="margintop_10 detail vOff">
 									<input class="input_style20" type="text" id="mTag" name="mTag" placeholder="#태그" />		
									<span class="return_select6 marginleft_5">
										<select class="" id="moveYn" name="moveYn">
											<option value="">동영상 유무</option>
											<option value="Y">동영상 있음</option>
											<option value="N">동영상 없음</option>
										</select>
									</span>
									<span class="return_select6 marginleft_5">
										<select class="" id="ebookYn" name="ebookYn">
											<option value="">카탈로그 유무</option>
											<option value="Y">카탈로그 있음</option>
											<option value="N">카탈로그 없음</option>
										</select>
									</span>
									<span class="return_select6 marginleft_5">
										<select class="" id="STcareYn" name="STcareYn">
											<option value="">대화케어 여부</option>
											<option value="Y">대화케어 여</option>
											<option value="N">대화케어 부</option>
										</select>
									</span>
									<span class="return_select6 marginleft_5">
										<select class="" id="mnfYn" name="mnfYn">
											<option value="">주문제작 여부</option>
											<option value="Y">주문제작 여</option>
											<option value="N">주문제작 부</option>
										</select>
									</span>
									<span class="return_select6 marginleft_5">
										<select class="" id="adYn" name="adYn">
											<option value="">외부광고 여부</option>
											<option value="Y">외부광고 진행</option>
											<option value="N">외부광고 미진행</option>
										</select>
									</span>
								</div>
							</td>
						</tr>
					</tbody>
				</table>	
			</form>
		</div>
		<h1 class="title_con_Type02 margintop_10">
			마스터 정보	
			<span data-type="save" data-value="1"  class="sButton btn_span fs-13 pink marginleft_5" style="float: right;">저장</span>
			<span data-type="insert" data-value="1"  class="sButton btn_span fs-13 blue marginleft_20" style="float: right;">추가</span>
		</h1>
		<div class='col-sm-5 col-md-5' style='width: 100%; height: 410px; display: block;padding-top:5px;'>
		    <div id='ib-container1'></div>
		</div>	
		<h1 class="title_con_Type02 margintop_20">
			규격/단가 정보
			<span data-type="save" data-value="2"  class="sButton btn_span fs-13 pink marginleft_5" style="float: right;">저장</span>
			<span data-type="insert" data-value="2" class="sButton btn_span fs-13 blue marginleft_20" style="float: right;">추가</span> 
			<span data-type="noSale" data-value="2"  class="sButton btn_span fs-13 pink marginleft_5" style="float: right;">단종 처리</span>
			<span data-type="soldOut" data-value="2"  class="sButton btn_span fs-13 green marginleft_5" style="float: right;">일시품절 처리</span>
			<span data-type="onSale" data-value="2"  class="sButton btn_span fs-13 blue marginleft_5" style="float: right;">판매가능 변경</span>
		</h1>	
		<div class='col-sm-5 col-md-5' style='width: 100%; height: 410px; display: block;padding-top:5px;'>
		    <div id='ib-container2'></div>
		</div>
	</div>
