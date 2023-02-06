<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/layout/include/base.jsp" %>
	<script type="text/javascript">
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
					,{'Header': '삭제',		'Type': 'DelCheck', 	'Width': 40, 		'SaveName': 'sDcb',			'Align': 'Center',	'Edit':1,	'Save': 1, 	'ColMerge':0	}
					,{'Header': '품목코드',	'Type': 'Text',			'MinWidth': 80,		'SaveName': 'sDprdtCd', 	'Align': 'Center',	'Edit':1,	'Save': 1, 	'ColMerge':0, 		'KeyField':1	}
					,{'Header': '품명',		'Type': 'Text',			'MinWidth': 80,		'SaveName': 'sDprdtNm', 	'Align': 'Left',		'Edit':0,	'Save': 0	, 	'ColMerge':0	}
					,{'Header': '규격',		'Type': 'Text',			'MinWidth': 80,		'SaveName': 'sDstndrd', 	'Align': 'Left',		'Edit':0,	'Save': 0	, 	'ColMerge':0	}
					,{'Header': '수량',		'Type': 'Int',				'MinWidth': 50,		'SaveName': 'sDqy',		 	'Align': 'Right',		'Edit':1,	'Save': 1,	'Format':'Integer', 	'ColMerge':0, 	'DefaultValue':1,	'KeyField':1	}
					,{'Header': '합계',		'Type': 'Int',				'MinWidth': 50,		'SaveName': 'sDsumPrice', 	'Align': 'Right',		'Edit':0,	'Save': 0,	'Format':'Integer', 	'ColMerge':0	}
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
			 
		}
		function doAction(sAction, tar) { 
			switch(sAction) {     

				case 'search':            
					mySheet1.DoSearch(_BT.FRONT.URL.Search.SheetOrderDtlList, $('#sheetFrm').serialize()); 
					break; 
					
				case 'add':            
					rowNum = mySheet1.DataInsert(-1);
					break; 
					
				case 'save':            
					var opt = {AllSave :1, UrlEncode:0, Mode:2, Delim:"#"};
					var SaveStr = mySheet1.GetSaveString(opt); 
					if('' == SaveStr){
						alert('저장할 내역이 없습니다.'); 
						break;
					}else if('KeyFieldError' == SaveStr){ 
						break;
					}else{
						if(!confirm('${ordrUsrInfo.USR_NM}고객의 장바구니에 복사 하시겠습니까?')) break;
					}
					var rtnData = mySheet1.GetSaveData(_BT.FRONT.URL.Order.CopyCart, SaveStr+ "&"+$('#sheetFrm').serialize()); 
					mySheet1.LoadSaveData(rtnData);		
					break; 
			} 
		}
		function mySheet1_OnSaveEnd(code) {
			if(code == 1){         
				alert("장바구니에 복사에 성공하였습니다.");
			} else {         
				alert("장바구니에 복사에 실패하였습니다.");     
			} 
		} 
		function fnClose(){
			window.close();
		}
	</script>
	<!-- 팝업창 시작 -->
	<h1 class="blue_title">
		장바구니 등록 (${ordrUsrInfo.USR_NM} :: ${ordrUsrInfo.USR_ID})
		<span class="close" onclick="fnClose();">
		</span>
	</h1> 
	<form id="sheetFrm" name="sheetFrm">
		<input type="hidden" id="ordrUsrId" name="ordrUsrId" value="${ordrUsrInfo.USR_ID}" />	
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
							<span class="inquiry_btn marginleft_7">
								<span data-type="save" data-value="1"  class="sButton btn_span fs-13 pink marginleft_5" style="float: right;">저장</span>
								<span data-type="add" data-value="1"  class="sButton btn_span fs-13 green marginleft_5" style="float: right;">추가</span>
								<span data-type="search" data-value="1"  class="sButton btn_span fs-13 blue" style="float: right;">조회</span>
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
