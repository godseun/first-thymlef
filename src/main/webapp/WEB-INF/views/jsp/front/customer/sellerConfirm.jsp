<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/layout/include/base.jsp" %>
	<script type="text/javascript">
		var dupClick1 = false;
		var param;
		var dev = 0;
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
			initSheet();
		});
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
				{'Header': '번호|번호',					'Type': 'Seq', 			'MinWidth': 50,		'SaveName': 'SSEQ',				'Align': 'Center',	'Edit':0,	'Save': 0	, 	'ColMerge':0	}
				,{'Header': '구분|구분',					'Type': 'Status',		'MinWidth': 50,		'SaveName': 'SSTATUS', 		'Align': 'Center',	'Edit':0,	'Save': 0,	'Hidden':dev, 	'ColMerge':0	}
				,{'Header': '첨부|첨부',					'Type': 'Popup',		'MinWidth': 80,		'SaveName': 'BSL_IMG', 			'Align': 'Center',	'Edit':1,	'Save': 0,	'ColMerge':0	}
				,{'Header': '설정|승인', 				'Type': 'Combo',		'MinWidth': 60, 	'SaveName': 'STTUS', 			'Align': 'Center',	'Edit':1,	'Save': 1	, 	'ColMerge':0,	'ComboText': '요청|승인|반려', 	'ComboCode': '0|1|9' }  
				,{'Header': '기본정보|사업자번호', 		'Type': 'Text', 			'MinWidth': 90, 	'SaveName': 'CMP_BIZ_NO',	'Align': 'Center',	'Edit':1,	'Save': 1	, 	'ColMerge':0	}
				,{'Header': '기본정보|상점명', 			'Type': 'Text', 			'MinWidth': 70, 	'SaveName': 'CMP_NM', 			'Align': 'Center',	'Edit':0,	'Save': 0	, 	'ColMerge':0	}
		
				
				
				
				
			
				,{'Header': '기본정보|노출명', 			'Type': 'Combo',		'MinWidth': 50, 	'SaveName': 'sShowTp', 		'Align': 'Center',	'Edit':0,	'Save': 0	, 	'ColMerge':0,	'ComboText': '상점명|상호명', 'ComboCode': 'S|C' }  
				,{'Header': '기본정보|아이디', 			'Type': 'Text', 			'MinWidth': 60, 	'SaveName': 'sStoreId',	 		'Align': 'Center',	'Edit':0,	'Save': 1	, 	'ColMerge':0	}
				,{'Header': '기본정보|상호명', 			'Type': 'Text', 			'MinWidth': 70, 	'SaveName': 'sCmpNm',	 		'Align': 'Center',	'Edit':1,	'Save': 1	, 	'ColMerge':0	}
				,{'Header': '기본정보|대표자', 			'Type': 'Text', 			'MinWidth': 60, 	'SaveName': 'sRprsntvNm',		'Align': 'Center',	'Edit':1,	'Save': 1	, 	'ColMerge':0	}
				,{'Header': '기본정보|업종', 			'Type': 'Text', 			'MinWidth': 60, 	'SaveName': 'sBizcnd',		 	'Align': 'Center',	'Edit':1,	'Save': 1	, 	'ColMerge':0	}
				,{'Header': '기본정보|업태', 			'Type': 'Text', 			'MinWidth': 60, 	'SaveName': 'sInduty',		 	'Align': 'Center',	'Edit':1,	'Save': 1	, 	'ColMerge':0	}
				,{'Header': '기본정보|전화', 			'Type': 'Text', 			'MinWidth': 60, 	'SaveName': 'sTelNo',		 	'Align': 'Center',	'Edit':1,	'Save': 1	, 	'ColMerge':0	}
				,{'Header': '기본정보|FAX', 			'Type': 'Text', 			'MinWidth': 60, 	'SaveName': 'sFaxNo',		 	'Align': 'Center',	'Edit':1,	'Save': 1	, 	'ColMerge':0	}
				,{'Header': '기본정보|우편번호', 		'Type': 'Text', 			'MinWidth': 60, 	'SaveName': 'sZipCd',	 		'Align': 'Center',	'Edit':1,	'Save': 1	, 	'ColMerge':0	}
				,{'Header': '기본정보|주소', 			'Type': 'Text', 			'MinWidth': 150, 	'SaveName': 'sAdres',	 		'Align': 'Left',		'Edit':1,	'Save': 1	, 	'ColMerge':0	}
				,{'Header': '기본정보|상세주소',		'Type': 'Text', 			'MinWidth': 100, 	'SaveName': 'sAdresDtl',	 		'Align': 'Left',		'Edit':1,	'Save': 1	, 	'ColMerge':0	}
				
				,{'Header': '비고|비고',					'Type': 'Text',			'MinWidth': 80,		'SaveName': 'sRmk', 				'Align': 'Left',		'Edit':1,	'Save': 1,	'ColMerge':0	}
				,{'Header': '설정|제휴구분', 			'Type': 'Combo', 		'MinWidth': 60, 	'SaveName': 'sMouTp',	 		'Align': 'Center',	'Edit':1,	'Save': 1	, 	'ColMerge':0,	'ComboText': '제휴|입점', 			'ComboCode': 'M|S' }  
				
				
				
				,{'Header': '담당자정보|담당자',		'Type': 'Text', 			'MinWidth': 60,	 	'SaveName': 'sChargerNm',		'Align': 'Center',	'Edit':0,	'Save': 0	, 	'ColMerge':0	}
				,{'Header': '담당자정보|연락처',		'Type': 'Text', 			'MinWidth': 100, 	'SaveName': 'sChargerTelNo', 	'Align': 'Center',	'Edit':0,	'Save': 0	, 	'ColMerge':0	}
				,{'Header': '담당자정보|이메일',		'Type': 'Text', 			'MinWidth': 100, 	'SaveName': 'sChargerEmail', 	'Align': 'Left',		'Edit':0,	'Save': 0	, 	'ColMerge':0	}
				,{'Header': '담당자정보|부서',			'Type': 'Text', 			'MinWidth': 60, 	'SaveName': 'sChargerDept', 	'Align': 'Left',		'Edit':0,	'Save': 0	, 	'ColMerge':0	}
				
				,{'Header': '정산정보|은행',			'Type': 'Combo',		'MinWidth': 60, 	'SaveName': 'sBank', 			'Align': 'Center',	'Edit':0,	'Save': 0	, 	'ColMerge':0,	'ComboText': '${bankCb.cbText}', 'ComboCode': '${bankCb.cbCode}' }
				,{'Header': '정산정보|예금주',			'Type': 'Text', 			'MinWidth': 60, 	'SaveName': 'sAcntr', 			'Align': 'Center',	'Edit':0,	'Save': 0	, 	'ColMerge':0	}
				,{'Header': '정산정보|계좌번호',		'Type': 'Text', 			'MinWidth': 60, 	'SaveName': 'sAcnutNo', 		'Align': 'Center',	'Edit':0,	'Save': 0	, 	'ColMerge':0	}
				,{'Header': '정산정보|계산서메일',		'Type': 'Text', 			'MinWidth': 100, 	'SaveName': 'sTexEmail', 		'Align': 'Left',		'Edit':0,	'Save': 0	, 	'ColMerge':0	}
				
				,{'Header': '배송정보|기본배송비', 		'Type': 'Int', 			'MinWidth': 60, 	'SaveName': 'sDlvyFee',	 		'Align': 'Right',		'Edit':0,	'Save': 0	, 	'ColMerge':0,	'Format':'Integer'}
				,{'Header': '배송정보|무료배송여부',	'Type': 'Combo',		'MinWidth': 60, 	'SaveName': 'sFreeDlvy',	 	'Align': 'Center',	'Edit':0,	'Save': 0	, 	'ColMerge':0,	'ComboText': '가능|불가', 'ComboCode': 'Y|N' }  
				,{'Header': '배송정보|무료배송금액',	'Type': 'Int', 			'MinWidth': 60, 	'SaveName': 'sFreeAmt',	 		'Align': 'Right',		'Edit':0,	'Save': 0	, 	'ColMerge':0,	'Format':'Integer'}
				,{'Header': '배송정보|도서산간배송',	'Type': 'Combo',		'MinWidth': 60, 	'SaveName': 'sExtraFeeTp',		'Align': 'Center',	'Edit':0,	'Save': 0	, 	'ColMerge':0,	'ComboText': '추가|미추가', 'ComboCode': 'Y|N' }  
				,{'Header': '배송정보|택배지역1',		'Type': 'Int', 			'MinWidth': 60, 	'SaveName': 'sT_ZONE1', 		'Align': 'Right',		'Edit':0,	'Save': 0	, 	'ColMerge':0,	'Format':'Integer'}
				,{'Header': '배송정보|택배지역2',		'Type': 'Int', 			'MinWidth': 60, 	'SaveName': 'sT_ZONE2', 		'Align': 'Right',		'Edit':0,	'Save': 0	, 	'ColMerge':0,	'Format':'Integer'}
				,{'Header': '배송정보|택배지역3',		'Type': 'Int', 			'MinWidth': 60, 	'SaveName': 'sT_ZONE3', 		'Align': 'Right',		'Edit':0,	'Save': 0	, 	'ColMerge':0,	'Format':'Integer'}
				,{'Header': '배송정보|화물지역1',		'Type': 'Int', 			'MinWidth': 60, 	'SaveName': 'sH_ZONE1', 		'Align': 'Right',		'Edit':0,	'Save': 0	, 	'ColMerge':0,	'Format':'Integer'}
				,{'Header': '배송정보|화물지역2',		'Type': 'Int', 			'MinWidth': 60, 	'SaveName': 'sH_ZONE2', 		'Align': 'Right',		'Edit':0,	'Save': 0	, 	'ColMerge':0,	'Format':'Integer'}
				,{'Header': '배송정보|화물지역3',		'Type': 'Int', 			'MinWidth': 60, 	'SaveName': 'sH_ZONE3', 		'Align': 'Right',		'Edit':0,	'Save': 0	, 	'ColMerge':0,	'Format':'Integer'}
				,{'Header': '반품정보|반품택배지정',	'Type': 'Combo',		'MinWidth': 60, 	'SaveName': 'sAppnRtnHdry',	'Align': 'Center',	'Edit':0,	'Save': 0	, 	'ColMerge':0,	'ComboText': '추가|미추가', 'ComboCode': 'Y|N' }  
				,{'Header': '반품정보|택배사', 			'Type': 'Combo', 		'MinWidth': 60, 	'SaveName': 'sHdry',	 			'Align': 'Center',	'Edit':0,	'Save': 0	, 	'ColMerge':0,	'ComboText': '${delyCb.cbText}', 'ComboCode': '${delyCb.cbCode}' }
				,{'Header': '반품정보|반품배송비',		'Type': 'Int', 			'MinWidth': 60, 	'SaveName': 'sRtnFee',		 	'Align': 'Right',		'Edit':0,	'Save': 0	, 	'ColMerge':0,	'Format':	'Integer'}
				,{'Header': '반품정보|교환배송비',		'Type': 'Int', 			'MinWidth': 60, 	'SaveName': 'sEchgFee',		'Align': 'Right',		'Edit':0,	'Save': 0	, 	'ColMerge':0,	'Format':	'Integer'}
				,{'Header': '반품정보|우편번호', 		'Type': 'Text', 			'MinWidth': 60, 	'SaveName': 'sRtnZipCd',		'Align': 'Center',	'Edit':0,	'Save': 0	, 	'ColMerge':0	}
				,{'Header': '반품정보|주소', 			'Type': 'Text', 			'MinWidth': 150, 	'SaveName': 'sRtnAdres',		'Align': 'Left',		'Edit':0,	'Save': 0	, 	'ColMerge':0	}
				,{'Header': '반품정보|상세주소',		'Type': 'Text', 			'MinWidth': 100, 	'SaveName': 'sRtnAdresDtl',	'Align': 'Left',		'Edit':0,	'Save': 0	, 	'ColMerge':0	}
				
				,{'Header': '기타|가입일',				'Type': 'Date', 			'MinWidth': 60, 	'SaveName': 'sCdt',				'Align': 'Center',	'Edit':0,	'Save': 0	, 	'ColMerge':0	}
				,{'Header': '기타|변경일',				'Type': 'Date', 			'MinWidth': 60, 	'SaveName': 'sUdt',				'Align': 'Center',	'Edit':0,	'Save': 0	, 	'ColMerge':0	}
				,{'Header': '기타|변경자',				'Type': 'Text', 			'MinWidth': 60, 	'SaveName': 'sUid',		 		'Align': 'Center',	'Edit':0,	'Save': 0	, 	'ColMerge':0	}
				,{'Header': '기타|승인일',				'Type': 'Date', 			'MinWidth': 60, 	'SaveName': 'sConfmDt',		'Align': 'Center',	'Edit':0,	'Save': 0	, 	'ColMerge':0	}
				,{'Header': '기타|승인자',				'Type': 'Text', 			'MinWidth': 60, 	'SaveName': 'sConfmId',	 		'Align': 'Center',	'Edit':0,	'Save': 0	, 	'ColMerge':0	}
				,{'Header': '기타|유료만료일',			'Type': 'Date', 			'MinWidth': 60, 	'SaveName': 'sExpiryDt',	 		'Align': 'Center',	'Edit':0,	'Save': 0	, 	'ColMerge':0	}
				,{'Header': '기타|결제일',				'Type': 'Date', 			'MinWidth': 60, 	'SaveName': 'sPaymentDt',		'Align': 'Center',	'Edit':0,	'Save': 0	, 	'ColMerge':0	}
			];			
			
			// IBSheet 생성
			var container = $('#ib-container1')[0];
			createIBSheet2(container, 'mySheet1', '100%', '500px');
			mySheet1.ShowGroupRow('', '{%s} <font color="gray">({%c}건)</font>');
			
			// IBSheet 초기화
			IBS_InitSheet(mySheet1, initData);	

			//건수 정보 표시
			mySheet1.SetCountPosition(4);

			//마우스오버
			mySheet1.SetMouseHoverMode(2) 
			
			// 편집 가능 여부 설정
			mySheet1.SetEditable(true);
			
			// 사이즈 맞춤
			//mySheet1.FitColWidth();
			mySheet2.FitColWidth();
		}
		function doAction(sAction, tar) { 
			switch(sAction) {     
				case 'search':            
					var sheet = eval('mySheet' + tar);
					if(1 == tar)
						sheet.DoSearch(_BT.FRONT.URL.Search.SheetTStoreList, $('#sheetFrm').serialize()); 
					break; 
				case 'insert':       //입력
					if(mySheet1.GetSelectRow() < 1) break;
					var sheet = eval('mySheet' + tar);
					var Row = sheet.DataInsert();
					if(2 == tar) {
						sheet.SetCellValue(Row, 'sWrite',$('#sWriter').val()) ;
					}
					break;     
				case 'conf':       //승인
					var sheet = eval('mySheet' + tar);
					var opt = {UrlEncode:0, Mode:2, Delim:"#"};
					var SaveStr = sheet.GetSaveString(opt); 
					if('' == SaveStr){
						alert('승인할 내역이 없습니다.'); 
						break;
					}else if('KeyFieldError' == SaveStr){ 
						break;
					}else{
						if(!confirm('승인 하시겠습니까?')) break;
					}
					if(1 == tar){
						var rtnData = sheet.GetSaveData(_BT.FRONT.URL.Customer.ConfirmStore, SaveStr); 
						sheet.LoadSaveData(rtnData);
					}
					break;  
				case 'save':       //저장
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
					if(1 == tar){
						var rtnData = sheet.GetSaveData(_BT.FRONT.URL.Customer.SaveSheetStore, SaveStr); 
						sheet.LoadSaveData(rtnData);
					} else if(2 == tar) {
						var rtnData = sheet.GetSaveData(_BT.FRONT.URL.Customer.SaveSheetCont, SaveStr); 
						sheet.LoadSaveData(rtnData);
					}
					break;     
			} 
		} 		
		function mySheet1_OnDblClick(Row, Col, Value, CellX, CellY, CellW, CellH) { 
			if(Row == 0) return false;
			$('#sWriter').val(mySheet1.GetCellValue( Row, 'sStoreId' ));
			doAction('search', 2);
		 } 		

		function mySheet1_OnPopupClick(Row,Col){
			var bslIng = mySheet1.GetCellValue(Row,Col);
			if(bslIng != ''){
				param = {
					'ImgSrc':bslIng
				}
				_BT.openPopup( _BT.FRONT.URL.Common.PopImg,'bslIng', '610', '700', true, true);
			}else{
				alert('첨부파일이 없습니다.');
				return false;
			}
		}

		function mySheet2_OnSaveEnd(code) {
			if(code == 1){         
				alert("저장완료 하였습니다.");  
				doAction('search', 2);
			} else {         
				alert("저장에 실패하였습니다.");     
			} 
		} 
		function getParam(){
			return param;
		}
	</script>
	<div class="main_content06" style="padding-top: 0px; margin-bottom: 20px;">
		<div >
			<form id="sheetFrm2" name="sheetFrm2">
				<input type="hidden" id="sWriter" name="sWriter"/>	
				<input type="hidden" id="sBbsId" name="sBbsId" value="STR"/>	
			</form>
			<form id="sheetFrm" name="sheetFrm">
				<table class="tbl_Type09">
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
									아이디
								</span>
								<input type="text" id="sStoreId" name="sStoreId" class="input_style22" placeholder="아이디">					
								<span class="c13_01_03_txt_01" style="margin-left: 5px;">
									사업자번호
								</span>
								<input type="text" id="sCmpBizNo" name="sCmpBizNo" class="input_style22" placeholder="사업자번호" maxlength="13" >					
								<span class="c13_01_03_txt_01">
									검색어
								</span>
								<input type="text" id="sKeyWd" name="sKeyWd" class="input_style22" placeholder="검색어">			
								<span class="c13_01_03_txt_01">
									상태
								</span>
								<span class="return_select5">
									<select id="sSttus" name="sSttus" class="">
										<option value="">전체</option>
										<option value="0">미승인</option>
										<option value="1">승인</option>
										<option value="9">반려</option>
									</select>
								</span>		
								<span class="c13_01_03_txt_01">
									구분
								</span>
								<span class="return_select5">
									<select id="erpLv" name="erpLv" class="">
										<option value="">전체</option>
										<option value="1">프리</option>
										<option value="2">프라임</option>
									</select>
								</span>		
								<span class="inquiry_btn marginleft_7">
									<span data-type="save" data-value="1" class="sButton btn_span fs-13 pink marginleft_5" style="float: right;">저장</span>
									<span data-type="search" data-value="1"  class="sButton btn_span fs-13 blue" style="float: right;">조회</span>
								</span>
							</td>
						</tr>
					</tbody>
				</table>	
			</form>
		</div>
		<div class='col-sm-5 col-md-5' style='padding-top:10px; height: 510px;'>
		    <div id='ib-container1'></div>
		</div>
		<div id="frmDiv" style="display: none;"> 
			<form id="sheetFrm" name="sheetFrm">
				<input type="hidden" id="sCid" name="sCid">
			</form>
		</div>		
	</div>