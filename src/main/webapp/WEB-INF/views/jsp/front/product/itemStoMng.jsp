<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/layout/include/base.jsp" %>
	<div class="main_content06" style="padding-top: 0px; min-height: 800px; margin-bottom: 20px;">
		<div>
			<div style="display: table-cell;width: 624px;">
				<form id="sheetFrm" name="sheetFrm">
					<input type="hidden" id="PRDT_TP" name="PRDT_TP" value="J"/>			
					<h1 class="title_con_Type02" style="margin-top:20px;">
						재고상품 검색
						<span data-type="save" data-value="1" class="sButton btn_span fs-13 pink marginleft_5" style="float: right;">저장</span>
						<span data-type="add" data-value="1" class="sButton btn_span fs-13 green marginleft_5" style="float: right;">추가</span>
						<span data-type="search" data-value="1" class="sButton btn_span fs-13 blue marginleft_5" style="float: right;">조회</span>
						<input class="input_style20 marginleft_5" type="text" id="mValue" name="mValue" placeholder="검색어" style="float: right;"/>							
					</h1>
				</form>
				<div class="col-sm-5 col-md-5" style="margin-top:10px;" >
				    <div id="ib-container1"></div>
				</div>
			</div>
			<div style="display: table-cell;width: 624px; padding-left: 5px;">
				<h1 class="title_con_Type02" style="margin-top:20px;">
					신규 업로드
					<span data-type="save" data-value="2"  class="sButton btn_span fs-13 pink marginleft_5" style="float: right;">저장</span>
					<span data-type="search" data-value="2" class="sButton btn_span fs-13 green marginleft_5" style="float: right;">초기화</span>
					<span data-type="add" data-value="2"  class="sButton btn_span fs-13 blue" style="float: right;">업로드</span>
				</h1>		
				<div class="col-sm-5 col-md-5" style="margin-top:10px;">
				    <div id="ib-container2"></div>
				</div>	
			</div>	
		</div>
		<div class="signup_agree" style="margin-top:20px;" >
			<p class="alarm_txt">※ 기존 <span class="redCr">전체내역이 삭제</span>됩니다. 엑셀양식대로<span class="redCr">신규 업로드</span> 됩니다.</p>
		</div>	
	</div>
	<script type="text/javascript">
		var dupClick1 = false;
		var isDev = 1;
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
			_BT.setOnEnter("mValue","main_search_btn");	
			initSheet();
		});

		function initSheet(){
			var initData = {};
			initData.Cfg = {
			        'AutoFitColWidth': 'search|resize|init|colhidden|rowtransaction'
			        ,'UseHeaderSortCancel' : 1
					,'MergeSheet': msHeaderOnly 
					};
			initData.HeaderMode = {};
			
			initData.Cols = [
				{'Header': '상태', 				'Type': 'Status', 			'MinWidth': 0,		'SaveName': 'sStatus', 			'Align': 'Center', 	'Edit':0, 		'Hidden':isDev 	} 
				,{'Header': '삭제',				'Type': 'DelCheck', 		'MinWidth': 40, 	'SaveName': 'sDcb',				'Align': 'Center',	'Edit':1	  	}   
				,{'Header': '선택',				'Type': 'CheckBox', 		'MinWidth': 40, 	'SaveName': 'sCheckBox',		'Align': 'Center',	'Edit':1	  	}   
				,{'Header': '순번', 				'Type': 'Text', 				'MinWidth': 40,		'SaveName': 'PSEQ', 				'Align': 'Center', 	'Edit':0, 		'KeyField':1}  
				,{'Header': '파일',				'Type': 'Text', 				'MinWidth': 60,	 	'SaveName': 'INM', 				'Align': 'Center', 	'Hidden':isDev 	} 
				,{'Header': '규격코드',			'Type': 'Text', 				'MinWidth': 60,	 	'SaveName': 'sScd', 				'Align': 'Center', 	'Edit':0		}   
				,{'Header': '품명',				'Type': 'Text', 				'MinWidth': 100, 	'SaveName': 'sNm',				'Align': 'Left', 		'Edit':0 		}  
				,{'Header': '규격',				'Type': 'Text', 				'MinWidth': 130, 	'SaveName': 'sSt',					'Align': 'Left', 		'Edit':0 		}  
				,{'Header': '제조사',			'Type': 'Text', 				'MinWidth': 40, 	'SaveName': 'sMk',				'Align': 'Center', 	'Edit':0 		}  
				,{'Header': '판매가',			'Type': 'Int',					'MinWidth': 50,		'SaveName': 'sPrice',			 	'Align': 'Right',		'Edit':1,		'Format':'Integer'	}
				,{'Header': '구분', 				'Type': 'Seq', 				'MinWidth': 0,		'SaveName': 'sSeq', 				'Align': 'Center', 	'Hidden':isDev 	} 
			];		
			// IBSheet 생성
			createIBSheet2($('#ib-container1')[0], 'mySheet1', '100%', '500px');
			IBS_InitSheet(mySheet1, initData);	
			
			initData.Cols = [
				{'Header': '상태', 				'Type': 'Status', 			'MinWidth': 0,		'SaveName': 'sStatus', 			'Align': 'Center', 	'Edit':0, 		'Hidden':isDev 	} 
				,{'Header': '구분', 				'Type': 'Seq', 				'MinWidth': 0,		'SaveName': 'sSeq', 				'Align': 'Center', 	'Edit':0, 		'Hidden':isDev 	} 
				,{'Header': '삭제',				'Type': 'DelCheck', 		'MinWidth': 40, 	'SaveName': 'sDcb',				'Align': 'Center',	'Edit':1	  	}   
				,{'Header': '규격코드',			'Type': 'Text', 				'MinWidth': 60,	 	'SaveName': 'sScd', 				'Align': 'Center', 	'Edit':0		}   
				,{'Header': '수량',				'Type': 'Int',					'MinWidth': 50,		'SaveName': 'sQy',			 	'Align': 'Right',		'Edit':1,		'Format':'Integer'	}
			];	
			// IBSheet 생성
			createIBSheet2($('#ib-container2')[0], 'mySheet2', '100%', '500px');
			IBS_InitSheet(mySheet2, initData);			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			

			
		}		
	</script>