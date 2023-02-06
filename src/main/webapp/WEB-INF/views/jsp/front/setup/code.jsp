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
			$('.sButton').click(function() {
				doAction($(this).data('type'), $(this).data('value'));
			});
			initSheet();
			doAction('search',1);
		});
		
		function initSheet(){
			var initData = {};
			initData.Cfg = {
										'AutoFitColWidth': 'search|resize|init|colhidden|rowtransaction'
										};
			initData.HeaderMode = {};
			
			initData.Cols = [
					{'Header': '구분', 			'Type': 'Seq', 				'MinWidth': 50,		'SaveName': 'sSeq', 			'Align': 'Center' }, 
					{'Header': '상태', 			'Type': 'Status', 			'MinWidth': 50,		'SaveName': 'sStatus', 	'Align': 'Center' },  
					{'Header': '코드명', 		'Type': 'Text', 				'MinWidth': 150, 	'SaveName': 'sCdNm', 		'Align': 'Left', 		'Edit':1, 	'KeyField':1 },  
					{'Header': '코드설명',	 	'Type': 'Text', 				'MinWidth': 200, 	'SaveName': 'sCdDesc',	'Align': 'Left', 		'Edit':1},  
					{'Header': '사용여부',	 	'Type': 'Combo', 			'MinWidth': 50,	 	'SaveName': 'sUseYN',  	'Align': 'Center', 	'ComboText': 'Y|N', 'Edit':1},  
					{'Header': '변동일',	 		'Type': 'Date', 				'MinWidth': 80, 	'SaveName': 'sCdt', 			'Align': 'Center', 	'Edit':0, 'Save': 0 },  
					{'Header': '처리자',	 		'Type': 'Text', 				'MinWidth': 80, 	'SaveName': 'sCid', 			'Align': 'Center', 	'Edit':0, 'Save': 0 },  
					{'Header': '코드',		 	'Type': 'Text', 				'MinWidth': 0, 		'SaveName': 'sCd', 			'Align': 'Center', 	'Hidden':1, 'DefaultValue':'NEW' }   
			];			
			// IBSheet 생성
			createIBSheet2($('#ib-container1')[0], 'mySheet1', '100%', '200px');
			
			// IBSheet 초기화
			IBS_InitSheet(mySheet1, initData);	

			initData.Cols = [
					{'Header': '구분', 			'Type': 'Seq', 				'MinWidth': 40,		'SaveName': 'sSeq', 			'Align': 'Center' }, 
					{'Header': '상태', 			'Type': 'Status', 			'MinWidth': 40,		'SaveName': 'sStatus', 	'Align': 'Center' },  
					{'Header': '코드',		 		'Type': 'Text', 				'MinWidth': 80,	 	'SaveName': 'sDtlcd', 		'Align': 'Left', 		'Edit':1, 	'KeyField':1 },  
					{'Header': '코드명', 		   'Type': 'Text', 				'MinWidth': 150, 	'SaveName': 'sCdNm', 		'Align': 'Left', 		'Edit':1, 	'KeyField':1 },  
					{'Header': '코드비고', 		'Type': 'Text', 				'MinWidth': 200, 	'SaveName': 'sCdDesc', 	'Align': 'Left', 		'Edit':1 },  
					{'Header': '사용여부',	 	'Type': 'Combo', 			'MinWidth': 50,	 	'SaveName': 'sUseYN',  	'Align': 'Center', 	'ComboText': 'Y|N', 'Edit':1},  
					{'Header': '노출여부',	 	'Type': 'Combo', 			'MinWidth': 50,	 	'SaveName': 'sViewYN',  	'Align': 'Center', 	'ComboText': 'Y|N', 'Edit':1},  
					{'Header': '노출순서',	 	'Type': 'Text', 				'MinWidth': 50,	 	'SaveName': 'sOrdr',		  	'Align': 'Center', 	'Edit':1, 	'KeyField':1 },  
					{'Header': '비고',			 	'Type': 'Text', 				'MinWidth': 100,	'SaveName': 'sRmk',		  	'Align': 'Left', 		'Edit':1, 		'MultiLineText': 1 },
					{'Header': '변동일',	 		'Type': 'Date', 				'MinWidth': 80, 		'SaveName': 'sCdt', 			'Align': 'Center', 	'Edit':0, 'Save': 0 },  
					{'Header': '처리자',	 		'Type': 'Text', 				'MinWidth': 80, 		'SaveName': 'sCid', 			'Align': 'Center', 	'Edit':0, 'Save': 0 },  
					{'Header': '코드',		 		'Type': 'Text', 				'MinWidth': 0, 		'SaveName': 'sCd', 			'Align': 'Center', 	'Hidden':1 }   
			];					
			// IBSheet 생성
			createIBSheet2($('#ib-container2')[0], 'mySheet2', '100%', '500px');
			
			// IBSheet 초기화
			IBS_InitSheet(mySheet2, initData);	
			
			// 편집 가능 여부 설정
			mySheet1.SetEditable(true);
			mySheet2.SetEditable(true);
			
			// 사이즈 맞춤
			mySheet1.FitColWidth();
			mySheet2.FitColWidth();
		}	
		
		function doAction(sAction, tar) { 
			switch(sAction) {     
				case 'search':            
					var sheet = eval('mySheet' + tar);
					if(1 == tar)
						sheet.DoSearch(_BT.FRONT.URL.Search.SheetCodeMst, ''); 
					else if(2 == tar)
						sheet.DoSearch(_BT.FRONT.URL.Search.SheetCodeDtl, $('#sheetFrm').serialize()); 
					break; 
				case 'insert':       //입력
					var sheet = eval('mySheet' + tar);
					var Row = sheet.DataInsert();
					if(2 == tar) {
						sheet.SetCellValue(Row, 'sCd',$('#sCd').val()) ;
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
						var rtnData = sheet.GetSaveData(_BT.FRONT.URL.Setup.SaveSheetCodeMst, SaveStr); 
						sheet.LoadSaveData(rtnData);
					} else if(2 == tar) {
						var rtnData = sheet.GetSaveData(_BT.FRONT.URL.Setup.SaveSheetCodeDtl, SaveStr); 
						sheet.LoadSaveData(rtnData);
					}
					break;     
			} 
		} 
		function mySheet1_OnDblClick(Row, Col, Value, CellX, CellY, CellW, CellH) { 
			var sCd = mySheet1.GetCellValue( Row, 'sCd' );
			if( _BT.isEquals(sCd, 'NEW')) return false;
			$('#sCd').val(sCd);
			doAction('search', 2);
		 } 
		function mySheet1_OnSaveEnd(code) {
			if(code == 1){         
				alert("저장에 성공하였습니다.");
			} else {         
				alert("저장에 실패하였습니다.");     
			} 
		} 
		function mySheet2_OnSaveEnd(code) {
			if(code == 1){         
				alert("저장에 성공하였습니다.");
			} else {         
				alert("저장에 실패하였습니다.");     
			} 
		} 
	</script>
	<div class="main_content06" style="padding-top: 0px; min-height: 800px; margin-bottom: 20px;">
		<h1 class="title_con_Type02">
			공통 코드			
			<span data-type="save" data-value="1" class="sButton btn_span fs-13 pink marginleft_5" style="float: right;">저장</span>
			<span data-type="insert" data-value="1"  class="sButton btn_span fs-13 blue marginleft_5" style="float: right;">행추가</span>
			<span data-type="search" data-value="1"  class="sButton btn_span fs-13 blue" style="float: right;">초기화</span>
		</h1>		
		<div class="col-sm-5 col-md-5" style="margin-top:10px;" >
		    <div id="ib-container1"></div>
		</div>
		<div class="margintop_40">
			<h1 class="title_con_Type02">
				상세 코드			
				<span data-type="save" data-value="2" class="sButton btn_span fs-13 pink marginleft_5" style="float: right;">저장</span>
				<span data-type="insert" data-value="2" class="sButton btn_span fs-13 blue marginleft_5" style="float: right;">행추가</span>
				<span data-type="search" data-value="2"  class="sButton btn_span fs-13 blue" style="float: right;">초기화</span>
			</h1>		
		</div>
		<div class="col-sm-5 col-md-5" style="margin-top:10px;">
		    <div id="ib-container2"></div>
		</div>	
		<div id="frmDiv" style="display: none;">
			<form id="sheetFrm" name="sheetFrm">
				<input type="hidden" id="sCd" name="sCd">
			</form>
		</div>	
	</div>		
	
