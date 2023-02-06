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
		});
		function initSheet(){
			var initData = {};
			initData.Cfg = {
										'AutoFitColWidth': 'search|resize|init|colhidden|rowtransaction'
										};
			initData.HeaderMode = {};
			
			initData.Cols = [
					{'Header': '구분', 			'Type': 'Seq', 			'MinWidth': 50,		'SaveName': 'sSeq', 			'Align': 'Center' 	}, 
					{'Header': '상태', 			'Type': 'Status', 		'MinWidth': 50,		'SaveName': 'sStatus', 		'Align': 'Center' 	},  
					{'Header': '코드',	 		'Type': 'Text', 			'MinWidth': 80, 	'SaveName': 'sMkCd', 		'Align': 'Center',	'Edit':0,	'DefaultValue':'NEW' 	},   
					{'Header': '제조사명', 		'Type': 'Text', 			'MinWidth': 150, 	'SaveName': 'sMkNm', 		'Align': 'Left', 		'Edit':1, 	'KeyField':1 		},  
					{'Header': '제조사설명',	 	'Type': 'Text', 			'MinWidth': 200, 	'SaveName': 'sMkEtcNm',	'Align': 'Left', 		'Edit':1	},  
					{'Header': '사용여부',	 	'Type': 'Combo', 		'MinWidth': 50,	 	'SaveName': 'sUseYN',  		'Align': 'Center', 	'Edit':1,	'ComboText': 'Y|N'	},  
					{'Header': '변동일',	 		'Type': 'Date', 			'MinWidth': 80, 	'SaveName': 'sCdt', 			'Align': 'Center', 	'Edit':0, 	'Save': 0 		},  
					{'Header': '처리자',	 		'Type': 'Text', 			'MinWidth': 80, 	'SaveName': 'sCid', 			'Align': 'Center', 	'Edit':0, 	'Save': 0 		} 
			];			
			// IBSheet 생성
			createIBSheet2($('#ib-container1')[0], 'mySheet1', '100%', '500px');
			
			// IBSheet 초기화
			IBS_InitSheet(mySheet1, initData);	
			
			// 편집 가능 여부 설정
			mySheet1.SetEditable(true);
			
			// 사이즈 맞춤
			mySheet1.FitColWidth();

			//건수 정보 표시
			mySheet1.SetCountPosition(4);
			
			//필터기능 추가
			mySheet1.ShowFilterRow();
		}	
		function doAction(sAction, tar) { 
			switch(sAction) {     
				case 'search':            
					var sheet = eval('mySheet' + tar);
					if(1 == tar)
						sheet.DoSearch(_BT.FRONT.URL.Search.SheetMakerCd, $('#sheetFrm').serialize()); 
					break; 
				case 'insert':       //입력
					var sheet = eval('mySheet' + tar);
					var Row = sheet.DataInsert();
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
						if(!confirm('변경 내역을 저장하시겠습니까?')) 
						break;
					}
					if(1 == tar){
						var rtnData = sheet.GetSaveData(_BT.FRONT.URL.Setup.SaveSheetMakerCd, SaveStr); 
						sheet.LoadSaveData(rtnData);
					}
					break;     
			} 
		} 
		function mySheet1_OnSaveEnd(code) {
			if(code == 1){         
				alert("저장에 성공하였습니다.");
			} else {         
				alert("저장에 실패하였습니다.");     
			} 
		} 
	</script>
	<div class="main_content06" style="padding-top: 0px; min-height: 800px; margin-bottom: 20px;">
		<form id="sheetFrm" name="sheetFrm">
			<div>
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
								<span class="c13_01_03_txt_01">
									제조사명
								</span>
								<input class="input_style08" type="text" placeholder="제조사명" id="sValue" name="sValue"/>							
								<span class="c13_01_03_txt_01">
									상태
								</span>
								<span class="return_select5">
									<select class="" id="sSus" name="sSus">
										<option value="">전체</option>
										<option value="Y">사용</option>
										<option value="N">미사용</option>
									</select>
								</span>			
								<span class="inquiry_btn marginleft_7">
									<span data-type="save" data-value="1" class="sButton btn_span fs-13 pink marginleft_5" style="float: right;">저장</span>
									<span data-type="insert" data-value="1"  class="sButton btn_span fs-13 blue marginleft_5" style="float: right;">행추가</span>
									<span data-type="search" data-value="1"  class="sButton btn_span fs-13 blue" style="float: right;">조회</span>
								</span>
							</td>
						</tr>
					</tbody>
				</table>	
			</div>
		</form>
		<div class="col-sm-5 col-md-5" style="margin-top:10px;" >
		    <div id="ib-container1"></div>
		</div>
		<div class="signup_agree">
			<p class="alarm_txt">※ <span class="redCr bTxt" >업무시간 내</span>에 <span class="redCr bTxt" >제조사명 수정</span>을 <span class="redCr bTxt" >삼가</span>  합니다.</p>
		</div>
	</div>