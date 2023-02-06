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
		<div class="col-sm-5 col-md-5 margintop_20" style="height:310px;width:100%;">
		    <div id="cont"></div> 
		</div>
		<div class="col-sm-5 col-md-5 margintop_10" style="height:210px; width:100%">
		    <div id="ib-container1"></div>
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
				{'Header': '대상',				'Type': 'Text', 		'MinWidth': 100,	'SaveName': 'NAL',		'Align': 'Center'		}
				,{'Header': '직접 가입자수',		'Type': 'Int',			'MinWidth': 100,	'SaveName': 'DIR',			'Align': 'Right',		'Format':'Integer',	'Hidden':dev	}  
				,{'Header': 'sns 가입자수',		'Type': 'Int',			'MinWidth': 100,	'SaveName': 'SNS',		'Align': 'Right',		'Format':'Integer',	'Hidden':dev	}  
				,{'Header': '직접 가입자수',		'Type': 'Int',			'MinWidth': 100,	'SaveName': 'CNT1',		'Align': 'Right',		'Format':'Integer'	}
				,{'Header': 'sns 가입자수',		'Type': 'Int',			'MinWidth': 100,	'SaveName': 'CNT2',		'Align': 'Right',		'Format':'Integer'	}
				,{'Header': '총 가입자수',		'Type': 'Int',			'MinWidth': 100,	'SaveName': 'ACNT',		'Align': 'Right',		'Format':'Integer'	}
			];	
			// IBSheet 생성
			createIBSheet2($('#ib-container1')[0], 'mySheet1', '100%', '200px');
			// IBSheet 초기화
			IBS_InitSheet(mySheet1, initData);	
			// 편집 가능 여부 설정
			mySheet1.SetEditable(0);
		}			
		function initChart(){
			var d = new Date();
			
			var initData = {
				    "chart": {
				        "type": "area"
				    },
				    "colors": ["#fd9c3c",   "#e5404c", "#2ea4a8", "#adab6e" ],
				    "yAxis": {
						tickInterval: 100, //Y축 레이블 간격 설정      
				        "title": {
				            "text": '가입자(명)'
				        },
				        "labels": {
				            "formatter": function() {
				                return this.value;
				            }
				        }
				    },
				    "tooltip": {
				        "shared": true,
				        "valueSuffix": ' 가입자'
				    },
				    plotOptions: {
						series: {
						    dataLabels: { //시리즈의 데이터 레이블 설정 
						        enabled: true,
						    }
						},
				        area: {
				            "stacking": 'normal'
				        } 
				    }
				};
			createIBChart('cont', 'myChart', {width: '100%', height: '300px' });
			myChart.setOptions(initData, {redraw: true});
		}
		function doAction(sAction) { 
			switch(sAction) {  
				case 'search':            
					$('#mon2').val('' + $("#yy2 option:selected").val() + $("#mm2 option:selected").val());
					$('#mon').val('' + $("#yy option:selected").val() + $("#mm option:selected").val());
					mySheet1.DoSearch(_BT.FRONT.URL.Search.ChartDailyJoin, $('#frm').serialize()); 
					break; 
			}
		}		
		function mySheet1_OnRowSearchEnd (row) { 
			var cnt = mySheet1.RowCount();
			if (cnt == 0) return;
			var params = {
								datadirection : 'vertical'
								,datarowcol : '1|2'
								,legendseriesname : "직접가입|SNS가입"
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