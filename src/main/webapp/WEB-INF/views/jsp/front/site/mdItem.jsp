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
			initSelect();
			//_BT.makeCalendar("sSdt", "yy-mm-dd");
			//_BT.makeCalendar("sEdt",   "yy-mm-dd");
			doAction('search','99');
		});
		function initSheet(){
			var initData = {};
			initData.Cfg = {
								'AutoFitColWidth': 'search|resize|init|colhidden|rowtransaction'
								};
			initData.HeaderMode = {};
	
			initData.Cols = [
				{'Header': '구분', 			'Type': 'Seq', 				'MinWidth': 10,		'SaveName': 'sSeq', 			'Align': 'Center', 	'Hidden':0 	}, 
				{'Header': '상태', 			'Type': 'Status', 			'MinWidth': 10,		'SaveName': 'sStatus', 		'Align': 'Center', 	'Hidden':0 	}, 
				{'Header': '1카테고리',		'Type': 'Text', 				'MinWidth': 10,	 	'SaveName': 'sCcd1', 		'Align': 'Center', 	'Hidden':0 	},   
				{'Header': '카테고리',		'Type': 'Text', 				'MinWidth': 10,	 	'SaveName': 'sCcd', 			'Align': 'Center', 	'Hidden':0 	},   
				{'Header': '이미지',			'Type': 'Text', 				'MinWidth': 10,	 	'SaveName': 'sImg', 			'Align': 'Center', 	'Hidden':0 	},   
				{'Header': '선택',			'Type': 'CheckBox', 		'MinWidth': 40, 	'SaveName': 'sCheckBox',	'Align': 'Center',	'Edit':1	  	},   
				{'Header': '품목코드',		'Type': 'Text', 				'MinWidth': 40,	 	'SaveName': 'sPcd', 			'Align': 'Center', 	'Edit':0		},   
				{'Header': '카테고리',		'Type': 'Text', 				'MinWidth': 40,	 	'SaveName': 'sCnm', 			'Align': 'Center', 	'Edit':0		},   
				{'Header': '품명',			'Type': 'Text', 				'MinWidth': 130, 	'SaveName': 'sNm',			'Align': 'Left', 		'Edit':0 		},  
				{'Header': '규격',			'Type': 'Text', 				'MinWidth': 130, 	'SaveName': 'sSt',				'Align': 'Left', 		'Edit':0 		},  
				{'Header': '제조사',			'Type': 'Text', 				'MinWidth': 40, 	'SaveName': 'sMk',			'Align': 'Center', 	'Edit':0 		} 	
			];					
			// IBSheet 생성
			createIBSheet2($('#ib-container0')[0], 'mySheet0', '100%', '300px');
			// IBSheet 초기화
			IBS_InitSheet(mySheet0, initData);	
			// 편집 가능 여부 설정
			mySheet0.SetEditable(1);
			// 사이즈 맞춤
			mySheet0.FitColWidth();
			//건수 정보 표시
			mySheet0.SetCountPosition(4);
			//페이지 네비게이션 버튼 표시
			//mySheet0.SetPagingPosition(1);
			//필터기능 추가
			mySheet0.ShowFilterRow();

			var dev = 0;
			initData.Cols = [
				{'Header': '구분', 			'Type': 'Seq', 				'MinWidth': 0,		'SaveName': 'sSeq', 			'Align': 'Center', 	'Hidden':dev 	}, 
				{'Header': '상태', 			'Type': 'Status', 			'MinWidth': 0,		'SaveName': 'sStatus', 		'Align': 'Center', 	'Hidden':dev 	},
				{'Header': '대표이미지', 	'Type': 'Text', 				'MinWidth': 160,	'SaveName': 'sImg', 			'Align': 'Center', 	'Hidden':dev 	},
				{'Header': '품목코드', 		'Type': 'Text', 				'MinWidth': 50,		'SaveName': 'sPcd', 			'Align': 'Center', 	'Hidden':dev	},
				{'Header': '규격코드', 		'Type': 'Text', 				'MinWidth': 50,		'SaveName': 'sScd', 			'Align': 'Center', 	'Hidden':dev	},
				{'Header': '품명', 			'Type': 'Text', 				'MinWidth': 160, 	'SaveName': 'sNm', 			'Align': 'Center', 	'Hidden':dev	}, 
				{'Header': '규격', 			'Type': 'Text', 				'MinWidth': 160, 	'SaveName': 'sSt', 			'Align': 'Center', 	'Hidden':dev	}, 
				{'Header': '제조사', 		'Type': 'Text', 				'MinWidth': 80, 	'SaveName': 'sMk', 			'Align': 'Center', 	'Hidden':dev	}, 
				{'Header': 'MD구분', 		'Type': 'Text', 				'MinWidth': 50,		'SaveName': 'sId', 			'Align': 'Center', 	'Hidden':dev	},
				{'Header': '판매가', 		'Type': 'Int', 				'MinWidth': 80,		'SaveName': 'sPrice', 		'Align': 'Center', 	'Hidden':dev,	'Format': '#,###'	}, 	
				{'Header': '메인여부',		'Type': 'Combo',			'Width': 40, 		'SaveName': 'sRTp',			'Align': 'Center', 	'Hidden':dev, 	'ComboText': '메인|일반', 'ComboCode': 'M|S' }  
			];					
			// IBSheet 생성
			createIBSheet2($('#ib-container99')[0], 'mySheet99', '100%', '300px');
			// IBSheet 초기화
			IBS_InitSheet(mySheet99, initData);	

			initData.Cfg = {  
									'AutoFitColWidth': 'search|resize|init|colhidden|rowtransaction',
									'MergeSheet': msFixedMerge + msHeaderOnly 
								};
			
			initData.Cols = [
									[ //첫번째 단위 데이터(DataRow) 행
										{'Header': '대표이미지', 		'Type': 'Image', 			'MinWidth': 160,	'SaveName': 'sImg', 			'Align': 'Center', 	'ColSpan':2, 'Edit':0, 'Save': 0, 'ImgMinWidth': 200, 'ImgHeight': 100	}
										,{'Header': '대표이미지'	}
										,{'Header': '삭제',				'Type': 'DelCheck', 		'Width': 40, 		'SaveName': 'sDelChBox',	'Align': 'Center',	'Edit':1	}   
										,{'Header': '품목코드', 			'Type': 'Text', 				'MinWidth': 0,		'SaveName': 'sPcd', 			'Align': 'Center', 	'Hidden':1, 'Save': 1	}
										,{'Header': '구분', 				'Type': 'Status', 			'MinWidth': 0,		'SaveName': 'sStatus', 		'Align': 'Center', 	'Hidden':1}
									],
									[ //두번째 단위 데이터(DataRow) 행
										{'Header': '품명', 				'Type': 'Text', 				'MinWidth': 160, 	'SaveName': 'sNm', 			'Align': 'Left', 		'Edit':0, 'Save': 0		} 
										,{'Header': '제조사', 			'Type': 'Text', 				'MinWidth': 80, 	'SaveName': 'sMk', 			'Align': 'Left', 		'Edit':0, 'Save': 0		} 
										,{'Header': '메인',				'Type': 'Combo',	 		'Width': 40, 		'SaveName': 'sChBox',		'Align': 'Center',	'Edit':1, 'ComboText': '메인|일반', 'ComboCode': 'M|S' }  
										,{'Header': '번호', 				'Type': 'Seq', 				'MinWidth': 0,		'SaveName': 'sSeq',			'Align': 'Center', 	'Hidden':1, 'Save': 0	}
										,{'Header': '구분' , 				'Hidden':1}
									] 
								];		
			for(var i=1; i < 10; i++){
				// IBSheet 생성
				createIBSheet2($('#ib-container'+i)[0], 'mySheet'+i, '100%', '300px');
				var sheet = eval('mySheet' + i);
				
				// IBSheet 초기화
				IBS_InitSheet(sheet, initData);	
				
				// 편집 가능 여부 설정
				sheet.SetEditable(1);
				
				// 사이즈 맞춤
				sheet.FitColWidth();

			}
		}
		function initSelect(){
			_BT.CategSearch.makeSelect('1');
		}
		function doAction(sAction, tar) { 
			switch(sAction) {  
				case 'search':          
					if(0 == tar){
						if('C9999' == $('#ca1').val()){
							alert('카테고리 확인 부탁 드립니다.');
							break;   
						}
						var sheet = eval('mySheet' + tar);
						$('#cCode').val($('#ca1').val());
						if($("#mPrdtTp").is(":checked")) {
							$('#PRDT_TP').val('S');
						}else{
							$('#PRDT_TP').val('J');
						}
						var sub_q = $('#sheetFrm2').serialize();
						sheet.DoSearch(_BT.FRONT.URL.Search.SheetPrdtList, sub_q); 
					}
					if(99 == tar){
						mySheet99.DoSearch(_BT.FRONT.URL.Search.SheetMdPrdtList, ''); 
					}
					break; 
				case 'insert':
					var sheet = eval('mySheet' + tar);
					var opt = {UrlEncode:0, Mode:1};
					var SaveStr = mySheet0.GetSaveJson(opt); 
					if(SaveStr.data.length <1){
						alert('선택 내역이 없습니다.\n\n다시 확인 부탁 드립니다.');
						break;   
					}						
					sheet.LoadSearchData(SaveStr,{Sync:1,Append:1});
					break; 
				case 'save':
					if(confirm('저장하시겠습니까?')){
	    				var param = {
	    					url:_BT.FRONT.URL.Site.SetMDPrdt
		    				,subparam:FormQueryStringEnc(document.frm)
		    				,sheet:[
		    						'mySheet1',	'mySheet2',	'mySheet3','mySheet4',	'mySheet5',	'mySheet6'
		    						,'mySheet7','mySheet8','mySheet9'
		    						]};
	    				console.log(param)
	    				DataSave( param );
	    			}
					break; 
				case 'reload':
					break; 
			} 
		}
		function mySheet1_OnSaveEnd(code) {
			if(code == 1){         
				alert("저장완료 하였습니다.");  
			} else {         
				alert("저장에 실패하였습니다.");     
			} 
		} 
		function mySheet99_OnSearchEnd(Code, Msg, StCode, StMsg) {
			 var cnt = mySheet99.RowCount();
			 var SaveJson = mySheet99.GetSaveJson({AllSave:1}); 
			 var D1 = new Array();
			 var D2 = new Array();
			 var D3 = new Array();
			 var D4 = new Array();
			 var D5 = new Array();
			 var D6 = new Array();
			// var c16 = new Array();
			// var c17 = new Array();
			// var c18 = new Array();
			 var md = new Array();
			 var hit = new Array();
			 var mobile = new Array();
			 
			 for(var i=0; i<SaveJson.data.length; i++){
				 var code = SaveJson.data[i].sId;
				 if(code == 'D1'){
					 	D1.push(SaveJson.data[i]);
					}else if(code == 'D2'){
						D2.push(SaveJson.data[i]);
					}else if(code == 'D3'){
						D3.push(SaveJson.data[i]);
					}else if(code == 'D4'){
						D4.push(SaveJson.data[i]);
					}else if(code == 'D5'){
						D5.push(SaveJson.data[i]);
					}else if(code == 'D6'){
						D6.push(SaveJson.data[i]);
					
					}else if(code == 'md'){
						md.push(SaveJson.data[i]);
					}else if(code == 'hit'){
						hit.push(SaveJson.data[i]);
					}else if(code == 'mobile'){
						mobile.push(SaveJson.data[i]);
					}
			 }
				mySheet1.LoadSearchData({"data":D1} ,{Append:1});  
				mySheet2.LoadSearchData({"data":D2},{Append:1});  
				mySheet3.LoadSearchData({"data":D3},{Append:1});  
				mySheet4.LoadSearchData({"data":D4},{Append:1});  
				mySheet5.LoadSearchData({"data":D5},{Append:1});  
				mySheet6.LoadSearchData({"data":D6},{Append:1});  
				
				mySheet7.LoadSearchData({"data":md},{Append:1});  
				mySheet8.LoadSearchData({"data":hit},{Append:1});  
				mySheet9.LoadSearchData({"data":mobile},{Append:1});  
		} 
		function convSheet(code){
			var sheet = '';
			if(code == 'D1'){
				sheet = 'mySheet1';
			}else if(code == 'D2'){
				sheet = 'mySheet2';
			}else if(code == 'D3'){
				sheet = 'mySheet3';
			}else if(code == 'D4'){
				sheet = 'mySheet4';
			}else if(code == 'D5'){
				sheet = 'mySheet5';
			}else if(code == 'D6'){
				sheet = 'mySheet6';			
			}else if(code == 'md'){
				sheet = 'mySheet7';
			}else if(code == 'hit'){
				sheet = 'mySheet8';
			}else if(code == 'mobile'){
				sheet = 'mySheet9';
			}
			return sheet;
		}
		
	</script>
	
	<div class="main_content06" style="padding-top: 0px; min-height: 800px; margin-bottom: 20px;">
		<div class="margintop_40">
			<form id="frm" name="frm">
				<input type="hidden" id="sheetCnt" name="sheetCnt" value="9"/>			
			</form>
			<form id="sheetFrm2" name="sheetFrm2">
				<input type="hidden" id="cTp" name="cTp" value="1"/>			
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
							<td style="text-align: left; padding-left: 10px; padding-right: 10px;" >
								<span class="return_select6">
									<select class="ca" id="ca1" name="ca1" data-value="1">
										<option value="">1단계</option>
									</select>
								</span>
								<input class="input_style22 marginleft_5" type="text" id="mValue" name="mValue" placeholder="검색어" />							
								<input class="input_style22 marginleft_5" type="text" id="mName" name="mName" placeholder="품명" />							
								<input class="input_style22 marginleft_5" type="text" id="mBrand" name="mBrand" placeholder="브랜드" />							
								<input class="input_style22 marginleft_5" type="text" id="mStndrd" name="mStndrd" placeholder="규격" />							
								<input class="input_style22 marginleft_5" type="text" id="mModel" name="mModel" placeholder="모델명" />							
								<input class="input_style22 marginleft_5" type="text" id="mPrdtCd" name="mPrdtCd" placeholder="코드번호" />		
								<input type="hidden" id="PRDT_TP" name="PRDT_TP" />		
							 	<input name="mPrdtTp" id="mPrdtTp" type="checkbox"/>
								<label class="spc_check" for="mPrdtTp">
									<span class="c13_01_03_txt_01" style="margin-left:5px;">
										재고
									</span>
	                            </label>
								<span class="inquiry_btn marginleft_7">
									<span data-type="save" 	data-value="0" class="sButton btn_span fs-13 pink marginleft_5" style="float: right;">저장</span>
									<span data-type="search" data-value="0"  class="sButton btn_span fs-13 blue" style="float: right;">조 회</span>
								</span>
							</td>
						</tr>
					</tbody>
				</table>	
			</form>
		</div>
		<div class="col-sm-5 col-md-5" style="margin-top:10px;">
		    <div id="ib-container0"></div>
		</div>		
		
		<div class="margintop_40">
			<div style="display: table-cell;width: 422px;">
				<h1 class="title_con_Type02">
					직결나사
					<span data-type="insert" data-value="1"  class="sButton btn_span fs-13 green marginleft_5" style="float: right;">지정</span>
				</h1>		
				<div class="col-sm-5 col-md-5" style="margin-top:10px; height:310px">
				    <div id="ib-container1"style="height:310px;"></div>
				</div>
			</div>
			<div style="display: table-cell;width: 422px; margin-left: 5px;">
				<div>
					<h1 class="title_con_Type02">
						고내식성직결나사
						<span data-type="insert" data-value="2" class="sButton btn_span fs-13 green marginleft_5" style="float: right;">지정</span>
					</h1>		
				</div>
				<div class="col-sm-5 col-md-5" style="margin-top:10px; height:310px;">
				    <div id="ib-container2" style="height:310px;"></div>
				</div>		
			</div>
			<div style="display: table-cell;width: 422px; margin-left: 5px;">
				<div >
					<h1 class="title_con_Type02">
						스텐나사
						<span data-type="insert" data-value="3" class="sButton btn_span fs-13 green marginleft_5" style="float: right;">지정</span>
					</h1>		
				</div>
				<div class="col-sm-5 col-md-5" style="margin-top:10px; height:310px">
				    <div id="ib-container3"></div>
				</div>		
			</div>
		</div>
		<div class="margintop_40">
			<div style="display: table-cell;width: 422px;">
				<div >
					<h1 class="title_con_Type02">
						TYPE17®
						<span data-type="insert" data-value="4" class="sButton btn_span fs-13 green marginleft_5" style="float: right;">지정</span>
					</h1>		
				</div>
				<div class="col-sm-5 col-md-5" style="margin-top:10px; height:310px">
				    <div id="ib-container4"></div>
				</div>		
			</div>		
			<div style="display: table-cell;width: 422px; margin-left: 5px;">
				<div >
					<h1 class="title_con_Type02">
						블라인드 리벳
						<span data-type="insert" data-value="5" class="sButton btn_span fs-13 green marginleft_5" style="float: right;">지정</span>
					</h1>		
				</div>
				<div class="col-sm-5 col-md-5" style="margin-top:10px; height:310px">
				    <div id="ib-container5"></div>
				</div>		
			</div>
			<div style="display: table-cell;width: 422px; margin-left: 5px;">
				<div>
					<h1 class="title_con_Type02">
						태핑나사 등
						<span data-type="insert" data-value="6"  class="sButton btn_span fs-13 green marginleft_5" style="float: right;">지정</span>
					</h1>		
				</div>
				<div class="col-sm-5 col-md-5" style="margin-top:10px; height:310px">
				    <div id="ib-container6"></div>
				</div>
			</div>
		</div>
		
		<div class="margintop_40">
			<div style="display: table-cell;width: 422px;">
				<div >
					<h1 class="title_con_Type02">
						대화의발견
						<span data-type="insert" data-value="10" class="sButton btn_span fs-13 green marginleft_5" style="float: right;">지정</span>
					</h1>		
				</div>
				<div class="col-sm-5 col-md-5" style="margin-top:10px; height:310px">
				    <div id="ib-container7"></div>
				</div>		
			</div>
			<div style="display: table-cell;width: 422px; margin-left: 5px;">
				<div >
					<h1 class="title_con_Type02">
						인기상품
						<span data-type="insert" data-value="11" class="sButton btn_span fs-13 green marginleft_5" style="float: right;">지정</span>
					</h1>		
				</div>
				<div class="col-sm-5 col-md-5" style="margin-top:10px; height:310px">
				    <div id="ib-container8"></div>
				</div>		
			</div>
			<div style="display: table-cell;width: 422px; margin-left: 5px;">
				<div >
					<h1 class="title_con_Type02">
						모바일
						<span data-type="insert" data-value="12" class="sButton btn_span fs-13 green marginleft_5" style="float: right;">지정</span>
					</h1>		
				</div>
				<div class="col-sm-5 col-md-5" style="margin-top:10px; height:310px">
				    <div id="ib-container9"></div>
				</div>		
			</div>
		</div>
		<div class="col-sm-5 col-md-5" style="margin-top:10px; display:none; " >
		    <div id="ib-container99"></div>
		</div>
	</div>
