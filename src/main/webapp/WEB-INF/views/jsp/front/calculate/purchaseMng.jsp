<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/layout/include/base.jsp" %>
	<script type="text/javascript">
		var dupClick1 = false;
		var dev = 1;
		$(function(){
			initSheet();
			initDate();
			doAction('search');
		});
		function initDate(){
			var d = new Date();
			var yy = d.getFullYear();
			var mm = '';
			if(d.getMonth() == 0){
				yy -= 1;
				mm = '01';
			}else{
				if(d.getMonth() <  10)
					mm = '0'+(d.getMonth());
				else
					mm = (d.getMonth());
			}
			$('#yy').val(yy);
			$('#mm').val(mm);
		}		
		function initSheet(){
			var initData = {};
			initData.Cfg = {
						        'AutoFitColWidth': 'search|resize|init|colhidden|rowtransaction'
						        ,'UseHeaderSortCancel' : 1
				                ,'Page' : 300
				                ,'AutoSumCalcMode':1
				                ,'SelectionSummary': 'EmptyCell'
								};
			initData.HeaderMode = {
			};
			initData.Cols = [
				{'Header': '상점명',		'Type': 'Text',			'MinWidth': 80,			'SaveName': 'STORE_NM',		'Align': 'Center',	'Edit':0,	'Save': 0		}
				,{'Header': '주문상태',	'Type': 'Combo',		'MinWidth': 80,			'SaveName': 'STTUS',	 		'Align': 'Center',	'Edit':0,	'Save': 0,	'ComboText': '구매확정|구매취소|판매취소',		'ComboCode': '9|8|7'		}
				,{'Header': '주문자',	'Type': 'Text',			'MinWidth': 80,			'SaveName': 'USR_NM',			'Align': 'Center',	'Edit':0,	'Save': 0		}
				,{'Header': '주문번호',	'Type': 'Text',			'MinWidth': 150,		'SaveName': 'ORDR_ID',			'Align': 'Center',	'Edit':0,	'Save': 0		}
				,{'Header': '품목코드',	'Type': 'Text',			'MinWidth': 80,			'SaveName': 'PRDT_CD',			'Align': 'Center',	'Edit':0,	'Save': 0		}
				,{'Header': '품목명',	'Type': 'Text',			'MinWidth': 100,		'SaveName': 'PRDT_NM',			'Align': 'Left',		'Edit':0,	'Save': 0		}
				,{'Header': '제조사',	'Type': 'Text',			'MinWidth': 80,			'SaveName': 'MAKR_NM',		'Align': 'Left',		'Edit':0,	'Save': 0		}
				,{'Header': '규격',		'Type': 'Text',			'MinWidth': 80,			'SaveName': 'STNDRD',			'Align': 'Left',		'Edit':0,	'Save': 0		}
				,{'Header': '판매가',	'Type': 'Int',				'MinWidth': 80,			'SaveName': 'TOT_PRICE',	 	'Align': 'Right',		'Edit':0,	'Save': 0,	'Format':'Integer', 	'ColMerge':0	}
				,{'Header': '수량',		'Type': 'Int',				'MinWidth': 50,			'SaveName': 'QY',		 			'Align': 'Right',		'Edit':0,	'Save': 0,	'Format':'Integer', 	'ColMerge':0	}
				,{'Header': '거래금액',	'Type': 'Int',				'MinWidth': 80,			'SaveName': 'SUM_PRICE', 		'Align': 'Right',		'Edit':0,	'Save': 0,	'Format':'Integer', 	'ColMerge':0	}
				,{'Header': '주문일',		'Type': 'Date',			'MinWidth': 80,		'SaveName': 'ORDR_DT',	 			'Align': 'Center',	'Edit':0,	'Save': 0	,	'Format':'Ymd'	}
				,{'Header': '배송등록일',	'Type': 'Date',			'MinWidth': 80,		'SaveName': 'DELY_DT',	 			'Align': 'Center',	'Edit':0,	'Save': 0	,	'Format':'Ymd'	}
				,{'Header': '배송완료일',	'Type': 'Date',			'MinWidth': 80,		'SaveName': 'DELY_COMP_DT',	'Align': 'Center',	'Edit':0,	'Save': 0	,	'Format':'Ymd'	}
				,{'Header': '구매확정일',	'Type': 'Date',			'MinWidth': 80,		'SaveName': 'ORDT_COMP_DT',	'Align': 'Center',	'Edit':0,	'Save': 0	,	'Format':'Ymd'	}
				,{'Header': '구매취소일',	'Type': 'Date',			'MinWidth': 80,		'SaveName': 'CANCEL_DT',	 		'Align': 'Center',	'Edit':0,	'Save': 0	,	'Format':'Ymd'	}
			];		
			
			// IBSheet 생성
			createIBSheet2($('#ib-container1')[0], 'mySheet1', '100%', '500px');
			// IBSheet 초기화
			IBS_InitSheet(mySheet1, initData);	

			initData.Cols = [
				{'Header': '상점명',						'Type': 'Text',			'MinWidth': 80,			'SaveName': 'STORE_NM',		'Align': 'Center',	'Edit':0,	'Save': 0		}
				,{'Header': '마감구분',					'Type': 'Combo',		'MinWidth': 80,			'SaveName': 'MAGAM_TP',	 	'Align': 'Center',	'Edit':0,	'Save': 0,	'ComboText': '수수료율|계약단가',		'ComboCode': '1|2'		}
				,{'Header': '수수료율(S)',				'Type': 'Int',				'MinWidth': 80,			'SaveName': 'S',					'Align': 'Center',	'Edit':0,	'Save': 0, 	'Format' : '#,##0.0\\%' }
				,{'Header': '물류비정산',				'Type': 'Combo',		'MinWidth': 80,			'SaveName': 'MAGAM_DEVY',	'Align': 'Center',	'Edit':0,	'Save': 0,	'ComboText': '정산|미정산',			'ComboCode': '1|0'		}
				,{'Header': '배송비',					'Type': 'AutoSum',		'MinWidth': 80,			'SaveName': 'DEVY', 				'Align': 'Right',		'Edit':0,	'Save': 0,	'Format':'Integer'	}
				,{'Header': '판매대금(A)',				'Type': 'AutoSum',		'MinWidth': 80,			'SaveName': 'A', 					'Align': 'Right',		'Edit':0,	'Save': 0,	'Format':'Integer'	}
				,{'Header': '정산배송비(B)',			'Type': 'AutoSum',		'MinWidth': 80,			'SaveName': 'B', 				'Align': 'Right',		'Edit':0,	'Save': 0,	'Format':'Integer'	}
				,{'Header': '수수료(Q)=(A*S)',		'Type': 'AutoSum',		'MinWidth': 80,			'SaveName': 'Q',	 				'Align': 'Right',		'Edit':0,	'Save': 0,	'Format':'Integer'	}
				,{'Header': '정산금액(F)=(A-Q+B)',	'Type': 'AutoSum',		'MinWidth': 80,			'SaveName': 'F', 				'Align': 'Right',		'Edit':0,	'Save': 0,	'Format':'Integer'	}
				,{'Header': '공급가액(T2)=(F/1.1)',		'Type': 'AutoSum',		'MinWidth': 80,			'SaveName': 'T2', 				'Align': 'Right',		'Edit':0,	'Save': 0,	'Format':'Integer'	}
				,{'Header': '부가세(T1)=(T2*10%)',		'Type': 'AutoSum',		'MinWidth': 80,			'SaveName': 'T1', 				'Align': 'Right',		'Edit':0,	'Save': 0,	'Format':'Integer'	}
				,{'Header': '상점코드',				 	'Type': 'Text', 			'MinWidth': 0, 		'SaveName': 'STORE_ID', 			'Align': 'Center', 	'Edit':0,	'Save': 0,	'Hidden':dev	}  
			];		
			
			// IBSheet 생성
			createIBSheet2($('#ib-container2')[0], 'mySheet2', '100%', '300px');			
			// IBSheet 초기화
			IBS_InitSheet(mySheet2, initData);	
			

			initData.Cols = [
				{'Header': '마감구분',	'Type': 'Combo',		'MinWidth': 80,			'SaveName': 'GUBUN',	 		'Align': 'Center',	'Edit':0,	'Save': 0,	'ComboText': '전월이월|당월마감|익월마감',		'ComboCode': '1|0|2'		}
				,{'Header': '상태', 		'Type': 'Combo', 		'MinWidth': 70,			'SaveName': 'STTUS',	 		'Align': 'Center', 	'Edit':0,	'Save': 1,	'ComboText': '${sttus.cbText}', 'ComboCode': '${sttus.cbCode}', 	'ColMerge':0	}
				,{'Header': '주문자',	'Type': 'Text',			'MinWidth': 80,			'SaveName': 'USR_NM',			'Align': 'Center',	'Edit':0,	'Save': 0		}
				,{'Header': '주문번호',	'Type': 'Text',			'MinWidth': 150,		'SaveName': 'ORDR_ID',			'Align': 'Center',	'Edit':0,	'Save': 0		}
				,{'Header': '품목코드',	'Type': 'Text',			'MinWidth': 80,			'SaveName': 'PRDT_CD',			'Align': 'Center',	'Edit':0,	'Save': 0		}
				,{'Header': '품목명',	'Type': 'Text',			'MinWidth': 100,		'SaveName': 'PRDT_NM',			'Align': 'Left',		'Edit':0,	'Save': 0		}
				,{'Header': '제조사',	'Type': 'Text',			'MinWidth': 80,			'SaveName': 'MAKR_NM',		'Align': 'Left',		'Edit':0,	'Save': 0		}
				,{'Header': '규격',		'Type': 'Text',			'MinWidth': 80,			'SaveName': 'STNDRD',			'Align': 'Left',		'Edit':0,	'Save': 0		}
				,{'Header': '판매가',	'Type': 'Int',				'MinWidth': 80,			'SaveName': 'TOT_PRICE',	 	'Align': 'Right',		'Edit':0,	'Save': 0,	'Format':'Integer', 	'ColMerge':0	}
				,{'Header': '수량',		'Type': 'Int',				'MinWidth': 50,			'SaveName': 'QY',		 			'Align': 'Right',		'Edit':0,	'Save': 0,	'Format':'Integer', 	'ColMerge':0	}
				,{'Header': '거래금액',	'Type': 'Int',				'MinWidth': 80,			'SaveName': 'SUM_PRICE', 		'Align': 'Right',		'Edit':0,	'Save': 0,	'Format':'Integer', 	'ColMerge':0	}
				,{'Header': '주문일',		'Type': 'Date',			'MinWidth': 80,		'SaveName': 'ORDR_DT',	 			'Align': 'Center',	'Edit':0,	'Save': 0	,	'Format':'Ymd'	}
				,{'Header': '배송등록일',	'Type': 'Date',			'MinWidth': 80,		'SaveName': 'DELY_DT',	 			'Align': 'Center',	'Edit':0,	'Save': 0	,	'Format':'Ymd'	}
				,{'Header': '배송완료일',	'Type': 'Date',			'MinWidth': 80,		'SaveName': 'DELY_COMP_DT',	'Align': 'Center',	'Edit':0,	'Save': 0	,	'Format':'Ymd'	}
				,{'Header': '구매확정일',	'Type': 'Date',			'MinWidth': 80,		'SaveName': 'ORDT_COMP_DT',	'Align': 'Center',	'Edit':0,	'Save': 0	,	'Format':'Ymd'	}
			];		
			
			// IBSheet 생성
			createIBSheet2($('#ib-container3')[0], 'mySheet3', '100%', '500px');
			// IBSheet 초기화
			IBS_InitSheet(mySheet3, initData);	
			

			initData.Cols = [
				{'Header': '마감구분',	'Type': 'Combo',		'MinWidth': 80,			'SaveName': 'GUBUN',	 		'Align': 'Center',	'Edit':0,	'Save': 0,	'ComboText': '전월이월|당월마감|익월마감',		'ComboCode': '1|0|2'		}
				,{'Header': '주문번호',	'Type': 'Text',			'MinWidth': 150,		'SaveName': 'ORDR_ID',			'Align': 'Center',	'Edit':0,	'Save': 0		}
				,{'Header': '주문금액',	'Type': 'Int',				'MinWidth': 80,			'SaveName': 'TOT_PRICE',	 	'Align': 'Right',		'Edit':0,	'Save': 0,	'Format':'Integer', 	'ColMerge':0	}
				,{'Header': '배송비',	'Type': 'Int',				'MinWidth': 80,			'SaveName': 'DEVY_FEE', 		'Align': 'Right',		'Edit':0,	'Save': 0,	'Format':'Integer', 	'ColMerge':0	}
			];		
			
			// IBSheet 생성
			createIBSheet2($('#ib-container4')[0], 'mySheet4', '100%', '500px');
			
			// IBSheet 초기화
			IBS_InitSheet(mySheet4, initData);	
			
			// 편집 가능 여부 설정
			mySheet1.SetEditable(1);
			mySheet2.SetEditable(0);
			mySheet3.SetEditable(1);
			mySheet4.SetEditable(0);

			//건수 정보 표시
			mySheet1.SetCountPosition(4);
			mySheet3.SetCountPosition(4);
			mySheet4.SetCountPosition(4);
			
			//마우스오버
			mySheet1.SetMouseHoverMode(2) 
			mySheet2.SetMouseHoverMode(2) 
			mySheet3.SetMouseHoverMode(2) 
			mySheet4.SetMouseHoverMode(2) 

			mySheet1.ShowSubSum([{
			     "StdCol": "STTUS",
			     "SumCols": "10",
			     "AvgCols": "",
			     "ShowCumulate": 0,
			     "CaptionCol": 0
			}]);

			mySheet3.ShowSubSum([{
			     "StdCol": "GUBUN",
			     "SumCols": "10",
			     "AvgCols": "",
			     "ShowCumulate": 0,
			     "CaptionCol": 0
			}]);
			
			mySheet4.ShowSubSum([{
			     "StdCol": "GUBUN",
			     "SumCols": "3",
			     "AvgCols": "",
			     "ShowCumulate": 0,
			     "CaptionCol": 0
			}]);
	
			// 사이즈 맞춤
			//mySheet1.FitColWidth();
			
			// 써머리 관련
			mySheet2.SetCountPosition(3);
			mySheet2.SetSelectionSummaryInfoElement('');
		}

		function doAction(sAction) { 
			switch(sAction) {  
				case 'clear':           
					_BT.reset();
					initDate();
					mySheet1.RemoveAll(); 
					break;
					
				case 'search': 
					$('#storeId').val('');
					$('#mon').val('' + $("#yy option:selected").val() + $("#mm option:selected").val());
					mySheet2.DoSearch(_BT.FRONT.URL.Search.SheetStoreMng, $('#frm').serialize()); 
					mySheet1.DoSearch(_BT.FRONT.URL.Search.SheetPurchaseMng, $('#frm').serialize()); 
					break; 
					
				case 'save': 
					if(!confirm($("#mon option:selected").text() + ' 매입마감 확정 하시겠습니까?\n\n마감 후에는 데이터 변경이 불가 합니다.')) return false;

					dupClick1 = true; 
					_BT.ajaxCallbackSubmit('frm',  _BT.FRONT.URL.Calculate.SetStrMagam, function(data) {
						dupClick1 = false;
						if($(data).size() > 0) { 
							if(_BT.isEquals(data.code, 'success')){
								alert(data.msg);	
								return false;
							}else{
								alert(data.msg);	
								return false;
							}
						}
					},
					function(xhr, status, error) {
						dupClick1 = false; 
						alert('처리중 오류가 발생했습니다.\n\n다시 확인 부탁 드립니다.');
					});	
					break; 
			} 
		}
		
    	function mySheet2_OnDblClick(Row, Col, Value, CellX, CellY, CellW, CellH) { 
			if (Row == 0) return; //헤더행일때는 폼에 반영 안함.
			var storeId = mySheet2.GetCellValue(Row,'STORE_ID');
			$('#storeId').val(storeId);
			mySheet3.DoSearch(_BT.FRONT.URL.Search.SheetStrMagamDtl, $('#frm').serialize()); 
			mySheet4.DoSearch(_BT.FRONT.URL.Search.SheetStrDevy, $('#frm').serialize()); 
		}		
	
	</script>
	<div class="main_content06" style="padding-top: 0px; min-height: 800px; margin-bottom: 20px;">
		<form id="frm" name="frm">
			<input type="hidden" id="jobTp" name="jobTp" value="purchaseMng"/>	
			<input type="hidden" id="calYn" name="calYn" value="N"/>	
			<input type="hidden" id="storeId" name="storeId" />	
			<input type="hidden" id="mon" name="mon"/>	
		</form>	
		<div >
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
								마감대상
							</span>
							<span class="return_select6">
								<select class="" id="yy" name="yy" style="width: 70px;">
									<option value="2017">2017년</option>
									<option value="2018">2018년</option>
									<option value="2019">2019년</option>
									<option value="2020">2020년</option>
									<option value="2021">2021년</option>
									<option value="2022">2022년</option>
									<option value="2023">2023년</option>
								</select>
								<select class="" id="mm" name="mm" style="width: 50px;">
									<option value="01">01월</option>
									<option value="02">02월</option>
									<option value="03">03월</option>
									<option value="04">04월</option>
									<option value="05">05월</option>
									<option value="06">06월</option>
									<option value="07">07월</option>
									<option value="08">08월</option>
									<option value="09">09월</option>
									<option value="10">10월</option> 
									<option value="11">11월</option> 
									<option value="12">12월</option> 
								</select>
							</span>									
							<span class="inquiry_btn marginleft_7">
								<span onclick="doAction('save');"  class="sButton btn_span fs-13 pink marginleft_5" style="float: right;">매입확정</span>
								<span onclick="doAction('search');" class="sButton btn_span fs-13 blue" style="float: right;">조회</span>
							</span>
						</td>
					</tr>
				</tbody>
			</table>	
		</div>	
		<div class="col-sm-5 col-md-5 margintop_5" style="height:310px;width:100%;">
		    <div id="ib-container2"></div>
		</div>
		<h1 class="title_con_Type01 margintop_20" style="margin-right:10px; text-align: left;">
			매입 마감상세
		</h1>		
		<div class="col-sm-5 col-md-5" style="height:510px;width:100%;">
		    <div id="ib-container1"></div>
		</div>
		<h1 class="title_con_Type01 margintop_20" style="margin-right:10px; text-align: left;">
			상점별 마감상세
		</h1>		
		<div class="col-sm-5 col-md-5" style="height:510px;width:100%;">
		    <div id="ib-container3"></div>
		</div>
		<h1 class="title_con_Type01 margintop_10" style="margin-right:10px; text-align: left;">
			상점 물류비 상세
		</h1>		
		<div class="col-sm-5 col-md-5" style="height:510px;width:100%;">
		    <div id="ib-container4"></div>
		</div>
	</div>
