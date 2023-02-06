<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/layout/include/base.jsp" %>
	<jsp:include page="/WEB-INF/views/common/layout/include/front_mata.jsp"/>
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
			doAction('search', '1');
		});
		function initSheet(){
			var initData = {};
			initData.Cfg = {
										'AutoFitColWidth': 'search|resize|init|colhidden|rowtransaction'
										};
			initData.HeaderMode = {};
			
			initData.Cols = [
					{'Header': '구분', 			'Type': 'Seq', 			'MinWidth': 50,		'SaveName': 'sSeq', 			'Align': 'Center' 	}, 
					{'Header': '제조사코드',		'Type': 'Text', 			'MinWidth': 80, 	'SaveName': 'sMkCd', 		'Align': 'Center', 	'Edit':0	},   
					{'Header': '제조사명', 		'Type': 'Text', 			'MinWidth': 150, 	'SaveName': 'sMkNm', 		'Align': 'Left', 		'Edit':0	} 
			];			
			// IBSheet 생성
			createIBSheet2($('#ib-container1')[0], 'mySheet1', '100%', '300px');
			
			// IBSheet 초기화
			IBS_InitSheet(mySheet1, initData);	
			
			// 편집 가능 여부 설정
			mySheet1.SetEditable(false);
			
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
			} 
		}
		function mySheet1_OnDblClick(Row, Col, Value, CellX, CellY, CellW, CellH) { 
			var obj = mySheet1.GetRowData(Row);
			opener.parent.fnSetMaker(obj);
			fnClose();
		 } 
		function fnChoice(){
			if(mySheet1.GetSelectRow() < 1) return false;
			mySheet1_OnDblClick(mySheet1.GetSelectRow(),'','','','','','');
		}
		function fnClose(){
			window.close();
		}
	</script>
	<!-- 팝업창 시작 -->
	<h1 class="blue_title">
		브랜드 조회
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
								제조사명
							</span>
							<input class="input_style08" type="text" placeholder="제조사명" id="sValue" name="sValue"/>							
							<span class="inquiry_btn marginleft_7">
								<span data-type="search" data-value="1"  class="sButton btn_span fs-13 blue" style="float: right;">조회</span>
							</span>
						</td>
					</tr>
				</tbody>
			</table>	
		</div>
	</form>
	<div class="col-sm-5 col-md-5" style="margin-top:10px;height: 310px;" >
	    <div id="ib-container1"></div>
	</div>
	<div class="btn_group margintop_20 marginbottom_10">
		<span class="form_btn_Type_blue" onclick="fnChoice();">선 택</span>
		<span class="form_btn_Type_gray" onclick="fnClose();">취 소</span>
	</div>