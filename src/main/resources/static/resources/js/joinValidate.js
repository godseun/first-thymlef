var joinValidate = {
		/**
		 * 결과코드
		 */
		resultCode : {
			success_name : {
				code : 0,
				desc : '등록이 가능합니다.'
			},
			// 이메일 주소
			success_email : {
				code : 0,
				desc : '등록가능한 이메일입니다.'
			},
			empty_email : {
				code : 1,
				desc : '이메일 주소를 입력해 주세요.'
			},
			invalid_email : {
				code : 2,
				desc : '이메일 주소가 유효하지 않습니다.'
			},
			// ID
			success_id : {
				code : 0,
				desc : '사용가능한 아이디 입니다.'
			},
			empty_id : {
				code : 1,
				desc : '아이디를 입력해 주세요.'
			},
			space_length_id : {
				code : 2,
				desc : '아이디는 공백없이 6자 이상~20자 이하여야 합니다.'
			},
			invalid_id : {
				code : 3, 
				desc : '아이디는 영문 소문자, 숫자, 특수기호 일부만 사용할 수 있습니다.'
			},
			special_char_id : {
				code : 5,
				desc : '특수문자는 대시(-), 언더바(_), 점(.)만 이용 가능합니다.'
			},
			first_special_char_id : {
				code : 6,
				desc : '첫글자는 특수문자를 이용하실 수 없습니다.'
			},
			lower_case_id : {
				code : 7,
				desc : '영문 소문자는 최소 1자 이상 포함되어야 합니다.'
			},

			
			
			
			
			
			
			
			
			
			
			// 이름
			empty_name : {
				code : 1,
				desc : '이름을 입력해 주세요.'
			},
			invalid_korean_name : {
				code : 2,
				desc : '이름은 표준 한글 또는 영문만 입력 가능합니다.'
			},
			invalid_combination_name : {
				code : 3,
				desc : '한글과 영문은 혼용 할 수 없습니다.'
			},
			invalid_korean_length : {
				code : 4,
				desc : '한글 이름은 33자를 넘을 수 없습니다.'
			},
			invalid_english_length : {
				code : 5,
				desc : '영문 이름은 100자를 넘을 수 없습니다.'
			},
			
			
			// 휴대폰 번호
			success_cp_num : {
				code : 0,
				desc : '등록가능한 휴대폰 번호입니다.'
			},
			empty_cp_num : {
				code : 1,
				desc : '휴대폰 번호를 입력해 주세요.'
			},
			invalid_cp_num : {
				code : 2,
				desc : '휴대폰 번호가 유효하지 않습니다.'
			},
			// 비밀번호
			success_password : {
				code : 0,
				desc : '사용가능합니다.'
			},
			password_use_privacy : {
				code : 1,
				desc : '내 정보로 비밀번호 사용은 사용하실 수 없습니다.'
			},
			password_not_available : {
				code : 2,
				desc : 'script란 단어는 비밀번호로 사용하실 수 없습니다.'
			}
		},
		
		
		/**
		 * 이메일 주소 체크
		 * @param em
		 * @returns
		 */
		checkEmail: function(em) {
			if( em == '' || em.length == 0 )
				return this.resultCode.empty_email;
			var regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
            if(!regExp.test(em)) {
				return this.resultCode.invalid_email;
            }
			return this.resultCode.success_email;
		},
		
		
		
		
		
		
		
		
		
		
		/**
		 * 이름 체크
		 * @param name
		 * @returns
		 */
		checkCustName : function( name ) {
			var engPattern = /[A-Za-z]/;
			var korChildPattern = /[ㄱ-ㅎ]/;
	    	var korPattern = /[가-힣]/;
	    	var numPattern = /[0-9]/;
	    	var notAllowWordPattern = /[^A-Za-z가-힣\s.]/;
			if( name == '' || name.length == 0 )
				return this.resultCode.empty_name;
			if (numPattern.test(name)) //숫자 금지
                return this.resultCode.invalid_korean_name;
			if (notAllowWordPattern.test(name)) // 특수문자 금지
				return this.resultCode.invalid_korean_name;
			if (korChildPattern.test(name)) //한글 자음 섞인것 금지
				return this.resultCode.invalid_korean_name;
			if (!engPattern.test(name) && korPattern.test(name) && name.length > 33) //한글일 경우 30자 이하
				return this.resultCode.invalid_korean_length;
			if (engPattern.test(name) && !korPattern.test(name) && name.length > 100) //영문일 경우 100자 이하
				return this.resultCode.invalid_english_length;
			if (engPattern.test(name) && korPattern.test(name)) //한글 영문 혼용 금지
                return this.resultCode.invalid_combination_name;
			if (!engPattern.test(name) && !korPattern.test(name))
				return this.resultCode.invalid_korean_name;
			if (!engPattern.test(name) && korPattern.test(name) && name.indexOf(" ") != -1) // 영문일 경우만 스페이스 허용
				return this.resultCode.invalid_korean_name;
			if (!engPattern.test(name) && korPattern.test(name) && name.indexOf(".") != -1) // 영문일 경우만 . 허용
				return this.resultCode.invalid_korean_name;
			var spaceIdx = name.lastIndexOf(" ");
			if (spaceIdx > 0 && name.substr(spaceIdx -1 , 1) == " ") // space는 한번만 허용
				return this.resultCode.invalid_korean_name;
	        return this.resultCode.success_name;
		},
		
	
		
		/**
		 * 휴대폰 번호 체크
		 * @param cpNum
		 * @returns
		 */
		checkPhoneNum: function( cpNum ) {
			if(cpNum == '' || cpNum.length == 0)
				return this.resultCode.empty_cp_num;
			if (cpNum.indexOf("01") != 0)
				return this.resultCode.invalid_cp_num;
			if(cpNum.length < 10 || cpNum.length > 11 || !this.isNumerics( cpNum ))
				return this.resultCode.invalid_cp_num;
	        return this.resultCode.success_cp_num;
	    },
		
		isNumerics: function(checkStr) {
			 var checkOK = "0123456789";
		     var isnumeric = false;
		     for (var i = 0;  i < checkStr.length;  i++) {
		        ch = checkStr.charAt(i);
		        isnumeric = false;
		        for (var j = 0;  j < checkOK.length;  j++) {
		          if (ch == checkOK.charAt(j)) {
		              isnumeric = true;
		          }
		        }
		        if ( isnumeric == false )
		            return false;
		     }
		     return true;
		},
		
		/**
	     * 비밀번호 보안 검증
	     * @param targetStr	비교 대상이 될 문자열 (ex. 휴대폰 번호)
	     * @param compStr	비교 할 문자열 (ex. 입력된 비밀번호)
	     * @param length	비교할 문자의 자리수 (ex. 4자 이상 중복되면 안 될 경우 4)
	     * @returns
	     */
	    checkSafetyPassword: function (targetStr, compStr, length) {
	    	if (targetStr == null || targetStr == '') {
	    		return this.resultCode.success_password;
			}
			for (var i = 0 ; i < compStr.length - length + 1 ; i++) {
				var str = compStr.substr(i, length);
				if (targetStr.indexOf(str) > -1) {
					return this.resultCode.password_use_privacy;
				}
			}
			return this.resultCode.success_password;
	    },

	    checkBanWordForPassword : function (targetStr, compStr, length) {
    		for (var i = 0 ; i < compStr.length - length + 1 ; i++) {
				var str = compStr.substr(i, length);
				if (targetStr.indexOf(str) > -1) {
					return this.resultCode.password_not_available;
				}
			}
			return this.resultCode.success_password;
	    },
		
	    /**
	     * 아이디 체크
	     */
	    checkStringId : function(memId) {
	    	// 올바른 아이디 형식
    		var reg = /[^a-z0-9-_.]+/g;
    		// 소문자 포함
    		var regLower = /[a-z]+/g;
    		// 특수문자
    		var regEtc = /[~`!@#$%^&*()+=\|\\\{\}\[\]:";'<>?//]/g;
    		// 공백문자
    		var regEmpty = /\s/g;
    		
    		if(memId == '') {
    			return this.resultCode.empty_id;
    		} else if(memId.match(regEmpty)) {
    			return this.resultCode.space_length_id;
			} else if(regEtc.test(memId)) {
				return this.resultCode.special_char_id;
			} else if(reg.test(memId)) {
				return this.resultCode.invalid_id;
			} else if( memId.charAt(0) == '-' || memId.charAt(0) == '_' || memId.charAt(0) == '.' ) {
				return this.resultCode.first_special_char_id;
			} else if(!regLower.test(memId)) {
		        return this.resultCode.lower_case_id
		    } else if(memId.length < 6 || memId.length > 20) {
		    	return this.resultCode.space_length_id;
		    } else {
		    	return this.resultCode.success_id;
		    }
		},
		
	    /**
	     * 사업자 등록번호 체크
	     */
		checkBusino : function(vencod) {
			var sum = 0;
			var getlist =new Array(10);
			var chkvalue =new Array("1","3","7","1","3","7","1","3","5");
			
			for(var i=0; i<10; i++) { 
				getlist[i] = vencod.substring(i, i+1);
			}

			for(var i=0; i<9; i++) { 
				sum += getlist[i]*chkvalue[i]; 
			}

			sum = sum + parseInt((getlist[8]*5)/10);
			sidliy = sum % 10;
			sidchk = 0;
			
			if(sidliy != 0) { 
				sidchk = 10 - sidliy; 
			} else { 
				sidchk = 0; 
			}
			
			if(sidchk != getlist[9]) { 
				return false;
			}
			return true;
		}
};








/**
 * @title 패스워드 체크 관련 javascript 패키지
 * @description 패스워드 유효성체크, 안정성 체크 관련 자바스크립트 함수의 패키지
 * 
 * - Function List
 *  1. safetyCheck 		: 비밀번호 안전성 체크(Ajax 호출 포함)
 *  2. validateCheckAll	: 비밀번호 입력/변경시 입력값 유효성 체크
 *  
 * - Function List
 *  1. safety.safetyCheck() : void
 *     : 패스워드 안정성 체크 함수
 *  2. safety.validateCheckAll() : Boolean
 *     : 패스워드 유효성 체크 함수
 *  3. safety.duplicateCharCheck(String) : boolean
 *     : string 에 같은문자가 연속으로 3개 이상 있는지 체크
 *  4. safety.continuesCharCheck(String) : boolean
 *     : string 에 연속된 숫자, 문자가 나타나는지 체크(올림차순, 내림차순 모두)
 */
var safety = {
		scriptMsg : {
			password_empty : {
				desc : '비밀번호를 입력해주세요.'
			},
			password_length1 : {
				desc : '최소 6자 이상 입력하셔야 합니다.'
			},
			password_length2 : {
				desc : '최대 20자리 이하로 입력해 주세요.'
			},
			password_prohibit1 : {
				desc : '영문+숫자 조합으로 설정하셔야 합니다.'
			},
			password_prohibit2 : {
				desc : '이메일로 비밀번호 사용은 불가합니다.'
			},
			password_prohibit3 : {
				desc : '111처럼 동일한 숫자, 문자는 사용이 불가합니다.'
			},
			password_prohibit4 : {
				desc : '123처럼 연속된 숫자, 문자는 사용이 불가합니다.'
			},
			password_prohibit5 : {
				desc : '내 정보로 비밀번호 사용은 사용하실 수 없습니다.'
			},
			password_prohibit6 : {
				desc : '비밀번호에는 공백을 사용하실 수 없습니다.'
			},
			password_prohibit7 : {
				desc : '사용 불가한 문자가 포함되어있습니다.'
			},
			password_prohibit8 : {
				desc : '비밀번호를 다시 한번 입력해 주세요.'
			},
			password_prohibit9 : {
				desc : '비밀번호와 일치하지 않습니다.'
			},
			password_prohibit0 : {
				desc : '비밀번호가 일치 합니다.'
			}
		},
		
		/**
		 * 비밀번호 안정성 체크 호출
		 */
		safetyCheck : function(memPwd) {
			var rst = this.LevelCheck(memPwd);
			return rst;
		},
	
		/**
		 * 비밀번호 유효성 체크 호출
		 * @returns {String}
		 */
		LevelCheck : function(memPwd){
			var word = memPwd;
			var password = "";
			password = word;
			if(password.length == 0){
				return this.scriptMsg.password_empty;
			}
			//길이 체크
			if(password.length < 6){
				return this.scriptMsg.password_length1;
			}
			if(password.length > 20){
				return this.scriptMsg.password_length2;
			}
			
			var Set_Num = "0123456789";
			var Set_Alpha1 = "abcdefghijklmnopqrstuvwxyz";
			var Set_Alpha2 = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
			var Set_Other = "!@#$%^&*()-_=+|]}[{'\";:/?.>,<";		
			var str1 = password;
		    var varDigit = 0;
		    var varAlpha = 0;
		    for(var i=0; i < str1.length; i++) {
		    	if(Set_Num.indexOf(str1.charAt(i)) > -1){
		    		varDigit = 1;
		    	}else if(Set_Alpha1.indexOf(str1.charAt(i)) > -1){
		    		varAlpha = 1;
		    	}else if(Set_Alpha2.indexOf(str1.charAt(i)) > -1){
		    		varAlpha = 1;
		    	}else if(Set_Other.indexOf(str1.charAt(i)) > -1){
		    		varSpecial = 1;
		    	}else{
		    		if(" " == str1.charAt(i)){	    			
						return this.scriptMsg.password_prohibit6;
					}else{
						return this.scriptMsg.password_prohibit7;
					}
		    	}
		   	}
		    if((varDigit + varAlpha) < 2){
		        return this.scriptMsg.password_prohibit1;
		    }
			
			//동일문자 3번 이상 체크
			if (this.duplicateCharCheck(password)) {
				return this.scriptMsg.password_prohibit3;
			}
			
			//연속된 문자열 체크
			if (this.continuesCharCheck(password)) {
				return this.scriptMsg.password_prohibit4;
			}
			return "OK";
		},
		
		/**
	     * 비밀번호 보안 검증
	     * @param targetStr	비교 대상이 될 문자열 (ex. 휴대폰 번호)
	     * @param compStr	비교 할 문자열 (ex. 입력된 비밀번호)
	     * @param length	비교할 문자의 자리수 (ex. 4자 이상 중복되면 안 될 경우 4)
	     * @returns
	     */
		pwIsEquals: function (targetStr, compStr, length) {
	    	if (targetStr == null || targetStr == '') {
	    		return "OK";
			}
			for (var i = 0 ; i < compStr.length - length + 1 ; i++) {
				var str = compStr.substr(i, length);
				if (targetStr.indexOf(str) > -1) {
					if( length == 3 ) {
						return this.scriptMsg.password_prohibit2;
					} else if( length > 3 ) {
						return this.scriptMsg.password_prohibit5;
					}
				}
			}
			return "OK";
		},
		
		/**
		 * 3개 이상의 연속된 동일문자 또는 동일숫자 사용불가
		 * @param password	(String) : 검사할 문자열
		 * @return boolean
		 */
		 duplicateCharCheck : function(password) {
			//결과값 초기화
			var checkValue = false;
			
			//임시 배열 선언
			var tempArray = new Array();
			for (var i = 0 ; i < password.length ; i++) {
				tempArray[i] = password.charCodeAt(i);	
			}	
			/*중복된 3자 이상의 문자 또는 숫자 사용불가*/
			for(var i=0; i < tempArray.length-1; i++) {
				if((eval(tempArray[i]) == eval(tempArray[i+1]))&& (eval(tempArray[i]) == eval(tempArray[i+2])) ) {
					checkValue = true;
					return true;
				}else{ 
					checkValue = false; 
				}
			}
			return checkValue;
		},
		
		/**
		 * 일련숫자 또는 알파벳 순서대로 3자이상 사용하는 비밀번호는 사용불가
		 * @param password	(String) : 검사할 문자열
		 * @return boolean
		 */
		continuesCharCheck : function(password) {
			//결과값 초기화
			var checkValue = false;
			
			/*
			//임시 배열 선언
			var tempArray = new Array();
			for (var i = 0 ; i < password.length ; i++) {
				tempArray[i] = password.charCodeAt(i);	
			}
			
			//연속된 3개의 문자 사용불가 (오름차순)
			for(var i=0; i < tempArray.length-1; i++) {
				if((eval(tempArray[i]+1) == eval(tempArray[i+1]))&& (eval(tempArray[i+1]+1) == eval(tempArray[i+2])) ) {
					checkValue = true;
					return true;
				}else{ 
					checkValue = false; 
				}
			}
			
			//연속된 3개의 문자 사용불가 (내림차순)
			for(var i=0; i < tempArray.length-1; i++) {
				if((eval(tempArray[i]) == eval(tempArray[i+1]+1))&& (eval(tempArray[i]) == eval(tempArray[i+2]+2) )) {
					checkValue = true;
					return true;
				}else{ 
					checkValue = false; 
				}
			}
			*/
			// 연속된 3문자 확인 (ascending)
	        for(i = 0; i <= (password.length - 3); i++) {
	           if((password.charCodeAt(i) + 1) == password.charCodeAt(i + 1) && (password.charCodeAt(i + 1) + 1) == password.charCodeAt(i + 2)) {
	        	   checkValue = true;
	        	   return true;
	           } else {
	        	   checkValue = false; 
	           }
	        }

	        // 연속된 3문자 확인 (descending)
	        for(i = (password.length - 1); i >= 2; i--) {
	           if((password.charCodeAt(i) + 1) == password.charCodeAt(i - 1) && (password.charCodeAt(i - 1) + 1) == password.charCodeAt(i - 2)) {
	        	   checkValue = true;
	        	   return true;
	           } else {
	        	   checkValue = false; 
	           }
	        }
			
			return checkValue;
		},
	
		checkGadePw: function(memPwd){
			var count = 0;
			var num = /[0-9]/;
			var upper_case = /[A-Z]/; 
			var lower_case = /[a-z]/;
			var notSpecial = /[^0-9A-Za-z]/;
			var pwd = memPwd;
			var level = "1";
			if(num.test(pwd)){
				count++;
			}
			if(upper_case.test(pwd)){
				count++;
			}
			if(lower_case.test(pwd)){
				count++;
			}
			if(notSpecial.test(pwd)){
				count++;
			}
			
			// 7자리 이하면 무조건 낮음
			if(pwd.length <= 7){
				level = "1";
			}
			
			if(pwd.length == 8){
				// 8자리일 경우 문자열 3개 이상일 경우 높음
				if(count >= 3){
					level = "3";
				}
				// 8자리일 경우 문자열 2개인 경우 낮음
				if(count == 2){
					level = "1";
				}
			}
			
			if(pwd.length == 9){
				// 9자리일 경우 문자열 3개 이상일 경우 높음
				if(count >= 3){
					level = "3";
				}
				// 9자리일 경우 문자열 2개인 경우 안전
				if(count == 2){
					level = "2";
				}
			}
			
			// 10자리 이상이면 무조건 높음
			if(pwd.length > 9){
				level = "3";
			}
			
			return level;
		},

		//jQuery 객체 형태로 문자열 반환
		getId: function(id) {
			return $("#" + id);
		},
		// value 반환
		getValue: function(id) {
			return this.getId(id).val();
		},
		// value의 앞뒤 공백 제거
		getTrimValue: function(value) {
			return $.trim(value);
		},
		// 입력받은  id로부터 취득한 객체 value의 앞뒤 공백 제거
		getTrimValueById: function(id) {
			var value = this.getValue(id);

			return this.getTrimValue(value);
		},
		isEqualsPw: function(id, id2) {
			var value1 = this.getTrimValueById(id);
			var value2 = this.getTrimValueById(id2);
			if(value1 == null || value1 == "" ) {
				return this.scriptMsg.password_empty;
				
			}
			if(value2 == null || value2 == "" ) {
				return this.scriptMsg.password_prohibit8;
			}
			if(value1 == value2) {
				return "OK";
			} else {
				return this.scriptMsg.password_prohibit9;
			}
		}
};