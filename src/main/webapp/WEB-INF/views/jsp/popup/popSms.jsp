<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/layout/include/base.jsp" %>
	<link rel="stylesheet" href="${staticRoot}/css/jquery-ui.css" type="text/css" />
	<script type="text/javascript" src="${staticRoot}/js/jquery-ui.js"></script>
	<link rel="stylesheet" href="${staticRoot}/sdk/css/jquery.timepicker.min.css" type="text/css" />
	<script type="text/javascript" src="${staticRoot}/sdk/js/jquery.timepicker.min.js"></script>
	<script type="text/javascript">
		var dupClick1 = false;
		var dev = 1;
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
			$('.timepicker').timepicker({
			    timeFormat: 'hh:mm p',
			    interval: 60,
			    minTime: '09 am',
			    maxTime: '06 pm',
			    defaultTime: '09',
			    startTime: '09',
			    dynamic: false,
			    dropdown: true,
			    scrollbar: true
			});			
			_BT.Reg.Number("mobile");
			initSheet();
			initDate();
			doAction('search', '1');
			iniMsg('${pageParm.openTp}');
		});
		function iniMsg(tp){
			if('1' == tp){
				var msg = opener.parent.getMsg();
				$('#oMsg').val(msg);
			}
		}
		function initDate(){
			_BT.makeCalendar('sDt', 'yy-mm-dd'); 
			$('#sDt').val(_BT.dateAdd($.datepicker.formatDate($.datepicker.ATOM, new Date()),+1,'d'));	
			$('#sTm').val("09:00 AM");	
		}
		function initSheet(){
			var initData = {};
			initData.Cfg = {
										'AutoFitColWidth': 'search|resize|init|colhidden|rowtransaction'
										};
			initData.HeaderMode = {};
			
			initData.Cols = [
					{'Header': '구분', 		'Type': 'Seq', 			'MinWidth': 40,		'SaveName': 'sSeq', 		'Align': 'Center', 	'Hidden':dev	}  
					,{'Header': '입력값',	'Type': 'Text', 			'MinWidth': 40, 	'SaveName': 'CNT', 		'Align': 'Center', 	'Hidden':dev	}  
					,{'Header': '코드',		'Type': 'Text', 			'MinWidth': 80, 	'SaveName': 'ID',			'Align': 'Center', 	'Hidden':dev	}  
					,{'Header': '이름', 		'Type': 'Text', 			'MinWidth': 50, 	'SaveName': 'NM',			'Align': 'Left', 		'Edit':0	} 
					,{'Header': '메세지', 	'Type': 'Text', 			'MinWidth': 200, 	'SaveName': 'RMK', 		'Align': 'Left', 		'Edit':0	} 
			];			
			// IBSheet 생성
			createIBSheet2($('#ib-container1')[0], 'mySheet1', '100%', '300px');
			
			// IBSheet 초기화
			IBS_InitSheet(mySheet1, initData);	
			
			// 편집 가능 여부 설정
			mySheet1.SetEditable(false);
			
			// 사이즈 맞춤
			mySheet1.FitColWidth();

			mySheet1.SetDataRowHeight(40);
		}
		function doAction(sAction, tar) { 
			switch(sAction) {     
				case 'search':            
					var sheet = eval('mySheet' + tar);
					if(1 == tar)
						sheet.DoSearch(_BT.FRONT.URL.Search.SheetCommMsg, $('#sheetFrm').serialize()); 
					break; 
			} 
		}
		function mySheet1_OnDblClick(Row, Col, Value, CellX, CellY, CellW, CellH) { 
			if (Row == 0) return; //헤더행일때는 폼에 반영 안함.
			var RMK = mySheet1.GetCellValue(Row,'RMK');
			var conRMK = RMK.replace(/\r\n/gi, "<br>").replace(/@{/gi, "<input style='color: red;' type='text' value='").replace(/}/gi, "'>") ;
			$('#oMsg').html(conRMK);
			$('#tmpId').val(mySheet1.GetCellValue(Row,'ID'));
			$('#conMsg').val('');
		}	
		function fnSend(){ 
			$( '#oMsg :input'  ).each(function( i ) {
				this.defaultValue = this.value;
			});
			var conMsg = $('#oMsg').html().replace(/<br>/gi , "\n").replace(/&gt;/gi , ">").replace(/<input style="color: red;" type="text" value="/gi ,  '').replace(/">/gi , '');
		
			if(_BT.isEmptyById('mobileNo',   '휴대폰 번호를 입력해 주세요.')) return false;
			if( dupClick1 ) {
				alert('발송중 입니다. 잠시만 기다려주세요.');
				return false;
			}
			$('#conMsg').val(conMsg);
   			_BT.ajaxCallbackSubmit('sheetFrm',  _BT.FRONT.URL.Customer.SendMsg, function(data) {
				dupClick1 = false;
				if($(data).size() > 0) {
					if(_BT.isEquals(data.code, 'success')) {
						passSend = true;
						alert(data.msg);
					}else{
						alert(data.msg);
					}
				}else{
					alert(data.msg);
				}
			},
			function(xhr, status, error) {
				dupClick1 = false;
				alert('서버와 통신 중 오류 발생 하였습니다.');
			});	
		}		
		function fnClean(){
			_BT.reset();
			initDate();
		}
		function fnClose(){
			window.close();
		}
	</script>
	<!-- 팝업창 시작 -->
	<h1 class="blue_title">
		SMS / LMS 발송 
		<span class="close" onclick="fnClose();">
		</span>
	</h1> 
	<div class="col-sm-5 col-md-5" style="height:310px;" >
	    <div id="ib-container1"></div>
	</div>	
	<div style="width:100%;">
		<div class="c13_01_02_box_03" style="width:400px;height:350px;display:table-cell;">
			<div id="oMsg" style="text-align:left;color:#000000;font-size:13px;line-height:120%; ">
			</div>
		</div>		
		<div class="c13_01_02_box_03" style="width:400px;height:350px;display:table-cell;">
			<form id="sheetFrm" name="sheetFrm">
				<input type="hidden" id="sValue" name="sValue" value=""/>			
				<input type="hidden" id="tmpId" name="tmpId" value=""/>			
				<input type="hidden" id="conMsg" name="conMsg" value=""/>		
			
			
				<span class="title" style="font-size:15px;color:#3f51b5;font-weight:700;" >알림톡 전송</span><br/><br/>
				<div style="text-align: left;">
					<span class="c13_01_02_txt_01" style="">번호</span>
					<input type="text" name="mobileNo" id="mobileNo" class="input_style13 mobile marginleft_5" maxlength="13" size="13" value="${pageParm.mobile}" placeholder="010xxxxxxxx"/>
				</div>	
				<div style="text-align: left;margin-top: 10px;">	
	<!-- 				
						<span class="c13_01_02_txt_01" style="">구분</span>
						<input id="click01" name="msgTp" value="SMS" class="join_checkbox" type="radio" checked="checked"><label class="join_form_check" for="click01">SMS</label>
						<input id="click02" name="msgTp" value="LMS" class="join_checkbox" type="radio"><label class="join_form_check" for="click02">LMS</label>
						<br/><br/>
	 -->				
					<input id="isAlarm" name="isAlarm" value="1" type="checkbox" class="chk" style="margin-bottom: 12px;"/>
					<label for="sendTp" class="signup_txt">예약발송</label>
					<span>
						<input type="text" class="input_style05" id="sDt" name="sDt" readonly="readonly"/>
						<input type="text" class="input_style05 timepicker" id="sTm" name="sTm" readonly="readonly"/>
					</span>
				</div>
			</form>
		</div>
	</div>
	<div class="btn_group margintop_10 marginbottom_10" style="margin-left:0;">
		<span class="form_btn_Type_blue" onclick="fnSend();">전 송</span>
		<span class="form_btn_Type_gray" onclick="fnClean();">초기화</span>
	</div>