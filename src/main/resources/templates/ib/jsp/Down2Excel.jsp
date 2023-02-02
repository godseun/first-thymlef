﻿<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.io.*"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.ibleaders.ibsheet.IBSheetDown"%>
<%

    response.setContentType("application/octet-stream");
    response.setCharacterEncoding("UTF-8");
    response.setHeader("Content-Disposition", "");

    IBSheetDown down = null;

    try {
        
        out.clear();
        out = pageContext.pushBody();

        down = new IBSheetDown();

        //====================================================================================================
        // [ 사용자 환경 설정 #0 ]
        //====================================================================================================
        // Html 페이지의 인코딩이 UTF-8 로 구성되어 있으면 "down.setEncoding("UTF-8");" 로 설정하십시오.
        // LoadExcel.jsp 도 동일한 값으로 바꿔 주십시오.
        // setService 전에 설정해야 합니다.
        //====================================================================================================
        down.setEncoding("UTF-8");

        //====================================================================================================
        // [ 사용자 환경 설정 #1 ]
        //====================================================================================================
        // 엑셀 전문의 MarkupTag Delimiter 사용자 정의 시 설정하세요.
        // 설정 값은 IBSheet7 환경설정(ibsheet.cfg)의 MarkupTagDelimiter 설정 값과 동일해야 합니다.
        //====================================================================================================      
        //down.setMarkupTagDelimiter("[s1]","[s2]","[s3]","[s4]");
        
        //====================================================================================================
		// [ 사용자 환경 설정 #2 ]
		//====================================================================================================
		// 시트에 포함될 문자열 중 STX(\u0002), ETX(\u0003) 이 포함된 경우에만 설정해주세요.
		// 설정을 원하지 않는 경우 주석처리해주세요.
		// 0 : 시트 구분자로 STX, ETX 문자를 사용합니다. (기본값)
		// 1 : 시트 구분자로 변형된 문자열을 사용합니다. (시트에 설정이 되어 있어야 합니다.)
		//====================================================================================================
		//down.setDelimMode(1);
        
		//====================================================================================================
        // [ 사용자 환경 설정 #3 ]
        //====================================================================================================
        // HttpServletRequest, HttpServletResponse를 IBSheet 서버모듈에 등록합니다.
        //====================================================================================================
        down.setService(request, response);

        //====================================================================================================
        // [ 사용자 환경 설정 #4 ]
        //====================================================================================================
        // 다운로드 받을 문서의 타입을 설정하십시오.
        // xls   : xls 형식으로 다운로드
        // xlsx  : xlsx 형식으로 다운로드
        // excel : FileName에 설정한 값으로 다운로드, 확장자가 없는 경우 기본 xls 형식으로 다운로드
        //====================================================================================================
        down.setFileType("excel");

        //====================================================================================================
        // [ 사용자 환경 설정 #5 ]
        //====================================================================================================
        // 엑셀 문서에 사용될 폰트를 설정하십시오.
        // 헤더 폰트이름도 함께 설정 됩니다.
        //====================================================================================================
        //down.setFontName("맑은고딕");

        //====================================================================================================
        // [ 사용자 환경 설정 #6 ]
        //====================================================================================================
        // 엑셀 문서에 사용될 폰트크기를 설정하십시오.
        // 헤더 폰트크기도 함께 설정 됩니다. 
        //====================================================================================================
        //down.setFontSize(20);
        
        //====================================================================================================
        // [ 사용자 환경 설정 #7 ]
        //====================================================================================================
        // 엑셀 다운로드 시 헤더행의 배경색을 적용하고 싶은 경우에 설정하세요.
        // #3366FF 형태의 웹 컬러로 설정해주세요.
        // 설정을 원하지 않는 경우 주석처리해주세요. 
        //====================================================================================================
        down.setHeaderBackColor("#fff5cf");

        //====================================================================================================
        // [ 사용자 환경 설정 #8 ]
        //====================================================================================================
        // 엑셀 다운로드 시 헤더행의 폰트 Bold 스타일을 적용하고 싶은 경우에 설정하세요.
        // 설정을 원하지 않는 경우 주석처리해주세요.
        //====================================================================================================
        down.setHeaderFontBold(true);

        //====================================================================================================
        // [ 사용자 환경 설정 #9 ]
        //====================================================================================================
        // 엑셀 다운로드 시 헤더행의 글자색을 적용하고 싶은 경우에 설정하세요.
        // #3366FF 형태의 웹 컬러로 설정해주세요.
        // 설정을 원하지 않는 경우 주석처리해주세요.
        //====================================================================================================
        //down.setHeaderFontColor("#FF2233");

        //====================================================================================================
        // [ 사용자 환경 설정 #10 ]
        //====================================================================================================
        // 엑셀 다운로드 시 헤더행의 폰트를 적용하고 싶은 경우에 설정하세요.
        // 설정을 원하지 않는 경우 주석처리해주세요.
        //====================================================================================================
        //down.setHeaderFontName("궁서");

        //====================================================================================================
        // [ 사용자 환경 설정 #11 ]
        //====================================================================================================
        // 엑셀 다운로드 시 헤더행의 폰트 크기를 적용하고 싶은 경우에 설정하세요.
        // 설정을 원하지 않는 경우 주석처리해주세요.
        //====================================================================================================
        //down.setHeaderFontSize(20);

        //====================================================================================================
        // [ 사용자 환경 설정 #12 ]
        //====================================================================================================
        // 줄바꿈 설정을 다음에서 설정한 값으로 강제적으로 적용합니다.
        // 사용하지 않으시려면 주석처리 하세요.
        //====================================================================================================
        //down.setWordWrap(false);

        //====================================================================================================
        // [ 사용자 환경 설정 #13 ]
        //====================================================================================================
        // 엑셀 다운로드 시 서버에 위치한 디자인 파일을 사용하는 경우 디자인 파일이 있는 폴더 위치를 설정하세요.
        // 디자인 파일을 사용하지 않는 경우 주석처리하세요. 
        //====================================================================================================
        //down.setTempRoot("D:/SVN/src/IBSheet7.TestPage");
        
        //====================================================================================================
        // [ 사용자 환경 설정 #14 ]
        //====================================================================================================
        // 트리 컬럼에서 레벨별로 … 를 덧붙여서 레벨별로 보기 좋게 만듭니다.
        // 만약 … 대신 다른 문자를 사용하기를 원하시면 아래 유니코드 \u2026 (16진수형태) 대신 다른 문자를 입력하십시오.
        // 트리 컬럼이 없으면 설정하지 마세요.
        //====================================================================================================
        //down.setTreeChar("\u2026");

        //====================================================================================================
        // [ 사용자 환경 설정 #15 ]
        //====================================================================================================
        // 엑셀에 포함될 이미지의 URL 이 같은 도메인에 있지만 "/image/imgDown.jsp?idx=365" 등과 같은 
        // 이미지 로딩 방식을 사용한다면 웹서버 도메인을 설정하세요.
        //====================================================================================================
        //down.setWebServerDomain("http://www.ibleaders.co.kr");

        // 다운로드 1. 생성된 문서를 브라우저를 통해 다운로드
        down.downToBrowser();

        // 다운로드 2. 생성된 엑셀 문서를 서버에 저장
        /*
        String fileName = down.getFileName();

        down.saveToFile("d:/");

        // 생성된 엑셀 문서를 다운로드 처리(이 부분에서 엑셀문서를 DRM 처리함)
        File file = new File("d:/"  + fileName); 
        int fileLength = (int)file.length();

        response.setContentLength(fileLength);

        try {
            if (file.isFile()) {
                
                down.setFileHeader();
                
                FileInputStream fileIn = new FileInputStream(file);
                ServletOutputStream out3 = response.getOutputStream();
    
                byte[] outputByte = new byte[fileLength];
    
                while (fileIn.read(outputByte, 0, fileLength) != -1) {
                    out3.write(outputByte, 0, fileLength);
                }
    
                fileIn.close();
                out3.flush();;
                out3.close();
            } 
        } finally {
            file.delete();
        }*/

    } catch (Exception e) {
        response.setContentType("text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setHeader("Content-Disposition", "");

        out.println("<script>alert('엑셀 다운로드중 에러가 발생하였습니다.');</script>");
        
        //e.printStackTrace();
    } catch (Error e) {
        response.setContentType("text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setHeader("Content-Disposition", "");

        out.println("<script>alert('엑셀 다운로드중 에러가 발생하였습니다.');</script>");
        //e.printStackTrace();
    } finally {
        if (down != null) {
            try {
                down.close();
            } catch (Exception ex) {}
        }
        down = null;
    }
%>