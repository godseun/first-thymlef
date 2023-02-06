<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<%@ include file="/WEB-INF/views/common/layout/include/base.jsp" %>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.inicis.std.util.SignatureUtil"%>
<%@page import="java.util.*"%>
<c:set var="tid" value="${TID}" />
<%

	String fromTp 					    = "hidden";
	//############################################
	// 1.전문 필드 값 설정(***가맹점 개발수정***)
	//############################################

	// 여기에 설정된 값은 Form 필드에 동일한 값으로 설정
	String mid			  	= "selltoolkr";							            		// 가맹점 ID(가맹점 수정후 고정)					
	String signKey			= "VHE1Rk53bElPZUZObVhoMndsNEFhQT09";	// 가맹점에 제공된 웹 표준 사인키(가맹점 상점 관리자 페이지에서 발급 받은 후 고정)
	String timestamp		= SignatureUtil.getTimestamp();			    	// util에 의해서 자동생성

	String tid				= pageContext.getAttribute("tid")+"";	// 가맹점 주문번호(가맹점에서 직접 설정)		
	
	//###################################
	// 2. 가맹점 확인을 위한 signKey를 해시값으로 변경 (SHA-256방식 사용)
	//###################################
	String mKey = SignatureUtil.hash(signKey, "SHA-256");

	/* 
	DEV_LOC
	String site = "http://www.selltool.kr/";  //가맹점 도메인 입력
	*/
	String site = "http://211.208.7.136:8080/"; //가맹점 도메인 입력
	String siteDomain = site + "INIpayStd/"; //가맹점 도메인 입력

%>

	
	
	<style type="text/css">
		body { background-color: #efefef;}
		body, tr, td {font-size:9pt; font-family:굴림,verdana; color:#433F37; line-height:19px;}
		table, img {border:none}
	</style>
	
	<!-- 이니시스 표준결제 js  
	<script language="javascript" type="text/javascript" src="http://stgstdpay.inicis.com/stdjs/INIStdPay_escrow_conf.js" charset="UTF-8"></script>
	-->
	<script language="javascript" type="text/javascript" src="http://stdpay.inicis.com/stdjs/INIStdPay_escrow_conf.js" charset="UTF-8"></script>

	<div style="display:none;">
		<form id="SendPayForm_id" name="" method="POST" >
			<input type="<%=fromTp%>" style="width:100%;" name="version" value="1.0" > <!-- version  -->
			<input type="<%=fromTp%>" style="width:100%;" name="mid" value="<%=mid%>" > <!-- mid  -->
			<input type="<%=fromTp%>" style="width:100%;" name="tid" value="<%=tid%>" > <!-- tid  -->
			<input type="<%=fromTp%>" style="width:100%;" name="currency" value="WON" > <!-- currency  -->
			<input type="<%=fromTp%>" style="width:100%;" name="payViewType" value="" > <!-- payViewType  -->

			<input type="<%=fromTp%>" style="width:100%;" name="charset" value="UTF-8" > <!-- currency  -->
			<input type="<%=fromTp%>" style="width:100%;" name="timestamp" value="<%=timestamp%>" > <!-- timestamp  -->
			<input type="<%=fromTp%>" style="width:100%;" name="mKey" value="<%=mKey%>" > <!-- mKey  -->

												
			<input type="<%=fromTp%>" style="width:100%;" name="returnUrl" value="<%=site%>shop/order/endConf" > <!-- returnUrl  -->
			<input type="<%=fromTp%>" style="width:100%;" name="closeUrl" value="<%=siteDomain%>close.jsp" > <!-- closeUrl  -->
			<input type="<%=fromTp%>" style="width:100%;" name="popupUrl" value="<%=siteDomain%>popup.jsp" > <!-- popupUrl  -->


		</form>
	</div>
	<div class="all_bg"> </div>
	<script type="text/javascript">
		$(function(){   
			INIStdPay.pay('SendPayForm_id');
		});
	</script>

