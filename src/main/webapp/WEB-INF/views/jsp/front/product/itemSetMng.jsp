<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/layout/include/base.jsp" %>
	<div class="main_content06" style="padding-top: 0px; min-height: 800px; margin-bottom: 20px;">
		<div>
			<form id="sheetFrm" name="sheetFrm">	
				<input type="hidden" id="sBbsId" name="sBbsId" value="SET"/>		
				<table class="tbl_Type02">
					<caption>조회</caption>
					<colgroup>
						<col width="15%">
						<col width="%">
					</colgroup>
					<tbody>
						<tr>
							<th>
								모음전 상품조회
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
		<div style="display: table-cell;width: 624px;">
			<form id="sheetFrm1" name="sheetFrm1">
				<input type="hidden" id="cTp" name="cTp"/>			
				<input type="hidden" id="cCode" name="cCode"/>			
				<h1 class="title_con_Type02" style="margin-top:20px;">
					대표상품 검색
					<span data-type="search" data-value="2"  class="sButton btn_span fs-13 blue marginleft_5" style="float: right;">조회</span>
					<input class="input_style20 marginleft_5" type="text" id="mCd" name="mCd" placeholder="품목코드" style="float: right;"/>							
					<input class="input_style20" type="text" id="mNm" name="mNm" placeholder="품명" style="float: right;"/>							
				</h1>
			</form>
			<div class="col-sm-5 col-md-5" style="margin-top:10px;" >
			    <div id="ib-container2"></div>
			</div>
		</div>
		<div style="display: table-cell;width: 624px; padding-left: 5px;">
			<form id="sheetFrm3" name="sheetFrm3">
				<input type="hidden" id="mAartCd" name="mAartCd"/>			
				<input type="hidden" id="mPrmId" name="mPrmId"/>			
				<input type="hidden" id="mSeq" name="mSeq"/>			
				<input type="hidden" id="mInm" name="mInm"/>			
			</form>
			<h1 class="title_con_Type02" style="margin-top:20px;">
				1. 대표상품 선택
				<span data-type="save" data-value="3"  class="sButton btn_span fs-13 pink marginleft_5" style="float: right;">저장</span>
				<span data-type="add" data-value="3"  class="sButton btn_span fs-13 blue" style="float: right;">선택</span>
			</h1>		
			<div class="col-sm-5 col-md-5" style="margin-top:10px;">
			    <div id="ib-container3"></div>
			</div>	
		</div>
		<h1 class="title_con_Type02 margintop_40">
			모음구성 상품검색
		</h1>	
		<div class="margintop_10" style="">
			<form id="sheetFrm2" name="sheetFrm2">
				<input type="hidden" id="cTp" name="cTp"/>			
				<input type="hidden" id="cCode" name="cCode"/>			
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
								<input class="input_style20 marginleft_5" type="text" id="mCode" name="mCode" placeholder="코드번호" />							
								<span class="inquiry_btn marginleft_7">
									<span data-type="search" data-value="4"  id="main_search_btn" class="sButton btn_span fs-13 blue" style="float: right;">조회</span>
								</span>
							</td>
						</tr>
					</tbody>
				</table>	
			</form>
		</div>
		<div class="col-sm-5 col-md-5" style="margin-top:10px;" >
		    <div id="ib-container4"></div>
		</div>
		<div style="display: table-cell;width: 624px;">
			<h1 class="title_con_Type02" style="margin-top:30px;">
				옵션상품 이미지
			</h1>
			<div class="col-sm-5 col-md-5" style="margin-top:23px;" >
			    <div id="ib-container6"></div>
			</div>
		</div>
		<div style="display: table-cell;width: 624px; padding-left: 5px;">
			<h1 class="title_con_Type02" style="margin-top:30px;">
				3. 옵션 묶음상품
				<span data-type="save" data-value="7" class="sButton btn_span fs-13 pink marginleft_5" style="float: right;">저장</span>
				<span data-type="add" data-value="7" class="sButton btn_span fs-13 blue" style="float: right;">선택</span>
			</h1>		
			<div class="col-sm-5 col-md-5" style="margin-top:10px;">
			    <div id="ib-container7"></div>
			</div>	
		</div>	
	</div>
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
			_BT.setOnEnter("mValue","main_search_btn");	
			initSheet();
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
					{'Header': '구분', 				'Type': 'Seq', 				'MinWidth': 40,		'SaveName': 'sSeq', 			'Align': 'Center',	'Save': 1		} 
					,{'Header': '상태', 				'Type': 'Status', 			'MinWidth': 40,		'SaveName': 'sStatus', 		'Align': 'Center',	'Save': 1		} 
					,{'Header': '모음전명',			'Type': 'Text', 				'MinWidth': 150, 	'SaveName': 'sTitle',			'Align': 'Left',		'Save': 1, 	'Edit':1, 		'KeyField':1}
					,{'Header': '일련번호',			'Type': 'Text', 				'MinWidth': 80, 	'SaveName': 'sPrmId', 		'Align': 'Center', 	'Save': 1, 	'Edit':0, 		'DefaultValue':'NEW' }
					,{'Header': '사용여부',			'Type': 'Combo', 			'MinWidth': 60, 	'SaveName': 'sUseYN',		'Align': 'Center',	'Save': 1,	'Edit':1,	 	'ComboText': '사용|미사용', 'ComboCode': 'Y|N' } 
			];				
			// IBSheet 생성
			createIBSheet2($('#ib-container1')[0], 'mySheet1', '100%', '250px');
			IBS_InitSheet(mySheet1, initData);	

			initData.Cols = [
					{'Header': '구분', 				'Type': 'Seq', 				'MinWidth': 0,		'SaveName': 'sSeq', 			'Align': 'Center', 	'Hidden':isDev 	} 
					,{'Header': '상태', 				'Type': 'Status', 			'MinWidth': 0,		'SaveName': 'sStatus', 		'Align': 'Center', 	'Hidden':isDev 	} 
					,{'Header': '선택',				'Type': 'CheckBox', 		'MinWidth': 40, 	'SaveName': 'sCheckBox',	'Align': 'Center',	'Edit':1	  	}   
					,{'Header': '품목코드',			'Type': 'Text', 				'MinWidth': 60,	 	'SaveName': 'sPcd',		 	'Align': 'Center', 	'Edit':0		}   
					,{'Header': '품명',				'Type': 'Text', 				'MinWidth': 100, 	'SaveName': 'sNm',			'Align': 'Left', 		'Edit':0 		}  
					,{'Header': '제조사',			'Type': 'Text', 				'MinWidth': 60, 	'SaveName': 'sMk',			'Align': 'Left',		'Edit':0 		}  
					,{'Header': '카테고리', 			'Type': 'Text', 				'MinWidth': 0,		'SaveName': 'sCcd', 			'Align': 'Left', 		'Hidden':isDev 	} 
					,{'Header': '규격코드', 			'Type': 'Text', 				'MinWidth': 0,		'SaveName': 'sScd', 			'Align': 'Left', 		'Hidden':isDev 	} 
			];			
			// IBSheet 생성
			createIBSheet2($('#ib-container2')[0], 'mySheet2', '100%', '250px');
			IBS_InitSheet(mySheet2, initData);				
				
			initData.Cols = [
					{'Header': '구분', 				'Type': 'Seq', 				'MinWidth': 0,		'SaveName': 'sSeq', 			'Align': 'Center', 	'Hidden':isDev 	} 
					,{'Header': '상태', 				'Type': 'Status', 			'MinWidth': 0,		'SaveName': 'sStatus', 		'Align': 'Center', 	'Hidden':isDev 	} 
					,{'Header': '삭제',				'Type': 'DelCheck', 		'MinWidth': 40, 	'SaveName': 'sDcb',			'Align': 'Center',	'Edit':1	  	}   
					,{'Header': '품목코드',			'Type': 'Text', 				'MinWidth': 60,	 	'SaveName': 'sPcd', 			'Align': 'Center', 	'Edit':0		}   
					,{'Header': '품명',				'Type': 'Text', 				'MinWidth': 100, 	'SaveName': 'sNm',			'Align': 'Left', 		'Edit':0 		}  
					,{'Header': '제조사',			'Type': 'Text', 				'MinWidth': 40, 	'SaveName': 'sMk',			'Align': 'Center', 	'Edit':0 		}  
					,{'Header': '카테고리', 			'Type': 'Text', 				'MinWidth': 0,		'SaveName': 'sCcd', 			'Align': 'Left', 		'Hidden':isDev 	} 
					,{'Header': '규격코드', 			'Type': 'Text', 				'MinWidth': 0,		'SaveName': 'sScd', 			'Align': 'Left', 		'Hidden':isDev 	} 
					,{'Header': '프로모션',			'Type': 'Text', 				'MinWidth': 0,	 	'SaveName': 'sPrmId',		'Align': 'Center', 	'Hidden':isDev 	}   
					,{'Header': '게시물',			'Type': 'Text', 				'MinWidth': 0,	 	'SaveName': 'sArtCd',		'Align': 'Center', 	'Hidden':isDev 	}   
			];					
			// IBSheet 생성
			createIBSheet2($('#ib-container3')[0], 'mySheet3', '100%', '250px');
			IBS_InitSheet(mySheet3, initData);	
				
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
			createIBSheet2($('#ib-container4')[0], 'mySheet4', '100%', '300px');
			IBS_InitSheet(mySheet4, initData);	
					
			initData.Cols = [
					{'Header': '구분', 		'Type': 'Seq', 			'MinWidth': 0,		'SaveName': 'sSeq', 			'Align': 'Center', 	'Hidden':isDev 	} 
					,{'Header': '상태', 		'Type': 'Status', 		'MinWidth': 0,		'SaveName': 'sStatus', 		'Align': 'Center', 	'Hidden':isDev 	} 
					,{'Header': '선택',		'Type': 'CheckBox', 	'MinWidth': 20, 	'SaveName': 'sCheckBox',	'Align': 'Center',	'Edit':1	  		}   
					,{'Header': '순번',		'Type': 'Text', 			'MinWidth': 60,	 	'SaveName': 'PSEQ', 			'Align': 'Center', 	'Edit':0			}   
					,{'Header': '경로',		'Type': 'Text', 			'MinWidth': 60,	 	'SaveName': 'IDIR', 			'Align': 'Center', 	'Hidden':isDev 	}   
					,{'Header': '파일',		'Type': 'Text', 			'MinWidth': 60,	 	'SaveName': 'INM', 			'Align': 'Center', 	'Hidden':isDev 	} 
					,{'Header': '이미지', 	'Type': 'Image', 		'MinWidth': 200,	'SaveName': 'sImg', 			'Align': 'Left', 		'Edit':0, 			'ImgMinWidth': 200, 'ImgHeight': 150	}
			];					
			// IBSheet 생성
			createIBSheet2($('#ib-container6')[0], 'mySheet6', '100%', '400px');
			IBS_InitSheet(mySheet6, initData);	
			
			initData.Cols = [
				{'Header': '상태', 				'Type': 'Status', 			'MinWidth': 0,		'SaveName': 'sStatus', 			'Align': 'Center', 	'Edit':0, 	'Hidden':isDev 	} 
				,{'Header': '삭제',				'Type': 'DelCheck', 		'MinWidth': 40, 	'SaveName': 'sDcb',				'Align': 'Center',	'Edit':1	  	}   
				,{'Header': '선택',				'Type': 'CheckBox', 		'MinWidth': 40, 	'SaveName': 'sCheckBox',		'Align': 'Center',	'Edit':1	  	}   
				,{'Header': '순번', 				'Type': 'Text', 				'MinWidth': 40,		'SaveName': 'PSEQ', 				'Align': 'Center', 	'Edit':0, 		'KeyField':1}  
				,{'Header': '파일',				'Type': 'Text', 				'MinWidth': 60,	 	'SaveName': 'INM', 				'Align': 'Center', 	'Hidden':isDev 	} 
				,{'Header': '규격코드',			'Type': 'Text', 				'MinWidth': 60,	 	'SaveName': 'sScd', 				'Align': 'Center', 	'Edit':0		}   
				,{'Header': '품명',				'Type': 'Text', 				'MinWidth': 100, 	'SaveName': 'sNm',				'Align': 'Left', 		'Edit':0 		}  
				,{'Header': '규격',				'Type': 'Text', 				'MinWidth': 130, 	'SaveName': 'sSt',					'Align': 'Left', 		'Edit':0 		}  
				,{'Header': '제조사',			'Type': 'Text', 				'MinWidth': 40, 	'SaveName': 'sMk',				'Align': 'Center', 	'Edit':0 		}  
				,{'Header': '판매가',			'Type': 'Int',					'MinWidth': 50,		'SaveName': 'sPrice',			 	'Align': 'Right',		'Edit':0,		'Format':'Integer'	}
				,{'Header': '구분', 				'Type': 'Seq', 				'MinWidth': 0,		'SaveName': 'sSeq', 				'Align': 'Center', 	'Hidden':isDev 	} 
			];					
			// IBSheet 생성
			createIBSheet2($('#ib-container7')[0], 'mySheet7', '100%', '400px');
			IBS_InitSheet(mySheet7, initData);	
			
			// 편집 가능 여부 설정
			mySheet1.SetEditable(1);
			mySheet2.SetEditable(1);
			mySheet3.SetEditable(1);
			mySheet4.SetEditable(1);
			mySheet6.SetEditable(1);
			mySheet7.SetEditable(1);
			
			//마우스오버
			mySheet1.SetMouseHoverMode(2) 
			mySheet2.SetMouseHoverMode(2) 
			mySheet3.SetMouseHoverMode(2) 
			mySheet4.SetMouseHoverMode(2) 
			mySheet6.SetMouseHoverMode(2) 
			mySheet7.SetMouseHoverMode(2) 
			
			// 사이즈 맞춤
			mySheet1.FitColWidth();
			mySheet2.FitColWidth();
			mySheet3.FitColWidth();
			mySheet4.FitColWidth();
			mySheet6.FitColWidth();
			mySheet7.FitColWidth();

			//필터기능 추가
			mySheet7.ShowFilterRow();
			
		}		

		function doAction(sAction, tar) { 
			switch(sAction) {  
				case 'search':       
					var sheet = eval('mySheet' + tar);
					if(1 == tar){
						$('#mAartCd').val('');
						$('#mPrmId').val('');
						mySheet2.RemoveAll(); 
						mySheet3.RemoveAll(); 
						mySheet4.RemoveAll(); 
						mySheet6.RemoveAll(); 
						mySheet7.RemoveAll(); 
						sheet.DoSearch(_BT.FRONT.URL.Search.SheeMovieList, $('#sheetFrm').serialize()); 

					}else if(2 == tar){
						sheet.DoSearch(_BT.FRONT.URL.Search.SheetSetPrdMst, $('#sheetFrm1').serialize()); 
						
					}else if(3 == tar){
						if(	$('#mPrmId').val() == ''){
							alert('구성하실 세트상품을 선택해 주세요.');
							break; 
						}
						$('#mAartCd').val('0');
						sheet.DoSearch(_BT.FRONT.URL.Search.SheetSetPrdtList, $('#sheetFrm3').serialize()); 
						
					}else if(4 == tar){
						if(
								$('#mValue').val() ==''
							&&	 $('#mName').val() ==''
							&&	 $('#mBrand').val() ==''
							&&	 $('#mPrdtCd').val() ==''
						){
							alert('검색어는 필수 사항 입니다.');
							break; 
						}
						sheet.DoSearch(_BT.FRONT.URL.Search.SheetPrdDtltList, $('#sheetFrm2').serialize()); 
						
					}else if(5 == tar){
						if(	$('#mPrmId').val() == ''){
							alert('구성하실 세트상품을 선택해 주세요.');
							break; 
						}
						$('#mAartCd').val($('#mPrmId').val());
						sheet.DoSearch(_BT.FRONT.URL.Search.SheetPromoPrdtList, $('#sheetFrm3').serialize()); 
						
					}else if(6 == tar){
						if(	'' == $('#mPrmId').val()){
							alert('세트상품을 선택해 주세요.');
							break; 
						}
						sheet.DoSearch(_BT.FRONT.URL.Search.SheetPrdtImgL, $('#sheetFrm3').serialize()); 

					}else if(7 == tar){
						if(	'' == $('#mPrmId').val()){
							alert('세트상품을 선택해 주세요.');
							break; 
						}
						sheet.DoSearch(_BT.FRONT.URL.Search.SheetImgPrdt, $('#sheetFrm3').serialize()); 
					}
				break; 
				case 'add':   
					if(1 == tar){
						var row = mySheet1.DataInsert(-1);

					}else if(3 == tar){
						var opt = {UrlEncode:0, Mode:1};
						var SaveStr = mySheet2.GetSaveJson(opt); 
						if(SaveStr.data.length <1){
							alert('선택 내역이 없습니다.\n\n다시 확인 부탁 드립니다.');
							break;   
						}						
						mySheet3.LoadSearchData(SaveStr,{Sync:1,Append:1});
					
					}else if(5 == tar){
						if(	'' == $('#mPrmId').val()){
							alert('세트상품을 선택해 주세요.');
							break; 
						}
						var opt = {UrlEncode:0, Mode:1};
						var SaveStr = mySheet4.GetSaveJson(opt); 
						if(SaveStr.data.length <1){
							alert('선택 내역이 없습니다.\n\n다시 확인 부탁 드립니다.');
							break;   
						}						
						mySheet7.LoadSearchData(SaveStr,{Sync:1,Append:1});
					
					}else if(7 == tar){
						var sRow = mySheet6.FindCheckedRow('sCheckBox').split('|');
						if(sRow.length != 1){alert('옵션상품 이미지를 한개만 선택 바랍니다.');return false;}
						var seq = '';
						var inm = '';
						for(var i=0; i < sRow.length; i++){
							seq= mySheet6.GetCellValue(sRow[i], 'PSEQ');
							inm= mySheet6.GetCellValue(sRow[i], 'INM');
						}
						var sRow2 = mySheet7.FindCheckedRow('sCheckBox').split('|');
						if(sRow2.length < 1){alert('옵션상품을  이미지를 한개이상 선택 바랍니다.');return false;}
						for(var i=0; i < sRow2.length; i++){
							mySheet7.SetCellValue(sRow2[i], 'PSEQ', seq);
							mySheet7.SetCellValue(sRow2[i], 'INM', inm);
						}
						mySheet7.CheckAll('sCheckBox',0);
						mySheet6.CheckAll('sCheckBox',0);
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
						var rtnData = sheet.GetSaveData(_BT.FRONT.URL.Product.SetItemSet, SaveStr+ "&"+$('#sheetFrm').serialize()); 
						sheet.LoadSaveData(rtnData);
					
					} else if(3 == tar) {
						if(	'' == $('#mPrmId').val()){
							alert('세트상품을 선택해 주세요.');
							break; 
						}
						if(!confirm('변경 내역을 저장하시겠습니까?')) break;
						$('#mAartCd').val('0');
						var rtnData = sheet.GetSaveData(_BT.FRONT.URL.Site.SetPkgPrdt, SaveStr + "&"+$('#sheetFrm3').serialize()); 
						sheet.LoadSaveData(rtnData);
					
					}else if(5 == tar){
						if(	'' == $('#mPrmId').val()){
							alert('세트상품을 선택해 주세요.');
							break; 
						}
						if(!confirm('변경 내역을 저장하시겠습니까?')) break;
						$('#mAartCd').val($('#mPrmId').val());
						var rtnData = sheet.GetSaveData(_BT.FRONT.URL.Site.SetPkgPrdt, SaveStr + "&"+$('#sheetFrm3').serialize()); 
						sheet.LoadSaveData(rtnData);
					
					}else if(7 == tar){
						if(	'' == $('#mPrmId').val()){
							alert('세트상품을 선택해 주세요.');
							break; 
						}
						if(!confirm('변경 내역을 저장하시겠습니까?')) break;
						$('#mAartCd').val($('#mPrmId').val());
						var rtnData = sheet.GetSaveData(_BT.FRONT.URL.Site.SetImgPrdt, SaveStr + "&"+$('#sheetFrm3').serialize()); 
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
			doAction('search', '6');
			doAction('search', '7');
		} 
		function mySheet4_OnDblClick(Row, Col, Value, CellX, CellY, CellW, CellH) { 
			if (Row == 0) return; //헤더행일때는 폼에 반영 안함.
			mySheet4.SetCellValue(Row, 'sCheckBox', 1);  
			doAction('add', '5');
		} 
		function mySheet6_OnDblClick(Row, Col, Value, CellX, CellY, CellW, CellH) { 
			if (Row == 0) return; //헤더행일때는 폼에 반영 안함.
			mySheet6.CheckAll('sCheckBox',0);
			mySheet6.SetCellValue(Row, 'sCheckBox', 1);
			
			var sImg = mySheet6.GetCellValue( Row, 'sImg' );
			var url = $(location).attr('protocol') + '//' + $(location).attr('host') + sImg;
			_BT.openPopup(url, 'ImgPop', '920', '600', true, true);
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
		function mySheet5_OnSaveEnd(code) {
			if(code == 1){         
				alert("저장에 성공하였습니다.");
			} else {         
				alert("저장에 실패하였습니다.");     
			} 
		} 
		function mySheet7_OnSaveEnd(code) {
			if(code == 1){         
				alert("저장에 성공하였습니다.");
			} else {         
				alert("저장에 실패하였습니다.");     
			} 
		} 
	</script>