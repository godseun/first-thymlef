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
								,'MergeSheet': 4
				                ,'DeferredVScroll': 1
				                ,'Page' : 300
				                ,'AutoSumCalcMode':1
				                ,'SelectionSummary': 'EmptyCell'
								};
			initData.HeaderMode = {
			};
			initData.Cols = [
				{'Header': '대상',			'Type': 'Text',			'MinWidth': 80,			'SaveName': 'TAR_DT',	 		'Align': 'Center',	'Edit':0,	'Save': 0, 	'Format' : '####-##',	'ColMerge':0	}  
				,{'Header': '거래구분',		'Type': 'Combo',		'MinWidth': 80,			'SaveName': 'PAY_TP',			'Align': 'Center',	'Edit':0,	'Save': 0,	'ComboText': '카드|카드|가상계좌|계좌이체',		'ComboCode': 'Card|VCard|VBank|DirectBank'	, 	'ColMerge':0	}
				,{'Header': '구분',			'Type': 'Combo',		'MinWidth': 80,			'SaveName': 'MA_TP',			'Align': 'Center',	'Edit':0,	'Save': 0,	'ComboText': '승인|취소',		'ComboCode': 'A|C'	, 	'ColMerge':0	}
				,{'Header': '거래금액',		'Type': 'AutoSum',		'MinWidth': 100,		'SaveName': 'MA_TOT', 			'Align': 'Right',		'Edit':0,	'Save': 0,	'Format':'Integer'	, 	'ColMerge':0	}  
				,{'Header': '정산금액',		'Type': 'AutoSum',		'MinWidth': 100,		'SaveName': 'MA_SUM', 			'Align': 'Right',		'Edit':0,	'Save': 0,	'Format':'Integer'	, 	'ColMerge':0	}  
				,{'Header': '수수료',		'Type': 'AutoSum',		'MinWidth': 100,		'SaveName': 'MA_FEE', 			'Align': 'Right',		'Edit':0,	'Save': 0,	'Format':'Integer'	, 	'ColMerge':0	}  
				,{'Header': '실정산금액',	'Type': 'AutoSum',		'MinWidth': 100,		'SaveName': 'MA_INC', 			'Align': 'Right',		'Edit':0,	'Save': 0,	'Format':'Integer'	, 	'ColMerge':0	}  
			];			
			
			// IBSheet 생성
			createIBSheet2($('#ib-container1')[0], 'mySheet1', '100%', '200px');
			// IBSheet 초기화
			IBS_InitSheet(mySheet1, initData);	

			initData.Cols = [	
				{'Header': '번호',				'Type': 'Seq', 			'MinWidth': 50,			'SaveName': 'SEQ',			'Align': 'Center',	'Edit':0,	'Save': 1	, 	'ColMerge':0	}
				,{'Header': '상태', 				'Type': 'Status', 		'MinWidth': 40,			'SaveName': 'STATUS', 		'Align': 'Center',	'Edit':0,	'Save': 1	,	'Hidden':dev, 	'ColMerge':0	}
				,{'Header': '지급일',			'Type': 'Text',			'MinWidth': 80,			'SaveName': 'INC_DT',		'Align': 'Center',	'Edit':0,	'Save': 1	, 	'ColMerge':0	}
				,{'Header': '주문번호',			'Type': 'Text',			'MinWidth': 200,		'SaveName': 'OID',			'Align': 'Center',	'Edit':0,	'Save': 1	, 	'ColMerge':0	}
				,{'Header': 'TID',				'Type': 'Text',			'MinWidth': 80,			'SaveName': 'TID',			'Align': 'Center',	'Edit':0,	'Save': 1	,	'Hidden':dev, 	'ColMerge':0	}
				,{'Header': '카드',				'Type': 'Text',			'MinWidth': 80,			'SaveName': 'CARD',			'Align': 'Center',	'Edit':0,	'Save': 1	,	'Hidden':dev, 	'ColMerge':0	}
				,{'Header': '은행',				'Type': 'Text',			'MinWidth': 80,			'SaveName': 'BANK',			'Align': 'Center',	'Edit':0,	'Save': 1	,	'Hidden':dev, 	'ColMerge':0	}
				,{'Header': '거래금액',			'Type': 'AutoSum',		'MinWidth': 100,		'SaveName': 'PRICE', 		'Align': 'Right',		'Edit':0,	'Save': 1,	'Format':'Integer', 	'ColMerge':0	}  
				,{'Header': '수수료',			'Type': 'AutoSum',		'MinWidth': 80,			'SaveName': 'FEE', 			'Align': 'Right',		'Edit':0,	'Save': 1,	'Format':'Integer', 	'ColMerge':0	}  
				,{'Header': '부가세',			'Type': 'AutoSum',		'MinWidth': 80,			'SaveName': 'TAX', 			'Align': 'Right',		'Edit':0,	'Save': 1,	'Format':'Integer', 	'ColMerge':0	}  
				,{'Header': '지급액',			'Type': 'AutoSum',		'MinWidth': 80,			'SaveName': 'INC', 			'Align': 'Right',		'Edit':0,	'Save': 1,	'Format':'Integer', 	'ColMerge':0	}  
			];		
			// IBSheet 생성
			createIBSheet2($('#ib-container2')[0], 'mySheet2', '100%', '500px');			
			// IBSheet 초기화
			IBS_InitSheet(mySheet2, initData);				
			
			
			//mySheet1.ShowGroupRow('', '{%s} <font color="gray">({%c}건)</font>'); 
			
			// 편집 가능 여부 설정
			mySheet1.SetEditable(1);

			//건수 정보 표시
			//mySheet1.SetCountPosition(4);
			
			//마우스오버
			mySheet1.SetMouseHoverMode(2) 
			// 사이즈 맞춤
			//mySheet1.FitColWidth();
			
			// 써머리 관련
			mySheet1.SetCountPosition(3);
			mySheet1.SetSelectionSummaryInfoElement('');
		
		}

		function doAction(sAction) { 
			switch(sAction) {  
				case 'clear':           
					_BT.reset();
					initDate();
					mySheet1.RemoveAll(); 
					break;
					
				case 'search': 
					$('#mon').val('' + $("#yy option:selected").val() + $("#mm option:selected").val());
					mySheet1.DoSearch(_BT.FRONT.URL.Search.SheetSalesCal, $('#frm').serialize()); 
					break; 
					
				case 'export':          
			        var params = {
			            "Mode": "HeaderMatch",
			            "StartRow": "1",
			            "FileExt": "xls|xlsx|xltx"
			        };
			        mySheet2.LoadExcel(params);
					break; 		
					
				case 'save':    
					if(!confirm('매출 정산 내역을 등록 하시겠습니까?')) return false;
					var opt = {UrlEncode:0, Mode:2, Delim:'#'};
					var SaveStr = mySheet2.GetSaveString(opt); 
					if('' == SaveStr){
						alert('등록할 내역이 없습니다.\n\n다시 확인해 주세요.'); 
						return false;
					}else if('KeyFieldError' == SaveStr){ 
						return false;
					}else{
						var rtnData = mySheet2.GetSaveData(_BT.FRONT.URL.Calculate.SetIniBill, SaveStr+ "&"+$('#frm').serialize()); 
						mySheet2.LoadSaveData(rtnData);
					}
					break; 
			} 
		}
		function mySheet2_OnLoadExcel(result) { 
			var cnt2 = mySheet2.RowCount();
			var I_PRICE 	= 0;
			var I_FEE 		= 0;
			var I_TAX 		= 0;
			var I_INC 		= 0;
			var O_PRICE 	= 0;
			var O_FEE 		= 0;
			var O_TAX 		= 0;
			var O_INC 		= 0;
			var CARD 		= '';
			for(var x=1; x<=cnt2; x++){
				var PRICE 	= mySheet2.GetCellValue(x, 'PRICE');
				var FEE 		= mySheet2.GetCellValue(x, 'FEE');
				var TAX 	= mySheet2.GetCellValue(x, 'TAX');
				var INC 		= mySheet2.GetCellValue(x, 'INC');
			
				CARD 	= mySheet2.GetCellValue(x, 'CARD');
				if(PRICE > 0){
					I_PRICE 	= I_PRICE + PRICE;
					I_FEE 	= I_FEE + FEE;
					I_TAX 	= I_TAX + TAX;
					I_INC 	= I_INC + INC;
				}else{
					O_PRICE = O_PRICE + PRICE;
					O_FEE 	= O_FEE + FEE;
					O_TAX 	= O_TAX + TAX;
					O_INC 	= O_INC + INC;
				}
			}
			var cnt1 = mySheet1.RowCount();
			for(var y=1; y<=cnt1; y++){
				var PAY_TP = mySheet1.GetCellValue(y, 'PAY_TP'); 					
				var MA_TP = mySheet1.GetCellValue(y, 'MA_TP'); 					
				
				var MA_SUM = mySheet1.GetCellValue(y, 'MA_SUM'); 					
				var MA_FEE = mySheet1.GetCellValue(y, 'MA_FEE'); 					
				var MA_INC = mySheet1.GetCellValue(y, 'MA_INC'); 					
				
				if(CARD ==''){
					if(PAY_TP=='VBank'){
						if(MA_TP=='A'){
							mySheet1.SetCellValue(y, 'MA_SUM', 	MA_SUM + I_PRICE);
							mySheet1.SetCellValue(y, 'MA_FEE', 	(MA_FEE + I_FEE + I_TAX));
							mySheet1.SetCellValue(y, 'MA_INC', 	MA_INC + I_INC);
						}else{
							mySheet1.SetCellValue(y, 'MA_SUM', 	MA_SUM + O_PRICE);
							mySheet1.SetCellValue(y, 'MA_FEE', 	(MA_FEE + O_FEE + O_TAX));
							mySheet1.SetCellValue(y, 'MA_INC', 	MA_INC + O_INC);
						}
					}
				}else{
					if(PAY_TP=='Card'){
						if(MA_TP=='A'){
							mySheet1.SetCellValue(y, 'MA_SUM', 	MA_SUM + I_PRICE);
							mySheet1.SetCellValue(y, 'MA_FEE', 	(MA_FEE + I_FEE + I_TAX));
							mySheet1.SetCellValue(y, 'MA_INC', 	MA_INC + I_INC);
						}else{
							mySheet1.SetCellValue(y, 'MA_SUM', 	MA_SUM + O_PRICE);
							mySheet1.SetCellValue(y, 'MA_FEE', 	(MA_FEE + O_FEE + O_TAX));
							mySheet1.SetCellValue(y, 'MA_INC', 	MA_INC + O_INC);
						}
					}
				}
			}
		}
		function mySheet2_OnSaveEnd(code,msg) {
			if(code == 1){         
				alert('처리완료 하였습니다.');
				doAction('search');
			} else {         
				alert('처리중 오류가 발생했습니다.\n\n다시 확인 부탁 드립니다.');     
			} 
		} 
	</script>
	<div class="main_content06" style="padding-top: 0px; min-height: 800px; margin-bottom: 20px;">
		<form id="frm" name="frm">
			<input type="hidden" id="SaveStr" name="SaveStr"/>	
			<input type="hidden" id="jobTp" name="jobTp" value="salesMng"/>	
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
								<span onclick="doAction('save');"  class="sButton btn_span fs-13 pink marginleft_5" style="float: right;">정산내역 등록</span>
								<span onclick="doAction('search');" class="sButton btn_span fs-13 blue" style="float: right;">조회</span>
							</span>
						</td>
					</tr>
				</tbody>
			</table>	
		</div>	
		<div class="col-sm-5 col-md-5 margintop_5" style="height:210px;width:100%;">
		    <div id="ib-container1"></div>
		</div>
		<h1 class="title_con_Type01 margintop_20" style="margin-right:10px; text-align: left;">
			매출정산 확인
			<span> 
				<span onclick="doAction('export');" class="sButton btn_span fs-13 green marginleft_20" style="float: right;">매출내역서 업로드</span>
			</span>
		</h1>		
		<div class="col-sm-5 col-md-5" style="height:510px;width:100%;">
		    <div id="ib-container2"></div>
		</div>
	</div>
