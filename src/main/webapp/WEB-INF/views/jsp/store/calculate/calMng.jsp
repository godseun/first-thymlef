<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/layout/include/base.jsp" %>
	<script type="text/javascript">
		var dupClick1 = false;
		var dev = 1;
		$(function(){
			$('.sButton').click(function() {
				doAction($(this).data('type'), $(this).data('value'));
			});
			initSheet();
		});
		function initSheet(){
			var initData = {};
			initData.Cfg = {
						        'AutoFitColWidth': 'search|resize|init|colhidden|rowtransaction'
						        ,'UseHeaderSortCancel' : 1
				                ,'Page' : 1000
				                ,'AutoSumCalcMode':1
				                ,'SelectionSummary': 'EmptyCell'
								};
			initData.HeaderMode = {
			};
			
			initData.Cols = [
				{'Header': '마감구분',					'Type': 'Combo',		'MinWidth': 80,			'SaveName': 'MAGAM_TP',	 	'Align': 'Center',	'Edit':0,	'Save': 0,	'ComboText': '수수료율|계약단가',		'ComboCode': '1|2'		}
				,{'Header': '수수료율(S)',				'Type': 'Int',				'MinWidth': 80,			'SaveName': 'S',					'Align': 'Center',	'Edit':0,	'Save': 0, 	'Format' : '#,##0.0\\%' }
				,{'Header': '물류비정산',				'Type': 'Combo',		'MinWidth': 80,			'SaveName': 'MAGAM_DEVY',	'Align': 'Center',	'Edit':0,	'Save': 0,	'ComboText': '정산|미정산',			'ComboCode': '1|0'		}
				,{'Header': '배송비',					'Type': 'Int',		'MinWidth': 80,			'SaveName': 'DEVY', 				'Align': 'Right',		'Edit':0,	'Save': 0,	'Format':'Integer'	}
				,{'Header': '판매대금(A)',				'Type': 'Int',		'MinWidth': 80,			'SaveName': 'A', 					'Align': 'Right',		'Edit':0,	'Save': 0,	'Format':'Integer'	}
				,{'Header': '정산배송비(B)',			'Type': 'Int',		'MinWidth': 80,			'SaveName': 'B', 				'Align': 'Right',		'Edit':0,	'Save': 0,	'Format':'Integer'	}
				,{'Header': '수수료(Q)=(A*S)',		'Type': 'Int',		'MinWidth': 80,			'SaveName': 'Q',	 				'Align': 'Right',		'Edit':0,	'Save': 0,	'Format':'Integer'	}
				,{'Header': '정산금액(F)=(A-Q+B)',	'Type': 'Int',		'MinWidth': 80,			'SaveName': 'F', 				'Align': 'Right',		'Edit':0,	'Save': 0,	'Format':'Integer'	}
				,{'Header': '공급가액(T2)=(F/1.1)',		'Type': 'Int',		'MinWidth': 80,			'SaveName': 'T2', 				'Align': 'Right',		'Edit':0,	'Save': 0,	'Format':'Integer'	}
				,{'Header': '부가세(T1)=(T2*10%)',		'Type': 'Int',		'MinWidth': 80,			'SaveName': 'T1', 				'Align': 'Right',		'Edit':0,	'Save': 0,	'Format':'Integer'	}
				,{'Header': '상점코드',				 	'Type': 'Text', 			'MinWidth': 0, 		'SaveName': 'STORE_ID', 			'Align': 'Center', 	'Edit':0,	'Save': 0,	'Hidden':dev	}  
			];		

			// IBSheet 생성
			createIBSheet2($('#ib-container1')[0], 'mySheet1', '100%', '50px');
			// IBSheet 초기화
			IBS_InitSheet(mySheet1, initData);	

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
			createIBSheet2($('#ib-container3')[0], 'mySheet3', '100%', '400px');
			// IBSheet 초기화
			IBS_InitSheet(mySheet3, initData);	
			

			initData.Cols = [
				{'Header': '마감구분',	'Type': 'Combo',		'MinWidth': 80,			'SaveName': 'GUBUN',	 		'Align': 'Center',	'Edit':0,	'Save': 0,	'ComboText': '전월이월|당월마감|익월마감',		'ComboCode': '1|0|2'		}
				,{'Header': '주문번호',	'Type': 'Text',			'MinWidth': 150,		'SaveName': 'ORDR_ID',			'Align': 'Center',	'Edit':0,	'Save': 0		}
				,{'Header': '주문금액',	'Type': 'Int',				'MinWidth': 80,			'SaveName': 'TOT_PRICE',	 	'Align': 'Right',		'Edit':0,	'Save': 0,	'Format':'Integer', 	'ColMerge':0	}
				,{'Header': '배송비',	'Type': 'Int',				'MinWidth': 80,			'SaveName': 'DEVY_FEE', 		'Align': 'Right',		'Edit':0,	'Save': 0,	'Format':'Integer', 	'ColMerge':0	}
			];		
			
			// IBSheet 생성
			createIBSheet2($('#ib-container4')[0], 'mySheet4', '100%', '400px');
			
			// IBSheet 초기화
			IBS_InitSheet(mySheet4, initData);	
			
			// 편집 가능 여부 설정
			mySheet1.SetEditable(0);
			mySheet3.SetEditable(1);
			mySheet4.SetEditable(0);

			//건수 정보 표시
			mySheet3.SetCountPosition(4);
			mySheet4.SetCountPosition(4);
			
			//마우스오버
			mySheet1.SetMouseHoverMode(2) 
			mySheet3.SetMouseHoverMode(2) 
			mySheet4.SetMouseHoverMode(2) 
/* 
			mySheet1.ShowSubSum([{
			     "StdCol": "STTUS",
			     "SumCols": "9",
			     "AvgCols": "",
			     "ShowCumulate": 0,
			     "CaptionCol": 0
			}]);
 */
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

			mySheet3.SetCountPosition(3);
			mySheet3.SetSelectionSummaryInfoElement('');
		}

		function doAction(sAction, tar) { 
			switch(sAction) {  
				case 'search': 
					mySheet1.DoSearch(_BT.STORE.URL.Search.SheetMagamMng, $('#frm').serialize()); 
					mySheet3.DoSearch(_BT.STORE.URL.Search.SheetMagamDtl, $('#frm').serialize()); 
					mySheet4.DoSearch(_BT.STORE.URL.Search.SheetMagamDevy, $('#frm').serialize()); 
					break; 

				case 'import': 
					if(1 == tar) {    
						var cnt = mySheet3.RowCount();
				        var t = new Date();
				        var yymmdd = t.getFullYear() + '-' + AddZero(t.getMonth() + 1) + '-' + AddZero(t.getDate()); 
				        var printTime = yymmdd + '   ' + AddZero(t.getHours()) + ':' + AddZero(t.getMinutes());
				        var title = '[대화] '+$("#mon option:selected").text() + '마감 상세내역';
				        title += '[ ' + mySheet3.RowCount() + ' ]건, 출력시간 : ' + printTime + '\r\n\r\n\r\n';
						var params = {
				            'FileName': '[대화] '+$("#mon option:selected").text() + '마감_'+yymmdd+'.xlsx',
				            'SheetName': 'Sheet1',
				            'SheetDesign': 1,
				            'Merge': 0,
				            'TitleText': title,
				            'UserMerge': '0,0,2,15',
				            'CheckBoxOnValue': 'Y',
				            'CheckBoxOffValue': 'N',
				            'NumberTypeToText ': 1 
				        };
						mySheet3.Down2Excel(params);
					}else if(2 == tar) {
						var cnt = mySheet4.RowCount();
				        var t = new Date();
				        var yymmdd = t.getFullYear() + '-' + AddZero(t.getMonth() + 1) + '-' + AddZero(t.getDate()); 
				        var printTime = yymmdd + '   ' + AddZero(t.getHours()) + ':' + AddZero(t.getMinutes());
				        var title = '[대화] '+$("#mon option:selected").text() + '운임비_상세내역';
				        title += '[ ' + mySheet4.RowCount() + ' ]건, 출력시간 : ' + printTime + '\r\n\r\n\r\n';
						var params = {
				            'FileName': '[대화] '+$("#mon option:selected").text() + '운임비_'+yymmdd+'.xlsx',
				            'SheetName': 'Sheet1',
				            'SheetDesign': 1,
				            'Merge': 0,
				            'TitleText': title,
				            'UserMerge': '0,0,2,4',
				            'CheckBoxOnValue': 'Y',
				            'CheckBoxOffValue': 'N',
				            'NumberTypeToText ': 1 
				        };
						mySheet4.Down2Excel(params);
						
					}
					break; 	
			} 
		}
        function AddZero(str) {
            if ((str + '').length == 1) {
                return '0' + str;
            }
            return str;
        }
	</script>
	<div class="storeSection" style="min-height:600px;">
	 	<h1 class="title_Type03">
			정산 관리
			<div class="sub_location">
				<div class="list_location01">
					<span class="txt01">정산관리</span>
					<span class="arrow"><img src="${staticRoot}/img/bl_01.jpg" alt=">" /></span>
					<span class="last_txt">정산 상세</span>
				</div>
			</div>
		</h1>
		<form id="frm" name="frm">
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
									<select class="" id="mon" name="mon">
										<option value="201708">2017년 08월</option>
										<option value="201709">2017년 09월</option>
										<option value="201710">2017년 10월</option> 
										<option value="201711">2017년 11월</option> 
										<option value="201712">2017년 12월</option> 
									</select>
								</span>										
								<span class="inquiry_btn marginleft_7">
									<span data-type="search" data-value="1"  class="sButton btn_span fs-13 blue" style="float: right;">조회</span>
								</span>
							</td>
						</tr>
					</tbody>
				</table>	
			</div>
		</form>		
		<h1 class="title_con_Type01 margintop_20" style="margin-right:10px; text-align: left;">
			정산내역
		</h1>		
		<div class="col-sm-5 col-md-5" style="height:60px;width:100%;">
		    <div id="ib-container1"></div>
		</div>
		<h1 class="title_con_Type01 margintop_20" style="margin-right:10px; text-align: left;">
			정산 상세
			<span> 
				<span data-type="import" data-value="1"  class="sButton btn_span fs-13 pink" style="float: right;">내려받기</span>
			</span>
		</h1>		
		<div class="col-sm-5 col-md-5" style="height:410px;width:100%;">
		    <div id="ib-container3"></div>
		</div>
		<h1 class="title_con_Type01 margintop_10" style="margin-right:10px; text-align: left;">
			물류비 상세
			<span> 
				<span data-type="import" data-value="2"  class="sButton btn_span fs-13 pink" style="float: right;">내려받기</span>
			</span>
		</h1>		
		<div class="col-sm-5 col-md-5" style="height:410px;width:100%;">
		    <div id="ib-container4"></div>
		</div>
	</div>
