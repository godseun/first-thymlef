//ibsheet 관련 공통함수

/*
 * 공통 저장 함수
 * paramlist (json object)
 * json 변수명 (유형) : 설명
 * sheet  (Array[sheetname1,sheetname2,....]) : 시트 이름 (여러개 인 경우 모두 넣을 것) 
 * subparam (String): 조회 조건
 */
function GetSaveString(param,opt){
    var qstring = "";
    //단일 시트에 대한 저장
    if(typeof(param.sheet)=="string"||param.sheet.length==1){
           var _sheet;
           
           if(typeof(param.sheet)=="string"){
                   _sheet = param.sheet;
           }else{
                   _sheet = param.sheet[0];
           }
         
           //해당 폼에서 조회조건 추출
           if(param.subparam){
                   qstring = param.subparam;     
           }
           //IBSheet 각 컬럼에 대한 SAVENAME 전달
           qstring +=  "&"+_sheet+"_SAVENAME="+IBS_ConcatSaveName(window[_sheet]);
           
           var saveStr = window[_sheet].GetSaveString(opt);
           if(saveStr=="KeyFieldError") return "KeyFieldError";
           return saveStr+qstring;
           
    }else{
           //여러개 시트 동시 저장
           //해당 폼내용 추출
           if(param.subparam){
        	   qstring = param.subparam;     
           }
           
           var sheetSaveString = "";
           //각시트의 수정된 내용과 각컬럼의 SaveName을 담는다.
           for(var i=0;i<param.sheet.length;i++){
                   var tempStr = "";
                   
                   tempStr =  window[param.sheet[i]].GetSaveString(opt);
                   
                   if(tempStr=="KeyFieldError") return "KeyFieldError";
                   
                   sheetSaveString += tempStr;
                   
                   if(qstring!=""){
                          qstring += "&"+tempStr;
                   }else{
                          qstring = tempStr;
                   }
                   //IBSheet 각 컬럼에 대한 SAVENAME 전달
                   qstring +=  "&"+param.sheet[i]+"_SAVENAME="+IBS_ConcatSaveName(window[param.sheet[i]]);
           }
           qstring += "&MULTISAVE=true";
           return qstring;
           
    }
}



/*
 * 공통 저장 함수
 * paramlist (json object)
 * json 변수명 (유형) : 설명
 * sheet  (Array[sheetname1,sheetname2,....]) : 시트 이름 (여러개 인 경우 모두 넣을 것) 
 * url (String): 조회 url
 * subparam (String): 조회 조건
 * sync (boolean) : sync 여부
 * quest (boolean) : 저장하시겠습니까? 컨펌 여부.
 * col (int or String) : 특정 컬럼 기준 저장
 * callback : 저장이후 호출할 function 객체
 */
