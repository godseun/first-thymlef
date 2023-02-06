<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/layout/include/base.jsp" %>
	<div class="main_content06" style="padding-top: 0px; min-height: 800px; margin-bottom: 20px;">
		<form id="popFrm" name="popFrm">
			<input id="t_code" name="t_code" type="hidden" />
			<input id="t_name" name="t_name" type="hidden" />
			<input id="t_invoice" name="t_invoice" type="hidden" />
			<input id="t_item" name="t_item" type="hidden" />
			<input id="t_idex" name="t_idex" type="hidden" />
		</form>
		<table class="dashBoard_tbl" >
			<caption>정보입력</caption>
			<colgroup>
				<col width="25%">
				<col width="25%">
				<col width="25%">
				<col width="25%">
			</colgroup>
			<tbody>
				<tr>
					<th class="on">
						<h1>
							판매취소
						</h1>
						<h2>
							<label class="dbCnt" data-type="OR_71"><c:out value="${dashBoard.OR_71}"/>  건</label> 
							<span class="dbCnt" data-type="OR_7">확정 <label> <c:out value="${dashBoard.OR_7}"/> </label>건</span>
						</h2>
					</th>
					<th class="on">
						<h1>
							반품요청
						</h1>
						<h2>
							<label class="dbCnt" data-type="OR_51"><c:out value="${dashBoard.OR_51}"/>  건</label> 
						</h2>
					</th>
					<th class="on">
						<h1>
							반품승인
						</h1>
						<h2>
							<label class="dbCnt" data-type="OR_52">배송 미등록<c:out value="${dashBoard.OR_52}"/>  건</label> 
							<span class="dbCnt" data-type="OR_C_52">배송완료<label> <c:out value="${dashBoard.OR_C_52}"/> </label>건</span>
						</h2>
					</th>
					<th class="on">
						<h1>
							에스크로 구매거절
						</h1>
						<h2>
							<label class="dbCnt" data-type="E_C_5">요청<c:out value="${dashBoard.E_C_5}"/>  건</label> 
						</h2>
					</th>
				</tr>
			</tbody>
		</table>	
		<div class="signup_agree marginbottom_20">
			<p class="alarm_txt">※ 집계 조건 : 최근 1주일(7일) 동안 / 주문 상품(전체)</p>
		</div>
		<form id="frm" name="frm">
			<input type="hidden" id="SaveStr" name="SaveStr"/>	
			<input type="hidden" id="jobTp" name="jobTp" value="returnMng"/>	
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
									주문일
								</span>
								<span class="inquiry">
									<input type="text" class="input_style05" id="sDt" name="sDt" readonly="readonly"/>
								</span>
								<span class="tbl_txt">
									~
								</span>
								<span class="inquiry">
									<input type="text" class="input_style05" id="eDt" name="eDt" readonly="readonly"/>
								</span>
								<span class="c13_01_03_txt_01">
									조회상태
								</span>
								<span class="return_select4">
									<select class="" id="sSus" name="sSus">
										<option value="">전체 주문건</option>
										<option value="50" selected="selected">전체 관리건</option>
										<option value="51">반품요청</option>
										<option value="52">반품송장 미등록</option>
										<option value="53">반품확정대상</option>
										<option value="5">반품완료</option>
									</select>
								</span>		
								<input type="text" class="input_style20 marginleft_5" id="ordrId" name="ordrId" placeholder="주문번호"/>
								<input class="input_style20 marginleft_5" style="width:200px;" type="text" id="mValue" name="mValue" placeholder="통합검색"/>							
								<span class="inquiry_btn marginleft_7">
									<span onclick="doAction('clear');"  class="sButton btn_span fs-13 pink marginleft_5" style="float: right;">초기화</span>
									<span onclick="doAction('search');" class="sButton btn_span fs-13 blue" style="float: right;">조회</span>
								</span>
							</td>
						</tr>
					</tbody>
				</table>	
			</div>
		</form>		
		<div class="col-sm-5 col-md-5 margintop_5" style="height:410px;width:100%;">
		    <div id="ib-container1"></div>
		</div>
		<form id="rtnFrm" name="rtnFrm">
			<input id="sPaym" name="sPaym" type="hidden" />
			<h1 class="title_con_Type01 margintop_20" style="margin-bottom:10px;margin-right:10px; text-align: left;">
				선택상품 
				<span style="margin-left:10px;"><input id='ck_p' name='ck_p' class='num' style="width:60px;color:#b71c1c;text-align:right;border:0;font-size:16px;" readonly="readonly"> 원</span> 
	
				<label class="icon"><img src="${staticRoot}/img/icon_plus.jpg" alt="플러스" /></label>
				<span style="">환불배송비</span>
				<span style="margin-left:10px;"><input id='ck_d' name='ck_d' class='num' style="width:60px;color:#b71c1c;text-align:right;border:0;font-size:16px;"> 원</span> 
	
				
				<label class="icon"><img src="${staticRoot}/img/icon_minus.jpg" alt="마이너스" /></label>
				<span style="">추가배송비</span>
				<span style="margin-left:10px;"><input id='mi_d' name='mi_d' class='num' style="width:60px;color:#b71c1c;text-align:right;border:0;font-size:16px;"> 원</span>  
				
				<label class="icon"><img src="${staticRoot}/img/icon_equals.jpg" alt="합계" /></label>
				<span style="">최종환불</span>
				<span style="margin-left:10px;"><input id='ck_s' name='ck_s' class='num' style="width:60px;color:#b71c1c;text-align:right;border:0;font-size:16px;" readonly="readonly"> 원</span> 
				<span> 
					<span onclick="doAction('save5');"  class="sButton btn_span fs-13 pink marginleft_5" style="float: right;">반품확정</span>
					<span onclick="doAction('save4');"  class="sButton btn_span fs-13 green marginleft_5" style="float: right;">등록취소</span>
					<span onclick="doAction('save51');"  class="sButton btn_span fs-13 blue" style="float: right;">반품등록</span>
			 	</span>
			</h1>
			<div id="bank_area" class="vOff">
				<h1 class="title_con_Type01" style="margin-right:10px; text-align: left;">
					환불 정보 입력
					<select class="" id="refundbankcode" name="refundbankcode" style="height:31px;margin-left:10px;">
						<option value="">은행 선택</option>
						<option value="02">한국산업은행</option>
						<option value="03">기업은행</option>
						<option value="04">국민은행</option>
						<option value="05">하나은행 (구 외환)</option>
						<option value="06">국민은행 (구 주택)</option>
						<option value="07">수협중앙회</option>
						<option value="11">농협중앙회</option>
						<option value="12">단위농협</option>
						<option value="16">축협중앙회</option>
						<option value="20">우리은행</option>
						<option value="21">구)조흥은행</option>
						<option value="22">상업은행</option>
						<option value="23">SC 제일은행</option>
						<option value="24">한일은행</option>
						<option value="25">서울은행</option>
						<option value="26">구)신한은행</option>
						<option value="27">한국씨티은행 (구 한미)</option>
						<option value="31">대구은행</option>
						<option value="32">부산은행</option>
						<option value="34">광주은행</option>
						<option value="35">제주은행</option>
						<option value="37">전북은행</option>
						<option value="38">강원은행</option>
						<option value="39">경남은행</option>
						<option value="41">비씨카드</option>
						<option value="45">새마을금고</option>
						<option value="48">신용협동조합중앙회</option>
						<option value="50">상호저축은행</option>
						<option value="53">한국씨티은행</option>
						<option value="54">홍콩상하이은행</option>
						<option value="55">도이치은행</option>
						<option value="56">ABN 암로</option>
						<option value="57">JP 모건</option>
						<option value="59">미쓰비시도쿄은행</option>
						<option value="60">BOA(Bank of America)</option>
						<option value="64">산림조합</option>
						<option value="70">신안상호저축은행</option>
						<option value="71">우체국</option>
						<option value="81">하나은행</option>
						<option value="83">평화은행</option>
						<option value="87">신세계</option>
						<option value="88">신한(통합)은행</option>
						<option value="D1">유안타증권(구 동양증권)</option>
						<option value="D2">현대증권</option>
						<option value="D3">미래에셋증권</option>
						<option value="D4">한국투자증권</option>
						<option value="D5">우리투자증권</option>
						<option value="D6">하이투자증권</option>
						<option value="D7">HMC 투자증권</option>
						<option value="D8">SK 증권</option>
						<option value="D9">대신증권</option>
						<option value="DA">하나대투증권</option>
						<option value="DB">굿모닝신한증권</option>
						<option value="DC">동부증권</option>
						<option value="DD">유진투자증권</option>
						<option value="DE">메리츠증권</option>
						<option value="DF">신영증권</option>
						<option value="DG">대우증권</option>
						<option value="DH">삼성증권</option>
						<option value="DI">교보증권</option>
						<option value="DJ">키움증권</option>
						<option value="DK">이트레이드</option>
						<option value="DL">솔로몬증권</option>
						<option value="DM">한화증권</option>
						<option value="DN">NH 증권</option>
						<option value="DO">부국증권</option>
						<option value="DP">LIG 증권</option>
					</select>
					<input type="text" class="input_style03 marginleft_10" id ="refundacctname" name="refundacctname" placeholder="예금주">
					<input type="text" class="input_style02 marginleft_10" id ="refundacctnum" name="refundacctnum" placeholder="계좌번호">
					<span style="">※ 반품확정시 기입</span>
				</h1>
			</div>
		</form>				
		<div class="col-sm-5 col-md-5" style="height:310px;width:100%;">
		    <div id="ib-container2"></div>
		</div>
	</div>

	<script type="text/javascript">
		var dupClick1 = false;
		var dev = 1;
		$(function(){
			_BT.Reg.Number('num');
			_BT.makeCalendar('sDt', 'yy-mm-dd'); 
			_BT.makeCalendar('eDt', 'yy-mm-dd'); 
			$('#ck_d, #mi_d').on('change', function() {
				var sum = 0;
				var ck_p = eval($('#ck_p').val());
				var ck_d = eval($('#ck_d').val());
				var mi_d = eval($('#mi_d').val());
				if(ck_d == null) ck_d = 0 
				if(mi_d == null) mi_d = 0 
				sum = ck_p + ck_d - mi_d;				
				$('#ck_s').val(sum);
	    	});
			initSheet();
			initDate();
			doAction('search');
		});
		function initDate(){
			$('#sDt').val(_BT.dateAdd($.datepicker.formatDate($.datepicker.ATOM, new Date()),-7,'d'));	
			$('#eDt').val($.datepicker.formatDate($.datepicker.ATOM, new Date()));
		}
		function initSheet(){
			var initData = {};
			initData.Cfg = {
						        'AutoFitColWidth': 'search|resize|init|colhidden|rowtransaction'
						        ,'UseHeaderSortCancel' : 1
								,'MergeSheet': 9
				                ,'DeferredVScroll': 1
				                ,'Page' : 300
				                ,'AutoSumCalcMode':1
				                ,'SelectionSummary': 'EmptyCell'
								};
			initData.HeaderMode = {
			};
			initData.Cols = [
				{'Header': '번호',		'Type': 'Seq', 			'MinWidth': 50,		'SaveName': 'sSeq',				'Align': 'Center',	'Edit':0,	'Save': 0	, 	'ColMerge':0	}
				,{'Header': '주문일',	'Type': 'Date',			'MinWidth': 80,		'SaveName': 'sMordrDt',	 		'Align': 'Center',	'Edit':0,	'Save': 0	,	'Format':'YmdHm'}
				,{'Header': '접수일',	'Type': 'Date',			'MinWidth': 85,		'SaveName': 'sMreceiptDt',	 	'Align': 'Center',	'Edit':0,	'Save': 0	,	'Format':'YmdHm'}
				,{'Header': '배송일',	'Type': 'Date',			'MinWidth': 85,		'SaveName': 'sMdelyDt',	 		'Align': 'Center',	'Edit':0,	'Save': 0	,	'Format':'YmdHm'}
				,{'Header': '주문자',	'Type': 'Text',			'MinWidth': 50,		'SaveName': 'sMordrUsr',		'Align': 'Center',	'Edit':0,	'Save': 0	, 	'ColMerge':1	}
				,{'Header': '주문자',	'Type': 'Text',			'MinWidth': 100,	'SaveName': 'sMusrPhone',		'Align': 'Center',	'Edit':0,	'Save': 0	, 	'ColMerge':1	}
				,{'Header': '주문번호',	'Type': 'Popup',		'MinWidth': 150,	'SaveName': 'sMordrId',			'Align': 'Center',	'Edit':1,	'Save': 0	, 	'ColMerge':1	}
				,{'Header': '품목수',	'Type': 'AutoSum',		'MinWidth': 50,		'SaveName': 'sMcntPrdt',		'Align': 'Right',		'Edit':0,	'Save': 0,	'Format':'Integer'	}
				,{'Header': '주문금액',	'Type': 'Int',				'MinWidth': 50,		'SaveName': 'sMprice', 			'Align': 'Right',		'Edit':0,	'Save': 0,	'Format':'Integer'	}
				,{'Header': '배송비',	'Type': 'Int',				'MinWidth': 50,		'SaveName': 'sMdvFee', 		'Align': 'Right',		'Edit':0,	'Save': 0,	'Format':'Integer'	}
				,{'Header': '총금액',	'Type': 'AutoSum',		'MinWidth': 50,		'SaveName': 'sMsPrice',	 		'Align': 'Right',		'Edit':0,	'Save': 0,	'Format':'Integer'	}
				,{'Header': '결제구분',	'Type': 'Combo',		'MinWidth': 50,		'SaveName': 'sPaym',	 			'Align': 'Center',	'Edit':0,	'Save': 0,	'ComboText': '카드|카드|가상계좌|계좌이체',		'ComboCode': 'Card|VCard|VBank|DirectBank'	, 	'ColMerge':0	}
				,{'Header': '배송지구분','Type': 'Combo',		'MinWidth': 50,		'SaveName': 'sZoneTp',	 		'Align': 'Center',	'Edit':0,	'Save': 0,	'ComboText': '일반지역|도서산간|제주지역',		'ComboCode': '0|1|2'	, 	'ColMerge':0	}
				,{'Header': 'INI결제번호',	'Type': 'Text',		'MinWidth': 150,	'SaveName': 'sOid',				'Align': 'Left',		'Edit':0,	'Save': 0	, 	'ColMerge':1,	'Hidden':dev	}  
				,{'Header': 'INI승인번호(TID)',	'Type': 'Text',			'MinWidth': 150,	'SaveName': 'sTid',				'Align': 'Left',		'Edit':0,	'Save': 0	, 	'ColMerge':1	}
				,{'Header': '비고내역', 	'Type': 'Int', 			'MinWidth': 0, 		'SaveName': 'sChk', 			'Align': 'Center', 	'Edit':0,	'Save': 0,	'Hidden':dev	}  
			];	
			// IBSheet 생성
			createIBSheet2($('#ib-container1')[0], 'mySheet1', '100%', '400px');
			// IBSheet 초기화
			IBS_InitSheet(mySheet1, initData);	

			
			initData.Cols = [
				{'Header': '번호',		'Type': 'Seq', 			'MinWidth': 50,		'SaveName': 'sSeq',			'Align': 'Center',	'Edit':0,	'Save': 0	, 	'ColMerge':0	}
				,{'Header': '구분',		'Type': 'Status',		'MinWidth': 50,		'SaveName': 'sStatus', 		'Align': 'Center',	'Edit':0,	'Save': 0,	'Hidden':dev, 	'ColMerge':0,	'Hidden':dev	}  
				,{'Header': '주문일',	'Type': 'Date',			'MinWidth': 80,		'SaveName': 'sMordrDt',	 	'Align': 'Center',	'Edit':0,	'Save': 0	,	'Format':'YmdHm',	'Hidden':dev	}  
				,{'Header': '주문자',	'Type': 'Text',			'MinWidth': 70,		'SaveName': 'sMordrUsr',	'Align': 'Center',	'Edit':0,	'Save': 0	, 	'ColMerge':1,	'Hidden':dev	}  
				,{'Header': '주문번호',	'Type': 'Text',			'MinWidth': 150,	'SaveName': 'sMordrId',		'Align': 'Center',	'Edit':0,	'Save': 1	, 	'ColMerge':1,	'Hidden':dev	}  
				,{'Header': '주문금액',	'Type': 'Int',				'MinWidth': 50,		'SaveName': 'sMprice', 		'Align': 'Right',		'Edit':0,	'Save': 0,	'Format':'Integer'	}
				,{'Header': '배송비',	'Type': 'Int',				'MinWidth': 50,		'SaveName': 'sMdvFee', 	'Align': 'Right',		'Edit':0,	'Save': 0,	'Format':'Integer'	}
				,{'Header': '총금액',	'Type': 'Int',				'MinWidth': 50,		'SaveName': 'sMsPrice',	 	'Align': 'Right',		'Edit':0,	'Save': 0,	'Format':'Integer'	}
			
				,{'Header': '품목수',	'Type': 'Int',				'MinWidth': 50,		'SaveName': 'sMcntPrdt',	'Align': 'Right',		'Edit':0,	'Save': 0,	'Format':'Integer'	}
				,{'Header': '선택',		'Type': 'CheckBox', 	'MinWidth': 50, 	'SaveName': 'sCheckBox',	'Align': 'Center',	'Edit':1, 	'Save': 1	, 	'ColMerge':0	}
				,{'Header': '상태', 		'Type': 'Combo', 		'MinWidth': 80,		'SaveName': 'sDsttus', 		'Align': 'Center', 	'Edit':0,	'Save': 1,	'ComboText': '${sttus.cbText}', 'ComboCode': '${sttus.cbCode}', 	'ColMerge':0	}
				
				,{'Header': '사유',		'Type': 'Text',			'MinWidth': 150,	'SaveName': 'sCrmk',		 	'Align': 'Left',		'Edit':1,	'Save': 1	, 	'ColMerge':0, 	'KeyField':1	}
				,{'Header': '반송구분',	'Type': 'Combo', 		'MinWidth': 70,		'SaveName': 'sCdevyTp',	'Align': 'Center', 	'Edit':0,	'Save': 1,	'ComboText': '|반송택배 요청|직접반송 예정', 'ComboCode': '|1|2', 	'ColMerge':0	}
				
				,{'Header': '품목코드',	'Type': 'Text',			'MinWidth': 80,		'SaveName': 'sDprdtCd', 	'Align': 'Center',	'Edit':0,	'Save': 0, 	'ColMerge':0	}
				,{'Header': '품명',		'Type': 'Text',			'MinWidth': 150,	'SaveName': 'sDprdtNm', 	'Align': 'Left',		'Edit':0,	'Save': 0	, 	'ColMerge':0	}
				,{'Header': '규격',		'Type': 'Text',			'MinWidth': 150,	'SaveName': 'sDstndrd', 	'Align': 'Left',		'Edit':0,	'Save': 0	, 	'ColMerge':0	}
				,{'Header': '제조사',	'Type': 'Text',			'MinWidth': 50,		'SaveName': 'sDmakrNm', 	'Align': 'Center',	'Edit':0,	'Save': 0, 	'ColMerge':0	}
				,{'Header': '판매가',	'Type': 'Int',				'MinWidth': 50,		'SaveName': 'sDtotPrice', 	'Align': 'Right',		'Edit':0,	'Save': 0,	'Format':'Integer', 	'ColMerge':0	}
				,{'Header': '수량',		'Type': 'Int',				'MinWidth': 50,		'SaveName': 'sDqy',		 	'Align': 'Right',		'Edit':0,	'Save': 1,	'Format':'Integer', 	'ColMerge':0,	'Hidden':dev	}  
				,{'Header': '수량',		'Type': 'Int',				'MinWidth': 50,		'SaveName': 'nQy',		 	'Align': 'Right',		'Edit':1,	'Save': 1,	'Format':'Integer', 	'ColMerge':0, 	'KeyField':1	}
				,{'Header': '합계',		'Type': 'Int',				'MinWidth': 50,		'SaveName': 'sDsumPrice', 	'Align': 'Right',		'Edit':0,	'Save': 0,	'Format':'Integer', 	'ColMerge':0	}
				
				,{'Header': '접수일',	'Type': 'Date',			'MinWidth': 80,		'SaveName': 'sDreceiptDt',	'Align': 'Center',	'Edit':0,	'Save': 0,	'Format':'YmdHm'}
				,{'Header': '배송등록일','Type': 'Date',			'MinWidth': 80,		'SaveName': 'sDdelyDt', 	'Align': 'Center',	'Edit':0,	'Save': 0	,	'Format':'YmdHm'}
				,{'Header': '배송완료일','Type': 'Date',			'MinWidth': 80,		'SaveName': 'sDdelyCmpDt','Align': 'Center',	'Edit':0,	'Save': 0	,	'Format':'YmdHm'}
				,{'Header': '구매확정일','Type': 'Date',			'MinWidth': 80,		'SaveName': 'sOrdrCmpDt',	'Align': 'Center',	'Edit':0,	'Save': 0	,	'Format':'YmdHm'}

				,{'Header': '택배사', 	'Type': 'Combo',		'MinWidth': 80, 	'SaveName': 'sDdlvyCmp', 	'Align': 'Center',	'Edit':0,	'Save': 0, 	'ColMerge':0, 	'ComboText': '택배사 선택|${delyCb.cbText}', 'ComboCode': '|${delyCb.cbCode}' }  
				,{'Header': '송장번호', 	'Type': 'Int',				'MinWidth': 100, 	'SaveName': 'sDinvoice', 	'Align': 'Left',		'Edit':0,	'Save': 0, 	'ColMerge':0,	'Format' : '##############' 	}
				,{'Header': '확인',		'Type': 'Popup',		'Width': 42, 		'SaveName': 'sDinvPop', 	'Align': 'Center',	'Edit':1,	'Save': 1, 	'ColMerge':0	}
				
				,{'Header': '배송지명',	'Type': 'Text',			'MinWidth': 50,		'SaveName': 'sMaddrNm', 	'Align': 'Center',	'Edit':0,	'Save': 0		}
				,{'Header': '받는사람',	'Type': 'Text',			'MinWidth': 50,		'SaveName': 'sMrecvNm', 	'Align': 'Center',	'Edit':0,	'Save': 0		}
				,{'Header': '우편번호',	'Type': 'Text',			'MinWidth': 60,		'SaveName': 'sMZipCode', 	'Align': 'Center',	'Edit':0,	'Save': 0		}
				,{'Header': '주소',		'Type': 'Text',			'MinWidth': 150,	'SaveName': 'sMaddr', 		'Align': 'Left',		'Edit':0,	'Save': 0		}
				,{'Header': '상세주소',	'Type': 'Text',			'MinWidth': 100,	'SaveName': 'sMaddrDtl', 	'Align': 'Left',		'Edit':0,	'Save': 0		}
				,{'Header': '전화번호',	'Type': 'Text',			'MinWidth': 80,		'SaveName': 'sMtel', 			'Align': 'Center',	'Edit':0,	'Save': 0		}
				,{'Header': '배송요구사항',	'Type': 'Text',		'MinWidth': 100,	'SaveName': 'sMrmk', 		'Align': 'Left',		'Edit':0,	'Save': 0		}

				,{'Header': '은행코드', 	'Type': 'Text', 			'MinWidth': 0, 		'SaveName': 'sCbankCd',	'Align': 'Left',	 	'Edit':0,	'Save': 0,	'Hidden':dev	}  
				,{'Header': '계좌명', 	'Type': 'Text', 			'MinWidth': 0, 		'SaveName': 'sCacctName',	'Align': 'Left', 		'Edit':0,	'Save': 0,	'Hidden':dev	}  
				,{'Header': '계좌번호', 	'Type': 'Text', 			'MinWidth': 0, 		'SaveName': 'sCacctNum',	'Align': 'Left', 		'Edit':0,	'Save': 0,	'Hidden':dev	}  

				,{'Header': '결제구분', 	'Type': 'Text', 			'MinWidth': 0, 		'SaveName': 'sPaym',			'Align': 'Center', 	'Edit':0,	'Save': 0,	'Hidden':dev	}  
				,{'Header': '일련번호', 	'Type': 'Text', 			'MinWidth': 0, 		'SaveName': 'sDoId', 			'Align': 'Center', 	'Edit':0,	'Save': 1, 	'Hidden':dev	}  
				
			];		
			
			// IBSheet 생성
			createIBSheet2($('#ib-container2')[0], 'mySheet2', '100%', '300px');
			// IBSheet 초기화
			IBS_InitSheet(mySheet2, initData);	
			//mySheet1.ShowGroupRow('', '{%s} <font color="gray">({%c}건)</font>');
	
			// 편집 가능 여부 설정
			mySheet1.SetEditable(1);
			mySheet2.SetEditable(1);

			//건수 정보 표시
			mySheet1.SetCountPosition(4);
			mySheet2.SetCountPosition(4);
			
			//마우스오버
			mySheet1.SetMouseHoverMode(2) 
			mySheet2.SetMouseHoverMode(2) 
			
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
					mySheet2.RemoveAll(); 
					break;
					
				case 'search': 
					mySheet1.RemoveAll(); 
					mySheet2.RemoveAll(); 
					$('#ck_p').val('0'); 
					$('#ck_d').val('0'); 
					$('#mi_d').val('0'); 
					$('#ck_s').val('0'); 
					$('#refundbankcode').val('');  
					$('#refundacctname').val('');  
					$('#refundacctnum').val('');  
					mySheet1.DoSearch(_BT.FRONT.URL.Search.SheetOrderList, $('#frm').serialize()); 
					break; 
					
				case 'save51':          
					var sRow = mySheet2.FindCheckedRow('sCheckBox').split('|');
					if(sRow == ''){alert('반품요청 등록하실 주문건을 선택해 주세요.');return false;}

					var opt = {UrlEncode:0, Mode:2, Delim:'#'};
					var SaveStr = mySheet2.GetSaveString(opt); 
					if(!confirm('반품요청 등록 하시겠습니까?')) return false;

					if('' == SaveStr){
						alert('반품요청 등록하실 주문건을 선택해 주세요.'); 
						return false;
					}else if('KeyFieldError' == SaveStr){ 
						return false;
					}else{
						var rtnData = mySheet2.GetSaveData(_BT.FRONT.URL.Order.SetRtnReq, SaveStr); 
						mySheet2.LoadSaveData(rtnData);
					}
					break; 
					
				case 'save4':          
					var sRow = mySheet2.FindCheckedRow('sCheckBox').split('|');
					if(sRow == ''){alert('반품등록 취소하실 주문건을 선택해 주세요.');return false;}

					var opt = {UrlEncode:0, Mode:2, Delim:'#'};
					var SaveStr = mySheet2.GetSaveString(opt); 
					if(!confirm('반품신청 상태만 취소 가능 합니다.\n\n반품등록 취소 하시겠습니까?')) return false;

					if('' == SaveStr){
						alert('반품등록 취소하실 주문건을 선택해 주세요.'); 
						return false;
					}else if('KeyFieldError' == SaveStr){ 
						return false;
					}else{
						var rtnData = mySheet2.GetSaveData(_BT.FRONT.URL.Order.SetRtnCan, SaveStr); 
						mySheet2.LoadSaveData(rtnData);
					}
					break; 

				case 'save5':
					var alerted = false;
					var sRow = mySheet2.FindCheckedRow('sCheckBox').split('|');
					if(sRow == ''){alert('반품확정 하실 주문건을 선택해 주세요.');return false;}

					var opt = {UrlEncode:0, Mode:2, Delim:'#'};
					var SaveStr = mySheet2.GetSaveString(opt); 
					
					for(var i=0; i < sRow.length; i++){
						if(
								 mySheet2.GetCellValue(sRow[i], 'sDsttus') != '51'
							&&  mySheet2.GetCellValue(sRow[i], 'sDsttus') != '52'
							&&  mySheet2.GetCellValue(sRow[i], 'sDsttus') != '53'					
						){				
							mySheet2.SetCellValue(sRow[i], 'sCheckBox', 0);
							alerted = true;
						}
					}			
					if(alerted){alert('반품신청이 등록된 상품만 확정가능합니다.');return false;}
					if('VBank' == $('#sPaym').val()){
						if(_BT.isEmptyById("refundbankcode",    	"환불 은행을 선택해 주세요.")) return false;
						if(_BT.isEmptyById("refundacctname",    	"예금주를 입력해 주세요.")) return false;
						if(_BT.isEmptyById("refundacctnum",    	"계좌번호를 입력해 주세요.")) return false;
					}
					if(!confirm('반품신청 상태만 확정 가능 합니다.\n\n반품확정 하시겠습니까?')) return false;
					if('' == SaveStr){
						alert('반품확정 하실 주문건을 선택해 주세요.'); 
						return false;
					}else if('KeyFieldError' == SaveStr){ 
						return false;
					}else{
						var rtnData = mySheet2.GetSaveData(_BT.FRONT.URL.Order.SetRtnRfd, SaveStr+ "&"+$('#rtnFrm').serialize()); 
						mySheet2.LoadSaveData(rtnData);
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
		function mySheet2_OnSaveEnd(code, msg) { 
			alert(msg);  
		} 
		function mySheet1_OnPopupClick(Row, Col){
			var sSaveName = mySheet1.ColSaveName(0, Col); 
			var ordrId = mySheet1.GetCellValue(Row,'sMordrId');
			if(sSaveName == 'sMordrId'){
				_BT.openPopup( _BT.FRONT.URL.Order.PopRmk+'?ordrId='+ordrId ,'PopRmk', '610', '500', true, true);
			}
		}
		function mySheet1_OnDblClick(Row, Col, Value, CellX, CellY, CellW, CellH) { 
			if (Row == 0) return; //헤더행일때는 폼에 반영 안함.
			$('#ck_p, #ck_d, #mi_d, #ck_s').val(0);
			var sPaym = mySheet1.GetCellValue(Row,'sPaym');
			$('#sPaym').val(sPaym);
			if(sPaym == 'VBank'){
				$('#bank_area').removeClass('vOff');
			}else{
				$('#bank_area').addClass('vOff');
			}
			var ordrId = mySheet1.GetCellValue(Row,'sMordrId');
			$('#ordrId').val(ordrId);
			mySheet2.DoSearch(_BT.FRONT.URL.Search.SheetRtnOrderDtl, $('#frm').serialize()); 
		}		
		function mySheet2_OnPopupClick(Row,Col){
			var invoice = mySheet2.GetCellValue(Row,'sDinvoice');
			if(invoice != ''){
				$('#t_code').val(mySheet2.GetCellValue(Row,'sDdlvyCmp'));
				$('#t_name').val(mySheet2.GetCellText(Row,'sDdlvyCmp'));
				$('#t_invoice').val(invoice);
				$('#t_item').val(mySheet2.GetCellValue(Row,'sDprdtNm'));
				$('#t_idex').val(mySheet2.GetCellValue(Row,'sMordrId'));
				_BT.openPopup( '','fnMngAddr', '610', '700', true, true);
				$('#popFrm').attr('method', 'POST').attr('target', 'fnMngAddr').attr('action', _BT.SHOP.URL.Order.PopTrace).submit();				
			}else{
				alert('배송정보 등록 전 입니다.');
				return false;
			}
		}
		function mySheet1_OnRowSearchEnd (row) {
			if (mySheet1.GetCellValue(row, 'OR_O_1') == 1) {
				mySheet1.SetCellFontColor(row, 'sDsttus', '#FF0000');
			}
			if(mySheet1.GetCellValue(row, 'sChk') > 0){
				mySheet1.SetCellFontColor(row, 'sMordrId', '#FF0000');
				mySheet1.SetCellFontBold(row, 'sMordrId', 1);
			}
		} 
		function mySheet2_OnRowSearchEnd (row) { 
			if(
					mySheet2.GetCellValue(row, 'sDsttus') == 51
				||mySheet2.GetCellValue(row, 'sDsttus') == 52
				||mySheet2.GetCellValue(row, 'sDsttus') == 53
			){
				mySheet2.InitCellProperty(row, 'nQy', {Type:"Int",Edit:0}); 
			}
			if(
					mySheet2.GetCellValue(row, 'sDsttus') == 5
			){
				mySheet2.SetRowFontColor(row,'#FF0000');		
				mySheet2.InitCellProperty(row, 'nQy', {Type:"Int",Edit:0}); 
				mySheet2.InitCellProperty(row, 'sCheckBox', {Type:"CheckBox",Edit:0}); 
				mySheet2.InitCellProperty(row, 'sCrmk', {Type:"text",Edit:0}); 
			} 
		} 
		
		function mySheet2_OnChange(Row, Col, Value, OldValue, RaiseFlag){ 
			var sSaveName = mySheet2.ColSaveName(0, Col); 
			var price = 0;  
			var chk = 0; 
			if(sSaveName == 'nQy'){		
				if(mySheet2.GetCellValue(Row,'nQy') == '' || mySheet2.GetCellValue(Row,'nQy') == '0'){
					alert('수량을 입력하세요.');
					mySheet2.SetCellValue(Row, 'nQy', mySheet2.GetCellValue(Row,'sDqy'));
					return false;
				}else if(mySheet2.GetCellValue(Row,'nQy') > mySheet2.GetCellValue(Row,'sDqy')){
					alert('구매수량보다 많습니다.\n\n확인 후 처리 바랍니다.');
					mySheet2.SetCellValue(Row, 'nQy', mySheet2.GetCellValue(Row,'sDqy'));
					return false;
				}
			}
			if(sSaveName == 'sCheckBox'){		
				var cnt = mySheet2.RowCount();
				for(var i = 1; i <= cnt; i++){
					var chk = mySheet2.GetCellValue(i,'sCheckBox');
					if(chk == 1){
						chk++;
						price += mySheet2.GetCellValue(i,'sDsumPrice');
					}
				}
				$('#ck_p').val( price );
				$('#ck_s').val( price + eval( $('#ck_d').val() - $('#mi_d').val() ) ); 
			}
		} 
	</script>