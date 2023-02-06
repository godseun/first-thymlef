<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/layout/include/base.jsp" %>
	<script type="text/javascript">
		var dupClick1 = false;
		var uCnt = 0;
		var dev = 1;
		$(function(){ 
			$( ":input" ).on("focus", function() {
	    		$(this).addClass("mOn");
	    	});
			$( ":input" ).on("focusout", function() {
	    		$(this).removeClass("mOn");
	    	}); 
			$('.sButton').click(function() {
				doAction($(this).data('type'), $(this).data('value'));
			});
			$('#showLog').on('change', function(){
				if($("#showLog").prop("checked")){
					$('#recvlog').removeClass("vOff");
				}else{
					$('#recvlog').addClass("vOff");
				} 
			});
			_BT.Reg.Number("number");
			_BT.makeCalendar('sDt', 'yy-mm-dd'); 
			_BT.makeCalendar('eDt', 'yy-mm-dd'); 
			_BT.setOnEnter("mobile","main_search_btn");	
			initSheet();
			initDate();
			setInterval("conCheck()", 1200000);
		});
		function conCheck(){
			doAction('search', '0');
		}
		function initDate(){
			var d = new Date();
			$('#sDt, #eDt').val($.datepicker.formatDate($.datepicker.ATOM, d));
			
			if(d.getMonth() + 1 < 10)
				$('#mon').val('0'+(d.getMonth() + 1));
			else
				$('#mon').val(d.getMonth() + 1);
			
			$('#year').val(d.getFullYear());
		}
		function initSheet(){
			var initData = {};
			initData.Cfg = {
							        'AutoFitColWidth': 'search|resize|init|colhidden|rowtransaction'
							        ,'UseHeaderSortCancel' : 1
									,'MergeSheet' : 9 
					                ,'DeferredVScroll' : 1
					                ,'Page' : 1500
					                ,'AutoSumCalcMode':1
					                ,'SelectionSummary' : 'NotEmptyCell' 
									};
			initData.HeaderMode = {};
			initData.Cols = [
					{'Header': '구분',			'Type': 'Status',		'Width': 50,		'SaveName': 'sStatus', 		'Align': 'Center',	'Save': 1,	'Edit':0,		'Hidden':dev,	'ColMerge':0 	}
					,{'Header': '구분',			'Type': 'Combo',		'Width': 50,		'SaveName': 'USR_LV',	 	'Align': 'Center',	'Save': 1	,	'Edit':1,		'ComboText': '일반회원|우수고객|관심고객', 'ComboCode': '1|9|8',	'ColMerge':0 	}
					,{'Header': '연락처',		'Type': 'Text',			'Width': 80, 	'SaveName': 'PHONE',	 	'Align': 'Center',	'Save': 1	,	'UpdateEdit':0,		'InsertEdit':1,	'ColMerge':0 	}
					,{'Header': '연락처',		'Type': 'Popup',		'Width': 40,		'SaveName': 'CALL1',			'Align': 'Center',	'Save': 0,	'Edit':1, 		'ColMerge':0, 	'DefaultValue':'전화' }
					,{'Header': '연락처', 		'Type': 'Popup',		'Width': 40,		'SaveName': 'SMS1',			'Align': 'Center',	'Save': 0,	'Edit':1,	 	'ColMerge':0, 	'DefaultValue':'SMS' }
					,{'Header': '추가연락처',	'Type': 'Text',			'Width': 80, 	'SaveName': 'PHONE2',	 	'Align': 'Center',	'Save': 1,	'Edit':1,		'ColMerge':0 	}
					,{'Header': '추가연락처',	'Type': 'Popup',		'Width': 40,		'SaveName': 'CALL2',			'Align': 'Center',	'Save': 0,	'Edit':1, 		'ColMerge':0, 	'DefaultValue':'전화' }
					,{'Header': '추가연락처',	'Type': 'Popup',		'Width': 40,		'SaveName': 'SMS2',			'Align': 'Center',	'Save': 0,	'Edit':1,	 	'ColMerge':0, 	'DefaultValue':'SMS' }
					,{'Header': '고객명', 		'Type': 'Text',			'Width': 60, 	'SaveName': 'USR_NM', 		'Align': 'Center',	'Save': 1,	'Edit':1,		'ColMerge':0 	}
					,{'Header': '아이디', 		'Type': 'Text',			'Width': 60, 	'SaveName': 'USR_ID', 		'Align': 'Center',	'Save': 1,	'Edit':1,		'ColMerge':0 	}
					,{'Header': '처리',			'Type': 'Date',			'Width': 80, 	'SaveName': 'UPDATE_DT',	'Align': 'Center',	'Save': 0,	'Edit':0,		'Format':'YmdHm',	'ColMerge':0 	}
					,{'Header': '처리',			'Type': 'Text',			'Width': 40, 	'SaveName': 'UPDATE_ID',	'Align': 'Center',	'Save': 0,	'Edit':0,		'ColMerge':0 	}
			];			
			
			// IBSheet 생성
			var container = $('#ib-container0')[0];
			createIBSheet2(container, 'mySheet0', '100%', '70px');
			
			// IBSheet 초기화
			IBS_InitSheet(mySheet0, initData);	
			
			initData.Cols = [
					{'Header': '요청',		'Type': 'Date',			'Width': 80, 	'SaveName': 'REQ_DT',		'Align': 'Center',	'Save': 0,	'Edit':0,		'Format':'YmdHms',	'ColMerge':0 	}
					,{'Header': '연락처',	'Type': 'Text',			'Width': 80, 	'SaveName': 'PHONE',	 	'Align': 'Center',	'Save': 1	,	'Edit':0,		'ColMerge':0 	}
					,{'Header': '상태',		'Type': 'Combo',		'Width': 40,		'SaveName': 'JOB_TP', 		'Align': 'Center',	'Save': 0,	'Edit':0,		'ComboText': 'CRM|SR', 'ComboCode': 'C|S',	'ColMerge':0 	}
					,{'Header': '회신',		'Type': 'Date',			'Width': 80, 	'SaveName': 'CONF_DT',		'Align': 'Center',	'Save': 0,	'Edit':0,		'Format':'YmdHms',	'ColMerge':0 	}
					,{'Header': '회신',		'Type': 'Text',			'Width': 40, 	'SaveName': 'CONF_ID',		'Align': 'Center',	'Save': 0,	'Edit':0,		'ColMerge':0 	}
			];			
			// IBSheet 생성
			var container = $('#ib-container1')[0];
			createIBSheet2(container, 'mySheet1', '100%', '300px');

			// IBSheet 초기화
			IBS_InitSheet(mySheet1, initData);	
			
			var container = $('#ib-container2')[0];
			createIBSheet2(container, 'mySheet2', '100%', '300px');
			
			// IBSheet 초기화
			IBS_InitSheet(mySheet2, initData);	
			
			// 편집 가능 여부 설정
			mySheet0.SetEditable(true);
			mySheet1.SetEditable(true);
			mySheet2.SetEditable(true);
			
			// 사이즈 맞춤
			mySheet0.FitColWidth();
			mySheet1.FitColWidth();
			mySheet2.FitColWidth();
		}
		function doAction(sAction, tar) { 
			switch(sAction) {  
				case 'clear':     //초기화
					mySheet1.RemoveAll(); 
					break;   

				case 'search':     //검색
					if(tar == 0){
						mySheet0.RemoveAll(); 
						doAction('clear', '1');
						if($('#mobile').val() == ''){
							//doAction('search', '1');
							mySheet0.DoSearch(_BT.FRONT.URL.Search.SheetCrmUsr, '&mobile=010-1111-1111'); 
						}else{
							mySheet0.DoSearch(_BT.FRONT.URL.Search.SheetCrmUsr, $('#sheetFrm').serialize()); 
						}
					}
					break;     
				case 'insert':       //입력
					if(tar == 1){
						if( $('#mobile').val() == ''){
							alert('저장할 내역이 없습니다.');
							return false;
						}else{
							_BT.openPopup( _BT.FRONT.URL.Common.PopCrm+'?mobile='+$('#mobile').val(),'PopCrm'+$('#mobile').val(), '400', '450', true, true);
							if(uCnt == 0){
					       		doAction('save', '0');
							}
						}
					}else{
						var sheet = eval('mySheet' + tar);
						var Row = sheet.DataInsert(-1);
					}
					break;     
				case 'save':       //저장
					if(tar == 0) {
						var sheet = eval('mySheet' + tar);
						var opt = {UrlEncode:0, Mode:2, Delim:"#"};
						var SaveStr = sheet.GetSaveString(opt); 
						if('' == SaveStr){
							alert('저장할 내역이 없습니다.'); 
							break;
						}else if('KeyFieldError' == SaveStr){ 
							break;
						}
						var rtnData = sheet.GetSaveData(_BT.FRONT.URL.Customer.SetCrmUsr, SaveStr); 
						sheet.LoadSaveData(rtnData);
					}
					break;     
			} 		
		} 		
		
		function mySheet0_OnSearchEnd(Code, Msg, StCode, StMsg ){ 
			uCnt = 0;
			if(Code == '0'){
				if(mySheet0.RowCount() > 0){
					uCnt = 1;
	        		doAction('search', '1');
	        		$('#inNm').text(mySheet0.GetCellValue(1,'USR_NM')); 
	        		if(mySheet0.GetCellValue(1,'USR_LV') == '9'){
		        		$('#inLv').css({"color":"#3f51b5","font-weight":"bold"});
		        		$('#inLv').text('우수 고객님 입니다.'); 
		        		
	        		}else if(mySheet0.GetCellValue(1,'USR_LV') == '8'){
		        		$('#inLv').css({"color":"#b71c1c","font-weight":"bold"});
		        		$('#inLv').text('관심 고객님 입니다.'); 
		        		
	        		}else{
		        		$('#inLv').text(''); 
	        		}
	        		if('' != mySheet0.GetCellValue(1,'USR_ID')){
		        		$('#sOusr').val(mySheet0.GetCellValue(1,'USR_ID'));
		           		doAction('search', '5');
	        		}
				}else{
					var Row = mySheet0.DataInsert(-1);
					mySheet0.SetCellValue(Row, 'PHONE', $('#mobile').val());
					mySheet0.SetRowBackColor(Row, "#ffc600"); 
					
				}
			}
		} 	
		function numSearch(){
       		$('#mobile').val($('#inNum').text()); //CS
       		doAction('search', '0');
		}
		function setMissCall(){
			dupClick1 	= true;
			_BT.ajaxDataSubmit("post", _BT.FRONT.URL.Customer.SetMissCall, {
				mobile : $('#mobile').val()
			}, function(data) {
				dupClick1 = false; 
				if($(data).size() > 0) {
					if(_BT.isEquals(data.code, "success")) {
						notiMsg('MISSCALL@@'+$('#mobile').val()); 
					}
				}
			},
			function(xhr, status, error) {
				dupClick1 = false; 
			});
		}
	</script>
	<div class="main_content06" style="padding-top: 0px; margin-bottom: 20px;">
		<div class="c11_06_01">
			<h1 class="title_con_Type01 margintop_20" style="margin-right:10px; text-align: left;">
				CRM 센터
				<span> 
					<span class="c13_01_03_txt_01">( <span id="loginStatus" name="loginStatus">접속을 클릭해 주세요</span> )</span>
					<span class="c13_01_03_txt_01">고객명&nbsp;:&nbsp;</span><span class="c13_01_03_txt_01" id="inNm" style="display:inline-block;width:60px;"></span>
					<span class="c13_01_03_txt_01">전화번호&nbsp;:&nbsp;</span><span class="c13_01_03_txt_01" id="inNum" onclick="numSearch();" style="display:inline-block;width:100px;"></span>
					<span class="c13_01_03_txt_01" id="inLv" style="display:inline-block;width:200px;"></span>
					<span class="return_select2 vOff" style="float:left;">
						<input id="showLog" name="showLog" value="1" type="checkbox" class="chk"/>
						<label for="showLog" class="signup_txt">로그보기</label>
					</span>
				</span>
			</h1>
			<input id="tmpTel" name="tmpTel" type="hidden" />
			<form id="sheetFrm" name="sheetFrm">
				<input id="sOusr" name="sOusr" type="hidden" />
				<input id="crmId" name="crmId" type="hidden" />
				<input id="year" name="year" type="hidden" />
				<input id="mon" name="mon" type="hidden" />
				<table class="tbl_Type02">
					<caption>조회</caption>
					<colgroup>
						<col width="10%">
						<col width="%">
					</colgroup>
					<tbody>
						<tr>
							<th>
								내역조회
							</th>
							<td style="text-align: left;">
								<span class="inquiry">
									<input type="text" class="input_style05" id="sDt" name="sDt" readonly="readonly"/>
								</span>
								<span class="tbl_txt">
									~
								</span>
								<span class="inquiry">
									<input type="text" class="input_style05" id="eDt" name="eDt" readonly="readonly"/>
								</span>
								<input name="mobile" id="mobile" class="input_style20 marginleft_7 number" type="text" maxlength="13"  style="text-align: right; padding-right:10px;" placeholder="010-XXXX-OOOO">
								<span class="inquiry_btn marginleft_7">
									<label data-type="search" data-value="0" class="click_btn03 sButton" id="main_search_btn" style="width:50px;">조회</label>
									<label data-type="save" data-value="0" class="click_btn06 sButton marginleft_7" id="main_save_btn" style="width:50px;">저장</label>
								</span>
							</td>
						</tr>
					</tbody>
				</table>
			</form>
			<div class="col-sm-5 col-md-5" style="height:80px;width:100%;">
			    <div id="ib-container0"></div>
			</div>
			<div class='col-sm-5 col-md-5' style='width:100%;'>
			    <div id='ib-container1'></div>
			</div>
			<div class='col-sm-5 col-md-5' style='width:100%;'>
			    <div id='ib-container2'></div>
			</div>
		</div>		
	</div>
	<c:set var="strLoginID" value="XXX" />
	<c:set var="strLoginPwd" value="XXX" />
	<c:choose>
		<c:when test="${userSession.usrId eq '80001852'}">
			<c:set var="strLoginID" value="07048660612" />
			<c:set var="strLoginPwd" value="tpfxnf@204" />
		</c:when>
		<c:when test="${userSession.usrId eq '80000001'}">
			<c:set var="strLoginID" value="0517143371" />
			<c:set var="strLoginPwd" value="tpfxnf@123" />
		</c:when>
	</c:choose>
	<!--LG CRM API 영역  -->
	<script>
		POPUP=0;
		var INLINE = 0;
		var strLoginID="${strLoginID}";
		var strLoginPwd="${strLoginPwd}";
		var UserExten;
		function setInfoval(ch1,ch2,iscall,evt,Insp,act){
			tf= document.all.iform; //삭제예정
			ch1=ch1.replace(",1","");
			ch1=ch1.replace(",2","");
			ch2=ch2.replace(",1","");
			ch2=ch2.replace(",2","");
			ch1=(ch1 == "")?"NONE":ch1;
			ch2=(ch2 == "")?"NONE":ch2;
	        if(evt =='RINGEVENT'){ //전화벨이 울릴때
	    		INLINE = 1;
	        	if( $('#Primarychan1').val() == ''){
	        		
	        		$('#Primarychan1').val(ch1);
	        		$('#Primarychan2').val(ch2);
	        		
	        		$('#uidchan11').val(Insp['UNIQUEID']);
	        		$('#uidchan12').val('');
	        		
	        		$('#inexten').val(Insp['INEXTEN']);
	        		$('#callernumber').val(Insp['CALLERID']);
	        		$('#Primarystatus').val('RING');

	        		$('#inNum').text(Insp['CALLERID']); //CS
	        		$('#mobile').val(Insp['CALLERID']); //CS
	        		doAction('search', '0');
	        	}else{
	        		$('#chan1').val(ch1); 
	        		$('#chan2').val(ch2);

	        		$('#uidchan21').val(Insp['UNIQUEID']);
	        		$('#uidchan22').val('');

	        		$('#inexten').val(Insp['INEXTEN']);
	        		$('#callernumber2').val(Insp['CALLERID']);
	        		$('#Secondstatus').val('RING');
	        		
	        		$('#inNum').text(Insp['CALLERID']); //CS
	        		$('#mobile').val(Insp['CALLERID']); //CS
	        		doAction('search', '0');
				}
	        }
	        if(evt =='CHANNELLIST'){ //수화기 들었을때
	        	if(INLINE == 0){
	        		$('#inNum').text(Insp['CALLER1ID']); //CS
	        		$('#mobile').val(Insp['CALLER1ID']); //CS
	        		doAction('search', '0');
	        	}
	        	if( 
	        			$('#chan1').val() == '' 
	        		&& $('#chan2').val() == '' 
	        		&& (
	        				$('#Primarychan1').val() == '' 
	        			|| $('#Primarystatus').val() =='RING'
	        			)
	        		){
    				$('#Primarychan1').val(ch1);
    				$('#Primarychan2').val(ch2);
    				$('#uidchan11').val(Insp['UNIQUEID1']);
    				$('#uidchan12').val(Insp['UNIQUEID2']);
    				$('#Primarystatus').val('LINK');
	        		
				}else{
					preChan1= $('#Primarychan1').val();
					preChan2= $('#Primarychan2').val();
					
					if(
							(preChan1 == ch1 && preChan2 == ch2) 
						|| (preChan1 == ch2 && preChan2 == ch1)
					){
	    				$('#Primarychan1').val(ch1);
	    				$('#Primarychan2').val(ch2);
	    				$('#uidchan11').val(Insp['UNIQUEID1']);
	    				$('#uidchan12').val(Insp['UNIQUEID2']);
	    				$('#Primarystatus').val('LINK');
					}else{
	    				$('#chan1').val(ch1);
	    				$('#chan2').val(ch2);
	    				$('#uidchan21').val(Insp['UNIQUEID1']);
	    				$('#uidchan22').val(Insp['UNIQUEID2']);
	    				$('#Secondstatus').val('LINK');
					}
				}
	        	setTimeout("StartRecord()", 1000);//전화 연결부터 녹취시작
	        }
	        if(evt =="CHANNELOUT"){
	    		INLINE = 0;
				preChan11= $('#Primarychan1').val();
				preChan12= $('#Primarychan2').val();
				preChan21= $('#chan1').val();
				preChan22= $('#chan2').val();
				OK=0;
				uid1=Insp["UNIQUEID"];
				uid2=Insp["SRCUNIQUEID"];
				
				preUidChan11= $('#uidchan11').val();
				preUidChan12= $('#uidchan12').val();
				preUidChan21= $('#uidchan21').val();
				preUidChan22= $('#uidchan22').val();
				
				//alert(uid1 +"/"+uid2+"\n"+preUidChan21+"/"+preUidChan22+"\n"+preUidChan11+"/"+preUidChan12);
				if((preUidChan21 == uid1 &&  preUidChan22 == uid2) || (preUidChan21 == uid2 && preUidChan22 == uid1)){
					tf.chan1.value="";
					tf.chan2.value="";
					tf.uidchan21.value="";
					tf.uidchan22.value="";
					tf.Secondstatus.value="ENDU2";
					OK=1;
				}else if((preUidChan11 == uid1 &&  preUidChan12 == uid2) || (preUidChan11 == uid2 && preUidChan12 == uid1)){
		        		tf.Primarychan1.value="";
		        		tf.Primarychan2.value="";
		        		tf.uidchan11.value="";
		        		tf.uidchan12.value="";
					tf.Primarystatus.value="ENDU1";
					OK=1;
				}else if((preChan21 == ch1 && preChan22 == ch2) || (preChan21 == ch2 && preChan22 == ch1)){
					tf.chan1.value="";
					tf.chan2.value="";
					tf.uidchan21.value="";
					tf.uidchan22.value="";
					tf.Secondstatus.value="ENDP2";
					OK=1;
				}else if((preChan11 == ch1 && preChan12 == ch2 )|| (preChan11 == ch2 && preChan12 == ch1)){
		        		tf.Primarychan1.value="";
		        		tf.Primarychan2.value="";
		        		tf.uidchan11.value="";
		        		tf.uidchan12.value="";
					tf.Primarystatus.value="ENPC1";
					OK=1;
				}else if(preChan21 == ch1 || preChan22 == ch2 || preChan21 == ch2 || preChan22 == ch1){
					tf.chan1.value="";
					tf.chan2.value="";
					tf.uidchan21.value="";
					tf.uidchan22.value="";
					tf.Secondstatus.value="ENDC2";
					OK=1;
				}else if(preChan11 == ch1 || preChan12 == ch2 || preChan11 == ch2 || preChan12 == ch1){
		        		tf.Primarychan1.value="";
		        		tf.Primarychan2.value="";
		        		tf.uidchan11.value="";
		        		tf.uidchan12.value="";
					tf.Primarystatus.value="ENDC1";
					OK=1;
				}
				if(OK == 0){
					if(preUidChan21 == uid1 || preUidChan22 == uid2 || preUidChan21 == uid2 || preUidChan22 == uid1){
						tf.chan1.value="";
						tf.chan2.value="";
						tf.uidchan21.value="";
						tf.uidchan22.value="";
						tf.Secondstatus.value="ENDRU2";
						OK=1;
					}else if(preUidChan11 == uid1 || preUidChan12 == uid2 || preUidChan11 == uid2 || preUidChan12 == uid1){
						tf.Primarychan1.value="";
						tf.Primarychan2.value="";
						tf.uidchan11.value="";
						tf.uidchan12.value="";
						tf.Primarystatus.value="ENDRU1";
						OK=1;
					}
				}
				if(OK == 0){
					var remain1= tf.Primarychan1.value;
					var status1= tf.Primarystatus.value;
					var remain2= tf.chan1.value;
					var status2= tf.Secondstatus.value;
					if((status2 != "RING" || Insp["CHANNEL"].indexOf("/"+UserExten+"-") > 0) && remain2 != ""){
						tf.chan1.value="";
						tf.chan2.value="";
						tf.uidchan21.value="";
						tf.uidchan22.value="";
						tf.Secondstatus.value="ENDCLEAN2";
						OK=1;
					}else if((status1 != "RING" ||Insp["CHANNEL"].indexOf("/"+UserExten+"-") > 0) && remain1 != ""){
						tf.Primarychan1.value="";
						tf.Primarychan2.value="";
						tf.uidchan11.value="";
						tf.uidchan12.value="";
						tf.Primarystatus.value="ENDCLEAN1";
						OK=1;
					}
		
				}
	        }
		}
		function atxfer(){
			document.all.EventClientCtrl.Atxfer($('#transnum option:selected').val());
		}
		function notiMsg(msg){
			document.all.EventClientCtrl.SendPeerMsg('0', '', 'ALLDOMAIN', msg);
		}
		function hangupChannel(){
		        document.all.EventClientCtrl.HangupChannel($('#Primarychan1').val());
		}
		function StartRecord(){
        	document.all.EventClientCtrl.StartRecord();
		}
		function hangupChannel(chan){
		        document.all.EventClientCtrl.HangupChannel(chan);
		}
		function playDtmf(){
		}
		function goconference(act){
			ConferenceAction(document.all.iform.chan1.value,document.all.iform.chan2.value,document.all.iform.inputnum.value,"FHCRMCONF",act);
		}
		function sendcmd(cmd){
			SIPCommand(cmd);
		}
		function sendsms(){
			var type="0";//예약:1
			var typeinfo="0";//예약시 예약시간 년월일 시:분:00
			var peers=document.all.iform.smspeers.value; //구분자','
			var msg=document.all.iform.smsmsg.value;//\n\r없이
		alert(peers+"/"+msg);
			document.all.EventClientCtrl.SendSMS(type,typeinfo,peers,msg);
		}
		function getpeerinfo(peers){
			document.all.EventClientCtrl.GetPeerInfo(peers);
		}
		
		function SendPeerMsg(  strType, strInfo, strPeers,  strMsg) {
			document.all.EventClientCtrl.SendPeerMsg(  strType, strInfo, strPeers,  strMsg);
		}
		function getCallHistory(cat,inout,start,end,search){
			document.all.EventClientCtrl.GetCallHistory(cat,inout,start,end,search);
		}
		function getRecordList(inout,start,end,search){
			// Kimos
			document.all.EventClientCtrl.GetRecordList(inout,start,end,search);
		}
		function GetListConfMember(room){
			document.all.EventClientCtrl.GetListConfMember(room);
		}
		function InviteConference(peers){
			document.all.EventClientCtrl.InviteConference("conf111",peers);
		}
		function RemoveConference(room,channels){
			document.all.EventClientCtrl.RemoveConference(room,channels);
		}
		
		function CallWithConference(peers){
			document.all.EventClientCtrl.CallWithConference("V111",peers);
		}
		function SetForward(use,type,num,start,end,etc){
			document.all.EventClientCtrl.SetForward(use,type,num,start,end,"");
		//document.all.EventClientCtrl.SetForward("0","","","","","");
		}
		
		function MagAddr(type,keyidx,gname,pname,tel1,tel2,tel3,tel4,tel5,def,memo){
		        document.all.EventClientCtrl.MagAddrList(type,keyidx,gname,pname,tel1,tel2,tel3,tel4,tel5,def,memo);
		}
		
		function GetVarinfo(name){
		        document.all.EventClientCtrl.GetVarInfo(name);
		}
		
		function GetQStatus(type,qname,member){
		        document.all.EventClientCtrl.GetQStatus(type,qname,member);
		}
		
		
		function GetStatusPeers(peers,option){
		        document.all.EventClientCtrl.GetStatusPeers(peers,option);
		}
		
		function getrecvsmslist(p){
		        document.all.EventClientCtrl.GetRecvSmsList(p,"");
		}
		window.focus();
		function XXXXXX(cat,inout,start,end,search){
			document.all.EventClientCtrl.GetCallHistory('0','0','2017-11-17 09:00:00','2017-11-20 18:00:00','9');
		}
		
	</script>	 
	<form name=ifrom id=iform style='margin:0;padding:0;'>
		<div class="vOff" id="mngDiv">
			<table border=0 width=100% cellpadding=0 cellspcing=0 id=CtiTable name=CtiTable style="display:none;"></table><br/>
			<span class="c13_01_03_txt_01">Primarychan :</span>
			<input type="text" id="Primarychan1" name="Primarychan1" value=""/>
			<input type="text" id="uidchan11" name="uidchan11" value=""/>
			<input type="text" id="Primarychan2" name="Primarychan2" value=""/>
			<input type="text" id="uidchan12" name="uidchan12" value=""/>
			<input type="text" id="callernumber" name="callernumber" value=""/>
			<input type="text" id="Primarystatus" name="Primarystatus" value=""/><br/>
			
			<span class="c13_01_03_txt_01">Secondchan :</span>
			<input type="text" id="chan1" name="chan1" value=""/>
			<input type="text" id="uidchan21" name="uidchan21" value=""/>
			<input type="text" id="chan2" name="chan2" value=""/>
			<input type="text" id="uidchan22" name="uidchan22" value=""/>
			<input type="text" id="callernumber2" name="callernumber2" value=""/>
			<input type="text" id="Secondstatus" name="Secondstatus" value=""/><br/>
		
			<span class="c13_01_03_txt_01">LOGIN :</span><input type=checkbox name=SetSeed id=SetSeed checked="checked" >
			<span class="c13_01_03_txt_01">ID :</span><input type="text" id="LOGIN_ID" name="LOGIN_ID" value=""/>
			<span class="c13_01_03_txt_01">PASS :</span><input type="password" id="LOGIN_PWD" name="LOGIN_PWD" value=""/>
			<input type=button id=BtnCONN name=BtnCONN onClick="return sConnect();" value="접속"><br/>
		
			<span class="c13_01_03_txt_01">LOGS :</span>
		</div>
		<textarea class="vOff" style="width:100%;height:350px;" name="recvlog" id="recvlog"></textarea>
	</form>
	<script id="OnSendRingEvent" for="EventClientCtrl" event="SendRingEvent(bstrRingEvent)">
			parseMsg(bstrRingEvent);
	</script>
	<script id="OnSendChannelListEvent" for="EventClientCtrl" event="SendChannelListEvent(bstrChannelList)">
			parseMsg(bstrChannelList);
	</script>
	<script id="OnSendChannelOutEvent" for="EventClientCtrl" event="SendChannelOutEvent(bstrChannelOut)">
			parseMsg(bstrChannelOut);
	</script>
	<script id="OnSendLoginResultEvent" for="EventClientCtrl" event="SendLoginResultEvent(bstrLoginResult)">
			parseMsg(bstrLoginResult);
	</script>
	<script id="OnSendCommandResultEvent" for="EventClientCtrl" event="SendCommandResultEvent(bstrCommandResult)">
			CommandResultEvent(bstrCommandResult);
	</script>
	<script id="OnSendNetworkErrorEvent" for="EventClientCtrl" event="SendNetworkErrorEvent()">
	        document.all.EventClientCtrl.DisconnectServer();
			document.all.BtnCONN.value="접속";
			document.all.loginStatus.innerHTML="접속종료";
			ISCON=0;
			document.all.ifrom.recvlog.value+="disconnected......\n";
	</script>
	<script id="OnSendEtcEvent" for="EventClientCtrl" event="SendEtcEvent(strEventName,strEventValue)">
	        EtcEvent(strEventName,strEventValue);
	</script>
	<script id="OnSendSMSEvent" for="EventClientCtrl" event="SendSMSEvent(strEventValue)">
	        EtcEvent("SendSMSEvent",strEventValue);
	</script>
	<script id="OnSendPeerMsgEvent" for="EventClientCtrl" event="SendPeerMsgEvent(strEventValue)">
	        EtcEvent("SendPeerMsgEvent",strEventValue);
	</script>
	<script id="OnSendCmdErrorEvent" for="EventClientCtrl" event="SendCmdErrorEvent(strCmd,strEventValue)">
			if(strCmd!="Connect"){
				alert("CmdError: cmd("+strCmd+")"+strEventValue);
			}
	        EtcEvent("SendDtmfEvent",strEventValue);
	</script>

	<script>
		var OutStr="<object style='display:;' ID=\"EventClientCtrl\" WIDTH=100 HEIGHT=100 CLASSID=\"CLSID:86019F2F-2899-4C4C-A6FE-24CFF7CD6D4C\"  codebase=\"http://www.selltool.kr/upload/LGUBaseOpenApi_1.0.1.21.cab#version=1,0,1,21\"></object>";
		document.writeln(OutStr);
		var ISCON=0;
		var ISCALL=0;
		var STAT=0;
		var READY=0;
		var timerID=null;
		var isExtened=0;
		var PhoneNum="";
		var PhoneCaller="";
		var popuptime=0;
	
		function sConnect(ctype){
			if(!READY ){
				alert("컨터롤이 시작되지 못했습니다.");
				return false;
			}
			if(ISCON){
				document.all.EventClientCtrl.DisconnectServer();
				ISCON=0;
			}else{
				strLoginID = document.all.LOGIN_ID.value;
				strLoginPwd = document.all.LOGIN_PWD.value;
				strLoginIP = "";
				document.all.EventClientCtrl.SetAutoReconnect(20);//default 10
				if(document.all.SetSeed.checked)
					document.all.EventClientCtrl.SetSeedEncryption();
		
				document.all.EventClientCtrl.LoginServer(strLoginID,strLoginPwd,"");
			}
			return false;	
		}
		
		function CheckConnect(){
			if(document.all.EventClientCtrl != null ) 
			{
				var bConnect = document.all.EventClientCtrl.IsConnected();
				alert( "연결상태 : " + bConnect );
			}
		}
		if(document.all.EventClientCtrl.readyState == 4 ){
		 	READY=1;
		}
		function EtcEvent(strEventName,strEventValue){
			document.all.ifrom.recvlog.value+=strEventValue+"\n";
		    var msgs = strEventValue.split("|");
		    var Insp = new Object();
		    Insp["EVENT"] = msgs[0];
			for(i=1;i<msgs.length;i++){
				keyval=msgs[i].split(":");
				Insp[keyval[0]]=keyval[1];	
			}	
			if(Insp["EVENT"] == "RECVPEERMSG"){
				$('#crmlog').val(	   '-----------------------\n'
										+ Insp["MSG"].replace(/@@/gi,'\n\n') + '\n'
										+ '-----------------------\n\n'
										+ $('#crmlog').val()
									);
			}
	        if(Insp["EVENT"] == "CMDRESULTEND"){
	        }
	        if(Insp["EVENT"] == "CONFERENCEEVENT"){
		    	for(i=1;i<msgs.length;i++){
					keyval=msgs[i].split(":");
					Insp[keyval[0]]=keyval[1];	
		    	}
		    }	
			if(Insp["CMD"] == "CONFMEMBERDEL"){
				alert(Insp["CHANNEL"]);
		 		setInfoval(Insp["CHANNEL"],"",0,"CHANNELOUT",Insp,"");
			}
		}
		function parseMsg(msg){
			//document.all.ifrom.recvlog.value+=msg+"\n"+document.all.ifrom.recvlog.value;
			document.all.ifrom.recvlog.value+=msg+"\n\n";
		
		 
			var msgs=msg.split("|");
			var Insp=new Object();
			Insp["EVENT"]=msgs[0];
			var disp="";
			for(i=1;i<msgs.length;i++){
				keyval=msgs[i].split(":");
				Insp[keyval[0]]=keyval[1];	
			}	
			
			var caller=Insp["CALLERID"];
			var caller1=Insp["CALLER1ID"];
			var caller2=Insp["CALLER2ID"];
			var channel1=Insp["CHANNEL1"];
			var channel2=Insp["CHANNEL2"];
			var msg=Insp["MSG"];
			var status=Insp["STATUS"];
		
			if(Insp["EVENT"] == "CMDRESULT"){
				
			}else if(Insp["EVENT"] == "RINGEVENT"){
				setInfoval(Insp["CHANNEL"],Insp["RECHANNEL"],Insp["ISDIAL"],Insp["EVENT"],Insp,1);
				
			}else if(Insp["EVENT"] == "CHANNELLIST"){
				setInfoval(Insp["CHANNEL1"],Insp["CHANNEL2"],ISCALL,Insp["EVENT"],Insp,2);

			}else if(Insp["EVENT"] == "CHANNELOUT"){
				if(Insp['HCAUSE'] == '16'){
					setMissCall();
					//document.all.EventClientCtrl.GetCallHistory('0','0','2017-11-17 09:00:00','2017-11-20 18:00:00','9');
				}
				setInfoval(Insp["CHANNEL"],Insp["RECHANNEL"],"",Insp["EVENT"],Insp,0);
			}else if(Insp["EVENT"] == "LOGINRESULT"){
                if(status == "1"){
					document.all.BtnCONN.value="종료";
					linfos=msg.split(",");
					PhoneNum=linfos[0];
					UserExten=Insp["EXTEN"];
					PhoneCaller=linfos[1];
					ISCON=1;
					document.all.loginStatus.innerHTML="로그인 : " + PhoneCaller;//+"/"+PhoneNum
                }else{
                    document.all.EventClientCtrl.DisconnectServer();
					document.all.loginStatus.innerHTML="로그인실패";
                    alert("LOGIN 실패:"+msg);
				}
	
			}
			return false;
		}
		function clearInfo(){
			document.all.dispinfo.innerHTML="";	
		}
		function OnPageLoad(){
			if(document.all.EventClientCtrl != null ){
				document.all.LOGIN_ID.value=strLoginID;
				document.all.LOGIN_PWD.value=strLoginPwd; 
				sConnect();
			}else{
				alert("ActiveX Control Error");
			}
		}
		function SIPCommand(strCommand){
			if(strCommand != "" && strCommand != "undefined" && READY == 1 && document.all.EventClientCtrl != null ){
				document.all.EventClientCtrl.SendSIPCommand("CMD|"+strCommand);
			}
			return false;
		}
		function CommandResultEvent(bstrCommandResult){
			document.all.ifrom.recvlog.value+=bstrCommandResult+"\n";
		}
		window.onload=OnPageLoad;
	</script>	
	

	