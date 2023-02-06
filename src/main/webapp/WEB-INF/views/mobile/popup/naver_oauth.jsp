<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/layout/include/base.jsp" %>
<!doctype html>
<html lang="ko">
<head>
	<script type="text/javascript" src="${staticRoot}/sdk/js/naverLogin_implicit-1.0.3.js"></script> 
</head>
<body>
<script type="text/javascript">

<%--	
	DEV_LOC
	var naver_id_login = new naver_id_login("zP9eKhWKNAvSHJEtN9Pb", "${ctx}/shop/join/naver_oauth");
--%>	
	var naver_id_login = new naver_id_login("zP9eKhWKNAvSHJEtN9Pb", "<c:out value="${host}" />/shop/join/naver_oauth");
	// 접근 토큰 값 출력
	//alert(naver_id_login.oauthParams.access_token);
	// 네이버 사용자 프로필 조회
	naver_id_login.get_naver_userprofile("naverSignInCallback()");
	// 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
	function naverSignInCallback() {
		 var obj = {'email' 		: naver_id_login.getProfileData('email')
			 			,'id' 			: naver_id_login.getProfileData('id')
		  				,'enc_id' 		:  naver_id_login.getProfileData('enc_id')
		  				,'name' 		: naver_id_login.getProfileData('name')
						 };
		opener.parent.Naver_Auth(obj);
		fnClose();
	}
	function fnClose(){
		window.close();
	}
</script>
</body>
</html>
	