var _BT = {};
/*
DEV_LOC
var shost                		= "http://www.selltool.kr"; // HOST
var host                 		= "http://www.selltool.kr"; // HOST
var host                 		= "http://211.208.7.136:8080"; // HOST
var shost                		= "http://211.208.7.136:8080"; // HOST
*/
var host = window.location.origin; // HOST
var shost = window.location.origin; // HOST
var ctx = shost;                 // WAS
var sctx = host;                // WAS
var resource = ctx + "/resources";   // WEB
var staticDownloadUri = ctx + "/common/download/";         		// 파일다운로드
var staticUploadUri = ctx + "/common/upload/";           		// 파일업로드
var staticUploadTempUri = ctx + "/common/download/tempImg/"; 	// 파일업로드(미리보기)
var useragent = navigator.userAgent.toLowerCase();

/**
 * mytooltool Namespace
 */
_BT = {
	/* jQuery 객체 형태로 문자열 반환 */
	getId: function (id) {
		return $("#" + id);
	},
	/* value 반환  */
	getValue: function (id) {
		return this.getId(id).val();
	},
	/* text 반환  */
	getText: function (id) {
		return this.getId(id).text();
	},
	/* html 반환  */
	getHtml: function (id) {
		return this.getId(id).html();
	},
	/* value의 앞뒤 공백 제거  */
	getTrimValue: function (value) {
		return $.trim(value);
	},
	/* 입력받은  id로부터 취득한 객체 value의 앞뒤 공백 제거  */
	getTrimValueById: function (id) {
		var value = this.getValue(id);
		return this.getTrimValue(value);
	},
	setNumFormat: function (value) {
		var fTxt = value.replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,");
		return fTxt;
	},
	/* value가 값을 가지고 있는지 여부 확인  */
	isEmpty: function (value, alertMessage) {
		if (value == null || value == "" || this.getTrimValue(value) == "") {
			if (alertMessage != null && alertMessage != "" && this.getTrimValue(alertMessage) != "") {
				alert(alertMessage);
			}
			return true;
		} else {
			return false;
		}
	},
	/* 입력받은  id로부터 취득한 객체 value가  maxlength 여부 확인  */
	isMaxLengthById: function (id, length, alertMessage, useFocus) {
		var value = this.getTrimValueById(id);
		var result = this.isEmpty(value, alertMessage);

		if (!result) {
			if (value.length < length) {
				result = true;
			}
		}
		if (useFocus == true || useFocus == undefined) {
			this.setFocus(id);
		}
		return result;
	},
	/* 입력받은  id로부터 취득한 객체 value가  값을 가지고 있는지 여부 확인  */
	isEmptyById: function (id, alertMessage, useFocus) {
		var value = this.getTrimValueById(id);
		var result = this.isEmpty(value, alertMessage);

		if (result) {
			if (useFocus == true || useFocus == undefined) {
				this.setFocus(id);
			}
		}

		return result;
	},
	/* array가 값을 가지고 있는지 여부 확인  */
	isEmptyArray: function (array) {
		if (array == null || array.length == 0 || $(array).size() == 0) {
			return true;
		} else {
			return false;
		}
	},
	/* 입력받은  id로부터 취득한 객체 value1과 id2로부터 취득한 객체 value2의 동일여부 확인 */
	isEqualsByIds: function (id, id2) {
		var value1 = this.getTrimValueById(id);
		var value2 = this.getTrimValueById(id2);

		return this.isEquals(value1, value2);
	},
	/* 입력받은  id로부터 취득한 객체 value와 비교값의 동일여부 확인 */
	isEqualsById: function (id, compareValue) {
		var value = this.getTrimValueById(id);

		return this.isEquals(value, compareValue);
	},
	/* 입력받은 비교값들의 동일여부 확인 */
	isEquals: function (compareValue1, compareValue2) {
		if (compareValue1 == compareValue2) {
			return true;
		} else {
			return false;
		}
	},
	/* 입력받은 value값이 비어있는경우 defaultValue값으로 대체 */
	nvl: function (value, defaultValue) {
		if (this.isEmpty(value)) {
			return defaultValue;
		} else {
			return value;
		}
	},
	/* id의 입력 값 특수문자 제거 */
	convValuel: function (id) {
		var oValue = $('#' + id).text().trim();
		if (this.isEquals(oValue, '')) return false;
		oValue = oValue.replace(/</g, "&lt;");
		oValue = oValue.replace(/>/g, "&gt;");
		oValue = oValue.replace(/\"/g, "&quot;");
		oValue = oValue.replace(/\'/g, "&#39;");
		$('#' + id).val(oValue);

	},
	/* document.location.href + confirm 간소화 */
	moveUrl: function (url, confirmMessage) {
		if (!this.isEmpty(confirmMessage)) {
			if (!confirm(confirmMessage)) {
				return false;
			}
		}

		document.location.href = url;
	},
	/* focus + select + alert 간소화 */
	setFocus: function (id, alertMessage) {
		if (!this.isEmpty(alertMessage)) {
			alert(alertMessage);
		}

		this.getId(id).focus();
		this.getId(id).val(this.getId(id).val());
	},
	/* focusout */
	setFocusOut: function (id) {
		this.getId(id).blur();
	},
	/* 텍스트 필드에서 엔터 입력시 공통 처리(단일) */
	setOnEnter: function (id, btnId) {
		this.getId(id).on("keypress", function () {
			if (event.keyCode == 13) {
				_BT.getId(btnId).click();
				return false;
			}
		});
	},
	/* 폼 리셋 */
	reset: function (confirmMessage) {
		if (!this.isEmpty(confirmMessage)) {
			if (!confirm(confirmMessage)) {
				return false;
			}
		}

		$("form").each(function () {
			this.reset();
		});
	},
	/* form submit + confirm 간소화 */
	actFormSubmit: function (formId, method, action, confirmMessage) {
		if (!this.isEmpty(confirmMessage)) {
			if (!confirm(confirmMessage)) {
				return false;
			}
		}

		this.getId(formId).attr("method", method).attr("action", action).submit();
	},
	/* ajax + alert + callback 간소화 */
	ajaxDataSubmit: function (method, url, data, callback, callback2, confirmMessage) {
		if (!this.isEmpty(confirmMessage)) {
			if (!confirm(confirmMessage)) {
				return false;
			}
		}
		$.ajax({
			url: url,
			type: method,
			data: data,
			async: false,
			success: callback,
			error: callback2
		});
	},
	/* ajax + alert + callback 간소화(get) */
	ajaxGetCallbackSubmit: function (formId, url, callback, confirmMessage) {
		if (!this.isEmpty(confirmMessage)) {
			if (!confirm(confirmMessage)) {
				return false;
			}
		}
		$.ajax({
			url: url,
			type: "get",
			data: this.getId(formId).serialize(),
			async: false,
			success: callback,
			error: function (xhr, status, error) {
				_BT.Console.debug(xhr);
			}
		});
	},
	/* ajax + alert + callback 간소화(post) */
	ajaxCallbackSubmit: function (formId, url, callback, callback2, confirmMessage) {
		if (!this.isEmpty(confirmMessage)) {
			if (!confirm(confirmMessage)) {
				return false;
			}
		}
		$.ajax({
			url: url,
			type: "post",
			data: this.getId(formId).serialize(),
			async: false,
			success: callback,
			error: callback2
		});
	},
	/* ajax 페이징 처리 */
	ajaxPaging: function (formId, url, divId) {
		$.ajax({
			url: url,
			type: "post",
			data: this.getId(formId).serialize(),
			dataType: "html",
			async: false,
			success: function (data) {
				if (data != null) {
					_BT.getId(divId).html(data);
				}
			},
			error: function (xhr, status, error) {
				_BT.Console.debug(xhr);
			}
		});
	},
	/* ajax 스크롤 페이징 처리 */
	ajaxScrollPaging: function (formId, url, divId) {
		$.ajax({
			url: url,
			type: "post",
			data: this.getId(formId).serialize(),
			dataType: "html",
			async: false,
			success: function (data) {
				if (data != null) {
					_BT.getId(divId).append(data);
				}
			},
			error: function (xhr, status, error) {
				_BT.Console.debug(xhr);
			}
		});
	},
	/* 디자인 얼럿 */
	showMsg: function (divId, msg, isConf, btn) {
		$('#' + divId + '_msg').html(msg);
		if (isConf) {
			$('#' + divId + '_btn1').removeClass('vOff');
			$('#' + divId + '_btn2').removeClass('vOff');
			$('#' + divId + '_btn3').addClass('vOff');
			$('#' + divId + '_btn1').bind('click', btn);
			$('#' + divId + '_btn2').bind('click', function () {
				$('#' + divId).addClass('vOff');
			});
		} else {
			$('#' + divId + '_btn1').addClass('vOff');
			$('#' + divId + '_btn2').addClass('vOff');
			$('#' + divId + '_btn3').removeClass('vOff');
			$('#' + divId + '_btn3').bind('click', btn);
		}
		$('#' + divId).removeClass('vOff');
	},
	hiddenMsg: function (divId) {
		$('#' + divId).addClass('vOff');
	},
	/* 팝업(센터) */
	openPopup: function (url, name, width, height, resizable, scrollbars) {
		var left = _BT.getCenterLeft(width);
		var top = _BT.getCenterTop(height);
		win = window.open(url, name, "left=" + left + ", top=" + top + ", width=" + width + ", height=" + height + ", status=no, menubar=no, toolbar=no, location=no, resizable=" + resizable + ", scrollbars=" + scrollbars);
		win.focus();
	},
	/* 팝업 센터값(TOP) */
	getCenterTop: function (height) {
		return ($(window).height() - height) / 2;
	},
	/* 팝업 센터값(LEFT) */
	getCenterLeft: function (width) {
		return ($(window).width() - width) / 2;
	},
	/* 서버의 현재시간을 취득 (format은 반드시 SimpleDateFormat 클래스의 형태로 사용) */
	getCurrentServerDate: function (format) {
		var result = "";
		$.ajax({
			url: ctx + "/common/getCurrentDate",
			type: "post",
			data: { fmt: format },
			async: false,
			success: function (data) {
				if (data.today != null) {
					result = data.today;
				}
			},
			error: function (xhr, status, error) {
				alert(_BT.Message.AJAX_ERROR_MESSAGE);
			}
		});
		return result;
	},
	/* 입력 년월에 대한 최대일자를 취득 (month는 정수형으로 입력) */
	getMonthMaxDay: function (year, month) {
		var result = "";

		$.ajax({
			url: ctx + "/common/getMonthMaxDay",
			type: "post",
			data: { year: year, month: month },
			async: false,
			success: function (data) {
				if (data.maxDay != null) {
					result = data.maxDay;
				}
			},
			error: function (xhr, status, error) {
				alert(_BT.Message.AJAX_ERROR_MESSAGE);
			}
		});

		return result;
	},
	/* minYear ~ 현재년도 까지의 셀렉트 박스 생성 */
	makeYearBox: function makeYearSelectBox(minYear, yearId) {
		var currentYear = this.getCurrentServerDate("yyyy");

		for (var i = currentYear; i >= minYear; i--) {
			var option = $("<option>", { value: i, text: i });

			this.getId(yearId).append(option);
		}

		this.getId(yearId).siblings("label").text(this.getId(yearId).val() + "년");
	},
	/* 월 셀렉트 박스 생성 */
	makeMonthBox: function (monthId) {
		for (var i = 1; i <= 12; i++) {
			var temp = i < 10 ? "0" + i : i;

			var option = $("<option>", { value: temp, text: temp });

			this.getId(monthId).append(option);
		}

		this.getId(monthId).siblings("label").text(this.getId(monthId).val() + "월");
	},
	/* 일 셀렉트 박스 생성 */
	makeDayBox: function (dayId) {
		for (var i = 1; i <= 31; i++) {
			var temp = i < 10 ? "0" + i : i;

			var option = $("<option>", { value: temp, text: temp });

			this.getId(dayId).append(option);
		}

		this.getId(dayId).siblings("label").text(this.getId(dayId).val() + "일");
	},
	/* 일 셀렉트 박스 갱신(년도와 월이 바뀌는 경우 사용) */
	remakeDayBox: function (yearId, monthId, dayId) {
		var value = this.getId(dayId).val();

		if (this.isEmpty(this.getId(dayId).find("option:first").val())) {
			this.getId(dayId).find("option").not(":first").remove();
		} else {
			this.getId(dayId).find("option").remove();
		}

		var maxDay = this.getMonthMaxDay(this.getId(yearId).val(), Number(this.getId(monthId).val()));

		for (var i = 1; i <= maxDay; i++) {
			var temp = i < 10 ? "0" + i : i;

			var option = $("<option>", { value: temp, text: temp });

			this.getId(dayId).append(option);
		}

		if (maxDay >= value) {
			this.getId(dayId).val(value);
			this.getId(dayId).siblings("label").text(value + "일");
		} else {
			this.getId(dayId).val("01");
			this.getId(dayId).siblings("label").text("01일");
		}
	},
	/* 년/월/일 셀렉트 박스 생성 */
	makeCalendarBox: function (minYear, yearId, monthId, dayId) {
		this.makeYearBox(minYear, yearId);
		this.makeMonthBox(monthId);
		this.makeDayBox(dayId);

		this.getId(yearId).on("change", function () {
			if (!_BT.isEmptyById(monthId)) {
				_BT.remakeDayBox(yearId, monthId, dayId);
			}

			$(this).siblings("label").text($(this).val() + "년");
		});

		this.getId(monthId).on("change", function () {
			if (!_BT.isEmptyById(yearId)) {
				_BT.remakeDayBox(yearId, monthId, dayId);
			}

			$(this).siblings("label").text($(this).val() + "월");
		});

		this.getId(dayId).on("change", function () {
			if (!_BT.isEmptyById(yearId)) {
				_BT.remakeDayBox(yearId, monthId, dayId);
			}

			$(this).siblings("label").text($(this).val() + "일");
		});

		this.getId(monthId).on("click", function () {
			if (_BT.isEmptyById(yearId, "년도를 선택 해 주세요.")) return false;
		});

		this.getId(dayId).on("click", function () {
			if (_BT.isEmptyById(yearId, "년도를 선택 해 주세요.")) return false;
			if (_BT.isEmptyById(monthId, "월을 선택 해 주세요.")) return false;
		});
	},
	/* input 생성 */
	makeInput: function (name, value) {
		return $("<input/>", { id: name, name: name, value: value, type: "hidden" });
	},
	/* form 생성 */
	makeForm: function (id, method, action) {
		return $("<form/>", { id: id, name: id, method: method, action: action });
	},
	/* makeForm + makeInput + submit 간소화 */
	makeFormSubmit: function (id, method, action, arrInput) {
		var form = this.makeForm(id, method, action);

		if (!this.isEmptyArray(arrInput)) {
			$(arrInput).each(function () {
				$(form).append($(this));
			});
		}

		$(form).submit();
	},
	/* makeForm + makeInput + submit 간소화(ajax) */
	makeAjaxFormSubmit: function (id, method, action, arrInput, callback, confirmMessage) {
		var form = this.makeForm(id, method, action);

		if (!this.isEmptyArray(arrInput)) {
			$(arrInput).each(function () {
				$(form).append($(this));
			});
		}

		$("body").append($(form));

		if (_BT.isEquals(action.toLowerCase(), "get")) {
			this.ajaxGetCallbackSubmit(id, action, callback, confirmMessage);
		} else {
			this.ajaxCallbackSubmit(id, action, callback, confirmMessage);
		}
	},
	//날짜 구하는 메서드
	dateAdd: function dateAdd(sDate, v, t) {
		var yy = parseInt(sDate.substr(0, 4), 10);
		var mm = parseInt(sDate.substr(5, 2), 10);
		var dd = parseInt(sDate.substr(8), 10);


		if (t == "d") {
			d = new Date(yy, mm - 1, dd + v);
		} else if (t == "m") {
			d = new Date(yy, mm - 1 + v, dd);
		} else if (t == "y") {
			d = new Date(yy + v, mm - 1, dd);
		} else {
			d = new Date(yy, mm - 1, dd + v);
		}

		yy = d.getFullYear();
		mm = d.getMonth() + 1; mm = (mm < 10) ? '0' + mm : mm;
		dd = d.getDate(); dd = (dd < 10) ? '0' + dd : dd;
		return '' + yy + '-' + mm + '-' + dd;
	},
	/* datepicker 달력 생성 (포맷 => http://docs.jquery.com/UI/Datepicker/formatDate) */
	makeCalendar: function (id, dateFormat, option) {
		if (dateFormat != "yymmdd" && dateFormat != "yy-mm-dd") {
			alert("지원하지 않는 데이터 형식 입니다.");
			return false;
		}
		var holidays = {
			"0101": { type: 0, title: "신정", year: "" },
			"0301": { type: 0, title: "삼일절", year: "" },
			"0505": { type: 0, title: "어린이날", year: "" },
			"0606": { type: 0, title: "현충일", year: "" },
			"0815": { type: 0, title: "광복절", year: "" },
			"1003": { type: 0, title: "개천절", year: "" },
			"1009": { type: 0, title: "한글날", year: "" },
			"1225": { type: 0, title: "크리스마스", year: "" }
		};

		if (option == undefined) {
			option = {};
			$.extend(option, {
				//minDate: 0,
				//showWeek: true,
				//weekHeader: "주차",
				prevText: "이전달",
				nextText: "다음달",
				monthNames: ["1월(JAN)", "2월(FEB)", "3월(MAR)", "4월(APR)", "5월(MAY)", "6월(JUN)", "7월(JUL)", "8월(AUG)", "9월(SEP)", "10월(OCT)", "11월(NOV)", "12월(DEC)"],
				monthNamesShort: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
				dayNames: ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"],
				dayNamesMin: ["일", "월", "화", "수", "목", "금", "토"],
				showButtonPanel: true,
				buttonText: "...",
				currentText: "오늘",
				closeText: "닫기",
				changeMonth: true,
				changeYear: true,
				yearRange: "c-5:c+1",
				showMonthAfterYear: true,
				beforeShowDay: function (day) {
					var result = "";

					var thisYear = $.datepicker.formatDate("yy", day);
					var holiday = holidays[$.datepicker.formatDate("mmdd", day)];

					if (holiday) {
						if (thisYear == holiday.year || holiday.year == "") {
							result = [true, "date-holiday", holiday.title];
						}
					}

					if (!result) {
						switch (day.getDay()) {
							case 0:
								result = [true, "date-sunday"];
								break;
							case 6:
								result = [true, "date-saturday"];
								break;
							default:
								result = [true, ""];
								break;
						}
					}

					return result;
				}
			});
		}

		$.extend(option, {
			dateFormat: dateFormat
		});

		this.getId(id).datepicker(option);
	},
	/* datepicker 달력 시작일, 종료일 제한 */
	setLimitCalendar: function (fromId, toId) {
		var selector = $.merge(this.getId(fromId), this.getId(toId));

		$(selector).on("change", function () {
			_BT.getId(fromId).datepicker("option", "maxDate", _BT.getId(toId).val());
			_BT.getId(fromId).datepicker("option", "onClose", function (selectedDate) {
				_BT.getId(toId).datepicker("option", "minDate", selectedDate);
			});

			_BT.getId(toId).datepicker("option", "minDate", _BT.getId(fromId).val());
			_BT.getId(toId).datepicker("option", "onClose", function (selectedDate) {
				_BT.getId(fromId).datepicker("option", "maxDate", selectedDate);
			});
		});
	},
	/* 체크박스 체크 여부 */
	isChecked: function (id, alertMessage) {
		var result = this.getId(id).is(":checked");

		if (!this.isEmpty(alertMessage)) {
			if (!result) {
				alert(alertMessage);
			}
		}

		return result;
	},
	/* 체크박스 체크/해제 */
	setCheck: function (id, isCheck) {
		this.getId(id).prop("checked", isCheck);
	},
	/* className 그룹의 체크박스 수 */
	getGroupCheckedCount: function (className) {
		return $("." + className).filter(":checked").size();
	},
	/* parentId 체크값으로 childClassName 그룹의 체크박스 체크/해제 */
	setGroupCheck: function (parentId, childClassName) {
		this.getId(parentId).on("click", function () {
			$("." + childClassName).prop("checked", _BT.isChecked(parentId));
		});

		$("." + childClassName).on("click", function () {
			var totalCount = $("." + childClassName).size();
			var checkCount = _BT.getGroupCheckedCount(childClassName);

			if (_BT.isEquals(checkCount, totalCount)) {
				_BT.setCheck(parentId, true);
			} else {
				_BT.setCheck(parentId, false);
			}
		});
	},
	/* 읽기전용 */
	setReadOnly: function (id) {
		this.getId(id).prop("readonly", true);
	},
	/* 쓰기가능 */
	setWritable: function (id) {
		this.getId(id).prop("readonly", false);
	},
	/* 사용가능 */
	setEnable: function (id) {
		this.getId(id).removeAttr("disabled");
	},
	/* 사용불가 */
	setDisable: function (id) {
		this.getId(id).attr("disabled", "disabled");
	},
	/* array를 separator 값으로 구분하여 문자열로 반환 */
	getJoinData: function (separator, array) {
		var result = new Array();

		$(array).each(function () {
			var value = _BT.getId(this).val();

			if (!_BT.isEmpty(value)) {
				result.push(value);
			}
		});

		return result.join(separator);
	},
	/* value값을 separator로 분리하여 array에서 추출한 id의 value값에 set */
	setSplitData: function (value, separator, array) {
		if (!this.isEmpty(value) && !this.isEmptyArray(array)) {
			$(array).each(function (i) {
				var temp = value.split(separator)[i];

				_BT.getId(this).val(temp);
			});
		}
	},
	/* 생년월일을 array에서 추출한 id의 value값에 set */
	setBirthday: function (value, array) {
		if (!_BT.isEmpty(value) && !_BT.isEmptyArray(array)) {
			if (value.length == 8 && array.length == 3) {
				this.getId(array[0]).val(value.substr(0, 4));
				this.getId(array[1]).val(value.substr(4, 2));
				this.getId(array[2]).val(value.substr(6, 2));
			}
		}
	},
	/* array를 separator 값으로 구분하여 문자열로 반환 
	 * type을 통해 text, html, value에 대한 반환값 선언가능
	 * replaceChar 통해 공통으로 제거가 필요한 문자열 지정가능
	 * */
	getArrayToString: function (type, array, separator, replaceChar) {
		var result = "";

		$(array).each(function () {
			if (_BT.isEquals("text", type)) {
				result += $(this).text().trim();
			} else if (_BT.isEquals("html", type)) {
				result += $(this).html().trim();
			} else {
				result += $(this).val().trim();
			}

			if (!_BT.isEmpty(replaceChar)) {
				result = result.replace(replaceChar, "");
			}

			if (!_BT.isEmpty(separator)) {
				result += separator;
			}
		});

		return result;
	},
	/* QueryString을 JSON으로 변환하여 취득 */
	getUrlToJSON: function () {
		var queryString = document.location.search.slice(1).split('&');

		var result = {};

		$(queryString).each(function () {
			var query = this.split('=');

			result[query[0]] = decodeURIComponent(query[1] || '');
		});

		return JSON.parse(JSON.stringify(result));
	},
	/* QueryString으로 부터 parameter 취득 */
	getUrlParam: function (key) {
		var param = this.getUrlToJSON();

		var value = param[key];

		return this.nvl(value, "");
	}
};

/**
 * mytooltool Message Namespace
 */
_BT.Message = {
	/* Ajax 공통 에러 메시지 */
	AJAX_ERROR_MESSAGE: "처리중 에러가 발생하였습니다."
};

/**
 * mytooltool Console Namespace
 */
_BT.Console = {
	/* 콘솔 객체 생성(콘솔 객체가 없는 브라우저) */
	createNewConsole: function () {
		if (window.console == undefined) {
			console = {
				log: function () { }
			};
		}
	},
	/* 콘솔 디버그 */
	debug: function (xhr) {
		this.createNewConsole();
		console.log("_BT.Console.debug => " + xhr.status);
		console.log("_BT.Console.debug => " + xhr.error);
	}
};

/**
 * mytooltool Cookie Namespace
 */
_BT.Cookie = {
	/* AES 암호화 키 */
	AES_CRYPT_KEY: "!@#$%^&*()_+|",
	/* MD5로 저장한 키로부터, AES로 복호화된 value 취득 */
	get: function (key) {
		key = CryptoJS.MD5(key);

		var value = window.localStorage.getItem(key);

		if (isNaN(value)) {
			value = CryptoJS.AES.decrypt(value, this.AES_CRYPT_KEY).toString(CryptoJS.enc.Utf8);
		}

		return value;
	},
	/* MD5로 저장한 키로부터, AES로 복호화된 value를 MD5로 암호화하여 취득 */
	getMD5Value: function (key) {
		var value = this.get(key);

		return CryptoJS.MD5(value).toString();
	},
	/* MD5로 암호화된 value 취득 */
	converMD5Value: function (value) {
		return CryptoJS.MD5(value);
	},
	/* key는 MD5로 암호화하고, value는 AES로 암호화 하여 저장 */
	set: function (key, value) {
		key = CryptoJS.MD5(key);

		if (isNaN(value)) {
			value = CryptoJS.AES.encrypt(value, this.AES_CRYPT_KEY).toString();
		}

		window.localStorage.setItem(key, value);
	},
	/* 모든 key, value 삭제(로그아웃) */
	clear: function () {
		window.localStorage.clear();
	}
};


/**
 * mytooltool FileUtil Namespace
 */
_BT.FileUtil = {
	/* 파일 업로드 이벤트(ajax 파일 업로드) */
	setAjaxFileUpload: function (formId, id, previewId, deleteFileId, uploadCallback) {
		if (_BT.isEmpty(uploadCallback)) {
			uploadCallback = this.defaultFileUploadCallBack;
		}

		var options = {
			crossDomain: true,
			success: uploadCallback
		};

		_BT.getId(id).on("change", function () {
			var currentFile = $(this).val().toLowerCase();
			var fileExt = currentFile.split(".")[currentFile.split(".").length - 1];
			var allowExt = "jpg,jpeg,png,gif";

			if (allowExt.indexOf(fileExt) == -1) {
				alert(allowExt + " 파일만 업로드 가능합니다.");

				_BT.FileUtil.resetAjaxUpload(id, previewId);

				return false;
			}

			if (!_BT.isEmpty(deleteFileId)) {
				if (!_BT.isEmptyById(deleteFileId)) {
					var deleteFile = "";

					if (_BT.isEmptyById("deleteFile")) {
						deleteFile = _BT.getValue(deleteFileId);
					} else {
						deleteFile = _BT.getValue("deleteFile") + "," + _BT.getValue(deleteFileId);
					}

					_BT.getId("deleteFile").val(deleteFile);
					_BT.getId(deleteFileId).val("");
				}
			}

			_BT.getId(formId).find("[name=currFileId]").val(id);
			_BT.getId(formId).find("[name=currPreviewId]").val(previewId);

			$("input:file").not("[id=" + id + "]").prop("disabled", true);

			$("#lodingbar")
				.css("position", "absolute")
				.css("z-index", "10001")
				.css("top", "50%")
				.css("left", "50%")
				.show();

			_BT.getId(formId)
				.attr("method", "post")
				.attr("action", staticUploadUri)
				.ajaxSubmit(options);

			$("input:file").not("[id=" + id + "]").prop("disabled", false);
		});
	},
	/* 파일 업로드 이벤트 기본 콜백(ajax 파일 업로드) */
	defaultFileUploadCallBack: function (data) {
		$("#lodingbar").hide();

		var json = data.resultJson;

		try {
			if (_BT.isEquals(json.result, "success")) {
				_BT.getId(json.currPreviewId).attr("src", staticUploadTempUri + json.fileSaveName);
			} else if (_BT.isEquals(json.result, "fileSize")) {
				alert("첨부파일 사이즈를 확인하여 주십시요.");
				_BT.FileUtil.resetAjaxUpload(json.currFileId, json.currPreviewId);
			} else if (_BT.isEquals(json.result, "imageSize")) {
				alert("이미지 사이즈를 확인하여 주십시요.");
				_BT.FileUtil.resetAjaxUpload(json.currFileId, json.currPreviewId);
			} else if (_BT.isEquals(json.result, "notImage")) {
				alert("이미지 파일이 아닙니다.");
				_BT.FileUtil.resetAjaxUpload(json.currFileId, json.currPreviewId);
			} else {
				_BT.FileUtil.resetAjaxUpload(json.currFileId, json.currPreviewId);
			}
		} catch (e) {
			alert(_BT.Message.AJAX_ERROR_MESSAGE);
			_BT.FileUtil.resetAjaxUpload(json.currFileId, json.currPreviewId);
		}
	},
	/* 파일 업로드 초기화(ajax 파일 업로드) */
	resetAjaxUpload: function (id, previewId, fileId, fileOriName) {
		_BT.getId(id).replaceWith(_BT.getId(id).val("").clone(true));
		_BT.getId(previewId).attr("src", "");

		if (!_BT.isEmpty(fileId) && !_BT.isEmpty(fileOriName)) {
			_BT.getId(previewId).attr("src", staticDownloadUri + fileId);
		}
	},
	/* 파일 다운로드 */
	fileDownload: function (fileId) {
		document.location.href = staticDownloadUri + fileId;
		return false;
	}
};

/**
 * mytooltool Search Namespace
 */
_BT.Search = {
	/* 검색 리스트  */
	list: function (hashtag) {
		var searchType = _BT.makeInput("searchType", "3");
		var searchWord = _BT.makeInput("searchWord", $.trim(hashtag));

		_BT.makeFormSubmit("hForm", "post", _BT.URL.Search.List, new Array(searchType, searchWord));
	},
	/* 검색 상세 리스트  */
	view: function (hashtag, useHistory) {
		var searchWord = _BT.makeInput("searchWord", $.trim(hashtag));
		var insertHistory = _BT.makeInput("insertHistory", useHistory);

		_BT.makeAjaxFormSubmit("hForm", "post", _BT.URL.Search.View, new Array(searchWord, insertHistory), function (data) {
			if ($(data).size() > 0) {
				if (_BT.isEquals(data.code, "success")) {
					_BT.moveUrl(_BT.APP.URL.Search.View + "?searchWord=" + hashtag);
				} else {
					alert(data.msg);
				}
			}
		});
	}
};

/**
 * mytooltool Debug Namespace
 */
_BT.Debug = {
	/* 폼 디버그 */
	Form: function (formId) {
		_BT.Console.createNewConsole();

		var obj = _BT.getId(formId).serializeArray();

		for (var prop in obj) {
			console.log((Number(prop) + 1) + " ==> " + obj[prop].name + " : " + obj[prop].value);
		}
	},
	/* 객제 디버그 */
	Object: function (object) {
		_BT.Console.createNewConsole();

		for (var prop in object) {
			console.log((Number(prop) + 1) + " ==> " + object[prop].name + " : " + object[prop].value);
		}
	}
};

/**
 * mytooltool Dialog Namespace
 */
_BT.Dialog = {
	/* 레이어 팝업 열기 */
	open: function (id) {
		_BT.getId(id).dialog();
	},
	/* 레이어 팝업 닫기 */
	close: function (id) {
		_BT.getId(id).dialog("close");
	}
};

/**
 * mytooltool Regular Expression Namespace
 */
_BT.Reg = {
	/* 숫자만 */
	Number: function (className, alertMessage) {
		$("." + className).on("keyup", function () {
			var value = $(this).val();
			var regExp = /[^0-9]/gi;

			if (regExp.test(value)) {
				if (!_BT.isEmpty(alertMessage)) {
					alert(alertMessage);
				}

				$(this).val(value.replace(regExp, ""));
				$(this).focus();

				return false;
			}
		});
	},
	NumberMax: function (id, max, next, alertMessage) {
		$("#" + id).on("keyup", function () {
			var value = $(this).val();
			var regExp = /[^0-9]/gi;

			if (regExp.test(value)) {
				if (!_BT.isEmpty(alertMessage)) {
					alert(alertMessage);
				}
				$(this).val(value.replace(regExp, ""));
				$(this).focus();
				return false;
			} else {
				if (!_BT.isEmpty(max)) {
					if ($(this).val().length < max) {
						$(this).focus();
					} else {
						if (!_BT.isEmpty(next)) {
							$("#" + next).focus();
						} else {
							$(this).focus();
						}
					}
				} else {
					$(this).focus();
				}
			}
		});
	},
	/* 사업자등록번호 */
	Number2: function (className, alertMessage) {
		$("." + className).on("keyup", function () {
			var value = $(this).val();
			var regExp = /^\d{3}-\d{2}-\d{5}$/;

			if (!regExp.test(value)) {
				if (!_BT.isEmpty(alertMessage)) {
					alert(alertMessage);
				}

				//$(this).val(value.replace(regExp, ""));
				$(this).focus();

				return false;
			}
		});
	},
	/* 6자리 이상 20자리 이하 숫자,문자 */
	Char: function (id, alertMessage) {
		var isSuccess = true;
		var value = _BT.getId(id).val();
		var regExp = /^[a-zA-Z0-9_]{6,20}$/;

		if (!regExp.test(value)) {
			if (!_BT.isEmpty(alertMessage)) {
				alert(alertMessage);
			}

			_BT.getId(id).focus();

			isSuccess = false;

			return false;
		}

		return isSuccess;
	},
	/* 생년월일 */
	Birthday: function (className, alertMessage) {
		var isSuccess = true;

		$("." + className).each(function () {
			var value = $(this).val();
			var regExp = /^[0-9]{4}-[0-9]{2}-[0-9]{2}$/;

			if (!regExp.test(value)) {
				if (!_BT.isEmpty(alertMessage)) {
					alert(alertMessage);
				}

				$(this).focus();

				isSuccess = false;

				return false;
			}
		});

		return isSuccess;
	},
	/* 이메일 전체 */
	Email: function (className, alertMessage, useFocus) {
		var isSuccess = true;

		$("." + className).each(function () {
			var value = $(this).val();
			var regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;

			if (!regExp.test(value)) {
				if (!_BT.isEmpty(alertMessage)) {
					alert(alertMessage);
				}
				if (useFocus == true || useFocus == undefined) {
					$(this).focus();
				}
				isSuccess = false;
				return false;
			}
		});

		return isSuccess;
	},
	/* 이메일(도메인) */
	EmailTail: function (className, alertMessage) {
		var isSuccess = true;

		$("." + className).each(function () {
			var value = $(this).val();
			var regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;

			if (!regExp.test(value)) {
				if (!_BT.isEmpty(alertMessage)) {
					alert(alertMessage);
				}

				$(this).focus();

				isSuccess = false;

				return false;
			}
		});

		return isSuccess;
	}
};

/**
 * mytooltool OPEN API Namespace
 * 
 */
_BT.API = {
	/* 다음 우편번호 API */
	DaumPost: {
		/* 다음 우편번호 팝업 */
		openPostPopup: function (callback) {
			daum.postcode.load(function () {
				new daum.Postcode({
					oncomplete: callback
				}).open();
			});
		}
	},
	/* 다음 지도 API */
	DaumMap: {
		/* 지도 Center(position 객체로 부터 취득) */
		getCenter: function (position) {
			return new daum.maps.LatLng(position.coords.latitude, position.coords.longitude);
		},
		/* 지도 Center(위도와 경도 값으로 취득) */
		getCenterValue: function (lat, lng) {
			return new daum.maps.LatLng(lat, lng);
		},
		/* 지도 생성 */
		drawPositionMap: function (mapId, lat, lng) {
			var center = new daum.maps.LatLng(lat, lng);

			var mapContainer = document.getElementById(mapId);
			var mapOption = {
				center: center, // 지도 중심좌표
				level: 3        // 지도 확대 레벨
			};

			var map = new daum.maps.Map(mapContainer, mapOption);
			map.addControl(new daum.maps.ZoomControl(), daum.maps.ControlPosition.RIGHT);

			new daum.maps.Marker({
				map: map,
				position: center
			});

			map.panTo(center);
		},
		/* 현재 위치 지도 생성 */
		drawCurrentMap: function (position) {
			var lat = position.coords.latitude;  // 위도
			var lng = position.coords.longitude; // 경도

			_BT.API.DaumMap.drawPositionMap(mapId, lat, lng);
		},
		/* 주소로 지도 생성 */
		drawAddressMap: function (mapId, address) {
			var geocoder = new daum.maps.services.Geocoder();

			geocoder.addr2coord(address, function (status, result) {
				if (status === daum.maps.services.Status.OK) {
					_BT.API.DaumMap.drawPositionMap(mapId, result.addr[0].lat, result.addr[0].lng);
				}
			});
		},
		/* 주소로 위도, 경도를 취득하여 폼에게 전달 */
		setAddressToPosition: function (address, latId, lngId) {
			var geocoder = new daum.maps.services.Geocoder();

			geocoder.addr2coord(address, function (status, result) {
				if (status === daum.maps.services.Status.OK) {
					_BT.getId(latId).val(result.addr[0].lat);
					_BT.getId(lngId).val(result.addr[0].lng);
				}
			});
		}
	}
};