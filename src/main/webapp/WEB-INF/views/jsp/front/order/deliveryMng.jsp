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
		<form id="orFrm" name="orFrm">
			<input type="hidden" id="SaveStr" name="SaveStr"/>	
			<input type="hidden" id="ordrId" name="ordrId"/>	
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
					<th>
						<h1>
							배송중
						</h1>
						<h2>
							<label class="dbCnt" data-type="OR_3"><c:out value="${dashBoard.OR_3}"/> 건</label> 
						</h2>
					</th>
					<th class="on">
						<h1>
							임시송장 등록대상
						</h1>
						<h2>
							<span class="dbCnt" data-type="OR_O_3"><label><c:out value="${dashBoard.OR_O_3}"/> </label>건</span>
						</h2>
					</th>
					<th class="on">
						<h1>
							배송상태 확인대상
						</h1>
						<h2>
							<span class="dbCnt" data-type="OR_C_3"><label> <c:out value="${dashBoard.OR_C_3}"/> </label>건</span>
						</h2>
					</th>
					<th class="on">
						<h1>
							배송완료
						</h1>
						<h2>
							<label class="dbCnt" data-type="OR_4"><c:out value="${dashBoard.OR_4}"/>  건</label> 
							<span class="dbCnt" data-type="OR_O_4">확정 <label> <c:out value="${dashBoard.OR_O_4}"/> </label>건</span>
						</h2>
					</th>
				</tr>
			</tbody>
		</table>	
		<div class="signup_agree marginbottom_20">
			<p class="alarm_txt">※ 집계 조건 : 최근 1주일(7일) 동안 / 주문 상품(전체)</p>
		</div>
		<form id="frm" name="frm">
			<input type="hidden" id="jobTp" name="jobTp" value="deliveryMng"/>	
			<input type="hidden" id="SMS" name="SMS" value="Y"/>	
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
									<input type="text" class="input_style05" id="sDt" name="sDt" readonly="readonly" />
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
								<span class="return_select">
									<select class="" id="sSus" name="sSus">
										<option value="">전체 주문건</option>
										<option value="0" selected="selected">전체 배송 시작건</option>
										<option value="3">임시송장 변경대상</option>
										<option value="4">정상 배송중</option>
										<option value="5">배송상태 확인대상</option> 
										<option value="6">배송완료</option> 
										<option value="9">구매확정</option> 
									</select>
								</span>		
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
		<h1 class="title_con_Type01 margintop_20" style="margin-right:10px; text-align: left;">
			상세결과
			<span> 
				<span onclick="doAction('rtnDvy');"  class="sButton btn_span fs-13 pink marginleft_20" style="float: right;">배송비 환불</span>
				<span onclick="doAction('upDely');"  class="sButton btn_span fs-13 pink marginleft_5" style="float: right;">배송완료 변경</span>
				<span onclick="doAction('ckDely');"  class="sButton btn_span fs-13 green marginleft_5" style="float: right;">배송상태 확인</span>
				<span onclick="doAction('invoice2');"  class="sButton btn_span fs-13 blue marginleft_5" style="float: right;">송장변경-알림 X</span>
				<span onclick="doAction('invoice');"  class="sButton btn_span fs-13 blue" style="float: right;">송장변경-알림 O</span>
			</span>
		</h1>
		<form id="dvyFrm" name="dvyFrm">
			<input id="rNum" name="rNum" type="hidden" />
			<input id="rOrdrId" name="rOrdrId" type="hidden" />
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
				</h1>
			</div>
		</form>		
		<div class="col-sm-5 col-md-5" style="height:310px;width:100%;">
		    <div id="ib-container2"></div>
		</div>
	</div>

	<script type="text/javascript">
		var devyrtn 	= '${devyrtn.cbCode}';
		var dupClick1 	= false;
		var dev = 1;
		$(function(){
			_BT.makeCalendar('sDt', 'yy-mm-dd'); 
			_BT.makeCalendar('eDt', 'yy-mm-dd'); 
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
			initData.HeaderMode = {};
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
				,{'Header': '계산서요청',	'Type': 'Popup',		'MinWidth': 50,		'SaveName': 'sTaxBill',			'Align': 'Center',	'Edit':1,	'Save': 0	, 	'ColMerge':1	}
				,{'Header': '배송지구분','Type': 'Combo',		'MinWidth': 50,		'SaveName': 'sZoneTp',	 		'Align': 'Center',	'Edit':0,	'Save': 0,	'ComboText': '일반지역|도서산간|제주지역',		'ComboCode': '0|1|2'	, 	'ColMerge':0	}
				,{'Header': 'INI결제번호',	'Type': 'Text',		'MinWidth': 150,	'SaveName': 'sOid',				'Align': 'Left',		'Edit':0,	'Save': 0	, 	'ColMerge':1	}  
				,{'Header': 'INI승인번호(TID)',	'Type': 'Text',			'MinWidth': 150,	'SaveName': 'sTid',				'Align': 'Left',		'Edit':0,	'Save': 0	, 	'ColMerge':1,	'Hidden':dev	}
				,{'Header': '주문자ID',	'Type': 'Text',			'MinWidth': 50,	'SaveName': 'sMoUsrId',				'Align': 'Left',		'Edit':0,	'Save': 0	, 	'ColMerge':1,	'Hidden':dev	}
				,{'Header': '비고내역', 	'Type': 'Int', 			'MinWidth': 0, 		'SaveName': 'sChk', 			'Align': 'Center', 	'Edit':0,	'Save': 0,	'Hidden':dev	}  
			];	
			// IBSheet 생성
			createIBSheet2($('#ib-container1')[0], 'mySheet1', '100%', '400px');
			// IBSheet 초기화
			IBS_InitSheet(mySheet1, initData);	

			
			initData.Cols = [
				{'Header': '번호',		'Type': 'Seq', 			'MinWidth': 50,		'SaveName': 'sSeq',			'Align': 'Center',	'Edit':0,	'Save': 0	, 	'ColMerge':0	}
				,{'Header': '구분',		'Type': 'Status',		'MinWidth': 50,		'SaveName': 'sStatus', 		'Align': 'Center',	'Edit':0,	'Save': 0,	'Hidden':dev, 	'ColMerge':0	}
				,{'Header': '주문일',	'Type': 'Date',			'MinWidth': 80,		'SaveName': 'sMordrDt',	 	'Align': 'Center',	'Edit':0,	'Save': 0	,	'Format':'YmdHm'}
				,{'Header': '주문자',	'Type': 'Text',			'MinWidth': 70,		'SaveName': 'sMordrUsr',	'Align': 'Center',	'Edit':0,	'Save': 0	, 	'ColMerge':1	}
				,{'Header': '주문번호',	'Type': 'Text',			'MinWidth': 150,	'SaveName': 'sMordrId',		'Align': 'Center',	'Edit':0,	'Save': 1	, 	'ColMerge':1	}
				,{'Header': '주문금액',	'Type': 'Int',				'MinWidth': 50,		'SaveName': 'sMprice', 		'Align': 'Right',		'Edit':0,	'Save': 0,	'Format':'Integer'	}
				,{'Header': '배송비',	'Type': 'Int',				'MinWidth': 50,		'SaveName': 'sMdvFee', 	'Align': 'Right',		'Edit':0,	'Save': 0,	'Format':'Integer'	}
				,{'Header': '총금액',	'Type': 'Int',				'MinWidth': 50,		'SaveName': 'sMsPrice',	 	'Align': 'Right',		'Edit':0,	'Save': 0,	'Format':'Integer'	}
			
				,{'Header': '품목수',	'Type': 'Int',				'MinWidth': 50,		'SaveName': 'sMcntPrdt',	'Align': 'Right',		'Edit':0,	'Save': 0,	'Format':'Integer'	}
				,{'Header': '상태', 		'Type': 'Combo', 		'MinWidth': 60,		'SaveName': 'sDsttus', 		'Align': 'Center', 	'Edit':0,	'Save': 1,	'ComboText': '미확인|주문접수|배송중|배송완료|취소요청|구매확정',		'ComboCode': '1|2|3|4|71|9'	, 	'ColMerge':0	}
				,{'Header': '선택',		'Type': 'CheckBox', 	'MinWidth': 50, 	'SaveName': 'sCheckBox',	'Align': 'Center',	'Edit':1, 	'Save': 1	, 	'ColMerge':0	}
				,{'Header': '비고',		'Type': 'Text',			'MinWidth': 50,		'SaveName': 'sRMK',		 	'Align': 'Left',		'Edit':0,	'Save': 0, 	'ColMerge':0,	'ToolTip':1,	'Hidden':dev	}  
				,{'Header': '품목코드',	'Type': 'Text',			'MinWidth': 80,		'SaveName': 'sDprdtCd', 	'Align': 'Center',	'Edit':0,	'Save': 0, 	'ColMerge':0	}
				,{'Header': '품명',		'Type': 'Text',			'MinWidth': 150,	'SaveName': 'sDprdtNm', 	'Align': 'Left',		'Edit':0,	'Save': 0	, 	'ColMerge':0	}
				,{'Header': '규격',		'Type': 'Text',			'MinWidth': 150,	'SaveName': 'sDstndrd', 	'Align': 'Left',		'Edit':0,	'Save': 0	, 	'ColMerge':0	}
				,{'Header': '제조사',	'Type': 'Text',			'MinWidth': 50,		'SaveName': 'sDmakrNm', 	'Align': 'Center',	'Edit':0,	'Save': 0, 	'ColMerge':0	}
				,{'Header': '판매가',	'Type': 'Int',				'MinWidth': 50,		'SaveName': 'sDtotPrice', 	'Align': 'Right',		'Edit':0,	'Save': 0,	'Format':'Integer', 	'ColMerge':0	}
				,{'Header': '수량',		'Type': 'Int',				'MinWidth': 50,		'SaveName': 'sDqy',		 	'Align': 'Right',		'Edit':0,	'Save': 0,	'Format':'Integer', 	'ColMerge':0	}
				,{'Header': '합계',		'Type': 'Int',				'MinWidth': 50,		'SaveName': 'sDsumPrice', 	'Align': 'Right',		'Edit':0,	'Save': 0,	'Format':'Integer', 	'ColMerge':0	}
				
				,{'Header': '접수일',	'Type': 'Date',			'MinWidth': 80,		'SaveName': 'sDreceiptDt',	'Align': 'Center',	'Edit':0,	'Save': 0,	'Format':'YmdHm'}
				,{'Header': '배송등록일','Type': 'Date',			'MinWidth': 80,		'SaveName': 'sDdelyDt', 	'Align': 'Center',	'Edit':0,	'Save': 0	,	'Format':'YmdHm'}
				,{'Header': '배송완료일','Type': 'Date',			'MinWidth': 80,		'SaveName': 'sDdelyCmpDt','Align': 'Center',	'Edit':0,	'Save': 0	,	'Format':'YmdHm'}
				,{'Header': '구매확정일','Type': 'Date',			'MinWidth': 80,		'SaveName': 'sOrdrCmpDt',	'Align': 'Center',	'Edit':0,	'Save': 0	,	'Format':'YmdHm'}

				,{'Header': '택배사', 	'Type': 'Combo',		'MinWidth': 80, 	'SaveName': 'sDdlvyCmp', 	'Align': 'Center',	'Edit':1,	'Save': 1, 	'ColMerge':0, 	'KeyField':1,	 	'ComboText': '택배사 선택|${delyCb.cbText}', 'ComboCode': '|${delyCb.cbCode}' }  
				,{'Header': '송장번호', 	'Type': 'Text',			'MinWidth': 100, 	'SaveName': 'sDinvoice', 	'Align': 'Left',		'Edit':1,	'Save': 1, 	'ColMerge':0,	'KeyField':1,  	'Format' : '##############' 	}
				,{'Header': '확인',		'Type': 'Popup',		'Width': 42, 		'SaveName': 'sDinvPop', 	'Align': 'Center',	'Edit':1,	'Save': 1, 	'ColMerge':0	}
				
				,{'Header': '배송지명',	'Type': 'Text',			'MinWidth': 50,		'SaveName': 'sMaddrNm', 	'Align': 'Center',	'Edit':0,	'Save': 0		}
				,{'Header': '받는사람',	'Type': 'Text',			'MinWidth': 50,		'SaveName': 'sMrecvNm', 	'Align': 'Center',	'Edit':0,	'Save': 0		}
				,{'Header': '우편번호',	'Type': 'Text',			'MinWidth': 60,		'SaveName': 'sMZipCode', 	'Align': 'Center',	'Edit':0,	'Save': 0		}
				,{'Header': '주소',		'Type': 'Text',			'MinWidth': 150,	'SaveName': 'sMaddr', 		'Align': 'Left',		'Edit':0,	'Save': 0		}
				,{'Header': '상세주소',	'Type': 'Text',			'MinWidth': 100,	'SaveName': 'sMaddrDtl', 	'Align': 'Left',		'Edit':0,	'Save': 0		}
				,{'Header': '전화번호',	'Type': 'Text',			'MinWidth': 80,		'SaveName': 'sMtel', 			'Align': 'Center',	'Edit':0,	'Save': 0		}
				,{'Header': '배송요구사항',	'Type': 'Text',		'MinWidth': 100,	'SaveName': 'sMrmk', 		'Align': 'Left',		'Edit':0,	'Save': 0		}

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
					mySheet1.DoSearch(_BT.FRONT.URL.Search.SheetOrderList, $('#frm').serialize()); 
					break; 
					
				case 'invoice':          
				case 'invoice2':          
					var alTxt = '';
					var alTxt2 = '';
					var sRow = mySheet2.FindCheckedRow('sCheckBox').split('|');
					if(sRow == ''){alert('송장변경하실 주문건을 선택해 주세요.');return false;}
					
					for(var i=0; i < sRow.length; i++){
						if(mySheet2.GetCellValue(sRow[i], 'sDdlvyCmp') == '99'){
							var invoce = mySheet2.GetCellValue(sRow[i], 'sDinvoice') +"";
							if(invoce.length != 11 ){
								alert('기타택배 변경시 송장번호 규격은\n\nYYYYMMDD+일련번호 3자리 입니다.\n\n예)20171225001\n\n확인 바랍니다.');
								return false;
							}				
						}
						if(mySheet2.GetCellValue(sRow[i], 'sDsttus') != '3'){
							mySheet2.SetCellValue(sRow[i], 'sCheckBox', 0);
							alTxt = '배송중 상태만 송장내용이 변경됩니다.\n\n';
						}else if(mySheet2.GetCellValue(sRow[i], 'sDinvoice') != '9'){
							alTxt2 = '정상송장번호가 포함되어 있습니다.\n\n';
						}
					}
					if(!confirm(alTxt+alTxt2+'송장내용 변경 하시겠습니까?')) return false;
					if(sAction == 'invoice'){
						$('#SMS').val('Y');
					}else if(sAction == 'invoice2'){
						$('#SMS').val('N');
					}
					var opt = {UrlEncode:0, Mode:2, Delim:'#'};
					var SaveStr = mySheet2.GetSaveString(opt); 
					if('' == SaveStr){
						alert('송장변경 하실 주문건을 선택해 주세요.'); 
						return false;
					}else if('KeyFieldError' == SaveStr){ 
						return false;
					}else{
						var rtnData = mySheet2.GetSaveData(_BT.FRONT.URL.Order.UptInvoice, SaveStr+ "&"+$('#frm').serialize()); 
						mySheet2.LoadSaveData(rtnData);
					}
					break;  					
					
				case 'ckDely':          
					var alTxt = '';
					var sRow = mySheet2.FindCheckedRow('sCheckBox').split('|');
					if(sRow == ''){alert('배송완료 상태확인하실 주문건을 선택해 주세요.');return false;}
					
					for(var i=0; i < sRow.length; i++){
						if(mySheet2.GetCellValue(sRow[i], 'sDsttus') != '3'){
							mySheet2.SetCellValue(sRow[i], 'sCheckBox', 0);
							alTxt = '배송중 상태만 배송완료 상태확인이 가능 합니다.\n\n';
						}
					}
					var opt = {UrlEncode:0, Mode:2, Delim:'#'};
					var SaveStr = mySheet2.GetSaveString(opt); 

					if(!confirm(alTxt+'배송완료 상태확인 하시겠습니까?')) return false;
					if('' == SaveStr){
						alert('배송완료 상태확인 하실 주문건을 선택해 주세요.'); 
						return false;
					}else if('KeyFieldError' == SaveStr){ 
						return false;
					}else{
						var rtnData = mySheet2.GetSaveData(_BT.FRONT.URL.Order.ChkInvoice, SaveStr); 
						mySheet2.LoadSaveData(rtnData);
					}
					break;  					
					
				case 'upDely':          
					var alTxt = '';
					var sRow = mySheet2.FindCheckedRow('sCheckBox').split('|');
					if(sRow == ''){alert('배송완료로 상태변경하실 주문건을 선택해 주세요.');return false;}
					
					for(var i=0; i < sRow.length; i++){
						if(mySheet2.GetCellValue(sRow[i], 'sDsttus') != '3'){
							mySheet2.SetCellValue(sRow[i], 'sCheckBox', 0);
							alTxt = '배송중 상태만 배송완료 상태로 변경이 가능 합니다.\n\n';
						}
					}
					var opt = {UrlEncode:0, Mode:2, Delim:'#'};
					var SaveStr = mySheet2.GetSaveString(opt); 

					if(!confirm(alTxt+'배송완료 상태 변경 하시겠습니까?')) return false;
					if('' == SaveStr){
						alert('배송완료 상태 변경 하실 주문건을 선택해 주세요.'); 
						return false;
					}else if('KeyFieldError' == SaveStr){ 
						return false;
					}else{
						var rtnData = mySheet2.GetSaveData(_BT.FRONT.URL.Order.SetInvoice, SaveStr); 
						mySheet2.LoadSaveData(rtnData);
					}
					break;  	
					
				case 'rtnDvy':          
					if( dupClick1 ) {
						alert("처리중 입니다. 잠시만 기다려주세요.");
						return false;
					}
					var alTxt = '';
					var Row = $('#rNum').val();
					if (Row == '0' || Row == '' || Row == null) {alert('배송비 환불처리하실 주문건을 선택해 주세요.'); return false;} 
					var sPaym = mySheet1.GetCellValue(Row,'sPaym');
					var sMdvFee = mySheet1.GetCellValue(Row,'sMdvFee');
					if(sMdvFee < 1){
						alert('환불 처리할 배송비가 없습니다.\n\n확인 후 처리바랍니다.');
						return false;
					}
					if(sPaym == 'VBank'){
						if(devyrtn == 'A'){
							alTxt = '현재 가상계좌의 경우 XXX통장 환불로 설정되어 있습니다.\n\n'
									 +'배송비 환불내역 등록 후 실제 환불처리는\n\n'
									 +'은행사이트에서 직접 처리 하시기 바랍니다.\n\n'
									 +'배송비 환불정책 변경은 설정 > 코드관리(구분코드[25])에서 변경 바랍니다.\n\n';
						}else{
							if($('#bank_area').hasClass('vOff')){
									$('#bank_area').removeClass('vOff');
									alert('환불계좌 정보를 입력 바랍니다.');
									return false;
							}else{
								if(_BT.isEmptyById("refundbankcode",    	"환불 은행을 선택해 주세요.")) return false;
								if(_BT.isEmptyById("refundacctname",    	"예금주를 입력해 주세요.")) return false;
								if(_BT.isEmptyById("refundacctnum",    	"계좌번호를 입력해 주세요.")) return false;
							}
						}
					} else {
						if(!$('#bank_area').hasClass('vOff')){
							$('#bank_area').addClass('vOff');
						}
					}
					$('#rOrdrId').val( mySheet1.GetCellValue(Row,'sMordrId') );

					if(!confirm(alTxt + '\n\n배송비 '+sMdvFee+'원을 환불 처리 하시겠습니까?')) return false;
					dupClick1 = true; 
					_BT.ajaxCallbackSubmit('dvyFrm',  _BT.FRONT.URL.Order.RtnDvyFee, function(data) {
						dupClick1 = false;
						if($(data).size() > 0) { 
							if(_BT.isEquals(data.code, 'success')){
								alert(data.msg);	
								doAction('search');
								return false;
							}else{
								alert(data.msg);	
								doAction('search');
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
		function mySheet2_OnSaveEnd(code, msg) {
			if(code == 1){         
				alert(msg);
				doAction('search');
			} else {         
				alert('처리중 오류가 발생했습니다.\n\n다시 확인 부탁 드립니다.');     
			} 
		} 
		function mySheet1_OnRowSearchEnd (row) { 
			if(mySheet1.GetCellValue(row, 'sDsttus') == 2){
				mySheet1.InitCellProperty(row, 'sCheckBox', {Type:"CheckBox",Edit:0}); 
			}
			if (mySheet1.GetCellValue(row, 'OR_O_1') == 1) {
				mySheet1.SetCellFontColor(row, 'sDsttus', '#FF0000');
			}
			if(mySheet1.GetCellValue(row, 'sChk') > 0){
				mySheet1.SetCellFontColor(row, 'sMordrId', '#FF0000');
				mySheet1.SetCellFontBold(row, 'sMordrId', 1);
			}
		} 
		function mySheet1_OnPopupClick(Row, Col){ 
			if (Row == 0) return; //헤더행일때는 폼에 반영 안함.
			var sSaveName = mySheet1.ColSaveName(0, Col); 
			var ordrId = mySheet1.GetCellValue(Row,'sMordrId');
			if(sSaveName == 'sMordrId'){
				_BT.openPopup( _BT.FRONT.URL.Order.PopRmk+'?ordrId='+ordrId ,'PopRmk', '610', '500', true, true);
			
			}else if(sSaveName == 'sTaxBill'){ 
				if(mySheet1.GetCellValue(Row,'sTaxBill') == '요청'){
					var sMoUsrId = mySheet1.GetCellValue(Row,'sMoUsrId');
					_BT.openPopup( _BT.FRONT.URL.Order.PopTaxInfo+'?usrId='+sMoUsrId ,'PopRmk', '500', '600', true, true);
				}else{
					alert('세금계산서 발행 미요청건 입니다.');
					return false;
				}
			}
		}	
		function mySheet1_OnDblClick(Row, Col, Value, CellX, CellY, CellW, CellH) { 
			if (Row == 0) return; //헤더행일때는 폼에 반영 안함.
			$('#rNum').val(Row);
			var ordrId = mySheet1.GetCellValue(Row,'sMordrId');
			$('#ordrId').val(ordrId);
			mySheet2.DoSearch(_BT.FRONT.URL.Search.SheetOrderDtlList, $('#orFrm').serialize()); 
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
	</script>