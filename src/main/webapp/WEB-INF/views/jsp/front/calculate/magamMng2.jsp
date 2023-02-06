<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/layout/include/base.jsp" %>
	<script type="text/javascript">
		var dupClick1 = false;
		var dev = 0;
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
				                ,'DeferredVScroll': 1
				                ,'Page' : 300
				                ,'AutoSumCalcMode':1
				                ,'SelectionSummary': 'EmptyCell'
								};
			initData.HeaderMode = {
			};
			initData.Cols = [
				{'Header': '마감대상',									'Type': 'Text',			'MinWidth': 80,			'SaveName': 'TAR_MON',			'Align': 'Center',	'Edit':0,	'Save': 0	,	'ColMerge':0	}  
				,{'Header': '거래금액 (매출신고서상 거래금액)',		'Type': 'Int',				'MinWidth': 80,			'SaveName': 'TOT_SUM',			'Align': 'Right',		'Edit':0,	'Save': 0,	'Format':'Integer',		'ColMerge':0	}  
				,{'Header': '결제취소 선반영(조회일 기준 취소상태)',		'Type': 'Int',				'MinWidth': 80,			'SaveName': 'CAN_SUM',			'Align': 'Right',		'Edit':0,	'Save': 0,	'Format':'Integer',		'ColMerge':0	}  
				,{'Header': '정상주문금액(조회일 기준 정상주문건)',	'Type': 'Int',				'MinWidth': 80,			'SaveName': 'NOW_SUM',			'Align': 'Right',		'Edit':0,	'Save': 0,	'Format':'Integer',		'ColMerge':0	}  
			];		
			
			// IBSheet 생성
			createIBSheet2($('#ib-container1')[0], 'mySheet2', '100%', '50px');
			// IBSheet 초기화
			IBS_InitSheet(mySheet2, initData);	
			
			
			initData.Cols = [
				{'Header': '발생일',			'Type': 'Date',			'MinWidth': 80,			'SaveName': 'DT',	 					'Align': 'Center',	'Edit':0,	'Save': 0	,	'Format':'Ymd',		'ColMerge':0	}  
				,{'Header': '거래구분',		'Type': 'Combo',		'MinWidth': 80,			'SaveName': 'PAYMETHOD',			'Align': 'Center',	'Edit':0,	'Save': 0,	'ComboText': '카드|카드|가상계좌|계좌이체',		'ComboCode': 'Card|VCard|VBank|DirectBank'	, 	'ColMerge':0	}
				,{'Header': '구분',			'Type': 'Combo',		'MinWidth': 80,			'SaveName': 'GUBUN',				'Align': 'Center',	'Edit':0,	'Save': 0,	'ComboText': '승인|취소',		'ComboCode': 'APP|CAN'	, 	'ColMerge':0	}
				,{'Header': '주문번호',		'Type': 'Text',			'MinWidth': 150,		'SaveName': 'ORDR_ID',				'Align': 'Center',	'Edit':0,	'Save': 0	, 	'ColMerge':0	}
				,{'Header': '거래번호',		'Type': 'Text',			'MinWidth': 200,		'SaveName': 'OID',					'Align': 'Center',	'Edit':0,	'Save': 0	, 	'ColMerge':0	}  
				,{'Header': '거래금액',		'Type': 'AutoSum',		'MinWidth': 100,		'SaveName': 'PRICE', 				'Align': 'Right',		'Edit':0,	'Save': 0,	'Format':'Integer'	, 	'ColMerge':0	}  
			];		
			
			// IBSheet 생성
			createIBSheet2($('#ib-container2')[0], 'mySheet1', '100%', '500px');
			// IBSheet 초기화
			IBS_InitSheet(mySheet1, initData);	
			
			initData.Cols = [
				{'Header': '발생일',			'Type': 'Date',			'MinWidth': 80,			'SaveName': 'DT',	 					'Align': 'Center',	'Edit':0,	'Save': 0	,	'Format':'Ymd',		'ColMerge':0	}  
				,{'Header': '거래구분',		'Type': 'Combo',		'MinWidth': 80,			'SaveName': 'PAYMETHOD',			'Align': 'Center',	'Edit':0,	'Save': 0,	'ComboText': '카드|카드|가상계좌|계좌이체',		'ComboCode': 'Card|VCard|VBank|DirectBank'	, 	'ColMerge':0	}
				,{'Header': '구분',			'Type': 'Combo',		'MinWidth': 80,			'SaveName': 'GUBUN',				'Align': 'Center',	'Edit':0,	'Save': 0,	'ComboText': '승인|취소',		'ComboCode': 'APP|CAN'	, 	'ColMerge':0	}
				,{'Header': '주문번호',		'Type': 'Text',			'MinWidth': 150,		'SaveName': 'ORDR_ID',				'Align': 'Center',	'Edit':0,	'Save': 0	, 	'ColMerge':0	}
				,{'Header': '거래번호',		'Type': 'Text',			'MinWidth': 200,		'SaveName': 'OID',					'Align': 'Center',	'Edit':0,	'Save': 0	, 	'ColMerge':0	}  
				,{'Header': '거래금액',		'Type': 'AutoSum',		'MinWidth': 100,		'SaveName': 'PRICE', 				'Align': 'Right',		'Edit':0,	'Save': 0,	'Format':'Integer'	, 	'ColMerge':0	}  
			];		
			
			// IBSheet 생성
			createIBSheet2($('#ib-container3')[0], 'mySheet3', '100%', '200px');
			// IBSheet 초기화
			IBS_InitSheet(mySheet3, initData);	

			//mySheet1.ShowGroupRow('', '{%s} <font color="gray">({%c}건)</font>'); 
			
			// 편집 가능 여부 설정
			mySheet1.SetEditable(1);
			mySheet2.SetEditable(0);
			mySheet3.SetEditable(0);

			//건수 정보 표시
			mySheet1.SetCountPosition(4);
			
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
					mySheet1.RemoveAll(); 
					break;
					
				case 'search': 
					$('#mon').val('' + $("#yy option:selected").val() + $("#mm option:selected").val());
					mySheet2.DoSearch(_BT.FRONT.URL.Search.SheetSalesSum, $('#frm').serialize()); 
					mySheet1.DoSearch(_BT.FRONT.URL.Search.SheetSalesMng, $('#frm').serialize()); 
					mySheet3.DoSearch(_BT.FRONT.URL.Search.SheetCancelMng, $('#frm').serialize()); 
					break; 

				case 'import':     
					var cnt = mySheet1.RowCount();			      
			        var t = new Date();
			        var yymmdd = t.getFullYear() + '-' + AddZero(t.getMonth() + 1) + '-' + AddZero(t.getDate()); 
			        var printTime = yymmdd + '   ' + AddZero(t.getHours()) + ':' + AddZero(t.getMinutes());  
			        var title = '[마감대상] 주문기간 : ' + $('#yy').val()+$('#mm').val(); 
			        title += '[ ' + mySheet1.RowCount() + ' ]건, 출력시간 : ' + printTime + '\r\n\r\n\r\n';
					var params = {
			            'FileName': '마감대상_'+$('#yy').val()+$('#mm').val()+'.xlsx',
			            'SheetName': 'Sheet1',
			            'SheetDesign': 1,
			            'Merge': 0,
			            'TitleText': title,
			            'UserMerge': '0,0,2,6',
			            'CheckBoxOnValue': 'Y',
			            'CheckBoxOffValue': 'N',
			            'NumberTypeToText ': 1 
			        };
					mySheet1.Down2Excel(params);
					break; 		
					
				case 'export':          
			        var params = {
			            "Mode": "HeaderMatch",
			            "StartRow": "6",
			            "FileExt": "xls|xlsx|xltx"
			        };
			        mySheet1.LoadExcel(params);
					break; 		
				case 'save': 
					if( dupClick1 ) {
						alert("처리중 입니다. 잠시만 기다려주세요.");
						return false;
					}
					if(!confirm('마감대상월의 정산 데이터가 초기화 됩니다.\n\n매출 마감기초 데이터를 생성 하시겠습니까?')) return false;
					dupClick1 = true; 
					_BT.ajaxCallbackSubmit('frm',  _BT.FRONT.URL.Calculate.InsSalesData, function(data) {
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
        function AddZero(str) {
            if ((str + '').length == 1) {
                return '0' + str;
            }
            return str;
        }
		function mySheet1_OnRowSearchEnd (row) { 
			if(mySheet1.GetCellValue(row, 'GUBUN') == 'CAN'){
				mySheet1.SetRowFontColor(row, '#FF0000'); 
			}
		} 
        
	</script>
	<div class="main_content06" style="padding-top: 0px; min-height: 800px; margin-bottom: 20px;">
		<form id="frm" name="frm">
			<input type="hidden" id="SaveStr" name="SaveStr"/>	
			<input type="hidden" id="jobTp" name="jobTp" value="magamMng2"/>	
			<input type="hidden" id="mon" name="mon"/>	
		</form>		
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
								<span onclick="doAction('save');"  class="sButton btn_span fs-13 pink marginleft_5" style="float: right;">마감기초 생성</span>
								<span onclick="doAction('search');" class="sButton btn_span fs-13 blue" style="float: right;">조회</span>
							</span>
						</td>
					</tr>
				</tbody>
			</table>	
		</div>
		<div class="col-sm-5 col-md-5 margintop_5" style="height:60px;width:100%;">
		    <div id="ib-container1"></div>
		</div>
		<h1 class="title_con_Type01 margintop_20" style="margin-right:10px; text-align: left;">
			매출 신고대상 거래내역 
			<span> 
				<span onclick="doAction('import');" class="sButton btn_span fs-13 blue marginleft_5" style="float: right;">내려받기</span>
			</span>
		</h1>		
		<div class="col-sm-5 col-md-5" style="height:510px;width:100%;">
		    <div id="ib-container2"></div>
		</div>
		<h1 class="title_con_Type01 margintop_20" style="margin-right:10px; text-align: left;">
			결제취소 선반영 내역 
		</h1>		
		<div class="col-sm-5 col-md-5" style="height:210px;width:100%;">
		    <div id="ib-container3"></div>
		</div>
	</div>
