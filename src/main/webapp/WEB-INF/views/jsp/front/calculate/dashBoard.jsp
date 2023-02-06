<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/layout/include/base.jsp" %>
	<div class="main_content06" style="padding-top: 0px; min-height: 800px; margin-bottom: 20px;text-align: right;">
		<form id="frm" name="frm">
			<input id="mon2" name="mon2" type="hidden" />
			<input id="mon" name="mon" type="hidden" />
		</form>	
		<span class="return_select6">
			<select class="" id="yy2" name="yy2" style="width: 70px;">
				<option value="2017">2017년</option>
				<option value="2018">2018년</option>
				<option value="2019">2019년</option>
				<option value="2020">2020년</option>
				<option value="2021">2021년</option>
				<option value="2022">2022년</option>
				<option value="2023">2023년</option>
			</select>
			<select class="" id="mm2" name="mm2" style="width: 50px;">
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
		<span class="tbl_txt">
			~
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
		<div class="col-sm-5 col-md-5 margintop_20" style="height:410px; width:100%; display:none;">
		    <div id="ib-container1"></div>
		</div>
		<div class="col-sm-5 col-md-5 margintop_20" style="height:410px;width:100%;">
		    <div id="cont"></div> 
		</div>		
		<div class="col-sm-5 col-md-5 margintop_30" style="height:410px;width:100%;">
		    <div id="ib-container2"></div>
		</div>
		<div class="col-sm-5 col-md-5 margintop_20" style="height:410px;width:100%;">
		    <div id="ib-container3"></div>
		</div>
	</div>
	<script type="text/javascript">
		var dupClick1 = false;
		var dev = 1;
		$(function(){  
	    	$("#yy,#yy2,#mm,#mm2").on("change", function() {
				doAction('search');
	    	});
			initDate();
			initSheet();
			initChart();
			doAction('search');
		});
		function initDate(){
			var d = new Date();
			var yy = d.getFullYear();
			var mm = '';
			if(d.getMonth() + 1 < 10)
				mm = '0'+(d.getMonth() + 1);
			else
				mm = (d.getMonth() + 1);
			$('#yy').val(yy);
			$('#yy2').val(yy);
			$('#mm').val(mm);
			$('#mm2').val(mm);
		}
		function initSheet(){
			var initData = {};
			initData.Cfg = {
						        'AutoFitColWidth': 'search|resize|init|colhidden|rowtransaction'
						        ,'UseHeaderSortCancel' : 1
				                ,'DeferredVScroll' : 3
				                ,'Page' : 300
				                ,'AutoSumCalcMode':1
				                ,'SelectionSummary' : 'EmptyCell' 
								};
			initData.HeaderMode = {
			};
			initData.Cols = [
				{'Header': 'NAL',			'Type': 'Text', 		'MinWidth': 100,	'SaveName': 'NAL',			'Align': 'Center'		}
				,{'Header': '결제금액',		'Type': 'Int',			'MinWidth': 100,	'SaveName': 'SUM_PRICE',	'Align': 'Right',		'Format':'Integer'	}
				,{'Header': '취소금액',		'Type': 'Int',			'MinWidth': 100,	'SaveName': 'REFPRICE',		'Align': 'Right',		'Format':'Integer'	}
				,{'Header': '구매금액',		'Type': 'Int',			'MinWidth': 100,	'SaveName': 'TOTPRICE',	'Align': 'Right',		'Format':'Integer'	}
			];	
			// IBSheet 생성
			createIBSheet2($('#ib-container1')[0], 'mySheet1', '100%', '400px');
			// IBSheet 초기화
			IBS_InitSheet(mySheet1, initData);	
			// 편집 가능 여부 설정
			mySheet1.SetEditable(0);
			
			initData.Cols = [
				{'Header': '기준일',				'Type': 'Text', 			'MinWidth': 80,	'SaveName': 'NAL',		'Align': 'Center'		}
				,{'Header': '절삭',				'Type': 'AutoSum',		'MinWidth': 80,	'SaveName': 'C10_O',	'Align': 'Right',		'Format':'Integer'	}
				,{'Header': '작업',				'Type': 'AutoSum',		'MinWidth': 80,	'SaveName': 'C11_O',	'Align': 'Right',		'Format':'Integer'	}
				,{'Header': '전동',				'Type': 'AutoSum',		'MinWidth': 80,	'SaveName': 'C12_O',	'Align': 'Right',		'Format':'Integer'	}
				,{'Header': '에어/유압/엔진',	'Type': 'AutoSum',		'MinWidth': 80,	'SaveName': 'C13_O',	'Align': 'Right',		'Format':'Integer'	}
				,{'Header': '산업안전/용접',		'Type': 'AutoSum',		'MinWidth': 80,	'SaveName': 'C14_O',	'Align': 'Right',		'Format':'Integer'	}
				,{'Header': '운반/하역/포장',	'Type': 'AutoSum',		'MinWidth': 80,	'SaveName': 'C15_O',	'Align': 'Right',		'Format':'Integer'	}
				,{'Header': '전기/제어/측정',	'Type': 'AutoSum',		'MinWidth': 80,	'SaveName': 'C16_O',	'Align': 'Right',		'Format':'Integer'	}
				,{'Header': '화학/윤활/배관',	'Type': 'AutoSum',		'MinWidth': 80,	'SaveName': 'C17_O',	'Align': 'Right',		'Format':'Integer'	}
				,{'Header': '사무/생활/가전',	'Type': 'AutoSum',		'MinWidth': 80,	'SaveName': 'C18_O',	'Align': 'Right',		'Format':'Integer'	}
				,{'Header': '배송비',			'Type': 'AutoSum',		'MinWidth': 80,	'SaveName': 'DVY_O',	'Align': 'Right',		'Format':'Integer'	}
				,{'Header': '판매취소',			'Type': 'AutoSum',		'MinWidth': 80,	'SaveName': 'PRD_C7',	'Align': 'Right',		'Format':'Integer'	}
				,{'Header': '구매취소',			'Type': 'AutoSum',		'MinWidth': 80,	'SaveName': 'PRD_C8',	'Align': 'Right',		'Format':'Integer'	}
			];	
			// IBSheet 생성
			createIBSheet2($('#ib-container2')[0], 'mySheet2', '100%', '400px');
			
			// IBSheet 초기화
			IBS_InitSheet(mySheet2, initData);	
			
			// 편집 가능 여부 설정
			mySheet2.SetEditable(0);

			// 써머리 관련
			mySheet2.SetMouseHoverMode(2);
			mySheet2.SetCountPosition(3);
			mySheet2.SetAutoSumPosition(0); 
			mySheet2.SetSelectionSummaryInfoElement('');

			
			initData.Cols = [
				{'Header': '메이커',				'Type': 'Text', 			'MinWidth': 100,	'SaveName': 'MAKR_NM','Align': 'Left'		}
				,{'Header': '절삭',				'Type': 'AutoSum',		'MinWidth': 80,	'SaveName': 'C10_O',	'Align': 'Right',		'Format':'Integer'	}
				,{'Header': '작업',				'Type': 'AutoSum',		'MinWidth': 80,	'SaveName': 'C11_O',	'Align': 'Right',		'Format':'Integer'	}
				,{'Header': '전동',				'Type': 'AutoSum',		'MinWidth': 80,	'SaveName': 'C12_O',	'Align': 'Right',		'Format':'Integer'	}
				,{'Header': '에어/유압/엔진',	'Type': 'AutoSum',		'MinWidth': 80,	'SaveName': 'C13_O',	'Align': 'Right',		'Format':'Integer'	}
				,{'Header': '산업안전/용접',		'Type': 'AutoSum',		'MinWidth': 80,	'SaveName': 'C14_O',	'Align': 'Right',		'Format':'Integer'	}
				,{'Header': '운반/하역/포장',	'Type': 'AutoSum',		'MinWidth': 80,	'SaveName': 'C15_O',	'Align': 'Right',		'Format':'Integer'	}
				,{'Header': '전기/제어/측정',	'Type': 'AutoSum',		'MinWidth': 80,	'SaveName': 'C16_O',	'Align': 'Right',		'Format':'Integer'	}
				,{'Header': '화학/윤활/배관',	'Type': 'AutoSum',		'MinWidth': 80,	'SaveName': 'C17_O',	'Align': 'Right',		'Format':'Integer'	}
				,{'Header': '사무/생활/가전',	'Type': 'AutoSum',		'MinWidth': 80,	'SaveName': 'C18_O',	'Align': 'Right',		'Format':'Integer'	}
			];	
			// IBSheet 생성
			createIBSheet2($('#ib-container3')[0], 'mySheet3', '100%', '400px');
			
			// IBSheet 초기화
			IBS_InitSheet(mySheet3, initData);	
			
			// 편집 가능 여부 설정
			mySheet3.SetEditable(0);

			// 써머리 관련
			mySheet3.SetMouseHoverMode(2);
			mySheet3.SetCountPosition(3);
			mySheet3.SetAutoSumPosition(0); 
			mySheet3.SetSelectionSummaryInfoElement('');
			
		}		
		function initChart(){
			var d = new Date();
			
			var initData = {
				    chart: {
				        'type': 'line'
				    },
				    colors: [
				        '#3F51B5'
				       , '#e5404c'
				       , '#f6c8ba'
				    ],		            
		            legend: {
						layout: 'horizontal', //Legend 모양 설정    
						align : 'center',    //Legend 가로 정렬 설정   
						verticalAlign : 'bottom'    //Legend 세로 정렬 설정 
		            },
					plotOptions: {
						series: {
						    dataLabels: { //시리즈의 데이터 레이블 설정 
						        enabled: true,
						    }
						},
						column: {
						    pointPadding: 0.1 // 컬럼간의 간격 설정 
						}
					},
		            xAxis: {
		                tickInterval: 1, //X축 레이블 간격 설정     
			            labels : {   //X축 레이블 설정 
			                enabled: true
			            }
						,crosshair: true
						,showLastLabel : true
			        },
			        yAxis: {
						tickInterval: 1000000, //Y축 레이블 간격 설정      
						min : 0,    //Y축 Min값 설정   
						title : {     //Y축 제목 설정    
							text : "" 
				        }
				    },
				    title: {  // title 설정     
				    	text:'일자별 마감'
				    }, 
				    subtitle: {  // subtitle 설정     text:'2014년 1/4분기' 
				    },
				    series: [{  }]
			};			
			createIBChart('cont', 'myChart', {width: '100%', height: '400px' });
			myChart.setOptions(initData, {redraw: true});
		}
		function doAction(sAction) { 
			switch(sAction) {  
				case 'search':      
					$('#mon2').val('' + $("#yy2 option:selected").val() + $("#mm2 option:selected").val());
					$('#mon').val('' + $("#yy option:selected").val() + $("#mm option:selected").val());
					mySheet1.DoSearch(_BT.FRONT.URL.Search.ChartDailyMagam, $('#frm').serialize()); 
					mySheet2.DoSearch(_BT.FRONT.URL.Search.ChartCategMagam, $('#frm').serialize()); 
					mySheet3.DoSearch(_BT.FRONT.URL.Search.ChartMakerMagam, $('#frm').serialize()); 
					break; 
			}
		}		
		function mySheet1_OnRowSearchEnd (row) { 
			var cnt = mySheet1.RowCount();
			if (cnt == 0) return;
			var params = {
								datadirection : 'vertical'
								,datarowcol : '3|2'
								,legendseriesname : "결제금액|취소금액"
								,startdatarowcol :1
								,enddatarowcol : (cnt + 1)
								,labelrowcol : 0
								,startlabelrowcol : 1
								,endlabelrowcol : (cnt + 1)
								,labeldirection:'vertical'
								};
			sheet2chart(mySheet1, myChart, params);
		} 
	</script>	