function DataSave(param){
    var qstring = "";
    var opt = {}; //default 값
    //단일 시트에 대한 저장
    if(typeof(param.sheet)=="string"||param.sheet.length==1){
           var _sheet;
           
           if(typeof(param.sheet)=="string"){
                   _sheet = param.sheet;
           }else{
                   _sheet = param.sheet[0];
           }
           
           if(param.sync){
                   opt["Sync"] = param.sync;
           }
           
           if(param.quest){
                   opt["Quest"] = param.quest;
           }
			
			//OnSaveEnd 오버라이드
			if(typeof(param.callback)=="function"){
				
				try{
					var dummySaveEnd=null;
					//OnSaveEnd 를 dummySaveEnd 담는다.
					if(typeof(window[_sheet+"_OnSaveEnd"])!="undefined"){  
						
						dummySaveEnd = window[_sheet+"_OnSaveEnd"];
						
					}
					//OnSaveEnd 오버라이드
					window[_sheet+"_OnSaveEnd"] = function(Code, Msg, StCode, StMsg){
						if(dummySaveEnd){
							dummySaveEnd(Code, Msg, StCode, StMsg); //기존에 정의한 OnSaveEnd구문을 동작시킨다.
						}
						//OnSaveEnd()이벤트 호출 이후 callback에 정의한 내용을 구동시킨다.
						param.callback();
					} 
				}catch(e){
					alert("DataSave ERROR:\n"+e.message);
				}    
			}
           
           //해당 폼에서 조회조건 추출
           if(param.subparam){
                   qstring = param.subparam;     
           }
           //IBSheet 각 컬럼에 대한 SAVENAME 전달
           qstring +=  "&"+_sheet+"_SAVENAME="+IBS_ConcatSaveName(window[_sheet]);
           //시트 저장
           opt["Param"] = qstring;
           opt["Mode"] = 2;
           opt["Delim"]= "#";
          
           window[_sheet].DoSave(param.url,opt);
           
           
    }else{
           //여러개 시트 동시 저장
           //해당 폼내용 추출
           if(param.subparam){
                   qstring = param.subparam;     
           }
           
           var sheetSaveString = "";
           //각시트의 수정된 내용과 각컬럼의 SaveName을 담는다.
           for(var i=0;i<param.sheet.length;i++){
                   var tempStr = "";
                   
                   tempStr =  window[param.sheet[i]].GetSaveString({"Prefix":param.sheet[i]+"_","Mode":2,"Delim":"#"});
                   sheetSaveString += tempStr;
                   //오류 확인
                   if((tempStr==""||tempStr=="KeyFieldError")&&window[param.sheet[i]].IsDataModified()){
                          return;
                   }
                   if(qstring!=""){
                          qstring += "&"+tempStr;
                   }else{
                          qstring = tempStr;
                   }
                   //IBSheet 각 컬럼에 대한 SAVENAME 전달
                   qstring +=  "&"+param.sheet[i]+"_SAVENAME="+IBS_ConcatSaveName(window[param.sheet[i]]);
           }
           qstring += "&MULTISAVE=true";
           
           //수정한 내용이 없으면 저장을 중단한다.
           if(sheetSaveString==""){
                   //alert(window[param.sheet[0]].Lang.Text.SYS_EmptySaveContent);
                   //return;
           }
           //마지막 시트 객체 
           var _sheet = param.sheet[param.sheet.length-1];
           //OnSaveEnd 오버라이드
           if(typeof(param.callback)=="function"){
				
				try{
					var dummySaveEnd=null;
					//OnSaveEnd 를 dummySaveEnd 담는다.
					if(typeof(window[_sheet+"_OnSaveEnd"])!="undefined"){  
						
						dummySaveEnd = window[_sheet+"_OnSaveEnd"];
						
					}
					//OnSaveEnd 오버라이드
					window[_sheet+"_OnSaveEnd"] = function(Code, Msg, StCode, StMsg){
						if(dummySaveEnd){
							dummySaveEnd(Code, Msg, StCode, StMsg); //기존에 정의한 OnSaveEnd구문을 동작시킨다.
						}
						//OnSaveEnd()이벤트 호출 이후 callback에 정의한 내용을 구동시킨다.
						param.callback();
					} 
				}catch(e){
					alert("DataSave ERROR:\n"+e.message);
				}    
			}
           if(param.quest){
                   if(confirm(  window[param.sheet[0]].Lang.Text.SYS_SaveConfirm   )){
                          //맨 앞에 시트를 통해 ajax 통신
                          var jsonString = window[param.sheet[0]].GetSaveData(param.url,qstring);
                          
                          //저장 성공/실패 여부를 각 시트에 동일하게 반영한다.
                          for(var i=0;i<param.sheet.length;i++){
                                  window[param.sheet[i]].LoadSaveData( jsonString );   
                          }
                   }
           }else{
                   //맨 앞에 시트를 통해 ajax 통신
                   var jsonString = window[param.sheet[0]].GetSaveData(param.url,qstring);
                   
                   //저장 성공/실패 여부를 각 시트에 동일하게 반영한다.
                   for(var i=0;i<param.sheet.length;i++){
                          window[param.sheet[i]].LoadSaveData( jsonString );   
                   }
           }
           
           
    }
}
