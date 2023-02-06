<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/layout/include/base.jsp" %>
	<script type="text/javascript">
		<c:choose>
			<c:when test="${userSession.usrTp eq 'A'}">
				var serch = _BT.FRONT.URL.Search.SheetOrdrRmk;
				var save = _BT.FRONT.URL.Order.SaveOrdrRmk;
			</c:when>
			<c:when test="${userSession.usrTp eq 'S'}">
				var serch = _BT.STORE.URL.Search.SheetOrdrRmk;
				var save = _BT.STORE.URL.Order.SaveOrdrRmk;
			</c:when>
		</c:choose>		
		var dupClick1 = false;
		var isDev = 1;
		var rowNum = 0;
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
			doAction('search', '1');
		});
		function initSheet(){
			var initData = {};
			initData.Cfg = {
			        'AutoFitColWidth': 'search|resize|init|colhidden|rowtransaction'
			        ,'UseHeaderSortCancel' : 1
	                ,'DeferredVScroll': 1
					};
			initData.HeaderMode = {
			};
			initData.Cols = [
					{'Header': '구분', 		'Type': 'Text',			'MinWidth': 50,		'SaveName': 'sSeq', 			'Align': 'Center',	'Hidden':isDev	}	
					,{'Header': '상태', 		'Type': 'Status', 		'MinWidth': 40,		'SaveName': 'sStatus', 		'Align': 'Center',	'Hidden':isDev,		'Save': 1		} 
					,{'Header': '주문번호',	'Type': 'Text', 			'MinWidth': 80, 	'SaveName': 'sRltCd', 		'Align': 'Center',	'Hidden':isDev, 	'DefaultValue':'${pageParm.ordrId}'}
					,{'Header': '등록일',	'Type': 'Date', 			'MinWidth': 80, 	'SaveName': 'sCdt', 			'Align': 'Center', 	'Edit':0,		'Format' : 'YmdHm' }
					,{'Header': '등록자',	'Type': 'Text', 			'MinWidth': 80, 	'SaveName': 'sUsrNm', 		'Align': 'Center', 	'Edit':0, 		'DefaultValue':'${userSession.usrNm}'}
					,{'Header': '내용', 		'Type': 'Text', 			'MinWidth': 200, 	'SaveName': 'sCont', 		'Align': 'Left', 		'Edit':1, 		'MultiLineText': 1 }
					,{'Header': 'HL', 		'Type': 'Text', 			'MinWidth': 40, 	'SaveName': 'HL',		 		'Align': 'Left', 		'Hidden':isDev,		'Save': 1	} 
			];			
			// IBSheet 생성
			createIBSheet2($('#ib-container1')[0], 'mySheet1', '98%', '350px');
			
			// IBSheet 초기화
			IBS_InitSheet(mySheet1, initData);	
			
			// 편집 가능 여부 설정
			mySheet1.SetEditable(1);
			
			// 사이즈 맞춤
			mySheet1.FitColWidth();
			
			mySheet1.SetAutoRowHeight(1);
			
			mySheet1.SetDataRowHeight(40);
			 
		}
		function doAction(sAction, tar) { 
			switch(sAction) {     

				case 'search':            
					var sheet = eval('mySheet' + tar);
					if(1 == tar)
						sheet.DoSearch(serch, $('#sheetFrm').serialize()); 
					break; 
					
				case 'add':            
					rowNum = mySheet1.DataInsert(-1);
					break; 
					
				case 'save':            
					if($("#highLight").is(":checked")) 
						mySheet1.SetCellValue(rowNum, 'HL','Y') ;
					else	
						mySheet1.SetCellValue(rowNum, 'HL','N') ;
					var opt = {UrlEncode:0, Mode:2, Delim:"#"};
					var SaveStr = mySheet1.GetSaveString(opt); 
					if('' == SaveStr){
						alert('저장할 내역이 없습니다.'); 
						break;
					}else if('KeyFieldError' == SaveStr){ 
						break;
					}else{
						if(!confirm('변경 내역을 저장하시겠습니까?')) break;
					}
					var rtnData = mySheet1.GetSaveData(save, SaveStr); 
					mySheet1.LoadSaveData(rtnData);		
					break; 
			} 
		}
		function mySheet1_OnSaveEnd(code) {
			if(code == 1){         
				alert("비고내용 등록에 성공하였습니다.");
			} else {         
				alert("비고내용 등록에 실패하였습니다.");     
			} 
		} 
		function fnClose(){
			window.close();
		}
	</script>
	<!-- 팝업창 시작 -->
	<h1 class="blue_title">
		주문관리 내역조회
		<span class="close" onclick="fnClose();">
		</span>
	</h1> 
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
								주문번호
							</span>
							<input class="input_style20" style="width:165px; " type="text" placeholder="주문번호" id="ordrId" name="ordrId" value="${pageParm.ordrId}"/>							
							<input name="highLight" id="highLight" type="checkbox" value="A" style="margin-left: 10px;">
							<label for="click02" class="c13_01_03_txt_01" style="margin-left:5px;">하이라이트</label>
							<span class="inquiry_btn marginleft_7">
								<span data-type="save" data-value="1"  class="sButton btn_span fs-13 pink marginleft_5" style="float: right;">저장</span>
								<span data-type="add" data-value="1"  class="sButton btn_span fs-13 blue" style="float: right;">추가</span>
							</span>
						</td>
					</tr>
				</tbody>
			</table>	
		</div>
	</form>
	<div class="col-sm-5 col-md-5" style="margin-top:10px;margin-left:10px;height: 360px;" >
	    <div id="ib-container1"></div>
	</div>
