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
				{'Header': '상점명',							'Type': 'Text',			'MinWidth': 80,			'SaveName': 'STORE_NM',		'Align': 'Center',	'Edit':0,	'Save': 0		}
				,{'Header': '사업자등록번호',				'Type': 'Text',			'MinWidth': 80,			'SaveName': 'BIZ_NO',		 	'Align': 'Center',	'Edit':0,	'Save': 0,	'ComboText': '수수료율|계약단가',		'ComboCode': '1|2'		}
				,{'Header': '마감구분',						'Type': 'Combo',		'MinWidth': 80,			'SaveName': 'MAGAM_TP',	 	'Align': 'Center',	'Edit':0,	'Save': 0,	'ComboText': '수수료율|계약단가',		'ComboCode': '1|2'		}
				,{'Header': '수수료율(S)',					'Type': 'Int',				'MinWidth': 80,			'SaveName': 'S',					'Align': 'Center',	'Edit':0,	'Save': 0, 	'Format' : '#,##0.0\\%' }
				,{'Header': '물류비정산',					'Type': 'Combo',		'MinWidth': 80,			'SaveName': 'MAGAM_DEVY',	'Align': 'Center',	'Edit':0,	'Save': 0,	'ComboText': '정산|미정산',			'ComboCode': '1|0'		}
				,{'Header': '배송비',						'Type': 'AutoSum',		'MinWidth': 80,			'SaveName': 'DEVY', 				'Align': 'Right',		'Edit':0,	'Save': 0,	'Format':'Integer',		'Hidden':dev	}  
				,{'Header': '판매대금(A)',					'Type': 'AutoSum',		'MinWidth': 80,			'SaveName': 'A', 					'Align': 'Right',		'Edit':0,	'Save': 0,	'Format':'Integer'	}
				,{'Header': '정산배송비(B)',				'Type': 'AutoSum',		'MinWidth': 80,			'SaveName': 'B', 					'Align': 'Right',		'Edit':0,	'Save': 0,	'Format':'Integer'	}
				,{'Header': '수수료(Q)=(A*S)',			'Type': 'AutoSum',		'MinWidth': 80,			'SaveName': 'Q',	 				'Align': 'Right',		'Edit':0,	'Save': 0,	'Format':'Integer'	}
				,{'Header': '정산금액(F)=(A-Q+B)',		'Type': 'AutoSum',		'MinWidth': 80,			'SaveName': 'F', 					'Align': 'Right',		'Edit':0,	'Save': 0,	'Format':'Integer'	}
				,{'Header': '공급가액(T2)=(F/1.1)',		'Type': 'AutoSum',		'MinWidth': 80,			'SaveName': 'T2', 					'Align': 'Right',		'Edit':0,	'Save': 0,	'Format':'Integer'	}
				,{'Header': '부가세(T1)=(T2*10%)',	'Type': 'AutoSum',		'MinWidth': 80,			'SaveName': 'T1', 					'Align': 'Right',		'Edit':0,	'Save': 0,	'Format':'Integer'	}
				,{'Header': '계산서발행금액',				'Type': 'AutoSum',		'MinWidth': 80,			'SaveName': 'TAXBILL_AMT', 			'Align': 'Right',		'Edit':0,	'Save': 0,	'Format':'Integer'	}
				,{'Header': '일치여부',						'Type': 'Combo',		'MinWidth': 80,			'SaveName': 'DISCORD',		 	'Align': 'Center',	'Edit':0,	'Save': 0,	'ComboText': '|일치|불일치',		'ComboCode': '|Y|N'		}
				,{'Header': '계산서수량',					'Type': 'AutoSum',		'MinWidth': 80,			'SaveName': 'TAX_CNT', 		'Align': 'Right',		'Edit':0,	'Save': 0,	'Format':'Integer',		'Hidden':dev	}
				,{'Header': '상점코드',					 	'Type': 'Text', 			'MinWidth': 0, 			'SaveName': 'STORE_ID', 		'Align': 'Center', 	'Edit':0,	'Save': 0,	'Hidden':dev	}  
			];		
			
			// IBSheet 생성
			createIBSheet2($('#ib-container1')[0], 'mySheet1', '100%', '300px');			
			// IBSheet 초기화
			IBS_InitSheet(mySheet1, initData);	
			

			initData.Cols = [	
				{'Header': '번호',					'Type': 'Seq', 			'MinWidth': 50,			'SaveName': 'SEQ',			'Align': 'Center',	'Edit':0,	'Save': 1	, 	'ColMerge':0	}
				,{'Header': '선택',					'Type': 'CheckBox', 	'MinWidth': 50,		 	'SaveName': 'CHK',			'Align': 'Center',	'Edit':0, 	'Save': 1	, 	'ColMerge':0	}
				,{'Header': '구분',					'Type': 'Status',		'MinWidth': 50,			'SaveName': 'STATUS', 		'Align': 'Center',	'Edit':0,	'Save': 1,	'Hidden':dev	}
				,{'Header': '작성일자',				'Type': 'Text',			'MinWidth': 80,			'SaveName': 'CREATE_DT',		'Align': 'Center',	'Edit':0,	'Save': 1	,	'Hidden':dev	}  
				,{'Header': '승인번호',				'Type': 'Text',			'MinWidth': 80,			'SaveName': 'CONF_NO',		'Align': 'Center',	'Edit':0,	'Save': 1		}
				,{'Header': '발급일자',				'Type': 'Text',			'MinWidth': 80,			'SaveName': 'CONF_DT',		'Align': 'Center',	'Edit':0,	'Save': 1		}
				,{'Header': '전송일자',				'Type': 'Text',			'MinWidth': 80,			'SaveName': 'SEND_DT',		'Align': 'Center',	'Edit':0,	'Save': 1	,	'Hidden':dev	}  
				,{'Header': '공급자사업자등록번호',		'Type': 'Text',			'MinWidth': 80,			'SaveName': 'BIZ_NO',		'Align': 'Center',	'Edit':0,	'Save': 1		}
				,{'Header': '종사업장번호',			'Type': 'Text',			'MinWidth': 80,			'SaveName': 'BIZ_NO2',		'Align': 'Center',	'Edit':0,	'Save': 1	,	'Hidden':dev	}  
				,{'Header': '상호',					'Type': 'Text',			'MinWidth': 80,			'SaveName': 'COMP_NM',		'Align': 'Left',	'Edit':0,	'Save': 1		}
				,{'Header': '대표자명',				'Type': 'Text',			'MinWidth': 80,			'SaveName': 'RPRS_NM',		'Align': 'Center',	'Edit':0,	'Save': 1		}
				,{'Header': '주소',					'Type': 'Text',			'MinWidth': 80,			'SaveName': 'A8',			'Align': 'Center',	'Edit':0,	'Save': 0	,	'Hidden':dev	}  
				
				,{'Header': '공급받는자사업자등록번호',			'Type': 'Text',			'MinWidth': 80,			'SaveName': 'A9',		'Align': 'Center',	'Edit':0,	'Save': 0	,	'Hidden':dev	}  
				,{'Header': '종사업장번호',			'Type': 'Text',			'MinWidth': 80,			'SaveName': 'BIZ_NO2',		'Align': 'Center',	'Edit':0,	'Save': 1	,	'Hidden':dev	}  
				,{'Header': '상호2',					'Type': 'Text',			'MinWidth': 80,			'SaveName': 'A10',		'Align': 'Center',	'Edit':0,	'Save': 0,	'Hidden':dev	}  
				,{'Header': '대표자명2',				'Type': 'Text',			'MinWidth': 80,			'SaveName': 'A11',		'Align': 'Center',	'Edit':0,	'Save': 0	,	'Hidden':dev	}  
				,{'Header': '합계금액',				'Type': 'AutoSum',			'MinWidth': 80,			'SaveName': 'SUM_P',		'Align': 'Right',	'Edit':0,	'Save': 1		}
				,{'Header': '공급가액',				'Type': 'AutoSum',			'MinWidth': 80,			'SaveName': 'TOT_P',		'Align': 'Right',	'Edit':0,	'Save': 1		}
				,{'Header': '세액',					'Type': 'AutoSum',			'MinWidth': 80,			'SaveName': 'TAX_P',		'Align': 'Right',	'Edit':0,	'Save': 1		}
				,{'Header': '전자세금계산서분류',	'Type': 'Text',			'MinWidth': 80,			'SaveName': 'A15',		'Align': 'Center',	'Edit':0,	'Save': 0	,	'Hidden':dev	}  
				,{'Header': '전자세금계산서종류',	'Type': 'Text',			'MinWidth': 80,			'SaveName': 'A16',		'Align': 'Center',	'Edit':0,	'Save': 0,	'Hidden':dev	}  
				,{'Header': '발급유형',				'Type': 'Text',			'MinWidth': 80,			'SaveName': 'A17',		'Align': 'Center',	'Edit':0,	'Save': 0	,	'Hidden':dev	}  
				,{'Header': '비고',					'Type': 'Text',			'MinWidth': 80,			'SaveName': 'A18',		'Align': 'Center',	'Edit':0,	'Save': 0	,	'Hidden':dev	}  
				,{'Header': '영수/청구 구분',		'Type': 'Text',			'MinWidth': 80,			'SaveName': 'A19',		'Align': 'Center',	'Edit':0,	'Save': 0,	'Hidden':dev	}  
				,{'Header': '공급자 이메일',			'Type': 'Text',			'MinWidth': 80,			'SaveName': 'EMAIL',		'Align': 'Left',	'Edit':0,	'Save': 1		}
				,{'Header': '공급받는자 이메일1',	'Type': 'Text',			'MinWidth': 80,			'SaveName': 'A21',		'Align': 'Center',	'Edit':0,	'Save': 0,	'Hidden':dev	}  
				,{'Header': '공급받는자 이메일2',	'Type': 'Text',			'MinWidth': 80,			'SaveName': 'A22',		'Align': 'Center',	'Edit':0,	'Save': 0,	'Hidden':dev	}  
				,{'Header': '품목일자',				'Type': 'Text',			'MinWidth': 80,			'SaveName': 'PRDT_DT',		'Align': 'Center',	'Edit':0,	'Save': 1	,	'Hidden':dev	}  
				,{'Header': '품목명',				'Type': 'Text',			'MinWidth': 80,			'SaveName': 'PRDT_NM',		'Align': 'Center',	'Edit':0,	'Save': 1	,	'Hidden':dev	}  
				,{'Header': '품목규격',				'Type': 'Text',			'MinWidth': 80,			'SaveName': 'PRDT_ST',		'Align': 'Center',	'Edit':0,	'Save': 1	,	'Hidden':dev	}  
				,{'Header': '품목수량',				'Type': 'Int',				'MinWidth': 80,			'SaveName': 'PRDT_QY',		'Align': 'Center',	'Edit':0,	'Save': 1	,	'Format':'Integer'	,	'Hidden':dev	}  
				,{'Header': '품목단가',				'Type': 'Int',				'MinWidth': 80,			'SaveName': 'PRDT_PR',		'Align': 'Center',	'Edit':0,	'Save': 1	,	'Format':'Integer'	,	'Hidden':dev	}  
				,{'Header': '품목공급가액',			'Type': 'Int',				'MinWidth': 80,			'SaveName': 'PRDT_TOT',		'Align': 'Center',	'Edit':0,	'Save': 1,	'Format':'Integer'		,	'Hidden':dev	}  
				,{'Header': '품목세액',				'Type': 'Int',				'MinWidth': 80,			'SaveName': 'PRDT_TAX',		'Align': 'Center',	'Edit':0,	'Save': 1,	'Format':'Integer'		,	'Hidden':dev	}  
				,{'Header': '품목비고',				'Type': 'Text',			'MinWidth': 80,			'SaveName': 'A30',		'Align': 'Center',	'Edit':0,	'Save': 0	,	'Hidden':dev	}  
					
			];		
			// IBSheet 생성
			createIBSheet2($('#ib-container2')[0], 'mySheet2', '100%', '500px');			
			// IBSheet 초기화
			IBS_InitSheet(mySheet2, initData);	
			
			// 편집 가능 여부 설정
			mySheet1.SetEditable(0);
			mySheet2.SetEditable(1);

			//건수 정보 표시
			mySheet1.SetCountPosition(4);
			mySheet2.SetCountPosition(4);
			
			//마우스오버
			mySheet1.SetMouseHoverMode(2) 
			mySheet2.SetMouseHoverMode(2) 
			
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
					mySheet1.DoSearch(_BT.FRONT.URL.Search.SheetPurchase, $('#frm').serialize()); 
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
					var alerted = false;
					var sRow = mySheet2.FindCheckedRow('CHK').split('|');
					if(sRow == ''){alert('등록하실 계산서를 선택해 주세요.');return false;}

					for(var i=0; i < sRow.length; i++){
						var BIZ_NO = mySheet2.GetCellValue(sRow[i], 'BIZ_NO');
						var cnt1 = mySheet1.RowCount();
						for(var x=0; x<=cnt1; x++){
							if(
									BIZ_NO == mySheet1.GetCellValue(x, 'BIZ_NO')
								&& 'N' == mySheet1.GetCellValue(x, 'DISCORD') 
							){
								alerted = true;
							}
						}
					}
					if(alerted){
						if(!confirm('계산서 발행요청 금액과 실제 발행금액이 맞지 않습니다.\n\n계속 진행 하시겠습니까?')) return false;
					}else{
						if(!confirm('계산서 발행 내역을 등록 하시겠습니까?')) return false;
					}
							
					var opt = {UrlEncode:0, Mode:2, Delim:'#'};
					var SaveStr = mySheet2.GetSaveString(opt); 
					if('' == SaveStr){
						alert('등록하실 계산서를 선택해 주세요.'); 
						return false;
					}else if('KeyFieldError' == SaveStr){ 
						return false;
					}else{
						var rtnData = mySheet2.GetSaveData(_BT.FRONT.URL.Calculate.SetTaxBill, SaveStr+ "&"+$('#frm').serialize()); 
						mySheet2.LoadSaveData(rtnData);
					}
					break; 
			} 
		}
		function mySheet2_OnLoadExcel(result) { 
			var cnt1 = mySheet1.RowCount();
			var cnt2 = mySheet2.RowCount();
			for(var x=0; x<=cnt2; x++){
				var bizNo = mySheet2.GetCellValue(x, 'BIZ_NO');
				for(var y=0; y<=cnt1; y++){
					if(bizNo == mySheet1.GetCellValue(y, 'BIZ_NO')){
						var TAX = mySheet2.GetCellValue(x, 'SUM_P');
						var oTAX = mySheet1.GetCellValue(y, 'TAXBILL_AMT');
						var oTAX_CNT = mySheet1.GetCellValue(y, 'TAX_CNT');
						mySheet1.SetCellValue(y, 'TAXBILL_AMT', TAX + oTAX);
						mySheet1.SetCellValue(y, 'TAX_CNT', oTAX_CNT + 1);
						break; 		
					}
				}
			}
		}		
		function mySheet1_OnChange(row,col,VALUE){ 
			var tar = mySheet1.GetCellValue(row, 'F');
			var tax = mySheet1.GetCellValue(row, 'TAXBILL_AMT');
			if(tar != tax){
				mySheet1.SetRowBackColor(row, "#ffc600"); 
				mySheet1.SetCellValue(row, 'DISCORD', 'N');
			}else{
				var bizNo = mySheet1.GetCellValue(row, 'BIZ_NO');
				var cnt2 = mySheet2.RowCount();
				for(var x=1; x<=cnt2; x++){
					if(bizNo == mySheet2.GetCellValue(x, 'BIZ_NO')){
						mySheet2.SetCellValue(x, 'CHK', 1);
					}
				}
				mySheet1.SetRowBackColor(row, "#fffffe"); 
				mySheet1.SetCellValue(row, 'DISCORD', 'Y');
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
			<input type="hidden" id="jobTp" name="jobTp" value="jungSanMng"/>	
			<input type="hidden" id="calYn" name="calYn" value="I"/>	
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
								<span onclick="doAction('save');"  class="sButton btn_span fs-13 pink marginleft_5" style="float: right;">계산서 등록</span>
								<span onclick="doAction('search');" class="sButton btn_span fs-13 blue" style="float: right;">조회</span>
							</span>
						</td>
					</tr>
				</tbody>
			</table>	
		</div>
		<div class="col-sm-5 col-md-5 margintop_5" style="height:310px;width:100%;">
		    <div id="ib-container1"></div>
		</div>
		<h1 class="title_con_Type01 margintop_20" style="margin-right:10px; text-align: left;">
			발행 계산서 확인
			<span> 
				<span onclick="doAction('export');" class="sButton btn_span fs-13 green marginleft_20" style="float: right;">계산서 업로드</span>
			</span>
		</h1>		
		<div class="col-sm-5 col-md-5" style="height:510px;width:100%;">
		    <div id="ib-container2"></div>
		</div>
	</div>
