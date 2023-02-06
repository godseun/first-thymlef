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
						{'Header': '구분', 			'Type': 'Seq', 			'MinWidth': 0,		'SaveName': 'sSeq', 			'Align': 'Center', 	'Hidden':1 }, 
						{'Header': '상태', 			'Type': 'Status', 		'MinWidth': 0,		'SaveName': 'sStatus', 		'Align': 'Center', 	'Hidden':1 }, 
						{'Header': '코드',			'Type': 'Text', 			'MinWidth': 60, 	'SaveName': 'sCd', 			'Align': 'Center', 	'Edit':0, 'DefaultValue':'NEW' },   
						{'Header': '명칭',			'Type': 'Text', 			'MinWidth': 130, 	'SaveName': 'sNm',			'Align': 'Left', 		'Edit':1 },  
						{'Header': '사용',		 	'Type': 'Combo', 		'MinWidth': 40,	 	'SaveName': 'sUseYN', 	 	'Align': 'Center', 	'ComboText': 'Y|N', 'Edit':1},  
						{'Header': '변동일',	 		'Type': 'Date', 			'MinWidth': 0, 		'SaveName': 'sCdt', 			'Align': 'Center', 	'Hidden':1, 'Edit':0, 'Save': 0 },  
						{'Header': '처리자',	 		'Type': 'Text', 			'MinWidth': 0, 		'SaveName': 'sCid', 			'Align': 'Center', 	'Hidden':1, 'Edit':0, 'Save': 0 },  
						{'Header': '타입',			'Type': 'Text', 			'MinWidth': 0, 		'SaveName': 'sCtp', 			'Align': 'Center', 	'Hidden':1, 'DefaultValue':'NEW' },   
						{'Header': '상위코드',		'Type': 'Text', 			'MinWidth': 0, 		'SaveName': 'sPcd', 			'Align': 'Center', 	'Hidden':1, 'DefaultValue':'NEW' }    
				];			
				// IBSheet 생성
				createIBSheet2($('#ib-container1')[0], 'mySheet1', '100%', '400px');
				createIBSheet2($('#ib-container2')[0], 'mySheet2', '100%', '400px');
				createIBSheet2($('#ib-container3')[0], 'mySheet3', '100%', '400px');
				createIBSheet2($('#ib-container4')[0], 'mySheet4', '100%', '400px');
				createIBSheet2($('#ib-container5')[0], 'mySheet5', '100%', '400px');

				// IBSheet 초기화
				IBS_InitSheet(mySheet1, initData);	
				IBS_InitSheet(mySheet2, initData);	
				IBS_InitSheet(mySheet3, initData);	
				IBS_InitSheet(mySheet4, initData);	
				
				initData.Cols = [
					{'Header': '구분', 			'Type': 'Seq', 				'MinWidth': 0,		'SaveName': 'sSeq', 			'Align': 'Center', 	'Hidden':1 }, 
					{'Header': '상태', 			'Type': 'Status', 			'MinWidth': 0,		'SaveName': 'sStatus', 		'Align': 'Center', 	'Hidden':1 }, 
					{'Header': '코드',			'Type': 'Text', 				'MinWidth': 60, 	'SaveName': 'sCd', 			'Align': 'Center', 	'Edit':0, 'DefaultValue':'NEW' },   
					{'Header': '명칭',			'Type': 'Text', 				'MinWidth': 130, 	'SaveName': 'sNm',			'Align': 'Left', 		'Edit':1 },  
					{'Header': '사용',		 	'Type': 'Combo', 			'MinWidth': 40,	 	'SaveName': 'sUseYN', 	 	'Align': 'Center', 	'ComboText': 'Y|N', 'Edit':1},  
					{'Header': '변동일',	 		'Type': 'Date', 				'MinWidth': 0, 		'SaveName': 'sCdt', 			'Align': 'Center', 	'Hidden':1, 	'Edit':0, 'Save': 0 },  
					{'Header': '처리자',	 		'Type': 'Text', 				'MinWidth': 0,	 	'SaveName': 'sCid', 			'Align': 'Center', 	'Hidden':1, 	'Edit':0, 'Save': 0 },  
					{'Header': '타입',		 	'Type': 'Text', 				'MinWidth': 0, 		'SaveName': 'sCtp', 			'Align': 'Center', 	'Hidden':1,	'DefaultValue':'NEW' },   
					{'Header': '상위코드',		'Type': 'Text', 				'MinWidth': 0, 		'SaveName': 'sPcd', 			'Align': 'Center', 	'Hidden':1, 	'DefaultValue':'NEW' }    
				];			
				IBS_InitSheet(mySheet5, initData);	

				// 편집 가능 여부 설정
				mySheet1.SetEditable(true);
				mySheet2.SetEditable(true);
				mySheet3.SetEditable(true);
				mySheet4.SetEditable(true);
				mySheet5.SetEditable(true);
				
				// 사이즈 맞춤
				mySheet1.FitColWidth();
				mySheet2.FitColWidth();
				mySheet3.FitColWidth();
				mySheet4.FitColWidth();
				mySheet5.FitColWidth();
			}	
			
			function doAction(sAction, tar) { 
				switch(sAction) {     
					case 'search':            
						var sheet = eval('mySheet' + tar);
						if(1 == tar)
							sheet.DoSearch(_BT.FRONT.URL.Search.SheetCateg, 'sCtp=1'); 
						else
							sheet.DoSearch(_BT.FRONT.URL.Search.SheetCateg, $('#sheetFrm').serialize()); 
						clearSheet(tar+1);
						break; 
					case 'insert':       //입력
						var sheet = eval('mySheet' + tar);
						var Row = sheet.DataInsert();
						
						if(tar > 2) {
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
				$('#sPcd').val(sCd);
				$('#sCtp').val(2);
				doAction('search', 2);
			} 
			function mySheet2_OnDblClick(Row, Col, Value, CellX, CellY, CellW, CellH) { 
				var sCd = mySheet2.GetCellValue( Row, 'sCd' );
				if( _BT.isEquals(sCd, 'NEW')) return false;
				$('#sPcd').val(sCd);
				$('#sCtp').val(3);
				doAction('search', 3);
			} 
			function mySheet3_OnDblClick(Row, Col, Value, CellX, CellY, CellW, CellH) { 
				var sCd = mySheet3.GetCellValue( Row, 'sCd' );
				if( _BT.isEquals(sCd, 'NEW')) return false;
				$('#sPcd').val(sCd);
				$('#sCtp').val(4);
				doAction('search', 4);
			} 
			function mySheet4_OnDblClick(Row, Col, Value, CellX, CellY, CellW, CellH) { 
				var sCd = mySheet4.GetCellValue( Row, 'sCd' );
				if( _BT.isEquals(sCd, 'NEW')) return false;
				$('#sPcd').val(sCd);
				$('#sCtp').val(5);
				doAction('search', 5);
			} 
			function clearSheet(st){
				for(var i= st ; i<6; i ++){
					var sheet = eval('mySheet' + i);
					sheet.RemoveAll();
				}
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
		<div style="width: 19%;height:450px;display: table-cell;">
			<div>
				<h1 class="title_con_Type02">
					1단계
					<span data-type="save" data-value="1" class="sButton btn_span fs-13 pink marginleft_5" style="float: right;">저장</span>
					<span data-type="insert" data-value="1"  class="sButton btn_span fs-13 blue marginleft_5" style="float: right;">행추가</span>
					<span data-type="search" data-value="1"  class="sButton btn_span fs-13 blue" style="float: right;">초기화</span>
				</h1>		
			</div>
			<div class="col-sm-5 col-md-5" style="width: 100%;height: 420px;" >
			    <div id="ib-container1"></div>
			</div>
		</div>
		<div style="width: 19%; height:450px; margin-left: 5px;display: table-cell;">
			<div class="margintop_40">
				<h1 class="title_con_Type02">
					2단계
					<span data-type="save" data-value="2" class="sButton btn_span fs-13 pink marginleft_5" style="float: right;">저장</span>
					<span data-type="insert" data-value="2" class="sButton btn_span fs-13 blue marginleft_5" style="float: right;">행추가</span>
					<span data-type="search" data-value="2"  class="sButton btn_span fs-13 blue" style="float: right;">초기화</span>
				</h1>		
			</div>
			<div class="col-sm-5 col-md-5" style="width: 100%;height: 420px;" >
			    <div id="ib-container2"></div>
			</div>
		</div>
		<div style="width: 19%; height:450px; margin-left: 5px;display: table-cell;">
			<div class="margintop_40">
				<h1 class="title_con_Type02">
					3단계
					<span data-type="save" data-value="3" class="sButton btn_span fs-13 pink marginleft_5" style="float: right;">저장</span>
					<span data-type="insert" data-value="3" class="sButton btn_span fs-13 blue marginleft_5" style="float: right;">행추가</span>
					<span data-type="search" data-value="3"  class="sButton btn_span fs-13 blue" style="float: right;">초기화</span>
				</h1>		
			</div>	
			<div class="col-sm-5 col-md-5" style="width: 100%;height: 420px;" >
			    <div id="ib-container3"></div>
			</div>	
		</div>
		<div style="width: 19%; height:450px; margin-left: 5px;display: table-cell;">
			<div class="margintop_40">
				<h1 class="title_con_Type02">
					4단계
					<span data-type="save" data-value="4" class="sButton btn_span fs-13 pink marginleft_5" style="float: right;">저장</span>
					<span data-type="insert" data-value="4" class="sButton btn_span fs-13 blue marginleft_5" style="float: right;">행추가</span>
					<span data-type="search" data-value="4"  class="sButton btn_span fs-13 blue" style="float: right;">초기화</span>
				</h1>		
			</div>	
			<div class="col-sm-5 col-md-5" style="width: 100%;height: 420px;" >
			    <div id="ib-container4"></div>
			</div>	
		</div>	
		<div style="width: 19%; height:450px; margin-left: 5px;display: table-cell;">
			<div class="margintop_40">
				<h1 class="title_con_Type02">
					5단계
					<span data-type="save" data-value="5" class="sButton btn_span fs-13 pink marginleft_5" style="float: right;">저장</span>
					<span data-type="insert" data-value="5" class="sButton btn_span fs-13 blue marginleft_5" style="float: right;">행추가</span>
					<span data-type="search" data-value="5"  class="sButton btn_span fs-13 blue" style="float: right;">초기화</span>
				</h1>		
			</div>	
			<div class="col-sm-5 col-md-5" style="width: 100%;height: 420px;" >
			    <div id="ib-container5"></div>
			</div>	
		</div>		
	</div>
	<div id="frmDiv" style="display: none;">
		<form id="sheetFrm" name="sheetFrm">
			<input type="hidden" id="sCtp" name="sCtp">
			<input type="hidden" id="sPcd" name="sPcd">
		</form>
	</div>		