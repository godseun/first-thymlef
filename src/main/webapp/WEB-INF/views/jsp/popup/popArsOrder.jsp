<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@include file="/WEB-INF/views/common/layout/include/base.jsp" %>
		<script type="text/javascript" src="${staticRoot}/sdk/sha/sha.js"></script>
		<script type="text/javascript" src="${staticRoot}/js/allCteg.js"></script>
		<script type="text/javascript">
			var dupClick1 = false;
			var mobile2 = false;
			var mobile3 = false;
			var isDev = 1;
			$(function () {
				$(":input").on("focus", function () {
					if (($(this).prop("readonly"))) {
						$(this).addClass("mbOn");
					} else {
						$(this).addClass("mOn");
					}
				});
				$(":input").on("focusout", function () {
					$(this).removeClass("mbOn");
					$(this).removeClass("mOn");
				});
				$('.ca').on('change', function () {
					var cSel = eval($(this).data('value') + 1);
					_BT.CategSearch.clearSelect(cSel);
					_BT.CategSearch.makeSelect(cSel, $(this).val());
				});
				$(".payment").on("click", function () {
					$(".payment").removeClass("mOn2");
					$(".payment").removeClass("mOn2_1");
					if ($(this).attr("id") == 'KeyIn') {
						$(this).addClass("mOn2_1");
					} else {
						$(this).addClass("mOn2");
					}
					$("#payTp").val($(this).attr("id"));
				});
				$('.sButton').click(function () {
					doAction($(this).data('type'), $(this).data('value'));
				});
				$('#dlvyPay').on('change', function () {
					setPrice();
				});
				$("#mobile2").on("keyup", function () {
					mobile2 = false;
					var value = $(this).val();
					var regExp = /[^0-9]/gi;
					if (regExp.test(value)) {
						$(this).val(value.replace(regExp, ""));
						$(this).focus();
					} else {
						if ($(this).val().length >= 3) {
							mobile2 = true;
							if ($(this).val().length == 4) {
								$("#mobile3").focus();
							}
						} else {
							$(this).focus();
						}
						checkMobile();
					}
				});
				$("#mobile3").on("keyup", function () {
					mobile3 = false;
					var value = $(this).val();
					var regExp = /[^0-9]/gi;
					if (regExp.test(value)) {
						$(this).val(value.replace(regExp, ""));
						$(this).focus();
					} else {
						if ($(this).val().length == 4) {
							mobile3 = true;
						}
					}
					checkMobile();
				});
				_BT.Reg.Number("number");
				_BT.setOnEnter("mValue", "itemSearch");
				_BT.setOnEnter("mName", "itemSearch");
				_BT.setOnEnter("mBrand", "itemSearch");
				_BT.setOnEnter("mStndrd", "itemSearch");
				_BT.setOnEnter("mModel", "itemSearch");
				_BT.setOnEnter("mCode", "itemSearch");

				initSheet();
				initSelect();
				chekcCart();
			});
			function initSelect() {
				_BT.CategSearch.makeSelect('1');
				_BT.CategSearch.makeSelect('Pm');
			}
			function initSheet() {
				var initData = {};
				initData.Cfg = {
					'AutoFitColWidth': 'search|resize|init|colhidden|rowtransaction'
					, 'UseHeaderSortCancel': 1
					, 'MergeSheet': 9
					, 'DeferredVScroll': 1
					, 'Page': 1500
					, 'AutoSumCalcMode': 1
					, 'SelectionSummary': 'NotEmptyCell'
				};
				initData.HeaderMode = {};

				initData.Cols = [
					{ 'Header': '구분', 'Type': 'Seq', 'MinWidth': 0, 'SaveName': 'sSeq', 'Align': 'Center', 'Hidden': isDev }
					, { 'Header': '상태', 'Type': 'Status', 'MinWidth': 0, 'SaveName': 'sStatus', 'Align': 'Center', 'Hidden': isDev }
					, { 'Header': '선택', 'Type': 'CheckBox', 'Width': 30, 'SaveName': 'sCheckBox', 'Align': 'Center', 'Edit': 1, 'ColMerge': 0 }
					, { 'Header': '품절', 'Type': 'Text', 'MinWidth': 40, 'SaveName': 'SOLDOUT_AT', 'Align': 'Center', 'Edit': 0 }
					, { 'Header': '재입고', 'Type': 'Date', 'MinWidth': 40, 'SaveName': 'RE_SALE_DT', 'Align': 'Center', 'Edit': 0, 'Format': 'Ymd' }
					, { 'Header': '품목코드', 'Type': 'Text', 'MinWidth': 60, 'SaveName': 'sPcd', 'Align': 'Center', 'Edit': 0 }
					, { 'Header': '규격코드', 'Type': 'Text', 'MinWidth': 60, 'SaveName': 'sScd', 'Align': 'Center', 'Edit': 0 }
					, { 'Header': '카테고리', 'Type': 'Text', 'MinWidth': 100, 'SaveName': 'sCnm', 'Align': 'Left', 'Edit': 0 }
					, { 'Header': '품명', 'Type': 'Text', 'MinWidth': 100, 'SaveName': 'sNm', 'Align': 'Left', 'Edit': 0 }
					, { 'Header': '규격', 'Type': 'Text', 'MinWidth': 100, 'SaveName': 'sSt', 'Align': 'Left', 'Edit': 0 }
					, { 'Header': '모델명', 'Type': 'Text', 'MinWidth': 60, 'SaveName': 'sMd', 'Align': 'Left', 'Edit': 0 }
					, { 'Header': '제조사', 'Type': 'Text', 'MinWidth': 60, 'SaveName': 'sMk', 'Align': 'Left', 'Edit': 0 }
					, { 'Header': '판매단위', 'Type': 'Int', 'Width': 30, 'SaveName': 'OUT_AMT', 'Align': 'Right', 'Edit': 0, 'Format': 'Integer' }
					, { 'Header': '판매단위', 'Type': 'Text', 'Width': 30, 'SaveName': 'OUT_UNIT', 'Align': 'Center', 'Edit': 0 }
					, { 'Header': '판매가', 'Type': 'Int', 'MinWidth': 50, 'SaveName': 'sPrice', 'Align': 'Right', 'Edit': 0, 'Format': 'Integer' }
					, { 'Header': '원공급사', 'Type': 'Text', 'MinWidth': 40, 'SaveName': 'ORG_CMP_CD', 'Align': 'Center', 'Hidden': isDev }
					, { 'Header': '카탈로그', 'Type': 'Button', 'MinWidth': 40, 'SaveName': 'EBOOK_IMG_NO', 'Align': 'Center' }
					, { 'Header': '품목정보', 'Type': 'Button', 'MinWidth': 40, 'SaveName': 'PRDT_INFO', 'Align': 'Center', 'DefaultValue': '제품정보' }

				];
				// IBSheet 생성
				createIBSheet2($('#ib-container2')[0], 'mySheet2', '100%', '200px');
				IBS_InitSheet(mySheet2, initData);

				initData.Cols = [
					{ 'Header': '구분', 'Type': 'Seq', 'MinWidth': 0, 'SaveName': 'sSeq', 'Align': 'Center', 'Save': 0, 'Hidden': isDev }
					, { 'Header': '상태', 'Type': 'Status', 'MinWidth': 0, 'SaveName': 'sStatus', 'Align': 'Center', 'Save': 1, 'Hidden': isDev }
					, { 'Header': '선택', 'Type': 'CheckBox', 'MinWidth': 40, 'SaveName': 'sCheck', 'Align': 'Center', 'Save': 1, 'Edit': 1, 'ColMerge': 0 }
					, { 'Header': '품절', 'Type': 'Text', 'MinWidth': 40, 'SaveName': 'SOLDOUT_AT', 'Align': 'Center', 'Save': 0, 'Edit': 0 }
					, { 'Header': '재입고', 'Type': 'Date', 'MinWidth': 40, 'SaveName': 'RE_SALE_DT', 'Align': 'Center', 'Save': 0, 'Edit': 0, 'Format': 'Ymd' }
					, { 'Header': '규격코드', 'Type': 'Text', 'MinWidth': 60, 'SaveName': 'sScd', 'Align': 'Center', 'Save': 1, 'Edit': 0 }
					, { 'Header': '품명', 'Type': 'Text', 'MinWidth': 100, 'SaveName': 'sNm', 'Align': 'Left', 'Save': 0, 'Edit': 0 }
					, { 'Header': '규격', 'Type': 'Text', 'MinWidth': 130, 'SaveName': 'sSt', 'Align': 'Left', 'Save': 0, 'Edit': 0 }
					, { 'Header': '제조사', 'Type': 'Text', 'MinWidth': 40, 'SaveName': 'sMk', 'Align': 'Center', 'Save': 0, 'Edit': 0 }
					, { 'Header': '판매단위', 'Type': 'Int', 'Width': 30, 'SaveName': 'OUT_AMT', 'Align': 'Right', 'Save': 0, 'Edit': 0, 'Format': 'Integer' }
					, { 'Header': '판매단위', 'Type': 'Text', 'Width': 30, 'SaveName': 'OUT_UNIT', 'Align': 'Center', 'Save': 0, 'Edit': 0 }
					, { 'Header': '판매가', 'Type': 'Int', 'MinWidth': 50, 'SaveName': 'sPrice', 'Align': 'Right', 'Save': 0, 'Edit': 0, 'Format': 'Integer' }
					, { 'Header': '수량', 'Type': 'Int', 'MinWidth': 50, 'SaveName': 'sQty', 'Align': 'Right', 'Save': 1, 'Edit': 1, 'Format': 'Integer', 'DefaultValue': '1', 'KeyField': 1 }
					, { 'Header': '금액', 'Type': 'Int', 'MinWidth': 50, 'SaveName': 'sSum', 'Align': 'Right', 'Save': 0, 'Edit': 0, 'Format': 'Integer', 'CalcLogic': '|sQty|*|sPrice|', 'Format': '#,###\\원' }
					, { 'Header': '품목코드', 'Type': 'Text', 'MinWidth': 60, 'SaveName': 'sPcd', 'Align': 'Center', 'Save': 1, 'Hidden': isDev }
					, { 'Header': '공급사', 'Type': 'Text', 'MinWidth': 60, 'SaveName': 'STORE_ID', 'Align': 'Center', 'Save': 0, 'Hidden': isDev }
					, { 'Header': '카테고리', 'Type': 'Text', 'MinWidth': 60, 'SaveName': 'sCcd', 'Align': 'Center', 'Save': 0, 'Hidden': isDev }
					, { 'Header': '원공급사', 'Type': 'Text', 'MinWidth': 40, 'SaveName': 'ORG_CMP_CD', 'Align': 'Center', 'Save': 0, 'Hidden': isDev }
					, { 'Header': '재고정보', 'Type': 'Button', 'MinWidth': 40, 'SaveName': 'STOCK', 'Align': 'Center', 'DefaultValue': '재고확인' }
				];

				// IBSheet 생성
				createIBSheet2($('#ib-container3')[0], 'mySheet3', '100%', '200px');
				IBS_InitSheet(mySheet3, initData);

				initData.Cols = [
					{ 'Header': '구분', 'Type': 'Seq', 'MinWidth': 0, 'SaveName': 'sSeq', 'Align': 'Center', 'Save': 0, 'Hidden': isDev }
					, { 'Header': '상태', 'Type': 'Status', 'MinWidth': 0, 'SaveName': 'sStatus', 'Align': 'Center', 'Save': 1, 'Hidden': isDev }
					, { 'Header': '선택', 'Type': 'CheckBox', 'MinWidth': 40, 'SaveName': 'sCheck', 'Align': 'Center', 'Save': 1, 'Edit': 1, 'ColMerge': 0 }
					, { 'Header': '품절', 'Type': 'Text', 'MinWidth': 40, 'SaveName': 'SOLDOUT_AT', 'Align': 'Center', 'Save': 0, 'Edit': 0 }
					, { 'Header': '재입고', 'Type': 'Date', 'MinWidth': 40, 'SaveName': 'RE_SALE_DT', 'Align': 'Center', 'Save': 0, 'Edit': 0, 'Format': 'Ymd' }
					, { 'Header': '규격코드', 'Type': 'Text', 'MinWidth': 60, 'SaveName': 'PRDT_DTL_CD', 'Align': 'Center', 'Save': 1, 'Edit': 0 }
					, { 'Header': '제조사', 'Type': 'Text', 'MinWidth': 40, 'SaveName': 'MAKR_NM', 'Align': 'Center', 'Save': 0, 'Edit': 0 }
					, { 'Header': '품명', 'Type': 'Text', 'MinWidth': 100, 'SaveName': 'PRDT_NM', 'Align': 'Left', 'Save': 0, 'Edit': 0 }
					, { 'Header': '규격', 'Type': 'Text', 'MinWidth': 130, 'SaveName': 'STNDRD', 'Align': 'Left', 'Save': 0, 'Edit': 0 }
					, { 'Header': '판매가', 'Type': 'Int', 'MinWidth': 50, 'SaveName': 'SEL_PRICE', 'Align': 'Right', 'Save': 0, 'Edit': 0, 'Format': 'Integer' }
					, { 'Header': '수량', 'Type': 'Int', 'MinWidth': 50, 'SaveName': 'QY', 'Align': 'Right', 'Save': 1, 'Edit': 1, 'Format': 'Integer', 'DefaultValue': '1', 'KeyField': 1 }
					, { 'Header': '금액', 'Type': 'Int', 'MinWidth': 50, 'SaveName': 'TOT_PRICE', 'Align': 'Right', 'Save': 0, 'Edit': 0, 'Format': 'Integer', 'CalcLogic': '|QY|*|SEL_PRICE|', 'Format': '#,###\\원' }

					, { 'Header': '배송구분', 'Type': 'Text', 'MinWidth': 60, 'SaveName': 'DLVY_MEG', 'Align': 'Center', 'Save': 0, 'Hidden': isDev }
					, { 'Header': '배송비', 'Type': 'Int', 'MinWidth': 60, 'SaveName': 'DLVY_FEE', 'Align': 'Center', 'Save': 0, 'Hidden': isDev, 'Format': 'Integer' }
					, { 'Header': '품목코드', 'Type': 'Text', 'MinWidth': 60, 'SaveName': 'PRDT_CD', 'Align': 'Center', 'Save': 1, 'Hidden': isDev }
					, { 'Header': '공급사', 'Type': 'Text', 'MinWidth': 60, 'SaveName': 'STORE_ID', 'Align': 'Center', 'Save': 0, 'Hidden': isDev }
					, { 'Header': '카테고리', 'Type': 'Text', 'MinWidth': 60, 'SaveName': 'CATEG_CD', 'Align': 'Center', 'Save': 0, 'Hidden': isDev }

					, { 'Header': '무료배송여부', 'Type': 'Text', 'Width': 40, 'SaveName': 'FREE_DLVY', 'Align': 'Center', 'Save': 0, 'Hidden': isDev }
					, { 'Header': '무료배송금액', 'Type': 'Int', 'Width': 40, 'SaveName': 'FREE_AMT', 'Align': 'Center', 'Save': 0, 'Hidden': isDev }
					, { 'Header': '도서산간추가여부', 'Type': 'Text', 'Width': 40, 'SaveName': 'EXTRA_FEE_TP', 'Align': 'Center', 'Save': 0, 'Hidden': isDev }
					, { 'Header': '도서산간', 'Type': 'Int', 'Width': 40, 'SaveName': 'T_ZONE1', 'Align': 'Center', 'Save': 0, 'Hidden': isDev }
					, { 'Header': '제주도', 'Type': 'Int', 'Width': 40, 'SaveName': 'T_ZONE2', 'Align': 'Center', 'Save': 0, 'Hidden': isDev }
				];

				// IBSheet 생성
				createIBSheet2($('#ib-container1')[0], 'mySheet1', '100%', '300px');
				IBS_InitSheet(mySheet1, initData);

				// 편집 가능 여부 설정
				mySheet1.SetEditable(1);
				mySheet2.SetEditable(1);
				mySheet3.SetEditable(1);

				//마우스오버
				mySheet1.SetMouseHoverMode(2)
				mySheet2.SetMouseHoverMode(2)
				mySheet3.SetMouseHoverMode(2)

				// 사이즈 맞춤
				mySheet1.FitColWidth();
				mySheet2.FitColWidth();
				mySheet3.FitColWidth();
			}


			function doAction(sAction, tar) {
				switch (sAction) {
					case 'clean':
						if (3 == tar) {
							mySheet3.RemoveAll();
						}
						break;
					case 'view':
						if (0 == tar) {
							$('#searchDiv').addClass('vOff');
						} else if (1 == tar) {
							$('#searchDiv').removeClass('vOff');
						}
						break;
					case 'search':     //검색
						var sheet = eval('mySheet' + tar);
						if (0 == tar) {
							if (_BT.isEmptyById('mobile', '휴대폰 번호를 입력해 주세요.')) return false;
							if (dupClick1) {
								alert('고객정보 조회중 입니다.\n\n잠시만 기다려주세요.');
								return false;
							}
							searchMobile($('#mobile').val());
						} else if (1 == tar) {
							if ($('#usrId').val() != '') {
								sheet.DoSearch(_BT.FRONT.URL.Customer.SheetUsrCart, $('#arsFrm').serialize());
							}
						} else if (2 == tar) {
							if (
								($('#ca3').val() == '' || $('#ca3').val() == 'C9999')
								&& $('#mValue').val() == ''
							) {
								alert('3단계 이상 카테고리 선택 또는 검색어는 필수 사항 입니다.');
								break;
							}
							sheet.DoSearch(_BT.FRONT.URL.Search.SheetPrdDtltList, $('#sheetFrm2').serialize());
						}
						break;
					case 'add':
						var sheet = eval('mySheet' + tar);
						if (3 == tar) {
							var opt = { UrlEncode: 0, Mode: 1 };
							var SaveStr = mySheet2.GetSaveJson(opt);
							if (SaveStr.data.length < 1) {
								alert('선택 내역이 없습니다.\n\n다시 확인 부탁 드립니다.');
								break;
							}
							sheet.LoadSearchData(SaveStr, { Sync: 1, Append: 1 });
							mySheet2.CheckAll('sCheckBox', 0);
						}
						break;
					case 'del':
						var sheet = eval('mySheet' + tar);
						if (1 == tar) {
							var sRow = sheet.FindCheckedRow('sCheck').split('|');
							if (sRow == '') { alert('선택 내역이 없습니다.\n\n장바구니에서 삭제하실 상품을 선택해 주세요.'); return false; }
							var opt = { UrlEncode: 0, Mode: 2, Delim: '#' };
							var SaveStr = sheet.GetSaveString(opt);
							if ('' == SaveStr) {
								alert('장바구니에서 삭제하실 상품을 선택해 주세요.');
								return false;

							} else if ('KeyFieldError' == SaveStr) {
								return false;

							} else {
								if (!confirm('장바구니에 상품을 삭제 하시겠습니까?')) return false;
								var rtnData = sheet.GetSaveData(_BT.FRONT.URL.Customer.DelUsrCart, SaveStr + '&usrId=' + $('#usrId').val());
								sheet.LoadSaveData(rtnData);
							}
						}
						break;
					case 'save':     	//저장
						if (0 == tar) {
							if (dupClick1) {
								alert('고객정보 등록중 입니다.\n\n잠시만 기다려주세요.');
								return false;
							}
							if (_BT.isEmptyById('mobile2', '휴대폰 번호를 입력해 주세요.')) return false;
							if (_BT.isEmptyById('mobile3', '휴대폰 번호를 입력해 주세요.')) return false;
							if (_BT.isEmptyById('usrNm', '고객명을 입력해 주세요.')) return false;
							var mobileNo = _BT.getJoinData('-', new Array('mobile1', 'mobile2', 'mobile3'));
							$('#mobileNo').val(mobileNo);

							var shaObj = new jsSHA(mobileNo, 'ASCII');
							$('#shaPw').val(shaObj.getHash('SHA-256', 'HEX'));

							dupClick1 = true;
							_BT.ajaxCallbackSubmit('arsFrm', _BT.FRONT.URL.Customer.SetArsUsr,
								function (data) {
									dupClick1 = false;
									if (_BT.isEquals(data.code, 'success')) {
										$('#usrTxt').text(data.usrId);
										$('#usrId').val(data.usrId);
										if (_BT.isEmptyById('email')) {
											$('#email').val('ars@selltool.kr');
										}
									} else {
										alert('등록중 오류가 발생 했습니다.\n\n다시 확인 바랍니다.');
									}
								},
								function (xhr, status, error) {
									alert('시스템과 통신중 오류가 발생 했습니다.\n\n다시 확인 바랍니다.');
									dupClick1 = false;
								});
						} else if (1 == tar) {
							var sRow = mySheet1.FindCheckedRow('sCheck').split('|');
							if (sRow == '') { alert('선택 내역이 없습니다.\n\n수량 변경 하실 상품을 선택해 주세요.'); return false; }
							var opt = { UrlEncode: 0, Mode: 2, Delim: '#' };
							var SaveStr = mySheet1.GetSaveString(opt);
							if ('' == SaveStr) {
								alert('수량 변경 하실 상품을 선택해 주세요.');
								return false;

							} else if ('KeyFieldError' == SaveStr) {
								return false;

							} else {
								if (!confirm('수량 변경 하시겠습니까?')) return false;
								var rtnData = mySheet1.GetSaveData(_BT.FRONT.URL.Customer.UptUsrCart, SaveStr + '&usrId=' + $('#usrId').val());
								mySheet1.LoadSaveData(rtnData);
							}
						} else if (3 == tar) {
							var sRow = mySheet3.FindCheckedRow('sCheck').split('|');
							if (sRow == '') { alert('선택 내역이 없습니다.\n\n장바구니에 담으실 상품을 선택해 주세요.'); return false; }

							var opt = { UrlEncode: 0, Mode: 2, Delim: '#' };
							var SaveStr = mySheet3.GetSaveString(opt);
							if ('' == SaveStr) {
								alert('장바구니에 담으실 상품을 선택해 주세요.');
								return false;
							} else if ('KeyFieldError' == SaveStr) {
								return false;
							} else {
								if (!confirm('장바구니에 상품을 담으시겠습니까?')) return false;
								var rtnData = mySheet3.GetSaveData(_BT.FRONT.URL.Customer.SetUsrCart, SaveStr + '&usrId=' + $('#usrId').val());
								mySheet3.LoadSaveData(rtnData);
							}
						}
						break;

					case 'pay':     	//저장
						if (dupClick1) {
							alert('처리중 입니다. 잠시만 기다려주세요.');
							return false;
						}
						if ($('#sumTot').val() < 1) { alert('결제할 내역이 없습니다.'); return false; }
						if (_BT.isEmptyById('zipCode', '배송지정보를 입력해 주세요.')) return false;
						if (_BT.isEmptyById('payTp', '결제방법을 선택해 주세요.')) return false;
						if ($('#payTp').val() == 'KeyIn') {
							if (!confirm('수기결제후 발생할수 있는 민원에 대해 요청자에게 책임이 있습니다.\n\n상품을 주문 하시겠습니까?')) {
								return false;
							}
						} else {
							if (!confirm('상품을 주문 하시겠습니까?')) {
								return false;
							}
						}
						$('#mobileNo').val(_BT.getJoinData('-', new Array('mobile1', 'mobile2', 'mobile3')));
						var sRow = mySheet1.FindCheckedRow('sCheck').split('|');
						if (sRow == '') { alert('결제할 내역이 없습니다.\n\n주문하실 상품을 선택해 주세요.'); return false; }

						var opt = { UrlEncode: 0, Mode: 2, Delim: '#' };
						var SaveStr = mySheet1.GetSaveString(opt);

						$('#arsPayFrm').empty();
						var tmp = SaveStr.split('&');
						for (var i = 0; i < tmp.length; i++) {
							var map = tmp[i].split('=');
							$('<input></input>').attr({ type: 'hidden', id: map[0], name: map[0], value: map[1] }).appendTo($('#arsPayFrm'));
						}
						$('#payFrm input').each(function (i) {
							$(this).clone().appendTo('#arsPayFrm');
						});
						$('#arsFrm input').each(function (i) {
							$(this).clone().appendTo('#arsPayFrm');
						});
						_BT.actFormSubmit('arsPayFrm', 'POST', _BT.FRONT.URL.Customer.DoPay);
						break;
				}
			}

			function chekcCart() {
				if ($('#usrId').val() != '') {
					doAction('search', '1');
				}
			}

			function checkMobile() {
				if (mobile2 && mobile3) {
					var mobileNo = _BT.getJoinData('-', new Array('mobile1', 'mobile2', 'mobile3'));
					searchMobile(mobileNo);
				}
			}

			function searchMobile(mNum) {
				if (dupClick1) {
					alert('고객정보 조회중 입니다.\n\n잠시만 기다려주세요.');
					return false;
				}
				dupClick1 = true;
				_BT.ajaxDataSubmit('post', _BT.FRONT.URL.Search.GetArsUsrInfo, {
					mobile: mNum
				}, function (data) {
					dupClick1 = false;
					if (_BT.isEquals(data.code, 'success')) {
						if (_BT.isEmpty(data.userInfo)) {
							$('#usrTxt').text('비회원 입니다.');
							mySheet1.RemoveAll();
						} else {
							$('#usrTxt').text(data.userInfo.USR_ID);
							$('#usrId').val(data.userInfo.USR_ID);
							$('#usrNm').val(data.userInfo.USR_NM);
							$('#email').val(data.userInfo.EMAIL);
							doAction('search', '1');
						}
					} else {
						alert('조회중 오류가 발생 했습니다.\n\n다시 확인 바랍니다.');
					}
				},
					function (xhr, status, error) {
						dupClick1 = false;
					});
			}

			function fnMngAddr() {
				if (_BT.isEmptyById('usrId', '회원정보 조회 후 사용가능')) return false;
				_BT.openPopup(_BT.FRONT.URL.Customer.ArsAddrPop + '?usrId=' + $('#usrId').val(), 'fnMngAddr', '610', '700', true, true);
			}

			function mySheet1_OnRowSearchEnd(row) {
				if (mySheet1.GetCellValue(row, 'SOLDOUT_AT') == 'Y') {
					mySheet1.SetRowFontColor(row, '#FF0000');
				}
			}

			function mySheet2_OnRowSearchEnd(row) {
				if (mySheet2.GetCellValue(row, 'SOLDOUT_AT') == 'Y') {
					mySheet2.SetRowFontColor(row, '#FF0000');
				}
			}

			function mySheet3_OnRowSearchEnd(row) {
				if (mySheet3.GetCellValue(row, 'SOLDOUT_AT') == 'Y') {
					mySheet3.SetRowFontColor(row, '#FF0000');
				}
			}

			function mySheet2_OnButtonClick(Row, Col) {
				var sSaveName = mySheet2.ColSaveName(0, Col);
				if (sSaveName == 'EBOOK_IMG_NO') {
					var EBOOK = mySheet2.GetCellValue(Row, 'EBOOK_IMG_NO');
					_BT.openPopup(_BT.FRONT.URL.Search.ImgPop + '?imgTp=CA&code=' + EBOOK, 'ImgPop', '750', '1100', true, true);

				} else if (sSaveName == 'PRDT_INFO') {
					var PRDT_CD = mySheet2.GetCellValue(Row, 'sPcd');
					_BT.openPopup(_BT.SHOP.URL.Search.View + '?pCode=' + PRDT_CD, 'PRDT_CD', '1400', '800', 'yes', 'yes');
				}
			}

			function mySheet3_OnButtonClick(Row, Col) {
				var sSaveName = mySheet3.ColSaveName(0, Col);
				if (sSaveName == 'STOCK') {
					$('#CODE').val(mySheet3.GetCellValue(Row, 'sScd'));
					$('#NAME').val(mySheet3.GetCellValue(Row, 'sNm'));
					$('#STNDRD').val(mySheet3.GetCellValue(Row, 'sSt'));
					$('#MAKER').val(mySheet3.GetCellValue(Row, 'sMk'));
					$('#SUPPLY').val(mySheet3.GetCellValue(Row, 'ORG_CMP_CD'));
					_BT.openPopup('', 'stockPop', '1270', '800', true, true);
					$('#stockFrm').attr('method', 'POST').attr('target', 'stockPop').attr('action', _BT.FRONT.URL.Common.PopPwS).submit();
				}
			}

			function mySheet3_OnSaveEnd(code) {
				if (code == 1) {
					alert('처리완료 하였습니다.');
					doAction('search', '1');
				} else {
					alert('처리중 오류가 발생했습니다.\n\n다시 확인 부탁 드립니다.');
				}
			}

			function mySheet1_OnSaveEnd(code, Msg, StCode, StMsg, Response) {
				if (code == 1) {
					alert('처리완료 하였습니다.');
					doAction('search', '1');
				} else if (code == 9) {
					console.log(code);
					console.log(Msg);
					console.log(StCode);
					console.log(StMsg);
					console.log(Response);

				} else {
					alert('처리중 오류가 발생했습니다.\n\n다시 확인 부탁 드립니다.');
				}
			}

			function mySheet1_OnChange(Row, Col, Value) {
				var sSaveName = mySheet1.ColSaveName(0, Col);
				if (sSaveName == 'sCheck') {
					setPrice();
				}
			}

			function fnSetAddr(obj) {
				for (var i = 0; i < obj.length; i++) {
					if (obj[i].name == 'zoneTp') zoneTp = obj[i].value;
					$('#' + obj[i].name).val(obj[i].value);
				}
				setPrice();
				/* 			
							
							var zoneTp = 0;
							for(var i=0; i<obj.length; i++){
								if(obj[i].name == 'zoneTp') zoneTp = obj[i].value;
								$('#'+obj[i].name).val(obj[i].value);
							}
							$('#sumDlvyFee').val(0);
							
							var freeDlvy = $('#freeDlvy_'+x).val();
							var freeAmt = eval($('#freeAmt_'+x).val());
							var totPrice = eval($('#totPrice_'+x).val());
							var extraFeeTp = $('#extraFeeTp_'+x).val();
							var isFree = (freeDlvy == 'Y' && totPrice > freeAmt) ? true : false;
							if(!isFree){
								var dlvyFee = eval($('#dlvyFee_'+x).val());
								var extDlvyFee = 0;
								if('Y' == extraFeeTp){
									if(zoneTp == 0){
										extDlvyFee = 0;
									}else if(zoneTp ==1){
										extDlvyFee = eval($('#tZone1_'+x).val());
									}else if(zoneTp ==2){
										extDlvyFee = eval($('#tZone2_'+x).val());
									}
								}
								var dlvy = (dlvyFee + extDlvyFee);
								$('#sumDlvyFee').val(eval($('#sumDlvyFee').val()) + dlvy);
								
								dlvy = dlvy + '';
								var sum = (totPrice + dlvyFee + extDlvyFee)+'';
								$('#dlvyFeeT_'+x).val(dlvy);
								$('#dlvyFeeTxt_'+x).text(dlvy.replace(/(\d)(?=(\d\d\d)+(?!\d))/g, '$1,')+'');
								$('#sumPriceTxt_'+x).text(sum.replace(/(\d)(?=(\d\d\d)+(?!\d))/g, '$1,')+'');
							}
							var sumDlvyFee = $('#sumDlvyFee').val();
							var sumTot = eval($('#sumPrice').val()) + eval($('#sumDlvyFee').val())+'';
							$('#sumDlvyFeeTxt').text(sumDlvyFee.replace(/(\d)(?=(\d\d\d)+(?!\d))/g, '$1,')+'');
							$('#sumTotTxt').text(sumTot.replace(/(\d)(?=(\d\d\d)+(?!\d))/g, '$1,')+'');
							
				 */
			}

			function setPrice() {
				var zoneTp = $('#zoneTp').val();
				var sum_price = 0;
				var pak_price = 0;
				var pak_dlvy_fee = 0;
				var otr_dlvy_fee = 0;
				var extra_dlvy_fee = 0;

				var freeDlvy = 'T';
				var extraFeeTp = 'T';
				var freeAmt = 0;
				var tZone1 = 0;
				var tZone2 = 0;

				var dlvyPay = $('#dlvyPay option:selected').val();

				var sRow = mySheet1.FindCheckedRow('sCheck').split('|');
				if (sRow != '') {
					for (var i = 0; i < sRow.length; i++) {
						var TOT_PRICE = eval(mySheet1.GetCellValue(sRow[i], 'TOT_PRICE'));
						var DLVY_MEG = eval(mySheet1.GetCellValue(sRow[i], 'DLVY_MEG'));
						var DLVY_FEE = eval(mySheet1.GetCellValue(sRow[i], 'DLVY_FEE'));
						if (freeDlvy == 'T') {
							extraFeeTp = mySheet1.GetCellValue(sRow[i], 'EXTRA_FEE_TP');
							freeDlvy = mySheet1.GetCellValue(sRow[i], 'FREE_DLVY');
							freeAmt = eval(mySheet1.GetCellValue(sRow[i], 'FREE_AMT'));
							tZone1 = eval(mySheet1.GetCellValue(sRow[i], 'T_ZONE1'));
							tZone2 = eval(mySheet1.GetCellValue(sRow[i], 'T_ZONE2'));

							if (extraFeeTp == 'Y') {
								if (zoneTp == '1') {
									extra_dlvy_fee = tZone1;
								} else if (zoneTp == '2') {
									extra_dlvy_fee = tZone2;
								}
							}
						}
						sum_price += TOT_PRICE;
						if (DLVY_MEG == '1') {
							pak_price += TOT_PRICE;
							if (pak_dlvy_fee < DLVY_FEE) {
								pak_dlvy_fee = (DLVY_FEE + extra_dlvy_fee);
							}
						} else {
							otr_dlvy_fee += (DLVY_FEE + extra_dlvy_fee);
						}
					}
				}
				if (freeDlvy == 'Y' && pak_price > freeAmt) {
					pak_dlvy_fee = 0;
				}
				if (dlvyPay != '1') {
					pak_dlvy_fee = 0;
					otr_dlvy_fee = 0;
				}

				$('#sumPrice').val(sum_price);
				$('#sumDlvyFee').val(pak_dlvy_fee + otr_dlvy_fee);
				$('#sumTot').val(sum_price + pak_dlvy_fee + otr_dlvy_fee);

				var sumTxt = $('#sumPrice').val() + '';
				var dlvyTxt = $('#sumDlvyFee').val() + '';
				var amtTxt = $('#sumTot').val() + '';

				$('#sumPriceTxt').text(sumTxt.replace(/(\d)(?=(\d\d\d)+(?!\d))/g, '$1,'));
				$('#sumDlvyFeeTxt').text(dlvyTxt.replace(/(\d)(?=(\d\d\d)+(?!\d))/g, '$1,'));
				$('#sumTotTxt').text(amtTxt.replace(/(\d)(?=(\d\d\d)+(?!\d))/g, '$1,'));
			}

			function fnClose() {
				window.close();
			}
		</script>
		<!-- 팝업창 시작 -->
		<div class="gray_title" style="position:fixed;z-index:300;top:0px;right:0;width:100%;height:40px;">
			<span style="float:left;color:#3f51b5; font-weight: 700;">DAEHWA - ARS주문</span>
			<div style="padding-top:5px;">
				<span data-type="pay" data-value="0" class="sButton btn_span fs-13 pink marginleft_5 marginright_60"
					style="float: right;">결제요청</span>
				<span data-type="save" data-value="0" class="sButton btn_span fs-13 blue marginleft_40"
					style="float: right;">고객등록</span>
				<span data-type="view" data-value="0" class="sButton btn_span fs-13 green marginleft_5"
					style="float: right;">화면접기</span>
				<span data-type="view" data-value="1" class="sButton btn_span fs-13 blue marginleft_5"
					style="float: right;">화면펴기</span>
			</div>
			<span class="close" onclick="fnClose();"></span>
		</div>
		<form id="stockFrm" name="stockFrm" style="display: none;">
			<input type="hidden" id="CODE" name="CODE" value="" />
			<input type="hidden" id="NAME" name="NAME" value="" />
			<input type="hidden" id="STNDRD" name="STNDRD" value="" />
			<input type="hidden" id="MAKER" name="MAKER" value="" />
			<input type="hidden" id="SUPPLY" name="SUPPLY" value="" />
		</form>
		<form id="arsPayFrm" name="arsPayFrm" style="display: none;"></form>
		<div style="width:98%;margin:50px auto 10px auto;" class="print_content">
			<h1 style="text-align: center;color: #3f51b5;font-size: 22px;margin:20px 0;font-weight: bold;">
				주&nbsp;&nbsp;문&nbsp;&nbsp;서&nbsp;&nbsp;작&nbsp;&nbsp;성
			</h1>
			<div class="margintop_10">
				<form id="arsFrm" name="arsFrm">
					<table class="tbl_Type02">
						<caption>조회</caption>
						<colgroup>
							<col width="10%">
							<col width="40%">
							<col width="10%">
							<col width="40%">
						</colgroup>
						<tbody>
							<tr>
								<th style="border-left: 2px solid #3f51b5;border-top: 2px solid #3f51b5;">
									고객번호
								</th>
								<td style="padding-left:0;text-align:center;border:1px solid #d8d8d8;border-top: 2px solid #3f51b5;">
									<span class="c13_01_03_txt_01" id="usrTxt">
										<c:choose>
											<c:when test="${! empty userInfo.USR_ID and '' ne userInfo.USR_ID}">
												<c:out value="${userInfo.USR_ID}" />
											</c:when>
											<c:otherwise>
												비회원 고객 입니다.
											</c:otherwise>
										</c:choose>
									</span>
									<input type="text" class="join_form_input03" id="mobile" name="mobile" style="border:0;"
										readonly="readonly" value="<c:out value=" ${pageParm.mobile}" />"/>
									<input type="hidden" id="usrId" name="usrId" value="<c:out value=" ${userInfo.USR_ID}" />"/>
									<input type="hidden" id="shaPw" name="shaPw" value="" />
									<input type="hidden" id="mobileNo" name="mobileNo" value="" />
								</td>
								<th style="border-top: 2px solid #3f51b5;">
									휴대폰<span style="color: red;"> (필수)</span>
								</th>
								<td style="border:1px solid #d8d8d8;border-top: 2px solid #3f51b5;border-right: 2px solid #3f51b5;">
									<select name="mobile1" id="mobile1" class="join_form_select02 mobile">
										<option value="010" <c:if test="${fn:split(userInfo.MOBILE,'-')[0] eq '010'}">selected="selected"
											</c:if>>010</option>
										<option value="011" <c:if test="${fn:split(userInfo.MOBILE,'-')[0] eq '011'}">selected="selected"
											</c:if>>011</option>
										<option value="016" <c:if test="${fn:split(userInfo.MOBILE,'-')[0] eq '016'}">selected="selected"
											</c:if>>016</option>
										<option value="017" <c:if test="${fn:split(userInfo.MOBILE,'-')[0] eq '017'}">selected="selected"
											</c:if>>017</option>
										<option value="018" <c:if test="${fn:split(userInfo.MOBILE,'-')[0] eq '018'}">selected="selected"
											</c:if>>018</option>
										<option value="019" <c:if test="${fn:split(userInfo.MOBILE,'-')[0] eq '019'}">selected="selected"
											</c:if>>019</option>
									</select>
									<span class="join_form_txt">-</span>
									<input type="text" name="mobile2" id="mobile2" class="join_form_input01 mobile" maxlength="4" size="4"
										value="${fn:split(userInfo.MOBILE,'-')[1]}" />
									<span class="join_form_txt">-</span>
									<input type="text" name="mobile3" id="mobile3" class="join_form_input01 mobile" maxlength="4" size="4"
										value="${fn:split(userInfo.MOBILE,'-')[2]}" />
									<div style="margin-top:5px; ">
										<span style="color: red;">※ 휴대폰 번호로 고객조회 & 고객등록</span>
									</div>
								</td>
							</tr>
							<tr>
								<th style="border-left: 2px solid #3f51b5;border-bottom: 2px solid #3f51b5;">
									고객명<span style="color: red;"> (필수)</span>
								</th>
								<td style="border:1px solid #d8d8d8;border-bottom: 2px solid #3f51b5;">
									<input type="text" class="join_form_input03" id="usrNm" name="usrNm" maxlength="20" placeholder="고객명"
										value="<c:out value=" ${userInfo.USR_NM}" />"/>
								</td>
								<th style="border-bottom: 2px solid #3f51b5;">
									이메일
								</th>
								<td style="border:1px solid #d8d8d8;border-bottom: 2px solid #3f51b5;border-right: 2px solid #3f51b5;">
									<input type="text" class="join_form_input03" id="email" name="email" maxlength="20" placeholder="이메일"
										value="<c:out value=" ${userInfo.EMAIL}" />"/>
									<div style="margin-top:5px; ">
										<span style="color: red;">※ 미입력시 ars@selltool.kr로 진행 됩니다</span>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
				</form>
			</div>
			<div id="searchDiv" class="">
				<h1 class="title_con_Type02 margintop_20">
					상품검색
					<span data-type="add" data-value="3" class="sButton btn_span fs-13 green" style="float: right;">선택</span>
				</h1>
				<div class="margintop_10">
					<form id="sheetFrm2" name="sheetFrm2">
						<input type="hidden" id="cTp" name="cTp" />
						<input type="hidden" id="cCode" name="cCode" />
						<input type="hidden" id="sPrdtTp" name="sPrdtTp" value="6" />
						<table class="tbl_Type02">
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
										<input class="input_style20" type="text" id="mValue" name="mValue"
											style="color: #3f51b5; border: 2px solid #3f51b5; font-weight: bolder;" placeholder="키워드" />
										<input class="input_style20 marginleft_5" type="text" id="mName" name="mName" placeholder="품명" />
										<input class="input_style20 marginleft_5" type="text" id="mBrand" name="mBrand" placeholder="브랜드" />
										<input class="input_style20 marginleft_5" type="text" id="mStndrd" name="mStndrd"
											placeholder="규격" />
										<input class="input_style20 marginleft_5" type="text" id="mModel" name="mModel" placeholder="모델명" />
										<input class="input_style20 marginleft_5" type="text" id="mCode" name="mCode" placeholder="코드번호" />
										<span class="inquiry_btn marginleft_7">
											<span class="sButton btn_span fs-13 blue" id="itemSearch" data-type="search" data-value="2"
												style="float: right;">조회</span>
										</span>
										<div class="margintop_5">
											<span class="return_select6">
												<select id="PRDT_TP" name="PRDT_TP">
													<option value="J">제휴</option>
													<option value="S">재고</option>
												</select>
											</span>
											<span class="return_select6 marginleft_5">
												<select class="ca" id="ca1" name="ca1" data-value="1">
													<option value="">1단계</option>
												</select>
											</span>
											<span class="return_select6 marginleft_5">
												<select class="ca" id="ca2" name="ca2" data-value="2">
													<option value="">2단계</option>
												</select>
											</span>
											<span class="return_select6 marginleft_5">
												<select class="ca" id="ca3" name="ca3" data-value="3">
													<option value="">3단계</option>
												</select>
											</span>
											<span class="return_select6 marginleft_5">
												<select class="ca" id="ca4" name="ca4" data-value="4">
													<option value="">4단계</option>
												</select>
											</span>
											<span class="return_select6 marginleft_5">
												<select class="ca" id="ca5" name="ca5" data-value="5">
													<option value="">5단계</option>
												</select>
											</span>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</form>
					<form id="sheetFrm3" name="sheetFrm3">
						<input type="hidden" id="mPrmId" name="mPrmId" />
					</form>
				</div>
				<div class="col-sm-5 col-md-5" style="margin-top:10px;height:210px;">
					<div id="ib-container2"></div>
				</div>
				<h1 class="title_con_Type02 margintop_20">
					선택상품
					<span data-type="clean" data-value="3" class="sButton btn_span fs-13 blue marginleft_5"
						style="float: right;">초기화</span>
					<span data-type="save" data-value="3" class="sButton btn_span fs-13 pink" style="float: right;">장바구니 담기</span>
				</h1>
				<div class="col-sm-5 col-md-5" style="margin-top:10px;height:210px;">
					<div id="ib-container3"></div>
				</div>
			</div>
			<h1 class="title_con_Type02 margintop_20">
				장바구니
				<span data-type="del" data-value="1" class="sButton btn_span fs-13 pink marginleft_5" style="float: right;">장바구니
					삭제</span>
				<span data-type="save" data-value="1" class="sButton btn_span fs-13 blue" style="float: right;">수량변경</span>
			</h1>
			<div class="col-sm-5 col-md-5" style="margin:10px 0;height:310px;">
				<div id="ib-container1"></div>
			</div>

			<h1 class="title_con_Type02 margintop_20">
				주문정보
			</h1>
			<form id="payFrm" name="payFrm">
				<table class="tbl_Type02 margintop_10">
					<caption>조회</caption>
					<colgroup>
						<col width="10%">
						<col width="*">
					</colgroup>
					<tbody>
						<tr>
							<th>
								배송정보
							</th>
							<td style="border:1px solid #d8d8d8;">
								<div>
									<input type="text" class="join_form_input03" style="width:120px;" readonly="readonly" id="addrNm"
										name="addrNm" maxlength="20" placeholder="배송지명" value="<c:out value=" ${addrList[0].RECV_NM}" />"/>
									<input type="text" class="join_form_input03" style="width:120px;" readonly="readonly" id="receiver"
										name="receiver" maxlength="20" placeholder="받으시는 분" value="<c:out value="
										${addrList[0].RECV_NM}" />"/>
									<input type="text" class="join_form_input03" style="width:180px;" readonly="readonly" id="receiverNo"
										name="receiverNo" maxlength="20" placeholder="연락처" value="<c:out value="
										${addrList[0].RECV_NM}" />"/>
									<span class="form_btn_Type_blue" onclick="fnMngAddr();">배송지 선택</span>
								</div>
								<div style="margin-top:5px;">
									<input type="hidden" id="zoneTp" name="zoneTp" value="<c:out value=" ${addrList[0].ZONE_TP}" />"/>
									<input type="hidden" id="zoneCode" name="zoneCode" value="<c:out value="
										${addrList[0].ZONE_CODE}" />"/>
									<input type="text" class="join_form_input01" id="zipCode" name="zipCode" readonly="readonly"
										placeholder="우편번호" value="<c:out value=" ${addrList[0].ZIP_CODE}" />"/>
									<input type="text" class="join_form_input03" id="address" name="address" readonly="readonly"
										placeholder="주소" value="<c:out value=" ${addrList[0].ADDRESS}" />"/>
									<input type="text" class="join_form_input03" id="dtlAddress" name="dtlAddress" readonly="readonly"
										placeholder="상세주소" value="<c:out value=" ${addrList[0].ADDRESS_DETAIL}" />"/>
								</div>
								<div style="margin-top:5px;">
									<input type="text" class="join_form_input05" id="rmk" name="rmk" placeholder="배송 요구사항" value="" />
								</div>
							</td>
						</tr>
						<tr>
							<th>
								결제구분
							</th>
							<td style="border:1px solid #d8d8d8;">
								<input type="checkbox" id="clickTax" name="clickTax" <c:if
									test="${userSession.TAXBILL_AT eq 'Y'}">checked="checked"</c:if>/><label for="clickTax"> 세금계산서
									발행요청</label>
								<span class="c13_01_03_txt_01">
									배송비결제
								</span>
								<span class="return_select2">
									<select id="dlvyPay" name="dlvyPay" class="">
										<option value="1">선불</option>
										<option value="2">착불</option>
										<option value="3">무료</option>
									</select>
								</span>
								<span class="payment_choice">
									<input type="hidden" id="payTp" name="payTp" />
									<label class="payment_Type01 payment" id="Cars">신용카드(ARS)</label>
									<label class="payment_Type01 payment" id="Csms">신용카드(SMS)</label>
									<label class="payment_Type01 payment" id="Vbank">가상계좌</label>
									<label class="payment_Type01 payment" id="KeyIn">신용카드(수기)</label>
								</span>
							</td>
						</tr>
						<tr>
							<th
								style="height:45px;border-top: 2px solid #3f51b5;border-bottom: 2px solid #3f51b5;border-left: 2px solid #3f51b5; ">
								<span class="c13_01_03_txt_01" style="margin-left:0; ">결제정보</span>
							</th>
							<td
								style="height:45px;border-top: 2px solid #3f51b5;border-bottom: 2px solid #3f51b5;border-right: 2px solid #3f51b5; ">
								<input type="hidden" id="sumPrice" />
								<input type="hidden" id="sumDlvyFee" />
								<input type="hidden" id="sumTot" />

								상품가격<label class="price_color" id="sumPriceTxt" style="font-size:18px;">0</label>&nbsp;원
								<label class="icon"><img src="${staticRoot}/img/icon_plus.jpg" alt="플러스" /></label>

								배송비<label class="price_color" id="sumDlvyFeeTxt" style="font-size:18px;">0</label>&nbsp;원
								<label class="icon"><img src="${staticRoot}/img/icon_equals.jpg" alt="합계" /></label>

								총 결제 예정금액 <label class="price_color_red" id="sumTotTxt">0</label>&nbsp;원
							</td>
						</tr>
					</tbody>
				</table>
			</form>
		</div>