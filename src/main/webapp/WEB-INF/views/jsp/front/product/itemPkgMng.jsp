<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/layout/include/base.jsp" %>
<script type="text/javascript" src="${staticRoot}/js/allCteg.js"></script>
	<script type="text/javascript">
		var dupClick1 = false;
		var isDev = 1;
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
			initSelect();
		});
		function initSelect(){
			_BT.CategSearch.makeSelect('1');
			_BT.CategSearch.makeSelect('Pm');
		}
		
		function initSheet(){
			var initData = {};
			initData.Cfg = {
			        'AutoFitColWidth': 'search|resize|init|colhidden|rowtransaction'
			        ,'UseHeaderSortCancel' : 1
					,'MergeSheet': msHeaderOnly 
					};
			initData.HeaderMode = {};
			initData.Cols = [
					{'Header': '구분', 				'Type': 'Seq', 			'MinWidth': 40,		'SaveName': 'sSeq', 			'Align': 'Center',	'Save': 1		} 
					,{'Header': '상태', 				'Type': 'Status', 		'MinWidth': 40,		'SaveName': 'sStatus', 		'Align': 'Center',	'Save': 1		} 
					,{'Header': '세트명',			'Type': 'Text', 			'MinWidth': 150, 	'SaveName': 'sTitle',			'Align': 'Left',		'Save': 1, 	'Edit':1, 		'KeyField':1}
					,{'Header': '일련번호',			'Type': 'Text', 			'MinWidth': 80, 	'SaveName': 'sPrmId', 		'Align': 'Center', 	'Save': 1, 	'Edit':0, 		'DefaultValue':'NEW' }
					,{'Header': '사용여부',			'Type': 'Combo', 		'MinWidth': 60, 	'SaveName': 'sUseYN',		'Align': 'Center',	'Save': 1,	'Edit':1,	 	'ComboText': '사용|미사용', 'ComboCode': 'Y|N' } 
			];				
			// IBSheet 생성
			createIBSheet2($('#ib-container1')[0], 'mySheet1', '100%', '300px');
			IBS_InitSheet(mySheet1, initData);	

			initData.Cols = [
					{'Header': '구분', 				'Type': 'Seq', 			'MinWidth': 0,		'SaveName': 'sSeq', 				'Align': 'Center', 	'Hidden':isDev 	} 
					,{'Header': '상태', 				'Type': 'Status', 		'MinWidth': 0,		'SaveName': 'sStatus', 			'Align': 'Center', 	'Hidden':isDev 	} 
					,{'Header': '선택',				'Type': 'CheckBox', 	'MinWidth': 40, 	'SaveName': 'sCheckBox',		'Align': 'Center',	'Edit':1	  	}   
					,{'Header': '품목코드',			'Type': 'Text', 			'MinWidth': 60,	 	'SaveName': 'sPcd', 				'Align': 'Center', 	'Edit':0		}   
					,{'Header': '규격코드',			'Type': 'Text', 			'MinWidth': 60,	 	'SaveName': 'sScd', 				'Align': 'Center', 	'Edit':0		}   
					,{'Header': '카테고리',			'Type': 'Text', 			'MinWidth': 100, 	'SaveName': 'sCnm',				'Align': 'Left', 		'Edit':0 		}  
					,{'Header': '품명',				'Type': 'Text', 			'MinWidth': 100, 	'SaveName': 'sNm',				'Align': 'Left', 		'Edit':0 		}  
					,{'Header': '규격',				'Type': 'Text', 			'MinWidth': 100, 	'SaveName': 'sSt',					'Align': 'Left', 		'Edit':0  		}  
					,{'Header': '모델명',			'Type': 'Text', 			'MinWidth': 60, 	'SaveName': 'sMd',				'Align': 'Left',		'Edit':0 		}  
					,{'Header': '공급사',			'Type': 'Text', 			'MinWidth': 60, 	'SaveName': 'STORE_NM',		'Align': 'Center',	'Edit':0 		}  
					,{'Header': '제조사',			'Type': 'Text', 			'MinWidth': 60, 	'SaveName': 'sMk',				'Align': 'Left',		'Edit':0 		}  
					,{'Header': '판매가',			'Type': 'Int',				'MinWidth': 50,		'SaveName': 'sPrice',	 			'Align': 'Right',		'Edit':0,		'Format':'Integer'	}
					,{'Header': '구매가',			'Type': 'Int',				'MinWidth': 50,		'SaveName': 'sPprice',		 	'Align': 'Right',		'Edit':0,		'Format':'Integer'	}
					,{'Header': '공급사',			'Type': 'Text', 			'MinWidth': 0,	 	'SaveName': 'STORE_ID', 		'Align': 'Center', 	'Hidden':isDev 	}   
					,{'Header': '제조사',			'Type': 'Text', 			'MinWidth': 0,	 	'SaveName': 'MAKR_CD', 		'Align': 'Center', 	'Hidden':isDev 	}   
					,{'Header': '카테고리',			'Type': 'Text', 			'MinWidth': 0,	 	'SaveName': 'sCcd', 				'Align': 'Center', 	'Hidden':isDev 	}   
			];			
			// IBSheet 생성
			createIBSheet2($('#ib-container2')[0], 'mySheet2', '100%', '300px');
			IBS_InitSheet(mySheet2, initData);	
			
			initData.Cols = [
					{'Header': '삭제',				'Type': 'DelCheck', 		'MinWidth': 40, 	'SaveName': 'sDcb',				'Align': 'Center',	'Edit':1	  	}   
					,{'Header': '규격코드',			'Type': 'Text', 				'MinWidth': 60,	 	'SaveName': 'sScd', 				'Align': 'Center', 	'Edit':0		}   
					,{'Header': '품명',				'Type': 'Text', 				'MinWidth': 100, 	'SaveName': 'sNm',				'Align': 'Left', 		'Edit':0 		}  
					,{'Header': '규격',				'Type': 'Text', 				'MinWidth': 130, 	'SaveName': 'sSt',					'Align': 'Left', 		'Edit':0 		}  
					,{'Header': '제조사',			'Type': 'Text', 				'MinWidth': 40, 	'SaveName': 'sMk',				'Align': 'Center', 	'Edit':0 		}  
					,{'Header': '판매가',			'Type': 'Int',					'MinWidth': 50,		'SaveName': 'sPrice',			 	'Align': 'Right',		'Edit':0,		'Format':'Integer'	}
					,{'Header': '카테고리',			'Type': 'Text', 				'MinWidth': 60,	 	'SaveName': 'sCcd', 				'Align': 'Center', 	'Hidden':isDev 	} 
					,{'Header': '품목코드',			'Type': 'Text', 				'MinWidth': 60,	 	'SaveName': 'sPcd', 				'Align': 'Center', 	'Hidden':isDev 	} 
					,{'Header': '구분', 				'Type': 'Seq', 				'MinWidth': 0,		'SaveName': 'sSeq', 				'Align': 'Center', 	'Hidden':isDev 	} 
					,{'Header': '상태', 				'Type': 'Status', 			'MinWidth': 0,		'SaveName': 'sStatus', 			'Align': 'Center', 	'Hidden':isDev 	} 
			];					
			// IBSheet 생성
			createIBSheet2($('#ib-container3')[0], 'mySheet3', '100%', '500px');
			IBS_InitSheet(mySheet3, initData);	

			initData.Cols = [
					{'Header': '삭제',				'Type': 'DelCheck', 		'MinWidth': 40, 	'SaveName': 'sDcb',				'Align': 'Center',	'Edit':1	  	}   
					,{'Header': '규격코드',			'Type': 'Text', 				'MinWidth': 60,	 	'SaveName': 'sScd', 				'Align': 'Center', 	'Edit':0		}   
					,{'Header': '품명',				'Type': 'Text', 				'MinWidth': 100, 	'SaveName': 'sNm',				'Align': 'Left', 		'Edit':0 		}  
					,{'Header': '규격',				'Type': 'Text', 				'MinWidth': 130, 	'SaveName': 'sSt',					'Align': 'Left', 		'Edit':0 		}  
					,{'Header': '제조사',			'Type': 'Text', 				'MinWidth': 40, 	'SaveName': 'sMk',				'Align': 'Center', 	'Edit':0 		}  
					,{'Header': '판매가',			'Type': 'Int',					'MinWidth': 50,		'SaveName': 'sPrice',		 		'Align': 'Right',		'Edit':0,		'Format':'Integer'	}
					,{'Header': '구분', 				'Type': 'Seq', 				'MinWidth': 0,		'SaveName': 'sSeq', 				'Align': 'Center', 	'Hidden':isDev 	} 
					,{'Header': '상태', 				'Type': 'Status', 			'MinWidth': 0,		'SaveName': 'sStatus', 			'Align': 'Center', 	'Hidden':isDev 	} 
					,{'Header': '프로모션',			'Type': 'Text', 				'MinWidth': 0,	 	'SaveName': 'sPrmId',			'Align': 'Center', 	'Hidden':isDev 	}   
					,{'Header': '게시물',			'Type': 'Text', 				'MinWidth': 0,	 	'SaveName': 'sArtCd',			'Align': 'Center', 	'Hidden':isDev 	}   
					,{'Header': '구분', 				'Type': 'Seq', 				'MinWidth': 0,		'SaveName': 'sSeq', 				'Align': 'Center', 	'Hidden':isDev 	} 
					,{'Header': '품목코드',			'Type': 'Text', 				'MinWidth': 60,	 	'SaveName': 'sPcd', 				'Align': 'Center', 	'Hidden':isDev 	} 
					,{'Header': '카테고리',			'Type': 'Text', 				'MinWidth': 60,	 	'SaveName': 'sCcd', 				'Align': 'Center', 	'Hidden':isDev 	} 
			];					
			// IBSheet 생성
			createIBSheet2($('#ib-container4')[0], 'mySheet4', '100%', '500px');
			IBS_InitSheet(mySheet4, initData);	
			
			// 편집 가능 여부 설정
			mySheet1.SetEditable(1);
			mySheet2.SetEditable(1);
			mySheet3.SetEditable(1);
			mySheet4.SetEditable(1);

			//마우스오버
			mySheet1.SetMouseHoverMode(2) 
			mySheet2.SetMouseHoverMode(2) 
			mySheet3.SetMouseHoverMode(2) 
			mySheet4.SetMouseHoverMode(2) 
			
			// 사이즈 맞춤
			mySheet1.FitColWidth();
			mySheet2.FitColWidth();
			mySheet3.FitColWidth();
			mySheet4.FitColWidth();
		}		

		function doAction(sAction, tar) { 
			switch(sAction) {  
				case 'search':       
					var sheet = eval('mySheet' + tar);
					if(1 == tar){
						$('#mAartCd').val('');
						$('#mPrmId').val('');
						mySheet3.RemoveAll(); 
						mySheet4.RemoveAll(); 
						sheet.DoSearch(_BT.FRONT.URL.Search.SheeMovieList, $('#sheetFrm').serialize()); 
					}else if(2 == tar){
						if(
							($('#ca3').val() == '' || $('#ca3').val() == 'C9999')
							&& $('#mValue').val() ==''
						){
							alert('3단계 이상 카테고리 선택 또는 검색어는 필수 사항 입니다.');
							break; 
						}
						sheet.DoSearch(_BT.FRONT.URL.Search.SheetPrdDtltList, $('#sheetFrm2').serialize()); 
					}else if(3 == tar){
						if(	$('#mPrmId').val() == ''){
							alert('구성하실 세트상품을 선택해 주세요.');
							break; 
						}
						$('#mAartCd').val($('#mPrmId').val());
						sheet.DoSearch(_BT.FRONT.URL.Search.SheetPromoPrdtList, $('#sheetFrm3').serialize()); 
					}else if(4 == tar){
						if(	$('#mPrmId').val() == ''){
							alert('구성하실 세트상품을 선택해 주세요.');
							break; 
						}
						$('#mAartCd').val('0');
						sheet.DoSearch(_BT.FRONT.URL.Search.SheetPromoPrdtList, $('#sheetFrm3').serialize()); 
					}
				break; 
				case 'add':   
					var sheet = eval('mySheet' + tar);
					if(1 == tar){
						var row = sheet.DataInsert(-1);
					}else if(3 == tar){
						var opt = {UrlEncode:0, Mode:1};
						var SaveStr = mySheet2.GetSaveJson(opt); 
						if(SaveStr.data.length <1){
							alert('선택 내역이 없습니다.\n\n다시 확인 부탁 드립니다.');
							break;   
						}						
						sheet.LoadSearchData(SaveStr,{Sync:1,Append:1});
					}else if(4 == tar){
						var opt = {UrlEncode:0, Mode:1};
						var SaveStr = mySheet2.GetSaveJson(opt); 
						if(SaveStr.data.length <1){
							alert('선택 내역이 없습니다.\n\n다시 확인 부탁 드립니다.');
							break;   
						}						
						sheet.LoadSearchData(SaveStr,{Sync:1,Append:1});
					}
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
					} 
					if(1 == tar){
						if(!confirm('변경 내역을 저장하시겠습니까?')) break;
						var rtnData = sheet.GetSaveData(_BT.FRONT.URL.Product.SetItemPkg, SaveStr+ "&"+$('#sheetFrm').serialize()); 
						sheet.LoadSaveData(rtnData);
					} else if(3 == tar) {
						if(	'' == $('#mPrmId').val()){
							alert('구성하실 세트상품을 선택해 주세요.');
							break; 
						}
						if(!confirm('변경 내역을 저장하시겠습니까?')) break;
						$('#mAartCd').val($('#mPrmId').val());
						var rtnData = sheet.GetSaveData(_BT.FRONT.URL.Site.SetPromoPrdt, SaveStr + "&"+$('#sheetFrm3').serialize()); 
						sheet.LoadSaveData(rtnData);
					}else if(4 == tar){
						if(	'' == $('#mPrmId').val()){
							alert('구성하실 세트상품을 선택해 주세요.');
							break; 
						}
						if(!confirm('변경 내역을 저장하시겠습니까?')) break;
						$('#mAartCd').val('0');
						var rtnData = sheet.GetSaveData(_BT.FRONT.URL.Site.SetPromoPrdt, SaveStr + "&"+$('#sheetFrm3').serialize()); 
						sheet.LoadSaveData(rtnData);
					}
				break; 
			} 
		}		
		function mySheet1_OnDblClick(Row, Col, Value, CellX, CellY, CellW, CellH) { 
			if (Row == 0) return; //헤더행일때는 폼에 반영 안함.
			var sPrmId = mySheet1.GetCellValue( Row, 'sPrmId' );
			$('#mPrmId').val(sPrmId);
			doAction('search', '3');
			doAction('search', '4');
		} 
		function mySheet1_OnSaveEnd(code) {
			if(code == 1){         
				alert("저장에 성공하였습니다.");
			} else {         
				alert("저장에 실패하였습니다.");     
			} 
		} 
		function mySheet3_OnSaveEnd(code) {
			if(code == 1){         
				alert("저장에 성공하였습니다.");
			} else {         
				alert("저장에 실패하였습니다.");     
			} 
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
				<input type="hidden" id="sBbsId" name="sBbsId" value="OPT"/>		
				<table class="tbl_Type02">
					<caption>조회</caption>
					<colgroup>
						<col width="15%">
						<col width="%">
					</colgroup>
					<tbody>
						<tr>
							<th>
								옵션세트 조회
							</th>
							<td style="text-align: left;">
								<input type="text" id="artCd" name="artCd"  class="input_style08 marginleft_7" placeholder="검색어 입력">							
								<span class="inquiry_btn marginleft_7">
									<span data-type="save" data-value="1" class="sButton btn_span fs-13 pink marginleft_5" style="float: right;">저장</span>
									<span data-type="add" data-value="1" class="sButton btn_span fs-13 green marginleft_5" style="float: right;">추가</span>
									<span data-type="search" data-value="1" class="sButton btn_span fs-13 blue" style="float: right;">조회</span>
								</span>
							</td>
						</tr>
					</tbody>
				</table>	
			</form>
		</div>
		<div class="col-sm-5 col-md-5 margintop_10">
		    <div id="ib-container1"></div>
		</div>
		<div class="signup_agree">
			<p class="alarm_txt">※ <span class="redCr " >미사용</span>으로 변경 후 에는 <span class="redCr " >복구가 불가</span> 합니다.</p>
		</div>
		<h1 class="title_con_Type02 margintop_40">
			상품검색
		</h1>	
		<div class="margintop_10">
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
									<span data-type="search" data-value="2"  class="sButton btn_span fs-13 blue" style="float: right;">조회</span>
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
			<form id="sheetFrm3" name="sheetFrm3">
				<input type="hidden" id="mAartCd" name="mAartCd"/>			
				<input type="hidden" id="mPrmId" name="mPrmId"/>			
			</form>
		</div>
		<div class="col-sm-5 col-md-5" style="margin-top:10px;" >
		    <div id="ib-container2"></div>
		</div>
		<div style="display: table-cell;width: 624px;">
			<div class="margintop_10">
				<h1 class="title_con_Type02">
					세트상품
					<span data-type="save" data-value="3"  class="sButton btn_span fs-13 pink marginleft_5" style="float: right;">저장</span>
					<span data-type="add" data-value="3" class="sButton btn_span fs-13 green" style="float: right;">선택</span>
				</h1>		
			</div>
			<div class="col-sm-5 col-md-5" style="margin-top:10px;">
			    <div id="ib-container3"></div>
			</div>		
		</div>
		<div style="display: table-cell;width: 624px; padding-left: 5px;">
			<div class="margintop_10">
				<h1 class="title_con_Type02">
					메인상품
					<span data-type="save" data-value="4"  class="sButton btn_span fs-13 pink marginleft_5" style="float: right;">저장</span>
					<span data-type="add" data-value="4"  class="sButton btn_span fs-13 blue" style="float: right;">선택</span>
				</h1>		
			</div>
			<div class="col-sm-5 col-md-5" style="margin-top:10px;">
			    <div id="ib-container4"></div>
			</div>		
		</div>
	</div>
