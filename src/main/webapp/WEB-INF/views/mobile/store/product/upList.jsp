<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/layout/include/base.jsp" %>
	<style>
		.chooseImg .choose{
			display: block !important;
		}
	 </style>
	<script type="text/javascript">
		var dupClick1 = false;
		$(function(){  
			$('.cImg').on('click', function() {
				if($(this).hasClass('chooseImg')){
					$(this).removeClass("chooseImg");
				}else{
					$(this).addClass("chooseImg");
					
				} 
			});
			$('.mImg').on('click', function() {
				if($(this).hasClass('chooseImg')){
					$(this).removeClass("chooseImg");
				}else{
					$('.chooseImg').each(function( i ) {
						$(this).removeClass("chooseImg");
					});
					$(this).addClass("chooseImg");
				} 
			});
			$('.sButton').click(function() {
				doAction($(this).data('type'), $(this).data('value'));
			});
			initSheet();
		});
		function initSheet(){
			var initData = {};
			initData.Cfg = {
									'ToolTip': 1,
									'DragMode': -1,
									'AutoFitColWidth': 'search|resize|init|colhidden|rowtransaction',
									'MergeSheet': msFixedMerge + msHeaderOnly 
								};
			initData.HeaderMode = {};

			initData.Cols = [
				[ //첫번째 단위 데이터(DataRow) 행
					{'Header': '번호', 				'Type': 'Seq', 				'MinWidth': 50,		'SaveName': 'sSeq',			'Align': 'Center', 	'Hidden':1}
					,{'Header': '선택',		 		'Type': 'CheckBox', 		'MinWidth': 40,		'SaveName': 'sCheckBox', 	'Align': 'Center', 	'RowSpan': 2,		'DefaultValue':1}   
					,{'Header': '대표이미지', 		'Type': 'Image', 			'MinWidth': 60,		'SaveName': 'sPImg', 		'Align': 'Center', 	'Edit':0, 'Save': 0, 'RowSpan': 2, 	'ImgMinWidth': 100, 'ImgHeight': 60	}
					,{'Header': '추가1', 			'Type': 'Image', 			'MinWidth': 60,		'SaveName': 'sEImg0', 		'Align': 'Center', 	'Edit':0, 'Save': 0, 'RowSpan': 2, 	'ImgMinWidth': 100, 'ImgHeight': 60	}
					,{'Header': '추가2', 			'Type': 'Image', 			'MinWidth': 60,		'SaveName': 'sEImg1', 		'Align': 'Center', 	'Edit':0, 'Save': 0, 'RowSpan': 2, 	'ImgMinWidth': 100, 'ImgHeight': 60	}
					,{'Header': '추가3', 			'Type': 'Image', 			'MinWidth': 60,		'SaveName': 'sEImg2', 		'Align': 'Center', 	'Edit':0, 'Save': 0, 'RowSpan': 2, 	'ImgMinWidth': 100, 'ImgHeight': 60	}
					,{'Header': '추가4', 			'Type': 'Image', 			'MinWidth': 60,		'SaveName': 'sEImg3', 		'Align': 'Center', 	'Edit':0, 'Save': 0, 'RowSpan': 2, 	'ImgMinWidth': 100, 'ImgHeight': 60	}
					,{'Header': '품명', 				'Type': 'Text', 				'MinWidth': 160, 	'SaveName': 'sPrdtNm', 		'Align': 'Left', 		'KeyField':1 }  
					,{'Header': '제조사',			'Type': 'Text', 				'MinWidth': 60, 	'SaveName': 'sMakerNm', 	'Align': 'Left', 		'KeyField':1 	}
					,{'Header': '재고량', 			'Type': 'Int', 				'MinWidth': 50,		'SaveName': 'sAmt', 			'Align': 'Right', 		'KeyField':1,		'Format': '#,###'}
					,{'Header': '배송구분', 			'Type': 'Combo', 			'MinWidth': 50,		'SaveName': 'sDlTp', 			'Align': 'Center', 	'KeyField':1,		'ComboText': '택배|화물', 	'ComboCode': 'T|H'}
					,{'Header': '묶음배송',			'Type': 'Combo', 			'MinWidth': 50,		'SaveName': 'sPkgTp', 		'Align': 'Center', 	'KeyField':1,		'ComboText': '가능|불가', 	'ComboCode': '0|1'	}
					,{'Header': '배송비', 			'Type': 'Int', 				'MinWidth': 50,		'SaveName': 'sDlFee', 		'Align': 'Right', 		'KeyField':1,		'Format': '#,###',		 	'DefaultValue':0}   
					,{'Header': '추가1',	 			'Type': 'Text', 				'MinWidth': 60, 	'SaveName': 'sENo0',			'Align': 'Center', 	'Edit':0, 	'Hidden':1}
					,{'Header': '추가2',	 			'Type': 'Text', 				'MinWidth': 60, 	'SaveName': 'sENo1',			'Align': 'Center', 	'Edit':0, 	'Hidden':1}
					,{'Header': '대표이미지',		'Type': 'Text', 				'MinWidth': 80, 	'SaveName': 'sPNo',			'Align': 'Center', 	'Edit':0, 	'Hidden':1}
				],
				[ //두번째 단위 데이터(DataRow) 행
					{'Header': '구분', 				'Type': 'Status', 			'MinWidth': 50,		'SaveName': 'sStatus', 		'Align': 'Center', 	'Hidden':1}
					,{'Header': '선택'	}
					,{'Header': '대표이미지'	}
					,{'Header': '추가1'	}
					,{'Header': '추가2'	}
					,{'Header': '추가3'	}
					,{'Header': '추가4'	}
					,{'Header': '규격', 				'Type': 'Text', 				'MinWidth': 160, 	'SaveName': 'sStndrd', 		'Align': 'Left', 		'KeyField':1 	}
					,{'Header': '모델명',			'Type': 'Text', 				'MinWidth': 60, 	'SaveName': 'sModelNm', 	'Align': 'Left'		}
					,{'Header': '판매가', 			'Type': 'Int', 				'MinWidth': 50,		'SaveName': 'sPrice', 		'Align': 'Right', 		'KeyField':1, 	'Format': '#,###'}
					,{'Header': '추가설명',	 		'Type': 'Text', 				'MinWidth': 200, 	'SaveName': 'sPrdtDtlInfo',	'Align': 'Left', 		'ColSpan':3, 	'MultiLineText': 1}
					,{'Header': '추가설명'	}
					,{'Header': '추가설명'	}
					,{'Header': '추가3',	 			'Type': 'Text', 				'MinWidth': 80, 	'SaveName': 'sENo2',			'Align': 'Center', 	'Edit':0, 	'Hidden':1}
					,{'Header': '추가4',	 			'Type': 'Text', 				'MinWidth': 80, 	'SaveName': 'sENo3',			'Align': 'Center', 	'Edit':0, 	'Hidden':1}
					,{'Header': '대표이미지파일',	'Type': 'Text', 				'MinWidth': 80, 	'SaveName': 'sSName',		'Align': 'Center', 	'Edit':0, 	'Hidden':1}
				]
			];			
			// IBSheet 생성
			createIBSheet2($('#ib-container1')[0], 'mySheet1', '100%', '300px');
			// IBSheet 초기화
			IBS_InitSheet(mySheet1, initData);	

			initData.Cols = [
				[ //첫번째 단위 데이터(DataRow) 행
					{'Header': '번호', 				'Type': 'Seq', 				'MinWidth': 50,		'SaveName': 'sSeq',			'Align': 'Center', 	'RowSpan': 2,		'Hidden':1}
					,{'Header': '삭제',		 		'Type': 'DelCheck', 		'MinWidth': 40,		'SaveName': 'sCheckBox', 	'Align': 'Center', 	'DefaultValue':1	 }   
					,{'Header': '상태', 				'Type': 'Combo', 			'MinWidth': 50,		'SaveName': 'sSttus',		'Align': 'Center', 	'RowSpan': 2,		'Edit':0,  'ComboText': '요청|보류|승인|반려|재요청', 	'ComboCode': '1|2|3|4|5'}
					,{'Header': '요청일',			'Type': 'Date', 				'MinWidth': 80, 	'SaveName': 'sCdt', 			'Align': 'Center', 	'Edit':0, 'Save': 0	}
					,{'Header': '담당자비고', 		'Type': 'Text', 				'MinWidth': 100,	'SaveName': 'sConRMK', 	'Align': 'Center', 	'Edit':0, 'Save': 0, 'RowSpan': 2	}
					,{'Header': '대표이미지', 		'Type': 'Image', 			'MinWidth': 60,		'SaveName': 'sPImg', 		'Align': 'Center', 	'Edit':0, 'Save': 0, 'RowSpan': 2, 	'ImgMinWidth': 100, 'ImgHeight': 60	}
					,{'Header': '추가1', 			'Type': 'Image', 			'MinWidth': 60,		'SaveName': 'sEImg0', 		'Align': 'Center', 	'Edit':0, 'Save': 0, 'RowSpan': 2, 	'ImgMinWidth': 100, 'ImgHeight': 60	}
					,{'Header': '추가2', 			'Type': 'Image', 			'MinWidth': 60,		'SaveName': 'sEImg1', 		'Align': 'Center', 	'Edit':0, 'Save': 0, 'RowSpan': 2, 	'ImgMinWidth': 100, 'ImgHeight': 60	}
					,{'Header': '추가3', 			'Type': 'Image', 			'MinWidth': 60,		'SaveName': 'sEImg2', 		'Align': 'Center', 	'Edit':0, 'Save': 0, 'RowSpan': 2, 	'ImgMinWidth': 100, 'ImgHeight': 60	}
					,{'Header': '추가4', 			'Type': 'Image', 			'MinWidth': 60,		'SaveName': 'sEImg3', 		'Align': 'Center', 	'Edit':0, 'Save': 0, 'RowSpan': 2, 	'ImgMinWidth': 100, 'ImgHeight': 60	}
					,{'Header': '품명', 				'Type': 'Text', 				'MinWidth': 160, 	'SaveName': 'sPrdtNm', 		'Align': 'Left', 		'KeyField':1 }  
					,{'Header': '제조사',			'Type': 'Text', 				'MinWidth': 60, 	'SaveName': 'sMakerNm', 	'Align': 'Left', 		'KeyField':1 	}
					,{'Header': '재고량', 			'Type': 'Int', 				'MinWidth': 50,		'SaveName': 'sAmt', 			'Align': 'Right', 		'KeyField':1,		'Format': '#,###'}
					,{'Header': '배송구분', 			'Type': 'Combo', 			'MinWidth': 50,		'SaveName': 'sDlTp', 			'Align': 'Center', 	'KeyField':1,		'ComboText': '택배|화물', 	'ComboCode': 'T|H'}
					,{'Header': '묶음배송',			'Type': 'Combo', 			'MinWidth': 50,		'SaveName': 'sPkgTp', 		'Align': 'Center', 	'KeyField':1,		'ComboText': '가능|불가', 	'ComboCode': '0|1'	}
					,{'Header': '배송비', 			'Type': 'Int', 				'MinWidth': 50,		'SaveName': 'sDlFee', 		'Align': 'Right', 		'KeyField':1,		'Format': '#,###',		 	'DefaultValue':0}   
					,{'Header': '추가1',	 			'Type': 'Text', 				'MinWidth': 60, 	'SaveName': 'sENo0',			'Align': 'Center', 	'Edit':0, 	'Hidden':1}
					,{'Header': '추가2',	 			'Type': 'Text', 				'MinWidth': 60, 	'SaveName': 'sENo1',			'Align': 'Center', 	'Edit':0, 	'Hidden':1}
					,{'Header': '대표이미지',		'Type': 'Text', 				'MinWidth': 80, 	'SaveName': 'sPNo',			'Align': 'Center', 	'Edit':0, 	'Hidden':1}
				],
				[ //두번째 단위 데이터(DataRow) 행
					{'Header': '번호'	,		'Hidden':1}
					,{'Header': '구분', 				'Type': 'Status', 			'MinWidth': 40,		'SaveName': 'sStatus', 		'Align': 'Center'		}
					,{'Header': '상태'	}
					,{'Header': '처리일',			'Type': 'Date', 				'MinWidth': 80, 	'SaveName': 'sUdt', 			'Align': 'Center', 	'Edit':0, 'Save': 0	}
					,{'Header': '담당자비고'	}
					,{'Header': '대표이미지'	}
					,{'Header': '추가1'	}
					,{'Header': '추가2'	}
					,{'Header': '추가3'	}
					,{'Header': '추가4'	}
					,{'Header': '규격', 				'Type': 'Text', 				'MinWidth': 160, 	'SaveName': 'sStndrd', 		'Align': 'Left', 		'KeyField':1 	}
					,{'Header': '모델명',			'Type': 'Text', 				'MinWidth': 60, 	'SaveName': 'sModelNm', 	'Align': 'Left'		}
					,{'Header': '판매가', 			'Type': 'Int', 				'MinWidth': 50,		'SaveName': 'sPrice', 		'Align': 'Right', 		'KeyField':1, 	'Format': '#,###'}
					,{'Header': '추가설명',	 		'Type': 'Text', 				'MinWidth': 200, 	'SaveName': 'sPrdtDtlInfo',	'Align': 'Left', 		'ColSpan':3, 	'MultiLineText': 1}
					,{'Header': '추가설명'	}
					,{'Header': '추가설명'	}
					,{'Header': '추가3',	 			'Type': 'Text', 				'MinWidth': 80, 	'SaveName': 'sENo2',			'Align': 'Center', 	'Edit':0, 	'Hidden':1}
					,{'Header': '추가4',	 			'Type': 'Text', 				'MinWidth': 80, 	'SaveName': 'sENo3',			'Align': 'Center', 	'Edit':0, 	'Hidden':1}
					,{'Header': '대표이미지파일',	'Type': 'Text', 				'MinWidth': 80, 	'SaveName': 'sSName',		'Align': 'Center', 	'Edit':0, 	'Hidden':1}
				]
			];		
			
			
			
			// IBSheet 생성
			createIBSheet2($('#ib-container2')[0], 'mySheet2', '100%', '400px');
			// IBSheet 초기화
			IBS_InitSheet(mySheet2, initData);	
			
			// 편집 가능 여부 설정
			mySheet1.SetEditable(true);
			mySheet2.SetEditable(true);
			
			// 사이즈 맞춤
			mySheet1.FitColWidth();
			mySheet2.FitColWidth();

			//건수 정보 표시
			mySheet2.SetCountPosition(4);
			
			//페이지 네비게이션 버튼 표시
			mySheet2.SetPagingPosition(1);
			
		}	
		function doAction(sAction, tar) { 
			switch(sAction) {     
				case 'search':            
					var sheet = eval('mySheet' + tar);
					if(2 == tar)
						sheet.DoSearch(_BT.STORE.URL.Product.SheetUpPrdtList,''); 
					break; 
				case 'save':       //저장
					var sheet = eval('mySheet' + tar);
					var opt = {UrlEncode:0, Mode:2, Delim:"#"};
					var SaveStr = sheet.GetSaveString(opt); 
					if('' == SaveStr){
						alert('저장할 내역이 없습니다.'); 
						break;
					}else if('KeyFieldError' == SaveStr){ 
						break;
					}else{
						if(!confirm('상품정보를 등록 하시겠습니까?')) break;
					}
					if(1 == tar){
						var rtnData = sheet.GetSaveData(_BT.STORE.URL.Product.SetSheetPrdt, SaveStr); 
						sheet.LoadSaveData(rtnData);
					} 
					break;     
			} 
		} 
		function fnUpPrdt(){
			if($('.cImg.chooseImg').length<1){
				alert('등록하실 이미지를 선택해 주세요\n\n한 품목당 최대 5장의 이미지를 선택 하실수 있습니다.');
				return false;
			}
			if($('.cImg.chooseImg').length>5){
				alert('한 품목당 최대 5장의 이미지를 선택 하실 수 있습니다.');
				return false;
			}
			cleanDiv();
			var cnt = 0; 	
			$('.cImg.chooseImg').each(function( i ) {	
				$('#cResult'+cnt).attr('src', $('#sResult'+$(this).attr('id')).attr('src'));
				$('#cResult'+cnt).attr('data-value', $('#sResult'+$(this).attr('id')).data('value'));
				$('#cResult'+cnt).attr('data-type', $('#sResult'+$(this).attr('id')).data('type'));
				cnt++;
			});
			$('#chDiv').show();
		}
		function fnNextStep(){
			if($('.chooseImg .cResult').data('value')== '' || $('.chooseImg .cResult').data('value')== undefined ){
				alert('등록하실 이미지를 선택해 주세요.');
				return false;
			}
			var cnt = 0;
			var Row = mySheet1.DataInsert();
			var id = $('.chooseImg .cResult').data('value');
			$('.mImg .cResult').each(function( i ) {
				var tId = $(this).data('value');
				var tNo = $(this).data('type');
				var tSrc = $(this).attr('src');
				if(tId != ''){
					if(id == tId){
						mySheet1.SetCellValue(Row, 'sPImg', tSrc) ;
						mySheet1.SetCellValue(Row, 'sPNo', tId) ;
						mySheet1.SetCellValue(Row, 'sSName', tNo) ;
					}else{
						mySheet1.SetCellValue(Row, 'sEImg'+cnt, tSrc) ;
						mySheet1.SetCellValue(Row, 'sENo'+cnt, tId) ;
						cnt++;
					}
				}
			});
			cleanDiv();
		}
		function cleanDiv(){
			$('.mImg').each(function( i ) {
				$(this).removeClass("chooseImg");
			});
			$('.cResult').each(function( i ) {
				$(this).attr('data-value','');
				$(this).attr('data-type','');
				$(this).attr('src','${staticRoot}/img/c13_01_02_noimg_02.jpg');
			});
			$('#chDiv').hide();
		}
		function mySheet1_OnSaveEnd(code) {
			if(code == 1){         
				alert("상품정보 등록 완료 하였습니다.\n\n업무일 기준 3일 안에 담당자 확인 후 회신 예정입니다.");
                document.location.reload();
			} else {         
				alert("저장에 실패하였습니다.");     
			} 
		} 
	</script>
	<div class="" style="min-height:700px;">
		<h2 class="title_con_Type01">
			임시저장				
		</h2>
		<div class="c13_01_02_img_01" style="padding-left: 30px; text-align: left;">
			<c:forEach items="${result}" var="aFile" varStatus="status">
				<div style="display: inline-block; text-align: center;" class="cImg" id="<c:out value="${status.count}"/>" >
					<img src="${staticRoot}/img/common/chk_128.png" class="choose" alt="사진선택" width="175px" height="139px" style="position: absolute; margin-left:15px; margin-top:5px; display: none;" />
					<img src="${upload}<c:out value="${aFile.filePath}"/><c:out value="${aFile.fileSaveName}"/>" alt="사진선택" id="sResult<c:out value="${status.count}"/>"  width="185px" height="149px" class="sResult marginleft_10" data-type="<c:out value="${aFile.fileSaveName}"/>" data-value="<c:out value="${aFile.fileId}"/>"/>
				</div>
			</c:forEach>	
		</div>
		<div class="cart_btn margintop_30">
			<span class="btn_08" onclick="fnUpPrdt();">상품등록</span>					
		</div>
		
		<div class="c13_01_02_box_01" style="display: none;" id="chDiv">
			<div class="c13_01_02_txt_01" style="margin-bottom: 20px;">등록하실 상품의 대표사진을 선택해 주세요.</div>
			<div class="c13_01_02_box_m_01">
				<div style="display: inline-block; text-align: center; margin-bottom: 10px;" class="mImg">
					<img src="${staticRoot}/img/common/chk_128.png" class="choose" alt="사진선택" width="140px" height="120px" style="position: absolute; margin-left:15px; margin-top:5px; display: none;" />
					<img src="${staticRoot}/img/c13_01_02_noimg_02.jpg" alt="사진선택" id="cResult0"  width="150px" height="130px" class="cResult marginleft_10" data-value="" data-type=""/>
				</div>
				<div style="display: inline-block; text-align: center; margin-bottom: 10px;" class="mImg">
					<img src="${staticRoot}/img/common/chk_128.png" class="choose" alt="사진선택" width="140px" height="120px" style="position: absolute; margin-left:15px; margin-top:5px; display: none;" />
					<img src="${staticRoot}/img/c13_01_02_noimg_02.jpg" alt="사진선택" id="cResult1"  width="150px" height="130px" class="cResult marginleft_10" data-value="" data-type=""/>
				</div>
				<div style="display: inline-block; text-align: center; margin-bottom: 10px;" class="mImg">
					<img src="${staticRoot}/img/common/chk_128.png" class="choose" alt="사진선택" width="140px" height="120px" style="position: absolute; margin-left:15px; margin-top:5px; display: none;" />
					<img src="${staticRoot}/img/c13_01_02_noimg_02.jpg" alt="사진선택" id="cResult2"  width="150px" height="130px" class="cResult marginleft_10" data-value="" data-type=""/>
				</div>
				<div style="display: inline-block; text-align: center; margin-bottom: 10px;" class="mImg">
					<img src="${staticRoot}/img/common/chk_128.png" class="choose" alt="사진선택" width="140px" height="120px" style="position: absolute; margin-left:15px; margin-top:5px; display: none;" />
					<img src="${staticRoot}/img/c13_01_02_noimg_02.jpg" alt="사진선택" id="cResult3"  width="150px" height="130px" class="cResult marginleft_10" data-value="" data-type=""/>
				</div>
				<div style="display: inline-block; text-align: center; margin-bottom: 10px;" class="mImg">
					<img src="${staticRoot}/img/common/chk_128.png" class="choose" alt="사진선택" width="140px" height="120px" style="position: absolute; margin-left:15px; margin-top:5px; display: none;" />
					<img src="${staticRoot}/img/c13_01_02_noimg_02.jpg" alt="사진선택" id="cResult4"  width="150px" height="130px" class="cResult marginleft_10" data-value="" data-type=""/>
				</div>
			</div>
			<label class="click_btn05" onclick="fnNextStep();">선택</label>
		</div>
		<h2 class="title_con_Type01 margintop_50">
			신규상품 등록									
			<span data-type="save" data-value="1" class="sButton btn_span fs-13 pink marginleft_5" style="float: right;">저장</span>
			<span data-type="search" data-value="1"  class="sButton btn_span fs-13 blue" style="float: right;">초기화</span>
		</h2>
		<div class="col-sm-5 col-md-5">
		    <div id="ib-container1"></div>
		</div>

		<h2 class="title_con_Type01 margintop_50">
			등록승인 요청현황						
			<span data-type="save" data-value="2" class="sButton btn_span fs-13 pink marginleft_5" style="float: right;">저장</span>
			<span data-type="search" data-value="2"  class="sButton btn_span fs-13 blue" style="float: right;">조회</span>
		</h2>
		<div class="col-sm-5 col-md-5" style="margin-bottom:30px;" >
		    <div id="ib-container2"></div>
			<div class="c13_01_02_txt_01_1" style="margin-top:5px;text-align: left;">※ 승인완료된 상품은 상품관리 메뉴에서 확인 하시기 바랍니다.</div>
		</div>
	</div>


