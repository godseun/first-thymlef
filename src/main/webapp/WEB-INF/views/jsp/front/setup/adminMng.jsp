<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/layout/include/base.jsp" %>
	<script type="text/javascript">
		var dupClick1 = false;
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
									'SearchMode': 2,
									'Page': 10,
									'FrozenCol': 0,
									'UseHeaderActionMenu': false,
									'MouseHoverMode': 0,
									'SelectionRowsMode': 1,
									'AutoFitColWidth': 'resize',
									'MergeSheet': msHeaderOnly  
									};
			initData.HeaderMode = {};
			
			initData.Cols = [
					{'Header': '상태|상태', 				'Type': 'Status', 		'MinWidth': 50,		'SaveName': 'sStatus', 	'Align': 'Center' }  
					,{'Header': '기초정보|아이디', 		'Type': 'Text', 			'MinWidth': 60, 	'SaveName': 'sUsrId', 	'Align': 'Center',		'Edit':0,	'Save': 1}  
					,{'Header': '기초정보|이름', 		'Type': 'Text', 			'MinWidth': 70, 	'SaveName': 'sUsrNm', 	'Align': 'Center',		'Edit':0}  
					,{'Header': '기초정보|이메일', 		'Type': 'Text', 			'MinWidth': 120, 	'SaveName': 'sEmail', 	'Align': 'Center',		'Edit':0}  
					,{'Header': '기초정보|휴대전화', 	'Type': 'Text', 			'MinWidth': 90, 	'SaveName': 'sMobile', 	'Align': 'Center',		'Edit':0}  
					,{'Header': '구분|구분', 			'Type': 'Combo',		'MinWidth': 50, 	'SaveName': 'sUsrTp', 	'Align': 'Center',		'Edit':1,		'Save': 1,	'ComboText': '구매자|협력사|관리자', 'ComboCode': 'B|S|A'} 
					,{'Header': '권한|진행관리', 		'Type': 'CheckBox',	'MinWidth': 40, 	'SaveName': 'A1', 			'Align': 'Center',		'Edit':1,		'Save': 1	}   
					,{'Header': '권한|고객관리', 		'Type': 'CheckBox',	'MinWidth': 40, 	'SaveName': 'A2', 			'Align': 'Center',		'Edit':1,		'Save': 1	}   
					,{'Header': '권한|상품관리', 		'Type': 'CheckBox',	'MinWidth': 40, 	'SaveName': 'A3', 			'Align': 'Center',		'Edit':1,		'Save': 1	}   
					,{'Header': '권한|마감관리', 		'Type': 'CheckBox',	'MinWidth': 40, 	'SaveName': 'A4', 			'Align': 'Center',		'Edit':1,		'Save': 1	}   
					,{'Header': '권한|전체관리', 		'Type': 'CheckBox',	'MinWidth': 40, 	'SaveName': 'A9', 			'Align': 'Center',		'Edit':1,		'Save': 1	}   
					,{'Header': '로그인|로그인', 		'Type': 'Date', 			'MinWidth': 70, 	'SaveName': 'sLlogin', 	'Align': 'Center',		'Edit':0}  
			];			
			
			// IBSheet 생성
			var container = $('#ib-container1')[0];
			createIBSheet2(container, 'mySheet1', '100%', '400px');

			// IBSheet 초기화
			IBS_InitSheet(mySheet1, initData);	
			
			// 편집 가능 여부 설정
			mySheet1.SetEditable(true);
			
			// 사이즈 맞춤
			mySheet1.FitColWidth();
		}
		function doAction(sAction, tar) { 
			switch(sAction) {     
				case 'search':          
					var sheet = eval('mySheet' + tar);
					$('#sCid').val('');  
					sheet.DoSearch(_BT.FRONT.URL.Search.SheetUserList, $('#sheetFrm').serialize()); 
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
					var rtnData = sheet.GetSaveData(_BT.FRONT.URL.Setup.SaveAdminMng, SaveStr); 
					sheet.LoadSaveData(rtnData);
					break;     
			} 
		} 		
		function mySheet1_OnSaveEnd(code) {
			if(code == 1){         
				alert("저장완료 하였습니다.");  
				doAction('search', 2);
			} else {         
				alert("저장에 실패하였습니다.");     
			} 
		} 
	</script>
	<div class="main_content06" style="padding-top: 0px; min-height: 800px; margin-bottom: 20px;">
		<div >
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
								<input type="text" id="sUsrId" name="sUsrId" class="input_style08" placeholder="아이디">					
								<span class="c13_01_03_txt_01">
									이름
								</span>
								<input type="text" id="sUsrNm" name="sUsrNm" class="input_style08" placeholder="이름">			
								<span class="c13_01_03_txt_01">
									검색어
								</span>
								<input type="text" id="sUsrNm" name="sValue" class="input_style08" placeholder="검색어">	
								<span class="c13_01_03_txt_01">
									구분
								</span>
								<span class="return_select5">
									<select id="sUsrTp" name="sUsrTp" class="">
										<option value="">전체</option>
										<option value="S">판매자</option>
										<option value="B">구매자</option>
										<option value="A" selected="selected">관리자</option>
									</select>
								</span>		
								<span class="c13_01_03_txt_01">
									상태
								</span>
								<span class="return_select2">
									<select id="sUsrLv" name="sUsrLv" class="">
										<option value="">전체</option>
										<option value="0">미승인사용자</option>
										<option value="1">정상사용자</option>
										<option value="5">비밀번호변경대상</option>
										<option value="6">비밀번호오류초과</option>
										<option value="7">관리대상</option>
										<option value="8">블랙리스트</option>
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
		<div class='col-sm-5 col-md-5' style='padding-top:2px;'>
		    <div id='ib-container1'></div>
		</div>
		<div id="frmDiv" style="display: none;">
			<form id="sheetFrm2" name="sheetFrm2">
				<input type="hidden" id="sCid" name="sCid">
			</form>
		</div>		
	</div>
